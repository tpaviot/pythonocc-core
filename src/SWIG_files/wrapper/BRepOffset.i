/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepoffset.html"
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
#include<TopTools_module.hxx>
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
%ignore NCollection_DataMap<TopoDS_Shape,BRepOffset_ListOfInterval,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,BRepOffset_ListOfInterval,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepOffset_DataMapOfShapeListOfInterval) NCollection_DataMap<TopoDS_Shape,BRepOffset_ListOfInterval,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_MapOfShape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_MapOfShape,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepOffset_DataMapOfShapeMapOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_MapOfShape,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,BRepOffset_Offset,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,BRepOffset_Offset,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepOffset_DataMapOfShapeOffset) NCollection_DataMap<TopoDS_Shape,BRepOffset_Offset,TopTools_ShapeMapHasher>;
%template(BRepOffset_ListIteratorOfListOfInterval) NCollection_TListIterator<BRepOffset_Interval>;
%template(BRepOffset_ListOfInterval) NCollection_List<BRepOffset_Interval>;

%extend NCollection_List<BRepOffset_Interval> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = BRepOffset_ListIteratorOfListOfInterval(self)
        while it.More():
            yield it.Value()
            it.Next()
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
		/****** md5 signature: 2a3bd48f2998ca036c640bad3ec3cdc3 ******/
		%feature("compactdefaultargs") CollapseSingularities;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface
theFace: TopoDS_Face
thePrecision: double

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Preprocess surface to be offset (bspline, bezier, or revolution based on bspline or bezier curve), by collapsing each singular side to single point. //! This is to avoid possible flipping of normal at the singularity of the surface due to non-zero distance between the poles that logically should be in one point (singularity). //! The (parametric) side of the surface is considered to be singularity if face has degenerated edge whose vertex encompasses (by its tolerance) all points on that side, or if all poles defining that side fit into sphere with radius thePrecision. //! Returns either original surface or its modified copy (if some poles have been moved).
") CollapseSingularities;
		static opencascade::handle<Geom_Surface> CollapseSingularities(const opencascade::handle<Geom_Surface> & theSurface, const TopoDS_Face & theFace, double thePrecision);

		/****** BRepOffset::Surface ******/
		/****** md5 signature: a53591762d0acf2df8faee0ba7f8df48 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
Offset: double
allowC0: bool (optional, default to false)

Return
-------
theStatus: BRepOffset_Status

Description
-----------
returns the Offset surface computed from the surface <Surface> at an OffsetDistance <Offset>. //! If possible, this method returns the real type of the surface ( e.g. An Offset of a plane is a plane). //! If no particular case is detected, the returned surface will have the Type Geom_OffsetSurface. Parameter allowC0 is then passed as last argument to constructor of Geom_OffsetSurface.
") Surface;
		static opencascade::handle<Geom_Surface> Surface(const opencascade::handle<Geom_Surface> & Surface, const double Offset, BRepOffset_Status &OutValue, bool allowC0 = false);

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
		/****** md5 signature: b979ffa560edbb4b01dcdd0745083de6 ******/
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theAngle: double

Return
-------
None

Description
-----------
C-tor performing the job inside.
") BRepOffset_Analyse;
		 BRepOffset_Analyse(const TopoDS_Shape & theS, const double theAngle);

		/****** BRepOffset_Analyse::AddFaces ******/
		/****** md5 signature: a4f72b6412d2167ea0e12cea7f21b111 ******/
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
		/****** md5 signature: ad4d040a56934aeaff6f0015ab9b5368 ******/
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
		/****** md5 signature: e95e7e9134c33a93931a8ce35c9931c8 ******/
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
		/****** md5 signature: a0970ec4dc035c29c261073f4ba91874 ******/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theUpdate: bool (optional, default to false)

Return
-------
TopTools_ListOfShape *

