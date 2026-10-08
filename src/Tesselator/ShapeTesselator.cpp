// Copyright 2011 Fotios Sioutis (sfotis@gmail.com)
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

#include "ShapeTesselator.h"

#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <fstream>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <string>
#include <utility>

// std::to_chars for floating point numbers is not available with older macOS
// SDKs (requires macOS 13.3+): snprintf is used instead on Apple platforms
#if defined(__has_include)
#if __has_include(<version>)
#include <version>
#endif
#endif
#if defined(__cpp_lib_to_chars) && !defined(__APPLE__)
#define PYTHONOCC_USE_TO_CHARS
#include <charconv>
#endif

// OpenCASCADE includes
#include <TopExp_Explorer.hxx>
#include <Bnd_Box.hxx>
#include <BRepGProp_Face.hxx>
#include <BRepMesh_IncrementalMesh.hxx>
#include <OSD_Parallel.hxx>
#include <TopoDS.hxx>
#include <Poly_Triangulation.hxx>
#include <Poly_PolygonOnTriangulation.hxx>
#include <TColgp_Array1OfPnt.hxx>
#include <TopTools_ListOfShape.hxx>
#include <TopTools_IndexedDataMapOfShapeListOfShape.hxx>
#include <TopTools_IndexedMapOfShape.hxx>
#include <TopExp.hxx>
#include <BRepTools.hxx>
#include <BRepBndLib.hxx>
#include <BRep_Tool.hxx>
#include <TopoDS_Face.hxx>
#include <Precision.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_Overflow.hxx>
#include <BRepAdaptor_Surface.hxx>
#include <Poly_Polygon3D.hxx>
#include <gp_Trsf.hxx>
#include <TColStd_Array1OfInteger.hxx>

// ========================================================================
// Fast float-to-string helpers
// ========================================================================

namespace {
    //! Append a float to a string, formatted as printf "%g" does
    inline void appendFloat(std::string& out, float f) {
        char buf[32];
#ifdef PYTHONOCC_USE_TO_CHARS
        // same output as "%g", without the locale and format string overhead
        const auto result = std::to_chars(buf, buf + sizeof(buf), f, std::chars_format::general, 6);
        out.append(buf, static_cast<size_t>(result.ptr - buf));
#else
        int len = std::snprintf(buf, sizeof(buf), "%g", f);
        out.append(buf, static_cast<size_t>(len));
#endif
    }

    //! Append a float with epsilon clamping (for X3D export compatibility)
    inline void appendFloatWithEpsilon(std::string& out, float f) {
        constexpr float epsilon = 1e-3f;
        if (std::abs(f) < epsilon) {
            out.push_back('0');
        } else {
            appendFloat(out, f);
        }
    }

    // Triangle soups reference each node several times. Format each indexed
    // node once, then copy its text for every corner (no per-node allocation).
    void appendIndexedCoordinates(std::string& out, const std::vector<float>& values,
                                  const std::vector<Standard_Integer>& indices,
                                  char separator, bool clamp) {
        const auto append_node = [&](std::string& destination, size_t offset) {
            for (size_t c = 0; c < 3; ++c) {
                if (clamp) appendFloatWithEpsilon(destination, values[offset + c]);
                else appendFloat(destination, values[offset + c]);
                destination.push_back(separator);
            }
        };
        const size_t nodes = values.size() / 3;
        if (indices.size() > nodes * 2 && nodes > 128) {
            std::string formatted;
            formatted.reserve(nodes * 27);
            std::vector<size_t> offsets;
            offsets.reserve(nodes + 1);
            offsets.push_back(0);
            for (size_t node = 0; node < nodes; ++node) {
                append_node(formatted, node * 3);
                offsets.push_back(formatted.size());
            }
            for (const auto index : indices) {
                out.append(formatted.data() + offsets[index], offsets[index + 1] - offsets[index]);
            }
        } else {
            for (const auto index : indices) append_node(out, static_cast<size_t>(index) * 3);
        }
        if (separator == ',' && !indices.empty()) out.pop_back();
    }

}

// ========================================================================
// Edge structure implementation
// ========================================================================

