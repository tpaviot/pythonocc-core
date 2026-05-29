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
%define GEOMPLATEDOCSTRING
"GeomPlate module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomplate.html"
%enddef
%module (package="OCC.Core", docstring=GEOMPLATEDOCSTRING) GeomPlate


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
#include<GeomPlate_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<Geom_module.hxx>
#include<TColStd_module.hxx>
#include<TColGeom2d_module.hxx>
#include<Message_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomLProp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Law_module.hxx>
#include<AdvApp2Var_module.hxx>
#include<GeomAbs_module.hxx>
#include<Plate_module.hxx>
#include<PLib_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import gp.i
%import TColgp.i
%import Geom.i
%import TColStd.i
%import TColGeom2d.i
%import Message.i
%import Geom2d.i
%import GeomLProp.i
%import Adaptor2d.i
%import Law.i
%import AdvApp2Var.i
%import GeomAbs.i
%import Plate.i

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
%wrap_handle(GeomPlate_CurveConstraint)
%wrap_handle(GeomPlate_PointConstraint)
%wrap_handle(GeomPlate_Surface)
/* end handles declaration */

/* templates */
%template(GeomPlate_Array1OfHCurve) NCollection_Array1<opencascade::handle<Adaptor3d_Curve>>;
Array1ExtendIter(opencascade::handle<Adaptor3d_Curve>)

%template(GeomPlate_Array1OfSequenceOfReal) NCollection_Array1<TColStd_SequenceOfReal>;
Array1ExtendIter(TColStd_SequenceOfReal)

%template(GeomPlate_SequenceOfAij) NCollection_Sequence<GeomPlate_Aij>;

