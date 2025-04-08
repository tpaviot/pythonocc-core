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
%define BREPOFFSETDOCSTRING
"BRepOffset module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepoffset.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BRepOffset_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<ChFiDS_module.hxx>
#include<Message_module.hxx>
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
#include<Law_module.hxx>
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
%import ChFiDS.i
%import Message.i
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
	BRepOffset_CannotTrimEdges = 6,
	BRepOffset_CannotFuseVertices = 7,
	BRepOffset_CannotExtentEdge = 8,
	BRepOffset_UserBreak = 9,
	BRepOffset_MixedConnectivity = 10,
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

enum BRepOffset_Status {
	BRepOffset_Good = 0,
	BRepOffset_Reversed = 1,
	BRepOffset_Degenerated = 2,
	BRepOffset_Unknown = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BRepOffset_Error(IntEnum):
	BRepOffset_NoError = 0
	BRepOffset_UnknownError = 1
	BRepOffset_BadNormalsOnGeometry = 2
	BRepOffset_C0Geometry = 3
	BRepOffset_NullOffset = 4
	BRepOffset_NotConnectedShell = 5
	BRepOffset_CannotTrimEdges = 6
	BRepOffset_CannotFuseVertices = 7
	BRepOffset_CannotExtentEdge = 8
	BRepOffset_UserBreak = 9
	BRepOffset_MixedConnectivity = 10
BRepOffset_NoError = BRepOffset_Error.BRepOffset_NoError
BRepOffset_UnknownError = BRepOffset_Error.BRepOffset_UnknownError
BRepOffset_BadNormalsOnGeometry = BRepOffset_Error.BRepOffset_BadNormalsOnGeometry
BRepOffset_C0Geometry = BRepOffset_Error.BRepOffset_C0Geometry
BRepOffset_NullOffset = BRepOffset_Error.BRepOffset_NullOffset
BRepOffset_NotConnectedShell = BRepOffset_Error.BRepOffset_NotConnectedShell
BRepOffset_CannotTrimEdges = BRepOffset_Error.BRepOffset_CannotTrimEdges
BRepOffset_CannotFuseVertices = BRepOffset_Error.BRepOffset_CannotFuseVertices
BRepOffset_CannotExtentEdge = BRepOffset_Error.BRepOffset_CannotExtentEdge
BRepOffset_UserBreak = BRepOffset_Error.BRepOffset_UserBreak
BRepOffset_MixedConnectivity = BRepOffset_Error.BRepOffset_MixedConnectivity

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
		/****** BRepOffset::CollapseSingularities ******/
		/****** md5 signature: 034b9c1b6a9d8f007623ce760360780f ******/
		%feature("compactdefaultargs") CollapseSingularities;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface
theFace: TopoDS_Face
thePrecision: float

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Preprocess surface to be offset (bspline, bezier, or revolution based on bspline or bezier curve), by collapsing each singular side to single point. //! This is to avoid possible flipping of normal at the singularity of the surface due to non-zero distance between the poles that logically should be in one point (singularity). //! The (parametric) side of the surface is considered to be singularity if face has degenerated edge whose vertex encompasses (by its tolerance) all points on that side, or if all poles defining that side fit into sphere with radius thePrecision. //! Returns either original surface or its modified copy (if some poles have been moved).
") CollapseSingularities;
		static opencascade::handle<Geom_Surface> CollapseSingularities(const opencascade::handle<Geom_Surface> & theSurface, const TopoDS_Face & theFace, Standard_Real thePrecision);

		/****** BRepOffset::Surface ******/
		/****** md5 signature: e1ef2a62c87237ebec16000ed6f138e9 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
Offset: float
allowC0: bool (optional, default to Standard_False)

Return
-------
theStatus: BRepOffset_Status

Description
-----------
returns the Offset surface computed from the surface <Surface> at an OffsetDistance <Offset>. //! If possible, this method returns the real type of the surface ( e.g. An Offset of a plane is a plane). //! If no particular case is detected, the returned surface will have the Type Geom_OffsetSurface. Parameter allowC0 is then passed as last argument to constructor of Geom_OffsetSurface.
") Surface;
		static opencascade::handle<Geom_Surface> Surface(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Offset, BRepOffset_Status &OutValue, Standard_Boolean allowC0 = Standard_False);

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
		/****** BRepOffset_Analyse::BRepOffset_Analyse ******/
		/****** md5 signature: ba0b94f56b61c28244d4736b236bb3b0 ******/
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty c-tor.
") BRepOffset_Analyse;
		 BRepOffset_Analyse();

		/****** BRepOffset_Analyse::BRepOffset_Analyse ******/
		/****** md5 signature: 32be8a68049b0d08da84dac039a34740 ******/
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theAngle: float

Return
-------
None

Description
-----------
C-tor performing the job inside.
") BRepOffset_Analyse;
		 BRepOffset_Analyse(const TopoDS_Shape & theS, const Standard_Real theAngle);

		/****** BRepOffset_Analyse::AddFaces ******/
		/****** md5 signature: 10bf983ba568690274e73905dc585143 ******/
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theCo: TopoDS_Compound
theMap: TopTools_MapOfShape
theType: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
Add in <CO> the faces of the shell containing <Face> where all the connex edges are of type <Side>.
") AddFaces;
		void AddFaces(const TopoDS_Face & theFace, TopoDS_Compound & theCo, TopTools_MapOfShape & theMap, const ChFiDS_TypeOfConcavity theType);

		/****** BRepOffset_Analyse::AddFaces ******/
		/****** md5 signature: 17ecd6e6c902268447968b695dc71930 ******/
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theCo: TopoDS_Compound
theMap: TopTools_MapOfShape
theType1: ChFiDS_TypeOfConcavity
theType2: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
Add in <CO> the faces of the shell containing <Face> where all the connex edges are of type <Side1> or <Side2>.
") AddFaces;
		void AddFaces(const TopoDS_Face & theFace, TopoDS_Compound & theCo, TopTools_MapOfShape & theMap, const ChFiDS_TypeOfConcavity theType1, const ChFiDS_TypeOfConcavity theType2);

		/****** BRepOffset_Analyse::Ancestors ******/
		/****** md5 signature: 90ed8d8b7e6bec25a8cae6b70fba0fa0 ******/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns ancestors for the shape.
") Ancestors;
		const TopTools_ListOfShape & Ancestors(const TopoDS_Shape & theS);

		/****** BRepOffset_Analyse::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the algorithm.
") Clear;
		void Clear();

		/****** BRepOffset_Analyse::Descendants ******/
		/****** md5 signature: 7a77c04c1efdc14b9851c2f7c2f4a377 ******/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theUpdate: bool (optional, default to Standard_False)

Return
-------
TopTools_ListOfShape *

Description
-----------
Returns the shape descendants.
") Descendants;
		const TopTools_ListOfShape * Descendants(const TopoDS_Shape & theS, const Standard_Boolean theUpdate = Standard_False);

		/****** BRepOffset_Analyse::EdgeReplacement ******/
		/****** md5 signature: 0f27e29432c1193c65637801fb97edd1 ******/
		%feature("compactdefaultargs") EdgeReplacement;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Return
-------
TopoDS_Edge

Description
-----------
Returns the replacement of the edge in the face. If no replacement exists, returns the edge.
") EdgeReplacement;
		const TopoDS_Edge EdgeReplacement(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge);

