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
from enum import IntEnum
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

%extend NCollection_List<Bnd_Box> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_ListOfCurveRangeSample) NCollection_List<IntTools_CurveRangeSample>;

%extend NCollection_List<IntTools_CurveRangeSample> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_ListOfSurfaceRangeSample) NCollection_List<IntTools_SurfaceRangeSample>;

%extend NCollection_List<IntTools_SurfaceRangeSample> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_MapOfCurveSample) NCollection_Map<IntTools_CurveRangeSample,IntTools_CurveRangeSampleMapHasher>;
%template(IntTools_MapOfSurfaceSample) NCollection_Map<IntTools_SurfaceRangeSample,IntTools_SurfaceRangeSampleMapHasher>;
%template(IntTools_SequenceOfCommonPrts) NCollection_Sequence<IntTools_CommonPrt>;

%extend NCollection_Sequence<IntTools_CommonPrt> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfCurves) NCollection_Sequence<IntTools_Curve>;

%extend NCollection_Sequence<IntTools_Curve> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfPntOn2Faces) NCollection_Sequence<IntTools_PntOn2Faces>;

%extend NCollection_Sequence<IntTools_PntOn2Faces> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfRanges) NCollection_Sequence<IntTools_Range>;

%extend NCollection_Sequence<IntTools_Range> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfRoots) NCollection_Sequence<IntTools_Root>;

