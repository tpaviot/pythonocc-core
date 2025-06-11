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

#include <sstream>
#include <algorithm>
#include <cmath>
#include <iomanip>
#include <stdexcept>
#include <numeric>
#include <utility>
#include <fstream>
#include <iostream>

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
// Face structure implementation
// ========================================================================

void ShapeTesselator::Face::reserve(size_t vertices, size_t triangles) {
    vertex_coords.reserve(vertices * 3);
    normal_coords.reserve(vertices * 3);
    triangle_indices.reserve(triangles * 3);
}

// ========================================================================
// Edge structure implementation  
// ========================================================================

void ShapeTesselator::Edge::reserve(size_t vertices) {
    vertex_coords.reserve(vertices * 3);
}

Standard_Integer ShapeTesselator::Edge::size() const noexcept {
    return static_cast<Standard_Integer>(vertex_coords.size() / 3);
}

// ========================================================================
// ShapeTesselator implementation
// ========================================================================

ShapeTesselator::ShapeTesselator(const TopoDS_Shape& aShape)
    : computed(false), myShape(aShape) {
    ComputeDefaultDeviation();
    
    // Reserve memory for face and edge collections based on estimates
    face_list.reserve(100);  // Initial estimate
    edge_list.reserve(200);  // Initial estimate
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

    // Clean and tessellate the shape
    BRepTools::Clean(myShape);
    BRepMesh_IncrementalMesh(myShape, myDeviation * mesh_quality, false, 0.5f * mesh_quality, parallel);

    // Estimate number of faces for pre-allocation
    Standard_Integer face_count = 0;
    for (TopExp_Explorer exp(myShape, TopAbs_FACE); exp.More(); exp.Next()) {
        ++face_count;
    }
    face_list.reserve(face_count);

    ProcessFaces();
    JoinPrimitives();

    if (compute_edges) {
        ComputeEdges();
    }
}

void ShapeTesselator::ProcessFaces() {
    for (TopExp_Explorer exp_face(myShape, TopAbs_FACE); exp_face.More(); exp_face.Next()) {
        TopLoc_Location location;
        const auto& face = TopoDS::Face(exp_face.Current());
        auto triangulation = BRep_Tool::Triangulation(face, location);

        if (triangulation.IsNull()) {
            continue;
        }

        auto face_data = std::make_unique<Face>();
        ProcessSingleFace(face, triangulation, location, *face_data);
        
        if (face_data->number_of_triangles > 0) {
            face_list.push_back(std::move(face_data));
        }
    }
}

void ShapeTesselator::ProcessSingleFace(const TopoDS_Face& face, 
                      const Handle(Poly_Triangulation)& triangulation,
                      const TopLoc_Location& location,
                      Face& face_data) {
    
    const auto nb_nodes = triangulation->NbNodes();
    const auto nb_triangles = triangulation->NbTriangles();
    
    // Pre-allocate
    face_data.reserve(nb_nodes, nb_triangles);
    
    // Process vertices with transformation in single pass
    face_data.vertex_coords.resize(nb_nodes * 3);
    for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
        const auto point = triangulation->Node(i).Transformed(location).XYZ();
        const auto idx = (i - 1) * 3;
        face_data.vertex_coords[idx] = point.X();
        face_data.vertex_coords[idx + 1] = point.Y();
        face_data.vertex_coords[idx + 2] = point.Z();
    }

    // Process normals if available
    if (triangulation->HasUVNodes()) {
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
    BRepGProp_Face prop(face);
    
    face_data.normal_coords.resize(nb_nodes * 3);
    face_data.number_of_normals = nb_nodes;
    
    const bool reverse_orientation = (face.Orientation() == TopAbs_INTERNAL);
    
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
        face_data.normal_coords[idx] = normal.X();
        face_data.normal_coords[idx + 1] = normal.Y();
        face_data.normal_coords[idx + 2] = normal.Z();
    }
}

void ShapeTesselator::ProcessTriangles(const TopoDS_Face& face,
                     const Handle(Poly_Triangulation)& triangulation,
                     Face& face_data) {
    
    const auto nb_triangles = triangulation->NbTriangles();
    const auto is_reversed = (face.Orientation() == TopAbs_REVERSED);
    
    face_data.triangle_indices.reserve(nb_triangles * 3);
    
    for (Standard_Integer i = 1; i <= nb_triangles; ++i) {
        Standard_Integer n1, n2, n3;
        triangulation->Triangle(i).Get(n1, n2, n3);
        
        if (is_reversed) {
            std::swap(n2, n3);
        }
        
        face_data.triangle_indices.insert(face_data.triangle_indices.end(), {n1, n2, n3});
        ++face_data.number_of_triangles;
    }
}