Standard_Integer ShapeTesselator::Edge::size() const noexcept {
    return static_cast<Standard_Integer>(vertex_coords.size() / 3);
}

// ========================================================================
// ShapeTesselator implementation
// ========================================================================

ShapeTesselator::ShapeTesselator(const TopoDS_Shape& aShape)
    : computed(false), use_parallel(false), myShape(aShape) {
    ComputeDefaultDeviation();
}

void ShapeTesselator::Compute(bool compute_edges, float mesh_quality, bool parallel, bool reuse_mesh) {
    if (!computed) {
        Tessellate(compute_edges, mesh_quality, parallel, reuse_mesh);
        computed = true;
    }
}

void ShapeTesselator::SetDeviation(Standard_Real aDeviation) noexcept {
    myDeviation = aDeviation;
}

Standard_Real ShapeTesselator::GetDeviation() const noexcept {
    return myDeviation;
}

void ShapeTesselator::ComputeDefaultDeviation() {
    Bnd_Box aBox;
    BRepBndLib::Add(myShape, aBox);

    if (aBox.IsVoid()) {
        myDeviation = 0;
        return;
    }

    aBox.Get(aXmin, aYmin, aZmin, aXmax, aYmax, aZmax);

    const auto max_dimension = std::max({aXmax - aXmin, aYmax - aYmin, aZmax - aZmin});
    myDeviation = max_dimension * 2e-2;
}

void ShapeTesselator::Tessellate(bool compute_edges, float mesh_quality, bool parallel, bool reuse_mesh) {
    if (!(myDeviation > 0) || !std::isfinite(myDeviation)) {
        throw Standard_DomainError("The deviation must be greater than 0");
    }
    if (!(mesh_quality > 0) || !std::isfinite(mesh_quality)) {
        throw Standard_DomainError("The mesh quality must be greater than 0");
    }

    use_parallel = parallel;

    // Rebuilding remains the default, so coarser requests still coarsen.
    if (!reuse_mesh) {
        BRepTools::Clean(myShape);
    }
    BRepMesh_IncrementalMesh(myShape, myDeviation * mesh_quality, false, 0.5f * mesh_quality, parallel);

    // Collect faces for processing
    std::vector<TopoDS_Face> faces;
    for (TopExp_Explorer exp(myShape, TopAbs_FACE); exp.More(); exp.Next()) {
        faces.push_back(TopoDS::Face(exp.Current()));
    }
    ProcessFaces(faces);

    if (compute_edges) {
        ComputeEdges();
    }
}

void ShapeTesselator::ProcessFaces(const std::vector<TopoDS_Face>& faces) {
    // Size the final buffers before extraction. Temporary face buffers are
    // bounded by a batch, rather than another copy of the entire mesh.
    size_t nodes = 0, triangles = 0;
    std::vector<size_t> sizes;
    sizes.reserve(faces.size());
    for (const auto& face : faces) {
        TopLoc_Location location;
        const auto tri = BRep_Tool::Triangulation(face, location);
        const size_t n = tri.IsNull() ? 0 : tri->NbNodes();
        const size_t t = tri.IsNull() ? 0 : tri->NbTriangles();
        nodes += n;
        triangles += t;
        sizes.push_back(n * 6 * sizeof(float) + t * 3 * sizeof(Standard_Integer));
    }
    if (nodes > static_cast<size_t>(std::numeric_limits<Standard_Integer>::max()) ||
        triangles > static_cast<size_t>(std::numeric_limits<Standard_Integer>::max())) {
        throw Standard_Overflow("Tessellation exceeds the index range");
    }
    tot_triangle_count = tot_invalid_triangle_count = tot_vertex_count = 0;
    tot_normal_count = tot_invalid_normal_count = 0;
    consolidated_vertices.clear();
    consolidated_normals.clear();
    consolidated_triangle_indices.clear();
    // A single face can transfer ownership of its arrays without a copy.
    if (faces.size() > 1) {
        consolidated_vertices.reserve(nodes * 3);
        consolidated_normals.reserve(nodes * 3);
        consolidated_triangle_indices.reserve(triangles * 3);
    }

    constexpr size_t batch_bytes = 8 * 1024 * 1024;
    std::vector<Face> results;
    for (size_t begin = 0; begin < faces.size();) {
        size_t end = begin, bytes = 0;
        do {
            bytes += sizes[end++];
        } while (end < faces.size() && end - begin < 256 && bytes < batch_bytes);
        results.resize(end - begin);
        const auto process_face = [&](int slot) {
            Face& result = results[slot];
            result.vertex_coords.clear();
            result.normal_coords.clear();
            result.triangle_indices.clear();
            result.number_of_triangles = result.number_of_invalid_triangles = 0;
            result.number_of_normals = result.number_of_invalid_normals = 0;
            TopLoc_Location location;
            const auto& face = faces[begin + slot];
            const auto tri = BRep_Tool::Triangulation(face, location);
            if (!tri.IsNull() && tri->NbTriangles() > 0) {
                ProcessSingleFace(face, tri, location, result);
            }
        };
        OSD_Parallel::For(0, static_cast<int>(results.size()), process_face, !use_parallel);
        for (auto& result : results) {
            if (result.number_of_triangles > 0) {
                AppendFace(result);
            }
        }
        // Do not retain a previous batch's large faces alongside the next one.
        results.clear();
        begin = end;
    }
}

