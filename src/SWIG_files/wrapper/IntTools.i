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
%define INTTOOLSDOCSTRING
"IntTools module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_inttools.html"
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
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TColStd_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2dHatch_module.hxx>
#include<GeomAPI_module.hxx>
#include<BRepClass3d_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAbs_module.hxx>
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
%import TColStd.i
%import TopAbs.i
%import Bnd.i
%import Geom2dHatch.i
%import GeomAPI.i
%import BRepClass3d.i
%import Geom2d.i
%import GeomAbs.i
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

%ignore NCollection_DataMap<IntTools_CurveRangeSample,Bnd_Box>::Items;
%ignore NCollection_DataMap<IntTools_CurveRangeSample,Bnd_Box>::KeyValues;
%template(IntTools_DataMapOfCurveSampleBox) NCollection_DataMap<IntTools_CurveRangeSample,Bnd_Box>;
%ignore NCollection_DataMap<IntTools_SurfaceRangeSample,Bnd_Box>::Items;
%ignore NCollection_DataMap<IntTools_SurfaceRangeSample,Bnd_Box>::KeyValues;
%template(IntTools_DataMapOfSurfaceSampleBox) NCollection_DataMap<IntTools_SurfaceRangeSample,Bnd_Box>;
%template(IntTools_ListIteratorOfListOfBox) NCollection_TListIterator<Bnd_Box>;
%template(IntTools_ListIteratorOfListOfCurveRangeSample) NCollection_TListIterator<IntTools_CurveRangeSample>;
%template(IntTools_ListIteratorOfListOfSurfaceRangeSample) NCollection_TListIterator<IntTools_SurfaceRangeSample>;
%template(IntTools_ListOfBox) NCollection_List<Bnd_Box>;

