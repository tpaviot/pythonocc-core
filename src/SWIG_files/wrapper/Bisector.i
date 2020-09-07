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
%define BISECTORDOCSTRING
"Bisector module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bisector.html"
%enddef
%module (package="OCC.Core", docstring=BISECTORDOCSTRING) Bisector


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
#include<Bisector_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<math_module.hxx>
#include<IntRes2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import gp.i
%import GeomAbs.i
%import math.i
%import IntRes2d.i

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
%wrap_handle(Bisector_Curve)
%wrap_handle(Bisector_BisecAna)
%wrap_handle(Bisector_BisecCC)
%wrap_handle(Bisector_BisecPC)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class Bisector *
*****************/
%rename(bisector) Bisector;
class Bisector {
	public:
		/****************** IsConvex ******************/
		/**** md5 signature: 0ba18f6d8c98db36f20014c406307bc3 ****/
		%feature("compactdefaultargs") IsConvex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Cu: Geom2d_Curve
Sign: float

Returns
-------
bool
") IsConvex;
		static Standard_Boolean IsConvex(const opencascade::handle<Geom2d_Curve> & Cu, const Standard_Real Sign);

};


%extend Bisector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Bisector_Bisec *
***********************/
class Bisector_Bisec {
	public:
		/****************** Bisector_Bisec ******************/
		/**** md5 signature: 9cb9077f468a33c835bd5374ce193801 ****/
		%feature("compactdefaultargs") Bisector_Bisec;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_Bisec;
		 Bisector_Bisec();

		/****************** ChangeValue ******************/
		/**** md5 signature: b532e9246935d32759ba1ebe2025fb71 ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Returns the curve of <self>.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
") ChangeValue;
		const opencascade::handle<Geom2d_TrimmedCurve> & ChangeValue();

		/****************** Perform ******************/
		/**** md5 signature: 984dc45433ffefb0966e208c47581a11 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the curves <cu1> and <cu2>. <oncurve> is true if the point <p> is common to <cu1> and <cu2>.

Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
ajointype: GeomAbs_JoinType
Tolerance: float
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const GeomAbs_JoinType ajointype, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: db93a55a64615589c218fc350bd5fc5b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the curve <cu1> and the point <pnt>. <oncurve> is true if the point <p> is the point <pnt>.

Parameters
----------
Cu: Geom2d_Curve
Pnt: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const opencascade::handle<Geom2d_Point> & Pnt, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: 4bc1957ebd7bba22e94551f1f80cb51e ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the curve <cu> and the point <pnt>. <oncurve> is true if the point <p> is the point <pnt>.

Parameters
----------
Pnt: Geom2d_Point
Cu: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt, const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: b02fc98be2a333e2fd00a9e617d3c1ab ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the two points <pnt1> and <pnt2>.

Parameters
----------
Pnt1: Geom2d_Point
Pnt2: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float,optional
	default value is 0.0
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt1, const opencascade::handle<Geom2d_Point> & Pnt2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance = 0.0, const Standard_Boolean oncurve = Standard_True);

		/****************** Value ******************/
		/**** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the curve of <self>.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend Bisector_Bisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Bisector_Curve *
***********************/
%nodefaultctor Bisector_Curve;
class Bisector_Curve : public Geom2d_Curve {
	public:
		/****************** IntervalFirst ******************/
		/**** md5 signature: 2b1fbcfb5912e085014bff551ebfdd6c ****/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "Returns the first parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalFirst;
		virtual Standard_Real IntervalFirst(const Standard_Integer Index);

		/****************** IntervalLast ******************/
		/**** md5 signature: 8f41fb764bd83da682ac5f5e51609adc ****/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "Returns the last parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalLast;
		virtual Standard_Real IntervalLast(const Standard_Integer Index);

		/****************** IsExtendAtEnd ******************/
		/**** md5 signature: fa46f2fc7438d2dbbba638e12e43145a ****/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtEnd;
		virtual Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		/**** md5 signature: ff6f36b43fadbce1828324c35610c78a ****/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtStart;
		virtual Standard_Boolean IsExtendAtStart();

