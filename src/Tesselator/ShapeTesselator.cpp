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
#include <charconv>
#include <cmath>
#include <cstring>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <utility>

#ifdef _OPENMP
#include <omp.h>
#endif

// OpenCASCADE includes
#include <TopExp_Explorer.hxx>
#include <Bnd_Box.hxx>
#include <BRepGProp_Face.hxx>
#include <BRepMesh_IncrementalMesh.hxx>
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
#include <Poly_Polygon3D.hxx>
#include <gp_Trsf.hxx>
#include <TColStd_Array1OfInteger.hxx>

// ========================================================================
// Fast float-to-string helpers using C++17 std::to_chars
// ========================================================================

namespace {
    //! Append a float to a string using std::to_chars (no locale, no virtual dispatch)
    inline void appendFloat(std::string& out, float f) {
        char buf[32];
        auto [ptr, ec] = std::to_chars(buf, buf + sizeof(buf), f);
        out.append(buf, static_cast<size_t>(ptr - buf));
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

void ShapeTesselator::Compute(bool compute_edges, float mesh_quality, bool parallel) {
    if (!computed) {
        Tessellate(compute_edges, mesh_quality, parallel);
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

void ShapeTesselator::Tessellate(bool compute_edges, float mesh_quality, bool parallel) {
    if (myDeviation <= 0) {
        throw std::invalid_argument("The deviation must be greater than 0");
    }
    if (mesh_quality <= 0) {
        throw std::invalid_argument("The mesh quality must be greater than 0");
    }

    use_parallel = parallel;

    // Clean and tessellate the shape
    BRepTools::Clean(myShape);
    BRepMesh_IncrementalMesh(myShape, myDeviation * mesh_quality, false, 0.5f * mesh_quality, parallel);

    // Collect faces for processing
    std::vector<TopoDS_Face> faces;
    for (TopExp_Explorer exp(myShape, TopAbs_FACE); exp.More(); exp.Next()) {
        faces.push_back(TopoDS::Face(exp.Current()));
    }
    face_list.reserve(faces.size());

    ProcessFaces(faces);
    JoinPrimitives();

    if (compute_edges) {
        ComputeEdges();
    }
}

void ShapeTesselator::ProcessFaces(const std::vector<TopoDS_Face>& faces) {
    const auto num_faces = static_cast<Standard_Integer>(faces.size());

#ifdef _OPENMP
    if (use_parallel && num_faces > 1) {
        // Parallel processing: create face data in parallel, then collect results
        std::vector<Face> local_results(num_faces);

        #pragma omp parallel for schedule(dynamic)
        for (Standard_Integer i = 0; i < num_faces; ++i) {
            TopLoc_Location location;
            const auto& face = faces[i];
            auto triangulation = BRep_Tool::Triangulation(face, location);

            if (triangulation.IsNull()) {
                continue;
            }

            Face face_data;
            ProcessSingleFace(face, triangulation, location, face_data);

            if (face_data.number_of_triangles > 0) {
                local_results[i] = std::move(face_data);
            }
        }

        // Collect non-empty results
        for (auto& result : local_results) {
            if (result.number_of_triangles > 0) {
                face_list.push_back(std::move(result));
            }
        }
    } else
#endif
    {
        // Sequential processing
        for (const auto& face : faces) {
            TopLoc_Location location;
            auto triangulation = BRep_Tool::Triangulation(face, location);

            if (triangulation.IsNull()) {
                continue;
            }

            Face face_data;
            ProcessSingleFace(face, triangulation, location, face_data);

            if (face_data.number_of_triangles > 0) {
                face_list.push_back(std::move(face_data));
            }
        }
    }
}

void ShapeTesselator::ProcessSingleFace(const TopoDS_Face& face,
                      const Handle(Poly_Triangulation)& triangulation,
                      const TopLoc_Location& location,
                      Face& face_data) {

    const auto nb_nodes = triangulation->NbNodes();
    const auto nb_triangles = triangulation->NbTriangles();

    // Process vertices - skip transform when location is identity
    face_data.vertex_coords.resize(nb_nodes * 3);

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

    // Process normals - prefer pre-computed normals, fallback to UV computation
    if (triangulation->HasNormals() || triangulation->HasUVNodes()) {
        ProcessNormals(face, triangulation, face_data);
    } else {
        ++face_data.number_of_invalid_normals;
    }

    // Process triangles
    ProcessTriangles(face, triangulation, face_data);
}

void ShapeTesselator::ProcessNormals(const TopoDS_Face& face,
                   const Handle(Poly_Triangulation)& triangulation,
                   Face& face_data) {

    const auto nb_nodes = triangulation->NbNodes();
    face_data.normal_coords.resize(nb_nodes * 3);
    face_data.number_of_normals = nb_nodes;

    const bool reverse_orientation = (face.Orientation() == TopAbs_INTERNAL);

    // Use pre-computed normals from triangulation when available (OCC 7.6+)
    // This is much faster than recomputing via BRepGProp_Face::Normal()
    if (triangulation->HasNormals()) {
        for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
            auto normal = triangulation->Normal(i);

            if (reverse_orientation) {
                normal.Reverse();
            }

            const auto idx = (i - 1) * 3;
            face_data.normal_coords[idx] = static_cast<float>(normal.X());
            face_data.normal_coords[idx + 1] = static_cast<float>(normal.Y());
            face_data.normal_coords[idx + 2] = static_cast<float>(normal.Z());
        }
        return;
    }

    // Fallback: compute normals from UV coordinates (slower path)
    if (!triangulation->HasUVNodes()) {
        ++face_data.number_of_invalid_normals;
        return;
    }

    BRepGProp_Face prop(face);

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
            normal.SetCoord(0., 0., 0.);
        }

        const auto idx = (i - 1) * 3;
        face_data.normal_coords[idx] = static_cast<float>(normal.X());
        face_data.normal_coords[idx + 1] = static_cast<float>(normal.Y());
        face_data.normal_coords[idx + 2] = static_cast<float>(normal.Z());
    }
}

void ShapeTesselator::ProcessTriangles(const TopoDS_Face& face,
                     const Handle(Poly_Triangulation)& triangulation,
                     Face& face_data) {

    const auto nb_triangles = triangulation->NbTriangles();
    const auto is_reversed = (face.Orientation() == TopAbs_REVERSED);

    face_data.triangle_indices.resize(nb_triangles * 3);
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

void ShapeTesselator::JoinPrimitives() {
    // Calculate totals in a single pass
    tot_triangle_count = 0;
    tot_invalid_triangle_count = 0;
    tot_vertex_count = 0;
    tot_normal_count = 0;
    tot_invalid_normal_count = 0;

    for (const auto& face : face_list) {
        tot_triangle_count += face.number_of_triangles;
        tot_invalid_triangle_count += face.number_of_invalid_triangles;
        tot_vertex_count += static_cast<Standard_Integer>(face.vertex_coords.size() / 3);
        tot_normal_count += static_cast<Standard_Integer>(face.normal_coords.size() / 3);
        tot_invalid_normal_count += face.number_of_invalid_normals;
    }

    // Single allocation of consolidated arrays (resize, not reserve, for memcpy)
    consolidated_vertices.resize(tot_vertex_count * 3);
    consolidated_normals.resize(tot_normal_count * 3);
    consolidated_triangle_indices.resize(tot_triangle_count * 3);

    // Consolidate using memcpy for contiguous POD data
    size_t vertex_offset = 0;
    size_t normal_offset = 0;
    size_t tri_offset = 0;
    Standard_Integer index_offset = 0;

    for (auto& face : face_list) {
        // Bulk-copy vertex coordinates
        const auto vert_count = face.vertex_coords.size();
        if (vert_count > 0) {
            std::memcpy(consolidated_vertices.data() + vertex_offset,
                        face.vertex_coords.data(),
                        vert_count * sizeof(float));
        }

        // Bulk-copy normal coordinates
        const auto norm_count = face.normal_coords.size();
        if (norm_count > 0) {
            std::memcpy(consolidated_normals.data() + normal_offset,
                        face.normal_coords.data(),
                        norm_count * sizeof(float));
        }

        // Adjust triangle indices (1-based per-face → 0-based global)
        const auto tri_count = face.triangle_indices.size();
        for (size_t k = 0; k < tri_count; ++k) {
            consolidated_triangle_indices[tri_offset + k] =
                face.triangle_indices[k] + index_offset - 1;
        }

        vertex_offset += vert_count;
        normal_offset += norm_count;
        tri_offset += tri_count;
        index_offset += static_cast<Standard_Integer>(vert_count / 3);
    }

    // Release memory from individual faces
    face_list.clear();
    face_list.shrink_to_fit();
}

void ShapeTesselator::ComputeEdges() {
    edge_list.clear();

    TopTools_IndexedMapOfShape edge_map;
    TopExp::MapShapes(myShape, TopAbs_EDGE, edge_map);

    TopTools_IndexedDataMapOfShapeListOfShape edge_face_map;
    TopExp::MapShapesAndAncestors(myShape, TopAbs_EDGE, TopAbs_FACE, edge_face_map);

    edge_list.reserve(edge_map.Extent());

    for (Standard_Integer i = 1; i <= edge_face_map.Extent(); ++i) {
        const auto& face_list_for_edge = edge_face_map.FindFromIndex(i);

        if (face_list_for_edge.IsEmpty()) {
            continue;  // Skip free edges
        }

        const auto& edge = TopoDS::Edge(edge_map(i));
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

    const auto total_floats = tot_triangle_count * 9;  // 3 vertices * 3 coords
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

    const auto total_floats = tot_triangle_count * 9;
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

    // Export vertices using fast to_chars
    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        const auto base_idx = i * 3;
        for (int j = 0; j < 3; ++j) {
            if (i > 0 || j > 0) json.push_back(',');

            const auto vertex_idx = consolidated_triangle_indices[base_idx + j] * 3;
            appendFloat(json, consolidated_vertices[vertex_idx]);
            json.push_back(',');
            appendFloat(json, consolidated_vertices[vertex_idx + 1]);
            json.push_back(',');
            appendFloat(json, consolidated_vertices[vertex_idx + 2]);
        }
    }

    json.append("]\n\t\t\t},\n\t\t\t\"normal\": {\n\t\t\t\t\"itemSize\": 3,\n"
                "\t\t\t\t\"type\": \"Float32Array\",\n\t\t\t\t\"array\": [");

    // Export normals using fast to_chars
    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        const auto base_idx = i * 3;
        for (int j = 0; j < 3; ++j) {
            if (i > 0 || j > 0) json.push_back(',');

            const auto normal_idx = consolidated_triangle_indices[base_idx + j] * 3;
            appendFloat(json, consolidated_normals[normal_idx]);
            json.push_back(',');
            appendFloat(json, consolidated_normals[normal_idx + 1]);
            json.push_back(',');
            appendFloat(json, consolidated_normals[normal_idx + 2]);
        }
    }

    json.append("]\n\t\t\t}\n\t\t}\n\t}\n}");

    return json;
}

std::string ShapeTesselator::ExportShapeToX3DTriangleSet() const {
    if (!computed) return "";

    // Pre-allocate: ~12 chars per float, 9 floats per triangle, x2 for verts+normals
    const size_t estimated_floats = static_cast<size_t>(tot_triangle_count) * 9;
    const size_t estimated_per_string = estimated_floats * 12;

    std::string str_vertices, str_normals;
    str_vertices.reserve(estimated_per_string);
    str_normals.reserve(estimated_per_string);

    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        const auto base_idx = i * 3;

        for (int j = 0; j < 3; ++j) {
            const auto vertex_idx = consolidated_triangle_indices[base_idx + j] * 3;

            appendFloatWithEpsilon(str_vertices, consolidated_vertices[vertex_idx]);
            str_vertices.push_back(' ');
            appendFloatWithEpsilon(str_vertices, consolidated_vertices[vertex_idx + 1]);
            str_vertices.push_back(' ');
            appendFloatWithEpsilon(str_vertices, consolidated_vertices[vertex_idx + 2]);
            str_vertices.push_back(' ');

            appendFloatWithEpsilon(str_normals, consolidated_normals[vertex_idx]);
            str_normals.push_back(' ');
            appendFloatWithEpsilon(str_normals, consolidated_normals[vertex_idx + 1]);
            str_normals.push_back(' ');
            appendFloatWithEpsilon(str_normals, consolidated_normals[vertex_idx + 2]);
            str_normals.push_back(' ');
        }
    }

    std::string result;
    result.reserve(str_vertices.size() + str_normals.size() + 128);
    result.append("<TriangleSet solid='false'>\n<Coordinate point='");
    result.append(str_vertices);
    result.append("'></Coordinate>\n<Normal vector='");
    result.append(str_normals);
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