void ShapeTesselator::JoinPrimitives() {
    // Calculate totals in single pass using std::accumulate
    auto totals = std::accumulate(face_list.begin(), face_list.end(),
        std::tuple<int, int, int, int, int>{},
        [](const auto& acc, const auto& face) {
            return std::make_tuple(
                std::get<0>(acc) + face->number_of_triangles,
                std::get<1>(acc) + face->number_of_invalid_triangles,
                std::get<2>(acc) + static_cast<int>(face->vertex_coords.size() / 3),
                std::get<3>(acc) + static_cast<int>(face->normal_coords.size() / 3),
                std::get<4>(acc) + face->number_of_invalid_normals
            );
        });

    std::tie(tot_triangle_count, tot_invalid_triangle_count, 
            tot_vertex_count, tot_normal_count, tot_invalid_normal_count) = totals;

    // Single allocation of consolidated arrays
    consolidated_vertices.reserve(tot_vertex_count * 3);
    consolidated_normals.reserve(tot_normal_count * 3);
    consolidated_triangle_indices.reserve(tot_triangle_count * 3);

    // Consolidation with move semantics
    Standard_Integer vertex_offset = 0;
    for (auto& face : face_list) {
        // Move vertex coordinates
        consolidated_vertices.insert(consolidated_vertices.end(),
            std::make_move_iterator(face->vertex_coords.begin()),
            std::make_move_iterator(face->vertex_coords.end()));

        // Move normals
        consolidated_normals.insert(consolidated_normals.end(),
            std::make_move_iterator(face->normal_coords.begin()),
            std::make_move_iterator(face->normal_coords.end()));

        // Adjust and insert triangle indices
        for (auto& index : face->triangle_indices) {
            consolidated_triangle_indices.push_back(index + vertex_offset - 1);
        }

        vertex_offset += static_cast<Standard_Integer>(face->vertex_coords.size() / 3);
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
        auto edge_data = std::make_unique<Edge>();
        
        if (ProcessSingleEdge(edge, edge_face_map, i, *edge_data)) {
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
        
        edge_data.reserve(nb_nodes);
        
        for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
            auto vertex = nodes(i);
            vertex.Transform(transform);
            
            edge_data.vertex_coords.insert(edge_data.vertex_coords.end(),
                {vertex.X(), vertex.Y(), vertex.Z()});
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
    
    edge_data.reserve(nb_nodes);
    
    for (Standard_Integer i = 1; i <= nb_nodes; ++i) {
        auto vertex = face_triangulation->Node(indices(i));
        vertex.Transform(transform);
        
        edge_data.vertex_coords.insert(edge_data.vertex_coords.end(),
            {vertex.X(), vertex.Y(), vertex.Z()});
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
    return edge_list[iEdge]->size();
}

const Standard_Real* ShapeTesselator::VerticesList() const {
    return computed ? consolidated_vertices.data() : nullptr;
}

const Standard_Real* ShapeTesselator::NormalsList() const {
    return computed ? consolidated_normals.data() : nullptr;
}

std::vector<float> ShapeTesselator::GetVerticesPositionAsTuple() const {
    if (!computed) return {};
    
    std::vector<float> result;
    result.reserve(tot_triangle_count * 9);  // 3 vertices * 3 coords
    
    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        const auto base_idx = i * 3;
        for (int j = 0; j < 3; ++j) {
            const auto vertex_idx = consolidated_triangle_indices[base_idx + j] * 3;
            result.insert(result.end(), {
                static_cast<float>(consolidated_vertices[vertex_idx]),
                static_cast<float>(consolidated_vertices[vertex_idx + 1]),
                static_cast<float>(consolidated_vertices[vertex_idx + 2])
            });
        }
    }
    
    return result;
}

std::vector<float> ShapeTesselator::GetNormalsAsTuple() const {
    if (!computed) return {};
    
    std::vector<float> result;
    result.reserve(tot_triangle_count * 9);
    
    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        const auto base_idx = i * 3;
        for (int j = 0; j < 3; ++j) {
            const auto normal_idx = consolidated_triangle_indices[base_idx + j] * 3;
            result.insert(result.end(), {
                static_cast<float>(consolidated_normals[normal_idx]),
                static_cast<float>(consolidated_normals[normal_idx + 1]),
                static_cast<float>(consolidated_normals[normal_idx + 2])
            });
        }
    }
    
    return result;
}

void ShapeTesselator::GetVertex(Standard_Integer index, float& x, float& y, float& z) const {
    if (!computed || index < 0 || index >= tot_vertex_count) {
        throw std::out_of_range("Vertex index out of range");
    }
    
    const auto base_idx = index * 3;
    x = static_cast<float>(consolidated_vertices[base_idx]);
    y = static_cast<float>(consolidated_vertices[base_idx + 1]);
    z = static_cast<float>(consolidated_vertices[base_idx + 2]);
}

void ShapeTesselator::GetNormal(Standard_Integer index, float& x, float& y, float& z) const {
    if (!computed || index < 0 || index >= tot_normal_count) {
        throw std::out_of_range("Normal index out of range");
    }
    
    const auto base_idx = index * 3;
    x = static_cast<float>(consolidated_normals[base_idx]);
    y = static_cast<float>(consolidated_normals[base_idx + 1]);
    z = static_cast<float>(consolidated_normals[base_idx + 2]);
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
    if (ivert < 0 || ivert >= edge->size()) {
        throw std::out_of_range("Edge vertex index out of range");
    }
    
    const auto base_idx = ivert * 3;
    x = static_cast<float>(edge->vertex_coords[base_idx]);
    y = static_cast<float>(edge->vertex_coords[base_idx + 1]);
    z = static_cast<float>(edge->vertex_coords[base_idx + 2]);
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

namespace {
    //! Format float number with epsilon handling
    std::string formatFloatNumber(float f) {
        const float epsilon = 1e-3f;
        std::ostringstream formatted_float;
        if (std::abs(f) < epsilon) {
            f = 0.0f;
        }
        formatted_float << f;
        return formatted_float.str();
    }
}

std::string ShapeTesselator::ExportShapeToThreejsJSONString(const char* shape_function_name) const {
    if (!computed) return "{}";
    
    std::ostringstream json;
    json << std::fixed << std::setprecision(6);
    
    json << "{\n"
         << "\t\"metadata\": {\n"
         << "\t\t\"version\": 4.4,\n"
         << "\t\t\"type\": \"BufferGeometry\",\n"
         << "\t\t\"generator\": \"pythonOCC-optimized\"\n"
         << "\t},\n"
         << "\t\"uuid\": \"" << shape_function_name << "\",\n"
         << "\t\"type\": \"BufferGeometry\",\n"
         << "\t\"data\": {\n"
         << "\t\t\"attributes\": {\n"
         << "\t\t\t\"position\": {\n"
         << "\t\t\t\t\"itemSize\": 3,\n"
         << "\t\t\t\t\"type\": \"Float32Array\",\n"
         << "\t\t\t\t\"array\": [";

    // Export vertices efficiently
    auto vertices = GetVerticesPositionAsTuple();
    for (size_t i = 0; i < vertices.size(); ++i) {
        if (i > 0) json << ",";
        json << vertices[i];
    }

    json << "]\n\t\t\t},\n"
         << "\t\t\t\"normal\": {\n"
         << "\t\t\t\t\"itemSize\": 3,\n"
         << "\t\t\t\t\"type\": \"Float32Array\",\n"
         << "\t\t\t\t\"array\": [";

    // Export normals efficiently
    auto normals = GetNormalsAsTuple();
    for (size_t i = 0; i < normals.size(); ++i) {
        if (i > 0) json << ",";
        json << normals[i];
    }

    json << "]\n\t\t\t}\n"
         << "\t\t}\n"
         << "\t}\n"
         << "}";

    return json.str();
}

std::string ShapeTesselator::ExportShapeToX3DTriangleSet() const {
    if (!computed) return "";
    
    std::ostringstream str_ifs, str_vertices, str_normals;
    std::vector<Standard_Integer> vertices_idx(3);
    std::vector<Standard_Integer> normals_idx(3);
    
    // Process triangles and build vertex/normal strings
    for (Standard_Integer i = 0; i < tot_triangle_count; ++i) {
        ObjGetTriangle(i, vertices_idx.data(), normals_idx.data());
        
        // Process vertices
        for (int j = 0; j < 3; ++j) {
            const auto idx = vertices_idx[j];
            str_vertices << formatFloatNumber(static_cast<float>(consolidated_vertices[idx])) << " ";
            str_vertices << formatFloatNumber(static_cast<float>(consolidated_vertices[idx + 1])) << " ";
            str_vertices << formatFloatNumber(static_cast<float>(consolidated_vertices[idx + 2])) << " ";
        }
        
        // Process normals
        for (int j = 0; j < 3; ++j) {
            const auto idx = normals_idx[j];
            str_normals << formatFloatNumber(static_cast<float>(consolidated_normals[idx])) << " ";
            str_normals << formatFloatNumber(static_cast<float>(consolidated_normals[idx + 1])) << " ";
            str_normals << formatFloatNumber(static_cast<float>(consolidated_normals[idx + 2])) << " ";
        }
    }
    
    str_ifs << "<TriangleSet solid='false'>\n";
    str_ifs << "<Coordinate point='" << str_vertices.str() << "'></Coordinate>\n";
    str_ifs << "<Normal vector='" << str_normals.str() << "'></Normal>\n";
    str_ifs << "</TriangleSet>\n";
    
    return str_ifs.str();
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