Description
-----------
Returns the shape descendants.
") Descendants;
		const TopTools_ListOfShape * Descendants(const TopoDS_Shape & theS, const bool theUpdate = false);

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
		/****** md5 signature: 083337c4147adea852805db3c2558a7c ******/
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
		/****** md5 signature: 9306774a49d2312b4e4625add27d1f9d ******/
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
		/****** md5 signature: 1d3e038224f05da142cf2d39bc0c3e1c ******/
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
		/****** md5 signature: 264d59d84e8bfaba13779298eba3413b ******/
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
		/****** md5 signature: 9d9e368ba1fd63a4594206995741e1ac ******/
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
		bool HasAncestor(const TopoDS_Shape & theS);

		/****** BRepOffset_Analyse::HasGenerated ******/
		/****** md5 signature: 36c55e412b97c643b1127799a08c7ae4 ******/
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
		bool HasGenerated(const TopoDS_Shape & theS);

		/****** BRepOffset_Analyse::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns status of the algorithm.
") IsDone;
		bool IsDone();

		/****** BRepOffset_Analyse::NewFaces ******/
		/****** md5 signature: a528527b910aca5ee367eb9c0f9e1c9a ******/
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
		/****** md5 signature: eaed7817b648fc10aa8e23a8c54b04d0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theAngle: double
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the analysis.
") Perform;
		void Perform(const TopoDS_Shape & theS, const double theAngle, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffset_Analyse::SetFaceOffsetMap ******/
		/****** md5 signature: 0a1a4c67a0b8926fcf28f86d535eda0f ******/
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
		/****** md5 signature: 670ce4a59e153b614be1c54aad4a1af3 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
theOffset: double

Return
-------
None

Description
-----------
No available documentation.
") SetOffsetValue;
		void SetOffsetValue(const double theOffset);

		/****** BRepOffset_Analyse::TangentEdges ******/
		/****** md5 signature: 4954875a5f441e50a433c18b9b33b772 ******/
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
		/****** md5 signature: f54512eb56610eb7b28eb0b9f6009b4a ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge

Return
-------
NCollection_List<BRepOffset_Interval>

Description
-----------
Returns the connectivity type of the edge.
") Type;
		const NCollection_List<BRepOffset_Interval> & Type(const TopoDS_Edge & theE);

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
		/****** md5 signature: 541f2e4cb322c41332043dfa8a8ab1aa ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
AsDes: BRepAlgo_AsDes
F: TopoDS_Face
NewEdges: TopTools_IndexedMapOfShape
Tol: double
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
		static void Compute(const opencascade::handle<BRepAlgo_AsDes> & AsDes, const TopoDS_Face & F, const TopTools_IndexedMapOfShape & NewEdges, const double Tol, const TopTools_DataMapOfShapeListOfShape & theEdgeIntEdges, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter2d::ConnexIntByInt ******/
		/****** md5 signature: 6ee27872500f739659d06e8520b5d82a ******/
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
Offset: double
Tol: double
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
		static bool ConnexIntByInt(const TopoDS_Face & FI, BRepOffset_Offset & OFI, TopTools_DataMapOfShapeShape & MES, const TopTools_DataMapOfShapeShape & Build, const opencascade::handle<BRepAlgo_AsDes> & theAsDes, const opencascade::handle<BRepAlgo_AsDes> & AsDes2d, const double Offset, const double Tol, const BRepOffset_Analyse & Analyse, TopTools_IndexedMapOfShape & FacesWithVerts, BRepAlgo_Image & theImageVV, TopTools_DataMapOfShapeListOfShape & theEdgeIntEdges, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter2d::ConnexIntByIntInVert ******/
		/****** md5 signature: 0208cb70381cc59c6c75792d5ceddeae ******/
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
Tol: double
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
		static void ConnexIntByIntInVert(const TopoDS_Face & FI, BRepOffset_Offset & OFI, TopTools_DataMapOfShapeShape & MES, const TopTools_DataMapOfShapeShape & Build, const opencascade::handle<BRepAlgo_AsDes> & AsDes, const opencascade::handle<BRepAlgo_AsDes> & AsDes2d, const double Tol, const BRepOffset_Analyse & Analyse, TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter2d::ExtentEdge ******/
		/****** md5 signature: 8a9706aac012632569f59f23c084d0ee ******/
		%feature("compactdefaultargs") ExtentEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
NE: TopoDS_Edge
theOffset: double

Return
-------
bool

Description
-----------
extents the edge.
") ExtentEdge;
		static bool ExtentEdge(const TopoDS_Edge & E, TopoDS_Edge & NE, const double theOffset);

		/****** BRepOffset_Inter2d::FuseVertices ******/
		/****** md5 signature: 9559222a1708b3063f7d5b3c42586fbc ******/
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
		static bool FuseVertices(const TopTools_IndexedDataMapOfShapeListOfShape & theDMVV, const opencascade::handle<BRepAlgo_AsDes> & theAsDes, BRepAlgo_Image & theImageVV);

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
		/****** md5 signature: 853c0b49dc6d139e2d877799ca22176a ******/
		%feature("compactdefaultargs") BRepOffset_Inter3d;
		%feature("autodoc", "
Parameters
----------
AsDes: BRepAlgo_AsDes
Side: TopAbs_State
Tol: double

Return
-------
None

Description
-----------
Constructor.
") BRepOffset_Inter3d;
		 BRepOffset_Inter3d(const opencascade::handle<BRepAlgo_AsDes> & AsDes, const TopAbs_State Side, const double Tol);

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
		/****** md5 signature: 87f57c399d88298b90719c3bba0f46f8 ******/
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
		/****** md5 signature: 398ac2d3fae8fcbfa396ec4c4970cc4a ******/
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
		/****** md5 signature: e7553cf2e3c46763c181ffbdbd2606b0 ******/
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "
Parameters
----------
SI: TopoDS_Shape
MapSF: NCollection_DataMap<TopoDS_Shape, BRepOffset_Offset, TopTools_ShapeMapHasher>
A: BRepOffset_Analyse
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
Failed: TopTools_ListOfShape
theRange: Message_ProgressRange
bIsPlanar: bool (optional, default to false)

Return
-------
None

Description
-----------
Computes intersection of the offset faces that have to be connected by sharp edges, i.e. it computes intersection between extended offset faces.
") ConnexIntByInt;
		void ConnexIntByInt(const TopoDS_Shape & SI, const NCollection_DataMap<TopoDS_Shape, BRepOffset_Offset, TopTools_ShapeMapHasher> & MapSF, const BRepOffset_Analyse & A, TopTools_DataMapOfShapeShape & MES, TopTools_DataMapOfShapeShape & Build, TopTools_ListOfShape & Failed, const Message_ProgressRange & theRange, const bool bIsPlanar = false);

		/****** BRepOffset_Inter3d::ContextIntByArc ******/
		/****** md5 signature: cac5ec5ba46c7e6d8393e8221b468c40 ******/
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
		void ContextIntByArc(const TopTools_IndexedMapOfShape & ContextFaces, const bool ExtentContext, const BRepOffset_Analyse & Analyse, const BRepAlgo_Image & InitOffsetFace, BRepAlgo_Image & InitOffsetEdge, const Message_ProgressRange & theRange);

		/****** BRepOffset_Inter3d::ContextIntByInt ******/
		/****** md5 signature: 78142a90013f56943002de6773e11408 ******/
		%feature("compactdefaultargs") ContextIntByInt;
		%feature("autodoc", "
Parameters
----------
ContextFaces: TopTools_IndexedMapOfShape
ExtentContext: bool
MapSF: NCollection_DataMap<TopoDS_Shape, BRepOffset_Offset, TopTools_ShapeMapHasher>
A: BRepOffset_Analyse
MES: TopTools_DataMapOfShapeShape
Build: TopTools_DataMapOfShapeShape
Failed: TopTools_ListOfShape
theRange: Message_ProgressRange
bIsPlanar: bool (optional, default to false)

Return
-------
None

Description
-----------
Computes intersection with not offset faces .
") ContextIntByInt;
		void ContextIntByInt(const TopTools_IndexedMapOfShape & ContextFaces, const bool ExtentContext, const NCollection_DataMap<TopoDS_Shape, BRepOffset_Offset, TopTools_ShapeMapHasher> & MapSF, const BRepOffset_Analyse & A, TopTools_DataMapOfShapeShape & MES, TopTools_DataMapOfShapeShape & Build, TopTools_ListOfShape & Failed, const Message_ProgressRange & theRange, const bool bIsPlanar = false);

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
		/****** md5 signature: 3ab60c13bda6de839a8178f4c05e4f5b ******/
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
		bool IsDone(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRepOffset_Inter3d::NewEdges ******/
		/****** md5 signature: b5866922d31a4e5fb645260744c2c3d0 ******/
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
		/****** md5 signature: 0f1aa657dc6f2d601aab5b95cd0c1915 ******/
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
		/****** md5 signature: 87cdbe02d48a014868041b28b0ec839a ******/
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
Type: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Interval;
		 BRepOffset_Interval(const double U1, const double U2, const ChFiDS_TypeOfConcavity Type);

		/****** BRepOffset_Interval::First ******/
		/****** md5 signature: 9628ffb3d6dc88556830e76e5fca14dc ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
None

Description
-----------
No available documentation.
") First;
		void First(const double U);

		/****** BRepOffset_Interval::First ******/
		/****** md5 signature: 61ce69da508d1629f019b1eaed06f2ac ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") First;
		double First();

		/****** BRepOffset_Interval::Last ******/
		/****** md5 signature: b5eb78c5086b9614178d0b781144e930 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
None

Description
-----------
No available documentation.
") Last;
		void Last(const double U);

		/****** BRepOffset_Interval::Last ******/
		/****** md5 signature: f68736fde4f79ad5767aa65cfae8fd87 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Last;
		double Last();

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
		/****** md5 signature: b5b858f96aa598d247a4af09a49bf532 ******/
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
		/****** md5 signature: 1b50d3f316e594846b9f351daf6fa994 ******/
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
		/****** md5 signature: 902b6087fc8aa125e7e9e9f3eb9554c6 ******/
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
		void BuildOnContext(const TopTools_ListOfShape & LContext, const BRepOffset_Analyse & Analyse, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & Image, const bool InSide, const Message_ProgressRange & theRange);

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
		/****** md5 signature: da2c62aa16f53393777b57fcf39b3d63 ******/
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Offset: double
Tol: double
Mode: BRepOffset_Mode (optional, default to BRepOffset_Skin)
Intersection: bool (optional, default to false)
SelfInter: bool (optional, default to false)
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Thickening: bool (optional, default to false)
RemoveIntEdges: bool (optional, default to false)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset(const TopoDS_Shape & S, const double Offset, const double Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const bool Intersection = false, const bool SelfInter = false, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool Thickening = false, const bool RemoveIntEdges = false, const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: ba7a34cba80577ba85588d696209da75 ******/
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
		void AllowLinearization(const bool theIsAllowed);

		/****** BRepOffset_MakeOffset::CheckInputData ******/
		/****** md5 signature: 883dfa5bd3843a9f563241282a20fe1f ******/
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
		bool CheckInputData(const Message_ProgressRange & theRange);

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
		/****** md5 signature: d58ab44b96f71200275e5fa9ba65f1ea ******/
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
		/****** md5 signature: c7e739d35dfc51aa359d492d3adef485 ******/
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
		/****** md5 signature: 572cbe33733083c43a88951acdcb7f74 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Offset: double
Tol: double
Mode: BRepOffset_Mode (optional, default to BRepOffset_Skin)
Intersection: bool (optional, default to false)
SelfInter: bool (optional, default to false)
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Thickening: bool (optional, default to false)
RemoveIntEdges: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TopoDS_Shape & S, const double Offset, const double Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const bool Intersection = false, const bool SelfInter = false, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool Thickening = false, const bool RemoveIntEdges = false);

		/****** BRepOffset_MakeOffset::IsDeleted ******/
		/****** md5 signature: 46e15ea12ce91736daf00da083c409ed ******/
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
		bool IsDeleted(const TopoDS_Shape & S);

		/****** BRepOffset_MakeOffset::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6cd66ea5e5f80e028bbe64f6b442570b ******/
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
		/****** md5 signature: d3e249a021cbbdc26c8c39fc07f6e283 ******/
		%feature("compactdefaultargs") SetOffsetOnFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Off: double

Return
-------
None

Description
-----------
set the offset <Off> on the Face <F>.
") SetOffsetOnFace;
		void SetOffsetOnFace(const TopoDS_Face & F, const double Off);

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
		/****** md5 signature: c71b5b78c7166fe3a4841ca220f8c89c ******/
		%feature("compactdefaultargs") BRepOffset_MakeSimpleOffset;
		%feature("autodoc", "
Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: double

Return
-------
None

Description
-----------
Constructor.
") BRepOffset_MakeSimpleOffset;
		 BRepOffset_MakeSimpleOffset(const TopoDS_Shape & theInputShape, const double theOffsetValue);

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
		/****** md5 signature: aba365fa63b7cf20276f228d59797d00 ******/
		%feature("compactdefaultargs") GetBuildSolidFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets solid building flag.
") GetBuildSolidFlag;
		bool GetBuildSolidFlag();

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
		/****** md5 signature: 7cc742dce403bdf681dd6cb077b46229 ******/
		%feature("compactdefaultargs") GetOffsetValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets offset value.
") GetOffsetValue;
		double GetOffsetValue();

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
		/****** md5 signature: e67df8e10a4625bbe723c8a8b8641bba ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets tolerance (used for handling singularities).
") GetTolerance;
		double GetTolerance();

		/****** BRepOffset_MakeSimpleOffset::Initialize ******/
		/****** md5 signature: baaf512f137cd3b42d126525c788f9be ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: double

Return
-------
None

Description
-----------
Initialise shape for modifications.
") Initialize;
		void Initialize(const TopoDS_Shape & theInputShape, const double theOffsetValue);

		/****** BRepOffset_MakeSimpleOffset::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets done state.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6db1c8d4d9bbf07ee9beded28a8cde62 ******/
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
		void SetBuildSolidFlag(const bool theBuildFlag);

		/****** BRepOffset_MakeSimpleOffset::SetOffsetValue ******/
		/****** md5 signature: 03235b2a839493f5d38a3f2b317a9fe3 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
theOffsetValue: double

Return
-------
None

Description
-----------
Sets offset value.
") SetOffsetValue;
		void SetOffsetValue(const double theOffsetValue);

		/****** BRepOffset_MakeSimpleOffset::SetTolerance ******/
		/****** md5 signature: 9e682ab5534de89a2a4e3f50f28c7c5c ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets tolerance (used for handling singularities).
") SetTolerance;
		void SetTolerance(const double theValue);

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
		/****** md5 signature: 9d5cdce437a43edd2d5db192540ccdf5 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: double
OffsetOutside: bool (optional, default to true)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Face & Face, const double Offset, const bool OffsetOutside = true, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: 61bda481e8f2219ba4fdb71b9fc72646 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: double
Created: TopTools_DataMapOfShapeShape
OffsetOutside: bool (optional, default to true)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
This method will be called when you want to share the edges soon generated from an other face. e.g. when two faces are tangents the common edge will generate only one edge ( no pipe). //! The Map will be fill as follow: //! Created(E) = E' with: E = an edge of <Face> E' = the image of E in the offsetting of another face sharing E with a continuity at least G1.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Face & Face, const double Offset, const TopTools_DataMapOfShapeShape & Created, const bool OffsetOutside = true, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: ed2184acf5afdcd8e1e78e0ca7b89b32 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: double
Polynomial: bool (optional, default to false)
Tol: double (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const double Offset, const bool Polynomial = false, const double Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: 4dda71b563c0e24d69f3db6fb2dba1de ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: double
FirstEdge: TopoDS_Edge
LastEdge: TopoDS_Edge
Polynomial: bool (optional, default to false)
Tol: double (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const double Offset, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & LastEdge, const bool Polynomial = false, const double Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::BRepOffset_Offset ******/
		/****** md5 signature: 67f31846ef5d37fda435bd7715198899 ******/
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "
Parameters
----------
Vertex: TopoDS_Vertex
LEdge: TopTools_ListOfShape
Offset: double
Polynomial: bool (optional, default to false)
Tol: double (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Tol and Conti are only used if Polynomial is True (Used to perform the approximation).
") BRepOffset_Offset;
		 BRepOffset_Offset(const TopoDS_Vertex & Vertex, const TopTools_ListOfShape & LEdge, const double Offset, const bool Polynomial = false, const double Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

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
		/****** md5 signature: 0dd9683894df4f4fb2690c5d758f9134 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: double
OffsetOutside: bool (optional, default to true)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & Face, const double Offset, const bool OffsetOutside = true, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: daba90b25a4d37d1ed48e4821fe23944 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
Offset: double
Created: TopTools_DataMapOfShapeShape
OffsetOutside: bool (optional, default to true)
JoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & Face, const double Offset, const TopTools_DataMapOfShapeShape & Created, const bool OffsetOutside = true, const GeomAbs_JoinType JoinType = GeomAbs_Arc);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 297c2ddb798e1433f015a745f860b426 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: double
Polynomial: bool (optional, default to false)
Tol: double (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const double Offset, const bool Polynomial = false, const double Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 3c0f80fe875bc232fce8b31995885fe5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Edge
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Offset: double
FirstEdge: TopoDS_Edge
LastEdge: TopoDS_Edge
Polynomial: bool (optional, default to false)
Tol: double (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Edge & Path, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const double Offset, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & LastEdge, const bool Polynomial = false, const double Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: 8ca812e3804d541346a481af431191c3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Vertex: TopoDS_Vertex
LEdge: TopTools_ListOfShape
Offset: double
Polynomial: bool (optional, default to false)
Tol: double (optional, default to 1.0e-4)
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Tol and Conti are only used if Polynomial is True (Used to perform the approximation).
") Init;
		void Init(const TopoDS_Vertex & Vertex, const TopTools_ListOfShape & LEdge, const double Offset, const bool Polynomial = false, const double Tol = 1.0e-4, const GeomAbs_Shape Conti = GeomAbs_C1);

		/****** BRepOffset_Offset::Init ******/
		/****** md5 signature: e8ade1852de2fd47eebc3fa821428ac4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Edge: TopoDS_Edge
Offset: double

Return
-------
None

Description
-----------
Only used in Rolling Ball. Pipe on Free Boundary.
") Init;
		void Init(const TopoDS_Edge & Edge, const double Offset);

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
		/****** md5 signature: 65cd2b41e4e6a8b34a4c4932c3fa449c ******/
		%feature("compactdefaultargs") BRepOffset_SimpleOffset;
		%feature("autodoc", "
Parameters
----------
theInputShape: TopoDS_Shape
theOffsetValue: double
theTolerance: double

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
		 BRepOffset_SimpleOffset(const TopoDS_Shape & theInputShape, const double theOffsetValue, const double theTolerance);

		/****** BRepOffset_SimpleOffset::Continuity ******/
		/****** md5 signature: d1e0a7e2e1d461e6b97ab64ce63033de ******/
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
		/****** md5 signature: 039bf25957d908407657950d3c1e5d6a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: double

Description
-----------
Returns true if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns false, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		bool NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** BRepOffset_SimpleOffset::NewCurve2d ******/
		/****** md5 signature: 19d697fda46737877bc989a89ef46152 ******/
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
Tol: double

Description
-----------
Returns true if the edge <E> has a new curve on surface on the face <F>. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns false, and <C>, <L>, <Tol> are not significant.
") NewCurve2d;
		bool NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** BRepOffset_SimpleOffset::NewParameter ******/
		/****** md5 signature: 01206a81b5ddd931da808c7838d65daf ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: double
Tol: double

Description
-----------
Returns true if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns false, and <P>, <Tol> are not significant.
") NewParameter;
		bool NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepOffset_SimpleOffset::NewPoint ******/
		/****** md5 signature: a79eefd1fe066754dc9fbd2d3a2530a1 ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: double

Description
-----------
Returns true if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns false, and <P>, <Tol> are not significant.
") NewPoint;
		bool NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** BRepOffset_SimpleOffset::NewSurface ******/
		/****** md5 signature: 05cac4f6dafa97d6624303004e85d749 ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: double
RevWires: bool
RevFace: bool

Description
-----------
Returns true if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location, <Tol> the new tolerance. <RevWires> has to be set to true when the modification reverses the normal of the surface. (the wires have to be reversed). <RevFace> has to be set to true if the orientation of the modified face changes in the shells which contain it. Here, <RevFace> will return true if the gp_Trsf is negative.
") NewSurface;
		bool NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

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
		/****** md5 signature: 549312b05e1fe19c0739b2723350a0c5 ******/
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
		/****** md5 signature: 6cf54453a3f1f2209d07dced77c5c1fa ******/
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
		/****** md5 signature: 62a9c4cd820a2b24dc4294dcd2b24c40 ******/
		%feature("compactdefaultargs") CheckPlanesNormals;
		%feature("autodoc", "
Parameters
----------
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theTolAng: double (optional, default to 1e-8)

Return
-------
bool

Description
-----------
Compares the normal directions of the planar faces and returns True if the directions are the same with the given precision.
") CheckPlanesNormals;
		static bool CheckPlanesNormals(const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const double theTolAng = 1e-8);

		/****** BRepOffset_Tool::CorrectOrientation ******/
		/****** md5 signature: 9f9cce1164f749013565928e41902ab2 ******/
		%feature("compactdefaultargs") CorrectOrientation;
		%feature("autodoc", "
Parameters
----------
SI: TopoDS_Shape
NewEdges: TopTools_IndexedMapOfShape
AsDes: BRepAlgo_AsDes
InitOffset: BRepAlgo_Image
Offset: double

Return
-------
None

Description
-----------
No available documentation.
") CorrectOrientation;
		static void CorrectOrientation(const TopoDS_Shape & SI, const TopTools_IndexedMapOfShape & NewEdges, const opencascade::handle<BRepAlgo_AsDes> & AsDes, BRepAlgo_Image & InitOffset, const double Offset);

		/****** BRepOffset_Tool::Deboucle3D ******/
		/****** md5 signature: 067f5a6cbf98fc1bd6309ade5daf190a ******/
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
		/****** md5 signature: fd725e029c9f18d8fdbcdf185dcdedf2 ******/
		%feature("compactdefaultargs") EnLargeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
NF: TopoDS_Face
ChangeGeom: bool
UpDatePCurve: bool (optional, default to false)
enlargeU: bool (optional, default to true)
enlargeVfirst: bool (optional, default to true)
enlargeVlast: bool (optional, default to true)
theExtensionMode: int (optional, default to 1)
theLenBeforeUfirst: double (optional, default to -1)
theLenAfterUlast: double (optional, default to -1)
theLenBeforeVfirst: double (optional, default to -1)
theLenAfterVlast: double (optional, default to -1)

Return
-------
bool

Description
-----------
Returns True if The Surface of <NF> has changed. if <ChangeGeom> is True the surface can be changed . if <UpdatePCurve> is True, update the pcurves of the edges of <F> on the new surface if the surface has been changed. <enlargeU>, <enlargeVfirst>, <enlargeVlast> allow or forbid enlargement in U and V directions correspondingly. <theExtensionMode> is a mode of extension of the surface of the face: if <theExtensionMode> equals 1, potentially infinite surfaces are extended by maximum value, and limited surfaces are extended by 25%. if <theExtensionMode> equals 2, potentially infinite surfaces are extended by 10*(correspondent size of face), and limited surfaces are extended by 100%. <theLenBeforeUfirst>, <theLenAfterUlast>, <theLenBeforeVfirst>, <theLenAfterVlast> set the values of enlargement on correspondent directions. If some of them equals -1, the default value of enlargement is used.
") EnLargeFace;
		static bool EnLargeFace(const TopoDS_Face & F, TopoDS_Face & NF, const bool ChangeGeom, const bool UpDatePCurve = false, const bool enlargeU = true, const bool enlargeVfirst = true, const bool enlargeVlast = true, const int theExtensionMode = 1, const double theLenBeforeUfirst = -1, const double theLenAfterUlast = -1, const double theLenBeforeVfirst = -1, const double theLenAfterVlast = -1);

		/****** BRepOffset_Tool::ExtentFace ******/
		/****** md5 signature: 683bd1f187b746e5531b12dd1bfb7f7c ******/
		%feature("compactdefaultargs") ExtentFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
ConstShapes: TopTools_DataMapOfShapeShape
ToBuild: TopTools_DataMapOfShapeShape
Side: TopAbs_State
TolConf: double
NF: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") ExtentFace;
		static void ExtentFace(const TopoDS_Face & F, TopTools_DataMapOfShapeShape & ConstShapes, TopTools_DataMapOfShapeShape & ToBuild, const TopAbs_State Side, const double TolConf, TopoDS_Face & NF);

		/****** BRepOffset_Tool::FindCommonShapes ******/
		/****** md5 signature: b3a0f90a70c233bc105d5aaaff7b4698 ******/
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
		static bool FindCommonShapes(const TopoDS_Face & theF1, const TopoDS_Face & theF2, TopTools_ListOfShape & theLE, TopTools_ListOfShape & theLV);

		/****** BRepOffset_Tool::FindCommonShapes ******/
		/****** md5 signature: 86cff291f64710df39a64766d5b85c24 ******/
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
		static bool FindCommonShapes(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const TopAbs_ShapeEnum theType, TopTools_ListOfShape & theLSC);

		/****** BRepOffset_Tool::Gabarit ******/
		/****** md5 signature: 6db0927b9f87e8c6c23e08634bc61a1d ******/
		%feature("compactdefaultargs") Gabarit;
		%feature("autodoc", "
Parameters
----------
aCurve: Geom_Curve

Return
-------
double

Description
-----------
No available documentation.
") Gabarit;
		static double Gabarit(const opencascade::handle<Geom_Curve> & aCurve);

		/****** BRepOffset_Tool::Inter2d ******/
		/****** md5 signature: 99f5dd07506ffe2a90d0e1a41e364d10 ******/
		%feature("compactdefaultargs") Inter2d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
LV: TopTools_ListOfShape
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Inter2d;
		static void Inter2d(const TopoDS_Face & F, const TopoDS_Edge & E1, const TopoDS_Edge & E2, TopTools_ListOfShape & LV, const double Tol);

		/****** BRepOffset_Tool::Inter3D ******/
		/****** md5 signature: bc8b25b531e91430da10ffd5b2d88e26 ******/
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
		/****** md5 signature: 4e05295afb2e1c59dcc5943d1e40c828 ******/
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
		/****** md5 signature: 753e0db883237322f46d079e65dbb7dc ******/
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
		/****** md5 signature: 085030f88c0638076a2ad9570308271f ******/
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
		/****** md5 signature: 166e3e188b96d592540e3743efbe231d ******/
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
TolConf: double

Return
-------
bool

Description
-----------
Find if the edges <Edges> of the face <F2> are on the face <F1>. Set in <LInt1> <LInt2> the updated edges. If all the edges are computed, returns true.
") TryProject;
		static bool TryProject(const TopoDS_Face & F1, const TopoDS_Face & F2, const TopTools_ListOfShape & Edges, TopTools_ListOfShape & LInt1, TopTools_ListOfShape & LInt2, const TopAbs_State Side, const double TolConf);

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
