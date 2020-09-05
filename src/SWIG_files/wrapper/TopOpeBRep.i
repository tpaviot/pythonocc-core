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
%define TOPOPEBREPDOCSTRING
"TopOpeBRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topopebrep.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
#include<Geom2dAdaptor_module.hxx>
#include<TCollection_module.hxx>
#include<Bnd_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopAbs_module.hxx>
#include<gp_module.hxx>
#include<TopTools_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
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
%import Geom2dAdaptor.i
%import TCollection.i
%import Bnd.i
%import BRepAdaptor.i
%import TopAbs.i
%import gp.i
%import TopTools.i
%import Geom2d.i
%import Geom.i

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

/* python proy classes for enums */
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
%wrap_handle(TopOpeBRep_HArray1OfVPointInter)
%wrap_handle(TopOpeBRep_HArray1OfLineInter)
/* end handles declaration */

/* templates */
%template(TopOpeBRep_Array1OfLineInter) NCollection_Array1<TopOpeBRep_LineInter>;

%extend NCollection_Array1<TopOpeBRep_LineInter> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TopOpeBRep_Array1OfVPointInter) NCollection_Array1<TopOpeBRep_VPointInter>;

%extend NCollection_Array1<TopOpeBRep_VPointInter> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
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
		/****************** TopOpeBRep_Bipoint ******************/
		/**** md5 signature: a715cb54d3a52f08c102ca6db0d069b1 ****/
		%feature("compactdefaultargs") TopOpeBRep_Bipoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint();

		/****************** TopOpeBRep_Bipoint ******************/
		/**** md5 signature: e2d9e3227b46e6169a8387b50c8a73b4 ****/
		%feature("compactdefaultargs") TopOpeBRep_Bipoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: int
I2: int

Returns
-------
None
") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint(const Standard_Integer I1, const Standard_Integer I2);

		/****************** I1 ******************/
		/**** md5 signature: 74161ab0bbc94c01faf48cb60fb358c7 ****/
		%feature("compactdefaultargs") I1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") I1;
		Standard_Integer I1();

		/****************** I2 ******************/
		/**** md5 signature: eaec9284f7e9882b1d76f4c6582c3504 ****/
		%feature("compactdefaultargs") I2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		/****************** TopOpeBRep_DSFiller ******************/
		/**** md5 signature: 94d1e0669c4d73ab6878efe1b3c3c129 ****/
		%feature("compactdefaultargs") TopOpeBRep_DSFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_DSFiller;
		 TopOpeBRep_DSFiller();

		/****************** ChangeEdgesFiller ******************/
		/**** md5 signature: 42f528f137a884825f37c45c5ef2914d ****/
		%feature("compactdefaultargs") ChangeEdgesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_EdgesFiller
") ChangeEdgesFiller;
		TopOpeBRep_EdgesFiller & ChangeEdgesFiller();

		/****************** ChangeFaceEdgeFiller ******************/
		/**** md5 signature: 7e75719b2c1ecc11d8c6aae1c01c49b5 ****/
		%feature("compactdefaultargs") ChangeFaceEdgeFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_FaceEdgeFiller
") ChangeFaceEdgeFiller;
		TopOpeBRep_FaceEdgeFiller & ChangeFaceEdgeFiller();

		/****************** ChangeFacesFiller ******************/
		/**** md5 signature: 0eb68d8005f2ae63fdbc569576b1f1fd ****/
		%feature("compactdefaultargs") ChangeFacesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_FacesFiller
") ChangeFacesFiller;
		TopOpeBRep_FacesFiller & ChangeFacesFiller();

		/****************** ChangeShapeIntersector ******************/
		/**** md5 signature: 373fa58a8d6b9fee7bf9640d5ccf9f06 ****/
		%feature("compactdefaultargs") ChangeShapeIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_ShapeIntersector
") ChangeShapeIntersector;
		TopOpeBRep_ShapeIntersector & ChangeShapeIntersector();

		/****************** ChangeShapeIntersector2d ******************/
		/**** md5 signature: ccba574a2ff15e1350384beb726a2f67 ****/
		%feature("compactdefaultargs") ChangeShapeIntersector2d;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_ShapeIntersector2d