		/****************** NbIntervals ******************/
		/**** md5 signature: 7f7a34c736f32157e63c4165aa9e9fa0 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals();

		/****************** Parameter ******************/
		/**** md5 signature: 5ff4365826d38eeef8b73494499ec484 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		virtual Standard_Real Parameter(const gp_Pnt2d & P);

};


%make_alias(Bisector_Curve)

%extend Bisector_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Bisector_FunctionH *
***************************/
class Bisector_FunctionH : public math_FunctionWithDerivative {
	public:
		/****************** Bisector_FunctionH ******************/
		/**** md5 signature: 9768bfcb4f08a5680c6f7b3125feb59d ****/
		%feature("compactdefaultargs") Bisector_FunctionH;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2: Geom2d_Curve
P1: gp_Pnt2d
T1: gp_Vec2d

Returns
-------
None
") Bisector_FunctionH;
		 Bisector_FunctionH(const opencascade::handle<Geom2d_Curve> & C2, const gp_Pnt2d & P1, const gp_Vec2d & T1);

		/****************** Derivative ******************/
		/**** md5 signature: 95e91729f1fb548d9a62f690b302c323 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values of the functions for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values of the functions and the derivatives for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Bisector_FunctionH {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Bisector_FunctionInter *
*******************************/
class Bisector_FunctionInter : public math_FunctionWithDerivative {
	public:
		/****************** Bisector_FunctionInter ******************/
		/**** md5 signature: 6cb5bcae490faa74fe83040a70aae23b ****/
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_FunctionInter;
		 Bisector_FunctionInter();

		/****************** Bisector_FunctionInter ******************/
		/**** md5 signature: 3914f9fdc180fc44bfa3f3d1bdc966e6 ****/
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
Bis1: Bisector_Curve
Bis2: Bisector_Curve

Returns
-------
None
") Bisector_FunctionInter;
		 Bisector_FunctionInter(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Bisector_Curve> & Bis1, const opencascade::handle<Bisector_Curve> & Bis2);

		/****************** Derivative ******************/
		/**** md5 signature: 95e91729f1fb548d9a62f690b302c323 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 46929876b3eebbfdf786161335a7b2c9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
Bis1: Bisector_Curve
Bis2: Bisector_Curve

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Bisector_Curve> & Bis1, const opencascade::handle<Bisector_Curve> & Bis2);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values of the functions for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values of the functions and the derivatives for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Bisector_FunctionInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Bisector_Inter *
***********************/
class Bisector_Inter : public IntRes2d_Intersection {
	public:
		/****************** Bisector_Inter ******************/
		/**** md5 signature: d35f206bd98e4cab68d3cf46bfe8c7fd ****/
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_Inter;
		 Bisector_Inter();

		/****************** Bisector_Inter ******************/
		/**** md5 signature: aaeff3d8c72f22edd80968b7ffad5355 ****/
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "Intersection between 2 curves. c1 separates the element a and b. c2 separates the elements c et d. if b an c have the same geometry. <comunelement> has to be true. it permits an optimiztion of the computation.

Parameters
----------
C1: Bisector_Bisec
D1: IntRes2d_Domain
C2: Bisector_Bisec
D2: IntRes2d_Domain
TolConf: float
Tol: float
ComunElement: bool

Returns
-------
None
") Bisector_Inter;
		 Bisector_Inter(const Bisector_Bisec & C1, const IntRes2d_Domain & D1, const Bisector_Bisec & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol, const Standard_Boolean ComunElement);

		/****************** Perform ******************/
		/**** md5 signature: ddbb1551e9c7cf37d31b930e3241d583 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves. c1 separates the element a and b. c2 separates the elements c et d. if b an c have the same geometry. <comunelement> has to be true. it permits an optimiztion of the computation.

Parameters
----------
C1: Bisector_Bisec
D1: IntRes2d_Domain
C2: Bisector_Bisec
D2: IntRes2d_Domain
TolConf: float
Tol: float
ComunElement: bool

Returns
-------
None
") Perform;
		void Perform(const Bisector_Bisec & C1, const IntRes2d_Domain & D1, const Bisector_Bisec & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol, const Standard_Boolean ComunElement);

};


%extend Bisector_Inter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Bisector_PointOnBis *
****************************/
class Bisector_PointOnBis {
	public:
		/****************** Bisector_PointOnBis ******************/
		/**** md5 signature: 63e7f02317b094a6fec372232b767eb4 ****/
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_PointOnBis;
		 Bisector_PointOnBis();