		/****** BRepOffset_Analyse::Edges ******/
		/****** md5 signature: 2fa98c1f2dc772e02cb177190fc303c3 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theType: ChFiDS_TypeOfConcavity
theL: TopTools_ListOfShape

Return
-------
None

Description
-----------
Stores in <L> all the edges of Type <T> on the vertex <V>.
") Edges;
		void Edges(const TopoDS_Vertex & theV, const ChFiDS_TypeOfConcavity theType, TopTools_ListOfShape & theL);

		/****** BRepOffset_Analyse::Edges ******/
		/****** md5 signature: 8d2741a252b9cbab42c2cf270c42d66c ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theType: ChFiDS_TypeOfConcavity
theL: TopTools_ListOfShape

Return
-------
None

Description
-----------
Stores in <L> all the edges of Type <T> on the face <F>.
") Edges;
		void Edges(const TopoDS_Face & theF, const ChFiDS_TypeOfConcavity theType, TopTools_ListOfShape & theL);

		/****** BRepOffset_Analyse::Explode ******/
		/****** md5 signature: 337e429f1a29abab09c9fdc78da45c49 ******/
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "
Parameters
----------
theL: TopTools_ListOfShape
theType: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
Explode in compounds of faces where all the connex edges are of type <Side>.
") Explode;
		void Explode(TopTools_ListOfShape & theL, const ChFiDS_TypeOfConcavity theType);

		/****** BRepOffset_Analyse::Explode ******/
		/****** md5 signature: 5aaa8ac50d0f46e75f1b9dffcaa6d59d ******/
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "
Parameters
----------
theL: TopTools_ListOfShape
theType1: ChFiDS_TypeOfConcavity
theType2: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
Explode in compounds of faces where all the connex edges are of type <Side1> or <Side2>.
") Explode;
		void Explode(TopTools_ListOfShape & theL, const ChFiDS_TypeOfConcavity theType1, const ChFiDS_TypeOfConcavity theType2);

		/****** BRepOffset_Analyse::Generated ******/
		/****** md5 signature: 15ef1939924c301a6d85999ccd64b15d ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the new face constructed for the edge connecting the two tangent faces having different offset values.
") Generated;
		TopoDS_Shape Generated(const TopoDS_Shape & theS);

		/****** BRepOffset_Analyse::HasAncestor ******/
		/****** md5 signature: 3c3fc9ffdfc1554e2be2aa053b512d0e ******/
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks if the given shape has ancestors.
") HasAncestor;
		Standard_Boolean HasAncestor(const TopoDS_Shape & theS);

		/****** BRepOffset_Analyse::HasGenerated ******/
		/****** md5 signature: ec80c2122e56b4b50f0af6fcb37612cb ******/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks if the edge has generated a new face.
") HasGenerated;
		Standard_Boolean HasGenerated(const TopoDS_Shape & theS);

		/****** BRepOffset_Analyse::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns status of the algorithm.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepOffset_Analyse::NewFaces ******/
		/****** md5 signature: e63300f5b52c82ed31144b2ab659fa2a ******/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the new faces constructed between tangent faces having different offset values on the shape.
") NewFaces;
		const TopTools_ListOfShape & NewFaces();

