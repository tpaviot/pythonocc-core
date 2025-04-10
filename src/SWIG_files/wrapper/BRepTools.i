/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define BREPTOOLSDOCSTRING
"BRepTools module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_breptools.html"
%enddef
%module (package="OCC.Core", docstring=BREPTOOLSDOCSTRING) BRepTools


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BRepTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<OSD_module.hxx>
#include<TopAbs_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopLoc_module.hxx>
#include<gp_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Bnd.i
%import TopTools.i
%import Geom.i
%import Geom2d.i
%import OSD.i
%import TopAbs.i
%import BRep.i
%import Message.i
%import GeomAbs.i
%import TopLoc.i
%import gp.i
%import Poly.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepTools_History)
%wrap_handle(BRepTools_Modification)
%wrap_handle(BRepTools_ReShape)
%wrap_handle(BRepTools_CopyModification)
%wrap_handle(BRepTools_GTrsfModification)
%wrap_handle(BRepTools_TrsfModification)
%wrap_handle(BRepTools_NurbsConvertModification)
/* end handles declaration */

/* templates */
%template(BRepTools_MapOfVertexPnt2d) NCollection_DataMap<TopoDS_Shape,TColgp_SequenceOfPnt2d,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt2d, TopTools_ShapeMapHasher>::Iterator BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt2d, TopTools_ShapeMapHasher> BRepTools_MapOfVertexPnt2d;
/* end typedefs declaration */

/******************
* class BRepTools *
******************/
%rename(breptools) BRepTools;
class BRepTools {
	public:
		/****** BRepTools::ActivateTriangulation ******/
		/****** md5 signature: 39a3be4a36dcd05759204a5ec0fdc5af ******/
		%feature("compactdefaultargs") ActivateTriangulation;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTriangulationIdx: int
theToActivateStrictly: bool (optional, default to false)

Return
-------
bool

Description
-----------
Activates triangulation data for each face of the shape from some deferred storage using specified shared input file system 
Input parameter: theShape shape to activate triangulations 
Input parameter: theTriangulationIdx index defining what triangulation should be activated. Starts from 0. Exception will be thrown in case of invalid negative index 
Input parameter: theToActivateStrictly flag to activate exactly triangulation with defined theTriangulationIdx index. In True case if some face doesn't contain triangulation with this index, active triangulation will not be changed for it. Else the last available triangulation will be activated. 
Return: True if at least one active triangulation was changed.
") ActivateTriangulation;
		static Standard_Boolean ActivateTriangulation(const TopoDS_Shape & theShape, const Standard_Integer theTriangulationIdx, const Standard_Boolean theToActivateStrictly = false);

		/****** BRepTools::AddUVBounds ******/
		/****** md5 signature: 0f0b092c5bc0e661a6c685d5c94ea9dd ******/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the box <B> the bounding values in the parametric space of F.
") AddUVBounds;
		static void AddUVBounds(const TopoDS_Face & F, Bnd_Box2d & B);

		/****** BRepTools::AddUVBounds ******/
		/****** md5 signature: b2e0e63879ee2bdf9d6eb8f583eef486 ******/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the box <B> the bounding values of the wire in the parametric space of F.
") AddUVBounds;
		static void AddUVBounds(const TopoDS_Face & F, const TopoDS_Wire & W, Bnd_Box2d & B);

		/****** BRepTools::AddUVBounds ******/
		/****** md5 signature: ef861e4c373c52fcf2272133b9ef615f ******/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the box <B> the bounding values of the edge in the parametric space of F.
") AddUVBounds;
		static void AddUVBounds(const TopoDS_Face & F, const TopoDS_Edge & E, Bnd_Box2d & B);

		/****** BRepTools::CheckLocations ******/
		/****** md5 signature: 1df4d13b8eb09af8c12c5590b0f17a8c ******/
		%feature("compactdefaultargs") CheckLocations;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theProblemShapes: TopTools_ListOfShape

Return
-------
None

Description
-----------
Check all locations of shape according criterium: aTrsf.IsNegative() || (Abs(Abs(aTrsf.ScaleFactor()) - 1.) > TopLoc_Location::ScalePrec()) All sub-shapes having such locations are put in list theProblemShapes.
") CheckLocations;
		static void CheckLocations(const TopoDS_Shape & theS, TopTools_ListOfShape & theProblemShapes);

		/****** BRepTools::Clean ******/
		/****** md5 signature: e69d53fa65ed6662d92131db242c5024 ******/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theForce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Removes all cached polygonal representation of the shape, i.e. the triangulations of the faces of <S> and polygons on triangulations and polygons 3d of the edges. In case polygonal representation is the only available representation for the shape (shape does not have geometry) it is not removed. 
Input parameter: theShape the shape to clean 
Input parameter: theForce allows removing all polygonal representations from the shape,  including polygons on triangulations irrelevant for the faces of the  given shape.
") Clean;
		static void Clean(const TopoDS_Shape & theShape, const Standard_Boolean theForce = Standard_False);

		/****** BRepTools::CleanGeometry ******/
		/****** md5 signature: ce6b6e89067b44b9c151c1e43c8e50e5 ******/
		%feature("compactdefaultargs") CleanGeometry;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Removes geometry (curves and surfaces) from all edges and faces of the shape.
") CleanGeometry;
		static void CleanGeometry(const TopoDS_Shape & theShape);