		/****************** Bisector_PointOnBis ******************/
		/**** md5 signature: d20ced0f8cc3f3d622bc9e548bd213fe ****/
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param1: float
Param2: float
ParamBis: float
Distance: float
Point: gp_Pnt2d

Returns
-------
None
") Bisector_PointOnBis;
		 Bisector_PointOnBis(const Standard_Real Param1, const Standard_Real Param2, const Standard_Real ParamBis, const Standard_Real Distance, const gp_Pnt2d & Point);

		/****************** Distance ******************/
		/**** md5 signature: 3d8e58dc0e28ccf0d2f126234669088c ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Distance: float

Returns
-------
None
") Distance;
		void Distance(const Standard_Real Distance);

		/****************** Distance ******************/
		/**** md5 signature: c054352e1b604c83d759bc4ccf6c526d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsInfinite ******************/
		/**** md5 signature: c22d0728817de9ea8ad6f0a2d88a935b ****/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "No available documentation.

Parameters
----------
Infinite: bool

Returns
-------
None
") IsInfinite;
		void IsInfinite(const Standard_Boolean Infinite);

		/****************** IsInfinite ******************/
		/**** md5 signature: 800afae87f4e1f5e34cb9eb46c14c258 ****/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsInfinite;
		Standard_Boolean IsInfinite();

		/****************** ParamOnBis ******************/
		/**** md5 signature: 2a06a99e4b08f6296a85a2d8e73c5351 ****/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") ParamOnBis;
		void ParamOnBis(const Standard_Real Param);

		/****************** ParamOnBis ******************/
		/**** md5 signature: f67c7c80951bdacb9684e5a4011ab759 ****/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParamOnBis;
		Standard_Real ParamOnBis();

		/****************** ParamOnC1 ******************/
		/**** md5 signature: 2db8bd05328faa84ee9d303902d8f2bf ****/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") ParamOnC1;
		void ParamOnC1(const Standard_Real Param);

		/****************** ParamOnC1 ******************/
		/**** md5 signature: b6583f639246f74ed76f20992798cf9c ****/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParamOnC1;
		Standard_Real ParamOnC1();

		/****************** ParamOnC2 ******************/
		/**** md5 signature: 98783de9a7c5ee8d0931b4c5f4a1872d ****/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") ParamOnC2;
		void ParamOnC2(const Standard_Real Param);

		/****************** ParamOnC2 ******************/
		/**** md5 signature: e502fc8d8313c7e88bcc270cff52b4e8 ****/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParamOnC2;
		Standard_Real ParamOnC2();

		/****************** Point ******************/
		/**** md5 signature: fe253a4fee17763769a3905b741f0819 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Point;
		void Point(const gp_Pnt2d & P);

		/****************** Point ******************/
		/**** md5 signature: f810beee1f685fcd6fb3b73efe41028f ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") Point;
		gp_Pnt2d Point();

};


%extend Bisector_PointOnBis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Bisector_PolyBis *
*************************/
class Bisector_PolyBis {
	public:
		/****************** Bisector_PolyBis ******************/
		/**** md5 signature: 0cfd13bfdc232aa96631a171648e1b9d ****/
		%feature("compactdefaultargs") Bisector_PolyBis;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_PolyBis;
		 Bisector_PolyBis();

