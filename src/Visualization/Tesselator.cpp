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
#include "Tesselator.h"
#include <sstream>
#include <algorithm>
#include <cmath>
//---------------------------------------------------------------------------
#include <TopExp_Explorer.hxx>
#include <Bnd_Box.hxx>
#include <StdPrs_ToolShadedShape.hxx>
#include <BRepMesh_IncrementalMesh.hxx>
#include <TopoDS.hxx>
#include <Poly_Connect.hxx>
#include <Poly_Triangulation.hxx>
#include <Poly_PolygonOnTriangulation.hxx>
#include <TColgp_Array1OfPnt.hxx>
#include <TColgp_Array1OfDir.hxx>
#include <TColgp_Array1OfPnt2d.hxx>
#include <TopTools_ListOfShape.hxx>
#include <TopTools_IndexedDataMapOfShapeListOfShape.hxx>
#include <TopExp.hxx>
#include <BRepTools.hxx>
#include <BRepBndLib.hxx>
//---------------------------------------------------------------------------
Tesselator::Tesselator(TopoDS_Shape   aShape,
                       theTextureMappingRule            aTxtMapType,
                       Standard_Real                    anAutoScaleSizeOnU,
                       Standard_Real                    anAutoScaleSizeOnV,
                       Standard_Real                    aDeviation,
                       Standard_Real                    aUOrigin,
                       Standard_Real                    aVOrigin,
                       Standard_Real                    aURepeat,
                       Standard_Real                    aVRepeat,
                       Standard_Real                    aScaleU,
                       Standard_Real                    aScaleV,
                       Standard_Real                    aRotationAngle) :
  //set local variables
  myDeviation(aDeviation),
  myUOrigin(aUOrigin),
  myVOrigin(aVOrigin),
  myURepeat(aURepeat),
  myVRepeat(aVRepeat),
  myScaleU(aScaleU),
  myScaleV(aScaleV),
  myAutoScaleSizeOnU(anAutoScaleSizeOnU),
  myAutoScaleSizeOnV(anAutoScaleSizeOnV),
  myTxtMapType(aTxtMapType),
  myShape(aShape),
  myRotationAngle(aRotationAngle)
{
  //prepare bbox tex coords
  if (myTxtMapType == atCube) {
    //create a compound for bbox
    //prepare bbox tex coords
    PrepareBoxTextureCoordinates(myShape);
  }
    locVertexcoord = NULL;
    locNormalcoord = NULL;
    locTexcoord    = NULL;
    ComputeDefaultDeviation();
}

Tesselator::Tesselator(TopoDS_Shape   aShape) :
  //set local variables
  myDeviation(1.0),
  myUOrigin(0.),
  myVOrigin(0.),
  myURepeat(1.),
  myVRepeat(1.),
  myScaleU(1.),
  myScaleV(1.),
  myAutoScaleSizeOnU(1.),
  myAutoScaleSizeOnV(1.),
  myTxtMapType(atNormal),
  myShape(aShape),
  myRotationAngle(0.)
{
    locVertexcoord = NULL;
    locNormalcoord = NULL;
    locTexcoord    = NULL;
    ComputeDefaultDeviation();
}

void Tesselator::Compute(bool uv_coords, bool compute_edges, float mesh_quality)
{
  if (uv_coords) {
    TesselateWithUVCoords(compute_edges, mesh_quality);
  }
  else {
    Tesselate(compute_edges, mesh_quality);
  }
}

//---------------------------------------------------------------------------
Tesselator::~Tesselator()
{
    if (locVertexcoord)
      delete [] locVertexcoord;

    if (locNormalcoord)
      delete [] locNormalcoord;

    if (locTexcoord)
      delete [] locTexcoord;

    for (std::vector<aedge*>::iterator edgeit = edgelist.begin(); edgeit != edgelist.end(); ++edgeit) {
      aedge* edge = *edgeit;
      if (edge) {
        if (edge->vertex_coord)
          delete[] edge->vertex_coord;

        delete edge;
        *edgeit = NULL;
      }
    }
    edgelist.clear();
}

//---------------------------------------------------------------------------
void Tesselator::SetDeviation(Standard_Real aDeviation)
{
    myDeviation = aDeviation;   
}


