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
		%feature("compactdefaultargs") TopOpeBRep_Bipoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint();

		/****************** TopOpeBRep_Bipoint ******************/
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
		%feature("compactdefaultargs") I1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") I1;
		Standard_Integer I1();

		/****************** I2 ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_DSFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_DSFiller;
		 TopOpeBRep_DSFiller();

		/****************** ChangeEdgesFiller ******************/
		%feature("compactdefaultargs") ChangeEdgesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_EdgesFiller
") ChangeEdgesFiller;
		TopOpeBRep_EdgesFiller & ChangeEdgesFiller();

		/****************** ChangeFaceEdgeFiller ******************/
		%feature("compactdefaultargs") ChangeFaceEdgeFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_FaceEdgeFiller
") ChangeFaceEdgeFiller;
		TopOpeBRep_FaceEdgeFiller & ChangeFaceEdgeFiller();

		/****************** ChangeFacesFiller ******************/
		%feature("compactdefaultargs") ChangeFacesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_FacesFiller
") ChangeFacesFiller;
		TopOpeBRep_FacesFiller & ChangeFacesFiller();

		/****************** ChangeShapeIntersector ******************/
		%feature("compactdefaultargs") ChangeShapeIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_ShapeIntersector
") ChangeShapeIntersector;
		TopOpeBRep_ShapeIntersector & ChangeShapeIntersector();

		/****************** ChangeShapeIntersector2d ******************/
		%feature("compactdefaultargs") ChangeShapeIntersector2d;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_ShapeIntersector2d