") ChangeShapeIntersector2d;
		TopOpeBRep_ShapeIntersector2d & ChangeShapeIntersector2d();

		/****************** Checker ******************/
		/**** md5 signature: 1b9d5d2546157986ea508477f44d8430 ****/
		%feature("compactdefaultargs") Checker;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Checker;
		void Checker(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Complete ******************/
		/**** md5 signature: c1cbcbc9cdcd8d6779c56214ece9a089 ****/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Complete;
		void Complete(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** CompleteDS ******************/
		/**** md5 signature: 298ea4b1a23c2b2b60dcc61137773361 ****/
		%feature("compactdefaultargs") CompleteDS;
		%feature("autodoc", "Update the data structure with relevant informations deduced from the intersections. //! shells containing an intersected face. wires containing an intersected edge.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") CompleteDS;
		void CompleteDS(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** CompleteDS2d ******************/
		/**** md5 signature: 610994e807ee28a545e1f5070174df41 ****/
		%feature("compactdefaultargs") CompleteDS2d;
		%feature("autodoc", "Update the data structure with relevant informations deduced from the intersections 2d. //! shells containing an intersected face. wires containing an intersected edge. //! search for interference identity using edge connexity //nyi.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") CompleteDS2d;
		void CompleteDS2d(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Filter ******************/
		/**** md5 signature: 766f5d92da74080f37f019c1e892ffe1 ****/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Filter;
		void Filter(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** GapFiller ******************/
		/**** md5 signature: bbd4a4842b10fc20392f993b9a6133bc ****/
		%feature("compactdefaultargs") GapFiller;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") GapFiller;
		void GapFiller(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Insert ******************/
		/**** md5 signature: 665de110eeab73fc45dd6a102cd78ae4 ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Stores in <ds> the intersections of <s1> and <s2>. if orientforward = true s forward,reversed --> forward s external,internal --> external,internal.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure
orientFORWARD: bool,optional
	default value is Standard_True

Returns
-------
None
") Insert;
		void Insert(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Boolean orientFORWARD = Standard_True);

		/****************** Insert1d ******************/
		/**** md5 signature: db5f6ee00fabae6f226597adb9c30b37 ****/
		%feature("compactdefaultargs") Insert1d;
		%feature("autodoc", "Stores in <ds> the intersections of <s1> and <s2>. s1 and s2 are edges or wires. s1 edges have a 2d representation in face f1 s2 edges have a 2d representation in face f2 f1 is the face which surface is taken as reference for 2d description of s1 and s2 edges. if orientforward = true s forward,reversed --> forward s external,internal --> external,internal.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
F1: TopoDS_Face
F2: TopoDS_Face
HDS: TopOpeBRepDS_HDataStructure
orientFORWARD: bool,optional
	default value is Standard_False

Returns
-------
None
") Insert1d;
		void Insert1d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const TopoDS_Face & F1, const TopoDS_Face & F2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Boolean orientFORWARD = Standard_False);

		/****************** Insert2d ******************/
		/**** md5 signature: 7bbe73f7028f9501e3aaab2c40aaea66 ****/
		%feature("compactdefaultargs") Insert2d;
		%feature("autodoc", "Stores in <ds> the intersections of <s1> and <s2>. s1 et s2 contain only samedomain face.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Insert2d;
		void Insert2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** InsertIntersection ******************/
		/**** md5 signature: ce998609c99cc6ba7bd504759ebc2654 ****/
		%feature("compactdefaultargs") InsertIntersection;
		%feature("autodoc", "Stores in <ds> the intersections of <s1> and <s2>. if orientforward = true s forwar,reversed --> forward s external,internal --> external,internal.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure
orientFORWARD: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertIntersection;
		void InsertIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Boolean orientFORWARD = Standard_True);

		/****************** InsertIntersection2d ******************/
		/**** md5 signature: 32df11ddce8d9f8436943cc95129dfda ****/
		%feature("compactdefaultargs") InsertIntersection2d;
		%feature("autodoc", "S1, s2 set of tangent face lance les intersections 2d pour coder correctement les faces samedomain.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") InsertIntersection2d;
		void InsertIntersection2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** IsContext1d ******************/
		/**** md5 signature: a224b63bd5e25aef88157d00321c46b6 ****/
		%feature("compactdefaultargs") IsContext1d;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsContext1d;
		Standard_Boolean IsContext1d(const TopoDS_Shape & S);

		/****************** IsMadeOf1d ******************/
		/**** md5 signature: 07a0ed23f9952008160be5a338e4a363 ****/
		%feature("compactdefaultargs") IsMadeOf1d;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsMadeOf1d;
		Standard_Boolean IsMadeOf1d(const TopoDS_Shape & S);

		/****************** PShapeClassifier ******************/
		/**** md5 signature: 839210bbffc66c6dadfa1a9483c467a7 ****/
		%feature("compactdefaultargs") PShapeClassifier;
		%feature("autodoc", "Return field mypshapeclassifier. set field mypshapeclassifier.

Returns
-------
TopOpeBRepTool_PShapeClassifier
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier();

		/****************** Reducer ******************/
		/**** md5 signature: cf786c5031b4295615b5b69524dacaef ****/
		%feature("compactdefaultargs") Reducer;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Reducer;
		void Reducer(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** RemoveUnsharedGeometry ******************/
		/**** md5 signature: 3a71e62209739aeac2348609183aade5 ****/
		%feature("compactdefaultargs") RemoveUnsharedGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
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
		/****************** TopOpeBRep_EdgesFiller ******************/
		/**** md5 signature: ec896d01f7f06bf02131d38934ea4515 ****/
		%feature("compactdefaultargs") TopOpeBRep_EdgesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_EdgesFiller;
		 TopOpeBRep_EdgesFiller();

		/****************** Face ******************/
		/**** md5 signature: f92ebdacef14b7f450400a186e83473d ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
F: TopoDS_Shape

Returns
-------
None
") Face;
		void Face(const Standard_Integer I, const TopoDS_Shape & F);

		/****************** Face ******************/
		/**** md5 signature: 3ee676861b06f3c0597afbbe4966b236 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Face;
		const TopoDS_Shape Face(const Standard_Integer I);

		/****************** Insert ******************/
		/**** md5 signature: 50b516246815fa264f5aa7c6f66c6e10 ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: TopoDS_Shape
E2: TopoDS_Shape
EI: TopOpeBRep_EdgesIntersector
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
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
		/****************** TopOpeBRep_EdgesIntersector ******************/
		/**** md5 signature: b420776cd4679d2c673c90c15b89c7dc ****/
		%feature("compactdefaultargs") TopOpeBRep_EdgesIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_EdgesIntersector;
		 TopOpeBRep_EdgesIntersector();

		/****************** Curve ******************/
		/**** md5 signature: c197fdb0292db57c51429bfa890763a8 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve(const Standard_Integer Index);

		/****************** Dimension ******************/
		/**** md5 signature: bffc3d9b070e68685a6f532f4d09951a ****/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: int

Returns
-------
None
") Dimension;
		void Dimension(const Standard_Integer D);

		/****************** Dimension ******************/
		/**** md5 signature: e4bdde894007391dd45dcb2fa38eb0af ****/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Set working space dimension d = 1 for e &|| w, 2 for e in f.

Returns
-------
int
") Dimension;
		Standard_Integer Dimension();

		/****************** Dump ******************/
		/**** md5 signature: 6dadf2b055ff57119ece31d6e8450595 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
str: TCollection_AsciiString
ie1: int,optional
	default value is 0
ie2: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const TCollection_AsciiString & str, const Standard_Integer ie1 = 0, const Standard_Integer ie2 = 0);

		/****************** Edge ******************/
		/**** md5 signature: 307eac48f15b7575b76de6ac6147f9b1 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") Edge;
		const TopoDS_Shape Edge(const Standard_Integer Index);

		/****************** Face ******************/
		/**** md5 signature: 369bad292fcb0f7622cfabd8d11dd8db ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") Face;
		const TopoDS_Shape Face(const Standard_Integer Index);

		/****************** FacesSameOriented ******************/
		/**** md5 signature: 435f628c00049ebc1d70e1ce34bc8025 ****/
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FacesSameOriented;
		Standard_Boolean FacesSameOriented();

		/****************** ForceTolerances ******************/
		/**** md5 signature: 67adf0c8741f8cd5a3ea9d107acd1de6 ****/
		%feature("compactdefaultargs") ForceTolerances;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol1: float
Tol2: float

Returns
-------
None
") ForceTolerances;
		void ForceTolerances(const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** HasSegment ******************/
		/**** md5 signature: 1e8e9253796e93e66360229d525d6678 ****/
		%feature("compactdefaultargs") HasSegment;
		%feature("autodoc", "True if at least one intersection segment.

Returns
-------
bool
") HasSegment;
		Standard_Boolean HasSegment();

		/****************** InitPoint ******************/
		/**** md5 signature: d3803d80eaa4169b2e84fa10eb0a3519 ****/
		%feature("compactdefaultargs") InitPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
selectkeep: bool,optional
	default value is Standard_True

Returns
-------
None
") InitPoint;
		void InitPoint(const Standard_Boolean selectkeep = Standard_True);

		/****************** IsEmpty ******************/
		/**** md5 signature: e27f5e4366afc93bf8faeaa27a6a716c ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** MorePoint ******************/
		/**** md5 signature: 49b6d3fce0f619d47fb6c22cd6e43311 ****/
		%feature("compactdefaultargs") MorePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MorePoint;
		Standard_Boolean MorePoint();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** NextPoint ******************/
		/**** md5 signature: 405187df0396980d4a156a27c62571e1 ****/
		%feature("compactdefaultargs") NextPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextPoint;
		void NextPoint();

		/****************** Perform ******************/
		/**** md5 signature: e9dbea4006900374342d9db06fb69172 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: TopoDS_Shape
E2: TopoDS_Shape
ReduceSegments: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & E1, const TopoDS_Shape & E2, const Standard_Boolean ReduceSegments = Standard_True);

		/****************** Point ******************/
		/**** md5 signature: ae4590a19e23c5058b49e8da638135ff ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_Point2d
") Point;
		const TopOpeBRep_Point2d & Point();

		/****************** Point ******************/
		/**** md5 signature: dd5f5035ef5ee0ddf6bf63ee2f08e025 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRep_Point2d
") Point;
		const TopOpeBRep_Point2d & Point(const Standard_Integer I);

		/****************** Points ******************/
		/**** md5 signature: 16de9901bc57813b3c3bcac54da5d818 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_SequenceOfPoint2d
") Points;
		const TopOpeBRep_SequenceOfPoint2d & Points();

		/****************** ReduceSegment ******************/
		/**** md5 signature: c7823a60919234c136cbc013497b5aa7 ****/
		%feature("compactdefaultargs") ReduceSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TopOpeBRep_Point2d
P2: TopOpeBRep_Point2d
Pn: TopOpeBRep_Point2d

Returns
-------
bool
") ReduceSegment;
		virtual Standard_Boolean ReduceSegment(TopOpeBRep_Point2d & P1, TopOpeBRep_Point2d & P2, TopOpeBRep_Point2d & Pn);

		/****************** SameDomain ******************/
		/**** md5 signature: ceba397eccbd28c4c6715ac85077480f ****/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "= mysamedomain.

Returns
-------
bool
") SameDomain;
		Standard_Boolean SameDomain();

		/****************** SetFaces ******************/
		/**** md5 signature: 7bcb2bdab219cd4f0ceefa5b896735ed ****/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Returns
-------
None
") SetFaces;
		void SetFaces(const TopoDS_Shape & F1, const TopoDS_Shape & F2);

		/****************** SetFaces ******************/
		/**** md5 signature: 616b9954245a00e0805fe2e8a403c0c0 ****/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
B1: Bnd_Box
B2: Bnd_Box

Returns
-------
None
") SetFaces;
		void SetFaces(const TopoDS_Shape & F1, const TopoDS_Shape & F2, const Bnd_Box & B1, const Bnd_Box & B2);

		/****************** Status1 ******************/
		/**** md5 signature: a482506d6f765463bf27dc481a53ae08 ****/
		%feature("compactdefaultargs") Status1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_P2Dstatus
") Status1;
		TopOpeBRep_P2Dstatus Status1();

		/****************** Surface ******************/
		/**** md5 signature: 020f2de4ba0a5346a9d4639bba276e13 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
BRepAdaptor_Surface
") Surface;
		const BRepAdaptor_Surface & Surface(const Standard_Integer Index);

		/****************** SurfacesSameOriented ******************/
		/**** md5 signature: 5a73f090b826c38dcc30efe0cb99df4e ****/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented();

		/****************** ToleranceMax ******************/
		/**** md5 signature: a6a9621146265549179f54bf3bae3efc ****/
		%feature("compactdefaultargs") ToleranceMax;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ToleranceMax;
		Standard_Real ToleranceMax();

		/****************** Tolerances ******************/
		/**** md5 signature: 2d749b7f11bf1e85bb59a8023410578d ****/
		%feature("compactdefaultargs") Tolerances;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
tol1: float
tol2: float
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
		/****************** TopOpeBRep_FFDumper ******************/
		/**** md5 signature: 5069ea834b5634569d23872685d387c9 ****/
		%feature("compactdefaultargs") TopOpeBRep_FFDumper;
		%feature("autodoc", "No available documentation.

Parameters
----------
PFF: TopOpeBRep_PFacesFiller

Returns
-------
None
") TopOpeBRep_FFDumper;
		 TopOpeBRep_FFDumper(const TopOpeBRep_PFacesFiller & PFF);

		/****************** DumpDSP ******************/
		/**** md5 signature: 048812250355507033829dd1cde50af6 ****/
		%feature("compactdefaultargs") DumpDSP;
		%feature("autodoc", "No available documentation.

Parameters
----------
VP: TopOpeBRep_VPointInter
GK: TopOpeBRepDS_Kind
G: int
newinDS: bool

Returns
-------
None
") DumpDSP;
		void DumpDSP(const TopOpeBRep_VPointInter & VP, const TopOpeBRepDS_Kind GK, const Standard_Integer G, const Standard_Boolean newinDS);

		/****************** DumpLine ******************/
		/**** md5 signature: 93d5b0b42f2b9aa01c9d8fc1b2561d02 ****/
		%feature("compactdefaultargs") DumpLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") DumpLine;
		void DumpLine(const Standard_Integer I);

		/****************** DumpLine ******************/
		/**** md5 signature: 0817cf884e719d75a7c5ab6bf884c3e4 ****/
		%feature("compactdefaultargs") DumpLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
None
") DumpLine;
		void DumpLine(const TopOpeBRep_LineInter & L);

		/****************** DumpVP ******************/
		/**** md5 signature: 7cc0f5e39ed07a6c323a85014bd23b25 ****/
		%feature("compactdefaultargs") DumpVP;
		%feature("autodoc", "No available documentation.

Parameters
----------
VP: TopOpeBRep_VPointInter

Returns
-------
None
") DumpVP;
		void DumpVP(const TopOpeBRep_VPointInter & VP);

		/****************** DumpVP ******************/
		/**** md5 signature: 6dd6b95083b914790106d9856c392255 ****/
		%feature("compactdefaultargs") DumpVP;
		%feature("autodoc", "No available documentation.

Parameters
----------
VP: TopOpeBRep_VPointInter
ISI: int

Returns
-------
None
") DumpVP;
		void DumpVP(const TopOpeBRep_VPointInter & VP, const Standard_Integer ISI);

		/****************** ExploreIndex ******************/
		/**** md5 signature: 57e25ab370d52f3fac2b745bac045a9a ****/
		%feature("compactdefaultargs") ExploreIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
ISI: int

Returns
-------
int
") ExploreIndex;
		Standard_Integer ExploreIndex(const TopoDS_Shape & S, const Standard_Integer ISI);

		/****************** Init ******************/
		/**** md5 signature: 94f7072b958322260086eb97600758e9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
PFF: TopOpeBRep_PFacesFiller

Returns
-------
None
") Init;
		void Init(const TopOpeBRep_PFacesFiller & PFF);

		/****************** PFacesFillerDummy ******************/
		/**** md5 signature: e29ebcd883c2de9933d64a64ee1835b0 ****/
		%feature("compactdefaultargs") PFacesFillerDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PFacesFiller
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
		/****************** ProcessEdgeONTransition ******************/
		/**** md5 signature: 1ac26d2eb27f9d8dc22b1fe8497e64f4 ****/
		%feature("compactdefaultargs") ProcessEdgeONTransition;
		%feature("autodoc", "Compute transition on 'intpatch_restriction line' edge <r> when crossing edge <e> of face <f> at point <vp>. vp is given on edge <e> of face <f> of index <index> (1 or 2). <vp> has been classified by facesfiller as topabs_on an edge <r> of the other face than <f> of current (face/face) intersection. transition depends on the orientation of e in f. this method should be provided by intpatch_line (nyi).

Parameters
----------
VP: TopOpeBRep_VPointInter
Index: int
R: TopoDS_Shape
E: TopoDS_Shape
F: TopoDS_Shape

Returns
-------
TopOpeBRepDS_Transition
") ProcessEdgeONTransition;
		static TopOpeBRepDS_Transition ProcessEdgeONTransition(const TopOpeBRep_VPointInter & VP, const Standard_Integer Index, const TopoDS_Shape & R, const TopoDS_Shape & E, const TopoDS_Shape & F);

		/****************** ProcessEdgeTransition ******************/
		/**** md5 signature: 9d92d843486c011fe37894a0bd496f9a ****/
		%feature("compactdefaultargs") ProcessEdgeTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRep_VPointInter
Index: int
LineOrientation: TopAbs_Orientation

Returns
-------
TopOpeBRepDS_Transition
") ProcessEdgeTransition;
		static TopOpeBRepDS_Transition ProcessEdgeTransition(const TopOpeBRep_VPointInter & P, const Standard_Integer Index, const TopAbs_Orientation LineOrientation);

		/****************** ProcessFaceTransition ******************/
		/**** md5 signature: cacbf344e82d51a5f1e2cf0e90be90df ****/
		%feature("compactdefaultargs") ProcessFaceTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRep_LineInter
Index: int
FaceOrientation: TopAbs_Orientation

Returns
-------
TopOpeBRepDS_Transition
") ProcessFaceTransition;
		static TopOpeBRepDS_Transition ProcessFaceTransition(const TopOpeBRep_LineInter & L, const Standard_Integer Index, const TopAbs_Orientation FaceOrientation);

		/****************** ProcessLineTransition ******************/
		/**** md5 signature: 1a1b60881796672a7dc540281f6d7373 ****/
		%feature("compactdefaultargs") ProcessLineTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRep_VPointInter
Index: int
EdgeOrientation: TopAbs_Orientation

Returns
-------
TopOpeBRepDS_Transition
") ProcessLineTransition;
		static TopOpeBRepDS_Transition ProcessLineTransition(const TopOpeBRep_VPointInter & P, const Standard_Integer Index, const TopAbs_Orientation EdgeOrientation);

		/****************** ProcessLineTransition ******************/
		/**** md5 signature: a4405ed67eccfe492272c9ddb0d3f109 ****/
		%feature("compactdefaultargs") ProcessLineTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRep_VPointInter
L: TopOpeBRep_LineInter

Returns
-------
TopOpeBRepDS_Transition
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
		/****************** TopOpeBRep_FaceEdgeFiller ******************/
		/**** md5 signature: 05c921804eac70417f5abaa5fe4fb035 ****/
		%feature("compactdefaultargs") TopOpeBRep_FaceEdgeFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FaceEdgeFiller;
		 TopOpeBRep_FaceEdgeFiller();

		/****************** Insert ******************/
		/**** md5 signature: ea225ff45a154ecb096d760424dded0a ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape
FEINT: TopOpeBRep_FaceEdgeIntersector
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
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
		/****************** TopOpeBRep_FaceEdgeIntersector ******************/
		/**** md5 signature: e936a0541dae4fc5be154eb54a1c4949 ****/
		%feature("compactdefaultargs") TopOpeBRep_FaceEdgeIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FaceEdgeIntersector;
		 TopOpeBRep_FaceEdgeIntersector();

		/****************** ForceTolerance ******************/
		/**** md5 signature: 2332958e0618d3a987995a3a25f212d8 ****/
		%feature("compactdefaultargs") ForceTolerance;
		%feature("autodoc", "Force the tolerance values used by the next perform(s1,s2) call.

Parameters
----------
tol: float

Returns
-------
None
") ForceTolerance;
		void ForceTolerance(const Standard_Real tol);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Trace only.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** InitPoint ******************/
		/**** md5 signature: ef05c711044f2a178bf8355ee34118b6 ****/
		%feature("compactdefaultargs") InitPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitPoint;
		void InitPoint();

		/****************** IsEmpty ******************/
		/**** md5 signature: e27f5e4366afc93bf8faeaa27a6a716c ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsVertex ******************/
		/**** md5 signature: 6c175ba1f2197d81edaac96b81cd1516 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
P: gp_Pnt
Tol: float
V: TopoDS_Vertex

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex(const TopoDS_Shape & S, const gp_Pnt & P, const Standard_Real Tol, TopoDS_Vertex & V);

		/****************** IsVertex ******************/
		/**** md5 signature: 878988d0a7f2ca9bf81769584d5dc947 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
V: TopoDS_Vertex

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex(const Standard_Integer I, TopoDS_Vertex & V);

		/****************** MorePoint ******************/
		/**** md5 signature: 49b6d3fce0f619d47fb6c22cd6e43311 ****/
		%feature("compactdefaultargs") MorePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MorePoint;
		Standard_Boolean MorePoint();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NextPoint ******************/
		/**** md5 signature: 405187df0396980d4a156a27c62571e1 ****/
		%feature("compactdefaultargs") NextPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextPoint;
		void NextPoint();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametre de value() sur l'arete.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Perform ******************/
		/**** md5 signature: 925c374623a2aa188f1a0a0d3fcdd3c6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & F, const TopoDS_Shape & E);

		/****************** Shape ******************/
		/**** md5 signature: 9490bf72de2629e156b2f9f7c67be648 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns intersected face or edge according to value of <index> = 1 or 2.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer Index);

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "In ou on / a la face. les points out ne sont pas retournes.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return the tolerance value used in the last perform() call if forcetolerance() has been called, return the given value. if not, return value extracted from shapes.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Transition ******************/
		/**** md5 signature: 62dd23c2bf48fcf4aab8a097e7a7aec2 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Index = 1 transition par rapport a la face, en cheminant sur l'arete.

Parameters
----------
Index: int
FaceOrientation: TopAbs_Orientation

Returns
-------
TopOpeBRepDS_Transition
") Transition;
		TopOpeBRepDS_Transition Transition(const Standard_Integer Index, const TopAbs_Orientation FaceOrientation);

		/****************** UVPoint ******************/
		/**** md5 signature: fe94b12a8a35a715381902f22211fdbd ****/
		%feature("compactdefaultargs") UVPoint;
		%feature("autodoc", "Parametre de value() sur la face.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") UVPoint;
		void UVPoint(gp_Pnt2d & P);

		/****************** Value ******************/
		/**** md5 signature: 1d429a229b77b32713aab235505e93c2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the 3d point of the current intersection point.

Returns
-------
gp_Pnt
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
		/****************** TopOpeBRep_FacesFiller ******************/
		/**** md5 signature: 1b6f7393d6b5e3b9e71f9278ae5e7392 ****/
		%feature("compactdefaultargs") TopOpeBRep_FacesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FacesFiller;
		 TopOpeBRep_FacesFiller();

		/****************** AddShapesLine ******************/
		/**** md5 signature: 0f9d7f5f220178518550d5446499bb62 ****/
		%feature("compactdefaultargs") AddShapesLine;
		%feature("autodoc", "Compute 3d curve, pcurves and face/curve interferences for current ndsc. add them to the ds.

Returns
-------
None
") AddShapesLine;
		void AddShapesLine();

		/****************** ChangeDataStructure ******************/
		/**** md5 signature: 9c5ca6f9698b7c15bd242e59302c821d ****/
		%feature("compactdefaultargs") ChangeDataStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_DataStructure
") ChangeDataStructure;
		TopOpeBRepDS_DataStructure & ChangeDataStructure();

		/****************** ChangeFacesIntersector ******************/
		/**** md5 signature: 09c29fa34bf77993f5e46096b4b26b96 ****/
		%feature("compactdefaultargs") ChangeFacesIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_FacesIntersector
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector();

		/****************** ChangePointClassifier ******************/
		/**** md5 signature: 2caf5c2eeb9288d67ac51161e7d46d1a ****/
		%feature("compactdefaultargs") ChangePointClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PointClassifier
") ChangePointClassifier;
		TopOpeBRep_PointClassifier & ChangePointClassifier();

		/****************** CheckLine ******************/
		/**** md5 signature: aae89fff1e7f37947e2ec0e82e718867 ****/
		%feature("compactdefaultargs") CheckLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
bool
") CheckLine;
		Standard_Boolean CheckLine(TopOpeBRep_LineInter & L);

		/****************** EqualpPonR ******************/
		/**** md5 signature: 3e38040d810c0572b9e6555d4c8b92f1 ****/
		%feature("compactdefaultargs") EqualpPonR;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lrest: TopOpeBRep_LineInter
VP1: TopOpeBRep_VPointInter
VP2: TopOpeBRep_VPointInter

Returns
-------
bool
") EqualpPonR;
		static Standard_Boolean EqualpPonR(const TopOpeBRep_LineInter & Lrest, const TopOpeBRep_VPointInter & VP1, const TopOpeBRep_VPointInter & VP2);

		/****************** Face ******************/
		/**** md5 signature: d1eb857c2a65e9d3cb2fc51a7ab45063 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face(const Standard_Integer I);

		/****************** FaceFaceTransition ******************/
		/**** md5 signature: 4b53f4d76ab9e6e1af8ea6ab319330dd ****/
		%feature("compactdefaultargs") FaceFaceTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRep_LineInter
I: int

Returns
-------
TopOpeBRepDS_Transition
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition(const TopOpeBRep_LineInter & L, const Standard_Integer I);

		/****************** FaceFaceTransition ******************/
		/**** md5 signature: 83ffefbe5b8ae65ccfae12ac03265cee ****/
		%feature("compactdefaultargs") FaceFaceTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Transition
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition(const Standard_Integer I);

		/****************** FillLine ******************/
		/**** md5 signature: 3f4fd429b17892c8657870a6ee700552 ****/
		%feature("compactdefaultargs") FillLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") FillLine;
		void FillLine();

		/****************** FillLineVPonR ******************/
		/**** md5 signature: 9bc23548d0e04a2f4b9850f70b28329d ****/
		%feature("compactdefaultargs") FillLineVPonR;
		%feature("autodoc", "Vp processing for restriction line and line sharing same domain with section edges : - if restriction : adds restriction edges as section edges and compute face/edge interference. - if same domain : if line share same domain with section edges, compute parts of line in/in the two faces, and compute curve/point interference for vp boundaries.

Returns
-------
None
") FillLineVPonR;
		void FillLineVPonR();

		/****************** GetESL ******************/
		/**** md5 signature: 05cb1059d032dbc8639ca3b389a65ddc ****/
		%feature("compactdefaultargs") GetESL;
		%feature("autodoc", "Get map <mapes > of restriction edges having parts in one of the 2 faces.

Parameters
----------
LES: TopTools_ListOfShape

Returns
-------
None
") GetESL;
		void GetESL(TopTools_ListOfShape & LES);

		/****************** GetFFGeometry ******************/
		/**** md5 signature: e5ae8ea42addf73088da89205b8d434b ****/
		%feature("compactdefaultargs") GetFFGeometry;
		%feature("autodoc", "Search for g = geometry of point which is identical to <dsp> among the ds points created in the current face/face intersection ( current insert() call).

Parameters
----------
DSP: TopOpeBRepDS_Point
K: TopOpeBRepDS_Kind

Returns
-------
G: int
") GetFFGeometry;
		Standard_Boolean GetFFGeometry(const TopOpeBRepDS_Point & DSP, TopOpeBRepDS_Kind & K, Standard_Integer &OutValue);

		/****************** GetFFGeometry ******************/
		/**** md5 signature: a2549ea89cd75ad5dfb9c3a9a51ed9c6 ****/
		%feature("compactdefaultargs") GetFFGeometry;
		%feature("autodoc", "Search for g = geometry of point which is identical to <vp> among the ds points created in the current face/face intersection ( current insert() call).

Parameters
----------
VP: TopOpeBRep_VPointInter
K: TopOpeBRepDS_Kind

Returns
-------
G: int
") GetFFGeometry;
		Standard_Boolean GetFFGeometry(const TopOpeBRep_VPointInter & VP, TopOpeBRepDS_Kind & K, Standard_Integer &OutValue);

		/****************** GetGeometry ******************/
		/**** md5 signature: ea08ea8cc09a4de2f0d12bd1814a3436 ****/
		%feature("compactdefaultargs") GetGeometry;
		%feature("autodoc", "Get the geometry of a ds point <dsp>. search for it with scaninterflist (previous method). if found, set <g> to the geometry of the interference found. else, add the point <dsp> in the <ds> and set <g> to the value of the new geometry such created. returns the value of scaninterflist().

Parameters
----------
IT: TopOpeBRepDS_ListIteratorOfListOfInterference
VP: TopOpeBRep_VPointInter
K: TopOpeBRepDS_Kind

Returns
-------
G: int
") GetGeometry;
		Standard_Boolean GetGeometry(TopOpeBRepDS_ListIteratorOfListOfInterference & IT, const TopOpeBRep_VPointInter & VP, Standard_Integer &OutValue, TopOpeBRepDS_Kind & K);

		/****************** GetTraceIndex ******************/
		/**** md5 signature: 9515d5e22d4204dd0a3c74673d23b180 ****/
		%feature("compactdefaultargs") GetTraceIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
exF1: int
exF2: int
") GetTraceIndex;
		void GetTraceIndex(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** HDataStructure ******************/
		/**** md5 signature: c8d98611444c2e86125ddbdf732dc7ac ****/
		%feature("compactdefaultargs") HDataStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") HDataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> HDataStructure();

		/****************** Insert ******************/
		/**** md5 signature: 6e7ad6ed7342d2f8a533b4ef790303de ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Stores in <ds> the intersections of <s1> and <s2>.

Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
FACINT: TopOpeBRep_FacesIntersector
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Insert;
		void Insert(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopOpeBRep_FacesIntersector & FACINT, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** IsVPtransLok ******************/
		/**** md5 signature: 8c7d876f7974edd31c94d147a2e292fe ****/
		%feature("compactdefaultargs") IsVPtransLok;
		%feature("autodoc", "Computes the transition <t> of the vpoint <ivp> on the edge of <si12>. returns <false> if the status is unknown.

Parameters
----------
L: TopOpeBRep_LineInter
iVP: int
SI12: int
T: TopOpeBRepDS_Transition

Returns
-------
bool
") IsVPtransLok;
		static Standard_Boolean IsVPtransLok(const TopOpeBRep_LineInter & L, const Standard_Integer iVP, const Standard_Integer SI12, TopOpeBRepDS_Transition & T);

		/****************** LSameDomainERL ******************/
		/**** md5 signature: f1218c16715526d12a247c1a2487174e ****/
		%feature("compactdefaultargs") LSameDomainERL;
		%feature("autodoc", "Returns <true> if <l> shares a same geometric domain with at least one of the section edges of <erl>.

Parameters
----------
L: TopOpeBRep_LineInter
ERL: TopTools_ListOfShape

Returns
-------
bool
") LSameDomainERL;
		static Standard_Boolean LSameDomainERL(const TopOpeBRep_LineInter & L, const TopTools_ListOfShape & ERL);

		/****************** Lminmax ******************/
		/**** md5 signature: 9feef7c9d75bcc96c90ba5d847e4d3dc ****/
		%feature("compactdefaultargs") Lminmax;
		%feature("autodoc", "Computes <pmin> and <pmax> the upper and lower bounds of <l> enclosing all vpoints.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
pmin: float
pmax: float
") Lminmax;
		static void Lminmax(const TopOpeBRep_LineInter & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** LoadLine ******************/
		/**** md5 signature: eea790a75362816ecedd96c5ef6cdcd0 ****/
		%feature("compactdefaultargs") LoadLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
None
") LoadLine;
		void LoadLine(TopOpeBRep_LineInter & L);

		/****************** MakeGeometry ******************/
		/**** md5 signature: dee7966b35c4f403dec75410d5e39503 ****/
		%feature("compactdefaultargs") MakeGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
VP: TopOpeBRep_VPointInter
ShapeIndex: int
K: TopOpeBRepDS_Kind

Returns
-------
int
") MakeGeometry;
		Standard_Integer MakeGeometry(const TopOpeBRep_VPointInter & VP, const Standard_Integer ShapeIndex, TopOpeBRepDS_Kind & K);

		/****************** PDataStructureDummy ******************/
		/**** md5 signature: a50961b93febbb413cbacfb55e6e0326 ****/
		%feature("compactdefaultargs") PDataStructureDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_PDataStructure
") PDataStructureDummy;
		TopOpeBRepDS_PDataStructure PDataStructureDummy();

		/****************** PFacesIntersectorDummy ******************/
		/**** md5 signature: 60c9cb7edbde9c65a0f53236e49d9e32 ****/
		%feature("compactdefaultargs") PFacesIntersectorDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PFacesIntersector
") PFacesIntersectorDummy;
		TopOpeBRep_PFacesIntersector PFacesIntersectorDummy();

		/****************** PLineInterDummy ******************/
		/**** md5 signature: 20d21f153b52d5c38ce7cf68a51ddad1 ****/
		%feature("compactdefaultargs") PLineInterDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PLineInter
") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy();

		/****************** PShapeClassifier ******************/
		/**** md5 signature: 839210bbffc66c6dadfa1a9483c467a7 ****/
		%feature("compactdefaultargs") PShapeClassifier;
		%feature("autodoc", "Return field mypshapeclassifier.

Returns
-------
TopOpeBRepTool_PShapeClassifier
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier();

		/****************** ProcessLine ******************/
		/**** md5 signature: 3fbc964cc3fd1ea2f783d3e9ccabb255 ****/
		%feature("compactdefaultargs") ProcessLine;
		%feature("autodoc", "Process current intersection line (set by loadline).

Returns
-------
None
") ProcessLine;
		void ProcessLine();

		/****************** ProcessRLine ******************/
		/**** md5 signature: 68792d07a6e6485b962014cb805439b1 ****/
		%feature("compactdefaultargs") ProcessRLine;
		%feature("autodoc", "Process current restriction line, adding restriction edge and computing face/edge interference.

Returns
-------
None
") ProcessRLine;
		void ProcessRLine();

		/****************** ProcessSectionEdges ******************/
		/**** md5 signature: 56500a0036691121fcecf788e2ff59eb ****/
		%feature("compactdefaultargs") ProcessSectionEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessSectionEdges;
		void ProcessSectionEdges();

		/****************** ProcessVPInotonR ******************/
		/**** md5 signature: f8366746a2b1ab05fab2f26f1647dde8 ****/
		%feature("compactdefaultargs") ProcessVPInotonR;
		%feature("autodoc", "Processing processvpnotonr for vpi.

Parameters
----------
VPI: TopOpeBRep_VPointInterIterator

Returns
-------
None
") ProcessVPInotonR;
		void ProcessVPInotonR(TopOpeBRep_VPointInterIterator & VPI);

		/****************** ProcessVPIonR ******************/
		/**** md5 signature: 7b2711e44f83d0ba476600a5ab327ccc ****/
		%feature("compactdefaultargs") ProcessVPIonR;
		%feature("autodoc", "Processing processvponr for vpi.

Parameters
----------
VPI: TopOpeBRep_VPointInterIterator
trans1: TopOpeBRepDS_Transition
F1: TopoDS_Shape
ShapeIndex: int

Returns
-------
None
") ProcessVPIonR;
		void ProcessVPIonR(TopOpeBRep_VPointInterIterator & VPI, const TopOpeBRepDS_Transition & trans1, const TopoDS_Shape & F1, const Standard_Integer ShapeIndex);

		/****************** ProcessVPR ******************/
		/**** md5 signature: 78c845a2afa36d137735133e5b7c3482 ****/
		%feature("compactdefaultargs") ProcessVPR;
		%feature("autodoc", "Calling the followings processvpionr and processvponr.

Parameters
----------
FF: TopOpeBRep_FacesFiller
VP: TopOpeBRep_VPointInter

Returns
-------
None
") ProcessVPR;
		void ProcessVPR(TopOpeBRep_FacesFiller & FF, const TopOpeBRep_VPointInter & VP);

		/****************** ProcessVPnotonR ******************/
		/**** md5 signature: fd4b0946e4dcdeb25ebaf9c54ac58450 ****/
		%feature("compactdefaultargs") ProcessVPnotonR;
		%feature("autodoc", "Adds <vp>'s geometrical point to the ds (if not stored) and computes curve point interference.

Parameters
----------
VP: TopOpeBRep_VPointInter

Returns
-------
None
") ProcessVPnotonR;
		void ProcessVPnotonR(const TopOpeBRep_VPointInter & VP);

		/****************** ProcessVPonR ******************/
		/**** md5 signature: 169572cd2179643dc8d8179740548277 ****/
		%feature("compactdefaultargs") ProcessVPonR;
		%feature("autodoc", "Adds <vp>'s geometric point (if not stored) and computes (curve or edge)/(point or vertex) interference.

Parameters
----------
VP: TopOpeBRep_VPointInter
trans1: TopOpeBRepDS_Transition
F1: TopoDS_Shape
ShapeIndex: int

Returns
-------
None
") ProcessVPonR;
		void ProcessVPonR(const TopOpeBRep_VPointInter & VP, const TopOpeBRepDS_Transition & trans1, const TopoDS_Shape & F1, const Standard_Integer ShapeIndex);

		/****************** ProcessVPonclosingR ******************/
		/**** md5 signature: 02a558e7420235213db89b5fd3ab05b9 ****/
		%feature("compactdefaultargs") ProcessVPonclosingR;
		%feature("autodoc", "Vp processing on closing arc.

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

Returns
-------
None
") ProcessVPonclosingR;
		void ProcessVPonclosingR(const TopOpeBRep_VPointInter & VP, const TopoDS_Shape & F1, const Standard_Integer ShapeIndex, const TopOpeBRepDS_Transition & transEdge, const TopOpeBRepDS_Kind PVKind, const Standard_Integer PVIndex, const Standard_Boolean EPIfound, const opencascade::handle<TopOpeBRepDS_Interference> & IEPI);

		/****************** ProcessVPondgE ******************/
		/**** md5 signature: f97d3783ba8b73defc2b95d640ac9392 ****/
		%feature("compactdefaultargs") ProcessVPondgE;
		%feature("autodoc", "Vp processing on degenerated arc.

Parameters
----------
VP: TopOpeBRep_VPointInter
ShapeIndex: int
PVKind: TopOpeBRepDS_Kind
IEPI: TopOpeBRepDS_Interference
ICPI: TopOpeBRepDS_Interference

Returns
-------
PVIndex: int
EPIfound: bool
CPIfound: bool
") ProcessVPondgE;
		Standard_Boolean ProcessVPondgE(const TopOpeBRep_VPointInter & VP, const Standard_Integer ShapeIndex, TopOpeBRepDS_Kind & PVKind, Standard_Integer &OutValue, Standard_Boolean &OutValue, opencascade::handle<TopOpeBRepDS_Interference> & IEPI, Standard_Boolean &OutValue, opencascade::handle<TopOpeBRepDS_Interference> & ICPI);

		/****************** ResetDSC ******************/
		/**** md5 signature: ea513f4665d6892ab4f58074b0e25b85 ****/
		%feature("compactdefaultargs") ResetDSC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetDSC;
		void ResetDSC();

		/****************** SetPShapeClassifier ******************/
		/**** md5 signature: 593f2e1757de04f9a9b3cad368416ae2 ****/
		%feature("compactdefaultargs") SetPShapeClassifier;
		%feature("autodoc", "Set field mypshapeclassifier.

Parameters
----------
PSC: TopOpeBRepTool_PShapeClassifier

Returns
-------
None
") SetPShapeClassifier;
		void SetPShapeClassifier(const TopOpeBRepTool_PShapeClassifier & PSC);

		/****************** SetTraceIndex ******************/
		/**** md5 signature: 13f9cfa37d1910afdfe7a0465a408ca0 ****/
		%feature("compactdefaultargs") SetTraceIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
exF1: int
exF2: int

Returns
-------
None
") SetTraceIndex;
		void SetTraceIndex(const Standard_Integer exF1, const Standard_Integer exF2);

		/****************** StoreCurveInterference ******************/
		/**** md5 signature: 2f980eafd7d3d5ba80066112e2581773 ****/
		%feature("compactdefaultargs") StoreCurveInterference;
		%feature("autodoc", "Add interference <i> to list mydscil. on a given line, at first call, add a new ds curve.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
") StoreCurveInterference;
		void StoreCurveInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** TransvpOK ******************/
		/**** md5 signature: 2e65e45984169e900552e4241580bf07 ****/
		%feature("compactdefaultargs") TransvpOK;
		%feature("autodoc", "Computes transition on line for vp<ivp> on edge restriction of <si>. if <isinout> : returns <true> if transition computed is in/out else : returns <true> if transition computed is out/in.

Parameters
----------
L: TopOpeBRep_LineInter
iVP: int
SI: int
isINOUT: bool

Returns
-------
bool
") TransvpOK;
		static Standard_Boolean TransvpOK(const TopOpeBRep_LineInter & L, const Standard_Integer iVP, const Standard_Integer SI, const Standard_Boolean isINOUT);

		/****************** VPParamOnER ******************/
		/**** md5 signature: 9b90bb2ae0078f88f784a276c3407d9b ****/
		%feature("compactdefaultargs") VPParamOnER;
		%feature("autodoc", "Returns parameter u of vp on the restriction edge.

Parameters
----------
vp: TopOpeBRep_VPointInter
Lrest: TopOpeBRep_LineInter

Returns
-------
float
") VPParamOnER;
		static Standard_Real VPParamOnER(const TopOpeBRep_VPointInter & vp, const TopOpeBRep_LineInter & Lrest);

		/****************** VP_Position ******************/
		/**** md5 signature: 0161b645f978cf3492855099c4b3bc58 ****/
		%feature("compactdefaultargs") VP_Position;
		%feature("autodoc", "Compute position of vpoints of lines.

Parameters
----------
FACINT: TopOpeBRep_FacesIntersector

Returns
-------
None
") VP_Position;
		void VP_Position(TopOpeBRep_FacesIntersector & FACINT);

		/****************** VP_Position ******************/
		/**** md5 signature: 911653605333bf0a33a4374161a9e101 ****/
		%feature("compactdefaultargs") VP_Position;
		%feature("autodoc", "Compute position of vpoints of line l.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
None
") VP_Position;
		void VP_Position(TopOpeBRep_LineInter & L);

		/****************** VP_Position ******************/
		/**** md5 signature: 1bb505acf40761d4b753ec730a96d166 ****/
		%feature("compactdefaultargs") VP_Position;
		%feature("autodoc", "Compute position of vp with current faces, according to vp.shapeindex() .

Parameters
----------
VP: TopOpeBRep_VPointInter
VPC: TopOpeBRep_VPointInterClassifier

Returns
-------
None
") VP_Position;
		void VP_Position(TopOpeBRep_VPointInter & VP, TopOpeBRep_VPointInterClassifier & VPC);

		/****************** VP_PositionOnL ******************/
		/**** md5 signature: 82f6df9b6ab224e5cd2d64ad6edce4ba ****/
		%feature("compactdefaultargs") VP_PositionOnL;
		%feature("autodoc", "Compute position of vpoints of non-restriction line l.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
None
") VP_PositionOnL;
		void VP_PositionOnL(TopOpeBRep_LineInter & L);

		/****************** VP_PositionOnR ******************/
		/**** md5 signature: 2938fd67159f968c7fc9fcad9a285012 ****/
		%feature("compactdefaultargs") VP_PositionOnR;
		%feature("autodoc", "Compute position of vpoints of restriction line l.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
None
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
		/****************** TopOpeBRep_FacesIntersector ******************/
		/**** md5 signature: a1246bcb1ecd4a3f27c3f757eda41e4e ****/
		%feature("compactdefaultargs") TopOpeBRep_FacesIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FacesIntersector;
		 TopOpeBRep_FacesIntersector();

		/****************** ChangeLine ******************/
		/**** md5 signature: 6db5d320e1ba2a4a70d0ab0dc2a436a1 ****/
		%feature("compactdefaultargs") ChangeLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
IL: int

Returns
-------
TopOpeBRep_LineInter
") ChangeLine;
		TopOpeBRep_LineInter & ChangeLine(const Standard_Integer IL);

		/****************** CurrentLine ******************/
		/**** md5 signature: 22ad0f2ab8e9c56998e748e35926a0d7 ****/
		%feature("compactdefaultargs") CurrentLine;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_LineInter
") CurrentLine;
		TopOpeBRep_LineInter & CurrentLine();

		/****************** CurrentLineIndex ******************/
		/**** md5 signature: f19bf95df37b0021eb2646adce1e031a ****/
		%feature("compactdefaultargs") CurrentLineIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CurrentLineIndex;
		Standard_Integer CurrentLineIndex();

		/****************** Face ******************/
		/**** md5 signature: 369bad292fcb0f7622cfabd8d11dd8db ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns first or second intersected face.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") Face;
		const TopoDS_Shape Face(const Standard_Integer Index);

		/****************** ForceTolerances ******************/
		/**** md5 signature: 2d14f1be2c680c1fee2affa302d3982d ****/
		%feature("compactdefaultargs") ForceTolerances;
		%feature("autodoc", "Force the tolerance values used by the next perform(s1,s2) call.

Parameters
----------
tolarc: float
toltang: float

Returns
-------
None
") ForceTolerances;
		void ForceTolerances(const Standard_Real tolarc, const Standard_Real toltang);

		/****************** GetTolerances ******************/
		/**** md5 signature: e3135196754280b460b25245687c0142 ****/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "Return the tolerance values used in the last perform() call if forcetolerances() has been called, return the given values. if not, return values extracted from shapes.

Parameters
----------

Returns
-------
tolarc: float
toltang: float
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** InitLine ******************/
		/**** md5 signature: f504749d03e20247f91cc71106dd0275 ****/
		%feature("compactdefaultargs") InitLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitLine;
		void InitLine();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: e27f5e4366afc93bf8faeaa27a6a716c ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsRestriction ******************/
		/**** md5 signature: 86ca9d4838401ff362874c10a0ee38a7 ****/
		%feature("compactdefaultargs") IsRestriction;
		%feature("autodoc", "Returns true if edge <e> is found as same as the edge associated with a restriction line.

Parameters
----------
E: TopoDS_Shape

Returns
-------
bool
") IsRestriction;
		Standard_Boolean IsRestriction(const TopoDS_Shape & E);

		/****************** Lines ******************/
		/**** md5 signature: 01266e7e7f05b269e092fe7dd26172d3 ****/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRep_HArray1OfLineInter>
") Lines;
		opencascade::handle<TopOpeBRep_HArray1OfLineInter> Lines();

		/****************** MoreLine ******************/
		/**** md5 signature: 0a27b6187736d1f555ac7a8353bb0b67 ****/
		%feature("compactdefaultargs") MoreLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreLine;
		Standard_Boolean MoreLine();

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NextLine ******************/
		/**** md5 signature: b8bc90c0a38dfd7cf995d23f5a22c531 ****/
		%feature("compactdefaultargs") NextLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextLine;
		void NextLine();

		/****************** Perform ******************/
		/**** md5 signature: 53c01bc5ada2f9f4b7461289783e5dd0 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the intersection of faces s1 and s2.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** Perform ******************/
		/**** md5 signature: a342eb0cb7b86e306ff5999ed2a07d3a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the intersection of faces s1 and s2.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
B1: Bnd_Box
B2: Bnd_Box

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Bnd_Box & B1, const Bnd_Box & B2);

		/****************** PrepareLines ******************/
		/**** md5 signature: 9bd4c3ce6c8a89ec456ee13414be072c ****/
		%feature("compactdefaultargs") PrepareLines;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PrepareLines;
		void PrepareLines();

		/****************** Restrictions ******************/
		/**** md5 signature: f234d515696e6af4ddedecbc4c8a5f42 ****/
		%feature("compactdefaultargs") Restrictions;
		%feature("autodoc", "Returns the map of edges found as topebrepbrep_restriction.

Returns
-------
TopTools_IndexedMapOfShape
") Restrictions;
		const TopTools_IndexedMapOfShape & Restrictions();

		/****************** SameDomain ******************/
		/**** md5 signature: ceba397eccbd28c4c6715ac85077480f ****/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Returns true if perform() arguments are two faces with the same surface.

Returns
-------
bool
") SameDomain;
		Standard_Boolean SameDomain();

		/****************** SurfacesSameOriented ******************/
		/**** md5 signature: 5a73f090b826c38dcc30efe0cb99df4e ****/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "Returns true if perform() arguments are two faces samedomain() and normals on both side. raise if samedomain is false.

Returns
-------
bool
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
		/****************** MakeBSpline1fromWALKING2d ******************/
		/**** md5 signature: bdd02d7356022aa42abdf98db72e263b ****/
		%feature("compactdefaultargs") MakeBSpline1fromWALKING2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRep_LineInter
SI: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") MakeBSpline1fromWALKING2d;
		static opencascade::handle<Geom2d_Curve> MakeBSpline1fromWALKING2d(const TopOpeBRep_LineInter & L, const Standard_Integer SI);

		/****************** MakeBSpline1fromWALKING3d ******************/
		/**** md5 signature: 3593e48ce5e0e3053107098c205052b2 ****/
		%feature("compactdefaultargs") MakeBSpline1fromWALKING3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRep_LineInter

Returns
-------
opencascade::handle<Geom_Curve>
") MakeBSpline1fromWALKING3d;
		static opencascade::handle<Geom_Curve> MakeBSpline1fromWALKING3d(const TopOpeBRep_LineInter & L);

		/****************** MakeCurve ******************/
		/**** md5 signature: 4a924a044c9b51a050231444cd72089d ****/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
min: float
max: float
L: TopOpeBRep_LineInter
C: Geom_Curve

Returns
-------
None
") MakeCurve;
		static void MakeCurve(const Standard_Real min, const Standard_Real max, const TopOpeBRep_LineInter & L, opencascade::handle<Geom_Curve> & C);

		/****************** MakeCurves ******************/
		/**** md5 signature: 7fb07fc5d2ca8d73b03a1d36c2a0be14 ****/
		%feature("compactdefaultargs") MakeCurves;
		%feature("autodoc", "Make the ds curve <c> and the pcurves <pc1,pc2> from intersection line <l> lying on shapes <s1,s2>. <min,max> = <l> bounds.

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

Returns
-------
None
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
		/****************** TopOpeBRep_Hctxee2d ******************/
		/**** md5 signature: cf07b95fc0e8d217a7f947f943209d5f ****/
		%feature("compactdefaultargs") TopOpeBRep_Hctxee2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Hctxee2d;
		 TopOpeBRep_Hctxee2d();

		/****************** Curve ******************/
		/**** md5 signature: c1f28875a0a3d2ff71dbd24a39eef5e9 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve(const Standard_Integer I);

		/****************** Domain ******************/
		/**** md5 signature: 61e11500fa994362ee7273166a3b2637 ****/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
IntRes2d_Domain
") Domain;
		const IntRes2d_Domain & Domain(const Standard_Integer I);

		/****************** Edge ******************/
		/**** md5 signature: 69a02b36daf6e7cb7791cc5ef6d9ffd2 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Edge;
		const TopoDS_Shape Edge(const Standard_Integer I);

		/****************** SetEdges ******************/
		/**** md5 signature: 5b4a54aa25f38c9fe3d320ab9fa6246e ****/
		%feature("compactdefaultargs") SetEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
BAS1: BRepAdaptor_Surface
BAS2: BRepAdaptor_Surface

Returns
-------
None
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
		/****************** TopOpeBRep_Hctxff2d ******************/
		/**** md5 signature: c900185e9665ec0fe9e61f90e1821abd ****/
		%feature("compactdefaultargs") TopOpeBRep_Hctxff2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Hctxff2d;
		 TopOpeBRep_Hctxff2d();

		/****************** Face ******************/
		/**** md5 signature: d1eb857c2a65e9d3cb2fc51a7ab45063 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face(const Standard_Integer I);

		/****************** FaceSameOrientedWithRef ******************/
		/**** md5 signature: eabad6eab07a6570fb8ec3a5ead85287 ****/
		%feature("compactdefaultargs") FaceSameOrientedWithRef;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") FaceSameOrientedWithRef;
		Standard_Boolean FaceSameOrientedWithRef(const Standard_Integer I);

		/****************** FacesSameOriented ******************/
		/**** md5 signature: 435f628c00049ebc1d70e1ce34bc8025 ****/
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FacesSameOriented;
		Standard_Boolean FacesSameOriented();

		/****************** GetMaxTolerance ******************/
		/**** md5 signature: f77adca7b5ab816088f00a6b2e5855fd ****/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMaxTolerance;
		Standard_Real GetMaxTolerance();

		/****************** GetTolerances ******************/
		/**** md5 signature: cd77b1128c4393a929e11a161d176312 ****/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Tol1: float
Tol2: float
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HSurface ******************/
		/**** md5 signature: be69eb6e5c513c3b9ee845a84d9411f0 ****/
		%feature("compactdefaultargs") HSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
opencascade::handle<BRepAdaptor_HSurface>
") HSurface;
		opencascade::handle<BRepAdaptor_HSurface> HSurface(const Standard_Integer I);

		/****************** SetFaces ******************/
		/**** md5 signature: 46dc023c2aed2e35da6777aafef31609 ****/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") SetFaces;
		void SetFaces(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** SetHSurfaces ******************/
		/**** md5 signature: 802ed6d71a195f08d95be0ca2619f6eb ****/
		%feature("compactdefaultargs") SetHSurfaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: BRepAdaptor_HSurface
S2: BRepAdaptor_HSurface

Returns
-------
None
") SetHSurfaces;
		void SetHSurfaces(const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<BRepAdaptor_HSurface> & S2);

		/****************** SetTolerances ******************/
		/**** md5 signature: 6873711acb65a77b1d3cb30885ac1fe9 ****/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol1: float
Tol2: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** SurfacesSameOriented ******************/
		/**** md5 signature: 5a73f090b826c38dcc30efe0cb99df4e ****/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		/****************** TopOpeBRep_LineInter ******************/
		/**** md5 signature: feb7593e0f935d571f3784b3f4b91879 ****/
		%feature("compactdefaultargs") TopOpeBRep_LineInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_LineInter;
		 TopOpeBRep_LineInter();

		/****************** Arc ******************/
		/**** md5 signature: a92581f6dce42e6d73dd51bef85c647a ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the edge of a restriction line (or a null edge).

Returns
-------
TopoDS_Shape
") Arc;
		const TopoDS_Shape Arc();

		/****************** ArcIsEdge ******************/
		/**** md5 signature: 3bb4c1b64cbe7447bc7c8619bac1a4b1 ****/
		%feature("compactdefaultargs") ArcIsEdge;
		%feature("autodoc", "Returns true if arc() edge (of a restriction line) is an edge of the original face <index> (1 or 2).

Parameters
----------
I: int

Returns
-------
bool
") ArcIsEdge;
		Standard_Boolean ArcIsEdge(const Standard_Integer I);

		/****************** Bounds ******************/
		/**** md5 signature: 4af317f32b83e7cef138da63fad9c2b0 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
f: float
l: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ChangeVPoint ******************/
		/**** md5 signature: 14d4309f2053822cc1a695ae7c54a7ad ****/
		%feature("compactdefaultargs") ChangeVPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRep_VPointInter
") ChangeVPoint;
		TopOpeBRep_VPointInter & ChangeVPoint(const Standard_Integer I);

		/****************** ComputeFaceFaceTransition ******************/
		/**** md5 signature: 26ed70b18bcf2712b23b8d4def2a445e ****/
		%feature("compactdefaultargs") ComputeFaceFaceTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeFaceFaceTransition;
		void ComputeFaceFaceTransition();

		/****************** Curve ******************/
		/**** md5 signature: 1f3ec5c59b9daebd9920b1e8b066a7ca ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		opencascade::handle<Geom_Curve> Curve();

		/****************** Curve ******************/
		/**** md5 signature: ea107b775c04ffc9d9d2f73bc7749d01 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
parmin: float
parmax: float

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		opencascade::handle<Geom_Curve> Curve(const Standard_Real parmin, const Standard_Real parmax);

		/****************** DumpBipoint ******************/
		/**** md5 signature: 6325b4d4f4e4a71fd5e87f7de2c6ef7d ****/
		%feature("compactdefaultargs") DumpBipoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: TopOpeBRep_Bipoint
s1: TCollection_AsciiString
s2: TCollection_AsciiString

Returns
-------
None
") DumpBipoint;
		void DumpBipoint(const TopOpeBRep_Bipoint & B, const TCollection_AsciiString & s1, const TCollection_AsciiString & s2);


        %feature("autodoc", "1");
        %extend{
            std::string DumpLineTransitionsToString() {
            std::stringstream s;
            self->DumpLineTransitions(s);
            return s.str();}
        };
		/****************** DumpType ******************/
		/**** md5 signature: b34c01a6723403b4978ae19d96842616 ****/
		%feature("compactdefaultargs") DumpType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DumpType;
		void DumpType();

		/****************** DumpVPoint ******************/
		/**** md5 signature: 6208394255135ad9c5fefef57aaa6b25 ****/
		%feature("compactdefaultargs") DumpVPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
s1: TCollection_AsciiString
s2: TCollection_AsciiString

Returns
-------
None
") DumpVPoint;
		void DumpVPoint(const Standard_Integer I, const TCollection_AsciiString & s1, const TCollection_AsciiString & s2);

		/****************** FaceFaceTransition ******************/
		/**** md5 signature: 83ffefbe5b8ae65ccfae12ac03265cee ****/
		%feature("compactdefaultargs") FaceFaceTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Transition
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition(const Standard_Integer I);

		/****************** GetTraceIndex ******************/
		/**** md5 signature: 9515d5e22d4204dd0a3c74673d23b180 ****/
		%feature("compactdefaultargs") GetTraceIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
exF1: int
exF2: int
") GetTraceIndex;
		void GetTraceIndex(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** HasVInternal ******************/
		/**** md5 signature: 3bb457040e2d8daf9eef509552071165 ****/
		%feature("compactdefaultargs") HasVInternal;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasVInternal;
		Standard_Boolean HasVInternal();

		/****************** HasVPonR ******************/
		/**** md5 signature: 310d1ad2c3487ad7ff07a44f1150bfd5 ****/
		%feature("compactdefaultargs") HasVPonR;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasVPonR;
		Standard_Boolean HasVPonR();

		/****************** INL ******************/
		/**** md5 signature: 89a074055e3292c077fb3179be7b61f3 ****/
		%feature("compactdefaultargs") INL;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") INL;
		Standard_Boolean INL();

		/****************** Index ******************/
		/**** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") Index;
		void Index(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsVClosed ******************/
		/**** md5 signature: 270ac1341783e48f1a0f14434f1599d3 ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** LineG ******************/
		/**** md5 signature: 01de5629a31aa00cf28e96dba213041f ****/
		%feature("compactdefaultargs") LineG;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntPatch_GLine>
") LineG;
		const opencascade::handle<IntPatch_GLine> & LineG();

		/****************** LineR ******************/
		/**** md5 signature: 08be29905e87571f8683725d0177250c ****/
		%feature("compactdefaultargs") LineR;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntPatch_RLine>
") LineR;
		const opencascade::handle<IntPatch_RLine> & LineR();

		/****************** LineW ******************/
		/**** md5 signature: ddd6c649218181f4d6abebf82cea5563 ****/
		%feature("compactdefaultargs") LineW;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntPatch_WLine>
") LineW;
		const opencascade::handle<IntPatch_WLine> & LineW();

		/****************** NbVPoint ******************/
		/**** md5 signature: 2ea09ca7a3e5398df1519c0980229c14 ****/
		%feature("compactdefaultargs") NbVPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoint;
		Standard_Integer NbVPoint();

		/****************** NbWPoint ******************/
		/**** md5 signature: d84b1d26c3bbf033ef91f4e52100fb03 ****/
		%feature("compactdefaultargs") NbWPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbWPoint;
		Standard_Integer NbWPoint();

		/****************** OK ******************/
		/**** md5 signature: 8bc639ad68d0ce206834efca23e02e2d ****/
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OK;
		Standard_Boolean OK();

		/****************** Period ******************/
		/**** md5 signature: 0270204961d3b0052ffe029cbcdbacd9 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** SetFaces ******************/
		/**** md5 signature: 46dc023c2aed2e35da6777aafef31609 ****/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") SetFaces;
		void SetFaces(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** SetHasVPonR ******************/
		/**** md5 signature: db52cdfdcc899bff6b5002498e13bb03 ****/
		%feature("compactdefaultargs") SetHasVPonR;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetHasVPonR;
		void SetHasVPonR();

		/****************** SetINL ******************/
		/**** md5 signature: 1e6337a2c38c435aa474d60eae7fb4e0 ****/
		%feature("compactdefaultargs") SetINL;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetINL;
		void SetINL();

		/****************** SetIsVClosed ******************/
		/**** md5 signature: 7e0b5519dc46f8dfce21789f2ba43054 ****/
		%feature("compactdefaultargs") SetIsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetIsVClosed;
		void SetIsVClosed();

		/****************** SetLine ******************/
		/**** md5 signature: ffdaea04056ed0f892cad9b6d3ed4ae0 ****/
		%feature("compactdefaultargs") SetLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntPatch_Line
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface

Returns
-------
None
") SetLine;
		void SetLine(const opencascade::handle<IntPatch_Line> & L, const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2);

		/****************** SetOK ******************/
		/**** md5 signature: e2450971393f163d48b7f0293dc3348f ****/
		%feature("compactdefaultargs") SetOK;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") SetOK;
		void SetOK(const Standard_Boolean B);

		/****************** SetTraceIndex ******************/
		/**** md5 signature: 13f9cfa37d1910afdfe7a0465a408ca0 ****/
		%feature("compactdefaultargs") SetTraceIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
exF1: int
exF2: int

Returns
-------
None
") SetTraceIndex;
		void SetTraceIndex(const Standard_Integer exF1, const Standard_Integer exF2);

		/****************** SetVPBounds ******************/
		/**** md5 signature: 2aa0ef807679effc95727c0e40d084fd ****/
		%feature("compactdefaultargs") SetVPBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetVPBounds;
		void SetVPBounds();

		/****************** SituationS1 ******************/
		/**** md5 signature: af2d2dd713ae3b820482546cf4a82d7b ****/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Situation
") SituationS1;
		IntSurf_Situation SituationS1();

		/****************** SituationS2 ******************/
		/**** md5 signature: da9cc8795913744eb08fbe6bf499827b ****/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Situation
") SituationS2;
		IntSurf_Situation SituationS2();

		/****************** TransitionOnS1 ******************/
		/**** md5 signature: 9de184f3b47c2902be7de5eb10743898 ****/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		/**** md5 signature: aafa064949332278d0d49be3da4c6df2 ****/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2();

		/****************** TypeLineCurve ******************/
		/**** md5 signature: 4355930a797a6f3cb5e2211b13c345bb ****/
		%feature("compactdefaultargs") TypeLineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_TypeLineCurve
") TypeLineCurve;
		TopOpeBRep_TypeLineCurve TypeLineCurve();

		/****************** VPBounds ******************/
		/**** md5 signature: b702d5162ec5f574dd602b9a65d91545 ****/
		%feature("compactdefaultargs") VPBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
f: int
l: int
n: int
") VPBounds;
		void VPBounds(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** VPoint ******************/
		/**** md5 signature: 1510e3ed35585561758acd47757f2f3e ****/
		%feature("compactdefaultargs") VPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRep_VPointInter
") VPoint;
		const TopOpeBRep_VPointInter & VPoint(const Standard_Integer I);

		/****************** WPoint ******************/
		/**** md5 signature: fb66a29b8bdd784fd0b851b001b22951 ****/
		%feature("compactdefaultargs") WPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRep_WPointInter
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
		/****************** TopOpeBRep_Point2d ******************/
		/**** md5 signature: a4e5464aee16654824387f8abcf81377 ****/
		%feature("compactdefaultargs") TopOpeBRep_Point2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Point2d;
		 TopOpeBRep_Point2d();

		/****************** ChangeTransition ******************/
		/**** md5 signature: c3cf99c4d845bce2a15b3a78287ceda1 ****/
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Transition
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition(const Standard_Integer I);

		/****************** Dump ******************/
		/**** md5 signature: 48fe6005532e1061cfa557e995f40a8d ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ie1: int,optional
	default value is 0
ie2: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer ie1 = 0, const Standard_Integer ie2 = 0);

		/****************** EdgesConfig ******************/
		/**** md5 signature: 17c4c833ec338e68df2a3490937ab9c9 ****/
		%feature("compactdefaultargs") EdgesConfig;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Config
") EdgesConfig;
		TopOpeBRepDS_Config EdgesConfig();

		/****************** HasPint ******************/
		/**** md5 signature: 18a0ea3877f1678f8937dbc9db035589 ****/
		%feature("compactdefaultargs") HasPint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPint;
		Standard_Boolean HasPint();

		/****************** Hctxee2d ******************/
		/**** md5 signature: 2a9387824cce3a91254c1d88d2c14560 ****/
		%feature("compactdefaultargs") Hctxee2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRep_Hctxee2d>
") Hctxee2d;
		opencascade::handle<TopOpeBRep_Hctxee2d> Hctxee2d();

		/****************** Hctxff2d ******************/
		/**** md5 signature: 633f2a368cfb49bc92e0495cc2657538 ****/
		%feature("compactdefaultargs") Hctxff2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRep_Hctxff2d>
") Hctxff2d;
		opencascade::handle<TopOpeBRep_Hctxff2d> Hctxff2d();

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsPointOfSegment ******************/
		/**** md5 signature: 6e7cde438083e0131a9a0a61b85d04e4 ****/
		%feature("compactdefaultargs") IsPointOfSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPointOfSegment;
		Standard_Boolean IsPointOfSegment();

		/****************** IsVertex ******************/
		/**** md5 signature: 086fc030883417cdd3233687cd7fbc88 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex(const Standard_Integer I);

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Parameter ******************/
		/**** md5 signature: ca856d1dd4727b19b3047127cded267f ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer I);

		/****************** Pint ******************/
		/**** md5 signature: 72d1656dc63f7ec33684d937246a1ad3 ****/
		%feature("compactdefaultargs") Pint;
		%feature("autodoc", "No available documentation.

Returns
-------
IntRes2d_IntersectionPoint
") Pint;
		const IntRes2d_IntersectionPoint & Pint();

		/****************** SegmentAncestors ******************/
		/**** md5 signature: 807576e7187cb2ee3da46f58c52b06dd ****/
		%feature("compactdefaultargs") SegmentAncestors;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
IP1: int
IP2: int
") SegmentAncestors;
		Standard_Boolean SegmentAncestors(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetEdgesConfig ******************/
		/**** md5 signature: 715d2cfe9bf9319193e7cd80c47ee60c ****/
		%feature("compactdefaultargs") SetEdgesConfig;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Config

Returns
-------
None
") SetEdgesConfig;
		void SetEdgesConfig(const TopOpeBRepDS_Config C);

		/****************** SetHctxee2d ******************/
		/**** md5 signature: 4354bbd1eee37ab87a6c60d7d6384d02 ****/
		%feature("compactdefaultargs") SetHctxee2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
ee2d: TopOpeBRep_Hctxee2d

Returns
-------
None
") SetHctxee2d;
		void SetHctxee2d(const opencascade::handle<TopOpeBRep_Hctxee2d> & ee2d);

		/****************** SetHctxff2d ******************/
		/**** md5 signature: 65897b041e053e60cc80ae5efee30fd2 ****/
		%feature("compactdefaultargs") SetHctxff2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
ff2d: TopOpeBRep_Hctxff2d

Returns
-------
None
") SetHctxff2d;
		void SetHctxff2d(const opencascade::handle<TopOpeBRep_Hctxff2d> & ff2d);

		/****************** SetIndex ******************/
		/**** md5 signature: 866045f938b17bb34e73a6920885e27f ****/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer X);

		/****************** SetIsPointOfSegment ******************/
		/**** md5 signature: ec0cc3dca1354854c12eef529d8596bc ****/
		%feature("compactdefaultargs") SetIsPointOfSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") SetIsPointOfSegment;
		void SetIsPointOfSegment(const Standard_Boolean B);

		/****************** SetIsVertex ******************/
		/**** md5 signature: 7bdfe12c28908f71a2fc9856d407ee22 ****/
		%feature("compactdefaultargs") SetIsVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
B: bool

Returns
-------
None
") SetIsVertex;
		void SetIsVertex(const Standard_Integer I, const Standard_Boolean B);

		/****************** SetKeep ******************/
		/**** md5 signature: 1092aa2a984bcd4f4f9f5f5c7e1ac2f4 ****/
		%feature("compactdefaultargs") SetKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") SetKeep;
		void SetKeep(const Standard_Boolean B);

		/****************** SetParameter ******************/
		/**** md5 signature: 9ee049156e663e585a2306d90902c7b4 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
P: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Integer I, const Standard_Real P);

		/****************** SetPint ******************/
		/**** md5 signature: c984cf763fe8e993abc8ec8f71dae9b1 ****/
		%feature("compactdefaultargs") SetPint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: IntRes2d_IntersectionPoint

Returns
-------
None
") SetPint;
		void SetPint(const IntRes2d_IntersectionPoint & P);

		/****************** SetSegmentAncestors ******************/
		/**** md5 signature: 9e1d7c4ffc41f72a7fcfaaa45ac04f8e ****/
		%feature("compactdefaultargs") SetSegmentAncestors;
		%feature("autodoc", "No available documentation.

Parameters
----------
IP1: int
IP2: int

Returns
-------
None
") SetSegmentAncestors;
		void SetSegmentAncestors(const Standard_Integer IP1, const Standard_Integer IP2);

		/****************** SetStatus ******************/
		/**** md5 signature: 5b48b2875a553440d65a6c6c621956f5 ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopOpeBRep_P2Dstatus

Returns
-------
None
") SetStatus;
		void SetStatus(const TopOpeBRep_P2Dstatus S);

		/****************** SetTolerance ******************/
		/**** md5 signature: 62b1f9563bb5ef42f026a44105a51f90 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real T);

		/****************** SetTransition ******************/
		/**** md5 signature: c4b596bee3ee9ff24eced4060c0a76cd ****/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
T: TopOpeBRepDS_Transition

Returns
-------
None
") SetTransition;
		void SetTransition(const Standard_Integer I, const TopOpeBRepDS_Transition & T);

		/****************** SetValue ******************/
		/**** md5 signature: ba3ffbb2313fcc108d8269b328cdabe1 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P);

		/****************** SetValue2d ******************/
		/**** md5 signature: 012e75d6be249d28b0543c93d3a951de ****/
		%feature("compactdefaultargs") SetValue2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetValue2d;
		void SetValue2d(const gp_Pnt2d & P);

		/****************** SetVertex ******************/
		/**** md5 signature: 7a11f08a6987d3c3cafc8b7e2d96c5e5 ****/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
V: TopoDS_Vertex

Returns
-------
None
") SetVertex;
		void SetVertex(const Standard_Integer I, const TopoDS_Vertex & V);

		/****************** Status ******************/
		/**** md5 signature: 46b4c8557b58504912ea2e39d547deda ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_P2Dstatus
") Status;
		TopOpeBRep_P2Dstatus Status();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Transition ******************/
		/**** md5 signature: 85d653a998e80ca01295d1ede1570169 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Transition
") Transition;
		const TopOpeBRepDS_Transition & Transition(const Standard_Integer I);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Value2d ******************/
		/**** md5 signature: d7f79037e220f7a3b67a03ce99723024 ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") Value2d;
		const gp_Pnt2d Value2d();

		/****************** Vertex ******************/
		/**** md5 signature: 1cd4dfe5cbf55dbe74ca8c7dfb89999c ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Vertex
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
		/****************** TopOpeBRep_PointClassifier ******************/
		/**** md5 signature: 0ce7a351d05c2825b798d2588ba89cbf ****/
		%feature("compactdefaultargs") TopOpeBRep_PointClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_PointClassifier;
		 TopOpeBRep_PointClassifier();

		/****************** Classify ******************/
		/**** md5 signature: 14c5e2a8abedb9ae6844a58bc37ab29e ****/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "Compute position of point <p> regarding with the face <f>.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt2d
Tol: float

Returns
-------
TopAbs_State
") Classify;
		TopAbs_State Classify(const TopoDS_Face & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Load ******************/
		/**** md5 signature: 1d17d2edcb9829efe827b1a9573fcbcc ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Load;
		void Load(const TopoDS_Face & F);

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
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
		/****************** IsEqual ******************/
		/**** md5 signature: c744b0c8522318aa7d6d0a93f5ac495e ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
DSP1: TopOpeBRepDS_Point
DSP2: TopOpeBRepDS_Point

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TopOpeBRepDS_Point & DSP1, const TopOpeBRepDS_Point & DSP2);

		/****************** MakePoint ******************/
		/**** md5 signature: e4964ffd2907637ec47e8e0b0495f31e ****/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IP: TopOpeBRep_VPointInter

Returns
-------
TopOpeBRepDS_Point
") MakePoint;
		static TopOpeBRepDS_Point MakePoint(const TopOpeBRep_VPointInter & IP);

		/****************** MakePoint ******************/
		/**** md5 signature: 64321188c4c4ad217069ababdb8a3796 ****/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P2D: TopOpeBRep_Point2d

Returns
-------
TopOpeBRepDS_Point
") MakePoint;
		static TopOpeBRepDS_Point MakePoint(const TopOpeBRep_Point2d & P2D);

		/****************** MakePoint ******************/
		/**** md5 signature: c79e7532e280555f3ff1763f4dead60c ****/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
FEI: TopOpeBRep_FaceEdgeIntersector

Returns
-------
TopOpeBRepDS_Point
") MakePoint;
		static TopOpeBRepDS_Point MakePoint(const TopOpeBRep_FaceEdgeIntersector & FEI);

		/****************** MakePoint ******************/
		/**** md5 signature: fd389443079eb0a464dc8e06da4a2303 ****/
		%feature("compactdefaultargs") MakePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopOpeBRepDS_Point
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
		/****************** TopOpeBRep_ShapeIntersector ******************/
		/**** md5 signature: 20f306c0c78524b61a5f16c837ec63d0 ****/
		%feature("compactdefaultargs") TopOpeBRep_ShapeIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_ShapeIntersector;
		 TopOpeBRep_ShapeIntersector();

		/****************** ChangeEdgesIntersector ******************/
		/**** md5 signature: 1235fc3fd7575db65944b280b25330c7 ****/
		%feature("compactdefaultargs") ChangeEdgesIntersector;
		%feature("autodoc", "Return the current intersection of two edges.

Returns
-------
TopOpeBRep_EdgesIntersector
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector();

		/****************** ChangeFaceEdgeIntersector ******************/
		/**** md5 signature: 252968b36ec37bf07721105462c97f04 ****/
		%feature("compactdefaultargs") ChangeFaceEdgeIntersector;
		%feature("autodoc", "Return the current intersection of a face and an edge.

Returns
-------
TopOpeBRep_FaceEdgeIntersector
") ChangeFaceEdgeIntersector;
		TopOpeBRep_FaceEdgeIntersector & ChangeFaceEdgeIntersector();

		/****************** ChangeFacesIntersector ******************/
		/**** md5 signature: 09c29fa34bf77993f5e46096b4b26b96 ****/
		%feature("compactdefaultargs") ChangeFacesIntersector;
		%feature("autodoc", "Return the current intersection of two faces.

Returns
-------
TopOpeBRep_FacesIntersector
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector();

		/****************** CurrentGeomShape ******************/
		/**** md5 signature: 7481223e571b135509f19048b145ca50 ****/
		%feature("compactdefaultargs") CurrentGeomShape;
		%feature("autodoc", "Return geometric shape <index> ( = 1 or 2 ) of current intersection.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") CurrentGeomShape;
		const TopoDS_Shape CurrentGeomShape(const Standard_Integer Index);

		/****************** DumpCurrent ******************/
		/**** md5 signature: e02ddf889a96ea3aa8d7e534ecd6a9f3 ****/
		%feature("compactdefaultargs") DumpCurrent;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: int

Returns
-------
None
") DumpCurrent;
		void DumpCurrent(const Standard_Integer K);

		/****************** GetTolerances ******************/
		/**** md5 signature: cd77b1128c4393a929e11a161d176312 ****/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "Return max of intersection tolerances with which facesintersector from topopebrep was working.

Parameters
----------

Returns
-------
tol1: float
tol2: float
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Index ******************/
		/**** md5 signature: 47cb6111c2de8549ff3cb854a67d0e7e ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: int

Returns
-------
int
") Index;
		Standard_Integer Index(const Standard_Integer K);

		/****************** InitIntersection ******************/
		/**** md5 signature: 32572b960992ca40532149c5f4138b9d ****/
		%feature("compactdefaultargs") InitIntersection;
		%feature("autodoc", "Initialize the intersection of shapes s1,s2.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") InitIntersection;
		void InitIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** InitIntersection ******************/
		/**** md5 signature: 71295c2e23706fb131e95931841e2ffb ****/
		%feature("compactdefaultargs") InitIntersection;
		%feature("autodoc", "Initialize the intersection of shapes s1,s2.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") InitIntersection;
		void InitIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** MoreIntersection ******************/
		/**** md5 signature: 75450e74c8586d0bba47da742d01e5b8 ****/
		%feature("compactdefaultargs") MoreIntersection;
		%feature("autodoc", "Returns true if there are more intersection between two the shapes.

Returns
-------
bool
") MoreIntersection;
		Standard_Boolean MoreIntersection();

		/****************** NextIntersection ******************/
		/**** md5 signature: c7daff0a72de42893f05b8f795c72477 ****/
		%feature("compactdefaultargs") NextIntersection;
		%feature("autodoc", "Search for the next intersection between the two shapes.

Returns
-------
None
") NextIntersection;
		void NextIntersection();

		/****************** RejectedFaces ******************/
		/**** md5 signature: e8b60ca61d88b99674fbf67f7b550edc ****/
		%feature("compactdefaultargs") RejectedFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
anObj: TopoDS_Shape
aReference: TopoDS_Shape
aListOfShape: TopTools_ListOfShape

Returns
-------
None
") RejectedFaces;
		void RejectedFaces(const TopoDS_Shape & anObj, const TopoDS_Shape & aReference, TopTools_ListOfShape & aListOfShape);

		/****************** Shape ******************/
		/**** md5 signature: 9490bf72de2629e156b2f9f7c67be648 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return the shape <index> ( = 1 or 2) given to initintersection(). index = 1 will return s1, index = 2 will return s2.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
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
		/****************** TopOpeBRep_ShapeIntersector2d ******************/
		/**** md5 signature: bb2704150c5bd49ed4001ce09dc8dc59 ****/
		%feature("compactdefaultargs") TopOpeBRep_ShapeIntersector2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_ShapeIntersector2d;
		 TopOpeBRep_ShapeIntersector2d();

		/****************** ChangeEdgesIntersector ******************/
		/**** md5 signature: 1235fc3fd7575db65944b280b25330c7 ****/
		%feature("compactdefaultargs") ChangeEdgesIntersector;
		%feature("autodoc", "Return the current intersection of two edges.

Returns
-------
TopOpeBRep_EdgesIntersector
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector();

		/****************** CurrentGeomShape ******************/
		/**** md5 signature: 7481223e571b135509f19048b145ca50 ****/
		%feature("compactdefaultargs") CurrentGeomShape;
		%feature("autodoc", "Return geometric shape <index> ( = 1 or 2 ) of current intersection.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") CurrentGeomShape;
		const TopoDS_Shape CurrentGeomShape(const Standard_Integer Index);

		/****************** DumpCurrent ******************/
		/**** md5 signature: e02ddf889a96ea3aa8d7e534ecd6a9f3 ****/
		%feature("compactdefaultargs") DumpCurrent;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: int

Returns
-------
None
") DumpCurrent;
		void DumpCurrent(const Standard_Integer K);

		/****************** Index ******************/
		/**** md5 signature: 47cb6111c2de8549ff3cb854a67d0e7e ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: int

Returns
-------
int
") Index;
		Standard_Integer Index(const Standard_Integer K);

		/****************** InitIntersection ******************/
		/**** md5 signature: 32572b960992ca40532149c5f4138b9d ****/
		%feature("compactdefaultargs") InitIntersection;
		%feature("autodoc", "Initialize the intersection of shapes s1,s2.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") InitIntersection;
		void InitIntersection(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** MoreIntersection ******************/
		/**** md5 signature: 75450e74c8586d0bba47da742d01e5b8 ****/
		%feature("compactdefaultargs") MoreIntersection;
		%feature("autodoc", "Returns true if there are more intersection between two the shapes.

Returns
-------
bool
") MoreIntersection;
		Standard_Boolean MoreIntersection();

		/****************** NextIntersection ******************/
		/**** md5 signature: c7daff0a72de42893f05b8f795c72477 ****/
		%feature("compactdefaultargs") NextIntersection;
		%feature("autodoc", "Search for the next intersection between the two shapes.

Returns
-------
None
") NextIntersection;
		void NextIntersection();

		/****************** Shape ******************/
		/**** md5 signature: 9490bf72de2629e156b2f9f7c67be648 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return the shape <index> ( = 1 or 2) given to initintersection(). index = 1 will return s1, index = 2 will return s2.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
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
		/****************** TopOpeBRep_ShapeScanner ******************/
		/**** md5 signature: 82a9ee75efa2d73032ba6752f6b249d2 ****/
		%feature("compactdefaultargs") TopOpeBRep_ShapeScanner;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_ShapeScanner;
		 TopOpeBRep_ShapeScanner();

		/****************** AddBoxesMakeCOB ******************/
		/**** md5 signature: a07ac8ca368d90fd9dd48b88e87007c7 ****/
		%feature("compactdefaultargs") AddBoxesMakeCOB;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") AddBoxesMakeCOB;
		void AddBoxesMakeCOB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** BoxSort ******************/
		/**** md5 signature: d84fbab6e90b588ace21537275d98770 ****/
		%feature("compactdefaultargs") BoxSort;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_BoxSort
") BoxSort;
		const TopOpeBRepTool_BoxSort & BoxSort();

		/****************** ChangeBoxSort ******************/
		/**** md5 signature: 26d224aa25e39745d650f44f9742cf04 ****/
		%feature("compactdefaultargs") ChangeBoxSort;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_BoxSort
") ChangeBoxSort;
		TopOpeBRepTool_BoxSort & ChangeBoxSort();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Current ******************/
		/**** md5 signature: b191bf677bf7b52144f20d0821ea8f06 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Current;
		const TopoDS_Shape Current();


        %feature("autodoc", "1");
        %extend{
            std::string DumpCurrentToString() {
            std::stringstream s;
            self->DumpCurrent(s);
            return s.str();}
        };
		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		/**** md5 signature: e1998014ab60e76632d3616164d300f4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & E);

		/****************** Init ******************/
		/**** md5 signature: 062e1f6d6462e055b04c4f09f0be64bc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: TopOpeBRepTool_ShapeExplorer

Returns
-------
None
") Init;
		void Init(TopOpeBRepTool_ShapeExplorer & X);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** TopOpeBRep_VPointInter ******************/
		/**** md5 signature: 445147aa2904424fa8d8622b3021c763 ****/
		%feature("compactdefaultargs") TopOpeBRep_VPointInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_VPointInter;
		 TopOpeBRep_VPointInter();

		/****************** ArcOnS1 ******************/
		/**** md5 signature: edbaad1d35cc20e3c0b6fc1aece17dfb ****/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ArcOnS1;
		const TopoDS_Shape ArcOnS1();

		/****************** ArcOnS2 ******************/
		/**** md5 signature: 1599b619a36c1eabe74ebf38006b69da ****/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ArcOnS2;
		const TopoDS_Shape ArcOnS2();

		/****************** ChangeKeep ******************/
		/**** md5 signature: 337f27b7255256fd364aefe775ca8761 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "Updates vpointinter flag 'keep' with <keep>.

Parameters
----------
keep: bool

Returns
-------
None
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean keep);

		/****************** Edge ******************/
		/**** md5 signature: 69a02b36daf6e7cb7791cc5ef6d9ffd2 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Get the edge of shape i (1,2) containing the point. returned shape is null if the vpoint is not on an edge of shape i (1,2).

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Edge;
		const TopoDS_Shape Edge(const Standard_Integer I);

		/****************** EdgeON ******************/
		/**** md5 signature: 3801af15513f48fe057bea24f0b4c612 ****/
		%feature("compactdefaultargs") EdgeON;
		%feature("autodoc", "Set the shape eon of shape i (1,2) containing the point, and parameter <par> of point on <eon>.

Parameters
----------
Eon: TopoDS_Shape
Par: float
I: int

Returns
-------
None
") EdgeON;
		void EdgeON(const TopoDS_Shape & Eon, const Standard_Real Par, const Standard_Integer I);

		/****************** EdgeON ******************/
		/**** md5 signature: d37dbd316338f91f7a4148fac4a4b700 ****/
		%feature("compactdefaultargs") EdgeON;
		%feature("autodoc", "Get the edge of shape i (1,2) containing the point.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") EdgeON;
		const TopoDS_Shape EdgeON(const Standard_Integer I);

		/****************** EdgeONParameter ******************/
		/**** md5 signature: 29ed1e5977d9b693f3fdeb7599a5d671 ****/
		%feature("compactdefaultargs") EdgeONParameter;
		%feature("autodoc", "Get the parameter on edge of shape i (1,2) containing the point.

Parameters
----------
I: int

Returns
-------
float
") EdgeONParameter;
		Standard_Real EdgeONParameter(const Standard_Integer I);

		/****************** EdgeParameter ******************/
		/**** md5 signature: e619f0a93316cfaaf96f2d6714dbd290 ****/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Get the parameter on edge of shape i (1,2) containing the point.

Parameters
----------
I: int

Returns
-------
float
") EdgeParameter;
		Standard_Real EdgeParameter(const Standard_Integer I);

		/****************** EqualpP ******************/
		/**** md5 signature: e25e4b6710ace9acfd8ce6670df8cd66 ****/
		%feature("compactdefaultargs") EqualpP;
		%feature("autodoc", "Returns <true> if the 3d points and the parameters of the vpoints are same.

Parameters
----------
VP: TopOpeBRep_VPointInter

Returns
-------
bool
") EqualpP;
		Standard_Boolean EqualpP(const TopOpeBRep_VPointInter & VP);

		/****************** GetShapes ******************/
		/**** md5 signature: f83386b9050594750b3cbd4a9b328f40 ****/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
I1: int
I2: int
") GetShapes;
		void GetShapes(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Index ******************/
		/**** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") Index;
		void Index(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsInternal ******************/
		/**** md5 signature: d02f8c187f927a9ba16cc17de3466e18 ****/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsInternal;
		Standard_Boolean IsInternal();

		/****************** IsMultiple ******************/
		/**** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if the point belongs to several intersection lines.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** IsOnDomS1 ******************/
		/**** md5 signature: 73bb79eb09813ce2f78b4a234c9e417b ****/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnDomS1;
		Standard_Boolean IsOnDomS1();

		/****************** IsOnDomS2 ******************/
		/**** md5 signature: 93e8adde96351fec102c7bd4f10efa11 ****/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnDomS2;
		Standard_Boolean IsOnDomS2();

		/****************** IsVertex ******************/
		/**** md5 signature: 086fc030883417cdd3233687cd7fbc88 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex(const Standard_Integer I);

		/****************** IsVertexOnS1 ******************/
		/**** md5 signature: f69812d2258e171cd6e9220af4bdf9a7 ****/
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the first surface.

Returns
-------
bool
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1();

		/****************** IsVertexOnS2 ******************/
		/**** md5 signature: 2bca687752d3b31cff59a696d6463475 ****/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the second surface.

Returns
-------
bool
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2();

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Returns value of mykeep (does not evaluate states) false at creation of vpoint. updated by state(state from topabs,integer from standard).

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** PThePointOfIntersectionDummy ******************/
		/**** md5 signature: ec898b8efc4d8dd671e8f36c3caa6296 ****/
		%feature("compactdefaultargs") PThePointOfIntersectionDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PThePointOfIntersection
") PThePointOfIntersectionDummy;
		TopOpeBRep_PThePointOfIntersection PThePointOfIntersectionDummy();

		/****************** ParameterOnArc1 ******************/
		/**** md5 signature: fd3d8eb9ed7668171a21e22983def6f0 ****/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnArc1;
		Standard_Real ParameterOnArc1();

		/****************** ParameterOnArc2 ******************/
		/**** md5 signature: aa992bbe43a517a3ff131f0c53ce4d8a ****/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnArc2;
		Standard_Real ParameterOnArc2();

		/****************** ParameterOnLine ******************/
		/**** md5 signature: 737a2a57e32e63a1ba587dea488e9583 ****/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****************** ParametersOnS1 ******************/
		/**** md5 signature: 65a097ef44a5cf9a58ab746f2da6c181 ****/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
u: float
v: float
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		/**** md5 signature: 77976f8d675bab277c77e4c02c68ee8f ****/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
u: float
v: float
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParonE ******************/
		/**** md5 signature: ca0f2c28987e504607fe7ed5501d2039 ****/
		%feature("compactdefaultargs") ParonE;
		%feature("autodoc", "Returns <false> if the vpoint is not given on arc <e>, else returns <par> parameter on <e>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
par: float
") ParonE;
		Standard_Boolean ParonE(const TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** SetPoint ******************/
		/**** md5 signature: d9b041e9178fde9f6271b55faa9460a0 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: IntPatch_Point

Returns
-------
None
") SetPoint;
		void SetPoint(const IntPatch_Point & P);

		/****************** SetShapes ******************/
		/**** md5 signature: 3595c3b14ebeb78e69fcff771910d717 ****/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: int
I2: int

Returns
-------
None
") SetShapes;
		void SetShapes(const Standard_Integer I1, const Standard_Integer I2);

		/****************** ShapeIndex ******************/
		/**** md5 signature: 7d3e7fa2224eb9e0f253d806f40caf9f ****/
		%feature("compactdefaultargs") ShapeIndex;
		%feature("autodoc", "Returns value of filed myshapeindex = 0,1,2,3 0 means the vpoint is on no restriction 1 means the vpoint is on the restriction 1 2 means the vpoint is on the restriction 2 3 means the vpoint is on the restrictions 1 and 2.

Returns
-------
int
") ShapeIndex;
		Standard_Integer ShapeIndex();

		/****************** ShapeIndex ******************/
		/**** md5 signature: 0457d2bee32bf98c8438fff50731a362 ****/
		%feature("compactdefaultargs") ShapeIndex;
		%feature("autodoc", "Set value of shape supporting me (0,1,2,3).

Parameters
----------
I: int

Returns
-------
None
") ShapeIndex;
		void ShapeIndex(const Standard_Integer I);

		/****************** State ******************/
		/**** md5 signature: 3ef584a4c8697b5b43cfa0be6c8072f7 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Get state of vpoint within the domain of geometric shape domain <i> (= 1 or 2).

Parameters
----------
I: int

Returns
-------
TopAbs_State
") State;
		TopAbs_State State(const Standard_Integer I);

		/****************** State ******************/
		/**** md5 signature: 07a901fd299418dd38cc890d1b990c41 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Set the state of vpoint within the domain of the geometric shape <i> (= 1 or 2).

Parameters
----------
S: TopAbs_State
I: int

Returns
-------
None
") State;
		void State(const TopAbs_State S, const Standard_Integer I);

		/****************** SurfaceParameters ******************/
		/**** md5 signature: b2de99c015c12be76b4165b4e0ef8bf9 ****/
		%feature("compactdefaultargs") SurfaceParameters;
		%feature("autodoc", "Get the parameter on surface of shape i (1,2) containing the point.

Parameters
----------
I: int

Returns
-------
gp_Pnt2d
") SurfaceParameters;
		gp_Pnt2d SurfaceParameters(const Standard_Integer I);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** TransitionLineArc1 ******************/
		/**** md5 signature: 679806c2617ae45ea0d53c6d48f259d0 ****/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionLineArc1;
		IntSurf_Transition TransitionLineArc1();

		/****************** TransitionLineArc2 ******************/
		/**** md5 signature: bbc3f85a43c04d5fa71a8b70cc7ed587 ****/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionLineArc2;
		IntSurf_Transition TransitionLineArc2();

		/****************** TransitionOnS1 ******************/
		/**** md5 signature: 5245a12c5e2011034b6494ccfe7fc557 ****/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionOnS1;
		IntSurf_Transition TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		/**** md5 signature: 3e01bdbaced43133b8538ecc2257bd7c ****/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionOnS2;
		IntSurf_Transition TransitionOnS2();

		/****************** UpdateKeep ******************/
		/**** md5 signature: 5ad9d52824ae89630481b83d4aed1edf ****/
		%feature("compactdefaultargs") UpdateKeep;
		%feature("autodoc", "Set mykeep value according to current states.

Returns
-------
None
") UpdateKeep;
		void UpdateKeep();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 0c88aa57dfb7be7247a84d38b4f95722 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Vertex;
		const TopoDS_Shape Vertex(const Standard_Integer I);

		/****************** VertexOnS1 ******************/
		/**** md5 signature: 6ed918c69b81ad758219c5591cd71597 ****/
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the first patch, i-e when the function isvertexons1 returns true. otherwise, an exception is raised.

Returns
-------
TopoDS_Shape
") VertexOnS1;
		const TopoDS_Shape VertexOnS1();

		/****************** VertexOnS2 ******************/
		/**** md5 signature: 85c30fc7a3533bf2b52ba986c5679039 ****/
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the second patch, i-e when the function isvertexons2 returns true. otherwise, an exception is raised.

Returns
-------
TopoDS_Shape
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
		/****************** TopOpeBRep_VPointInterClassifier ******************/
		/**** md5 signature: a1be3fe40eb0a78f932a4aedb35a10ae ****/
		%feature("compactdefaultargs") TopOpeBRep_VPointInterClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_VPointInterClassifier;
		 TopOpeBRep_VPointInterClassifier();

		/****************** Edge ******************/
		/**** md5 signature: 736edb396456a570eb4c4e39335bdcb0 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge containing the vpoint <vp> used in the last vpointposition() call. edge is defined if the state previously computed is on, else edge is a null shape.

Returns
-------
TopoDS_Shape
") Edge;
		const TopoDS_Shape Edge();

		/****************** EdgeParameter ******************/
		/**** md5 signature: a4ccdc0e9c154705af034e3ac274511c ****/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Returns the parameter of the vpoint <vp> on edge().

Returns
-------
float
") EdgeParameter;
		Standard_Real EdgeParameter();

		/****************** VPointPosition ******************/
		/**** md5 signature: 55d46de1e39090798de4632ad1c50433 ****/
		%feature("compactdefaultargs") VPointPosition;
		%feature("autodoc", "Compute position of vpoint <vp> regarding with face <f>. <shapeindex> (= 1,2) indicates which (u,v) point of <vp> is used. when state is on, set vp.edgeon() with the edge containing <vp> and associated parameter. returns state of vp on shapeindex.

Parameters
----------
F: TopoDS_Shape
VP: TopOpeBRep_VPointInter
ShapeIndex: int
PC: TopOpeBRep_PointClassifier
AssumeINON: bool
Tol: float

Returns
-------
TopAbs_State
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
		/****************** TopOpeBRep_VPointInterIterator ******************/
		/**** md5 signature: 4a60080b99d1b377643e02747bdab223 ****/
		%feature("compactdefaultargs") TopOpeBRep_VPointInterIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator();

		/****************** TopOpeBRep_VPointInterIterator ******************/
		/**** md5 signature: 848023f5f372c815ac79e0dd516e1273 ****/
		%feature("compactdefaultargs") TopOpeBRep_VPointInterIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
LI: TopOpeBRep_LineInter

Returns
-------
None
") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator(const TopOpeBRep_LineInter & LI);

		/****************** ChangeCurrentVP ******************/
		/**** md5 signature: 496148d05b3616d904bc44b4aaa992c9 ****/
		%feature("compactdefaultargs") ChangeCurrentVP;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_VPointInter
") ChangeCurrentVP;
		TopOpeBRep_VPointInter & ChangeCurrentVP();

		/****************** CurrentVP ******************/
		/**** md5 signature: 260aa53e61b4d197c4be3891e211d125 ****/
		%feature("compactdefaultargs") CurrentVP;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_VPointInter
") CurrentVP;
		const TopOpeBRep_VPointInter & CurrentVP();

		/****************** CurrentVPIndex ******************/
		/**** md5 signature: 85204fb33ee8549cb9f5dbd465f7d30b ****/
		%feature("compactdefaultargs") CurrentVPIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CurrentVPIndex;
		Standard_Integer CurrentVPIndex();

		/****************** Init ******************/
		/**** md5 signature: edc6296d5a1bee29f35c1f07be0565e9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
LI: TopOpeBRep_LineInter
checkkeep: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TopOpeBRep_LineInter & LI, const Standard_Boolean checkkeep = Standard_False);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** PLineInterDummy ******************/
		/**** md5 signature: 20d21f153b52d5c38ce7cf68a51ddad1 ****/
		%feature("compactdefaultargs") PLineInterDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PLineInter
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
		/****************** TopOpeBRep_WPointInter ******************/
		/**** md5 signature: 07487cc8a014764d8895686694392704 ****/
		%feature("compactdefaultargs") TopOpeBRep_WPointInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_WPointInter;
		 TopOpeBRep_WPointInter();

		/****************** PPntOn2SDummy ******************/
		/**** md5 signature: b847ccb0b68d1e68f6999218617620ec ****/
		%feature("compactdefaultargs") PPntOn2SDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PPntOn2S
") PPntOn2SDummy;
		TopOpeBRep_PPntOn2S PPntOn2SDummy();

		/****************** Parameters ******************/
		/**** md5 signature: 30bdd599088f74dedd5979b152a07fd4 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		/**** md5 signature: 65a097ef44a5cf9a58ab746f2da6c181 ****/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		/**** md5 signature: 77976f8d675bab277c77e4c02c68ee8f ****/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Set ******************/
		/**** md5 signature: 25cd1975551f75abc8554038a5b3e8da ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") Set;
		void Set(const IntSurf_PntOn2S & P);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** ValueOnS1 ******************/
		/**** md5 signature: 50b3ba63c3abb8d8b7b0f75f561ce255 ****/
		%feature("compactdefaultargs") ValueOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") ValueOnS1;
		gp_Pnt2d ValueOnS1();

		/****************** ValueOnS2 ******************/
		/**** md5 signature: 5917a8ca4046cc4f4c1891697e532739 ****/
		%feature("compactdefaultargs") ValueOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
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
		/****************** TopOpeBRep_WPointInterIterator ******************/
		/**** md5 signature: 0a9a3c237cfb9ac449577a8e46e2431d ****/
		%feature("compactdefaultargs") TopOpeBRep_WPointInterIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator();

		/****************** TopOpeBRep_WPointInterIterator ******************/
		/**** md5 signature: feea3dde3a7a950ae69c571df50f89bd ****/
		%feature("compactdefaultargs") TopOpeBRep_WPointInterIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
LI: TopOpeBRep_LineInter

Returns
-------
None
") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator(const TopOpeBRep_LineInter & LI);

		/****************** CurrentWP ******************/
		/**** md5 signature: e2d815e0c2e2b5af7abb4585291aa49f ****/
		%feature("compactdefaultargs") CurrentWP;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_WPointInter
") CurrentWP;
		const TopOpeBRep_WPointInter & CurrentWP();

		/****************** Init ******************/
		/**** md5 signature: 2bdd8bb3eee4611ae1fc02a9782b42a5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
LI: TopOpeBRep_LineInter

Returns
-------
None
") Init;
		void Init(const TopOpeBRep_LineInter & LI);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** PLineInterDummy ******************/
		/**** md5 signature: 20d21f153b52d5c38ce7cf68a51ddad1 ****/
		%feature("compactdefaultargs") PLineInterDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PLineInter
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

class TopOpeBRep_HArray1OfVPointInter : public TopOpeBRep_Array1OfVPointInter, public Standard_Transient {
  public:
    TopOpeBRep_HArray1OfVPointInter(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopOpeBRep_HArray1OfVPointInter(const Standard_Integer theLower, const Standard_Integer theUpper, const TopOpeBRep_Array1OfVPointInter::value_type& theValue);
    TopOpeBRep_HArray1OfVPointInter(const TopOpeBRep_Array1OfVPointInter& theOther);
    const TopOpeBRep_Array1OfVPointInter& Array1();
    TopOpeBRep_Array1OfVPointInter& ChangeArray1();
};
%make_alias(TopOpeBRep_HArray1OfVPointInter)


class TopOpeBRep_HArray1OfLineInter : public TopOpeBRep_Array1OfLineInter, public Standard_Transient {
  public:
    TopOpeBRep_HArray1OfLineInter(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopOpeBRep_HArray1OfLineInter(const Standard_Integer theLower, const Standard_Integer theUpper, const TopOpeBRep_Array1OfLineInter::value_type& theValue);
    TopOpeBRep_HArray1OfLineInter(const TopOpeBRep_Array1OfLineInter& theOther);
    const TopOpeBRep_Array1OfLineInter& Array1();
    TopOpeBRep_Array1OfLineInter& ChangeArray1();
};
%make_alias(TopOpeBRep_HArray1OfLineInter)

/* harray2 classes */
/* hsequence classes */