//---------------------------------------------------------------------------
void Tesselator::Tesselate(bool compute_edges, float mesh_quality)
{
    TopExp_Explorer       ExpFace;
    StdPrs_ToolShadedShape   SST;

    gp_Dir d;
    gp_Pnt p;

    gp_Vec2d theCoord_p;
    gp_Pnt2d d_coord;

    //Triangulate
    BRepMesh_IncrementalMesh(myShape, myDeviation*mesh_quality, false, 0.5*mesh_quality, false);


    for (ExpFace.Init(myShape, TopAbs_FACE); ExpFace.More(); ExpFace.Next()) {
      const TopoDS_Face&    myFace    = TopoDS::Face(ExpFace.Current());
      TopLoc_Location aLocation;

      Handle(Poly_Triangulation) myT = BRep_Tool::Triangulation(myFace, aLocation);

      if (!myT.IsNull()) {
        Poly_Connect pc(myT);

        aface *this_face = new aface;

        //write vertex buffer
        const TColgp_Array1OfPnt& Nodes = myT->Nodes();
        this_face->vertex_coord = new float[Nodes.Length() * 3];
        this_face->number_of_coords = Nodes.Length();
        for (int i = Nodes.Lower(); i <= Nodes.Upper(); i++) {
          p = Nodes(i).Transformed(aLocation.Transformation());
          this_face->vertex_coord[((i-1) * 3)+ 0] = static_cast<float>(p.X());
          this_face->vertex_coord[((i-1) * 3)+ 1] = static_cast<float>(p.Y());
          this_face->vertex_coord[((i-1) * 3)+ 2] = static_cast<float>(p.Z());
        }

        //write normal buffer
        TColgp_Array1OfDir myNormal(Nodes.Lower(), Nodes.Upper());
        SST.Normal(myFace, pc, myNormal);
        this_face->normal_coord = new float[myNormal.Length() * 3];
        this_face->number_of_normals = myNormal.Length();
        for (int i = myNormal.Lower(); i <= myNormal.Upper(); i++) {
          d = myNormal(i).Transformed(aLocation.Transformation());
          this_face->normal_coord[((i-1) * 3)+ 0] = static_cast<float>(d.X());
          this_face->normal_coord[((i-1) * 3)+ 1] = static_cast<float>(d.Y());
          this_face->normal_coord[((i-1) * 3)+ 2] = static_cast<float>(d.Z());
        }

        // set uvcoords buffers to NULL
        // necessary for JoinPrimitive to be performed
        this_face->tex_coord = NULL;
        this_face->number_of_texcoords = 0;
        
        //write triangle buffer
        Standard_Integer validFaceTriCount = 0;
        Standard_Integer n1 , n2 , n3;
        TopAbs_Orientation orient = myFace.Orientation();
        const Poly_Array1OfTriangle&   triangles   = myT->Triangles();
        this_face->tri_indexes  = new int  [triangles.Length()* 3];
        for (int nt = 1; nt <= myT->NbTriangles(); nt++) {
          triangles(nt).Get(n1,n2,n3);
          if (orient != TopAbs_FORWARD) {
              Standard_Integer tmp=n1;
              n1 = n2;
              n2 = tmp;
          }
          if (TriangleIsValid(Nodes(n1),Nodes(n2),Nodes(n3))) {
            this_face->tri_indexes[(validFaceTriCount * 3)+ 0] = n1;
            this_face->tri_indexes[(validFaceTriCount * 3)+ 1] = n2;
            this_face->tri_indexes[(validFaceTriCount * 3)+ 2] = n3;
            validFaceTriCount++;
          }
        }
        this_face->number_of_triangles = validFaceTriCount;
        facelist.push_back(this_face);
      }
    }
    JoinPrimitives();
    if (compute_edges) {  
    ComputeEdges();
    }
}

//---------------------------------------------------------------------------
void Tesselator::TesselateWithUVCoords(bool compute_edges, float mesh_quality)
{
  Standard_Real Umin;
  Standard_Real Umax;
  Standard_Real Vmin;
  Standard_Real Vmax;

  Standard_Real dUmax;
  Standard_Real dVmax;

  TopExp_Explorer       ExpFace;
  StdPrs_ToolShadedShape   SST;

  gp_Dir d;
  gp_Pnt p;

  gp_Vec2d theCoord_p;
  gp_Pnt2d d_coord;
  
  //Triangulate
  BRepMesh_IncrementalMesh(myShape, myDeviation*mesh_quality, false, 0.5*mesh_quality, false);

  for (ExpFace.Init(myShape, TopAbs_FACE); ExpFace.More(); ExpFace.Next()) {
    const TopoDS_Face&    myFace    = TopoDS::Face(ExpFace.Current());
    TopLoc_Location aLocation;

    Handle(Poly_Triangulation) myT = BRep_Tool::Triangulation(myFace, aLocation);

    if (!myT.IsNull()) {
      Poly_Connect pc(myT);

      aface *this_face = new aface;

      //write vertex buffer
      const TColgp_Array1OfPnt& Nodes = myT->Nodes();
      this_face->vertex_coord = new float[Nodes.Length() * 3];
      this_face->number_of_coords = Nodes.Length();
      for (int i = Nodes.Lower(); i <= Nodes.Upper(); i++) {
        p = Nodes(i).Transformed(aLocation.Transformation());
        this_face->vertex_coord[((i-1) * 3)+ 0] = static_cast<float>(p.X());
        this_face->vertex_coord[((i-1) * 3)+ 1] = static_cast<float>(p.Y());
        this_face->vertex_coord[((i-1) * 3)+ 2] = static_cast<float>(p.Z());
      }

      //write normal buffer
      TColgp_Array1OfDir myNormal(Nodes.Lower(), Nodes.Upper());
      SST.Normal(myFace, pc, myNormal);
      this_face->normal_coord = new float[myNormal.Length() * 3];
      this_face->number_of_normals = myNormal.Length();
      for (int i = myNormal.Lower(); i <= myNormal.Upper(); i++) {
        d = myNormal(i).Transformed(aLocation.Transformation());
        this_face->normal_coord[((i-1) * 3)+ 0] = static_cast<float>(d.X());
        this_face->normal_coord[((i-1) * 3)+ 1] = static_cast<float>(d.Y());
        this_face->normal_coord[((i-1) * 3)+ 2] = static_cast<float>(d.Z());
      }

      //write uvcoord buffer
      int id1 = 0, id2 = 2, idNull = 1;

      if (myTxtMapType == atNormal || myTxtMapType == atNormalAutoScale) {
        BRepTools::UVBounds(myFace,Umin, Umax, Vmin, Vmax);
        dUmax = (Umax - Umin);
        dVmax = (Vmax - Vmin);
        if (myTxtMapType == atNormalAutoScale) {
          myScaleU = myAutoScaleSizeOnU/dUmax;
          myScaleV = myAutoScaleSizeOnV/dVmax;
        }
      }
      const TColgp_Array1OfPnt2d& UVNodes = myT->UVNodes();
      this_face->tex_coord = new float[UVNodes.Length()  * 3];
      this_face->number_of_texcoords = UVNodes.Length();
      for (int i = UVNodes.Lower(); i <= UVNodes.Upper();i++) {
        if (myTxtMapType == atCube) {
          GetBoxTextureCoordinate(  Nodes(i).Transformed(aLocation.Transformation()),
                                    myNormal(i).Transformed(aLocation.Transformation()),
                                    theCoord_p);
          d_coord.SetX((-myUOrigin+(myURepeat*theCoord_p.X())/aBndBoxSz)/myScaleU);
          d_coord.SetY((-myVOrigin+(myVRepeat*theCoord_p.Y())/aBndBoxSz)/myScaleV);
        }
        else {
          d_coord = UVNodes(i);
          d_coord.SetX((-myUOrigin+(myURepeat*(d_coord.X()-Umin))/dUmax)/myScaleU);
          d_coord.SetY((-myVOrigin+(myVRepeat*(d_coord.Y()-Vmin))/dVmax)/myScaleV);
        }
        d_coord.Rotate(gp::Origin2d(), myRotationAngle);  
        this_face->tex_coord[((i-1) * 3)+ id1] = static_cast<float>(d_coord.X());
        this_face->tex_coord[((i-1) * 3)+ id2] = static_cast<float>(d_coord.Y());
        this_face->tex_coord[((i-1) * 3)+ idNull] = 0.;
      }

      //write triangle buffer
      Standard_Integer validFaceTriCount = 0;
      Standard_Integer n1 , n2 , n3;
      TopAbs_Orientation orient = myFace.Orientation();
      const Poly_Array1OfTriangle&   triangles   = myT->Triangles();
      this_face->tri_indexes  = new int  [triangles.Length()* 3];
      for (int nt = 1; nt <= myT->NbTriangles(); nt++) {
        triangles(nt).Get(n1,n2,n3);
        if (orient != TopAbs_FORWARD) {
            Standard_Integer tmp=n1;
            n1 = n2;
            n2 = tmp;
        }
        if (TriangleIsValid(Nodes(n1),Nodes(n2),Nodes(n3))) {
          this_face->tri_indexes[(validFaceTriCount * 3)+ 0] = n1;
          this_face->tri_indexes[(validFaceTriCount * 3)+ 1] = n2;
          this_face->tri_indexes[(validFaceTriCount * 3)+ 2] = n3;
          validFaceTriCount++;
        }
      }
      this_face->number_of_triangles = validFaceTriCount;
      facelist.push_back(this_face);
    }
  }
  JoinPrimitivesWithUVCoords();
  if (compute_edges) {  
    ComputeEdges();
  }
}

