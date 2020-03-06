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
%define INTTOOLSDOCSTRING
"IntTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_inttools.html"
%enddef
%module (package="OCC.Core", docstring=INTTOOLSDOCSTRING) IntTools


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
#include<IntTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2dHatch_module.hxx>
#include<GeomAPI_module.hxx>
#include<BRepClass3d_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<IntSurf_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<IntPatch_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<GeomInt_module.hxx>
#include<AppParCurves_module.hxx>
#include<IntRes2d_module.hxx>
#include<Geom2dInt_module.hxx>
#include<Adaptor3d_module.hxx>
#include<FEmTool_module.hxx>
#include<Extrema_module.hxx>
#include<IntAna_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Quantity_module.hxx>
#include<HatchGen_module.hxx>
#include<TopLoc_module.hxx>
#include<Approx_module.hxx>
#include<BRepClass3d_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2dHatch_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepAdaptor.i
%import TopoDS.i
%import gp.i
%import Geom.i
%import TopAbs.i
%import Bnd.i
%import Geom2dHatch.i
%import GeomAPI.i
%import BRepClass3d.i
%import Geom2d.i
%import GeomAbs.i
%import IntSurf.i
%import TColStd.i
%import Adaptor3d.i
%import IntPatch.i
%import GeomAdaptor.i
%import GeomInt.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IntTools_Context)
%wrap_handle(IntTools_TopolTool)
/* end handles declaration */

/* templates */
%template(IntTools_Array1OfRange) NCollection_Array1<IntTools_Range>;

