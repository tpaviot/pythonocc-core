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

#ifndef TopologyTesselatorH
#define TopologyTesselatorH

#pragma once

#include <cstdint>
#include <vector>

#include <Standard_Real.hxx>
#include <TopoDS_Shape.hxx>

//! A mesh of a shape that keeps its topology: face i, edge i and vertex i of
//! the mesh are the sub-shapes of index i + 1 in TopExp::MapShapes order,
//! which is TopologyExplorer's order.
//!
//! ShapeTesselator joins the faces into one triangle soup and drops them.
//! TopologyTesselator keeps, for each face, the range of its triangles, and
//! for each edge, the range of its polyline nodes, so that a viewer finds
//! the face or the edge a triangle or a segment belongs to:
//!
//! - faces: indexed triangles, each face with its own nodes and normals, and
//!   a range (first triangle, triangle count) per face, in face index order.
//!   A face that does not triangulate has an empty range: indices never
//!   shift. Reversed faces, and faces under a mirroring location, have their
//!   winding swapped, so that front faces face out;
//! - edges: polylines, from the edge's 3D polygon, else its polygon on the
//!   triangulation of the first meshed face it bounds, else its curve
//!   discretized with the faces' deflection; a range (first node, node count)
//!   per edge, in edge index order. Free edges are there too, degenerated
//!   edges have no node;
//! - vertices: one point per vertex, in vertex index order.
class TopologyTesselator {
public:
    //! @param aShape The shape to mesh
    explicit TopologyTesselator(const TopoDS_Shape& aShape);

    TopologyTesselator(const TopologyTesselator&) = delete;
    TopologyTesselator& operator=(const TopologyTesselator&) = delete;

    //! Mesh the shape with BRepMesh_IncrementalMesh, with the parameters of
    //! ShapeTesselator: a linear deflection of the deviation times
    //! mesh_quality, an angular deflection of 0.5 times mesh_quality. The
    //! triangulation is stored on the shape, as BRepMesh does. A shape whose
    //! deviation is 0, an empty one, is not meshed.
    //! @param mesh_quality Scales the deflections (lower = finer), > 0
    //! @param parallel Whether to mesh and extract faces in parallel
    //! @param reuse_mesh Keep sufficiently fine OCCT triangulations instead of
    //! rebuilding. Existing finer triangulations will not be coarsened.
    void Compute(Standard_Real mesh_quality = 1.0, bool parallel = true, bool reuse_mesh = false);

    //! The deviation: by default 2% of the largest side of the shape's
    //! bounding box, as for ShapeTesselator
    void SetDeviation(Standard_Real aDeviation) noexcept;
    [[nodiscard]] Standard_Real GetDeviation() const noexcept;

    [[nodiscard]] int FaceCount() const noexcept;
    [[nodiscard]] int TriangleCount() const noexcept;
    [[nodiscard]] int NodeCount() const noexcept;
    [[nodiscard]] int EdgeCount() const noexcept;
    [[nodiscard]] int EdgeNodeCount() const noexcept;
    [[nodiscard]] int VertexCount() const noexcept;

    //! The arrays, flat; Compute() must have been called
    [[nodiscard]] const std::vector<float>& Positions() const noexcept;
    [[nodiscard]] const std::vector<float>& Normals() const noexcept;
    [[nodiscard]] const std::vector<std::uint32_t>& TriangleIndices() const noexcept;
    [[nodiscard]] const std::vector<std::uint32_t>& FaceRanges() const noexcept;
    [[nodiscard]] const std::vector<float>& EdgePositions() const noexcept;
    [[nodiscard]] const std::vector<std::uint32_t>& EdgeRanges() const noexcept;
    [[nodiscard]] const std::vector<float>& VertexPositions() const noexcept;

private:
    TopoDS_Shape myShape;
    Standard_Real myDeviation = 0.;

    std::vector<float> myPositions;               //!< x, y, z per node
    std::vector<float> myNormals;                 //!< nx, ny, nz per node
    std::vector<std::uint32_t> myTriangleIndices; //!< 3 node indices per triangle
    std::vector<std::uint32_t> myFaceRanges;      //!< first triangle, count per face
    std::vector<float> myEdgePositions;           //!< x, y, z per edge node
    std::vector<std::uint32_t> myEdgeRanges;      //!< first node, count per edge
    std::vector<float> myVertexPositions;         //!< x, y, z per vertex
};

#endif
