// Copyright 2026 Thomas Paviot (tpaviot@gmail.com)
//
//This file is part of pythonOCC.
//
//pythonOCC is free software: you can redistribute it and/or modify
//it under the terms of the GNU Lesser General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//pythonOCC is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU Lesser General Public License for more details.
//
//You should have received a copy of the GNU Lesser General Public License
//along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

#include "TopologyTesselator.h"

#include <algorithm>
#include <cmath>

#include <BRepAdaptor_Curve.hxx>
#include <BRepBndLib.hxx>
#include <BRepLib_ToolTriangulatedShape.hxx>
#include <BRepMesh_IncrementalMesh.hxx>
#include <BRepTools.hxx>
#include <BRep_Tool.hxx>
#include <Bnd_Box.hxx>
#include <NCollection_Array1.hxx>
#include <NCollection_Vec3.hxx>
#include <GCPnts_QuasiUniformDeflection.hxx>
#include <Poly_Polygon3D.hxx>
#include <Poly_PolygonOnTriangulation.hxx>
#include <Poly_Triangulation.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_Overflow.hxx>
#include <TopAbs_Orientation.hxx>
#include <TopExp.hxx>
#include <TopLoc_Location.hxx>
#include <TopTools_IndexedDataMapOfShapeListOfShape.hxx>
#include <TopTools_IndexedMapOfShape.hxx>
#include <TopTools_ListOfShape.hxx>
#include <TopoDS.hxx>
#include <TopoDS_Edge.hxx>
#include <TopoDS_Face.hxx>
#include <TopoDS_Vertex.hxx>
#include <gp_Pnt.hxx>
#include <gp_Trsf.hxx>

namespace {

// The angular deflection at a mesh quality of 1, as for ShapeTesselator
constexpr Standard_Real ANGULAR_DEFLECTION = 0.5;
// The share of the largest side of the bounding box the default deviation is
constexpr Standard_Real DEFAULT_DEVIATION_RATIO = 2e-2;

// Where a location puts points and normals
struct Placement {
    bool identity = true;
    gp_Trsf trsf;
    // The linear part divided by the magnitude of the scale: gp_Trsf scales
    // uniformly, so that normals stay unit vectors
    Standard_Real rotation[3][3] = {{1., 0., 0.}, {0., 1., 0.}, {0., 0., 1.}};
    // A mirror turns triangles inside out
    bool mirrored = false;

    explicit Placement(const TopLoc_Location& location) {
        if (location.IsIdentity()) {
            return;
        }
        identity = false;
        trsf = location.Transformation();
        const Standard_Real scale = std::abs(trsf.ScaleFactor());
        for (int row = 0; row < 3; ++row) {
            for (int column = 0; column < 3; ++column) {
                rotation[row][column] = trsf.Value(row + 1, column + 1) / scale;
            }
        }
        mirrored = trsf.IsNegative();
    }

    // The point, placed: the linear part, then the translation
    void place(const gp_Pnt& point, Standard_Real out[3]) const {
        if (identity) {
            out[0] = point.X();
            out[1] = point.Y();
            out[2] = point.Z();
            return;
        }
        for (int row = 0; row < 3; ++row) {
            out[row] = point.X() * trsf.Value(row + 1, 1) + point.Y() * trsf.Value(row + 1, 2)
                       + point.Z() * trsf.Value(row + 1, 3) + trsf.Value(row + 1, 4);
        }
    }

    void rotate(const Standard_Real normal[3], Standard_Real out[3]) const {
        if (identity) {
            // As they are: the identity matrix would turn -0 into 0
            std::copy(normal, normal + 3, out);
            return;
        }
        for (int row = 0; row < 3; ++row) {
            // A sum from +0, as a matrix product makes it: products that are
            // all -0 give +0
            out[row] = 0. + normal[0] * rotation[row][0] + normal[1] * rotation[row][1]
                       + normal[2] * rotation[row][2];
        }
    }
};

void append_point(std::vector<float>& out, const Standard_Real point[3]) {
    out.push_back(static_cast<float>(point[0]));
    out.push_back(static_cast<float>(point[1]));
    out.push_back(static_cast<float>(point[2]));
}

// A meshed face's nodes, placed, and its triangulation and location, for
// the polygons of the edges on it
struct PlacedFace {
    std::vector<Standard_Real> nodes;  // x, y, z per node
    Handle(Poly_Triangulation) triangulation;
    TopLoc_Location location;
};

std::uint32_t to_index(size_t value) {
    if (value > UINT32_MAX) {
        throw Standard_Overflow("The mesh has more than 2^32 nodes or triangles");
    }
    return static_cast<std::uint32_t>(value);
}

}  // namespace