void ShapeTesselator::ProcessSingleFace(const TopoDS_Face& face,
                      const Handle(Poly_Triangulation)& triangulation,
                      const TopLoc_Location& location,
                      Face& face_data) {

    const auto nb_nodes = triangulation->NbNodes();
    // Process vertices - skip transform when location is identity
    face_data.vertex_coords.resize(static_cast<size_t>(nb_nodes) * 3);

    if (location.IsIdentity()) {
        for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
            const auto& point = triangulation->Node(i);
            const auto idx = (i - 1) * 3;
            face_data.vertex_coords[idx] = static_cast<float>(point.X());
            face_data.vertex_coords[idx + 1] = static_cast<float>(point.Y());
            face_data.vertex_coords[idx + 2] = static_cast<float>(point.Z());
        }
    } else {
        const auto& trsf = location.Transformation();
        for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
            auto point = triangulation->Node(i);
            point.Transform(trsf);
            const auto idx = (i - 1) * 3;
            face_data.vertex_coords[idx] = static_cast<float>(point.X());
            face_data.vertex_coords[idx + 1] = static_cast<float>(point.Y());
            face_data.vertex_coords[idx + 2] = static_cast<float>(point.Z());
        }
    }

    // Process normals
    const auto nb_null_normals = ProcessNormals(face, triangulation, face_data);

    // Process triangles
    ProcessTriangles(face, triangulation, face_data);

    if (nb_null_normals > 0) {
        FixNullNormals(face_data);
    }
}

Standard_Integer ShapeTesselator::ProcessNormals(const TopoDS_Face& face,
                   const Handle(Poly_Triangulation)& triangulation,
                   Face& face_data) {

    const auto nb_nodes = triangulation->NbNodes();
    // one normal per vertex, null if it can't be computed, so that the
    // normals and vertices arrays stay aligned
    face_data.normal_coords.resize(static_cast<size_t>(nb_nodes) * 3);
    face_data.number_of_normals = nb_nodes;

    const bool reverse_orientation = (face.Orientation() == TopAbs_INTERNAL);

    // The triangulation was just computed by BRepMesh, without normals: they
    // are computed from the surface, at the UV coordinates of the nodes.
    // BRepGProp_Face takes the face orientation into account.
    if (!triangulation->HasUVNodes()) {
        ++face_data.number_of_invalid_normals;
        return nb_nodes;
    }

    Standard_Integer nb_null_normals = 0;
    BRepGProp_Face prop(face);

    // Planar faces have a constant normal, even under a location. Evaluate
    // the same oriented surface normal once instead of once per mesh node.
    if (nb_nodes > 0 && BRepAdaptor_Surface(face).GetType() == GeomAbs_Plane) {
        const auto uv = triangulation->UVNode(1);
        gp_Pnt point;
        gp_Vec normal;
        prop.Normal(uv.X(), uv.Y(), point, normal);
        if (normal.SquareMagnitude() > Precision::SquareConfusion()) {
            normal.Normalize();
            if (reverse_orientation) normal.Reverse();
            for (size_t i = 0; i < face_data.normal_coords.size(); i += 3) {
                face_data.normal_coords[i] = static_cast<float>(normal.X());
                face_data.normal_coords[i + 1] = static_cast<float>(normal.Y());
                face_data.normal_coords[i + 2] = static_cast<float>(normal.Z());
            }
            return 0;
        }
    }

    for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
        const auto& uv_point = triangulation->UVNode(i);
        gp_Pnt point;
        gp_Vec normal;

        prop.Normal(uv_point.X(), uv_point.Y(), point, normal);

        if (normal.SquareMagnitude() > Precision::SquareConfusion()) {
            normal.Normalize();
            if (reverse_orientation) {
                normal.Reverse();
            }
        } else {
            // singular point of the surface (e.g. the pole of a sphere)
            normal.SetCoord(0., 0., 0.);
            ++nb_null_normals;
        }

        const auto idx = (i - 1) * 3;
        face_data.normal_coords[idx] = static_cast<float>(normal.X());
        face_data.normal_coords[idx + 1] = static_cast<float>(normal.Y());
        face_data.normal_coords[idx + 2] = static_cast<float>(normal.Z());
    }
    return nb_null_normals;
}

