/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
enum AppParCurves_Constraint {
	AppParCurves_NoConstraint = 0,
	AppParCurves_PassPoint = 1,
	AppParCurves_TangencyPoint = 2,
	AppParCurves_CurvaturePoint = 3,
};

/* end public enums declaration */

/* handles */
%wrap_handle(AppParCurves_HArray1OfMultiCurve)
%wrap_handle(AppParCurves_HArray1OfConstraintCouple)
%wrap_handle(AppParCurves_HArray1OfMultiPoint)
%wrap_handle(AppParCurves_HArray1OfMultiBSpCurve)
/* end handles declaration */

/* templates */
%template(AppParCurves_Array1OfMultiCurve) NCollection_Array1 <AppParCurves_MultiCurve>;

%extend NCollection_Array1 <AppParCurves_MultiCurve> {
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
%template(AppParCurves_Array1OfConstraintCouple) NCollection_Array1 <AppParCurves_ConstraintCouple>;

%extend NCollection_Array1 <AppParCurves_ConstraintCouple> {
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
%template(AppParCurves_SequenceOfMultiCurve) NCollection_Sequence <AppParCurves_MultiCurve>;
%template(AppParCurves_SequenceOfMultiBSpCurve) NCollection_Sequence <AppParCurves_MultiBSpCurve>;
%template(AppParCurves_Array1OfMultiBSpCurve) NCollection_Array1 <AppParCurves_MultiBSpCurve>;

%extend NCollection_Array1 <AppParCurves_MultiBSpCurve> {
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
%template(AppParCurves_Array1OfMultiPoint) NCollection_Array1 <AppParCurves_MultiPoint>;

%extend NCollection_Array1 <AppParCurves_MultiPoint> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <AppParCurves_MultiCurve> AppParCurves_Array1OfMultiCurve;
typedef NCollection_Array1 <AppParCurves_ConstraintCouple> AppParCurves_Array1OfConstraintCouple;
typedef NCollection_Sequence <AppParCurves_MultiCurve> AppParCurves_SequenceOfMultiCurve;
typedef NCollection_Sequence <AppParCurves_MultiBSpCurve> AppParCurves_SequenceOfMultiBSpCurve;
typedef NCollection_Array1 <AppParCurves_MultiBSpCurve> AppParCurves_Array1OfMultiBSpCurve;
typedef NCollection_Array1 <AppParCurves_MultiPoint> AppParCurves_Array1OfMultiPoint;
/* end typedefs declaration */

/*********************
* class AppParCurves *
*********************/
%rename(appparcurves) AppParCurves;
class AppParCurves {
	public:
		/****************** Bernstein ******************/
		%feature("compactdefaultargs") Bernstein;
		%feature("autodoc", ":param NbPoles:
	:type NbPoles: int
	:param U:
	:type U: math_Vector
	:param A:
	:type A: math_Matrix
	:param DA:
	:type DA: math_Matrix
	:rtype: void") Bernstein;
		static void Bernstein (const Standard_Integer NbPoles,const math_Vector & U,math_Matrix & A,math_Matrix & DA);

		/****************** BernsteinMatrix ******************/
		%feature("compactdefaultargs") BernsteinMatrix;
		%feature("autodoc", ":param NbPoles:
	:type NbPoles: int
	:param U:
	:type U: math_Vector
	:param A:
	:type A: math_Matrix
	:rtype: void") BernsteinMatrix;
		static void BernsteinMatrix (const Standard_Integer NbPoles,const math_Vector & U,math_Matrix & A);

		/****************** SecondDerivativeBernstein ******************/
		%feature("compactdefaultargs") SecondDerivativeBernstein;
		%feature("autodoc", ":param U:
	:type U: float
	:param DDA:
	:type DDA: math_Vector
	:rtype: void") SecondDerivativeBernstein;
		static void SecondDerivativeBernstein (const Standard_Real U,math_Vector & DDA);

		/****************** SplineFunction ******************/
		%feature("compactdefaultargs") SplineFunction;
		%feature("autodoc", ":param NbPoles:
	:type NbPoles: int
	:param Degree:
	:type Degree: int
	:param Parameters:
	:type Parameters: math_Vector
	:param FlatKnots:
	:type FlatKnots: math_Vector
	:param A:
	:type A: math_Matrix
	:param DA:
	:type DA: math_Matrix
	:param Index:
	:type Index: math_IntegerVector
	:rtype: void") SplineFunction;
		static void SplineFunction (const Standard_Integer NbPoles,const Standard_Integer Degree,const math_Vector & Parameters,const math_Vector & FlatKnots,math_Matrix & A,math_Matrix & DA,math_IntegerVector & Index);

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
		%feature("autodoc", "* returns an indefinite ConstraintCouple.
	:rtype: None") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple ();

		/****************** AppParCurves_ConstraintCouple ******************/
		%feature("compactdefaultargs") AppParCurves_ConstraintCouple;
		%feature("autodoc", "* Create a couple the object <Index> will have the constraint <Cons>.
	:param TheIndex:
	:type TheIndex: int
	:param Cons:
	:type Cons: AppParCurves_Constraint
	:rtype: None") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple (const Standard_Integer TheIndex,const AppParCurves_Constraint Cons);

		/****************** Constraint ******************/
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "* returns the constraint of the object.
	:rtype: AppParCurves_Constraint") Constraint;
		AppParCurves_Constraint Constraint ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* returns the index of the constraint object.
	:rtype: int") Index;
		Standard_Integer Index ();

		/****************** SetConstraint ******************/
		%feature("compactdefaultargs") SetConstraint;
		%feature("autodoc", "* Changes the constraint of the object.
	:param Cons:
	:type Cons: AppParCurves_Constraint
	:rtype: None") SetConstraint;
		void SetConstraint (const AppParCurves_Constraint Cons);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "* Changes the index of the constraint object.
	:param TheIndex:
	:type TheIndex: int
	:rtype: None") SetIndex;
		void SetIndex (const Standard_Integer TheIndex);

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
		%feature("autodoc", "* returns an indefinite MultiCurve.
	:rtype: None") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve ();

		/****************** AppParCurves_MultiCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "* creates a MultiCurve, describing Bezier curves all containing the same number of MultiPoint. An exception is raised if Degree < 0.
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve (const Standard_Integer NbPol);

		/****************** AppParCurves_MultiCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "* creates a MultiCurve, describing Bezier curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.
	:param tabMU:
	:type tabMU: AppParCurves_Array1OfMultiPoint
	:rtype: None") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve (const AppParCurves_Array1OfMultiPoint & tabMU);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* returns the Pole array of the curve of range CuIndex. An exception is raised if the dimension of the curve is 2d.
	:param CuIndex:
	:type CuIndex: int
	:param TabPnt:
	:type TabPnt: TColgp_Array1OfPnt
	:rtype: None") Curve;
		void Curve (const Standard_Integer CuIndex,TColgp_Array1OfPnt & TabPnt);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* returns the Pole array of the curve of range CuIndex. An exception is raised if the dimension of the curve is 3d.
	:param CuIndex:
	:type CuIndex: int
	:param TabPnt:
	:type TabPnt: TColgp_Array1OfPnt2d
	:rtype: None") Curve;
		void Curve (const Standard_Integer CuIndex,TColgp_Array1OfPnt2d & TabPnt);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1,gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "* returns the degree of the curves.
	:rtype: int") Degree;
		virtual Standard_Integer Degree ();

		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "* returns the dimension of the CuIndex curve. An exception is raised if CuIndex<0 or CuIndex>NbCurves.
	:param CuIndex:
	:type CuIndex: int
	:rtype: int") Dimension;
		Standard_Integer Dimension (const Standard_Integer CuIndex);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "* Returns the number of curves resulting from the approximation of a MultiLine.
	:rtype: int") NbCurves;
		Standard_Integer NbCurves ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "* Returns the number of poles on curves resulting from the approximation of a MultiLine.
	:rtype: int") NbPoles;
		virtual Standard_Integer NbPoles ();

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "* returns the Nieme pole of the CuIndex curve. the curve must be a 3D curve.
	:param CuIndex:
	:type CuIndex: int
	:param Nieme:
	:type Nieme: int
	:rtype: gp_Pnt") Pole;
		const gp_Pnt  Pole (const Standard_Integer CuIndex,const Standard_Integer Nieme);

		/****************** Pole2d ******************/
		%feature("compactdefaultargs") Pole2d;
		%feature("autodoc", "* returns the Nieme pole of the CuIndex curve. the curve must be a 2D curve.
	:param CuIndex:
	:type CuIndex: int
	:param Nieme:
	:type Nieme: int
	:rtype: gp_Pnt2d") Pole2d;
		const gp_Pnt2d  Pole2d (const Standard_Integer CuIndex,const Standard_Integer Nieme);

		/****************** SetNbPoles ******************/
		%feature("compactdefaultargs") SetNbPoles;
		%feature("autodoc", "* The number of poles of the MultiCurve will be set to <nbPoles>.
	:param nbPoles:
	:type nbPoles: int
	:rtype: None") SetNbPoles;
		void SetNbPoles (const Standard_Integer nbPoles);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* sets the MultiPoint of range Index to the value <MPoint>. An exception is raised if Index <0 or Index >NbMPoint.
	:param Index:
	:type Index: int
	:param MPoint:
	:type MPoint: AppParCurves_MultiPoint
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiPoint & MPoint);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz
	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:param z:
	:type z: float
	:param dz:
	:type dz: float
	:rtype: None") Transform;
		void Transform (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy,const Standard_Real z,const Standard_Real dz);

		/****************** Transform2d ******************/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "* Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.
	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:rtype: None") Transform2d;
		void Transform2d (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the Index MultiPoint. An exception is raised if Index <0 or Index >Degree+1.
	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiPoint") Value;
		const AppParCurves_MultiPoint & Value (const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:rtype: void") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:rtype: void") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt);

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
		%feature("autodoc", "* creates an indefinite MultiPoint.
	:rtype: None") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint ();

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "* constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d. NbPoints is the number of 3D Points. NbPoints2d is the number of 2D Points.
	:param NbPoints:
	:type NbPoints: int
	:param NbPoints2d:
	:type NbPoints2d: int
	:rtype: None") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const Standard_Integer NbPoints,const Standard_Integer NbPoints2d);

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "* creates a MultiPoint only composed of 3D points.
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:rtype: None") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const TColgp_Array1OfPnt & tabP);

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "* creates a MultiPoint only composed of 2D points.
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:rtype: None") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const TColgp_Array1OfPnt2d & tabP2d);

		/****************** AppParCurves_MultiPoint ******************/
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "* constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d. NbPoints is the total number of Points.
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:rtype: None") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const TColgp_Array1OfPnt & tabP,const TColgp_Array1OfPnt2d & tabP2d);

		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "* returns the dimension of the point of range Index. An exception is raised if Index <0 or Index > NbCurves.
	:param Index:
	:type Index: int
	:rtype: int") Dimension;
		Standard_Integer Dimension (const Standard_Integer Index);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* returns the number of points of dimension 3D.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NbPoints2d ******************/
		%feature("compactdefaultargs") NbPoints2d;
		%feature("autodoc", "* returns the number of points of dimension 2D.
	:rtype: int") NbPoints2d;
		Standard_Integer NbPoints2d ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* returns the 3d Point of range Index. An exception is raised if Index < 0 or Index < number of 3d Points.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point (const Standard_Integer Index);

		/****************** Point2d ******************/
		%feature("compactdefaultargs") Point2d;
		%feature("autodoc", "* returns the 2d Point of range Index. An exception is raised if index <= number of 3d Points or Index > total number of Points.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d") Point2d;
		const gp_Pnt2d  Point2d (const Standard_Integer Index);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* the 3d Point of range Index of this MultiPoint is set to <Point>. An exception is raised if Index < 0 or Index > number of 3d Points.
	:param Index:
	:type Index: int
	:param Point:
	:type Point: gp_Pnt
	:rtype: None") SetPoint;
		void SetPoint (const Standard_Integer Index,const gp_Pnt & Point);

		/****************** SetPoint2d ******************/
		%feature("compactdefaultargs") SetPoint2d;
		%feature("autodoc", "* The 2d Point of range Index is set to <Point>. An exception is raised if Index > 3d Points or Index > total number of Points.
	:param Index:
	:type Index: int
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None") SetPoint2d;
		void SetPoint2d (const Standard_Integer Index,const gp_Pnt2d & Point);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz
	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:param z:
	:type z: float
	:param dz:
	:type dz: float
	:rtype: None") Transform;
		void Transform (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy,const Standard_Real z,const Standard_Real dz);

		/****************** Transform2d ******************/
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "* Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.
	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:rtype: None") Transform2d;
		void Transform2d (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy);

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
		%feature("autodoc", "* returns an indefinite MultiBSpCurve.
	:rtype: None") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve ();

		/****************** AppParCurves_MultiBSpCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "* creates a MultiBSpCurve, describing BSpline curves all containing the same number of MultiPoint. An exception is raised if Degree < 0.
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve (const Standard_Integer NbPol);

		/****************** AppParCurves_MultiBSpCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "* creates a MultiBSpCurve, describing BSpline curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.
	:param tabMU:
	:type tabMU: AppParCurves_Array1OfMultiPoint
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:rtype: None") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve (const AppParCurves_Array1OfMultiPoint & tabMU,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);

		/****************** AppParCurves_MultiBSpCurve ******************/
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "* creates a MultiBSpCurve, describing BSpline curves, taking control points from <SC>.
	:param SC:
	:type SC: AppParCurves_MultiCurve
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:rtype: None") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve (const AppParCurves_MultiCurve & SC,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1,gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "* returns the degree of the curve(s).
	:rtype: int") Degree;
		virtual Standard_Integer Degree ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "* Returns an array of Reals containing the multiplicities of curves resulting from the approximation.
	:rtype: TColStd_Array1OfReal") Knots;
		const TColStd_Array1OfReal & Knots ();

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "* Returns an array of Reals containing the multiplicities of curves resulting from the approximation.
	:rtype: TColStd_Array1OfInteger") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities ();

		/****************** SetKnots ******************/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "* Knots of the multiBSpCurve are assigned to <theknots>.
	:param theKnots:
	:type theKnots: TColStd_Array1OfReal
	:rtype: None") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & theKnots);

		/****************** SetMultiplicities ******************/
		%feature("compactdefaultargs") SetMultiplicities;
		%feature("autodoc", "* Multiplicities of the multiBSpCurve are assigned to <theMults>.
	:param theMults:
	:type theMults: TColStd_Array1OfInteger
	:rtype: None") SetMultiplicities;
		void SetMultiplicities (const TColStd_Array1OfInteger & theMults);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:rtype: void") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.
	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:rtype: void") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt);

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