//---------------------------INTERFACE---------------------------------------
void Tesselator::ComputeDefaultDeviation()
{
    // This method automatically computes precision from the bounding box of the shape
    Bnd_Box aBox;
    Standard_Real aXmin,aYmin ,aZmin ,aXmax ,aYmax ,aZmax;

    //calculate the bounding box
    BRepBndLib::Add(myShape, aBox);
    aBox.Get(aXmin, aYmin, aZmin, aXmax, aYmax, aZmax);

    Standard_Real xDim = std::abs((long)aXmax - (long)aXmin);
    Standard_Real yDim = std::abs((long)aYmax - (long)aYmin);
    Standard_Real zDim = std::abs((long)aZmax - (long)aZmin);

    Standard_Real adeviation = std::max(aXmax-aXmin, std::max(aYmax-aYmin, aZmax-aZmin)) * 1e-2 ;
    myDeviation = adeviation;
}

void Tesselator::ComputeEdges()
{
  TopLoc_Location aTrsf;

  // clear current data
  std::vector<aedge*>::iterator it;
  for (it = edgelist.begin(); it != edgelist.end(); ++it) {
    if (*it) {
      if ((*it)->vertex_coord)
        delete[] (*it)->vertex_coord;

      delete *it;
      *it = NULL;
    }
  }
  edgelist.clear();

  // explore all boundary edges
  TopTools_IndexedDataMapOfShapeListOfShape edgeMap;
  TopExp::MapShapesAndAncestors (myShape, TopAbs_EDGE, TopAbs_FACE, edgeMap);

  for (int iEdge = 1 ; iEdge <= edgeMap.Extent (); iEdge++) {
    // reject free edges
    const TopTools_ListOfShape& faceList = edgeMap.FindFromIndex (iEdge);
    if (faceList.Extent() == 0) {
      continue;
    }

    // take one of the shared edges and get edge triangulation
    const TopoDS_Face& aFace  = TopoDS::Face (faceList.First ());
    const TopoDS_Edge& anEdge = TopoDS::Edge (edgeMap.FindKey (iEdge));

    Handle(Poly_Triangulation) trian = BRep_Tool::Triangulation (aFace, aTrsf);

    if (trian.IsNull ())
      continue;

    Handle(Poly_PolygonOnTriangulation) anEdgePoly =
        BRep_Tool::PolygonOnTriangulation (anEdge, trian, aTrsf);

    if (anEdgePoly.IsNull ()) {
      continue;
    }

    // get edge vertex indexes from face triangulation
    const TColgp_Array1OfPnt& trainVerts = trian->Nodes ();
    const TColStd_Array1OfInteger& edgeVerts = anEdgePoly->Nodes ();

    if (edgeVerts.Length () < 2) {
      continue;
    }

    aedge* theEdge = new aedge;
    theEdge->number_of_coords = edgeVerts.Upper () - edgeVerts.Lower() + 1;
    theEdge->vertex_coord = new float[theEdge->number_of_coords * 3 * sizeof(float)];

    for (int aNodeIdx = edgeVerts.Lower (); aNodeIdx <= edgeVerts.Upper (); aNodeIdx++) {
      // node index in face triangulation
      int aTriIndex = edgeVerts.Value (aNodeIdx);

      // get node and apply location transformation to the node
      gp_Pnt aTriNode = trainVerts.Value (aTriIndex);
      if (!aTrsf.IsIdentity ()) {
        aTriNode.Transform (aTrsf);
      }

      int locIndex = aNodeIdx - edgeVerts.Lower ();
      theEdge->vertex_coord[locIndex*3 + 0] = static_cast<float>(aTriNode.X());
      theEdge->vertex_coord[locIndex*3 + 1] = static_cast<float>(aTriNode.Y());
      theEdge->vertex_coord[locIndex*3 + 2] = static_cast<float>(aTriNode.Z());
    }

    edgelist.push_back(theEdge);
  }
}