") ChangeShapeIntersector2d;
		TopOpeBRep_ShapeIntersector2d & ChangeShapeIntersector2d();

		/****************** Checker ******************/
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
		%feature("compactdefaultargs") PShapeClassifier;
		%feature("autodoc", "Return field mypshapeclassifier. set field mypshapeclassifier.

Returns
-------
TopOpeBRepTool_PShapeClassifier
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier();

		/****************** Reducer ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_EdgesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_EdgesFiller;
		 TopOpeBRep_EdgesFiller();

		/****************** Face ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_EdgesIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_EdgesIntersector;
		 TopOpeBRep_EdgesIntersector();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Set working space dimension d = 1 for e &|| w, 2 for e in f.

Returns
-------
int
") Dimension;
		Standard_Integer Dimension();

		/****************** Dump ******************/
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
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FacesSameOriented;
		Standard_Boolean FacesSameOriented();

		/****************** ForceTolerances ******************/
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
		%feature("compactdefaultargs") HasSegment;
		%feature("autodoc", "True if at least one intersection segment.

Returns
-------
bool
") HasSegment;
		Standard_Boolean HasSegment();

		/****************** InitPoint ******************/
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
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** MorePoint ******************/
		%feature("compactdefaultargs") MorePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MorePoint;
		Standard_Boolean MorePoint();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** NextPoint ******************/
		%feature("compactdefaultargs") NextPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextPoint;
		void NextPoint();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_Point2d
") Point;
		const TopOpeBRep_Point2d & Point();

		/****************** Point ******************/
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
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_SequenceOfPoint2d
") Points;
		const TopOpeBRep_SequenceOfPoint2d & Points();

		/****************** ReduceSegment ******************/
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
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "= mysamedomain.

Returns
-------
bool
") SameDomain;
		Standard_Boolean SameDomain();

		/****************** SetFaces ******************/
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
		%feature("compactdefaultargs") Status1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_P2Dstatus
") Status1;
		TopOpeBRep_P2Dstatus Status1();

		/****************** Surface ******************/
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
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented();

		/****************** ToleranceMax ******************/
		%feature("compactdefaultargs") ToleranceMax;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ToleranceMax;
		Standard_Real ToleranceMax();

		/****************** Tolerances ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_FaceEdgeFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FaceEdgeFiller;
		 TopOpeBRep_FaceEdgeFiller();

		/****************** Insert ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_FaceEdgeIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FaceEdgeIntersector;
		 TopOpeBRep_FaceEdgeIntersector();

		/****************** ForceTolerance ******************/
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
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Trace only.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** InitPoint ******************/
		%feature("compactdefaultargs") InitPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitPoint;
		void InitPoint();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsVertex ******************/
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
		%feature("compactdefaultargs") MorePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MorePoint;
		Standard_Boolean MorePoint();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NextPoint ******************/
		%feature("compactdefaultargs") NextPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextPoint;
		void NextPoint();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametre de value() sur l'arete.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") State;
		%feature("autodoc", "In ou on / a la face. les points out ne sont pas retournes.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return the tolerance value used in the last perform() call if forcetolerance() has been called, return the given value. if not, return value extracted from shapes.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Transition ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_FacesFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FacesFiller;
		 TopOpeBRep_FacesFiller();

		/****************** AddShapesLine ******************/
		%feature("compactdefaultargs") AddShapesLine;
		%feature("autodoc", "Compute 3d curve, pcurves and face/curve interferences for current ndsc. add them to the ds.

Returns
-------
None
") AddShapesLine;
		void AddShapesLine();

		/****************** ChangeDataStructure ******************/
		%feature("compactdefaultargs") ChangeDataStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_DataStructure
") ChangeDataStructure;
		TopOpeBRepDS_DataStructure & ChangeDataStructure();

		/****************** ChangeFacesIntersector ******************/
		%feature("compactdefaultargs") ChangeFacesIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_FacesIntersector
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector();

		/****************** ChangePointClassifier ******************/
		%feature("compactdefaultargs") ChangePointClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PointClassifier
") ChangePointClassifier;
		TopOpeBRep_PointClassifier & ChangePointClassifier();

		/****************** CheckLine ******************/
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
		%feature("compactdefaultargs") FillLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") FillLine;
		void FillLine();

		/****************** FillLineVPonR ******************/
		%feature("compactdefaultargs") FillLineVPonR;
		%feature("autodoc", "Vp processing for restriction line and line sharing same domain with section edges : - if restriction : adds restriction edges as section edges and compute face/edge interference. - if same domain : if line share same domain with section edges, compute parts of line in/in the two faces, and compute curve/point interference for vp boundaries.

Returns
-------
None
") FillLineVPonR;
		void FillLineVPonR();

		/****************** GetESL ******************/
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
		%feature("compactdefaultargs") HDataStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") HDataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> HDataStructure();

		/****************** Insert ******************/
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
		%feature("compactdefaultargs") PDataStructureDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_PDataStructure
") PDataStructureDummy;
		TopOpeBRepDS_PDataStructure PDataStructureDummy();

		/****************** PFacesIntersectorDummy ******************/
		%feature("compactdefaultargs") PFacesIntersectorDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PFacesIntersector
") PFacesIntersectorDummy;
		TopOpeBRep_PFacesIntersector PFacesIntersectorDummy();

		/****************** PLineInterDummy ******************/
		%feature("compactdefaultargs") PLineInterDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PLineInter
") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy();

		/****************** PShapeClassifier ******************/
		%feature("compactdefaultargs") PShapeClassifier;
		%feature("autodoc", "Return field mypshapeclassifier.

Returns
-------
TopOpeBRepTool_PShapeClassifier
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier();

		/****************** ProcessLine ******************/
		%feature("compactdefaultargs") ProcessLine;
		%feature("autodoc", "Process current intersection line (set by loadline).

Returns
-------
None
") ProcessLine;
		void ProcessLine();

		/****************** ProcessRLine ******************/
		%feature("compactdefaultargs") ProcessRLine;
		%feature("autodoc", "Process current restriction line, adding restriction edge and computing face/edge interference.

Returns
-------
None
") ProcessRLine;
		void ProcessRLine();

		/****************** ProcessSectionEdges ******************/
		%feature("compactdefaultargs") ProcessSectionEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessSectionEdges;
		void ProcessSectionEdges();

		/****************** ProcessVPInotonR ******************/
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
		%feature("compactdefaultargs") ResetDSC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetDSC;
		void ResetDSC();

		/****************** SetPShapeClassifier ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_FacesIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_FacesIntersector;
		 TopOpeBRep_FacesIntersector();

		/****************** ChangeLine ******************/
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
		%feature("compactdefaultargs") CurrentLine;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_LineInter
") CurrentLine;
		TopOpeBRep_LineInter & CurrentLine();

		/****************** CurrentLineIndex ******************/
		%feature("compactdefaultargs") CurrentLineIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CurrentLineIndex;
		Standard_Integer CurrentLineIndex();

		/****************** Face ******************/
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
		%feature("compactdefaultargs") InitLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitLine;
		void InitLine();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsRestriction ******************/
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
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRep_HArray1OfLineInter>
") Lines;
		opencascade::handle<TopOpeBRep_HArray1OfLineInter> Lines();

		/****************** MoreLine ******************/
		%feature("compactdefaultargs") MoreLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreLine;
		Standard_Boolean MoreLine();

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NextLine ******************/
		%feature("compactdefaultargs") NextLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextLine;
		void NextLine();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") PrepareLines;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PrepareLines;
		void PrepareLines();

		/****************** Restrictions ******************/
		%feature("compactdefaultargs") Restrictions;
		%feature("autodoc", "Returns the map of edges found as topebrepbrep_restriction.

Returns
-------
TopTools_IndexedMapOfShape
") Restrictions;
		const TopTools_IndexedMapOfShape & Restrictions();

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Returns true if perform() arguments are two faces with the same surface.

Returns
-------
bool
") SameDomain;
		Standard_Boolean SameDomain();

		/****************** SurfacesSameOriented ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_Hctxee2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Hctxee2d;
		 TopOpeBRep_Hctxee2d();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_Hctxff2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Hctxff2d;
		 TopOpeBRep_Hctxff2d();

		/****************** Face ******************/
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
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FacesSameOriented;
		Standard_Boolean FacesSameOriented();

		/****************** GetMaxTolerance ******************/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMaxTolerance;
		Standard_Real GetMaxTolerance();

		/****************** GetTolerances ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_LineInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_LineInter;
		 TopOpeBRep_LineInter();

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the edge of a restriction line (or a null edge).

Returns
-------
TopoDS_Shape
") Arc;
		const TopoDS_Shape Arc();

		/****************** ArcIsEdge ******************/
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
		%feature("compactdefaultargs") ComputeFaceFaceTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeFaceFaceTransition;
		void ComputeFaceFaceTransition();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		opencascade::handle<Geom_Curve> Curve();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") DumpType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DumpType;
		void DumpType();

		/****************** DumpVPoint ******************/
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
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** HasVInternal ******************/
		%feature("compactdefaultargs") HasVInternal;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasVInternal;
		Standard_Boolean HasVInternal();

		/****************** HasVPonR ******************/
		%feature("compactdefaultargs") HasVPonR;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasVPonR;
		Standard_Boolean HasVPonR();

		/****************** INL ******************/
		%feature("compactdefaultargs") INL;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") INL;
		Standard_Boolean INL();

		/****************** Index ******************/
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
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** LineG ******************/
		%feature("compactdefaultargs") LineG;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntPatch_GLine>
") LineG;
		const opencascade::handle<IntPatch_GLine> & LineG();

		/****************** LineR ******************/
		%feature("compactdefaultargs") LineR;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntPatch_RLine>
") LineR;
		const opencascade::handle<IntPatch_RLine> & LineR();

		/****************** LineW ******************/
		%feature("compactdefaultargs") LineW;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntPatch_WLine>
") LineW;
		const opencascade::handle<IntPatch_WLine> & LineW();

		/****************** NbVPoint ******************/
		%feature("compactdefaultargs") NbVPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoint;
		Standard_Integer NbVPoint();

		/****************** NbWPoint ******************/
		%feature("compactdefaultargs") NbWPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbWPoint;
		Standard_Integer NbWPoint();

		/****************** OK ******************/
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OK;
		Standard_Boolean OK();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** SetFaces ******************/
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
		%feature("compactdefaultargs") SetHasVPonR;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetHasVPonR;
		void SetHasVPonR();

		/****************** SetINL ******************/
		%feature("compactdefaultargs") SetINL;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetINL;
		void SetINL();

		/****************** SetIsVClosed ******************/
		%feature("compactdefaultargs") SetIsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetIsVClosed;
		void SetIsVClosed();

		/****************** SetLine ******************/
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
		%feature("compactdefaultargs") SetVPBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetVPBounds;
		void SetVPBounds();

		/****************** SituationS1 ******************/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Situation
") SituationS1;
		IntSurf_Situation SituationS1();

		/****************** SituationS2 ******************/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Situation
") SituationS2;
		IntSurf_Situation SituationS2();

		/****************** TransitionOnS1 ******************/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2();

		/****************** TypeLineCurve ******************/
		%feature("compactdefaultargs") TypeLineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_TypeLineCurve
") TypeLineCurve;
		TopOpeBRep_TypeLineCurve TypeLineCurve();

		/****************** VPBounds ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_Point2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_Point2d;
		 TopOpeBRep_Point2d();

		/****************** ChangeTransition ******************/
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
		%feature("compactdefaultargs") EdgesConfig;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Config
") EdgesConfig;
		TopOpeBRepDS_Config EdgesConfig();

		/****************** HasPint ******************/
		%feature("compactdefaultargs") HasPint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPint;
		Standard_Boolean HasPint();

		/****************** Hctxee2d ******************/
		%feature("compactdefaultargs") Hctxee2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRep_Hctxee2d>
") Hctxee2d;
		opencascade::handle<TopOpeBRep_Hctxee2d> Hctxee2d();

		/****************** Hctxff2d ******************/
		%feature("compactdefaultargs") Hctxff2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRep_Hctxff2d>
") Hctxff2d;
		opencascade::handle<TopOpeBRep_Hctxff2d> Hctxff2d();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsPointOfSegment ******************/
		%feature("compactdefaultargs") IsPointOfSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPointOfSegment;
		Standard_Boolean IsPointOfSegment();

		/****************** IsVertex ******************/
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
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") Pint;
		%feature("autodoc", "No available documentation.

Returns
-------
IntRes2d_IntersectionPoint
") Pint;
		const IntRes2d_IntersectionPoint & Pint();

		/****************** SegmentAncestors ******************/
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
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_P2Dstatus
") Status;
		TopOpeBRep_P2Dstatus Status();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Transition ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Value2d ******************/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") Value2d;
		const gp_Pnt2d Value2d();

		/****************** Vertex ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_PointClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_PointClassifier;
		 TopOpeBRep_PointClassifier();

		/****************** Classify ******************/
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_ShapeIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_ShapeIntersector;
		 TopOpeBRep_ShapeIntersector();

		/****************** ChangeEdgesIntersector ******************/
		%feature("compactdefaultargs") ChangeEdgesIntersector;
		%feature("autodoc", "Return the current intersection of two edges.

Returns
-------
TopOpeBRep_EdgesIntersector
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector();

		/****************** ChangeFaceEdgeIntersector ******************/
		%feature("compactdefaultargs") ChangeFaceEdgeIntersector;
		%feature("autodoc", "Return the current intersection of a face and an edge.

Returns
-------
TopOpeBRep_FaceEdgeIntersector
") ChangeFaceEdgeIntersector;
		TopOpeBRep_FaceEdgeIntersector & ChangeFaceEdgeIntersector();

		/****************** ChangeFacesIntersector ******************/
		%feature("compactdefaultargs") ChangeFacesIntersector;
		%feature("autodoc", "Return the current intersection of two faces.

Returns
-------
TopOpeBRep_FacesIntersector
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector();

		/****************** CurrentGeomShape ******************/
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
		%feature("compactdefaultargs") MoreIntersection;
		%feature("autodoc", "Returns true if there are more intersection between two the shapes.

Returns
-------
bool
") MoreIntersection;
		Standard_Boolean MoreIntersection();

		/****************** NextIntersection ******************/
		%feature("compactdefaultargs") NextIntersection;
		%feature("autodoc", "Search for the next intersection between the two shapes.

Returns
-------
None
") NextIntersection;
		void NextIntersection();

		/****************** RejectedFaces ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_ShapeIntersector2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_ShapeIntersector2d;
		 TopOpeBRep_ShapeIntersector2d();

		/****************** ChangeEdgesIntersector ******************/
		%feature("compactdefaultargs") ChangeEdgesIntersector;
		%feature("autodoc", "Return the current intersection of two edges.

Returns
-------
TopOpeBRep_EdgesIntersector
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector();

		/****************** CurrentGeomShape ******************/
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
		%feature("compactdefaultargs") MoreIntersection;
		%feature("autodoc", "Returns true if there are more intersection between two the shapes.

Returns
-------
bool
") MoreIntersection;
		Standard_Boolean MoreIntersection();

		/****************** NextIntersection ******************/
		%feature("compactdefaultargs") NextIntersection;
		%feature("autodoc", "Search for the next intersection between the two shapes.

Returns
-------
None
") NextIntersection;
		void NextIntersection();

		/****************** Shape ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_ShapeScanner;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_ShapeScanner;
		 TopOpeBRep_ShapeScanner();

		/****************** AddBoxesMakeCOB ******************/
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
		%feature("compactdefaultargs") BoxSort;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_BoxSort
") BoxSort;
		const TopOpeBRepTool_BoxSort & BoxSort();

		/****************** ChangeBoxSort ******************/
		%feature("compactdefaultargs") ChangeBoxSort;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_BoxSort
") ChangeBoxSort;
		TopOpeBRepTool_BoxSort & ChangeBoxSort();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Current ******************/
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
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_VPointInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_VPointInter;
		 TopOpeBRep_VPointInter();

		/****************** ArcOnS1 ******************/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ArcOnS1;
		const TopoDS_Shape ArcOnS1();

		/****************** ArcOnS2 ******************/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ArcOnS2;
		const TopoDS_Shape ArcOnS2();

		/****************** ChangeKeep ******************/
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
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsInternal ******************/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsInternal;
		Standard_Boolean IsInternal();

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if the point belongs to several intersection lines.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** IsOnDomS1 ******************/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnDomS1;
		Standard_Boolean IsOnDomS1();

		/****************** IsOnDomS2 ******************/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnDomS2;
		Standard_Boolean IsOnDomS2();

		/****************** IsVertex ******************/
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
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the first surface.

Returns
-------
bool
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1();

		/****************** IsVertexOnS2 ******************/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the second surface.

Returns
-------
bool
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2();

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Returns value of mykeep (does not evaluate states) false at creation of vpoint. updated by state(state from topabs,integer from standard).

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** PThePointOfIntersectionDummy ******************/
		%feature("compactdefaultargs") PThePointOfIntersectionDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PThePointOfIntersection
") PThePointOfIntersectionDummy;
		TopOpeBRep_PThePointOfIntersection PThePointOfIntersectionDummy();

		/****************** ParameterOnArc1 ******************/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnArc1;
		Standard_Real ParameterOnArc1();

		/****************** ParameterOnArc2 ******************/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnArc2;
		Standard_Real ParameterOnArc2();

		/****************** ParameterOnLine ******************/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****************** ParametersOnS1 ******************/
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
		%feature("compactdefaultargs") ShapeIndex;
		%feature("autodoc", "Returns value of filed myshapeindex = 0,1,2,3 0 means the vpoint is on no restriction 1 means the vpoint is on the restriction 1 2 means the vpoint is on the restriction 2 3 means the vpoint is on the restrictions 1 and 2.

Returns
-------
int
") ShapeIndex;
		Standard_Integer ShapeIndex();

		/****************** ShapeIndex ******************/
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
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** TransitionLineArc1 ******************/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionLineArc1;
		IntSurf_Transition TransitionLineArc1();

		/****************** TransitionLineArc2 ******************/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionLineArc2;
		IntSurf_Transition TransitionLineArc2();

		/****************** TransitionOnS1 ******************/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionOnS1;
		IntSurf_Transition TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Transition
") TransitionOnS2;
		IntSurf_Transition TransitionOnS2();

		/****************** UpdateKeep ******************/
		%feature("compactdefaultargs") UpdateKeep;
		%feature("autodoc", "Set mykeep value according to current states.

Returns
-------
None
") UpdateKeep;
		void UpdateKeep();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
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
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the first patch, i-e when the function isvertexons1 returns true. otherwise, an exception is raised.

Returns
-------
TopoDS_Shape
") VertexOnS1;
		const TopoDS_Shape VertexOnS1();

		/****************** VertexOnS2 ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_VPointInterClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_VPointInterClassifier;
		 TopOpeBRep_VPointInterClassifier();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge containing the vpoint <vp> used in the last vpointposition() call. edge is defined if the state previously computed is on, else edge is a null shape.

Returns
-------
TopoDS_Shape
") Edge;
		const TopoDS_Shape Edge();

		/****************** EdgeParameter ******************/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Returns the parameter of the vpoint <vp> on edge().

Returns
-------
float
") EdgeParameter;
		Standard_Real EdgeParameter();

		/****************** VPointPosition ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_VPointInterIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator();

		/****************** TopOpeBRep_VPointInterIterator ******************/
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
		%feature("compactdefaultargs") ChangeCurrentVP;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_VPointInter
") ChangeCurrentVP;
		TopOpeBRep_VPointInter & ChangeCurrentVP();

		/****************** CurrentVP ******************/
		%feature("compactdefaultargs") CurrentVP;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_VPointInter
") CurrentVP;
		const TopOpeBRep_VPointInter & CurrentVP();

		/****************** CurrentVPIndex ******************/
		%feature("compactdefaultargs") CurrentVPIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CurrentVPIndex;
		Standard_Integer CurrentVPIndex();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** PLineInterDummy ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_WPointInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_WPointInter;
		 TopOpeBRep_WPointInter();

		/****************** PPntOn2SDummy ******************/
		%feature("compactdefaultargs") PPntOn2SDummy;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_PPntOn2S
") PPntOn2SDummy;
		TopOpeBRep_PPntOn2S PPntOn2SDummy();

		/****************** Parameters ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** ValueOnS1 ******************/
		%feature("compactdefaultargs") ValueOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") ValueOnS1;
		gp_Pnt2d ValueOnS1();

		/****************** ValueOnS2 ******************/
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
		%feature("compactdefaultargs") TopOpeBRep_WPointInterIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator();

		/****************** TopOpeBRep_WPointInterIterator ******************/
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
		%feature("compactdefaultargs") CurrentWP;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRep_WPointInter
") CurrentWP;
		const TopOpeBRep_WPointInter & CurrentWP();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** PLineInterDummy ******************/
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