void ShapeTesselator::ProcessTriangles(const TopoDS_Face& face,
                     const Handle(Poly_Triangulation)& triangulation,
                     Face& face_data) {

    const auto nb_triangles = triangulation->NbTriangles();
    const auto is_reversed = (face.Orientation() == TopAbs_REVERSED);

    face_data.triangle_indices.resize(static_cast<size_t>(nb_triangles) * 3);
    face_data.number_of_triangles = nb_triangles;

    for (Standard_Integer i = 1; i <= nb_triangles; ++i) {
        Standard_Integer n1, n2, n3;
        triangulation->Triangle(i).Get(n1, n2, n3);

        if (is_reversed) {
            std::swap(n2, n3);
        }

        const auto base_idx = (i - 1) * 3;
        face_data.triangle_indices[base_idx] = n1;
        face_data.triangle_indices[base_idx + 1] = n2;
        face_data.triangle_indices[base_idx + 2] = n3;
    }
}

void ShapeTesselator::FixNullNormals(Face& face_data) {
    // The normal can't be computed from the surface at its singular points,
    // e.g. the apex of a cone or the pole of a sphere. Such a node is shared by
    // a fan of triangles, and no single normal is right for all of them (issue
    // #1470): the node is duplicated for each triangle, with the normal of the
    // triangle side of the surface, i.e. the average normal of the two other
    // vertices of the triangle, or the triangle normal if they are singular
    // too. The triangles winding already takes the face orientation into
    // account.
    auto& coords = face_data.vertex_coords;
    auto& normals = face_data.normal_coords;
    auto& indices = face_data.triangle_indices;
    const auto nb_nodes = coords.size() / 3;

    std::vector<Standard_Integer> null_index(nb_nodes, -1);
    std::vector<gp_XYZ> sums;
    for (size_t i = 0; i < nb_nodes; ++i) {
        if (normals[3 * i] == 0.0f && normals[3 * i + 1] == 0.0f && normals[3 * i + 2] == 0.0f) {
            null_index[i] = static_cast<Standard_Integer>(sums.size());
            sums.emplace_back(0., 0., 0.);
        }
    }
    const auto node_xyz = [&coords](size_t node) {
        return gp_XYZ(coords[3 * node], coords[3 * node + 1], coords[3 * node + 2]);
    };
    const auto normal_xyz = [&normals](size_t node) {
        return gp_XYZ(normals[3 * node], normals[3 * node + 1], normals[3 * node + 2]);
    };

    size_t copies = 0;
    for (const auto index : indices) {
        copies += null_index[index - 1] >= 0;
    }
    if (nb_nodes + copies > static_cast<size_t>(std::numeric_limits<Standard_Integer>::max())) {
        throw Standard_Overflow("Tessellation exceeds the index range");
    }
    coords.reserve((nb_nodes + copies) * 3);
    normals.reserve((nb_nodes + copies) * 3);

    for (size_t t = 0; t + 2 < indices.size(); t += 3) {
        // 1-based per-face indices
        const size_t n[3] = {static_cast<size_t>(indices[t] - 1),
                             static_cast<size_t>(indices[t + 1] - 1),
                             static_cast<size_t>(indices[t + 2] - 1)};
        if (null_index[n[0]] < 0 && null_index[n[1]] < 0 && null_index[n[2]] < 0) {
            continue;
        }
        const gp_XYZ triangle_normal =
            (node_xyz(n[1]) - node_xyz(n[0])).Crossed(node_xyz(n[2]) - node_xyz(n[0]));
        for (int c = 0; c < 3; ++c) {
            if (null_index[n[c]] < 0) {
                continue;
            }
            gp_XYZ normal(0., 0., 0.);
            for (int other = 0; other < 3; ++other) {
                if (other != c && null_index[n[other]] < 0) {
                    normal += normal_xyz(n[other]);
                }
            }
            if (normal.Modulus() <= Precision::Confusion()) {
                normal = triangle_normal;
            }
            const auto modulus = normal.Modulus();
            if (modulus <= Precision::Confusion()) {
                continue;  // degenerated triangle
            }
            normal /= modulus;
            // the vertex of this triangle corner, with its own normal
            const auto node = n[c];
            sums[null_index[node]] += normal;
            coords.insert(coords.end(), {coords[3 * node], coords[3 * node + 1], coords[3 * node + 2]});
            normals.insert(normals.end(), {static_cast<float>(normal.X()),
                                           static_cast<float>(normal.Y()),
                                           static_cast<float>(normal.Z())});
            indices[t + c] = static_cast<Standard_Integer>(coords.size() / 3);  // 1-based
        }
    }
    // the singular nodes are no longer used by the triangles: they get the
    // average normal of their copies, so that no normal is null
    for (size_t i = 0; i < nb_nodes; ++i) {
        if (null_index[i] < 0) continue;
        const auto& sum = sums[null_index[i]];
        const auto modulus = sum.Modulus();
        if (modulus > Precision::Confusion()) {
            const gp_XYZ normal = sum / modulus;
            normals[3 * i] = static_cast<float>(normal.X());
            normals[3 * i + 1] = static_cast<float>(normal.Y());
            normals[3 * i + 2] = static_cast<float>(normal.Z());
        }
    }
    face_data.number_of_normals = static_cast<Standard_Integer>(normals.size() / 3);
}

