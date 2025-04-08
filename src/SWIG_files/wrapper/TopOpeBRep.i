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
%define TOPOPEBREPDOCSTRING
"TopOpeBRep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_topopebrep.html"
%enddef
%module (package="OCC.Core", docstring=TOPOPEBREPDOCSTRING) TopOpeBRep


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
#include<TopOpeBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepTopAdaptor_module.hxx>
#include<IntRes2d_module.hxx>
#include<IntSurf_module.hxx>
#include<IntPatch_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<TopoDS_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<TCollection_module.hxx>
#include<Bnd_module.hxx>
#include<TopAbs_module.hxx>
#include<gp_module.hxx>
#include<TopTools_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<IntAna_module.hxx>
#include<Message_module.hxx>
#include<IntSurf_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepTopAdaptor.i
%import IntRes2d.i
%import IntSurf.i
%import IntPatch.i
%import TopOpeBRepDS.i
%import TopoDS.i
%import TopOpeBRepTool.i
%import TCollection.i
%import Bnd.i
%import TopAbs.i
%import gp.i
%import TopTools.i
%import Geom2d.i
%import Geom.i
%import BRepAdaptor.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TopOpeBRep_P2Dstatus {
	TopOpeBRep_P2DUNK = 0,
	TopOpeBRep_P2DINT = 1,
	TopOpeBRep_P2DSGF = 2,
	TopOpeBRep_P2DSGL = 3,
	TopOpeBRep_P2DNEW = 4,
};

enum TopOpeBRep_TypeLineCurve {
	TopOpeBRep_ANALYTIC = 0,
	TopOpeBRep_RESTRICTION = 1,
	TopOpeBRep_WALKING = 2,
	TopOpeBRep_LINE = 3,
	TopOpeBRep_CIRCLE = 4,
	TopOpeBRep_ELLIPSE = 5,
	TopOpeBRep_PARABOLA = 6,
	TopOpeBRep_HYPERBOLA = 7,
	TopOpeBRep_OTHERTYPE = 8,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TopOpeBRep_P2Dstatus(IntEnum):
	TopOpeBRep_P2DUNK = 0
	TopOpeBRep_P2DINT = 1
	TopOpeBRep_P2DSGF = 2
	TopOpeBRep_P2DSGL = 3
	TopOpeBRep_P2DNEW = 4
TopOpeBRep_P2DUNK = TopOpeBRep_P2Dstatus.TopOpeBRep_P2DUNK
TopOpeBRep_P2DINT = TopOpeBRep_P2Dstatus.TopOpeBRep_P2DINT
TopOpeBRep_P2DSGF = TopOpeBRep_P2Dstatus.TopOpeBRep_P2DSGF
TopOpeBRep_P2DSGL = TopOpeBRep_P2Dstatus.TopOpeBRep_P2DSGL
TopOpeBRep_P2DNEW = TopOpeBRep_P2Dstatus.TopOpeBRep_P2DNEW

class TopOpeBRep_TypeLineCurve(IntEnum):
	TopOpeBRep_ANALYTIC = 0
	TopOpeBRep_RESTRICTION = 1
	TopOpeBRep_WALKING = 2
	TopOpeBRep_LINE = 3
	TopOpeBRep_CIRCLE = 4
	TopOpeBRep_ELLIPSE = 5
	TopOpeBRep_PARABOLA = 6
	TopOpeBRep_HYPERBOLA = 7
	TopOpeBRep_OTHERTYPE = 8
TopOpeBRep_ANALYTIC = TopOpeBRep_TypeLineCurve.TopOpeBRep_ANALYTIC
TopOpeBRep_RESTRICTION = TopOpeBRep_TypeLineCurve.TopOpeBRep_RESTRICTION
TopOpeBRep_WALKING = TopOpeBRep_TypeLineCurve.TopOpeBRep_WALKING
TopOpeBRep_LINE = TopOpeBRep_TypeLineCurve.TopOpeBRep_LINE
TopOpeBRep_CIRCLE = TopOpeBRep_TypeLineCurve.TopOpeBRep_CIRCLE
TopOpeBRep_ELLIPSE = TopOpeBRep_TypeLineCurve.TopOpeBRep_ELLIPSE
TopOpeBRep_PARABOLA = TopOpeBRep_TypeLineCurve.TopOpeBRep_PARABOLA
TopOpeBRep_HYPERBOLA = TopOpeBRep_TypeLineCurve.TopOpeBRep_HYPERBOLA
TopOpeBRep_OTHERTYPE = TopOpeBRep_TypeLineCurve.TopOpeBRep_OTHERTYPE
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TopOpeBRep_FFDumper)
%wrap_handle(TopOpeBRep_Hctxee2d)
%wrap_handle(TopOpeBRep_Hctxff2d)
%wrap_handle(TopOpeBRep_HArray1OfLineInter)
%wrap_handle(TopOpeBRep_HArray1OfVPointInter)
/* end handles declaration */

/* templates */
%template(TopOpeBRep_Array1OfLineInter) NCollection_Array1<TopOpeBRep_LineInter>;
Array1ExtendIter(TopOpeBRep_LineInter)

%template(TopOpeBRep_Array1OfVPointInter) NCollection_Array1<TopOpeBRep_VPointInter>;
Array1ExtendIter(TopOpeBRep_VPointInter)

%template(TopOpeBRep_DataMapOfTopolTool) NCollection_DataMap<TopoDS_Shape,opencascade::handle<BRepTopAdaptor_TopolTool>,TopTools_ShapeMapHasher>;
%template(TopOpeBRep_ListIteratorOfListOfBipoint) NCollection_TListIterator<TopOpeBRep_Bipoint>;
%template(TopOpeBRep_ListOfBipoint) NCollection_List<TopOpeBRep_Bipoint>;

%extend NCollection_List<TopOpeBRep_Bipoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TopOpeBRep_SequenceOfPoint2d) NCollection_Sequence<TopOpeBRep_Point2d>;

%extend NCollection_Sequence<TopOpeBRep_Point2d> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TopOpeBRep_LineInter> TopOpeBRep_Array1OfLineInter;
typedef NCollection_Array1<TopOpeBRep_VPointInter> TopOpeBRep_Array1OfVPointInter;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<BRepTopAdaptor_TopolTool>, TopTools_ShapeMapHasher>::Iterator TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<BRepTopAdaptor_TopolTool>, TopTools_ShapeMapHasher> TopOpeBRep_DataMapOfTopolTool;
typedef NCollection_List<TopOpeBRep_Bipoint>::Iterator TopOpeBRep_ListIteratorOfListOfBipoint;
typedef NCollection_List<TopOpeBRep_Bipoint> TopOpeBRep_ListOfBipoint;
typedef TopOpeBRep_EdgesIntersector * TopOpeBRep_PEdgesIntersector;
typedef TopOpeBRep_FacesFiller * TopOpeBRep_PFacesFiller;
typedef TopOpeBRep_FacesIntersector * TopOpeBRep_PFacesIntersector;
typedef IntRes2d_IntersectionPoint * TopOpeBRep_PIntRes2d_IntersectionPoint;
typedef TopOpeBRep_LineInter * TopOpeBRep_PLineInter;
typedef IntSurf_PntOn2S * TopOpeBRep_PPntOn2S;
typedef IntPatch_Point * TopOpeBRep_PThePointOfIntersection;
typedef NCollection_Sequence<TopOpeBRep_Point2d> TopOpeBRep_SequenceOfPoint2d;
/* end typedefs declaration */

/*******************
* class TopOpeBRep *
*******************/
%rename(topopebrep) TopOpeBRep;
class TopOpeBRep {
	public:
		/****** TopOpeBRep::Print ******/
		/****** md5 signature: 298bc80cbe2b2fc0f4814ac9efa8edb6 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
TLC: TopOpeBRep_TypeLineCurve

Return
-------
OS: Standard_OStream

Description
-----------
Prints the name of <TLC> as a String on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const TopOpeBRep_TypeLineCurve TLC, std::ostream &OutValue);

};


%extend TopOpeBRep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TopOpeBRep_Bipoint *
***************************/
class TopOpeBRep_Bipoint {
	public:
		/****** TopOpeBRep_Bipoint::TopOpeBRep_Bipoint ******/
		/****** md5 signature: a715cb54d3a52f08c102ca6db0d069b1 ******/
		%feature("compactdefaultargs") TopOpeBRep_Bipoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint();

		/****** TopOpeBRep_Bipoint::TopOpeBRep_Bipoint ******/
		/****** md5 signature: e2d9e3227b46e6169a8387b50c8a73b4 ******/
		%feature("compactdefaultargs") TopOpeBRep_Bipoint;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint(const Standard_Integer I1, const Standard_Integer I2);

		/****** TopOpeBRep_Bipoint::I1 ******/
		/****** md5 signature: 74161ab0bbc94c01faf48cb60fb358c7 ******/
		%feature("compactdefaultargs") I1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") I1;
		Standard_Integer I1();

		/****** TopOpeBRep_Bipoint::I2 ******/
		/****** md5 signature: eaec9284f7e9882b1d76f4c6582c3504 ******/
		%feature("compactdefaultargs") I2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") I2;
		Standard_Integer I2();

};


%extend TopOpeBRep_Bipoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRep_DSFiller *
****************************/
class TopOpeBRep_DSFiller {
	public:
		/****** TopOpeBRep_DSFiller::TopOpeBRep_DSFiller ******/
		/****** md5 signature: 94d1e0669c4d73ab6878efe1b3c3c129 ******/
		%feature("compactdefaultargs") TopOpeBRep_DSFiller;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_DSFiller;
		 TopOpeBRep_DSFiller();