std::string Tesselator::ExportToSharedVertices()
{
    std::stringstream str1;
    int v1=0;
    int v2=0;
    int v3=0;
    for (int i=0;i<tot_triangle_count;i++) {
        str1 << "Triangle number " << i <<"\n";
        GetTriangleIndex(i, v1, v2, v3);
        str1 << "\tindex vertex0 : " << v1 << "\n"; 
        str1 << "\tindex vertex1 : " << v2 << "\n";
        str1 << "\tindex vertex2 : " << v3 << "\n";
    }
    return str1.str();
}

std::string Tesselator::ExportShapeToX3DIndexedFaceSet()
{
  std::stringstream str1;
  int *vertices_idx = new int[3];
  int *texcoords_idx = new int[3];
  int *normals_idx = new int[3];
  
  str1 << "<IndexedFaceSet coordIndex='";
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // vertex indices
        str1 << i*3 << " " << 1+i*3 << " " << 2+i*3 << " -1\n";
    } 
    str1 << "' solid='false'>\n";
    // write points coordinates
    str1 << "<Coordinate point='";
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        str1 <<locVertexcoord[vertices_idx[0]]<< " " <<locVertexcoord[vertices_idx[0]+1]<<" "
            << locVertexcoord[vertices_idx[0]+2]<<"\n";
        // Second vertex
        str1 <<locVertexcoord[vertices_idx[1]]<<" "<<locVertexcoord[vertices_idx[1]+1]<<" "
            << locVertexcoord[vertices_idx[1]+2]<<"\n";
        // Third vertex
        str1 << locVertexcoord[vertices_idx[2]]<<" "<<locVertexcoord[vertices_idx[2]+1]<<" "
            << locVertexcoord[vertices_idx[2]+2]<<"\n";
    }
    str1 << "' containerField='coord'></Coordinate>\n";
    // write normals
    str1 << "<Normal vector='";
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // First normal
        str1 << locNormalcoord[normals_idx[0]]<<" "<<locNormalcoord[normals_idx[0]+1]<<" "
            << locNormalcoord[normals_idx[0]+2]<<"\n";
        // Second normal
        str1 << locNormalcoord[normals_idx[1]]<<" "<<locNormalcoord[normals_idx[1]+1]<<" "
            << locNormalcoord[normals_idx[1]+2]<<"\n";
        // Third normal
        str1 << locNormalcoord[normals_idx[2]]<<" "<<locNormalcoord[normals_idx[2]+1]<<" "
            << locNormalcoord[normals_idx[2]+2] << "\n";
    }
    str1 << "' containerField='normal'></Normal>\n";
    // close all markups
    str1 << "</IndexedFaceSet>\n";
    
    delete [] vertices_idx;
    delete [] texcoords_idx;
    delete [] normals_idx;
    
    return str1.str();
}

void Tesselator::ExportShapeToX3D(char * filename, int diffR, int diffG, int diffB)
{
    ofstream X3Dfile;
    X3Dfile.open (filename);
    // write header
    X3Dfile << "<?xml version='1.0' encoding='UTF-8'?>" ;
    X3Dfile << "<!DOCTYPE X3D PUBLIC 'ISO//Web3D//DTD X3D 3.1//EN' 'http://www.web3d.org/specifications/x3d-3.1.dtd'>";
    X3Dfile << "<X3D>";
    X3Dfile << "<Head>";
    X3Dfile << "<meta name='generator' content='pythonOCC, http://www.pythonocc.org'/>";
    X3Dfile << "</Head>";
    X3Dfile << "<Scene><Shape><Appearance><Material DEF='Shape_Mat' diffuseColor='0.65 0.65 0.65' ";
    X3Dfile << "shininess='0.9' specularColor='1 1 1'></Material></Appearance>";
    // write tesselation
    X3Dfile << ExportShapeToX3DIndexedFaceSet();
    X3Dfile << "</Shape></Scene></X3D>\n";
    X3Dfile.close();

}