void ShapeTesselator::AppendFace(Face& face) {
    const size_t nodes = face.vertex_coords.size() / 3;
    if (nodes + static_cast<size_t>(tot_vertex_count) >
        static_cast<size_t>(std::numeric_limits<Standard_Integer>::max())) {
        throw Standard_Overflow("Tessellation exceeds the index range");
    }
    // Convert in place, then bulk append. The first/only face can be moved.
    for (auto& index : face.triangle_indices) {
        index = (index - 1) + tot_vertex_count;
    }
    const auto append = [](auto& destination, auto& source) {
        if (destination.capacity() == 0) {
            destination = std::move(source);
        } else {
            destination.insert(destination.end(), source.begin(), source.end());
        }
    };
    tot_triangle_count += face.number_of_triangles;
    tot_invalid_triangle_count += face.number_of_invalid_triangles;
    tot_vertex_count += static_cast<Standard_Integer>(nodes);
    tot_normal_count += static_cast<Standard_Integer>(face.normal_coords.size() / 3);
    tot_invalid_normal_count += face.number_of_invalid_normals;
    append(consolidated_vertices, face.vertex_coords);
    append(consolidated_normals, face.normal_coords);
    append(consolidated_triangle_indices, face.triangle_indices);
}

void ShapeTesselator::ComputeEdges() {
    edge_list.clear();

    TopTools_IndexedDataMapOfShapeListOfShape edge_face_map;
    TopExp::MapShapesAndAncestors(myShape, TopAbs_EDGE, TopAbs_FACE, edge_face_map);

    edge_list.reserve(edge_face_map.Extent());

    for (Standard_Integer i = 1; i <= edge_face_map.Extent(); ++i) {
        const auto& face_list_for_edge = edge_face_map.FindFromIndex(i);

        if (face_list_for_edge.IsEmpty()) {
            continue;  // Skip free edges
        }

        const auto& edge = TopoDS::Edge(edge_face_map.FindKey(i));
        Edge edge_data;

        if (ProcessSingleEdge(edge, edge_face_map, i, edge_data)) {
            edge_list.push_back(std::move(edge_data));
        }
    }
}