%extend NCollection_Sequence<IntTools_Root> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: c8523d4252dcd1c41e362a17e26b9c2d ****/
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
		/**** md5 signature: ebb9a3a6ab13c6cdada34d26544cc9b4 ****/
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
		/**** md5 signature: fedfe5a7d041fc303d9b54c2f39dbbf1 ****/
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
		/**** md5 signature: 66759e79aa637f03b445d32db9b6547f ****/
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
		/**** md5 signature: b4c98ac5b03aec6376256041a726519e ****/
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
		/**** md5 signature: 105777c711c5ed7389810d8aa8b35c2b ****/
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
		/**** md5 signature: b0ecb73396f4953e96f152f925a6cdf5 ****/
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
		/**** md5 signature: 548c6fa8e9f4e6206978e24297ee5e8b ****/
		%feature("compactdefaultargs") IntTools_BaseRangeSample;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample();

		/****************** IntTools_BaseRangeSample ******************/
		/**** md5 signature: 4e59068351d36c15d01056928d2cfd8a ****/
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
		/**** md5 signature: 5b5fcf7ad77b54551dc80e457c815290 ****/
		%feature("compactdefaultargs") GetDepth;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetDepth;
		Standard_Integer GetDepth();

		/****************** SetDepth ******************/
		/**** md5 signature: c8265c6a36782867c90a897686530314 ****/
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
		/**** md5 signature: 238be002c71b6de72f26b16c6e0bc07b ****/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector();

		/****************** IntTools_BeanFaceIntersector ******************/
		/**** md5 signature: cbfc790d73fd8f2233124f7fdb7c76ee ****/
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
		/**** md5 signature: 543f11aedbb682a6ce91ee4fc0d7bb1a ****/
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
		/**** md5 signature: ff2b189d70ec0dd86884da9cd32f96bf ****/
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
		/**** md5 signature: 3ea460f8e5a9e1fe83439fe69bd1002e ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Gets the intersecton context.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Init ******************/
		/**** md5 signature: 2a831d636c2c924d38adfdfa075e8336 ****/
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
		/**** md5 signature: 8502d8c9b8fd0854d0f0b6426b618b36 ****/
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
		/**** md5 signature: 0dabb5d8961ba27a6e5407fd062ddd7e ****/
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
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns done/notdone state of the algorithm.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Launches the algorithm.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Result ******************/
		/**** md5 signature: f3e9d73a3167c18aec1551dbc927085e ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
IntTools_SequenceOfRanges
") Result;
		const IntTools_SequenceOfRanges & Result();

		/****************** Result ******************/
		/**** md5 signature: 2d516e231789832b6855010cf4ce321f ****/
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
		/**** md5 signature: 497fa539c82b82f373e3e356479adb27 ****/
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
		/**** md5 signature: e78608a6b667b26dfbb5221975ad17a2 ****/
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
		/**** md5 signature: 7c0eb1fe9df7cc46637f388f30d4e005 ****/
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
		/**** md5 signature: 84f1339c773d48f9f538a3d1851d5e64 ****/
		%feature("compactdefaultargs") IntTools_CommonPrt;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_CommonPrt;
		 IntTools_CommonPrt();

		/****************** IntTools_CommonPrt ******************/
		/**** md5 signature: a37b2e310776652090dfa92ef0d1e78d ****/
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
		/**** md5 signature: 908c5545063b9bbda8bc65208ceef27b ****/
		%feature("compactdefaultargs") AllNullFlag;
		%feature("autodoc", "Modifier.

Returns
-------
bool
") AllNullFlag;
		Standard_Boolean AllNullFlag();

		/****************** AppendRange2 ******************/
		/**** md5 signature: 5960301fb39fc0b320c947efb4dc1768 ****/
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
		/**** md5 signature: 708bef267715325be71ab6aee65ad124 ****/
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
		/**** md5 signature: d342dcb5dbafbbae0c09bb3b1dd5f817 ****/
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
		/**** md5 signature: 62077ccb7936ded8e52da8bf1d282415 ****/
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
		/**** md5 signature: 68063400b9174bcfd695fd516296d397 ****/
		%feature("compactdefaultargs") ChangeRanges2;
		%feature("autodoc", "Returns the ranges of second edge.

Returns
-------
IntTools_SequenceOfRanges
") ChangeRanges2;
		IntTools_SequenceOfRanges & ChangeRanges2();

		/****************** Copy ******************/
		/**** md5 signature: 5e9d1484e7afefb381d4011472955718 ****/
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
		/**** md5 signature: 290a5674bfab5bc84045440976535c10 ****/
		%feature("compactdefaultargs") Edge1;
		%feature("autodoc", "Returns the first edge.

Returns
-------
TopoDS_Edge
") Edge1;
		const TopoDS_Edge Edge1();

		/****************** Edge2 ******************/
		/**** md5 signature: 74392148a2fac80727ba273414a06928 ****/
		%feature("compactdefaultargs") Edge2;
		%feature("autodoc", "Returns the second edge.

Returns
-------
TopoDS_Edge
") Edge2;
		const TopoDS_Edge Edge2();

		/****************** Range1 ******************/
		/**** md5 signature: 661e98a7d85147b7d3a4f3bd5a54c295 ****/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "Returns the range of first edge.

Returns
-------
IntTools_Range
") Range1;
		const IntTools_Range & Range1();

		/****************** Range1 ******************/
		/**** md5 signature: 30700790756f454886ee8e50c2e8bf90 ****/
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
		/**** md5 signature: d424fd3763f6e267958ee53278d49c9f ****/
		%feature("compactdefaultargs") Ranges2;
		%feature("autodoc", "Returns the ranges of second edge.

Returns
-------
IntTools_SequenceOfRanges
") Ranges2;
		const IntTools_SequenceOfRanges & Ranges2();

		/****************** SetAllNullFlag ******************/
		/**** md5 signature: 093ece8d9b8d0ba21c3c4d4f9e3112c7 ****/
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
		/**** md5 signature: 5be6ee5d794590b5e394dce9904907bc ****/
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
		/**** md5 signature: 589c51a96f15d196589c8826cf3bfa58 ****/
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
		/**** md5 signature: 4e912f624d1386896b459de262e40b21 ****/
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
		/**** md5 signature: 45335c811770d711e394b42e23c8db15 ****/
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
		/**** md5 signature: 79f55915b2d14e875ddb73de80604eaa ****/
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
		/**** md5 signature: 17ce8083107574d8d14b69b99c94920e ****/
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
		/**** md5 signature: 4a9de2bb794f2e7b8fd44058b76de958 ****/
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
		/**** md5 signature: 67c95a8c184f23fe920a7cb6f70674d4 ****/
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
		/**** md5 signature: 3f27a65186b8053d282c2c0d8c4513b8 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of the common part.

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type();

		/****************** VertexParameter1 ******************/
		/**** md5 signature: 5b5eede02e9405b4f1d5c9ebe2105684 ****/
		%feature("compactdefaultargs") VertexParameter1;
		%feature("autodoc", "Returns parameter of first vertex.

Returns
-------
float
") VertexParameter1;
		Standard_Real VertexParameter1();

		/****************** VertexParameter2 ******************/
		/**** md5 signature: 47c8acaed04542460a05bac34c48c80a ****/
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
		/**** md5 signature: 5a8fa8d388ac98fd0b79fa4d55afb898 ****/
		%feature("compactdefaultargs") IntTools_Context;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_Context;
		 IntTools_Context();

		/****************** IntTools_Context ******************/
		/**** md5 signature: c12f5dba02b71233c7206c50d55269d5 ****/
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
		/**** md5 signature: b665f86cc78f1726c03e804fc38d0b73 ****/
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
		/**** md5 signature: 433859fbf446aebf55a30c6b1d66ed46 ****/
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
		/**** md5 signature: b6290a8ed372f0df63c99255ce0ffc35 ****/
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
		/**** md5 signature: 0d41241c758f89c65227f2424527c288 ****/
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
		/**** md5 signature: b1c2f6895ff38359f51ae392b469a3e5 ****/
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
		/**** md5 signature: eafd4ba666fa66dd0acd6b30451e32b7 ****/
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
		/**** md5 signature: 4208488ba6be349c9a4870e649bd7a9e ****/
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
		/**** md5 signature: dd8b7ab67a350d30d534581f18bc3b1f ****/
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
		/**** md5 signature: 6282883d47a3ccc0957daf8fa6b4d1d4 ****/
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
		/**** md5 signature: 41eefe589d896e0e205f0ab5615c1747 ****/
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
		/**** md5 signature: 9b87a05baa78912887ba878a42d1224f ****/
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
		/**** md5 signature: 701eb7bbbdf70f75992f852885147978 ****/
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
		/**** md5 signature: f72d455d56ecf493cea383abf0705839 ****/
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
		/**** md5 signature: bacf6bc4d2c743db6314f13811d22957 ****/
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
		/**** md5 signature: ada36e522fc40610fef0c99f6081e687 ****/
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
		/**** md5 signature: 3d4b43894f64d9f00a92f55e69fc53ae ****/
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
		/**** md5 signature: 1d5864d2e1ead554a014d93c916407d2 ****/
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
		/**** md5 signature: 80777d0414fefd358cdb191eb228dd85 ****/
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
		/**** md5 signature: 438fda98b0efafe0ae8ce6560c616a59 ****/
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
		/**** md5 signature: aba2bd758e4199242c7964213c263db8 ****/
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
		/**** md5 signature: 232fa89a199cb61ab107fd3a27a80ef6 ****/
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
		/**** md5 signature: 0a006e545a34b530febea0340daba8f1 ****/
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
		/**** md5 signature: 0cbf16c1445d0ca00ad0f27f6ae63d0a ****/
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
		/**** md5 signature: 9349db404468e857455e4a423e76c10a ****/
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
		/**** md5 signature: 20b00b48b9d70640e64ccf30711ff36f ****/
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
		/**** md5 signature: 7cc75d022ff217235e007983741d5277 ****/
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
		/**** md5 signature: 72d57696b592f2c756d1efcef885d122 ****/
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
		/**** md5 signature: 1f839c29da82c1c9663c05f577e6125d ****/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_Curve;
		 IntTools_Curve();

		/****************** IntTools_Curve ******************/
		/**** md5 signature: bd3979a356abc48d3a7e7473a7d68d25 ****/
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
		/**** md5 signature: ba1495abc333e2d042b010a7e696f504 ****/
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
		/**** md5 signature: 62a16889fb975efa1b2de012099c169b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns 3d curve.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** D0 ******************/
		/**** md5 signature: 78502201fa5be47ff5bf66d737b6bf31 ****/
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
		/**** md5 signature: c3d29c0810f888c120a5078e912786f3 ****/
		%feature("compactdefaultargs") FirstCurve2d;
		%feature("autodoc", "Returns first 2d curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") FirstCurve2d;
		const opencascade::handle<Geom2d_Curve> & FirstCurve2d();

		/****************** HasBounds ******************/
		/**** md5 signature: 709735581c3c2f455f6927bb4a4e531d ****/
		%feature("compactdefaultargs") HasBounds;
		%feature("autodoc", "Returns true if 3d curve is boundedcurve.

Returns
-------
bool
") HasBounds;
		Standard_Boolean HasBounds();

		/****************** SecondCurve2d ******************/
		/**** md5 signature: 01e3a51db1c39fa9598c0ad8bfdcbbd9 ****/
		%feature("compactdefaultargs") SecondCurve2d;
		%feature("autodoc", "Returns second 2d curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") SecondCurve2d;
		const opencascade::handle<Geom2d_Curve> & SecondCurve2d();

		/****************** SetCurve ******************/
		/**** md5 signature: 8875d532d0f382113206b2bfe333cdac ****/
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
		/**** md5 signature: bd816be358e1f1ede5b32ee8a63a4168 ****/
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
		/**** md5 signature: 76c7aa7f7240116462c8f710634326f5 ****/
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
		/**** md5 signature: 9d7a24597025b9d91d230fd458e16942 ****/
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
		/**** md5 signature: 30b3ca13e643da6655abf5b0795a5374 ****/
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
		/**** md5 signature: 2df6ca87a12fc10518568e45d2ce38db ****/
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
		/**** md5 signature: c1e785de724669f2f929496d8c904a9c ****/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "Returns the tangential tolerance.

Returns
-------
float
") TangentialTolerance;
		Standard_Real TangentialTolerance();

		/****************** Tolerance ******************/
		/**** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Type ******************/
		/**** md5 signature: af8b9d8db8cab58b4286d8896f12d09c ****/
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
		/**** md5 signature: b15946d4ec9579fb879a3817251b96f6 ****/
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
		/**** md5 signature: 610b7a5472a894448f6ee0290e9bc472 ****/
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
		/**** md5 signature: 7fd7fe5924530ae86b84715f2b9a2c44 ****/
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
		/**** md5 signature: 955c2eb738662c02a335a8720b04c6fa ****/
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
		/**** md5 signature: dcc14bc1113a77b9fb168eb5763c890a ****/
		%feature("compactdefaultargs") GetMinRange;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMinRange;
		Standard_Real GetMinRange();

		/****************** GetNbSample ******************/
		/**** md5 signature: 0b29023252f4f007c9a6350bbe08369a ****/
		%feature("compactdefaultargs") GetNbSample;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetNbSample;
		Standard_Integer GetNbSample();

		/****************** IsRangeOut ******************/
		/**** md5 signature: fe3cadcb4748c51492051c9c24a9f858 ****/
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
		/**** md5 signature: 2260e4f3f132ded0a9ac9ebb91324c89 ****/
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
		/**** md5 signature: 93dbae0a5a5a7d9243a92becc779bda7 ****/
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
		/**** md5 signature: d2202a0d0916043d4c098e8eee5ece3d ****/
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
		/**** md5 signature: 4551d18744ed7c6ae5b1e1b4794a6264 ****/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge();

		/****************** IntTools_EdgeEdge ******************/
		/**** md5 signature: a7b58f57429b22fb3dc3ed0030a8f53e ****/
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
		/**** md5 signature: 69b54a28360beb7321650d1ae6f019d5 ****/
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
		/**** md5 signature: da730b5d8002362e580852ec6aa829ea ****/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Returns common parts.

Returns
-------
IntTools_SequenceOfCommonPrts
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts();

		/****************** FuzzyValue ******************/
		/**** md5 signature: be29fbc3587cce2740c43ae36346b88f ****/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns fuzzy value.

Returns
-------
float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** IsCoincidenceCheckedQuickly ******************/
		/**** md5 signature: 2e1263cf549e045820bc46ffe90d3253 ****/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Returns the flag myquickcoincidencecheck.

Returns
-------
bool
") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if common part(s) is(are) found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between edges.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetEdge1 ******************/
		/**** md5 signature: 40a00ccba436889bf949ef0562a3edc9 ****/
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
		/**** md5 signature: 8a8c45ff8cf8fef31a0cff22252d974d ****/
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
		/**** md5 signature: d035a1056357fbcc58da99d53f25508d ****/
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
		/**** md5 signature: 965a565189573aaa4fb5001e8b5d25c6 ****/
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
		/**** md5 signature: a6e52c994eeddfce238b90491de5f35c ****/
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
		/**** md5 signature: bb41bc42e46d2436a40c8d973157bb65 ****/
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
		/**** md5 signature: 63f455ae2a073f05bf87ce70fddb7730 ****/
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
		/**** md5 signature: e1e1c703a47bde8600bea5eeaaf0ba9f ****/
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
		/**** md5 signature: 6a7c748b7970e48d68dfede3398ce2ad ****/
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
		/**** md5 signature: 5de7595b312e0b345a56002567eeaeb1 ****/
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
		/**** md5 signature: ac76d8fd37641cf3850f9d0e1fa7cf07 ****/
		%feature("compactdefaultargs") IntTools_EdgeFace;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_EdgeFace;
		 IntTools_EdgeFace();

		/****************** CommonParts ******************/
		/**** md5 signature: b79ce635c2dbbad1683c1b56a034e14b ****/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Returns resulting common parts.

Returns
-------
IntTools_SequenceOfCommonPrts
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts();

		/****************** Context ******************/
		/**** md5 signature: 298a8dbfee117eca77851222c773740a ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the intersection context.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Edge ******************/
		/**** md5 signature: 657c12d9769667081fd960b688690cc0 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** ErrorStatus ******************/
		/**** md5 signature: 23ccaf4f25108c0b871675cdf964cbf6 ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Returns the code of completion: 0 - means successful completion; 1 - the process was not started; 2,3 - invalid source data for the algorithm; 4 - projection failed.

Returns
-------
int
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****************** Face ******************/
		/**** md5 signature: 95406b8d0d556c0537e0768c48713f21 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** FuzzyValue ******************/
		/**** md5 signature: c7081d612ee5325e18733e215807d19f ****/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns the fuzzy value.

Returns
-------
float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** IsCoincidenceCheckedQuickly ******************/
		/**** md5 signature: 2e1263cf549e045820bc46ffe90d3253 ****/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Returns the flag myquickcoincidencecheck.

Returns
-------
bool
") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly();

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if computation was successful. otherwise returns false.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Launches the process.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Range ******************/
		/**** md5 signature: 1c00b6a66baae86f89ee003b9c965318 ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Returns intersection range of the edge.

Returns
-------
IntTools_Range
") Range;
		const IntTools_Range & Range();

		/****************** SetContext ******************/
		/**** md5 signature: 45a35eea8f4e3016f544e19c60ac3b92 ****/
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
		/**** md5 signature: 6f2fdc35f76ff0b75031b7bba2264008 ****/
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
		/**** md5 signature: 9ec2310ee9bc7ec9517d4be701570074 ****/
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
		/**** md5 signature: 1ec359b4264167db67f0bb6c774993d9 ****/
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
		/**** md5 signature: cac66bc6039d9794014f338069dd5d2f ****/
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
		/**** md5 signature: f3f7b3d5c973131ef8d69afe846c0288 ****/
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
		/**** md5 signature: 380eb1480dddecea984b19d084e9685a ****/
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
		/**** md5 signature: 71448dbf418cca7a680d55a7c57f945e ****/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_FClass2d;
		 IntTools_FClass2d();

		/****************** IntTools_FClass2d ******************/
		/**** md5 signature: 2ff64ae474e59221d0e35fcbe73d6a83 ****/
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
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Init ******************/
		/**** md5 signature: 9fa3174f39f493855c5fe31d2b5b64fc ****/
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
		/**** md5 signature: b5f4b5210b3b0507eda73b3be749bc8d ****/
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsHole;
		Standard_Boolean IsHole();

		/****************** Perform ******************/
		/**** md5 signature: 403774510e6e0c4bd249a27908ad88fd ****/
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
		/**** md5 signature: 372e31f938f00ae741d3664c08c086b5 ****/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "Returns state of infinite 2d point relatively to (0, 0).

Returns
-------
TopAbs_State
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint();

		/****************** TestOnRestriction ******************/
		/**** md5 signature: 6c77262c5fd5c2462a11220de78e70e9 ****/
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
		/**** md5 signature: b1adf597b2fd293465ee783c22f7bd7a ****/
		%feature("compactdefaultargs") IntTools_FaceFace;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_FaceFace;
		 IntTools_FaceFace();

		/****************** Context ******************/
		/**** md5 signature: 3ea460f8e5a9e1fe83439fe69bd1002e ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Gets the intersecton context.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Face1 ******************/
		/**** md5 signature: ab2eca052beed46bd39ad31d28c4ee92 ****/
		%feature("compactdefaultargs") Face1;
		%feature("autodoc", "Returns first of processed faces.

Returns
-------
TopoDS_Face
") Face1;
		const TopoDS_Face Face1();

		/****************** Face2 ******************/
		/**** md5 signature: 4b53886e6b114a0c7d6d5bbf493d04f4 ****/
		%feature("compactdefaultargs") Face2;
		%feature("autodoc", "Returns second of processed faces.

Returns
-------
TopoDS_Face
") Face2;
		const TopoDS_Face Face2();

		/****************** FuzzyValue ******************/
		/**** md5 signature: be29fbc3587cce2740c43ae36346b88f ****/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns fuzzy value.

Returns
-------
float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the intersection was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Lines ******************/
		/**** md5 signature: 63ca1b903d3f6250f96d4975cfd4a797 ****/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "Returns sequence of 3d curves as result of intersection.

Returns
-------
IntTools_SequenceOfCurves
") Lines;
		const IntTools_SequenceOfCurves & Lines();

		/****************** Perform ******************/
		/**** md5 signature: 20b101b6609f56b4df981165ffc5760a ****/
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
		/**** md5 signature: 4c491afe08e7fca7a25cfca5246db6f2 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns sequence of 3d curves as result of intersection.

Returns
-------
IntTools_SequenceOfPntOn2Faces
") Points;
		const IntTools_SequenceOfPntOn2Faces & Points();

		/****************** PrepareLines3D ******************/
		/**** md5 signature: 9608103b9dced13800e46e92e7b50562 ****/
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
		/**** md5 signature: ca18ce635d4700b2601132549e0efa1a ****/
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
		/**** md5 signature: a6e52c994eeddfce238b90491de5f35c ****/
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
		/**** md5 signature: 7b3314b4041c0a608529322354aff67b ****/
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
		/**** md5 signature: fb88c48e2809576decba34c028b1f91a ****/
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
		/**** md5 signature: 1bd0aa400de87da796d429cdd88c31ea ****/
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
		/**** md5 signature: 2de81fd2aa2e1959e9370fe9d98a7775 ****/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet();

		/****************** IntTools_MarkedRangeSet ******************/
		/**** md5 signature: 4500ab531466526ba62c7a3cf3175ae2 ****/
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
		/**** md5 signature: d24094bb339a747b35e080a89aa86097 ****/
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
		/**** md5 signature: 5a633977422925ff5909997008039bcc ****/
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
		/**** md5 signature: 19f111e88c6d1b4323855209356ac656 ****/
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
		/**** md5 signature: 26ff8081726339df9334c1710af4dfc6 ****/
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
		/**** md5 signature: 47656e5616d80ed5ba6856249a9fcd21 ****/
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
		/**** md5 signature: 147160f23e4f53045cc99bcee1449de1 ****/
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
		/**** md5 signature: 2de36adb6ef89f9e45fd40c833288539 ****/
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
		/**** md5 signature: b8fd2d3918a0cf59c612b32626527343 ****/
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
		/**** md5 signature: 79a2f1d842051df9c1cbd66c9d95b899 ****/
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
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns number of ranges.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Range ******************/
		/**** md5 signature: fcf0a09254cfa5f779950e9b958dff55 ****/
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
		/**** md5 signature: cbbd15d1280518d84c73f96f152194ff ****/
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
		/**** md5 signature: ddfe10428610541083a77392737cdd51 ****/
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
		/**** md5 signature: 9f170a5b3715e9f6a807626888c14c88 ****/
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
		/**** md5 signature: 2dbfead125cca31bb1f4cf9fd76dec35 ****/
		%feature("compactdefaultargs") IntTools_PntOn2Faces;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces();

		/****************** IntTools_PntOn2Faces ******************/
		/**** md5 signature: afb2dbb31f2af1cbbfb06f9506775ae8 ****/
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
		/**** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Selector.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** P1 ******************/
		/**** md5 signature: f057dd4658f8319bab9d06497b601c43 ****/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "Selector.

Returns
-------
IntTools_PntOnFace
") P1;
		const IntTools_PntOnFace & P1();

		/****************** P2 ******************/
		/**** md5 signature: d03b398a4a4515fff13f3bbb63105f04 ****/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "Selector.

Returns
-------
IntTools_PntOnFace
") P2;
		const IntTools_PntOnFace & P2();

		/****************** SetP1 ******************/
		/**** md5 signature: 18db88b6150151cd47132f94a6a27ca9 ****/
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
		/**** md5 signature: 7bf16fc967708fc83aabc008fa843a97 ****/
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
		/**** md5 signature: 85144754cba02ed47a44352f79ae48b4 ****/
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
		/**** md5 signature: 1c0e5bbf17215766ba82417ebcfe74f0 ****/
		%feature("compactdefaultargs") IntTools_PntOnFace;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_PntOnFace;
		 IntTools_PntOnFace();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Selector.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		/**** md5 signature: 58e5f3dd5eb5e4ad5ab1fd9f3909abf1 ****/
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
		/**** md5 signature: 24a2c71191423d4e30ed72f58cb5de87 ****/
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
		/**** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Selector.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** SetFace ******************/
		/**** md5 signature: b689a8f4d5c8b24783cd7ff1ee539b06 ****/
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
		/**** md5 signature: 766228d61435cf9eaba866b58733ed73 ****/
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
		/**** md5 signature: e7d87e72863cdb2f7fd541f048388bf8 ****/
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
		/**** md5 signature: 85144754cba02ed47a44352f79ae48b4 ****/
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
		/**** md5 signature: 937ff4933c1c21f110867b68d8e68ce4 ****/
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
		/**** md5 signature: e41c61afdd5ca0133ff554bb45f86cfe ****/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_Range;
		 IntTools_Range();

		/****************** IntTools_Range ******************/
		/**** md5 signature: 9c803d1ab38f8f55fe7a1646da7b942f ****/
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
		/**** md5 signature: 009dd98af15e46b2da286731f40e1839 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Selector.

Returns
-------
float
") First;
		Standard_Real First();

		/****************** Last ******************/
		/**** md5 signature: 4c8063c237a4f73018a7949da8aef9fb ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Selector.

Returns
-------
float
") Last;
		Standard_Real Last();

		/****************** Range ******************/
		/**** md5 signature: f69d6fade06795ea9184575ce38ac05f ****/
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
		/**** md5 signature: ee35428bdecb415ec0e9224957286cfd ****/
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
		/**** md5 signature: 5a37b268680286d7ec66485fc6a499f6 ****/
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
		/**** md5 signature: 17b1d91ee8fc43f1186accf3cd84cc0d ****/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_Root;
		 IntTools_Root();

		/****************** IntTools_Root ******************/
		/**** md5 signature: b959cc27cd34019eddf168fa6bb022cf ****/
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
		/**** md5 signature: a31ff5dbe0f0228a00c50b508f91df69 ****/
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
		/**** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns the validity flag for the root, true if mystatebefore==topabs_out && mystateafter==topabs_in or mystatebefore==topabs_out && mystateafter==topabs_on or mystatebefore==topabs_on && mystateafter==topabs_out or mystatebefore==topabs_in && mystateafter==topabs_out . for other cases it returns false.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** LayerHeight ******************/
		/**** md5 signature: b68e4274e6a27174113c27cc38c0b399 ****/
		%feature("compactdefaultargs") LayerHeight;
		%feature("autodoc", "Not used in edge/edge algorithm.

Returns
-------
float
") LayerHeight;
		Standard_Real LayerHeight();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the root value.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** SetInterval ******************/
		/**** md5 signature: 5db8941833681411c96383f7f525cd0b ****/
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
		/**** md5 signature: 360921e799cf445e50e6e253a3330162 ****/
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
		/**** md5 signature: 3e1ad94889d57c4dd5375b3307a5f5f7 ****/
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
		/**** md5 signature: ee9149c1422baa739405b40c2f9f26ec ****/
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
		/**** md5 signature: e698a20e4fef1eee6e76052d9adf9c4e ****/
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
		/**** md5 signature: b822c030059898c5c30ee0f0c5c0860f ****/
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
		/**** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the state after the root.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		/**** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ****/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Returns the state before the root.

Returns
-------
TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

		/****************** Type ******************/
		/**** md5 signature: fadaf18b7481222141380b2bb22870ff ****/
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
		/**** md5 signature: fb902a78ac553b0c26886882f99dcf4b ****/
		%feature("compactdefaultargs") IntTools_ShrunkRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_ShrunkRange;
		 IntTools_ShrunkRange();

		/****************** BndBox ******************/
		/**** md5 signature: 9dc09300173f027acf300663c3825bb1 ****/
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") BndBox;
		const Bnd_Box & BndBox();

		/****************** Context ******************/
		/**** md5 signature: 3ea460f8e5a9e1fe83439fe69bd1002e ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true in case the shrunk range is computed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSplittable ******************/
		/**** md5 signature: 4b9dd74e2aa42018fe83fe5063aa511b ****/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "Returns false in case the shrunk range is too short and the edge cannot be split, otherwise returns true.

Returns
-------
bool
") IsSplittable;
		Standard_Boolean IsSplittable();

		/****************** Length ******************/
		/**** md5 signature: 1d863a710d06afea5559458878200357 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the edge if computed.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetContext ******************/
		/**** md5 signature: f53c6fcf684a956c5bb75c3ef4778c58 ****/
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
		/**** md5 signature: 145ffca467a99ee459c5808f83bfde01 ****/
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
		/**** md5 signature: 67d5d9ae0e5a6a07df554656c52ff308 ****/
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
		/**** md5 signature: 35baf6c03780024996387c9697b878db ****/
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
		/**** md5 signature: 181c969b7f7ccf70d15429ee3d0ddec0 ****/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData();

		/****************** IntTools_SurfaceRangeLocalizeData ******************/
		/**** md5 signature: e50c45554410b70cdf3dd0ce0d5f1c38 ****/
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
		/**** md5 signature: 1f979aa83f2fa69e6e52f02ff927f89b ****/
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
		/**** md5 signature: 36a4ee0ba3f5d25cfcb396af65848035 ****/
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
		/**** md5 signature: fc05412e16f8b608962e691276314a35 ****/
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
		/**** md5 signature: 575be6410612719126135385b1cd425e ****/
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
		/**** md5 signature: e1cb2030c59bf4aaf51aadf8a8ccada4 ****/
		%feature("compactdefaultargs") ClearGrid;
		%feature("autodoc", "Clears the grid of points.

Returns
-------
None
") ClearGrid;
		void ClearGrid();

		/****************** FindBox ******************/
		/**** md5 signature: 023588dc4cb9abd025cc0596939d5783 ****/
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
		/**** md5 signature: 651ffb3f8257131de50ed9c5c36b2b3a ****/
		%feature("compactdefaultargs") GetGridDeflection;
		%feature("autodoc", "Query the grid deflection.

Returns
-------
float
") GetGridDeflection;
		Standard_Real GetGridDeflection();

		/****************** GetGridPoint ******************/
		/**** md5 signature: 7a9de1bb49672a1f2998131bff77fd7c ****/
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
		/**** md5 signature: ed1831687c3252e4ab7462e58541aad9 ****/
		%feature("compactdefaultargs") GetMinRangeU;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMinRangeU;
		Standard_Real GetMinRangeU();

		/****************** GetMinRangeV ******************/
		/**** md5 signature: 741dea0f057ccfd53f8013d45f1e2e00 ****/
		%feature("compactdefaultargs") GetMinRangeV;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetMinRangeV;
		Standard_Real GetMinRangeV();

		/****************** GetNBUPointsInFrame ******************/
		/**** md5 signature: 21e45d90ea5d5c1d2bcbf5240f17f4d8 ****/
		%feature("compactdefaultargs") GetNBUPointsInFrame;
		%feature("autodoc", "Returns the number of grid points on u direction in frame.

Returns
-------
int
") GetNBUPointsInFrame;
		Standard_Integer GetNBUPointsInFrame();

		/****************** GetNBVPointsInFrame ******************/
		/**** md5 signature: d30c8ef308d88876f4fa3c2d1c01738e ****/
		%feature("compactdefaultargs") GetNBVPointsInFrame;
		%feature("autodoc", "Returns the number of grid points on v direction in frame.

Returns
-------
int
") GetNBVPointsInFrame;
		Standard_Integer GetNBVPointsInFrame();

		/****************** GetNbSampleU ******************/
		/**** md5 signature: a8ca4343c5fe1833f66c7f9bc7e3ee91 ****/
		%feature("compactdefaultargs") GetNbSampleU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetNbSampleU;
		Standard_Integer GetNbSampleU();

		/****************** GetNbSampleV ******************/
		/**** md5 signature: 6e376b56bc07ba30f1f403960624bddb ****/
		%feature("compactdefaultargs") GetNbSampleV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetNbSampleV;
		Standard_Integer GetNbSampleV();

		/****************** GetPointInFrame ******************/
		/**** md5 signature: 7c30fd123ce2ee2a0a49fc12a6d1c102 ****/
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
		/**** md5 signature: 59c8708007b756d9b4de4f6f36d8e9cc ****/
		%feature("compactdefaultargs") GetRangeUGrid;
		%feature("autodoc", "Query the range u of the grid of points.

Returns
-------
int
") GetRangeUGrid;
		Standard_Integer GetRangeUGrid();

		/****************** GetRangeVGrid ******************/
		/**** md5 signature: 598ea256b66084f07b916a146e5a3863 ****/
		%feature("compactdefaultargs") GetRangeVGrid;
		%feature("autodoc", "Query the range v of the grid of points.

Returns
-------
int
") GetRangeVGrid;
		Standard_Integer GetRangeVGrid();

		/****************** GetUParam ******************/
		/**** md5 signature: d334fea47334c7b8b5145f289d532693 ****/
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
		/**** md5 signature: 92eaa408ea28122033919dcbcb63d9e5 ****/
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
		/**** md5 signature: 522b7d820733a44e26c053b89a2ce495 ****/
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
		/**** md5 signature: 96ffe45892410c71f1692de642b94cf6 ****/
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
		/**** md5 signature: 4171d39ff5e1e60b7c118de87554283e ****/
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
		/**** md5 signature: 7e891694efd307800817a73b6e661981 ****/
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
		/**** md5 signature: 28428b3ed3ac18659d285cf9089ace1f ****/
		%feature("compactdefaultargs") RemoveRangeOutAll;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RemoveRangeOutAll;
		void RemoveRangeOutAll();

		/****************** SetFrame ******************/
		/**** md5 signature: 62f01763553d6c704667200d37d30284 ****/
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
		/**** md5 signature: ad150e2f221695db1a8d64c83709443c ****/
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
		/**** md5 signature: 8e372cce2d0d9bfc06fb6def7d31de46 ****/
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
		/**** md5 signature: 95df3cf834523d9177b370c524ea192f ****/
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
		/**** md5 signature: f28a03e8ce81925252a1b0612f7804a7 ****/
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
		/**** md5 signature: f67b7ed49aa6c5b3b6b2f4283362aba8 ****/
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
		/**** md5 signature: 0aead173989e738d49f578f497a73972 ****/
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
		/**** md5 signature: 36554645d304d412b4acfaf570fc44fe ****/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample();

		/****************** IntTools_SurfaceRangeSample ******************/
		/**** md5 signature: 21ff6db05e69e0f7dd8d31a6a5c2f4a7 ****/
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
		/**** md5 signature: 9031a81e342f54de215dbbae20c7aaa1 ****/
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
		/**** md5 signature: fadc9424e42fab0d43b28577872b45e4 ****/
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
		/**** md5 signature: 4e0bcda96fd80097916b7a4e25b36492 ****/
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
		/**** md5 signature: 20a9fd80f0760f5e378e58f3b3487469 ****/
		%feature("compactdefaultargs") GetDepthU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetDepthU;
		Standard_Integer GetDepthU();

		/****************** GetDepthV ******************/
		/**** md5 signature: 38cbf0f4b918cec1d587d3332f387fec ****/
		%feature("compactdefaultargs") GetDepthV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetDepthV;
		Standard_Integer GetDepthV();

		/****************** GetDepths ******************/
		/**** md5 signature: 844bc266209967a29ad8670af126cf63 ****/
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
		/**** md5 signature: 6c546506ed977d446dadd78e60b74b9e ****/
		%feature("compactdefaultargs") GetIndexU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetIndexU;
		Standard_Integer GetIndexU();

		/****************** GetIndexV ******************/
		/**** md5 signature: b898bf54d7f9baa019e5f8d7ef19b8ec ****/
		%feature("compactdefaultargs") GetIndexV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetIndexV;
		Standard_Integer GetIndexV();

		/****************** GetIndexes ******************/
		/**** md5 signature: 4345854f43a8a3b26eb6fc28e64befe6 ****/
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
		/**** md5 signature: 72f3092305de05434db2f1c58933af8f ****/
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
		/**** md5 signature: 5b303d66cc6eb2c7d3e1b51dca13d071 ****/
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
		/**** md5 signature: 41b0a68ddb0905f10341d96685362caf ****/
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
		/**** md5 signature: 9be3dca4afa7b109fe244f818ad4d722 ****/
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
		/**** md5 signature: b22b6f78ee7cde851a90c8d7f85fe396 ****/
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
		/**** md5 signature: c8d49108f18324a413f503160a965248 ****/
		%feature("compactdefaultargs") GetSampleRangeU;
		%feature("autodoc", "No available documentation.

Returns
-------
IntTools_CurveRangeSample
") GetSampleRangeU;
		const IntTools_CurveRangeSample & GetSampleRangeU();

		/****************** GetSampleRangeV ******************/
		/**** md5 signature: 964dc9ccf4277374195c5fbb755fb5fe ****/
		%feature("compactdefaultargs") GetSampleRangeV;
		%feature("autodoc", "No available documentation.

Returns
-------
IntTools_CurveRangeSample
") GetSampleRangeV;
		const IntTools_CurveRangeSample & GetSampleRangeV();

		/****************** IsEqual ******************/
		/**** md5 signature: 080f0097ea4e0085b67175107f1752fc ****/
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
		/**** md5 signature: d8a4079bd407e8288e6043ce7cf17488 ****/
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
		/**** md5 signature: 8709b38d8e87682864a6f12b945ed365 ****/
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
		/**** md5 signature: 5422f55f0687626c3da85047f838ac09 ****/
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
		/**** md5 signature: 20242e42e3223d4ed1d2a8c1db6746d6 ****/
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
		/**** md5 signature: 025553a666d9b1a883bcaca1c542339a ****/
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
		/**** md5 signature: bff32a2faf670df061c3e451e4fcecd5 ****/
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
		/**** md5 signature: 9f24c8e6d2094ab643971884e239967d ****/
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
		/**** md5 signature: 15674547bc26c4dcf058e0909269422d ****/
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
		/**** md5 signature: 35efde7190414f5129d072b44af7911b ****/
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
		/**** md5 signature: 6d3b19735347659cabfe0a41e2669234 ****/
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
		/**** md5 signature: 81c1b71f6c538dd0c56d64c159e8676d ****/
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
		/**** md5 signature: 15d02586fff2ce52edcffb1b31010e98 ****/
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
		/**** md5 signature: 2b848ae9972fb59beee0caec542fcfd5 ****/
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
		/**** md5 signature: 123f50856194234a392e784b535ee463 ****/
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
		/**** md5 signature: 2b5edabfa3d68f4b56b0751fa8f7f611 ****/
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
		/**** md5 signature: de65e79bc2a32325faa9c51067b72bce ****/
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
		/**** md5 signature: 599527b22eb0bb087b88f7ee1ec60887 ****/
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
		/**** md5 signature: 8663f92679b0dc5e2760d0cb00974303 ****/
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
		/**** md5 signature: d616ccafe9e5d900be2c210b58b3c4b3 ****/
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
		/**** md5 signature: 5decb6946d416223e5b88e58f24beacb ****/
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
		/**** md5 signature: dd7cc4ec22a39e710a7e84da1ec268a6 ****/
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
		/**** md5 signature: 1e32c11974401d3014dc54f91407f85d ****/
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
		/**** md5 signature: f386bc6e11da4c61e860043065213189 ****/
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
		/**** md5 signature: 528780513280095656a4a6bf4ca88af3 ****/
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
		/**** md5 signature: 4e210e7add3be3fc346ff30953ce57ec ****/
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
		/**** md5 signature: 3cf3602d9a764f11f4a5915022c5727c ****/
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
		/**** md5 signature: 6916a00d7d86c20fd88332383c70c9c3 ****/
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
		/**** md5 signature: 7880bb60e450d0a23174ee9e40cf6897 ****/
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
		/**** md5 signature: 190862cc3492764794d377d819f0271b ****/
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
		/**** md5 signature: 5b755414e3334a00809a9a119642162b ****/
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
		/**** md5 signature: 59c4a1828a04fc7a8c2e2299a762106d ****/
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
		/**** md5 signature: 8501611b07c9e9b528bc9d65b9c7b062 ****/
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
		/**** md5 signature: 2c29a56daaa80b862224e90f08329dc6 ****/
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
		/**** md5 signature: 93afc76cdd7125ff52ee1efa8473ba88 ****/
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
		/**** md5 signature: 4808f7151517417a5f73a7bf9e74ffd3 ****/
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
		/**** md5 signature: aecf076ba5efb59825cef958cc497444 ****/
		%feature("compactdefaultargs") IntTools_TopolTool;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntTools_TopolTool;
		 IntTools_TopolTool();

		/****************** IntTools_TopolTool ******************/
		/**** md5 signature: 087710c751b18169da37de9e3df00120 ****/
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
		/**** md5 signature: 940d159b31fac83590ed8721227cec02 ****/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeSamplePoints;
		virtual void ComputeSamplePoints();

		/****************** Initialize ******************/
		/**** md5 signature: c1406d3f37ede5ce5f7bca787b95af63 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Redefined empty initializer //! warning: raises the exception notimplemented.

Returns
-------
None
") Initialize;
		virtual void Initialize();

		/****************** Initialize ******************/
		/**** md5 signature: 6021f0261cec049855d140d76f7a62a1 ****/
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
		/**** md5 signature: cd99f1dfd0ef40a4d961f9638d39e555 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Computes the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** NbSamplesU ******************/
		/**** md5 signature: 9402b5b7fe65eb10df77f3437e175357 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Computes the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU();

		/****************** NbSamplesV ******************/
		/**** md5 signature: d6f9b32ddea97452b8d6f7035907d24a ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Computes the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV();

		/****************** SamplePnts ******************/
		/**** md5 signature: a3961c7c25c5a055dad05c3f17c7d5a9 ****/
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
		/**** md5 signature: bc5c941f9b59752a7a36373d9a170420 ****/
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
		/**** md5 signature: 6f67b74dd70a713679e38978cbda5b5f ****/
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
		/**** md5 signature: eb83c267182a721a80afc576ebb61258 ****/
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
		/**** md5 signature: 76a0087adc5596d0e617ef24565b7dff ****/
		%feature("compactdefaultargs") IntTools_CurveRangeSample;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample();

		/****************** IntTools_CurveRangeSample ******************/
		/**** md5 signature: dbd85bca232b8f6decc3c23073331567 ****/
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
		/**** md5 signature: 7ac23a49be79924087f52de600296943 ****/
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
		/**** md5 signature: 9e0601229553314c5d6cf17f97f01bb8 ****/
		%feature("compactdefaultargs") GetRangeIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetRangeIndex;
		Standard_Integer GetRangeIndex();

		/****************** GetRangeIndexDeeper ******************/
		/**** md5 signature: 3b627fc0839e39820de5be25e9e0841c ****/
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
		/**** md5 signature: 720357c32baa29595c9829a8d3340edc ****/
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
		/**** md5 signature: 4fdbf789713035dfca58226b512c050d ****/
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