%extend NCollection_Array1<IntTools_Range> {
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
%template(IntTools_Array1OfRoots) NCollection_Array1<IntTools_Root>;

%extend NCollection_Array1<IntTools_Root> {
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
%template(IntTools_DataMapOfCurveSampleBox) NCollection_DataMap<IntTools_CurveRangeSample,Bnd_Box,IntTools_CurveRangeSampleMapHasher>;
%template(IntTools_DataMapOfSurfaceSampleBox) NCollection_DataMap<IntTools_SurfaceRangeSample,Bnd_Box,IntTools_SurfaceRangeSampleMapHasher>;
%template(IntTools_ListIteratorOfListOfBox) NCollection_TListIterator<Bnd_Box>;
%template(IntTools_ListIteratorOfListOfCurveRangeSample) NCollection_TListIterator<IntTools_CurveRangeSample>;
%template(IntTools_ListIteratorOfListOfSurfaceRangeSample) NCollection_TListIterator<IntTools_SurfaceRangeSample>;
%template(IntTools_ListOfBox) NCollection_List<Bnd_Box>;
%template(IntTools_ListOfCurveRangeSample) NCollection_List<IntTools_CurveRangeSample>;
%template(IntTools_ListOfSurfaceRangeSample) NCollection_List<IntTools_SurfaceRangeSample>;
%template(IntTools_MapOfCurveSample) NCollection_Map<IntTools_CurveRangeSample,IntTools_CurveRangeSampleMapHasher>;
%template(IntTools_MapOfSurfaceSample) NCollection_Map<IntTools_SurfaceRangeSample,IntTools_SurfaceRangeSampleMapHasher>;
%template(IntTools_SequenceOfCommonPrts) NCollection_Sequence<IntTools_CommonPrt>;
%template(IntTools_SequenceOfCurves) NCollection_Sequence<IntTools_Curve>;
%template(IntTools_SequenceOfPntOn2Faces) NCollection_Sequence<IntTools_PntOn2Faces>;
%template(IntTools_SequenceOfRanges) NCollection_Sequence<IntTools_Range>;
%template(IntTools_SequenceOfRoots) NCollection_Sequence<IntTools_Root>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<IntTools_Range> IntTools_Array1OfRange;
typedef NCollection_Array1<IntTools_Root> IntTools_Array1OfRoots;
typedef NCollection_DataMap<IntTools_CurveRangeSample, Bnd_Box, IntTools_CurveRangeSampleMapHasher>::Iterator IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
typedef NCollection_DataMap<IntTools_SurfaceRangeSample, Bnd_Box, IntTools_SurfaceRangeSampleMapHasher>::Iterator IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
typedef NCollection_DataMap<IntTools_CurveRangeSample, Bnd_Box, IntTools_CurveRangeSampleMapHasher> IntTools_DataMapOfCurveSampleBox;
typedef NCollection_DataMap<IntTools_SurfaceRangeSample, Bnd_Box, IntTools_SurfaceRangeSampleMapHasher> IntTools_DataMapOfSurfaceSampleBox;
typedef NCollection_List<Bnd_Box>::Iterator IntTools_ListIteratorOfListOfBox;
typedef NCollection_List<IntTools_CurveRangeSample>::Iterator IntTools_ListIteratorOfListOfCurveRangeSample;
typedef NCollection_List<IntTools_SurfaceRangeSample>::Iterator IntTools_ListIteratorOfListOfSurfaceRangeSample;
typedef NCollection_List<Bnd_Box> IntTools_ListOfBox;
typedef NCollection_List<IntTools_CurveRangeSample> IntTools_ListOfCurveRangeSample;
typedef NCollection_List<IntTools_SurfaceRangeSample> IntTools_ListOfSurfaceRangeSample;
typedef NCollection_Map<IntTools_CurveRangeSample, IntTools_CurveRangeSampleMapHasher>::Iterator IntTools_MapIteratorOfMapOfCurveSample;
typedef NCollection_Map<IntTools_SurfaceRangeSample, IntTools_SurfaceRangeSampleMapHasher>::Iterator IntTools_MapIteratorOfMapOfSurfaceSample;
typedef NCollection_Map<IntTools_CurveRangeSample, IntTools_CurveRangeSampleMapHasher> IntTools_MapOfCurveSample;
typedef NCollection_Map<IntTools_SurfaceRangeSample, IntTools_SurfaceRangeSampleMapHasher> IntTools_MapOfSurfaceSample;
typedef NCollection_Sequence<IntTools_CommonPrt> IntTools_SequenceOfCommonPrts;
typedef NCollection_Sequence<IntTools_Curve> IntTools_SequenceOfCurves;
typedef NCollection_Sequence<IntTools_PntOn2Faces> IntTools_SequenceOfPntOn2Faces;
typedef NCollection_Sequence<IntTools_Range> IntTools_SequenceOfRanges;
typedef NCollection_Sequence<IntTools_Root> IntTools_SequenceOfRoots;
/* end typedefs declaration */

/*****************
* class IntTools *
*****************/
%rename(inttools) IntTools;
class IntTools {
	public:
		/****************** FindRootStates ******************/
		%feature("compactdefaultargs") FindRootStates;
		%feature("autodoc", "Find the states (before and after) for each root from the sequence aseq.

Parameters
----------
aSeq: IntTools_SequenceOfRoots
anEpsNull: float

Returns
-------
None
") FindRootStates;
		static void FindRootStates(IntTools_SequenceOfRoots & aSeq, const Standard_Real anEpsNull);

		/****************** GetRadius ******************/
		%feature("compactdefaultargs") GetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve
t1: float
t3: float

Returns
-------
R: float
") GetRadius;
		static Standard_Integer GetRadius(const BRepAdaptor_Curve & C, const Standard_Real t1, const Standard_Real t3, Standard_Real &OutValue);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the edge;.

Parameters
----------
E: TopoDS_Edge

Returns
-------
float
") Length;
		static Standard_Real Length(const TopoDS_Edge & E);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Curve: Geom_Curve

Returns
-------
aParm: float
") Parameter;
		static Standard_Integer Parameter(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, Standard_Real &OutValue);

		/****************** PrepareArgs ******************/
		%feature("compactdefaultargs") PrepareArgs;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve
tMax: float
tMin: float
Discret: int
Deflect: float
anArgs: IntTools_CArray1OfReal

Returns
-------
int
") PrepareArgs;
		static Standard_Integer PrepareArgs(BRepAdaptor_Curve & C, const Standard_Real tMax, const Standard_Real tMin, const Standard_Integer Discret, const Standard_Real Deflect, IntTools_CArray1OfReal & anArgs);

		/****************** RemoveIdenticalRoots ******************/
		%feature("compactdefaultargs") RemoveIdenticalRoots;
		%feature("autodoc", "Remove from the sequence aseq the roots that have values ti and tj such as |ti-tj] < anepst.

Parameters
----------
aSeq: IntTools_SequenceOfRoots
anEpsT: float

Returns
-------
None
") RemoveIdenticalRoots;
		static void RemoveIdenticalRoots(IntTools_SequenceOfRoots & aSeq, const Standard_Real anEpsT);

		/****************** SortRoots ******************/
		%feature("compactdefaultargs") SortRoots;
		%feature("autodoc", "Sort the sequence aseq of the roots to arrange the roons in increasing order.

Parameters
----------
aSeq: IntTools_SequenceOfRoots
anEpsT: float

Returns
-------
None
") SortRoots;
		static void SortRoots(IntTools_SequenceOfRoots & aSeq, const Standard_Real anEpsT);

};


%extend IntTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntTools_BaseRangeSample *
*********************************/
class IntTools_BaseRangeSample {
	public:
		/****************** IntTools_BaseRangeSample ******************/
		%feature("compactdefaultargs") IntTools_BaseRangeSample;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample();

		/****************** IntTools_BaseRangeSample ******************/
		%feature("compactdefaultargs") IntTools_BaseRangeSample;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDepth: int

Returns
-------
None
") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample(const Standard_Integer theDepth);

		/****************** GetDepth ******************/
		%feature("compactdefaultargs") GetDepth;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetDepth;
		Standard_Integer GetDepth();

		/****************** SetDepth ******************/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDepth: int

Returns
-------
None
") SetDepth;
		void SetDepth(const Standard_Integer theDepth);

};


%extend IntTools_BaseRangeSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IntTools_BeanFaceIntersector *
*************************************/
class IntTools_BeanFaceIntersector {
	public:
		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector();

		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "Initializes the algorithm //! warning: the parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Returns
-------
None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "Initializes the algorithm.

Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theBeanTolerance: float
theFaceTolerance: float

Returns
-------
None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "Initializes the algorithm theuminparameter, ... are used for optimization purposes.

Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theFirstParOnCurve: float
theLastParOnCurve: float
theUMinParameter: float
theUMaxParameter: float
theVMinParameter: float
theVMaxParameter: float
theBeanTolerance: float
theFaceTolerance: float

Returns
-------
None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theFirstParOnCurve, const Standard_Real theLastParOnCurve, const Standard_Real theUMinParameter, const Standard_Real theUMaxParameter, const Standard_Real theVMinParameter, const Standard_Real theVMaxParameter, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Gets the intersecton context.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the algorithm //! warning: the parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the algorithm.

Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theBeanTolerance: float
theFaceTolerance: float

Returns
-------
None
") Init;
		void Init(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the algorithm theuminparameter, ... are used for optimization purposes.

Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theFirstParOnCurve: float
theLastParOnCurve: float
theUMinParameter: float
theUMaxParameter: float
theVMinParameter: float
theVMaxParameter: float
theBeanTolerance: float
theFaceTolerance: float

Returns
-------
None
") Init;
		void Init(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theFirstParOnCurve, const Standard_Real theLastParOnCurve, const Standard_Real theUMinParameter, const Standard_Real theUMaxParameter, const Standard_Real theVMinParameter, const Standard_Real theVMaxParameter, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns done/notdone state of the algorithm.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Launches the algorithm.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
IntTools_SequenceOfRanges
") Result;
		const IntTools_SequenceOfRanges & Result();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Parameters
----------
theResults: IntTools_SequenceOfRanges

Returns
-------
None
") Result;
		void Result(IntTools_SequenceOfRanges & theResults);

		/****************** SetBeanParameters ******************/
		%feature("compactdefaultargs") SetBeanParameters;
		%feature("autodoc", "Set restrictions for curve.

Parameters
----------
theFirstParOnCurve: float
theLastParOnCurve: float

Returns
-------
None
") SetBeanParameters;
		void SetBeanParameters(const Standard_Real theFirstParOnCurve, const Standard_Real theLastParOnCurve);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the intersecton context.

Parameters
----------
theContext: IntTools_Context

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetSurfaceParameters ******************/
		%feature("compactdefaultargs") SetSurfaceParameters;
		%feature("autodoc", "Set restrictions for surface.

Parameters
----------
theUMinParameter: float
theUMaxParameter: float
theVMinParameter: float
theVMaxParameter: float

Returns
-------
None
") SetSurfaceParameters;
		void SetSurfaceParameters(const Standard_Real theUMinParameter, const Standard_Real theUMaxParameter, const Standard_Real theVMinParameter, const Standard_Real theVMaxParameter);

};


%extend IntTools_BeanFaceIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IntTools_CArray1OfInteger *
**********************************/
/*******************************
* class IntTools_CArray1OfReal *
*******************************/
/***************************
* class IntTools_CommonPrt *
***************************/
class IntTools_CommonPrt {
	public:
		/****************** IntTools_CommonPrt ******************/
		%feature("compactdefaultargs") IntTools_CommonPrt;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_CommonPrt;
		 IntTools_CommonPrt();

		/****************** IntTools_CommonPrt ******************/
		%feature("compactdefaultargs") IntTools_CommonPrt;
		%feature("autodoc", "Copy constructor.

Parameters
----------
aCPrt: IntTools_CommonPrt

Returns
-------
None
") IntTools_CommonPrt;
		 IntTools_CommonPrt(const IntTools_CommonPrt & aCPrt);

		/****************** AllNullFlag ******************/
		%feature("compactdefaultargs") AllNullFlag;
		%feature("autodoc", "Modifier.

Returns
-------
bool
") AllNullFlag;
		Standard_Boolean AllNullFlag();

		/****************** AppendRange2 ******************/
		%feature("compactdefaultargs") AppendRange2;
		%feature("autodoc", "Appends the range of second edge.

Parameters
----------
aR: IntTools_Range

Returns
-------
None
") AppendRange2;
		void AppendRange2(const IntTools_Range & aR);

		/****************** AppendRange2 ******************/
		%feature("compactdefaultargs") AppendRange2;
		%feature("autodoc", "Appends the range of second edge.

Parameters
----------
tf: float
tl: float

Returns
-------
None
") AppendRange2;
		void AppendRange2(const Standard_Real tf, const Standard_Real tl);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntTools_CommonPrt

Returns
-------
IntTools_CommonPrt
") Assign;
		IntTools_CommonPrt & Assign(const IntTools_CommonPrt & Other);

		/****************** BoundingPoints ******************/
		%feature("compactdefaultargs") BoundingPoints;
		%feature("autodoc", "Selector.

Parameters
----------
aP1: gp_Pnt
aP2: gp_Pnt

Returns
-------
None
") BoundingPoints;
		void BoundingPoints(gp_Pnt & aP1, gp_Pnt & aP2);

		/****************** ChangeRanges2 ******************/
		%feature("compactdefaultargs") ChangeRanges2;
		%feature("autodoc", "Returns the ranges of second edge.

Returns
-------
IntTools_SequenceOfRanges
") ChangeRanges2;
		IntTools_SequenceOfRanges & ChangeRanges2();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copies me to another.

Parameters
----------
anOther: IntTools_CommonPrt

Returns
-------
None
") Copy;
		void Copy(IntTools_CommonPrt & anOther);

		/****************** Edge1 ******************/
		%feature("compactdefaultargs") Edge1;
		%feature("autodoc", "Returns the first edge.

Returns
-------
TopoDS_Edge
") Edge1;
		const TopoDS_Edge Edge1();

		/****************** Edge2 ******************/
		%feature("compactdefaultargs") Edge2;
		%feature("autodoc", "Returns the second edge.

Returns
-------
TopoDS_Edge
") Edge2;
		const TopoDS_Edge Edge2();

		/****************** Range1 ******************/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "Returns the range of first edge.

Returns
-------
IntTools_Range
") Range1;
		const IntTools_Range & Range1();

		/****************** Range1 ******************/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "Returns the range of first edge.

Parameters
----------

Returns
-------
tf: float
tl: float
") Range1;
		void Range1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Ranges2 ******************/
		%feature("compactdefaultargs") Ranges2;
		%feature("autodoc", "Returns the ranges of second edge.

Returns
-------
IntTools_SequenceOfRanges
") Ranges2;
		const IntTools_SequenceOfRanges & Ranges2();

		/****************** SetAllNullFlag ******************/
		%feature("compactdefaultargs") SetAllNullFlag;
		%feature("autodoc", "Selector.

Parameters
----------
aFlag: bool

Returns
-------
None
") SetAllNullFlag;
		void SetAllNullFlag(const Standard_Boolean aFlag);

		/****************** SetBoundingPoints ******************/
		%feature("compactdefaultargs") SetBoundingPoints;
		%feature("autodoc", "Modifier.

Parameters
----------
aP1: gp_Pnt
aP2: gp_Pnt

Returns
-------
None
") SetBoundingPoints;
		void SetBoundingPoints(const gp_Pnt & aP1, const gp_Pnt & aP2);

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "Sets the first edge.

Parameters
----------
anE: TopoDS_Edge

Returns
-------
None
") SetEdge1;
		void SetEdge1(const TopoDS_Edge & anE);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "Sets the second edge.

Parameters
----------
anE: TopoDS_Edge

Returns
-------
None
") SetEdge2;
		void SetEdge2(const TopoDS_Edge & anE);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "Sets the range of first edge.

Parameters
----------
aR: IntTools_Range

Returns
-------
None
") SetRange1;
		void SetRange1(const IntTools_Range & aR);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "Sets the range of first edge.

Parameters
----------
tf: float
tl: float

Returns
-------
None
") SetRange1;
		void SetRange1(const Standard_Real tf, const Standard_Real tl);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets the type of the common part vertex or edge.

Parameters
----------
aType: TopAbs_ShapeEnum

Returns
-------
None
") SetType;
		void SetType(const TopAbs_ShapeEnum aType);

		/****************** SetVertexParameter1 ******************/
		%feature("compactdefaultargs") SetVertexParameter1;
		%feature("autodoc", "Sets a parameter of first vertex.

Parameters
----------
tV: float

Returns
-------
None
") SetVertexParameter1;
		void SetVertexParameter1(const Standard_Real tV);

		/****************** SetVertexParameter2 ******************/
		%feature("compactdefaultargs") SetVertexParameter2;
		%feature("autodoc", "Sets a parameter of second vertex.

Parameters
----------
tV: float

Returns
-------
None
") SetVertexParameter2;
		void SetVertexParameter2(const Standard_Real tV);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of the common part.

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type();

		/****************** VertexParameter1 ******************/
		%feature("compactdefaultargs") VertexParameter1;
		%feature("autodoc", "Returns parameter of first vertex.

Returns
-------
float
") VertexParameter1;
		Standard_Real VertexParameter1();

		/****************** VertexParameter2 ******************/
		%feature("compactdefaultargs") VertexParameter2;
		%feature("autodoc", "Returns parameter of second vertex.

Returns
-------
float
") VertexParameter2;
		Standard_Real VertexParameter2();

};


%extend IntTools_CommonPrt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IntTools_Context *
*************************/
class IntTools_Context : public Standard_Transient {
	public:
		/****************** IntTools_Context ******************/
		%feature("compactdefaultargs") IntTools_Context;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_Context;
		 IntTools_Context();

		/****************** IntTools_Context ******************/
		%feature("compactdefaultargs") IntTools_Context;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") IntTools_Context;
		 IntTools_Context(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** BndBox ******************/
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
Bnd_Box
") BndBox;
		Bnd_Box & BndBox(const TopoDS_Shape & theS);

		/****************** ComputePE ******************/
		%feature("compactdefaultargs") ComputePE;
		%feature("autodoc", "Computes parameter of the point thep on the edge ae. returns zero if the distance between point and edge is less than sum of tolerance value of edge and thetopp, otherwise and for following conditions returns negative value 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3).

Parameters
----------
theP: gp_Pnt
theTolP: float
theE: TopoDS_Edge

Returns
-------
theT: float
theDist: float
") ComputePE;
		Standard_Integer ComputePE(const gp_Pnt & theP, const Standard_Real theTolP, const TopoDS_Edge & theE, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ComputeVE ******************/
		%feature("compactdefaultargs") ComputeVE;
		%feature("autodoc", "Computes parameter of the vertex av on the edge ae and correct tolerance value for the vertex on the edge. returns zero if the distance between vertex and edge is less than sum of tolerances and the fuzzy value, otherwise and for following conditions returns negative value: 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3).

Parameters
----------
theV: TopoDS_Vertex
theE: TopoDS_Edge
theFuzz: float,optional
	default value is Precision::Confusion()

Returns
-------
theT: float
theTol: float
") ComputeVE;
		Standard_Integer ComputeVE(const TopoDS_Vertex & theV, const TopoDS_Edge & theE, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real theFuzz = Precision::Confusion());

		/****************** ComputeVF ******************/
		%feature("compactdefaultargs") ComputeVF;
		%feature("autodoc", "Computes uv parameters of the vertex av on face af and correct tolerance value for the vertex on the face. returns zero if the distance between vertex and face is less than or equal the sum of tolerances and the fuzzy value and the projection point lays inside boundaries of the face. for following conditions returns negative value 1. projection algorithm failed (-1) 2. distance is more than sum of tolerances (-2) 3. projection point out or on the boundaries of face (-3).

Parameters
----------
theVertex: TopoDS_Vertex
theFace: TopoDS_Face
theFuzz: float,optional
	default value is Precision::Confusion()

Returns
-------
theU: float
theV: float
theTol: float
") ComputeVF;
		Standard_Integer ComputeVF(const TopoDS_Vertex & theVertex, const TopoDS_Face & theFace, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real theFuzz = Precision::Confusion());

		/****************** FClass2d ******************/
		%feature("compactdefaultargs") FClass2d;
		%feature("autodoc", "Returns a reference to point classifier for given face.

Parameters
----------
aF: TopoDS_Face

Returns
-------
IntTools_FClass2d
") FClass2d;
		IntTools_FClass2d & FClass2d(const TopoDS_Face & aF);

		/****************** Hatcher ******************/
		%feature("compactdefaultargs") Hatcher;
		%feature("autodoc", "Returns a reference to 2d hatcher for given face.

Parameters
----------
aF: TopoDS_Face

Returns
-------
Geom2dHatch_Hatcher
") Hatcher;
		Geom2dHatch_Hatcher & Hatcher(const TopoDS_Face & aF);

		/****************** IsInfiniteFace ******************/
		%feature("compactdefaultargs") IsInfiniteFace;
		%feature("autodoc", "Returns true if the solid <theface> has infinite bounds.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
bool
") IsInfiniteFace;
		Standard_Boolean IsInfiniteFace(const TopoDS_Face & theFace);

		/****************** IsPointInFace ******************/
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "Returns true if the point ap2d is inside the boundaries of the face af, otherwise returns false.

Parameters
----------
aF: TopoDS_Face
aP2D: gp_Pnt2d

Returns
-------
bool
") IsPointInFace;
		Standard_Boolean IsPointInFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****************** IsPointInFace ******************/
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "Returns true if the point ap2d is inside the boundaries of the face af, otherwise returns false.

Parameters
----------
aP3D: gp_Pnt
aF: TopoDS_Face
aTol: float

Returns
-------
bool
") IsPointInFace;
		Standard_Boolean IsPointInFace(const gp_Pnt & aP3D, const TopoDS_Face & aF, const Standard_Real aTol);

		/****************** IsPointInOnFace ******************/
		%feature("compactdefaultargs") IsPointInOnFace;
		%feature("autodoc", "Returns true if the point ap2d is inside or on the boundaries of af.

Parameters
----------
aF: TopoDS_Face
aP2D: gp_Pnt2d

Returns
-------
bool
") IsPointInOnFace;
		Standard_Boolean IsPointInOnFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****************** IsValidBlockForFace ******************/
		%feature("compactdefaultargs") IsValidBlockForFace;
		%feature("autodoc", "Returns true if isvalidpointforface returns true for some 3d point that lay on the curve aic bounded by parameters at1 and at2.

Parameters
----------
aT1: float
aT2: float
aIC: IntTools_Curve
aF: TopoDS_Face
aTol: float

Returns
-------
bool
") IsValidBlockForFace;
		Standard_Boolean IsValidBlockForFace(const Standard_Real aT1, const Standard_Real aT2, const IntTools_Curve & aIC, const TopoDS_Face & aF, const Standard_Real aTol);

		/****************** IsValidBlockForFaces ******************/
		%feature("compactdefaultargs") IsValidBlockForFaces;
		%feature("autodoc", "Returns true if isvalidblockforface returns true for both faces af1 and af2.

Parameters
----------
aT1: float
aT2: float
aIC: IntTools_Curve
aF1: TopoDS_Face
aF2: TopoDS_Face
aTol: float

Returns
-------
bool
") IsValidBlockForFaces;
		Standard_Boolean IsValidBlockForFaces(const Standard_Real aT1, const Standard_Real aT2, const IntTools_Curve & aIC, const TopoDS_Face & aF1, const TopoDS_Face & aF2, const Standard_Real aTol);

		/****************** IsValidPointForFace ******************/
		%feature("compactdefaultargs") IsValidPointForFace;
		%feature("autodoc", "Returns true if the distance between point ap3d and face af is less or equal to tolerance atol and projection point is inside or on the boundaries of the face af.

Parameters
----------
aP3D: gp_Pnt
aF: TopoDS_Face
aTol: float

Returns
-------
bool
") IsValidPointForFace;
		Standard_Boolean IsValidPointForFace(const gp_Pnt & aP3D, const TopoDS_Face & aF, const Standard_Real aTol);

		/****************** IsValidPointForFaces ******************/
		%feature("compactdefaultargs") IsValidPointForFaces;
		%feature("autodoc", "Returns true if isvalidpointforface returns true for both face af1 and af2.

Parameters
----------
aP3D: gp_Pnt
aF1: TopoDS_Face
aF2: TopoDS_Face
aTol: float

Returns
-------
bool
") IsValidPointForFaces;
		Standard_Boolean IsValidPointForFaces(const gp_Pnt & aP3D, const TopoDS_Face & aF1, const TopoDS_Face & aF2, const Standard_Real aTol);

		/****************** IsVertexOnLine ******************/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "Computes parameter of the vertex av on the curve aic. returns true if the distance between vertex and curve is less than sum of tolerance of av and atolc, otherwise or if projection algorithm failed returns false (in this case at isn't significant).

Parameters
----------
aV: TopoDS_Vertex
aIC: IntTools_Curve
aTolC: float

Returns
-------
aT: float
") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine(const TopoDS_Vertex & aV, const IntTools_Curve & aIC, const Standard_Real aTolC, Standard_Real &OutValue);

		/****************** IsVertexOnLine ******************/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "Computes parameter of the vertex av on the curve aic. returns true if the distance between vertex and curve is less than sum of tolerance of av and atolc, otherwise or if projection algorithm failed returns false (in this case at isn't significant).

Parameters
----------
aV: TopoDS_Vertex
aTolV: float
aIC: IntTools_Curve
aTolC: float

Returns
-------
aT: float
") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine(const TopoDS_Vertex & aV, const Standard_Real aTolV, const IntTools_Curve & aIC, const Standard_Real aTolC, Standard_Real &OutValue);

		/****************** OBB ******************/
		%feature("compactdefaultargs") OBB;
		%feature("autodoc", "Builds and stores an oriented bounding box for the shape. returns a reference to obb.

Parameters
----------
theShape: TopoDS_Shape
theFuzzyValue: float,optional
	default value is Precision::Confusion()

Returns
-------
Bnd_OBB
") OBB;
		Bnd_OBB & OBB(const TopoDS_Shape & theShape, const Standard_Real theFuzzyValue = Precision::Confusion());

		/****************** ProjPC ******************/
		%feature("compactdefaultargs") ProjPC;
		%feature("autodoc", "Returns a reference to point projector for given edge.

Parameters
----------
aE: TopoDS_Edge

Returns
-------
GeomAPI_ProjectPointOnCurve
") ProjPC;
		GeomAPI_ProjectPointOnCurve & ProjPC(const TopoDS_Edge & aE);

		/****************** ProjPS ******************/
		%feature("compactdefaultargs") ProjPS;
		%feature("autodoc", "Returns a reference to point projector for given face.

Parameters
----------
aF: TopoDS_Face

Returns
-------
GeomAPI_ProjectPointOnSurf
") ProjPS;
		GeomAPI_ProjectPointOnSurf & ProjPS(const TopoDS_Face & aF);

		/****************** ProjPT ******************/
		%feature("compactdefaultargs") ProjPT;
		%feature("autodoc", "Returns a reference to point projector for given curve.

Parameters
----------
aC: Geom_Curve

Returns
-------
GeomAPI_ProjectPointOnCurve
") ProjPT;
		GeomAPI_ProjectPointOnCurve & ProjPT(const opencascade::handle<Geom_Curve> & aC);

		/****************** ProjectPointOnEdge ******************/
		%feature("compactdefaultargs") ProjectPointOnEdge;
		%feature("autodoc", "Computes parameter of the point ap on the edge ae. returns false if projection algorithm failed other wiese returns true.

Parameters
----------
aP: gp_Pnt
aE: TopoDS_Edge

Returns
-------
aT: float
") ProjectPointOnEdge;
		Standard_Boolean ProjectPointOnEdge(const gp_Pnt & aP, const TopoDS_Edge & aE, Standard_Real &OutValue);

		/****************** SetPOnSProjectionTolerance ******************/
		%feature("compactdefaultargs") SetPOnSProjectionTolerance;
		%feature("autodoc", "Sets tolerance to be used for projection of point on surface. clears map of already cached projectors in order to maintain correct value for all projectors.

Parameters
----------
theValue: float

Returns
-------
None
") SetPOnSProjectionTolerance;
		void SetPOnSProjectionTolerance(const Standard_Real theValue);

		/****************** SolidClassifier ******************/
		%feature("compactdefaultargs") SolidClassifier;
		%feature("autodoc", "Returns a reference to solid classifier for given solid.

Parameters
----------
aSolid: TopoDS_Solid

Returns
-------
BRepClass3d_SolidClassifier
") SolidClassifier;
		BRepClass3d_SolidClassifier & SolidClassifier(const TopoDS_Solid & aSolid);

		/****************** StatePointFace ******************/
		%feature("compactdefaultargs") StatePointFace;
		%feature("autodoc", "Returns the state of the point ap2d relative to face af.

Parameters
----------
aF: TopoDS_Face
aP2D: gp_Pnt2d

Returns
-------
TopAbs_State
") StatePointFace;
		TopAbs_State StatePointFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****************** SurfaceAdaptor ******************/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "Returns a reference to surface adaptor for given face.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
BRepAdaptor_Surface
") SurfaceAdaptor;
		BRepAdaptor_Surface & SurfaceAdaptor(const TopoDS_Face & theFace);

		/****************** SurfaceData ******************/
		%feature("compactdefaultargs") SurfaceData;
		%feature("autodoc", "Returns a reference to surface localization data for given face.

Parameters
----------
aF: TopoDS_Face

Returns
-------
IntTools_SurfaceRangeLocalizeData
") SurfaceData;
		IntTools_SurfaceRangeLocalizeData & SurfaceData(const TopoDS_Face & aF);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "Computes the boundaries of the face using surface adaptor.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
UMin: float
UMax: float
VMin: float
VMax: float
") UVBounds;
		void UVBounds(const TopoDS_Face & theFace, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%make_alias(IntTools_Context)

%extend IntTools_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntTools_Curve *
***********************/
class IntTools_Curve {
	public:
		/****************** IntTools_Curve ******************/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_Curve;
		 IntTools_Curve();

		/****************** IntTools_Curve ******************/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "Constructor taking 3d curve, two 2d curves and two tolerance values.

Parameters
----------
the3dCurve3d: Geom_Curve
the2dCurve1: Geom2d_Curve
the2dCurve2: Geom2d_Curve
theTolerance: float,optional
	default value is 0.0
theTangentialTolerance: float,optional
	default value is 0.0

Returns
-------
None
") IntTools_Curve;
		 IntTools_Curve(const opencascade::handle<Geom_Curve> & the3dCurve3d, const opencascade::handle<Geom2d_Curve> & the2dCurve1, const opencascade::handle<Geom2d_Curve> & the2dCurve2, const Standard_Real theTolerance = 0.0, const Standard_Real theTangentialTolerance = 0.0);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "If the 3d curve is bounded curve the method will return true and modify the output parameters with boundary parameters of the curve and corresponded 3d points. if the curve does not have bounds, the method will return false and the output parameters will stay untouched.

Parameters
----------
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Returns
-------
theFirst: float
theLast: float
") Bounds;
		Standard_Boolean Bounds(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns 3d curve.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes 3d point corresponded to the given parameter if this parameter is inside the boundaries of the curve. returns true in this case. otherwise, the point will not be computed and the method will return false.

Parameters
----------
thePar: float
thePnt: gp_Pnt

Returns
-------
bool
") D0;
		Standard_Boolean D0(const Standard_Real & thePar, gp_Pnt & thePnt);

		/****************** FirstCurve2d ******************/
		%feature("compactdefaultargs") FirstCurve2d;
		%feature("autodoc", "Returns first 2d curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") FirstCurve2d;
		const opencascade::handle<Geom2d_Curve> & FirstCurve2d();

		/****************** HasBounds ******************/
		%feature("compactdefaultargs") HasBounds;
		%feature("autodoc", "Returns true if 3d curve is boundedcurve.

Returns
-------
bool
") HasBounds;
		Standard_Boolean HasBounds();

		/****************** SecondCurve2d ******************/
		%feature("compactdefaultargs") SecondCurve2d;
		%feature("autodoc", "Returns second 2d curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") SecondCurve2d;
		const opencascade::handle<Geom2d_Curve> & SecondCurve2d();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "Sets the 3d curve.

Parameters
----------
the3dCurve: Geom_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<Geom_Curve> & the3dCurve);

		/****************** SetCurves ******************/
		%feature("compactdefaultargs") SetCurves;
		%feature("autodoc", "Sets the curves.

Parameters
----------
the3dCurve: Geom_Curve
the2dCurve1: Geom2d_Curve
the2dCurve2: Geom2d_Curve

Returns
-------
None
") SetCurves;
		void SetCurves(const opencascade::handle<Geom_Curve> & the3dCurve, const opencascade::handle<Geom2d_Curve> & the2dCurve1, const opencascade::handle<Geom2d_Curve> & the2dCurve2);

		/****************** SetFirstCurve2d ******************/
		%feature("compactdefaultargs") SetFirstCurve2d;
		%feature("autodoc", "Sets the first 2d curve.

Parameters
----------
the2dCurve1: Geom2d_Curve

Returns
-------
None
") SetFirstCurve2d;
		void SetFirstCurve2d(const opencascade::handle<Geom2d_Curve> & the2dCurve1);

		/****************** SetSecondCurve2d ******************/
		%feature("compactdefaultargs") SetSecondCurve2d;
		%feature("autodoc", "Sets the second 2d curve.

Parameters
----------
the2dCurve2: Geom2d_Curve

Returns
-------
None
") SetSecondCurve2d;
		void SetSecondCurve2d(const opencascade::handle<Geom2d_Curve> & the2dCurve2);

		/****************** SetTangentialTolerance ******************/
		%feature("compactdefaultargs") SetTangentialTolerance;
		%feature("autodoc", "Sets the tangential tolerance.

Parameters
----------
theTangentialTolerance: float

Returns
-------
None
") SetTangentialTolerance;
		void SetTangentialTolerance(const Standard_Real theTangentialTolerance);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the tolerance for the curve.

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** TangentialTolerance ******************/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "Returns the tangential tolerance.

Returns
-------
float
") TangentialTolerance;
		Standard_Real TangentialTolerance();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of the 3d curve.

Returns
-------
GeomAbs_CurveType
") Type;
		GeomAbs_CurveType Type();

};


%extend IntTools_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntTools_CurveRangeLocalizeData *
****************************************/
class IntTools_CurveRangeLocalizeData {
	public:
		/****************** IntTools_CurveRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_CurveRangeLocalizeData;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNbSample: int
theMinRange: float

Returns
-------
None
") IntTools_CurveRangeLocalizeData;
		 IntTools_CurveRangeLocalizeData(const Standard_Integer theNbSample, const Standard_Real theMinRange);

		/****************** AddBox ******************/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_CurveRangeSample
theBox: Bnd_Box

Returns
-------
None
") AddBox;
		void AddBox(const IntTools_CurveRangeSample & theRange, const Bnd_Box & theBox);

		/****************** AddOutRange ******************/
		%feature("compactdefaultargs") AddOutRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_CurveRangeSample

Returns
-------
None
") AddOutRange;
		void AddOutRange(const IntTools_CurveRangeSample & theRange);

		/****************** FindBox ******************/
		%feature("compactdefaultargs") FindBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_CurveRangeSample
theBox: Bnd_Box

Returns
-------
bool
") FindBox;
		Standard_Boolean FindBox(const IntTools_CurveRangeSample & theRange, Bnd_Box & theBox);

		/****************** GetMinRange ******************/
		%feature("compactdefaultargs") GetMinRange;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMinRange;
		Standard_Real GetMinRange();

		/****************** GetNbSample ******************/
		%feature("compactdefaultargs") GetNbSample;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetNbSample;
		Standard_Integer GetNbSample();

		/****************** IsRangeOut ******************/
		%feature("compactdefaultargs") IsRangeOut;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_CurveRangeSample

Returns
-------
bool
") IsRangeOut;
		Standard_Boolean IsRangeOut(const IntTools_CurveRangeSample & theRange);

		/****************** ListRangeOut ******************/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", "No available documentation.

Parameters
----------
theList: IntTools_ListOfCurveRangeSample

Returns
-------
None
") ListRangeOut;
		void ListRangeOut(IntTools_ListOfCurveRangeSample & theList);

};


%extend IntTools_CurveRangeLocalizeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IntTools_CurveRangeSampleMapHasher *
*******************************************/
class IntTools_CurveRangeSampleMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given key, in the range [1, theupperbound] @param thekey the key which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theKey: IntTools_CurveRangeSample
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const IntTools_CurveRangeSample & theKey, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same. two same keys must have the same hashcode, the contrary is not necessary.

Parameters
----------
S1: IntTools_CurveRangeSample
S2: IntTools_CurveRangeSample

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const IntTools_CurveRangeSample & S1, const IntTools_CurveRangeSample & S2);

};


%extend IntTools_CurveRangeSampleMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_EdgeEdge *
**************************/
class IntTools_EdgeEdge {
	public:
		/****************** IntTools_EdgeEdge ******************/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge();

		/****************** IntTools_EdgeEdge ******************/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "Contructor.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge

Returns
-------
None
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2);

		/****************** IntTools_EdgeEdge ******************/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "Contructor.

Parameters
----------
theEdge1: TopoDS_Edge
aT11: float
aT12: float
theEdge2: TopoDS_Edge
aT21: float
aT22: float

Returns
-------
None
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge(const TopoDS_Edge & theEdge1, const Standard_Real aT11, const Standard_Real aT12, const TopoDS_Edge & theEdge2, const Standard_Real aT21, const Standard_Real aT22);

		/****************** CommonParts ******************/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Returns common parts.

Returns
-------
IntTools_SequenceOfCommonPrts
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts();

		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns fuzzy value.

Returns
-------
float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** IsCoincidenceCheckedQuickly ******************/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Returns the flag myquickcoincidencecheck.

Returns
-------
bool
") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if common part(s) is(are) found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between edges.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "Sets the first edge.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
None
") SetEdge1;
		void SetEdge1(const TopoDS_Edge & theEdge);

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "Sets the first edge and its range.

Parameters
----------
theEdge: TopoDS_Edge
aT1: float
aT2: float

Returns
-------
None
") SetEdge1;
		void SetEdge1(const TopoDS_Edge & theEdge, const Standard_Real aT1, const Standard_Real aT2);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "Sets the second edge.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
None
") SetEdge2;
		void SetEdge2(const TopoDS_Edge & theEdge);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "Sets the first edge and its range.

Parameters
----------
theEdge: TopoDS_Edge
aT1: float
aT2: float

Returns
-------
None
") SetEdge2;
		void SetEdge2(const TopoDS_Edge & theEdge, const Standard_Real aT1, const Standard_Real aT2);

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "Sets the fuzzy value.

Parameters
----------
theFuzz: float

Returns
-------
None
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "Sets the range for the first edge.

Parameters
----------
theRange1: IntTools_Range

Returns
-------
None
") SetRange1;
		void SetRange1(const IntTools_Range & theRange1);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "Sets the range for the first edge.

Parameters
----------
aT1: float
aT2: float

Returns
-------
None
") SetRange1;
		void SetRange1(const Standard_Real aT1, const Standard_Real aT2);

		/****************** SetRange2 ******************/
		%feature("compactdefaultargs") SetRange2;
		%feature("autodoc", "Sets the range for the second edge.

Parameters
----------
theRange: IntTools_Range

Returns
-------
None
") SetRange2;
		void SetRange2(const IntTools_Range & theRange);

		/****************** SetRange2 ******************/
		%feature("compactdefaultargs") SetRange2;
		%feature("autodoc", "Sets the range for the second edge.

Parameters
----------
aT1: float
aT2: float

Returns
-------
None
") SetRange2;
		void SetRange2(const Standard_Real aT1, const Standard_Real aT2);

		/****************** UseQuickCoincidenceCheck ******************/
		%feature("compactdefaultargs") UseQuickCoincidenceCheck;
		%feature("autodoc", "Sets the flag myquickcoincidencecheck.

Parameters
----------
bFlag: bool

Returns
-------
None
") UseQuickCoincidenceCheck;
		void UseQuickCoincidenceCheck(const Standard_Boolean bFlag);

};


%extend IntTools_EdgeEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_EdgeFace *
**************************/
class IntTools_EdgeFace {
	public:
		/****************** IntTools_EdgeFace ******************/
		%feature("compactdefaultargs") IntTools_EdgeFace;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_EdgeFace;
		 IntTools_EdgeFace();

		/****************** CommonParts ******************/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Returns resulting common parts.

Returns
-------
IntTools_SequenceOfCommonPrts
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the intersection context.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Returns the code of completion: 0 - means successful completion; 1 - the process was not started; 2,3 - invalid source data for the algorithm; 4 - projection failed.

Returns
-------
int
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns the fuzzy value.

Returns
-------
float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** IsCoincidenceCheckedQuickly ******************/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Returns the flag myquickcoincidencecheck.

Returns
-------
bool
") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if computation was successful. otherwise returns false.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Launches the process.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Returns intersection range of the edge.

Returns
-------
IntTools_Range
") Range;
		const IntTools_Range & Range();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the intersection context.

Parameters
----------
theContext: IntTools_Context

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "Sets the edge for intersection.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
None
") SetEdge;
		void SetEdge(const TopoDS_Edge & theEdge);

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Sets the face for intersection.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & theFace);

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "Sets the fuzzy value.

Parameters
----------
theFuzz: float

Returns
-------
None
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "Sets the boundaries for the edge. the algorithm processes edge inside these boundaries.

Parameters
----------
theRange: IntTools_Range

Returns
-------
None
") SetRange;
		void SetRange(const IntTools_Range & theRange);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "Sets the boundaries for the edge. the algorithm processes edge inside these boundaries.

Parameters
----------
theFirst: float
theLast: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Real theFirst, const Standard_Real theLast);

		/****************** UseQuickCoincidenceCheck ******************/
		%feature("compactdefaultargs") UseQuickCoincidenceCheck;
		%feature("autodoc", "Sets the flag for quick coincidence check. it is safe to use the quick check for coincidence only if both of the following conditions are met: - the vertices of edge are lying on the face; - the edge does not intersect the boundaries of the face on the given range.

Parameters
----------
theFlag: bool

Returns
-------
None
") UseQuickCoincidenceCheck;
		void UseQuickCoincidenceCheck(const Standard_Boolean theFlag);

};


%extend IntTools_EdgeFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_FClass2d *
**************************/
class IntTools_FClass2d {
	public:
		/****************** IntTools_FClass2d ******************/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_FClass2d;
		 IntTools_FClass2d();

		/****************** IntTools_FClass2d ******************/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "Initializes algorithm by the face f and tolerance tol.

Parameters
----------
F: TopoDS_Face
Tol: float

Returns
-------
None
") IntTools_FClass2d;
		 IntTools_FClass2d(const TopoDS_Face & F, const Standard_Real Tol);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes algorithm by the face f and tolerance tol.

Parameters
----------
F: TopoDS_Face
Tol: float

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F, const Standard_Real Tol);

		/****************** IsHole ******************/
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsHole;
		Standard_Boolean IsHole();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Returns state of the 2d point puv. if recadreonperiodic is true (defalut value), for the periodic surface 2d point, adjusted to period, is classified.

Parameters
----------
Puv: gp_Pnt2d
RecadreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
TopAbs_State
") Perform;
		TopAbs_State Perform(const gp_Pnt2d & Puv, const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** PerformInfinitePoint ******************/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "Returns state of infinite 2d point relatively to (0, 0).

Returns
-------
TopAbs_State
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint();

		/****************** TestOnRestriction ******************/
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "Test a point with +- an offset (tol) and returns on if some points are out an some are in (caution: internal use . see the code for more details).

Parameters
----------
Puv: gp_Pnt2d
Tol: float
RecadreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
TopAbs_State
") TestOnRestriction;
		TopAbs_State TestOnRestriction(const gp_Pnt2d & Puv, const Standard_Real Tol, const Standard_Boolean RecadreOnPeriodic = Standard_True);

};


%extend IntTools_FClass2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_FaceFace *
**************************/
class IntTools_FaceFace {
	public:
		/****************** IntTools_FaceFace ******************/
		%feature("compactdefaultargs") IntTools_FaceFace;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_FaceFace;
		 IntTools_FaceFace();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Gets the intersecton context.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Face1 ******************/
		%feature("compactdefaultargs") Face1;
		%feature("autodoc", "Returns first of processed faces.

Returns
-------
TopoDS_Face
") Face1;
		const TopoDS_Face Face1();

		/****************** Face2 ******************/
		%feature("compactdefaultargs") Face2;
		%feature("autodoc", "Returns second of processed faces.

Returns
-------
TopoDS_Face
") Face2;
		const TopoDS_Face Face2();

		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns fuzzy value.

Returns
-------
float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the intersection was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Lines ******************/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "Returns sequence of 3d curves as result of intersection.

Returns
-------
IntTools_SequenceOfCurves
") Lines;
		const IntTools_SequenceOfCurves & Lines();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects underliing surfaces of f1 and f2 use sum of tolerance of f1 and f2 as intersection criteria.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns sequence of 3d curves as result of intersection.

Returns
-------
IntTools_SequenceOfPntOn2Faces
") Points;
		const IntTools_SequenceOfPntOn2Faces & Points();

		/****************** PrepareLines3D ******************/
		%feature("compactdefaultargs") PrepareLines3D;
		%feature("autodoc", "Provides post-processing the result lines. <btosplit> - the flag. in case of <btosplit> is true the closed 3d-curves will be splitted on parts. in case of <btosplit> is false the closed 3d-curves remain untouched.

Parameters
----------
bToSplit: bool,optional
	default value is Standard_True

Returns
-------
None
") PrepareLines3D;
		void PrepareLines3D(const Standard_Boolean bToSplit = Standard_True);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the intersecton context.

Parameters
----------
aContext: IntTools_Context

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & aContext);

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "Sets the fuzzy value.

Parameters
----------
theFuzz: float

Returns
-------
None
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "No available documentation.

Parameters
----------
ListOfPnts: IntSurf_ListOfPntOn2S

Returns
-------
None
") SetList;
		void SetList(IntSurf_ListOfPntOn2S & ListOfPnts);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Modifier.

Parameters
----------
ApproxCurves: bool
ComputeCurveOnS1: bool
ComputeCurveOnS2: bool
ApproximationTolerance: float

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Boolean ApproxCurves, const Standard_Boolean ComputeCurveOnS1, const Standard_Boolean ComputeCurveOnS2, const Standard_Real ApproximationTolerance);

		/****************** TangentFaces ******************/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Returns true if faces are tangent.

Returns
-------
bool
") TangentFaces;
		Standard_Boolean TangentFaces();

};


%extend IntTools_FaceFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IntTools_MarkedRangeSet *
********************************/
class IntTools_MarkedRangeSet {
	public:
		/****************** IntTools_MarkedRangeSet ******************/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet();

		/****************** IntTools_MarkedRangeSet ******************/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "Build set of ranges which consists of one range with boundary values thefirstboundary and thelastboundary.

Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theInitFlag: int

Returns
-------
None
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theInitFlag);

		/****************** IntTools_MarkedRangeSet ******************/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "Build set of ranges based on the array of progressive sorted values //! warning: the constructor do not check if the values of array are not sorted it should be checked before function invocation.

Parameters
----------
theSortedArray: IntTools_CArray1OfReal
theInitFlag: int

Returns
-------
None
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet(const IntTools_CArray1OfReal & theSortedArray, const Standard_Integer theInitFlag);

		/****************** Flag ******************/
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "Returns flag of the range with index theindex.

Parameters
----------
theIndex: int

Returns
-------
int
") Flag;
		Standard_Integer Flag(const Standard_Integer theIndex);

		/****************** GetIndex ******************/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "Returns index of range which contains thevalue. if thevalue do not belong any range returns 0.

Parameters
----------
theValue: float

Returns
-------
int
") GetIndex;
		Standard_Integer GetIndex(const Standard_Real theValue);

		/****************** GetIndex ******************/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "Returns index of range which contains thevalue if thevalue do not belong any range returns 0. if uselower is standard_true then lower boundary of the range can be equal to thevalue, otherwise upper boundary of the range can be equal to thevalue.

Parameters
----------
theValue: float
UseLower: bool

Returns
-------
int
") GetIndex;
		Standard_Integer GetIndex(const Standard_Real theValue, const Standard_Boolean UseLower);

		/****************** GetIndices ******************/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: float

Returns
-------
TColStd_SequenceOfInteger
") GetIndices;
		const TColStd_SequenceOfInteger & GetIndices(const Standard_Real theValue);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "Inserts a new range marked with flag theflag it replace the existing ranges or parts of ranges and their flags. returns true if the range is inside the initial boundaries, otherwise or in case of some error returns false.

Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theFlag: int

Returns
-------
bool
") InsertRange;
		Standard_Boolean InsertRange(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theFlag);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "Inserts a new range marked with flag theflag it replace the existing ranges or parts of ranges and their flags. returns true if the range is inside the initial boundaries, otherwise or in case of some error returns false.

Parameters
----------
theRange: IntTools_Range
theFlag: int

Returns
-------
bool
") InsertRange;
		Standard_Boolean InsertRange(const IntTools_Range & theRange, const Standard_Integer theFlag);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "Inserts a new range marked with flag theflag it replace the existing ranges or parts of ranges and their flags. the index theindex is a position where the range will be inserted. returns true if the range is inside the initial boundaries, otherwise or in case of some error returns false.

Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theFlag: int
theIndex: int

Returns
-------
bool
") InsertRange;
		Standard_Boolean InsertRange(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theFlag, const Standard_Integer theIndex);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "Inserts a new range marked with flag theflag it replace the existing ranges or parts of ranges and their flags. the index theindex is a position where the range will be inserted. returns true if the range is inside the initial boundaries, otherwise or in case of some error returns false.

Parameters
----------
theRange: IntTools_Range
theFlag: int
theIndex: int

Returns
-------
bool
") InsertRange;
		Standard_Boolean InsertRange(const IntTools_Range & theRange, const Standard_Integer theFlag, const Standard_Integer theIndex);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns number of ranges.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Returns the range with index theindex. the index can be from 1 to length().

Parameters
----------
theIndex: int

Returns
-------
IntTools_Range
") Range;
		IntTools_Range Range(const Standard_Integer theIndex);

		/****************** SetBoundaries ******************/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "Build set of ranges which consists of one range with boundary values thefirstboundary and thelastboundary.

Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theInitFlag: int

Returns
-------
None
") SetBoundaries;
		void SetBoundaries(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theInitFlag);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "Set flag theflag for range with index theindex.

Parameters
----------
theIndex: int
theFlag: int

Returns
-------
None
") SetFlag;
		void SetFlag(const Standard_Integer theIndex, const Standard_Integer theFlag);

		/****************** SetRanges ******************/
		%feature("compactdefaultargs") SetRanges;
		%feature("autodoc", "Build set of ranges based on the array of progressive sorted values //! warning: the function do not check if the values of array are not sorted it should be checked before function invocation.

Parameters
----------
theSortedArray: IntTools_CArray1OfReal
theInitFlag: int

Returns
-------
None
") SetRanges;
		void SetRanges(const IntTools_CArray1OfReal & theSortedArray, const Standard_Integer theInitFlag);

};


%extend IntTools_MarkedRangeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntTools_PntOn2Faces *
*****************************/
class IntTools_PntOn2Faces {
	public:
		/****************** IntTools_PntOn2Faces ******************/
		%feature("compactdefaultargs") IntTools_PntOn2Faces;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces();

		/****************** IntTools_PntOn2Faces ******************/
		%feature("compactdefaultargs") IntTools_PntOn2Faces;
		%feature("autodoc", "Initializes me by two points ap1 and ap2.

Parameters
----------
aP1: IntTools_PntOnFace
aP2: IntTools_PntOnFace

Returns
-------
None
") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces(const IntTools_PntOnFace & aP1, const IntTools_PntOnFace & aP2);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Selector.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** P1 ******************/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "Selector.

Returns
-------
IntTools_PntOnFace
") P1;
		const IntTools_PntOnFace & P1();

		/****************** P2 ******************/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "Selector.

Returns
-------
IntTools_PntOnFace
") P2;
		const IntTools_PntOnFace & P2();

		/****************** SetP1 ******************/
		%feature("compactdefaultargs") SetP1;
		%feature("autodoc", "Modifier.

Parameters
----------
aP1: IntTools_PntOnFace

Returns
-------
None
") SetP1;
		void SetP1(const IntTools_PntOnFace & aP1);

		/****************** SetP2 ******************/
		%feature("compactdefaultargs") SetP2;
		%feature("autodoc", "Modifier.

Parameters
----------
aP2: IntTools_PntOnFace

Returns
-------
None
") SetP2;
		void SetP2(const IntTools_PntOnFace & aP2);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "Modifier.

Parameters
----------
bF: bool

Returns
-------
None
") SetValid;
		void SetValid(const Standard_Boolean bF);

};


%extend IntTools_PntOn2Faces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntTools_PntOnFace *
***************************/
class IntTools_PntOnFace {
	public:
		/****************** IntTools_PntOnFace ******************/
		%feature("compactdefaultargs") IntTools_PntOnFace;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_PntOnFace;
		 IntTools_PntOnFace();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Selector.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes me by aface, a 3d point and it's uv parameters on face.

Parameters
----------
aF: TopoDS_Face
aP: gp_Pnt
U: float
V: float

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & aF, const gp_Pnt & aP, const Standard_Real U, const Standard_Real V);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Selector.

Parameters
----------

Returns
-------
U: float
V: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Selector.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Modifier.

Parameters
----------
aF: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & aF);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Modifier.

Parameters
----------
U: float
V: float

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real U, const Standard_Real V);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "Modifier.

Parameters
----------
aP: gp_Pnt

Returns
-------
None
") SetPnt;
		void SetPnt(const gp_Pnt & aP);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "Modifier.

Parameters
----------
bF: bool

Returns
-------
None
") SetValid;
		void SetValid(const Standard_Boolean bF);

		/****************** Valid ******************/
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", "Selector.

Returns
-------
bool
") Valid;
		Standard_Boolean Valid();

};


%extend IntTools_PntOnFace {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsValid(self):
		pass
	}
};

/***********************
* class IntTools_Range *
***********************/
class IntTools_Range {
	public:
		/****************** IntTools_Range ******************/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_Range;
		 IntTools_Range();

		/****************** IntTools_Range ******************/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "Initialize me by range boundaries.

Parameters
----------
aFirst: float
aLast: float

Returns
-------
None
") IntTools_Range;
		 IntTools_Range(const Standard_Real aFirst, const Standard_Real aLast);

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Selector.

Returns
-------
float
") First;
		Standard_Real First();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Selector.

Returns
-------
float
") Last;
		Standard_Real Last();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Selector.

Parameters
----------

Returns
-------
aFirst: float
aLast: float
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetFirst ******************/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "Modifier.

Parameters
----------
aFirst: float

Returns
-------
None
") SetFirst;
		void SetFirst(const Standard_Real aFirst);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "Modifier.

Parameters
----------
aLast: float

Returns
-------
None
") SetLast;
		void SetLast(const Standard_Real aLast);

};


%extend IntTools_Range {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntTools_Root *
**********************/
class IntTools_Root {
	public:
		/****************** IntTools_Root ******************/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_Root;
		 IntTools_Root();

		/****************** IntTools_Root ******************/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "Initializes my by range of parameters and type of root.

Parameters
----------
aRoot: float
aType: int

Returns
-------
None
") IntTools_Root;
		 IntTools_Root(const Standard_Real aRoot, const Standard_Integer aType);

		/****************** Interval ******************/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "Returns the values of interval from which the root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).

Parameters
----------

Returns
-------
t1: float
t2: float
f1: float
f2: float
") Interval;
		void Interval(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns the validity flag for the root, true if mystatebefore==topabs_out && mystateafter==topabs_in or mystatebefore==topabs_out && mystateafter==topabs_on or mystatebefore==topabs_on && mystateafter==topabs_out or mystatebefore==topabs_in && mystateafter==topabs_out . for other cases it returns false.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** LayerHeight ******************/
		%feature("compactdefaultargs") LayerHeight;
		%feature("autodoc", "Not used in edge/edge algorithm.

Returns
-------
float
") LayerHeight;
		Standard_Real LayerHeight();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the root value.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the interval from which the root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).

Parameters
----------
t1: float
t2: float
f1: float
f2: float

Returns
-------
None
") SetInterval;
		void SetInterval(const Standard_Real t1, const Standard_Real t2, const Standard_Real f1, const Standard_Real f2);

		/****************** SetLayerHeight ******************/
		%feature("compactdefaultargs") SetLayerHeight;
		%feature("autodoc", "Not used in edge/edge algorithm.

Parameters
----------
aHeight: float

Returns
-------
None
") SetLayerHeight;
		void SetLayerHeight(const Standard_Real aHeight);

		/****************** SetRoot ******************/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "Sets the root's value.

Parameters
----------
aRoot: float

Returns
-------
None
") SetRoot;
		void SetRoot(const Standard_Real aRoot);

		/****************** SetStateAfter ******************/
		%feature("compactdefaultargs") SetStateAfter;
		%feature("autodoc", "Set the value of the state after the root (at t=root-dt).

Parameters
----------
aState: TopAbs_State

Returns
-------
None
") SetStateAfter;
		void SetStateAfter(const TopAbs_State aState);

		/****************** SetStateBefore ******************/
		%feature("compactdefaultargs") SetStateBefore;
		%feature("autodoc", "Set the value of the state before the root (at t=root-dt).

Parameters
----------
aState: TopAbs_State

Returns
-------
None
") SetStateBefore;
		void SetStateBefore(const TopAbs_State aState);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets the root's type.

Parameters
----------
aType: int

Returns
-------
None
") SetType;
		void SetType(const Standard_Integer aType);

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the state after the root.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Returns the state before the root.

Returns
-------
TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of the root =0 - simple (was found by bisection method); =2 - smart when f1=0, f2!=0 or vice versa (was found by fibbonacci method); =1 - pure (pure zero for all t [t1,t2] );.

Returns
-------
int
") Type;
		Standard_Integer Type();

};


%extend IntTools_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntTools_ShrunkRange *
*****************************/
class IntTools_ShrunkRange {
	public:
		/****************** IntTools_ShrunkRange ******************/
		%feature("compactdefaultargs") IntTools_ShrunkRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_ShrunkRange;
		 IntTools_ShrunkRange();

		/****************** BndBox ******************/
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") BndBox;
		const Bnd_Box & BndBox();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true in case the shrunk range is computed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSplittable ******************/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "Returns false in case the shrunk range is too short and the edge cannot be split, otherwise returns true.

Returns
-------
bool
") IsSplittable;
		Standard_Boolean IsSplittable();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the edge if computed.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCtx: IntTools_Context

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & aCtx);

		/****************** SetData ******************/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "No available documentation.

Parameters
----------
aE: TopoDS_Edge
aT1: float
aT2: float
aV1: TopoDS_Vertex
aV2: TopoDS_Vertex

Returns
-------
None
") SetData;
		void SetData(const TopoDS_Edge & aE, const Standard_Real aT1, const Standard_Real aT2, const TopoDS_Vertex & aV1, const TopoDS_Vertex & aV2);

		/****************** SetShrunkRange ******************/
		%feature("compactdefaultargs") SetShrunkRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
aT1: float
aT2: float

Returns
-------
None
") SetShrunkRange;
		void SetShrunkRange(const Standard_Real aT1, const Standard_Real aT2);

		/****************** ShrunkRange ******************/
		%feature("compactdefaultargs") ShrunkRange;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
aT1: float
aT2: float
") ShrunkRange;
		void ShrunkRange(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend IntTools_ShrunkRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IntTools_SurfaceRangeLocalizeData *
******************************************/
class IntTools_SurfaceRangeLocalizeData {
	public:
		/****************** IntTools_SurfaceRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData();

		/****************** IntTools_SurfaceRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNbSampleU: int
theNbSampleV: int
theMinRangeU: float
theMinRangeV: float

Returns
-------
None
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData(const Standard_Integer theNbSampleU, const Standard_Integer theNbSampleV, const Standard_Real theMinRangeU, const Standard_Real theMinRangeV);

		/****************** IntTools_SurfaceRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntTools_SurfaceRangeLocalizeData

Returns
-------
None
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData(const IntTools_SurfaceRangeLocalizeData & Other);

		/****************** AddBox ******************/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_SurfaceRangeSample
theBox: Bnd_Box

Returns
-------
None
") AddBox;
		void AddBox(const IntTools_SurfaceRangeSample & theRange, const Bnd_Box & theBox);

		/****************** AddOutRange ******************/
		%feature("compactdefaultargs") AddOutRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_SurfaceRangeSample

Returns
-------
None
") AddOutRange;
		void AddOutRange(const IntTools_SurfaceRangeSample & theRange);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntTools_SurfaceRangeLocalizeData

Returns
-------
IntTools_SurfaceRangeLocalizeData
") Assign;
		IntTools_SurfaceRangeLocalizeData & Assign(const IntTools_SurfaceRangeLocalizeData & Other);

		/****************** ClearGrid ******************/
		%feature("compactdefaultargs") ClearGrid;
		%feature("autodoc", "Clears the grid of points.

Returns
-------
None
") ClearGrid;
		void ClearGrid();

		/****************** FindBox ******************/
		%feature("compactdefaultargs") FindBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_SurfaceRangeSample
theBox: Bnd_Box

Returns
-------
bool
") FindBox;
		Standard_Boolean FindBox(const IntTools_SurfaceRangeSample & theRange, Bnd_Box & theBox);

		/****************** GetGridDeflection ******************/
		%feature("compactdefaultargs") GetGridDeflection;
		%feature("autodoc", "Query the grid deflection.

Returns
-------
float
") GetGridDeflection;
		Standard_Real GetGridDeflection();

		/****************** GetGridPoint ******************/
		%feature("compactdefaultargs") GetGridPoint;
		%feature("autodoc", "Set the grid point.

Parameters
----------
theUIndex: int
theVIndex: int

Returns
-------
gp_Pnt
") GetGridPoint;
		const gp_Pnt GetGridPoint(const Standard_Integer theUIndex, const Standard_Integer theVIndex);

		/****************** GetMinRangeU ******************/
		%feature("compactdefaultargs") GetMinRangeU;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMinRangeU;
		Standard_Real GetMinRangeU();

		/****************** GetMinRangeV ******************/
		%feature("compactdefaultargs") GetMinRangeV;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMinRangeV;
		Standard_Real GetMinRangeV();

		/****************** GetNBUPointsInFrame ******************/
		%feature("compactdefaultargs") GetNBUPointsInFrame;
		%feature("autodoc", "Returns the number of grid points on u direction in frame.

Returns
-------
int
") GetNBUPointsInFrame;
		Standard_Integer GetNBUPointsInFrame();

		/****************** GetNBVPointsInFrame ******************/
		%feature("compactdefaultargs") GetNBVPointsInFrame;
		%feature("autodoc", "Returns the number of grid points on v direction in frame.

Returns
-------
int
") GetNBVPointsInFrame;
		Standard_Integer GetNBVPointsInFrame();

		/****************** GetNbSampleU ******************/
		%feature("compactdefaultargs") GetNbSampleU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetNbSampleU;
		Standard_Integer GetNbSampleU();

		/****************** GetNbSampleV ******************/
		%feature("compactdefaultargs") GetNbSampleV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetNbSampleV;
		Standard_Integer GetNbSampleV();

		/****************** GetPointInFrame ******************/
		%feature("compactdefaultargs") GetPointInFrame;
		%feature("autodoc", "Returns the grid point in frame.

Parameters
----------
theUIndex: int
theVIndex: int

Returns
-------
gp_Pnt
") GetPointInFrame;
		const gp_Pnt GetPointInFrame(const Standard_Integer theUIndex, const Standard_Integer theVIndex);

		/****************** GetRangeUGrid ******************/
		%feature("compactdefaultargs") GetRangeUGrid;
		%feature("autodoc", "Query the range u of the grid of points.

Returns
-------
int
") GetRangeUGrid;
		Standard_Integer GetRangeUGrid();

		/****************** GetRangeVGrid ******************/
		%feature("compactdefaultargs") GetRangeVGrid;
		%feature("autodoc", "Query the range v of the grid of points.

Returns
-------
int
") GetRangeVGrid;
		Standard_Integer GetRangeVGrid();

		/****************** GetUParam ******************/
		%feature("compactdefaultargs") GetUParam;
		%feature("autodoc", "Query the u parameter of the grid points at that index.

Parameters
----------
theIndex: int

Returns
-------
float
") GetUParam;
		Standard_Real GetUParam(const Standard_Integer theIndex);

		/****************** GetUParamInFrame ******************/
		%feature("compactdefaultargs") GetUParamInFrame;
		%feature("autodoc", "Query the u parameter of the grid points at that index in frame.

Parameters
----------
theIndex: int

Returns
-------
float
") GetUParamInFrame;
		Standard_Real GetUParamInFrame(const Standard_Integer theIndex);

		/****************** GetVParam ******************/
		%feature("compactdefaultargs") GetVParam;
		%feature("autodoc", "Query the v parameter of the grid points at that index.

Parameters
----------
theIndex: int

Returns
-------
float
") GetVParam;
		Standard_Real GetVParam(const Standard_Integer theIndex);

		/****************** GetVParamInFrame ******************/
		%feature("compactdefaultargs") GetVParamInFrame;
		%feature("autodoc", "Query the v parameter of the grid points at that index in frame.

Parameters
----------
theIndex: int

Returns
-------
float
") GetVParamInFrame;
		Standard_Real GetVParamInFrame(const Standard_Integer theIndex);

		/****************** IsRangeOut ******************/
		%feature("compactdefaultargs") IsRangeOut;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRange: IntTools_SurfaceRangeSample

Returns
-------
bool
") IsRangeOut;
		Standard_Boolean IsRangeOut(const IntTools_SurfaceRangeSample & theRange);

		/****************** ListRangeOut ******************/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", "No available documentation.

Parameters
----------
theList: IntTools_ListOfSurfaceRangeSample

Returns
-------
None
") ListRangeOut;
		void ListRangeOut(IntTools_ListOfSurfaceRangeSample & theList);

		/****************** RemoveRangeOutAll ******************/
		%feature("compactdefaultargs") RemoveRangeOutAll;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RemoveRangeOutAll;
		void RemoveRangeOutAll();

		/****************** SetFrame ******************/
		%feature("compactdefaultargs") SetFrame;
		%feature("autodoc", "Sets the frame area. used to work with grid points.

Parameters
----------
theUMin: float
theUMax: float
theVMin: float
theVMax: float

Returns
-------
None
") SetFrame;
		void SetFrame(const Standard_Real theUMin, const Standard_Real theUMax, const Standard_Real theVMin, const Standard_Real theVMax);

		/****************** SetGridDeflection ******************/
		%feature("compactdefaultargs") SetGridDeflection;
		%feature("autodoc", "Set the grid deflection.

Parameters
----------
theDeflection: float

Returns
-------
None
") SetGridDeflection;
		void SetGridDeflection(const Standard_Real theDeflection);

		/****************** SetGridPoint ******************/
		%feature("compactdefaultargs") SetGridPoint;
		%feature("autodoc", "Set the grid point.

Parameters
----------
theUIndex: int
theVIndex: int
thePoint: gp_Pnt

Returns
-------
None
") SetGridPoint;
		void SetGridPoint(const Standard_Integer theUIndex, const Standard_Integer theVIndex, const gp_Pnt & thePoint);

		/****************** SetRangeUGrid ******************/
		%feature("compactdefaultargs") SetRangeUGrid;
		%feature("autodoc", "Set the range u of the grid of points.

Parameters
----------
theNbUGrid: int

Returns
-------
None
") SetRangeUGrid;
		void SetRangeUGrid(const Standard_Integer theNbUGrid);

		/****************** SetRangeVGrid ******************/
		%feature("compactdefaultargs") SetRangeVGrid;
		%feature("autodoc", "Set the range v of the grid of points.

Parameters
----------
theNbVGrid: int

Returns
-------
None
") SetRangeVGrid;
		void SetRangeVGrid(const Standard_Integer theNbVGrid);

		/****************** SetUParam ******************/
		%feature("compactdefaultargs") SetUParam;
		%feature("autodoc", "Set the u parameter of the grid points at that index.

Parameters
----------
theIndex: int
theUParam: float

Returns
-------
None
") SetUParam;
		void SetUParam(const Standard_Integer theIndex, const Standard_Real theUParam);

		/****************** SetVParam ******************/
		%feature("compactdefaultargs") SetVParam;
		%feature("autodoc", "Set the v parameter of the grid points at that index.

Parameters
----------
theIndex: int
theVParam: float

Returns
-------
None
") SetVParam;
		void SetVParam(const Standard_Integer theIndex, const Standard_Real theVParam);

};


%extend IntTools_SurfaceRangeLocalizeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntTools_SurfaceRangeSample *
************************************/
class IntTools_SurfaceRangeSample {
	public:
		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample();

		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndexU: int
theDepthU: int
theIndexV: int
theDepthV: int

Returns
-------
None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample(const Standard_Integer theIndexU, const Standard_Integer theDepthU, const Standard_Integer theIndexV, const Standard_Integer theDepthV);

		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRangeU: IntTools_CurveRangeSample
theRangeV: IntTools_CurveRangeSample

Returns
-------
None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample(const IntTools_CurveRangeSample & theRangeU, const IntTools_CurveRangeSample & theRangeV);

		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntTools_SurfaceRangeSample

Returns
-------
None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample(const IntTools_SurfaceRangeSample & Other);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntTools_SurfaceRangeSample

Returns
-------
IntTools_SurfaceRangeSample
") Assign;
		IntTools_SurfaceRangeSample & Assign(const IntTools_SurfaceRangeSample & Other);

		/****************** GetDepthU ******************/
		%feature("compactdefaultargs") GetDepthU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetDepthU;
		Standard_Integer GetDepthU();

		/****************** GetDepthV ******************/
		%feature("compactdefaultargs") GetDepthV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetDepthV;
		Standard_Integer GetDepthV();

		/****************** GetDepths ******************/
		%feature("compactdefaultargs") GetDepths;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theDepthU: int
theDepthV: int
") GetDepths;
		void GetDepths(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetIndexU ******************/
		%feature("compactdefaultargs") GetIndexU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetIndexU;
		Standard_Integer GetIndexU();

		/****************** GetIndexV ******************/
		%feature("compactdefaultargs") GetIndexV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetIndexV;
		Standard_Integer GetIndexV();

		/****************** GetIndexes ******************/
		%feature("compactdefaultargs") GetIndexes;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theIndexU: int
theIndexV: int
") GetIndexes;
		void GetIndexes(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetRangeIndexUDeeper ******************/
		%feature("compactdefaultargs") GetRangeIndexUDeeper;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNbSampleU: int

Returns
-------
int
") GetRangeIndexUDeeper;
		Standard_Integer GetRangeIndexUDeeper(const Standard_Integer theNbSampleU);

		/****************** GetRangeIndexVDeeper ******************/
		%feature("compactdefaultargs") GetRangeIndexVDeeper;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNbSampleV: int

Returns
-------
int
") GetRangeIndexVDeeper;
		Standard_Integer GetRangeIndexVDeeper(const Standard_Integer theNbSampleV);

		/****************** GetRangeU ******************/
		%feature("compactdefaultargs") GetRangeU;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFirstU: float
theLastU: float
theNbSampleU: int

Returns
-------
IntTools_Range
") GetRangeU;
		IntTools_Range GetRangeU(const Standard_Real theFirstU, const Standard_Real theLastU, const Standard_Integer theNbSampleU);

		/****************** GetRangeV ******************/
		%feature("compactdefaultargs") GetRangeV;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFirstV: float
theLastV: float
theNbSampleV: int

Returns
-------
IntTools_Range
") GetRangeV;
		IntTools_Range GetRangeV(const Standard_Real theFirstV, const Standard_Real theLastV, const Standard_Integer theNbSampleV);

		/****************** GetRanges ******************/
		%feature("compactdefaultargs") GetRanges;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRangeU: IntTools_CurveRangeSample
theRangeV: IntTools_CurveRangeSample

Returns
-------
None
") GetRanges;
		void GetRanges(IntTools_CurveRangeSample & theRangeU, IntTools_CurveRangeSample & theRangeV);

		/****************** GetSampleRangeU ******************/
		%feature("compactdefaultargs") GetSampleRangeU;
		%feature("autodoc", "No available documentation.

Returns
-------
IntTools_CurveRangeSample
") GetSampleRangeU;
		const IntTools_CurveRangeSample & GetSampleRangeU();

		/****************** GetSampleRangeV ******************/
		%feature("compactdefaultargs") GetSampleRangeV;
		%feature("autodoc", "No available documentation.

Returns
-------
IntTools_CurveRangeSample
") GetSampleRangeV;
		const IntTools_CurveRangeSample & GetSampleRangeV();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntTools_SurfaceRangeSample

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const IntTools_SurfaceRangeSample & Other);

		/****************** SetDepthU ******************/
		%feature("compactdefaultargs") SetDepthU;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDepthU: int

Returns
-------
None
") SetDepthU;
		void SetDepthU(const Standard_Integer theDepthU);

		/****************** SetDepthV ******************/
		%feature("compactdefaultargs") SetDepthV;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDepthV: int

Returns
-------
None
") SetDepthV;
		void SetDepthV(const Standard_Integer theDepthV);

		/****************** SetIndexU ******************/
		%feature("compactdefaultargs") SetIndexU;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndexU: int

Returns
-------
None
") SetIndexU;
		void SetIndexU(const Standard_Integer theIndexU);

		/****************** SetIndexV ******************/
		%feature("compactdefaultargs") SetIndexV;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndexV: int

Returns
-------
None
") SetIndexV;
		void SetIndexV(const Standard_Integer theIndexV);

		/****************** SetIndexes ******************/
		%feature("compactdefaultargs") SetIndexes;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndexU: int
theIndexV: int

Returns
-------
None
") SetIndexes;
		void SetIndexes(const Standard_Integer theIndexU, const Standard_Integer theIndexV);

		/****************** SetRanges ******************/
		%feature("compactdefaultargs") SetRanges;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRangeU: IntTools_CurveRangeSample
theRangeV: IntTools_CurveRangeSample

Returns
-------
None
") SetRanges;
		void SetRanges(const IntTools_CurveRangeSample & theRangeU, const IntTools_CurveRangeSample & theRangeV);

		/****************** SetSampleRangeU ******************/
		%feature("compactdefaultargs") SetSampleRangeU;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRangeSampleU: IntTools_CurveRangeSample

Returns
-------
None
") SetSampleRangeU;
		void SetSampleRangeU(const IntTools_CurveRangeSample & theRangeSampleU);

		/****************** SetSampleRangeV ******************/
		%feature("compactdefaultargs") SetSampleRangeV;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRangeSampleV: IntTools_CurveRangeSample

Returns
-------
None
") SetSampleRangeV;
		void SetSampleRangeV(const IntTools_CurveRangeSample & theRangeSampleV);

};


%extend IntTools_SurfaceRangeSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class IntTools_SurfaceRangeSampleMapHasher *
*********************************************/
class IntTools_SurfaceRangeSampleMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given key, in the range [1, theupperbound] @param thekey the key which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theKey: IntTools_SurfaceRangeSample
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const IntTools_SurfaceRangeSample & theKey, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same. two same keys must have the same hashcode, the contrary is not necessary.

Parameters
----------
S1: IntTools_SurfaceRangeSample
S2: IntTools_SurfaceRangeSample

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const IntTools_SurfaceRangeSample & S1, const IntTools_SurfaceRangeSample & S2);

};


%extend IntTools_SurfaceRangeSampleMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntTools_Tools *
***********************/
class IntTools_Tools {
	public:
		/****************** CheckCurve ******************/
		%feature("compactdefaultargs") CheckCurve;
		%feature("autodoc", "Checks if the curve is not covered by the default tolerance (confusion). builds bounding box for the curve and stores it into <thebox>.

Parameters
----------
theCurve: IntTools_Curve
theBox: Bnd_Box

Returns
-------
bool
") CheckCurve;
		static Standard_Boolean CheckCurve(const IntTools_Curve & theCurve, Bnd_Box & theBox);

		/****************** ClassifyPointByFace ******************/
		%feature("compactdefaultargs") ClassifyPointByFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
aF: TopoDS_Face
P: gp_Pnt2d

Returns
-------
TopAbs_State
") ClassifyPointByFace;
		static TopAbs_State ClassifyPointByFace(const TopoDS_Face & aF, const gp_Pnt2d & P);

		/****************** ComputeIntRange ******************/
		%feature("compactdefaultargs") ComputeIntRange;
		%feature("autodoc", "Computes the correct intersection range for line/line, line/plane and plane/plane intersections.

Parameters
----------
theTol1: float
theTol2: float
theAngle: float

Returns
-------
float
") ComputeIntRange;
		static Standard_Real ComputeIntRange(const Standard_Real theTol1, const Standard_Real theTol2, const Standard_Real theAngle);

		/****************** ComputeTolerance ******************/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "Computes the max distance between points taken from 3d and 2d curves by the same parameter.

Parameters
----------
theCurve3D: Geom_Curve
theCurve2D: Geom2d_Curve
theSurf: Geom_Surface
theFirst: float
theLast: float
theTolRange: float,optional
	default value is Precision::PConfusion()

Returns
-------
theMaxDist: float
theMaxPar: float
") ComputeTolerance;
		static Standard_Boolean ComputeTolerance(const opencascade::handle<Geom_Curve> & theCurve3D, const opencascade::handle<Geom2d_Curve> & theCurve2D, const opencascade::handle<Geom_Surface> & theSurf, const Standard_Real theFirst, const Standard_Real theLast, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real theTolRange = Precision::PConfusion());

		/****************** ComputeVV ******************/
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "Computes distance between vertex v1 and vertex v2, if the distance is less than sum of vertex tolerances returns zero, otherwise returns negative value.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
int
") ComputeVV;
		static Standard_Integer ComputeVV(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** CurveTolerance ******************/
		%feature("compactdefaultargs") CurveTolerance;
		%feature("autodoc", "Returns adaptive tolerance for given atolbase if ac is trimmed curve and basis curve is parabola, otherwise returns value of atolbase.

Parameters
----------
aC: Geom_Curve
aTolBase: float

Returns
-------
float
") CurveTolerance;
		static Standard_Real CurveTolerance(const opencascade::handle<Geom_Curve> & aC, const Standard_Real aTolBase);

		/****************** HasInternalEdge ******************/
		%feature("compactdefaultargs") HasInternalEdge;
		%feature("autodoc", "Returns true if wire aw contains edges with internal orientation.

Parameters
----------
aW: TopoDS_Wire

Returns
-------
bool
") HasInternalEdge;
		static Standard_Boolean HasInternalEdge(const TopoDS_Wire & aW);

		/****************** IntermediatePoint ******************/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "Returns some value between afirst and alast.

Parameters
----------
aFirst: float
aLast: float

Returns
-------
float
") IntermediatePoint;
		static Standard_Real IntermediatePoint(const Standard_Real aFirst, const Standard_Real aLast);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if ac is boundedcurve from geom and the distance between first point of the curve ac and last point is less than 1.e-12.

Parameters
----------
aC: Geom_Curve

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Geom_Curve> & aC);

		/****************** IsDirsCoinside ******************/
		%feature("compactdefaultargs") IsDirsCoinside;
		%feature("autodoc", "Returns true if d1 and d2 coinside.

Parameters
----------
D1: gp_Dir
D2: gp_Dir

Returns
-------
bool
") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside(const gp_Dir & D1, const gp_Dir & D2);

		/****************** IsDirsCoinside ******************/
		%feature("compactdefaultargs") IsDirsCoinside;
		%feature("autodoc", "Returns true if d1 and d2 coinside with given tolerance.

Parameters
----------
D1: gp_Dir
D2: gp_Dir
aTol: float

Returns
-------
bool
") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside(const gp_Dir & D1, const gp_Dir & D2, const Standard_Real aTol);

		/****************** IsInRange ******************/
		%feature("compactdefaultargs") IsInRange;
		%feature("autodoc", "Checks if the range <ther> interfere with the range <therref>.

Parameters
----------
theRRef: IntTools_Range
theR: IntTools_Range
theTol: float

Returns
-------
bool
") IsInRange;
		static Standard_Boolean IsInRange(const IntTools_Range & theRRef, const IntTools_Range & theR, const Standard_Real theTol);

		/****************** IsMiddlePointsEqual ******************/
		%feature("compactdefaultargs") IsMiddlePointsEqual;
		%feature("autodoc", "Gets boundary of parameters of e1 and e2. computes 3d points on each corresponded to average parameters. returns true if distance between computed points is less than sum of edge tolerance, otherwise returns false.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Returns
-------
bool
") IsMiddlePointsEqual;
		static Standard_Boolean IsMiddlePointsEqual(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** IsOnPave ******************/
		%feature("compactdefaultargs") IsOnPave;
		%feature("autodoc", "No available documentation.

Parameters
----------
theT: float
theRange: IntTools_Range
theTol: float

Returns
-------
bool
") IsOnPave;
		static Standard_Boolean IsOnPave(const Standard_Real theT, const IntTools_Range & theRange, const Standard_Real theTol);

		/****************** IsOnPave1 ******************/
		%feature("compactdefaultargs") IsOnPave1;
		%feature("autodoc", "No available documentation.

Parameters
----------
theT: float
theRange: IntTools_Range
theTol: float

Returns
-------
bool
") IsOnPave1;
		static Standard_Boolean IsOnPave1(const Standard_Real theT, const IntTools_Range & theRange, const Standard_Real theTol);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Computes square distance between a point on the edge e corresponded to parameter t and vertices of edge e. returns true if this distance is less than square tolerance of vertex, otherwise returns false.

Parameters
----------
E: TopoDS_Edge
t: float

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const TopoDS_Edge & E, const Standard_Real t);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if square distance between vertex v and a point on the edge e corresponded to parameter t is less than square tolerance of v.

Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
t: float

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real t);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if isvertx for middle parameter of fist range and first edge returns true and if isvertex for middle parameter of second range and second range returns true, otherwise returns false.

Parameters
----------
aCmnPrt: IntTools_CommonPrt

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const IntTools_CommonPrt & aCmnPrt);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the distance between point ap and vertex av is less or equal to sum of atolpv and vertex tolerance, otherwise returns false.

Parameters
----------
aP: gp_Pnt
aTolPV: float
aV: TopoDS_Vertex

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const gp_Pnt & aP, const Standard_Real aTolPV, const TopoDS_Vertex & aV);

		/****************** MakeFaceFromWireAndFace ******************/
		%feature("compactdefaultargs") MakeFaceFromWireAndFace;
		%feature("autodoc", "Build a face based on surface of given face af and bounded by wire aw.

Parameters
----------
aW: TopoDS_Wire
aF: TopoDS_Face
aFNew: TopoDS_Face

Returns
-------
None
") MakeFaceFromWireAndFace;
		static void MakeFaceFromWireAndFace(const TopoDS_Wire & aW, const TopoDS_Face & aF, TopoDS_Face & aFNew);

		/****************** RejectLines ******************/
		%feature("compactdefaultargs") RejectLines;
		%feature("autodoc", "Puts curves from asin to asout except those curves that are coincide with first curve from asin.

Parameters
----------
aSIn: IntTools_SequenceOfCurves
aSOut: IntTools_SequenceOfCurves

Returns
-------
None
") RejectLines;
		static void RejectLines(const IntTools_SequenceOfCurves & aSIn, IntTools_SequenceOfCurves & aSOut);

		/****************** SegPln ******************/
		%feature("compactdefaultargs") SegPln;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLin: gp_Lin
theTLin1: float
theTLin2: float
theTolLin: float
thePln: gp_Pln
theTolPln: float
theP: gp_Pnt

Returns
-------
theT: float
theTolP: float
theTmin: float
theTmax: float
") SegPln;
		static Standard_Integer SegPln(const gp_Lin & theLin, const Standard_Real theTLin1, const Standard_Real theTLin2, const Standard_Real theTolLin, const gp_Pln & thePln, const Standard_Real theTolPln, gp_Pnt & theP, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SplitCurve ******************/
		%feature("compactdefaultargs") SplitCurve;
		%feature("autodoc", "Split ac by average parameter if ac is closed in 3d. returns positive value if splitting has been done, otherwise returns zero.

Parameters
----------
aC: IntTools_Curve
aS: IntTools_SequenceOfCurves

Returns
-------
int
") SplitCurve;
		static Standard_Integer SplitCurve(const IntTools_Curve & aC, IntTools_SequenceOfCurves & aS);

		/****************** VertexParameter ******************/
		%feature("compactdefaultargs") VertexParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCP: IntTools_CommonPrt

Returns
-------
theT: float
") VertexParameter;
		static void VertexParameter(const IntTools_CommonPrt & theCP, Standard_Real &OutValue);

		/****************** VertexParameters ******************/
		%feature("compactdefaultargs") VertexParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCP: IntTools_CommonPrt

Returns
-------
theT1: float
theT2: float
") VertexParameters;
		static void VertexParameters(const IntTools_CommonPrt & theCP, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend IntTools_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntTools_TopolTool *
***************************/
class IntTools_TopolTool : public Adaptor3d_TopolTool {
	public:
		/****************** IntTools_TopolTool ******************/
		%feature("compactdefaultargs") IntTools_TopolTool;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_TopolTool;
		 IntTools_TopolTool();

		/****************** IntTools_TopolTool ******************/
		%feature("compactdefaultargs") IntTools_TopolTool;
		%feature("autodoc", "Initializes me by surface.

Parameters
----------
theSurface: Adaptor3d_HSurface

Returns
-------
None
") IntTools_TopolTool;
		 IntTools_TopolTool(const opencascade::handle<Adaptor3d_HSurface> & theSurface);

		/****************** ComputeSamplePoints ******************/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeSamplePoints;
		virtual void ComputeSamplePoints();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Redefined empty initializer //! warning: raises the exception notimplemented.

Returns
-------
None
") Initialize;
		virtual void Initialize();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes me by surface.

Parameters
----------
theSurface: Adaptor3d_HSurface

Returns
-------
None
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor3d_HSurface> & theSurface);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Computes the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Computes the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU();

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Computes the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV();

		/****************** SamplePnts ******************/
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms by adaptive algorithm for bspline surfaces. for other surfaces algorithm is the same as in method computesamplepoints(), but only fill arrays of u and v sample parameters; thedefl is a requred deflection thenumin, thenvmin are minimal nb points for u and v.

Parameters
----------
theDefl: float
theNUmin: int
theNVmin: int

Returns
-------
None
") SamplePnts;
		virtual void SamplePnts(const Standard_Real theDefl, const Standard_Integer theNUmin, const Standard_Integer theNVmin);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "Returns a 2d point from surface mys and a corresponded 3d point for given index. the index should be from 1 to nbsamples().

Parameters
----------
Index: int
P2d: gp_Pnt2d
P3d: gp_Pnt

Returns
-------
None
") SamplePoint;
		virtual void SamplePoint(const Standard_Integer Index, gp_Pnt2d & P2d, gp_Pnt & P3d);

};


%make_alias(IntTools_TopolTool)

%extend IntTools_TopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntTools_WLineTool *
***************************/
class IntTools_WLineTool {
	public:
		/****************** DecompositionOfWLine ******************/
		%feature("compactdefaultargs") DecompositionOfWLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
theWLine: IntPatch_WLine
theSurface1: GeomAdaptor_HSurface
theSurface2: GeomAdaptor_HSurface
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theLConstructor: GeomInt_LineConstructor
theAvoidLConstructor: bool
theTol: float
theNewLines: IntPatch_SequenceOfLine
&: IntTools_Context

Returns
-------
theReachedTol3d: float
") DecompositionOfWLine;
		static Standard_Boolean DecompositionOfWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<GeomAdaptor_HSurface> & theSurface1, const opencascade::handle<GeomAdaptor_HSurface> & theSurface2, const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const GeomInt_LineConstructor & theLConstructor, const Standard_Boolean theAvoidLConstructor, const Standard_Real theTol, IntPatch_SequenceOfLine & theNewLines, Standard_Real &OutValue, const opencascade::handle<IntTools_Context > &);

		/****************** NotUseSurfacesForApprox ******************/
		%feature("compactdefaultargs") NotUseSurfacesForApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
aF1: TopoDS_Face
aF2: TopoDS_Face
WL: IntPatch_WLine
ifprm: int
ilprm: int

Returns
-------
bool
") NotUseSurfacesForApprox;
		static Standard_Boolean NotUseSurfacesForApprox(const TopoDS_Face & aF1, const TopoDS_Face & aF2, const opencascade::handle<IntPatch_WLine> & WL, const Standard_Integer ifprm, const Standard_Integer ilprm);

};


%extend IntTools_WLineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IntTools_CurveRangeSample *
**********************************/
class IntTools_CurveRangeSample : public IntTools_BaseRangeSample {
	public:
		/****************** IntTools_CurveRangeSample ******************/
		%feature("compactdefaultargs") IntTools_CurveRangeSample;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample();

		/****************** IntTools_CurveRangeSample ******************/
		%feature("compactdefaultargs") IntTools_CurveRangeSample;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
None
") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample(const Standard_Integer theIndex);

		/****************** GetRange ******************/
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFirst: float
theLast: float
theNbSample: int

Returns
-------
IntTools_Range
") GetRange;
		IntTools_Range GetRange(const Standard_Real theFirst, const Standard_Real theLast, const Standard_Integer theNbSample);

		/****************** GetRangeIndex ******************/
		%feature("compactdefaultargs") GetRangeIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetRangeIndex;
		Standard_Integer GetRangeIndex();

		/****************** GetRangeIndexDeeper ******************/
		%feature("compactdefaultargs") GetRangeIndexDeeper;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNbSample: int

Returns
-------
int
") GetRangeIndexDeeper;
		Standard_Integer GetRangeIndexDeeper(const Standard_Integer theNbSample);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntTools_CurveRangeSample

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const IntTools_CurveRangeSample & Other);

		/****************** SetRangeIndex ******************/
		%feature("compactdefaultargs") SetRangeIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
None
") SetRangeIndex;
		void SetRangeIndex(const Standard_Integer theIndex);

};


%extend IntTools_CurveRangeSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntTools_CArray1OfInteger:
	pass

@classnotwrapped
class IntTools_CArray1OfReal:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