bool ShapeTesselator::ProcessSingleEdge(const TopoDS_Edge& edge,
                      const TopTools_IndexedDataMapOfShapeListOfShape& edge_face_map,
                      Standard_Integer edge_index,
                      Edge& edge_data) {

    TopLoc_Location location;
    gp_Trsf transform;

    // Try direct 3D triangulation first
    auto poly_3d = BRep_Tool::Polygon3D(edge, location);

    if (!poly_3d.IsNull()) {
        if (!location.IsIdentity()) {
            transform = location.Transformation();
        }

        const auto& nodes = poly_3d->Nodes();
        const auto nb_nodes = poly_3d->NbNodes();

        edge_data.vertex_coords.resize(nb_nodes * 3);

        for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
            auto vertex = nodes(i);
            vertex.Transform(transform);

            const auto idx = (i - 1) * 3;
            edge_data.vertex_coords[idx] = static_cast<float>(vertex.X());
            edge_data.vertex_coords[idx + 1] = static_cast<float>(vertex.Y());
            edge_data.vertex_coords[idx + 2] = static_cast<float>(vertex.Z());
        }
        return true;
    }

    // Fallback to face triangulation
    const auto& first_face = TopoDS::Face(edge_face_map.FindFromIndex(edge_index).First());
    auto face_triangulation = BRep_Tool::Triangulation(first_face, location);

    if (face_triangulation.IsNull()) {
        return false;
    }

    auto poly_on_tri = BRep_Tool::PolygonOnTriangulation(edge, face_triangulation, location);
    if (poly_on_tri.IsNull()) {
        return false;
    }

    if (!location.IsIdentity()) {
        transform = location.Transformation();
    }

    const auto& indices = poly_on_tri->Nodes();
    const auto nb_nodes = poly_on_tri->NbNodes();

    edge_data.vertex_coords.resize(nb_nodes * 3);

    for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
        auto vertex = face_triangulation->Node(indices(i));
        vertex.Transform(transform);

        const auto idx = (i - 1) * 3;
        edge_data.vertex_coords[idx] = static_cast<float>(vertex.X());
        edge_data.vertex_coords[idx + 1] = static_cast<float>(vertex.Y());
        edge_data.vertex_coords[idx + 2] = static_cast<float>(vertex.Z());
    }

    return true;
}

// ========================================================================
// Public interface implementation
// ========================================================================

void ShapeTesselator::EnsureMeshIsComputed() {
    if (!computed) {
        std::cout << "The mesh is not computed. Currently computing with default parameters..." << std::endl;
        Compute(true, 1.0f, false);
        std::cout << "done" << std::endl;
        std::cout << "Call explicitly the Compute method to set the parameters value." << std::endl;
    }
}

Standard_Integer ShapeTesselator::ObjGetTriangleCount() const noexcept {
    return tot_triangle_count;
}

Standard_Integer ShapeTesselator::ObjGetVertexCount() const noexcept {
    return tot_vertex_count;
}

Standard_Integer ShapeTesselator::ObjGetNormalCount() const noexcept {
    return tot_normal_count;
}

Standard_Integer ShapeTesselator::ObjGetInvalidTriangleCount() const noexcept {
    return tot_invalid_triangle_count;
}

Standard_Integer ShapeTesselator::ObjGetInvalidNormalCount() const noexcept {
    return tot_invalid_normal_count;
}

Standard_Integer ShapeTesselator::ObjGetEdgeCount() const noexcept {
    return static_cast<Standard_Integer>(edge_list.size());
}

Standard_Integer ShapeTesselator::ObjEdgeGetVertexCount(Standard_Integer iEdge) const {
    if (iEdge < 0 || iEdge >= static_cast<Standard_Integer>(edge_list.size())) {
        return 0;
    }
    return edge_list[iEdge].size();
}