%extend NCollection_List<Bnd_Box> {
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
        it = IntTools_ListIteratorOfListOfBox(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(IntTools_ListOfCurveRangeSample) NCollection_List<IntTools_CurveRangeSample>;

%extend NCollection_List<IntTools_CurveRangeSample> {
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
        it = IntTools_ListIteratorOfListOfCurveRangeSample(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(IntTools_ListOfSurfaceRangeSample) NCollection_List<IntTools_SurfaceRangeSample>;

%extend NCollection_List<IntTools_SurfaceRangeSample> {
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
        it = IntTools_ListIteratorOfListOfSurfaceRangeSample(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(IntTools_MapOfCurveSample) NCollection_Map<IntTools_CurveRangeSample>;
%template(IntTools_MapOfSurfaceSample) NCollection_Map<IntTools_SurfaceRangeSample>;
%template(IntTools_SequenceOfCommonPrts) NCollection_Sequence<IntTools_CommonPrt>;

%extend NCollection_Sequence<IntTools_CommonPrt> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfCurves) NCollection_Sequence<IntTools_Curve>;

%extend NCollection_Sequence<IntTools_Curve> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfPntOn2Faces) NCollection_Sequence<IntTools_PntOn2Faces>;

%extend NCollection_Sequence<IntTools_PntOn2Faces> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfRanges) NCollection_Sequence<IntTools_Range>;

%extend NCollection_Sequence<IntTools_Range> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntTools_SequenceOfRoots) NCollection_Sequence<IntTools_Root>;

%extend NCollection_Sequence<IntTools_Root> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<IntTools_Range> IntTools_Array1OfRange;
typedef NCollection_Array1<IntTools_Root> IntTools_Array1OfRoots;
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
		/****** md5 signature: 9d091022fadd28ef6627d566cf6197b8 ******/
		%feature("compactdefaultargs") FindRootStates;
		%feature("autodoc", "
Parameters
----------
aSeq: NCollection_Sequence<IntTools_Root>
anEpsNull: double

Return
-------
None

Description
-----------
Find the states (before and after) for each Root from the sequence aSeq.
") FindRootStates;
		static void FindRootStates(NCollection_Sequence<IntTools_Root> & aSeq, const double anEpsNull);

		/****** IntTools::GetRadius ******/
		/****** md5 signature: 318dee660d9e489248720bba7d020395 ******/
		%feature("compactdefaultargs") GetRadius;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
t1: double
t3: double

Return
-------
R: double

Description
-----------
No available documentation.
") GetRadius;
		static int GetRadius(const BRepAdaptor_Curve & C, const double t1, const double t3, Standard_Real &OutValue);

		/****** IntTools::Length ******/
		/****** md5 signature: 0add68e43fcb1a3e2381d71c5ac1a458 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
double

Description
-----------
returns the length of the edge;.
") Length;
		static double Length(const TopoDS_Edge & E);

		/****** IntTools::Parameter ******/
		/****** md5 signature: 357f318623f6ae555b7d7f58bd21f54a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve

Return
-------
aParm: double

Description
-----------
No available documentation.
") Parameter;
		static int Parameter(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, Standard_Real &OutValue);

		/****** IntTools::PrepareArgs ******/
		/****** md5 signature: 3f527e914d55a1d11a52dc04ab6834e9 ******/
		%feature("compactdefaultargs") PrepareArgs;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
tMax: double
tMin: double
Discret: int
Deflect: double
anArgs: TColStd_Array1OfReal

Return
-------
int

Description
-----------
No available documentation.
") PrepareArgs;
		static int PrepareArgs(BRepAdaptor_Curve & C, const double tMax, const double tMin, const int Discret, const double Deflect, TColStd_Array1OfReal & anArgs);

		/****** IntTools::RemoveIdenticalRoots ******/
		/****** md5 signature: 66298b2d36f515de5ebf77c070854eaa ******/
		%feature("compactdefaultargs") RemoveIdenticalRoots;
		%feature("autodoc", "
Parameters
----------
aSeq: NCollection_Sequence<IntTools_Root>
anEpsT: double

Return
-------
None

Description
-----------
Remove from the sequence aSeq the Roots that have values ti and tj such as |ti-tj] < anEpsT.
") RemoveIdenticalRoots;
		static void RemoveIdenticalRoots(NCollection_Sequence<IntTools_Root> & aSeq, const double anEpsT);

		/****** IntTools::SortRoots ******/
		/****** md5 signature: 140448865a71a2cd7240e594fa89fb21 ******/
		%feature("compactdefaultargs") SortRoots;
		%feature("autodoc", "
Parameters
----------
aSeq: NCollection_Sequence<IntTools_Root>
anEpsT: double

Return
-------
None

Description
-----------
Sort the sequence aSeq of the Roots to arrange the Roots in increasing order.
") SortRoots;
		static void SortRoots(NCollection_Sequence<IntTools_Root> & aSeq, const double anEpsT);

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
		/****** md5 signature: b004ab7b93fe5c337b7f1c7773c5857e ******/
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
		 IntTools_BaseRangeSample(const int theDepth);

		/****** IntTools_BaseRangeSample::GetDepth ******/
		/****** md5 signature: a07373e56c85e9dedc74718ba46fc31e ******/
		%feature("compactdefaultargs") GetDepth;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetDepth;
		int GetDepth();

		/****** IntTools_BaseRangeSample::SetDepth ******/
		/****** md5 signature: 84332f82ac5df2410b1027ec56e7ceb8 ******/
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
		void SetDepth(const int theDepth);

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
		/****** md5 signature: f7e0af282dc2520cac50a8b7d1779160 ******/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "
Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theBeanTolerance: double
theFaceTolerance: double

Return
-------
None

Description
-----------
Initializes the algorithm.
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const double theBeanTolerance, const double theFaceTolerance);

		/****** IntTools_BeanFaceIntersector::IntTools_BeanFaceIntersector ******/
		/****** md5 signature: 0301e75806d4e1e26e4102cd68f00817 ******/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "
Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theFirstParOnCurve: double
theLastParOnCurve: double
theUMinParameter: double
theUMaxParameter: double
theVMinParameter: double
theVMaxParameter: double
theBeanTolerance: double
theFaceTolerance: double

Return
-------
None

Description
-----------
Initializes the algorithm theUMinParameter, ... are used for optimization purposes.
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const double theFirstParOnCurve, const double theLastParOnCurve, const double theUMinParameter, const double theUMaxParameter, const double theVMinParameter, const double theVMaxParameter, const double theBeanTolerance, const double theFaceTolerance);

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
		/****** md5 signature: c94627cc9d5c623aa12438b2187e252f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theBeanTolerance: double
theFaceTolerance: double

Return
-------
None

Description
-----------
Initializes the algorithm.
") Init;
		void Init(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const double theBeanTolerance, const double theFaceTolerance);

		/****** IntTools_BeanFaceIntersector::Init ******/
		/****** md5 signature: 5e3b65844c919c55da8c607589d0510e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theCurve: BRepAdaptor_Curve
theSurface: BRepAdaptor_Surface
theFirstParOnCurve: double
theLastParOnCurve: double
theUMinParameter: double
theUMaxParameter: double
theVMinParameter: double
theVMaxParameter: double
theBeanTolerance: double
theFaceTolerance: double

Return
-------
None

Description
-----------
Initializes the algorithm theUMinParameter, ... are used for optimization purposes.
") Init;
		void Init(const BRepAdaptor_Curve & theCurve, const BRepAdaptor_Surface & theSurface, const double theFirstParOnCurve, const double theLastParOnCurve, const double theUMinParameter, const double theUMaxParameter, const double theVMinParameter, const double theVMaxParameter, const double theBeanTolerance, const double theFaceTolerance);

		/****** IntTools_BeanFaceIntersector::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Done/NotDone state of the algorithm.
") IsDone;
		bool IsDone();

		/****** IntTools_BeanFaceIntersector::MinimalSquareDistance ******/
		/****** md5 signature: aa36ceaaca38f8504c00b6a8e2dbda8c ******/
		%feature("compactdefaultargs") MinimalSquareDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal distance found between edge and face.
") MinimalSquareDistance;
		double MinimalSquareDistance();

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
		/****** md5 signature: ec7c049695c9dc7d8137cd30824b1627 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
NCollection_Sequence<IntTools_Range>

Description
-----------
No available documentation.
") Result;
		const NCollection_Sequence<IntTools_Range> & Result();

		/****** IntTools_BeanFaceIntersector::Result ******/
		/****** md5 signature: 3688c2fd60b27d4941b4dad921fb5f7d ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "
Parameters
----------
theResults: NCollection_Sequence<IntTools_Range>

Return
-------
None

Description
-----------
No available documentation.
") Result;
		void Result(NCollection_Sequence<IntTools_Range> & theResults);

		/****** IntTools_BeanFaceIntersector::SetBeanParameters ******/
		/****** md5 signature: 28a16f129c48d121ecb05189a953b280 ******/
		%feature("compactdefaultargs") SetBeanParameters;
		%feature("autodoc", "
Parameters
----------
theFirstParOnCurve: double
theLastParOnCurve: double

Return
-------
None

Description
-----------
Set restrictions for curve.
") SetBeanParameters;
		void SetBeanParameters(const double theFirstParOnCurve, const double theLastParOnCurve);

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
		/****** md5 signature: 7fb1491675314092a1ad323cf4d031e1 ******/
		%feature("compactdefaultargs") SetSurfaceParameters;
		%feature("autodoc", "
Parameters
----------
theUMinParameter: double
theUMaxParameter: double
theVMinParameter: double
theVMaxParameter: double

Return
-------
None

Description
-----------
Set restrictions for surface.
") SetSurfaceParameters;
		void SetSurfaceParameters(const double theUMinParameter, const double theUMaxParameter, const double theVMinParameter, const double theVMaxParameter);

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
		/****** md5 signature: 7d6979625be94f0f5e3ca5abb54a431e ******/
		%feature("compactdefaultargs") AllNullFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Modifier.
") AllNullFlag;
		bool AllNullFlag();

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
		/****** md5 signature: 4152ac1a685c3398f29cbc08c64f51fe ******/
		%feature("compactdefaultargs") AppendRange2;
		%feature("autodoc", "
Parameters
----------
tf: double
tl: double

Return
-------
None

Description
-----------
Appends the range of second edge.
") AppendRange2;
		void AppendRange2(const double tf, const double tl);

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
		/****** md5 signature: c6b989f58fe0fd326c5eb87f2c89ee97 ******/
		%feature("compactdefaultargs") ChangeRanges2;
		%feature("autodoc", "Return
-------
NCollection_Sequence<IntTools_Range>

Description
-----------
Returns the ranges of second edge.
") ChangeRanges2;
		NCollection_Sequence<IntTools_Range> & ChangeRanges2();

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
		/****** md5 signature: 86797ae506a27b7232e40c478bfe0de8 ******/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "
Parameters
----------

Return
-------
tf: double
tl: double

Description
-----------
Returns the range of first edge.
") Range1;
		void Range1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_CommonPrt::Ranges2 ******/
		/****** md5 signature: 512e59c4964c98da2a6e14763c6e192e ******/
		%feature("compactdefaultargs") Ranges2;
		%feature("autodoc", "Return
-------
NCollection_Sequence<IntTools_Range>

Description
-----------
Returns the ranges of second edge.
") Ranges2;
		const NCollection_Sequence<IntTools_Range> & Ranges2();

		/****** IntTools_CommonPrt::SetAllNullFlag ******/
		/****** md5 signature: 2ebaea4d2920c7af6e6c764c727e3c09 ******/
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
		void SetAllNullFlag(const bool aFlag);

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
		/****** md5 signature: 7451305ac4f89eb5694a5766bb74a3ca ******/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "
Parameters
----------
tf: double
tl: double

Return
-------
None

Description
-----------
Sets the range of first edge.
") SetRange1;
		void SetRange1(const double tf, const double tl);

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
		/****** md5 signature: fe063871627f0d3c19f50499c4588745 ******/
		%feature("compactdefaultargs") SetVertexParameter1;
		%feature("autodoc", "
Parameters
----------
tV: double

Return
-------
None

Description
-----------
Sets a parameter of first vertex.
") SetVertexParameter1;
		void SetVertexParameter1(const double tV);

		/****** IntTools_CommonPrt::SetVertexParameter2 ******/
		/****** md5 signature: 60e4900b4ec9228799c72b10074f02de ******/
		%feature("compactdefaultargs") SetVertexParameter2;
		%feature("autodoc", "
Parameters
----------
tV: double

Return
-------
None

Description
-----------
Sets a parameter of second vertex.
") SetVertexParameter2;
		void SetVertexParameter2(const double tV);

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
		/****** md5 signature: 07c3977f2359e94abd93f1a2ceb99d5f ******/
		%feature("compactdefaultargs") VertexParameter1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of first vertex.
") VertexParameter1;
		double VertexParameter1();

		/****** IntTools_CommonPrt::VertexParameter2 ******/
		/****** md5 signature: a0a6191c3547a608402666986cfcb104 ******/
		%feature("compactdefaultargs") VertexParameter2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of second vertex.
") VertexParameter2;
		double VertexParameter2();

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
		/****** md5 signature: 90b11100312740faf5fb909e15877d20 ******/
		%feature("compactdefaultargs") ComputePE;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theTolP: double
theE: TopoDS_Edge

Return
-------
theT: double
theDist: double

Description
-----------
Computes parameter of the Point theP on the edge aE. Returns zero if the distance between point and edge is less than sum of tolerance value of edge and theTopP, otherwise and for following conditions returns negative value 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3).
") ComputePE;
		int ComputePE(const gp_Pnt & theP, const double theTolP, const TopoDS_Edge & theE, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Context::ComputeVE ******/
		/****** md5 signature: 542656b76063c129c842ba9afcb6a6ac ******/
		%feature("compactdefaultargs") ComputeVE;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theE: TopoDS_Edge
theFuzz: double (optional, default to Precision::Confusion())

Return
-------
theT: double
theTol: double

Description
-----------
Computes parameter of the vertex aV on the edge aE and correct tolerance value for the vertex on the edge. Returns zero if the distance between vertex and edge is less than sum of tolerances and the fuzzy value, otherwise and for following conditions returns negative value: 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3).
") ComputeVE;
		int ComputeVE(const TopoDS_Vertex & theV, const TopoDS_Edge & theE, Standard_Real &OutValue, Standard_Real &OutValue, const double theFuzz = Precision::Confusion());

		/****** IntTools_Context::ComputeVF ******/
		/****** md5 signature: 45da1cd8f4ce697ac85749fc55815ade ******/
		%feature("compactdefaultargs") ComputeVF;
		%feature("autodoc", "
Parameters
----------
theVertex: TopoDS_Vertex
theFace: TopoDS_Face
theFuzz: double (optional, default to Precision::Confusion())

Return
-------
theU: double
theV: double
theTol: double

Description
-----------
Computes UV parameters of the vertex aV on face aF and correct tolerance value for the vertex on the face. Returns zero if the distance between vertex and face is less than or equal the sum of tolerances and the fuzzy value and the projection point lays inside boundaries of the face. For following conditions returns negative value 1. projection algorithm failed (-1) 2. distance is more than sum of tolerances (-2) 3. projection point out or on the boundaries of face (-3).
") ComputeVF;
		int ComputeVF(const TopoDS_Vertex & theVertex, const TopoDS_Face & theFace, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const double theFuzz = Precision::Confusion());

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
		/****** md5 signature: e35b01bc779c09e4d58788cb24687117 ******/
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
		bool IsInfiniteFace(const TopoDS_Face & theFace);

		/****** IntTools_Context::IsPointInFace ******/
		/****** md5 signature: 1330704882f0ec7422ad1eb3a1e090ac ******/
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
		bool IsPointInFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****** IntTools_Context::IsPointInFace ******/
		/****** md5 signature: 80d9d024d01e49e8081929f2151769ff ******/
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "
Parameters
----------
aP3D: gp_Pnt
aF: TopoDS_Face
aTol: double

Return
-------
bool

Description
-----------
Returns true if the point aP2D is inside the boundaries of the face aF, otherwise returns false.
") IsPointInFace;
		bool IsPointInFace(const gp_Pnt & aP3D, const TopoDS_Face & aF, const double aTol);

		/****** IntTools_Context::IsPointInOnFace ******/
		/****** md5 signature: e82471a683c28e7f3885da10f7c0df93 ******/
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
		bool IsPointInOnFace(const TopoDS_Face & aF, const gp_Pnt2d & aP2D);

		/****** IntTools_Context::IsValidBlockForFace ******/
		/****** md5 signature: 365a40673bb715848736b8aef6f0fd2c ******/
		%feature("compactdefaultargs") IsValidBlockForFace;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double
aIC: IntTools_Curve
aF: TopoDS_Face
aTol: double

Return
-------
bool

Description
-----------
Returns true if IsValidPointForFace returns true for some 3d point that lay on the curve aIC bounded by parameters aT1 and aT2.
") IsValidBlockForFace;
		bool IsValidBlockForFace(const double aT1, const double aT2, const IntTools_Curve & aIC, const TopoDS_Face & aF, const double aTol);

		/****** IntTools_Context::IsValidBlockForFaces ******/
		/****** md5 signature: ac06f6699b0005d5e66b0ba3ca830876 ******/
		%feature("compactdefaultargs") IsValidBlockForFaces;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double
aIC: IntTools_Curve
aF1: TopoDS_Face
aF2: TopoDS_Face
aTol: double

Return
-------
bool

Description
-----------
Returns true if IsValidBlockForFace returns true for both faces aF1 and aF2.
") IsValidBlockForFaces;
		bool IsValidBlockForFaces(const double aT1, const double aT2, const IntTools_Curve & aIC, const TopoDS_Face & aF1, const TopoDS_Face & aF2, const double aTol);

		/****** IntTools_Context::IsValidPointForFace ******/
		/****** md5 signature: 524e9eb14689f3715cfd30cace7d63ca ******/
		%feature("compactdefaultargs") IsValidPointForFace;
		%feature("autodoc", "
Parameters
----------
aP3D: gp_Pnt
aF: TopoDS_Face
aTol: double

Return
-------
bool

Description
-----------
Returns true if the distance between point aP3D and face aF is less or equal to tolerance aTol and projection point is inside or on the boundaries of the face aF.
") IsValidPointForFace;
		bool IsValidPointForFace(const gp_Pnt & aP3D, const TopoDS_Face & aF, const double aTol);

		/****** IntTools_Context::IsValidPointForFaces ******/
		/****** md5 signature: 0bd14d579721c284927bac11e918f6ba ******/
		%feature("compactdefaultargs") IsValidPointForFaces;
		%feature("autodoc", "
Parameters
----------
aP3D: gp_Pnt
aF1: TopoDS_Face
aF2: TopoDS_Face
aTol: double

Return
-------
bool

Description
-----------
Returns true if IsValidPointForFace returns true for both face aF1 and aF2.
") IsValidPointForFaces;
		bool IsValidPointForFaces(const gp_Pnt & aP3D, const TopoDS_Face & aF1, const TopoDS_Face & aF2, const double aTol);

		/****** IntTools_Context::IsVertexOnLine ******/
		/****** md5 signature: 354f1224504db8878336ab7d6f2268a5 ******/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "
Parameters
----------
aV: TopoDS_Vertex
aIC: IntTools_Curve
aTolC: double

Return
-------
aT: double

Description
-----------
Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant).
") IsVertexOnLine;
		bool IsVertexOnLine(const TopoDS_Vertex & aV, const IntTools_Curve & aIC, const double aTolC, Standard_Real &OutValue);

		/****** IntTools_Context::IsVertexOnLine ******/
		/****** md5 signature: 44117946f46a759bcf6c6990d08e5ac1 ******/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "
Parameters
----------
aV: TopoDS_Vertex
aTolV: double
aIC: IntTools_Curve
aTolC: double

Return
-------
aT: double

Description
-----------
Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant).
") IsVertexOnLine;
		bool IsVertexOnLine(const TopoDS_Vertex & aV, const double aTolV, const IntTools_Curve & aIC, const double aTolC, Standard_Real &OutValue);

		/****** IntTools_Context::OBB ******/
		/****** md5 signature: b004abd64629777acd01f52a1f255113 ******/
		%feature("compactdefaultargs") OBB;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFuzzyValue: double (optional, default to Precision::Confusion())

Return
-------
Bnd_OBB

Description
-----------
Builds and stores an Oriented Bounding Box for the shape. Returns a reference to OBB.
") OBB;
		Bnd_OBB & OBB(const TopoDS_Shape & theShape, const double theFuzzyValue = Precision::Confusion());

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
		/****** md5 signature: efc9790d67a84fc4e08b9b23857ecc2c ******/
		%feature("compactdefaultargs") ProjectPointOnEdge;
		%feature("autodoc", "
Parameters
----------
aP: gp_Pnt
aE: TopoDS_Edge

Return
-------
aT: double

Description
-----------
Computes parameter of the point aP on the edge aE. Returns false if projection algorithm failed other wiese returns true.
") ProjectPointOnEdge;
		bool ProjectPointOnEdge(const gp_Pnt & aP, const TopoDS_Edge & aE, Standard_Real &OutValue);

		/****** IntTools_Context::SetPOnSProjectionTolerance ******/
		/****** md5 signature: 7e2d2eb4a7dd9ed0c90219385a0ac950 ******/
		%feature("compactdefaultargs") SetPOnSProjectionTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets tolerance to be used for projection of point on surface. Clears map of already cached projectors in order to maintain correct value for all projectors.
") SetPOnSProjectionTolerance;
		void SetPOnSProjectionTolerance(const double theValue);

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
		/****** md5 signature: f6f4e31fda6ac7491f4bd28238e1c1cc ******/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
UMin: double
UMax: double
VMin: double
VMax: double

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
		/****** md5 signature: 8ecb026bb515d093b18a113e9b105275 ******/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "
Parameters
----------
the3dCurve3d: Geom_Curve
the2dCurve1: Geom2d_Curve
the2dCurve2: Geom2d_Curve
theTolerance: double (optional, default to 0.0)
theTangentialTolerance: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Constructor taking 3d curve, two 2d curves and two tolerance values.
") IntTools_Curve;
		 IntTools_Curve(const opencascade::handle<Geom_Curve> & the3dCurve3d, const opencascade::handle<Geom2d_Curve> & the2dCurve1, const opencascade::handle<Geom2d_Curve> & the2dCurve2, const double theTolerance = 0.0, const double theTangentialTolerance = 0.0);

		/****** IntTools_Curve::Bounds ******/
		/****** md5 signature: 2c8f2d2ff99b2f4e2abff08be1bcd89f ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Return
-------
theFirst: double
theLast: double

Description
-----------
If the 3d curve is bounded curve the method will return True and modify the output parameters with boundary parameters of the curve and corresponded 3d points. If the curve does not have bounds, the method will return false and the output parameters will stay untouched.
") Bounds;
		bool Bounds(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt);

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
		/****** md5 signature: 45161bce5169a497770bad27c44c38e4 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
thePar: double
thePnt: gp_Pnt

Return
-------
bool

Description
-----------
Computes 3d point corresponded to the given parameter if this parameter is inside the boundaries of the curve. Returns True in this case. Otherwise, the point will not be computed and the method will return False.
") D0;
		bool D0(const double & thePar, gp_Pnt & thePnt);

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
		/****** md5 signature: b380d71d0f5b77ffd79071edf40e361a ******/
		%feature("compactdefaultargs") HasBounds;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if 3d curve is BoundedCurve.
") HasBounds;
		bool HasBounds();

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
		/****** md5 signature: 76ff0bbf37de1adb48517911fef64ff6 ******/
		%feature("compactdefaultargs") SetTangentialTolerance;
		%feature("autodoc", "
Parameters
----------
theTangentialTolerance: double

Return
-------
None

Description
-----------
Sets the tangential tolerance.
") SetTangentialTolerance;
		void SetTangentialTolerance(const double theTangentialTolerance);

		/****** IntTools_Curve::SetTolerance ******/
		/****** md5 signature: de1d8196b7a6b9be7e63e964a0a3482e ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Sets the tolerance for the curve.
") SetTolerance;
		void SetTolerance(const double theTolerance);

		/****** IntTools_Curve::TangentialTolerance ******/
		/****** md5 signature: e60912ea3150be42bc4f243e7e5761c1 ******/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tangential tolerance.
") TangentialTolerance;
		double TangentialTolerance();

		/****** IntTools_Curve::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance.
") Tolerance;
		double Tolerance();

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
		/****** md5 signature: eed99388536adc390e7820103773cfb7 ******/
		%feature("compactdefaultargs") IntTools_CurveRangeLocalizeData;
		%feature("autodoc", "
Parameters
----------
theNbSample: int
theMinRange: double

Return
-------
None

Description
-----------
No available documentation.
") IntTools_CurveRangeLocalizeData;
		 IntTools_CurveRangeLocalizeData(const int theNbSample, const double theMinRange);

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
		/****** md5 signature: 9bfb0a071d9267d8781463e6f820a1ff ******/
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
		bool FindBox(const IntTools_CurveRangeSample & theRange, Bnd_Box & theBox);

		/****** IntTools_CurveRangeLocalizeData::GetMinRange ******/
		/****** md5 signature: 433aeaa3f654c182713fb459e925fa39 ******/
		%feature("compactdefaultargs") GetMinRange;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetMinRange;
		double GetMinRange();

		/****** IntTools_CurveRangeLocalizeData::GetNbSample ******/
		/****** md5 signature: 4c7072793c6b3b92f3c8e1ae22d5d5e8 ******/
		%feature("compactdefaultargs") GetNbSample;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetNbSample;
		int GetNbSample();

		/****** IntTools_CurveRangeLocalizeData::IsRangeOut ******/
		/****** md5 signature: d7115fd3a768140eb55ec8ca204dda70 ******/
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
		bool IsRangeOut(const IntTools_CurveRangeSample & theRange);

		/****** IntTools_CurveRangeLocalizeData::ListRangeOut ******/
		/****** md5 signature: 394feb4128c61104f18c28c18dbc4ac8 ******/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", "
Parameters
----------
theList: NCollection_List<IntTools_CurveRangeSample>

Return
-------
None

Description
-----------
No available documentation.
") ListRangeOut;
		void ListRangeOut(NCollection_List<IntTools_CurveRangeSample> & theList);

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
		/****** md5 signature: a933c3a937e3be81baa1570b62db83aa ******/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "
Parameters
----------
theEdge1: TopoDS_Edge
aT11: double
aT12: double
theEdge2: TopoDS_Edge
aT21: double
aT22: double

Return
-------
None

Description
-----------
Constructor.
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge(const TopoDS_Edge & theEdge1, const double aT11, const double aT12, const TopoDS_Edge & theEdge2, const double aT21, const double aT22);

		/****** IntTools_EdgeEdge::CommonParts ******/
		/****** md5 signature: 3ef915957da076d92ffa319b13c69aa9 ******/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Return
-------
NCollection_Sequence<IntTools_CommonPrt>

Description
-----------
Returns common parts.
") CommonParts;
		const NCollection_Sequence<IntTools_CommonPrt> & CommonParts();

		/****** IntTools_EdgeEdge::FuzzyValue ******/
		/****** md5 signature: 373e47743969d00ed43027374421e64c ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Fuzzy value.
") FuzzyValue;
		double FuzzyValue();

		/****** IntTools_EdgeEdge::IsCoincidenceCheckedQuickly ******/
		/****** md5 signature: c9d8667b47cbf38b4d998ac1e79cd886 ******/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag myQuickCoincidenceCheck.
") IsCoincidenceCheckedQuickly;
		bool IsCoincidenceCheckedQuickly();

		/****** IntTools_EdgeEdge::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if common part(s) is(are) found.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6dd86116126ff99182bfcf32c407cc1f ******/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
aT1: double
aT2: double

Return
-------
None

Description
-----------
Sets the first edge and its range.
") SetEdge1;
		void SetEdge1(const TopoDS_Edge & theEdge, const double aT1, const double aT2);

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
		/****** md5 signature: 26f81cc4d5d5fa90e75866c9fb8a9765 ******/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
aT1: double
aT2: double

Return
-------
None

Description
-----------
Sets the first edge and its range.
") SetEdge2;
		void SetEdge2(const TopoDS_Edge & theEdge, const double aT1, const double aT2);

		/****** IntTools_EdgeEdge::SetFuzzyValue ******/
		/****** md5 signature: beedb85a4dfa8508c90e54660fd7d7a1 ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: double

Return
-------
None

Description
-----------
Sets the Fuzzy value.
") SetFuzzyValue;
		void SetFuzzyValue(const double theFuzz);

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
		/****** md5 signature: fb29eb824e500aad1f9e393a2c7cefc9 ******/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double

Return
-------
None

Description
-----------
Sets the range for the first edge.
") SetRange1;
		void SetRange1(const double aT1, const double aT2);

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
		/****** md5 signature: 401bb694e6d0aed36b4ea2adfa29c2fd ******/
		%feature("compactdefaultargs") SetRange2;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double

Return
-------
None

Description
-----------
Sets the range for the second edge.
") SetRange2;
		void SetRange2(const double aT1, const double aT2);

		/****** IntTools_EdgeEdge::UseQuickCoincidenceCheck ******/
		/****** md5 signature: 8d9108973d294bd63abab572b6f52587 ******/
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
		void UseQuickCoincidenceCheck(const bool bFlag);

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
		/****** md5 signature: c1f414d4c0b6bc8b03325b981029ec08 ******/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "Return
-------
NCollection_Sequence<IntTools_CommonPrt>

Description
-----------
Returns resulting common parts.
") CommonParts;
		const NCollection_Sequence<IntTools_CommonPrt> & CommonParts();

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
		/****** md5 signature: d9fcbadbff0953c639e060241b086dec ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the code of completion: 0 - means successful completion; 1 - the process was not started; 2,3 - invalid source data for the algorithm; 4 - projection failed.
") ErrorStatus;
		int ErrorStatus();

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
		/****** md5 signature: 6eef56dc3eb31c06f24ae91ee35b442b ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Fuzzy value.
") FuzzyValue;
		double FuzzyValue();

		/****** IntTools_EdgeFace::IsCoincidenceCheckedQuickly ******/
		/****** md5 signature: c9d8667b47cbf38b4d998ac1e79cd886 ******/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag myQuickCoincidenceCheck.
") IsCoincidenceCheckedQuickly;
		bool IsCoincidenceCheckedQuickly();

		/****** IntTools_EdgeFace::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if computation was successful. Otherwise returns False.
") IsDone;
		bool IsDone();

		/****** IntTools_EdgeFace::MinimalDistance ******/
		/****** md5 signature: 08110272211a9e6e24974dd12bdb9fc7 ******/
		%feature("compactdefaultargs") MinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal distance found between edge and face.
") MinimalDistance;
		double MinimalDistance();

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
		/****** md5 signature: 4b935243ffca2b15cd757f29d05b4ad6 ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: double

Return
-------
None

Description
-----------
Sets the Fuzzy value.
") SetFuzzyValue;
		void SetFuzzyValue(const double theFuzz);

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
		/****** md5 signature: 4151b6f32487d2547971866c1afa658e ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Sets the boundaries for the edge. The algorithm processes edge inside these boundaries.
") SetRange;
		void SetRange(const double theFirst, const double theLast);

		/****** IntTools_EdgeFace::UseQuickCoincidenceCheck ******/
		/****** md5 signature: 3645d783575a038d1ec4c4f21db82ff1 ******/
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
		void UseQuickCoincidenceCheck(const bool theFlag);

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
		/****** md5 signature: 7d79d9ffd9848078d728b1de47473199 ******/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
Initializes algorithm by the face F and tolerance Tol.
") IntTools_FClass2d;
		 IntTools_FClass2d(const TopoDS_Face & F, const double Tol);

		/****** IntTools_FClass2d::Init ******/
		/****** md5 signature: 71cfebee40d30b5363b1e1bd3ab260e2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
Initializes algorithm by the face F and tolerance Tol.
") Init;
		void Init(const TopoDS_Face & F, const double Tol);

		/****** IntTools_FClass2d::IsHole ******/
		/****** md5 signature: 2a7c513c783b07ebd840e032b0166633 ******/
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsHole;
		bool IsHole();

		/****** IntTools_FClass2d::Perform ******/
		/****** md5 signature: cdb3c5a039795a6fac8973a573e41750 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Puv: gp_Pnt2d
RecadreOnPeriodic: bool (optional, default to true)

Return
-------
TopAbs_State

Description
-----------
Returns state of the 2d point Puv. If RecadreOnPeriodic is true (default value), for the periodic surface 2d point, adjusted to period, is classified.
") Perform;
		TopAbs_State Perform(const gp_Pnt2d & Puv, const bool RecadreOnPeriodic = true);

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
		/****** md5 signature: 909781cdd20af89cef190ae54ec1dfef ******/
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "
Parameters
----------
Puv: gp_Pnt2d
Tol: double
RecadreOnPeriodic: bool (optional, default to true)

Return
-------
TopAbs_State

Description
-----------
Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use. see the code for more details).
") TestOnRestriction;
		TopAbs_State TestOnRestriction(const gp_Pnt2d & Puv, const double Tol, const bool RecadreOnPeriodic = true);

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
		/****** md5 signature: 373e47743969d00ed43027374421e64c ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Fuzzy value.
") FuzzyValue;
		double FuzzyValue();

		/****** IntTools_FaceFace::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection was successful.
") IsDone;
		bool IsDone();

		/****** IntTools_FaceFace::Lines ******/
		/****** md5 signature: e9cd962f0bcce7419468d1517fc6fba7 ******/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "Return
-------
NCollection_Sequence<IntTools_Curve>

Description
-----------
Returns sequence of 3d curves as result of intersection.
") Lines;
		NCollection_Sequence<IntTools_Curve> Lines();

		/****** IntTools_FaceFace::Perform ******/
		/****** md5 signature: 5579a48e4e1d6767114f75007b84a8b2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
theToRunParallel: bool (optional, default to false)

Return
-------
None

Description
-----------
Intersects underliing surfaces of F1 and F2 Use sum of tolerance of F1 and F2 as intersection criteria.
") Perform;
		void Perform(const TopoDS_Face & F1, const TopoDS_Face & F2, const bool theToRunParallel = false);

		/****** IntTools_FaceFace::Points ******/
		/****** md5 signature: f512c226876de648583cc2c964c4f205 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
NCollection_Sequence<IntTools_PntOn2Faces>

Description
-----------
Returns sequence of 3d curves as result of intersection.
") Points;
		const NCollection_Sequence<IntTools_PntOn2Faces> & Points();

		/****** IntTools_FaceFace::PrepareLines3D ******/
		/****** md5 signature: 8e104b5ee9149b06a7b9adeb73e41447 ******/
		%feature("compactdefaultargs") PrepareLines3D;
		%feature("autodoc", "
Parameters
----------
bToSplit: bool (optional, default to true)

Return
-------
None

Description
-----------
Provides post-processing the result lines. 
Input parameter: bToSplit split the closed 3D-curves on parts when True,  remain untouched otherwise.
") PrepareLines3D;
		void PrepareLines3D(const bool bToSplit = true);

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
		/****** md5 signature: beedb85a4dfa8508c90e54660fd7d7a1 ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: double

Return
-------
None

Description
-----------
Sets the Fuzzy value.
") SetFuzzyValue;
		void SetFuzzyValue(const double theFuzz);

		/****** IntTools_FaceFace::SetList ******/
		/****** md5 signature: 28078718696f27a8c5532991cafbc9ff ******/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "
Parameters
----------
ListOfPnts: NCollection_List<IntSurf_PntOn2S>

Return
-------
None

Description
-----------
No available documentation.
") SetList;
		void SetList(NCollection_List<IntSurf_PntOn2S> & ListOfPnts);

		/****** IntTools_FaceFace::SetParameters ******/
		/****** md5 signature: c507b5a440cd5698b351a7d6ad0a763c ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
ApproxCurves: bool
ComputeCurveOnS1: bool
ComputeCurveOnS2: bool
ApproximationTolerance: double

Return
-------
None

Description
-----------
Modifier.
") SetParameters;
		void SetParameters(const bool ApproxCurves, const bool ComputeCurveOnS1, const bool ComputeCurveOnS2, const double ApproximationTolerance);

		/****** IntTools_FaceFace::TangentFaces ******/
		/****** md5 signature: a3b282b2f15e5f2571f5a9e4b5225aac ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if faces are tangent.
") TangentFaces;
		bool TangentFaces();

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
		/****** md5 signature: 686a71799ca1fc2aab51994dcb4a2c2b ******/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: double
theLastBoundary: double
theInitFlag: int

Return
-------
None

Description
-----------
build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary.
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet(const double theFirstBoundary, const double theLastBoundary, const int theInitFlag);

		/****** IntTools_MarkedRangeSet::IntTools_MarkedRangeSet ******/
		/****** md5 signature: a8a6fe77911459b8d454e5c3f9f0342b ******/
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
		 IntTools_MarkedRangeSet(const TColStd_Array1OfReal & theSortedArray, const int theInitFlag);

		/****** IntTools_MarkedRangeSet::Flag ******/
		/****** md5 signature: 395c5934506db02625e6465478cda7ac ******/
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
		int Flag(const int theIndex);

		/****** IntTools_MarkedRangeSet::GetIndex ******/
		/****** md5 signature: 4c0f2eaac5d0d031b129bb52c04ec964 ******/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
int

Description
-----------
Returns index of range which contains theValue. If theValue do not belong any range returns 0.
") GetIndex;
		int GetIndex(const double theValue);

		/****** IntTools_MarkedRangeSet::GetIndex ******/
		/****** md5 signature: b5f25840e406f95c9f0b593137a9e030 ******/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "
Parameters
----------
theValue: double
UseLower: bool

Return
-------
int

Description
-----------
Returns index of range which contains theValue If theValue do not belong any range returns 0. If UseLower is true then lower boundary of the range can be equal to theValue, otherwise upper boundary of the range can be equal to theValue.
") GetIndex;
		int GetIndex(const double theValue, const bool UseLower);

		/****** IntTools_MarkedRangeSet::GetIndices ******/
		/****** md5 signature: b445f876a0c4486fa7238915cdd5789f ******/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
TColStd_SequenceOfInteger

Description
-----------
No available documentation.
") GetIndices;
		const TColStd_SequenceOfInteger & GetIndices(const double theValue);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: 4517595576d752d576bb91a3e6732c34 ******/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: double
theLastBoundary: double
theFlag: int

Return
-------
bool

Description
-----------
Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False.
") InsertRange;
		bool InsertRange(const double theFirstBoundary, const double theLastBoundary, const int theFlag);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: 7c2f1d8e5000fed1bdb344b599d0b358 ******/
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
		bool InsertRange(const IntTools_Range & theRange, const int theFlag);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: b4cbbadfaa22b89562439813f6dc3771 ******/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: double
theLastBoundary: double
theFlag: int
theIndex: int

Return
-------
bool

Description
-----------
Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. The index theIndex is a position where the range will be inserted. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False.
") InsertRange;
		bool InsertRange(const double theFirstBoundary, const double theLastBoundary, const int theFlag, const int theIndex);

		/****** IntTools_MarkedRangeSet::InsertRange ******/
		/****** md5 signature: 92fdd3d6be301ba9bb459ed05c4e902d ******/
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
		bool InsertRange(const IntTools_Range & theRange, const int theFlag, const int theIndex);

		/****** IntTools_MarkedRangeSet::Length ******/
		/****** md5 signature: 2c79344820631bbc981db4659a632b7a ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of ranges.
") Length;
		int Length();

		/****** IntTools_MarkedRangeSet::Range ******/
		/****** md5 signature: 3fdf63c1128f6b67065b29a42c5fb54f ******/
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
		IntTools_Range Range(const int theIndex);

		/****** IntTools_MarkedRangeSet::SetBoundaries ******/
		/****** md5 signature: 9dac034564d7be2634562a10d2f8f9a1 ******/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "
Parameters
----------
theFirstBoundary: double
theLastBoundary: double
theInitFlag: int

Return
-------
None

Description
-----------
build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary.
") SetBoundaries;
		void SetBoundaries(const double theFirstBoundary, const double theLastBoundary, const int theInitFlag);

		/****** IntTools_MarkedRangeSet::SetFlag ******/
		/****** md5 signature: 1c616900e136251bbece607fd69409bb ******/
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
		void SetFlag(const int theIndex, const int theFlag);

		/****** IntTools_MarkedRangeSet::SetRanges ******/
		/****** md5 signature: 78c6e6ca6e4b407a5cd1f96f5fe5bfd3 ******/
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
		void SetRanges(const TColStd_Array1OfReal & theSortedArray, const int theInitFlag);

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
		/****** md5 signature: f11036be78d4c26ffdc54c2415b67292 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Selector.
") IsValid;
		bool IsValid();

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
		/****** md5 signature: fc6341283a99c5ac48f390a94170ecb5 ******/
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
		void SetValid(const bool bF);

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
		/****** md5 signature: 72227e2fcf28c47f234e117de2a7146d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
aP: gp_Pnt
U: double
V: double

Return
-------
None

Description
-----------
Initializes me by aFace, a 3d point and it's UV parameters on face.
") Init;
		void Init(const TopoDS_Face & aF, const gp_Pnt & aP, const double U, const double V);

		/****** IntTools_PntOnFace::Parameters ******/
		/****** md5 signature: 36cd3391d4dcc137204d7c8d09b8d473 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

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
		/****** md5 signature: 9b53d4e06efac8b6e488e9fb47541613 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
None

Description
-----------
Modifier.
") SetParameters;
		void SetParameters(const double U, const double V);

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
		/****** md5 signature: fc6341283a99c5ac48f390a94170ecb5 ******/
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
		void SetValid(const bool bF);

		/****** IntTools_PntOnFace::Valid ******/
		/****** md5 signature: e5e1eb9a43f288aba07a02616355571b ******/
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Selector.
") Valid;
		bool Valid();

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
		/****** md5 signature: f5746eb03332cba00a1b052ba88dc49e ******/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "
Parameters
----------
aFirst: double
aLast: double

Return
-------
None

Description
-----------
Initialize me by range boundaries.
") IntTools_Range;
		 IntTools_Range(const double aFirst, const double aLast);

		/****** IntTools_Range::First ******/
		/****** md5 signature: 61ce69da508d1629f019b1eaed06f2ac ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
double

Description
-----------
Selector.
") First;
		double First();

		/****** IntTools_Range::Last ******/
		/****** md5 signature: f68736fde4f79ad5767aa65cfae8fd87 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
double

Description
-----------
Selector.
") Last;
		double Last();

		/****** IntTools_Range::Range ******/
		/****** md5 signature: 7cd2a533bcf94be31a066bb863418e1a ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
aFirst: double
aLast: double

Description
-----------
Selector.
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Range::SetFirst ******/
		/****** md5 signature: 1dcb1d6eec2518712f3c107571cac5e5 ******/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "
Parameters
----------
aFirst: double

Return
-------
None

Description
-----------
Modifier.
") SetFirst;
		void SetFirst(const double aFirst);

		/****** IntTools_Range::SetLast ******/
		/****** md5 signature: 3f2018d0f21f3ebf0a4e054667150ae9 ******/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "
Parameters
----------
aLast: double

Return
-------
None

Description
-----------
Modifier.
") SetLast;
		void SetLast(const double aLast);

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
		/****** md5 signature: 24e145c7353b914b4c53aa40a1028e0b ******/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "
Parameters
----------
aRoot: double
aType: int

Return
-------
None

Description
-----------
Initializes my by range of parameters and type of root.
") IntTools_Root;
		 IntTools_Root(const double aRoot, const int aType);

		/****** IntTools_Root::Interval ******/
		/****** md5 signature: f92fc5e3be472202b9244e77004acb1a ******/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "
Parameters
----------

Return
-------
t1: double
t2: double
f1: double
f2: double

Description
-----------
Returns the values of interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).
") Interval;
		void Interval(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Root::IsValid ******/
		/****** md5 signature: f11036be78d4c26ffdc54c2415b67292 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the validity flag for the root, True if myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_IN or myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_ON or myStateBefore==TopAbs_ON && myStateAfter==TopAbs_OUT or myStateBefore==TopAbs_IN && myStateAfter==TopAbs_OUT For other cases it returns False.
") IsValid;
		bool IsValid();

		/****** IntTools_Root::LayerHeight ******/
		/****** md5 signature: da8ec5cb7a3a059171196ca905b525d8 ******/
		%feature("compactdefaultargs") LayerHeight;
		%feature("autodoc", "Return
-------
double

Description
-----------
Not used in Edge/Edge algorithm.
") LayerHeight;
		double LayerHeight();

		/****** IntTools_Root::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Root value.
") Root;
		double Root();

		/****** IntTools_Root::SetInterval ******/
		/****** md5 signature: 18097bb967aa10f0d81fa5c759d66139 ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
t1: double
t2: double
f1: double
f2: double

Return
-------
None

Description
-----------
Sets the interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).
") SetInterval;
		void SetInterval(const double t1, const double t2, const double f1, const double f2);

		/****** IntTools_Root::SetLayerHeight ******/
		/****** md5 signature: 6a65179a5bedd6dc2e0b93623d51a378 ******/
		%feature("compactdefaultargs") SetLayerHeight;
		%feature("autodoc", "
Parameters
----------
aHeight: double

Return
-------
None

Description
-----------
Not used in Edge/Edge algorithm.
") SetLayerHeight;
		void SetLayerHeight(const double aHeight);

		/****** IntTools_Root::SetRoot ******/
		/****** md5 signature: c2bc9f72b4c0fa8d3605b248f7080071 ******/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "
Parameters
----------
aRoot: double

Return
-------
None

Description
-----------
Sets the Root's value.
") SetRoot;
		void SetRoot(const double aRoot);

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
		/****** md5 signature: 364f42dfe11247d67e7ebb229ab183e4 ******/
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
		void SetType(const int aType);

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
		/****** md5 signature: 08d6b3f0f2bca5b690ae63689e8d73f5 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the type of the root =0 - Simple (was found by bisection method); =2 - Smart when f1=0, f2!=0 or vice versa (was found by Fibbonacci method); =1 - Pure (pure zero for all t [t1,t2]);.
") Type;
		int Type();

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
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True in case the shrunk range is computed.
") IsDone;
		bool IsDone();

		/****** IntTools_ShrunkRange::IsSplittable ******/
		/****** md5 signature: f75584b28d17f2506c175be414303f2e ******/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False in case the shrunk range is too short and the edge cannot be split, otherwise returns True.
") IsSplittable;
		bool IsSplittable();

		/****** IntTools_ShrunkRange::Length ******/
		/****** md5 signature: 0abaa7b760145b0781c3a3e68f0af715 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the edge if computed.
") Length;
		double Length();

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
		/****** md5 signature: 568a87aa90210b18360f831d7cb67d48 ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aT1: double
aT2: double
aV1: TopoDS_Vertex
aV2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") SetData;
		void SetData(const TopoDS_Edge & aE, const double aT1, const double aT2, const TopoDS_Vertex & aV1, const TopoDS_Vertex & aV2);

		/****** IntTools_ShrunkRange::SetShrunkRange ******/
		/****** md5 signature: 3d477aa264ae449e497c795029cc9bb6 ******/
		%feature("compactdefaultargs") SetShrunkRange;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double

Return
-------
None

Description
-----------
No available documentation.
") SetShrunkRange;
		void SetShrunkRange(const double aT1, const double aT2);

		/****** IntTools_ShrunkRange::ShrunkRange ******/
		/****** md5 signature: a4141caedba702e49479f8272b3932c0 ******/
		%feature("compactdefaultargs") ShrunkRange;
		%feature("autodoc", "
Parameters
----------

Return
-------
aT1: double
aT2: double

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
		/****** md5 signature: 58da62c518c3fec27291a6d3fb799430 ******/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", "
Parameters
----------
theNbSampleU: int
theNbSampleV: int
theMinRangeU: double
theMinRangeV: double

Return
-------
None

Description
-----------
No available documentation.
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData(const int theNbSampleU, const int theNbSampleV, const double theMinRangeU, const double theMinRangeV);

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
		/****** md5 signature: 1fff8331608654eeef52904b50492eeb ******/
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
		bool FindBox(const IntTools_SurfaceRangeSample & theRange, Bnd_Box & theBox);

		/****** IntTools_SurfaceRangeLocalizeData::GetGridDeflection ******/
		/****** md5 signature: 1d8108732bf260360b27bc692ea818d2 ******/
		%feature("compactdefaultargs") GetGridDeflection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Query the grid deflection.
") GetGridDeflection;
		double GetGridDeflection();

		/****** IntTools_SurfaceRangeLocalizeData::GetGridPoint ******/
		/****** md5 signature: f2186db4d640e0e9bab97280484e9c1e ******/
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
		const gp_Pnt GetGridPoint(const int theUIndex, const int theVIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetMinRangeU ******/
		/****** md5 signature: b206fee0f7ee8abab6ea9c9df37d6b55 ******/
		%feature("compactdefaultargs") GetMinRangeU;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetMinRangeU;
		double GetMinRangeU();

		/****** IntTools_SurfaceRangeLocalizeData::GetMinRangeV ******/
		/****** md5 signature: 300124c53f2e3bbcfc3d87a71c08e97f ******/
		%feature("compactdefaultargs") GetMinRangeV;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetMinRangeV;
		double GetMinRangeV();

		/****** IntTools_SurfaceRangeLocalizeData::GetNBUPointsInFrame ******/
		/****** md5 signature: 149c0014b8f62196dc6b2100629d6f4d ******/
		%feature("compactdefaultargs") GetNBUPointsInFrame;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of grid points on U direction in frame.
") GetNBUPointsInFrame;
		int GetNBUPointsInFrame();

		/****** IntTools_SurfaceRangeLocalizeData::GetNBVPointsInFrame ******/
		/****** md5 signature: fbd37922503dfef87d36fd38a47e4f27 ******/
		%feature("compactdefaultargs") GetNBVPointsInFrame;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of grid points on V direction in frame.
") GetNBVPointsInFrame;
		int GetNBVPointsInFrame();

		/****** IntTools_SurfaceRangeLocalizeData::GetNbSampleU ******/
		/****** md5 signature: 74c32b62c8d486902e8fddb7f0d02ceb ******/
		%feature("compactdefaultargs") GetNbSampleU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetNbSampleU;
		int GetNbSampleU();

		/****** IntTools_SurfaceRangeLocalizeData::GetNbSampleV ******/
		/****** md5 signature: 776c0abf5c5836ad56788fa9a9bd8b1a ******/
		%feature("compactdefaultargs") GetNbSampleV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetNbSampleV;
		int GetNbSampleV();

		/****** IntTools_SurfaceRangeLocalizeData::GetPointInFrame ******/
		/****** md5 signature: f1e16fcae4cc9e00bcd72e62ac02f3c7 ******/
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
		const gp_Pnt GetPointInFrame(const int theUIndex, const int theVIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetRangeUGrid ******/
		/****** md5 signature: 4e2e7885faf64a444b56732770e32bae ******/
		%feature("compactdefaultargs") GetRangeUGrid;
		%feature("autodoc", "Return
-------
int

Description
-----------
Query the range U of the grid of points.
") GetRangeUGrid;
		int GetRangeUGrid();

		/****** IntTools_SurfaceRangeLocalizeData::GetRangeVGrid ******/
		/****** md5 signature: 83cabca7d0b4e3af9226f839e58775c9 ******/
		%feature("compactdefaultargs") GetRangeVGrid;
		%feature("autodoc", "Return
-------
int

Description
-----------
Query the range V of the grid of points.
") GetRangeVGrid;
		int GetRangeVGrid();

		/****** IntTools_SurfaceRangeLocalizeData::GetUParam ******/
		/****** md5 signature: ff54d282c3c52f9b8b6f7dd1fe873fb7 ******/
		%feature("compactdefaultargs") GetUParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Query the U parameter of the grid points at that index.
") GetUParam;
		double GetUParam(const int theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetUParamInFrame ******/
		/****** md5 signature: 67750ea8289b1b430025bc993ea00f97 ******/
		%feature("compactdefaultargs") GetUParamInFrame;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Query the U parameter of the grid points at that index in frame.
") GetUParamInFrame;
		double GetUParamInFrame(const int theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetVParam ******/
		/****** md5 signature: 02cc69fc23f105f86ee7d820da46ae55 ******/
		%feature("compactdefaultargs") GetVParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Query the V parameter of the grid points at that index.
") GetVParam;
		double GetVParam(const int theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::GetVParamInFrame ******/
		/****** md5 signature: 560e043487c3513e707ff38a18faf716 ******/
		%feature("compactdefaultargs") GetVParamInFrame;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Query the V parameter of the grid points at that index in frame.
") GetVParamInFrame;
		double GetVParamInFrame(const int theIndex);

		/****** IntTools_SurfaceRangeLocalizeData::IsRangeOut ******/
		/****** md5 signature: a153f56077de3b5b41c8768beeda0e9a ******/
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
		bool IsRangeOut(const IntTools_SurfaceRangeSample & theRange);

		/****** IntTools_SurfaceRangeLocalizeData::ListRangeOut ******/
		/****** md5 signature: 6de5411717de3a689967ffc696375dc9 ******/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", "
Parameters
----------
theList: NCollection_List<IntTools_SurfaceRangeSample>

Return
-------
None

Description
-----------
No available documentation.
") ListRangeOut;
		void ListRangeOut(NCollection_List<IntTools_SurfaceRangeSample> & theList);

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
		/****** md5 signature: 6b5ead97c7c69f8cfd2d7aa9a7d4ac7c ******/
		%feature("compactdefaultargs") SetFrame;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double

Return
-------
None

Description
-----------
Sets the frame area. Used to work with grid points.
") SetFrame;
		void SetFrame(const double theUMin, const double theUMax, const double theVMin, const double theVMax);

		/****** IntTools_SurfaceRangeLocalizeData::SetGridDeflection ******/
		/****** md5 signature: 58352bec7f3c193645ea1d36987b2bbc ******/
		%feature("compactdefaultargs") SetGridDeflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: double

Return
-------
None

Description
-----------
Set the grid deflection.
") SetGridDeflection;
		void SetGridDeflection(const double theDeflection);

		/****** IntTools_SurfaceRangeLocalizeData::SetGridPoint ******/
		/****** md5 signature: 4ae2e23d5e67a50e6ea90f16b01ad3b3 ******/
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
		void SetGridPoint(const int theUIndex, const int theVIndex, const gp_Pnt & thePoint);

		/****** IntTools_SurfaceRangeLocalizeData::SetRangeUGrid ******/
		/****** md5 signature: a653fa73054ca7af8ac58a7227412460 ******/
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
		void SetRangeUGrid(const int theNbUGrid);

		/****** IntTools_SurfaceRangeLocalizeData::SetRangeVGrid ******/
		/****** md5 signature: 65db6b14ccab72bad6850d48fbcebfef ******/
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
		void SetRangeVGrid(const int theNbVGrid);

		/****** IntTools_SurfaceRangeLocalizeData::SetUParam ******/
		/****** md5 signature: 2f18b43e69c4e31a9d7c2c03cf029e70 ******/
		%feature("compactdefaultargs") SetUParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theUParam: double

Return
-------
None

Description
-----------
Set the U parameter of the grid points at that index.
") SetUParam;
		void SetUParam(const int theIndex, const double theUParam);

		/****** IntTools_SurfaceRangeLocalizeData::SetVParam ******/
		/****** md5 signature: 3406d3e217adf5b8a5ec2c69ad0a1fa6 ******/
		%feature("compactdefaultargs") SetVParam;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVParam: double

Return
-------
None

Description
-----------
Set the V parameter of the grid points at that index.
") SetVParam;
		void SetVParam(const int theIndex, const double theVParam);

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
		/****** md5 signature: 90e60f2137e035f0dbcc1681da7d569b ******/
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
		 IntTools_SurfaceRangeSample(const int theIndexU, const int theDepthU, const int theIndexV, const int theDepthV);

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
		/****** md5 signature: 5661d391c77fc0646b327d5cb8f0d025 ******/
		%feature("compactdefaultargs") GetDepthU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetDepthU;
		int GetDepthU();

		/****** IntTools_SurfaceRangeSample::GetDepthV ******/
		/****** md5 signature: a9b35635e568a785223800acdab954e7 ******/
		%feature("compactdefaultargs") GetDepthV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetDepthV;
		int GetDepthV();

		/****** IntTools_SurfaceRangeSample::GetDepths ******/
		/****** md5 signature: 25789c338d56c60e12fe6bc595b39e90 ******/
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
		/****** md5 signature: 6d36e444f7c85a3ff03eb5cc9cbfc92b ******/
		%feature("compactdefaultargs") GetIndexU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetIndexU;
		int GetIndexU();

		/****** IntTools_SurfaceRangeSample::GetIndexV ******/
		/****** md5 signature: c0e5c39e12d95e307502349f98e0b75d ******/
		%feature("compactdefaultargs") GetIndexV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetIndexV;
		int GetIndexV();

		/****** IntTools_SurfaceRangeSample::GetIndexes ******/
		/****** md5 signature: 78c680c2f35992f04e3deb12696a1d83 ******/
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
		/****** md5 signature: d3bd93d03bd02f30fc6c31b36af3f67e ******/
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
		int GetRangeIndexUDeeper(const int theNbSampleU);

		/****** IntTools_SurfaceRangeSample::GetRangeIndexVDeeper ******/
		/****** md5 signature: 0a67a996e4afa6977811e9df3942b48d ******/
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
		int GetRangeIndexVDeeper(const int theNbSampleV);

		/****** IntTools_SurfaceRangeSample::GetRangeU ******/
		/****** md5 signature: e59ebed3a1f9e489b4a66ec30bb4bed7 ******/
		%feature("compactdefaultargs") GetRangeU;
		%feature("autodoc", "
Parameters
----------
theFirstU: double
theLastU: double
theNbSampleU: int

Return
-------
IntTools_Range

Description
-----------
No available documentation.
") GetRangeU;
		IntTools_Range GetRangeU(const double theFirstU, const double theLastU, const int theNbSampleU);

		/****** IntTools_SurfaceRangeSample::GetRangeV ******/
		/****** md5 signature: 2ae863e0a2370f31134d4cd61372702c ******/
		%feature("compactdefaultargs") GetRangeV;
		%feature("autodoc", "
Parameters
----------
theFirstV: double
theLastV: double
theNbSampleV: int

Return
-------
IntTools_Range

Description
-----------
No available documentation.
") GetRangeV;
		IntTools_Range GetRangeV(const double theFirstV, const double theLastV, const int theNbSampleV);

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
		/****** md5 signature: 8257d1a35cb60a7a261ff79ca876a3cf ******/
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
		bool IsEqual(const IntTools_SurfaceRangeSample & Other);

		/****** IntTools_SurfaceRangeSample::SetDepthU ******/
		/****** md5 signature: 4a973069a1dffc1eab7aa7de4144b34b ******/
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
		void SetDepthU(const int theDepthU);

		/****** IntTools_SurfaceRangeSample::SetDepthV ******/
		/****** md5 signature: 7336c47b365dcd49131def0ee75a80a1 ******/
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
		void SetDepthV(const int theDepthV);

		/****** IntTools_SurfaceRangeSample::SetIndexU ******/
		/****** md5 signature: 753f0fc5a40900cdae2fa532602189ad ******/
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
		void SetIndexU(const int theIndexU);

		/****** IntTools_SurfaceRangeSample::SetIndexV ******/
		/****** md5 signature: f6c21f82370a505609fbf13e0c431069 ******/
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
		void SetIndexV(const int theIndexV);

		/****** IntTools_SurfaceRangeSample::SetIndexes ******/
		/****** md5 signature: 9c2699eff3f3e8d40a3285e7fe5ed3f3 ******/
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
		void SetIndexes(const int theIndexU, const int theIndexV);

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
		/****** md5 signature: 8ee19991d321ad2ca8bcaf36c7d39a0d ******/
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
		static bool CheckCurve(const IntTools_Curve & theCurve, Bnd_Box & theBox);

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
		/****** md5 signature: d5b5b214940ceaa89ec8703161c6a5eb ******/
		%feature("compactdefaultargs") ComputeIntRange;
		%feature("autodoc", "
Parameters
----------
theTol1: double
theTol2: double
theAngle: double

Return
-------
double

Description
-----------
Computes the correct Intersection range for Line/Line, Line/Plane and Plane/Plane intersections.
") ComputeIntRange;
		static double ComputeIntRange(const double theTol1, const double theTol2, const double theAngle);

		/****** IntTools_Tools::ComputeTolerance ******/
		/****** md5 signature: 50040b69e08c7881b9e261a40b134f25 ******/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "
Parameters
----------
theCurve3D: Geom_Curve
theCurve2D: Geom2d_Curve
theSurf: Geom_Surface
theFirst: double
theLast: double
theTolRange: double (optional, default to Precision::PConfusion())
theToRunParallel: bool (optional, default to false)

Return
-------
theMaxDist: double
theMaxPar: double

Description
-----------
Computes the max distance between points taken from 3D and 2D curves by the same parameter.
") ComputeTolerance;
		static bool ComputeTolerance(const opencascade::handle<Geom_Curve> & theCurve3D, const opencascade::handle<Geom2d_Curve> & theCurve2D, const opencascade::handle<Geom_Surface> & theSurf, const double theFirst, const double theLast, Standard_Real &OutValue, Standard_Real &OutValue, const double theTolRange = Precision::PConfusion(), const bool theToRunParallel = false);

		/****** IntTools_Tools::ComputeVV ******/
		/****** md5 signature: 15771696ed1e3a034cbefd3336850e5f ******/
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
		static int ComputeVV(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** IntTools_Tools::CurveTolerance ******/
		/****** md5 signature: b7d5549e8c25af820bfced437db08300 ******/
		%feature("compactdefaultargs") CurveTolerance;
		%feature("autodoc", "
Parameters
----------
aC: Geom_Curve
aTolBase: double

Return
-------
double

Description
-----------
Returns adaptive tolerance for given aTolBase if aC is trimmed curve and basis curve is parabola, otherwise returns value of aTolBase.
") CurveTolerance;
		static double CurveTolerance(const opencascade::handle<Geom_Curve> & aC, const double aTolBase);

		/****** IntTools_Tools::HasInternalEdge ******/
		/****** md5 signature: f7753ef76d48ac54829097d2f078bd72 ******/
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
		static bool HasInternalEdge(const TopoDS_Wire & aW);

		/****** IntTools_Tools::IntermediatePoint ******/
		/****** md5 signature: 6de0e62284046529527ea806a88825a5 ******/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "
Parameters
----------
aFirst: double
aLast: double

Return
-------
double

Description
-----------
Returns some value between aFirst and aLast.
") IntermediatePoint;
		static double IntermediatePoint(const double aFirst, const double aLast);

		/****** IntTools_Tools::IsClosed ******/
		/****** md5 signature: 7f9a0c24b3e26ee421ea310112e071fe ******/
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
		static bool IsClosed(const opencascade::handle<Geom_Curve> & aC);

		/****** IntTools_Tools::IsDirsCoinside ******/
		/****** md5 signature: 577039918663cc7d3b42641e07ea02ba ******/
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
		static bool IsDirsCoinside(const gp_Dir & D1, const gp_Dir & D2);

		/****** IntTools_Tools::IsDirsCoinside ******/
		/****** md5 signature: 910dc2d7c15118937fa5572c66d41856 ******/
		%feature("compactdefaultargs") IsDirsCoinside;
		%feature("autodoc", "
Parameters
----------
D1: gp_Dir
D2: gp_Dir
aTol: double

Return
-------
bool

Description
-----------
Returns True if D1 and D2 coincide with given tolerance.
") IsDirsCoinside;
		static bool IsDirsCoinside(const gp_Dir & D1, const gp_Dir & D2, const double aTol);

		/****** IntTools_Tools::IsInRange ******/
		/****** md5 signature: e71c823f834407088bf661d720095814 ******/
		%feature("compactdefaultargs") IsInRange;
		%feature("autodoc", "
Parameters
----------
theRRef: IntTools_Range
theR: IntTools_Range
theTol: double

Return
-------
bool

Description
-----------
Checks if the range <theR> interfere with the range <theRRef>.
") IsInRange;
		static bool IsInRange(const IntTools_Range & theRRef, const IntTools_Range & theR, const double theTol);

		/****** IntTools_Tools::IsMiddlePointsEqual ******/
		/****** md5 signature: 45bd0eb664b710d27a3c391b91ccb5d7 ******/
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
		static bool IsMiddlePointsEqual(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** IntTools_Tools::IsOnPave ******/
		/****** md5 signature: 7af35470b741787097f9ae7bb73bb8bd ******/
		%feature("compactdefaultargs") IsOnPave;
		%feature("autodoc", "
Parameters
----------
theT: double
theRange: IntTools_Range
theTol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsOnPave;
		static bool IsOnPave(const double theT, const IntTools_Range & theRange, const double theTol);

		/****** IntTools_Tools::IsOnPave1 ******/
		/****** md5 signature: 12e63097745fc5acbdf18bd03a573297 ******/
		%feature("compactdefaultargs") IsOnPave1;
		%feature("autodoc", "
Parameters
----------
theT: double
theRange: IntTools_Range
theTol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsOnPave1;
		static bool IsOnPave1(const double theT, const IntTools_Range & theRange, const double theTol);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: 528c60471616c3e6287ad61fbe666c31 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
t: double

Return
-------
bool

Description
-----------
Computes square distance between a point on the edge E corresponded to parameter t and vertices of edge E. Returns True if this distance is less than square tolerance of vertex, otherwise returns false.
") IsVertex;
		static bool IsVertex(const TopoDS_Edge & E, const double t);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: 6a21495a669435f81170ab674016ddec ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
t: double

Return
-------
bool

Description
-----------
Returns True if square distance between vertex V and a point on the edge E corresponded to parameter t is less than square tolerance of V.
") IsVertex;
		static bool IsVertex(const TopoDS_Edge & E, const TopoDS_Vertex & V, const double t);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: 79dd47d8c5a185f56aff88a6223875d0 ******/
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
		static bool IsVertex(const IntTools_CommonPrt & aCmnPrt);

		/****** IntTools_Tools::IsVertex ******/
		/****** md5 signature: b12fff227c6acef16e0bc0649bfe8309 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
aP: gp_Pnt
aTolPV: double
aV: TopoDS_Vertex

Return
-------
bool

Description
-----------
Returns True if the distance between point aP and vertex aV is less or equal to sum of aTolPV and vertex tolerance, otherwise returns False.
") IsVertex;
		static bool IsVertex(const gp_Pnt & aP, const double aTolPV, const TopoDS_Vertex & aV);

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
		/****** md5 signature: f3d4c09cccf968093237a04f3260bce2 ******/
		%feature("compactdefaultargs") RejectLines;
		%feature("autodoc", "
Parameters
----------
aSIn: NCollection_Sequence<IntTools_Curve>
aSOut: NCollection_Sequence<IntTools_Curve>

Return
-------
None

Description
-----------
Puts curves from aSIn to aSOut except those curves that are coincide with first curve from aSIn.
") RejectLines;
		static void RejectLines(const NCollection_Sequence<IntTools_Curve> & aSIn, NCollection_Sequence<IntTools_Curve> & aSOut);

		/****** IntTools_Tools::SegPln ******/
		/****** md5 signature: 47dfb28b77bd7f30813fba489c044d02 ******/
		%feature("compactdefaultargs") SegPln;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
theTLin1: double
theTLin2: double
theTolLin: double
thePln: gp_Pln
theTolPln: double
theP: gp_Pnt

Return
-------
theT: double
theTolP: double
theTmin: double
theTmax: double

Description
-----------
No available documentation.
") SegPln;
		static int SegPln(const gp_Lin & theLin, const double theTLin1, const double theTLin2, const double theTolLin, const gp_Pln & thePln, const double theTolPln, gp_Pnt & theP, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntTools_Tools::SplitCurve ******/
		/****** md5 signature: d4b9663139293d192b51c3bb4e8233b0 ******/
		%feature("compactdefaultargs") SplitCurve;
		%feature("autodoc", "
Parameters
----------
aC: IntTools_Curve
aS: NCollection_Sequence<IntTools_Curve>

Return
-------
int

Description
-----------
Split aC by average parameter if aC is closed in 3D. Returns positive value if splitting has been done, otherwise returns zero.
") SplitCurve;
		static int SplitCurve(const IntTools_Curve & aC, NCollection_Sequence<IntTools_Curve> & aS);

		/****** IntTools_Tools::VertexParameter ******/
		/****** md5 signature: 6bf75981b5cc50517a25466072ca0d26 ******/
		%feature("compactdefaultargs") VertexParameter;
		%feature("autodoc", "
Parameters
----------
theCP: IntTools_CommonPrt

Return
-------
theT: double

Description
-----------
No available documentation.
") VertexParameter;
		static void VertexParameter(const IntTools_CommonPrt & theCP, Standard_Real &OutValue);

		/****** IntTools_Tools::VertexParameters ******/
		/****** md5 signature: a835e6e55e9d50078c540058d7c41a87 ******/
		%feature("compactdefaultargs") VertexParameters;
		%feature("autodoc", "
Parameters
----------
theCP: IntTools_CommonPrt

Return
-------
theT1: double
theT2: double

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
		/****** md5 signature: 1fa105aa64ba9bca92e753c7f09817c9 ******/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ComputeSamplePoints;
		void ComputeSamplePoints();

		/****** IntTools_TopolTool::Initialize ******/
		/****** md5 signature: 5f193f51f8e20831a5bbcf374ee967ad ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redefined empty initializer //! Warning: Raises the exception NotImplemented.
") Initialize;
		void Initialize();

		/****** IntTools_TopolTool::Initialize ******/
		/****** md5 signature: 98f7cdc3259a197e7d76577a6c737f39 ******/
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
		void Initialize(const opencascade::handle<Adaptor3d_Surface> & theSurface);

		/****** IntTools_TopolTool::NbSamples ******/
		/****** md5 signature: 46d1b96e57bb8811cdba7e702a282a06 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the sample-points for the intersections algorithms.
") NbSamples;
		int NbSamples();

		/****** IntTools_TopolTool::NbSamplesU ******/
		/****** md5 signature: 35d7ce0d38afcaacbe9a2e5dc3334537 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the sample-points for the intersections algorithms.
") NbSamplesU;
		int NbSamplesU();

		/****** IntTools_TopolTool::NbSamplesV ******/
		/****** md5 signature: 480adcf30874bc7740b0cf4cb0985056 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the sample-points for the intersections algorithms.
") NbSamplesV;
		int NbSamplesV();

		/****** IntTools_TopolTool::SamplePnts ******/
		/****** md5 signature: 1029b6d7f81fed65dc0004bdccb155ca ******/
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "
Parameters
----------
theDefl: double
theNUmin: int
theNVmin: int

Return
-------
None

Description
-----------
compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces. For other surfaces algorithm is the same as in method ComputeSamplePoints(), but only fill arrays of U and V sample parameters; theDefl is a required deflection theNUmin, theNVmin are minimal nb points for U and V.
") SamplePnts;
		void SamplePnts(const double theDefl, const int theNUmin, const int theNVmin);

		/****** IntTools_TopolTool::SamplePoint ******/
		/****** md5 signature: 96359df3b40ddced07e0cdd815611111 ******/
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
		void SamplePoint(const int Index, gp_Pnt2d & P2d, gp_Pnt & P3d);

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
		/****** md5 signature: 9052d268fd0f25e5456b3d2bcac38e6e ******/
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
theTol: double
theNewLines: IntPatch_Line
&: IntTools_Context

Return
-------
bool

Description
-----------
No available documentation.
") DecompositionOfWLine;
		static bool DecompositionOfWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<GeomAdaptor_Surface> & theSurface1, const opencascade::handle<GeomAdaptor_Surface> & theSurface2, const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const GeomInt_LineConstructor & theLConstructor, const bool theAvoidLConstructor, const double theTol, NCollection_Sequence<opencascade::handle<IntPatch_Line>> & theNewLines, const opencascade::handle<IntTools_Context > &);

		/****** IntTools_WLineTool::NotUseSurfacesForApprox ******/
		/****** md5 signature: bb55cc6c1a25e98ff2aa465392389b8b ******/
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
		static bool NotUseSurfacesForApprox(const TopoDS_Face & aF1, const TopoDS_Face & aF2, const opencascade::handle<IntPatch_WLine> & WL, const int ifprm, const int ilprm);

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
		/****** md5 signature: c269ebee730155d8eeb6da424148143c ******/
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
		 IntTools_CurveRangeSample(const int theIndex);

		/****** IntTools_CurveRangeSample::GetRange ******/
		/****** md5 signature: c420161de05b9730ac3365d09565c046 ******/
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double
theNbSample: int

Return
-------
IntTools_Range

Description
-----------
No available documentation.
") GetRange;
		IntTools_Range GetRange(const double theFirst, const double theLast, const int theNbSample);

		/****** IntTools_CurveRangeSample::GetRangeIndex ******/
		/****** md5 signature: e03dff10a3a3c787f2107874d28fb296 ******/
		%feature("compactdefaultargs") GetRangeIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetRangeIndex;
		int GetRangeIndex();

		/****** IntTools_CurveRangeSample::GetRangeIndexDeeper ******/
		/****** md5 signature: 93f3b6a1db211d44adc75e4b35760b0e ******/
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
		int GetRangeIndexDeeper(const int theNbSample);

		/****** IntTools_CurveRangeSample::IsEqual ******/
		/****** md5 signature: d1704808a7b4f92c053a7054895ed8c0 ******/
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
		bool IsEqual(const IntTools_CurveRangeSample & Other);

		/****** IntTools_CurveRangeSample::SetRangeIndex ******/
		/****** md5 signature: b016aba3f55cd193855c93ba853fad04 ******/
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
		void SetRangeIndex(const int theIndex);


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