		/****************** Append ******************/
		/**** md5 signature: da3b82f65e563d5fdf7c58e07596946f ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
Point: Bisector_PointOnBis

Returns
-------
None
") Append;
		void Append(const Bisector_PointOnBis & Point);

		/****************** First ******************/
		/**** md5 signature: 8a04854f4bd43f8bd98db514b401eb6e ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
Bisector_PointOnBis
") First;
		const Bisector_PointOnBis & First();

		/****************** Interval ******************/
		/**** md5 signature: 74c2cabdf1ec19a1f24a392e69bb1d55 ****/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
int
") Interval;
		Standard_Integer Interval(const Standard_Real U);

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		/**** md5 signature: 5e27620ceac300d8b92d02d6453ba01a ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
Bisector_PointOnBis
") Last;
		const Bisector_PointOnBis & Last();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Transform ******************/
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** Value ******************/
		/**** md5 signature: 4f2d15b5fff36e44f78586db4357d093 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Bisector_PointOnBis
") Value;
		const Bisector_PointOnBis & Value(const Standard_Integer Index);

};


%extend Bisector_PolyBis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Bisector_BisecAna *
**************************/
class Bisector_BisecAna : public Bisector_Curve {
	public:
		/****************** Bisector_BisecAna ******************/
		/**** md5 signature: 0d65d11afa2cc569f4caba4128539b9a ****/
		%feature("compactdefaultargs") Bisector_BisecAna;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_BisecAna;
		 Bisector_BisecAna();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Dump ******************/
		/**** md5 signature: 23c1db28cacdaffb331052739c78df8b ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
Deep: int,optional
	default value is 0
Offset: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Deep = 0, const Standard_Integer Offset = 0);

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Geom2dCurve ******************/
		/**** md5 signature: abcd44f52397ef0bfa09dd48df49f2c6 ****/
		%feature("compactdefaultargs") Geom2dCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Geom2dCurve;
		opencascade::handle<Geom2d_Curve> Geom2dCurve();

		/****************** Init ******************/
		/**** md5 signature: 07e89ee657e1bcfa1082e3c53ecfd222 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
bisector: Geom2d_TrimmedCurve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_TrimmedCurve> & bisector);

		/****************** IntervalFirst ******************/
		/**** md5 signature: 26ceac01a62ec22c7e822fa07bd00ba8 ****/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "Returns the first parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalFirst;
		Standard_Real IntervalFirst(const Standard_Integer Index);

		/****************** IntervalLast ******************/
		/**** md5 signature: ac3f1afc626dcb57a8f90c42ab96a1a6 ****/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "Returns the last parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalLast;
		Standard_Real IntervalLast(const Standard_Integer Index);

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns the order of continuity of the curve. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsExtendAtEnd ******************/
		/**** md5 signature: 726d1a23c6824c1f3df11fa9c8594123 ****/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		/**** md5 signature: eed6f2d113851eb819af3886c3a10ba0 ****/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** NbIntervals ******************/
		/**** md5 signature: 2f9f3a515d8495f09df4987b6d0933b4 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** Parameter ******************/
		/**** md5 signature: ca089b85d2f90fc99bae6c7f4cfeb9e5 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const gp_Pnt2d & P);

		/****************** ParameterOfEndPoint ******************/
		/**** md5 signature: 2b155a85b659e36f13767bf9dd30f490 ****/
		%feature("compactdefaultargs") ParameterOfEndPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOfEndPoint;
		Standard_Real ParameterOfEndPoint();

		/****************** ParameterOfStartPoint ******************/
		/**** md5 signature: 21ad3f21ab318a397dc77908c2cf36cb ****/
		%feature("compactdefaultargs") ParameterOfStartPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOfStartPoint;
		Standard_Real ParameterOfStartPoint();