std::string Tesselator::ExportShapeToThreejsJSONString(char *shape_function_name)
{
    // a method that export a shape to a JSON BufferGeometry object
    std::stringstream str_three_js;
    int *vertices_idx = new int[3];
    int *texcoords_idx = new int[3];
    int *normals_idx = new int[3];
    str_three_js << "{\n";
    str_three_js << "    \"metadata\": {\n";
    str_three_js << "        \"version\": 4.4,\n";
    str_three_js << "        \"type\": \"BufferGeometry\",\n";
    str_three_js << "        \"generator\": \"pythonOCC\"\n";
    str_three_js << "    },\n";
    str_three_js << "    \"uuid\": \"" << shape_function_name << "\",\n";
    str_three_js << "    \"type\": \"BufferGeometry\",\n";
    str_three_js << "    \"data\": {\n";
    str_three_js << "        \"attributes\": {\n";
    str_three_js << "            \"position\": {\n";
    str_three_js << "                \"itemSize\": 3,\n";
    str_three_js << "                \"type\": \"Float32Array\",\n";
    str_three_js << "                \"array\": [";
    // write vertex coordinates
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // First vertex
        str_three_js <<locVertexcoord[vertices_idx[0]]<<","<<locVertexcoord[vertices_idx[0]+1]<<","
            << locVertexcoord[vertices_idx[0]+2]<<",";
        // Second vertex
        str_three_js <<locVertexcoord[vertices_idx[1]]<<","<<locVertexcoord[vertices_idx[1]+1]<<","
            << locVertexcoord[vertices_idx[1]+2]<<",";
        // Third vertex
        str_three_js <<locVertexcoord[vertices_idx[2]]<<","<<locVertexcoord[vertices_idx[2]+1]<<","
            << locVertexcoord[vertices_idx[2]+2];
        // Be careful, JSON parsers don't like trailing commas !!!
        if (i != tot_triangle_count-1) {
          str_three_js <<",";
        }
    }
    str_three_js << "]\n";
    str_three_js << "            },\n";
    str_three_js << "            \"normal\": {\n";
    str_three_js << "                \"itemSize\": 3,\n";
    str_three_js << "                \"type\": \"Float32Array\",\n";
    str_three_js << "                \"array\": [";
    // write normals
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // First normal
        str_three_js << locNormalcoord[normals_idx[0]]<<","<<locNormalcoord[normals_idx[0]+1]<<","
            << locNormalcoord[normals_idx[0]+2]<<",";
        // Second normal
        str_three_js << locNormalcoord[normals_idx[1]]<<","<<locNormalcoord[normals_idx[1]+1]<<","
            << locNormalcoord[normals_idx[1]+2]<<",";
        // Third normal
        str_three_js << locNormalcoord[normals_idx[2]]<<","<<locNormalcoord[normals_idx[2]+1]<<","
            << locNormalcoord[normals_idx[2]+2];
        // Be careful, JSON parsers don't like trailing commas !!!
        if (i != tot_triangle_count-1) {
          str_three_js <<",";
        }
    }
    str_three_js << "]\n";
    str_three_js << "            },\n";
    str_three_js << "            \"uv\": {\n";
    str_three_js << "                \"itemSize\": 2,\n";
    str_three_js << "                \"type\": \"Float32Array\",\n";
    str_three_js << "                \"array\": [";
    // export uv
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        str_three_js << locTexcoord[texcoords_idx[0]]<<","<<locTexcoord[texcoords_idx[0]+2]<<",";
        str_three_js << locTexcoord[texcoords_idx[1]]<<","<<locTexcoord[texcoords_idx[1]+2]<<",";
        str_three_js << locTexcoord[texcoords_idx[2]]<<","<<locTexcoord[texcoords_idx[2]+2];
        // Be careful, JSON parsers don't like trailing commas !!!
        if (i != tot_triangle_count-1) {
          str_three_js <<",";
        }
    }
    str_three_js << "]\n";
    str_three_js << "              }\n";
    // close all brackets
    str_three_js << "        }\n";
    str_three_js << "    }\n";
    str_three_js << "}\n";
    delete [] vertices_idx;
    delete [] texcoords_idx;
    delete [] normals_idx;
    return str_three_js.str();
}

std::string Tesselator::ExportShapeToThreejsBufferGeometryString(char *shape_function_name)
{
    std::stringstream str_three_js;
    int *vertices_idx = new int[3];
    int *texcoords_idx = new int[3];
    int *normals_idx = new int[3];
    // write header
    str_three_js << "var ";
    str_three_js << shape_function_name;
    str_three_js << "_geometry = new THREE.BufferGeometry();\n";
    str_three_js << "var ";
    str_three_js << shape_function_name;
    str_three_js << "_vertices = new Float32Array( [\n";
    // first write vertices coords
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // First vertex
        str_three_js <<locVertexcoord[vertices_idx[0]]<<","<<locVertexcoord[vertices_idx[0]+1]<<","
            << locVertexcoord[vertices_idx[0]+2]<<",\n";
        // Second vertex
        str_three_js <<locVertexcoord[vertices_idx[1]]<<","<<locVertexcoord[vertices_idx[1]+1]<<","
            << locVertexcoord[vertices_idx[1]+2]<<",\n";
        // Third vertex
        str_three_js <<locVertexcoord[vertices_idx[2]]<<","<<locVertexcoord[vertices_idx[2]+1]<<","
            << locVertexcoord[vertices_idx[2]+2]<<",\n";
    }
    str_three_js << "]);\n";
    // write normals
    str_three_js << shape_function_name;
    str_three_js << "_normals = new Float32Array( [\n";
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // First normal
        str_three_js << locNormalcoord[normals_idx[0]]<<","<<locNormalcoord[normals_idx[0]+1]<<","
            << locNormalcoord[normals_idx[0]+2]<<",\n";
        // Second normal
        str_three_js << locNormalcoord[normals_idx[1]]<<","<<locNormalcoord[normals_idx[1]+1]<<","
            << locNormalcoord[normals_idx[1]+2]<<",\n";
        // Third normal
        str_three_js << locNormalcoord[normals_idx[2]]<<","<<locNormalcoord[normals_idx[2]+1]<<","
            << locNormalcoord[normals_idx[2]+2];
        str_three_js << ",\n";
    }
    str_three_js << "]);\n";
    // texture coordinates
    // at last, write texcoords
    str_three_js << shape_function_name;
    str_three_js << "_uvs = new Float32Array( [\n";
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        str_three_js << locTexcoord[texcoords_idx[0]]<<","<<locTexcoord[texcoords_idx[0]+2]<<",";
        str_three_js << locTexcoord[texcoords_idx[1]]<<","<<locTexcoord[texcoords_idx[1]+2]<<",";
        str_three_js << locTexcoord[texcoords_idx[2]]<<","<<locTexcoord[texcoords_idx[2]+2]<<",\n";
    }
    str_three_js << "]);\n";
    // vertices
    str_three_js << shape_function_name;
    str_three_js << "_geometry.addAttribute( 'position', new THREE.BufferAttribute( ";
    str_three_js << shape_function_name;
    str_three_js << "_vertices, 3));\n";
    // normals
    str_three_js << shape_function_name;
    str_three_js << "_geometry.addAttribute( 'normal', new THREE.BufferAttribute( ";
    str_three_js << shape_function_name;
    str_three_js << "_normals, 3));\n";
    // uvs
    str_three_js << shape_function_name;
    str_three_js << "_geometry.addAttribute( 'uv', new THREE.BufferAttribute( ";
    str_three_js << shape_function_name;
    str_three_js << "_uvs, 2));\n";
    delete [] vertices_idx;
    delete [] texcoords_idx;
    delete [] normals_idx;
    return str_three_js.str();
}

