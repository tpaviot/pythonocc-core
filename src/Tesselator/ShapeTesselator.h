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

#ifndef TesselatorH
#define TesselatorH

#pragma once

#include <vector>
#include <memory>
#include <string>
#include <tuple>

// OpenCASCADE includes
#include <Standard_Real.hxx>
#include <Standard_Integer.hxx>
#include <TopoDS_Shape.hxx>
#include <TopoDS_Face.hxx>
#include <TopoDS_Edge.hxx>
#include <TopLoc_Location.hxx>
#include <Poly_Triangulation.hxx>
#include <TopTools_IndexedDataMapOfShapeListOfShape.hxx>
#include <Poly_Triangulation.hxx>

class ShapeTesselator {
public:
    struct Face {
        std::vector<float> vertex_coords;     //!< Vertex coordinates (x,y,z)*n
        std::vector<float> normal_coords;     //!< Normal vectors (nx,ny,nz)*n
        std::vector<Standard_Integer> triangle_indices; //!< Triangle vertex indices
        Standard_Integer number_of_triangles = 0;     //!< Number of valid triangles
        Standard_Integer number_of_invalid_triangles = 0; //!< Number of invalid triangles
        Standard_Integer number_of_invalid_normals = 0;   //!< Number of invalid normals
        Standard_Integer number_of_normals = 0;       //!< Number of normal vectors
        
        //! Reserve memory to avoid reallocations
        //! @param vertices Expected number of vertices
        //! @param triangles Expected number of triangles
        void reserve(size_t vertices, size_t triangles);
    };
    
    struct Edge {
        std::vector<float> vertex_coords; //!< Edge vertex coordinates
        
        //! Reserve memory for vertices
        //! @param vertices Expected number of vertices
        void reserve(size_t vertices);
        
        //! Get number of vertices in this edge
        //! @return Number of vertices
        Standard_Integer size() const noexcept;
    };

private:
    // Internal state
    bool computed;                    //!< Whether tessellation has been computed
    TopoDS_Shape myShape;            //!< The shape to tessellate
    Standard_Real myDeviation;       //!< Tessellation deviation parameter
    
    // Face and edge collections using smart pointers
    std::vector<std::unique_ptr<Face>> face_list;  //!< Collection of tessellated faces
    std::vector<std::unique_ptr<Edge>> edge_list;  //!< Collection of tessellated edges
    
    // Consolidated mesh data for efficient access
    std::vector<float> consolidated_vertices;        //!< All vertex coordinates
    std::vector<float> consolidated_normals;         //!< All normal vectors
    std::vector<Standard_Integer> consolidated_triangle_indices; //!< All triangle indices
    
    // Statistics counters
    Standard_Integer tot_triangle_count = 0;         //!< Total number of triangles
    Standard_Integer tot_invalid_triangle_count = 0; //!< Total invalid triangles
    Standard_Integer tot_vertex_count = 0;           //!< Total number of vertices
    Standard_Integer tot_normal_count = 0;           //!< Total number of normals
    Standard_Integer tot_invalid_normal_count = 0;   //!< Total invalid normals
    
    // Shape bounding box
    Standard_Real aXmin=0., aYmin=0., aZmin=0., aXmax=0., aYmax=0., aZmax=0.;

public:
    //! Constructor
    //! @param aShape The OpenCASCADE shape to tessellate
    explicit ShapeTesselator(const TopoDS_Shape& aShape);
    
    //! Destructor - automatic cleanup thanks to RAII
    ~ShapeTesselator() = default;
    
    //! Disable copy operations to prevent expensive copies
    ShapeTesselator(const ShapeTesselator&) = delete;
    ShapeTesselator& operator=(const ShapeTesselator&) = delete;
    
    //! Enable move operations for efficient transfers
    ShapeTesselator(ShapeTesselator&&) = default;
    ShapeTesselator& operator=(ShapeTesselator&&) = default;

    //! Compute the tessellation
    //! @param compute_edges Whether to compute edge tessellation
    //! @param mesh_quality Mesh quality factor (higher = finer mesh)
    //! @param parallel Whether to use parallel computation
    void Compute(bool compute_edges = true, float mesh_quality = 1.0f, bool parallel = false);

    //! Set the deviation parameter for tessellation
    //! @param aDeviation The deviation value (must be > 0)
    void SetDeviation(Standard_Real aDeviation) noexcept;

    //! Get the current deviation parameter
    //! @return The deviation value
    Standard_Real GetDeviation() const noexcept;

    //! Ensure that mesh computation has been performed
    void EnsureMeshIsComputed();