		/****** TopOpeBRep_DSFiller::ChangeEdgesFiller ******/
		/****** md5 signature: 42f528f137a884825f37c45c5ef2914d ******/
		%feature("compactdefaultargs") ChangeEdgesFiller;
		%feature("autodoc", "Return
-------
TopOpeBRep_EdgesFiller

Description
-----------
No available documentation.
") ChangeEdgesFiller;
		TopOpeBRep_EdgesFiller & ChangeEdgesFiller();

		/****** TopOpeBRep_DSFiller::ChangeFaceEdgeFiller ******/
		/****** md5 signature: 7e75719b2c1ecc11d8c6aae1c01c49b5 ******/
		%feature("compactdefaultargs") ChangeFaceEdgeFiller;
		%feature("autodoc", "Return
-------
TopOpeBRep_FaceEdgeFiller

Description
-----------
No available documentation.
") ChangeFaceEdgeFiller;
		TopOpeBRep_FaceEdgeFiller & ChangeFaceEdgeFiller();

		/****** TopOpeBRep_DSFiller::ChangeFacesFiller ******/
		/****** md5 signature: 0eb68d8005f2ae63fdbc569576b1f1fd ******/
		%feature("compactdefaultargs") ChangeFacesFiller;
		%feature("autodoc", "Return
-------
TopOpeBRep_FacesFiller

Description
-----------
No available documentation.
") ChangeFacesFiller;
		TopOpeBRep_FacesFiller & ChangeFacesFiller();

		/****** TopOpeBRep_DSFiller::ChangeShapeIntersector ******/
		/****** md5 signature: 373fa58a8d6b9fee7bf9640d5ccf9f06 ******/
		%feature("compactdefaultargs") ChangeShapeIntersector;
		%feature("autodoc", "Return
-------
TopOpeBRep_ShapeIntersector

Description
-----------
No available documentation.
") ChangeShapeIntersector;
		TopOpeBRep_ShapeIntersector & ChangeShapeIntersector();

		/****** TopOpeBRep_DSFiller::ChangeShapeIntersector2d ******/
		/****** md5 signature: ccba574a2ff15e1350384beb726a2f67 ******/
		%feature("compactdefaultargs") ChangeShapeIntersector2d;
		%feature("autodoc", "Return
-------
TopOpeBRep_ShapeIntersector2d

Description
-----------
No available documentation.
") ChangeShapeIntersector2d;
		TopOpeBRep_ShapeIntersector2d & ChangeShapeIntersector2d();

		/****** TopOpeBRep_DSFiller::Checker ******/
		/****** md5 signature: 1b9d5d2546157986ea508477f44d8430 ******/
		%feature("compactdefaultargs") Checker;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Checker;
		void Checker(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::Complete ******/
		/****** md5 signature: c1cbcbc9cdcd8d6779c56214ece9a089 ******/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Complete;
		void Complete(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::CompleteDS ******/
		/****** md5 signature: 298ea4b1a23c2b2b60dcc61137773361 ******/
		%feature("compactdefaultargs") CompleteDS;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
Update the data structure with relevant information deduced from the intersections. //! Shells containing an intersected face. Wires containing an intersected edge.
") CompleteDS;
		void CompleteDS(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::CompleteDS2d ******/
		/****** md5 signature: 610994e807ee28a545e1f5070174df41 ******/
		%feature("compactdefaultargs") CompleteDS2d;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
Update the data structure with relevant information deduced from the intersections 2d. //! Shells containing an intersected face. Wires containing an intersected edge. //! search for interference identity using edge connexity //NYI.
") CompleteDS2d;
		void CompleteDS2d(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::Filter ******/
		/****** md5 signature: 766f5d92da74080f37f019c1e892ffe1 ******/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Filter;
		void Filter(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::GapFiller ******/
		/****** md5 signature: bbd4a4842b10fc20392f993b9a6133bc ******/
		%feature("compactdefaultargs") GapFiller;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") GapFiller;
		void GapFiller(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::Insert ******/
		/****** md5 signature: 665de110eeab73fc45dd6a102cd78ae4 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure
orientFORWARD: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Stores in <DS> the intersections of <S1> and <S2>. if orientFORWARD = True S FORWARD,REVERSED --> FORWARD S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL.
") Insert;
		void Insert(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Boolean orientFORWARD = Standard_True);

		/****** TopOpeBRep_DSFiller::Insert1d ******/
		/****** md5 signature: db5f6ee00fabae6f226597adb9c30b37 ******/
		%feature("compactdefaultargs") Insert1d;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
F1: TopoDS_Face
F2: TopoDS_Face
HDS: TopOpeBRepDS_HDataStructure
orientFORWARD: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Stores in <DS> the intersections of <S1> and <S2>. S1 and S2 are edges or wires. S1 edges have a 2d representation in face F1 S2 edges have a 2d representation in face F2 F1 is the face which surface is taken as reference for 2d description of S1 and S2 edges. if orientFORWARD = True S FORWARD,REVERSED --> FORWARD S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL.
") Insert1d;
		void Insert1d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const TopoDS_Face & F1, const TopoDS_Face & F2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Boolean orientFORWARD = Standard_False);

		/****** TopOpeBRep_DSFiller::Insert2d ******/
		/****** md5 signature: 7bbe73f7028f9501e3aaab2c40aaea66 ******/
		%feature("compactdefaultargs") Insert2d;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
Stores in <DS> the intersections of <S1> and <S2>. S1 et S2 contain only SameDomain Face.
") Insert2d;
		void Insert2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::InsertIntersection ******/
		/****** md5 signature: ce998609c99cc6ba7bd504759ebc2654 ******/
		%feature("compactdefaultargs") InsertIntersection;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure
orientFORWARD: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Stores in <DS> the intersections of <S1> and <S2>. if orientFORWARD = True S FORWAR,REVERSED --> FORWARD S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL.
") InsertIntersection;
		void InsertIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Boolean orientFORWARD = Standard_True);

		/****** TopOpeBRep_DSFiller::InsertIntersection2d ******/
		/****** md5 signature: 32df11ddce8d9f8436943cc95129dfda ******/
		%feature("compactdefaultargs") InsertIntersection2d;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
S1, S2 set of tangent face lance les intersections 2d pour coder correctement les faces SameDomain.
") InsertIntersection2d;
		void InsertIntersection2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::IsContext1d ******/
		/****** md5 signature: a224b63bd5e25aef88157d00321c46b6 ******/
		%feature("compactdefaultargs") IsContext1d;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsContext1d;
		Standard_Boolean IsContext1d(const TopoDS_Shape & S);

		/****** TopOpeBRep_DSFiller::IsMadeOf1d ******/
		/****** md5 signature: 07a0ed23f9952008160be5a338e4a363 ******/
		%feature("compactdefaultargs") IsMadeOf1d;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsMadeOf1d;
		Standard_Boolean IsMadeOf1d(const TopoDS_Shape & S);

		/****** TopOpeBRep_DSFiller::PShapeClassifier ******/
		/****** md5 signature: 839210bbffc66c6dadfa1a9483c467a7 ******/
		%feature("compactdefaultargs") PShapeClassifier;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_PShapeClassifier

Description
-----------
return field myPShapeClassifier. set field myPShapeClassifier.
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier();

		/****** TopOpeBRep_DSFiller::Reducer ******/
		/****** md5 signature: cf786c5031b4295615b5b69524dacaef ******/
		%feature("compactdefaultargs") Reducer;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Reducer;
		void Reducer(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_DSFiller::RemoveUnsharedGeometry ******/
		/****** md5 signature: 3a71e62209739aeac2348609183aade5 ******/
		%feature("compactdefaultargs") RemoveUnsharedGeometry;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") RemoveUnsharedGeometry;
		void RemoveUnsharedGeometry(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRep_DSFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRep_EdgesFiller *
*******************************/
class TopOpeBRep_EdgesFiller {
	public:
		/****** TopOpeBRep_EdgesFiller::TopOpeBRep_EdgesFiller ******/
		/****** md5 signature: ec896d01f7f06bf02131d38934ea4515 ******/
		%feature("compactdefaultargs") TopOpeBRep_EdgesFiller;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_EdgesFiller;
		 TopOpeBRep_EdgesFiller();

		/****** TopOpeBRep_EdgesFiller::Face ******/
		/****** md5 signature: f92ebdacef14b7f450400a186e83473d ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
I: int
F: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Face;
		void Face(const Standard_Integer I, const TopoDS_Shape & F);

		/****** TopOpeBRep_EdgesFiller::Face ******/
		/****** md5 signature: 3ee676861b06f3c0597afbbe4966b236 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Face;
		const TopoDS_Shape Face(const Standard_Integer I);

		/****** TopOpeBRep_EdgesFiller::Insert ******/
		/****** md5 signature: 50b516246815fa264f5aa7c6f66c6e10 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Shape
E2: TopoDS_Shape
EI: TopOpeBRep_EdgesIntersector
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Insert;
		void Insert(const TopoDS_Shape & E1, const TopoDS_Shape & E2, TopOpeBRep_EdgesIntersector & EI, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRep_EdgesFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRep_EdgesIntersector *
************************************/
class TopOpeBRep_EdgesIntersector {
	public:
		/****** TopOpeBRep_EdgesIntersector::TopOpeBRep_EdgesIntersector ******/
		/****** md5 signature: b420776cd4679d2c673c90c15b89c7dc ******/
		%feature("compactdefaultargs") TopOpeBRep_EdgesIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_EdgesIntersector;
		 TopOpeBRep_EdgesIntersector();

		/****** TopOpeBRep_EdgesIntersector::Curve ******/
		/****** md5 signature: c197fdb0292db57c51429bfa890763a8 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Geom2dAdaptor_Curve

Description
-----------
No available documentation.
") Curve;
		Geom2dAdaptor_Curve Curve(const Standard_Integer Index);

		/****** TopOpeBRep_EdgesIntersector::Dimension ******/
		/****** md5 signature: bffc3d9b070e68685a6f532f4d09951a ******/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "
Parameters
----------
D: int

Return
-------
None

Description
-----------
No available documentation.
") Dimension;
		void Dimension(const Standard_Integer D);

		/****** TopOpeBRep_EdgesIntersector::Dimension ******/
		/****** md5 signature: e4bdde894007391dd45dcb2fa38eb0af ******/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
set working space dimension D = 1 for E &|| W, 2 for E in F.
") Dimension;
		Standard_Integer Dimension();

		/****** TopOpeBRep_EdgesIntersector::Dump ******/
		/****** md5 signature: 6dadf2b055ff57119ece31d6e8450595 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
str: str
ie1: int (optional, default to 0)
ie2: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(TCollection_AsciiString str, const Standard_Integer ie1 = 0, const Standard_Integer ie2 = 0);

		/****** TopOpeBRep_EdgesIntersector::Edge ******/
		/****** md5 signature: 307eac48f15b7575b76de6ac6147f9b1 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Shape Edge(const Standard_Integer Index);

		/****** TopOpeBRep_EdgesIntersector::Face ******/
		/****** md5 signature: 369bad292fcb0f7622cfabd8d11dd8db ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Face;
		const TopoDS_Shape Face(const Standard_Integer Index);

		/****** TopOpeBRep_EdgesIntersector::FacesSameOriented ******/
		/****** md5 signature: 435f628c00049ebc1d70e1ce34bc8025 ******/
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FacesSameOriented;
		Standard_Boolean FacesSameOriented();

		/****** TopOpeBRep_EdgesIntersector::ForceTolerances ******/
		/****** md5 signature: 67adf0c8741f8cd5a3ea9d107acd1de6 ******/
		%feature("compactdefaultargs") ForceTolerances;
		%feature("autodoc", "
Parameters
----------
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") ForceTolerances;
		void ForceTolerances(const Standard_Real Tol1, const Standard_Real Tol2);

		/****** TopOpeBRep_EdgesIntersector::HasSegment ******/
		/****** md5 signature: 1e8e9253796e93e66360229d525d6678 ******/
		%feature("compactdefaultargs") HasSegment;
		%feature("autodoc", "Return
-------
bool

Description
-----------
true if at least one intersection segment.
") HasSegment;
		Standard_Boolean HasSegment();

		/****** TopOpeBRep_EdgesIntersector::InitPoint ******/
		/****** md5 signature: d3803d80eaa4169b2e84fa10eb0a3519 ******/
		%feature("compactdefaultargs") InitPoint;
		%feature("autodoc", "
Parameters
----------
selectkeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") InitPoint;
		void InitPoint(const Standard_Boolean selectkeep = Standard_True);

		/****** TopOpeBRep_EdgesIntersector::IsEmpty ******/
		/****** md5 signature: e27f5e4366afc93bf8faeaa27a6a716c ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TopOpeBRep_EdgesIntersector::MorePoint ******/
		/****** md5 signature: 49b6d3fce0f619d47fb6c22cd6e43311 ******/
		%feature("compactdefaultargs") MorePoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MorePoint;
		Standard_Boolean MorePoint();

		/****** TopOpeBRep_EdgesIntersector::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** TopOpeBRep_EdgesIntersector::NbSegments ******/
		/****** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSegments;
		Standard_Integer NbSegments();

		/****** TopOpeBRep_EdgesIntersector::NextPoint ******/
		/****** md5 signature: 405187df0396980d4a156a27c62571e1 ******/
		%feature("compactdefaultargs") NextPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextPoint;
		void NextPoint();

		/****** TopOpeBRep_EdgesIntersector::Perform ******/
		/****** md5 signature: e9dbea4006900374342d9db06fb69172 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Shape
E2: TopoDS_Shape
ReduceSegments: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & E1, const TopoDS_Shape & E2, const Standard_Boolean ReduceSegments = Standard_True);

		/****** TopOpeBRep_EdgesIntersector::Point ******/
		/****** md5 signature: ae4590a19e23c5058b49e8da638135ff ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
TopOpeBRep_Point2d

Description
-----------
No available documentation.
") Point;
		const TopOpeBRep_Point2d & Point();

		/****** TopOpeBRep_EdgesIntersector::Point ******/
		/****** md5 signature: dd5f5035ef5ee0ddf6bf63ee2f08e025 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRep_Point2d

Description
-----------
No available documentation.
") Point;
		const TopOpeBRep_Point2d & Point(const Standard_Integer I);

		/****** TopOpeBRep_EdgesIntersector::Points ******/
		/****** md5 signature: 16de9901bc57813b3c3bcac54da5d818 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
TopOpeBRep_SequenceOfPoint2d

Description
-----------
No available documentation.
") Points;
		const TopOpeBRep_SequenceOfPoint2d & Points();

		/****** TopOpeBRep_EdgesIntersector::ReduceSegment ******/
		/****** md5 signature: c7823a60919234c136cbc013497b5aa7 ******/
		%feature("compactdefaultargs") ReduceSegment;
		%feature("autodoc", "
Parameters
----------
P1: TopOpeBRep_Point2d
P2: TopOpeBRep_Point2d
Pn: TopOpeBRep_Point2d

Return
-------
bool

Description
-----------
No available documentation.
") ReduceSegment;
		virtual Standard_Boolean ReduceSegment(TopOpeBRep_Point2d & P1, TopOpeBRep_Point2d & P2, TopOpeBRep_Point2d & Pn);

		/****** TopOpeBRep_EdgesIntersector::SameDomain ******/
		/****** md5 signature: ceba397eccbd28c4c6715ac85077480f ******/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Return
-------
bool

Description
-----------
= mySameDomain.
") SameDomain;
		Standard_Boolean SameDomain();

		/****** TopOpeBRep_EdgesIntersector::SetFaces ******/
		/****** md5 signature: 7bcb2bdab219cd4f0ceefa5b896735ed ******/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetFaces;
		void SetFaces(const TopoDS_Shape & F1, const TopoDS_Shape & F2);

		/****** TopOpeBRep_EdgesIntersector::SetFaces ******/
		/****** md5 signature: 616b9954245a00e0805fe2e8a403c0c0 ******/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
B1: Bnd_Box
B2: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") SetFaces;
		void SetFaces(const TopoDS_Shape & F1, const TopoDS_Shape & F2, const Bnd_Box & B1, const Bnd_Box & B2);

		/****** TopOpeBRep_EdgesIntersector::Status1 ******/
		/****** md5 signature: a482506d6f765463bf27dc481a53ae08 ******/
		%feature("compactdefaultargs") Status1;
		%feature("autodoc", "Return
-------
TopOpeBRep_P2Dstatus

Description
-----------
No available documentation.
") Status1;
		TopOpeBRep_P2Dstatus Status1();

		/****** TopOpeBRep_EdgesIntersector::Surface ******/
		/****** md5 signature: 020f2de4ba0a5346a9d4639bba276e13 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
BRepAdaptor_Surface

Description
-----------
No available documentation.
") Surface;
		BRepAdaptor_Surface Surface(const Standard_Integer Index);

		/****** TopOpeBRep_EdgesIntersector::SurfacesSameOriented ******/
		/****** md5 signature: 5a73f090b826c38dcc30efe0cb99df4e ******/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented();

		/****** TopOpeBRep_EdgesIntersector::ToleranceMax ******/
		/****** md5 signature: a6a9621146265549179f54bf3bae3efc ******/
		%feature("compactdefaultargs") ToleranceMax;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ToleranceMax;
		Standard_Real ToleranceMax();

		/****** TopOpeBRep_EdgesIntersector::Tolerances ******/
		/****** md5 signature: 2d749b7f11bf1e85bb59a8023410578d ******/
		%feature("compactdefaultargs") Tolerances;
		%feature("autodoc", "
Parameters
----------

Return
-------
tol1: float
tol2: float

Description
-----------
No available documentation.
") Tolerances;
		void Tolerances(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend TopOpeBRep_EdgesIntersector {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Tolerance2(self):
		pass
	}
};

/****************************
* class TopOpeBRep_FFDumper *
****************************/
class TopOpeBRep_FFDumper : public Standard_Transient {
	public:
		/****** TopOpeBRep_FFDumper::TopOpeBRep_FFDumper ******/
		/****** md5 signature: 5069ea834b5634569d23872685d387c9 ******/
		%feature("compactdefaultargs") TopOpeBRep_FFDumper;
		%feature("autodoc", "
Parameters
----------
PFF: TopOpeBRep_PFacesFiller

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_FFDumper;
		 TopOpeBRep_FFDumper(const TopOpeBRep_PFacesFiller & PFF);

		/****** TopOpeBRep_FFDumper::DumpDSP ******/
		/****** md5 signature: 048812250355507033829dd1cde50af6 ******/
		%feature("compactdefaultargs") DumpDSP;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
GK: TopOpeBRepDS_Kind
G: int
newinDS: bool

Return
-------
None

Description
-----------
No available documentation.
") DumpDSP;
		void DumpDSP(const TopOpeBRep_VPointInter & VP, const TopOpeBRepDS_Kind GK, const Standard_Integer G, const Standard_Boolean newinDS);

		/****** TopOpeBRep_FFDumper::DumpLine ******/
		/****** md5 signature: 93d5b0b42f2b9aa01c9d8fc1b2561d02 ******/
		%feature("compactdefaultargs") DumpLine;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") DumpLine;
		void DumpLine(const Standard_Integer I);

		/****** TopOpeBRep_FFDumper::DumpLine ******/
		/****** md5 signature: 0817cf884e719d75a7c5ab6bf884c3e4 ******/
		%feature("compactdefaultargs") DumpLine;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
No available documentation.
") DumpLine;
		void DumpLine(const TopOpeBRep_LineInter & L);

		/****** TopOpeBRep_FFDumper::DumpVP ******/
		/****** md5 signature: 7cc0f5e39ed07a6c323a85014bd23b25 ******/
		%feature("compactdefaultargs") DumpVP;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter

Return
-------
None

Description
-----------
No available documentation.
") DumpVP;
		void DumpVP(const TopOpeBRep_VPointInter & VP);

		/****** TopOpeBRep_FFDumper::DumpVP ******/
		/****** md5 signature: 6dd6b95083b914790106d9856c392255 ******/
		%feature("compactdefaultargs") DumpVP;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
ISI: int

Return
-------
None

Description
-----------
No available documentation.
") DumpVP;
		void DumpVP(const TopOpeBRep_VPointInter & VP, const Standard_Integer ISI);

		/****** TopOpeBRep_FFDumper::ExploreIndex ******/
		/****** md5 signature: 57e25ab370d52f3fac2b745bac045a9a ******/
		%feature("compactdefaultargs") ExploreIndex;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ISI: int

Return
-------
int

Description
-----------
No available documentation.
") ExploreIndex;
		Standard_Integer ExploreIndex(const TopoDS_Shape & S, const Standard_Integer ISI);

		/****** TopOpeBRep_FFDumper::Init ******/
		/****** md5 signature: 94f7072b958322260086eb97600758e9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
PFF: TopOpeBRep_PFacesFiller

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRep_PFacesFiller & PFF);

		/****** TopOpeBRep_FFDumper::PFacesFillerDummy ******/
		/****** md5 signature: e29ebcd883c2de9933d64a64ee1835b0 ******/
		%feature("compactdefaultargs") PFacesFillerDummy;
		%feature("autodoc", "Return
-------
TopOpeBRep_PFacesFiller

Description
-----------
No available documentation.
") PFacesFillerDummy;
		TopOpeBRep_PFacesFiller PFacesFillerDummy();

};


%make_alias(TopOpeBRep_FFDumper)

%extend TopOpeBRep_FFDumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRep_FFTransitionTool *
************************************/
class TopOpeBRep_FFTransitionTool {
	public:
		/****** TopOpeBRep_FFTransitionTool::ProcessEdgeONTransition ******/
		/****** md5 signature: 1ac26d2eb27f9d8dc22b1fe8497e64f4 ******/
		%feature("compactdefaultargs") ProcessEdgeONTransition;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
Index: int
R: TopoDS_Shape
E: TopoDS_Shape
F: TopoDS_Shape

Return
-------
TopOpeBRepDS_Transition

Description
-----------
compute transition on 'IntPatch_Restriction line' edge <R> when crossing edge <E> of face <F> at point <VP>. VP is given on edge <E> of face <F> of index <Index> (1 or 2). <VP> has been classified by FacesFiller as TopAbs_ON an edge <R> of the other face than <F> of current (face/face) intersection. Transition depends on the orientation of E in F. This method should be provided by IntPatch_Line (NYI).
") ProcessEdgeONTransition;
		static TopOpeBRepDS_Transition ProcessEdgeONTransition(const TopOpeBRep_VPointInter & VP, const Standard_Integer Index, const TopoDS_Shape & R, const TopoDS_Shape & E, const TopoDS_Shape & F);

		/****** TopOpeBRep_FFTransitionTool::ProcessEdgeTransition ******/
		/****** md5 signature: 9d92d843486c011fe37894a0bd496f9a ******/
		%feature("compactdefaultargs") ProcessEdgeTransition;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRep_VPointInter
Index: int
LineOrientation: TopAbs_Orientation

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") ProcessEdgeTransition;
		static TopOpeBRepDS_Transition ProcessEdgeTransition(const TopOpeBRep_VPointInter & P, const Standard_Integer Index, const TopAbs_Orientation LineOrientation);

		/****** TopOpeBRep_FFTransitionTool::ProcessFaceTransition ******/
		/****** md5 signature: cacbf344e82d51a5f1e2cf0e90be90df ******/
		%feature("compactdefaultargs") ProcessFaceTransition;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter
Index: int
FaceOrientation: TopAbs_Orientation

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") ProcessFaceTransition;
		static TopOpeBRepDS_Transition ProcessFaceTransition(const TopOpeBRep_LineInter & L, const Standard_Integer Index, const TopAbs_Orientation FaceOrientation);

		/****** TopOpeBRep_FFTransitionTool::ProcessLineTransition ******/
		/****** md5 signature: 1a1b60881796672a7dc540281f6d7373 ******/
		%feature("compactdefaultargs") ProcessLineTransition;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRep_VPointInter
Index: int
EdgeOrientation: TopAbs_Orientation

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") ProcessLineTransition;
		static TopOpeBRepDS_Transition ProcessLineTransition(const TopOpeBRep_VPointInter & P, const Standard_Integer Index, const TopAbs_Orientation EdgeOrientation);

		/****** TopOpeBRep_FFTransitionTool::ProcessLineTransition ******/
		/****** md5 signature: a4405ed67eccfe492272c9ddb0d3f109 ******/
		%feature("compactdefaultargs") ProcessLineTransition;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRep_VPointInter
L: TopOpeBRep_LineInter

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") ProcessLineTransition;
		static TopOpeBRepDS_Transition ProcessLineTransition(const TopOpeBRep_VPointInter & P, const TopOpeBRep_LineInter & L);

};


%extend TopOpeBRep_FFTransitionTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TopOpeBRep_FaceEdgeFiller *
**********************************/
class TopOpeBRep_FaceEdgeFiller {
	public:
		/****** TopOpeBRep_FaceEdgeFiller::TopOpeBRep_FaceEdgeFiller ******/
		/****** md5 signature: 05c921804eac70417f5abaa5fe4fb035 ******/
		%feature("compactdefaultargs") TopOpeBRep_FaceEdgeFiller;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_FaceEdgeFiller;
		 TopOpeBRep_FaceEdgeFiller();

		/****** TopOpeBRep_FaceEdgeFiller::Insert ******/
		/****** md5 signature: ea225ff45a154ecb096d760424dded0a ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape
FEINT: TopOpeBRep_FaceEdgeIntersector
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Insert;
		void Insert(const TopoDS_Shape & F, const TopoDS_Shape & E, TopOpeBRep_FaceEdgeIntersector & FEINT, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRep_FaceEdgeFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopOpeBRep_FaceEdgeIntersector *
***************************************/
class TopOpeBRep_FaceEdgeIntersector {
	public:
		/****** TopOpeBRep_FaceEdgeIntersector::TopOpeBRep_FaceEdgeIntersector ******/
		/****** md5 signature: e936a0541dae4fc5be154eb54a1c4949 ******/
		%feature("compactdefaultargs") TopOpeBRep_FaceEdgeIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_FaceEdgeIntersector;
		 TopOpeBRep_FaceEdgeIntersector();

		/****** TopOpeBRep_FaceEdgeIntersector::ForceTolerance ******/
		/****** md5 signature: 2332958e0618d3a987995a3a25f212d8 ******/
		%feature("compactdefaultargs") ForceTolerance;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
None

Description
-----------
Force the tolerance values used by the next Perform(S1,S2) call.
") ForceTolerance;
		void ForceTolerance(const Standard_Real tol);

		/****** TopOpeBRep_FaceEdgeIntersector::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
trace only.
") Index;
		Standard_Integer Index();

		/****** TopOpeBRep_FaceEdgeIntersector::InitPoint ******/
		/****** md5 signature: ef05c711044f2a178bf8355ee34118b6 ******/
		%feature("compactdefaultargs") InitPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitPoint;
		void InitPoint();

		/****** TopOpeBRep_FaceEdgeIntersector::IsEmpty ******/
		/****** md5 signature: e27f5e4366afc93bf8faeaa27a6a716c ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TopOpeBRep_FaceEdgeIntersector::IsVertex ******/
		/****** md5 signature: 6c175ba1f2197d81edaac96b81cd1516 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
P: gp_Pnt
Tol: float
V: TopoDS_Vertex

Return
-------
bool

Description
-----------
No available documentation.
") IsVertex;
		Standard_Boolean IsVertex(const TopoDS_Shape & S, const gp_Pnt & P, const Standard_Real Tol, TopoDS_Vertex & V);

		/****** TopOpeBRep_FaceEdgeIntersector::IsVertex ******/
		/****** md5 signature: 878988d0a7f2ca9bf81769584d5dc947 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
I: int
V: TopoDS_Vertex

Return
-------
bool

Description
-----------
No available documentation.
") IsVertex;
		Standard_Boolean IsVertex(const Standard_Integer I, TopoDS_Vertex & V);

		/****** TopOpeBRep_FaceEdgeIntersector::MorePoint ******/
		/****** md5 signature: 49b6d3fce0f619d47fb6c22cd6e43311 ******/
		%feature("compactdefaultargs") MorePoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MorePoint;
		Standard_Boolean MorePoint();

		/****** TopOpeBRep_FaceEdgeIntersector::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** TopOpeBRep_FaceEdgeIntersector::NextPoint ******/
		/****** md5 signature: 405187df0396980d4a156a27c62571e1 ******/
		%feature("compactdefaultargs") NextPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextPoint;
		void NextPoint();

		/****** TopOpeBRep_FaceEdgeIntersector::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
parametre de Value() sur l'arete.
") Parameter;
		Standard_Real Parameter();

		/****** TopOpeBRep_FaceEdgeIntersector::Perform ******/
		/****** md5 signature: 925c374623a2aa188f1a0a0d3fcdd3c6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & F, const TopoDS_Shape & E);

		/****** TopOpeBRep_FaceEdgeIntersector::Shape ******/
		/****** md5 signature: 9490bf72de2629e156b2f9f7c67be648 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
returns intersected face or edge according to value of <Index> = 1 or 2.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer Index);

		/****** TopOpeBRep_FaceEdgeIntersector::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
IN ou ON / a la face. Les points OUT ne sont pas retournes.
") State;
		TopAbs_State State();

		/****** TopOpeBRep_FaceEdgeIntersector::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return the tolerance value used in the last Perform() call If ForceTolerance() has been called, return the given value. If not, return value extracted from shapes.
") Tolerance;
		Standard_Real Tolerance();

		/****** TopOpeBRep_FaceEdgeIntersector::Transition ******/
		/****** md5 signature: 62dd23c2bf48fcf4aab8a097e7a7aec2 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
Index: int
FaceOrientation: TopAbs_Orientation

Return
-------
TopOpeBRepDS_Transition

Description
-----------
Index = 1 transition par rapport a la face, en cheminant sur l'arete.
") Transition;
		TopOpeBRepDS_Transition Transition(const Standard_Integer Index, const TopAbs_Orientation FaceOrientation);

		/****** TopOpeBRep_FaceEdgeIntersector::UVPoint ******/
		/****** md5 signature: fe94b12a8a35a715381902f22211fdbd ******/
		%feature("compactdefaultargs") UVPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
parametre de Value() sur la face.
") UVPoint;
		void UVPoint(gp_Pnt2d & P);

		/****** TopOpeBRep_FaceEdgeIntersector::Value ******/
		/****** md5 signature: 1d429a229b77b32713aab235505e93c2 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
return the 3D point of the current intersection point.
") Value;
		gp_Pnt Value();

};


%extend TopOpeBRep_FaceEdgeIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRep_FacesFiller *
*******************************/
class TopOpeBRep_FacesFiller {
	public:
		/****** TopOpeBRep_FacesFiller::TopOpeBRep_FacesFiller ******/
		/****** md5 signature: 1b6f7393d6b5e3b9e71f9278ae5e7392 ******/
		%feature("compactdefaultargs") TopOpeBRep_FacesFiller;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_FacesFiller;
		 TopOpeBRep_FacesFiller();

		/****** TopOpeBRep_FacesFiller::AddShapesLine ******/
		/****** md5 signature: 0f9d7f5f220178518550d5446499bb62 ******/
		%feature("compactdefaultargs") AddShapesLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
compute 3d curve, pcurves and face/curve interferences for current NDSC. Add them to the DS.
") AddShapesLine;
		void AddShapesLine();

		/****** TopOpeBRep_FacesFiller::ChangeDataStructure ******/
		/****** md5 signature: 9c5ca6f9698b7c15bd242e59302c821d ******/
		%feature("compactdefaultargs") ChangeDataStructure;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_DataStructure

Description
-----------
No available documentation.
") ChangeDataStructure;
		TopOpeBRepDS_DataStructure & ChangeDataStructure();

		/****** TopOpeBRep_FacesFiller::ChangeFacesIntersector ******/
		/****** md5 signature: 09c29fa34bf77993f5e46096b4b26b96 ******/
		%feature("compactdefaultargs") ChangeFacesIntersector;
		%feature("autodoc", "Return
-------
TopOpeBRep_FacesIntersector

Description
-----------
No available documentation.
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector();

		/****** TopOpeBRep_FacesFiller::ChangePointClassifier ******/
		/****** md5 signature: 2caf5c2eeb9288d67ac51161e7d46d1a ******/
		%feature("compactdefaultargs") ChangePointClassifier;
		%feature("autodoc", "Return
-------
TopOpeBRep_PointClassifier

Description
-----------
No available documentation.
") ChangePointClassifier;
		TopOpeBRep_PointClassifier & ChangePointClassifier();

		/****** TopOpeBRep_FacesFiller::CheckLine ******/
		/****** md5 signature: aae89fff1e7f37947e2ec0e82e718867 ******/
		%feature("compactdefaultargs") CheckLine;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
bool

Description
-----------
No available documentation.
") CheckLine;
		Standard_Boolean CheckLine(TopOpeBRep_LineInter & L);

		/****** TopOpeBRep_FacesFiller::EqualpPonR ******/
		/****** md5 signature: 3e38040d810c0572b9e6555d4c8b92f1 ******/
		%feature("compactdefaultargs") EqualpPonR;
		%feature("autodoc", "
Parameters
----------
Lrest: TopOpeBRep_LineInter
VP1: TopOpeBRep_VPointInter
VP2: TopOpeBRep_VPointInter

Return
-------
bool

Description
-----------
No available documentation.
") EqualpPonR;
		static Standard_Boolean EqualpPonR(const TopOpeBRep_LineInter & Lrest, const TopOpeBRep_VPointInter & VP1, const TopOpeBRep_VPointInter & VP2);

		/****** TopOpeBRep_FacesFiller::Face ******/
		/****** md5 signature: d1eb857c2a65e9d3cb2fc51a7ab45063 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face(const Standard_Integer I);

		/****** TopOpeBRep_FacesFiller::FaceFaceTransition ******/
		/****** md5 signature: 4b53f4d76ab9e6e1af8ea6ab319330dd ******/
		%feature("compactdefaultargs") FaceFaceTransition;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter
I: int

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition(const TopOpeBRep_LineInter & L, const Standard_Integer I);

		/****** TopOpeBRep_FacesFiller::FaceFaceTransition ******/
		/****** md5 signature: 83ffefbe5b8ae65ccfae12ac03265cee ******/
		%feature("compactdefaultargs") FaceFaceTransition;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition(const Standard_Integer I);

		/****** TopOpeBRep_FacesFiller::FillLine ******/
		/****** md5 signature: 3f4fd429b17892c8657870a6ee700552 ******/
		%feature("compactdefaultargs") FillLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") FillLine;
		void FillLine();

		/****** TopOpeBRep_FacesFiller::FillLineVPonR ******/
		/****** md5 signature: 9bc23548d0e04a2f4b9850f70b28329d ******/
		%feature("compactdefaultargs") FillLineVPonR;
		%feature("autodoc", "Return
-------
None

Description
-----------
VP processing for restriction line and line sharing same domain with section edges: - if restriction: Adds restriction edges as section edges and compute face/edge interference. - if same domain: If line share same domain with section edges, compute parts of line IN/IN the two faces, and compute curve/point interference for VP boundaries.
") FillLineVPonR;
		void FillLineVPonR();

		/****** TopOpeBRep_FacesFiller::GetESL ******/
		/****** md5 signature: 05cb1059d032dbc8639ca3b389a65ddc ******/
		%feature("compactdefaultargs") GetESL;
		%feature("autodoc", "
Parameters
----------
LES: TopTools_ListOfShape

Return
-------
None

Description
-----------
Get map <mapES > of restriction edges having parts IN one of the 2 faces.
") GetESL;
		void GetESL(TopTools_ListOfShape & LES);

		/****** TopOpeBRep_FacesFiller::GetFFGeometry ******/
		/****** md5 signature: e5ae8ea42addf73088da89205b8d434b ******/
		%feature("compactdefaultargs") GetFFGeometry;
		%feature("autodoc", "
Parameters
----------
DSP: TopOpeBRepDS_Point
K: TopOpeBRepDS_Kind

Return
-------
G: int

Description
-----------
search for G = geometry of Point which is identical to <DSP> among the DS Points created in the CURRENT face/face intersection ( current Insert() call).
") GetFFGeometry;
		Standard_Boolean GetFFGeometry(const TopOpeBRepDS_Point & DSP, TopOpeBRepDS_Kind & K, Standard_Integer &OutValue);

		/****** TopOpeBRep_FacesFiller::GetFFGeometry ******/
		/****** md5 signature: a2549ea89cd75ad5dfb9c3a9a51ed9c6 ******/
		%feature("compactdefaultargs") GetFFGeometry;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
K: TopOpeBRepDS_Kind

Return
-------
G: int

Description
-----------
search for G = geometry of Point which is identical to <VP> among the DS Points created in the CURRENT face/face intersection ( current Insert() call).
") GetFFGeometry;
		Standard_Boolean GetFFGeometry(const TopOpeBRep_VPointInter & VP, TopOpeBRepDS_Kind & K, Standard_Integer &OutValue);

		/****** TopOpeBRep_FacesFiller::GetGeometry ******/
		/****** md5 signature: ea08ea8cc09a4de2f0d12bd1814a3436 ******/
		%feature("compactdefaultargs") GetGeometry;
		%feature("autodoc", "
Parameters
----------
IT: TopOpeBRepDS_ListIteratorOfListOfInterference
VP: TopOpeBRep_VPointInter
K: TopOpeBRepDS_Kind

Return
-------
G: int

Description
-----------
Get the geometry of a DS point <DSP>. Search for it with ScanInterfList (previous method). if found, set <G> to the geometry of the interference found. else, add the point <DSP> in the <DS> and set <G> to the value of the new geometry such created. returns the value of ScanInterfList().
") GetGeometry;
		Standard_Boolean GetGeometry(TopOpeBRepDS_ListIteratorOfListOfInterference & IT, const TopOpeBRep_VPointInter & VP, Standard_Integer &OutValue, TopOpeBRepDS_Kind & K);

		/****** TopOpeBRep_FacesFiller::GetTraceIndex ******/
		/****** md5 signature: 9515d5e22d4204dd0a3c74673d23b180 ******/
		%feature("compactdefaultargs") GetTraceIndex;
		%feature("autodoc", "
Parameters
----------

Return
-------
exF1: int
exF2: int

Description
-----------
No available documentation.
") GetTraceIndex;
		void GetTraceIndex(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRep_FacesFiller::HDataStructure ******/
		/****** md5 signature: c8d98611444c2e86125ddbdf732dc7ac ******/
		%feature("compactdefaultargs") HDataStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
No available documentation.
") HDataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> HDataStructure();

		/****** TopOpeBRep_FacesFiller::Insert ******/
		/****** md5 signature: 6e7ad6ed7342d2f8a533b4ef790303de ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
FACINT: TopOpeBRep_FacesIntersector
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
Stores in <DS> the intersections of <S1> and <S2>.
") Insert;
		void Insert(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopOpeBRep_FacesIntersector & FACINT, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRep_FacesFiller::IsVPtransLok ******/
		/****** md5 signature: 8c7d876f7974edd31c94d147a2e292fe ******/
		%feature("compactdefaultargs") IsVPtransLok;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter
iVP: int
SI12: int
T: TopOpeBRepDS_Transition

Return
-------
bool

Description
-----------
Computes the transition <T> of the VPoint <iVP> on the edge of <SI12>. Returns <False> if the status is unknown.
") IsVPtransLok;
		static Standard_Boolean IsVPtransLok(const TopOpeBRep_LineInter & L, const Standard_Integer iVP, const Standard_Integer SI12, TopOpeBRepDS_Transition & T);

		/****** TopOpeBRep_FacesFiller::LSameDomainERL ******/
		/****** md5 signature: f1218c16715526d12a247c1a2487174e ******/
		%feature("compactdefaultargs") LSameDomainERL;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter
ERL: TopTools_ListOfShape

Return
-------
bool

Description
-----------
Returns <True> if <L> shares a same geometric domain with at least one of the section edges of <ERL>.
") LSameDomainERL;
		static Standard_Boolean LSameDomainERL(const TopOpeBRep_LineInter & L, const TopTools_ListOfShape & ERL);

		/****** TopOpeBRep_FacesFiller::Lminmax ******/
		/****** md5 signature: 9feef7c9d75bcc96c90ba5d847e4d3dc ******/
		%feature("compactdefaultargs") Lminmax;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
pmin: float
pmax: float

Description
-----------
Computes <pmin> and <pmax> the upper and lower bounds of <L> enclosing all vpoints.
") Lminmax;
		static void Lminmax(const TopOpeBRep_LineInter & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_FacesFiller::LoadLine ******/
		/****** md5 signature: eea790a75362816ecedd96c5ef6cdcd0 ******/
		%feature("compactdefaultargs") LoadLine;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
No available documentation.
") LoadLine;
		void LoadLine(TopOpeBRep_LineInter & L);

		/****** TopOpeBRep_FacesFiller::MakeGeometry ******/
		/****** md5 signature: dee7966b35c4f403dec75410d5e39503 ******/
		%feature("compactdefaultargs") MakeGeometry;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
ShapeIndex: int
K: TopOpeBRepDS_Kind

Return
-------
int

Description
-----------
No available documentation.
") MakeGeometry;
		Standard_Integer MakeGeometry(const TopOpeBRep_VPointInter & VP, const Standard_Integer ShapeIndex, TopOpeBRepDS_Kind & K);

		/****** TopOpeBRep_FacesFiller::PDataStructureDummy ******/
		/****** md5 signature: a50961b93febbb413cbacfb55e6e0326 ******/
		%feature("compactdefaultargs") PDataStructureDummy;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_PDataStructure

Description
-----------
No available documentation.
") PDataStructureDummy;
		TopOpeBRepDS_PDataStructure PDataStructureDummy();

		/****** TopOpeBRep_FacesFiller::PFacesIntersectorDummy ******/
		/****** md5 signature: 60c9cb7edbde9c65a0f53236e49d9e32 ******/
		%feature("compactdefaultargs") PFacesIntersectorDummy;
		%feature("autodoc", "Return
-------
TopOpeBRep_PFacesIntersector

Description
-----------
No available documentation.
") PFacesIntersectorDummy;
		TopOpeBRep_PFacesIntersector PFacesIntersectorDummy();

		/****** TopOpeBRep_FacesFiller::PLineInterDummy ******/
		/****** md5 signature: 20d21f153b52d5c38ce7cf68a51ddad1 ******/
		%feature("compactdefaultargs") PLineInterDummy;
		%feature("autodoc", "Return
-------
TopOpeBRep_PLineInter

Description
-----------
No available documentation.
") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy();

		/****** TopOpeBRep_FacesFiller::PShapeClassifier ******/
		/****** md5 signature: 839210bbffc66c6dadfa1a9483c467a7 ******/
		%feature("compactdefaultargs") PShapeClassifier;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_PShapeClassifier

Description
-----------
return field myPShapeClassifier.
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier();

		/****** TopOpeBRep_FacesFiller::ProcessLine ******/
		/****** md5 signature: 3fbc964cc3fd1ea2f783d3e9ccabb255 ******/
		%feature("compactdefaultargs") ProcessLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Process current intersection line (set by LoadLine).
") ProcessLine;
		void ProcessLine();

		/****** TopOpeBRep_FacesFiller::ProcessRLine ******/
		/****** md5 signature: 68792d07a6e6485b962014cb805439b1 ******/
		%feature("compactdefaultargs") ProcessRLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Process current restriction line, adding restriction edge and computing face/edge interference.
") ProcessRLine;
		void ProcessRLine();

		/****** TopOpeBRep_FacesFiller::ProcessSectionEdges ******/
		/****** md5 signature: 56500a0036691121fcecf788e2ff59eb ******/
		%feature("compactdefaultargs") ProcessSectionEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessSectionEdges;
		void ProcessSectionEdges();

		/****** TopOpeBRep_FacesFiller::ProcessVPInotonR ******/
		/****** md5 signature: f8366746a2b1ab05fab2f26f1647dde8 ******/
		%feature("compactdefaultargs") ProcessVPInotonR;
		%feature("autodoc", "
Parameters
----------
VPI: TopOpeBRep_VPointInterIterator

Return
-------
None

Description
-----------
processing ProcessVPnotonR for VPI.
") ProcessVPInotonR;
		void ProcessVPInotonR(TopOpeBRep_VPointInterIterator & VPI);

		/****** TopOpeBRep_FacesFiller::ProcessVPIonR ******/
		/****** md5 signature: 7b2711e44f83d0ba476600a5ab327ccc ******/
		%feature("compactdefaultargs") ProcessVPIonR;
		%feature("autodoc", "
Parameters
----------
VPI: TopOpeBRep_VPointInterIterator
trans1: TopOpeBRepDS_Transition
F1: TopoDS_Shape
ShapeIndex: int

Return
-------
None

Description
-----------
processing ProcessVPonR for VPI.
") ProcessVPIonR;
		void ProcessVPIonR(TopOpeBRep_VPointInterIterator & VPI, const TopOpeBRepDS_Transition & trans1, const TopoDS_Shape & F1, const Standard_Integer ShapeIndex);

		/****** TopOpeBRep_FacesFiller::ProcessVPR ******/
		/****** md5 signature: 78c845a2afa36d137735133e5b7c3482 ******/
		%feature("compactdefaultargs") ProcessVPR;
		%feature("autodoc", "
Parameters
----------
FF: TopOpeBRep_FacesFiller
VP: TopOpeBRep_VPointInter

Return
-------
None

Description
-----------
calling the following ProcessVPIonR and ProcessVPonR.
") ProcessVPR;
		void ProcessVPR(TopOpeBRep_FacesFiller & FF, const TopOpeBRep_VPointInter & VP);

		/****** TopOpeBRep_FacesFiller::ProcessVPnotonR ******/
		/****** md5 signature: fd4b0946e4dcdeb25ebaf9c54ac58450 ******/
		%feature("compactdefaultargs") ProcessVPnotonR;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter

Return
-------
None

Description
-----------
adds <VP>'s geometrical point to the DS (if not stored) and computes curve point interference.
") ProcessVPnotonR;
		void ProcessVPnotonR(const TopOpeBRep_VPointInter & VP);

		/****** TopOpeBRep_FacesFiller::ProcessVPonR ******/
		/****** md5 signature: 169572cd2179643dc8d8179740548277 ******/
		%feature("compactdefaultargs") ProcessVPonR;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
trans1: TopOpeBRepDS_Transition
F1: TopoDS_Shape
ShapeIndex: int

Return
-------
None

Description
-----------
adds <VP>'s geometric point (if not stored) and computes (curve or edge)/(point or vertex) interference.
") ProcessVPonR;
		void ProcessVPonR(const TopOpeBRep_VPointInter & VP, const TopOpeBRepDS_Transition & trans1, const TopoDS_Shape & F1, const Standard_Integer ShapeIndex);

		/****** TopOpeBRep_FacesFiller::ProcessVPonclosingR ******/
		/****** md5 signature: 02a558e7420235213db89b5fd3ab05b9 ******/
		%feature("compactdefaultargs") ProcessVPonclosingR;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
F1: TopoDS_Shape
ShapeIndex: int
transEdge: TopOpeBRepDS_Transition
PVKind: TopOpeBRepDS_Kind
PVIndex: int
EPIfound: bool
IEPI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
VP processing on closing arc.
") ProcessVPonclosingR;
		void ProcessVPonclosingR(const TopOpeBRep_VPointInter & VP, const TopoDS_Shape & F1, const Standard_Integer ShapeIndex, const TopOpeBRepDS_Transition & transEdge, const TopOpeBRepDS_Kind PVKind, const Standard_Integer PVIndex, const Standard_Boolean EPIfound, const opencascade::handle<TopOpeBRepDS_Interference> & IEPI);

		/****** TopOpeBRep_FacesFiller::ProcessVPondgE ******/
		/****** md5 signature: f97d3783ba8b73defc2b95d640ac9392 ******/
		%feature("compactdefaultargs") ProcessVPondgE;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
ShapeIndex: int
PVKind: TopOpeBRepDS_Kind
IEPI: TopOpeBRepDS_Interference
ICPI: TopOpeBRepDS_Interference

Return
-------
PVIndex: int
EPIfound: bool
CPIfound: bool

Description
-----------
VP processing on degenerated arc.
") ProcessVPondgE;
		Standard_Boolean ProcessVPondgE(const TopOpeBRep_VPointInter & VP, const Standard_Integer ShapeIndex, TopOpeBRepDS_Kind & PVKind, Standard_Integer &OutValue, Standard_Boolean &OutValue, opencascade::handle<TopOpeBRepDS_Interference> & IEPI, Standard_Boolean &OutValue, opencascade::handle<TopOpeBRepDS_Interference> & ICPI);

		/****** TopOpeBRep_FacesFiller::ResetDSC ******/
		/****** md5 signature: ea513f4665d6892ab4f58074b0e25b85 ******/
		%feature("compactdefaultargs") ResetDSC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetDSC;
		void ResetDSC();

		/****** TopOpeBRep_FacesFiller::SetPShapeClassifier ******/
		/****** md5 signature: 593f2e1757de04f9a9b3cad368416ae2 ******/
		%feature("compactdefaultargs") SetPShapeClassifier;
		%feature("autodoc", "
Parameters
----------
PSC: TopOpeBRepTool_PShapeClassifier

Return
-------
None

Description
-----------
set field myPShapeClassifier.
") SetPShapeClassifier;
		void SetPShapeClassifier(const TopOpeBRepTool_PShapeClassifier & PSC);

		/****** TopOpeBRep_FacesFiller::SetTraceIndex ******/
		/****** md5 signature: 13f9cfa37d1910afdfe7a0465a408ca0 ******/
		%feature("compactdefaultargs") SetTraceIndex;
		%feature("autodoc", "
Parameters
----------
exF1: int
exF2: int

Return
-------
None

Description
-----------
No available documentation.
") SetTraceIndex;
		void SetTraceIndex(const Standard_Integer exF1, const Standard_Integer exF2);

		/****** TopOpeBRep_FacesFiller::StoreCurveInterference ******/
		/****** md5 signature: 2f980eafd7d3d5ba80066112e2581773 ******/
		%feature("compactdefaultargs") StoreCurveInterference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Add interference <I> to list myDSCIL. on a given line, at first call, add a new DS curve.
") StoreCurveInterference;
		void StoreCurveInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRep_FacesFiller::TransvpOK ******/
		/****** md5 signature: 2e65e45984169e900552e4241580bf07 ******/
		%feature("compactdefaultargs") TransvpOK;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter
iVP: int
SI: int
isINOUT: bool

Return
-------
bool

Description
-----------
Computes transition on line for VP<iVP> on edge restriction of <SI>. If <isINOUT>: returns <true> if transition computed is IN/OUT else: returns <true> if transition computed is OUT/IN.
") TransvpOK;
		static Standard_Boolean TransvpOK(const TopOpeBRep_LineInter & L, const Standard_Integer iVP, const Standard_Integer SI, const Standard_Boolean isINOUT);

		/****** TopOpeBRep_FacesFiller::VPParamOnER ******/
		/****** md5 signature: 9b90bb2ae0078f88f784a276c3407d9b ******/
		%feature("compactdefaultargs") VPParamOnER;
		%feature("autodoc", "
Parameters
----------
vp: TopOpeBRep_VPointInter
Lrest: TopOpeBRep_LineInter

Return
-------
float

Description
-----------
Returns parameter u of vp on the restriction edge.
") VPParamOnER;
		static Standard_Real VPParamOnER(const TopOpeBRep_VPointInter & vp, const TopOpeBRep_LineInter & Lrest);

		/****** TopOpeBRep_FacesFiller::VP_Position ******/
		/****** md5 signature: 0161b645f978cf3492855099c4b3bc58 ******/
		%feature("compactdefaultargs") VP_Position;
		%feature("autodoc", "
Parameters
----------
FACINT: TopOpeBRep_FacesIntersector

Return
-------
None

Description
-----------
compute position of VPoints of lines.
") VP_Position;
		void VP_Position(TopOpeBRep_FacesIntersector & FACINT);

		/****** TopOpeBRep_FacesFiller::VP_Position ******/
		/****** md5 signature: 911653605333bf0a33a4374161a9e101 ******/
		%feature("compactdefaultargs") VP_Position;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
compute position of VPoints of line L.
") VP_Position;
		void VP_Position(TopOpeBRep_LineInter & L);

		/****** TopOpeBRep_FacesFiller::VP_Position ******/
		/****** md5 signature: 1bb505acf40761d4b753ec730a96d166 ******/
		%feature("compactdefaultargs") VP_Position;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter
VPC: TopOpeBRep_VPointInterClassifier

Return
-------
None

Description
-----------
compute position of VP with current faces, according to VP.ShapeIndex() .
") VP_Position;
		void VP_Position(TopOpeBRep_VPointInter & VP, TopOpeBRep_VPointInterClassifier & VPC);

		/****** TopOpeBRep_FacesFiller::VP_PositionOnL ******/
		/****** md5 signature: 82f6df9b6ab224e5cd2d64ad6edce4ba ******/
		%feature("compactdefaultargs") VP_PositionOnL;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
compute position of VPoints of non-restriction line L.
") VP_PositionOnL;
		void VP_PositionOnL(TopOpeBRep_LineInter & L);

		/****** TopOpeBRep_FacesFiller::VP_PositionOnR ******/
		/****** md5 signature: 2938fd67159f968c7fc9fcad9a285012 ******/
		%feature("compactdefaultargs") VP_PositionOnR;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
compute position of VPoints of restriction line L.
") VP_PositionOnR;
		void VP_PositionOnR(TopOpeBRep_LineInter & L);

};


%extend TopOpeBRep_FacesFiller {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def EqualpP(self):
		pass
	}
};

/************************************
* class TopOpeBRep_FacesIntersector *
************************************/
class TopOpeBRep_FacesIntersector {
	public:
		/****** TopOpeBRep_FacesIntersector::TopOpeBRep_FacesIntersector ******/
		/****** md5 signature: a1246bcb1ecd4a3f27c3f757eda41e4e ******/
		%feature("compactdefaultargs") TopOpeBRep_FacesIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_FacesIntersector;
		 TopOpeBRep_FacesIntersector();

		/****** TopOpeBRep_FacesIntersector::ChangeLine ******/
		/****** md5 signature: 6db5d320e1ba2a4a70d0ab0dc2a436a1 ******/
		%feature("compactdefaultargs") ChangeLine;
		%feature("autodoc", "
Parameters
----------
IL: int

Return
-------
TopOpeBRep_LineInter

Description
-----------
No available documentation.
") ChangeLine;
		TopOpeBRep_LineInter & ChangeLine(const Standard_Integer IL);

		/****** TopOpeBRep_FacesIntersector::CurrentLine ******/
		/****** md5 signature: 22ad0f2ab8e9c56998e748e35926a0d7 ******/
		%feature("compactdefaultargs") CurrentLine;
		%feature("autodoc", "Return
-------
TopOpeBRep_LineInter

Description
-----------
No available documentation.
") CurrentLine;
		TopOpeBRep_LineInter & CurrentLine();

		/****** TopOpeBRep_FacesIntersector::CurrentLineIndex ******/
		/****** md5 signature: f19bf95df37b0021eb2646adce1e031a ******/
		%feature("compactdefaultargs") CurrentLineIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CurrentLineIndex;
		Standard_Integer CurrentLineIndex();

		/****** TopOpeBRep_FacesIntersector::Face ******/
		/****** md5 signature: 369bad292fcb0f7622cfabd8d11dd8db ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
returns first or second intersected face.
") Face;
		const TopoDS_Shape Face(const Standard_Integer Index);

		/****** TopOpeBRep_FacesIntersector::ForceTolerances ******/
		/****** md5 signature: 2d14f1be2c680c1fee2affa302d3982d ******/
		%feature("compactdefaultargs") ForceTolerances;
		%feature("autodoc", "
Parameters
----------
tolarc: float
toltang: float

Return
-------
None

Description
-----------
Force the tolerance values used by the next Perform(S1,S2) call.
") ForceTolerances;
		void ForceTolerances(const Standard_Real tolarc, const Standard_Real toltang);

		/****** TopOpeBRep_FacesIntersector::GetTolerances ******/
		/****** md5 signature: e3135196754280b460b25245687c0142 ******/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "
Parameters
----------

Return
-------
tolarc: float
toltang: float

Description
-----------
Return the tolerance values used in the last Perform() call If ForceTolerances() has been called, return the given values. If not, return values extracted from shapes.
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_FacesIntersector::InitLine ******/
		/****** md5 signature: f504749d03e20247f91cc71106dd0275 ******/
		%feature("compactdefaultargs") InitLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitLine;
		void InitLine();

		/****** TopOpeBRep_FacesIntersector::IsDone ******/
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

		/****** TopOpeBRep_FacesIntersector::IsEmpty ******/
		/****** md5 signature: e27f5e4366afc93bf8faeaa27a6a716c ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TopOpeBRep_FacesIntersector::IsRestriction ******/
		/****** md5 signature: 86ca9d4838401ff362874c10a0ee38a7 ******/
		%feature("compactdefaultargs") IsRestriction;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
bool

Description
-----------
returns true if edge <E> is found as same as the edge associated with a RESTRICTION line.
") IsRestriction;
		Standard_Boolean IsRestriction(const TopoDS_Shape & E);

		/****** TopOpeBRep_FacesIntersector::Lines ******/
		/****** md5 signature: 01266e7e7f05b269e092fe7dd26172d3 ******/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRep_HArray1OfLineInter>

Description
-----------
No available documentation.
") Lines;
		opencascade::handle<TopOpeBRep_HArray1OfLineInter> Lines();

		/****** TopOpeBRep_FacesIntersector::MoreLine ******/
		/****** md5 signature: 0a27b6187736d1f555ac7a8353bb0b67 ******/
		%feature("compactdefaultargs") MoreLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreLine;
		Standard_Boolean MoreLine();

		/****** TopOpeBRep_FacesIntersector::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLines;
		Standard_Integer NbLines();

		/****** TopOpeBRep_FacesIntersector::NextLine ******/
		/****** md5 signature: b8bc90c0a38dfd7cf995d23f5a22c531 ******/
		%feature("compactdefaultargs") NextLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextLine;
		void NextLine();

		/****** TopOpeBRep_FacesIntersector::Perform ******/
		/****** md5 signature: 53c01bc5ada2f9f4b7461289783e5dd0 ******/
		%feature("compactdefaultargs") Perform;
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
Computes the intersection of faces S1 and S2.
") Perform;
		void Perform(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRep_FacesIntersector::Perform ******/
		/****** md5 signature: a342eb0cb7b86e306ff5999ed2a07d3a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
B1: Bnd_Box
B2: Bnd_Box

Return
-------
None

Description
-----------
Computes the intersection of faces S1 and S2.
") Perform;
		void Perform(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Bnd_Box & B1, const Bnd_Box & B2);

		/****** TopOpeBRep_FacesIntersector::PrepareLines ******/
		/****** md5 signature: 9bd4c3ce6c8a89ec456ee13414be072c ******/
		%feature("compactdefaultargs") PrepareLines;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") PrepareLines;
		void PrepareLines();

		/****** TopOpeBRep_FacesIntersector::Restrictions ******/
		/****** md5 signature: f234d515696e6af4ddedecbc4c8a5f42 ******/
		%feature("compactdefaultargs") Restrictions;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
returns the map of edges found as TopeBRepBRep_RESTRICTION.
") Restrictions;
		const TopTools_IndexedMapOfShape & Restrictions();

		/****** TopOpeBRep_FacesIntersector::SameDomain ******/
		/****** md5 signature: ceba397eccbd28c4c6715ac85077480f ******/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Perform() arguments are two faces with the same surface.
") SameDomain;
		Standard_Boolean SameDomain();

		/****** TopOpeBRep_FacesIntersector::SurfacesSameOriented ******/
		/****** md5 signature: 5a73f090b826c38dcc30efe0cb99df4e ******/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Perform() arguments are two faces SameDomain() and normals on both side. Raise if SameDomain is False.
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented();

};


%extend TopOpeBRep_FacesIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRep_GeomTool *
****************************/
class TopOpeBRep_GeomTool {
	public:
		/****** TopOpeBRep_GeomTool::MakeBSpline1fromWALKING2d ******/
		/****** md5 signature: bdd02d7356022aa42abdf98db72e263b ******/
		%feature("compactdefaultargs") MakeBSpline1fromWALKING2d;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter
SI: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") MakeBSpline1fromWALKING2d;
		static opencascade::handle<Geom2d_Curve> MakeBSpline1fromWALKING2d(const TopOpeBRep_LineInter & L, const Standard_Integer SI);

		/****** TopOpeBRep_GeomTool::MakeBSpline1fromWALKING3d ******/
		/****** md5 signature: 3593e48ce5e0e3053107098c205052b2 ******/
		%feature("compactdefaultargs") MakeBSpline1fromWALKING3d;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRep_LineInter

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") MakeBSpline1fromWALKING3d;
		static opencascade::handle<Geom_Curve> MakeBSpline1fromWALKING3d(const TopOpeBRep_LineInter & L);

		/****** TopOpeBRep_GeomTool::MakeCurve ******/
		/****** md5 signature: 4a924a044c9b51a050231444cd72089d ******/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "
Parameters
----------
min: float
max: float
L: TopOpeBRep_LineInter
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") MakeCurve;
		static void MakeCurve(const Standard_Real min, const Standard_Real max, const TopOpeBRep_LineInter & L, opencascade::handle<Geom_Curve> & C);

		/****** TopOpeBRep_GeomTool::MakeCurves ******/
		/****** md5 signature: 7fb07fc5d2ca8d73b03a1d36c2a0be14 ******/
		%feature("compactdefaultargs") MakeCurves;
		%feature("autodoc", "
Parameters
----------
min: float
max: float
L: TopOpeBRep_LineInter
S1: TopoDS_Shape
S2: TopoDS_Shape
C: TopOpeBRepDS_Curve
PC1: Geom2d_Curve
PC2: Geom2d_Curve

Return
-------
None

Description
-----------
Make the DS curve <C> and the pcurves <PC1,PC2> from intersection line <L> lying on shapes <S1,S2>. <min,max> = <L> bounds.
") MakeCurves;
		static void MakeCurves(const Standard_Real min, const Standard_Real max, const TopOpeBRep_LineInter & L, const TopoDS_Shape & S1, const TopoDS_Shape & S2, TopOpeBRepDS_Curve & C, opencascade::handle<Geom2d_Curve> & PC1, opencascade::handle<Geom2d_Curve> & PC2);

};


%extend TopOpeBRep_GeomTool {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def MakePrivateCurves(self):
		pass
	}
};

/****************************
* class TopOpeBRep_Hctxee2d *
****************************/
class TopOpeBRep_Hctxee2d : public Standard_Transient {
	public:
		/****** TopOpeBRep_Hctxee2d::TopOpeBRep_Hctxee2d ******/
		/****** md5 signature: cf07b95fc0e8d217a7f947f943209d5f ******/
		%feature("compactdefaultargs") TopOpeBRep_Hctxee2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_Hctxee2d;
		 TopOpeBRep_Hctxee2d();

		/****** TopOpeBRep_Hctxee2d::Curve ******/
		/****** md5 signature: c1f28875a0a3d2ff71dbd24a39eef5e9 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
Geom2dAdaptor_Curve

Description
-----------
No available documentation.
") Curve;
		Geom2dAdaptor_Curve Curve(const Standard_Integer I);

		/****** TopOpeBRep_Hctxee2d::Domain ******/
		/****** md5 signature: 61e11500fa994362ee7273166a3b2637 ******/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
IntRes2d_Domain

Description
-----------
No available documentation.
") Domain;
		const IntRes2d_Domain & Domain(const Standard_Integer I);

		/****** TopOpeBRep_Hctxee2d::Edge ******/
		/****** md5 signature: 69a02b36daf6e7cb7791cc5ef6d9ffd2 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Shape Edge(const Standard_Integer I);

		/****** TopOpeBRep_Hctxee2d::SetEdges ******/
		/****** md5 signature: 5b4a54aa25f38c9fe3d320ab9fa6246e ******/
		%feature("compactdefaultargs") SetEdges;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
BAS1: BRepAdaptor_Surface
BAS2: BRepAdaptor_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetEdges;
		void SetEdges(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const BRepAdaptor_Surface & BAS1, const BRepAdaptor_Surface & BAS2);

};


%make_alias(TopOpeBRep_Hctxee2d)

%extend TopOpeBRep_Hctxee2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRep_Hctxff2d *
****************************/
class TopOpeBRep_Hctxff2d : public Standard_Transient {
	public:
		/****** TopOpeBRep_Hctxff2d::TopOpeBRep_Hctxff2d ******/
		/****** md5 signature: c900185e9665ec0fe9e61f90e1821abd ******/
		%feature("compactdefaultargs") TopOpeBRep_Hctxff2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_Hctxff2d;
		 TopOpeBRep_Hctxff2d();

		/****** TopOpeBRep_Hctxff2d::Face ******/
		/****** md5 signature: d1eb857c2a65e9d3cb2fc51a7ab45063 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face(const Standard_Integer I);

		/****** TopOpeBRep_Hctxff2d::FaceSameOrientedWithRef ******/
		/****** md5 signature: eabad6eab07a6570fb8ec3a5ead85287 ******/
		%feature("compactdefaultargs") FaceSameOrientedWithRef;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") FaceSameOrientedWithRef;
		Standard_Boolean FaceSameOrientedWithRef(const Standard_Integer I);

		/****** TopOpeBRep_Hctxff2d::FacesSameOriented ******/
		/****** md5 signature: 435f628c00049ebc1d70e1ce34bc8025 ******/
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FacesSameOriented;
		Standard_Boolean FacesSameOriented();

		/****** TopOpeBRep_Hctxff2d::GetMaxTolerance ******/
		/****** md5 signature: f77adca7b5ab816088f00a6b2e5855fd ******/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetMaxTolerance;
		Standard_Real GetMaxTolerance();

		/****** TopOpeBRep_Hctxff2d::GetTolerances ******/
		/****** md5 signature: cd77b1128c4393a929e11a161d176312 ******/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol1: float
Tol2: float

Description
-----------
No available documentation.
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_Hctxff2d::HSurface ******/
		/****** md5 signature: a61fd728296f7a0903ddca58e7b9f655 ******/
		%feature("compactdefaultargs") HSurface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<BRepAdaptor_Surface>

Description
-----------
No available documentation.
") HSurface;
		opencascade::handle<BRepAdaptor_Surface> HSurface(const Standard_Integer I);

		/****** TopOpeBRep_Hctxff2d::SetFaces ******/
		/****** md5 signature: 46dc023c2aed2e35da6777aafef31609 ******/
		%feature("compactdefaultargs") SetFaces;
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
No available documentation.
") SetFaces;
		void SetFaces(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** TopOpeBRep_Hctxff2d::SetHSurfaces ******/
		/****** md5 signature: e175988e11c8c20afccabc99d977dcec ******/
		%feature("compactdefaultargs") SetHSurfaces;
		%feature("autodoc", "
Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetHSurfaces;
		void SetHSurfaces(const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<BRepAdaptor_Surface> & S2);

		/****** TopOpeBRep_Hctxff2d::SetTolerances ******/
		/****** md5 signature: 6873711acb65a77b1d3cb30885ac1fe9 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerances;
		void SetTolerances(const Standard_Real Tol1, const Standard_Real Tol2);

		/****** TopOpeBRep_Hctxff2d::SurfacesSameOriented ******/
		/****** md5 signature: 5a73f090b826c38dcc30efe0cb99df4e ******/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented();

};


%make_alias(TopOpeBRep_Hctxff2d)

%extend TopOpeBRep_Hctxff2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRep_LineInter *
*****************************/
class TopOpeBRep_LineInter {
	public:
		/****** TopOpeBRep_LineInter::TopOpeBRep_LineInter ******/
		/****** md5 signature: feb7593e0f935d571f3784b3f4b91879 ******/
		%feature("compactdefaultargs") TopOpeBRep_LineInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_LineInter;
		 TopOpeBRep_LineInter();

		/****** TopOpeBRep_LineInter::Arc ******/
		/****** md5 signature: a92581f6dce42e6d73dd51bef85c647a ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the edge of a RESTRICTION line (or a null edge).
") Arc;
		const TopoDS_Shape Arc();

		/****** TopOpeBRep_LineInter::ArcIsEdge ******/
		/****** md5 signature: 3bb4c1b64cbe7447bc7c8619bac1a4b1 ******/
		%feature("compactdefaultargs") ArcIsEdge;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
returns true if Arc() edge (of a RESTRICTION line) is an edge of the original face <Index> (1 or 2).
") ArcIsEdge;
		Standard_Boolean ArcIsEdge(const Standard_Integer I);

		/****** TopOpeBRep_LineInter::Bounds ******/
		/****** md5 signature: 4af317f32b83e7cef138da63fad9c2b0 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
f: float
l: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_LineInter::ChangeVPoint ******/
		/****** md5 signature: 14d4309f2053822cc1a695ae7c54a7ad ******/
		%feature("compactdefaultargs") ChangeVPoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRep_VPointInter

Description
-----------
No available documentation.
") ChangeVPoint;
		TopOpeBRep_VPointInter & ChangeVPoint(const Standard_Integer I);

		/****** TopOpeBRep_LineInter::ComputeFaceFaceTransition ******/
		/****** md5 signature: 26ed70b18bcf2712b23b8d4def2a445e ******/
		%feature("compactdefaultargs") ComputeFaceFaceTransition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ComputeFaceFaceTransition;
		void ComputeFaceFaceTransition();

		/****** TopOpeBRep_LineInter::Curve ******/
		/****** md5 signature: 1f3ec5c59b9daebd9920b1e8b066a7ca ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Geom_Curve> Curve();

		/****** TopOpeBRep_LineInter::Curve ******/
		/****** md5 signature: ea107b775c04ffc9d9d2f73bc7749d01 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
parmin: float
parmax: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Geom_Curve> Curve(const Standard_Real parmin, const Standard_Real parmax);

		/****** TopOpeBRep_LineInter::DumpBipoint ******/
		/****** md5 signature: 6325b4d4f4e4a71fd5e87f7de2c6ef7d ******/
		%feature("compactdefaultargs") DumpBipoint;
		%feature("autodoc", "
Parameters
----------
B: TopOpeBRep_Bipoint
s1: str
s2: str

Return
-------
None

Description
-----------
No available documentation.
") DumpBipoint;
		void DumpBipoint(const TopOpeBRep_Bipoint & B, TCollection_AsciiString s1, TCollection_AsciiString s2);

		/****** TopOpeBRep_LineInter::DumpLineTransitions ******/
		/****** md5 signature: edfe93f308df46bfc812b4b00425d99c ******/
		%feature("compactdefaultargs") DumpLineTransitions;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") DumpLineTransitions;
		Standard_OStream & DumpLineTransitions(std::ostream &OutValue);

		/****** TopOpeBRep_LineInter::DumpType ******/
		/****** md5 signature: b34c01a6723403b4978ae19d96842616 ******/
		%feature("compactdefaultargs") DumpType;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpType;
		void DumpType();

		/****** TopOpeBRep_LineInter::DumpVPoint ******/
		/****** md5 signature: 6208394255135ad9c5fefef57aaa6b25 ******/
		%feature("compactdefaultargs") DumpVPoint;
		%feature("autodoc", "
Parameters
----------
I: int
s1: str
s2: str

Return
-------
None

Description
-----------
No available documentation.
") DumpVPoint;
		void DumpVPoint(const Standard_Integer I, TCollection_AsciiString s1, TCollection_AsciiString s2);

		/****** TopOpeBRep_LineInter::FaceFaceTransition ******/
		/****** md5 signature: 83ffefbe5b8ae65ccfae12ac03265cee ******/
		%feature("compactdefaultargs") FaceFaceTransition;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition(const Standard_Integer I);

		/****** TopOpeBRep_LineInter::GetTraceIndex ******/
		/****** md5 signature: 9515d5e22d4204dd0a3c74673d23b180 ******/
		%feature("compactdefaultargs") GetTraceIndex;
		%feature("autodoc", "
Parameters
----------

Return
-------
exF1: int
exF2: int

Description
-----------
No available documentation.
") GetTraceIndex;
		void GetTraceIndex(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRep_LineInter::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** TopOpeBRep_LineInter::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** TopOpeBRep_LineInter::HasVInternal ******/
		/****** md5 signature: 3bb457040e2d8daf9eef509552071165 ******/
		%feature("compactdefaultargs") HasVInternal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasVInternal;
		Standard_Boolean HasVInternal();

		/****** TopOpeBRep_LineInter::HasVPonR ******/
		/****** md5 signature: 310d1ad2c3487ad7ff07a44f1150bfd5 ******/
		%feature("compactdefaultargs") HasVPonR;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasVPonR;
		Standard_Boolean HasVPonR();

		/****** TopOpeBRep_LineInter::INL ******/
		/****** md5 signature: 89a074055e3292c077fb3179be7b61f3 ******/
		%feature("compactdefaultargs") INL;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") INL;
		Standard_Boolean INL();

		/****** TopOpeBRep_LineInter::Index ******/
		/****** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") Index;
		void Index(const Standard_Integer I);

		/****** TopOpeBRep_LineInter::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** TopOpeBRep_LineInter::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** TopOpeBRep_LineInter::IsVClosed ******/
		/****** md5 signature: 270ac1341783e48f1a0f14434f1599d3 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** TopOpeBRep_LineInter::LineG ******/
		/****** md5 signature: 01de5629a31aa00cf28e96dba213041f ******/
		%feature("compactdefaultargs") LineG;
		%feature("autodoc", "Return
-------
opencascade::handle<IntPatch_GLine>

Description
-----------
No available documentation.
") LineG;
		const opencascade::handle<IntPatch_GLine> & LineG();

		/****** TopOpeBRep_LineInter::LineR ******/
		/****** md5 signature: 08be29905e87571f8683725d0177250c ******/
		%feature("compactdefaultargs") LineR;
		%feature("autodoc", "Return
-------
opencascade::handle<IntPatch_RLine>

Description
-----------
No available documentation.
") LineR;
		const opencascade::handle<IntPatch_RLine> & LineR();

		/****** TopOpeBRep_LineInter::LineW ******/
		/****** md5 signature: ddd6c649218181f4d6abebf82cea5563 ******/
		%feature("compactdefaultargs") LineW;
		%feature("autodoc", "Return
-------
opencascade::handle<IntPatch_WLine>

Description
-----------
No available documentation.
") LineW;
		const opencascade::handle<IntPatch_WLine> & LineW();

		/****** TopOpeBRep_LineInter::NbVPoint ******/
		/****** md5 signature: 2ea09ca7a3e5398df1519c0980229c14 ******/
		%feature("compactdefaultargs") NbVPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoint;
		Standard_Integer NbVPoint();

		/****** TopOpeBRep_LineInter::NbWPoint ******/
		/****** md5 signature: d84b1d26c3bbf033ef91f4e52100fb03 ******/
		%feature("compactdefaultargs") NbWPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWPoint;
		Standard_Integer NbWPoint();

		/****** TopOpeBRep_LineInter::OK ******/
		/****** md5 signature: 8bc639ad68d0ce206834efca23e02e2d ******/
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OK;
		Standard_Boolean OK();

		/****** TopOpeBRep_LineInter::Period ******/
		/****** md5 signature: 0270204961d3b0052ffe029cbcdbacd9 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		Standard_Real Period();

		/****** TopOpeBRep_LineInter::SetFaces ******/
		/****** md5 signature: 46dc023c2aed2e35da6777aafef31609 ******/
		%feature("compactdefaultargs") SetFaces;
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
No available documentation.
") SetFaces;
		void SetFaces(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** TopOpeBRep_LineInter::SetHasVPonR ******/
		/****** md5 signature: db52cdfdcc899bff6b5002498e13bb03 ******/
		%feature("compactdefaultargs") SetHasVPonR;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetHasVPonR;
		void SetHasVPonR();

		/****** TopOpeBRep_LineInter::SetINL ******/
		/****** md5 signature: 1e6337a2c38c435aa474d60eae7fb4e0 ******/
		%feature("compactdefaultargs") SetINL;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetINL;
		void SetINL();

		/****** TopOpeBRep_LineInter::SetIsVClosed ******/
		/****** md5 signature: 7e0b5519dc46f8dfce21789f2ba43054 ******/
		%feature("compactdefaultargs") SetIsVClosed;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetIsVClosed;
		void SetIsVClosed();

		/****** TopOpeBRep_LineInter::SetLine ******/
		/****** md5 signature: ffdaea04056ed0f892cad9b6d3ed4ae0 ******/
		%feature("compactdefaultargs") SetLine;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetLine;
		void SetLine(const opencascade::handle<IntPatch_Line> & L, const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2);

		/****** TopOpeBRep_LineInter::SetOK ******/
		/****** md5 signature: e2450971393f163d48b7f0293dc3348f ******/
		%feature("compactdefaultargs") SetOK;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") SetOK;
		void SetOK(const Standard_Boolean B);

		/****** TopOpeBRep_LineInter::SetTraceIndex ******/
		/****** md5 signature: 13f9cfa37d1910afdfe7a0465a408ca0 ******/
		%feature("compactdefaultargs") SetTraceIndex;
		%feature("autodoc", "
Parameters
----------
exF1: int
exF2: int

Return
-------
None

Description
-----------
No available documentation.
") SetTraceIndex;
		void SetTraceIndex(const Standard_Integer exF1, const Standard_Integer exF2);

		/****** TopOpeBRep_LineInter::SetVPBounds ******/
		/****** md5 signature: 2aa0ef807679effc95727c0e40d084fd ******/
		%feature("compactdefaultargs") SetVPBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetVPBounds;
		void SetVPBounds();

		/****** TopOpeBRep_LineInter::SituationS1 ******/
		/****** md5 signature: af2d2dd713ae3b820482546cf4a82d7b ******/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "Return
-------
IntSurf_Situation

Description
-----------
No available documentation.
") SituationS1;
		IntSurf_Situation SituationS1();

		/****** TopOpeBRep_LineInter::SituationS2 ******/
		/****** md5 signature: da9cc8795913744eb08fbe6bf499827b ******/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "Return
-------
IntSurf_Situation

Description
-----------
No available documentation.
") SituationS2;
		IntSurf_Situation SituationS2();

		/****** TopOpeBRep_LineInter::TransitionOnS1 ******/
		/****** md5 signature: 9de184f3b47c2902be7de5eb10743898 ******/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
No available documentation.
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****** TopOpeBRep_LineInter::TransitionOnS2 ******/
		/****** md5 signature: aafa064949332278d0d49be3da4c6df2 ******/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
No available documentation.
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2();

		/****** TopOpeBRep_LineInter::TypeLineCurve ******/
		/****** md5 signature: 4355930a797a6f3cb5e2211b13c345bb ******/
		%feature("compactdefaultargs") TypeLineCurve;
		%feature("autodoc", "Return
-------
TopOpeBRep_TypeLineCurve

Description
-----------
No available documentation.
") TypeLineCurve;
		TopOpeBRep_TypeLineCurve TypeLineCurve();

		/****** TopOpeBRep_LineInter::VPBounds ******/
		/****** md5 signature: b702d5162ec5f574dd602b9a65d91545 ******/
		%feature("compactdefaultargs") VPBounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
f: int
l: int
n: int

Description
-----------
No available documentation.
") VPBounds;
		void VPBounds(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRep_LineInter::VPoint ******/
		/****** md5 signature: 1510e3ed35585561758acd47757f2f3e ******/
		%feature("compactdefaultargs") VPoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRep_VPointInter

Description
-----------
No available documentation.
") VPoint;
		const TopOpeBRep_VPointInter & VPoint(const Standard_Integer I);

		/****** TopOpeBRep_LineInter::WPoint ******/
		/****** md5 signature: fb66a29b8bdd784fd0b851b001b22951 ******/
		%feature("compactdefaultargs") WPoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRep_WPointInter

Description
-----------
No available documentation.
") WPoint;
		const TopOpeBRep_WPointInter & WPoint(const Standard_Integer I);

};


%extend TopOpeBRep_LineInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TopOpeBRep_Point2d *
***************************/
class TopOpeBRep_Point2d {
	public:
		/****** TopOpeBRep_Point2d::TopOpeBRep_Point2d ******/
		/****** md5 signature: a4e5464aee16654824387f8abcf81377 ******/
		%feature("compactdefaultargs") TopOpeBRep_Point2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_Point2d;
		 TopOpeBRep_Point2d();

		/****** TopOpeBRep_Point2d::ChangeTransition ******/
		/****** md5 signature: c3cf99c4d845bce2a15b3a78287ceda1 ******/
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition(const Standard_Integer I);

		/****** TopOpeBRep_Point2d::Dump ******/
		/****** md5 signature: 48fe6005532e1061cfa557e995f40a8d ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ie1: int (optional, default to 0)
ie2: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer ie1 = 0, const Standard_Integer ie2 = 0);

		/****** TopOpeBRep_Point2d::EdgesConfig ******/
		/****** md5 signature: 17c4c833ec338e68df2a3490937ab9c9 ******/
		%feature("compactdefaultargs") EdgesConfig;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") EdgesConfig;
		TopOpeBRepDS_Config EdgesConfig();

		/****** TopOpeBRep_Point2d::HasPint ******/
		/****** md5 signature: 18a0ea3877f1678f8937dbc9db035589 ******/
		%feature("compactdefaultargs") HasPint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPint;
		Standard_Boolean HasPint();

		/****** TopOpeBRep_Point2d::Hctxee2d ******/
		/****** md5 signature: 2a9387824cce3a91254c1d88d2c14560 ******/
		%feature("compactdefaultargs") Hctxee2d;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRep_Hctxee2d>

Description
-----------
No available documentation.
") Hctxee2d;
		opencascade::handle<TopOpeBRep_Hctxee2d> Hctxee2d();

		/****** TopOpeBRep_Point2d::Hctxff2d ******/
		/****** md5 signature: 633f2a368cfb49bc92e0495cc2657538 ******/
		%feature("compactdefaultargs") Hctxff2d;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRep_Hctxff2d>

Description
-----------
No available documentation.
") Hctxff2d;
		opencascade::handle<TopOpeBRep_Hctxff2d> Hctxff2d();

		/****** TopOpeBRep_Point2d::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** TopOpeBRep_Point2d::IsPointOfSegment ******/
		/****** md5 signature: 6e7cde438083e0131a9a0a61b85d04e4 ******/
		%feature("compactdefaultargs") IsPointOfSegment;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPointOfSegment;
		Standard_Boolean IsPointOfSegment();

		/****** TopOpeBRep_Point2d::IsVertex ******/
		/****** md5 signature: 086fc030883417cdd3233687cd7fbc88 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsVertex;
		Standard_Boolean IsVertex(const Standard_Integer I);

		/****** TopOpeBRep_Point2d::Keep ******/
		/****** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		Standard_Boolean Keep();

		/****** TopOpeBRep_Point2d::Parameter ******/
		/****** md5 signature: ca856d1dd4727b19b3047127cded267f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter(const Standard_Integer I);

		/****** TopOpeBRep_Point2d::Pint ******/
		/****** md5 signature: 72d1656dc63f7ec33684d937246a1ad3 ******/
		%feature("compactdefaultargs") Pint;
		%feature("autodoc", "Return
-------
IntRes2d_IntersectionPoint

Description
-----------
No available documentation.
") Pint;
		const IntRes2d_IntersectionPoint & Pint();

		/****** TopOpeBRep_Point2d::SegmentAncestors ******/
		/****** md5 signature: 807576e7187cb2ee3da46f58c52b06dd ******/
		%feature("compactdefaultargs") SegmentAncestors;
		%feature("autodoc", "
Parameters
----------

Return
-------
IP1: int
IP2: int

Description
-----------
No available documentation.
") SegmentAncestors;
		Standard_Boolean SegmentAncestors(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRep_Point2d::SetEdgesConfig ******/
		/****** md5 signature: 715d2cfe9bf9319193e7cd80c47ee60c ******/
		%feature("compactdefaultargs") SetEdgesConfig;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Config

Return
-------
None

Description
-----------
No available documentation.
") SetEdgesConfig;
		void SetEdgesConfig(const TopOpeBRepDS_Config C);

		/****** TopOpeBRep_Point2d::SetHctxee2d ******/
		/****** md5 signature: 4354bbd1eee37ab87a6c60d7d6384d02 ******/
		%feature("compactdefaultargs") SetHctxee2d;
		%feature("autodoc", "
Parameters
----------
ee2d: TopOpeBRep_Hctxee2d

Return
-------
None

Description
-----------
No available documentation.
") SetHctxee2d;
		void SetHctxee2d(const opencascade::handle<TopOpeBRep_Hctxee2d> & ee2d);

		/****** TopOpeBRep_Point2d::SetHctxff2d ******/
		/****** md5 signature: 65897b041e053e60cc80ae5efee30fd2 ******/
		%feature("compactdefaultargs") SetHctxff2d;
		%feature("autodoc", "
Parameters
----------
ff2d: TopOpeBRep_Hctxff2d

Return
-------
None

Description
-----------
No available documentation.
") SetHctxff2d;
		void SetHctxff2d(const opencascade::handle<TopOpeBRep_Hctxff2d> & ff2d);

		/****** TopOpeBRep_Point2d::SetIndex ******/
		/****** md5 signature: 866045f938b17bb34e73a6920885e27f ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
X: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndex;
		void SetIndex(const Standard_Integer X);

		/****** TopOpeBRep_Point2d::SetIsPointOfSegment ******/
		/****** md5 signature: ec0cc3dca1354854c12eef529d8596bc ******/
		%feature("compactdefaultargs") SetIsPointOfSegment;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") SetIsPointOfSegment;
		void SetIsPointOfSegment(const Standard_Boolean B);

		/****** TopOpeBRep_Point2d::SetIsVertex ******/
		/****** md5 signature: 7bdfe12c28908f71a2fc9856d407ee22 ******/
		%feature("compactdefaultargs") SetIsVertex;
		%feature("autodoc", "
Parameters
----------
I: int
B: bool

Return
-------
None

Description
-----------
No available documentation.
") SetIsVertex;
		void SetIsVertex(const Standard_Integer I, const Standard_Boolean B);

		/****** TopOpeBRep_Point2d::SetKeep ******/
		/****** md5 signature: 1092aa2a984bcd4f4f9f5f5c7e1ac2f4 ******/
		%feature("compactdefaultargs") SetKeep;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") SetKeep;
		void SetKeep(const Standard_Boolean B);

		/****** TopOpeBRep_Point2d::SetParameter ******/
		/****** md5 signature: 9ee049156e663e585a2306d90902c7b4 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
I: int
P: float

Return
-------
None

Description
-----------
No available documentation.
") SetParameter;
		void SetParameter(const Standard_Integer I, const Standard_Real P);

		/****** TopOpeBRep_Point2d::SetPint ******/
		/****** md5 signature: c984cf763fe8e993abc8ec8f71dae9b1 ******/
		%feature("compactdefaultargs") SetPint;
		%feature("autodoc", "
Parameters
----------
P: IntRes2d_IntersectionPoint

Return
-------
None

Description
-----------
No available documentation.
") SetPint;
		void SetPint(const IntRes2d_IntersectionPoint & P);

		/****** TopOpeBRep_Point2d::SetSegmentAncestors ******/
		/****** md5 signature: 9e1d7c4ffc41f72a7fcfaaa45ac04f8e ******/
		%feature("compactdefaultargs") SetSegmentAncestors;
		%feature("autodoc", "
Parameters
----------
IP1: int
IP2: int

Return
-------
None

Description
-----------
No available documentation.
") SetSegmentAncestors;
		void SetSegmentAncestors(const Standard_Integer IP1, const Standard_Integer IP2);

		/****** TopOpeBRep_Point2d::SetStatus ******/
		/****** md5 signature: 5b48b2875a553440d65a6c6c621956f5 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
S: TopOpeBRep_P2Dstatus

Return
-------
None

Description
-----------
No available documentation.
") SetStatus;
		void SetStatus(const TopOpeBRep_P2Dstatus S);

		/****** TopOpeBRep_Point2d::SetTolerance ******/
		/****** md5 signature: 62b1f9563bb5ef42f026a44105a51f90 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real T);

		/****** TopOpeBRep_Point2d::SetTransition ******/
		/****** md5 signature: c4b596bee3ee9ff24eced4060c0a76cd ******/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "
Parameters
----------
I: int
T: TopOpeBRepDS_Transition

Return
-------
None

Description
-----------
No available documentation.
") SetTransition;
		void SetTransition(const Standard_Integer I, const TopOpeBRepDS_Transition & T);

		/****** TopOpeBRep_Point2d::SetValue ******/
		/****** md5 signature: ba3ffbb2313fcc108d8269b328cdabe1 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P);

		/****** TopOpeBRep_Point2d::SetValue2d ******/
		/****** md5 signature: 012e75d6be249d28b0543c93d3a951de ******/
		%feature("compactdefaultargs") SetValue2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") SetValue2d;
		void SetValue2d(const gp_Pnt2d & P);

		/****** TopOpeBRep_Point2d::SetVertex ******/
		/****** md5 signature: 7a11f08a6987d3c3cafc8b7e2d96c5e5 ******/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
I: int
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") SetVertex;
		void SetVertex(const Standard_Integer I, const TopoDS_Vertex & V);

		/****** TopOpeBRep_Point2d::Status ******/
		/****** md5 signature: 46b4c8557b58504912ea2e39d547deda ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
TopOpeBRep_P2Dstatus

Description
-----------
No available documentation.
") Status;
		TopOpeBRep_P2Dstatus Status();

		/****** TopOpeBRep_Point2d::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****** TopOpeBRep_Point2d::Transition ******/
		/****** md5 signature: 85d653a998e80ca01295d1ede1570169 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") Transition;
		const TopOpeBRepDS_Transition & Transition(const Standard_Integer I);

		/****** TopOpeBRep_Point2d::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		const gp_Pnt Value();

		/****** TopOpeBRep_Point2d::Value2d ******/
		/****** md5 signature: d7f79037e220f7a3b67a03ce99723024 ******/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value2d;
		const gp_Pnt2d Value2d();

		/****** TopOpeBRep_Point2d::Vertex ******/
		/****** md5 signature: 1cd4dfe5cbf55dbe74ca8c7dfb89999c ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Vertex Vertex(const Standard_Integer I);

};


%extend TopOpeBRep_Point2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRep_PointClassifier *
***********************************/
class TopOpeBRep_PointClassifier {
	public:
		/****** TopOpeBRep_PointClassifier::TopOpeBRep_PointClassifier ******/
		/****** md5 signature: 0ce7a351d05c2825b798d2588ba89cbf ******/
		%feature("compactdefaultargs") TopOpeBRep_PointClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_PointClassifier;
		 TopOpeBRep_PointClassifier();

		/****** TopOpeBRep_PointClassifier::Classify ******/
		/****** md5 signature: 14c5e2a8abedb9ae6844a58bc37ab29e ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt2d
Tol: float

Return
-------
TopAbs_State

Description
-----------
compute position of point <P> regarding with the face <F>.
") Classify;
		TopAbs_State Classify(const TopoDS_Face & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****** TopOpeBRep_PointClassifier::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** TopOpeBRep_PointClassifier::Load ******/
		/****** md5 signature: 1d17d2edcb9829efe827b1a9573fcbcc ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const TopoDS_Face & F);

		/****** TopOpeBRep_PointClassifier::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") State;
		TopAbs_State State();

};


%extend TopOpeBRep_PointClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRep_PointGeomTool *
*********************************/
class TopOpeBRep_PointGeomTool {
	public:
		/****** TopOpeBRep_PointGeomTool::IsEqual ******/
		/****** md5 signature: c744b0c8522318aa7d6d0a93f5ac495e ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
DSP1: TopOpeBRepDS_Point
DSP2: TopOpeBRepDS_Point

Return
-------
bool

Description
-----------
No available documentation.
") IsEqual;
		static Standard_Boolean IsEqual(const TopOpeBRepDS_Point & DSP1, const TopOpeBRepDS_Point & DSP2);

		/****** TopOpeBRep_PointGeomTool::MakePoint ******/
		/****** md5 signature: e4964ffd2907637ec47e8e0b0495f31e ******/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "
Parameters
----------
IP: TopOpeBRep_VPointInter

Return
-------
TopOpeBRepDS_Point

Description
-----------
No available documentation.
") MakePoint;
		static TopOpeBRepDS_Point MakePoint(const TopOpeBRep_VPointInter & IP);

		/****** TopOpeBRep_PointGeomTool::MakePoint ******/
		/****** md5 signature: 64321188c4c4ad217069ababdb8a3796 ******/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "
Parameters
----------
P2D: TopOpeBRep_Point2d

Return
-------
TopOpeBRepDS_Point

Description
-----------
No available documentation.
") MakePoint;
		static TopOpeBRepDS_Point MakePoint(const TopOpeBRep_Point2d & P2D);

		/****** TopOpeBRep_PointGeomTool::MakePoint ******/
		/****** md5 signature: c79e7532e280555f3ff1763f4dead60c ******/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "
Parameters
----------
FEI: TopOpeBRep_FaceEdgeIntersector

Return
-------
TopOpeBRepDS_Point

Description
-----------
No available documentation.
") MakePoint;
		static TopOpeBRepDS_Point MakePoint(const TopOpeBRep_FaceEdgeIntersector & FEI);

		/****** TopOpeBRep_PointGeomTool::MakePoint ******/
		/****** md5 signature: fd389443079eb0a464dc8e06da4a2303 ******/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopOpeBRepDS_Point

Description
-----------
No available documentation.
") MakePoint;
		static TopOpeBRepDS_Point MakePoint(const TopoDS_Shape & S);

};


%extend TopOpeBRep_PointGeomTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRep_ShapeIntersector *
************************************/
class TopOpeBRep_ShapeIntersector {
	public:
		/****** TopOpeBRep_ShapeIntersector::TopOpeBRep_ShapeIntersector ******/
		/****** md5 signature: 20f306c0c78524b61a5f16c837ec63d0 ******/
		%feature("compactdefaultargs") TopOpeBRep_ShapeIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_ShapeIntersector;
		 TopOpeBRep_ShapeIntersector();

		/****** TopOpeBRep_ShapeIntersector::ChangeEdgesIntersector ******/
		/****** md5 signature: 1235fc3fd7575db65944b280b25330c7 ******/
		%feature("compactdefaultargs") ChangeEdgesIntersector;
		%feature("autodoc", "Return
-------
TopOpeBRep_EdgesIntersector

Description
-----------
return the current intersection of two Edges.
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector();

		/****** TopOpeBRep_ShapeIntersector::ChangeFaceEdgeIntersector ******/
		/****** md5 signature: 252968b36ec37bf07721105462c97f04 ******/
		%feature("compactdefaultargs") ChangeFaceEdgeIntersector;
		%feature("autodoc", "Return
-------
TopOpeBRep_FaceEdgeIntersector

Description
-----------
return the current intersection of a Face and an Edge.
") ChangeFaceEdgeIntersector;
		TopOpeBRep_FaceEdgeIntersector & ChangeFaceEdgeIntersector();

		/****** TopOpeBRep_ShapeIntersector::ChangeFacesIntersector ******/
		/****** md5 signature: 09c29fa34bf77993f5e46096b4b26b96 ******/
		%feature("compactdefaultargs") ChangeFacesIntersector;
		%feature("autodoc", "Return
-------
TopOpeBRep_FacesIntersector

Description
-----------
return the current intersection of two Faces.
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector();

		/****** TopOpeBRep_ShapeIntersector::CurrentGeomShape ******/
		/****** md5 signature: 7481223e571b135509f19048b145ca50 ******/
		%feature("compactdefaultargs") CurrentGeomShape;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
return geometric shape <Index> ( = 1 or 2 ) of current intersection.
") CurrentGeomShape;
		const TopoDS_Shape CurrentGeomShape(const Standard_Integer Index);

		/****** TopOpeBRep_ShapeIntersector::DumpCurrent ******/
		/****** md5 signature: e02ddf889a96ea3aa8d7e534ecd6a9f3 ******/
		%feature("compactdefaultargs") DumpCurrent;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
None

Description
-----------
No available documentation.
") DumpCurrent;
		void DumpCurrent(const Standard_Integer K);

		/****** TopOpeBRep_ShapeIntersector::GetTolerances ******/
		/****** md5 signature: cd77b1128c4393a929e11a161d176312 ******/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "
Parameters
----------

Return
-------
tol1: float
tol2: float

Description
-----------
return MAX of intersection tolerances with which FacesIntersector from TopOpeBRep was working.
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_ShapeIntersector::Index ******/
		/****** md5 signature: 47cb6111c2de8549ff3cb854a67d0e7e ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index(const Standard_Integer K);

		/****** TopOpeBRep_ShapeIntersector::InitIntersection ******/
		/****** md5 signature: 32572b960992ca40532149c5f4138b9d ******/
		%feature("compactdefaultargs") InitIntersection;
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
Initialize the intersection of shapes S1,S2.
") InitIntersection;
		void InitIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRep_ShapeIntersector::InitIntersection ******/
		/****** md5 signature: 71295c2e23706fb131e95931841e2ffb ******/
		%feature("compactdefaultargs") InitIntersection;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
None

Description
-----------
Initialize the intersection of shapes S1,S2.
") InitIntersection;
		void InitIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** TopOpeBRep_ShapeIntersector::MoreIntersection ******/
		/****** md5 signature: 75450e74c8586d0bba47da742d01e5b8 ******/
		%feature("compactdefaultargs") MoreIntersection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if there are more intersection between two the shapes.
") MoreIntersection;
		Standard_Boolean MoreIntersection();

		/****** TopOpeBRep_ShapeIntersector::NextIntersection ******/
		/****** md5 signature: c7daff0a72de42893f05b8f795c72477 ******/
		%feature("compactdefaultargs") NextIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
search for the next intersection between the two shapes.
") NextIntersection;
		void NextIntersection();

		/****** TopOpeBRep_ShapeIntersector::RejectedFaces ******/
		/****** md5 signature: e8b60ca61d88b99674fbf67f7b550edc ******/
		%feature("compactdefaultargs") RejectedFaces;
		%feature("autodoc", "
Parameters
----------
anObj: TopoDS_Shape
aReference: TopoDS_Shape
aListOfShape: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") RejectedFaces;
		void RejectedFaces(const TopoDS_Shape & anObj, const TopoDS_Shape & aReference, TopTools_ListOfShape & aListOfShape);

		/****** TopOpeBRep_ShapeIntersector::Shape ******/
		/****** md5 signature: 9490bf72de2629e156b2f9f7c67be648 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
return the shape <Index> ( = 1 or 2) given to InitIntersection(). Index = 1 will return S1, Index = 2 will return S2.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer Index);

};


%extend TopOpeBRep_ShapeIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRep_ShapeIntersector2d *
**************************************/
class TopOpeBRep_ShapeIntersector2d {
	public:
		/****** TopOpeBRep_ShapeIntersector2d::TopOpeBRep_ShapeIntersector2d ******/
		/****** md5 signature: bb2704150c5bd49ed4001ce09dc8dc59 ******/
		%feature("compactdefaultargs") TopOpeBRep_ShapeIntersector2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_ShapeIntersector2d;
		 TopOpeBRep_ShapeIntersector2d();

		/****** TopOpeBRep_ShapeIntersector2d::ChangeEdgesIntersector ******/
		/****** md5 signature: 1235fc3fd7575db65944b280b25330c7 ******/
		%feature("compactdefaultargs") ChangeEdgesIntersector;
		%feature("autodoc", "Return
-------
TopOpeBRep_EdgesIntersector

Description
-----------
return the current intersection of two Edges.
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector();

		/****** TopOpeBRep_ShapeIntersector2d::CurrentGeomShape ******/
		/****** md5 signature: 7481223e571b135509f19048b145ca50 ******/
		%feature("compactdefaultargs") CurrentGeomShape;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
return geometric shape <Index> ( = 1 or 2 ) of current intersection.
") CurrentGeomShape;
		const TopoDS_Shape CurrentGeomShape(const Standard_Integer Index);

		/****** TopOpeBRep_ShapeIntersector2d::DumpCurrent ******/
		/****** md5 signature: e02ddf889a96ea3aa8d7e534ecd6a9f3 ******/
		%feature("compactdefaultargs") DumpCurrent;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
None

Description
-----------
No available documentation.
") DumpCurrent;
		void DumpCurrent(const Standard_Integer K);

		/****** TopOpeBRep_ShapeIntersector2d::Index ******/
		/****** md5 signature: 47cb6111c2de8549ff3cb854a67d0e7e ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index(const Standard_Integer K);

		/****** TopOpeBRep_ShapeIntersector2d::InitIntersection ******/
		/****** md5 signature: 32572b960992ca40532149c5f4138b9d ******/
		%feature("compactdefaultargs") InitIntersection;
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
Initialize the intersection of shapes S1,S2.
") InitIntersection;
		void InitIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRep_ShapeIntersector2d::MoreIntersection ******/
		/****** md5 signature: 75450e74c8586d0bba47da742d01e5b8 ******/
		%feature("compactdefaultargs") MoreIntersection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if there are more intersection between two the shapes.
") MoreIntersection;
		Standard_Boolean MoreIntersection();

		/****** TopOpeBRep_ShapeIntersector2d::NextIntersection ******/
		/****** md5 signature: c7daff0a72de42893f05b8f795c72477 ******/
		%feature("compactdefaultargs") NextIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
search for the next intersection between the two shapes.
") NextIntersection;
		void NextIntersection();

		/****** TopOpeBRep_ShapeIntersector2d::Shape ******/
		/****** md5 signature: 9490bf72de2629e156b2f9f7c67be648 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
return the shape <Index> ( = 1 or 2) given to InitIntersection(). Index = 1 will return S1, Index = 2 will return S2.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer Index);

};


%extend TopOpeBRep_ShapeIntersector2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRep_ShapeScanner *
********************************/
class TopOpeBRep_ShapeScanner {
	public:
		/****** TopOpeBRep_ShapeScanner::TopOpeBRep_ShapeScanner ******/
		/****** md5 signature: 82a9ee75efa2d73032ba6752f6b249d2 ******/
		%feature("compactdefaultargs") TopOpeBRep_ShapeScanner;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_ShapeScanner;
		 TopOpeBRep_ShapeScanner();

		/****** TopOpeBRep_ShapeScanner::AddBoxesMakeCOB ******/
		/****** md5 signature: a07ac8ca368d90fd9dd48b88e87007c7 ******/
		%feature("compactdefaultargs") AddBoxesMakeCOB;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") AddBoxesMakeCOB;
		void AddBoxesMakeCOB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****** TopOpeBRep_ShapeScanner::BoxSort ******/
		/****** md5 signature: d84fbab6e90b588ace21537275d98770 ******/
		%feature("compactdefaultargs") BoxSort;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_BoxSort

Description
-----------
No available documentation.
") BoxSort;
		const TopOpeBRepTool_BoxSort & BoxSort();

		/****** TopOpeBRep_ShapeScanner::ChangeBoxSort ******/
		/****** md5 signature: 26d224aa25e39745d650f44f9742cf04 ******/
		%feature("compactdefaultargs") ChangeBoxSort;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_BoxSort

Description
-----------
No available documentation.
") ChangeBoxSort;
		TopOpeBRepTool_BoxSort & ChangeBoxSort();

		/****** TopOpeBRep_ShapeScanner::Clear ******/
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

		/****** TopOpeBRep_ShapeScanner::Current ******/
		/****** md5 signature: b191bf677bf7b52144f20d0821ea8f06 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Current;
		const TopoDS_Shape Current();

		/****** TopOpeBRep_ShapeScanner::DumpCurrent ******/
		/****** md5 signature: 2cfbfd895f7349c098bf212a528228ac ******/
		%feature("compactdefaultargs") DumpCurrent;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") DumpCurrent;
		Standard_OStream & DumpCurrent(std::ostream &OutValue);

		/****** TopOpeBRep_ShapeScanner::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** TopOpeBRep_ShapeScanner::Init ******/
		/****** md5 signature: e1998014ab60e76632d3616164d300f4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & E);

		/****** TopOpeBRep_ShapeScanner::Init ******/
		/****** md5 signature: 062e1f6d6462e055b04c4f09f0be64bc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
X: TopOpeBRepTool_ShapeExplorer

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(TopOpeBRepTool_ShapeExplorer & X);

		/****** TopOpeBRep_ShapeScanner::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** TopOpeBRep_ShapeScanner::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

};


%extend TopOpeBRep_ShapeScanner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRep_VPointInter *
*******************************/
class TopOpeBRep_VPointInter {
	public:
		/****** TopOpeBRep_VPointInter::TopOpeBRep_VPointInter ******/
		/****** md5 signature: 445147aa2904424fa8d8622b3021c763 ******/
		%feature("compactdefaultargs") TopOpeBRep_VPointInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_VPointInter;
		 TopOpeBRep_VPointInter();

		/****** TopOpeBRep_VPointInter::ArcOnS1 ******/
		/****** md5 signature: edbaad1d35cc20e3c0b6fc1aece17dfb ******/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ArcOnS1;
		const TopoDS_Shape ArcOnS1();

		/****** TopOpeBRep_VPointInter::ArcOnS2 ******/
		/****** md5 signature: 1599b619a36c1eabe74ebf38006b69da ******/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ArcOnS2;
		const TopoDS_Shape ArcOnS2();

		/****** TopOpeBRep_VPointInter::ChangeKeep ******/
		/****** md5 signature: 337f27b7255256fd364aefe775ca8761 ******/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "
Parameters
----------
keep: bool

Return
-------
None

Description
-----------
updates VPointInter flag 'keep' with <keep>.
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean keep);

		/****** TopOpeBRep_VPointInter::Dump ******/
		/****** md5 signature: 5579594f426ee060a7dba148d700be11 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
I: int
F: TopoDS_Face

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(const Standard_Integer I, const TopoDS_Face & F, std::ostream &OutValue);

		/****** TopOpeBRep_VPointInter::Dump ******/
		/****** md5 signature: 1f8e051df2589ec6a071609bf7470fc1 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(const TopoDS_Face & F1, const TopoDS_Face & F2, std::ostream &OutValue);

		/****** TopOpeBRep_VPointInter::Edge ******/
		/****** md5 signature: 69a02b36daf6e7cb7791cc5ef6d9ffd2 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
get the edge of shape I (1,2) containing the point. Returned shape is null if the VPoint is not on an edge of shape I (1,2).
") Edge;
		const TopoDS_Shape Edge(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::EdgeON ******/
		/****** md5 signature: 3801af15513f48fe057bea24f0b4c612 ******/
		%feature("compactdefaultargs") EdgeON;
		%feature("autodoc", "
Parameters
----------
Eon: TopoDS_Shape
Par: float
I: int

Return
-------
None

Description
-----------
set the shape Eon of shape I (1,2) containing the point, and parameter <Par> of point on <Eon>.
") EdgeON;
		void EdgeON(const TopoDS_Shape & Eon, const Standard_Real Par, const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::EdgeON ******/
		/****** md5 signature: d37dbd316338f91f7a4148fac4a4b700 ******/
		%feature("compactdefaultargs") EdgeON;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
get the edge of shape I (1,2) containing the point.
") EdgeON;
		const TopoDS_Shape EdgeON(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::EdgeONParameter ******/
		/****** md5 signature: 29ed1e5977d9b693f3fdeb7599a5d671 ******/
		%feature("compactdefaultargs") EdgeONParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
get the parameter on edge of shape I (1,2) containing the point.
") EdgeONParameter;
		Standard_Real EdgeONParameter(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::EdgeParameter ******/
		/****** md5 signature: e619f0a93316cfaaf96f2d6714dbd290 ******/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
get the parameter on edge of shape I (1,2) containing the point.
") EdgeParameter;
		Standard_Real EdgeParameter(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::EqualpP ******/
		/****** md5 signature: e25e4b6710ace9acfd8ce6670df8cd66 ******/
		%feature("compactdefaultargs") EqualpP;
		%feature("autodoc", "
Parameters
----------
VP: TopOpeBRep_VPointInter

Return
-------
bool

Description
-----------
returns <True> if the 3d points and the parameters of the VPoints are same.
") EqualpP;
		Standard_Boolean EqualpP(const TopOpeBRep_VPointInter & VP);

		/****** TopOpeBRep_VPointInter::GetShapes ******/
		/****** md5 signature: f83386b9050594750b3cbd4a9b328f40 ******/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "
Parameters
----------

Return
-------
I1: int
I2: int

Description
-----------
No available documentation.
") GetShapes;
		void GetShapes(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRep_VPointInter::Index ******/
		/****** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") Index;
		void Index(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** TopOpeBRep_VPointInter::IsInternal ******/
		/****** md5 signature: d02f8c187f927a9ba16cc17de3466e18 ******/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsInternal;
		Standard_Boolean IsInternal();

		/****** TopOpeBRep_VPointInter::IsMultiple ******/
		/****** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point belongs to several intersection lines.
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****** TopOpeBRep_VPointInter::IsOnDomS1 ******/
		/****** md5 signature: 73bb79eb09813ce2f78b4a234c9e417b ******/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOnDomS1;
		Standard_Boolean IsOnDomS1();

		/****** TopOpeBRep_VPointInter::IsOnDomS2 ******/
		/****** md5 signature: 93e8adde96351fec102c7bd4f10efa11 ******/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOnDomS2;
		Standard_Boolean IsOnDomS2();

		/****** TopOpeBRep_VPointInter::IsVertex ******/
		/****** md5 signature: 086fc030883417cdd3233687cd7fbc88 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsVertex;
		Standard_Boolean IsVertex(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::IsVertexOnS1 ******/
		/****** md5 signature: f69812d2258e171cd6e9220af4bdf9a7 ******/
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the first surface.
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1();

		/****** TopOpeBRep_VPointInter::IsVertexOnS2 ******/
		/****** md5 signature: 2bca687752d3b31cff59a696d6463475 ******/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the second surface.
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2();

		/****** TopOpeBRep_VPointInter::Keep ******/
		/****** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns value of myKeep (does not evaluate states) False at creation of VPoint. Updated by State(State from TopAbs,Integer from Standard).
") Keep;
		Standard_Boolean Keep();

		/****** TopOpeBRep_VPointInter::PThePointOfIntersectionDummy ******/
		/****** md5 signature: ec898b8efc4d8dd671e8f36c3caa6296 ******/
		%feature("compactdefaultargs") PThePointOfIntersectionDummy;
		%feature("autodoc", "Return
-------
TopOpeBRep_PThePointOfIntersection

Description
-----------
No available documentation.
") PThePointOfIntersectionDummy;
		TopOpeBRep_PThePointOfIntersection PThePointOfIntersectionDummy();

		/****** TopOpeBRep_VPointInter::ParameterOnArc1 ******/
		/****** md5 signature: fd3d8eb9ed7668171a21e22983def6f0 ******/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnArc1;
		Standard_Real ParameterOnArc1();

		/****** TopOpeBRep_VPointInter::ParameterOnArc2 ******/
		/****** md5 signature: aa992bbe43a517a3ff131f0c53ce4d8a ******/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnArc2;
		Standard_Real ParameterOnArc2();

		/****** TopOpeBRep_VPointInter::ParameterOnLine ******/
		/****** md5 signature: 737a2a57e32e63a1ba587dea488e9583 ******/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****** TopOpeBRep_VPointInter::ParametersOnS1 ******/
		/****** md5 signature: 65a097ef44a5cf9a58ab746f2da6c181 ******/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
u: float
v: float

Description
-----------
No available documentation.
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_VPointInter::ParametersOnS2 ******/
		/****** md5 signature: 77976f8d675bab277c77e4c02c68ee8f ******/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
u: float
v: float

Description
-----------
No available documentation.
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_VPointInter::ParonE ******/
		/****** md5 signature: ca0f2c28987e504607fe7ed5501d2039 ******/
		%feature("compactdefaultargs") ParonE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
par: float

Description
-----------
returns <false> if the vpoint is not given on arc <E>, else returns <par> parameter on <E>.
") ParonE;
		Standard_Boolean ParonE(const TopoDS_Edge & E, Standard_Real &OutValue);

		/****** TopOpeBRep_VPointInter::SetPoint ******/
		/****** md5 signature: d9b041e9178fde9f6271b55faa9460a0 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: IntPatch_Point

Return
-------
None

Description
-----------
No available documentation.
") SetPoint;
		void SetPoint(const IntPatch_Point & P);

		/****** TopOpeBRep_VPointInter::SetShapes ******/
		/****** md5 signature: 3595c3b14ebeb78e69fcff771910d717 ******/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int

Return
-------
None

Description
-----------
No available documentation.
") SetShapes;
		void SetShapes(const Standard_Integer I1, const Standard_Integer I2);

		/****** TopOpeBRep_VPointInter::ShapeIndex ******/
		/****** md5 signature: 7d3e7fa2224eb9e0f253d806f40caf9f ******/
		%feature("compactdefaultargs") ShapeIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns value of filed myShapeIndex = 0,1,2,3 0 means the VPoint is on no restriction 1 means the VPoint is on the restriction 1 2 means the VPoint is on the restriction 2 3 means the VPoint is on the restrictions 1 and 2.
") ShapeIndex;
		Standard_Integer ShapeIndex();

		/****** TopOpeBRep_VPointInter::ShapeIndex ******/
		/****** md5 signature: 0457d2bee32bf98c8438fff50731a362 ******/
		%feature("compactdefaultargs") ShapeIndex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
set value of shape supporting me (0,1,2,3).
") ShapeIndex;
		void ShapeIndex(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::State ******/
		/****** md5 signature: 3ef584a4c8697b5b43cfa0be6c8072f7 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopAbs_State

Description
-----------
get state of VPoint within the domain of geometric shape domain <I> (= 1 or 2).
") State;
		TopAbs_State State(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::State ******/
		/****** md5 signature: 07a901fd299418dd38cc890d1b990c41 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State
I: int

Return
-------
None

Description
-----------
Set the state of VPoint within the domain of the geometric shape <I> (= 1 or 2).
") State;
		void State(const TopAbs_State S, const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::SurfaceParameters ******/
		/****** md5 signature: b2de99c015c12be76b4165b4e0ef8bf9 ******/
		%feature("compactdefaultargs") SurfaceParameters;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
gp_Pnt2d

Description
-----------
get the parameter on surface of shape I (1,2) containing the point.
") SurfaceParameters;
		gp_Pnt2d SurfaceParameters(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****** TopOpeBRep_VPointInter::TransitionLineArc1 ******/
		/****** md5 signature: 679806c2617ae45ea0d53c6d48f259d0 ******/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
No available documentation.
") TransitionLineArc1;
		IntSurf_Transition TransitionLineArc1();

		/****** TopOpeBRep_VPointInter::TransitionLineArc2 ******/
		/****** md5 signature: bbc3f85a43c04d5fa71a8b70cc7ed587 ******/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
No available documentation.
") TransitionLineArc2;
		IntSurf_Transition TransitionLineArc2();

		/****** TopOpeBRep_VPointInter::TransitionOnS1 ******/
		/****** md5 signature: 5245a12c5e2011034b6494ccfe7fc557 ******/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
No available documentation.
") TransitionOnS1;
		IntSurf_Transition TransitionOnS1();

		/****** TopOpeBRep_VPointInter::TransitionOnS2 ******/
		/****** md5 signature: 3e01bdbaced43133b8538ecc2257bd7c ******/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
No available documentation.
") TransitionOnS2;
		IntSurf_Transition TransitionOnS2();

		/****** TopOpeBRep_VPointInter::UpdateKeep ******/
		/****** md5 signature: 5ad9d52824ae89630481b83d4aed1edf ******/
		%feature("compactdefaultargs") UpdateKeep;
		%feature("autodoc", "Return
-------
None

Description
-----------
set myKeep value according to current states.
") UpdateKeep;
		void UpdateKeep();

		/****** TopOpeBRep_VPointInter::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		const gp_Pnt Value();

		/****** TopOpeBRep_VPointInter::Vertex ******/
		/****** md5 signature: 0c88aa57dfb7be7247a84d38b4f95722 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Shape Vertex(const Standard_Integer I);

		/****** TopOpeBRep_VPointInter::VertexOnS1 ******/
		/****** md5 signature: 6ed918c69b81ad758219c5591cd71597 ******/
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertexOnS1 returns True. Otherwise, an exception is raised.
") VertexOnS1;
		const TopoDS_Shape VertexOnS1();

		/****** TopOpeBRep_VPointInter::VertexOnS2 ******/
		/****** md5 signature: 85c30fc7a3533bf2b52ba986c5679039 ******/
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the information about the point when it is on the domain of the second patch, i-e when the function IsVertexOnS2 returns True. Otherwise, an exception is raised.
") VertexOnS2;
		const TopoDS_Shape VertexOnS2();

};


%extend TopOpeBRep_VPointInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TopOpeBRep_VPointInterClassifier *
*****************************************/
class TopOpeBRep_VPointInterClassifier {
	public:
		/****** TopOpeBRep_VPointInterClassifier::TopOpeBRep_VPointInterClassifier ******/
		/****** md5 signature: a1be3fe40eb0a78f932a4aedb35a10ae ******/
		%feature("compactdefaultargs") TopOpeBRep_VPointInterClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_VPointInterClassifier;
		 TopOpeBRep_VPointInterClassifier();

		/****** TopOpeBRep_VPointInterClassifier::Edge ******/
		/****** md5 signature: 736edb396456a570eb4c4e39335bdcb0 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the edge containing the VPoint <VP> used in the last VPointPosition() call. Edge is defined if the state previously computed is ON, else Edge is a null shape.
") Edge;
		const TopoDS_Shape Edge();

		/****** TopOpeBRep_VPointInterClassifier::EdgeParameter ******/
		/****** md5 signature: a4ccdc0e9c154705af034e3ac274511c ******/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the parameter of the VPoint <VP> on Edge().
") EdgeParameter;
		Standard_Real EdgeParameter();

		/****** TopOpeBRep_VPointInterClassifier::VPointPosition ******/
		/****** md5 signature: 55d46de1e39090798de4632ad1c50433 ******/
		%feature("compactdefaultargs") VPointPosition;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
VP: TopOpeBRep_VPointInter
ShapeIndex: int
PC: TopOpeBRep_PointClassifier
AssumeINON: bool
Tol: float

Return
-------
TopAbs_State

Description
-----------
compute position of VPoint <VP> regarding with face <F>. <ShapeIndex> (= 1,2) indicates which (u,v) point of <VP> is used. when state is ON, set VP.EdgeON() with the edge containing <VP> and associated parameter. returns state of VP on ShapeIndex.
") VPointPosition;
		TopAbs_State VPointPosition(const TopoDS_Shape & F, TopOpeBRep_VPointInter & VP, const Standard_Integer ShapeIndex, TopOpeBRep_PointClassifier & PC, const Standard_Boolean AssumeINON, const Standard_Real Tol);

};


%extend TopOpeBRep_VPointInterClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopOpeBRep_VPointInterIterator *
***************************************/
class TopOpeBRep_VPointInterIterator {
	public:
		/****** TopOpeBRep_VPointInterIterator::TopOpeBRep_VPointInterIterator ******/
		/****** md5 signature: 4a60080b99d1b377643e02747bdab223 ******/
		%feature("compactdefaultargs") TopOpeBRep_VPointInterIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator();

		/****** TopOpeBRep_VPointInterIterator::TopOpeBRep_VPointInterIterator ******/
		/****** md5 signature: 848023f5f372c815ac79e0dd516e1273 ******/
		%feature("compactdefaultargs") TopOpeBRep_VPointInterIterator;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator(const TopOpeBRep_LineInter & LI);

		/****** TopOpeBRep_VPointInterIterator::ChangeCurrentVP ******/
		/****** md5 signature: 496148d05b3616d904bc44b4aaa992c9 ******/
		%feature("compactdefaultargs") ChangeCurrentVP;
		%feature("autodoc", "Return
-------
TopOpeBRep_VPointInter

Description
-----------
No available documentation.
") ChangeCurrentVP;
		TopOpeBRep_VPointInter & ChangeCurrentVP();

		/****** TopOpeBRep_VPointInterIterator::CurrentVP ******/
		/****** md5 signature: 260aa53e61b4d197c4be3891e211d125 ******/
		%feature("compactdefaultargs") CurrentVP;
		%feature("autodoc", "Return
-------
TopOpeBRep_VPointInter

Description
-----------
No available documentation.
") CurrentVP;
		const TopOpeBRep_VPointInter & CurrentVP();

		/****** TopOpeBRep_VPointInterIterator::CurrentVPIndex ******/
		/****** md5 signature: 85204fb33ee8549cb9f5dbd465f7d30b ******/
		%feature("compactdefaultargs") CurrentVPIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CurrentVPIndex;
		Standard_Integer CurrentVPIndex();

		/****** TopOpeBRep_VPointInterIterator::Init ******/
		/****** md5 signature: edc6296d5a1bee29f35c1f07be0565e9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRep_LineInter
checkkeep: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRep_LineInter & LI, const Standard_Boolean checkkeep = Standard_False);

		/****** TopOpeBRep_VPointInterIterator::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** TopOpeBRep_VPointInterIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** TopOpeBRep_VPointInterIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** TopOpeBRep_VPointInterIterator::PLineInterDummy ******/
		/****** md5 signature: 20d21f153b52d5c38ce7cf68a51ddad1 ******/
		%feature("compactdefaultargs") PLineInterDummy;
		%feature("autodoc", "Return
-------
TopOpeBRep_PLineInter

Description
-----------
No available documentation.
") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy();

};


%extend TopOpeBRep_VPointInterIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRep_WPointInter *
*******************************/
class TopOpeBRep_WPointInter {
	public:
		/****** TopOpeBRep_WPointInter::TopOpeBRep_WPointInter ******/
		/****** md5 signature: 07487cc8a014764d8895686694392704 ******/
		%feature("compactdefaultargs") TopOpeBRep_WPointInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_WPointInter;
		 TopOpeBRep_WPointInter();

		/****** TopOpeBRep_WPointInter::PPntOn2SDummy ******/
		/****** md5 signature: b847ccb0b68d1e68f6999218617620ec ******/
		%feature("compactdefaultargs") PPntOn2SDummy;
		%feature("autodoc", "Return
-------
TopOpeBRep_PPntOn2S

Description
-----------
No available documentation.
") PPntOn2SDummy;
		TopOpeBRep_PPntOn2S PPntOn2SDummy();

		/****** TopOpeBRep_WPointInter::Parameters ******/
		/****** md5 signature: 30bdd599088f74dedd5979b152a07fd4 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
No available documentation.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_WPointInter::ParametersOnS1 ******/
		/****** md5 signature: 65a097ef44a5cf9a58ab746f2da6c181 ******/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_WPointInter::ParametersOnS2 ******/
		/****** md5 signature: 77976f8d675bab277c77e4c02c68ee8f ******/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRep_WPointInter::Set ******/
		/****** md5 signature: 25cd1975551f75abc8554038a5b3e8da ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: IntSurf_PntOn2S

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const IntSurf_PntOn2S & P);

		/****** TopOpeBRep_WPointInter::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		const gp_Pnt Value();

		/****** TopOpeBRep_WPointInter::ValueOnS1 ******/
		/****** md5 signature: 50b3ba63c3abb8d8b7b0f75f561ce255 ******/
		%feature("compactdefaultargs") ValueOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") ValueOnS1;
		gp_Pnt2d ValueOnS1();

		/****** TopOpeBRep_WPointInter::ValueOnS2 ******/
		/****** md5 signature: 5917a8ca4046cc4f4c1891697e532739 ******/
		%feature("compactdefaultargs") ValueOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") ValueOnS2;
		gp_Pnt2d ValueOnS2();

};


%extend TopOpeBRep_WPointInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopOpeBRep_WPointInterIterator *
***************************************/
class TopOpeBRep_WPointInterIterator {
	public:
		/****** TopOpeBRep_WPointInterIterator::TopOpeBRep_WPointInterIterator ******/
		/****** md5 signature: 0a9a3c237cfb9ac449577a8e46e2431d ******/
		%feature("compactdefaultargs") TopOpeBRep_WPointInterIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator();

		/****** TopOpeBRep_WPointInterIterator::TopOpeBRep_WPointInterIterator ******/
		/****** md5 signature: feea3dde3a7a950ae69c571df50f89bd ******/
		%feature("compactdefaultargs") TopOpeBRep_WPointInterIterator;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator(const TopOpeBRep_LineInter & LI);

		/****** TopOpeBRep_WPointInterIterator::CurrentWP ******/
		/****** md5 signature: e2d815e0c2e2b5af7abb4585291aa49f ******/
		%feature("compactdefaultargs") CurrentWP;
		%feature("autodoc", "Return
-------
TopOpeBRep_WPointInter

Description
-----------
No available documentation.
") CurrentWP;
		const TopOpeBRep_WPointInter & CurrentWP();

		/****** TopOpeBRep_WPointInterIterator::Init ******/
		/****** md5 signature: 2bdd8bb3eee4611ae1fc02a9782b42a5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRep_LineInter

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRep_LineInter & LI);

		/****** TopOpeBRep_WPointInterIterator::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** TopOpeBRep_WPointInterIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** TopOpeBRep_WPointInterIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** TopOpeBRep_WPointInterIterator::PLineInterDummy ******/
		/****** md5 signature: 20d21f153b52d5c38ce7cf68a51ddad1 ******/
		%feature("compactdefaultargs") PLineInterDummy;
		%feature("autodoc", "Return
-------
TopOpeBRep_PLineInter

Description
-----------
No available documentation.
") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy();

};


%extend TopOpeBRep_WPointInterIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRep_traceSIFF *
*****************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class TopOpeBRep_traceSIFF:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class TopOpeBRep_HArray1OfLineInter : public TopOpeBRep_Array1OfLineInter, public Standard_Transient {
  public:
    TopOpeBRep_HArray1OfLineInter(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopOpeBRep_HArray1OfLineInter(const Standard_Integer theLower, const Standard_Integer theUpper, const TopOpeBRep_Array1OfLineInter::value_type& theValue);
    TopOpeBRep_HArray1OfLineInter(const TopOpeBRep_Array1OfLineInter& theOther);
    const TopOpeBRep_Array1OfLineInter& Array1();
    TopOpeBRep_Array1OfLineInter& ChangeArray1();
};
%make_alias(TopOpeBRep_HArray1OfLineInter)


class TopOpeBRep_HArray1OfVPointInter : public TopOpeBRep_Array1OfVPointInter, public Standard_Transient {
  public:
    TopOpeBRep_HArray1OfVPointInter(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopOpeBRep_HArray1OfVPointInter(const Standard_Integer theLower, const Standard_Integer theUpper, const TopOpeBRep_Array1OfVPointInter::value_type& theValue);
    TopOpeBRep_HArray1OfVPointInter(const TopOpeBRep_Array1OfVPointInter& theOther);
    const TopOpeBRep_Array1OfVPointInter& Array1();
    TopOpeBRep_Array1OfVPointInter& ChangeArray1();
};
%make_alias(TopOpeBRep_HArray1OfVPointInter)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def topopebrep_Print(*args):
	return topopebrep.Print(*args)

@deprecated
def TopOpeBRep_FFTransitionTool_ProcessEdgeONTransition(*args):
	return TopOpeBRep_FFTransitionTool.ProcessEdgeONTransition(*args)

@deprecated
def TopOpeBRep_FFTransitionTool_ProcessEdgeTransition(*args):
	return TopOpeBRep_FFTransitionTool.ProcessEdgeTransition(*args)

@deprecated
def TopOpeBRep_FFTransitionTool_ProcessFaceTransition(*args):
	return TopOpeBRep_FFTransitionTool.ProcessFaceTransition(*args)

@deprecated
def TopOpeBRep_FFTransitionTool_ProcessLineTransition(*args):
	return TopOpeBRep_FFTransitionTool.ProcessLineTransition(*args)

@deprecated
def TopOpeBRep_FFTransitionTool_ProcessLineTransition(*args):
	return TopOpeBRep_FFTransitionTool.ProcessLineTransition(*args)

@deprecated
def TopOpeBRep_FacesFiller_EqualpPonR(*args):
	return TopOpeBRep_FacesFiller.EqualpPonR(*args)

@deprecated
def TopOpeBRep_FacesFiller_IsVPtransLok(*args):
	return TopOpeBRep_FacesFiller.IsVPtransLok(*args)

@deprecated
def TopOpeBRep_FacesFiller_LSameDomainERL(*args):
	return TopOpeBRep_FacesFiller.LSameDomainERL(*args)

@deprecated
def TopOpeBRep_FacesFiller_Lminmax(*args):
	return TopOpeBRep_FacesFiller.Lminmax(*args)

@deprecated
def TopOpeBRep_FacesFiller_TransvpOK(*args):
	return TopOpeBRep_FacesFiller.TransvpOK(*args)

@deprecated
def TopOpeBRep_FacesFiller_VPParamOnER(*args):
	return TopOpeBRep_FacesFiller.VPParamOnER(*args)

@deprecated
def TopOpeBRep_GeomTool_MakeBSpline1fromWALKING2d(*args):
	return TopOpeBRep_GeomTool.MakeBSpline1fromWALKING2d(*args)

@deprecated
def TopOpeBRep_GeomTool_MakeBSpline1fromWALKING3d(*args):
	return TopOpeBRep_GeomTool.MakeBSpline1fromWALKING3d(*args)

@deprecated
def TopOpeBRep_GeomTool_MakeCurve(*args):
	return TopOpeBRep_GeomTool.MakeCurve(*args)

@deprecated
def TopOpeBRep_GeomTool_MakeCurves(*args):
	return TopOpeBRep_GeomTool.MakeCurves(*args)

@deprecated
def TopOpeBRep_PointGeomTool_IsEqual(*args):
	return TopOpeBRep_PointGeomTool.IsEqual(*args)

@deprecated
def TopOpeBRep_PointGeomTool_MakePoint(*args):
	return TopOpeBRep_PointGeomTool.MakePoint(*args)

@deprecated
def TopOpeBRep_PointGeomTool_MakePoint(*args):
	return TopOpeBRep_PointGeomTool.MakePoint(*args)

@deprecated
def TopOpeBRep_PointGeomTool_MakePoint(*args):
	return TopOpeBRep_PointGeomTool.MakePoint(*args)

@deprecated
def TopOpeBRep_PointGeomTool_MakePoint(*args):
	return TopOpeBRep_PointGeomTool.MakePoint(*args)

}