std::string Tesselator::ExportShapeToThreejsString(char *shape_function_name)
{
    std::stringstream str_three_js;
    int *vertices_idx = new int[3];
    int *texcoords_idx = new int[3];
    int *normals_idx = new int[3];
    // write header
    str_three_js << "var ";
    str_three_js << shape_function_name;
    str_three_js << " = function () {\n";
    str_three_js << "var scope = this;\n";
    str_three_js << "THREE.Geometry.call(this);\n";
    // first write vertices coords
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // First vertex
        str_three_js << "v("<<locVertexcoord[vertices_idx[0]]<<","<<locVertexcoord[vertices_idx[0]+1]<<","
            << locVertexcoord[vertices_idx[0]+2]<<");\n";
        // Second vertex
        str_three_js << "v("<<locVertexcoord[vertices_idx[1]]<<","<<locVertexcoord[vertices_idx[1]+1]<<","
            << locVertexcoord[vertices_idx[1]+2]<<");\n";
        // Third vertex
        str_three_js << "v("<<locVertexcoord[vertices_idx[2]]<<","<<locVertexcoord[vertices_idx[2]+1]<<","
            << locVertexcoord[vertices_idx[2]+2]<<");\n";
    }
    // write normals
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        // vertex indices
        str_three_js << "f3("<<i*3<<","<<1+i*3<<","<<2+i*3<<",";
        // First normal
        str_three_js << locNormalcoord[normals_idx[0]]<<","<<locNormalcoord[normals_idx[0]+1]<<","
            << locNormalcoord[normals_idx[0]+2]<<",";
        // Second normal
        str_three_js << locNormalcoord[normals_idx[1]]<<","<<locNormalcoord[normals_idx[1]+1]<<","
            << locNormalcoord[normals_idx[1]+2]<<",";
        // Third normal
        str_three_js << locNormalcoord[normals_idx[2]]<<","<<locNormalcoord[normals_idx[2]+1]<<","
            << locNormalcoord[normals_idx[2]+2];
        str_three_js << ");\n";
    }

    // at last, write texcoords
    for (int i=0;i<tot_triangle_count;i++) {
        ObjGetTriangle(i, vertices_idx, texcoords_idx, normals_idx);
        str_three_js << "uvs(";
        str_three_js << locTexcoord[texcoords_idx[0]]<<","<<locTexcoord[texcoords_idx[0]+2]<<",";
        str_three_js << locTexcoord[texcoords_idx[1]]<<","<<locTexcoord[texcoords_idx[1]+2]<<",";
        str_three_js << locTexcoord[texcoords_idx[2]]<<","<<locTexcoord[texcoords_idx[2]+2];
        str_three_js << ");\n";
    }

    // footer
    str_three_js << "function v( x, y, z ) {\n";
    str_three_js<< "  scope.vertices.push(new THREE.Vector3(x,y,z));\n";
    str_three_js<<"}\n";
    str_three_js <<"function f3( a, b, c, n1_x,n1_y,n1_z,n2_x,n2_y,n2_z,n3_x,n3_y,n3_z ) {\n";
    str_three_js << "  scope.faces.push(new THREE.Face3(a,b,c,[new THREE.Vector3(n1_x,n1_y,n1_z),\n";
    str_three_js << "new THREE.Vector3( n2_x, n2_y, n2_z ), new THREE.Vector3( n3_x, n3_y, n3_z ) ]  ) );\n";
    str_three_js << "}\n";
    str_three_js << "function uvs(a,b,c,d,e,f) {\n";
    str_three_js << "scope.faceVertexUvs[ 0 ].push( [new THREE.Vector2(a,b), new THREE.Vector2(c,d), new THREE.Vector2(e,f)] );\n";
    str_three_js << "}\n}\n";
    str_three_js << shape_function_name;
    str_three_js << ".prototype = new THREE.Geometry();\n";
    str_three_js << shape_function_name;
    str_three_js << ".prototype.constructor = ";
    str_three_js << shape_function_name;
    str_three_js << ";\n";
    delete [] vertices_idx;
    delete [] texcoords_idx;
    delete [] normals_idx;
    return str_three_js.str();
}

void Tesselator::ExportShapeToThreejs(char *shape_function_name, char * filename)
{
    ofstream js_file;
    js_file.open (filename);
    js_file << ExportShapeToThreejsBufferGeometryString(shape_function_name);
    js_file.close();
}

//---------------------------------------------------------------------------
float* Tesselator::VerticesList()
{
  return locVertexcoord;
}
//---------------------------------------------------------------------------
float* Tesselator::NormalsList()
{
  return locNormalcoord;
}
//---------------------------------------------------------------------------
float* Tesselator::TextureCoordinatesList()
{
  return locTexcoord;
}