		/****** BRepOffset_Analyse::Perform ******/
		/****** md5 signature: 15379b06ecba8382979b6910520f10b4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theAngle: float
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the analysis.
") Perform;
		void Perform(const TopoDS_Shape & theS, const Standard_Real theAngle, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffset_Analyse::SetFaceOffsetMap ******/
		/****** md5 signature: c0dee5c14e1fc5e4f89a0d54179182fd ******/
		%feature("compactdefaultargs") SetFaceOffsetMap;
		%feature("autodoc", "
Parameters
----------
theMap: TopTools_DataMapOfShapeReal

Return
-------
None

Description
-----------
Sets the face-offset data map to analyze tangential cases.
") SetFaceOffsetMap;
		void SetFaceOffsetMap(const TopTools_DataMapOfShapeReal & theMap);

		/****** BRepOffset_Analyse::SetOffsetValue ******/
		/****** md5 signature: d7b3a90c1f17c219c0f8c7b1b52b1a42 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
theOffset: float

Return
-------
None

Description
-----------
No available documentation.
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real theOffset);

		/****** BRepOffset_Analyse::TangentEdges ******/
		/****** md5 signature: fbdd90a0b988e4c630b58c2a22ee477d ******/
		%feature("compactdefaultargs") TangentEdges;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theVertex: TopoDS_Vertex
theEdges: TopTools_ListOfShape

Return
-------
None

Description
-----------
set in <Edges> all the Edges of <Shape> which are tangent to <Edge> at the vertex <Vertex>.
") TangentEdges;
		void TangentEdges(const TopoDS_Edge & theEdge, const TopoDS_Vertex & theVertex, TopTools_ListOfShape & theEdges);

		/****** BRepOffset_Analyse::Type ******/
		/****** md5 signature: 75adf48a4d01680f070dfc5502b046c1 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge

Return
-------
BRepOffset_ListOfInterval

Description
-----------
Returns the connectivity type of the edge.
") Type;
		const BRepOffset_ListOfInterval & Type(const TopoDS_Edge & theE);

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
		/****** BRepOffset_Inter2d::Compute ******/
		/****** md5 signature: 8676c4f6ddf0fb8dbe22fb366209c8f2 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
AsDes: BRepAlgo_AsDes
F: TopoDS_Face
NewEdges: TopTools_IndexedMapOfShape
Tol: float
theEdgeIntEdges: TopTools_DataMapOfShapeListOfShape
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
Computes the intersections between the edges stored is AsDes as descendants of <F> . Intersections is computed between two edges if one of them is bound in NewEdges. When all faces of the shape are treated the intersection vertices have to be fused using the FuseVertices method. theDMVV contains the vertices that should be fused.
") Compute;
		static void Compute(const opencascade::handle<BRepAlgo_AsDes> & AsDes, const TopoDS_Face & F, const TopTools_IndexedMapOfShape & NewEdges, const Standard_Real Tol, const TopTools_DataMapOfShapeListOfShape & theEdgeIntEdges, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter2d::ConnexIntByInt ******/
		/****** md5 signature: 1d06e218233c0cb963048a32785e6a20 ******/
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "
Parameters
----------
FI: TopoDS_Face
OFI: BRepOffset_Offset
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
theAsDes: BRepAlgo_AsDes
AsDes2d: BRepAlgo_AsDes
Offset: float
Tol: float
Analyse: BRepOffset_Analyse
FacesWithVerts: TopTools_IndexedMapOfShape
theImageVV: BRepAlgo_Image
theEdgeIntEdges: TopTools_DataMapOfShapeListOfShape
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape
theRange: Message_ProgressRange

Return
-------
bool

Description
-----------
Computes the intersection between the offset edges of the <FI>. All intersection vertices will be stored in AsDes2d. When all faces of the shape are treated the intersection vertices have to be fused using the FuseVertices method. theDMVV contains the vertices that should be fused.
") ConnexIntByInt;
		static Standard_Boolean ConnexIntByInt(const TopoDS_Face & FI, BRepOffset_Offset & OFI, TopTools_DataMapOfShapeShape & MES, const TopTools_DataMapOfShapeShape & Build, const opencascade::handle<BRepAlgo_AsDes> & theAsDes, const opencascade::handle<BRepAlgo_AsDes> & AsDes2d, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Analyse & Analyse, TopTools_IndexedMapOfShape & FacesWithVerts, BRepAlgo_Image & theImageVV, TopTools_DataMapOfShapeListOfShape & theEdgeIntEdges, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter2d::ConnexIntByIntInVert ******/
		/****** md5 signature: 29b216d0fc2dd04c81eddf2b9ff0af69 ******/
		%feature("compactdefaultargs") ConnexIntByIntInVert;
		%feature("autodoc", "
Parameters
----------
FI: TopoDS_Face
OFI: BRepOffset_Offset
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
AsDes: BRepAlgo_AsDes
AsDes2d: BRepAlgo_AsDes
Tol: float
Analyse: BRepOffset_Analyse
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
Computes the intersection between the offset edges generated from vertices and stored into AsDes as descendants of the <FI>. All intersection vertices will be stored in AsDes2d. When all faces of the shape are treated the intersection vertices have to be fused using the FuseVertices method. theDMVV contains the vertices that should be fused.
") ConnexIntByIntInVert;
		static void ConnexIntByIntInVert(const TopoDS_Face & FI, BRepOffset_Offset & OFI, TopTools_DataMapOfShapeShape & MES, const TopTools_DataMapOfShapeShape & Build, const opencascade::handle<BRepAlgo_AsDes> & AsDes, const opencascade::handle<BRepAlgo_AsDes> & AsDes2d, const Standard_Real Tol, const BRepOffset_Analyse & Analyse, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter2d::ExtentEdge ******/
		/****** md5 signature: b18af25b66d4abbae97b9437f24da597 ******/
		%feature("compactdefaultargs") ExtentEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
NE: TopoDS_Edge
theOffset: float

Return
-------
bool

Description
-----------
extents the edge.
") ExtentEdge;
		static Standard_Boolean ExtentEdge(const TopoDS_Edge & E, TopoDS_Edge & NE, const Standard_Real theOffset);

		/****** BRepOffset_Inter2d::FuseVertices ******/
		/****** md5 signature: 13e662b268b3ad2a3fc5abb84641c05a ******/
		%feature("compactdefaultargs") FuseVertices;
		%feature("autodoc", "
Parameters
----------
theDMVV: TopTools_IndexedDataMapOfShapeListOfShape
theAsDes: BRepAlgo_AsDes
theImageVV: BRepAlgo_Image

Return
-------
bool

Description
-----------
Fuses the chains of vertices in the theDMVV and updates AsDes by replacing the old vertices with the new ones.
") FuseVertices;
		static Standard_Boolean FuseVertices(const TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const opencascade::handle<BRepAlgo_AsDes> & theAsDes, BRepAlgo_Image & theImageVV);

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
		/****** BRepOffset_Inter3d::BRepOffset_Inter3d ******/
		/****** md5 signature: 9fd66aef3ebdcf13bcde09e6d645c2ee ******/
		%feature("compactdefaultargs") BRepOffset_Inter3d;
		%feature("autodoc", "
Parameters
----------
AsDes: BRepAlgo_AsDes
Side: TopAbs_State
Tol: float

Return
-------
None

Description
-----------
Constructor.
") BRepOffset_Inter3d;
		 BRepOffset_Inter3d(const opencascade::handle<BRepAlgo_AsDes> & AsDes, const TopAbs_State Side, const Standard_Real Tol);

		/****** BRepOffset_Inter3d::AsDes ******/
		/****** md5 signature: 31e3fa329859da45e4f2b833e342b7a0 ******/
		%feature("compactdefaultargs") AsDes;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepAlgo_AsDes>

Description
-----------
Returns AsDes tool.
") AsDes;
		opencascade::handle<BRepAlgo_AsDes> AsDes();

		/****** BRepOffset_Inter3d::CompletInt ******/
		/****** md5 signature: 3d14748ac531a357f6f40197c38eda01 ******/
		%feature("compactdefaultargs") CompletInt;
		%feature("autodoc", "
Parameters
----------
SetOfFaces: TopTools_ListOfShape
InitOffsetFace: BRepAlgo_Image
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
No available documentation.
") CompletInt;
		void CompletInt(const TopTools_ListOfShape & SetOfFaces, const BRepAlgo_Image & InitOffsetFace, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter3d::ConnexIntByArc ******/
		/****** md5 signature: 04b429aa49d7537664fab974813577f7 ******/
		%feature("compactdefaultargs") ConnexIntByArc;
		%feature("autodoc", "
Parameters
----------
SetOfFaces: TopTools_ListOfShape
ShapeInit: TopoDS_Shape
Analyse: BRepOffset_Analyse
InitOffsetFace: BRepAlgo_Image
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
Computes connections of the offset faces that have to be connected by arcs.
") ConnexIntByArc;
		void ConnexIntByArc(const TopTools_ListOfShape & SetOfFaces, const TopoDS_Shape & ShapeInit, const BRepOffset_Analyse & Analyse, const BRepAlgo_Image & InitOffsetFace, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter3d::ConnexIntByInt ******/
		/****** md5 signature: 0076ca9fe52ebefcccba69f1a02c3046 ******/
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "
Parameters
----------
SI: TopoDS_Shape
MapSF: BRepOffset_DataMapOfShapeOffset
A: BRepOffset_Analyse
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
Failed: TopTools_ListOfShape
theRange: Message_ProgressRange
bIsPlanar: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Computes intersection of the offset faces that have to be connected by sharp edges, i.e. it computes intersection between extended offset faces.
") ConnexIntByInt;
		void ConnexIntByInt(const TopoDS_Shape & SI, const BRepOffset_DataMapOfShapeOffset & MapSF, const BRepOffset_Analyse & A, TopTools_DataMapOfShapeShape & MES, TopTools_DataMapOfShapeShape & Build, TopTools_ListOfShape & Failed, const Message_ProgressRange & theRange, const Standard_Boolean bIsPlanar = Standard_False);

		/****** BRepOffset_Inter3d::ContextIntByArc ******/
		/****** md5 signature: 77469bdfc3371b922103cfe1e74b59c6 ******/
		%feature("compactdefaultargs") ContextIntByArc;
		%feature("autodoc", "
Parameters
----------
ContextFaces: TopTools_IndexedMapOfShape
ExtentContext: bool
Analyse: BRepOffset_Analyse
InitOffsetFace: BRepAlgo_Image
InitOffsetEdge: BRepAlgo_Image
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
Computes connections of the not offset faces that have to be connected by arcs.
") ContextIntByArc;
		void ContextIntByArc(const TopTools_IndexedMapOfShape & ContextFaces, const Standard_Boolean ExtentContext, const BRepOffset_Analyse & Analyse, const BRepAlgo_Image & InitOffsetFace, BRepAlgo_Image & InitOffsetEdge, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter3d::ContextIntByInt ******/
		/****** md5 signature: ae35b5925db57bda395571dcc47d3c11 ******/
		%feature("compactdefaultargs") ContextIntByInt;
		%feature("autodoc", "
Parameters
----------
ContextFaces: TopTools_IndexedMapOfShape
ExtentContext: bool
MapSF: BRepOffset_DataMapOfShapeOffset
A: BRepOffset_Analyse
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
Failed: TopTools_ListOfShape
theRange: Message_ProgressRange
bIsPlanar: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Computes intersection with not offset faces .
") ContextIntByInt;
		void ContextIntByInt(const TopTools_IndexedMapOfShape & ContextFaces, const Standard_Boolean ExtentContext, const BRepOffset_DataMapOfShapeOffset & MapSF, const BRepOffset_Analyse & A, TopTools_DataMapOfShapeShape & MES, TopTools_DataMapOfShapeShape & Build, TopTools_ListOfShape & Failed, const Message_ProgressRange & theRange, const Standard_Boolean bIsPlanar = Standard_False);

		/****** BRepOffset_Inter3d::FaceInter ******/
		/****** md5 signature: 62d9b8b2341ea348e10a9705c1e1a1d6 ******/
		%feature("compactdefaultargs") FaceInter;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
InitOffsetFace: BRepAlgo_Image

Return
-------
None

Description
-----------
Computes intersection of pair of faces.
") FaceInter;
		void FaceInter(const TopoDS_Face & F1, const TopoDS_Face & F2, const BRepAlgo_Image & InitOffsetFace);

		/****** BRepOffset_Inter3d::IsDone ******/
		/****** md5 signature: 8801efe525a67dac919cc689e660bf42 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
bool

Description
-----------
Checks if the pair of faces has already been treated.
") IsDone;
		Standard_Boolean IsDone(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRepOffset_Inter3d::NewEdges ******/
		/****** md5 signature: 975ce143c1c9ad7032004090c4ea255a ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
Returns new edges.
") NewEdges;
		TopTools_IndexedMapOfShape & NewEdges();

		/****** BRepOffset_Inter3d::SetDone ******/
		/****** md5 signature: d9f3a39ef77387fe413720595d42df62 ******/
		%feature("compactdefaultargs") SetDone;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
None

Description
-----------
Marks the pair of faces as already intersected.
") SetDone;
		void SetDone(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRepOffset_Inter3d::TouchedFaces ******/
		/****** md5 signature: e1597833f2e42e18789e5809f3a43359 ******/
		%feature("compactdefaultargs") TouchedFaces;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
Returns touched faces.
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
		/****** BRepOffset_Interval::BRepOffset_Interval ******/
		/****** md5 signature: 32b6085f345b38e32fe26ce2f9fd3dd1 ******/
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Interval;
		 BRepOffset_Interval();

		/****** BRepOffset_Interval::BRepOffset_Interval ******/
		/****** md5 signature: dccedca1cdcdc8f366498a03194313c3 ******/
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Type: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Interval;
		 BRepOffset_Interval(const Standard_Real U1, const Standard_Real U2, const ChFiDS_TypeOfConcavity Type);

		/****** BRepOffset_Interval::First ******/
		/****** md5 signature: 1099c5bd36f358fe828b1d6d585b9530 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
None

Description
-----------
No available documentation.
") First;
		void First(const Standard_Real U);

		/****** BRepOffset_Interval::First ******/
		/****** md5 signature: 009dd98af15e46b2da286731f40e1839 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") First;
		Standard_Real First();

		/****** BRepOffset_Interval::Last ******/
		/****** md5 signature: 118eadfc67f49ba000d3d60e0425edef ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
None

Description
-----------
No available documentation.
") Last;
		void Last(const Standard_Real U);

		/****** BRepOffset_Interval::Last ******/
		/****** md5 signature: 4c8063c237a4f73018a7949da8aef9fb ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Last;
		Standard_Real Last();

		/****** BRepOffset_Interval::Type ******/
		/****** md5 signature: b24169004495551132f32afd9d3903e6 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
T: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
No available documentation.
") Type;
		void Type(const ChFiDS_TypeOfConcavity T);

		/****** BRepOffset_Interval::Type ******/
		/****** md5 signature: 4bcc17f191edc1fc69fd29dda8361b02 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
ChFiDS_TypeOfConcavity

Description
-----------
No available documentation.
") Type;
		ChFiDS_TypeOfConcavity Type();

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
		/****** BRepOffset_MakeLoops::BRepOffset_MakeLoops ******/
		/****** md5 signature: 29ed29e42e0a574e9a47d70ba344ba9f ******/
		%feature("compactdefaultargs") BRepOffset_MakeLoops;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_MakeLoops;
		 BRepOffset_MakeLoops();

		/****** BRepOffset_MakeLoops::Build ******/
		/****** md5 signature: a3ef36c00947a38334570c219cb36bba ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
LF: TopTools_ListOfShape
AsDes: BRepAlgo_AsDes
Image: BRepAlgo_Image
theImageVV: BRepAlgo_Image
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
No available documentation.
") Build;
		void Build(const TopTools_ListOfShape & LF, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & Image, BRepAlgo_Image & theImageVV, const Message_ProgressRange & theRange);

		/****** BRepOffset_MakeLoops::BuildFaces ******/
		/****** md5 signature: db5370c8364c7b784d98eba5f5783e25 ******/
		%feature("compactdefaultargs") BuildFaces;
		%feature("autodoc", "
Parameters
----------
LF: TopTools_ListOfShape
AsDes: BRepAlgo_AsDes
Image: BRepAlgo_Image
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
No available documentation.
") BuildFaces;
		void BuildFaces(const TopTools_ListOfShape & LF, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & Image, const Message_ProgressRange & theRange);

		/****** BRepOffset_MakeLoops::BuildOnContext ******/
		/****** md5 signature: 3696d929e7c8f5753dbdac8d11ecc214 ******/
		%feature("compactdefaultargs") BuildOnContext;
		%feature("autodoc", "
Parameters
----------
LContext: TopTools_ListOfShape
Analyse: BRepOffset_Analyse
AsDes: BRepAlgo_AsDes
Image: BRepAlgo_Image
InSide: bool
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
No available documentation.
") BuildOnContext;
		void BuildOnContext(const TopTools_ListOfShape & LContext, const BRepOffset_Analyse & Analyse, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & Image, const Standard_Boolean InSide, const Message_ProgressRange & theRange);

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
		/****** BRepOffset_MakeOffset::BRepOffset_MakeOffset ******/
		/****** md5 signature: 41f8a468e07d2c2db2e9868220325beb ******/
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset();

		/****** BRepOffset_MakeOffset::BRepOffset_MakeOffset ******/
		/****** md5 signature: ee57348738e6773115f85db9e79ce047 ******/
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Offset: float
Tol: float
Mode: BRepOffset_Mode (optional, default to BRepOffset_Skin)
Intersection: bool (optional, default to Standard_False)
SelfInter: bool (optional, default to Standard_False)
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Thickening: bool (optional, default to Standard_False)
RemoveIntEdges: bool (optional, default to Standard_False)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset(const TopoDS_Shape & S, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Thickening = Standard_False, const Standard_Boolean RemoveIntEdges = Standard_False, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffset_MakeOffset::AddFace ******/
		/****** md5 signature: 5fecadaf3ef2e154bc4683eed0767084 ******/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Add Closing Faces, <F> has to be in the initial shape S.
") AddFace;
		void AddFace(const TopoDS_Face & F);

		/****** BRepOffset_MakeOffset::AllowLinearization ******/
		/****** md5 signature: fc3aa2ec2d80823e0e6cfd67abb9df4c ******/
		%feature("compactdefaultargs") AllowLinearization;
		%feature("autodoc", "
Parameters
----------
theIsAllowed: bool

Return
-------
None

Description
-----------
Changes the flag allowing the linearization.
") AllowLinearization;
		void AllowLinearization(const Standard_Boolean theIsAllowed);

		/****** BRepOffset_MakeOffset::CheckInputData ******/
		/****** md5 signature: 9afa07862279ffa138a4fd97c69973f1 ******/
		%feature("compactdefaultargs") CheckInputData;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange

Return
-------
bool

Description
-----------
Makes pre analysis of possibility offset perform. Use method Error() to get more information. Finds first error. List of checks: 1) Check for existence object with non-null offset. 2) Check for connectivity in offset shell. 3) Check continuity of input surfaces. 4) Check for normals existence on grid. 
Return: True if possible make computations and false otherwise.
") CheckInputData;
		Standard_Boolean CheckInputData(const Message_ProgressRange & theRange);

		/****** BRepOffset_MakeOffset::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** BRepOffset_MakeOffset::ClosingFaces ******/
		/****** md5 signature: 028fe8cbc6a2b90f162ab7ff10002b87 ******/
		%feature("compactdefaultargs") ClosingFaces;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
Returns the list of closing faces stores by AddFace.
") ClosingFaces;
		const TopTools_IndexedMapOfShape & ClosingFaces();

		/****** BRepOffset_MakeOffset::Error ******/
		/****** md5 signature: 204aa201182f580c2b3b629785fe7270 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepOffset_Error

Description
-----------
returns information about offset state.
") Error;
		BRepOffset_Error Error();

		/****** BRepOffset_MakeOffset::Generated ******/
		/****** md5 signature: 902551eb6fcfb35ec8c1137ae3d18685 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****** BRepOffset_MakeOffset::GetBadShape ******/
		/****** md5 signature: ba57b2eb9f7240c2efaee696f343f099 ******/
		%feature("compactdefaultargs") GetBadShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return bad shape, which obtained in CheckInputData.
") GetBadShape;
		const TopoDS_Shape GetBadShape();

		/****** BRepOffset_MakeOffset::GetJoinType ******/
		/****** md5 signature: 98bbd653674d56f0804dd681f91e2cf5 ******/
		%feature("compactdefaultargs") GetJoinType;
		%feature("autodoc", "Return
-------
GeomAbs_JoinType

Description
-----------
Returns myJoin.
") GetJoinType;
		GeomAbs_JoinType GetJoinType();

		/****** BRepOffset_MakeOffset::InitShape ******/
		/****** md5 signature: 4828a2e04f0d05c4aeddd543fb871f06 ******/
		%feature("compactdefaultargs") InitShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") InitShape;
		const TopoDS_Shape InitShape();

		/****** BRepOffset_MakeOffset::Initialize ******/
		/****** md5 signature: b189dc4c3027834b3cc5d35d26f288df ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Offset: float
Tol: float
Mode: BRepOffset_Mode (optional, default to BRepOffset_Skin)
Intersection: bool (optional, default to Standard_False)
SelfInter: bool (optional, default to Standard_False)
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Thickening: bool (optional, default to Standard_False)
RemoveIntEdges: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TopoDS_Shape & S, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Thickening = Standard_False, const Standard_Boolean RemoveIntEdges = Standard_False);

		/****** BRepOffset_MakeOffset::IsDeleted ******/
		/****** md5 signature: d29922d0ec4acc76ba876d76a5a2a863 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape S has been deleted.
") IsDeleted;
		Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****** BRepOffset_MakeOffset::IsDone ******/
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

		/****** BRepOffset_MakeOffset::MakeOffsetShape ******/
		/****** md5 signature: 90eb5beb7eaec8a61b9373222b37bf2a ******/
		%feature("compactdefaultargs") MakeOffsetShape;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") MakeOffsetShape;
		void MakeOffsetShape(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffset_MakeOffset::MakeThickSolid ******/
		/****** md5 signature: b65451d4fcfd016c468dfc9dd1fc4dc2 ******/
		%feature("compactdefaultargs") MakeThickSolid;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") MakeThickSolid;
		void MakeThickSolid(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffset_MakeOffset::Modified ******/
		/****** md5 signature: 5d9ac8e1ec1d1479a40fa0773fd021b0 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

		/****** BRepOffset_MakeOffset::OffsetEdgesFromShapes ******/
		/****** md5 signature: 68926d492e1e9d71593e4c5da8672674 ******/
		%feature("compactdefaultargs") OffsetEdgesFromShapes;
		%feature("autodoc", "Return
-------
BRepAlgo_Image

Description
-----------
Returns <Image> containing links between initials shapes and offset edges.
") OffsetEdgesFromShapes;
		const BRepAlgo_Image & OffsetEdgesFromShapes();

		/****** BRepOffset_MakeOffset::OffsetFacesFromShapes ******/
		/****** md5 signature: 29688b3f620832bbca96a758804ee150 ******/
		%feature("compactdefaultargs") OffsetFacesFromShapes;
		%feature("autodoc", "Return
-------
BRepAlgo_Image

Description
-----------
Returns <Image> containing links between initials shapes and offset faces.
") OffsetFacesFromShapes;
		const BRepAlgo_Image & OffsetFacesFromShapes();

		/****** BRepOffset_MakeOffset::SetOffsetOnFace ******/
		/****** md5 signature: 9f0ed497427d1c6797537dcaf6828afd ******/
		%feature("compactdefaultargs") SetOffsetOnFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Off: float

Return
-------
None

Description
-----------
set the offset <Off> on the Face <F>.
") SetOffsetOnFace;
		void SetOffsetOnFace(const TopoDS_Face & F, const Standard_Real Off);

		/****** BRepOffset_MakeOffset::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/****** BRepOffset_MakeSimpleOffset::BRepOffset_MakeSimpleOffset ******/
		/****** md5 signature: 2c6611a6b659d792eed00a13961fb53b ******/
		%feature("compactdefaultargs") BRepOffset_MakeSimpleOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor. Does nothing.
") BRepOffset_MakeSimpleOffset;
		 BRepOffset_MakeSimpleOffset();

		/****** BRepOffset_MakeSimpleOffset::BRepOffset_MakeSimpleOffset ******/
		/****** md5 signature: 7c34a0a9350729d65f444070ff18aeca ******/
		%feature("compactdefaultargs") BRepOffset_MakeSimpleOffset;
		%feature("autodoc", "
Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: float

Return
-------
None

Description
-----------
Constructor.
") BRepOffset_MakeSimpleOffset;
		 BRepOffset_MakeSimpleOffset(const TopoDS_Shape & theInputShape, const Standard_Real theOffsetValue);

		/****** BRepOffset_MakeSimpleOffset::Generated ******/
		/****** md5 signature: 24159a2591570d74b47fceb984e706dd ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns result shape for the given one (if exists).
") Generated;
		const TopoDS_Shape Generated(const TopoDS_Shape & theShape);

		/****** BRepOffset_MakeSimpleOffset::GetBuildSolidFlag ******/
		/****** md5 signature: afbccb55f157dbee65be1e2d2ebd6c2b ******/
		%feature("compactdefaultargs") GetBuildSolidFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets solid building flag.
") GetBuildSolidFlag;
		Standard_Boolean GetBuildSolidFlag();

		/****** BRepOffset_MakeSimpleOffset::GetError ******/
		/****** md5 signature: 6c2f2530ac0f252c40f9e7ae6ee1cceb ******/
		%feature("compactdefaultargs") GetError;
		%feature("autodoc", "Return
-------
BRepOffsetSimple_Status

Description
-----------
Gets error code.
") GetError;
		BRepOffsetSimple_Status GetError();

		/****** BRepOffset_MakeSimpleOffset::GetErrorMessage ******/
		/****** md5 signature: acb01a02dfab36d96178c70a4923d04f ******/
		%feature("compactdefaultargs") GetErrorMessage;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets error message.
") GetErrorMessage;
		TCollection_AsciiString GetErrorMessage();

		/****** BRepOffset_MakeSimpleOffset::GetOffsetValue ******/
		/****** md5 signature: 8005d5a499c0ed572037768baf367387 ******/
		%feature("compactdefaultargs") GetOffsetValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Gets offset value.
") GetOffsetValue;
		Standard_Real GetOffsetValue();

		/****** BRepOffset_MakeSimpleOffset::GetResultShape ******/
		/****** md5 signature: 587cfc26c0e74835b70343e649833966 ******/
		%feature("compactdefaultargs") GetResultShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns result shape.
") GetResultShape;
		const TopoDS_Shape GetResultShape();

		/****** BRepOffset_MakeSimpleOffset::GetTolerance ******/
		/****** md5 signature: 08094ae040a166d1b252ee02000bca27 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Gets tolerance (used for handling singularities).
") GetTolerance;
		Standard_Real GetTolerance();

		/****** BRepOffset_MakeSimpleOffset::Initialize ******/
		/****** md5 signature: 53d0474fdce0ccd7a1ef47f942278ecf ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: float

Return
-------
None

Description
-----------
Initialise shape for modifications.
") Initialize;
		void Initialize(const TopoDS_Shape & theInputShape, const Standard_Real theOffsetValue);

		/****** BRepOffset_MakeSimpleOffset::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets done state.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepOffset_MakeSimpleOffset::Modified ******/
		/****** md5 signature: 0ab0361e49e1bf256b9fc5a21ac6a9fa ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns modified shape for the given one (if exists).
") Modified;
		const TopoDS_Shape Modified(const TopoDS_Shape & theShape);

		/****** BRepOffset_MakeSimpleOffset::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes offset shape.
") Perform;
		void Perform();

		/****** BRepOffset_MakeSimpleOffset::SetBuildSolidFlag ******/
		/****** md5 signature: c186cdaaf2a4ad2b8f5b88a7059cdef8 ******/
		%feature("compactdefaultargs") SetBuildSolidFlag;
		%feature("autodoc", "
Parameters
----------
theBuildFlag: bool

Return
-------
None

Description
-----------
Sets solid building flag.
") SetBuildSolidFlag;
		void SetBuildSolidFlag(const Standard_Boolean theBuildFlag);

		/****** BRepOffset_MakeSimpleOffset::SetOffsetValue ******/
		/****** md5 signature: 44f68d85ca5c9845fd9b46e2a40b5809 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
theOffsetValue: float

Return
-------
None

Description
-----------
Sets offset value.
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real theOffsetValue);

		/****** BRepOffset_MakeSimpleOffset::SetTolerance ******/
		/****** md5 signature: a3fa8276dd955a9eca26b4c2f0297293 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets tolerance (used for handling singularities).
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
		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: c8f3208843098580d5c3b0e183e1bd08 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Offset;
		 BRepOffset_Offset();

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: 437bfe065cea9e5e95955d607da221a3 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: float
OffsetOutside: bool (optional, default to Standard_True)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Face & Face, const Standard_Real Offset, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: 4a75c6b0a6934ea4df38a31848783ca4 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: float
Created: TopTools_DataMapOfShapeShape
OffsetOutside: bool (optional, default to Standard_True)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
This method will be called when you want to share the edges soon generated from an other face. e.g. when two faces are tangents the common edge will generate only one edge ( no pipe). //! The Map will be fill as follow: //! Created(E) = E' with: E = an edge of <Face> E' = the image of E in the offsetting of another face sharing E with a continuity at least G1.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Face & Face, const Standard_Real Offset, const TopTools_DataMapOfShapeShape & Created, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: bb5cc63e26c23084ecb636562559cbc8 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
Polynomial: bool (optional, default to Standard_False)
Tol: float (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: 1f1985d1da5333df78eb516e6ac644fc ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
FirstEdge: TopoDS_Edge
LastEdge: TopoDS_Edge
Polynomial: bool (optional, default to Standard_False)
Tol: float (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & LastEdge, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: 4855766d144a61e46d61e820d1f2151a ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Vertex: TopoDS_Vertex
LEdge: TopTools_ListOfShape
Offset: float
Polynomial: bool (optional, default to Standard_False)
Tol: float (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Tol and Conti are only used if Polynomial is True (Used to perform the approximation).
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Vertex & Vertex, const TopTools_ListOfShape & LEdge, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****** BRepOffset_Offset::Generated ******/
		/****** md5 signature: 4b497355061beb062439833cbae45ea2 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Generated;
		TopoDS_Shape Generated(const TopoDS_Shape & Shape);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 3a68f402572d681d4c17a71ba2fdb9b5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: float
OffsetOutside: bool (optional, default to Standard_True)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & Face, const Standard_Real Offset, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 19063387060128596dfcb45e0fdddf16 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: float
Created: TopTools_DataMapOfShapeShape
OffsetOutside: bool (optional, default to Standard_True)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & Face, const Standard_Real Offset, const TopTools_DataMapOfShapeShape & Created, const Standard_Boolean OffsetOutside = Standard_True, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 4bd28a339c6559997bae6b5288d7c230 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
Polynomial: bool (optional, default to Standard_False)
Tol: float (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 8a7df373becb560968aaa7122510deee ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: float
FirstEdge: TopoDS_Edge
LastEdge: TopoDS_Edge
Polynomial: bool (optional, default to Standard_False)
Tol: float (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Real Offset, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & LastEdge, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: a55d171e913f36f0b4e55051d82643fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Vertex: TopoDS_Vertex
LEdge: TopTools_ListOfShape
Offset: float
Polynomial: bool (optional, default to Standard_False)
Tol: float (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Tol and Conti are only used if Polynomial is True (Used to perform the approximation).
") Init;
		void Init(const TopoDS_Vertex & Vertex, const TopTools_ListOfShape & LEdge, const Standard_Real Offset, const Standard_Boolean Polynomial = Standard_False, const Standard_Real Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 1341190a002936fc491df39baf5b3ca9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Edge: TopoDS_Edge
Offset: float

Return
-------
None

Description
-----------
Only used in Rolling Ball. Pipe on Free Boundary.
") Init;
		void Init(const TopoDS_Edge & Edge, const Standard_Real Offset);

		/****** BRepOffset_Offset::InitialShape ******/
		/****** md5 signature: 5f6722b58fccd1ce05b74f389a5c01d1 ******/
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") InitialShape;
		const TopoDS_Shape InitialShape();

		/****** BRepOffset_Offset::Status ******/
		/****** md5 signature: da8e3318d740bacf96581cfe65805812 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
BRepOffset_Status

Description
-----------
No available documentation.
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
		/****** BRepOffset_SimpleOffset::BRepOffset_SimpleOffset ******/
		/****** md5 signature: 71b0def4cf7676180a8d1b531617bb92 ******/
		%feature("compactdefaultargs") BRepOffset_SimpleOffset;
		%feature("autodoc", "
Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: float
theTolerance: float

Return
-------
None

Description
-----------
Constructor. 
Parameter theInputShape shape to be offset 
Parameter theOffsetValue offset distance (signed) 
Parameter theTolerance tolerance for handling singular points.
") BRepOffset_SimpleOffset;
		 BRepOffset_SimpleOffset(const TopoDS_Shape & theInputShape, const Standard_Real theOffsetValue, const Standard_Real theTolerance);

		/****** BRepOffset_SimpleOffset::Continuity ******/
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

		/****** BRepOffset_SimpleOffset::NewCurve ******/
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

		/****** BRepOffset_SimpleOffset::NewCurve2d ******/
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

		/****** BRepOffset_SimpleOffset::NewParameter ******/
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

		/****** BRepOffset_SimpleOffset::NewPoint ******/
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

		/****** BRepOffset_SimpleOffset::NewSurface ******/
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
		/****** BRepOffset_Tool::BuildNeighbour ******/
		/****** md5 signature: a28f37b6f4d122d4be23e183e5091239 ******/
		%feature("compactdefaultargs") BuildNeighbour;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face
NOnV1: TopTools_DataMapOfShapeShape
NOnV2: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Via the wire explorer store in <NOnV1> for an Edge <E> of <W> his Edge neighbour on the first vertex <V1> of <E>. Store in NOnV2 the Neighbour of <E>on the last vertex <V2> of <E>.
") BuildNeighbour;
		static void BuildNeighbour(const TopoDS_Wire & W, const TopoDS_Face & F, TopTools_DataMapOfShapeShape & NOnV1, TopTools_DataMapOfShapeShape & NOnV2);

		/****** BRepOffset_Tool::CheckBounds ******/
		/****** md5 signature: b72d73cb62464608149927e8690b009d ******/
		%feature("compactdefaultargs") CheckBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Analyse: BRepOffset_Analyse

Return
-------
enlargeU: bool
enlargeVfirst: bool
enlargeVlast: bool

Description
-----------
No available documentation.
") CheckBounds;
		static void CheckBounds(const TopoDS_Face & F, const BRepOffset_Analyse & Analyse, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepOffset_Tool::CheckPlanesNormals ******/
		/****** md5 signature: 0dfa65e060f5df310856444063f6f7e4 ******/
		%feature("compactdefaultargs") CheckPlanesNormals;
		%feature("autodoc", "
Parameters
----------
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theTolAng: float (optional, default to 1e-8)

Return
-------
bool

Description
-----------
Compares the normal directions of the planar faces and returns True if the directions are the same with the given precision.
") CheckPlanesNormals;
		static Standard_Boolean CheckPlanesNormals(const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const Standard_Real theTolAng = 1e-8);

		/****** BRepOffset_Tool::CorrectOrientation ******/
		/****** md5 signature: 9d3cc66bdf3e936d8cd864f5768e0f35 ******/
		%feature("compactdefaultargs") CorrectOrientation;
		%feature("autodoc", "
Parameters
----------
SI: TopoDS_Shape
NewEdges: TopTools_IndexedMapOfShape
AsDes: BRepAlgo_AsDes
InitOffset: BRepAlgo_Image
Offset: float

Return
-------
None

Description
-----------
No available documentation.
") CorrectOrientation;
		static void CorrectOrientation(const TopoDS_Shape & SI, const TopTools_IndexedMapOfShape & NewEdges, opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & InitOffset, const Standard_Real Offset);

		/****** BRepOffset_Tool::Deboucle3D ******/
		/****** md5 signature: 604726f64f42702b8591f042f704509e ******/
		%feature("compactdefaultargs") Deboucle3D;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Boundary: TopTools_MapOfShape

Return
-------
TopoDS_Shape

Description
-----------
Remove the non valid part of an offsetshape 1 - Remove all the free boundary and the faces connex to such edges. 2 - Remove all the shapes not valid in the result (according to the side of offsetting) in this version only the first point is implemented.
") Deboucle3D;
		static TopoDS_Shape Deboucle3D(const TopoDS_Shape & S, const TopTools_MapOfShape & Boundary);

		/****** BRepOffset_Tool::EdgeVertices ******/
		/****** md5 signature: 5ea655ac8e07a63dd8753acf779f31df ******/
		%feature("compactdefaultargs") EdgeVertices;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
<V1> is the FirstVertex ,<V2> is the Last Vertex of <Edge> taking account the orientation of Edge.
") EdgeVertices;
		static void EdgeVertices(const TopoDS_Edge & E, TopoDS_Vertex & V1, TopoDS_Vertex & V2);

		/****** BRepOffset_Tool::EnLargeFace ******/
		/****** md5 signature: 32b678a9e8c54375869c991fb479becc ******/
		%feature("compactdefaultargs") EnLargeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
NF: TopoDS_Face
ChangeGeom: bool
UpDatePCurve: bool (optional, default to Standard_False)
enlargeU: bool (optional, default to Standard_True)
enlargeVfirst: bool (optional, default to Standard_True)
enlargeVlast: bool (optional, default to Standard_True)
theExtensionMode: int (optional, default to 1)
theLenBeforeUfirst: float (optional, default to -1)
theLenAfterUlast: float (optional, default to -1)
theLenBeforeVfirst: float (optional, default to -1)
theLenAfterVlast: float (optional, default to -1)

Return
-------
bool

Description
-----------
Returns True if The Surface of <NF> has changed. if <ChangeGeom> is True , the surface can be changed . if <UpdatePCurve> is True, update the pcurves of the edges of <F> on the new surface if the surface has been changed. <enlargeU>, <enlargeVfirst>, <enlargeVlast> allow or forbid enlargement in U and V directions correspondingly. <theExtensionMode> is a mode of extension of the surface of the face: if <theExtensionMode> equals 1, potentially infinite surfaces are extended by maximum value, and limited surfaces are extended by 25%. if <theExtensionMode> equals 2, potentially infinite surfaces are extended by 10*(correspondent size of face), and limited surfaces are extended by 100%. <theLenBeforeUfirst>, <theLenAfterUlast>, <theLenBeforeVfirst>, <theLenAfterVlast> set the values of enlargement on correspondent directions. If some of them equals -1, the default value of enlargement is used.
") EnLargeFace;
		static Standard_Boolean EnLargeFace(const TopoDS_Face & F, TopoDS_Face & NF, const Standard_Boolean ChangeGeom, const Standard_Boolean UpDatePCurve = Standard_False, const Standard_Boolean enlargeU = Standard_True, const Standard_Boolean enlargeVfirst = Standard_True, const Standard_Boolean enlargeVlast = Standard_True, const Standard_Integer theExtensionMode = 1, const Standard_Real theLenBeforeUfirst = -1, const Standard_Real theLenAfterUlast = -1, const Standard_Real theLenBeforeVfirst = -1, const Standard_Real theLenAfterVlast = -1);

		/****** BRepOffset_Tool::ExtentFace ******/
		/****** md5 signature: d938056ae787508cd23604b5ea458319 ******/
		%feature("compactdefaultargs") ExtentFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
ConstShapes: TopTools_DataMapOfShapeShape
ToBuild: TopTools_DataMapOfShapeShape
Side: TopAbs_State
TolConf: float
NF: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") ExtentFace;
		static void ExtentFace(const TopoDS_Face & F, TopTools_DataMapOfShapeShape & ConstShapes, TopTools_DataMapOfShapeShape & ToBuild, const TopAbs_State Side, const Standard_Real TolConf, TopoDS_Face & NF);

		/****** BRepOffset_Tool::FindCommonShapes ******/
		/****** md5 signature: a7aabaa5fd2a7f63f2ea432a10f3e5dc ******/
		%feature("compactdefaultargs") FindCommonShapes;
		%feature("autodoc", "
Parameters
----------
theF1: TopoDS_Face
theF2: TopoDS_Face
theLE: TopTools_ListOfShape
theLV: TopTools_ListOfShape

Return
-------
bool

Description
-----------
Looks for the common Vertices and Edges between faces <theF1> and <theF2>. Returns True if common shapes have been found. <theLE> will contain the found common edges; <theLV> will contain the found common vertices.
") FindCommonShapes;
		static Standard_Boolean FindCommonShapes(const TopoDS_Face & theF1, const TopoDS_Face & theF2, TopTools_ListOfShape & theLE, TopTools_ListOfShape & theLV);

		/****** BRepOffset_Tool::FindCommonShapes ******/
		/****** md5 signature: e7a853c19bc762b01f607dbc90f0c46d ******/
		%feature("compactdefaultargs") FindCommonShapes;
		%feature("autodoc", "
Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theType: TopAbs_ShapeEnum
theLSC: TopTools_ListOfShape

Return
-------
bool

Description
-----------
Looks for the common shapes of type <theType> between shapes <theS1> and <theS2>. Returns True if common shapes have been found. <theLSC> will contain the found common shapes.
") FindCommonShapes;
		static Standard_Boolean FindCommonShapes(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const TopAbs_ShapeEnum theType, TopTools_ListOfShape & theLSC);

		/****** BRepOffset_Tool::Gabarit ******/
		/****** md5 signature: a40315c829a5e7b8a2ab7df58b9007bc ******/
		%feature("compactdefaultargs") Gabarit;
		%feature("autodoc", "
Parameters
----------
aCurve: Geom_Curve

Return
-------
float

Description
-----------
No available documentation.
") Gabarit;
		static Standard_Real Gabarit(const opencascade::handle<Geom_Curve> & aCurve);

		/****** BRepOffset_Tool::Inter2d ******/
		/****** md5 signature: fa9a0b167e8c0cdb46f9c397757bc304 ******/
		%feature("compactdefaultargs") Inter2d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
LV: TopTools_ListOfShape
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Inter2d;
		static void Inter2d(const TopoDS_Face & F, const TopoDS_Edge & E1, const TopoDS_Edge & E2, TopTools_ListOfShape & LV, const Standard_Real Tol);

		/****** BRepOffset_Tool::Inter3D ******/
		/****** md5 signature: 14c7b38326d9f6a6878482c940a4d0b3 ******/
		%feature("compactdefaultargs") Inter3D;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State
RefEdge: TopoDS_Edge
RefFace1: TopoDS_Face
RefFace2: TopoDS_Face

Return
-------
None

Description
-----------
Computes the Section between <F1> and <F2> the edges solution are stored in <LInt1> with the orientation on <F1>, the sames edges are stored in <Lint2> with the orientation on <F2>.
") Inter3D;
		static void Inter3D(const TopoDS_Face & F1, const TopoDS_Face & F2, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side, const TopoDS_Edge & RefEdge, const TopoDS_Face & RefFace1, const TopoDS_Face & RefFace2);

		/****** BRepOffset_Tool::InterOrExtent ******/
		/****** md5 signature: b59609d22996a8309b9d7db1980b24a8 ******/
		%feature("compactdefaultargs") InterOrExtent;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") InterOrExtent;
		static void InterOrExtent(const TopoDS_Face & F1, const TopoDS_Face & F2, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side);

		/****** BRepOffset_Tool::MapVertexEdges ******/
		/****** md5 signature: 7d4a209715b6baf8eb33636cf7fd6c35 ******/
		%feature("compactdefaultargs") MapVertexEdges;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
MVE: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
Store in MVE for a vertex <V> in <S> the incident edges <E> in <S>. An Edge is Store only one Time for a vertex.
") MapVertexEdges;
		static void MapVertexEdges(const TopoDS_Shape & S, TopTools_DataMapOfShapeListOfShape & MVE);

		/****** BRepOffset_Tool::OrientSection ******/
		/****** md5 signature: 6fcc8549a4ba547fa845250a54719b66 ******/
		%feature("compactdefaultargs") OrientSection;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
O1: TopAbs_Orientation
O2: TopAbs_Orientation

Description
-----------
<E> is a section between <F1> and <F2>. Computes <O1> the orientation of <E> in <F1> influenced by <F2>. idem for <O2>.
") OrientSection;
		static void OrientSection(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, TopAbs_Orientation &OutValue, TopAbs_Orientation &OutValue);

		/****** BRepOffset_Tool::PipeInter ******/
		/****** md5 signature: 4a2946fb95668689d418fe298066dda2 ******/
		%feature("compactdefaultargs") PipeInter;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") PipeInter;
		static void PipeInter(const TopoDS_Face & F1, const TopoDS_Face & F2, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side);

		/****** BRepOffset_Tool::TryProject ******/
		/****** md5 signature: 46f6f98b477f357764edb8db800b34f8 ******/
		%feature("compactdefaultargs") TryProject;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
Edges: TopTools_ListOfShape
LInt1: TopTools_ListOfShape
LInt2: TopTools_ListOfShape
Side: TopAbs_State
TolConf: float

Return
-------
bool

Description
-----------
Find if the edges <Edges> of the face <F2> are on the face <F1>. Set in <LInt1> <LInt2> the updated edges. If all the edges are computed, returns true.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def brepoffset_CollapseSingularities(*args):
	return brepoffset.CollapseSingularities(*args)

@deprecated
def brepoffset_Surface(*args):
	return brepoffset.Surface(*args)

@deprecated
def BRepOffset_Inter2d_Compute(*args):
	return BRepOffset_Inter2d.Compute(*args)

@deprecated
def BRepOffset_Inter2d_ConnexIntByInt(*args):
	return BRepOffset_Inter2d.ConnexIntByInt(*args)

@deprecated
def BRepOffset_Inter2d_ConnexIntByIntInVert(*args):
	return BRepOffset_Inter2d.ConnexIntByIntInVert(*args)

@deprecated
def BRepOffset_Inter2d_ExtentEdge(*args):
	return BRepOffset_Inter2d.ExtentEdge(*args)

@deprecated
def BRepOffset_Inter2d_FuseVertices(*args):
	return BRepOffset_Inter2d.FuseVertices(*args)

@deprecated
def BRepOffset_Tool_BuildNeighbour(*args):
	return BRepOffset_Tool.BuildNeighbour(*args)

@deprecated
def BRepOffset_Tool_CheckBounds(*args):
	return BRepOffset_Tool.CheckBounds(*args)

@deprecated
def BRepOffset_Tool_CheckPlanesNormals(*args):
	return BRepOffset_Tool.CheckPlanesNormals(*args)

@deprecated
def BRepOffset_Tool_CorrectOrientation(*args):
	return BRepOffset_Tool.CorrectOrientation(*args)

@deprecated
def BRepOffset_Tool_Deboucle3D(*args):
	return BRepOffset_Tool.Deboucle3D(*args)

@deprecated
def BRepOffset_Tool_EdgeVertices(*args):
	return BRepOffset_Tool.EdgeVertices(*args)

@deprecated
def BRepOffset_Tool_EnLargeFace(*args):
	return BRepOffset_Tool.EnLargeFace(*args)

@deprecated
def BRepOffset_Tool_ExtentFace(*args):
	return BRepOffset_Tool.ExtentFace(*args)

@deprecated
def BRepOffset_Tool_FindCommonShapes(*args):
	return BRepOffset_Tool.FindCommonShapes(*args)

@deprecated
def BRepOffset_Tool_FindCommonShapes(*args):
	return BRepOffset_Tool.FindCommonShapes(*args)

@deprecated
def BRepOffset_Tool_Gabarit(*args):
	return BRepOffset_Tool.Gabarit(*args)

@deprecated
def BRepOffset_Tool_Inter2d(*args):
	return BRepOffset_Tool.Inter2d(*args)

@deprecated
def BRepOffset_Tool_Inter3D(*args):
	return BRepOffset_Tool.Inter3D(*args)

@deprecated
def BRepOffset_Tool_InterOrExtent(*args):
	return BRepOffset_Tool.InterOrExtent(*args)

@deprecated
def BRepOffset_Tool_MapVertexEdges(*args):
	return BRepOffset_Tool.MapVertexEdges(*args)

@deprecated
def BRepOffset_Tool_OrientSection(*args):
	return BRepOffset_Tool.OrientSection(*args)

@deprecated
def BRepOffset_Tool_PipeInter(*args):
	return BRepOffset_Tool.PipeInter(*args)

@deprecated
def BRepOffset_Tool_TryProject(*args):
	return BRepOffset_Tool.TryProject(*args)

}
