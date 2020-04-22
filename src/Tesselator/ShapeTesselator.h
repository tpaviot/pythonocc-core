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

//---------------------------------------------------------------------------
#ifndef TesselatorH
#define TesselatorH
//---------------------------------------------------------------------------
#include <vector>
#include <string>
//---------------------------------------------------------------------------
#include <gp_Pnt.hxx>
#include <TopoDS_Shape.hxx>
#include <TCollection_AsciiString.hxx>
//---------------------------------------------------------------------------
struct aface {
  Standard_Real *vertex_coord;
  Standard_Real *normal_coord;
  Standard_Integer *tri_indexes;
  Standard_Integer number_of_coords;
  Standard_Integer number_of_normals;
  Standard_Integer number_of_invalid_normals;
  Standard_Integer number_of_triangles;
  Standard_Integer number_of_invalid_triangles;
};

struct aedge {
  Standard_Real *vertex_coord;
  Standard_Integer number_of_coords;
};

class ShapeTesselator
{
  protected:
      Standard_Boolean computed;
      Standard_Real *locVertexcoord;
      Standard_Real *locNormalcoord;
      Standard_Integer *locTriIndices;
      Standard_Integer tot_vertex_count=0;
      Standard_Integer tot_normal_count=0;
      Standard_Integer tot_invalid_normal_count=0;
      Standard_Integer tot_triangle_count=0;
      Standard_Integer tot_invalid_triangle_count=0;
      std::vector<aface*> facelist;
      std::vector<aedge*> edgelist;
      Standard_Real myDeviation;
      TopoDS_Shape myShape;
      Standard_Real aXmin, aYmin ,aZmin ,aXmax ,aYmax ,aZmax;
      Standard_Real aBndBoxSz;

      void ComputeDefaultDeviation();
      void ComputeEdges();
      void EnsureMeshIsComputed();

  public:
      ShapeTesselator(TopoDS_Shape aShape);
      ~ShapeTesselator();
      void Compute(bool compute_edges=false, float mesh_quality=1.0, bool parallel=false);
      void Tesselate(bool compute_edges, float mesh_quality, bool parallel);
      void JoinPrimitives();
      void SetDeviation(Standard_Real aDeviation);
      void GetVertex(int ivert, float& x, float& y, float& z);
      void GetNormal(int inorm, float& x, float& y, float& z);
      void GetTriangleIndex(int triangleIdx, int& v1, int& v2, int& v3);
      void GetEdgeVertex(int iEdge, int ivert, float& x, float& y, float& z);
      Standard_Real* VerticesList();
      Standard_Real* NormalsList();
      std::string ExportShapeToThreejsJSONString(char *shape_function_name);
      std::string ExportShapeToX3DTriangleSet();
      void ExportShapeToX3D(char *filename, int diffR=1, int diffG=0, int diffB=0);
      Standard_Integer ObjGetTriangleCount();
      Standard_Integer ObjGetInvalidTriangleCount();
      Standard_Integer ObjGetVertexCount();
      Standard_Integer ObjGetNormalCount();
      Standard_Integer ObjGetInvalidNormalCount();
      Standard_Integer ObjGetEdgeCount();
      Standard_Integer ObjEdgeGetVertexCount(int iEdge);
      void ObjGetTriangle(int trianglenum, int *vertices, int *normals);
      std::vector<float> GetVerticesPositionAsTuple();
      std::vector<float> GetNormalsAsTuple();
};
#endif
