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
%define APPPARCURVESDOCSTRING
"AppParCurves module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_appparcurves.html"
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
%wrap_handle(AppParCurves_HArray1OfConstraintCouple)
%wrap_handle(AppParCurves_HArray1OfMultiBSpCurve)
%wrap_handle(AppParCurves_HArray1OfMultiCurve)
%wrap_handle(AppParCurves_HArray1OfMultiPoint)
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
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AppParCurves_SequenceOfMultiCurve) NCollection_Sequence<AppParCurves_MultiCurve>;

%extend NCollection_Sequence<AppParCurves_MultiCurve> {
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
		/****** md5 signature: 6083f4d506d507e1c27b964d1798261a ******/
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
		static void Bernstein(const Standard_Integer NbPoles, const math_Vector & U, math_Matrix & A, math_Matrix & DA);

		/****** AppParCurves::BernsteinMatrix ******/
		/****** md5 signature: f2f56219e01080af0002f41515715977 ******/
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
		static void BernsteinMatrix(const Standard_Integer NbPoles, const math_Vector & U, math_Matrix & A);

		/****** AppParCurves::SecondDerivativeBernstein ******/
		/****** md5 signature: 1abcd1eb2687613081acd95df365fb86 ******/
		%feature("compactdefaultargs") SecondDerivativeBernstein;
		%feature("autodoc", "
Parameters
----------
U: float
DDA: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") SecondDerivativeBernstein;
		static void SecondDerivativeBernstein(const Standard_Real U, math_Vector & DDA);

		/****** AppParCurves::SplineFunction ******/
		/****** md5 signature: 38ad65037e2df48a984f401be4124915 ******/
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
		static void SplineFunction(const Standard_Integer NbPoles, const Standard_Integer Degree, const math_Vector & Parameters, const math_Vector & FlatKnots, math_Matrix & A, math_Matrix & DA, math_IntegerVector & Index);

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
		/****** md5 signature: 2e04177a83c06c9aa237d2efd07304c1 ******/
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
		 AppParCurves_ConstraintCouple(const Standard_Integer TheIndex, const AppParCurves_Constraint Cons);

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
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the index of the constraint object.
") Index;
		Standard_Integer Index();

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
		/****** md5 signature: 8837cdd415a0f5c290f45964b1b4e33b ******/
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
		void SetIndex(const Standard_Integer TheIndex);

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
		/****** md5 signature: ab53822f8368c830602c9078bee067b6 ******/
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
		 AppParCurves_MultiCurve(const Standard_Integer NbPol);

		/****** AppParCurves_MultiCurve::AppParCurves_MultiCurve ******/
		/****** md5 signature: 70743a4fd5a5bb7db1b0290704f44092 ******/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "
Parameters
----------
tabMU: AppParCurves_Array1OfMultiPoint

Return
-------
None

Description
-----------
creates a MultiCurve, describing Bezier curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve(const AppParCurves_Array1OfMultiPoint & tabMU);

		/****** AppParCurves_MultiCurve::Curve ******/
		/****** md5 signature: 77d76aad156e29d4ac0b74a9677b4fc4 ******/
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
		void Curve(const Standard_Integer CuIndex, TColgp_Array1OfPnt & TabPnt);

		/****** AppParCurves_MultiCurve::Curve ******/
		/****** md5 signature: 0630c6e9c6389a7dc96b7349978e4968 ******/
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
		void Curve(const Standard_Integer CuIndex, TColgp_Array1OfPnt2d & TabPnt);

		/****** AppParCurves_MultiCurve::D1 ******/
		/****** md5 signature: 69608dcd334935ba9947cc6e8407f786 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1);

		/****** AppParCurves_MultiCurve::D1 ******/
		/****** md5 signature: 1f28a5a9cca3a0612c23df38e60e2835 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1);

		/****** AppParCurves_MultiCurve::D2 ******/
		/****** md5 signature: d386ba7a5dc9ea89f545a921999c606a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
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
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1, gp_Vec & V2);

		/****** AppParCurves_MultiCurve::D2 ******/
		/****** md5 signature: 88aceafd06974bd21758462d3d3982c8 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
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
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** AppParCurves_MultiCurve::Degree ******/
		/****** md5 signature: d442d1b77ae7b1ce10d9531914b14be7 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the degree of the curves.
") Degree;
		virtual Standard_Integer Degree();

		/****** AppParCurves_MultiCurve::Dimension ******/
		/****** md5 signature: 233a747292487cfcc269a1edff4efead ******/
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
		Standard_Integer Dimension(const Standard_Integer CuIndex);

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
		/****** md5 signature: f7f6dbd981df076443155a5a87b5c223 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves resulting from the approximation of a MultiLine.
") NbCurves;
		Standard_Integer NbCurves();

		/****** AppParCurves_MultiCurve::NbPoles ******/
		/****** md5 signature: 1b49ced11f88c6092f4e3b2473fe0460 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles on curves resulting from the approximation of a MultiLine.
") NbPoles;
		virtual Standard_Integer NbPoles();

		/****** AppParCurves_MultiCurve::Pole ******/
		/****** md5 signature: 7bb8775e90ed8f03169cae266a7799fe ******/
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
		const gp_Pnt Pole(const Standard_Integer CuIndex, const Standard_Integer Nieme);

		/****** AppParCurves_MultiCurve::Pole2d ******/
		/****** md5 signature: 880b22a4b3330f19044b87412dc9e9d8 ******/
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
		const gp_Pnt2d Pole2d(const Standard_Integer CuIndex, const Standard_Integer Nieme);

		/****** AppParCurves_MultiCurve::SetNbPoles ******/
		/****** md5 signature: f55c5d785771e333d790c81f3fd2756c ******/
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
		void SetNbPoles(const Standard_Integer nbPoles);

		/****** AppParCurves_MultiCurve::SetValue ******/
		/****** md5 signature: c785c64b1d8f4f0cfc1d59599a082232 ******/
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
		void SetValue(const Standard_Integer Index, const AppParCurves_MultiPoint & MPoint);

		/****** AppParCurves_MultiCurve::Transform ******/
		/****** md5 signature: eeafca59c4aa3844b7ef4b2a2000138b ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float
z: float
dz: float

Return
-------
None

Description
-----------
Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz.
") Transform;
		void Transform(const Standard_Integer CuIndex, const Standard_Real x, const Standard_Real dx, const Standard_Real y, const Standard_Real dy, const Standard_Real z, const Standard_Real dz);

		/****** AppParCurves_MultiCurve::Transform2d ******/
		/****** md5 signature: f971a79006ea32dbdba557f63bde3045 ******/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float

Return
-------
None

Description
-----------
Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.
") Transform2d;
		void Transform2d(const Standard_Integer CuIndex, const Standard_Real x, const Standard_Real dx, const Standard_Real y, const Standard_Real dy);

		/****** AppParCurves_MultiCurve::Value ******/
		/****** md5 signature: d01350fa8fbaba6cf60b90df24a52acd ******/
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
		AppParCurves_MultiPoint Value(const Standard_Integer Index);

		/****** AppParCurves_MultiCurve::Value ******/
		/****** md5 signature: 36d681f12c55158bec87d7926565a2ae ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") Value;
		virtual void Value(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt);

		/****** AppParCurves_MultiCurve::Value ******/
		/****** md5 signature: 502a825f28e07eac0d63ead931b327a4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") Value;
		virtual void Value(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt);

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
		/****** md5 signature: f2c4d8495da5191c569ee4cd81862aed ******/
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
		 AppParCurves_MultiPoint(const Standard_Integer NbPoints, const Standard_Integer NbPoints2d);

		/****** AppParCurves_MultiPoint::AppParCurves_MultiPoint ******/
		/****** md5 signature: 098d62ea6d68baf166c4e47892f5582a ******/
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
		/****** md5 signature: c08efd211c7d4211982830578522853e ******/
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
		/****** md5 signature: 6edc620d44780f5e3d5ef9bc7b67f769 ******/
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
		/****** md5 signature: d62b6204616825059e668380c046a413 ******/
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
		Standard_Integer Dimension(const Standard_Integer Index);

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
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points of dimension 3D.
") NbPoints;
		Standard_Integer NbPoints();

		/****** AppParCurves_MultiPoint::NbPoints2d ******/
		/****** md5 signature: 04e861cb3ea7014064e18d2efa74916e ******/
		%feature("compactdefaultargs") NbPoints2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points of dimension 2D.
") NbPoints2d;
		Standard_Integer NbPoints2d();

		/****** AppParCurves_MultiPoint::Point ******/
		/****** md5 signature: ee1d88fa34d027a5da9aa36f1333c940 ******/
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
		const gp_Pnt Point(const Standard_Integer Index);

		/****** AppParCurves_MultiPoint::Point2d ******/
		/****** md5 signature: 63958a48bde67c8c9498c94bf226f0c1 ******/
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
		const gp_Pnt2d Point2d(const Standard_Integer Index);

		/****** AppParCurves_MultiPoint::SetPoint ******/
		/****** md5 signature: eec4edf464bf53e171f2a10ed56a6a90 ******/
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
		void SetPoint(const Standard_Integer Index, const gp_Pnt & Point);

		/****** AppParCurves_MultiPoint::SetPoint2d ******/
		/****** md5 signature: d4ab7252bb9c5fc36d58e13ed8204cd7 ******/
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
		void SetPoint2d(const Standard_Integer Index, const gp_Pnt2d & Point);

		/****** AppParCurves_MultiPoint::Transform ******/
		/****** md5 signature: eeafca59c4aa3844b7ef4b2a2000138b ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float
z: float
dz: float

Return
-------
None

Description
-----------
Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz.
") Transform;
		void Transform(const Standard_Integer CuIndex, const Standard_Real x, const Standard_Real dx, const Standard_Real y, const Standard_Real dy, const Standard_Real z, const Standard_Real dz);

		/****** AppParCurves_MultiPoint::Transform2d ******/
		/****** md5 signature: f971a79006ea32dbdba557f63bde3045 ******/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float

Return
-------
None

Description
-----------
Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.
") Transform2d;
		void Transform2d(const Standard_Integer CuIndex, const Standard_Real x, const Standard_Real dx, const Standard_Real y, const Standard_Real dy);

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
		/****** md5 signature: 17ea5f61b50de55b2f0643399d4bf222 ******/
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
		 AppParCurves_MultiBSpCurve(const Standard_Integer NbPol);

		/****** AppParCurves_MultiBSpCurve::AppParCurves_MultiBSpCurve ******/
		/****** md5 signature: 2e6a299ac2191b7c00835e952bab3994 ******/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "
Parameters
----------
tabMU: AppParCurves_Array1OfMultiPoint
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
creates a MultiBSpCurve, describing BSpline curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve(const AppParCurves_Array1OfMultiPoint & tabMU, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults);

		/****** AppParCurves_MultiBSpCurve::AppParCurves_MultiBSpCurve ******/
		/****** md5 signature: 667077f62ca87194425908092d8f377e ******/
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
		/****** md5 signature: 2dda908a24380d7947dff3bf28b8a69a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1);

		/****** AppParCurves_MultiBSpCurve::D1 ******/
		/****** md5 signature: e791658119b85ed908026873615bf4bb ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1);

		/****** AppParCurves_MultiBSpCurve::D2 ******/
		/****** md5 signature: 41a6c63baa5c44cc4ef2a790cd96d410 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
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
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1, gp_Vec & V2);

		/****** AppParCurves_MultiBSpCurve::D2 ******/
		/****** md5 signature: f788853f472545c49cd0c6d9a312a910 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
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
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** AppParCurves_MultiBSpCurve::Degree ******/
		/****** md5 signature: 2cd53f6fbda0e87c600a87505cc42c0a ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the degree of the curve(s).
") Degree;
		virtual Standard_Integer Degree();

		/****** AppParCurves_MultiBSpCurve::Dump ******/
		/****** md5 signature: b42defe2d7a7208961fa81b225a70479 ******/
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

		/****** AppParCurves_MultiBSpCurve::Knots ******/
		/****** md5 signature: 8001460ab922c7159116eb85f0693b97 ******/
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
		/****** md5 signature: cde561f92fd30b25ca2f1b1b8716c207 ******/
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
		/****** md5 signature: 1207e3ead5948e7dbb692ff666a8c4c6 ******/
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
		/****** md5 signature: 88029c3854006126ceb59c1cf2511cad ******/
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
		/****** md5 signature: cf964c7cfce5da4040dea30275022f53 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
") Value;
		virtual void Value(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt);

		/****** AppParCurves_MultiBSpCurve::Value ******/
		/****** md5 signature: 9728da3ef76ccc862255f1ef1723d43c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d

Return
-------
None

Description
-----------
returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
") Value;
		virtual void Value(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt);

};


%extend AppParCurves_MultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class AppParCurves_HArray1OfConstraintCouple : public AppParCurves_Array1OfConstraintCouple, public Standard_Transient {
  public:
    AppParCurves_HArray1OfConstraintCouple(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfConstraintCouple(const Standard_Integer theLower, const Standard_Integer theUpper, const AppParCurves_Array1OfConstraintCouple::value_type& theValue);
    AppParCurves_HArray1OfConstraintCouple(const AppParCurves_Array1OfConstraintCouple& theOther);
    const AppParCurves_Array1OfConstraintCouple& Array1();
    AppParCurves_Array1OfConstraintCouple& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfConstraintCouple)


class AppParCurves_HArray1OfMultiBSpCurve : public AppParCurves_Array1OfMultiBSpCurve, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiBSpCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiBSpCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const AppParCurves_Array1OfMultiBSpCurve::value_type& theValue);
    AppParCurves_HArray1OfMultiBSpCurve(const AppParCurves_Array1OfMultiBSpCurve& theOther);
    const AppParCurves_Array1OfMultiBSpCurve& Array1();
    AppParCurves_Array1OfMultiBSpCurve& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiBSpCurve)


class AppParCurves_HArray1OfMultiCurve : public AppParCurves_Array1OfMultiCurve, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const AppParCurves_Array1OfMultiCurve::value_type& theValue);
    AppParCurves_HArray1OfMultiCurve(const AppParCurves_Array1OfMultiCurve& theOther);
    const AppParCurves_Array1OfMultiCurve& Array1();
    AppParCurves_Array1OfMultiCurve& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiCurve)


class AppParCurves_HArray1OfMultiPoint : public AppParCurves_Array1OfMultiPoint, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiPoint(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiPoint(const Standard_Integer theLower, const Standard_Integer theUpper, const AppParCurves_Array1OfMultiPoint::value_type& theValue);
    AppParCurves_HArray1OfMultiPoint(const AppParCurves_Array1OfMultiPoint& theOther);
    const AppParCurves_Array1OfMultiPoint& Array1();
    AppParCurves_Array1OfMultiPoint& ChangeArray1();
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