TopologyTesselator::TopologyTesselator(const TopoDS_Shape& aShape) : myShape(aShape) {
    Bnd_Box box;
    BRepBndLib::Add(myShape, box);
    if (box.IsVoid()) {
        return;
    }
    Standard_Real xmin, ymin, zmin, xmax, ymax, zmax;
    box.Get(xmin, ymin, zmin, xmax, ymax, zmax);
    myDeviation = std::max({xmax - xmin, ymax - ymin, zmax - zmin}) * DEFAULT_DEVIATION_RATIO;
}

void TopologyTesselator::SetDeviation(Standard_Real aDeviation) noexcept {
    myDeviation = aDeviation;
}

Standard_Real TopologyTesselator::GetDeviation() const noexcept {
    return myDeviation;
}

void TopologyTesselator::Compute(Standard_Real mesh_quality, bool parallel) {
    if (!(mesh_quality > 0)) {
        throw Standard_DomainError("The mesh quality must be greater than 0");
    }
    myPositions.clear();
    myNormals.clear();
    myTriangleIndices.clear();
    myFaceRanges.clear();
    myEdgePositions.clear();
    myEdgeRanges.clear();
    myVertexPositions.clear();

    const Standard_Real linear = myDeviation * mesh_quality;
    if (linear > 0) {
        BRepTools::Clean(myShape);
        BRepMesh_IncrementalMesh(myShape, linear, false, ANGULAR_DEFLECTION * mesh_quality, parallel);
    }

    // Faces
    TopTools_IndexedMapOfShape faces;
    TopExp::MapShapes(myShape, TopAbs_FACE, faces);
    std::vector<PlacedFace> placed(faces.Extent());
    myFaceRanges.reserve(2 * faces.Extent());
    size_t triangles_so_far = 0;
    for (int index = 1; index <= faces.Extent(); ++index) {
        const TopoDS_Face& face = TopoDS::Face(faces.FindKey(index));
        TopLoc_Location location;
        const Handle(Poly_Triangulation)& triangulation = BRep_Tool::Triangulation(face, location);
        if (triangulation.IsNull() || triangulation->NbTriangles() == 0) {
            myFaceRanges.push_back(to_index(triangles_so_far));
            myFaceRanges.push_back(0);
            continue;
        }
        if (!triangulation->HasNormals()) {
            BRepLib_ToolTriangulatedShape::ComputeNormals(face, triangulation);
        }
        const Placement placement(location);
        const bool reversed = face.Orientation() == TopAbs_REVERSED;
        const bool inside_out = placement.mirrored != reversed;
        const size_t first_node = myPositions.size() / 3;
        const int nb_nodes = triangulation->NbNodes();

        PlacedFace& placed_face = placed[index - 1];
        placed_face.nodes.resize(3 * static_cast<size_t>(nb_nodes));
        placed_face.triangulation = triangulation;
        placed_face.location = location;
        for (int node = 1; node <= nb_nodes; ++node) {
            Standard_Real* point = &placed_face.nodes[3 * static_cast<size_t>(node - 1)];
            placement.place(triangulation->Node(node), point);
            append_point(myPositions, point);

            // The stored float values, as they are: the gp_Dir overload
            // normalizes them again
            NCollection_Vec3<float> stored;
            triangulation->Normal(node, stored);
            const Standard_Real normal[3] = {stored.x(), stored.y(), stored.z()};
            Standard_Real placed_normal[3];
            placement.rotate(normal, placed_normal);
            if (reversed) {
                for (auto& coordinate : placed_normal) {
                    coordinate = -coordinate;
                }
            }
            append_point(myNormals, placed_normal);
        }

        const int nb_triangles = triangulation->NbTriangles();
        for (int triangle = 1; triangle <= nb_triangles; ++triangle) {
            Standard_Integer n1, n2, n3;
            triangulation->Triangle(triangle).Get(n1, n2, n3);
            if (inside_out) {
                std::swap(n2, n3);
            }
            for (const Standard_Integer node : {n1, n2, n3}) {
                myTriangleIndices.push_back(to_index(first_node + static_cast<size_t>(node - 1)));
            }
        }
        myFaceRanges.push_back(to_index(triangles_so_far));
        myFaceRanges.push_back(to_index(static_cast<size_t>(nb_triangles)));
        triangles_so_far += static_cast<size_t>(nb_triangles);
    }

    // Edges
    TopTools_IndexedMapOfShape edges;
    TopExp::MapShapes(myShape, TopAbs_EDGE, edges);
    TopTools_IndexedDataMapOfShapeListOfShape edge_faces;
    TopExp::MapShapesAndAncestors(myShape, TopAbs_EDGE, TopAbs_FACE, edge_faces);
    myEdgeRanges.reserve(2 * edges.Extent());
    for (int index = 1; index <= edges.Extent(); ++index) {
        const TopoDS_Edge& edge = TopoDS::Edge(edges.FindKey(index));
        const size_t first = myEdgePositions.size() / 3;
        Standard_Real point[3];
        if (!BRep_Tool::Degenerated(edge)) {
            TopLoc_Location location;
            const Handle(Poly_Polygon3D)& polygon = BRep_Tool::Polygon3D(edge, location);
            bool done = false;
            if (!polygon.IsNull()) {
                const Placement placement(location);
                const NCollection_Array1<gp_Pnt>& nodes = polygon->Nodes();
                for (int node = nodes.Lower(); node <= nodes.Upper(); ++node) {
                    placement.place(nodes(node), point);
                    append_point(myEdgePositions, point);
                }
                done = true;
            }
            if (!done && edge_faces.Contains(edge)) {
                for (const TopoDS_Shape& face : edge_faces.FindFromKey(edge)) {
                    const PlacedFace& placed_face = placed[faces.FindIndex(face) - 1];
                    if (placed_face.triangulation.IsNull()) {
                        continue;
                    }
                    const Handle(Poly_PolygonOnTriangulation)& on_triangulation =
                        BRep_Tool::PolygonOnTriangulation(edge, placed_face.triangulation,
                                                          placed_face.location);
                    if (on_triangulation.IsNull()) {
                        continue;
                    }
                    const NCollection_Array1<int>& nodes = on_triangulation->Nodes();
                    for (int node = nodes.Lower(); node <= nodes.Upper(); ++node) {
                        const Standard_Real* placed_point =
                            &placed_face.nodes[3 * static_cast<size_t>(nodes(node) - 1)];
                        append_point(myEdgePositions, placed_point);
                    }
                    done = true;
                    break;
                }
            }
            if (!done && linear > 0) {
                const BRepAdaptor_Curve curve(edge);
                GCPnts_QuasiUniformDeflection sampler(curve, linear);
                if (sampler.IsDone()) {
                    for (int node = 1; node <= sampler.NbPoints(); ++node) {
                        const gp_Pnt sample = sampler.Value(node);
                        point[0] = sample.X();
                        point[1] = sample.Y();
                        point[2] = sample.Z();
                        append_point(myEdgePositions, point);
                    }
                }
            }
        }
        myEdgeRanges.push_back(to_index(first));
        myEdgeRanges.push_back(to_index(myEdgePositions.size() / 3 - first));
    }

    // Vertices
    TopTools_IndexedMapOfShape vertices;
    TopExp::MapShapes(myShape, TopAbs_VERTEX, vertices);
    myVertexPositions.reserve(3 * vertices.Extent());
    for (int index = 1; index <= vertices.Extent(); ++index) {
        const gp_Pnt vertex = BRep_Tool::Pnt(TopoDS::Vertex(vertices.FindKey(index)));
        const Standard_Real coordinates[3] = {vertex.X(), vertex.Y(), vertex.Z()};
        append_point(myVertexPositions, coordinates);
    }
}

