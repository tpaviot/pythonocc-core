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
%define INTTOOLSDOCSTRING
"IntTools module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_inttools.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<IntTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
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
%import TColStd.i
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

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IntTools_Context)
%wrap_handle(IntTools_TopolTool)
/* end handles declaration */

/* templates */
%template(IntTools_Array1OfRange) NCollection_Array1<IntTools_Range>;
Array1ExtendIter(IntTools_Range)

%template(IntTools_Array1OfRoots) NCollection_Array1<IntTools_Root>;
Array1ExtendIter(IntTools_Root)

%template(IntTools_DataMapOfCurveSampleBox) NCollection_DataMap<IntTools_CurveRangeSample,Bnd_Box>;
%template(IntTools_DataMapOfSurfaceSampleBox) NCollection_DataMap<IntTools_SurfaceRangeSample,Bnd_Box>;
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
%template(IntTools_MapOfCurveSample) NCollection_Map<IntTools_CurveRangeSample>;
%template(IntTools_MapOfSurfaceSample) NCollection_Map<IntTools_SurfaceRangeSample>;
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
typedef TColStd_Array1OfReal IntTools_CArray1OfReal;
typedef NCollection_DataMap<IntTools_CurveRangeSample, Bnd_Box>::Iterator IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
typedef NCollection_DataMap<IntTools_SurfaceRangeSample, Bnd_Box>::Iterator IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
typedef NCollection_DataMap<IntTools_CurveRangeSample, Bnd_Box> IntTools_DataMapOfCurveSampleBox;
typedef NCollection_DataMap<IntTools_SurfaceRangeSample, Bnd_Box> IntTools_DataMapOfSurfaceSampleBox;
typedef NCollection_List<Bnd_Box>::Iterator IntTools_ListIteratorOfListOfBox;
typedef NCollection_List<IntTools_CurveRangeSample>::Iterator IntTools_ListIteratorOfListOfCurveRangeSample;
typedef NCollection_List<IntTools_SurfaceRangeSample>::Iterator IntTools_ListIteratorOfListOfSurfaceRangeSample;
typedef NCollection_List<Bnd_Box> IntTools_ListOfBox;
typedef NCollection_List<IntTools_CurveRangeSample> IntTools_ListOfCurveRangeSample;
typedef NCollection_List<IntTools_SurfaceRangeSample> IntTools_ListOfSurfaceRangeSample;
typedef NCollection_Map<IntTools_CurveRangeSample>::Iterator IntTools_MapIteratorOfMapOfCurveSample;
typedef NCollection_Map<IntTools_SurfaceRangeSample>::Iterator IntTools_MapIteratorOfMapOfSurfaceSample;
typedef NCollection_Map<IntTools_CurveRangeSample> IntTools_MapOfCurveSample;
typedef NCollection_Map<IntTools_SurfaceRangeSample> IntTools_MapOfSurfaceSample;
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
		/****** IntTools::FindRootStates ******/
		/****** md5 signature: c8523d4252dcd1c41e362a17e26b9c2d ******/
		%feature("compactdefaultargs") FindRootStates;
		%feature("autodoc", "
Parameters
----------
aSeq: IntTools_SequenceOfRoots
anEpsNull: float

Return
-------
None

Description
-----------
Find the states (before and after) for each Root from the sequence aSeq.
") FindRootStates;
		static void FindRootStates(IntTools_SequenceOfRoots & aSeq, const Standard_Real anEpsNull);

		/****** IntTools::GetRadius ******/
		/****** md5 signature: ebb9a3a6ab13c6cdada34d26544cc9b4 ******/
		%feature("compactdefaultargs") GetRadius;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
t1: float
t3: float

Return
-------
R: float

Description
-----------
No available documentation.
") GetRadius;
		static Standard_Integer GetRadius(const BRepAdaptor_Curve & C, const Standard_Real t1, const Standard_Real t3, Standard_Real &OutValue);

		/****** IntTools::Length ******/
		/****** md5 signature: fedfe5a7d041fc303d9b54c2f39dbbf1 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
float

Description
-----------
returns the length of the edge;.
") Length;
		static Standard_Real Length(const TopoDS_Edge & E);

		/****** IntTools::Parameter ******/
		/****** md5 signature: 66759e79aa637f03b445d32db9b6547f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve

Return
-------
aParm: float

Description
-----------
No available documentation.
") Parameter;
		static Standard_Integer Parameter(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, Standard_Real &OutValue);

		/****** IntTools::PrepareArgs ******/
		/****** md5 signature: db11865e519dd2b6c4899b1e9a125409 ******/
		%feature("compactdefaultargs") PrepareArgs;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
tMax: float
tMin: float
Discret: int
Deflect: float
anArgs: TColStd_Array1OfReal

Return
-------
int

Description
-----------
No available documentation.
") PrepareArgs;
		static Standard_Integer PrepareArgs(BRepAdaptor_Curve & C, const Standard_Real tMax, const Standard_Real tMin, const Standard_Integer Discret, const Standard_Real Deflect, TColStd_Array1OfReal & anArgs);

		/****** IntTools::RemoveIdenticalRoots ******/
		/****** md5 signature: 105777c711c5ed7389810d8aa8b35c2b ******/
		%feature("compactdefaultargs") RemoveIdenticalRoots;
		%feature("autodoc", "
Parameters
----------
aSeq: IntTools_SequenceOfRoots
anEpsT: float

Return
-------
None

Description
-----------
Remove from the sequence aSeq the Roots that have values ti and tj such as |ti-tj] < anEpsT.
") RemoveIdenticalRoots;
		static void RemoveIdenticalRoots(IntTools_SequenceOfRoots & aSeq, const Standard_Real anEpsT);

		/****** IntTools::SortRoots ******/
		/****** md5 signature: b0ecb73396f4953e96f152f925a6cdf5 ******/
		%feature("compactdefaultargs") SortRoots;
		%feature("autodoc", "
Parameters
----------
aSeq: IntTools_SequenceOfRoots
anEpsT: float

Return
-------
None

Description
-----------
Sort the sequence aSeq of the Roots to arrange the Roots in increasing order.
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
		/****** IntTools_BaseRangeSample::IntTools_BaseRangeSample ******/
		/****** md5 signature: 548c6fa8e9f4e6206978e24297ee5e8b ******/
		%feature("compactdefaultargs") IntTools_BaseRangeSample;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample();

		/****** IntTools_BaseRangeSample::IntTools_BaseRangeSample ******/
		/****** md5 signature: 4e59068351d36c15d01056928d2cfd8a ******/
		%feature("compactdefaultargs") IntTools_BaseRangeSample;
		%feature("autodoc", "
Parameters
----------
theDepth: int

Return
-------
None

Description
-----------
No available documentation.
") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample(const Standard_Integer theDepth);

		/****** IntTools_BaseRangeSample::GetDepth ******/
		/****** md5 signature: 3240086606b0522e674383dfc59a8226 ******/
		%feature("compactdefaultargs") GetDepth;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetDepth;
		Standard_Integer GetDepth();

		/****** IntTools_BaseRangeSample::SetDepth ******/
		/****** md5 signature: 5e77e638430ea7a494f4d91f424ddb79 ******/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "
Parameters
----------
theDepth: int

Return
-------
None

Description
-----------
No available documentation.
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
		/****** IntTools_BeanFaceIntersector::IntTools_BeanFaceIntersector ******/
		/****** md5 signature: 238be002c71b6de72f26b16c6e0bc07b ******/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector();

		/****** IntTools_BeanFaceIntersector::IntTools_BeanFaceIntersector ******/
		/****** md5 signature: cbfc790d73fd8f2233124f7fdb7c76ee ******/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Initializes the algorithm //! Warning: The parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result.
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****** IntTools_BeanFaceIntersector::IntTools_BeanFaceIntersector ******/
		/****** md5 signature: 543f11aedbb682a6ce91ee4fc0d7bb1a ******/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "
Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theBeanTolerance: float
theFaceTolerance: float

Return
-------
None

Description
-----------
Initializes the algorithm.
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****** IntTools_BeanFaceIntersector::IntTools_BeanFaceIntersector ******/
		/****** md5 signature: ff2b189d70ec0dd86884da9cd32f96bf ******/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Initializes the algorithm theUMinParameter, ... are used for optimization purposes.
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theFirstParOnCurve, const Standard_Real theLastParOnCurve, const Standard_Real theUMinParameter, const Standard_Real theUMaxParameter, const Standard_Real theVMinParameter, const Standard_Real theVMaxParameter, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****** IntTools_BeanFaceIntersector::Context ******/
		/****** md5 signature: 3ea460f8e5a9e1fe83439fe69bd1002e ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<IntTools_Context>

Description
-----------
Gets the intersection context.
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****** IntTools_BeanFaceIntersector::Init ******/
		/****** md5 signature: 2a831d636c2c924d38adfdfa075e8336 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Initializes the algorithm //! Warning: The parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result.
") Init;
		void Init(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****** IntTools_BeanFaceIntersector::Init ******/
		/****** md5 signature: 8502d8c9b8fd0854d0f0b6426b618b36 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theBeanTolerance: float
theFaceTolerance: float

Return
-------
None

Description
-----------
Initializes the algorithm.
") Init;
		void Init(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****** IntTools_BeanFaceIntersector::Init ******/
		/****** md5 signature: 0dabb5d8961ba27a6e5407fd062ddd7e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Initializes the algorithm theUMinParameter, ... are used for optimization purposes.
") Init;
		void Init(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const Standard_Real theFirstParOnCurve, const Standard_Real theLastParOnCurve, const Standard_Real theUMinParameter, const Standard_Real theUMaxParameter, const Standard_Real theVMinParameter, const Standard_Real theVMaxParameter, const Standard_Real theBeanTolerance, const Standard_Real theFaceTolerance);

		/****** IntTools_BeanFaceIntersector::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Done/NotDone state of the algorithm.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntTools_BeanFaceIntersector::MinimalSquareDistance ******/
		/****** md5 signature: 6aafb3181efcd21f3cf1bd5eea608a1e ******/
		%feature("compactdefaultargs") MinimalSquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal distance found between edge and face.
") MinimalSquareDistance;
		Standard_Real MinimalSquareDistance();

		/****** IntTools_BeanFaceIntersector::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Launches the algorithm.
") Perform;
		void Perform();

		/****** IntTools_BeanFaceIntersector::Result ******/
		/****** md5 signature: f3e9d73a3167c18aec1551dbc927085e ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
IntTools_SequenceOfRanges

Description
-----------
No available documentation.
") Result;
		const IntTools_SequenceOfRanges & Result();

		/****** IntTools_BeanFaceIntersector::Result ******/
		/****** md5 signature: 2d516e231789832b6855010cf4ce321f ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "
Parameters
----------
theResults: IntTools_SequenceOfRanges

Return
-------
None

Description
-----------
No available documentation.
") Result;
		void Result(IntTools_SequenceOfRanges & theResults);

		/****** IntTools_BeanFaceIntersector::SetBeanParameters ******/
		/****** md5 signature: 497fa539c82b82f373e3e356479adb27 ******/
		%feature("compactdefaultargs") SetBeanParameters;
		%feature("autodoc", "
Parameters
----------
theFirstParOnCurve: float
theLastParOnCurve: float

Return
-------
None

Description
-----------
Set restrictions for curve.
") SetBeanParameters;
		void SetBeanParameters(const Standard_Real theFirstParOnCurve, const Standard_Real theLastParOnCurve);

		/****** IntTools_BeanFaceIntersector::SetContext ******/
		/****** md5 signature: e78608a6b667b26dfbb5221975ad17a2 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theContext: IntTools_Context

Return
-------
None

Description
-----------
Sets the intersection context.
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****** IntTools_BeanFaceIntersector::SetSurfaceParameters ******/
		/****** md5 signature: 7c0eb1fe9df7cc46637f388f30d4e005 ******/
		%feature("compactdefaultargs") SetSurfaceParameters;
		%feature("autodoc", "
Parameters
----------
theUMinParameter: float
theUMaxParameter: float
theVMinParameter: float
theVMaxParameter: float

Return
-------
None

Description
-----------
Set restrictions for surface.
") SetSurfaceParameters;
		void SetSurfaceParameters(const Standard_Real theUMinParameter, const Standard_Real theUMaxParameter, const Standard_Real theVMinParameter, const Standard_Real theVMaxParameter);

};


%extend IntTools_BeanFaceIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntTools_CommonPrt *
***************************/
class IntTools_CommonPrt {
	public:
		/****** IntTools_CommonPrt::IntTools_CommonPrt ******/
		/****** md5 signature: 84f1339c773d48f9f538a3d1851d5e64 ******/
		%feature("compactdefaultargs") IntTools_CommonPrt;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_CommonPrt;
		 IntTools_CommonPrt();

		/****** IntTools_CommonPrt::IntTools_CommonPrt ******/
		/****** md5 signature: a37b2e310776652090dfa92ef0d1e78d ******/
		%feature("compactdefaultargs") IntTools_CommonPrt;
		%feature("autodoc", "
Parameters
----------
aCPrt: IntTools_CommonPrt

Return
-------
None

Description
-----------
Copy constructor.
") IntTools_CommonPrt;
		 IntTools_CommonPrt(const IntTools_CommonPrt & aCPrt);

		/****** IntTools_CommonPrt::AllNullFlag ******/
		/****** md5 signature: 908c5545063b9bbda8bc65208ceef27b ******/
		%feature("compactdefaultargs") AllNullFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Modifier.
") AllNullFlag;
		Standard_Boolean AllNullFlag();

		/****** IntTools_CommonPrt::AppendRange2 ******/
		/****** md5 signature: 5960301fb39fc0b320c947efb4dc1768 ******/
		%feature("compactdefaultargs") AppendRange2;
		%feature("autodoc", "
Parameters
----------
aR: IntTools_Range

Return
-------
None

Description
-----------
Appends the range of second edge.
") AppendRange2;
		void AppendRange2(const IntTools_Range & aR);

		/****** IntTools_CommonPrt::AppendRange2 ******/
		/****** md5 signature: 708bef267715325be71ab6aee65ad124 ******/
		%feature("compactdefaultargs") AppendRange2;
		%feature("autodoc", "
Parameters
----------
tf: float
tl: float

Return
-------
None

Description
-----------
Appends the range of second edge.
") AppendRange2;
		void AppendRange2(const Standard_Real tf, const Standard_Real tl);

		/****** IntTools_CommonPrt::Assign ******/
		/****** md5 signature: d342dcb5dbafbbae0c09bb3b1dd5f817 ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
Other: IntTools_CommonPrt

Return
-------
IntTools_CommonPrt

Description
-----------
No available documentation.
") Assign;
		IntTools_CommonPrt & Assign(const IntTools_CommonPrt & Other);

		/****** IntTools_CommonPrt::BoundingPoints ******/
		/****** md5 signature: 62077ccb7936ded8e52da8bf1d282415 ******/
		%feature("compactdefaultargs") BoundingPoints;
		%feature("autodoc", "
Parameters
----------
aP1: gp_Pnt
aP2: gp_Pnt

Return
-------
None

Description
-----------
Selector.
") BoundingPoints;
		void BoundingPoints(gp_Pnt & aP1, gp_Pnt & aP2);

		/****** IntTools_CommonPrt::ChangeRanges2 ******/
		/****** md5 signature: 68063400b9174bcfd695fd516296d397 ******/
		%feature("compactdefaultargs") ChangeRanges2;
		%feature("autodoc", "Return
-------
IntTools_SequenceOfRanges

Description
-----------
Returns the ranges of second edge.
") ChangeRanges2;
		IntTools_SequenceOfRanges & ChangeRanges2();

		/****** IntTools_CommonPrt::Copy ******/
		/****** md5 signature: 5e9d1484e7afefb381d4011472955718 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
anOther: IntTools_CommonPrt

Return
-------
None

Description
-----------
Copies me to anOther.
") Copy;
		void Copy(IntTools_CommonPrt & anOther);

		/****** IntTools_CommonPrt::Edge1 ******/
		/****** md5 signature: 290a5674bfab5bc84045440976535c10 ******/
		%feature("compactdefaultargs") Edge1;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the first edge.
") Edge1;
		const TopoDS_Edge Edge1();

		/****** IntTools_CommonPrt::Edge2 ******/
		/****** md5 signature: 74392148a2fac80727ba273414a06928 ******/
		%feature("compactdefaultargs") Edge2;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the second edge.
") Edge2;
		const TopoDS_Edge Edge2();

		/****** IntTools_CommonPrt::Range1 ******/
		/****** md5 signature: 661e98a7d85147b7d3a4f3bd5a54c295 ******/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "Return
-------
IntTools_Range

Description
-----------
Returns the range of first edge.
") Range1;
		const IntTools_Range & Range1();

		/****** IntTools_CommonPrt::Range1 ******/
		/****** md5 signature: 30700790756f454886ee8e50c2e8bf90 ******/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "
Parameters
----------

Return
-------
tf: float
tl: float

Description
-----------
Returns the range of first edge.
") Range1;
		void Range1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_CommonPrt::Ranges2 ******/
		/****** md5 signature: d424fd3763f6e267958ee53278d49c9f ******/
		%feature("compactdefaultargs") Ranges2;
		%feature("autodoc", "Return
-------
IntTools_SequenceOfRanges

Description
-----------
Returns the ranges of second edge.
") Ranges2;
		const IntTools_SequenceOfRanges & Ranges2();

		/****** IntTools_CommonPrt::SetAllNullFlag ******/
		/****** md5 signature: 093ece8d9b8d0ba21c3c4d4f9e3112c7 ******/
		%feature("compactdefaultargs") SetAllNullFlag;
		%feature("autodoc", "
Parameters
----------
aFlag: bool

Return
-------
None

Description
-----------
Selector.
") SetAllNullFlag;
		void SetAllNullFlag(const Standard_Boolean aFlag);

		/****** IntTools_CommonPrt::SetBoundingPoints ******/
		/****** md5 signature: 5be6ee5d794590b5e394dce9904907bc ******/
		%feature("compactdefaultargs") SetBoundingPoints;
		%feature("autodoc", "
Parameters
----------
aP1: gp_Pnt
aP2: gp_Pnt

Return
-------
None

Description
-----------
Modifier.
") SetBoundingPoints;
		void SetBoundingPoints(const gp_Pnt & aP1, const gp_Pnt & aP2);

		/****** IntTools_CommonPrt::SetEdge1 ******/
		/****** md5 signature: 589c51a96f15d196589c8826cf3bfa58 ******/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge

Return
-------
None

Description
-----------
Sets the first edge.
") SetEdge1;
		void SetEdge1(const TopoDS_Edge & anE);

		/****** IntTools_CommonPrt::SetEdge2 ******/
		/****** md5 signature: 4e912f624d1386896b459de262e40b21 ******/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge

Return
-------
None

Description
-----------
Sets the second edge.
") SetEdge2;
		void SetEdge2(const TopoDS_Edge & anE);

		/****** IntTools_CommonPrt::SetRange1 ******/
		/****** md5 signature: 45335c811770d711e394b42e23c8db15 ******/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "
Parameters
----------
aR: IntTools_Range

Return
-------
None

Description
-----------
Sets the range of first edge.
") SetRange1;
		void SetRange1(const IntTools_Range & aR);

		/****** IntTools_CommonPrt::SetRange1 ******/
		/****** md5 signature: 79f55915b2d14e875ddb73de80604eaa ******/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "
Parameters
----------
tf: float
tl: float

Return
-------
None

Description
-----------
Sets the range of first edge.
") SetRange1;
		void SetRange1(const Standard_Real tf, const Standard_Real tl);

		/****** IntTools_CommonPrt::SetType ******/
		/****** md5 signature: 17ce8083107574d8d14b69b99c94920e ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
aType: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
Sets the type of the common part Vertex or Edge.
") SetType;
		void SetType(const TopAbs_ShapeEnum aType);

		/****** IntTools_CommonPrt::SetVertexParameter1 ******/
		/****** md5 signature: 4a9de2bb794f2e7b8fd44058b76de958 ******/
		%feature("compactdefaultargs") SetVertexParameter1;
		%feature("autodoc", "
Parameters
----------
tV: float

Return
-------
None

Description
-----------
Sets a parameter of first vertex.
") SetVertexParameter1;
		void SetVertexParameter1(const Standard_Real tV);

		/****** IntTools_CommonPrt::SetVertexParameter2 ******/
		/****** md5 signature: 67c95a8c184f23fe920a7cb6f70674d4 ******/
		%feature("compactdefaultargs") SetVertexParameter2;
		%feature("autodoc", "
Parameters
----------
tV: float

Return
-------
None

Description
-----------
Sets a parameter of second vertex.
") SetVertexParameter2;
		void SetVertexParameter2(const Standard_Real tV);

		/****** IntTools_CommonPrt::Type ******/
		/****** md5 signature: 3f27a65186b8053d282c2c0d8c4513b8 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the type of the common part.
") Type;
		TopAbs_ShapeEnum Type();

		/****** IntTools_CommonPrt::VertexParameter1 ******/
		/****** md5 signature: 5b5eede02e9405b4f1d5c9ebe2105684 ******/
		%feature("compactdefaultargs") VertexParameter1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of first vertex.
") VertexParameter1;
		Standard_Real VertexParameter1();

		/****** IntTools_CommonPrt::VertexParameter2 ******/
		/****** md5 signature: 47c8acaed04542460a05bac34c48c80a ******/
		%feature("compactdefaultargs") VertexParameter2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of second vertex.
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
		/****** IntTools_Context::IntTools_Context ******/
		/****** md5 signature: 5a8fa8d388ac98fd0b79fa4d55afb898 ******/
		%feature("compactdefaultargs") IntTools_Context;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntTools_Context;
		 IntTools_Context();

		/****** IntTools_Context::IntTools_Context ******/
		/****** md5 signature: c12f5dba02b71233c7206c50d55269d5 ******/
		%feature("compactdefaultargs") IntTools_Context;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") IntTools_Context;
		 IntTools_Context(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** IntTools_Context::BndBox ******/
		/****** md5 signature: b665f86cc78f1726c03e804fc38d0b73 ******/
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
Bnd_Box

Description
-----------
No available documentation.
") BndBox;
		Bnd_Box & BndBox(const TopoDS_Shape & theS);

		/****** IntTools_Context::ComputePE ******/
		/****** md5 signature: 433859fbf446aebf55a30c6b1d66ed46 ******/
		%feature("compactdefaultargs") ComputePE;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theTolP: float
theE: TopoDS_Edge

Return
-------
theT: float
theDist: float

Description
-----------
Computes parameter of the Point theP on the edge aE. Returns zero if the distance between point and edge is less than sum of tolerance value of edge and theTopP, otherwise and for following conditions returns negative value 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3).
") ComputePE;
		Standard_Integer ComputePE(const gp_Pnt & theP, const Standard_Real theTolP, const TopoDS_Edge & theE, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Context::ComputeVE ******/
		/****** md5 signature: b6290a8ed372f0df63c99255ce0ffc35 ******/
		%feature("compactdefaultargs") ComputeVE;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theE: TopoDS_Edge
theFuzz: float (optional, default to Precision::Confusion())

Return
-------
theT: float
theTol: float

Description
-----------
Computes parameter of the vertex aV on the edge aE and correct tolerance value for the vertex on the edge. Returns zero if the distance between vertex and edge is less than sum of tolerances and the fuzzy value, otherwise and for following conditions returns negative value: 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3).
") ComputeVE;
		Standard_Integer ComputeVE(const TopoDS_Vertex & theV, const TopoDS_Edge & theE, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real theFuzz = Precision::Confusion());

		/****** IntTools_Context::ComputeVF ******/
		/****** md5 signature: 0d41241c758f89c65227f2424527c288 ******/
		%feature("compactdefaultargs") ComputeVF;
		%feature("autodoc", "
Parameters
----------
theVertex: TopoDS_Vertex
theFace: TopoDS_Face
theFuzz: float (optional, default to Precision::Confusion())

Return
-------
theU: float
theV: float
theTol: float

Description
-----------
Computes UV parameters of the vertex aV on face aF and correct tolerance value for the vertex on the face. Returns zero if the distance between vertex and face is less than or equal the sum of tolerances and the fuzzy value and the projection point lays inside boundaries of the face. For following conditions returns negative value 1. projection algorithm failed (-1) 2. distance is more than sum of tolerances (-2) 3. projection point out or on the boundaries of face (-3).
") ComputeVF;
		Standard_Integer ComputeVF(const TopoDS_Vertex & theVertex, const TopoDS_Face & theFace, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real theFuzz = Precision::Confusion());

		/****** IntTools_Context::FClass2d ******/
		/****** md5 signature: b1c2f6895ff38359f51ae392b469a3e5 ******/
		%feature("compactdefaultargs") FClass2d;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face

Return
-------
IntTools_FClass2d

Description
-----------
Returns a reference to point classifier for given face.
") FClass2d;
		IntTools_FClass2d & FClass2d(const TopoDS_Face & aF);

		/****** IntTools_Context::Hatcher ******/
		/****** md5 signature: eafd4ba666fa66dd0acd6b30451e32b7 ******/
		%feature("compactdefaultargs") Hatcher;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face

Return
-------
Geom2dHatch_Hatcher

Description
-----------
Returns a reference to 2D hatcher for given face.
") Hatcher;
		Geom2dHatch_Hatcher & Hatcher(const TopoDS_Face & aF);

		/****** IntTools_Context::IsInfiniteFace ******/
		/****** md5 signature: 4208488ba6be349c9a4870e649bd7a9e ******/
		%feature("compactdefaultargs") IsInfiniteFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
bool

Description
-----------
Returns true if the solid <theFace> has infinite bounds.
") IsInfiniteFace;
		Standard_Boolean IsInfiniteFace(const TopoDS_Face & theFace);

		/****** IntTools_Context::IsPointInFace ******/
		/****** md5 signature: dd8b7ab67a350d30d534581f18bc3b1f ******/
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
aP2D: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns true if the point aP2D is inside the boundaries of the face aF, otherwise returns false.
") IsPointInFace;
		Standard_Boolean IsPointInFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****** IntTools_Context::IsPointInFace ******/
		/****** md5 signature: 6282883d47a3ccc0957daf8fa6b4d1d4 ******/
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "
Parameters
----------
aP3D: gp_Pnt
aF: TopoDS_Face
aTol: float

Return
-------
bool

Description
-----------
Returns true if the point aP2D is inside the boundaries of the face aF, otherwise returns false.
") IsPointInFace;
		Standard_Boolean IsPointInFace(const gp_Pnt & aP3D, const TopoDS_Face & aF, const Standard_Real aTol);

		/****** IntTools_Context::IsPointInOnFace ******/
		/****** md5 signature: 41eefe589d896e0e205f0ab5615c1747 ******/
		%feature("compactdefaultargs") IsPointInOnFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
aP2D: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns true if the point aP2D is inside or on the boundaries of aF.
") IsPointInOnFace;
		Standard_Boolean IsPointInOnFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****** IntTools_Context::IsValidBlockForFace ******/
		/****** md5 signature: 9b87a05baa78912887ba878a42d1224f ******/
		%feature("compactdefaultargs") IsValidBlockForFace;
		%feature("autodoc", "
Parameters
----------
aT1: float
aT2: float
aIC: IntTools_Curve
aF: TopoDS_Face
aTol: float

Return
-------
bool

Description
-----------
Returns true if IsValidPointForFace returns true for some 3d point that lay on the curve aIC bounded by parameters aT1 and aT2.
") IsValidBlockForFace;
		Standard_Boolean IsValidBlockForFace(const Standard_Real aT1, const Standard_Real aT2, const IntTools_Curve & aIC, const TopoDS_Face & aF, const Standard_Real aTol);

		/****** IntTools_Context::IsValidBlockForFaces ******/
		/****** md5 signature: 701eb7bbbdf70f75992f852885147978 ******/
		%feature("compactdefaultargs") IsValidBlockForFaces;
		%feature("autodoc", "
Parameters
----------
aT1: float
aT2: float
aIC: IntTools_Curve
aF1: TopoDS_Face
aF2: TopoDS_Face
aTol: float

Return
-------
bool

Description
-----------
Returns true if IsValidBlockForFace returns true for both faces aF1 and aF2.
") IsValidBlockForFaces;
		Standard_Boolean IsValidBlockForFaces(const Standard_Real aT1, const Standard_Real aT2, const IntTools_Curve & aIC, const TopoDS_Face & aF1, const TopoDS_Face & aF2, const Standard_Real aTol);

		/****** IntTools_Context::IsValidPointForFace ******/
		/****** md5 signature: f72d455d56ecf493cea383abf0705839 ******/
		%feature("compactdefaultargs") IsValidPointForFace;
		%feature("autodoc", "
Parameters
----------
aP3D: gp_Pnt
aF: TopoDS_Face
aTol: float

Return
-------
bool

Description
-----------
Returns true if the distance between point aP3D and face aF is less or equal to tolerance aTol and projection point is inside or on the boundaries of the face aF.
") IsValidPointForFace;
		Standard_Boolean IsValidPointForFace(const gp_Pnt & aP3D, const TopoDS_Face & aF, const Standard_Real aTol);

		/****** IntTools_Context::IsValidPointForFaces ******/
		/****** md5 signature: bacf6bc4d2c743db6314f13811d22957 ******/
		%feature("compactdefaultargs") IsValidPointForFaces;
		%feature("autodoc", "
Parameters
----------
aP3D: gp_Pnt
aF1: TopoDS_Face
aF2: TopoDS_Face
aTol: float

Return
-------
bool

Description
-----------
Returns true if IsValidPointForFace returns true for both face aF1 and aF2.
") IsValidPointForFaces;
		Standard_Boolean IsValidPointForFaces(const gp_Pnt & aP3D, const TopoDS_Face & aF1, const TopoDS_Face & aF2, const Standard_Real aTol);

		/****** IntTools_Context::IsVertexOnLine ******/
		/****** md5 signature: ada36e522fc40610fef0c99f6081e687 ******/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "
Parameters
----------
aV: TopoDS_Vertex
aIC: IntTools_Curve
aTolC: float

Return
-------
aT: float

Description
-----------
Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant).
") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine(const TopoDS_Vertex & aV, const IntTools_Curve & aIC, const Standard_Real aTolC, Standard_Real &OutValue);

		/****** IntTools_Context::IsVertexOnLine ******/
		/****** md5 signature: 3d4b43894f64d9f00a92f55e69fc53ae ******/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "
Parameters
----------
aV: TopoDS_Vertex
aTolV: float
aIC: IntTools_Curve
aTolC: float

Return
-------
aT: float

Description
-----------
Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant).
") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine(const TopoDS_Vertex & aV, const Standard_Real aTolV, const IntTools_Curve & aIC, const Standard_Real aTolC, Standard_Real &OutValue);

		/****** IntTools_Context::OBB ******/
		/****** md5 signature: 1d5864d2e1ead554a014d93c916407d2 ******/
		%feature("compactdefaultargs") OBB;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFuzzyValue: float (optional, default to Precision::Confusion())

Return
-------
Bnd_OBB

Description
-----------
Builds and stores an Oriented Bounding Box for the shape. Returns a reference to OBB.
") OBB;
		Bnd_OBB & OBB(const TopoDS_Shape & theShape, const Standard_Real theFuzzyValue = Precision::Confusion());

		/****** IntTools_Context::ProjPC ******/
		/****** md5 signature: 80777d0414fefd358cdb191eb228dd85 ******/
		%feature("compactdefaultargs") ProjPC;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge

Return
-------
GeomAPI_ProjectPointOnCurve

Description
-----------
Returns a reference to point projector for given edge.
") ProjPC;
		GeomAPI_ProjectPointOnCurve & ProjPC(const TopoDS_Edge & aE);

		/****** IntTools_Context::ProjPS ******/
		/****** md5 signature: 438fda98b0efafe0ae8ce6560c616a59 ******/
		%feature("compactdefaultargs") ProjPS;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face

Return
-------
GeomAPI_ProjectPointOnSurf

Description
-----------
Returns a reference to point projector for given face.
") ProjPS;
		GeomAPI_ProjectPointOnSurf & ProjPS(const TopoDS_Face & aF);

		/****** IntTools_Context::ProjPT ******/
		/****** md5 signature: aba2bd758e4199242c7964213c263db8 ******/
		%feature("compactdefaultargs") ProjPT;
		%feature("autodoc", "
Parameters
----------
aC: Geom_Curve

Return
-------
GeomAPI_ProjectPointOnCurve

Description
-----------
Returns a reference to point projector for given curve.
") ProjPT;
		GeomAPI_ProjectPointOnCurve & ProjPT(const opencascade::handle<Geom_Curve> & aC);

		/****** IntTools_Context::ProjectPointOnEdge ******/
		/****** md5 signature: 232fa89a199cb61ab107fd3a27a80ef6 ******/
		%feature("compactdefaultargs") ProjectPointOnEdge;
		%feature("autodoc", "
Parameters
----------
aP: gp_Pnt
aE: TopoDS_Edge

Return
-------
aT: float

Description
-----------
Computes parameter of the point aP on the edge aE. Returns false if projection algorithm failed other wiese returns true.
") ProjectPointOnEdge;
		Standard_Boolean ProjectPointOnEdge(const gp_Pnt & aP, const TopoDS_Edge & aE, Standard_Real &OutValue);

		/****** IntTools_Context::SetPOnSProjectionTolerance ******/
		/****** md5 signature: 0a006e545a34b530febea0340daba8f1 ******/
		%feature("compactdefaultargs") SetPOnSProjectionTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets tolerance to be used for projection of point on surface. Clears map of already cached projectors in order to maintain correct value for all projectors.
") SetPOnSProjectionTolerance;
		void SetPOnSProjectionTolerance(const Standard_Real theValue);

		/****** IntTools_Context::SolidClassifier ******/
		/****** md5 signature: 0cbf16c1445d0ca00ad0f27f6ae63d0a ******/
		%feature("compactdefaultargs") SolidClassifier;
		%feature("autodoc", "
Parameters
----------
aSolid: TopoDS_Solid

Return
-------
BRepClass3d_SolidClassifier

Description
-----------
Returns a reference to solid classifier for given solid.
") SolidClassifier;
		BRepClass3d_SolidClassifier & SolidClassifier(const TopoDS_Solid & aSolid);

		/****** IntTools_Context::StatePointFace ******/
		/****** md5 signature: 9349db404468e857455e4a423e76c10a ******/
		%feature("compactdefaultargs") StatePointFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
aP2D: gp_Pnt2d

Return
-------
TopAbs_State

Description
-----------
Returns the state of the point aP2D relative to face aF.
") StatePointFace;
		TopAbs_State StatePointFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****** IntTools_Context::SurfaceAdaptor ******/
		/****** md5 signature: 20b00b48b9d70640e64ccf30711ff36f ******/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
BRepAdaptor_Surface

Description
-----------
Returns a reference to surface adaptor for given face.
") SurfaceAdaptor;
		BRepAdaptor_Surface & SurfaceAdaptor(const TopoDS_Face & theFace);

		/****** IntTools_Context::SurfaceData ******/
		/****** md5 signature: 7cc75d022ff217235e007983741d5277 ******/
		%feature("compactdefaultargs") SurfaceData;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face

Return
-------
IntTools_SurfaceRangeLocalizeData

Description
-----------
Returns a reference to surface localization data for given face.
") SurfaceData;
		IntTools_SurfaceRangeLocalizeData & SurfaceData(const TopoDS_Face & aF);

		/****** IntTools_Context::UVBounds ******/
		/****** md5 signature: 72d57696b592f2c756d1efcef885d122 ******/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
UMin: float
UMax: float
VMin: float
VMax: float

Description
-----------
Computes the boundaries of the face using surface adaptor.
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
		/****** IntTools_Curve::IntTools_Curve ******/
		/****** md5 signature: 1f839c29da82c1c9663c05f577e6125d ******/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_Curve;
		 IntTools_Curve();

		/****** IntTools_Curve::IntTools_Curve ******/
		/****** md5 signature: bd3979a356abc48d3a7e7473a7d68d25 ******/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "
Parameters
----------
the3dCurve3d: Geom_Curve
the2dCurve1: Geom2d_Curve
the2dCurve2: Geom2d_Curve
theTolerance: float (optional, default to 0.0)
theTangentialTolerance: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Constructor taking 3d curve, two 2d curves and two tolerance values.
") IntTools_Curve;
		 IntTools_Curve(const opencascade::handle<Geom_Curve> & the3dCurve3d, const opencascade::handle<Geom2d_Curve> & the2dCurve1, const opencascade::handle<Geom2d_Curve> & the2dCurve2, const Standard_Real theTolerance = 0.0, const Standard_Real theTangentialTolerance = 0.0);

		/****** IntTools_Curve::Bounds ******/
		/****** md5 signature: ba1495abc333e2d042b010a7e696f504 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Return
-------
theFirst: float
theLast: float

Description
-----------
If the 3d curve is bounded curve the method will return True and modify the output parameters with boundary parameters of the curve and corresponded 3d points. If the curve does not have bounds, the method will return false and the output parameters will stay untouched.
") Bounds;
		Standard_Boolean Bounds(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt);

		/****** IntTools_Curve::Curve ******/
		/****** md5 signature: 62a16889fb975efa1b2de012099c169b ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns 3d curve.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****** IntTools_Curve::D0 ******/
		/****** md5 signature: 78502201fa5be47ff5bf66d737b6bf31 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
thePar: float
thePnt: gp_Pnt

Return
-------
bool

Description
-----------
Computes 3d point corresponded to the given parameter if this parameter is inside the boundaries of the curve. Returns True in this case. Otherwise, the point will not be computed and the method will return False.
") D0;
		Standard_Boolean D0(const Standard_Real & thePar, gp_Pnt & thePnt);

		/****** IntTools_Curve::FirstCurve2d ******/
		/****** md5 signature: c3d29c0810f888c120a5078e912786f3 ******/
		%feature("compactdefaultargs") FirstCurve2d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns first 2d curve.
") FirstCurve2d;
		const opencascade::handle<Geom2d_Curve> & FirstCurve2d();

		/****** IntTools_Curve::HasBounds ******/
		/****** md5 signature: 709735581c3c2f455f6927bb4a4e531d ******/
		%feature("compactdefaultargs") HasBounds;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if 3d curve is BoundedCurve.
") HasBounds;
		Standard_Boolean HasBounds();

		/****** IntTools_Curve::SecondCurve2d ******/
		/****** md5 signature: 01e3a51db1c39fa9598c0ad8bfdcbbd9 ******/
		%feature("compactdefaultargs") SecondCurve2d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns second 2d curve.
") SecondCurve2d;
		const opencascade::handle<Geom2d_Curve> & SecondCurve2d();

		/****** IntTools_Curve::SetCurve ******/
		/****** md5 signature: 8875d532d0f382113206b2bfe333cdac ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
the3dCurve: Geom_Curve

Return
-------
None

Description
-----------
Sets the 3d curve.
") SetCurve;
		void SetCurve(const opencascade::handle<Geom_Curve> & the3dCurve);

		/****** IntTools_Curve::SetCurves ******/
		/****** md5 signature: bd816be358e1f1ede5b32ee8a63a4168 ******/
		%feature("compactdefaultargs") SetCurves;
		%feature("autodoc", "
Parameters
----------
the3dCurve: Geom_Curve
the2dCurve1: Geom2d_Curve
the2dCurve2: Geom2d_Curve

Return
-------
None

Description
-----------
Sets the curves.
") SetCurves;
		void SetCurves(const opencascade::handle<Geom_Curve> & the3dCurve, const opencascade::handle<Geom2d_Curve> & the2dCurve1, const opencascade::handle<Geom2d_Curve> & the2dCurve2);

		/****** IntTools_Curve::SetFirstCurve2d ******/
		/****** md5 signature: 76c7aa7f7240116462c8f710634326f5 ******/
		%feature("compactdefaultargs") SetFirstCurve2d;
		%feature("autodoc", "
Parameters
----------
the2dCurve1: Geom2d_Curve

Return
-------
None

Description
-----------
Sets the first 2d curve.
") SetFirstCurve2d;
		void SetFirstCurve2d(const opencascade::handle<Geom2d_Curve> & the2dCurve1);

		/****** IntTools_Curve::SetSecondCurve2d ******/
		/****** md5 signature: 9d7a24597025b9d91d230fd458e16942 ******/
		%feature("compactdefaultargs") SetSecondCurve2d;
		%feature("autodoc", "
Parameters
----------
the2dCurve2: Geom2d_Curve

Return
-------
None

Description
-----------
Sets the second 2d curve.
") SetSecondCurve2d;
		void SetSecondCurve2d(const opencascade::handle<Geom2d_Curve> & the2dCurve2);

		/****** IntTools_Curve::SetTangentialTolerance ******/
		/****** md5 signature: 30b3ca13e643da6655abf5b0795a5374 ******/
		%feature("compactdefaultargs") SetTangentialTolerance;
		%feature("autodoc", "
Parameters
----------
theTangentialTolerance: float

Return
-------
None

Description
-----------
Sets the tangential tolerance.
") SetTangentialTolerance;
		void SetTangentialTolerance(const Standard_Real theTangentialTolerance);

		/****** IntTools_Curve::SetTolerance ******/
		/****** md5 signature: 2df6ca87a12fc10518568e45d2ce38db ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: float

Return
-------
None

Description
-----------
Sets the tolerance for the curve.
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****** IntTools_Curve::TangentialTolerance ******/
		/****** md5 signature: c1e785de724669f2f929496d8c904a9c ******/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tangential tolerance.
") TangentialTolerance;
		Standard_Real TangentialTolerance();

		/****** IntTools_Curve::Tolerance ******/
		/****** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tolerance.
") Tolerance;
		Standard_Real Tolerance();

		/****** IntTools_Curve::Type ******/
		/****** md5 signature: af8b9d8db8cab58b4286d8896f12d09c ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the 3d curve.
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
		/****** IntTools_CurveRangeLocalizeData::IntTools_CurveRangeLocalizeData ******/
		/****** md5 signature: b15946d4ec9579fb879a3817251b96f6 ******/
		%feature("compactdefaultargs") IntTools_CurveRangeLocalizeData;
		%feature("autodoc", "
Parameters
----------
theNbSample: int
theMinRange: float

Return
-------
None

Description
-----------
No available documentation.
") IntTools_CurveRangeLocalizeData;
		 IntTools_CurveRangeLocalizeData(const Standard_Integer theNbSample, const Standard_Real theMinRange);

		/****** IntTools_CurveRangeLocalizeData::AddBox ******/
		/****** md5 signature: 610b7a5472a894448f6ee0290e9bc472 ******/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_CurveRangeSample
theBox: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddBox;
		void AddBox(const IntTools_CurveRangeSample & theRange, const Bnd_Box & theBox);

		/****** IntTools_CurveRangeLocalizeData::AddOutRange ******/
		/****** md5 signature: 7fd7fe5924530ae86b84715f2b9a2c44 ******/
		%feature("compactdefaultargs") AddOutRange;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_CurveRangeSample

Return
-------
None

Description
-----------
No available documentation.
") AddOutRange;
		void AddOutRange(const IntTools_CurveRangeSample & theRange);

		/****** IntTools_CurveRangeLocalizeData::FindBox ******/
		/****** md5 signature: 955c2eb738662c02a335a8720b04c6fa ******/
		%feature("compactdefaultargs") FindBox;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_CurveRangeSample
theBox: Bnd_Box

Return
-------
bool

Description
-----------
No available documentation.
") FindBox;
		Standard_Boolean FindBox(const IntTools_CurveRangeSample & theRange, Bnd_Box & theBox);

		/****** IntTools_CurveRangeLocalizeData::GetMinRange ******/
		/****** md5 signature: c20164b072a0539b77d80ec44457b89b ******/
		%feature("compactdefaultargs") GetMinRange;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetMinRange;
		Standard_Real GetMinRange();

		/****** IntTools_CurveRangeLocalizeData::GetNbSample ******/
		/****** md5 signature: b7817d28b4ff3dc88a09b6dd1762ed0e ******/
		%feature("compactdefaultargs") GetNbSample;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetNbSample;
		Standard_Integer GetNbSample();

		/****** IntTools_CurveRangeLocalizeData::IsRangeOut ******/
		/****** md5 signature: fe3cadcb4748c51492051c9c24a9f858 ******/
		%feature("compactdefaultargs") IsRangeOut;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_CurveRangeSample

Return
-------
bool

Description
-----------
No available documentation.
") IsRangeOut;
		Standard_Boolean IsRangeOut(const IntTools_CurveRangeSample & theRange);

		/****** IntTools_CurveRangeLocalizeData::ListRangeOut ******/
		/****** md5 signature: 2260e4f3f132ded0a9ac9ebb91324c89 ******/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", "
Parameters
----------
theList: IntTools_ListOfCurveRangeSample

Return
-------
None

Description
-----------
No available documentation.
") ListRangeOut;
		void ListRangeOut(IntTools_ListOfCurveRangeSample & theList);

};


%extend IntTools_CurveRangeLocalizeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_EdgeEdge *
**************************/
class IntTools_EdgeEdge {
	public:
		/****** IntTools_EdgeEdge::IntTools_EdgeEdge ******/
		/****** md5 signature: 4551d18744ed7c6ae5b1e1b4794a6264 ******/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge();

		/****** IntTools_EdgeEdge::IntTools_EdgeEdge ******/
		/****** md5 signature: a7b58f57429b22fb3dc3ed0030a8f53e ******/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "
Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge

Return
-------
None

Description
-----------
Constructor.
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2);

		/****** IntTools_EdgeEdge::IntTools_EdgeEdge ******/
		/****** md5 signature: 69b54a28360beb7321650d1ae6f019d5 ******/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "
Parameters
----------
theEdge1: TopoDS_Edge
aT11: float
aT12: float
theEdge2: TopoDS_Edge
aT21: float
aT22: float

Return
-------
None

Description
-----------
Constructor.
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge(const TopoDS_Edge & theEdge1, const Standard_Real aT11, const Standard_Real aT12, const TopoDS_Edge & theEdge2, const Standard_Real aT21, const Standard_Real aT22);

		/****** IntTools_EdgeEdge::CommonParts ******/
		/****** md5 signature: da730b5d8002362e580852ec6aa829ea ******/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Return
-------
IntTools_SequenceOfCommonPrts

Description
-----------
Returns common parts.
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts();

		/****** IntTools_EdgeEdge::FuzzyValue ******/
		/****** md5 signature: be29fbc3587cce2740c43ae36346b88f ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Fuzzy value.
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****** IntTools_EdgeEdge::IsCoincidenceCheckedQuickly ******/
		/****** md5 signature: 2e1263cf549e045820bc46ffe90d3253 ******/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag myQuickCoincidenceCheck.
") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly();

		/****** IntTools_EdgeEdge::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if common part(s) is(are) found.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntTools_EdgeEdge::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the intersection between edges.
") Perform;
		void Perform();

		/****** IntTools_EdgeEdge::SetEdge1 ******/
		/****** md5 signature: 40a00ccba436889bf949ef0562a3edc9 ******/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Sets the first edge.
") SetEdge1;
		void SetEdge1(const TopoDS_Edge & theEdge);

		/****** IntTools_EdgeEdge::SetEdge1 ******/
		/****** md5 signature: 8a8c45ff8cf8fef31a0cff22252d974d ******/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
aT1: float
aT2: float

Return
-------
None

Description
-----------
Sets the first edge and its range.
") SetEdge1;
		void SetEdge1(const TopoDS_Edge & theEdge, const Standard_Real aT1, const Standard_Real aT2);

		/****** IntTools_EdgeEdge::SetEdge2 ******/
		/****** md5 signature: d035a1056357fbcc58da99d53f25508d ******/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Sets the second edge.
") SetEdge2;
		void SetEdge2(const TopoDS_Edge & theEdge);

		/****** IntTools_EdgeEdge::SetEdge2 ******/
		/****** md5 signature: 965a565189573aaa4fb5001e8b5d25c6 ******/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
aT1: float
aT2: float

Return
-------
None

Description
-----------
Sets the first edge and its range.
") SetEdge2;
		void SetEdge2(const TopoDS_Edge & theEdge, const Standard_Real aT1, const Standard_Real aT2);

		/****** IntTools_EdgeEdge::SetFuzzyValue ******/
		/****** md5 signature: a6e52c994eeddfce238b90491de5f35c ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: float

Return
-------
None

Description
-----------
Sets the Fuzzy value.
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****** IntTools_EdgeEdge::SetRange1 ******/
		/****** md5 signature: bb41bc42e46d2436a40c8d973157bb65 ******/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "
Parameters
----------
theRange1: IntTools_Range

Return
-------
None

Description
-----------
Sets the range for the first edge.
") SetRange1;
		void SetRange1(const IntTools_Range & theRange1);

		/****** IntTools_EdgeEdge::SetRange1 ******/
		/****** md5 signature: 63f455ae2a073f05bf87ce70fddb7730 ******/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "
Parameters
----------
aT1: float
aT2: float

Return
-------
None

Description
-----------
Sets the range for the first edge.
") SetRange1;
		void SetRange1(const Standard_Real aT1, const Standard_Real aT2);

		/****** IntTools_EdgeEdge::SetRange2 ******/
		/****** md5 signature: e1e1c703a47bde8600bea5eeaaf0ba9f ******/
		%feature("compactdefaultargs") SetRange2;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_Range

Return
-------
None

Description
-----------
Sets the range for the second edge.
") SetRange2;
		void SetRange2(const IntTools_Range & theRange);

		/****** IntTools_EdgeEdge::SetRange2 ******/
		/****** md5 signature: 6a7c748b7970e48d68dfede3398ce2ad ******/
		%feature("compactdefaultargs") SetRange2;
		%feature("autodoc", "
Parameters
----------
aT1: float
aT2: float

Return
-------
None

Description
-----------
Sets the range for the second edge.
") SetRange2;
		void SetRange2(const Standard_Real aT1, const Standard_Real aT2);

		/****** IntTools_EdgeEdge::UseQuickCoincidenceCheck ******/
		/****** md5 signature: 5de7595b312e0b345a56002567eeaeb1 ******/
		%feature("compactdefaultargs") UseQuickCoincidenceCheck;
		%feature("autodoc", "
Parameters
----------
bFlag: bool

Return
-------
None

Description
-----------
Sets the flag myQuickCoincidenceCheck.
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
		/****** IntTools_EdgeFace::IntTools_EdgeFace ******/
		/****** md5 signature: ac76d8fd37641cf3850f9d0e1fa7cf07 ******/
		%feature("compactdefaultargs") IntTools_EdgeFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntTools_EdgeFace;
		 IntTools_EdgeFace();

		/****** IntTools_EdgeFace::CommonParts ******/
		/****** md5 signature: b79ce635c2dbbad1683c1b56a034e14b ******/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Return
-------
IntTools_SequenceOfCommonPrts

Description
-----------
Returns resulting common parts.
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts();

		/****** IntTools_EdgeFace::Context ******/
		/****** md5 signature: 298a8dbfee117eca77851222c773740a ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<IntTools_Context>

Description
-----------
Returns the intersection context.
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****** IntTools_EdgeFace::Edge ******/
		/****** md5 signature: 657c12d9769667081fd960b688690cc0 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the edge.
") Edge;
		const TopoDS_Edge Edge();

		/****** IntTools_EdgeFace::ErrorStatus ******/
		/****** md5 signature: 23ccaf4f25108c0b871675cdf964cbf6 ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the code of completion: 0 - means successful completion; 1 - the process was not started; 2,3 - invalid source data for the algorithm; 4 - projection failed.
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****** IntTools_EdgeFace::Face ******/
		/****** md5 signature: 95406b8d0d556c0537e0768c48713f21 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the face.
") Face;
		const TopoDS_Face Face();

		/****** IntTools_EdgeFace::FuzzyValue ******/
		/****** md5 signature: c7081d612ee5325e18733e215807d19f ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Fuzzy value.
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****** IntTools_EdgeFace::IsCoincidenceCheckedQuickly ******/
		/****** md5 signature: 2e1263cf549e045820bc46ffe90d3253 ******/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag myQuickCoincidenceCheck.
") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly();

		/****** IntTools_EdgeFace::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if computation was successful. Otherwise returns False.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntTools_EdgeFace::MinimalDistance ******/
		/****** md5 signature: 47310ba90ae5863695bce35b764f5f23 ******/
		%feature("compactdefaultargs") MinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal distance found between edge and face.
") MinimalDistance;
		Standard_Real MinimalDistance();

		/****** IntTools_EdgeFace::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Launches the process.
") Perform;
		void Perform();

		/****** IntTools_EdgeFace::Range ******/
		/****** md5 signature: 1c00b6a66baae86f89ee003b9c965318 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Return
-------
IntTools_Range

Description
-----------
Returns intersection range of the edge.
") Range;
		const IntTools_Range & Range();

		/****** IntTools_EdgeFace::SetContext ******/
		/****** md5 signature: 45a35eea8f4e3016f544e19c60ac3b92 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theContext: IntTools_Context

Return
-------
None

Description
-----------
Sets the intersection context.
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****** IntTools_EdgeFace::SetEdge ******/
		/****** md5 signature: 6f2fdc35f76ff0b75031b7bba2264008 ******/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Sets the edge for intersection.
") SetEdge;
		void SetEdge(const TopoDS_Edge & theEdge);

		/****** IntTools_EdgeFace::SetFace ******/
		/****** md5 signature: 9ec2310ee9bc7ec9517d4be701570074 ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Sets the face for intersection.
") SetFace;
		void SetFace(const TopoDS_Face & theFace);

		/****** IntTools_EdgeFace::SetFuzzyValue ******/
		/****** md5 signature: 1ec359b4264167db67f0bb6c774993d9 ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: float

Return
-------
None

Description
-----------
Sets the Fuzzy value.
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****** IntTools_EdgeFace::SetRange ******/
		/****** md5 signature: cac66bc6039d9794014f338069dd5d2f ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_Range

Return
-------
None

Description
-----------
Sets the boundaries for the edge. The algorithm processes edge inside these boundaries.
") SetRange;
		void SetRange(const IntTools_Range & theRange);

		/****** IntTools_EdgeFace::SetRange ******/
		/****** md5 signature: f3f7b3d5c973131ef8d69afe846c0288 ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
theFirst: float
theLast: float

Return
-------
None

Description
-----------
Sets the boundaries for the edge. The algorithm processes edge inside these boundaries.
") SetRange;
		void SetRange(const Standard_Real theFirst, const Standard_Real theLast);

		/****** IntTools_EdgeFace::UseQuickCoincidenceCheck ******/
		/****** md5 signature: 380eb1480dddecea984b19d084e9685a ******/
		%feature("compactdefaultargs") UseQuickCoincidenceCheck;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Sets the flag for quick coincidence check. It is safe to use the quick check for coincidence only if both of the following conditions are met: - The vertices of edge are lying on the face; - The edge does not intersect the boundaries of the face on the given range.
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
		/****** IntTools_FClass2d::IntTools_FClass2d ******/
		/****** md5 signature: 71448dbf418cca7a680d55a7c57f945e ******/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_FClass2d;
		 IntTools_FClass2d();

		/****** IntTools_FClass2d::IntTools_FClass2d ******/
		/****** md5 signature: 2ff64ae474e59221d0e35fcbe73d6a83 ******/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol: float

Return
-------
None

Description
-----------
Initializes algorithm by the face F and tolerance Tol.
") IntTools_FClass2d;
		 IntTools_FClass2d(const TopoDS_Face & F, const Standard_Real Tol);

		/****** IntTools_FClass2d::Init ******/
		/****** md5 signature: 9fa3174f39f493855c5fe31d2b5b64fc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol: float

Return
-------
None

Description
-----------
Initializes algorithm by the face F and tolerance Tol.
") Init;
		void Init(const TopoDS_Face & F, const Standard_Real Tol);

		/****** IntTools_FClass2d::IsHole ******/
		/****** md5 signature: b5f4b5210b3b0507eda73b3be749bc8d ******/
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsHole;
		Standard_Boolean IsHole();

		/****** IntTools_FClass2d::Perform ******/
		/****** md5 signature: 403774510e6e0c4bd249a27908ad88fd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Puv: gp_Pnt2d
RecadreOnPeriodic: bool (optional, default to Standard_True)

Return
-------
TopAbs_State

Description
-----------
Returns state of the 2d point Puv. If RecadreOnPeriodic is true (default value), for the periodic surface 2d point, adjusted to period, is classified.
") Perform;
		TopAbs_State Perform(const gp_Pnt2d & Puv, const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****** IntTools_FClass2d::PerformInfinitePoint ******/
		/****** md5 signature: 372e31f938f00ae741d3664c08c086b5 ******/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns state of infinite 2d point relatively to (0, 0).
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint();

		/****** IntTools_FClass2d::TestOnRestriction ******/
		/****** md5 signature: 6c77262c5fd5c2462a11220de78e70e9 ******/
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "
Parameters
----------
Puv: gp_Pnt2d
Tol: float
RecadreOnPeriodic: bool (optional, default to Standard_True)

Return
-------
TopAbs_State

Description
-----------
Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use . see the code for more details).
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
		/****** IntTools_FaceFace::IntTools_FaceFace ******/
		/****** md5 signature: b1adf597b2fd293465ee783c22f7bd7a ******/
		%feature("compactdefaultargs") IntTools_FaceFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_FaceFace;
		 IntTools_FaceFace();

		/****** IntTools_FaceFace::Context ******/
		/****** md5 signature: 3ea460f8e5a9e1fe83439fe69bd1002e ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<IntTools_Context>

Description
-----------
Gets the intersection context.
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****** IntTools_FaceFace::Face1 ******/
		/****** md5 signature: ab2eca052beed46bd39ad31d28c4ee92 ******/
		%feature("compactdefaultargs") Face1;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns first of processed faces.
") Face1;
		const TopoDS_Face Face1();

		/****** IntTools_FaceFace::Face2 ******/
		/****** md5 signature: 4b53886e6b114a0c7d6d5bbf493d04f4 ******/
		%feature("compactdefaultargs") Face2;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns second of processed faces.
") Face2;
		const TopoDS_Face Face2();

		/****** IntTools_FaceFace::FuzzyValue ******/
		/****** md5 signature: be29fbc3587cce2740c43ae36346b88f ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Fuzzy value.
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****** IntTools_FaceFace::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntTools_FaceFace::Lines ******/
		/****** md5 signature: 63ca1b903d3f6250f96d4975cfd4a797 ******/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "Return
-------
IntTools_SequenceOfCurves

Description
-----------
Returns sequence of 3d curves as result of intersection.
") Lines;
		IntTools_SequenceOfCurves Lines();

		/****** IntTools_FaceFace::Perform ******/
		/****** md5 signature: fc787f09bbe9fa2375bf6639020db29c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
theToRunParallel: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Intersects underliing surfaces of F1 and F2 Use sum of tolerance of F1 and F2 as intersection criteria.
") Perform;
		void Perform(const TopoDS_Face & F1, const TopoDS_Face & F2, const Standard_Boolean theToRunParallel = Standard_False);

		/****** IntTools_FaceFace::Points ******/
		/****** md5 signature: 4c491afe08e7fca7a25cfca5246db6f2 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
IntTools_SequenceOfPntOn2Faces

Description
-----------
Returns sequence of 3d curves as result of intersection.
") Points;
		const IntTools_SequenceOfPntOn2Faces & Points();

		/****** IntTools_FaceFace::PrepareLines3D ******/
		/****** md5 signature: 9608103b9dced13800e46e92e7b50562 ******/
		%feature("compactdefaultargs") PrepareLines3D;
		%feature("autodoc", "
Parameters
----------
bToSplit: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Provides post-processing the result lines. 
Input parameter: bToSplit split the closed 3D-curves on parts when True,  remain untouched otherwise.
") PrepareLines3D;
		void PrepareLines3D(const Standard_Boolean bToSplit = Standard_True);

		/****** IntTools_FaceFace::SetContext ******/
		/****** md5 signature: ca18ce635d4700b2601132549e0efa1a ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
aContext: IntTools_Context

Return
-------
None

Description
-----------
Sets the intersection context.
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & aContext);

		/****** IntTools_FaceFace::SetFuzzyValue ******/
		/****** md5 signature: a6e52c994eeddfce238b90491de5f35c ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: float

Return
-------
None

Description
-----------
Sets the Fuzzy value.
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****** IntTools_FaceFace::SetList ******/
		/****** md5 signature: 7b3314b4041c0a608529322354aff67b ******/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "
Parameters
----------
ListOfPnts: IntSurf_ListOfPntOn2S

Return
-------
None

Description
-----------
No available documentation.
") SetList;
		void SetList(IntSurf_ListOfPntOn2S & ListOfPnts);

		/****** IntTools_FaceFace::SetParameters ******/
		/****** md5 signature: fb88c48e2809576decba34c028b1f91a ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
ApproxCurves: bool
ComputeCurveOnS1: bool
ComputeCurveOnS2: bool
ApproximationTolerance: float

Return
-------
None

Description
-----------
Modifier.
") SetParameters;
		void SetParameters(const Standard_Boolean ApproxCurves, const Standard_Boolean ComputeCurveOnS1, const Standard_Boolean ComputeCurveOnS2, const Standard_Real ApproximationTolerance);

		/****** IntTools_FaceFace::TangentFaces ******/
		/****** md5 signature: 1bd0aa400de87da796d429cdd88c31ea ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if faces are tangent.
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
		/****** IntTools_MarkedRangeSet::IntTools_MarkedRangeSet ******/
		/****** md5 signature: 2de81fd2aa2e1959e9370fe9d98a7775 ******/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet();

		/****** IntTools_MarkedRangeSet::IntTools_MarkedRangeSet ******/
		/****** md5 signature: 4500ab531466526ba62c7a3cf3175ae2 ******/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theInitFlag: int

Return
-------
None

Description
-----------
build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary.
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theInitFlag);

		/****** IntTools_MarkedRangeSet::IntTools_MarkedRangeSet ******/
		/****** md5 signature: 508a82e4699613c19a94c30b7427830c ******/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "
Parameters
----------
theSortedArray: TColStd_Array1OfReal
theInitFlag: int

Return
-------
None

Description
-----------
Build set of ranges based on the array of progressive sorted values //! Warning: The constructor do not check if the values of array are not sorted It should be checked before function invocation.
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet(const TColStd_Array1OfReal & theSortedArray, const Standard_Integer theInitFlag);

		/****** IntTools_MarkedRangeSet::Flag ******/
		/****** md5 signature: 5a633977422925ff5909997008039bcc ******/
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns flag of the range with index theIndex.
") Flag;
		Standard_Integer Flag(const Standard_Integer theIndex);

		/****** IntTools_MarkedRangeSet::GetIndex ******/
		/****** md5 signature: 19f111e88c6d1b4323855209356ac656 ******/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
int

Description
-----------
Returns index of range which contains theValue. If theValue do not belong any range returns 0.
") GetIndex;
		Standard_Integer GetIndex(const Standard_Real theValue);

		/****** IntTools_MarkedRangeSet::GetIndex ******/
		/****** md5 signature: 26ff8081726339df9334c1710af4dfc6 ******/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "
Parameters
----------
theValue: float
UseLower: bool

Return
-------
int

Description
-----------
Returns index of range which contains theValue If theValue do not belong any range returns 0. If UseLower is Standard_True then lower boundary of the range can be equal to theValue, otherwise upper boundary of the range can be equal to theValue.
") GetIndex;
		Standard_Integer GetIndex(const Standard_Real theValue, const Standard_Boolean UseLower);

		/****** IntTools_MarkedRangeSet::GetIndices ******/
		/****** md5 signature: 47656e5616d80ed5ba6856249a9fcd21 ******/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
TColStd_SequenceOfInteger

Description
-----------
No available documentation.
") GetIndices;
		const TColStd_SequenceOfInteger & GetIndices(const Standard_Real theValue);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: 147160f23e4f53045cc99bcee1449de1 ******/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theFlag: int

Return
-------
bool

Description
-----------
Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False.
") InsertRange;
		Standard_Boolean InsertRange(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theFlag);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: 2de36adb6ef89f9e45fd40c833288539 ******/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_Range
theFlag: int

Return
-------
bool

Description
-----------
Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False.
") InsertRange;
		Standard_Boolean InsertRange(const IntTools_Range & theRange, const Standard_Integer theFlag);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: b8fd2d3918a0cf59c612b32626527343 ******/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theFlag: int
theIndex: int

Return
-------
bool

Description
-----------
Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. The index theIndex is a position where the range will be inserted. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False.
") InsertRange;
		Standard_Boolean InsertRange(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theFlag, const Standard_Integer theIndex);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: 79a2f1d842051df9c1cbd66c9d95b899 ******/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_Range
theFlag: int
theIndex: int

Return
-------
bool

Description
-----------
Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. The index theIndex is a position where the range will be inserted. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False.
") InsertRange;
		Standard_Boolean InsertRange(const IntTools_Range & theRange, const Standard_Integer theFlag, const Standard_Integer theIndex);

		/****** IntTools_MarkedRangeSet::Length ******/
		/****** md5 signature: f2d149cffca76ec002490404b3e808e1 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of ranges.
") Length;
		Standard_Integer Length();

		/****** IntTools_MarkedRangeSet::Range ******/
		/****** md5 signature: fcf0a09254cfa5f779950e9b958dff55 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IntTools_Range

Description
-----------
Returns the range with index theIndex. the Index can be from 1 to Length().
") Range;
		IntTools_Range Range(const Standard_Integer theIndex);

		/****** IntTools_MarkedRangeSet::SetBoundaries ******/
		/****** md5 signature: cbbd15d1280518d84c73f96f152194ff ******/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: float
theLastBoundary: float
theInitFlag: int

Return
-------
None

Description
-----------
build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary.
") SetBoundaries;
		void SetBoundaries(const Standard_Real theFirstBoundary, const Standard_Real theLastBoundary, const Standard_Integer theInitFlag);

		/****** IntTools_MarkedRangeSet::SetFlag ******/
		/****** md5 signature: ddfe10428610541083a77392737cdd51 ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theFlag: int

Return
-------
None

Description
-----------
Set flag theFlag for range with index theIndex.
") SetFlag;
		void SetFlag(const Standard_Integer theIndex, const Standard_Integer theFlag);

		/****** IntTools_MarkedRangeSet::SetRanges ******/
		/****** md5 signature: c5c8955c67ec7778126857cdd282197b ******/
		%feature("compactdefaultargs") SetRanges;
		%feature("autodoc", "
Parameters
----------
theSortedArray: TColStd_Array1OfReal
theInitFlag: int

Return
-------
None

Description
-----------
Build set of ranges based on the array of progressive sorted values //! Warning: The function do not check if the values of array are not sorted It should be checked before function invocation.
") SetRanges;
		void SetRanges(const TColStd_Array1OfReal & theSortedArray, const Standard_Integer theInitFlag);

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
		/****** IntTools_PntOn2Faces::IntTools_PntOn2Faces ******/
		/****** md5 signature: 2dbfead125cca31bb1f4cf9fd76dec35 ******/
		%feature("compactdefaultargs") IntTools_PntOn2Faces;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces();

		/****** IntTools_PntOn2Faces::IntTools_PntOn2Faces ******/
		/****** md5 signature: afb2dbb31f2af1cbbfb06f9506775ae8 ******/
		%feature("compactdefaultargs") IntTools_PntOn2Faces;
		%feature("autodoc", "
Parameters
----------
aP1: IntTools_PntOnFace
aP2: IntTools_PntOnFace

Return
-------
None

Description
-----------
Initializes me by two points aP1 and aP2.
") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces(const IntTools_PntOnFace & aP1, const IntTools_PntOnFace & aP2);

		/****** IntTools_PntOn2Faces::IsValid ******/
		/****** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Selector.
") IsValid;
		Standard_Boolean IsValid();

		/****** IntTools_PntOn2Faces::P1 ******/
		/****** md5 signature: f057dd4658f8319bab9d06497b601c43 ******/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "Return
-------
IntTools_PntOnFace

Description
-----------
Selector.
") P1;
		const IntTools_PntOnFace & P1();

		/****** IntTools_PntOn2Faces::P2 ******/
		/****** md5 signature: d03b398a4a4515fff13f3bbb63105f04 ******/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "Return
-------
IntTools_PntOnFace

Description
-----------
Selector.
") P2;
		const IntTools_PntOnFace & P2();

		/****** IntTools_PntOn2Faces::SetP1 ******/
		/****** md5 signature: 18db88b6150151cd47132f94a6a27ca9 ******/
		%feature("compactdefaultargs") SetP1;
		%feature("autodoc", "
Parameters
----------
aP1: IntTools_PntOnFace

Return
-------
None

Description
-----------
Modifier.
") SetP1;
		void SetP1(const IntTools_PntOnFace & aP1);

		/****** IntTools_PntOn2Faces::SetP2 ******/
		/****** md5 signature: 7bf16fc967708fc83aabc008fa843a97 ******/
		%feature("compactdefaultargs") SetP2;
		%feature("autodoc", "
Parameters
----------
aP2: IntTools_PntOnFace

Return
-------
None

Description
-----------
Modifier.
") SetP2;
		void SetP2(const IntTools_PntOnFace & aP2);

		/****** IntTools_PntOn2Faces::SetValid ******/
		/****** md5 signature: 85144754cba02ed47a44352f79ae48b4 ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
bF: bool

Return
-------
None

Description
-----------
Modifier.
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
		/****** IntTools_PntOnFace::IntTools_PntOnFace ******/
		/****** md5 signature: 1c0e5bbf17215766ba82417ebcfe74f0 ******/
		%feature("compactdefaultargs") IntTools_PntOnFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_PntOnFace;
		 IntTools_PntOnFace();

		/****** IntTools_PntOnFace::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Selector.
") Face;
		const TopoDS_Face Face();

		/****** IntTools_PntOnFace::Init ******/
		/****** md5 signature: 58e5f3dd5eb5e4ad5ab1fd9f3909abf1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
aP: gp_Pnt
U: float
V: float

Return
-------
None

Description
-----------
Initializes me by aFace, a 3d point and it's UV parameters on face.
") Init;
		void Init(const TopoDS_Face & aF, const gp_Pnt & aP, const Standard_Real U, const Standard_Real V);

		/****** IntTools_PntOnFace::Parameters ******/
		/****** md5 signature: 24a2c71191423d4e30ed72f58cb5de87 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
Selector.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_PntOnFace::Pnt ******/
		/****** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Selector.
") Pnt;
		const gp_Pnt Pnt();

		/****** IntTools_PntOnFace::SetFace ******/
		/****** md5 signature: b689a8f4d5c8b24783cd7ff1ee539b06 ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face

Return
-------
None

Description
-----------
Modifier.
") SetFace;
		void SetFace(const TopoDS_Face & aF);

		/****** IntTools_PntOnFace::SetParameters ******/
		/****** md5 signature: 766228d61435cf9eaba866b58733ed73 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
None

Description
-----------
Modifier.
") SetParameters;
		void SetParameters(const Standard_Real U, const Standard_Real V);

		/****** IntTools_PntOnFace::SetPnt ******/
		/****** md5 signature: e7d87e72863cdb2f7fd541f048388bf8 ******/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "
Parameters
----------
aP: gp_Pnt

Return
-------
None

Description
-----------
Modifier.
") SetPnt;
		void SetPnt(const gp_Pnt & aP);

		/****** IntTools_PntOnFace::SetValid ******/
		/****** md5 signature: 85144754cba02ed47a44352f79ae48b4 ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
bF: bool

Return
-------
None

Description
-----------
Modifier.
") SetValid;
		void SetValid(const Standard_Boolean bF);

		/****** IntTools_PntOnFace::Valid ******/
		/****** md5 signature: 937ff4933c1c21f110867b68d8e68ce4 ******/
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Selector.
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
		/****** IntTools_Range::IntTools_Range ******/
		/****** md5 signature: e41c61afdd5ca0133ff554bb45f86cfe ******/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_Range;
		 IntTools_Range();

		/****** IntTools_Range::IntTools_Range ******/
		/****** md5 signature: 9c803d1ab38f8f55fe7a1646da7b942f ******/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "
Parameters
----------
aFirst: float
aLast: float

Return
-------
None

Description
-----------
Initialize me by range boundaries.
") IntTools_Range;
		 IntTools_Range(const Standard_Real aFirst, const Standard_Real aLast);

		/****** IntTools_Range::First ******/
		/****** md5 signature: 009dd98af15e46b2da286731f40e1839 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
float

Description
-----------
Selector.
") First;
		Standard_Real First();

		/****** IntTools_Range::Last ******/
		/****** md5 signature: 4c8063c237a4f73018a7949da8aef9fb ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
float

Description
-----------
Selector.
") Last;
		Standard_Real Last();

		/****** IntTools_Range::Range ******/
		/****** md5 signature: f69d6fade06795ea9184575ce38ac05f ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
aFirst: float
aLast: float

Description
-----------
Selector.
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Range::SetFirst ******/
		/****** md5 signature: ee35428bdecb415ec0e9224957286cfd ******/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "
Parameters
----------
aFirst: float

Return
-------
None

Description
-----------
Modifier.
") SetFirst;
		void SetFirst(const Standard_Real aFirst);

		/****** IntTools_Range::SetLast ******/
		/****** md5 signature: 5a37b268680286d7ec66485fc6a499f6 ******/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "
Parameters
----------
aLast: float

Return
-------
None

Description
-----------
Modifier.
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
		/****** IntTools_Root::IntTools_Root ******/
		/****** md5 signature: 17b1d91ee8fc43f1186accf3cd84cc0d ******/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_Root;
		 IntTools_Root();

		/****** IntTools_Root::IntTools_Root ******/
		/****** md5 signature: b959cc27cd34019eddf168fa6bb022cf ******/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "
Parameters
----------
aRoot: float
aType: int

Return
-------
None

Description
-----------
Initializes my by range of parameters and type of root.
") IntTools_Root;
		 IntTools_Root(const Standard_Real aRoot, const Standard_Integer aType);

		/****** IntTools_Root::Interval ******/
		/****** md5 signature: a31ff5dbe0f0228a00c50b508f91df69 ******/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "
Parameters
----------

Return
-------
t1: float
t2: float
f1: float
f2: float

Description
-----------
Returns the values of interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).
") Interval;
		void Interval(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Root::IsValid ******/
		/****** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the validity flag for the root, True if myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_IN or myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_ON or myStateBefore==TopAbs_ON && myStateAfter==TopAbs_OUT or myStateBefore==TopAbs_IN && myStateAfter==TopAbs_OUT . For other cases it returns False.
") IsValid;
		Standard_Boolean IsValid();

		/****** IntTools_Root::LayerHeight ******/
		/****** md5 signature: b68e4274e6a27174113c27cc38c0b399 ******/
		%feature("compactdefaultargs") LayerHeight;
		%feature("autodoc", "Return
-------
float

Description
-----------
Not used in Edge/Edge algorithm.
") LayerHeight;
		Standard_Real LayerHeight();

		/****** IntTools_Root::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Root value.
") Root;
		Standard_Real Root();

		/****** IntTools_Root::SetInterval ******/
		/****** md5 signature: 5db8941833681411c96383f7f525cd0b ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
t1: float
t2: float
f1: float
f2: float

Return
-------
None

Description
-----------
Sets the interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).
") SetInterval;
		void SetInterval(const Standard_Real t1, const Standard_Real t2, const Standard_Real f1, const Standard_Real f2);

		/****** IntTools_Root::SetLayerHeight ******/
		/****** md5 signature: 360921e799cf445e50e6e253a3330162 ******/
		%feature("compactdefaultargs") SetLayerHeight;
		%feature("autodoc", "
Parameters
----------
aHeight: float

Return
-------
None

Description
-----------
Not used in Edge/Edge algorithm.
") SetLayerHeight;
		void SetLayerHeight(const Standard_Real aHeight);

		/****** IntTools_Root::SetRoot ******/
		/****** md5 signature: 3e1ad94889d57c4dd5375b3307a5f5f7 ******/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "
Parameters
----------
aRoot: float

Return
-------
None

Description
-----------
Sets the Root's value.
") SetRoot;
		void SetRoot(const Standard_Real aRoot);

		/****** IntTools_Root::SetStateAfter ******/
		/****** md5 signature: ee9149c1422baa739405b40c2f9f26ec ******/
		%feature("compactdefaultargs") SetStateAfter;
		%feature("autodoc", "
Parameters
----------
aState: TopAbs_State

Return
-------
None

Description
-----------
Set the value of the state after the root (at t=Root-dt).
") SetStateAfter;
		void SetStateAfter(const TopAbs_State aState);

		/****** IntTools_Root::SetStateBefore ******/
		/****** md5 signature: e698a20e4fef1eee6e76052d9adf9c4e ******/
		%feature("compactdefaultargs") SetStateBefore;
		%feature("autodoc", "
Parameters
----------
aState: TopAbs_State

Return
-------
None

Description
-----------
Set the value of the state before the root (at t=Root-dt).
") SetStateBefore;
		void SetStateBefore(const TopAbs_State aState);

		/****** IntTools_Root::SetType ******/
		/****** md5 signature: b822c030059898c5c30ee0f0c5c0860f ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
aType: int

Return
-------
None

Description
-----------
Sets the Root's Type.
") SetType;
		void SetType(const Standard_Integer aType);

		/****** IntTools_Root::StateAfter ******/
		/****** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ******/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the state after the root.
") StateAfter;
		TopAbs_State StateAfter();

		/****** IntTools_Root::StateBefore ******/
		/****** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ******/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the state before the root.
") StateBefore;
		TopAbs_State StateBefore();

		/****** IntTools_Root::Type ******/
		/****** md5 signature: fadaf18b7481222141380b2bb22870ff ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the type of the root =0 - Simple (was found by bisection method); =2 - Smart when f1=0, f2!=0 or vice versa (was found by Fibbonacci method); =1 - Pure (pure zero for all t [t1,t2] );.
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
		/****** IntTools_ShrunkRange::IntTools_ShrunkRange ******/
		/****** md5 signature: fb902a78ac553b0c26886882f99dcf4b ******/
		%feature("compactdefaultargs") IntTools_ShrunkRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntTools_ShrunkRange;
		 IntTools_ShrunkRange();

		/****** IntTools_ShrunkRange::BndBox ******/
		/****** md5 signature: 9dc09300173f027acf300663c3825bb1 ******/
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") BndBox;
		const Bnd_Box & BndBox();

		/****** IntTools_ShrunkRange::Context ******/
		/****** md5 signature: 3ea460f8e5a9e1fe83439fe69bd1002e ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<IntTools_Context>

Description
-----------
No available documentation.
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****** IntTools_ShrunkRange::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****** IntTools_ShrunkRange::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True in case the shrunk range is computed.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntTools_ShrunkRange::IsSplittable ******/
		/****** md5 signature: 4b9dd74e2aa42018fe83fe5063aa511b ******/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False in case the shrunk range is too short and the edge cannot be split, otherwise returns True.
") IsSplittable;
		Standard_Boolean IsSplittable();

		/****** IntTools_ShrunkRange::Length ******/
		/****** md5 signature: 1d863a710d06afea5559458878200357 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the edge if computed.
") Length;
		Standard_Real Length();

		/****** IntTools_ShrunkRange::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** IntTools_ShrunkRange::SetContext ******/
		/****** md5 signature: f53c6fcf684a956c5bb75c3ef4778c58 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
aCtx: IntTools_Context

Return
-------
None

Description
-----------
No available documentation.
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & aCtx);

		/****** IntTools_ShrunkRange::SetData ******/
		/****** md5 signature: 145ffca467a99ee459c5808f83bfde01 ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aT1: float
aT2: float
aV1: TopoDS_Vertex
aV2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") SetData;
		void SetData(const TopoDS_Edge & aE, const Standard_Real aT1, const Standard_Real aT2, const TopoDS_Vertex & aV1, const TopoDS_Vertex & aV2);

		/****** IntTools_ShrunkRange::SetShrunkRange ******/
		/****** md5 signature: 67d5d9ae0e5a6a07df554656c52ff308 ******/
		%feature("compactdefaultargs") SetShrunkRange;
		%feature("autodoc", "
Parameters
----------
aT1: float
aT2: float

Return
-------
None

Description
-----------
No available documentation.
") SetShrunkRange;
		void SetShrunkRange(const Standard_Real aT1, const Standard_Real aT2);

		/****** IntTools_ShrunkRange::ShrunkRange ******/
		/****** md5 signature: 35baf6c03780024996387c9697b878db ******/
		%feature("compactdefaultargs") ShrunkRange;
		%feature("autodoc", "
Parameters
----------

Return
-------
aT1: float
aT2: float

Description
-----------
No available documentation.
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
		/****** IntTools_SurfaceRangeLocalizeData::IntTools_SurfaceRangeLocalizeData ******/
		/****** md5 signature: 181c969b7f7ccf70d15429ee3d0ddec0 ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData();

		/****** IntTools_SurfaceRangeLocalizeData::IntTools_SurfaceRangeLocalizeData ******/
		/****** md5 signature: e50c45554410b70cdf3dd0ce0d5f1c38 ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "
Parameters
----------
theNbSampleU: int
theNbSampleV: int
theMinRangeU: float
theMinRangeV: float

Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData(const Standard_Integer theNbSampleU, const Standard_Integer theNbSampleV, const Standard_Real theMinRangeU, const Standard_Real theMinRangeV);

		/****** IntTools_SurfaceRangeLocalizeData::IntTools_SurfaceRangeLocalizeData ******/
		/****** md5 signature: 1f979aa83f2fa69e6e52f02ff927f89b ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "
Parameters
----------
Other: IntTools_SurfaceRangeLocalizeData

Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData(const IntTools_SurfaceRangeLocalizeData & Other);

		/****** IntTools_SurfaceRangeLocalizeData::AddBox ******/
		/****** md5 signature: 36a4ee0ba3f5d25cfcb396af65848035 ******/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_SurfaceRangeSample
theBox: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddBox;
		void AddBox(const IntTools_SurfaceRangeSample & theRange, const Bnd_Box & theBox);

		/****** IntTools_SurfaceRangeLocalizeData::AddOutRange ******/
		/****** md5 signature: fc05412e16f8b608962e691276314a35 ******/
		%feature("compactdefaultargs") AddOutRange;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_SurfaceRangeSample

Return
-------
None

Description
-----------
No available documentation.
") AddOutRange;
		void AddOutRange(const IntTools_SurfaceRangeSample & theRange);

		/****** IntTools_SurfaceRangeLocalizeData::Assign ******/
		/****** md5 signature: 575be6410612719126135385b1cd425e ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
Other: IntTools_SurfaceRangeLocalizeData

Return
-------
IntTools_SurfaceRangeLocalizeData

Description
-----------
No available documentation.
") Assign;
		IntTools_SurfaceRangeLocalizeData & Assign(const IntTools_SurfaceRangeLocalizeData & Other);

		/****** IntTools_SurfaceRangeLocalizeData::ClearGrid ******/
		/****** md5 signature: e1cb2030c59bf4aaf51aadf8a8ccada4 ******/
		%feature("compactdefaultargs") ClearGrid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the grid of points.
") ClearGrid;
		void ClearGrid();

		/****** IntTools_SurfaceRangeLocalizeData::FindBox ******/
		/****** md5 signature: 023588dc4cb9abd025cc0596939d5783 ******/
		%feature("compactdefaultargs") FindBox;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_SurfaceRangeSample
theBox: Bnd_Box

Return
-------
bool

Description
-----------
No available documentation.
") FindBox;
		Standard_Boolean FindBox(const IntTools_SurfaceRangeSample & theRange, Bnd_Box & theBox);

		/****** IntTools_SurfaceRangeLocalizeData::GetGridDeflection ******/
		/****** md5 signature: 651ffb3f8257131de50ed9c5c36b2b3a ******/
		%feature("compactdefaultargs") GetGridDeflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Query the grid deflection.
") GetGridDeflection;
		Standard_Real GetGridDeflection();

		/****** IntTools_SurfaceRangeLocalizeData::GetGridPoint ******/
		/****** md5 signature: 7a9de1bb49672a1f2998131bff77fd7c ******/
		%feature("compactdefaultargs") GetGridPoint;
		%feature("autodoc", "
Parameters
----------
theUIndex: int
theVIndex: int

Return
-------
gp_Pnt

Description
-----------
Set the grid point.
") GetGridPoint;
		const gp_Pnt GetGridPoint(const Standard_Integer theUIndex, const Standard_Integer theVIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetMinRangeU ******/
		/****** md5 signature: ed1831687c3252e4ab7462e58541aad9 ******/
		%feature("compactdefaultargs") GetMinRangeU;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetMinRangeU;
		Standard_Real GetMinRangeU();

		/****** IntTools_SurfaceRangeLocalizeData::GetMinRangeV ******/
		/****** md5 signature: 741dea0f057ccfd53f8013d45f1e2e00 ******/
		%feature("compactdefaultargs") GetMinRangeV;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetMinRangeV;
		Standard_Real GetMinRangeV();

		/****** IntTools_SurfaceRangeLocalizeData::GetNBUPointsInFrame ******/
		/****** md5 signature: 21e45d90ea5d5c1d2bcbf5240f17f4d8 ******/
		%feature("compactdefaultargs") GetNBUPointsInFrame;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of grid points on U direction in frame.
") GetNBUPointsInFrame;
		Standard_Integer GetNBUPointsInFrame();

		/****** IntTools_SurfaceRangeLocalizeData::GetNBVPointsInFrame ******/
		/****** md5 signature: d30c8ef308d88876f4fa3c2d1c01738e ******/
		%feature("compactdefaultargs") GetNBVPointsInFrame;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of grid points on V direction in frame.
") GetNBVPointsInFrame;
		Standard_Integer GetNBVPointsInFrame();

		/****** IntTools_SurfaceRangeLocalizeData::GetNbSampleU ******/
		/****** md5 signature: a8ca4343c5fe1833f66c7f9bc7e3ee91 ******/
		%feature("compactdefaultargs") GetNbSampleU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetNbSampleU;
		Standard_Integer GetNbSampleU();

		/****** IntTools_SurfaceRangeLocalizeData::GetNbSampleV ******/
		/****** md5 signature: 6e376b56bc07ba30f1f403960624bddb ******/
		%feature("compactdefaultargs") GetNbSampleV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetNbSampleV;
		Standard_Integer GetNbSampleV();

		/****** IntTools_SurfaceRangeLocalizeData::GetPointInFrame ******/
		/****** md5 signature: 7c30fd123ce2ee2a0a49fc12a6d1c102 ******/
		%feature("compactdefaultargs") GetPointInFrame;
		%feature("autodoc", "
Parameters
----------
theUIndex: int
theVIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns the grid point in frame.
") GetPointInFrame;
		const gp_Pnt GetPointInFrame(const Standard_Integer theUIndex, const Standard_Integer theVIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetRangeUGrid ******/
		/****** md5 signature: 59c8708007b756d9b4de4f6f36d8e9cc ******/
		%feature("compactdefaultargs") GetRangeUGrid;
		%feature("autodoc", "Return
-------
int

Description
-----------
Query the range U of the grid of points.
") GetRangeUGrid;
		Standard_Integer GetRangeUGrid();

		/****** IntTools_SurfaceRangeLocalizeData::GetRangeVGrid ******/
		/****** md5 signature: 598ea256b66084f07b916a146e5a3863 ******/
		%feature("compactdefaultargs") GetRangeVGrid;
		%feature("autodoc", "Return
-------
int

Description
-----------
Query the range V of the grid of points.
") GetRangeVGrid;
		Standard_Integer GetRangeVGrid();

		/****** IntTools_SurfaceRangeLocalizeData::GetUParam ******/
		/****** md5 signature: d334fea47334c7b8b5145f289d532693 ******/
		%feature("compactdefaultargs") GetUParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Query the U parameter of the grid points at that index.
") GetUParam;
		Standard_Real GetUParam(const Standard_Integer theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetUParamInFrame ******/
		/****** md5 signature: 92eaa408ea28122033919dcbcb63d9e5 ******/
		%feature("compactdefaultargs") GetUParamInFrame;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Query the U parameter of the grid points at that index in frame.
") GetUParamInFrame;
		Standard_Real GetUParamInFrame(const Standard_Integer theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetVParam ******/
		/****** md5 signature: 522b7d820733a44e26c053b89a2ce495 ******/
		%feature("compactdefaultargs") GetVParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Query the V parameter of the grid points at that index.
") GetVParam;
		Standard_Real GetVParam(const Standard_Integer theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetVParamInFrame ******/
		/****** md5 signature: 96ffe45892410c71f1692de642b94cf6 ******/
		%feature("compactdefaultargs") GetVParamInFrame;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Query the V parameter of the grid points at that index in frame.
") GetVParamInFrame;
		Standard_Real GetVParamInFrame(const Standard_Integer theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::IsRangeOut ******/
		/****** md5 signature: 4171d39ff5e1e60b7c118de87554283e ******/
		%feature("compactdefaultargs") IsRangeOut;
		%feature("autodoc", "
Parameters
----------
theRange: IntTools_SurfaceRangeSample

Return
-------
bool

Description
-----------
No available documentation.
") IsRangeOut;
		Standard_Boolean IsRangeOut(const IntTools_SurfaceRangeSample & theRange);

		/****** IntTools_SurfaceRangeLocalizeData::ListRangeOut ******/
		/****** md5 signature: 7e891694efd307800817a73b6e661981 ******/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", "
Parameters
----------
theList: IntTools_ListOfSurfaceRangeSample

Return
-------
None

Description
-----------
No available documentation.
") ListRangeOut;
		void ListRangeOut(IntTools_ListOfSurfaceRangeSample & theList);

		/****** IntTools_SurfaceRangeLocalizeData::RemoveRangeOutAll ******/
		/****** md5 signature: 28428b3ed3ac18659d285cf9089ace1f ******/
		%feature("compactdefaultargs") RemoveRangeOutAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RemoveRangeOutAll;
		void RemoveRangeOutAll();

		/****** IntTools_SurfaceRangeLocalizeData::SetFrame ******/
		/****** md5 signature: 62f01763553d6c704667200d37d30284 ******/
		%feature("compactdefaultargs") SetFrame;
		%feature("autodoc", "
Parameters
----------
theUMin: float
theUMax: float
theVMin: float
theVMax: float

Return
-------
None

Description
-----------
Sets the frame area. Used to work with grid points.
") SetFrame;
		void SetFrame(const Standard_Real theUMin, const Standard_Real theUMax, const Standard_Real theVMin, const Standard_Real theVMax);

		/****** IntTools_SurfaceRangeLocalizeData::SetGridDeflection ******/
		/****** md5 signature: ad150e2f221695db1a8d64c83709443c ******/
		%feature("compactdefaultargs") SetGridDeflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: float

Return
-------
None

Description
-----------
Set the grid deflection.
") SetGridDeflection;
		void SetGridDeflection(const Standard_Real theDeflection);

		/****** IntTools_SurfaceRangeLocalizeData::SetGridPoint ******/
		/****** md5 signature: 8e372cce2d0d9bfc06fb6def7d31de46 ******/
		%feature("compactdefaultargs") SetGridPoint;
		%feature("autodoc", "
Parameters
----------
theUIndex: int
theVIndex: int
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Set the grid point.
") SetGridPoint;
		void SetGridPoint(const Standard_Integer theUIndex, const Standard_Integer theVIndex, const gp_Pnt & thePoint);

		/****** IntTools_SurfaceRangeLocalizeData::SetRangeUGrid ******/
		/****** md5 signature: 95df3cf834523d9177b370c524ea192f ******/
		%feature("compactdefaultargs") SetRangeUGrid;
		%feature("autodoc", "
Parameters
----------
theNbUGrid: int

Return
-------
None

Description
-----------
Set the range U of the grid of points.
") SetRangeUGrid;
		void SetRangeUGrid(const Standard_Integer theNbUGrid);

		/****** IntTools_SurfaceRangeLocalizeData::SetRangeVGrid ******/
		/****** md5 signature: f28a03e8ce81925252a1b0612f7804a7 ******/
		%feature("compactdefaultargs") SetRangeVGrid;
		%feature("autodoc", "
Parameters
----------
theNbVGrid: int

Return
-------
None

Description
-----------
Set the range V of the grid of points.
") SetRangeVGrid;
		void SetRangeVGrid(const Standard_Integer theNbVGrid);

		/****** IntTools_SurfaceRangeLocalizeData::SetUParam ******/
		/****** md5 signature: f67b7ed49aa6c5b3b6b2f4283362aba8 ******/
		%feature("compactdefaultargs") SetUParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theUParam: float

Return
-------
None

Description
-----------
Set the U parameter of the grid points at that index.
") SetUParam;
		void SetUParam(const Standard_Integer theIndex, const Standard_Real theUParam);

		/****** IntTools_SurfaceRangeLocalizeData::SetVParam ******/
		/****** md5 signature: 0aead173989e738d49f578f497a73972 ******/
		%feature("compactdefaultargs") SetVParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVParam: float

Return
-------
None

Description
-----------
Set the V parameter of the grid points at that index.
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
		/****** IntTools_SurfaceRangeSample::IntTools_SurfaceRangeSample ******/
		/****** md5 signature: 36554645d304d412b4acfaf570fc44fe ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample();

		/****** IntTools_SurfaceRangeSample::IntTools_SurfaceRangeSample ******/
		/****** md5 signature: 21ff6db05e69e0f7dd8d31a6a5c2f4a7 ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "
Parameters
----------
theIndexU: int
theDepthU: int
theIndexV: int
theDepthV: int

Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample(const Standard_Integer theIndexU, const Standard_Integer theDepthU, const Standard_Integer theIndexV, const Standard_Integer theDepthV);

		/****** IntTools_SurfaceRangeSample::IntTools_SurfaceRangeSample ******/
		/****** md5 signature: 9031a81e342f54de215dbbae20c7aaa1 ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "
Parameters
----------
theRangeU: IntTools_CurveRangeSample
theRangeV: IntTools_CurveRangeSample

Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample(const IntTools_CurveRangeSample & theRangeU, const IntTools_CurveRangeSample & theRangeV);

		/****** IntTools_SurfaceRangeSample::IntTools_SurfaceRangeSample ******/
		/****** md5 signature: fadc9424e42fab0d43b28577872b45e4 ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", "
Parameters
----------
Other: IntTools_SurfaceRangeSample

Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample(const IntTools_SurfaceRangeSample & Other);

		/****** IntTools_SurfaceRangeSample::Assign ******/
		/****** md5 signature: 4e0bcda96fd80097916b7a4e25b36492 ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
Other: IntTools_SurfaceRangeSample

Return
-------
IntTools_SurfaceRangeSample

Description
-----------
No available documentation.
") Assign;
		IntTools_SurfaceRangeSample & Assign(const IntTools_SurfaceRangeSample & Other);

		/****** IntTools_SurfaceRangeSample::GetDepthU ******/
		/****** md5 signature: 20a9fd80f0760f5e378e58f3b3487469 ******/
		%feature("compactdefaultargs") GetDepthU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetDepthU;
		Standard_Integer GetDepthU();

		/****** IntTools_SurfaceRangeSample::GetDepthV ******/
		/****** md5 signature: 38cbf0f4b918cec1d587d3332f387fec ******/
		%feature("compactdefaultargs") GetDepthV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetDepthV;
		Standard_Integer GetDepthV();

		/****** IntTools_SurfaceRangeSample::GetDepths ******/
		/****** md5 signature: 844bc266209967a29ad8670af126cf63 ******/
		%feature("compactdefaultargs") GetDepths;
		%feature("autodoc", "
Parameters
----------

Return
-------
theDepthU: int
theDepthV: int

Description
-----------
No available documentation.
") GetDepths;
		void GetDepths(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntTools_SurfaceRangeSample::GetIndexU ******/
		/****** md5 signature: 6c546506ed977d446dadd78e60b74b9e ******/
		%feature("compactdefaultargs") GetIndexU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetIndexU;
		Standard_Integer GetIndexU();

		/****** IntTools_SurfaceRangeSample::GetIndexV ******/
		/****** md5 signature: b898bf54d7f9baa019e5f8d7ef19b8ec ******/
		%feature("compactdefaultargs") GetIndexV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetIndexV;
		Standard_Integer GetIndexV();

		/****** IntTools_SurfaceRangeSample::GetIndexes ******/
		/****** md5 signature: 4345854f43a8a3b26eb6fc28e64befe6 ******/
		%feature("compactdefaultargs") GetIndexes;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndexU: int
theIndexV: int

Description
-----------
No available documentation.
") GetIndexes;
		void GetIndexes(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntTools_SurfaceRangeSample::GetRangeIndexUDeeper ******/
		/****** md5 signature: 72f3092305de05434db2f1c58933af8f ******/
		%feature("compactdefaultargs") GetRangeIndexUDeeper;
		%feature("autodoc", "
Parameters
----------
theNbSampleU: int

Return
-------
int

Description
-----------
No available documentation.
") GetRangeIndexUDeeper;
		Standard_Integer GetRangeIndexUDeeper(const Standard_Integer theNbSampleU);

		/****** IntTools_SurfaceRangeSample::GetRangeIndexVDeeper ******/
		/****** md5 signature: 5b303d66cc6eb2c7d3e1b51dca13d071 ******/
		%feature("compactdefaultargs") GetRangeIndexVDeeper;
		%feature("autodoc", "
Parameters
----------
theNbSampleV: int

Return
-------
int

Description
-----------
No available documentation.
") GetRangeIndexVDeeper;
		Standard_Integer GetRangeIndexVDeeper(const Standard_Integer theNbSampleV);

		/****** IntTools_SurfaceRangeSample::GetRangeU ******/
		/****** md5 signature: 41b0a68ddb0905f10341d96685362caf ******/
		%feature("compactdefaultargs") GetRangeU;
		%feature("autodoc", "
Parameters
----------
theFirstU: float
theLastU: float
theNbSampleU: int

Return
-------
IntTools_Range

Description
-----------
No available documentation.
") GetRangeU;
		IntTools_Range GetRangeU(const Standard_Real theFirstU, const Standard_Real theLastU, const Standard_Integer theNbSampleU);

		/****** IntTools_SurfaceRangeSample::GetRangeV ******/
		/****** md5 signature: 9be3dca4afa7b109fe244f818ad4d722 ******/
		%feature("compactdefaultargs") GetRangeV;
		%feature("autodoc", "
Parameters
----------
theFirstV: float
theLastV: float
theNbSampleV: int

Return
-------
IntTools_Range

Description
-----------
No available documentation.
") GetRangeV;
		IntTools_Range GetRangeV(const Standard_Real theFirstV, const Standard_Real theLastV, const Standard_Integer theNbSampleV);

		/****** IntTools_SurfaceRangeSample::GetRanges ******/
		/****** md5 signature: b22b6f78ee7cde851a90c8d7f85fe396 ******/
		%feature("compactdefaultargs") GetRanges;
		%feature("autodoc", "
Parameters
----------
theRangeU: IntTools_CurveRangeSample
theRangeV: IntTools_CurveRangeSample

Return
-------
None

Description
-----------
No available documentation.
") GetRanges;
		void GetRanges(IntTools_CurveRangeSample & theRangeU, IntTools_CurveRangeSample & theRangeV);

		/****** IntTools_SurfaceRangeSample::GetSampleRangeU ******/
		/****** md5 signature: c8d49108f18324a413f503160a965248 ******/
		%feature("compactdefaultargs") GetSampleRangeU;
		%feature("autodoc", "Return
-------
IntTools_CurveRangeSample

Description
-----------
No available documentation.
") GetSampleRangeU;
		IntTools_CurveRangeSample GetSampleRangeU();

		/****** IntTools_SurfaceRangeSample::GetSampleRangeV ******/
		/****** md5 signature: 964dc9ccf4277374195c5fbb755fb5fe ******/
		%feature("compactdefaultargs") GetSampleRangeV;
		%feature("autodoc", "Return
-------
IntTools_CurveRangeSample

Description
-----------
No available documentation.
") GetSampleRangeV;
		IntTools_CurveRangeSample GetSampleRangeV();

		/****** IntTools_SurfaceRangeSample::IsEqual ******/
		/****** md5 signature: 080f0097ea4e0085b67175107f1752fc ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
Other: IntTools_SurfaceRangeSample

Return
-------
bool

Description
-----------
No available documentation.
") IsEqual;
		Standard_Boolean IsEqual(const IntTools_SurfaceRangeSample & Other);

		/****** IntTools_SurfaceRangeSample::SetDepthU ******/
		/****** md5 signature: d8a4079bd407e8288e6043ce7cf17488 ******/
		%feature("compactdefaultargs") SetDepthU;
		%feature("autodoc", "
Parameters
----------
theDepthU: int

Return
-------
None

Description
-----------
No available documentation.
") SetDepthU;
		void SetDepthU(const Standard_Integer theDepthU);

		/****** IntTools_SurfaceRangeSample::SetDepthV ******/
		/****** md5 signature: 8709b38d8e87682864a6f12b945ed365 ******/
		%feature("compactdefaultargs") SetDepthV;
		%feature("autodoc", "
Parameters
----------
theDepthV: int

Return
-------
None

Description
-----------
No available documentation.
") SetDepthV;
		void SetDepthV(const Standard_Integer theDepthV);

		/****** IntTools_SurfaceRangeSample::SetIndexU ******/
		/****** md5 signature: 5422f55f0687626c3da85047f838ac09 ******/
		%feature("compactdefaultargs") SetIndexU;
		%feature("autodoc", "
Parameters
----------
theIndexU: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndexU;
		void SetIndexU(const Standard_Integer theIndexU);

		/****** IntTools_SurfaceRangeSample::SetIndexV ******/
		/****** md5 signature: 20242e42e3223d4ed1d2a8c1db6746d6 ******/
		%feature("compactdefaultargs") SetIndexV;
		%feature("autodoc", "
Parameters
----------
theIndexV: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndexV;
		void SetIndexV(const Standard_Integer theIndexV);

		/****** IntTools_SurfaceRangeSample::SetIndexes ******/
		/****** md5 signature: 025553a666d9b1a883bcaca1c542339a ******/
		%feature("compactdefaultargs") SetIndexes;
		%feature("autodoc", "
Parameters
----------
theIndexU: int
theIndexV: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndexes;
		void SetIndexes(const Standard_Integer theIndexU, const Standard_Integer theIndexV);

		/****** IntTools_SurfaceRangeSample::SetRanges ******/
		/****** md5 signature: bff32a2faf670df061c3e451e4fcecd5 ******/
		%feature("compactdefaultargs") SetRanges;
		%feature("autodoc", "
Parameters
----------
theRangeU: IntTools_CurveRangeSample
theRangeV: IntTools_CurveRangeSample

Return
-------
None

Description
-----------
No available documentation.
") SetRanges;
		void SetRanges(const IntTools_CurveRangeSample & theRangeU, const IntTools_CurveRangeSample & theRangeV);

		/****** IntTools_SurfaceRangeSample::SetSampleRangeU ******/
		/****** md5 signature: 9f24c8e6d2094ab643971884e239967d ******/
		%feature("compactdefaultargs") SetSampleRangeU;
		%feature("autodoc", "
Parameters
----------
theRangeSampleU: IntTools_CurveRangeSample

Return
-------
None

Description
-----------
No available documentation.
") SetSampleRangeU;
		void SetSampleRangeU(const IntTools_CurveRangeSample & theRangeSampleU);

		/****** IntTools_SurfaceRangeSample::SetSampleRangeV ******/
		/****** md5 signature: 15674547bc26c4dcf058e0909269422d ******/
		%feature("compactdefaultargs") SetSampleRangeV;
		%feature("autodoc", "
Parameters
----------
theRangeSampleV: IntTools_CurveRangeSample

Return
-------
None

Description
-----------
No available documentation.
") SetSampleRangeV;
		void SetSampleRangeV(const IntTools_CurveRangeSample & theRangeSampleV);


%extend{
    bool __eq_wrapper__(const IntTools_SurfaceRangeSample other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend IntTools_SurfaceRangeSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntTools_Tools *
***********************/
class IntTools_Tools {
	public:
		/****** IntTools_Tools::CheckCurve ******/
		/****** md5 signature: 81c1b71f6c538dd0c56d64c159e8676d ******/
		%feature("compactdefaultargs") CheckCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: IntTools_Curve
theBox: Bnd_Box

Return
-------
bool

Description
-----------
Checks if the curve is not covered by the default tolerance (confusion). Builds bounding box for the curve and stores it into <theBox>.
") CheckCurve;
		static Standard_Boolean CheckCurve(const IntTools_Curve & theCurve, Bnd_Box & theBox);

		/****** IntTools_Tools::ClassifyPointByFace ******/
		/****** md5 signature: 15d02586fff2ce52edcffb1b31010e98 ******/
		%feature("compactdefaultargs") ClassifyPointByFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
P: gp_Pnt2d

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") ClassifyPointByFace;
		static TopAbs_State ClassifyPointByFace(const TopoDS_Face & aF, const gp_Pnt2d & P);

		/****** IntTools_Tools::ComputeIntRange ******/
		/****** md5 signature: 2b848ae9972fb59beee0caec542fcfd5 ******/
		%feature("compactdefaultargs") ComputeIntRange;
		%feature("autodoc", "
Parameters
----------
theTol1: float
theTol2: float
theAngle: float

Return
-------
float

Description
-----------
Computes the correct Intersection range for Line/Line, Line/Plane and Plane/Plane intersections.
") ComputeIntRange;
		static Standard_Real ComputeIntRange(const Standard_Real theTol1, const Standard_Real theTol2, const Standard_Real theAngle);

		/****** IntTools_Tools::ComputeTolerance ******/
		/****** md5 signature: 81df055defddfd139d552aebd1f5b38b ******/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "
Parameters
----------
theCurve3D: Geom_Curve
theCurve2D: Geom2d_Curve
theSurf: Geom_Surface
theFirst: float
theLast: float
theTolRange: float (optional, default to Precision::PConfusion())
theToRunParallel: bool (optional, default to Standard_False)

Return
-------
theMaxDist: float
theMaxPar: float

Description
-----------
Computes the max distance between points taken from 3D and 2D curves by the same parameter.
") ComputeTolerance;
		static Standard_Boolean ComputeTolerance(const opencascade::handle<Geom_Curve> & theCurve3D, const opencascade::handle<Geom2d_Curve> & theCurve2D, const opencascade::handle<Geom_Surface> & theSurf, const Standard_Real theFirst, const Standard_Real theLast, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real theTolRange = Precision::PConfusion(), const Standard_Boolean theToRunParallel = Standard_False);

		/****** IntTools_Tools::ComputeVV ******/
		/****** md5 signature: 2b5edabfa3d68f4b56b0751fa8f7f611 ******/
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
int

Description
-----------
Computes distance between vertex V1 and vertex V2, if the distance is less than sum of vertex tolerances returns zero, otherwise returns negative value.
") ComputeVV;
		static Standard_Integer ComputeVV(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** IntTools_Tools::CurveTolerance ******/
		/****** md5 signature: de65e79bc2a32325faa9c51067b72bce ******/
		%feature("compactdefaultargs") CurveTolerance;
		%feature("autodoc", "
Parameters
----------
aC: Geom_Curve
aTolBase: float

Return
-------
float

Description
-----------
Returns adaptive tolerance for given aTolBase if aC is trimmed curve and basis curve is parabola, otherwise returns value of aTolBase.
") CurveTolerance;
		static Standard_Real CurveTolerance(const opencascade::handle<Geom_Curve> & aC, const Standard_Real aTolBase);

		/****** IntTools_Tools::HasInternalEdge ******/
		/****** md5 signature: 599527b22eb0bb087b88f7ee1ec60887 ******/
		%feature("compactdefaultargs") HasInternalEdge;
		%feature("autodoc", "
Parameters
----------
aW: TopoDS_Wire

Return
-------
bool

Description
-----------
Returns True if wire aW contains edges with INTERNAL orientation.
") HasInternalEdge;
		static Standard_Boolean HasInternalEdge(const TopoDS_Wire & aW);

		/****** IntTools_Tools::IntermediatePoint ******/
		/****** md5 signature: 8663f92679b0dc5e2760d0cb00974303 ******/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "
Parameters
----------
aFirst: float
aLast: float

Return
-------
float

Description
-----------
Returns some value between aFirst and aLast.
") IntermediatePoint;
		static Standard_Real IntermediatePoint(const Standard_Real aFirst, const Standard_Real aLast);

		/****** IntTools_Tools::IsClosed ******/
		/****** md5 signature: d616ccafe9e5d900be2c210b58b3c4b3 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
aC: Geom_Curve

Return
-------
bool

Description
-----------
Returns True if aC is BoundedCurve from Geom and the distance between first point of the curve aC and last point is less than 1.e-12.
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Geom_Curve> & aC);

		/****** IntTools_Tools::IsDirsCoinside ******/
		/****** md5 signature: 5decb6946d416223e5b88e58f24beacb ******/
		%feature("compactdefaultargs") IsDirsCoinside;
		%feature("autodoc", "
Parameters
----------
D1: gp_Dir
D2: gp_Dir

Return
-------
bool

Description
-----------
Returns True if D1 and D2 coincide.
") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside(const gp_Dir & D1, const gp_Dir & D2);

		/****** IntTools_Tools::IsDirsCoinside ******/
		/****** md5 signature: dd7cc4ec22a39e710a7e84da1ec268a6 ******/
		%feature("compactdefaultargs") IsDirsCoinside;
		%feature("autodoc", "
Parameters
----------
D1: gp_Dir
D2: gp_Dir
aTol: float

Return
-------
bool

Description
-----------
Returns True if D1 and D2 coincide with given tolerance.
") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside(const gp_Dir & D1, const gp_Dir & D2, const Standard_Real aTol);

		/****** IntTools_Tools::IsInRange ******/
		/****** md5 signature: 1e32c11974401d3014dc54f91407f85d ******/
		%feature("compactdefaultargs") IsInRange;
		%feature("autodoc", "
Parameters
----------
theRRef: IntTools_Range
theR: IntTools_Range
theTol: float

Return
-------
bool

Description
-----------
Checks if the range <theR> interfere with the range <theRRef>.
") IsInRange;
		static Standard_Boolean IsInRange(const IntTools_Range & theRRef, const IntTools_Range & theR, const Standard_Real theTol);

		/****** IntTools_Tools::IsMiddlePointsEqual ******/
		/****** md5 signature: f386bc6e11da4c61e860043065213189 ******/
		%feature("compactdefaultargs") IsMiddlePointsEqual;
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
Gets boundary of parameters of E1 and E2. Computes 3d points on each corresponded to average parameters. Returns True if distance between computed points is less than sum of edge tolerance, otherwise returns False.
") IsMiddlePointsEqual;
		static Standard_Boolean IsMiddlePointsEqual(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** IntTools_Tools::IsOnPave ******/
		/****** md5 signature: 528780513280095656a4a6bf4ca88af3 ******/
		%feature("compactdefaultargs") IsOnPave;
		%feature("autodoc", "
Parameters
----------
theT: float
theRange: IntTools_Range
theTol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsOnPave;
		static Standard_Boolean IsOnPave(const Standard_Real theT, const IntTools_Range & theRange, const Standard_Real theTol);

		/****** IntTools_Tools::IsOnPave1 ******/
		/****** md5 signature: 4e210e7add3be3fc346ff30953ce57ec ******/
		%feature("compactdefaultargs") IsOnPave1;
		%feature("autodoc", "
Parameters
----------
theT: float
theRange: IntTools_Range
theTol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsOnPave1;
		static Standard_Boolean IsOnPave1(const Standard_Real theT, const IntTools_Range & theRange, const Standard_Real theTol);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: 3cf3602d9a764f11f4a5915022c5727c ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
t: float

Return
-------
bool

Description
-----------
Computes square distance between a point on the edge E corresponded to parameter t and vertices of edge E. Returns True if this distance is less than square tolerance of vertex, otherwise returns false.
") IsVertex;
		static Standard_Boolean IsVertex(const TopoDS_Edge & E, const Standard_Real t);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: 6916a00d7d86c20fd88332383c70c9c3 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
t: float

Return
-------
bool

Description
-----------
Returns True if square distance between vertex V and a point on the edge E corresponded to parameter t is less than square tolerance of V.
") IsVertex;
		static Standard_Boolean IsVertex(const TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real t);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: 7880bb60e450d0a23174ee9e40cf6897 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
aCmnPrt: IntTools_CommonPrt

Return
-------
bool

Description
-----------
Returns True if IsVertx for middle parameter of fist range and first edge returns True and if IsVertex for middle parameter of second range and second range returns True, otherwise returns False.
") IsVertex;
		static Standard_Boolean IsVertex(const IntTools_CommonPrt & aCmnPrt);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: 190862cc3492764794d377d819f0271b ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
aP: gp_Pnt
aTolPV: float
aV: TopoDS_Vertex

Return
-------
bool

Description
-----------
Returns True if the distance between point aP and vertex aV is less or equal to sum of aTolPV and vertex tolerance, otherwise returns False.
") IsVertex;
		static Standard_Boolean IsVertex(const gp_Pnt & aP, const Standard_Real aTolPV, const TopoDS_Vertex & aV);

		/****** IntTools_Tools::MakeFaceFromWireAndFace ******/
		/****** md5 signature: 5b755414e3334a00809a9a119642162b ******/
		%feature("compactdefaultargs") MakeFaceFromWireAndFace;
		%feature("autodoc", "
Parameters
----------
aW: TopoDS_Wire
aF: TopoDS_Face
aFNew: TopoDS_Face

Return
-------
None

Description
-----------
Build a face based on surface of given face aF and bounded by wire aW.
") MakeFaceFromWireAndFace;
		static void MakeFaceFromWireAndFace(const TopoDS_Wire & aW, const TopoDS_Face & aF, TopoDS_Face & aFNew);

		/****** IntTools_Tools::RejectLines ******/
		/****** md5 signature: 59c4a1828a04fc7a8c2e2299a762106d ******/
		%feature("compactdefaultargs") RejectLines;
		%feature("autodoc", "
Parameters
----------
aSIn: IntTools_SequenceOfCurves
aSOut: IntTools_SequenceOfCurves

Return
-------
None

Description
-----------
Puts curves from aSIn to aSOut except those curves that are coincide with first curve from aSIn.
") RejectLines;
		static void RejectLines(const IntTools_SequenceOfCurves & aSIn, IntTools_SequenceOfCurves & aSOut);

		/****** IntTools_Tools::SegPln ******/
		/****** md5 signature: 8501611b07c9e9b528bc9d65b9c7b062 ******/
		%feature("compactdefaultargs") SegPln;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
theTLin1: float
theTLin2: float
theTolLin: float
thePln: gp_Pln
theTolPln: float
theP: gp_Pnt

Return
-------
theT: float
theTolP: float
theTmin: float
theTmax: float

Description
-----------
No available documentation.
") SegPln;
		static Standard_Integer SegPln(const gp_Lin & theLin, const Standard_Real theTLin1, const Standard_Real theTLin2, const Standard_Real theTolLin, const gp_Pln & thePln, const Standard_Real theTolPln, gp_Pnt & theP, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Tools::SplitCurve ******/
		/****** md5 signature: 2c29a56daaa80b862224e90f08329dc6 ******/
		%feature("compactdefaultargs") SplitCurve;
		%feature("autodoc", "
Parameters
----------
aC: IntTools_Curve
aS: IntTools_SequenceOfCurves

Return
-------
int

Description
-----------
Split aC by average parameter if aC is closed in 3D. Returns positive value if splitting has been done, otherwise returns zero.
") SplitCurve;
		static Standard_Integer SplitCurve(const IntTools_Curve & aC, IntTools_SequenceOfCurves & aS);

		/****** IntTools_Tools::VertexParameter ******/
		/****** md5 signature: 93afc76cdd7125ff52ee1efa8473ba88 ******/
		%feature("compactdefaultargs") VertexParameter;
		%feature("autodoc", "
Parameters
----------
theCP: IntTools_CommonPrt

Return
-------
theT: float

Description
-----------
No available documentation.
") VertexParameter;
		static void VertexParameter(const IntTools_CommonPrt & theCP, Standard_Real &OutValue);

		/****** IntTools_Tools::VertexParameters ******/
		/****** md5 signature: 4808f7151517417a5f73a7bf9e74ffd3 ******/
		%feature("compactdefaultargs") VertexParameters;
		%feature("autodoc", "
Parameters
----------
theCP: IntTools_CommonPrt

Return
-------
theT1: float
theT2: float

Description
-----------
No available documentation.
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
		/****** IntTools_TopolTool::IntTools_TopolTool ******/
		/****** md5 signature: aecf076ba5efb59825cef958cc497444 ******/
		%feature("compactdefaultargs") IntTools_TopolTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntTools_TopolTool;
		 IntTools_TopolTool();

		/****** IntTools_TopolTool::IntTools_TopolTool ******/
		/****** md5 signature: 818340ed6ac86f3b5724d0b7304c646e ******/
		%feature("compactdefaultargs") IntTools_TopolTool;
		%feature("autodoc", "
Parameters
----------
theSurface: Adaptor3d_Surface

Return
-------
None

Description
-----------
Initializes me by surface.
") IntTools_TopolTool;
		 IntTools_TopolTool(const opencascade::handle<Adaptor3d_Surface> & theSurface);

		/****** IntTools_TopolTool::ComputeSamplePoints ******/
		/****** md5 signature: 940d159b31fac83590ed8721227cec02 ******/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ComputeSamplePoints;
		virtual void ComputeSamplePoints();

		/****** IntTools_TopolTool::Initialize ******/
		/****** md5 signature: c1406d3f37ede5ce5f7bca787b95af63 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redefined empty initializer //! Warning: Raises the exception NotImplemented.
") Initialize;
		virtual void Initialize();

		/****** IntTools_TopolTool::Initialize ******/
		/****** md5 signature: 2bf222342864de7b8471615bc05064e5 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theSurface: Adaptor3d_Surface

Return
-------
None

Description
-----------
Initializes me by surface.
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor3d_Surface> & theSurface);

		/****** IntTools_TopolTool::NbSamples ******/
		/****** md5 signature: cd99f1dfd0ef40a4d961f9638d39e555 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the sample-points for the intersections algorithms.
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****** IntTools_TopolTool::NbSamplesU ******/
		/****** md5 signature: 9402b5b7fe65eb10df77f3437e175357 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the sample-points for the intersections algorithms.
") NbSamplesU;
		virtual Standard_Integer NbSamplesU();

		/****** IntTools_TopolTool::NbSamplesV ******/
		/****** md5 signature: d6f9b32ddea97452b8d6f7035907d24a ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the sample-points for the intersections algorithms.
") NbSamplesV;
		virtual Standard_Integer NbSamplesV();

		/****** IntTools_TopolTool::SamplePnts ******/
		/****** md5 signature: a3961c7c25c5a055dad05c3f17c7d5a9 ******/
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "
Parameters
----------
theDefl: float
theNUmin: int
theNVmin: int

Return
-------
None

Description
-----------
compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces. For other surfaces algorithm is the same as in method ComputeSamplePoints(), but only fill arrays of U and V sample parameters; theDefl is a required deflection theNUmin, theNVmin are minimal nb points for U and V.
") SamplePnts;
		virtual void SamplePnts(const Standard_Real theDefl, const Standard_Integer theNUmin, const Standard_Integer theNVmin);

		/****** IntTools_TopolTool::SamplePoint ******/
		/****** md5 signature: bc5c941f9b59752a7a36373d9a170420 ******/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "
Parameters
----------
Index: int
P2d: gp_Pnt2d
P3d: gp_Pnt

Return
-------
None

Description
-----------
Returns a 2d point from surface myS and a corresponded 3d point for given index. The index should be from 1 to NbSamples().
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
		/****** IntTools_WLineTool::DecompositionOfWLine ******/
		/****** md5 signature: 5c7884447a7d22e6ab34f6cf1e1fb685 ******/
		%feature("compactdefaultargs") DecompositionOfWLine;
		%feature("autodoc", "
Parameters
----------
theWLine: IntPatch_WLine
theSurface1: GeomAdaptor_Surface
theSurface2: GeomAdaptor_Surface
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theLConstructor: GeomInt_LineConstructor
theAvoidLConstructor: bool
theTol: float
theNewLines: IntPatch_SequenceOfLine
&: IntTools_Context

Return
-------
bool

Description
-----------
No available documentation.
") DecompositionOfWLine;
		static Standard_Boolean DecompositionOfWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<GeomAdaptor_Surface> & theSurface1, const opencascade::handle<GeomAdaptor_Surface> & theSurface2, const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const GeomInt_LineConstructor & theLConstructor, const Standard_Boolean theAvoidLConstructor, const Standard_Real theTol, IntPatch_SequenceOfLine & theNewLines, const opencascade::handle<IntTools_Context > &);

		/****** IntTools_WLineTool::NotUseSurfacesForApprox ******/
		/****** md5 signature: eb83c267182a721a80afc576ebb61258 ******/
		%feature("compactdefaultargs") NotUseSurfacesForApprox;
		%feature("autodoc", "
Parameters
----------
aF1: TopoDS_Face
aF2: TopoDS_Face
WL: IntPatch_WLine
ifprm: int
ilprm: int

Return
-------
bool

Description
-----------
No available documentation.
") NotUseSurfacesForApprox;
		static Standard_Boolean NotUseSurfacesForApprox(const TopoDS_Face & aF1, const TopoDS_Face & aF2, const opencascade::handle<IntPatch_WLine> & WL, const Standard_Integer ifprm, const Standard_Integer ilprm);

};


%extend IntTools_WLineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class hash<IntTools_CurveRangeSample> *
****************************************/
/**********************************
* class IntTools_CurveRangeSample *
**********************************/
class IntTools_CurveRangeSample : public IntTools_BaseRangeSample {
	public:
		/****** IntTools_CurveRangeSample::IntTools_CurveRangeSample ******/
		/****** md5 signature: 76a0087adc5596d0e617ef24565b7dff ******/
		%feature("compactdefaultargs") IntTools_CurveRangeSample;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample();

		/****** IntTools_CurveRangeSample::IntTools_CurveRangeSample ******/
		/****** md5 signature: dbd85bca232b8f6decc3c23073331567 ******/
		%feature("compactdefaultargs") IntTools_CurveRangeSample;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
No available documentation.
") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample(const Standard_Integer theIndex);

		/****** IntTools_CurveRangeSample::GetRange ******/
		/****** md5 signature: 7ac23a49be79924087f52de600296943 ******/
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", "
Parameters
----------
theFirst: float
theLast: float
theNbSample: int

Return
-------
IntTools_Range

Description
-----------
No available documentation.
") GetRange;
		IntTools_Range GetRange(const Standard_Real theFirst, const Standard_Real theLast, const Standard_Integer theNbSample);

		/****** IntTools_CurveRangeSample::GetRangeIndex ******/
		/****** md5 signature: d7c896b92faa58172b48e4a3aace9c5d ******/
		%feature("compactdefaultargs") GetRangeIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetRangeIndex;
		Standard_Integer GetRangeIndex();

		/****** IntTools_CurveRangeSample::GetRangeIndexDeeper ******/
		/****** md5 signature: 2c6cf6516f0d753f98e1f1c5b208996f ******/
		%feature("compactdefaultargs") GetRangeIndexDeeper;
		%feature("autodoc", "
Parameters
----------
theNbSample: int

Return
-------
int

Description
-----------
No available documentation.
") GetRangeIndexDeeper;
		Standard_Integer GetRangeIndexDeeper(const Standard_Integer theNbSample);

		/****** IntTools_CurveRangeSample::IsEqual ******/
		/****** md5 signature: d04651fd45b57f48a9ead52d9839367a ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
Other: IntTools_CurveRangeSample

Return
-------
bool

Description
-----------
No available documentation.
") IsEqual;
		Standard_Boolean IsEqual(const IntTools_CurveRangeSample & Other);

		/****** IntTools_CurveRangeSample::SetRangeIndex ******/
		/****** md5 signature: d58a3cfeddc0c94332057980ef6d4fef ******/
		%feature("compactdefaultargs") SetRangeIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
No available documentation.
") SetRangeIndex;
		void SetRangeIndex(const Standard_Integer theIndex);


%extend{
    bool __eq_wrapper__(const IntTools_CurveRangeSample other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
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
/* class aliases */
%pythoncode {
IntTools_CArray1OfReal=OCC.Core.TColStd.TColStd_Array1OfReal
}
/* deprecated methods */
%pythoncode {
@deprecated
def inttools_FindRootStates(*args):
	return inttools.FindRootStates(*args)

@deprecated
def inttools_GetRadius(*args):
	return inttools.GetRadius(*args)

@deprecated
def inttools_Length(*args):
	return inttools.Length(*args)

@deprecated
def inttools_Parameter(*args):
	return inttools.Parameter(*args)

@deprecated
def inttools_PrepareArgs(*args):
	return inttools.PrepareArgs(*args)

@deprecated
def inttools_RemoveIdenticalRoots(*args):
	return inttools.RemoveIdenticalRoots(*args)

@deprecated
def inttools_SortRoots(*args):
	return inttools.SortRoots(*args)

@deprecated
def IntTools_Tools_CheckCurve(*args):
	return IntTools_Tools.CheckCurve(*args)

@deprecated
def IntTools_Tools_ClassifyPointByFace(*args):
	return IntTools_Tools.ClassifyPointByFace(*args)

@deprecated
def IntTools_Tools_ComputeIntRange(*args):
	return IntTools_Tools.ComputeIntRange(*args)

@deprecated
def IntTools_Tools_ComputeTolerance(*args):
	return IntTools_Tools.ComputeTolerance(*args)

@deprecated
def IntTools_Tools_ComputeVV(*args):
	return IntTools_Tools.ComputeVV(*args)

@deprecated
def IntTools_Tools_CurveTolerance(*args):
	return IntTools_Tools.CurveTolerance(*args)

@deprecated
def IntTools_Tools_HasInternalEdge(*args):
	return IntTools_Tools.HasInternalEdge(*args)

@deprecated
def IntTools_Tools_IntermediatePoint(*args):
	return IntTools_Tools.IntermediatePoint(*args)

@deprecated
def IntTools_Tools_IsClosed(*args):
	return IntTools_Tools.IsClosed(*args)

@deprecated
def IntTools_Tools_IsDirsCoinside(*args):
	return IntTools_Tools.IsDirsCoinside(*args)

@deprecated
def IntTools_Tools_IsDirsCoinside(*args):
	return IntTools_Tools.IsDirsCoinside(*args)

@deprecated
def IntTools_Tools_IsInRange(*args):
	return IntTools_Tools.IsInRange(*args)

@deprecated
def IntTools_Tools_IsMiddlePointsEqual(*args):
	return IntTools_Tools.IsMiddlePointsEqual(*args)

@deprecated
def IntTools_Tools_IsOnPave(*args):
	return IntTools_Tools.IsOnPave(*args)

@deprecated
def IntTools_Tools_IsOnPave1(*args):
	return IntTools_Tools.IsOnPave1(*args)

@deprecated
def IntTools_Tools_IsVertex(*args):
	return IntTools_Tools.IsVertex(*args)

@deprecated
def IntTools_Tools_IsVertex(*args):
	return IntTools_Tools.IsVertex(*args)

@deprecated
def IntTools_Tools_IsVertex(*args):
	return IntTools_Tools.IsVertex(*args)

@deprecated
def IntTools_Tools_IsVertex(*args):
	return IntTools_Tools.IsVertex(*args)

@deprecated
def IntTools_Tools_MakeFaceFromWireAndFace(*args):
	return IntTools_Tools.MakeFaceFromWireAndFace(*args)

@deprecated
def IntTools_Tools_RejectLines(*args):
	return IntTools_Tools.RejectLines(*args)

@deprecated
def IntTools_Tools_SegPln(*args):
	return IntTools_Tools.SegPln(*args)

@deprecated
def IntTools_Tools_SplitCurve(*args):
	return IntTools_Tools.SplitCurve(*args)

@deprecated
def IntTools_Tools_VertexParameter(*args):
	return IntTools_Tools.VertexParameter(*args)

@deprecated
def IntTools_Tools_VertexParameters(*args):
	return IntTools_Tools.VertexParameters(*args)

@deprecated
def IntTools_WLineTool_DecompositionOfWLine(*args):
	return IntTools_WLineTool.DecompositionOfWLine(*args)

@deprecated
def IntTools_WLineTool_NotUseSurfacesForApprox(*args):
	return IntTools_WLineTool.NotUseSurfacesForApprox(*args)

}
