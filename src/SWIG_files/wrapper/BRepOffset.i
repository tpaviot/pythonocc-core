/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPOFFSETDOCSTRING
"BRepOffset module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepoffset.html"
%enddef
%module (package="OCC.Core", docstring=BREPOFFSETDOCSTRING) BRepOffset


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BRepOffset_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<BRepAlgo_module.hxx>
#include<TopAbs_module.hxx>
#include<GeomAbs_module.hxx>
#include<TCollection_module.hxx>
#include<BRepTools_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Quantity_module.hxx>
#include<Bnd_module.hxx>
#include<AppParCurves_module.hxx>
#include<MAT_module.hxx>
#include<TColgp_module.hxx>
#include<BRepAlgo_module.hxx>
#include<FEmTool_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<Plate_module.hxx>
#include<Bisector_module.hxx>
#include<TColStd_module.hxx>
#include<BRepMAT2d_module.hxx>
#include<TColGeom2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<BRepClass3d_module.hxx>
#include<BRep_module.hxx>
#include<BRepTools_module.hxx>
#include<Quantity_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopLoc_module.hxx>
#include<AdvApp2Var_module.hxx>
#include<TColGeom_module.hxx>
#include<IntSurf_module.hxx>
#include<Message_module.hxx>
#include<Convert_module.hxx>
#include<Intf_module.hxx>
#include<TShort_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Poly_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Extrema_module.hxx>
#include<Geom2d_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import TopoDS.i
%import TopTools.i
%import BRepAlgo.i
%import TopAbs.i
%import GeomAbs.i
%import TCollection.i
%import BRepTools.i
%import TopLoc.i
%import Geom2d.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepOffset_Error {
	BRepOffset_NoError = 0,
	BRepOffset_UnknownError = 1,
	BRepOffset_BadNormalsOnGeometry = 2,
	BRepOffset_C0Geometry = 3,
	BRepOffset_NullOffset = 4,
	BRepOffset_NotConnectedShell = 5,
};

enum BRepOffsetSimple_Status {
	BRepOffsetSimple_OK = 0,
	BRepOffsetSimple_NullInputShape = 1,
	BRepOffsetSimple_ErrorOffsetComputation = 2,
	BRepOffsetSimple_ErrorWallFaceComputation = 3,
	BRepOffsetSimple_ErrorInvalidNbShells = 4,
	BRepOffsetSimple_ErrorNonClosedShell = 5,
};

enum BRepOffset_Mode {
	BRepOffset_Skin = 0,
	BRepOffset_Pipe = 1,
	BRepOffset_RectoVerso = 2,
};

enum BRepOffset_Type {
	BRepOffset_Concave = 0,
	BRepOffset_Convex = 1,
	BRepOffset_Tangent = 2,
	BRepOffset_FreeBoundary = 3,
	BRepOffset_Other = 4,
};

enum BRepOffset_Status {
	BRepOffset_Good = 0,
	BRepOffset_Reversed = 1,
	BRepOffset_Degenerated = 2,
	BRepOffset_Unknown = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BRepOffset_Error(IntEnum):
	BRepOffset_NoError = 0
	BRepOffset_UnknownError = 1
	BRepOffset_BadNormalsOnGeometry = 2
	BRepOffset_C0Geometry = 3
	BRepOffset_NullOffset = 4
	BRepOffset_NotConnectedShell = 5
BRepOffset_NoError = BRepOffset_Error.BRepOffset_NoError
BRepOffset_UnknownError = BRepOffset_Error.BRepOffset_UnknownError
BRepOffset_BadNormalsOnGeometry = BRepOffset_Error.BRepOffset_BadNormalsOnGeometry
BRepOffset_C0Geometry = BRepOffset_Error.BRepOffset_C0Geometry
BRepOffset_NullOffset = BRepOffset_Error.BRepOffset_NullOffset
BRepOffset_NotConnectedShell = BRepOffset_Error.BRepOffset_NotConnectedShell

class BRepOffsetSimple_Status(IntEnum):
	BRepOffsetSimple_OK = 0
	BRepOffsetSimple_NullInputShape = 1
	BRepOffsetSimple_ErrorOffsetComputation = 2
	BRepOffsetSimple_ErrorWallFaceComputation = 3
	BRepOffsetSimple_ErrorInvalidNbShells = 4
	BRepOffsetSimple_ErrorNonClosedShell = 5
BRepOffsetSimple_OK = BRepOffsetSimple_Status.BRepOffsetSimple_OK
BRepOffsetSimple_NullInputShape = BRepOffsetSimple_Status.BRepOffsetSimple_NullInputShape
BRepOffsetSimple_ErrorOffsetComputation = BRepOffsetSimple_Status.BRepOffsetSimple_ErrorOffsetComputation
BRepOffsetSimple_ErrorWallFaceComputation = BRepOffsetSimple_Status.BRepOffsetSimple_ErrorWallFaceComputation
BRepOffsetSimple_ErrorInvalidNbShells = BRepOffsetSimple_Status.BRepOffsetSimple_ErrorInvalidNbShells
BRepOffsetSimple_ErrorNonClosedShell = BRepOffsetSimple_Status.BRepOffsetSimple_ErrorNonClosedShell

class BRepOffset_Mode(IntEnum):
	BRepOffset_Skin = 0
	BRepOffset_Pipe = 1
	BRepOffset_RectoVerso = 2
BRepOffset_Skin = BRepOffset_Mode.BRepOffset_Skin
BRepOffset_Pipe = BRepOffset_Mode.BRepOffset_Pipe
BRepOffset_RectoVerso = BRepOffset_Mode.BRepOffset_RectoVerso

class BRepOffset_Type(IntEnum):
	BRepOffset_Concave = 0
	BRepOffset_Convex = 1
	BRepOffset_Tangent = 2
	BRepOffset_FreeBoundary = 3
	BRepOffset_Other = 4
BRepOffset_Concave = BRepOffset_Type.BRepOffset_Concave
BRepOffset_Convex = BRepOffset_Type.BRepOffset_Convex
BRepOffset_Tangent = BRepOffset_Type.BRepOffset_Tangent
BRepOffset_FreeBoundary = BRepOffset_Type.BRepOffset_FreeBoundary
BRepOffset_Other = BRepOffset_Type.BRepOffset_Other

class BRepOffset_Status(IntEnum):
	BRepOffset_Good = 0
	BRepOffset_Reversed = 1
	BRepOffset_Degenerated = 2
	BRepOffset_Unknown = 3
BRepOffset_Good = BRepOffset_Status.BRepOffset_Good
BRepOffset_Reversed = BRepOffset_Status.BRepOffset_Reversed
BRepOffset_Degenerated = BRepOffset_Status.BRepOffset_Degenerated
BRepOffset_Unknown = BRepOffset_Status.BRepOffset_Unknown
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepOffset_SimpleOffset)
/* end handles declaration */

