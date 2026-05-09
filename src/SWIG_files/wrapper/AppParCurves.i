/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define APPPARCURVESDOCSTRING
"AppParCurves module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_appparcurves.html"
%enddef
%module (package="OCC.Core", docstring=APPPARCURVESDOCSTRING) AppParCurves


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
#include<AppParCurves_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import TColgp.i
%import gp.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum AppParCurves_Constraint {
	AppParCurves_NoConstraint = 0,
	AppParCurves_PassPoint = 1,
	AppParCurves_TangencyPoint = 2,
	AppParCurves_CurvaturePoint = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class AppParCurves_Constraint(IntEnum):
	AppParCurves_NoConstraint = 0
	AppParCurves_PassPoint = 1
	AppParCurves_TangencyPoint = 2
	AppParCurves_CurvaturePoint = 3
AppParCurves_NoConstraint = AppParCurves_Constraint.AppParCurves_NoConstraint
AppParCurves_PassPoint = AppParCurves_Constraint.AppParCurves_PassPoint
AppParCurves_TangencyPoint = AppParCurves_Constraint.AppParCurves_TangencyPoint
AppParCurves_CurvaturePoint = AppParCurves_Constraint.AppParCurves_CurvaturePoint
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(AppParCurves_Array1OfConstraintCouple) NCollection_Array1<AppParCurves_ConstraintCouple>;
Array1ExtendIter(AppParCurves_ConstraintCouple)

%template(AppParCurves_Array1OfMultiBSpCurve) NCollection_Array1<AppParCurves_MultiBSpCurve>;
Array1ExtendIter(AppParCurves_MultiBSpCurve)

%template(AppParCurves_Array1OfMultiCurve) NCollection_Array1<AppParCurves_MultiCurve>;
Array1ExtendIter(AppParCurves_MultiCurve)

%template(AppParCurves_Array1OfMultiPoint) NCollection_Array1<AppParCurves_MultiPoint>;
Array1ExtendIter(AppParCurves_MultiPoint)

%template(AppParCurves_SequenceOfMultiBSpCurve) NCollection_Sequence<AppParCurves_MultiBSpCurve>;

%extend NCollection_Sequence<AppParCurves_MultiBSpCurve> {
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
%template(AppParCurves_SequenceOfMultiCurve) NCollection_Sequence<AppParCurves_MultiCurve>;

%extend NCollection_Sequence<AppParCurves_MultiCurve> {
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
typedef NCollection_Array1<AppParCurves_ConstraintCouple> AppParCurves_Array1OfConstraintCouple;
typedef NCollection_Array1<AppParCurves_MultiBSpCurve> AppParCurves_Array1OfMultiBSpCurve;
typedef NCollection_Array1<AppParCurves_MultiCurve> AppParCurves_Array1OfMultiCurve;
typedef NCollection_Array1<AppParCurves_MultiPoint> AppParCurves_Array1OfMultiPoint;
typedef NCollection_HArray1<AppParCurves_ConstraintCouple> AppParCurves_HArray1OfConstraintCouple;
typedef NCollection_HArray1<AppParCurves_MultiBSpCurve> AppParCurves_HArray1OfMultiBSpCurve;
typedef NCollection_HArray1<AppParCurves_MultiCurve> AppParCurves_HArray1OfMultiCurve;
typedef NCollection_HArray1<AppParCurves_MultiPoint> AppParCurves_HArray1OfMultiPoint;
typedef NCollection_Sequence<AppParCurves_MultiBSpCurve> AppParCurves_SequenceOfMultiBSpCurve;
typedef NCollection_Sequence<AppParCurves_MultiCurve> AppParCurves_SequenceOfMultiCurve;
/* end typedefs declaration */

/*********************
* class AppParCurves *
*********************/
%rename(appparcurves) AppParCurves;
class AppParCurves {
	public:
		/****** AppParCurves::Bernstein ******/
		/****** md5 signature: bd085c42b67d954f7cf0ab7c54d27dd2 ******/
		%feature("compactdefaultargs") Bernstein;
		%feature("autodoc", "
Parameters
----------
NbPoles: int
U: math_Vector
A: math_Matrix
DA: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Bernstein;
		static void Bernstein(const int NbPoles, const math_Vector & U, math_Matrix & A, math_Matrix & DA);

		/****** AppParCurves::BernsteinMatrix ******/
		/****** md5 signature: 810d72adc58cdb00738beccb88575d52 ******/
		%feature("compactdefaultargs") BernsteinMatrix;
		%feature("autodoc", "
Parameters
----------
NbPoles: int
U: math_Vector
A: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") BernsteinMatrix;
		static void BernsteinMatrix(const int NbPoles, const math_Vector & U, math_Matrix & A);

		/****** AppParCurves::SecondDerivativeBernstein ******/
		/****** md5 signature: 888c8ad2ee1c1e41050ab485647514b3 ******/
		%feature("compactdefaultargs") SecondDerivativeBernstein;
		%feature("autodoc", "
Parameters
----------
U: double
DDA: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") SecondDerivativeBernstein;
		static void SecondDerivativeBernstein(const double U, math_Vector & DDA);

		/****** AppParCurves::SplineFunction ******/
		/****** md5 signature: b403f36f15b022824d1ac3d1e942e27e ******/
		%feature("compactdefaultargs") SplineFunction;
		%feature("autodoc", "
Parameters
----------
NbPoles: int
Degree: int
Parameters: math_Vector
FlatKnots: math_Vector
A: math_Matrix
DA: math_Matrix
Index: math_IntegerVector

Return
-------
None

Description
-----------
No available documentation.
") SplineFunction;
		static void SplineFunction(const int NbPoles, const int Degree, const math_Vector & Parameters, const math_Vector & FlatKnots, math_Matrix & A, math_Matrix & DA, math_IntegerVector & Index);

};


%extend AppParCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class AppParCurves_ConstraintCouple *
**************************************/
class AppParCurves_ConstraintCouple {
	public:
		/****** AppParCurves_ConstraintCouple::AppParCurves_ConstraintCouple ******/
		/****** md5 signature: 2d0beb66a2c21dcdf2fbd5460216f59a ******/
		%feature("compactdefaultargs") AppParCurves_ConstraintCouple;
		%feature("autodoc", "Return
-------
None

Description
-----------
returns an indefinite ConstraintCouple.
") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple();

		/****** AppParCurves_ConstraintCouple::AppParCurves_ConstraintCouple ******/
		/****** md5 signature: a0c910e54c736eef5ed24d4ed970fcc1 ******/
		%feature("compactdefaultargs") AppParCurves_ConstraintCouple;
		%feature("autodoc", "
Parameters
----------
TheIndex: int
Cons: AppParCurves_Constraint

Return
-------
None

Description
-----------
Create a couple the object <Index> will have the constraint <Cons>.
") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple(const int TheIndex, const AppParCurves_Constraint Cons);

		/****** AppParCurves_ConstraintCouple::Constraint ******/
		/****** md5 signature: b7676d3a1231c229c21b4d44c5eeebc6 ******/
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "Return
-------
AppParCurves_Constraint

Description
-----------
returns the constraint of the object.
") Constraint;
		AppParCurves_Constraint Constraint();

		/****** AppParCurves_ConstraintCouple::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the index of the constraint object.
") Index;
		int Index();

		/****** AppParCurves_ConstraintCouple::SetConstraint ******/
		/****** md5 signature: 5938458484f978c0b92a6c2a2d7c7815 ******/
		%feature("compactdefaultargs") SetConstraint;
		%feature("autodoc", "
Parameters
----------
Cons: AppParCurves_Constraint

Return
-------
None

Description
-----------
Changes the constraint of the object.
") SetConstraint;
		void SetConstraint(const AppParCurves_Constraint Cons);

		/****** AppParCurves_ConstraintCouple::SetIndex ******/
		/****** md5 signature: 21592ec6eaa1cb4fc2285544b375c931 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
TheIndex: int

Return
-------
None

Description
-----------
Changes the index of the constraint object.
") SetIndex;
		void SetIndex(const int TheIndex);

};


%extend AppParCurves_ConstraintCouple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class AppParCurves_MultiCurve *
********************************/
class AppParCurves_MultiCurve {
	public:
		/****** AppParCurves_MultiCurve::AppParCurves_MultiCurve ******/
		/****** md5 signature: c99f496a7f9803f7bae2a1b9eb0e5c95 ******/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
returns an indefinite MultiCurve.
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve();

		/****** AppParCurves_MultiCurve::AppParCurves_MultiCurve ******/
		/****** md5 signature: 34fe4b1bdbfcf0f428a660a39bec2942 ******/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "
Parameters
----------
NbPol: int

Return
-------
None

Description
-----------
creates a MultiCurve, describing Bezier curves all containing the same number of MultiPoint. An exception is raised if Degree < 0.
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve(const int NbPol);

		/****** AppParCurves_MultiCurve::AppParCurves_MultiCurve ******/
		/****** md5 signature: 4292fe5d41ed24bc78c6570ece6bc1ad ******/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "
Parameters
----------
tabMU: NCollection_Array1<AppParCurves_MultiPoint>

Return
-------
None

Description
-----------
creates a MultiCurve, describing Bezier curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve(const NCollection_Array1<AppParCurves_MultiPoint> & tabMU);

		/****** AppParCurves_MultiCurve::Curve ******/
		/****** md5 signature: c6d3175989a820e76bf6db8945a78358 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
TabPnt: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
returns the Pole array of the curve of range CuIndex. An exception is raised if the dimension of the curve is 2d.
") Curve;
		void Curve(const int CuIndex, TColgp_Array1OfPnt & TabPnt);

		/****** AppParCurves_MultiCurve::Curve ******/
		/****** md5 signature: 1beb0674d6e939e98bf2ba3c0db10db9 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
TabPnt: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
returns the Pole array of the curve of range CuIndex. An exception is raised if the dimension of the curve is 3d.
") Curve;
		void Curve(const int CuIndex, TColgp_Array1OfPnt2d & TabPnt);

		/****** AppParCurves_MultiCurve::D1 ******/
		/****** md5 signature: 41bb28afcd670f3d68e9f44dcb232c2e ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") D1;
		virtual void D1(const int CuIndex, const double U, gp_Pnt & Pt, gp_Vec & V1);

		/****** AppParCurves_MultiCurve::D1 ******/
		/****** md5 signature: dc7e2ad4da78b3e2a21c864c478c908f ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") D1;
		virtual void D1(const int CuIndex, const double U, gp_Pnt2d & Pt, gp_Vec2d & V1);

		/****** AppParCurves_MultiCurve::D2 ******/
		/****** md5 signature: b7d645b9841c04fbe2423d1d9b133bd2 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") D2;
		virtual void D2(const int CuIndex, const double U, gp_Pnt & Pt, gp_Vec & V1, gp_Vec & V2);

		/****** AppParCurves_MultiCurve::D2 ******/
		/****** md5 signature: bb373a4b28f65b2442491e5162139ea5 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") D2;
		virtual void D2(const int CuIndex, const double U, gp_Pnt2d & Pt, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** AppParCurves_MultiCurve::Degree ******/
		/****** md5 signature: 788d639566905aeb8417180053be0d13 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the degree of the curves.
") Degree;
		virtual int Degree();

		/****** AppParCurves_MultiCurve::Dimension ******/
		/****** md5 signature: e0d3ab93a17bc4a5598463896b186303 ******/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "
Parameters
----------
CuIndex: int

Return
-------
int

Description
-----------
returns the dimension of the CuIndex curve. An exception is raised if CuIndex<0 or CuIndex>NbCurves.
") Dimension;
		int Dimension(const int CuIndex);

		/****** AppParCurves_MultiCurve::Dump ******/
		/****** md5 signature: 3285fe47a669df0eece9c96593dad879 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		virtual void Dump(std::ostream &OutValue);

		/****** AppParCurves_MultiCurve::NbCurves ******/
		/****** md5 signature: 99661be16aa6b87a1ba6043e7f8f9943 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves resulting from the approximation of a MultiLine.
") NbCurves;
		int NbCurves();

		/****** AppParCurves_MultiCurve::NbPoles ******/
		/****** md5 signature: bfe8e3100f3c4e3ffe8aae529d870eee ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles on curves resulting from the approximation of a MultiLine.
") NbPoles;
		virtual int NbPoles();

		/****** AppParCurves_MultiCurve::Pole ******/
		/****** md5 signature: c99d4c53f9273b74cda443c74e270817 ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
Nieme: int

Return
-------
gp_Pnt

Description
-----------
returns the Nieme pole of the CuIndex curve. the curve must be a 3D curve.
") Pole;
		const gp_Pnt Pole(const int CuIndex, const int Nieme);

		/****** AppParCurves_MultiCurve::Pole2d ******/
		/****** md5 signature: 9e0fb8b648dfd8a58e6d4ac157860c47 ******/
		%feature("compactdefaultargs") Pole2d;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
Nieme: int

Return
-------
gp_Pnt2d

Description
-----------
returns the Nieme pole of the CuIndex curve. the curve must be a 2D curve.
") Pole2d;
		const gp_Pnt2d Pole2d(const int CuIndex, const int Nieme);

		/****** AppParCurves_MultiCurve::SetNbPoles ******/
		/****** md5 signature: c7a3676a6e908e3f1b8d182b4825ba01 ******/
		%feature("compactdefaultargs") SetNbPoles;
		%feature("autodoc", "
Parameters
----------
nbPoles: int

Return
-------
None

Description
-----------
The number of poles of the MultiCurve will be set to <nbPoles>.
") SetNbPoles;
		void SetNbPoles(const int nbPoles);

		/****** AppParCurves_MultiCurve::SetValue ******/
		/****** md5 signature: 68e0febf2f5eb6bcb0dd4e4ccc43dbf9 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Index: int
MPoint: AppParCurves_MultiPoint

Return
-------
None

Description
-----------
sets the MultiPoint of range Index to the value <MPoint>. An exception is raised if Index <0 or Index >NbMPoint.
") SetValue;
		void SetValue(const int Index, const AppParCurves_MultiPoint & MPoint);

		/****** AppParCurves_MultiCurve::Transform ******/
		/****** md5 signature: 1070e28466dd050d9c549a1bd0990bc5 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: double
dx: double
y: double
dy: double
z: double
dz: double

Return
-------
None

Description
-----------
Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz.
") Transform;
		void Transform(const int CuIndex, const double x, const double dx, const double y, const double dy, const double z, const double dz);

		/****** AppParCurves_MultiCurve::Transform2d ******/
		/****** md5 signature: 89d74c06dba05150fea9d75ce6cda274 ******/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: double
dx: double
y: double
dy: double

Return
-------
None

Description
-----------
Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.
") Transform2d;
		void Transform2d(const int CuIndex, const double x, const double dx, const double y, const double dy);

		/****** AppParCurves_MultiCurve::Value ******/
		/****** md5 signature: 0736bf6ce106193b35de147b7ca82231 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
AppParCurves_MultiPoint

Description
-----------
returns the Index MultiPoint. An exception is raised if Index <0 or Index >Degree+1.
") Value;
		AppParCurves_MultiPoint Value(const int Index);

		/****** AppParCurves_MultiCurve::Value ******/
		/****** md5 signature: 76a07ea49f69323fc95ba065a606953c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") Value;
		virtual void Value(const int CuIndex, const double U, gp_Pnt & Pt);

		/****** AppParCurves_MultiCurve::Value ******/
		/****** md5 signature: db5f3fd63c2fd23701d7bdbe8ebdd96c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") Value;
		virtual void Value(const int CuIndex, const double U, gp_Pnt2d & Pt);

};


%extend AppParCurves_MultiCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class AppParCurves_MultiPoint *
********************************/
class AppParCurves_MultiPoint {
	public:
		/****** AppParCurves_MultiPoint::AppParCurves_MultiPoint ******/
		/****** md5 signature: bdc6941dcf0660c86661916e3a73590f ******/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an indefinite MultiPoint.
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint();

		/****** AppParCurves_MultiPoint::AppParCurves_MultiPoint ******/
		/****** md5 signature: 231e5d4ae97eb21cd66461d306f6c714 ******/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "
Parameters
----------
NbPoints: int
NbPoints2d: int

Return
-------
None

Description
-----------
constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d. NbPoints is the number of 3D Points. NbPoints2d is the number of 2D Points.
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const int NbPoints, const int NbPoints2d);

		/****** AppParCurves_MultiPoint::AppParCurves_MultiPoint ******/
		/****** md5 signature: 927ef24a3176cb2d8594ca609137a43a ******/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
creates a MultiPoint only composed of 3D points.
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const TColgp_Array1OfPnt & tabP);

		/****** AppParCurves_MultiPoint::AppParCurves_MultiPoint ******/
		/****** md5 signature: 463404773874bbafc5a1c28b0a294e68 ******/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "
Parameters
----------
tabP2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
creates a MultiPoint only composed of 2D points.
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const TColgp_Array1OfPnt2d & tabP2d);

		/****** AppParCurves_MultiPoint::AppParCurves_MultiPoint ******/
		/****** md5 signature: 5c2c6a15a2754a72a88c19476b1f897a ******/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d. NbPoints is the total number of Points.
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d);

		/****** AppParCurves_MultiPoint::Dimension ******/
		/****** md5 signature: c68e191a19d8e35bfa569e68487fd331 ******/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
returns the dimension of the point of range Index. An exception is raised if Index <0 or Index > NbCurves.
") Dimension;
		int Dimension(const int Index);

		/****** AppParCurves_MultiPoint::Dump ******/
		/****** md5 signature: 3285fe47a669df0eece9c96593dad879 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		virtual void Dump(std::ostream &OutValue);

		/****** AppParCurves_MultiPoint::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points of dimension 3D.
") NbPoints;
		int NbPoints();

		/****** AppParCurves_MultiPoint::NbPoints2d ******/
		/****** md5 signature: a9b6b1cd30fccbdac2e529bea8d34ccb ******/
		%feature("compactdefaultargs") NbPoints2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points of dimension 2D.
") NbPoints2d;
		int NbPoints2d();

		/****** AppParCurves_MultiPoint::Point ******/
		/****** md5 signature: eb74c35cb622203c0151813552619b64 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
returns the 3d Point of range Index. An exception is raised if Index < 0 or Index < number of 3d Points.
") Point;
		const gp_Pnt Point(const int Index);

		/****** AppParCurves_MultiPoint::Point2d ******/
		/****** md5 signature: cc247e6e81a94a38fd6eaa509a40ba74 ******/
		%feature("compactdefaultargs") Point2d;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
returns the 2d Point of range Index. An exception is raised if index <= number of 3d Points or Index > total number of Points.
") Point2d;
		const gp_Pnt2d Point2d(const int Index);

		/****** AppParCurves_MultiPoint::SetPoint ******/
		/****** md5 signature: a4972a25b4b42eca1624aa15a6a43ae6 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int
Point: gp_Pnt

Return
-------
None

Description
-----------
the 3d Point of range Index of this MultiPoint is set to <Point>. An exception is raised if Index < 0 or Index > number of 3d Points.
") SetPoint;
		void SetPoint(const int Index, const gp_Pnt & Point);

		/****** AppParCurves_MultiPoint::SetPoint2d ******/
		/****** md5 signature: 2d3fb3fa93bc2b66e18d0a5d287ef387 ******/
		%feature("compactdefaultargs") SetPoint2d;
		%feature("autodoc", "
Parameters
----------
Index: int
Point: gp_Pnt2d

Return
-------
None

Description
-----------
The 2d Point of range Index is set to <Point>. An exception is raised if Index > 3d Points or Index > total number of Points.
") SetPoint2d;
		void SetPoint2d(const int Index, const gp_Pnt2d & Point);

		/****** AppParCurves_MultiPoint::Transform ******/
		/****** md5 signature: 1070e28466dd050d9c549a1bd0990bc5 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: double
dx: double
y: double
dy: double
z: double
dz: double

Return
-------
None

Description
-----------
Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz.
") Transform;
		void Transform(const int CuIndex, const double x, const double dx, const double y, const double dy, const double z, const double dz);

		/****** AppParCurves_MultiPoint::Transform2d ******/
		/****** md5 signature: 89d74c06dba05150fea9d75ce6cda274 ******/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: double
dx: double
y: double
dy: double

Return
-------
None

Description
-----------
Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.
") Transform2d;
		void Transform2d(const int CuIndex, const double x, const double dx, const double y, const double dy);

};


%extend AppParCurves_MultiPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class AppParCurves_MultiBSpCurve *
***********************************/
class AppParCurves_MultiBSpCurve : public AppParCurves_MultiCurve {
	public:
		/****** AppParCurves_MultiBSpCurve::AppParCurves_MultiBSpCurve ******/
		/****** md5 signature: af68efb34081b4614004b429064cf90d ******/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
returns an indefinite MultiBSpCurve.
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve();

		/****** AppParCurves_MultiBSpCurve::AppParCurves_MultiBSpCurve ******/
		/****** md5 signature: 6b0e3f7668cac60d70811ea018fc5bd8 ******/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "
Parameters
----------
NbPol: int

Return
-------
None

Description
-----------
creates a MultiBSpCurve, describing BSpline curves all containing the same number of MultiPoint. An exception is raised if Degree < 0.
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve(const int NbPol);

		/****** AppParCurves_MultiBSpCurve::AppParCurves_MultiBSpCurve ******/
		/****** md5 signature: 06d073cad74051dda0615bde5aa78efb ******/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "
Parameters
----------
tabMU: NCollection_Array1<AppParCurves_MultiPoint>
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
creates a MultiBSpCurve, describing BSpline curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve(const NCollection_Array1<AppParCurves_MultiPoint> & tabMU, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults);

		/****** AppParCurves_MultiBSpCurve::AppParCurves_MultiBSpCurve ******/
		/****** md5 signature: eb4f55e7b79abd4251330cc713b3fddb ******/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "
Parameters
----------
SC: AppParCurves_MultiCurve
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
creates a MultiBSpCurve, describing BSpline curves, taking control points from <SC>.
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve(const AppParCurves_MultiCurve & SC, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults);

		/****** AppParCurves_MultiBSpCurve::D1 ******/
		/****** md5 signature: b59dec3818e2e2dc18df7c71fc834c00 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") D1;
		void D1(const int CuIndex, const double U, gp_Pnt & Pt, gp_Vec & V1);

		/****** AppParCurves_MultiBSpCurve::D1 ******/
		/****** md5 signature: f153bbef656f2a4422f10316212fbb2f ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") D1;
		void D1(const int CuIndex, const double U, gp_Pnt2d & Pt, gp_Vec2d & V1);

		/****** AppParCurves_MultiBSpCurve::D2 ******/
		/****** md5 signature: 4727703b8461c196bd50f2618c175692 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") D2;
		void D2(const int CuIndex, const double U, gp_Pnt & Pt, gp_Vec & V1, gp_Vec & V2);

		/****** AppParCurves_MultiBSpCurve::D2 ******/
		/****** md5 signature: 26692f790a803d8aba298beb2d5b27fb ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") D2;
		void D2(const int CuIndex, const double U, gp_Pnt2d & Pt, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** AppParCurves_MultiBSpCurve::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the degree of the curve(s).
") Degree;
		int Degree();

		/****** AppParCurves_MultiBSpCurve::Dump ******/
		/****** md5 signature: 3c2a1f639f47eaff57a9bcd4d3fb612a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** AppParCurves_MultiBSpCurve::Knots ******/
		/****** md5 signature: 40e5d7863b64333908f7ebce7f29fffe ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns an array of Reals containing the multiplicities of curves resulting from the approximation.
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****** AppParCurves_MultiBSpCurve::Multiplicities ******/
		/****** md5 signature: abbd7cb742db6e8534100ea895e298c9 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
Returns an array of Reals containing the multiplicities of curves resulting from the approximation.
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****** AppParCurves_MultiBSpCurve::SetKnots ******/
		/****** md5 signature: 1675fd8b3bf7b3fc6d33e28caf9a4e61 ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
theKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Knots of the multiBSpCurve are assigned to <theknots>.
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & theKnots);

		/****** AppParCurves_MultiBSpCurve::SetMultiplicities ******/
		/****** md5 signature: e0140fa1aadf739834d0c505bdcfc37f ******/
		%feature("compactdefaultargs") SetMultiplicities;
		%feature("autodoc", "
Parameters
----------
theMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Multiplicities of the multiBSpCurve are assigned to <theMults>.
") SetMultiplicities;
		void SetMultiplicities(const TColStd_Array1OfInteger & theMults);

		/****** AppParCurves_MultiBSpCurve::Value ******/
		/****** md5 signature: b057961f770b5649de9a2c2305a9e239 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") Value;
		void Value(const int CuIndex, const double U, gp_Pnt & Pt);

		/****** AppParCurves_MultiBSpCurve::Value ******/
		/****** md5 signature: dce68c6a4777c9ed3f85eacdeeab4167 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: double
Pt: gp_Pnt2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") Value;
		void Value(const int CuIndex, const double U, gp_Pnt2d & Pt);

};


%extend AppParCurves_MultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class AppParCurves_HArray1OfConstraintCouple : public NCollection_Array1<AppParCurves_ConstraintCouple>, public Standard_Transient {
  public:
    AppParCurves_HArray1OfConstraintCouple(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfConstraintCouple(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<AppParCurves_ConstraintCouple>::value_type& theValue);
    AppParCurves_HArray1OfConstraintCouple(const NCollection_Array1<AppParCurves_ConstraintCouple>& theOther);
    const NCollection_Array1<AppParCurves_ConstraintCouple>& Array1();
    NCollection_Array1<AppParCurves_ConstraintCouple>& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfConstraintCouple)


class AppParCurves_HArray1OfMultiBSpCurve : public NCollection_Array1<AppParCurves_MultiBSpCurve>, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiBSpCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiBSpCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<AppParCurves_MultiBSpCurve>::value_type& theValue);
    AppParCurves_HArray1OfMultiBSpCurve(const NCollection_Array1<AppParCurves_MultiBSpCurve>& theOther);
    const NCollection_Array1<AppParCurves_MultiBSpCurve>& Array1();
    NCollection_Array1<AppParCurves_MultiBSpCurve>& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiBSpCurve)


class AppParCurves_HArray1OfMultiCurve : public NCollection_Array1<AppParCurves_MultiCurve>, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<AppParCurves_MultiCurve>::value_type& theValue);
    AppParCurves_HArray1OfMultiCurve(const NCollection_Array1<AppParCurves_MultiCurve>& theOther);
    const NCollection_Array1<AppParCurves_MultiCurve>& Array1();
    NCollection_Array1<AppParCurves_MultiCurve>& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiCurve)


class AppParCurves_HArray1OfMultiPoint : public NCollection_Array1<AppParCurves_MultiPoint>, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiPoint(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiPoint(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<AppParCurves_MultiPoint>::value_type& theValue);
    AppParCurves_HArray1OfMultiPoint(const NCollection_Array1<AppParCurves_MultiPoint>& theOther);
    const NCollection_Array1<AppParCurves_MultiPoint>& Array1();
    NCollection_Array1<AppParCurves_MultiPoint>& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiPoint)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def appparcurves_Bernstein(*args):
	return appparcurves.Bernstein(*args)

@deprecated
def appparcurves_BernsteinMatrix(*args):
	return appparcurves.BernsteinMatrix(*args)

@deprecated
def appparcurves_SecondDerivativeBernstein(*args):
	return appparcurves.SecondDerivativeBernstein(*args)

@deprecated
def appparcurves_SplineFunction(*args):
	return appparcurves.SplineFunction(*args)

}
