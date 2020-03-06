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
%define APPPARCURVESDOCSTRING
"AppParCurves module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_appparcurves.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {

class AppParCurves_Constraint:
	AppParCurves_NoConstraint = 0
	AppParCurves_PassPoint = 1
	AppParCurves_TangencyPoint = 2
	AppParCurves_CurvaturePoint = 3
};
/* end python proxy for enums */

/* handles */
%wrap_handle(AppParCurves_HArray1OfMultiCurve)
%wrap_handle(AppParCurves_HArray1OfConstraintCouple)
%wrap_handle(AppParCurves_HArray1OfMultiPoint)
%wrap_handle(AppParCurves_HArray1OfMultiBSpCurve)
/* end handles declaration */

/* templates */
%template(AppParCurves_Array1OfConstraintCouple) NCollection_Array1<AppParCurves_ConstraintCouple>;

%extend NCollection_Array1<AppParCurves_ConstraintCouple> {
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
%template(AppParCurves_Array1OfMultiBSpCurve) NCollection_Array1<AppParCurves_MultiBSpCurve>;

%extend NCollection_Array1<AppParCurves_MultiBSpCurve> {
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
%template(AppParCurves_Array1OfMultiCurve) NCollection_Array1<AppParCurves_MultiCurve>;

%extend NCollection_Array1<AppParCurves_MultiCurve> {
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
%template(AppParCurves_Array1OfMultiPoint) NCollection_Array1<AppParCurves_MultiPoint>;

%extend NCollection_Array1<AppParCurves_MultiPoint> {
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
%template(AppParCurves_SequenceOfMultiBSpCurve) NCollection_Sequence<AppParCurves_MultiBSpCurve>;
%template(AppParCurves_SequenceOfMultiCurve) NCollection_Sequence<AppParCurves_MultiCurve>;
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
		/****************** Bernstein ******************/
		%feature("compactdefaultargs") Bernstein;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbPoles: int
U: math_Vector
A: math_Matrix
DA: math_Matrix

Returns
-------
None
") Bernstein;
		static void Bernstein(const Standard_Integer NbPoles, const math_Vector & U, math_Matrix & A, math_Matrix & DA);

		/****************** BernsteinMatrix ******************/
		%feature("compactdefaultargs") BernsteinMatrix;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbPoles: int
U: math_Vector
A: math_Matrix

Returns
-------
None
") BernsteinMatrix;
		static void BernsteinMatrix(const Standard_Integer NbPoles, const math_Vector & U, math_Matrix & A);

		/****************** SecondDerivativeBernstein ******************/
		%feature("compactdefaultargs") SecondDerivativeBernstein;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
DDA: math_Vector

Returns
-------
None
") SecondDerivativeBernstein;
		static void SecondDerivativeBernstein(const Standard_Real U, math_Vector & DDA);

		/****************** SplineFunction ******************/
		%feature("compactdefaultargs") SplineFunction;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbPoles: int
Degree: int
Parameters: math_Vector
FlatKnots: math_Vector
A: math_Matrix
DA: math_Matrix
Index: math_IntegerVector

Returns
-------
None
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
		/****************** AppParCurves_ConstraintCouple ******************/
		%feature("compactdefaultargs") AppParCurves_ConstraintCouple;
		%feature("autodoc", "Returns an indefinite constraintcouple.

Returns
-------
None
") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple();

		/****************** AppParCurves_ConstraintCouple ******************/
		%feature("compactdefaultargs") AppParCurves_ConstraintCouple;
		%feature("autodoc", "Create a couple the object <index> will have the constraint <cons>.

Parameters
----------
TheIndex: int
Cons: AppParCurves_Constraint

Returns
-------
None
") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple(const Standard_Integer TheIndex, const AppParCurves_Constraint Cons);

		/****************** Constraint ******************/
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "Returns the constraint of the object.

Returns
-------
AppParCurves_Constraint
") Constraint;
		AppParCurves_Constraint Constraint();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of the constraint object.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** SetConstraint ******************/
		%feature("compactdefaultargs") SetConstraint;
		%feature("autodoc", "Changes the constraint of the object.

Parameters
----------
Cons: AppParCurves_Constraint

Returns
-------
None
") SetConstraint;
		void SetConstraint(const AppParCurves_Constraint Cons);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Changes the index of the constraint object.

Parameters
----------
TheIndex: int

Returns
-------
None
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
		/****************** AppParCurves_MultiCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "Returns an indefinite multicurve.

Returns
-------
None
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve();

		/****************** AppParCurves_MultiCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "Creates a multicurve, describing bezier curves all containing the same number of multipoint. an exception is raised if degree < 0.

Parameters
----------
NbPol: int

Returns
-------
None
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve(const Standard_Integer NbPol);

		/****************** AppParCurves_MultiCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "Creates a multicurve, describing bezier curves all containing the same number of multipoint. each multipoint must have nbcurves poles.

Parameters
----------
tabMU: AppParCurves_Array1OfMultiPoint

Returns
-------
None
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve(const AppParCurves_Array1OfMultiPoint & tabMU);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the pole array of the curve of range cuindex. an exception is raised if the dimension of the curve is 2d.

Parameters
----------
CuIndex: int
TabPnt: TColgp_Array1OfPnt

Returns
-------
None
") Curve;
		void Curve(const Standard_Integer CuIndex, TColgp_Array1OfPnt & TabPnt);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the pole array of the curve of range cuindex. an exception is raised if the dimension of the curve is 3d.

Parameters
----------
CuIndex: int
TabPnt: TColgp_Array1OfPnt2d

Returns
-------
None
") Curve;
		void Curve(const Standard_Integer CuIndex, TColgp_Array1OfPnt2d & TabPnt);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bezier curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 3d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bezier curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 2d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bezier curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 3d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bezier curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 2d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of the curves.

Returns
-------
int
") Degree;
		virtual Standard_Integer Degree();

		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Returns the dimension of the cuindex curve. an exception is raised if cuindex<0 or cuindex>nbcurves.

Parameters
----------
CuIndex: int

Returns
-------
int
") Dimension;
		Standard_Integer Dimension(const Standard_Integer CuIndex);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns the number of curves resulting from the approximation of a multiline.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles on curves resulting from the approximation of a multiline.

Returns
-------
int
") NbPoles;
		virtual Standard_Integer NbPoles();

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the nieme pole of the cuindex curve. the curve must be a 3d curve.

Parameters
----------
CuIndex: int
Nieme: int

Returns
-------
gp_Pnt
") Pole;
		const gp_Pnt Pole(const Standard_Integer CuIndex, const Standard_Integer Nieme);

		/****************** Pole2d ******************/
		%feature("compactdefaultargs") Pole2d;
		%feature("autodoc", "Returns the nieme pole of the cuindex curve. the curve must be a 2d curve.

Parameters
----------
CuIndex: int
Nieme: int

Returns
-------
gp_Pnt2d
") Pole2d;
		const gp_Pnt2d Pole2d(const Standard_Integer CuIndex, const Standard_Integer Nieme);

		/****************** SetNbPoles ******************/
		%feature("compactdefaultargs") SetNbPoles;
		%feature("autodoc", "The number of poles of the multicurve will be set to <nbpoles>.

Parameters
----------
nbPoles: int

Returns
-------
None
") SetNbPoles;
		void SetNbPoles(const Standard_Integer nbPoles);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the multipoint of range index to the value <mpoint>. an exception is raised if index <0 or index >nbmpoint.

Parameters
----------
Index: int
MPoint: AppParCurves_MultiPoint

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, const AppParCurves_MultiPoint & MPoint);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies a transformation to the curve of range <cuindex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz.

Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float
z: float
dz: float

Returns
-------
None
") Transform;
		void Transform(const Standard_Integer CuIndex, const Standard_Real x, const Standard_Real dx, const Standard_Real y, const Standard_Real dy, const Standard_Real z, const Standard_Real dz);

		/****************** Transform2d ******************/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "Applies a transformation to the curve of range <cuindex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.

Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float

Returns
-------
None
") Transform2d;
		void Transform2d(const Standard_Integer CuIndex, const Standard_Real x, const Standard_Real dx, const Standard_Real y, const Standard_Real dy);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the index multipoint. an exception is raised if index <0 or index >degree+1.

Parameters
----------
Index: int

Returns
-------
AppParCurves_MultiPoint
") Value;
		const AppParCurves_MultiPoint & Value(const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bezier curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 2d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt

Returns
-------
None
") Value;
		virtual void Value(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bezier curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 3d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d

Returns
-------
None
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
		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "Creates an indefinite multipoint.

Returns
-------
None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint();

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "Constructs a set of points used to approximate a multiline. these points can be of 2 or 3 dimensions. points will be initialized with setpoint and setpoint2d. nbpoints is the number of 3d points. nbpoints2d is the number of 2d points.

Parameters
----------
NbPoints: int
NbPoints2d: int

Returns
-------
None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const Standard_Integer NbPoints, const Standard_Integer NbPoints2d);

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "Creates a multipoint only composed of 3d points.

Parameters
----------
tabP: TColgp_Array1OfPnt

Returns
-------
None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const TColgp_Array1OfPnt & tabP);

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "Creates a multipoint only composed of 2d points.

Parameters
----------
tabP2d: TColgp_Array1OfPnt2d

Returns
-------
None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const TColgp_Array1OfPnt2d & tabP2d);

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "Constructs a set of points used to approximate a multiline. these points can be of 2 or 3 dimensions. points will be initialized with setpoint and setpoint2d. nbpoints is the total number of points.

Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d

Returns
-------
None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d);

		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Returns the dimension of the point of range index. an exception is raised if index <0 or index > nbcurves.

Parameters
----------
Index: int

Returns
-------
int
") Dimension;
		Standard_Integer Dimension(const Standard_Integer Index);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of dimension 3d.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbPoints2d ******************/
		%feature("compactdefaultargs") NbPoints2d;
		%feature("autodoc", "Returns the number of points of dimension 2d.

Returns
-------
int
") NbPoints2d;
		Standard_Integer NbPoints2d();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the 3d point of range index. an exception is raised if index < 0 or index < number of 3d points.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point(const Standard_Integer Index);

		/****************** Point2d ******************/
		%feature("compactdefaultargs") Point2d;
		%feature("autodoc", "Returns the 2d point of range index. an exception is raised if index <= number of 3d points or index > total number of points.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point2d;
		const gp_Pnt2d Point2d(const Standard_Integer Index);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "The 3d point of range index of this multipoint is set to <point>. an exception is raised if index < 0 or index > number of 3d points.

Parameters
----------
Index: int
Point: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const Standard_Integer Index, const gp_Pnt & Point);

		/****************** SetPoint2d ******************/
		%feature("compactdefaultargs") SetPoint2d;
		%feature("autodoc", "The 2d point of range index is set to <point>. an exception is raised if index > 3d points or index > total number of points.

Parameters
----------
Index: int
Point: gp_Pnt2d

Returns
-------
None
") SetPoint2d;
		void SetPoint2d(const Standard_Integer Index, const gp_Pnt2d & Point);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies a transformation to the curve of range <cuindex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz.

Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float
z: float
dz: float

Returns
-------
None
") Transform;
		void Transform(const Standard_Integer CuIndex, const Standard_Real x, const Standard_Real dx, const Standard_Real y, const Standard_Real dy, const Standard_Real z, const Standard_Real dz);

		/****************** Transform2d ******************/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "Applies a transformation to the curve of range <cuindex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.

Parameters
----------
CuIndex: int
x: float
dx: float
y: float
dy: float

Returns
-------
None
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
		/****************** AppParCurves_MultiBSpCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "Returns an indefinite multibspcurve.

Returns
-------
None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve();

		/****************** AppParCurves_MultiBSpCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "Creates a multibspcurve, describing bspline curves all containing the same number of multipoint. an exception is raised if degree < 0.

Parameters
----------
NbPol: int

Returns
-------
None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve(const Standard_Integer NbPol);

		/****************** AppParCurves_MultiBSpCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "Creates a multibspcurve, describing bspline curves all containing the same number of multipoint. each multipoint must have nbcurves poles.

Parameters
----------
tabMU: AppParCurves_Array1OfMultiPoint
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Returns
-------
None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve(const AppParCurves_Array1OfMultiPoint & tabMU, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults);

		/****************** AppParCurves_MultiBSpCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "Creates a multibspcurve, describing bspline curves, taking control points from <sc>.

Parameters
----------
SC: AppParCurves_MultiCurve
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Returns
-------
None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve(const AppParCurves_MultiCurve & SC, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bspline curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 3d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bspline curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 2d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		virtual void D1(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bspline curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 3d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bspline curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 2d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		virtual void D2(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of the curve(s).

Returns
-------
int
") Degree;
		virtual Standard_Integer Degree();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns an array of reals containing the multiplicities of curves resulting from the approximation.

Returns
-------
TColStd_Array1OfReal
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Returns an array of reals containing the multiplicities of curves resulting from the approximation.

Returns
-------
TColStd_Array1OfInteger
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****************** SetKnots ******************/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "Knots of the multibspcurve are assigned to <theknots>.

Parameters
----------
theKnots: TColStd_Array1OfReal

Returns
-------
None
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & theKnots);

		/****************** SetMultiplicities ******************/
		%feature("compactdefaultargs") SetMultiplicities;
		%feature("autodoc", "Multiplicities of the multibspcurve are assigned to <themults>.

Parameters
----------
theMults: TColStd_Array1OfInteger

Returns
-------
None
") SetMultiplicities;
		void SetMultiplicities(const TColStd_Array1OfInteger & theMults);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bspline curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 2d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt

Returns
-------
None
") Value;
		virtual void Value(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt & Pt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the point with a parameter u on the bspline curve number cuindex. an exception is raised if cuindex <0 or > nbcurves. an exception is raised if the curve dimension is 3d.

Parameters
----------
CuIndex: int
U: float
Pt: gp_Pnt2d

Returns
-------
None
") Value;
		virtual void Value(const Standard_Integer CuIndex, const Standard_Real U, gp_Pnt2d & Pt);

};


%extend AppParCurves_MultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class AppParCurves_HArray1OfMultiCurve : public  AppParCurves_Array1OfMultiCurve, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const  AppParCurves_Array1OfMultiCurve::value_type& theValue);
    AppParCurves_HArray1OfMultiCurve(const  AppParCurves_Array1OfMultiCurve& theOther);
    const  AppParCurves_Array1OfMultiCurve& Array1();
     AppParCurves_Array1OfMultiCurve& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiCurve)


class AppParCurves_HArray1OfConstraintCouple : public  AppParCurves_Array1OfConstraintCouple, public Standard_Transient {
  public:
    AppParCurves_HArray1OfConstraintCouple(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfConstraintCouple(const Standard_Integer theLower, const Standard_Integer theUpper, const  AppParCurves_Array1OfConstraintCouple::value_type& theValue);
    AppParCurves_HArray1OfConstraintCouple(const  AppParCurves_Array1OfConstraintCouple& theOther);
    const  AppParCurves_Array1OfConstraintCouple& Array1();
     AppParCurves_Array1OfConstraintCouple& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfConstraintCouple)


class AppParCurves_HArray1OfMultiPoint : public  AppParCurves_Array1OfMultiPoint, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiPoint(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiPoint(const Standard_Integer theLower, const Standard_Integer theUpper, const  AppParCurves_Array1OfMultiPoint::value_type& theValue);
    AppParCurves_HArray1OfMultiPoint(const  AppParCurves_Array1OfMultiPoint& theOther);
    const  AppParCurves_Array1OfMultiPoint& Array1();
     AppParCurves_Array1OfMultiPoint& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiPoint)


class AppParCurves_HArray1OfMultiBSpCurve : public  AppParCurves_Array1OfMultiBSpCurve, public Standard_Transient {
  public:
    AppParCurves_HArray1OfMultiBSpCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppParCurves_HArray1OfMultiBSpCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const  AppParCurves_Array1OfMultiBSpCurve::value_type& theValue);
    AppParCurves_HArray1OfMultiBSpCurve(const  AppParCurves_Array1OfMultiBSpCurve& theOther);
    const  AppParCurves_Array1OfMultiBSpCurve& Array1();
     AppParCurves_Array1OfMultiBSpCurve& ChangeArray1();
};
%make_alias(AppParCurves_HArray1OfMultiBSpCurve)


/* harray2 classes */
/* hsequence classes */