const float* ShapeTesselator::VerticesList() const {
    return computed ? consolidated_vertices.data() : nullptr;
}

const float* ShapeTesselator::NormalsList() const {
    return computed ? consolidated_normals.data() : nullptr;
}

std::vector<float> ShapeTesselator::GetVerticesPositionAsTuple() const {
    if (!computed) return {};

    const auto total_floats = static_cast<size_t>(tot_triangle_count) * 9;  // 3 vertices * 3 coords
    std::vector<float> result(total_floats);

    float* out = result.data();
    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        const auto base_idx = i * 3;
        for (int j = 0; j < 3; ++j) {
            const auto vertex_idx = consolidated_triangle_indices[base_idx + j] * 3;
            std::memcpy(out, &consolidated_vertices[vertex_idx], 3 * sizeof(float));
            out += 3;
        }
    }

    return result;
}

std::vector<float> ShapeTesselator::GetNormalsAsTuple() const {
    if (!computed) return {};

    const auto total_floats = static_cast<size_t>(tot_triangle_count) * 9;
    std::vector<float> result(total_floats);

    float* out = result.data();
    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        const auto base_idx = i * 3;
        for (int j = 0; j < 3; ++j) {
            const auto normal_idx = consolidated_triangle_indices[base_idx + j] * 3;
            std::memcpy(out, &consolidated_normals[normal_idx], 3 * sizeof(float));
            out += 3;
        }
    }

    return result;
}

void ShapeTesselator::GetVertex(Standard_Integer index, float& x, float& y, float& z) const {
    if (!computed || index < 0 || index >= tot_vertex_count) {
        throw std::out_of_range("Vertex index out of range");
    }

    const auto base_idx = index * 3;
    x = consolidated_vertices[base_idx];
    y = consolidated_vertices[base_idx + 1];
    z = consolidated_vertices[base_idx + 2];
}

void ShapeTesselator::GetNormal(Standard_Integer index, float& x, float& y, float& z) const {
    if (!computed || index < 0 || index >= tot_normal_count) {
        throw std::out_of_range("Normal index out of range");
    }

    const auto base_idx = index * 3;
    x = consolidated_normals[base_idx];
    y = consolidated_normals[base_idx + 1];
    z = consolidated_normals[base_idx + 2];
}

void ShapeTesselator::GetTriangleIndex(Standard_Integer triangle_idx,
                     Standard_Integer& v1, Standard_Integer& v2, Standard_Integer& v3) const {
    if (!computed || triangle_idx < 0 || triangle_idx >= tot_triangle_count) {
        throw std::out_of_range("Triangle index out of range");
    }

    const auto base_idx = triangle_idx * 3;
    v1 = consolidated_triangle_indices[base_idx];
    v2 = consolidated_triangle_indices[base_idx + 1];
    v3 = consolidated_triangle_indices[base_idx + 2];
}

void ShapeTesselator::GetEdgeVertex(Standard_Integer iEdge, Standard_Integer ivert,
                  float& x, float& y, float& z) const {
    if (!computed || iEdge < 0 || iEdge >= static_cast<Standard_Integer>(edge_list.size())) {
        throw std::out_of_range("Edge index out of range");
    }

    const auto& edge = edge_list[iEdge];
    if (ivert < 0 || ivert >= edge.size()) {
        throw std::out_of_range("Edge vertex index out of range");
    }

    const auto base_idx = ivert * 3;
    x = edge.vertex_coords[base_idx];
    y = edge.vertex_coords[base_idx + 1];
    z = edge.vertex_coords[base_idx + 2];
}

void ShapeTesselator::ObjGetTriangle(Standard_Integer trianglenum, Standard_Integer* vertices, Standard_Integer* normals) const {
    if (!computed || trianglenum < 0 || trianglenum >= tot_triangle_count) {
        return;
    }

    const auto base_idx = trianglenum * 3;
    const auto pID = consolidated_triangle_indices[base_idx] * 3;
    const auto qID = consolidated_triangle_indices[base_idx + 1] * 3;
    const auto rID = consolidated_triangle_indices[base_idx + 2] * 3;

    vertices[0] = pID;
    vertices[1] = qID;
    vertices[2] = rID;

    normals[0] = pID;
    normals[1] = qID;
    normals[2] = rID;
}