		/****************** Perform ******************/
		/**** md5 signature: fb60162720d8c50ac1c9de9627e7e5f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the curves <cu1> and <cu2>. <oncurve> is true if the point <p> is common to <cu1> and <cu2>.

Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
jointype: GeomAbs_JoinType
Tolerance: float
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const GeomAbs_JoinType jointype, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: db93a55a64615589c218fc350bd5fc5b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the curve <cu1> and the point <pnt>. <oncurve> is true if the point <p> is the point <pnt>.

Parameters
----------
Cu: Geom2d_Curve
Pnt: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const opencascade::handle<Geom2d_Point> & Pnt, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: 4bc1957ebd7bba22e94551f1f80cb51e ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the curve <cu> and the point <pnt>. <oncurve> is true if the point <p> is the point <pnt>.

Parameters
----------
Pnt: Geom2d_Point
Cu: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt, const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: b02fc98be2a333e2fd00a9e617d3c1ab ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the bisecting line between the two points <pnt1> and <pnt2>.

Parameters
----------
Pnt1: Geom2d_Point
Pnt2: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float,optional
	default value is 0.0
oncurve: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt1, const opencascade::handle<Geom2d_Point> & Pnt2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance = 0.0, const Standard_Boolean oncurve = Standard_True);

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetTrim ******************/
		/**** md5 signature: 7b91668841d99d4ce0903be5c9fe2ff8 ****/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "Trim <self> by a domain defined by the curve <cu>. this domain is the set of the points which are nearest from <cu> than the extremitis of <cu>.

Parameters
----------
Cu: Geom2d_Curve

Returns
-------
None
") SetTrim;
		void SetTrim(const opencascade::handle<Geom2d_Curve> & Cu);