		/****** BRepTools::Compare ******/
		/****** md5 signature: d9864c743fdc9bb7b025a48b72edcbec ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
bool

Description
-----------
Returns True if the distance between the two vertices is lower than their tolerance.
") Compare;
		static Standard_Boolean Compare(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepTools::Compare ******/
		/****** md5 signature: ea251f6848a69bbeaf8009fee744c62d ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns True if the distance between the two edges is lower than their tolerance.
") Compare;
		static Standard_Boolean Compare(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** BRepTools::DetectClosedness ******/
		/****** md5 signature: 6f98ec688487f1becf2d69d2cb328f32 ******/
		%feature("compactdefaultargs") DetectClosedness;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
theUclosed: bool
theVclosed: bool

Description
-----------
Detect closedness of face in U and V directions.
") DetectClosedness;
		static void DetectClosedness(const TopoDS_Face & theFace, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepTools::Dump ******/
		/****** md5 signature: d8fbac42c489d0bae98b03b1387b21c5 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape

Return
-------
S: Standard_OStream

Description
-----------
Dumps the topological structure and the geometry of <Sh> on the stream <S>.
") Dump;
		static void Dump(const TopoDS_Shape & Sh, std::ostream &OutValue);

		/****** BRepTools::EvalAndUpdateTol ******/
		/****** md5 signature: 16be652a9c224d56f94960b2cade0539 ******/
		%feature("compactdefaultargs") EvalAndUpdateTol;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
theC3d: Geom_Curve
theC2d: Geom2d_Curve
theS: Geom_Surface
theF: float
theL: float

Return
-------
float

Description
-----------
Evals real tolerance of edge <theE>. <theC3d>, <theC2d>, <theS>, <theF>, <theL> are correspondently 3d curve of edge, 2d curve on surface <theS> and rang of edge If calculated tolerance is more then current edge tolerance, edge is updated. Method returns actual tolerance of edge.
") EvalAndUpdateTol;
		static Standard_Real EvalAndUpdateTol(const TopoDS_Edge & theE, const opencascade::handle<Geom_Curve> & theC3d, const opencascade::handle<Geom2d_Curve> & theC2d, const opencascade::handle<Geom_Surface> & theS, const Standard_Real theF, const Standard_Real theL);

		/****** BRepTools::IsReallyClosed ******/
		/****** md5 signature: d361112f12ce86c3a572783eb22c3dcb ******/
		%feature("compactdefaultargs") IsReallyClosed;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
bool

Description
-----------
Verifies that the edge <E> is found two times on the face <F> before calling BRep_Tool::IsClosed.
") IsReallyClosed;
		static Standard_Boolean IsReallyClosed(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepTools::LoadAllTriangulations ******/
		/****** md5 signature: 1466fd44e74f80d49ab3905c6d611afa ******/
		%feature("compactdefaultargs") LoadAllTriangulations;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFileSystem: OSD_FileSystem (optional, default to opencascade::handle<OSD_FileSystem>())

Return
-------
bool

Description
-----------
Loads all available triangulations for each face of the shape from some deferred storage using specified shared input file system 
Input parameter: theShape shape to load triangulations 
Input parameter: theFileSystem shared file system 
Return: True if at least one triangulation is loaded.
") LoadAllTriangulations;
		static Standard_Boolean LoadAllTriangulations(const TopoDS_Shape & theShape, const opencascade::handle<OSD_FileSystem> & theFileSystem = opencascade::handle<OSD_FileSystem>());

		/****** BRepTools::LoadTriangulation ******/
		/****** md5 signature: 2b46d2fac9cc1acb805e26246d213be8 ******/
		%feature("compactdefaultargs") LoadTriangulation;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTriangulationIdx: int (optional, default to -1)
theToSetAsActive: bool (optional, default to Standard_False)
theFileSystem: OSD_FileSystem (optional, default to opencascade::handle<OSD_FileSystem>())

Return
-------
bool

Description
-----------
Loads triangulation data for each face of the shape from some deferred storage using specified shared input file system 
Input parameter: theShape shape to load triangulations 
Input parameter: theTriangulationIdx index defining what triangulation should be loaded. Starts from 0. -1 is used in specific case to load currently already active triangulation. If some face doesn't contain triangulation with this index, nothing will be loaded for it. Exception will be thrown in case of invalid negative index 
Input parameter: theToSetAsActive flag to activate triangulation after its loading 
Input parameter: theFileSystem shared file system 
Return: True if at least one triangulation is loaded.
") LoadTriangulation;
		static Standard_Boolean LoadTriangulation(const TopoDS_Shape & theShape, const Standard_Integer theTriangulationIdx = -1, const Standard_Boolean theToSetAsActive = Standard_False, const opencascade::handle<OSD_FileSystem> & theFileSystem = opencascade::handle<OSD_FileSystem>());

		/****** BRepTools::Map3DEdges ******/
		/****** md5 signature: affe8cc83d005936d51c3385b6fc5c16 ******/
		%feature("compactdefaultargs") Map3DEdges;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
M: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
Stores in the map <M> all the 3D topology edges of <S>.
") Map3DEdges;
		static void Map3DEdges(const TopoDS_Shape & S, TopTools_IndexedMapOfShape & M);

		/****** BRepTools::OriEdgeInFace ******/
		/****** md5 signature: 87c7eb8c9c51ee951fa03577413800d5 ******/
		%feature("compactdefaultargs") OriEdgeInFace;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Return
-------
TopAbs_Orientation

Description
-----------
returns the cumul of the orientation of <Edge> and thc containing wire in <Face>.
") OriEdgeInFace;
		static TopAbs_Orientation OriEdgeInFace(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****** BRepTools::OuterWire ******/
		/****** md5 signature: 34752d857d2c349cc92d685bc3ac944f ******/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopoDS_Wire

Description
-----------
Returns the outer most wire of <F>. Returns a Null wire if <F> has no wires.
") OuterWire;
		static TopoDS_Wire OuterWire(const TopoDS_Face & F);

		/****** BRepTools::Read ******/
		/****** md5 signature: f8f4ebe237e52067b8c32d38777547cb ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
S: str
B: BRep_Builder
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads a Shape from <S> in returns it in <Sh>. <B> is used to build the shape.
") Read;
		static void Read(TopoDS_Shape & Sh, std::istream & S, const BRep_Builder & B, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools::Read ******/
		/****** md5 signature: 5e5d6e702af29b2284954f484072b531 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
File: str
B: BRep_Builder
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a Shape from <File>, returns it in <Sh>. <B> is used to build the shape.
") Read;
		static Standard_Boolean Read(TopoDS_Shape & Sh, Standard_CString File, const BRep_Builder & B, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools::RemoveInternals ******/
		/****** md5 signature: fb7d53f36648eea1919fdf6c0fb177b1 ******/
		%feature("compactdefaultargs") RemoveInternals;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theForce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Removes internal sub-shapes from the shape. The check on internal status is based on orientation of sub-shapes, classification is not performed. Before removal of internal sub-shapes the algorithm checks if such removal is not going to break topological connectivity between sub-shapes. The flag <theForce> if set to true disables the connectivity check and clears the given shape from all sub-shapes with internal orientation.
") RemoveInternals;
		static void RemoveInternals(TopoDS_Shape & theS, const Standard_Boolean theForce = Standard_False);

		/****** BRepTools::RemoveUnusedPCurves ******/
		/****** md5 signature: eda361bf0d5c24ff50f23619c0d11b07 ******/
		%feature("compactdefaultargs") RemoveUnusedPCurves;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Removes all the pcurves of the edges of <S> that refer to surfaces not belonging to any face of <S>.
") RemoveUnusedPCurves;
		static void RemoveUnusedPCurves(const TopoDS_Shape & S);

		/****** BRepTools::Triangulation ******/
		/****** md5 signature: 972fc5cfded2376997f1670bb657d434 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLinDefl: float
theToCheckFreeEdges: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Verifies that each Face from the shape has got a triangulation with a deflection smaller or equal to specified one and the Edges a discretization on this triangulation. 
Input parameter: theShape shape to verify 
Input parameter: theLinDefl maximum allowed linear deflection 
Input parameter: theToCheckFreeEdges if True, then free Edges are required to have 3D polygon 
Return: False if input Shape contains Faces without triangulation, or that triangulation has worse (greater) deflection than specified one, or Edges in Shape lack polygons on triangulation or free Edges in Shape lack 3D polygons.
") Triangulation;
		static Standard_Boolean Triangulation(const TopoDS_Shape & theShape, const Standard_Real theLinDefl, const Standard_Boolean theToCheckFreeEdges = Standard_False);

		/****** BRepTools::UVBounds ******/
		/****** md5 signature: 0269b57f10dffa44e1c436bbfecc00b6 ******/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
UMin: float
UMax: float
VMin: float
VMax: float

Description
-----------
Returns in UMin, UMax, VMin, VMax the bounding values in the parametric space of F.
") UVBounds;
		static void UVBounds(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools::UVBounds ******/
		/****** md5 signature: cf2651b439566177e86079e036f0f456 ******/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire

Return
-------
UMin: float
UMax: float
VMin: float
VMax: float

Description
-----------
Returns in UMin, UMax, VMin, VMax the bounding values of the wire in the parametric space of F.
") UVBounds;
		static void UVBounds(const TopoDS_Face & F, const TopoDS_Wire & W, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools::UVBounds ******/
		/****** md5 signature: 391e5b8ffac33b45d944cc1daf0ae4d7 ******/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Return
-------
UMin: float
UMax: float
VMin: float
VMax: float

Description
-----------
Returns in UMin, UMax, VMin, VMax the bounding values of the edge in the parametric space of F.
") UVBounds;
		static void UVBounds(const TopoDS_Face & F, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools::UnloadAllTriangulations ******/
		/****** md5 signature: 8efc2f1bae963a37e143369fac101307 ******/
		%feature("compactdefaultargs") UnloadAllTriangulations;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Releases all available triangulations for each face of the shape if there is deferred storage to load them later 
Input parameter: theShape shape to unload triangulations 
Return: True if at least one triangulation is unloaded.
") UnloadAllTriangulations;
		static Standard_Boolean UnloadAllTriangulations(const TopoDS_Shape & theShape);

		/****** BRepTools::UnloadTriangulation ******/
		/****** md5 signature: 4cba1ffb2b2a96847b88c3a4736d9bea ******/
		%feature("compactdefaultargs") UnloadTriangulation;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTriangulationIdx: int (optional, default to -1)

Return
-------
bool

Description
-----------
Releases triangulation data for each face of the shape if there is deferred storage to load it later 
Input parameter: theShape shape to unload triangulations 
Input parameter: theTriangulationIdx index defining what triangulation should be unloaded. Starts from 0. -1 is used in specific case to unload currently already active triangulation. If some face doesn't contain triangulation with this index, nothing will be unloaded for it. Exception will be thrown in case of invalid negative index 
Return: True if at least one triangulation is unloaded.
") UnloadTriangulation;
		static Standard_Boolean UnloadTriangulation(const TopoDS_Shape & theShape, const Standard_Integer theTriangulationIdx = -1);

		/****** BRepTools::Update ******/
		/****** md5 signature: 7afb8b0a0ac818d408265e5c3ffb8146 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
Update a vertex (nothing is done).
") Update;
		static void Update(const TopoDS_Vertex & V);

		/****** BRepTools::Update ******/
		/****** md5 signature: 75c7d58dbc644899f41cf6f457451a08 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Update an edge, compute 2d bounding boxes.
") Update;
		static void Update(const TopoDS_Edge & E);

		/****** BRepTools::Update ******/
		/****** md5 signature: e94ec159f4082b5b4f1a0f416dd78ef6 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Update a wire (nothing is done).
") Update;
		static void Update(const TopoDS_Wire & W);

		/****** BRepTools::Update ******/
		/****** md5 signature: 193444ef19754736bfcad5d390c79b81 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Update a Face, update UV points.
") Update;
		static void Update(const TopoDS_Face & F);

		/****** BRepTools::Update ******/
		/****** md5 signature: cd320ec7b49cbbb658b6ae7b12c77502 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
Update a shell (nothing is done).
") Update;
		static void Update(const TopoDS_Shell & S);

		/****** BRepTools::Update ******/
		/****** md5 signature: bdc63e26362e00a362c3b8c586bfa0bc ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid

Return
-------
None

Description
-----------
Update a solid (nothing is done).
") Update;
		static void Update(const TopoDS_Solid & S);

		/****** BRepTools::Update ******/
		/****** md5 signature: 6ae6e8f41b41837e6e3794345f0c75eb ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
C: TopoDS_CompSolid

Return
-------
None

Description
-----------
Update a composite solid (nothing is done).
") Update;
		static void Update(const TopoDS_CompSolid & C);

		/****** BRepTools::Update ******/
		/****** md5 signature: c12942ef044e979c45933c3cc101f35a ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
C: TopoDS_Compound

Return
-------
None

Description
-----------
Update a compound (nothing is done).
") Update;
		static void Update(const TopoDS_Compound & C);

		/****** BRepTools::Update ******/
		/****** md5 signature: 9df60fcab5eff3782584302cfec917cf ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Update a shape, call the correct update.
") Update;
		static void Update(const TopoDS_Shape & S);

		/****** BRepTools::UpdateFaceUVPoints ******/
		/****** md5 signature: e8c9eb4d0ff9126a91f4898669b73d9f ******/
		%feature("compactdefaultargs") UpdateFaceUVPoints;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face

Return
-------
None

Description
-----------
For each edge of the face <F> reset the UV points to the bounding points of the parametric curve of the edge on the face.
") UpdateFaceUVPoints;
		static void UpdateFaceUVPoints(const TopoDS_Face & theF);

		/****** BRepTools::Write ******/
		/****** md5 signature: 92da105c9c540199f80c0283d45c56e0 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theStream: Standard_OStream

Description
-----------
Writes the shape to the stream in an ASCII format TopTools_FormatVersion_VERSION_1. This alias writes shape with triangulation data. 
Input parameter: theShape the shape to write 
Input parameter:[out] theStream the stream to output shape into 
Parameter theRange the range of progress indicator to fill in.
") Write;
		static void Write(const TopoDS_Shape & theShape, std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools::Write ******/
		/****** md5 signature: 9549ae676c065d5541189e667b74dffd ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theWithTriangles: bool
theWithNormals: bool
theVersion: TopTools_FormatVersion
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theStream: Standard_OStream

Description
-----------
Writes the shape to the stream in an ASCII format of specified version. 
Input parameter: theShape the shape to write 
Input parameter:[out] theStream the stream to output shape into 
Input parameter: theWithTriangles flag which specifies whether to save shape with (True) or without (False) triangles;  has no effect on triangulation-only geometry 
Input parameter: theWithNormals flag which specifies whether to save triangulation with (True) or without (False) normals;  has no effect on triangulation-only geometry 
Input parameter: theVersion the TopTools format version 
Parameter theProgress the range of progress indicator to fill in.
") Write;
		static void Write(const TopoDS_Shape & theShape, std::ostream &OutValue, const Standard_Boolean theWithTriangles, const Standard_Boolean theWithNormals, const TopTools_FormatVersion theVersion, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools::Write ******/
		/****** md5 signature: 2b0742433c64d0c04f4d2d4d98afcfa2 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes the shape to the file in an ASCII format TopTools_FormatVersion_VERSION_1. This alias writes shape with triangulation data. 
Input parameter: theShape the shape to write 
Input parameter: theFile the path to file to output shape into 
Parameter theProgress the range of progress indicator to fill in.
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & theShape, Standard_CString theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools::Write ******/
		/****** md5 signature: 094fc04abd54fdb9dea8b811e19f6844 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: str
theWithTriangles: bool
theWithNormals: bool
theVersion: TopTools_FormatVersion
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes the shape to the file in an ASCII format of specified version. 
Input parameter: theShape the shape to write 
Input parameter: theFile  the path to file to output shape into 
Input parameter: theWithTriangles flag which specifies whether to save shape with (True) or without (False) triangles;  has no effect on triangulation-only geometry 
Input parameter: theWithNormals flag which specifies whether to save triangulation with (True) or without (False) normals;  has no effect on triangulation-only geometry 
Input parameter: theVersion the TopTools format version 
Parameter theProgress the range of progress indicator to fill in.
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & theShape, Standard_CString theFile, const Standard_Boolean theWithTriangles, const Standard_Boolean theWithNormals, const TopTools_FormatVersion theVersion, const Message_ProgressRange & theProgress = Message_ProgressRange());


                    %feature("autodoc", "Serializes TopoDS_Shape to string. If full_precision is False, the default precision of std::stringstream is used which regularly causes rounding.") WriteToString;
                    %extend{
                        static std::string WriteToString(const TopoDS_Shape & shape, bool full_precision = true) {
                        std::stringstream s;
                        if(full_precision) {
                            s.precision(17);
                            s.setf(std::ios::scientific);
                        }
                        BRepTools::Write(shape, s);
                        return s.str();}
                    };
                    %feature("autodoc", "Deserializes TopoDS_Shape from string. Create and return a new TopoDS_Shape each time the method is called.") ReadFromString;
                    %extend{
                        static TopoDS_Shape ReadFromString(const std::string & src) {
                            std::istringstream s(std::move(src));
                            TopoDS_Shape shape;
                            BRep_Builder b;
                            BRepTools::Read(shape, s, b);
                            return shape;
                        }
                    };
                    %feature("autodoc", "Deserializes TopoDS_Shape from string. Take a TopoDS_Shape instance by reference to prevent memory increase.") ReadFromString;
                    %extend{
                        static void ReadFromString(const std::string & src, TopoDS_Shape& shape) {
						    std::istringstream s(std::move(src));
						    BRep_Builder b;
						    BRepTools::Read(shape, s, b);
						}
                    };     
            };


%extend BRepTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepTools_History *
**************************/
class BRepTools_History : public Standard_Transient {
	public:
/* public enums */
enum TRelationType {
	TRelationType_Removed = 0,
	TRelationType_Generated = 1,
	TRelationType_Modified = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TRelationType(IntEnum):
	TRelationType_Removed = 0
	TRelationType_Generated = 1
	TRelationType_Modified = 2
TRelationType_Removed = TRelationType.TRelationType_Removed
TRelationType_Generated = TRelationType.TRelationType_Generated
TRelationType_Modified = TRelationType.TRelationType_Modified
};
/* end python proxy for enums */

		/****** BRepTools_History::BRepTools_History ******/
		/****** md5 signature: 4a35f50a2b6bb1bb1303ad7d8374073c ******/
		%feature("compactdefaultargs") BRepTools_History;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepTools_History;
		 BRepTools_History();

		/****** BRepTools_History::AddGenerated ******/
		/****** md5 signature: a7f4c29c6486250bd1401110ad1490c1 ******/
		%feature("compactdefaultargs") AddGenerated;
		%feature("autodoc", "
Parameters
----------
theInitial: TopoDS_Shape
theGenerated: TopoDS_Shape

Return
-------
None

Description
-----------
Methods to set the history. Set the second shape as generated one from the first shape.
") AddGenerated;
		void AddGenerated(const TopoDS_Shape & theInitial, const TopoDS_Shape & theGenerated);

		/****** BRepTools_History::AddModified ******/
		/****** md5 signature: d31865ed0e0ff3990c9c3d0d7d986449 ******/
		%feature("compactdefaultargs") AddModified;
		%feature("autodoc", "
Parameters
----------
theInitial: TopoDS_Shape
theModified: TopoDS_Shape

Return
-------
None

Description
-----------
Set the second shape as modified one from the first shape.
") AddModified;
		void AddModified(const TopoDS_Shape & theInitial, const TopoDS_Shape & theModified);

		/****** BRepTools_History::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the history.
") Clear;
		void Clear();

		/****** BRepTools_History::Dump ******/
		/****** md5 signature: b0b4810c084d0c0f210602a019840cff ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theS: Standard_OStream

Description
-----------
A method to dump a history Prints the brief description of the history into a stream.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** BRepTools_History::Generated ******/
		/****** md5 signature: 308ecbb5e9f94e72f26d5a5fd518be68 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
theInitial: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Methods to read the history. Returns all shapes generated from the shape.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & theInitial);

		/****** BRepTools_History::HasGenerated ******/
		/****** md5 signature: ff1185ae4caf1307e4399403e704df0a ******/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns 'true' if there any shapes with Generated elements present.
") HasGenerated;
		Standard_Boolean HasGenerated();

		/****** BRepTools_History::HasModified ******/
		/****** md5 signature: 5aa09ad744ac71dd47a6ec381a33bc9b ******/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns 'true' if there any Modified shapes present.
") HasModified;
		Standard_Boolean HasModified();

		/****** BRepTools_History::HasRemoved ******/
		/****** md5 signature: 1f7754be1a6483911c8c9a17053ce192 ******/
		%feature("compactdefaultargs") HasRemoved;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns 'true' if there any removed shapes present.
") HasRemoved;
		Standard_Boolean HasRemoved();

		/****** BRepTools_History::IsRemoved ******/
		/****** md5 signature: bc824baa664531040b00c34aff9af72f ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theInitial: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns 'true' if the shape is removed.
") IsRemoved;
		Standard_Boolean IsRemoved(const TopoDS_Shape & theInitial);

		/****** BRepTools_History::IsSupportedType ******/
		/****** md5 signature: 3c207fad38f59a2d3b9937a047c347e9 ******/
		%feature("compactdefaultargs") IsSupportedType;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns 'true' if the type of the shape is supported by the history.
") IsSupportedType;
		static Standard_Boolean IsSupportedType(const TopoDS_Shape & theShape);

		/****** BRepTools_History::Merge ******/
		/****** md5 signature: fb045f600989a1f096e90b81d587d65a ******/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "
Parameters
----------
theHistory23: BRepTools_History

Return
-------
None

Description
-----------
A method to merge a next history to this history. Merges the next history to this history.
") Merge;
		void Merge(const opencascade::handle<BRepTools_History> & theHistory23);

		/****** BRepTools_History::Merge ******/
		/****** md5 signature: bcea4b93e38784928b17c2d0cc2cf68c ******/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "
Parameters
----------
theHistory23: BRepTools_History

Return
-------
None

Description
-----------
Merges the next history to this history.
") Merge;
		void Merge(const BRepTools_History & theHistory23);

		/****** BRepTools_History::Modified ******/
		/****** md5 signature: ea431397963162255277d1bdbac78ef8 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
theInitial: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns all shapes modified from the shape.
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & theInitial);

		/****** BRepTools_History::Remove ******/
		/****** md5 signature: a8343648976f365b1287e3131759ecb4 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theRemoved: TopoDS_Shape

Return
-------
None

Description
-----------
Set the shape as removed one.
") Remove;
		void Remove(const TopoDS_Shape & theRemoved);

		/****** BRepTools_History::ReplaceGenerated ******/
		/****** md5 signature: 25c9bb6bb06d4ed50a5e744f0c6faf57 ******/
		%feature("compactdefaultargs") ReplaceGenerated;
		%feature("autodoc", "
Parameters
----------
theInitial: TopoDS_Shape
theGenerated: TopoDS_Shape

Return
-------
None

Description
-----------
Set the second shape as the only generated one from the first one.
") ReplaceGenerated;
		void ReplaceGenerated(const TopoDS_Shape & theInitial, const TopoDS_Shape & theGenerated);

		/****** BRepTools_History::ReplaceModified ******/
		/****** md5 signature: ac9575b491e5181e9890ae4864af94fd ******/
		%feature("compactdefaultargs") ReplaceModified;
		%feature("autodoc", "
Parameters
----------
theInitial: TopoDS_Shape
theModified: TopoDS_Shape

Return
-------
None

Description
-----------
Set the second shape as the only modified one from the first one.
") ReplaceModified;
		void ReplaceModified(const TopoDS_Shape & theInitial, const TopoDS_Shape & theModified);

};


%make_alias(BRepTools_History)

%extend BRepTools_History {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_Modification *
*******************************/
%nodefaultctor BRepTools_Modification;
class BRepTools_Modification : public Standard_Transient {
	public:
		/****** BRepTools_Modification::Continuity ******/
		/****** md5 signature: 327dab83ea17f6338d19fb9f7a784f74 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of <NewE> between <NewF1> and <NewF2>. <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
") Continuity;
		virtual GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****** BRepTools_Modification::NewCurve ******/
		/****** md5 signature: e731ccfa98ea2d1f88ad9904cdb8580b ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Returns true if the edge, E, has been modified. If the edge has been modified: - C is the new geometry associated with the edge, - L is its new location, and - Tol is the new tolerance. If the edge has not been modified, this function returns false, and the values of C, L and Tol are not significant.
") NewCurve;
		virtual Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** BRepTools_Modification::NewCurve2d ******/
		/****** md5 signature: 0af12e9360877e2b67306368eb4ae813 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: float

Description
-----------
Returns true if the edge, E, has a new curve on surface on the face, F. If a new curve exists: - C is the new geometry of the edge, - L is the new location, and - Tol is the new tolerance. NewE is the new edge created from E, and NewF is the new face created from F. If there is no new curve on the face, this function returns false, and the values of C, L and Tol are not significant.
") NewCurve2d;
		virtual Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** BRepTools_Modification::NewParameter ******/
		/****** md5 signature: 0c5e9b0fefa1a6f700191b9504565426 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Returns true if the vertex V has a new parameter on the edge E. If a new parameter exists: - P is the parameter, and - Tol is the new tolerance. If there is no new parameter this function returns false, and the values of P and Tol are not significant.
") NewParameter;
		virtual Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools_Modification::NewPoint ******/
		/****** md5 signature: 2fb046cddcce6758637c814e34a55748 ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Returns true if the vertex V has been modified. If V has been modified: - P is the new geometry of the vertex, and - Tol is the new tolerance. If the vertex has not been modified this function returns false, and the values of P and Tol are not significant.
") NewPoint;
		virtual Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** BRepTools_Modification::NewPolygon ******/
		/****** md5 signature: b0c2343155499ca0843ae489f5327afa ******/
		%feature("compactdefaultargs") NewPolygon;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon. If the edge has been modified: - P is a new polygon.
") NewPolygon;
		virtual Standard_Boolean NewPolygon(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon3D> & P);

		/****** BRepTools_Modification::NewPolygonOnTriangulation ******/
		/****** md5 signature: 08792ffffa027e5d1a6d02cffa1e25ed ******/
		%feature("compactdefaultargs") NewPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
P: Poly_PolygonOnTriangulation

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon on triangulation. If the edge has been modified: - P is a new polygon on triangulation.
") NewPolygonOnTriangulation;
		virtual Standard_Boolean NewPolygonOnTriangulation(const TopoDS_Edge & E, const TopoDS_Face & F, opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****** BRepTools_Modification::NewSurface ******/
		/****** md5 signature: dd73e38c6b05808e5cd8b3f3a16d1622 ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Returns true if the face, F, has been modified. If the face has been modified: - S is the new geometry of the face, - L is its new location, and - Tol is the new tolerance. The flag, RevWires, is set to true when the modification reverses the normal of the surface, (i.e. the wires have to be reversed). The flag, RevFace, is set to true if the orientation of the modified face changes in the shells which contain it. If the face has not been modified this function returns false, and the values of S, L, Tol, RevWires and RevFace are not significant.
") NewSurface;
		virtual Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepTools_Modification::NewTriangulation ******/
		/****** md5 signature: f0901b76e1a62f62904c45437e3ce1ec ******/
		%feature("compactdefaultargs") NewTriangulation;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
T: Poly_Triangulation

Return
-------
bool

Description
-----------
Returns true if the face has been modified according to changed triangulation. If the face has been modified: - T is a new triangulation on the face.
") NewTriangulation;
		virtual Standard_Boolean NewTriangulation(const TopoDS_Face & F, opencascade::handle<Poly_Triangulation> & T);

};


%make_alias(BRepTools_Modification)

%extend BRepTools_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepTools_Modifier *
***************************/
class BRepTools_Modifier {
	public:
		class NewCurveInfo {};
		class NewSurfaceInfo {};
		/****** BRepTools_Modifier::BRepTools_Modifier ******/
		/****** md5 signature: b7f2e5942eb530b143535b1aab4117b4 ******/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "
Parameters
----------
theMutableInput: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates an empty Modifier.
") BRepTools_Modifier;
		 BRepTools_Modifier(Standard_Boolean theMutableInput = Standard_False);

		/****** BRepTools_Modifier::BRepTools_Modifier ******/
		/****** md5 signature: 584542a473e07d531ee3f85adf59a3c0 ******/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates a modifier on the shape <S>.
") BRepTools_Modifier;
		 BRepTools_Modifier(const TopoDS_Shape & S);

		/****** BRepTools_Modifier::BRepTools_Modifier ******/
		/****** md5 signature: e44fe225e6258049e6038d3b00ddfe6a ******/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
M: BRepTools_Modification

Return
-------
None

Description
-----------
Creates a modifier on the shape <S>, and performs the modifications described by <M>.
") BRepTools_Modifier;
		 BRepTools_Modifier(const TopoDS_Shape & S, const opencascade::handle<BRepTools_Modification> & M);

		/****** BRepTools_Modifier::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the modifier with the shape <S>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** BRepTools_Modifier::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if the modification has been computed successfully.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepTools_Modifier::IsMutableInput ******/
		/****** md5 signature: 2df16e5a957577cfce65832aa2d90512 ******/
		%feature("compactdefaultargs") IsMutableInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the current mutable input state.
") IsMutableInput;
		Standard_Boolean IsMutableInput();

		/****** BRepTools_Modifier::ModifiedShape ******/
		/****** md5 signature: 545825cbb62be8a9e387c35da6258fdd ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape corresponding to <S>.
") ModifiedShape;
		const TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****** BRepTools_Modifier::Perform ******/
		/****** md5 signature: b63519215f9ace048cd4db5238b4ba74 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
M: BRepTools_Modification
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the modifications described by <M>.
") Perform;
		void Perform(const opencascade::handle<BRepTools_Modification> & M, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_Modifier::SetMutableInput ******/
		/****** md5 signature: 6c32097d8325b4484ad8639e59aae59a ******/
		%feature("compactdefaultargs") SetMutableInput;
		%feature("autodoc", "
Parameters
----------
theMutableInput: bool

Return
-------
None

Description
-----------
Sets the mutable input state If true then the input (original) shape can be modified during modification process.
") SetMutableInput;
		void SetMutableInput(Standard_Boolean theMutableInput);

};


%extend BRepTools_Modifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepTools_PurgeLocations *
*********************************/
class BRepTools_PurgeLocations {
	public:
		/****** BRepTools_PurgeLocations::BRepTools_PurgeLocations ******/
		/****** md5 signature: 9513db51b5a43ee1b3299e06ca1ed72b ******/
		%feature("compactdefaultargs") BRepTools_PurgeLocations;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepTools_PurgeLocations;
		 BRepTools_PurgeLocations();

		/****** BRepTools_PurgeLocations::GetResult ******/
		/****** md5 signature: 644080adee2e79b6fe88d2909c00da36 ******/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns shape with removed locations.
") GetResult;
		const TopoDS_Shape GetResult();

		/****** BRepTools_PurgeLocations::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepTools_PurgeLocations::Perform ******/
		/****** md5 signature: 786dd7c6d1fd4e873da2af6e25b6f283 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Removes all locations correspondingly to criterium from theShape.
") Perform;
		Standard_Boolean Perform(const TopoDS_Shape & theShape);

};


%extend BRepTools_PurgeLocations {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ModifiedShape(self):
		pass
	}
};

/************************
* class BRepTools_Quilt *
************************/
class BRepTools_Quilt {
	public:
		/****** BRepTools_Quilt::BRepTools_Quilt ******/
		/****** md5 signature: 0d7bfddd3eabfea30683c76c0547365b ******/
		%feature("compactdefaultargs") BRepTools_Quilt;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepTools_Quilt;
		 BRepTools_Quilt();

		/****** BRepTools_Quilt::Add ******/
		/****** md5 signature: e50695db6dd8df4df414a026111dbdd9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Add the faces of <S> to the Quilt, the faces containing bounded edges are copied.
") Add;
		void Add(const TopoDS_Shape & S);

		/****** BRepTools_Quilt::Bind ******/
		/****** md5 signature: ec618fc1d65b8960608254ca79c51ea1 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
Eold: TopoDS_Edge
Enew: TopoDS_Edge

Return
-------
None

Description
-----------
Binds <Enew> to be the new edge instead of <Eold>. //! The faces of the added shape containing <Eold> will be copied to substitute <Eold> by <Enew>. //! The vertices of <Eold> will be bound to the vertices of <Enew> with the same orientation. //! If <Eold> and <Enew> have different orientations the curves are considered to be opposite and the pcurves of <Eold> will be copied and reversed in the new faces. //! <Eold> must belong to the next added shape, <Enew> must belong to a Shape added before.
") Bind;
		void Bind(const TopoDS_Edge & Eold, const TopoDS_Edge & Enew);

		/****** BRepTools_Quilt::Bind ******/
		/****** md5 signature: e5a47ea3d24dd96178dafba218ae9801 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
Vold: TopoDS_Vertex
Vnew: TopoDS_Vertex

Return
-------
None

Description
-----------
Binds <VNew> to be a new vertex instead of <Vold>. //! The faces of the added shape containing <Vold> will be copied to substitute <Vold> by <Vnew>.
") Bind;
		void Bind(const TopoDS_Vertex & Vold, const TopoDS_Vertex & Vnew);

		/****** BRepTools_Quilt::Copy ******/
		/****** md5 signature: e9cf9778b56b3dc4375f50a8fb82f016 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape substituted to <S> in the Quilt.
") Copy;
		const TopoDS_Shape Copy(const TopoDS_Shape & S);

		/****** BRepTools_Quilt::IsCopied ******/
		/****** md5 signature: 700aa9864844136ce24021c380aa2705 ******/
		%feature("compactdefaultargs") IsCopied;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns True if <S> has been copied (<S> is a vertex, an edge or a face).
") IsCopied;
		Standard_Boolean IsCopied(const TopoDS_Shape & S);

		/****** BRepTools_Quilt::Shells ******/
		/****** md5 signature: 9d6052389d3b198b83d490121f90cf0d ******/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a Compound of shells made from the current set of faces. The shells will be flagged as closed or not closed.
") Shells;
		TopoDS_Shape Shells();

};


%extend BRepTools_Quilt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepTools_ReShape *
**************************/
class BRepTools_ReShape : public Standard_Transient {
	public:
		class TReplacement {};
		/****** BRepTools_ReShape::BRepTools_ReShape ******/
		/****** md5 signature: aa9561a4d5bc7ab12692c5c25b0f20fb ******/
		%feature("compactdefaultargs") BRepTools_ReShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty Reshape.
") BRepTools_ReShape;
		 BRepTools_ReShape();

		/****** BRepTools_ReShape::Apply ******/
		/****** md5 signature: 48965752374805b76b32c4d1ffbb713b ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theUntil: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
TopoDS_Shape

Description
-----------
Applies the substitutions requests to a shape. //! theUntil gives the level of type until which requests are taken into account. For subshapes of the type <until> no rebuild and further exploring are done. //! NOTE: each subshape can be replaced by shape of the same type or by shape containing only shapes of that type (for example, TopoDS_Edge can be replaced by TopoDS_Edge, TopoDS_Wire or TopoDS_Compound containing TopoDS_Edges). If incompatible shape type is encountered, it is ignored and flag FAIL1 is set in Status.
") Apply;
		virtual TopoDS_Shape Apply(const TopoDS_Shape & theShape, const TopAbs_ShapeEnum theUntil = TopAbs_SHAPE);

		/****** BRepTools_ReShape::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all substitutions requests.
") Clear;
		virtual void Clear();

		/****** BRepTools_ReShape::CopyVertex ******/
		/****** md5 signature: 838d38640335aa32a1ea9ebb59e57f7b ******/
		%feature("compactdefaultargs") CopyVertex;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theTol: float (optional, default to -1.0)

Return
-------
TopoDS_Vertex

Description
-----------
Returns modified copy of vertex if original one is not recorded or returns modified original vertex otherwise.
") CopyVertex;
		TopoDS_Vertex CopyVertex(const TopoDS_Vertex & theV, const Standard_Real theTol = -1.0);

		/****** BRepTools_ReShape::CopyVertex ******/
		/****** md5 signature: fdb0a72ad6a04ff2d668de1e997a5b36 ******/
		%feature("compactdefaultargs") CopyVertex;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theNewPos: gp_Pnt
aTol: float

Return
-------
TopoDS_Vertex

Description
-----------
Returns modified copy of vertex if original one is not recorded or returns modified original vertex otherwise.
") CopyVertex;
		TopoDS_Vertex CopyVertex(const TopoDS_Vertex & theV, const gp_Pnt & theNewPos, const Standard_Real aTol);

		/****** BRepTools_ReShape::History ******/
		/****** md5 signature: e896eaef669d2669cca4958a811f4ae5 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
Returns the history of the substituted shapes.
") History;
		opencascade::handle<BRepTools_History> History();

		/****** BRepTools_ReShape::IsNewShape ******/
		/****** md5 signature: 8bc75716e49666835740977e4499fb70 ******/
		%feature("compactdefaultargs") IsNewShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks if shape has been recorded by reshaper as a value.
") IsNewShape;
		Standard_Boolean IsNewShape(const TopoDS_Shape & theShape);

		/****** BRepTools_ReShape::IsRecorded ******/
		/****** md5 signature: c1ee5aa687f1d8b624ca216fb43759f0 ******/
		%feature("compactdefaultargs") IsRecorded;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Tells if a shape is recorded for Replace/Remove.
") IsRecorded;
		virtual Standard_Boolean IsRecorded(const TopoDS_Shape & shape);

		/****** BRepTools_ReShape::ModeConsiderLocation ******/
		/****** md5 signature: 39137eddab476802cb299ec6bc783168 ******/
		%feature("compactdefaultargs") ModeConsiderLocation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether Location of shape take into account during replacing shapes.
") ModeConsiderLocation;
		virtual Standard_Boolean & ModeConsiderLocation();

		/****** BRepTools_ReShape::Remove ******/
		/****** md5 signature: 5e9c4c0797baa65786d2ea2540e5d010 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets a request to Remove a Shape whatever the orientation.
") Remove;
		virtual void Remove(const TopoDS_Shape & shape);

		/****** BRepTools_ReShape::Replace ******/
		/****** md5 signature: 1fac527602005e8dc4ab218205bef2c0 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
newshape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets a request to Replace a Shape by a new one.
") Replace;
		virtual void Replace(const TopoDS_Shape & shape, const TopoDS_Shape & newshape);

		/****** BRepTools_ReShape::Status ******/
		/****** md5 signature: ecedd5404c4720d2ba941edafa6ac006 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
newsh: TopoDS_Shape
last: bool (optional, default to Standard_False)

Return
-------
int

Description
-----------
Returns a complete substitution status for a shape 0: not recorded, <newsh> = original <shape> < 0: to be removed, <newsh> is NULL > 0: to be replaced, <newsh> is a new item If <last> is False, returns status and new shape recorded in the map directly for the shape, if True and status > 0 then recursively searches for the last status and new shape.
") Status;
		virtual Standard_Integer Status(const TopoDS_Shape & shape, TopoDS_Shape & newsh, const Standard_Boolean last = Standard_False);

		/****** BRepTools_ReShape::Value ******/
		/****** md5 signature: 1e40f89fc51e3c423fbe545e07ca6a4f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the new value for an individual shape If not recorded, returns the original shape itself If to be Removed, returns a Null Shape Else, returns the replacing item.
") Value;
		virtual TopoDS_Shape Value(const TopoDS_Shape & shape);

};


%make_alias(BRepTools_ReShape)

%extend BRepTools_ReShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepTools_ShapeSet *
***************************/
class BRepTools_ShapeSet : public TopTools_ShapeSet {
	public:
		/****** BRepTools_ShapeSet::BRepTools_ShapeSet ******/
		/****** md5 signature: 4d2cf984c56b6805e641ce99645be1bb ******/
		%feature("compactdefaultargs") BRepTools_ShapeSet;
		%feature("autodoc", "
Parameters
----------
theWithTriangles: bool (optional, default to Standard_True)
theWithNormals: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds an empty ShapeSet. 
Parameter theWithTriangles flag to write triangulation data.
") BRepTools_ShapeSet;
		 BRepTools_ShapeSet(const Standard_Boolean theWithTriangles = Standard_True, const Standard_Boolean theWithNormals = Standard_False);

		/****** BRepTools_ShapeSet::BRepTools_ShapeSet ******/
		/****** md5 signature: b9669c92273c65400f84c106bd21ec2f ******/
		%feature("compactdefaultargs") BRepTools_ShapeSet;
		%feature("autodoc", "
Parameters
----------
theBuilder: BRep_Builder
theWithTriangles: bool (optional, default to Standard_True)
theWithNormals: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds an empty ShapeSet. 
Parameter theWithTriangles flag to write triangulation data.
") BRepTools_ShapeSet;
		 BRepTools_ShapeSet(const BRep_Builder & theBuilder, const Standard_Boolean theWithTriangles = Standard_True, const Standard_Boolean theWithNormals = Standard_False);

		/****** BRepTools_ShapeSet::AddGeometry ******/
		/****** md5 signature: 31352593ecfcc12beb7b28447eee7b70 ******/
		%feature("compactdefaultargs") AddGeometry;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Stores the geometry of <S>.
") AddGeometry;
		virtual void AddGeometry(const TopoDS_Shape & S);

		/****** BRepTools_ShapeSet::AddShapes ******/
		/****** md5 signature: c04ea93dd727f553f9a7d57810d34b97 ******/
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
Inserts the shape <S2> in the shape <S1>. This method must be redefined to use the correct builder.
") AddShapes;
		virtual void AddShapes(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** BRepTools_ShapeSet::Check ******/
		/****** md5 signature: 41cb0f904ceceb5af010cc64bc1f91df ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Check;
		virtual void Check(const TopAbs_ShapeEnum T, TopoDS_Shape & S);

		/****** BRepTools_ShapeSet::Clear ******/
		/****** md5 signature: f671931d03948860d0ead34afbe920aa ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		virtual void Clear();

		/****** BRepTools_ShapeSet::DumpGeometry ******/
		/****** md5 signature: 8a10297a2e0a44206d544cf3208c2ebd ******/
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the geometry of me on the stream <OS>.
") DumpGeometry;
		virtual void DumpGeometry(std::ostream &OutValue);

		/****** BRepTools_ShapeSet::DumpGeometry ******/
		/****** md5 signature: 441eb2169ad0b3222fe794ba8ea21d05 ******/
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the geometry of <S> on the stream <OS>.
") DumpGeometry;
		virtual void DumpGeometry(const TopoDS_Shape & S, std::ostream &OutValue);

		/****** BRepTools_ShapeSet::DumpPolygon3D ******/
		/****** md5 signature: d71dc2828833ae37d1fdf2e355dbb1b6 ******/
		%feature("compactdefaultargs") DumpPolygon3D;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the 3d polygons on the stream <OS>.
") DumpPolygon3D;
		void DumpPolygon3D(std::ostream &OutValue);

		/****** BRepTools_ShapeSet::DumpPolygonOnTriangulation ******/
		/****** md5 signature: ebede4d5757370c7f0a77e3b47b20ea8 ******/
		%feature("compactdefaultargs") DumpPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the polygons on triangulation on the stream <OS>.
") DumpPolygonOnTriangulation;
		void DumpPolygonOnTriangulation(std::ostream &OutValue);

		/****** BRepTools_ShapeSet::DumpTriangulation ******/
		/****** md5 signature: 573377e15caf72db43c4f0909c6d6c4b ******/
		%feature("compactdefaultargs") DumpTriangulation;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the triangulation on the stream <OS>.
") DumpTriangulation;
		void DumpTriangulation(std::ostream &OutValue);

		/****** BRepTools_ShapeSet::IsWithNormals ******/
		/****** md5 signature: 49f5baecd893691e08f163fb559d8b06 ******/
		%feature("compactdefaultargs") IsWithNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored triangulation with normals.
") IsWithNormals;
		Standard_Boolean IsWithNormals();

		/****** BRepTools_ShapeSet::IsWithTriangles ******/
		/****** md5 signature: 2adacf1f8e5d4c926108b4db84751e9a ******/
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored with triangles.
") IsWithTriangles;
		Standard_Boolean IsWithTriangles();

		/****** BRepTools_ShapeSet::ReadGeometry ******/
		/****** md5 signature: 29982a86f8628bd19687b88946d88b2b ******/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the geometry of me from the stream <IS>.
") ReadGeometry;
		virtual void ReadGeometry(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_ShapeSet::ReadGeometry ******/
		/****** md5 signature: aec2489bee709d857b09eddd7a62d272 ******/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum
IS: str
S: TopoDS_Shape

Return
-------
None

Description
-----------
Reads the geometry of a shape of type <T> from the stream <IS> and returns it in <S>.
") ReadGeometry;
		virtual void ReadGeometry(const TopAbs_ShapeEnum T, std::istream & IS, TopoDS_Shape & S);

		/****** BRepTools_ShapeSet::ReadPolygon3D ******/
		/****** md5 signature: e637370098b2bac74ea2ad781985457f ******/
		%feature("compactdefaultargs") ReadPolygon3D;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the 3d polygons of me from the stream <IS>.
") ReadPolygon3D;
		void ReadPolygon3D(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_ShapeSet::ReadPolygonOnTriangulation ******/
		/****** md5 signature: 8c589d9572a02a58a24994948b7ca837 ******/
		%feature("compactdefaultargs") ReadPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the polygons on triangulation of me from the stream <IS>.
") ReadPolygonOnTriangulation;
		void ReadPolygonOnTriangulation(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_ShapeSet::ReadTriangulation ******/
		/****** md5 signature: 2c884f46fbe1934a9efd5f890623beee ******/
		%feature("compactdefaultargs") ReadTriangulation;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the triangulation of me from the stream <IS>.
") ReadTriangulation;
		void ReadTriangulation(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_ShapeSet::SetWithNormals ******/
		/****** md5 signature: 9f03f91e56766f46bd17d99a089a0a21 ******/
		%feature("compactdefaultargs") SetWithNormals;
		%feature("autodoc", "
Parameters
----------
theWithNormals: bool

Return
-------
None

Description
-----------
Define if shape will be stored triangulation with normals. Ignored (always written) if face defines only triangulation (no surface).
") SetWithNormals;
		void SetWithNormals(const Standard_Boolean theWithNormals);

		/****** BRepTools_ShapeSet::SetWithTriangles ******/
		/****** md5 signature: 7b7f7b1dd0aaac0992d59e75b5df79e1 ******/
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "
Parameters
----------
theWithTriangles: bool

Return
-------
None

Description
-----------
Define if shape will be stored with triangles. Ignored (always written) if face defines only triangulation (no surface).
") SetWithTriangles;
		void SetWithTriangles(const Standard_Boolean theWithTriangles);

		/****** BRepTools_ShapeSet::WriteGeometry ******/
		/****** md5 signature: 4f112c9f4ab0e11dc4ef39084df9e9d4 ******/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the geometry of me on the stream <OS> in a format that can be read back by Read.
") WriteGeometry;
		virtual void WriteGeometry(std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_ShapeSet::WriteGeometry ******/
		/****** md5 signature: ce5d0a3d33cc100dd52fd3b965ea1743 ******/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Writes the geometry of <S> on the stream <OS> in a format that can be read back by Read.
") WriteGeometry;
		virtual void WriteGeometry(const TopoDS_Shape & S, std::ostream &OutValue);

		/****** BRepTools_ShapeSet::WritePolygon3D ******/
		/****** md5 signature: adec09c9b52ff86073162dcfc4f3bda4 ******/
		%feature("compactdefaultargs") WritePolygon3D;
		%feature("autodoc", "
Parameters
----------
Compact: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the 3d polygons on the stream <OS> in a format that can be read back by Read.
") WritePolygon3D;
		void WritePolygon3D(std::ostream &OutValue, const Standard_Boolean Compact = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_ShapeSet::WritePolygonOnTriangulation ******/
		/****** md5 signature: b6577cbf6cdb2bc0baa774f88dfd3418 ******/
		%feature("compactdefaultargs") WritePolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
Compact: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the polygons on triangulation on the stream <OS> in a format that can be read back by Read.
") WritePolygonOnTriangulation;
		void WritePolygonOnTriangulation(std::ostream &OutValue, const Standard_Boolean Compact = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepTools_ShapeSet::WriteTriangulation ******/
		/****** md5 signature: 63a7d12f83f3bef281e1178d99ed272d ******/
		%feature("compactdefaultargs") WriteTriangulation;
		%feature("autodoc", "
Parameters
----------
Compact: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the triangulation on the stream <OS> in a format that can be read back by Read.
") WriteTriangulation;
		void WriteTriangulation(std::ostream &OutValue, const Standard_Boolean Compact = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());


                    %feature("autodoc", "Serializes TopoDS_Shape to string. If full_precision is False, the default precision of std::stringstream is used which regularly causes rounding.") WriteToString;
                    %extend{
                        static std::string WriteToString(const TopoDS_Shape & shape, bool full_precision = true) {
                        std::stringstream s;
                        if(full_precision) {
                            s.precision(17);
                            s.setf(std::ios::scientific);
                        }
                        BRepTools::Write(shape, s);
                        return s.str();}
                    };
                    %feature("autodoc", "Deserializes TopoDS_Shape from string") ReadFromString;
                    %extend{
                        static TopoDS_Shape ReadFromString(const std::string & src) {
                        std::stringstream s(src);
                        TopoDS_Shape shape;
                        BRep_Builder b;
                        BRepTools::Read(shape, s, b);
                        return shape;}
                    };
            };


%extend BRepTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_Substitution *
*******************************/
class BRepTools_Substitution {
	public:
		/****** BRepTools_Substitution::BRepTools_Substitution ******/
		/****** md5 signature: a93abe08e3dbab886a3e597a2409bb79 ******/
		%feature("compactdefaultargs") BRepTools_Substitution;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepTools_Substitution;
		 BRepTools_Substitution();

		/****** BRepTools_Substitution::Build ******/
		/****** md5 signature: 81af4c8bd81bf79c30f34ea72f3743c3 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Build NewShape from <S> if its subshapes has modified. //! The methods <IsCopied> and <Copy> allows you to keep the resul of <Build>.
") Build;
		void Build(const TopoDS_Shape & S);

		/****** BRepTools_Substitution::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset all the fields.
") Clear;
		void Clear();

		/****** BRepTools_Substitution::Copy ******/
		/****** md5 signature: 58a8930506a5b25067aaf63bebb04b61 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the set of shapes substituted to <S>.
") Copy;
		const TopTools_ListOfShape & Copy(const TopoDS_Shape & S);

		/****** BRepTools_Substitution::IsCopied ******/
		/****** md5 signature: 700aa9864844136ce24021c380aa2705 ******/
		%feature("compactdefaultargs") IsCopied;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns True if <S> has been replaced .
") IsCopied;
		Standard_Boolean IsCopied(const TopoDS_Shape & S);

		/****** BRepTools_Substitution::Substitute ******/
		/****** md5 signature: a4cbae62f6a963c3eab0e606e98de3c2 ******/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "
Parameters
----------
OldShape: TopoDS_Shape
NewShapes: TopTools_ListOfShape

Return
-------
None

Description
-----------
<Oldshape> will be replaced by <NewShapes>. //! <NewShapes> can be empty , in this case <OldShape> will disparate from its ancestors. //! if an item of <NewShapes> is oriented FORWARD. it will be oriented as <OldShape> in its ancestors. else it will be reversed.
") Substitute;
		void Substitute(const TopoDS_Shape & OldShape, const TopTools_ListOfShape & NewShapes);

};


%extend BRepTools_Substitution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_WireExplorer *
*******************************/
class BRepTools_WireExplorer {
	public:
		/****** BRepTools_WireExplorer::BRepTools_WireExplorer ******/
		/****** md5 signature: c01ce9eb3dd0f911d033ede7ab166cc9 ******/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty explorer (which can be initialized using Init).
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer();

		/****** BRepTools_WireExplorer::BRepTools_WireExplorer ******/
		/****** md5 signature: 12a015d52386240d1135d923827c579a ******/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
IInitializes an exploration of the wire <W>.
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer(const TopoDS_Wire & W);

		/****** BRepTools_WireExplorer::BRepTools_WireExplorer ******/
		/****** md5 signature: 71491b0c48a6d7a95f0181294fd0f36b ******/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Return
-------
None

Description
-----------
Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>.
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****** BRepTools_WireExplorer::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the explorer.
") Clear;
		void Clear();

		/****** BRepTools_WireExplorer::Current ******/
		/****** md5 signature: 13d38f330bd5edb3fa9d2a05a41adda5 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the current edge.
") Current;
		const TopoDS_Edge Current();

		/****** BRepTools_WireExplorer::CurrentVertex ******/
		/****** md5 signature: b76f05d6c3d7cad0ee0de4c1edcf342b ******/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex connecting the current edge to the previous one.
") CurrentVertex;
		const TopoDS_Vertex CurrentVertex();

		/****** BRepTools_WireExplorer::Init ******/
		/****** md5 signature: 1b008bb762428c969d10a2c51ed2db58 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Initializes an exploration of the wire <W>.
") Init;
		void Init(const TopoDS_Wire & W);

		/****** BRepTools_WireExplorer::Init ******/
		/****** md5 signature: 3e8360537c94fa55830ac518b5a25259 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Return
-------
None

Description
-----------
Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>.
") Init;
		void Init(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****** BRepTools_WireExplorer::Init ******/
		/****** md5 signature: a0834e948e42cf446078176bb382a7e5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>. <UMIn>, <UMax>, <VMin>, <VMax> - the UV bounds of the face <F>.
") Init;
		void Init(const TopoDS_Wire & W, const TopoDS_Face & F, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepTools_WireExplorer::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current edge.
") More;
		Standard_Boolean More();

		/****** BRepTools_WireExplorer::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Proceeds to the next edge.
") Next;
		void Next();

		/****** BRepTools_WireExplorer::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns an Orientation for the current edge.
") Orientation;
		TopAbs_Orientation Orientation();

};


%extend BRepTools_WireExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepTools_CopyModification *
***********************************/
class BRepTools_CopyModification : public BRepTools_Modification {
	public:
		/****** BRepTools_CopyModification::BRepTools_CopyModification ******/
		/****** md5 signature: dc62d9d01ecf0817e4b2bc548f32af61 ******/
		%feature("compactdefaultargs") BRepTools_CopyModification;
		%feature("autodoc", "
Parameters
----------
theCopyGeom: bool (optional, default to Standard_True)
theCopyMesh: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor. \param[in] theCopyGeom indicates that the geometry (surfaces and curves) should be copied \param[in] theCopyMesh indicates that the triangulation should be copied.
") BRepTools_CopyModification;
		 BRepTools_CopyModification(const Standard_Boolean theCopyGeom = Standard_True, const Standard_Boolean theCopyMesh = Standard_True);

		/****** BRepTools_CopyModification::Continuity ******/
		/****** md5 signature: 2c4d2ed85cbf31d94ccd5731f137e724 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theNewEdge: TopoDS_Edge
theNewFace1: TopoDS_Face
theNewFace2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of theNewEdge between theNewFace1 and theNewFace2. //! theNewEdge is the new edge created from theEdge. theNewFace1 (resp. theNewFace2) is the new face created from theFace1 (resp. theFace2).
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const TopoDS_Edge & theNewEdge, const TopoDS_Face & theNewFace1, const TopoDS_Face & theNewFace2);

		/****** BRepTools_CopyModification::NewCurve ******/
		/****** md5 signature: c3400f68c675ff3dd16614251d9da49c ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
theLoc: TopLoc_Location

Return
-------
theTol: float

Description
-----------
Returns true if theEdge has been modified. If the edge has been modified: - theCurve is the new geometric support of the edge, - theLoc is the new location, and - theTol is the new tolerance. If the edge has not been modified, this function returns false, and the values of theCurve, theLoc and theTol are not significant.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, TopLoc_Location & theLoc, Standard_Real &OutValue);

		/****** BRepTools_CopyModification::NewCurve2d ******/
		/****** md5 signature: 12d59de8232d43bec7de37a5392a1df4 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theNewEdge: TopoDS_Edge
theNewFace: TopoDS_Face
theCurve: Geom2d_Curve

Return
-------
theTol: float

Description
-----------
Returns true if theEdge has a new curve on surface on theFace. If a new curve exists: - theCurve is the new geometric support of the edge, - theTol the new tolerance. If no new curve exists, this function returns false, and the values of theCurve and theTol are not significant.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, const TopoDS_Edge & theNewEdge, const TopoDS_Face & theNewFace, opencascade::handle<Geom2d_Curve> & theCurve, Standard_Real &OutValue);

		/****** BRepTools_CopyModification::NewParameter ******/
		/****** md5 signature: 54289ac8d83b6313663826ffc529a180 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
theVertex: TopoDS_Vertex
theEdge: TopoDS_Edge

Return
-------
thePnt: float
theTol: float

Description
-----------
Returns true if theVertex has a new parameter on theEdge. If a new parameter exists: - thePnt is the parameter, and - theTol is the new tolerance. If no new parameter exists, this function returns false, and the values of thePnt and theTol are not significant.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & theVertex, const TopoDS_Edge & theEdge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools_CopyModification::NewPoint ******/
		/****** md5 signature: a51d29c30c50c9cb108e5c5ea9b12a8b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
theVertex: TopoDS_Vertex
thePnt: gp_Pnt

Return
-------
theTol: float

Description
-----------
Returns true if theVertex has been modified. If the vertex has been modified: - thePnt is the new geometry of the vertex, and - theTol is the new tolerance. If the vertex has not been modified this function returns false, and the values of thePnt and theTol are not significant.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & theVertex, gp_Pnt & thePnt, Standard_Real &OutValue);

		/****** BRepTools_CopyModification::NewPolygon ******/
		/****** md5 signature: 4badeef9050bef8cef3639edbc9b0271 ******/
		%feature("compactdefaultargs") NewPolygon;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePoly: Poly_Polygon3D

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon. If the edge has been modified: - thePoly is a new polygon.
") NewPolygon;
		Standard_Boolean NewPolygon(const TopoDS_Edge & theEdge, opencascade::handle<Poly_Polygon3D> & thePoly);

		/****** BRepTools_CopyModification::NewPolygonOnTriangulation ******/
		/****** md5 signature: 362332d5c0a2020b059e4552360631f4 ******/
		%feature("compactdefaultargs") NewPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
thePoly: Poly_PolygonOnTriangulation

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon on triangulation. If the edge has been modified: - thePoly is a new polygon on triangulation.
") NewPolygonOnTriangulation;
		Standard_Boolean NewPolygonOnTriangulation(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, opencascade::handle<Poly_PolygonOnTriangulation> & thePoly);

		/****** BRepTools_CopyModification::NewSurface ******/
		/****** md5 signature: 005f5309703e67a2221655e2f7ff6568 ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theSurf: Geom_Surface
theLoc: TopLoc_Location

Return
-------
theTol: float
theRevWires: bool
theRevFace: bool

Description
-----------
Returns true if theFace has been modified. If the face has been modified: - theSurf is the new geometry of the face, - theLoc is its new location, and - theTol is the new tolerance. theRevWires, theRevFace are always set to false, because the orientation is not changed.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & theFace, opencascade::handle<Geom_Surface> & theSurf, TopLoc_Location & theLoc, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepTools_CopyModification::NewTriangulation ******/
		/****** md5 signature: c34f0504d87cfa075d0a16293a0a824a ******/
		%feature("compactdefaultargs") NewTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTri: Poly_Triangulation

Return
-------
bool

Description
-----------
Returns true if the face has been modified according to changed triangulation. If the face has been modified: - theTri is a new triangulation on the face.
") NewTriangulation;
		Standard_Boolean NewTriangulation(const TopoDS_Face & theFace, opencascade::handle<Poly_Triangulation> & theTri);

};


%make_alias(BRepTools_CopyModification)

%extend BRepTools_CopyModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepTools_GTrsfModification *
************************************/
class BRepTools_GTrsfModification : public BRepTools_Modification {
	public:
		/****** BRepTools_GTrsfModification::BRepTools_GTrsfModification ******/
		/****** md5 signature: f443bf58acd21d37a3040336d9faf5f2 ******/
		%feature("compactdefaultargs") BRepTools_GTrsfModification;
		%feature("autodoc", "
Parameters
----------
T: gp_GTrsf

Return
-------
None

Description
-----------
No available documentation.
") BRepTools_GTrsfModification;
		 BRepTools_GTrsfModification(const gp_GTrsf & T);

		/****** BRepTools_GTrsfModification::Continuity ******/
		/****** md5 signature: a3c3d5a955b90f2e1cefb3c12dc67277 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****** BRepTools_GTrsfModification::GTrsf ******/
		/****** md5 signature: a4c293d50b1ee2fc7d0625bf3a6c1811 ******/
		%feature("compactdefaultargs") GTrsf;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Gives an access on the GTrsf.
") GTrsf;
		gp_GTrsf GTrsf();

		/****** BRepTools_GTrsfModification::NewCurve ******/
		/****** md5 signature: fae0c201ae8f07a170a1eb576572768a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** BRepTools_GTrsfModification::NewCurve2d ******/
		/****** md5 signature: ea858177828b71b789a2564d89f64210 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** BRepTools_GTrsfModification::NewParameter ******/
		/****** md5 signature: e14926b54c8548936ba9a49d140b8da3 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools_GTrsfModification::NewPoint ******/
		/****** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** BRepTools_GTrsfModification::NewPolygon ******/
		/****** md5 signature: 4badeef9050bef8cef3639edbc9b0271 ******/
		%feature("compactdefaultargs") NewPolygon;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePoly: Poly_Polygon3D

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon. If the edge has been modified: - thePoly is a new polygon.
") NewPolygon;
		Standard_Boolean NewPolygon(const TopoDS_Edge & theEdge, opencascade::handle<Poly_Polygon3D> & thePoly);

		/****** BRepTools_GTrsfModification::NewPolygonOnTriangulation ******/
		/****** md5 signature: 362332d5c0a2020b059e4552360631f4 ******/
		%feature("compactdefaultargs") NewPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
thePoly: Poly_PolygonOnTriangulation

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon on triangulation. If the edge has been modified: - thePoly is a new polygon on triangulation.
") NewPolygonOnTriangulation;
		Standard_Boolean NewPolygonOnTriangulation(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, opencascade::handle<Poly_PolygonOnTriangulation> & thePoly);

		/****** BRepTools_GTrsfModification::NewSurface ******/
		/****** md5 signature: 001097e1d949f85581f605ce49276ada ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. -- Here, <RevFace> will return Standard_True if the -- gp_Trsf is negative.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepTools_GTrsfModification::NewTriangulation ******/
		/****** md5 signature: c34f0504d87cfa075d0a16293a0a824a ******/
		%feature("compactdefaultargs") NewTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTri: Poly_Triangulation

Return
-------
bool

Description
-----------
Returns true if the face has been modified according to changed triangulation. If the face has been modified: - theTri is a new triangulation on the face.
") NewTriangulation;
		Standard_Boolean NewTriangulation(const TopoDS_Face & theFace, opencascade::handle<Poly_Triangulation> & theTri);

};


%make_alias(BRepTools_GTrsfModification)

%extend BRepTools_GTrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepTools_TrsfModification *
***********************************/
class BRepTools_TrsfModification : public BRepTools_Modification {
	public:
		/****** BRepTools_TrsfModification::BRepTools_TrsfModification ******/
		/****** md5 signature: 184d5436193d6786b8b2f10f95528e71 ******/
		%feature("compactdefaultargs") BRepTools_TrsfModification;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") BRepTools_TrsfModification;
		 BRepTools_TrsfModification(const gp_Trsf & T);

		/****** BRepTools_TrsfModification::Continuity ******/
		/****** md5 signature: a3c3d5a955b90f2e1cefb3c12dc67277 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetIsCopyMesh() {
            return (Standard_Boolean) $self->IsCopyMesh();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetIsCopyMesh(Standard_Boolean value) {
            $self->IsCopyMesh()=value;
            }
        };
		/****** BRepTools_TrsfModification::NewCurve ******/
		/****** md5 signature: fae0c201ae8f07a170a1eb576572768a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Always returns true indicating that the edge E is always modified. - C is the new geometric support of the edge, - L is the new location, and - Tol is the new tolerance.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** BRepTools_TrsfModification::NewCurve2d ******/
		/****** md5 signature: ea858177828b71b789a2564d89f64210 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: float

Description
-----------
Returns true if the edge E has a new curve on surface on the face F. If a new curve exists: - C is the new geometric support of the edge, - L is the new location, and - Tol the new tolerance. If no new curve exists, this function returns false, and the values of C, L and Tol are not significant.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** BRepTools_TrsfModification::NewParameter ******/
		/****** md5 signature: e14926b54c8548936ba9a49d140b8da3 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Returns true if the Vertex V has a new parameter on the edge E. If a new parameter exists: - P is the parameter, and - Tol is the new tolerance. If no new parameter exists, this function returns false, and the values of P and Tol are not significant.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools_TrsfModification::NewPoint ******/
		/****** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Returns true if the vertex V has been modified. If the vertex has been modified: - P is the new geometry of the vertex, and - Tol is the new tolerance. If the vertex has not been modified this function returns false, and the values of P and Tol are not significant.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** BRepTools_TrsfModification::NewPolygon ******/
		/****** md5 signature: 7f7c60619bea4afc74b068fbbb3cfa88 ******/
		%feature("compactdefaultargs") NewPolygon;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon. If the edge has been modified: - P is a new polygon.
") NewPolygon;
		Standard_Boolean NewPolygon(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon3D> & P);

		/****** BRepTools_TrsfModification::NewPolygonOnTriangulation ******/
		/****** md5 signature: 3725a7293cb8d43db5ec36c08ebcc7d9 ******/
		%feature("compactdefaultargs") NewPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
P: Poly_PolygonOnTriangulation

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon on triangulation. If the edge has been modified: - P is a new polygon on triangulation.
") NewPolygonOnTriangulation;
		Standard_Boolean NewPolygonOnTriangulation(const TopoDS_Edge & E, const TopoDS_Face & F, opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****** BRepTools_TrsfModification::NewSurface ******/
		/****** md5 signature: 001097e1d949f85581f605ce49276ada ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Returns true if the face F has been modified. If the face has been modified: - S is the new geometry of the face, - L is its new location, and - Tol is the new tolerance. RevWires is set to true when the modification reverses the normal of the surface (the wires have to be reversed). RevFace is set to true if the orientation of the modified face changes in the shells which contain it. For this class, RevFace returns true if the gp_Trsf associated with this modification is negative.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepTools_TrsfModification::NewTriangulation ******/
		/****** md5 signature: cdec58f103b48ecf1d9ad0fd3b8c73cc ******/
		%feature("compactdefaultargs") NewTriangulation;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
T: Poly_Triangulation

Return
-------
bool

Description
-----------
Returns true if the face has been modified according to changed triangulation. If the face has been modified: - T is a new triangulation on the face.
") NewTriangulation;
		Standard_Boolean NewTriangulation(const TopoDS_Face & F, opencascade::handle<Poly_Triangulation> & T);

		/****** BRepTools_TrsfModification::Trsf ******/
		/****** md5 signature: 162ba6693c622bc37c4b2d05c6f93a56 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Provides access to the gp_Trsf associated with this modification. The transformation can be changed.
") Trsf;
		gp_Trsf Trsf();

};


%make_alias(BRepTools_TrsfModification)

%extend BRepTools_TrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BRepTools_NurbsConvertModification *
*******************************************/
class BRepTools_NurbsConvertModification : public BRepTools_CopyModification {
	public:
		/****** BRepTools_NurbsConvertModification::BRepTools_NurbsConvertModification ******/
		/****** md5 signature: 96ade83e8786f855501767969892ed98 ******/
		%feature("compactdefaultargs") BRepTools_NurbsConvertModification;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepTools_NurbsConvertModification;
		 BRepTools_NurbsConvertModification();

		/****** BRepTools_NurbsConvertModification::Continuity ******/
		/****** md5 signature: a3c3d5a955b90f2e1cefb3c12dc67277 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****** BRepTools_NurbsConvertModification::GetUpdatedEdges ******/
		/****** md5 signature: 98174620d3d94393e9e27b34a96f4740 ******/
		%feature("compactdefaultargs") GetUpdatedEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") GetUpdatedEdges;
		const TopTools_ListOfShape & GetUpdatedEdges();

		/****** BRepTools_NurbsConvertModification::NewCurve ******/
		/****** md5 signature: fae0c201ae8f07a170a1eb576572768a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** BRepTools_NurbsConvertModification::NewCurve2d ******/
		/****** md5 signature: ea858177828b71b789a2564d89f64210 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** BRepTools_NurbsConvertModification::NewParameter ******/
		/****** md5 signature: e14926b54c8548936ba9a49d140b8da3 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepTools_NurbsConvertModification::NewPoint ******/
		/****** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** BRepTools_NurbsConvertModification::NewPolygon ******/
		/****** md5 signature: 4badeef9050bef8cef3639edbc9b0271 ******/
		%feature("compactdefaultargs") NewPolygon;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePoly: Poly_Polygon3D

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon. If the edge has been modified: - thePoly is a new polygon.
") NewPolygon;
		Standard_Boolean NewPolygon(const TopoDS_Edge & theEdge, opencascade::handle<Poly_Polygon3D> & thePoly);

		/****** BRepTools_NurbsConvertModification::NewPolygonOnTriangulation ******/
		/****** md5 signature: 362332d5c0a2020b059e4552360631f4 ******/
		%feature("compactdefaultargs") NewPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
thePoly: Poly_PolygonOnTriangulation

Return
-------
bool

Description
-----------
Returns true if the edge has been modified according to changed polygon on triangulation. If the edge has been modified: - thePoly is a new polygon on triangulation.
") NewPolygonOnTriangulation;
		Standard_Boolean NewPolygonOnTriangulation(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, opencascade::handle<Poly_PolygonOnTriangulation> & thePoly);

		/****** BRepTools_NurbsConvertModification::NewSurface ******/
		/****** md5 signature: 001097e1d949f85581f605ce49276ada ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. -- Here, <RevFace> will return Standard_True if the -- gp_Trsf is negative.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepTools_NurbsConvertModification::NewTriangulation ******/
		/****** md5 signature: c34f0504d87cfa075d0a16293a0a824a ******/
		%feature("compactdefaultargs") NewTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTri: Poly_Triangulation

Return
-------
bool

Description
-----------
Returns true if the face has been modified according to changed triangulation. If the face has been modified: - theTri is a new triangulation on the face.
") NewTriangulation;
		Standard_Boolean NewTriangulation(const TopoDS_Face & theFace, opencascade::handle<Poly_Triangulation> & theTri);

};


%make_alias(BRepTools_NurbsConvertModification)

%extend BRepTools_NurbsConvertModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def breptools_ActivateTriangulation(*args):
	return breptools.ActivateTriangulation(*args)

@deprecated
def breptools_AddUVBounds(*args):
	return breptools.AddUVBounds(*args)

@deprecated
def breptools_AddUVBounds(*args):
	return breptools.AddUVBounds(*args)

@deprecated
def breptools_AddUVBounds(*args):
	return breptools.AddUVBounds(*args)

@deprecated
def breptools_CheckLocations(*args):
	return breptools.CheckLocations(*args)

@deprecated
def breptools_Clean(*args):
	return breptools.Clean(*args)

@deprecated
def breptools_CleanGeometry(*args):
	return breptools.CleanGeometry(*args)

@deprecated
def breptools_Compare(*args):
	return breptools.Compare(*args)

@deprecated
def breptools_Compare(*args):
	return breptools.Compare(*args)

@deprecated
def breptools_DetectClosedness(*args):
	return breptools.DetectClosedness(*args)

@deprecated
def breptools_Dump(*args):
	return breptools.Dump(*args)

@deprecated
def breptools_EvalAndUpdateTol(*args):
	return breptools.EvalAndUpdateTol(*args)

@deprecated
def breptools_IsReallyClosed(*args):
	return breptools.IsReallyClosed(*args)

@deprecated
def breptools_LoadAllTriangulations(*args):
	return breptools.LoadAllTriangulations(*args)

@deprecated
def breptools_LoadTriangulation(*args):
	return breptools.LoadTriangulation(*args)

@deprecated
def breptools_Map3DEdges(*args):
	return breptools.Map3DEdges(*args)

@deprecated
def breptools_OriEdgeInFace(*args):
	return breptools.OriEdgeInFace(*args)

@deprecated
def breptools_OuterWire(*args):
	return breptools.OuterWire(*args)

@deprecated
def breptools_Read(*args):
	return breptools.Read(*args)

@deprecated
def breptools_Read(*args):
	return breptools.Read(*args)

@deprecated
def breptools_RemoveInternals(*args):
	return breptools.RemoveInternals(*args)

@deprecated
def breptools_RemoveUnusedPCurves(*args):
	return breptools.RemoveUnusedPCurves(*args)

@deprecated
def breptools_Triangulation(*args):
	return breptools.Triangulation(*args)

@deprecated
def breptools_UVBounds(*args):
	return breptools.UVBounds(*args)

@deprecated
def breptools_UVBounds(*args):
	return breptools.UVBounds(*args)

@deprecated
def breptools_UVBounds(*args):
	return breptools.UVBounds(*args)

@deprecated
def breptools_UnloadAllTriangulations(*args):
	return breptools.UnloadAllTriangulations(*args)

@deprecated
def breptools_UnloadTriangulation(*args):
	return breptools.UnloadTriangulation(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_Update(*args):
	return breptools.Update(*args)

@deprecated
def breptools_UpdateFaceUVPoints(*args):
	return breptools.UpdateFaceUVPoints(*args)

@deprecated
def breptools_Write(*args):
	return breptools.Write(*args)

@deprecated
def breptools_Write(*args):
	return breptools.Write(*args)

@deprecated
def breptools_Write(*args):
	return breptools.Write(*args)

@deprecated
def breptools_Write(*args):
	return breptools.Write(*args)

@deprecated
def BRepTools_History_IsSupportedType(*args):
	return BRepTools_History.IsSupportedType(*args)

}