    // Mesh statistics getters
    Standard_Integer ObjGetTriangleCount() const noexcept;      //!< Get total triangle count
    Standard_Integer ObjGetVertexCount() const noexcept;       //!< Get total vertex count  
    Standard_Integer ObjGetNormalCount() const noexcept;       //!< Get total normal count
    Standard_Integer ObjGetInvalidTriangleCount() const noexcept; //!< Get invalid triangle count
    Standard_Integer ObjGetInvalidNormalCount() const noexcept;   //!< Get invalid normal count
    Standard_Integer ObjGetEdgeCount() const noexcept;           //!< Get edge count

    //! Get number of vertices in a specific edge
    //! @param iEdge Edge index
    //! @return Number of vertices in the edge
    Standard_Integer ObjEdgeGetVertexCount(Standard_Integer iEdge) const;

    // Direct data access
    const float* VerticesList() const;  //!< Get pointer to vertex data
    const float* NormalsList() const;   //!< Get pointer to normal data

    //! Get vertices as a flat array suitable for rendering
    //! @return Vector of vertex positions for all triangles
    std::vector<float> GetVerticesPositionAsTuple() const;

    //! Get normals as a flat array suitable for rendering  
    //! @return Vector of normal vectors for all triangles
    std::vector<float> GetNormalsAsTuple() const;

    //! Get vertex coordinates by index
    //! @param index Vertex index
    //! @param x,y,z Output coordinates
    void GetVertex(Standard_Integer index, float& x, float& y, float& z) const;

    //! Get normal vector by index
    //! @param index Normal index  
    //! @param x,y,z Output normal components
    void GetNormal(Standard_Integer index, float& x, float& y, float& z) const;

    //! Get triangle vertex indices
    //! @param triangle_idx Triangle index
    //! @param v1,v2,v3 Output vertex indices
    void GetTriangleIndex(Standard_Integer triangle_idx, 
                         Standard_Integer& v1, Standard_Integer& v2, Standard_Integer& v3) const;

    //! Get edge vertex coordinates
    //! @param iEdge Edge index
    //! @param ivert Vertex index within edge
    //! @param x,y,z Output coordinates
    void GetEdgeVertex(Standard_Integer iEdge, Standard_Integer ivert, 
                      float& x, float& y, float& z) const;

    //! Export shape as Three.js JSON BufferGeometry
    //! @param shape_function_name Name/UUID for the geometry
    //! @return JSON string representation
    std::string ExportShapeToThreejsJSONString(const char* shape_function_name) const;

    //! Export shape as X3D TriangleSet
    //! @return X3D string representation
    std::string ExportShapeToX3DTriangleSet() const;

    //! Export complete X3D file
    //! @param filename Output filename
    //! @param diffR,diffG,diffB Diffuse color components (0-255)
    void ExportShapeToX3D(const char* filename, int diffR = 165, int diffG = 165, int diffB = 178);

private:
    //! Compute default deviation based on shape bounding box
    void ComputeDefaultDeviation();

    //! Perform the actual tessellation
    //! @param compute_edges Whether to compute edges
    //! @param mesh_quality Quality factor
    //! @param parallel Use parallel computation
    void Tessellate(bool compute_edges, float mesh_quality, bool parallel);

    //! Process all faces in the shape
    void ProcessFaces();

    //! Process a single face
    //! @param face The face to process
    //! @param triangulation Face triangulation data
    //! @param location Transformation location
    //! @param face_data Output face data
    void ProcessSingleFace(const TopoDS_Face& face, 
                          const Handle(Poly_Triangulation)& triangulation,
                          const TopLoc_Location& location,
                          Face& face_data);

    //! Process normals for a face
    //! @param face The face
    //! @param triangulation Triangulation data  
    //! @param face_data Face data to update
    void ProcessNormals(const TopoDS_Face& face,
                       const Handle(Poly_Triangulation)& triangulation,
                       Face& face_data);

    //! Process triangles for a face
    //! @param face The face
    //! @param triangulation Triangulation data
    //! @param face_data Face data to update  
    void ProcessTriangles(const TopoDS_Face& face,
                         const Handle(Poly_Triangulation)& triangulation,
                         Face& face_data);

    //! Join all face primitives into consolidated arrays
    void JoinPrimitives();

    //! Compute edge tessellation
    void ComputeEdges();

    //! Process a single edge
    //! @param edge The edge to process
    //! @param edge_face_map Map of edges to faces
    //! @param edge_index Index of the edge
    //! @param edge_data Output edge data
    //! @return True if successful
    bool ProcessSingleEdge(const TopoDS_Edge& edge,
                          const TopTools_IndexedDataMapOfShapeListOfShape& edge_face_map,
                          Standard_Integer edge_index,
                          Edge& edge_data);

    //! Get triangle data for OBJ export format
    //! @param trianglenum Triangle index
    //! @param vertices Output vertex indices
    //! @param normals Output normal indices
    void ObjGetTriangle(Standard_Integer trianglenum, Standard_Integer* vertices, Standard_Integer* normals) const;
};

#endif