// ========================================================================
// Export functionality
// ========================================================================

std::string ShapeTesselator::ExportShapeToThreejsJSONString(const char* shape_function_name) const {
    if (!computed) return "{}";

    // Pre-allocate: ~15 chars per float, 9 floats per triangle, x2 for verts+normals
    const size_t estimated_size = 512 + static_cast<size_t>(tot_triangle_count) * 9 * 15 * 2;

    std::string json;
    json.reserve(estimated_size);

    json.append("{\n\t\"metadata\": {\n\t\t\"version\": 4.4,\n\t\t\"type\": \"BufferGeometry\",\n"
                "\t\t\"generator\": \"pythonOCC-optimized\"\n\t},\n\t\"uuid\": \"");
    json.append(shape_function_name);
    json.append("\",\n\t\"type\": \"BufferGeometry\",\n\t\"data\": {\n\t\t\"attributes\": {\n"
                "\t\t\t\"position\": {\n\t\t\t\t\"itemSize\": 3,\n\t\t\t\t\"type\": \"Float32Array\",\n"
                "\t\t\t\t\"array\": [");

    appendIndexedCoordinates(json, consolidated_vertices, consolidated_triangle_indices, ',', false);

    json.append("]\n\t\t\t},\n\t\t\t\"normal\": {\n\t\t\t\t\"itemSize\": 3,\n"
                "\t\t\t\t\"type\": \"Float32Array\",\n\t\t\t\t\"array\": [");

    appendIndexedCoordinates(json, consolidated_normals, consolidated_triangle_indices, ',', false);

    json.append("]\n\t\t\t}\n\t\t}\n\t}\n}");

    return json;
}

std::string ShapeTesselator::ExportShapeToX3DTriangleSet() const {
    if (!computed) return "";

    std::string result;
    result.reserve(128 + static_cast<size_t>(tot_triangle_count) * 9 * 12 * 2);
    result.append("<TriangleSet solid='false'>\n<Coordinate point='");
    appendIndexedCoordinates(result, consolidated_vertices, consolidated_triangle_indices, ' ', true);
    result.append("'></Coordinate>\n<Normal vector='");
    appendIndexedCoordinates(result, consolidated_normals, consolidated_triangle_indices, ' ', true);
    result.append("'></Normal>\n</TriangleSet>\n");

    return result;
}

void ShapeTesselator::ExportShapeToX3D(const char* filename, int diffR, int diffG, int diffB) {
    EnsureMeshIsComputed();

    std::ofstream x3d_file(filename);
    if (!x3d_file.is_open()) {
        throw std::runtime_error("Cannot open file for writing");
    }

    // Write X3D header
    x3d_file << "<?xml version='1.0' encoding='UTF-8'?>";
    x3d_file << "<!DOCTYPE X3D PUBLIC 'ISO//Web3D//DTD X3D 3.1//EN' 'https://www.web3d.org/specifications/x3d-3.1.dtd'>";
    x3d_file << "<X3D>";
    x3d_file << "<Head>";
    x3d_file << "<meta name='generator' content='pythonOCC-optimized, https://github.com/tpaviot/pythonocc-core'/>";
    x3d_file << "</Head>";
    x3d_file << "<Scene><Transform scale='1 1 1'><Shape><Appearance><Material DEF='Shape_Mat' ";

    // Convert RGB to [0,1] range
    const auto r = static_cast<float>(diffR) / 255.0f;
    const auto g = static_cast<float>(diffG) / 255.0f;
    const auto b = static_cast<float>(diffB) / 255.0f;

    x3d_file << "diffuseColor='" << r << " " << g << " " << b << "' ";
    x3d_file << "specularColor='0.2 0.2 0.2'></Material></Appearance>";

    // Write tessellation
    x3d_file << ExportShapeToX3DTriangleSet();
    x3d_file << "</Shape></Transform></Scene></X3D>\n";
}