%extend NCollection_Sequence<GeomPlate_Aij> {
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
%template(GeomPlate_SequenceOfCurveConstraint) NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>;

%extend NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>> {
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
%template(GeomPlate_SequenceOfPointConstraint) NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>;

%extend NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>> {
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
typedef NCollection_Array1<opencascade::handle<Adaptor3d_Curve>> GeomPlate_Array1OfHCurve;
typedef NCollection_Array1<TColStd_SequenceOfReal> GeomPlate_Array1OfSequenceOfReal;
typedef NCollection_HArray1<opencascade::handle<Adaptor3d_Curve>> GeomPlate_HArray1OfHCurve;
typedef NCollection_HArray1<TColStd_SequenceOfReal> GeomPlate_HArray1OfSequenceOfReal;
typedef NCollection_HSequence<opencascade::handle<GeomPlate_CurveConstraint>> GeomPlate_HSequenceOfCurveConstraint;
typedef NCollection_HSequence<opencascade::handle<GeomPlate_PointConstraint>> GeomPlate_HSequenceOfPointConstraint;
typedef NCollection_Sequence<GeomPlate_Aij> GeomPlate_SequenceOfAij;
typedef NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>> GeomPlate_SequenceOfCurveConstraint;
typedef NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>> GeomPlate_SequenceOfPointConstraint;
/* end typedefs declaration */

/**********************
* class GeomPlate_Aij *
**********************/
class GeomPlate_Aij {
	public:
		/****** GeomPlate_Aij::GeomPlate_Aij ******/
		/****** md5 signature: 37e6f94af22a1cb23f7b568753a691c8 ******/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_Aij;
		 GeomPlate_Aij();

		/****** GeomPlate_Aij::GeomPlate_Aij ******/
		/****** md5 signature: c9e25ceee5568c8b87177aed8b35042a ******/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "
Parameters
----------
anInd1: int
anInd2: int
aVec: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_Aij;
		 GeomPlate_Aij(const int anInd1, const int anInd2, const gp_Vec & aVec);

};


%extend GeomPlate_Aij {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomPlate_BuildAveragePlane *
************************************/
class GeomPlate_BuildAveragePlane {
	public:
		/****** GeomPlate_BuildAveragePlane::GeomPlate_BuildAveragePlane ******/
		/****** md5 signature: a097aae860a9ecb35f3eb4d6e6fe3976 ******/
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "
Parameters
----------
Pts: TColgp_HArray1OfPnt
NbBoundPoints: int
Tol: double
POption: int
NOption: int

Return
-------
None

Description
-----------
Tol is a Tolerance to make the difference between the result plane and the result line. if POption = 1: automatic parametrisation if POption = 2: parametrisation by eigen vectors if NOption = 1: the average plane is the inertial plane. if NOption = 2: the average plane is the plane of max. flux.
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane(const opencascade::handle<TColgp_HArray1OfPnt> & Pts, const int NbBoundPoints, const double Tol, const int POption, const int NOption);

		/****** GeomPlate_BuildAveragePlane::GeomPlate_BuildAveragePlane ******/
		/****** md5 signature: 33b88277166df41462ffc194389f2f50 ******/
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "
Parameters
----------
Normals: TColgp_SequenceOfVec
Pts: TColgp_HArray1OfPnt

Return
-------
None

Description
-----------
Creates the plane from the 'best vector'.
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane(const TColgp_SequenceOfVec & Normals, const opencascade::handle<TColgp_HArray1OfPnt> & Pts);

		/****** GeomPlate_BuildAveragePlane::HalfSpace ******/
		/****** md5 signature: 22ac68b79b90417a670754da15e98531 ******/
		%feature("compactdefaultargs") HalfSpace;
		%feature("autodoc", "
Parameters
----------
NewNormals: TColgp_SequenceOfVec
Normals: TColgp_SequenceOfVec
Bset: NCollection_Sequence<GeomPlate_Aij>
LinTol: double
AngTol: double

Return
-------
bool

Description
-----------
No available documentation.
") HalfSpace;
		static bool HalfSpace(const TColgp_SequenceOfVec & NewNormals, TColgp_SequenceOfVec & Normals, NCollection_Sequence<GeomPlate_Aij> & Bset, const double LinTol, const double AngTol);

		/****** GeomPlate_BuildAveragePlane::IsLine ******/
		/****** md5 signature: 772db688f2c7a31abda4c65348c839f4 ******/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return OK if is a line.
") IsLine;
		bool IsLine();

		/****** GeomPlate_BuildAveragePlane::IsPlane ******/
		/****** md5 signature: 6b609c9da2484955d7088879f7fc94b9 ******/
		%feature("compactdefaultargs") IsPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return OK if is a plane.
") IsPlane;
		bool IsPlane();

		/****** GeomPlate_BuildAveragePlane::Line ******/
		/****** md5 signature: 0527a3e42e1f653976ba08cd7db9b8e0 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
Return a Line when 2 eigenvalues are null.
") Line;
		opencascade::handle<Geom_Line> Line();

		/****** GeomPlate_BuildAveragePlane::MinMaxBox ******/
		/****** md5 signature: 69f282c652c16323c0fdf20996796a34 ******/
		%feature("compactdefaultargs") MinMaxBox;
		%feature("autodoc", "
Parameters
----------

Return
-------
Umin: double
Umax: double
Vmin: double
Vmax: double

Description
-----------
computes the minimal box to include all normal projection points of the initial array on the plane.
") MinMaxBox;
		void MinMaxBox(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomPlate_BuildAveragePlane::Plane ******/
		/****** md5 signature: 5c94d426c8cb0ea718d9147a0f1d68f5 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Return the average Plane.
") Plane;
		opencascade::handle<Geom_Plane> Plane();

};


%extend GeomPlate_BuildAveragePlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomPlate_BuildPlateSurface *
************************************/
class GeomPlate_BuildPlateSurface {
	public:
		/****** GeomPlate_BuildPlateSurface::GeomPlate_BuildPlateSurface ******/
		/****** md5 signature: d1ff1a4a3b22500afa1204a7598ad3a1 ******/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "
Parameters
----------
NPoints: TColStd_HArray1OfInteger
TabCurve: NCollection_HArray1<
Tang: TColStd_HArray1OfInteger
Degree: int
NbIter: int (optional, default to 3)
Tol2d: double (optional, default to 0.00001)
Tol3d: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)
Anisotropie: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructor compatible with the old version with this constructor the constraint are given in a Array of Curve on Surface The array NbPoints contains the number of points for each constraint. The Array Tang contains the order of constraint for each Constraint: The possible values for this order has to be -1 , 0 , 1 , 2 . Order i means constraint Gi. NbIter is the maximum number of iteration to optimise the number of points for resolution Degree is the degree of resolution for Plate Tol2d is the tolerance used to test if two points of different constraint are identical in the parametric space of the initial surface Tol3d is used to test if two identical points in the 2d space are identical in 3d space TolAng is used to compare the angle between normal of two identical points in the 2d space Raises ConstructionError;.
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const opencascade::handle<TColStd_HArray1OfInteger> & NPoints, const opencascade::handle<NCollection_HArray1<opencascade::handle<Adaptor3d_Curve>> > & TabCurve, const opencascade::handle<TColStd_HArray1OfInteger> & Tang, const int Degree, const int NbIter = 3, const double Tol2d = 0.00001, const double Tol3d = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1, const bool Anisotropie = false);

		/****** GeomPlate_BuildPlateSurface::GeomPlate_BuildPlateSurface ******/
		/****** md5 signature: a42b39910535327857714573ee4cd4a5 ******/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Geom_Surface
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 10)
NbIter: int (optional, default to 3)
Tol2d: double (optional, default to 0.00001)
Tol3d: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)
Anisotropie: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const opencascade::handle<Geom_Surface> & Surf, const int Degree = 3, const int NbPtsOnCur = 10, const int NbIter = 3, const double Tol2d = 0.00001, const double Tol3d = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1, const bool Anisotropie = false);

		/****** GeomPlate_BuildPlateSurface::GeomPlate_BuildPlateSurface ******/
		/****** md5 signature: 60db34a8dae2b69a5ef7b62a2f3db98a ******/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 10)
NbIter: int (optional, default to 3)
Tol2d: double (optional, default to 0.00001)
Tol3d: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)
Anisotropie: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the BuildPlateSurface framework for deforming plate surfaces using curve and point constraints. You use the first constructor if you have an initial surface to work with at construction time. If not, you use the second. You can add one later by using the method LoadInitSurface. If no initial surface is loaded, one will automatically be computed. The curve and point constraints will be defined by using the method Add. Before the call to the algorithm, the curve constraints will be transformed into sequences of discrete points. Each curve defined as a constraint will be given the value of NbPtsOnCur as the average number of points on it. Several arguments serve to improve performance of the algorithm. NbIter, for example, expresses the number of iterations allowed and is used to control the duration of computation. To optimize resolution, Degree will have the default value of 3. The surface generated must respect several tolerance values: - 2d tolerance given by Tol2d, with a default value of 0.00001 - 3d tolerance expressed by Tol3d, with a default value of 0.0001 - angular tolerance given by TolAng, with a default value of 0.01, defining the greatest angle allowed between the constraint and the target surface. Exceptions Standard_ConstructionError if NbIter is less than 1 or Degree is less than 3.
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const int Degree = 3, const int NbPtsOnCur = 10, const int NbIter = 3, const double Tol2d = 0.00001, const double Tol3d = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1, const bool Anisotropie = false);

		/****** GeomPlate_BuildPlateSurface::Add ******/
		/****** md5 signature: 38731a3aa718b3fec2b48ae7946c4e8e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Cont: GeomPlate_CurveConstraint

Return
-------
None

Description
-----------
Adds the linear constraint cont.
") Add;
		void Add(const opencascade::handle<GeomPlate_CurveConstraint> & Cont);

		/****** GeomPlate_BuildPlateSurface::Add ******/
		/****** md5 signature: 1d4de1ff59aecdb4597ed3c7a2b94522 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Cont: GeomPlate_PointConstraint

Return
-------
None

Description
-----------
Adds the point constraint cont.
") Add;
		void Add(const opencascade::handle<GeomPlate_PointConstraint> & Cont);

		/****** GeomPlate_BuildPlateSurface::CurveConstraint ******/
		/****** md5 signature: 60600d66576a0443e13c3f2e248fd49e ******/
		%feature("compactdefaultargs") CurveConstraint;
		%feature("autodoc", "
Parameters
----------
order: int

Return
-------
opencascade::handle<GeomPlate_CurveConstraint>

Description
-----------
returns the CurveConstraints of order order.
") CurveConstraint;
		opencascade::handle<GeomPlate_CurveConstraint> CurveConstraint(const int order);

		/****** GeomPlate_BuildPlateSurface::Curves2d ******/
		/****** md5 signature: 4dc5b2a08363f6b4c01565e81b501538 ******/
		%feature("compactdefaultargs") Curves2d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColGeom2d_HArray1OfCurve>

Description
-----------
Extracts the array of curves on the plate surface which correspond to the curve constraints set in Add.
") Curves2d;
		opencascade::handle<TColGeom2d_HArray1OfCurve> Curves2d();

		/****** GeomPlate_BuildPlateSurface::Disc2dContour ******/
		/****** md5 signature: a4f9a4f1fe33f6c2d8482073def73f52 ******/
		%feature("compactdefaultargs") Disc2dContour;
		%feature("autodoc", "
Parameters
----------
nbp: int
Seq2d: TColgp_SequenceOfXY

Return
-------
None

Description
-----------
No available documentation.
") Disc2dContour;
		void Disc2dContour(const int nbp, TColgp_SequenceOfXY & Seq2d);

		/****** GeomPlate_BuildPlateSurface::Disc3dContour ******/
		/****** md5 signature: 9c6933b1a0b021b6c83c17807fcc5e85 ******/
		%feature("compactdefaultargs") Disc3dContour;
		%feature("autodoc", "
Parameters
----------
nbp: int
iordre: int
Seq3d: TColgp_SequenceOfXYZ

Return
-------
None

Description
-----------
No available documentation.
") Disc3dContour;
		void Disc3dContour(const int nbp, const int iordre, TColgp_SequenceOfXYZ & Seq3d);

		/****** GeomPlate_BuildPlateSurface::G0Error ******/
		/****** md5 signature: 26eb7ac7e7e086c9d50aef459fbfc494 ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the max distance between the result and the constraints.
") G0Error;
		double G0Error();

		/****** GeomPlate_BuildPlateSurface::G0Error ******/
		/****** md5 signature: ea82fba658102289e47be6340460e251 ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the max distance between the result and the constraint Index.
") G0Error;
		double G0Error(const int Index);

		/****** GeomPlate_BuildPlateSurface::G1Error ******/
		/****** md5 signature: 08f961c041db3fae562606499fdd288a ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the max angle between the result and the constraints.
") G1Error;
		double G1Error();

		/****** GeomPlate_BuildPlateSurface::G1Error ******/
		/****** md5 signature: 103532f19d83aceac2beb425fa280c25 ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the max angle between the result and the constraint Index.
") G1Error;
		double G1Error(const int Index);

		/****** GeomPlate_BuildPlateSurface::G2Error ******/
		/****** md5 signature: eb154307507c3c72e5cef135c1e59efe ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the max difference of curvature between the result and the constraints.
") G2Error;
		double G2Error();

		/****** GeomPlate_BuildPlateSurface::G2Error ******/
		/****** md5 signature: 3059ba7eb7ff114be17a14733c4b41dc ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the max difference of curvature between the result and the constraint Index.
") G2Error;
		double G2Error(const int Index);

		/****** GeomPlate_BuildPlateSurface::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets all constraints.
") Init;
		void Init();

		/****** GeomPlate_BuildPlateSurface::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests whether computation of the plate has been completed.
") IsDone;
		bool IsDone();

		/****** GeomPlate_BuildPlateSurface::LoadInitSurface ******/
		/****** md5 signature: 242b03f070695dbfa5f639e0217f32a7 ******/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Geom_Surface

Return
-------
None

Description
-----------
Loads the initial Surface.
") LoadInitSurface;
		void LoadInitSurface(const opencascade::handle<Geom_Surface> & Surf);

		/****** GeomPlate_BuildPlateSurface::Order ******/
		/****** md5 signature: b041275bdeb5bbcfdf587cc2112a7014 ******/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns the order of the curves in the array returned by Curves2d. Computation changes this order. Consequently, this method returns the order of the curves prior to computation.
") Order;
		opencascade::handle<TColStd_HArray1OfInteger> Order();

		/****** GeomPlate_BuildPlateSurface::Perform ******/
		/****** md5 signature: d7fed22833997c4a8f7923f6a29bd664 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Calls the algorithm and computes the plate surface using the loaded constraints. If no initial surface is given, the algorithm automatically computes one. Exceptions Standard_RangeError if the value of the constraint is null or if plate is not done.
") Perform;
		void Perform(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** GeomPlate_BuildPlateSurface::PointConstraint ******/
		/****** md5 signature: 81f759819e024ece74ddd8bdf95208a9 ******/
		%feature("compactdefaultargs") PointConstraint;
		%feature("autodoc", "
Parameters
----------
order: int

Return
-------
opencascade::handle<GeomPlate_PointConstraint>

Description
-----------
returns the PointConstraint of order order.
") PointConstraint;
		opencascade::handle<GeomPlate_PointConstraint> PointConstraint(const int order);

		/****** GeomPlate_BuildPlateSurface::Sense ******/
		/****** md5 signature: be10829ed83cd109e05157091fc0433e ******/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Allows you to ensure that the array of curves returned by Curves2d has the correct orientation. Returns the orientation of the curves in the array returned by Curves2d. Computation changes the orientation of these curves. Consequently, this method returns the orientation prior to computation.
") Sense;
		opencascade::handle<TColStd_HArray1OfInteger> Sense();

		/****** GeomPlate_BuildPlateSurface::SetNbBounds ******/
		/****** md5 signature: e6d68a85ff99a90451c41799714f2f64 ******/
		%feature("compactdefaultargs") SetNbBounds;
		%feature("autodoc", "
Parameters
----------
NbBounds: int

Return
-------
None

Description
-----------
No available documentation.
") SetNbBounds;
		void SetNbBounds(const int NbBounds);

		/****** GeomPlate_BuildPlateSurface::SurfInit ******/
		/****** md5 signature: f5f7681588f97bd50595e36576801deb ******/
		%feature("compactdefaultargs") SurfInit;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the initial surface.
") SurfInit;
		opencascade::handle<Geom_Surface> SurfInit();

		/****** GeomPlate_BuildPlateSurface::Surface ******/
		/****** md5 signature: 9a0e3bb81696069d481684cfe7c90d56 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomPlate_Surface>

Description
-----------
Returns the result of the computation. This surface can then be used by GeomPlate_MakeApprox for converting the resulting surface into a BSpline.
") Surface;
		opencascade::handle<GeomPlate_Surface> Surface();

};


%extend GeomPlate_BuildPlateSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomPlate_CurveConstraint *
**********************************/
class GeomPlate_CurveConstraint : public Standard_Transient {
	public:
		/****** GeomPlate_CurveConstraint::GeomPlate_CurveConstraint ******/
		/****** md5 signature: 3ad0c2328e9f3ac99262c01554acfcf7 ******/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes an empty curve constraint object.
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint();

		/****** GeomPlate_CurveConstraint::GeomPlate_CurveConstraint ******/
		/****** md5 signature: 0e22960d208ecc00064eb37c48b0cf19 ******/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "
Parameters
----------
Boundary: Adaptor3d_Curve
Order: int
NPt: int (optional, default to 10)
TolDist: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion. Raises ConstructionError if Order is not -1 , 0, 1, 2.
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint(const opencascade::handle<Adaptor3d_Curve> & Boundary, const int Order, const int NPt = 10, const double TolDist = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1);

		/****** GeomPlate_CurveConstraint::Curve2dOnSurf ******/
		/****** md5 signature: 8c609bb48844258264c3cf92c31ed7f4 ******/
		%feature("compactdefaultargs") Curve2dOnSurf;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns a 2d curve associated the surface resulting of the constraints.
") Curve2dOnSurf;
		opencascade::handle<Geom2d_Curve> Curve2dOnSurf();

		/****** GeomPlate_CurveConstraint::Curve3d ******/
		/****** md5 signature: 2fa5bec7732a5b0addd39b44bb53f0e5 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Curve3d;
		opencascade::handle<Adaptor3d_Curve> Curve3d();

		/****** GeomPlate_CurveConstraint::D0 ******/
		/****** md5 signature: d44fc8b79f74fec79a6c1299c0966002 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const double U, gp_Pnt & P);

		/****** GeomPlate_CurveConstraint::D1 ******/
		/****** md5 signature: 069df515558d8b2024a9378012ea3d49 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** GeomPlate_CurveConstraint::D2 ******/
		/****** md5 signature: 171c956d3643d48093cc77349fb6cb52 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec
V4: gp_Vec
V5: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3, gp_Vec & V4, gp_Vec & V5);

		/****** GeomPlate_CurveConstraint::FirstParameter ******/
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** GeomPlate_CurveConstraint::G0Criterion ******/
		/****** md5 signature: 80ad24301ff8647d06a625a15779b183 ******/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the G0 criterion at the parametric point U on the curve. This is the greatest distance allowed between the constraint and the target surface at U.
") G0Criterion;
		double G0Criterion(const double U);

		/****** GeomPlate_CurveConstraint::G1Criterion ******/
		/****** md5 signature: 0cc276d2dc45f57db58299ddce56f8a6 ******/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the G1 criterion at the parametric point U on the curve. This is the greatest angle allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface.
") G1Criterion;
		double G1Criterion(const double U);

		/****** GeomPlate_CurveConstraint::G2Criterion ******/
		/****** md5 signature: 65dbd355988d60bf0cebfc478f82fd3e ******/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the G2 criterion at the parametric point U on the curve. This is the greatest difference in curvature allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface.
") G2Criterion;
		double G2Criterion(const double U);

		/****** GeomPlate_CurveConstraint::LPropSurf ******/
		/****** md5 signature: b6386d58ad556eba1b2ece4170cff95d ******/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
GeomLProp_SLProps

Description
-----------
No available documentation.
") LPropSurf;
		GeomLProp_SLProps & LPropSurf(const double U);

		/****** GeomPlate_CurveConstraint::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** GeomPlate_CurveConstraint::Length ******/
		/****** md5 signature: afabe704e541a27500507f266f05913c ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Length;
		double Length();

		/****** GeomPlate_CurveConstraint::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points on the curve used as a constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.
") NbPoints;
		int NbPoints();

		/****** GeomPlate_CurveConstraint::Order ******/
		/****** md5 signature: f8203d17ff4236419ff00db5f6c14ffb ******/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the order of constraint, one of G0, G1 or G2.
") Order;
		int Order();

		/****** GeomPlate_CurveConstraint::ProjectedCurve ******/
		/****** md5 signature: 29a2a58b4c1684492940e001f45b28a1 ******/
		%feature("compactdefaultargs") ProjectedCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the projected curve resulting from the normal projection of the curve on the initial surface.
") ProjectedCurve;
		opencascade::handle<Adaptor2d_Curve2d> ProjectedCurve();

		/****** GeomPlate_CurveConstraint::SetCurve2dOnSurf ******/
		/****** md5 signature: e48c08a1c66719832c40503ef697b26b ******/
		%feature("compactdefaultargs") SetCurve2dOnSurf;
		%feature("autodoc", "
Parameters
----------
Curve2d: Geom2d_Curve

Return
-------
None

Description
-----------
loads a 2d curve associated the surface resulting of the constraints.
") SetCurve2dOnSurf;
		void SetCurve2dOnSurf(const opencascade::handle<Geom2d_Curve> & Curve2d);

		/****** GeomPlate_CurveConstraint::SetG0Criterion ******/
		/****** md5 signature: 0e8e4ff031d080d6ac20814bbd223cd8 ******/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "
Parameters
----------
G0Crit: Law_Function

Return
-------
None

Description
-----------
Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface for each point of the constraint. If this criterion is not set, TolDist, the distance tolerance from the constructor, is used.
") SetG0Criterion;
		void SetG0Criterion(const opencascade::handle<Law_Function> & G0Crit);

		/****** GeomPlate_CurveConstraint::SetG1Criterion ******/
		/****** md5 signature: 310e7fd3dd1b246d73364de3e1b1446f ******/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "
Parameters
----------
G1Crit: Law_Function

Return
-------
None

Description
-----------
Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the curve is not on a surface.
") SetG1Criterion;
		void SetG1Criterion(const opencascade::handle<Law_Function> & G1Crit);

		/****** GeomPlate_CurveConstraint::SetG2Criterion ******/
		/****** md5 signature: 6180bde7cf9778e66114e191d1f8289e ******/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "
Parameters
----------
G2Crit: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") SetG2Criterion;
		void SetG2Criterion(const opencascade::handle<Law_Function> & G2Crit);

		/****** GeomPlate_CurveConstraint::SetNbPoints ******/
		/****** md5 signature: 69f5515f042a01f2597a08ab914d8e4f ******/
		%feature("compactdefaultargs") SetNbPoints;
		%feature("autodoc", "
Parameters
----------
NewNb: int

Return
-------
None

Description
-----------
Allows you to set the number of points on the curve constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.
") SetNbPoints;
		void SetNbPoints(const int NewNb);

		/****** GeomPlate_CurveConstraint::SetOrder ******/
		/****** md5 signature: 97cdc887c8ebf08faa34e00ed8a87e34 ******/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "
Parameters
----------
Order: int

Return
-------
None

Description
-----------
Allows you to set the order of continuity required for the constraints: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.
") SetOrder;
		void SetOrder(const int Order);

		/****** GeomPlate_CurveConstraint::SetProjectedCurve ******/
		/****** md5 signature: e8d6ecb964953768953c38e05d56f9a6 ******/
		%feature("compactdefaultargs") SetProjectedCurve;
		%feature("autodoc", "
Parameters
----------
Curve2d: Adaptor2d_Curve2d
TolU: double
TolV: double

Return
-------
None

Description
-----------
loads a 2d curve resulting from the normal projection of the curve on the initial surface.
") SetProjectedCurve;
		void SetProjectedCurve(const opencascade::handle<Adaptor2d_Curve2d> & Curve2d, const double TolU, const double TolV);

};


%make_alias(GeomPlate_CurveConstraint)

%extend GeomPlate_CurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomPlate_MakeApprox *
*****************************/
class GeomPlate_MakeApprox {
	public:
		/****** GeomPlate_MakeApprox::GeomPlate_MakeApprox ******/
		/****** md5 signature: 574ae5da73ae217046cae96bf3feeeb0 ******/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "
Parameters
----------
SurfPlate: GeomPlate_Surface
PlateCrit: AdvApp2Var_Criterion
Tol3d: double
Nbmax: int
dgmax: int
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
EnlargeCoeff: double (optional, default to 1.1)

Return
-------
None

Description
-----------
Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible the criterion CritPlate is satisfied if possible.
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox(const opencascade::handle<GeomPlate_Surface> & SurfPlate, const AdvApp2Var_Criterion & PlateCrit, const double Tol3d, const int Nbmax, const int dgmax, const GeomAbs_Shape Continuity = GeomAbs_C1, const double EnlargeCoeff = 1.1);

		/****** GeomPlate_MakeApprox::GeomPlate_MakeApprox ******/
		/****** md5 signature: 08c991455126af6a31acbfd01541f203 ******/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "
Parameters
----------
SurfPlate: GeomPlate_Surface
Tol3d: double
Nbmax: int
dgmax: int
dmax: double
CritOrder: int (optional, default to 0)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
EnlargeCoeff: double (optional, default to 1.1)

Return
-------
None

Description
-----------
Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible if CritOrder = -1 , no criterion is used if CritOrder = 0 , a PlateG0Criterion is used with max value > 10*dmax if CritOrder = 1 , a PlateG1Criterion is used with max value > 10*dmax WARNING: for CritOrder = 0 or 1, only the constraints points of SurfPlate are used to evaluate the value of the criterion.
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox(const opencascade::handle<GeomPlate_Surface> & SurfPlate, const double Tol3d, const int Nbmax, const int dgmax, const double dmax, const int CritOrder = 0, const GeomAbs_Shape Continuity = GeomAbs_C1, const double EnlargeCoeff = 1.1);

		/****** GeomPlate_MakeApprox::ApproxError ******/
		/****** md5 signature: d4092ff85d6b1b0874b9f0ad4b271da0 ******/
		%feature("compactdefaultargs") ApproxError;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the error in computation of the approximation surface. This is the distance between the entire target BSpline surface and the entire original surface generated by BuildPlateSurface and converted by GeomPlate_Surface.
") ApproxError;
		double ApproxError();

		/****** GeomPlate_MakeApprox::CriterionError ******/
		/****** md5 signature: 2755bd3c0b999c5b08cb27b3507a3db1 ******/
		%feature("compactdefaultargs") CriterionError;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the criterion error in computation of the approximation surface. This is estimated relative to the curve and point constraints only.
") CriterionError;
		double CriterionError();

		/****** GeomPlate_MakeApprox::Surface ******/
		/****** md5 signature: 2f50ef783efd4092d3a11c39580e031f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the BSpline surface extracted from the GeomPlate_MakeApprox object.
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface();

};


%extend GeomPlate_MakeApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomPlate_PlateG0Criterion *
***********************************/
class GeomPlate_PlateG0Criterion : public AdvApp2Var_Criterion {
	public:
		/****** GeomPlate_PlateG0Criterion::GeomPlate_PlateG0Criterion ******/
		/****** md5 signature: 6757547e7925362af764a1ed9fe10cb6 ******/
		%feature("compactdefaultargs") GeomPlate_PlateG0Criterion;
		%feature("autodoc", "
Parameters
----------
Data: TColgp_SequenceOfXY
G0Data: TColgp_SequenceOfXYZ
Maximum: double
Type: AdvApp2Var_CriterionType (optional, default to AdvApp2Var_Absolute)
Repart: AdvApp2Var_CriterionRepartition (optional, default to AdvApp2Var_Regular)

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_PlateG0Criterion;
		 GeomPlate_PlateG0Criterion(const TColgp_SequenceOfXY & Data, const TColgp_SequenceOfXYZ & G0Data, const double Maximum, const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute, const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****** GeomPlate_PlateG0Criterion::IsSatisfied ******/
		/****** md5 signature: 9007958412c11c7e5919879e24b5b219 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch

Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		bool IsSatisfied(const AdvApp2Var_Patch & P);

		/****** GeomPlate_PlateG0Criterion::Value ******/
		/****** md5 signature: 07a4596dc97ec606d5b1c608d825895b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Return
-------
None

Description
-----------
No available documentation.
") Value;
		void Value(AdvApp2Var_Patch & P, const AdvApp2Var_Context & C);

};


%extend GeomPlate_PlateG0Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomPlate_PlateG1Criterion *
***********************************/
class GeomPlate_PlateG1Criterion : public AdvApp2Var_Criterion {
	public:
		/****** GeomPlate_PlateG1Criterion::GeomPlate_PlateG1Criterion ******/
		/****** md5 signature: 317ef3230b09aa8857d91f46d765a8be ******/
		%feature("compactdefaultargs") GeomPlate_PlateG1Criterion;
		%feature("autodoc", "
Parameters
----------
Data: TColgp_SequenceOfXY
G1Data: TColgp_SequenceOfXYZ
Maximum: double
Type: AdvApp2Var_CriterionType (optional, default to AdvApp2Var_Absolute)
Repart: AdvApp2Var_CriterionRepartition (optional, default to AdvApp2Var_Regular)

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_PlateG1Criterion;
		 GeomPlate_PlateG1Criterion(const TColgp_SequenceOfXY & Data, const TColgp_SequenceOfXYZ & G1Data, const double Maximum, const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute, const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****** GeomPlate_PlateG1Criterion::IsSatisfied ******/
		/****** md5 signature: 9007958412c11c7e5919879e24b5b219 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch

Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		bool IsSatisfied(const AdvApp2Var_Patch & P);

		/****** GeomPlate_PlateG1Criterion::Value ******/
		/****** md5 signature: 07a4596dc97ec606d5b1c608d825895b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Return
-------
None

Description
-----------
No available documentation.
") Value;
		void Value(AdvApp2Var_Patch & P, const AdvApp2Var_Context & C);

};


%extend GeomPlate_PlateG1Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomPlate_PointConstraint *
**********************************/
class GeomPlate_PointConstraint : public Standard_Transient {
	public:
		/****** GeomPlate_PointConstraint::GeomPlate_PointConstraint ******/
		/****** md5 signature: d03d58e09793a1453518163c7a24e4a0 ******/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
Order: int
TolDist: double (optional, default to 0.0001)

Return
-------
None

Description
-----------
Constructs a point constraint object defined by Pt, a 3D point Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor, only TolDist is given. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if Order is not 0 or -1.
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint(const gp_Pnt & Pt, const int Order, const double TolDist = 0.0001);

		/****** GeomPlate_PointConstraint::GeomPlate_PointConstraint ******/
		/****** md5 signature: 39faecfb37f349d1c398f443d0b18511 ******/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Surf: Geom_Surface
Order: int
TolDist: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Constructs a point constraint object defined by the intersection point of U and V on the surface Surf. Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor the surface to be generated must respect several tolerance values only: - the distance tolerance TolDist - the angular tolerance TolAng - the curvature tolerance, TolCurv. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface.Creates a punctual constraint.
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint(const double U, const double V, const opencascade::handle<Geom_Surface> & Surf, const int Order, const double TolDist = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1);

		/****** GeomPlate_PointConstraint::D0 ******/
		/****** md5 signature: 08199c5cd3a9368c201379f7960011d9 ******/
		%feature("compactdefaultargs") D0;
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
") D0;
		void D0(gp_Pnt & P);

		/****** GeomPlate_PointConstraint::D1 ******/
		/****** md5 signature: 7efc119e5b1eac12afa3ec547ad82318 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** GeomPlate_PointConstraint::D2 ******/
		/****** md5 signature: 940ebc96acf7815a2cb59cbcd936498e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec
V4: gp_Vec
V5: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3, gp_Vec & V4, gp_Vec & V5);

		/****** GeomPlate_PointConstraint::G0Criterion ******/
		/****** md5 signature: fed75e57270ea58ea07f799f8de731e5 ******/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the G0 criterion. This is the greatest distance allowed between the constraint and the target surface.
") G0Criterion;
		double G0Criterion();

		/****** GeomPlate_PointConstraint::G1Criterion ******/
		/****** md5 signature: 8bc0dba87b5c29fb1b7f470df7cba4df ******/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the G1 criterion. This is the greatest angle allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface.
") G1Criterion;
		double G1Criterion();

		/****** GeomPlate_PointConstraint::G2Criterion ******/
		/****** md5 signature: 4e09f7e14aa79d117980b07dab577612 ******/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the G2 criterion. This is the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface.
") G2Criterion;
		double G2Criterion();

		/****** GeomPlate_PointConstraint::HasPnt2dOnSurf ******/
		/****** md5 signature: c52a113ae2d4e1d0d1e2742e0ad7f9a3 ******/
		%feature("compactdefaultargs") HasPnt2dOnSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPnt2dOnSurf;
		bool HasPnt2dOnSurf();

		/****** GeomPlate_PointConstraint::LPropSurf ******/
		/****** md5 signature: ad4b23341cdf9a128c1f8dc8f59255c5 ******/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "Return
-------
GeomLProp_SLProps

Description
-----------
No available documentation.
") LPropSurf;
		GeomLProp_SLProps & LPropSurf();

		/****** GeomPlate_PointConstraint::Order ******/
		/****** md5 signature: f8203d17ff4236419ff00db5f6c14ffb ******/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the order of constraint: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.
") Order;
		int Order();

		/****** GeomPlate_PointConstraint::Pnt2dOnSurf ******/
		/****** md5 signature: 09c83c1db3d333932aca0c51bbfdeb83 ******/
		%feature("compactdefaultargs") Pnt2dOnSurf;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Pnt2dOnSurf;
		gp_Pnt2d Pnt2dOnSurf();

		/****** GeomPlate_PointConstraint::SetG0Criterion ******/
		/****** md5 signature: fa49b05b61f1586b5779287e7c94e548 ******/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "
Parameters
----------
TolDist: double

Return
-------
None

Description
-----------
Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface. If this criterion is not set, {TolDist, the distance tolerance from the constructor, is used.
") SetG0Criterion;
		void SetG0Criterion(const double TolDist);

		/****** GeomPlate_PointConstraint::SetG1Criterion ******/
		/****** md5 signature: 3d6e9e5090484e360322d0fd20546874 ******/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "
Parameters
----------
TolAng: double

Return
-------
None

Description
-----------
Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface.
") SetG1Criterion;
		void SetG1Criterion(const double TolAng);

		/****** GeomPlate_PointConstraint::SetG2Criterion ******/
		/****** md5 signature: 2b2eb5b6cd6bb3c134c3d7aa2f24c0c3 ******/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "
Parameters
----------
TolCurv: double

Return
-------
None

Description
-----------
Allows you to set the G2 criterion. This is the law defining the greatest difference in curvature allowed between the constraint and the target surface. If this criterion is not set, TolCurv, the curvature tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface.
") SetG2Criterion;
		void SetG2Criterion(const double TolCurv);

		/****** GeomPlate_PointConstraint::SetOrder ******/
		/****** md5 signature: 97cdc887c8ebf08faa34e00ed8a87e34 ******/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "
Parameters
----------
Order: int

Return
-------
None

Description
-----------
No available documentation.
") SetOrder;
		void SetOrder(const int Order);

		/****** GeomPlate_PointConstraint::SetPnt2dOnSurf ******/
		/****** md5 signature: 51fcd360e040f75e6558e21bd6fd66dd ******/
		%feature("compactdefaultargs") SetPnt2dOnSurf;
		%feature("autodoc", "
Parameters
----------
Pnt: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") SetPnt2dOnSurf;
		void SetPnt2dOnSurf(const gp_Pnt2d & Pnt);

};


%make_alias(GeomPlate_PointConstraint)

%extend GeomPlate_PointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomPlate_Surface *
**************************/
class GeomPlate_Surface : public Geom_Surface {
	public:
		/****** GeomPlate_Surface::GeomPlate_Surface ******/
		/****** md5 signature: fcdf26b5ac10741eceb18e95b5b358c3 ******/
		%feature("compactdefaultargs") GeomPlate_Surface;
		%feature("autodoc", "
Parameters
----------
Surfinit: Geom_Surface
Surfinter: Plate_Plate

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_Surface;
		 GeomPlate_Surface(const opencascade::handle<Geom_Surface> & Surfinit, const Plate_Plate & Surfinter);

		/****** GeomPlate_Surface::Bounds ******/
		/****** md5 signature: 7f1a4954e4b71238771f442fdca29c3c ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomPlate_Surface::CallSurfinit ******/
		/****** md5 signature: bffc80d2b69351c87065c51824198abd ******/
		%feature("compactdefaultargs") CallSurfinit;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") CallSurfinit;
		opencascade::handle<Geom_Surface> CallSurfinit();

		/****** GeomPlate_Surface::Constraints ******/
		/****** md5 signature: ff5e211a86e6e4b42f8ad765b95d9b50 ******/
		%feature("compactdefaultargs") Constraints;
		%feature("autodoc", "
Parameters
----------
Seq: TColgp_SequenceOfXY

Return
-------
None

Description
-----------
No available documentation.
") Constraints;
		void Constraints(TColgp_SequenceOfXY & Seq);

		/****** GeomPlate_Surface::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Global Continuity of the surface in direction U and V: C0: only geometric continuity, C1: continuity of the first derivative all along the surface, C2: continuity of the second derivative all along the surface, C3: continuity of the third derivative all along the surface, G1: tangency continuity all along the surface, G2: curvature continuity all along the surface, CN: the order of continuity is infinite. Example: If the surface is C1 in the V parametric direction and C2 in the U parametric direction Shape = C1.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** GeomPlate_Surface::Copy ******/
		/****** md5 signature: 4931da9603d5b3bcede1c1210c5d8c3f ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** GeomPlate_Surface::EvalD0 ******/
		/****** md5 signature: 1046a8f73ae1a8fffe777fdefe071ada ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U,V on the surface. //! Raised only for an 'OffsetSurface' if it is not possible to compute the current point.
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomPlate_Surface::EvalD1 ******/
		/****** md5 signature: c55b624ed921898185694d11b9c5628f ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point P and the first derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C1.
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomPlate_Surface::EvalD2 ******/
		/****** md5 signature: f6a44e7aae3253ecad3ffd20b8d918e4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point P, the first and the second derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomPlate_Surface::EvalD3 ******/
		/****** md5 signature: a71e0c31958103799dbcac00589886e4 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point P, the first,the second and the third derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomPlate_Surface::EvalDN ******/
		/****** md5 signature: 1ef4fac99419b60efd50e8567b76b4d1 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
---Purpose ; Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). //! Raised if the continuity of the surface is not CNu in the U direction or not CNv in the V direction. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomPlate_Surface::IsCNu ******/
		/****** md5 signature: 2f1fcdee848f1e9a21e718a5b5c41401 ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the surface in the U parametric direction. Raised if N < 0.
") IsCNu;
		bool IsCNu(const int N);

		/****** GeomPlate_Surface::IsCNv ******/
		/****** md5 signature: 3b3be48e3062f448d523572dfc48fb76 ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the surface in the V parametric direction. Raised if N < 0.
") IsCNv;
		bool IsCNv(const int N);

		/****** GeomPlate_Surface::IsUClosed ******/
		/****** md5 signature: 91c191879c9b39e0c4f123772c17dbd2 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the surface closed in the parametric direction U ? Returns True if for each parameter V the distance between the point P (UFirst, V) and P (ULast, V) is lower or equal to Resolution from gp. UFirst and ULast are the parametric bounds in the U direction.
") IsUClosed;
		bool IsUClosed();

		/****** GeomPlate_Surface::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied: for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomPlate_Surface::IsVClosed ******/
		/****** md5 signature: b42d07343ce292533f9bd94d419cf3f6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the surface closed in the parametric direction V ? Returns True if for each parameter U the distance between the point P (U, VFirst) and P (U, VLast) is lower or equal to Resolution from gp. VFirst and VLast are the parametric bounds in the V direction.
") IsVClosed;
		bool IsVClosed();

		/****** GeomPlate_Surface::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied: for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomPlate_Surface::ParametricTransformation ******/
		/****** md5 signature: c1b9bb71a922fdd2d9e7566b666caf07 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns an identity transformation //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
") ParametricTransformation;
		gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** GeomPlate_Surface::RealBounds ******/
		/****** md5 signature: a6473c17d484ecfdf19895865d10326c ******/
		%feature("compactdefaultargs") RealBounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
No available documentation.
") RealBounds;
		void RealBounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomPlate_Surface::SetBounds ******/
		/****** md5 signature: d17f7a0970411c84146c4fc4be9a23fe ******/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "
Parameters
----------
Umin: double
Umax: double
Vmin: double
Vmax: double

Return
-------
None

Description
-----------
No available documentation.
") SetBounds;
		void SetBounds(const double Umin, const double Umax, const double Vmin, const double Vmax);

		/****** GeomPlate_Surface::Transform ******/
		/****** md5 signature: 439ee2b24a3348dae5069270ca07eb56 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation of a geometric object. This transformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class Transformation of the package Geom).
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomPlate_Surface::TransformParameters ******/
		/****** md5 signature: 1996c75cd1c0909e83a5582fc61cb9e7 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: double
V: double

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This methods does not change <U> and <V> //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
") TransformParameters;
		void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** GeomPlate_Surface::UIso ******/
		/****** md5 signature: d8a57b487d7cd48cf38f0c957e3249cf ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomPlate_Surface::UPeriod ******/
		/****** md5 signature: 0ac7288e2577dfedb94dacb3d9a60302 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the Uperiod. raises if the surface is not uperiodic.
") UPeriod;
		double UPeriod();

		/****** GeomPlate_Surface::UReverse ******/
		/****** md5 signature: a985506a01d4ef5da425c5f8327a341d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U direction of parametrization of <self>. The bounds of the surface are not modified.
") UReverse;
		void UReverse();

		/****** GeomPlate_Surface::UReversedParameter ******/
		/****** md5 signature: 05e3d33e6c2ca68b5a0e18b9bb568fd7 ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Return the parameter on the Ureversed surface for the point of parameter U on <self>. @code me->UReversed()->Value(me->UReversedParameter(U),V) @endcode is the same point as @code me->Value(U,V) @endcode.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomPlate_Surface::VIso ******/
		/****** md5 signature: 3b15e0839a90a1a188d31a753e205519 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomPlate_Surface::VPeriod ******/
		/****** md5 signature: 59a61c3d75ffd436a26d1e119e233654 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the Vperiod. raises if the surface is not vperiodic.
") VPeriod;
		double VPeriod();

		/****** GeomPlate_Surface::VReverse ******/
		/****** md5 signature: f0b1c2d85d545f70e432fc3c0f035672 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V direction of parametrization of <self>. The bounds of the surface are not modified.
") VReverse;
		void VReverse();

		/****** GeomPlate_Surface::VReversedParameter ******/
		/****** md5 signature: 9f09cbdc0d05c88de49b614a8ac2ef58 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Return the parameter on the Vreversed surface for the point of parameter V on <self>. @code me->VReversed()->Value(U,me->VReversedParameter(V)) @endcode is the same point as @code me->Value(U,V) @endcode.
") VReversedParameter;
		double VReversedParameter(const double V);

};


%make_alias(GeomPlate_Surface)

%extend GeomPlate_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class GeomPlate_HArray1OfHCurve : public NCollection_Array1<opencascade::handle<Adaptor3d_Curve>>, public Standard_Transient {
  public:
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<Adaptor3d_Curve>>::value_type& theValue);
    GeomPlate_HArray1OfHCurve(const NCollection_Array1<opencascade::handle<Adaptor3d_Curve>>& theOther);
    const NCollection_Array1<opencascade::handle<Adaptor3d_Curve>>& Array1();
    NCollection_Array1<opencascade::handle<Adaptor3d_Curve>>& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfHCurve)


class GeomPlate_HArray1OfSequenceOfReal : public NCollection_Array1<TColStd_SequenceOfReal>, public Standard_Transient {
  public:
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TColStd_SequenceOfReal>::value_type& theValue);
    GeomPlate_HArray1OfSequenceOfReal(const NCollection_Array1<TColStd_SequenceOfReal>& theOther);
    const NCollection_Array1<TColStd_SequenceOfReal>& Array1();
    NCollection_Array1<TColStd_SequenceOfReal>& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfSequenceOfReal)

/* harray2 classes */
/* hsequence classes */
class GeomPlate_HSequenceOfCurveConstraint : public NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>, public Standard_Transient {
  public:
    GeomPlate_HSequenceOfCurveConstraint();
    GeomPlate_HSequenceOfCurveConstraint(const NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>& theOther);
    const NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>& theSequence);
    NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>& ChangeSequence();
};
%make_alias(GeomPlate_HSequenceOfCurveConstraint)


class GeomPlate_HSequenceOfPointConstraint : public NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>, public Standard_Transient {
  public:
    GeomPlate_HSequenceOfPointConstraint();
    GeomPlate_HSequenceOfPointConstraint(const NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>& theOther);
    const NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>& theSequence);
    NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>& ChangeSequence();
};
%make_alias(GeomPlate_HSequenceOfPointConstraint)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def GeomPlate_BuildAveragePlane_HalfSpace(*args):
	return GeomPlate_BuildAveragePlane.HalfSpace(*args)

}