/* templates */
%template(BRepOffset_DataMapOfShapeListOfInterval) NCollection_DataMap<TopoDS_Shape,BRepOffset_ListOfInterval,TopTools_ShapeMapHasher>;
%template(BRepOffset_DataMapOfShapeMapOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_MapOfShape,TopTools_ShapeMapHasher>;
%template(BRepOffset_DataMapOfShapeOffset) NCollection_DataMap<TopoDS_Shape,BRepOffset_Offset,TopTools_ShapeMapHasher>;
%template(BRepOffset_ListIteratorOfListOfInterval) NCollection_TListIterator<BRepOffset_Interval>;
%template(BRepOffset_ListOfInterval) NCollection_List<BRepOffset_Interval>;

%extend NCollection_List<BRepOffset_Interval> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, BRepOffset_ListOfInterval, TopTools_ShapeMapHasher>::Iterator BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_MapOfShape, TopTools_ShapeMapHasher>::Iterator BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
typedef NCollection_DataMap<TopoDS_Shape, BRepOffset_Offset, TopTools_ShapeMapHasher>::Iterator BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
typedef NCollection_DataMap<TopoDS_Shape, BRepOffset_ListOfInterval, TopTools_ShapeMapHasher> BRepOffset_DataMapOfShapeListOfInterval;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_MapOfShape, TopTools_ShapeMapHasher> BRepOffset_DataMapOfShapeMapOfShape;
typedef NCollection_DataMap<TopoDS_Shape, BRepOffset_Offset, TopTools_ShapeMapHasher> BRepOffset_DataMapOfShapeOffset;
typedef NCollection_List<BRepOffset_Interval>::Iterator BRepOffset_ListIteratorOfListOfInterval;
typedef NCollection_List<BRepOffset_Interval> BRepOffset_ListOfInterval;
/* end typedefs declaration */

/*******************
* class BRepOffset *
*******************/
%rename(brepoffset) BRepOffset;
class BRepOffset {
	public:
		/****************** CollapseSingularities ******************/
		/**** md5 signature: 034b9c1b6a9d8f007623ce760360780f ****/
		%feature("compactdefaultargs") CollapseSingularities;
		%feature("autodoc", "Preprocess surface to be offset (bspline, bezier, or revolution based on bspline or bezier curve), by collapsing each singular side to single point. //! this is to avoid possible flipping of normal at the singularity of the surface due to non-zero distance between the poles that logically should be in one point (singularity). the (parametric) side of the surface is considered to be singularity if face has degenerated edge whose vertex encompasses (by its tolerance) all points on that side, or if all poles defining that side fit into sphere with radius theprecision. //! returns either original surface or its modified copy (if some poles have been moved).

Parameters
----------
theSurface: Geom_Surface
theFace: TopoDS_Face
thePrecision: float

Returns
-------
opencascade::handle<Geom_Surface>
") CollapseSingularities;
		static opencascade::handle<Geom_Surface> CollapseSingularities(const opencascade::handle<Geom_Surface> & theSurface, const TopoDS_Face & theFace, Standard_Real thePrecision);

		/****************** Surface ******************/
		/**** md5 signature: e1ef2a62c87237ebec16000ed6f138e9 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the offset surface computed from the surface <surface> at an offsetdistance <offset>. //! if possible, this method returns the real type of the surface ( e.g. an offset of a plane is a plane). //! if no particular case is detected, the returned surface will have the type geom_offsetsurface. parameter allowc0 is then passed as last argument to constructor of geom_offsetsurface.

Parameters
----------
Surface: Geom_Surface
Offset: float
theStatus: BRepOffset_Status
allowC0: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		static opencascade::handle<Geom_Surface> Surface(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Offset, BRepOffset_Status & theStatus, Standard_Boolean allowC0 = Standard_False);

};


%extend BRepOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepOffset_Analyse *
***************************/
class BRepOffset_Analyse {
	public:
		/****************** BRepOffset_Analyse ******************/
		/**** md5 signature: ba0b94f56b61c28244d4736b236bb3b0 ****/
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepOffset_Analyse;
		 BRepOffset_Analyse();

		/****************** BRepOffset_Analyse ******************/
		/**** md5 signature: c8cd33925dc9db4cffdaa41c2c27b493 ****/
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Angle: float

Returns
-------
None
") BRepOffset_Analyse;
		 BRepOffset_Analyse(const TopoDS_Shape & S, const Standard_Real Angle);

		/****************** AddFaces ******************/
		/**** md5 signature: 1e4670baa576bf5e64f7b26fb4da081c ****/
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "Add in <co> the faces of the shell containing <face> where all the connex edges are of type <side>.

Parameters
----------
Face: TopoDS_Face
Co: TopoDS_Compound
Map: TopTools_MapOfShape
Type: BRepOffset_Type

Returns
-------
None
") AddFaces;
		void AddFaces(const TopoDS_Face & Face, TopoDS_Compound & Co, TopTools_MapOfShape & Map, const BRepOffset_Type Type);

		/****************** AddFaces ******************/
		/**** md5 signature: 6cb812057fa45f5d270cdd4eed92833d ****/
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "Add in <co> the faces of the shell containing <face> where all the connex edges are of type <side1> or <side2>.

Parameters
----------
Face: TopoDS_Face
Co: TopoDS_Compound
Map: TopTools_MapOfShape
Type1: BRepOffset_Type
Type2: BRepOffset_Type

Returns
-------
None
") AddFaces;
		void AddFaces(const TopoDS_Face & Face, TopoDS_Compound & Co, TopTools_MapOfShape & Map, const BRepOffset_Type Type1, const BRepOffset_Type Type2);

		/****************** Ancestors ******************/
		/**** md5 signature: 84f8a51dff8f953c1f0e766545d09751 ****/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Ancestors;
		const TopTools_ListOfShape & Ancestors(const TopoDS_Shape & S);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Edges ******************/
		/**** md5 signature: 78f9ae4aab7f30cf6b34ae4c6a3bb4d0 ****/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Stores in <l> all the edges of type <t> on the vertex <v>.

Parameters
----------
V: TopoDS_Vertex
T: BRepOffset_Type
L: TopTools_ListOfShape

Returns
-------
None
") Edges;
		void Edges(const TopoDS_Vertex & V, const BRepOffset_Type T, TopTools_ListOfShape & L);

		/****************** Edges ******************/
		/**** md5 signature: c70a65f484414af2377526a800c2eb8b ****/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Stores in <l> all the edges of type <t> on the face <f>.

Parameters
----------
F: TopoDS_Face
T: BRepOffset_Type
L: TopTools_ListOfShape

Returns
-------
None
") Edges;
		void Edges(const TopoDS_Face & F, const BRepOffset_Type T, TopTools_ListOfShape & L);

		/****************** Explode ******************/
		/**** md5 signature: d49a95947ab09bc59c2dcdbb8dffafe3 ****/
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "Explode in compounds of faces where all the connex edges are of type <side>.

Parameters
----------
L: TopTools_ListOfShape
Type: BRepOffset_Type

Returns
-------
None
") Explode;
		void Explode(TopTools_ListOfShape & L, const BRepOffset_Type Type);

		/****************** Explode ******************/
		/**** md5 signature: 49a46e08a924c03461db8cab1290bdaf ****/
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "Explode in compounds of faces where all the connex edges are of type <side1> or <side2>.

Parameters
----------
L: TopTools_ListOfShape
Type1: BRepOffset_Type
Type2: BRepOffset_Type

Returns
-------
None
") Explode;
		void Explode(TopTools_ListOfShape & L, const BRepOffset_Type Type1, const BRepOffset_Type Type2);

		/****************** HasAncestor ******************/
		/**** md5 signature: e07b25839057552fab22cf780ebe3cfc ****/
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") HasAncestor;
		Standard_Boolean HasAncestor(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: d5b174ac2675a6e4a58dd65cb1081ad1 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Angle: float

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Real Angle);

		/****************** TangentEdges ******************/
		/**** md5 signature: ed75ba0042e3a910dbc82a1e27bc43e3 ****/
		%feature("compactdefaultargs") TangentEdges;
		%feature("autodoc", "Set in <edges> all the edges of <shape> which are tangent to <edge> at the vertex <vertex>.

Parameters
----------
Edge: TopoDS_Edge
Vertex: TopoDS_Vertex
Edges: TopTools_ListOfShape

Returns
-------
None
") TangentEdges;
		void TangentEdges(const TopoDS_Edge & Edge, const TopoDS_Vertex & Vertex, TopTools_ListOfShape & Edges);

		/****************** Type ******************/
		/**** md5 signature: d9e43bb8e63a1398a1076d122efc6b78 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
BRepOffset_ListOfInterval
") Type;
		const BRepOffset_ListOfInterval & Type(const TopoDS_Edge & E);

};


%extend BRepOffset_Analyse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepOffset_Inter2d *
***************************/
class BRepOffset_Inter2d {
	public:
		/****************** Compute ******************/
		/**** md5 signature: 979a13b397be41e90b8e3ab967e4f53f ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the intersections between the edges stored is asdes as descendants of <f> . intersections is computed between two edges if one of them is bound in newedges. when all faces of the shape are treated the intersection vertices have to be fused using the fusevertices method. thedmvv contains the vertices that should be fused.

Parameters
----------
AsDes: BRepAlgo_AsDes
F: TopoDS_Face
NewEdges: TopTools_IndexedMapOfShape
Tol: float
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape

Returns
-------
None
") Compute;
		static void Compute(const opencascade::handle<BRepAlgo_AsDes> & AsDes, const TopoDS_Face & F, const TopTools_IndexedMapOfShape & NewEdges, const Standard_Real Tol, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV);

		/****************** ConnexIntByInt ******************/
		/**** md5 signature: 0c7e40e1acb94aa7f8331e91b514805e ****/
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "Computes the intersection between the offset edges of the <fi>. all intersection vertices will be stored in asdes2d. when all faces of the shape are treated the intersection vertices have to be fused using the fusevertices method. thedmvv contains the vertices that should be fused.

Parameters
----------
FI: TopoDS_Face
OFI: BRepOffset_Offset
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
AsDes2d: BRepAlgo_AsDes
Offset: float
Tol: float
FacesWithVerts: TopTools_IndexedMapOfShape
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape

Returns
-------
None
") ConnexIntByInt;
		static void ConnexIntByInt(const TopoDS_Face & FI, BRepOffset_Offset & OFI, TopTools_DataMapOfShapeShape & MES, const TopTools_DataMapOfShapeShape & Build, const opencascade::handle<BRepAlgo_AsDes> & AsDes2d, const Standard_Real Offset, const Standard_Real Tol, TopTools_IndexedMapOfShape & FacesWithVerts, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV);

		/****************** ConnexIntByIntInVert ******************/
		/**** md5 signature: 7f281947e5659ab310aeb36c2d13f62b ****/
		%feature("compactdefaultargs") ConnexIntByIntInVert;
		%feature("autodoc", "Computes the intersection between the offset edges generated from vertices and stored into asdes as descendants of the <fi>. all intersection vertices will be stored in asdes2d. when all faces of the shape are treated the intersection vertices have to be fused using the fusevertices method. thedmvv contains the vertices that should be fused.

Parameters
----------
FI: TopoDS_Face
OFI: BRepOffset_Offset
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
AsDes: BRepAlgo_AsDes
AsDes2d: BRepAlgo_AsDes
Tol: float
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape

Returns
-------
None
") ConnexIntByIntInVert;
		static void ConnexIntByIntInVert(const TopoDS_Face & FI, BRepOffset_Offset & OFI, TopTools_DataMapOfShapeShape & MES, const TopTools_DataMapOfShapeShape & Build, const opencascade::handle<BRepAlgo_AsDes> & AsDes, const opencascade::handle<BRepAlgo_AsDes> & AsDes2d, const Standard_Real Tol, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV);

		/****************** ExtentEdge ******************/
		/**** md5 signature: 816605214f732ebedff1f4aa5a9d80c8 ****/
		%feature("compactdefaultargs") ExtentEdge;
		%feature("autodoc", "Extents the edge.

Parameters
----------
E: TopoDS_Edge
NE: TopoDS_Edge
theOffset: float

Returns
-------
None
") ExtentEdge;
		static void ExtentEdge(const TopoDS_Edge & E, TopoDS_Edge & NE, const Standard_Real theOffset);

		/****************** FuseVertices ******************/
		/**** md5 signature: c0390e09a7663325850f97d7fb74cd0f ****/
		%feature("compactdefaultargs") FuseVertices;
		%feature("autodoc", "Fuses the chains of vertices in the thedmvv and updates asdes by replacing the old vertices with the new ones.

Parameters
----------
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape
theAsDes: BRepAlgo_AsDes

Returns
-------
None
") FuseVertices;
		static void FuseVertices(const TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const opencascade::handle<BRepAlgo_AsDes> & theAsDes);

};


%extend BRepOffset_Inter2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepOffset_Inter3d *
***************************/
class BRepOffset_Inter3d {
	public:
		/****************** BRepOffset_Inter3d ******************/
		/**** md5 signature: 9fd66aef3ebdcf13bcde09e6d645c2ee ****/
		%feature("compactdefaultargs") BRepOffset_Inter3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
AsDes: BRepAlgo_AsDes
Side: TopAbs_State
Tol: float

Returns
-------
None
") BRepOffset_Inter3d;
		 BRepOffset_Inter3d(const opencascade::handle<BRepAlgo_AsDes> & AsDes, const TopAbs_State Side, const Standard_Real Tol);

		/****************** AddCommonEdges ******************/
		/**** md5 signature: 3a1075fa148914bfe74048a60d117c64 ****/
		%feature("compactdefaultargs") AddCommonEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
SetOfFaces: TopTools_ListOfShape

Returns
-------
None
") AddCommonEdges;
		void AddCommonEdges(const TopTools_ListOfShape & SetOfFaces);

		/****************** AsDes ******************/
		/**** md5 signature: 6803275846107842748239bc71773529 ****/
		%feature("compactdefaultargs") AsDes;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepAlgo_AsDes>
") AsDes;
		opencascade::handle<BRepAlgo_AsDes> AsDes();

		/****************** CompletInt ******************/
		/**** md5 signature: 2133be53edd37d3e3641e3d39b4f050d ****/
		%feature("compactdefaultargs") CompletInt;
		%feature("autodoc", "No available documentation.

Parameters
----------
SetOfFaces: TopTools_ListOfShape
InitOffsetFace: BRepAlgo_Image

Returns
-------
None
") CompletInt;
		void CompletInt(const TopTools_ListOfShape & SetOfFaces, const BRepAlgo_Image & InitOffsetFace);

		/****************** ConnexIntByArc ******************/
		/**** md5 signature: 48b7695a5a1df82b4be43f9aeb6a0fce ****/
		%feature("compactdefaultargs") ConnexIntByArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
SetOfFaces: TopTools_ListOfShape
ShapeInit: TopoDS_Shape
Analyse: BRepOffset_Analyse
InitOffsetFace: BRepAlgo_Image

Returns
-------
None
") ConnexIntByArc;
		void ConnexIntByArc(const TopTools_ListOfShape & SetOfFaces, const TopoDS_Shape & ShapeInit, const BRepOffset_Analyse & Analyse, const BRepAlgo_Image & InitOffsetFace);

		/****************** ConnexIntByInt ******************/
		/**** md5 signature: 8e70f0e8b2d959b5b32aeb39f7f9d09f ****/
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "No available documentation.

Parameters
----------
SI: TopoDS_Shape
MapSF: BRepOffset_DataMapOfShapeOffset
A: BRepOffset_Analyse
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
Failed: TopTools_ListOfShape
bIsPlanar: bool,optional
	default value is Standard_False

Returns
-------
None
") ConnexIntByInt;
		void ConnexIntByInt(const TopoDS_Shape & SI, const BRepOffset_DataMapOfShapeOffset & MapSF, const BRepOffset_Analyse & A, TopTools_DataMapOfShapeShape & MES, TopTools_DataMapOfShapeShape & Build, TopTools_ListOfShape & Failed, const Standard_Boolean bIsPlanar = Standard_False);

		/****************** ContextIntByArc ******************/
		/**** md5 signature: bce31c968a516813d7fb1b570dd93e23 ****/
		%feature("compactdefaultargs") ContextIntByArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
ContextFaces: TopTools_IndexedMapOfShape
ExtentContext: bool
Analyse: BRepOffset_Analyse
InitOffsetFace: BRepAlgo_Image
InitOffsetEdge: BRepAlgo_Image

Returns
-------
None
") ContextIntByArc;
		void ContextIntByArc(const TopTools_IndexedMapOfShape & ContextFaces, const Standard_Boolean ExtentContext, const BRepOffset_Analyse & Analyse, const BRepAlgo_Image & InitOffsetFace, BRepAlgo_Image & InitOffsetEdge);

		/****************** ContextIntByInt ******************/
		/**** md5 signature: d7d4d8ad021ac6ded14d065090cec7fe ****/
		%feature("compactdefaultargs") ContextIntByInt;
		%feature("autodoc", "No available documentation.

Parameters
----------
ContextFaces: TopTools_IndexedMapOfShape
ExtentContext: bool
MapSF: BRepOffset_DataMapOfShapeOffset
A: BRepOffset_Analyse
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
Failed: TopTools_ListOfShape
bIsPlanar: bool,optional
	default value is Standard_False

Returns
-------
None
") ContextIntByInt;
		void ContextIntByInt(const TopTools_IndexedMapOfShape & ContextFaces, const Standard_Boolean ExtentContext, const BRepOffset_DataMapOfShapeOffset & MapSF, const BRepOffset_Analyse & A, TopTools_DataMapOfShapeShape & MES, TopTools_DataMapOfShapeShape & Build, TopTools_ListOfShape & Failed, const Standard_Boolean bIsPlanar = Standard_False);

		/****************** FaceInter ******************/
		/**** md5 signature: 62d9b8b2341ea348e10a9705c1e1a1d6 ****/
		%feature("compactdefaultargs") FaceInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
InitOffsetFace: BRepAlgo_Image

Returns
-------
None
") FaceInter;
		void FaceInter(const TopoDS_Face & F1, const TopoDS_Face & F2, const BRepAlgo_Image & InitOffsetFace);

		/****************** IsDone ******************/
		/**** md5 signature: 8801efe525a67dac919cc689e660bf42 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** NewEdges ******************/
		/**** md5 signature: a2b25cad9fda67ee995ca631566b88e7 ****/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") NewEdges;
		TopTools_IndexedMapOfShape & NewEdges();

		/****************** SetDone ******************/
		/**** md5 signature: d9f3a39ef77387fe413720595d42df62 ****/
		%feature("compactdefaultargs") SetDone;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") SetDone;
		void SetDone(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** TouchedFaces ******************/
		/**** md5 signature: c6cb7871fc937245c8cd275623b60a64 ****/
		%feature("compactdefaultargs") TouchedFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") TouchedFaces;
		TopTools_IndexedMapOfShape & TouchedFaces();

};


%extend BRepOffset_Inter3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepOffset_Interval *
****************************/
class BRepOffset_Interval {
	public:
		/****************** BRepOffset_Interval ******************/
		/**** md5 signature: 32b6085f345b38e32fe26ce2f9fd3dd1 ****/
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepOffset_Interval;
		 BRepOffset_Interval();

		/****************** BRepOffset_Interval ******************/
		/**** md5 signature: 69fbf935176ea30a9e4b288b2523f9b5 ****/
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
Type: BRepOffset_Type

Returns
-------
None
") BRepOffset_Interval;
		 BRepOffset_Interval(const Standard_Real U1, const Standard_Real U2, const BRepOffset_Type Type);

		/****************** First ******************/
		/**** md5 signature: 1099c5bd36f358fe828b1d6d585b9530 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
None
") First;
		void First(const Standard_Real U);

		/****************** First ******************/
		/**** md5 signature: 009dd98af15e46b2da286731f40e1839 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") First;
		Standard_Real First();

		/****************** Last ******************/
		/**** md5 signature: 118eadfc67f49ba000d3d60e0425edef ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
None
") Last;
		void Last(const Standard_Real U);

		/****************** Last ******************/
		/**** md5 signature: 4c8063c237a4f73018a7949da8aef9fb ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Last;
		Standard_Real Last();

		/****************** Type ******************/
		/**** md5 signature: b5392c749f576b39f134fa4bf2afd135 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: BRepOffset_Type

Returns
-------
None
") Type;
		void Type(const BRepOffset_Type T);

		/****************** Type ******************/
		/**** md5 signature: 65af39d0b03b15b8549e610cc642e819 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepOffset_Type
") Type;
		BRepOffset_Type Type();

};


%extend BRepOffset_Interval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepOffset_MakeLoops *
*****************************/
class BRepOffset_MakeLoops {
	public:
		/****************** BRepOffset_MakeLoops ******************/
		/**** md5 signature: 29ed29e42e0a574e9a47d70ba344ba9f ****/
		%feature("compactdefaultargs") BRepOffset_MakeLoops;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepOffset_MakeLoops;
		 BRepOffset_MakeLoops();

		/****************** Build ******************/
		/**** md5 signature: 6659e42a50d0c1c2250f0e1e0ec1b1eb ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "No available documentation.

Parameters
----------
LF: TopTools_ListOfShape
AsDes: BRepAlgo_AsDes
Image: BRepAlgo_Image

Returns
-------
None
") Build;
		void Build(const TopTools_ListOfShape & LF, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & Image);

		/****************** BuildFaces ******************/
		/**** md5 signature: c3db0e3d2792b138a1249d8591b7cf76 ****/
		%feature("compactdefaultargs") BuildFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
LF: TopTools_ListOfShape
AsDes: BRepAlgo_AsDes
Image: BRepAlgo_Image

Returns
-------
None
") BuildFaces;
		void BuildFaces(const TopTools_ListOfShape & LF, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & Image);

		/****************** BuildOnContext ******************/
		/**** md5 signature: bc99175fcb78130f592a2aff740f2ff3 ****/
		%feature("compactdefaultargs") BuildOnContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
LContext: TopTools_ListOfShape
Analyse: BRepOffset_Analyse
AsDes: BRepAlgo_AsDes
Image: BRepAlgo_Image
InSide: bool

Returns
-------
None
") BuildOnContext;
		void BuildOnContext(const TopTools_ListOfShape & LContext, const BRepOffset_Analyse & Analyse, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & Image, const Standard_Boolean InSide);

};


%extend BRepOffset_MakeLoops {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepOffset_MakeOffset *
******************************/
class BRepOffset_MakeOffset {
	public:
		/****************** BRepOffset_MakeOffset ******************/
		/**** md5 signature: 41f8a468e07d2c2db2e9868220325beb ****/
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset();

		/****************** BRepOffset_MakeOffset ******************/
		/**** md5 signature: 171c87d8e680578c0a8bc3f18e9d5b1f ****/
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Offset: float
Tol: float
Mode: BRepOffset_Mode,optional
	default value is BRepOffset_Skin
Intersection: bool,optional
	default value is Standard_False
SelfInter: bool,optional
	default value is Standard_False
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
Thickening: bool,optional
	default value is Standard_False
RemoveIntEdges: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset(const TopoDS_Shape & S, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Thickening = Standard_False, const Standard_Boolean RemoveIntEdges = Standard_False);

		/****************** AddFace ******************/
		/**** md5 signature: 5fecadaf3ef2e154bc4683eed0767084 ****/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "Add closing faces, <f> has to be in the initial shape s.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") AddFace;
		void AddFace(const TopoDS_Face & F);

		/****************** CheckInputData ******************/
		/**** md5 signature: 99b88da9ff25acb39451f2ea45c0c7aa ****/
		%feature("compactdefaultargs") CheckInputData;
		%feature("autodoc", "Makes pre analysis of possibility offset perform. use method error() to get more information. finds first error. list of checks: 1) check for existence object with non-null offset. 2) check for connectivity in offset shell. 3) check continuity of input surfaces. 4) check for normals existence on grid. returns true if possible make computations and false otherwise.

Returns
-------
bool
") CheckInputData;
		Standard_Boolean CheckInputData();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClosingFaces ******************/
		/**** md5 signature: 028fe8cbc6a2b90f162ab7ff10002b87 ****/
		%feature("compactdefaultargs") ClosingFaces;
		%feature("autodoc", "Returns the list of closing faces stores by addface.

Returns
-------
TopTools_IndexedMapOfShape
") ClosingFaces;
		const TopTools_IndexedMapOfShape & ClosingFaces();

		/****************** Error ******************/
		/**** md5 signature: 204aa201182f580c2b3b629785fe7270 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns information about offset state.

Returns
-------
BRepOffset_Error
") Error;
		BRepOffset_Error Error();

		/****************** GetBadShape ******************/
		/**** md5 signature: ba57b2eb9f7240c2efaee696f343f099 ****/
		%feature("compactdefaultargs") GetBadShape;
		%feature("autodoc", "Return bad shape, which obtained in checkinputdata.

Returns
-------
TopoDS_Shape
") GetBadShape;
		const TopoDS_Shape GetBadShape();

		/****************** GetJoinType ******************/
		/**** md5 signature: 98bbd653674d56f0804dd681f91e2cf5 ****/
		%feature("compactdefaultargs") GetJoinType;
		%feature("autodoc", "Returns myjoin.

Returns
-------
GeomAbs_JoinType
") GetJoinType;
		GeomAbs_JoinType GetJoinType();

		/****************** Initialize ******************/
		/**** md5 signature: b189dc4c3027834b3cc5d35d26f288df ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Offset: float
Tol: float
Mode: BRepOffset_Mode,optional
	default value is BRepOffset_Skin
Intersection: bool,optional
	default value is Standard_False
SelfInter: bool,optional
	default value is Standard_False
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
Thickening: bool,optional
	default value is Standard_False
RemoveIntEdges: bool,optional
	default value is Standard_False

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Shape & S, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Thickening = Standard_False, const Standard_Boolean RemoveIntEdges = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MakeOffsetShape ******************/
		/**** md5 signature: c28a2e07542c09a34ec888d10d3aaa98 ****/
		%feature("compactdefaultargs") MakeOffsetShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MakeOffsetShape;
		void MakeOffsetShape();

		/****************** MakeThickSolid ******************/
		/**** md5 signature: fb5906e94a5737d57bb0ef13f12dcb1e ****/
		%feature("compactdefaultargs") MakeThickSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MakeThickSolid;
		void MakeThickSolid();

		/****************** OffsetEdgesFromShapes ******************/
		/**** md5 signature: 68926d492e1e9d71593e4c5da8672674 ****/
		%feature("compactdefaultargs") OffsetEdgesFromShapes;
		%feature("autodoc", "Returns <image> containing links between initials shapes and offset edges.

Returns
-------
BRepAlgo_Image
") OffsetEdgesFromShapes;
		const BRepAlgo_Image & OffsetEdgesFromShapes();

		/****************** OffsetFacesFromShapes ******************/
		/**** md5 signature: 29688b3f620832bbca96a758804ee150 ****/
		%feature("compactdefaultargs") OffsetFacesFromShapes;
		%feature("autodoc", "Returns <image> containing links between initials shapes and offset faces.

Returns
-------
BRepAlgo_Image
") OffsetFacesFromShapes;
		const BRepAlgo_Image & OffsetFacesFromShapes();

		/****************** SetOffsetOnFace ******************/
		/**** md5 signature: 9f0ed497427d1c6797537dcaf6828afd ****/
		%feature("compactdefaultargs") SetOffsetOnFace;
		%feature("autodoc", "Set the offset <off> on the face <f>.

Parameters
----------
F: TopoDS_Face
Off: float

Returns
-------
None
") SetOffsetOnFace;
		void SetOffsetOnFace(const TopoDS_Face & F, const Standard_Real Off);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


%extend BRepOffset_MakeOffset {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetAnalyse(self):
		pass
	}
};

/************************************
* class BRepOffset_MakeSimpleOffset *
************************************/
class BRepOffset_MakeSimpleOffset {
	public:
		/****************** BRepOffset_MakeSimpleOffset ******************/
		/**** md5 signature: 2c6611a6b659d792eed00a13961fb53b ****/
		%feature("compactdefaultargs") BRepOffset_MakeSimpleOffset;
		%feature("autodoc", "Constructor. does nothing.

Returns
-------
None
") BRepOffset_MakeSimpleOffset;
		 BRepOffset_MakeSimpleOffset();

		/****************** BRepOffset_MakeSimpleOffset ******************/
		/**** md5 signature: 7c34a0a9350729d65f444070ff18aeca ****/
		%feature("compactdefaultargs") BRepOffset_MakeSimpleOffset;
		%feature("autodoc", "Constructor.

Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: float

Returns
-------
None
") BRepOffset_MakeSimpleOffset;
		 BRepOffset_MakeSimpleOffset(const TopoDS_Shape & theInputShape, const Standard_Real theOffsetValue);

		/****************** Generated ******************/
		/**** md5 signature: 24159a2591570d74b47fceb984e706dd ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returnes result shape for the given one (if exists).

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Generated;
		const TopoDS_Shape Generated(const TopoDS_Shape & theShape);

		/****************** GetBuildSolidFlag ******************/
		/**** md5 signature: afbccb55f157dbee65be1e2d2ebd6c2b ****/
		%feature("compactdefaultargs") GetBuildSolidFlag;
		%feature("autodoc", "Gets solid building flag.

Returns
-------
bool
") GetBuildSolidFlag;
		Standard_Boolean GetBuildSolidFlag();

		/****************** GetError ******************/
		/**** md5 signature: 6c2f2530ac0f252c40f9e7ae6ee1cceb ****/
		%feature("compactdefaultargs") GetError;
		%feature("autodoc", "Gets error code.

Returns
-------
BRepOffsetSimple_Status
") GetError;
		BRepOffsetSimple_Status GetError();

		/****************** GetErrorMessage ******************/
		/**** md5 signature: acb01a02dfab36d96178c70a4923d04f ****/
		%feature("compactdefaultargs") GetErrorMessage;
		%feature("autodoc", "Gets error message.

Returns
-------
TCollection_AsciiString
") GetErrorMessage;
		TCollection_AsciiString GetErrorMessage();

		/****************** GetOffsetValue ******************/
		/**** md5 signature: 8005d5a499c0ed572037768baf367387 ****/
		%feature("compactdefaultargs") GetOffsetValue;
		%feature("autodoc", "Gets offset value.

Returns
-------
float
") GetOffsetValue;
		Standard_Real GetOffsetValue();

		/****************** GetResultShape ******************/
		/**** md5 signature: 587cfc26c0e74835b70343e649833966 ****/
		%feature("compactdefaultargs") GetResultShape;
		%feature("autodoc", "Returns result shape.

Returns
-------
TopoDS_Shape
") GetResultShape;
		const TopoDS_Shape GetResultShape();

		/****************** GetTolerance ******************/
		/**** md5 signature: 08094ae040a166d1b252ee02000bca27 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Gets tolerance (used for handling singularities).

Returns
-------
float
") GetTolerance;
		Standard_Real GetTolerance();

		/****************** Initialize ******************/
		/**** md5 signature: 53d0474fdce0ccd7a1ef47f942278ecf ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialies shape for modifications.

Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: float

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Shape & theInputShape, const Standard_Real theOffsetValue);

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Gets done state.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Modified ******************/
		/**** md5 signature: 0ab0361e49e1bf256b9fc5a21ac6a9fa ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returnes modified shape for the given one (if exists).

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Modified;
		const TopoDS_Shape Modified(const TopoDS_Shape & theShape);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes offset shape.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetBuildSolidFlag ******************/
		/**** md5 signature: c186cdaaf2a4ad2b8f5b88a7059cdef8 ****/
		%feature("compactdefaultargs") SetBuildSolidFlag;
		%feature("autodoc", "Sets solid building flag.

Parameters
----------
theBuildFlag: bool

Returns
-------
None
") SetBuildSolidFlag;
		void SetBuildSolidFlag(const Standard_Boolean theBuildFlag);

		/****************** SetOffsetValue ******************/
		/**** md5 signature: 44f68d85ca5c9845fd9b46e2a40b5809 ****/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "Sets offset value.

Parameters
----------
theOffsetValue: float

Returns
-------
None
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real theOffsetValue);

		/****************** SetTolerance ******************/
		/**** md5 signature: a3fa8276dd955a9eca26b4c2f0297293 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance (used for handling singularities).

Parameters
----------
theValue: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theValue);

};


%extend BRepOffset_MakeSimpleOffset {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetSafeOffset(self):
		pass
	}
};

/**************************
* class BRepOffset_Offset *
**************************/
class BRepOffset_Offset {
	public:
		/****************** BRepOffset_Offset ******************/
		/**** md5 signature: c8f3208843098580d5c3b0e183e1bd08 ****/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepOffset_Offset;
		 BRepOffset_Offset();

		/****************** BRepOffset_Offset ******************/
		/**** md5 signature: 437bfe065cea9e5e95955d607da221a3 ****/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "No available documentation.

Parameters
----------
Face: TopoDS_Face
Offset: float
OffsetOutside: bool,optional
	default value is Standard_True
JoinType: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc

Returns
-------
None
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Face & Face, const Standard_Real Offset, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****************** BRepOffset_Offset ******************/
		/**** md5 signature: 4a75c6b0a6934ea4df38a31848783ca4 ****/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "This method will be called when you want to share the edges soon generated from an other face. e.g. when two faces are tangents the common edge will generate only one edge ( no pipe). //! the map will be fill as follow: //! created(e) = e' with: e = an edge of <face> e' = the image of e in the offseting of another face sharing e with a continuity at least g1.

Parameters
----------
Face: TopoDS_Face
Offset: float
Created: TopTools_DataMapOfShapeShape
OffsetOutside: bool,optional
	default value is Standard_True
JoinType: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc

Returns
-------
None
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Face & Face, const Standard_Real Offset, const TopTools_DataMapOfShapeShape & Created, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****************** BRepOffset_Offset ******************/
		/**** md5 signature: bb5cc63e26c23084ecb636562559cbc8 ****/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
Polynomial: bool,optional
	default value is Standard_False
Tol: float,optional
	default value is 1.0e-4
Conti: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****************** BRepOffset_Offset ******************/
		/**** md5 signature: 1f1985d1da5333df78eb516e6ac644fc ****/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
FirstEdge: TopoDS_Edge
LastEdge: TopoDS_Edge
Polynomial: bool,optional
	default value is Standard_False
Tol: float,optional
	default value is 1.0e-4
Conti: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & LastEdge, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****************** BRepOffset_Offset ******************/
		/**** md5 signature: 4855766d144a61e46d61e820d1f2151a ****/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "Tol and conti are only used if polynomial is true (used to perfrom the approximation).

Parameters
----------
Vertex: TopoDS_Vertex
LEdge: TopTools_ListOfShape
Offset: float
Polynomial: bool,optional
	default value is Standard_False
Tol: float,optional
	default value is 1.0e-4
Conti: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Vertex & Vertex, const TopTools_ListOfShape & LEdge, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Generated ******************/
		/**** md5 signature: 4b497355061beb062439833cbae45ea2 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "No available documentation.

Parameters
----------
Shape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Generated;
		TopoDS_Shape Generated(const TopoDS_Shape & Shape);

		/****************** Init ******************/
		/**** md5 signature: 3a68f402572d681d4c17a71ba2fdb9b5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Face: TopoDS_Face
Offset: float
OffsetOutside: bool,optional
	default value is Standard_True
JoinType: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & Face, const Standard_Real Offset, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****************** Init ******************/
		/**** md5 signature: 19063387060128596dfcb45e0fdddf16 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Face: TopoDS_Face
Offset: float
Created: TopTools_DataMapOfShapeShape
OffsetOutside: bool,optional
	default value is Standard_True
JoinType: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & Face, const Standard_Real Offset, const TopTools_DataMapOfShapeShape & Created, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****************** Init ******************/
		/**** md5 signature: 4bd28a339c6559997bae6b5288d7c230 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
Polynomial: bool,optional
	default value is Standard_False
Tol: float,optional
	default value is 1.0e-4
Conti: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****************** Init ******************/
		/**** md5 signature: 8a7df373becb560968aaa7122510deee ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
FirstEdge: TopoDS_Edge
LastEdge: TopoDS_Edge
Polynomial: bool,optional
	default value is Standard_False
Tol: float,optional
	default value is 1.0e-4
Conti: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & LastEdge, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****************** Init ******************/
		/**** md5 signature: a55d171e913f36f0b4e55051d82643fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Tol and conti are only used if polynomial is true (used to perfrom the approximation).

Parameters
----------
Vertex: TopoDS_Vertex
LEdge: TopTools_ListOfShape
Offset: float
Polynomial: bool,optional
	default value is Standard_False
Tol: float,optional
	default value is 1.0e-4
Conti: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Init;
		void Init(const TopoDS_Vertex & Vertex, const TopTools_ListOfShape & LEdge, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****************** Init ******************/
		/**** md5 signature: 1341190a002936fc491df39baf5b3ca9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Only used in rolling ball. pipe on free boundary.

Parameters
----------
Edge: TopoDS_Edge
Offset: float

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & Edge, const Standard_Real Offset);

		/****************** InitialShape ******************/
		/**** md5 signature: 5f6722b58fccd1ce05b74f389a5c01d1 ****/
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") InitialShape;
		const TopoDS_Shape InitialShape();

		/****************** Status ******************/
		/**** md5 signature: da8e3318d740bacf96581cfe65805812 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepOffset_Status
") Status;
		BRepOffset_Status Status();

};


%extend BRepOffset_Offset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepOffset_SimpleOffset *
********************************/
class BRepOffset_SimpleOffset : public BRepTools_Modification {
	public:
		class NewFaceData {};
		class NewEdgeData {};
		class NewVertexData {};
		/****************** BRepOffset_SimpleOffset ******************/
		/**** md5 signature: 71b0def4cf7676180a8d1b531617bb92 ****/
		%feature("compactdefaultargs") BRepOffset_SimpleOffset;
		%feature("autodoc", "Constructor. @param theinputshape shape to be offset @param theoffsetvalue offset distance (signed) @param thetolerance tolerance for handling singular points.

Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: float
theTolerance: float

Returns
-------
None
") BRepOffset_SimpleOffset;
		 BRepOffset_SimpleOffset(const TopoDS_Shape & theInputShape, const Standard_Real theOffsetValue, const Standard_Real theTolerance);

		/****************** Continuity ******************/
		/**** md5 signature: a3c3d5a955b90f2e1cefb3c12dc67277 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of <newe> between <newf1> and <newf2>. //! <newe> is the new edge created from <e>. <newf1> (resp. <newf2>) is the new face created from <f1> (resp. <f2>).

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****************** NewCurve ******************/
		/**** md5 signature: fae0c201ae8f07a170a1eb576572768a ****/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Returns standard_true if the edge <e> has been modified. in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Returns
-------
Tol: float
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		/**** md5 signature: ea858177828b71b789a2564d89f64210 ****/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "Returns standard_true if the edge <e> has a new curve on surface on the face <f>.in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Returns
-------
Tol: float
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****************** NewParameter ******************/
		/**** md5 signature: e14926b54c8548936ba9a49d140b8da3 ****/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "Returns standard_true if the vertex <v> has a new parameter on the edge <e>. in this case, <p> is the parameter, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
P: float
Tol: float
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewPoint ******************/
		/**** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ****/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "Returns standard_true if the vertex <v> has been modified. in this case, <p> is the new geometric support of the vertex, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Returns
-------
Tol: float
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****************** NewSurface ******************/
		/**** md5 signature: 001097e1d949f85581f605ce49276ada ****/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "Returns standard_true if the face <f> has been modified. in this case, <s> is the new geometric support of the face, <l> the new location,<tol> the new tolerance.<revwires> has to be set to standard_true when the modification reverses the normal of the surface.(the wires have to be reversed). <revface> has to be set to standard_true if the orientation of the modified face changes in the shells which contain it. -- here, <revface> will return standard_true if the -- gp_trsf is negative.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Returns
-------
Tol: float
RevWires: bool
RevFace: bool
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

};


%make_alias(BRepOffset_SimpleOffset)

%extend BRepOffset_SimpleOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepOffset_Tool *
************************/
class BRepOffset_Tool {
	public:
		/****************** BuildNeighbour ******************/
		/**** md5 signature: a28f37b6f4d122d4be23e183e5091239 ****/
		%feature("compactdefaultargs") BuildNeighbour;
		%feature("autodoc", "Via the wire explorer store in <nonv1> for an edge <e> of <w> his edge neighbour on the first vertex <v1> of <e>. store in nonv2 the neighbour of <e>on the last vertex <v2> of <e>.

Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face
NOnV1: TopTools_DataMapOfShapeShape
NOnV2: TopTools_DataMapOfShapeShape

Returns
-------
None
") BuildNeighbour;
		static void BuildNeighbour(const TopoDS_Wire & W, const TopoDS_Face & F, TopTools_DataMapOfShapeShape & NOnV1, TopTools_DataMapOfShapeShape & NOnV2);

		/****************** CheckBounds ******************/
		/**** md5 signature: b72d73cb62464608149927e8690b009d ****/
		%feature("compactdefaultargs") CheckBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
Analyse: BRepOffset_Analyse

Returns
-------
enlargeU: bool
enlargeVfirst: bool
enlargeVlast: bool
") CheckBounds;
		static void CheckBounds(const TopoDS_Face & F, const BRepOffset_Analyse & Analyse, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** CheckPlanesNormals ******************/
		/**** md5 signature: 0dfa65e060f5df310856444063f6f7e4 ****/
		%feature("compactdefaultargs") CheckPlanesNormals;
		%feature("autodoc", "Compares the normal directions of the planar faces and returns true if the directions are the same with the given precision.

Parameters
----------
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theTolAng: float,optional
	default value is 1e-8

Returns
-------
bool
") CheckPlanesNormals;
		static Standard_Boolean CheckPlanesNormals(const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const Standard_Real theTolAng = 1e-8);

		/****************** CorrectOrientation ******************/
		/**** md5 signature: 9d3cc66bdf3e936d8cd864f5768e0f35 ****/
		%feature("compactdefaultargs") CorrectOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
SI: TopoDS_Shape
NewEdges: TopTools_IndexedMapOfShape
AsDes: BRepAlgo_AsDes
InitOffset: BRepAlgo_Image
Offset: float

Returns
-------
None
") CorrectOrientation;
		static void CorrectOrientation(const TopoDS_Shape & SI, const TopTools_IndexedMapOfShape & NewEdges, opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & InitOffset, const Standard_Real Offset);

		/****************** Deboucle3D ******************/
		/**** md5 signature: 604726f64f42702b8591f042f704509e ****/
		%feature("compactdefaultargs") Deboucle3D;
		%feature("autodoc", "Remove the non valid part of an offsetshape 1 - remove all the free boundary and the faces connex to such edges. 2 - remove all the shapes not valid in the result (according to the side of offseting) in this verion only the first point is implemented.

Parameters
----------
S: TopoDS_Shape
Boundary: TopTools_MapOfShape

Returns
-------
TopoDS_Shape
") Deboucle3D;
		static TopoDS_Shape Deboucle3D(const TopoDS_Shape & S, const TopTools_MapOfShape & Boundary);

		/****************** EdgeVertices ******************/
		/**** md5 signature: 5ea655ac8e07a63dd8753acf779f31df ****/
		%feature("compactdefaultargs") EdgeVertices;
		%feature("autodoc", "<v1> is the firstvertex ,<v2> is the last vertex of <edge> taking account the orientation of edge.

Parameters
----------
E: TopoDS_Edge
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") EdgeVertices;
		static void EdgeVertices(const TopoDS_Edge & E, TopoDS_Vertex & V1, TopoDS_Vertex & V2);

		/****************** EnLargeFace ******************/
		/**** md5 signature: 32b678a9e8c54375869c991fb479becc ****/
		%feature("compactdefaultargs") EnLargeFace;
		%feature("autodoc", "Returns true if the surface of <nf> has changed. if <changegeom> is true , the surface can be changed . if <updatepcurve> is true, update the pcurves of the edges of <f> on the new surface if the surface has been changed. <enlargeu>, <enlargevfirst>, <enlargevlast> allow or forbid enlargement in u and v directions correspondingly. <theextensionmode> is a mode of extension of the surface of the face: if <theextensionmode> equals 1, potentially infinite surfaces are extended by maximum value, and limited surfaces are extended by 25%. if <theextensionmode> equals 2, potentially infinite surfaces are extended by 10*(correspondent size of face), and limited surfaces are extended by 100%. <thelenbeforeufirst>, <thelenafterulast>, <thelenbeforevfirst>, <thelenaftervlast> set the values of enlargement on correspondent directions. if some of them equals -1, the default value of enlargement is used.

Parameters
----------
F: TopoDS_Face
NF: TopoDS_Face
ChangeGeom: bool
UpDatePCurve: bool,optional
	default value is Standard_False
enlargeU: bool,optional
	default value is Standard_True
enlargeVfirst: bool,optional
	default value is Standard_True
enlargeVlast: bool,optional
	default value is Standard_True
theExtensionMode: int,optional
	default value is 1
theLenBeforeUfirst: float,optional
	default value is -1
theLenAfterUlast: float,optional
	default value is -1
theLenBeforeVfirst: float,optional
	default value is -1
theLenAfterVlast: float,optional
	default value is -1

Returns
-------
bool
") EnLargeFace;
		static Standard_Boolean EnLargeFace(const TopoDS_Face & F, TopoDS_Face & NF, const Standard_Boolean ChangeGeom, const Standard_Boolean UpDatePCurve = Standard_False, const Standard_Boolean enlargeU = Standard_True, const Standard_Boolean enlargeVfirst = Standard_True, const Standard_Boolean enlargeVlast = Standard_True, const Standard_Integer theExtensionMode = 1, const Standard_Real theLenBeforeUfirst = -1, const Standard_Real theLenAfterUlast = -1, const Standard_Real theLenBeforeVfirst = -1, const Standard_Real theLenAfterVlast = -1);

		/****************** ExtentFace ******************/
		/**** md5 signature: d938056ae787508cd23604b5ea458319 ****/
		%feature("compactdefaultargs") ExtentFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
ConstShapes: TopTools_DataMapOfShapeShape
ToBuild: TopTools_DataMapOfShapeShape
Side: TopAbs_State
TolConf: float
NF: TopoDS_Face

Returns
-------
None
") ExtentFace;
		static void ExtentFace(const TopoDS_Face & F, TopTools_DataMapOfShapeShape & ConstShapes, TopTools_DataMapOfShapeShape & ToBuild, const TopAbs_State Side, const Standard_Real TolConf, TopoDS_Face & NF);

		/****************** FindCommonShapes ******************/
		/**** md5 signature: a7aabaa5fd2a7f63f2ea432a10f3e5dc ****/
		%feature("compactdefaultargs") FindCommonShapes;
		%feature("autodoc", "Looks for the common vertices and edges between faces <thef1> and <thef2>. returns true if common shapes have been found. <thele> will contain the found common edges; <thelv> will contain the found common vertices.

Parameters
----------
theF1: TopoDS_Face
theF2: TopoDS_Face
theLE: TopTools_ListOfShape
theLV: TopTools_ListOfShape

Returns
-------
bool
") FindCommonShapes;
		static Standard_Boolean FindCommonShapes(const TopoDS_Face & theF1, const TopoDS_Face & theF2, TopTools_ListOfShape & theLE, TopTools_ListOfShape & theLV);

		/****************** FindCommonShapes ******************/
		/**** md5 signature: e7a853c19bc762b01f607dbc90f0c46d ****/
		%feature("compactdefaultargs") FindCommonShapes;
		%feature("autodoc", "Looks for the common shapes of type <thetype> between shapes <thes1> and <thes2>. returns true if common shapes have been found. <thelsc> will contain the found common shapes.

Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theType: TopAbs_ShapeEnum
theLSC: TopTools_ListOfShape

Returns
-------
bool
") FindCommonShapes;
		static Standard_Boolean FindCommonShapes(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const TopAbs_ShapeEnum theType, TopTools_ListOfShape & theLSC);

		/****************** Gabarit ******************/
		/**** md5 signature: a40315c829a5e7b8a2ab7df58b9007bc ****/
		%feature("compactdefaultargs") Gabarit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCurve: Geom_Curve

Returns
-------
float
") Gabarit;
		static Standard_Real Gabarit(const opencascade::handle<Geom_Curve> & aCurve);

		/****************** Inter2d ******************/
		/**** md5 signature: fa9a0b167e8c0cdb46f9c397757bc304 ****/
		%feature("compactdefaultargs") Inter2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
LV: TopTools_ListOfShape
Tol: float

Returns
-------
None
") Inter2d;
		static void Inter2d(const TopoDS_Face & F, const TopoDS_Edge & E1, const TopoDS_Edge & E2, TopTools_ListOfShape & LV, const Standard_Real Tol);

		/****************** Inter3D ******************/
		/**** md5 signature: 411d6729c1367e207c90ad10f6b9f34e ****/
		%feature("compactdefaultargs") Inter3D;
		%feature("autodoc", "Computes the section betwwen <f1> and <f2> the edges solution are stored in <lint1> with the orientation on <f1>, the sames edges are stored in <lint2> with the orientation on <f2>.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State
RefEdge: TopoDS_Edge
IsRefEdgeDefined: bool,optional
	default value is Standard_False

Returns
-------
None
") Inter3D;
		static void Inter3D(const TopoDS_Face & F1, const TopoDS_Face & F2, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side, const TopoDS_Edge & RefEdge, const Standard_Boolean IsRefEdgeDefined = Standard_False);

		/****************** InterOrExtent ******************/
		/**** md5 signature: b59609d22996a8309b9d7db1980b24a8 ****/
		%feature("compactdefaultargs") InterOrExtent;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State

Returns
-------
None
") InterOrExtent;
		static void InterOrExtent(const TopoDS_Face & F1, const TopoDS_Face & F2, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side);

		/****************** MapVertexEdges ******************/
		/**** md5 signature: 7d4a209715b6baf8eb33636cf7fd6c35 ****/
		%feature("compactdefaultargs") MapVertexEdges;
		%feature("autodoc", "Store in mve for a vertex <v> in <s> the incident edges <e> in <s>. an edge is store only one time for a vertex.

Parameters
----------
S: TopoDS_Shape
MVE: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") MapVertexEdges;
		static void MapVertexEdges(const TopoDS_Shape & S, TopTools_DataMapOfShapeListOfShape & MVE);

		/****************** OriEdgeInFace ******************/
		/**** md5 signature: 95f49dc13a0638efd436e12255315ccc ****/
		%feature("compactdefaultargs") OriEdgeInFace;
		%feature("autodoc", "Returns the cumul of the orientation of <edge> and thc containing wire in <face>.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
TopAbs_Orientation
") OriEdgeInFace;
		static TopAbs_Orientation OriEdgeInFace(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** OrientSection ******************/
		/**** md5 signature: 6fcc8549a4ba547fa845250a54719b66 ****/
		%feature("compactdefaultargs") OrientSection;
		%feature("autodoc", "<e> is a section between <f1> and <f2>. computes <o1> the orientation of <e> in <f1> influenced by <f2>. idem for <o2>.

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
O1: TopAbs_Orientation
O2: TopAbs_Orientation

Returns
-------
None
") OrientSection;
		static void OrientSection(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, TopAbs_Orientation & O1, TopAbs_Orientation & O2);

		/****************** PipeInter ******************/
		/**** md5 signature: 4a2946fb95668689d418fe298066dda2 ****/
		%feature("compactdefaultargs") PipeInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State

Returns
-------
None
") PipeInter;
		static void PipeInter(const TopoDS_Face & F1, const TopoDS_Face & F2, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side);

		/****************** TryProject ******************/
		/**** md5 signature: 46f6f98b477f357764edb8db800b34f8 ****/
		%feature("compactdefaultargs") TryProject;
		%feature("autodoc", "Find if the edges <edges> of the face <f2> are on the face <f1>. set in <lint1> <lint2> the updated edges. if all the edges are computed, returns true.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
Edges: TopTools_ListOfShape
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State
TolConf: float

Returns
-------
bool
") TryProject;
		static Standard_Boolean TryProject(const TopoDS_Face & F1, const TopoDS_Face & F2, const TopTools_ListOfShape & Edges, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side, const Standard_Real TolConf);

};


%extend BRepOffset_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