int TopologyTesselator::FaceCount() const noexcept {
    return static_cast<int>(myFaceRanges.size() / 2);
}

int TopologyTesselator::TriangleCount() const noexcept {
    return static_cast<int>(myTriangleIndices.size() / 3);
}

int TopologyTesselator::NodeCount() const noexcept {
    return static_cast<int>(myPositions.size() / 3);
}

int TopologyTesselator::EdgeCount() const noexcept {
    return static_cast<int>(myEdgeRanges.size() / 2);
}

int TopologyTesselator::EdgeNodeCount() const noexcept {
    return static_cast<int>(myEdgePositions.size() / 3);
}

int TopologyTesselator::VertexCount() const noexcept {
    return static_cast<int>(myVertexPositions.size() / 3);
}

const std::vector<float>& TopologyTesselator::Positions() const noexcept {
    return myPositions;
}

const std::vector<float>& TopologyTesselator::Normals() const noexcept {
    return myNormals;
}

const std::vector<std::uint32_t>& TopologyTesselator::TriangleIndices() const noexcept {
    return myTriangleIndices;
}

const std::vector<std::uint32_t>& TopologyTesselator::FaceRanges() const noexcept {
    return myFaceRanges;
}

const std::vector<float>& TopologyTesselator::EdgePositions() const noexcept {
    return myEdgePositions;
}

const std::vector<std::uint32_t>& TopologyTesselator::EdgeRanges() const noexcept {
    return myEdgeRanges;
}

const std::vector<float>& TopologyTesselator::VertexPositions() const noexcept {
    return myVertexPositions;
}