//---------------------------------------------------------------------------
int Tesselator::ObjGetTriangleCount()
{
  return  tot_triangle_count;
}
//---------------------------------------------------------------------------
int Tesselator::ObjGetVertexCount()
{
  return  tot_vertex_count;
}
//---------------------------------------------------------------------------
int Tesselator::ObjGetNormalCount()
{
  return  tot_normal_count;
}
//---------------------------------------------------------------------------
int Tesselator::ObjGetTexCoordCount()
{
  return  tot_texcoord_count;
}
//---------------------------------------------------------------------------
int Tesselator::ObjGetEdgeCount()
{
  return edgelist.size();
}
//---------------------------------------------------------------------------
int Tesselator::ObjEdgeGetVertexCount(int iEdge)
{
  aedge* edge = edgelist.at(iEdge);
  if (!edge) {
    return 0;
  }

  return edge->number_of_coords;
}
//---------------------------------------------------------------------------
void Tesselator::GetVertex(int ivert, float& x, float& y, float& z)
{
  x = locVertexcoord[ivert*3 + 0];
  y = locVertexcoord[ivert*3 + 1];
  z = locVertexcoord[ivert*3 + 2];
}
//---------------------------------------------------------------------------
void Tesselator::GetNormal(int ivert, float& x, float& y, float& z)
{
  x = locNormalcoord[ivert*3 + 0];
  y = locNormalcoord[ivert*3 + 1];
  z = locNormalcoord[ivert*3 + 2];
}
//---------------------------------------------------------------------------
void Tesselator::GetTriangleIndex(int triangleIdx, int &v1, int &v2, int &v3)
{
  v1 = loc_tri_indexes[3*triangleIdx + 0];
  v2 = loc_tri_indexes[3*triangleIdx + 1];
  v3 = loc_tri_indexes[3*triangleIdx + 2];
}
//---------------------------------------------------------------------------
void Tesselator::GetEdgeVertex(int iEdge, int ivert, float &x, float &y, float &z)
{
  aedge* e = edgelist.at(iEdge);
  if (!e) {
    return;
  }

  x = e->vertex_coord[3*ivert + 0];
  y = e->vertex_coord[3*ivert + 1];
  z = e->vertex_coord[3*ivert + 2];
}
//---------------------------------------------------------------------------
void Tesselator::ObjGetTriangle(int trianglenum, int *vertices, int *texcoords, int *normals)
{
  int pID = loc_tri_indexes[(trianglenum * 3) + 0] * 3;
  int qID = loc_tri_indexes[(trianglenum * 3) + 1] * 3;
  int rID = loc_tri_indexes[(trianglenum * 3) + 2] * 3;

  vertices[0] = pID;
  vertices[1] = qID;
  vertices[2] = rID;

  normals[0] = pID;
  normals[1] = qID;
  normals[2] = rID;

  texcoords[0] = pID;
  texcoords[1] = qID;
  texcoords[2] = rID;
}
//---------------------------------------------------------------------------
//---------------------------------HELPERS-----------------------------------
//---------------------------------------------------------------------------
void Tesselator::JoinPrimitives()
{
  int obP = 0;
  int obN = 0;
  int obT = 0;
  int obTR = 0;

  int advance = 0;

  int total_poly_count = 0;
  int total_vertex_count = 0;
  int total_normal_count = 0;

  std::vector<aface*>::iterator anIterator = facelist.begin();

  while (anIterator != facelist.end()) {

    aface* myface = *anIterator;

    total_poly_count =  total_poly_count + myface->number_of_triangles;
    total_vertex_count = total_vertex_count + myface->number_of_coords;
    total_normal_count = total_normal_count + myface->number_of_normals;

    anIterator++;
  }

  loc_tri_indexes= new int[total_poly_count * 3 ];
  locVertexcoord = new float[total_vertex_count * 3 ];
  locNormalcoord = new float[total_normal_count * 3 ];

  tot_triangle_count = total_poly_count;
  tot_vertex_count   = total_vertex_count;
  tot_normal_count   = total_normal_count;

  anIterator = facelist.begin();
  while (anIterator != facelist.end()) {
    aface* myface = *anIterator;
    for (int x = 0; x < myface->number_of_coords; x++) {
      locVertexcoord[(obP * 3) + 0] = myface->vertex_coord[(x * 3) + 0];
      locVertexcoord[(obP * 3) + 1] = myface->vertex_coord[(x * 3) + 1];
      locVertexcoord[(obP * 3) + 2] = myface->vertex_coord[(x * 3) + 2];
      obP++;
    }

    for (int x = 0; x < myface->number_of_normals; x++) {
      locNormalcoord[(obN * 3) + 0] = myface->normal_coord[(x * 3) + 0];
      locNormalcoord[(obN * 3) + 1] = myface->normal_coord[(x * 3) + 1];
      locNormalcoord[(obN * 3) + 2] = myface->normal_coord[(x * 3) + 2];
      obN++;
    }

    for (int x = 0; x < myface->number_of_triangles; x++) {
      loc_tri_indexes[(obTR * 3) + 0] = myface->tri_indexes[(x * 3) + 0] + advance - 1;
      loc_tri_indexes[(obTR * 3) + 1] = myface->tri_indexes[(x * 3) + 1] + advance - 1;
      loc_tri_indexes[(obTR * 3) + 2] = myface->tri_indexes[(x * 3) + 2] + advance - 1;
      obTR++;
    }

    advance = obP;

    delete [] myface->vertex_coord;
    myface->vertex_coord = NULL;

    delete [] myface->normal_coord;
    myface->normal_coord = NULL;

    delete [] myface->tri_indexes;
    myface->tri_indexes = NULL;

    delete myface;
    myface = NULL;

    anIterator++;
  }
}