		/****************** SetTrim ******************/
		/**** md5 signature: b905e29612c27e95bca2fd090f152e87 ****/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "Trim <self> by a domain defined by uf and ul.

Parameters
----------
uf: float
ul: float

Returns
-------
None
") SetTrim;
		void SetTrim(const Standard_Real uf, const Standard_Real ul);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Bisector_BisecAna)

%extend Bisector_BisecAna {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Bisector_BisecCC *
*************************/
class Bisector_BisecCC : public Bisector_Curve {
	public:
		/****************** Bisector_BisecCC ******************/
		/**** md5 signature: 87b14a7e3b15d49238cbdddb2458f82b ****/
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_BisecCC;
		 Bisector_BisecCC();

		/****************** Bisector_BisecCC ******************/
		/**** md5 signature: b7a10bfb46a2005b4bf2e5d04eb46d71 ****/
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "Constructs the bisector between the curves <cu1> and <cu2>. //! <side1> (resp <side2>) = 1 if the bisector curve is on the left of <cu1> (resp <cu2>) else <side1> (resp <side2>) = -1. //! the bisector is trimmed by the point <origin>. <distmax> is used to trim the bisector.the distance between the points of the bisector and <cu> is smaller than <distmax>.

Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
Side1: float
Side2: float
Origin: gp_Pnt2d
DistMax: float,optional
	default value is 500

Returns
-------
None
") Bisector_BisecCC;
		 Bisector_BisecCC(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const Standard_Real Side1, const Standard_Real Side2, const gp_Pnt2d & Origin, const Standard_Real DistMax = 500);

		/****************** ChangeGuide ******************/
		/**** md5 signature: ac2e0495e4a0d40e5db2cbf3fc1a0d37 ****/
		%feature("compactdefaultargs") ChangeGuide;
		%feature("autodoc", "The parameter on <self> is linked to the parameter on the first curve. this method creates the same bisector where the curves are inversed.

Returns
-------
opencascade::handle<Bisector_BisecCC>
") ChangeGuide;
		opencascade::handle<Bisector_BisecCC> ChangeGuide();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Curve ******************/
		/**** md5 signature: 4f7582321d8b4bbdb047c27b823a49c6 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndCurve: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve;
		opencascade::handle<Geom2d_Curve> Curve(const Standard_Integer IndCurve);

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 79a293d0b91ab6d1359881075119fb56 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Dump ******************/
		/**** md5 signature: 23c1db28cacdaffb331052739c78df8b ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
Deep: int,optional
	default value is 0
Offset: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Deep = 0, const Standard_Integer Offset = 0);

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IntervalContinuity ******************/
		/**** md5 signature: 4fe081a978745bbd0e32a19f5e1db952 ****/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity();

		/****************** IntervalFirst ******************/
		/**** md5 signature: 26ceac01a62ec22c7e822fa07bd00ba8 ****/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "Returns the first parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalFirst;
		Standard_Real IntervalFirst(const Standard_Integer Index);

		/****************** IntervalLast ******************/
		/**** md5 signature: ac3f1afc626dcb57a8f90c42ab96a1a6 ****/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "Returns the last parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalLast;
		Standard_Real IntervalLast(const Standard_Integer Index);

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns the order of continuity of the curve. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsExtendAtEnd ******************/
		/**** md5 signature: 726d1a23c6824c1f3df11fa9c8594123 ****/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		/**** md5 signature: eed6f2d113851eb819af3886c3a10ba0 ****/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LinkBisCurve ******************/
		/**** md5 signature: 55ab0cec865e9ea9faed38185d303c1b ****/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "Returns the parameter on the curve1 of the projection of the point of parameter u on <self>.

Parameters
----------
U: float

Returns
-------
float
") LinkBisCurve;
		Standard_Real LinkBisCurve(const Standard_Real U);

		/****************** LinkCurveBis ******************/
		/**** md5 signature: b0393e62df20de8ab3e4695b6cecfbc2 ****/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "Returns the reciproque of linkbiscurve.

Parameters
----------
U: float

Returns
-------
float
") LinkCurveBis;
		Standard_Real LinkCurveBis(const Standard_Real U);

		/****************** NbIntervals ******************/
		/**** md5 signature: 2f9f3a515d8495f09df4987b6d0933b4 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** Parameter ******************/
		/**** md5 signature: ca089b85d2f90fc99bae6c7f4cfeb9e5 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const gp_Pnt2d & P);

		/****************** Perform ******************/
		/**** md5 signature: fae8efeaf20f5251b3bb2a78bdbbd0d6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the bisector between the curves <cu1> and <cu2>. //! <side1> (resp <side2>) = 1 if the bisector curve is on the left of <cu1> (resp <cu2>) else <side1> (resp <side2>) = -1. //! the bisector is trimmed by the point <origin>. //! <distmax> is used to trim the bisector.the distance between the points of the bisector and <cu> is smaller than <distmax>.

Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
Side1: float
Side2: float
Origin: gp_Pnt2d
DistMax: float,optional
	default value is 500

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const Standard_Real Side1, const Standard_Real Side2, const gp_Pnt2d & Origin, const Standard_Real DistMax = 500);

		/****************** Polygon ******************/
		/**** md5 signature: 0adc7dc97a83bfc84693e7af983e76d4 ****/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Returns
-------
Bisector_PolyBis
") Polygon;
		const Bisector_PolyBis & Polygon();

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transformation of a geometric object. this tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** ValueAndDist ******************/
		/**** md5 signature: c1e89ac2312e0b68d9e854a27a72ebb0 ****/
		%feature("compactdefaultargs") ValueAndDist;
		%feature("autodoc", "Returns the point of parameter u. computes the distance between the current point and the two curves i separate. computes the parameters on each curve corresponding of the projection of the current point.

Parameters
----------
U: float

Returns
-------
U1: float
U2: float
Distance: float
") ValueAndDist;
		gp_Pnt2d ValueAndDist(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ValueByInt ******************/
		/**** md5 signature: 887792daba949624653f20427d8b1fcd ****/
		%feature("compactdefaultargs") ValueByInt;
		%feature("autodoc", "Returns the point of parameter u. computes the distance between the current point and the two curves i separate. computes the parameters on each curve corresponding of the projection of the current point.

Parameters
----------
U: float

Returns
-------
U1: float
U2: float
Distance: float
") ValueByInt;
		gp_Pnt2d ValueByInt(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%make_alias(Bisector_BisecCC)

%extend Bisector_BisecCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Bisector_BisecPC *
*************************/
class Bisector_BisecPC : public Bisector_Curve {
	public:
		/****************** Bisector_BisecPC ******************/
		/**** md5 signature: cf514e534127a826f335e20c812871d7 ****/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_BisecPC;
		 Bisector_BisecPC();

		/****************** Bisector_BisecPC ******************/
		/**** md5 signature: 1365427db49d7771559efb2b783b9495 ****/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "Constructs the bisector between the point <p> and the curve <cu>. <side> = 1. if the bisector curve is on the left of <cu> else <side> = -1. <distmax> is used to trim the bisector.the distance between the points of the bisector and <cu> is smaller than <distmax>.

Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: float
DistMax: float,optional
	default value is 500

Returns
-------
None
") Bisector_BisecPC;
		 Bisector_BisecPC(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const Standard_Real Side, const Standard_Real DistMax = 500);

		/****************** Bisector_BisecPC ******************/
		/**** md5 signature: c4a1dc45924f741e58ac3ed6ac71fc88 ****/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "Constructs the bisector between the point <p> and the curve <cu> trimmed by <umin> and <umax> <side> = 1. if the bisector curve is on the left of <cu> else <side> = -1. warning: the bisector is supposed all over defined between <umin> and <umax>.

Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: float
UMin: float
UMax: float

Returns
-------
None
") Bisector_BisecPC;
		 Bisector_BisecPC(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const Standard_Real Side, const Standard_Real UMin, const Standard_Real UMax);

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 79a293d0b91ab6d1359881075119fb56 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Distance ******************/
		/**** md5 signature: 2f53d099539d1d19d9f9030927d9cfd3 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance between the point of parameter u on <self> and my point or my curve.

Parameters
----------
U: float

Returns
-------
float
") Distance;
		Standard_Real Distance(const Standard_Real U);

		/****************** Dump ******************/
		/**** md5 signature: 23c1db28cacdaffb331052739c78df8b ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
Deep: int,optional
	default value is 0
Offset: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Deep = 0, const Standard_Integer Offset = 0);

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Value of the first parameter.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IntervalContinuity ******************/
		/**** md5 signature: 4fe081a978745bbd0e32a19f5e1db952 ****/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity();

		/****************** IntervalFirst ******************/
		/**** md5 signature: 26ceac01a62ec22c7e822fa07bd00ba8 ****/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "Returns the first parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalFirst;
		Standard_Real IntervalFirst(const Standard_Integer Index);

		/****************** IntervalLast ******************/
		/**** md5 signature: ac3f1afc626dcb57a8f90c42ab96a1a6 ****/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "Returns the last parameter of the current interval.

Parameters
----------
Index: int

Returns
-------
float
") IntervalLast;
		Standard_Real IntervalLast(const Standard_Integer Index);

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns the order of continuity of the curve. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns <true> if the bisector is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsExtendAtEnd ******************/
		/**** md5 signature: 726d1a23c6824c1f3df11fa9c8594123 ****/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Returns true if the bisector is extended at end.

Returns
-------
bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		/**** md5 signature: eed6f2d113851eb819af3886c3a10ba0 ****/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Returns true if the bisector is extended at start.

Returns
-------
bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Value of the last parameter.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LinkBisCurve ******************/
		/**** md5 signature: 55ab0cec865e9ea9faed38185d303c1b ****/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "Returns the parameter on the curve1 of the projection of the point of parameter u on <self>.

Parameters
----------
U: float

Returns
-------
float
") LinkBisCurve;
		Standard_Real LinkBisCurve(const Standard_Real U);

		/****************** LinkCurveBis ******************/
		/**** md5 signature: b0393e62df20de8ab3e4695b6cecfbc2 ****/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "Returns the reciproque of linkbiscurve.

Parameters
----------
U: float

Returns
-------
float
") LinkCurveBis;
		Standard_Real LinkCurveBis(const Standard_Real U);

		/****************** NbIntervals ******************/
		/**** md5 signature: 2f9f3a515d8495f09df4987b6d0933b4 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** Parameter ******************/
		/**** md5 signature: ca089b85d2f90fc99bae6c7f4cfeb9e5 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on <self> corresponding to <p>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const gp_Pnt2d & P);

		/****************** Perform ******************/
		/**** md5 signature: 4f1397939b801b8c018eca1a300ed682 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Construct the bisector between the point <p> and the curve <cu>. <side> = 1. if the bisector curve is on the left of <cu> else <side> = -1. <distmax> is used to trim the bisector.the distance between the points of the bisector and <cu> is smaller than <distmax>.

Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: float
DistMax: float,optional
	default value is 500

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const Standard_Real Side, const Standard_Real DistMax = 500);

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the orientation of the curve is modified. if the curve is bounded the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transformation of a geometric object. this tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Bisector_BisecPC)

%extend Bisector_BisecPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
