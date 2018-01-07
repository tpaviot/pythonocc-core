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
  float *vertex_coord;
  float *normal_coord;
  float *tex_coord;
  int   *tri_indexes;

  int   number_of_coords;
  int   number_of_normals;
  int   number_of_texcoords;
  int   number_of_triangles;
};
//---------------------------------------------------------------------------
struct aedge {
  float *vertex_coord;
  int   number_of_coords;
};
//---------------------------------------------------------------------------
enum theTextureMappingRule {atCube, atNormal, atNormalAutoScale};
//---------------------------------------------------------------------------
class Tesselator
{
  private:

  protected:
      float *locVertexcoord;
      float *locNormalcoord;
      float *locTexcoord;
      int   *loc_tri_indexes;
      int tot_vertex_count;
      int tot_normal_count;
      int tot_texcoord_count;
      int tot_triangle_count;
      std::vector<aface*> facelist;
      std::vector<aedge*> edgelist;
      Standard_Real myDeviation;
      Standard_Real myUOrigin;
      Standard_Real myVOrigin;
      Standard_Real myURepeat;
      Standard_Real myVRepeat;
      Standard_Real myScaleU;
      Standard_Real myScaleV;
      Standard_Real myAutoScaleSizeOnU;
      Standard_Real myAutoScaleSizeOnV;
      Standard_Real myRotationAngle;
      theTextureMappingRule myTxtMapType;
      TopoDS_Shape myShape;
      Standard_Real aXmin, aYmin ,aZmin ,aXmax ,aYmax ,aZmax;
      Standard_Real aBndBoxSz;

      Standard_Boolean TriangleIsValid(const gp_Pnt& P1, const gp_Pnt& P2, const gp_Pnt& P3) const;
      void PrepareBoxTextureCoordinates(const TopoDS_Shape& aShape);
      void GetBoxTextureCoordinate(const gp_Pnt& p, const gp_Dir& N1, gp_Vec2d& theCoord_p);
      void ComputeDefaultDeviation();
      void ComputeEdges();

  public:
      Tesselator(TopoDS_Shape aShape,
               theTextureMappingRule aTxtMapType,
               Standard_Real anAutoScaleSizeOnU,
               Standard_Real anAutoScaleSizeOnV,
               Standard_Real aDeviation,
               Standard_Real aUOrigin,
               Standard_Real aVOrigin,
               Standard_Real aURepeat,
               Standard_Real aVRepeat,
               Standard_Real aScaleU,
               Standard_Real aScaleV,
               Standard_Real aRotationAngle);
      Tesselator(TopoDS_Shape aShape);
      ~Tesselator();
      void Compute(bool uv_coords=true, bool compute_edges=false, float mesh_quality=1.0, bool parallel=false);
      void Tesselate(bool compute_edges, float mesh_quality, bool parallel);
      void TesselateWithUVCoords(bool compute_edges, float mesh_quality, bool parallel);
      void JoinPrimitives();
      void JoinPrimitivesWithUVCoords();
      void SetDeviation(Standard_Real aDeviation);
      void GetVertex(int ivert, float& x, float& y, float& z);
      void GetNormal(int inorm, float& x, float& y, float& z);
      void GetTriangleIndex(int triangleIdx, int& v1, int& v2, int& v3);
      void GetEdgeVertex(int iEdge, int ivert, float& x, float& y, float& z);
      float* VerticesList();
      float* NormalsList();
      float* TextureCoordinatesList();
      std::string ExportShapeToThreejsJSONString(char *shape_function_name, bool export_uv=false);
      std::string ExportShapeToX3DIndexedFaceSet();
      void ExportShapeToX3D(char *filename, int diffR=1, int diffG=0, int diffB=0);
      int ObjGetTriangleCount();
      int ObjGetVertexCount();
      int ObjGetNormalCount();
      int ObjGetTexCoordCount();
      int ObjGetEdgeCount();
      int ObjEdgeGetVertexCount(int iEdge);
      void ObjGetTriangle(int trianglenum, int *vertices, int *texcoords, int *normals);
      std::vector<float> GetVerticesPositionAsTuple();
      std::vector<float> GetNormalsAsTuple();
};
#endif