void Tesselator::JoinPrimitivesWithUVCoords()
{
  int obP = 0;
  int obN = 0;
  int obT = 0;
  int obTR = 0;

  int advance = 0;

  int total_poly_count = 0;
  int total_vertex_count = 0;
  int total_normal_count = 0;
  int total_texcoord_count = 0;

  std::vector<aface*>::iterator anIterator = facelist.begin();

  while (anIterator != facelist.end()) {

    aface* myface = *anIterator;

    total_poly_count =  total_poly_count + myface->number_of_triangles;
    total_vertex_count = total_vertex_count + myface->number_of_coords;
    total_normal_count = total_normal_count + myface->number_of_normals;
    total_texcoord_count = total_texcoord_count + myface->number_of_texcoords;

    anIterator++;
  }

  loc_tri_indexes= new int[total_poly_count * 3 ];
  locVertexcoord = new float[total_vertex_count * 3 ];
  locNormalcoord = new float[total_normal_count * 3 ];
  locTexcoord    = new float[total_texcoord_count * 3 ];

  tot_triangle_count = total_poly_count;
  tot_vertex_count   = total_vertex_count;
  tot_normal_count   = total_normal_count;
  tot_texcoord_count = total_texcoord_count;
  anIterator = facelist.begin();
  while (anIterator != facelist.end()) {
    aface* myface = *anIterator;
    for (int x = 0; x < myface->number_of_coords; x++) {
      locVertexcoord[(obP * 3) + 0] = myface->vertex_coord[(x * 3) + 0];
      locVertexcoord[(obP * 3) + 1] = myface->vertex_coord[(x * 3) + 1];
      locVertexcoord[(obP * 3) + 2] = myface->vertex_coord[(x * 3) + 2];
      obP++;
    }

    for (int x = 0; x < myface->number_of_normals; x++) {
      locNormalcoord[(obN * 3) + 0] = myface->normal_coord[(x * 3) + 0];
      locNormalcoord[(obN * 3) + 1] = myface->normal_coord[(x * 3) + 1];
      locNormalcoord[(obN * 3) + 2] = myface->normal_coord[(x * 3) + 2];
      obN++;
    }

    for (int x = 0; x < myface->number_of_texcoords; x++) {
      locTexcoord[(obT * 3) + 0] = myface->tex_coord[(x * 3) + 0];
      locTexcoord[(obT * 3) + 1] = myface->tex_coord[(x * 3) + 1];
      locTexcoord[(obT * 3) + 2] = myface->tex_coord[(x * 3) + 2];
      obT++;
    }

    for (int x = 0; x < myface->number_of_triangles; x++) {
      loc_tri_indexes[(obTR * 3) + 0] = myface->tri_indexes[(x * 3) + 0] + advance - 1;
      loc_tri_indexes[(obTR * 3) + 1] = myface->tri_indexes[(x * 3) + 1] + advance - 1;
      loc_tri_indexes[(obTR * 3) + 2] = myface->tri_indexes[(x * 3) + 2] + advance - 1;
      obTR++;
    }

    advance = obP;

    delete [] myface->vertex_coord;
    myface->vertex_coord = NULL;

    delete [] myface->normal_coord;
    myface->normal_coord = NULL;

    delete [] myface->tex_coord;
    myface->tex_coord = NULL;

    delete [] myface->tri_indexes;
    myface->tri_indexes = NULL;

    delete myface;
    myface = NULL;

    anIterator++;
  }
}

//---------------------------------------------------------------------------
Standard_Boolean Tesselator::TriangleIsValid(const gp_Pnt& P1, const gp_Pnt& P2, const gp_Pnt& P3) const
{
  gp_Vec V1(P1,P2);
  gp_Vec V2(P2,P3);
  gp_Vec V3(P3,P1);

  if ((V1.SquareMagnitude() > 1.e-10) && (V2.SquareMagnitude() > 1.e-10) && (V3.SquareMagnitude() > 1.e-10)) {
    V1.Cross(V2);
    if (V1.SquareMagnitude() > 1.e-10)
      return Standard_True;
    else
      return Standard_False;
  }
  else
    return Standard_False;
}

//---------------------------------------------------------------------------
void Tesselator::PrepareBoxTextureCoordinates(const TopoDS_Shape& aShape)
{
  //declare local variables
  Bnd_Box aBox;
  Standard_Real aXmin,aYmin ,aZmin ,aXmax ,aYmax ,aZmax;

  //calculate the bounding box
  BRepBndLib::Add(aShape, aBox);
  aBox.Get(aXmin, aYmin, aZmin, aXmax, aYmax, aZmax);

  //enlarge the bb so all edges have the size of the biggest one
  Standard_Real xDim = std::abs((long)aXmax - (long)aXmin);
  Standard_Real yDim = std::abs((long)aYmax - (long)aYmin);
  Standard_Real zDim = std::abs((long)aZmax - (long)aZmin);

  if ((xDim > yDim) && (xDim > zDim)) {
    aYmin -= (xDim - yDim) / 2;
    aYmax += (xDim - yDim) / 2;

    aZmin -= (xDim - zDim) / 2;
    aZmax += (xDim - zDim) / 2;
  }
  else if ((yDim > xDim) && (yDim > zDim)) {
    aXmin -= (yDim - xDim) / 2;
    aXmax += (yDim - xDim) / 2;

    aZmin -= (yDim - zDim) / 2;
    aZmax += (yDim - zDim) / 2;
  }
  else {
    aXmin -= (zDim - xDim) / 2;
    aXmax += (zDim - xDim) / 2;

    aYmin -= (zDim - yDim) / 2;
    aYmax += (zDim - yDim) / 2;
  }

  aBndBoxSz = aXmax-aXmin;
}

//---------------------------------------------------------------------------
void Tesselator::GetBoxTextureCoordinate(const gp_Pnt& p, const gp_Dir& N1, gp_Vec2d& theCoord_p)
{
  Standard_Real x = std::abs(N1.X());
  Standard_Real y = std::abs(N1.Y());
  Standard_Real z = std::abs(N1.Z());

  if (x >= y && x >= z) {
    if (N1.X() > 0) { //right
      theCoord_p.SetX(p.Y() - aYmin);
      theCoord_p.SetY(p.Z() - aZmin);
      theCoord_p.Rotate(M_PI/2.);
    }
    else { //left
      theCoord_p.SetX(p.Z() - aZmin);
      theCoord_p.SetY(p.Y() - aYmin);
    }
  }
  else if ((y >= z) && (y >= x)) {
    if (N1.Y() > 0) { //top
      theCoord_p.SetX(p.X() - aXmin);
      theCoord_p.SetY(-(p.Z() - aZmin));
    }
    else { //bottom
      theCoord_p.SetY(p.Z() - aZmin);
      theCoord_p.SetX(p.X() - aXmin);
      theCoord_p.Rotate( M_PI);
    }
  }
  else {
    if (N1.Z() > 0) {  //front
      theCoord_p.SetX(p.X() - aXmin);
      theCoord_p.SetY(p.Y() - aYmin);
    }
    else { //back
      theCoord_p.SetX(p.Y() - aYmin);
      theCoord_p.SetY(p.X() - aXmin);
      theCoord_p.Rotate(M_PI/2.);
    }
  }
}
