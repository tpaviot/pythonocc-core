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
%define BISECTORDOCSTRING
"Bisector module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bisector.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
		/****** Bisector::IsConvex ******/
		/****** md5 signature: 0ba18f6d8c98db36f20014c406307bc3 ******/
		%feature("compactdefaultargs") IsConvex;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
Sign: float

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** Bisector_Bisec::Bisector_Bisec ******/
		/****** md5 signature: 9cb9077f468a33c835bd5374ce193801 ******/
		%feature("compactdefaultargs") Bisector_Bisec;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_Bisec;
		 Bisector_Bisec();

		/****** Bisector_Bisec::ChangeValue ******/
		/****** md5 signature: b532e9246935d32759ba1ebe2025fb71 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the Curve of <self>.
") ChangeValue;
		const opencascade::handle<Geom2d_TrimmedCurve> & ChangeValue();

		/****** Bisector_Bisec::Perform ******/
		/****** md5 signature: 984dc45433ffefb0966e208c47581a11 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
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
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const GeomAbs_JoinType ajointype, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_Bisec::Perform ******/
		/****** md5 signature: db93a55a64615589c218fc350bd5fc5b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
Pnt: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const opencascade::handle<Geom2d_Point> & Pnt, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_Bisec::Perform ******/
		/****** md5 signature: 4bc1957ebd7bba22e94551f1f80cb51e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt: Geom2d_Point
Cu: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt, const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_Bisec::Perform ******/
		/****** md5 signature: b02fc98be2a333e2fd00a9e617d3c1ab ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt1: Geom2d_Point
Pnt2: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float (optional, default to 0.0)
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the two points <Pnt1> and <Pnt2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt1, const opencascade::handle<Geom2d_Point> & Pnt2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance = 0.0, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_Bisec::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the Curve of <self>.
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
		/****** Bisector_Curve::IntervalFirst ******/
		/****** md5 signature: 2b1fbcfb5912e085014bff551ebfdd6c ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		virtual Standard_Real IntervalFirst(const Standard_Integer Index);

		/****** Bisector_Curve::IntervalLast ******/
		/****** md5 signature: 8f41fb764bd83da682ac5f5e51609adc ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		virtual Standard_Real IntervalLast(const Standard_Integer Index);

		/****** Bisector_Curve::IsExtendAtEnd ******/
		/****** md5 signature: fa46f2fc7438d2dbbba638e12e43145a ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtEnd;
		virtual Standard_Boolean IsExtendAtEnd();

		/****** Bisector_Curve::IsExtendAtStart ******/
		/****** md5 signature: ff6f36b43fadbce1828324c35610c78a ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtStart;
		virtual Standard_Boolean IsExtendAtStart();

		/****** Bisector_Curve::NbIntervals ******/
		/****** md5 signature: 7f7a34c736f32157e63c4165aa9e9fa0 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		virtual Standard_Integer NbIntervals();

		/****** Bisector_Curve::Parameter ******/
		/****** md5 signature: 5ff4365826d38eeef8b73494499ec484 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
float

Description
-----------
No available documentation.
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
		/****** Bisector_FunctionH::Bisector_FunctionH ******/
		/****** md5 signature: 9768bfcb4f08a5680c6f7b3125feb59d ******/
		%feature("compactdefaultargs") Bisector_FunctionH;
		%feature("autodoc", "
Parameters
----------
C2: Geom2d_Curve
P1: gp_Pnt2d
T1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Bisector_FunctionH;
		 Bisector_FunctionH(const opencascade::handle<Geom2d_Curve> & C2, const gp_Pnt2d & P1, const gp_Vec2d & T1);

		/****** Bisector_FunctionH::Derivative ******/
		/****** md5 signature: 95e91729f1fb548d9a62f690b302c323 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
No available documentation.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****** Bisector_FunctionH::Value ******/
		/****** md5 signature: 860bcc3da162e9f9f232f07518550196 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
Computes the values of the Functions for the variable <X>.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****** Bisector_FunctionH::Values ******/
		/****** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the values of the functions and the derivatives for the variable <X>.
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
		/****** Bisector_FunctionInter::Bisector_FunctionInter ******/
		/****** md5 signature: 6cb5bcae490faa74fe83040a70aae23b ******/
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_FunctionInter;
		 Bisector_FunctionInter();

		/****** Bisector_FunctionInter::Bisector_FunctionInter ******/
		/****** md5 signature: 3914f9fdc180fc44bfa3f3d1bdc966e6 ******/
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Bis1: Bisector_Curve
Bis2: Bisector_Curve

Return
-------
None

Description
-----------
No available documentation.
") Bisector_FunctionInter;
		 Bisector_FunctionInter(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Bisector_Curve> & Bis1, const opencascade::handle<Bisector_Curve> & Bis2);

		/****** Bisector_FunctionInter::Derivative ******/
		/****** md5 signature: 95e91729f1fb548d9a62f690b302c323 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
No available documentation.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****** Bisector_FunctionInter::Perform ******/
		/****** md5 signature: 46929876b3eebbfdf786161335a7b2c9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Bis1: Bisector_Curve
Bis2: Bisector_Curve

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Bisector_Curve> & Bis1, const opencascade::handle<Bisector_Curve> & Bis2);

		/****** Bisector_FunctionInter::Value ******/
		/****** md5 signature: 860bcc3da162e9f9f232f07518550196 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
Computes the values of the Functions for the variable <X>.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****** Bisector_FunctionInter::Values ******/
		/****** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the values of the functions and the derivatives for the variable <X>.
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
		/****** Bisector_Inter::Bisector_Inter ******/
		/****** md5 signature: d35f206bd98e4cab68d3cf46bfe8c7fd ******/
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_Inter;
		 Bisector_Inter();

		/****** Bisector_Inter::Bisector_Inter ******/
		/****** md5 signature: aaeff3d8c72f22edd80968b7ffad5355 ******/
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "
Parameters
----------
C1: Bisector_Bisec
D1: IntRes2d_Domain
C2: Bisector_Bisec
D2: IntRes2d_Domain
TolConf: float
Tol: float
ComunElement: bool

Return
-------
None

Description
-----------
Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimization of the computation.
") Bisector_Inter;
		 Bisector_Inter(const Bisector_Bisec & C1, const IntRes2d_Domain & D1, const Bisector_Bisec & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol, const Standard_Boolean ComunElement);

		/****** Bisector_Inter::Perform ******/
		/****** md5 signature: ddbb1551e9c7cf37d31b930e3241d583 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Bisector_Bisec
D1: IntRes2d_Domain
C2: Bisector_Bisec
D2: IntRes2d_Domain
TolConf: float
Tol: float
ComunElement: bool

Return
-------
None

Description
-----------
Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimization of the computation.
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
		/****** Bisector_PointOnBis::Bisector_PointOnBis ******/
		/****** md5 signature: 63e7f02317b094a6fec372232b767eb4 ******/
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_PointOnBis;
		 Bisector_PointOnBis();

		/****** Bisector_PointOnBis::Bisector_PointOnBis ******/
		/****** md5 signature: d20ced0f8cc3f3d622bc9e548bd213fe ******/
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "
Parameters
----------
Param1: float
Param2: float
ParamBis: float
Distance: float
Point: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Bisector_PointOnBis;
		 Bisector_PointOnBis(const Standard_Real Param1, const Standard_Real Param2, const Standard_Real ParamBis, const Standard_Real Distance, const gp_Pnt2d & Point);

		/****** Bisector_PointOnBis::Distance ******/
		/****** md5 signature: 3d8e58dc0e28ccf0d2f126234669088c ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Distance: float

Return
-------
None

Description
-----------
No available documentation.
") Distance;
		void Distance(const Standard_Real Distance);

		/****** Bisector_PointOnBis::Distance ******/
		/****** md5 signature: c054352e1b604c83d759bc4ccf6c526d ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Distance;
		Standard_Real Distance();

		/****** Bisector_PointOnBis::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** Bisector_PointOnBis::IsInfinite ******/
		/****** md5 signature: c22d0728817de9ea8ad6f0a2d88a935b ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "
Parameters
----------
Infinite: bool

Return
-------
None

Description
-----------
No available documentation.
") IsInfinite;
		void IsInfinite(const Standard_Boolean Infinite);

		/****** Bisector_PointOnBis::IsInfinite ******/
		/****** md5 signature: 800afae87f4e1f5e34cb9eb46c14c258 ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsInfinite;
		Standard_Boolean IsInfinite();

		/****** Bisector_PointOnBis::ParamOnBis ******/
		/****** md5 signature: 2a06a99e4b08f6296a85a2d8e73c5351 ******/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") ParamOnBis;
		void ParamOnBis(const Standard_Real Param);

		/****** Bisector_PointOnBis::ParamOnBis ******/
		/****** md5 signature: f67c7c80951bdacb9684e5a4011ab759 ******/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParamOnBis;
		Standard_Real ParamOnBis();

		/****** Bisector_PointOnBis::ParamOnC1 ******/
		/****** md5 signature: 2db8bd05328faa84ee9d303902d8f2bf ******/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") ParamOnC1;
		void ParamOnC1(const Standard_Real Param);

		/****** Bisector_PointOnBis::ParamOnC1 ******/
		/****** md5 signature: b6583f639246f74ed76f20992798cf9c ******/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParamOnC1;
		Standard_Real ParamOnC1();

		/****** Bisector_PointOnBis::ParamOnC2 ******/
		/****** md5 signature: 98783de9a7c5ee8d0931b4c5f4a1872d ******/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") ParamOnC2;
		void ParamOnC2(const Standard_Real Param);

		/****** Bisector_PointOnBis::ParamOnC2 ******/
		/****** md5 signature: e502fc8d8313c7e88bcc270cff52b4e8 ******/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParamOnC2;
		Standard_Real ParamOnC2();

		/****** Bisector_PointOnBis::Point ******/
		/****** md5 signature: fe253a4fee17763769a3905b741f0819 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Point;
		void Point(const gp_Pnt2d & P);

		/****** Bisector_PointOnBis::Point ******/
		/****** md5 signature: f810beee1f685fcd6fb3b73efe41028f ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
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
		/****** Bisector_PolyBis::Bisector_PolyBis ******/
		/****** md5 signature: 0cfd13bfdc232aa96631a171648e1b9d ******/
		%feature("compactdefaultargs") Bisector_PolyBis;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_PolyBis;
		 Bisector_PolyBis();

		/****** Bisector_PolyBis::Append ******/
		/****** md5 signature: da3b82f65e563d5fdf7c58e07596946f ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
Point: Bisector_PointOnBis

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const Bisector_PointOnBis & Point);

		/****** Bisector_PolyBis::First ******/
		/****** md5 signature: 8a04854f4bd43f8bd98db514b401eb6e ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
Bisector_PointOnBis

Description
-----------
No available documentation.
") First;
		const Bisector_PointOnBis & First();

		/****** Bisector_PolyBis::Interval ******/
		/****** md5 signature: 74c2cabdf1ec19a1f24a392e69bb1d55 ******/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
int

Description
-----------
No available documentation.
") Interval;
		Standard_Integer Interval(const Standard_Real U);

		/****** Bisector_PolyBis::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** Bisector_PolyBis::Last ******/
		/****** md5 signature: 5e27620ceac300d8b92d02d6453ba01a ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
Bisector_PointOnBis

Description
-----------
No available documentation.
") Last;
		const Bisector_PointOnBis & Last();

		/****** Bisector_PolyBis::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Length;
		Standard_Integer Length();

		/****** Bisector_PolyBis::Transform ******/
		/****** md5 signature: dace16a29a39216c0dd584c6964e840b ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Bisector_PolyBis::Value ******/
		/****** md5 signature: 4f2d15b5fff36e44f78586db4357d093 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Bisector_PointOnBis

Description
-----------
No available documentation.
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
		/****** Bisector_BisecAna::Bisector_BisecAna ******/
		/****** md5 signature: 0d65d11afa2cc569f4caba4128539b9a ******/
		%feature("compactdefaultargs") Bisector_BisecAna;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_BisecAna;
		 Bisector_BisecAna();

		/****** Bisector_BisecAna::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Bisector_BisecAna::Copy ******/
		/****** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Bisector_BisecAna::D0 ******/
		/****** md5 signature: 01a5234aae6db090351bac35b3718fd9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****** Bisector_BisecAna::D1 ******/
		/****** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** Bisector_BisecAna::D2 ******/
		/****** md5 signature: acc8c0955596bb0bf809102736ad1124 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Bisector_BisecAna::D3 ******/
		/****** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Bisector_BisecAna::DN ******/
		/****** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****** Bisector_BisecAna::Dump ******/
		/****** md5 signature: 23c1db28cacdaffb331052739c78df8b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Deep: int (optional, default to 0)
Offset: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer Deep = 0, const Standard_Integer Offset = 0);

		/****** Bisector_BisecAna::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Bisector_BisecAna::Geom2dCurve ******/
		/****** md5 signature: abcd44f52397ef0bfa09dd48df49f2c6 ******/
		%feature("compactdefaultargs") Geom2dCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Geom2dCurve;
		opencascade::handle<Geom2d_Curve> Geom2dCurve();

		/****** Bisector_BisecAna::Init ******/
		/****** md5 signature: 07e89ee657e1bcfa1082e3c53ecfd222 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
bisector: Geom2d_TrimmedCurve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_TrimmedCurve> & bisector);

		/****** Bisector_BisecAna::IntervalFirst ******/
		/****** md5 signature: 26ceac01a62ec22c7e822fa07bd00ba8 ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		Standard_Real IntervalFirst(const Standard_Integer Index);

		/****** Bisector_BisecAna::IntervalLast ******/
		/****** md5 signature: ac3f1afc626dcb57a8f90c42ab96a1a6 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		Standard_Real IntervalLast(const Standard_Integer Index);

		/****** Bisector_BisecAna::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the curve. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Bisector_BisecAna::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Bisector_BisecAna::IsExtendAtEnd ******/
		/****** md5 signature: 726d1a23c6824c1f3df11fa9c8594123 ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****** Bisector_BisecAna::IsExtendAtStart ******/
		/****** md5 signature: eed6f2d113851eb819af3886c3a10ba0 ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****** Bisector_BisecAna::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Bisector_BisecAna::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** Bisector_BisecAna::NbIntervals ******/
		/****** md5 signature: 2f9f3a515d8495f09df4987b6d0933b4 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****** Bisector_BisecAna::Parameter ******/
		/****** md5 signature: ca089b85d2f90fc99bae6c7f4cfeb9e5 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter(const gp_Pnt2d & P);

		/****** Bisector_BisecAna::ParameterOfEndPoint ******/
		/****** md5 signature: 2b155a85b659e36f13767bf9dd30f490 ******/
		%feature("compactdefaultargs") ParameterOfEndPoint;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOfEndPoint;
		Standard_Real ParameterOfEndPoint();

		/****** Bisector_BisecAna::ParameterOfStartPoint ******/
		/****** md5 signature: 21ad3f21ab318a397dc77908c2cf36cb ******/
		%feature("compactdefaultargs") ParameterOfStartPoint;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOfStartPoint;
		Standard_Real ParameterOfStartPoint();

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: fb60162720d8c50ac1c9de9627e7e5f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
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
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const GeomAbs_JoinType jointype, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: db93a55a64615589c218fc350bd5fc5b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
Pnt: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const opencascade::handle<Geom2d_Point> & Pnt, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: 4bc1957ebd7bba22e94551f1f80cb51e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt: Geom2d_Point
Cu: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt, const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: b02fc98be2a333e2fd00a9e617d3c1ab ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt1: Geom2d_Point
Pnt2: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: float
Tolerance: float (optional, default to 0.0)
oncurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the bisecting line between the two points <Pnt1> and <Pnt2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt1, const opencascade::handle<Geom2d_Point> & Pnt2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const Standard_Real Sense, const Standard_Real Tolerance = 0.0, const Standard_Boolean oncurve = Standard_True);

		/****** Bisector_BisecAna::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** Bisector_BisecAna::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
No available documentation.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Bisector_BisecAna::SetTrim ******/
		/****** md5 signature: 7b91668841d99d4ce0903be5c9fe2ff8 ******/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve

Return
-------
None

Description
-----------
Trim <self> by a domain defined by the curve <Cu>. This domain is the set of the points which are nearest from <Cu> than the extremitis of <Cu>.
") SetTrim;
		void SetTrim(const opencascade::handle<Geom2d_Curve> & Cu);

		/****** Bisector_BisecAna::SetTrim ******/
		/****** md5 signature: b905e29612c27e95bca2fd090f152e87 ******/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "
Parameters
----------
uf: float
ul: float

Return
-------
None

Description
-----------
Trim <self> by a domain defined by uf and ul.
") SetTrim;
		void SetTrim(const Standard_Real uf, const Standard_Real ul);

		/****** Bisector_BisecAna::Transform ******/
		/****** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Bisector_BisecCC::Bisector_BisecCC ******/
		/****** md5 signature: 87b14a7e3b15d49238cbdddb2458f82b ******/
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_BisecCC;
		 Bisector_BisecCC();

		/****** Bisector_BisecCC::Bisector_BisecCC ******/
		/****** md5 signature: b7a10bfb46a2005b4bf2e5d04eb46d71 ******/
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "
Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
Side1: float
Side2: float
Origin: gp_Pnt2d
DistMax: float (optional, default to 500)

Return
-------
None

Description
-----------
Constructs the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Bisector_BisecCC;
		 Bisector_BisecCC(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const Standard_Real Side1, const Standard_Real Side2, const gp_Pnt2d & Origin, const Standard_Real DistMax = 500);

		/****** Bisector_BisecCC::ChangeGuide ******/
		/****** md5 signature: ac2e0495e4a0d40e5db2cbf3fc1a0d37 ******/
		%feature("compactdefaultargs") ChangeGuide;
		%feature("autodoc", "Return
-------
opencascade::handle<Bisector_BisecCC>

Description
-----------
The parameter on <self> is linked to the parameter on the first curve. This method creates the same bisector where the curves are inversed.
") ChangeGuide;
		opencascade::handle<Bisector_BisecCC> ChangeGuide();

		/****** Bisector_BisecCC::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Bisector_BisecCC::Copy ******/
		/****** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Bisector_BisecCC::Curve ******/
		/****** md5 signature: 4f7582321d8b4bbdb047c27b823a49c6 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
IndCurve: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Geom2d_Curve> Curve(const Standard_Integer IndCurve);

		/****** Bisector_BisecCC::D0 ******/
		/****** md5 signature: 01a5234aae6db090351bac35b3718fd9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****** Bisector_BisecCC::D1 ******/
		/****** md5 signature: 79a293d0b91ab6d1359881075119fb56 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** Bisector_BisecCC::D2 ******/
		/****** md5 signature: acc8c0955596bb0bf809102736ad1124 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Bisector_BisecCC::D3 ******/
		/****** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Bisector_BisecCC::DN ******/
		/****** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****** Bisector_BisecCC::Dump ******/
		/****** md5 signature: 23c1db28cacdaffb331052739c78df8b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Deep: int (optional, default to 0)
Offset: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer Deep = 0, const Standard_Integer Offset = 0);

		/****** Bisector_BisecCC::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Bisector_BisecCC::IntervalContinuity ******/
		/****** md5 signature: 4fe081a978745bbd0e32a19f5e1db952 ******/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity();

		/****** Bisector_BisecCC::IntervalFirst ******/
		/****** md5 signature: 26ceac01a62ec22c7e822fa07bd00ba8 ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		Standard_Real IntervalFirst(const Standard_Integer Index);

		/****** Bisector_BisecCC::IntervalLast ******/
		/****** md5 signature: ac3f1afc626dcb57a8f90c42ab96a1a6 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		Standard_Real IntervalLast(const Standard_Integer Index);

		/****** Bisector_BisecCC::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the curve. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Bisector_BisecCC::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Bisector_BisecCC::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** Bisector_BisecCC::IsExtendAtEnd ******/
		/****** md5 signature: 726d1a23c6824c1f3df11fa9c8594123 ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****** Bisector_BisecCC::IsExtendAtStart ******/
		/****** md5 signature: eed6f2d113851eb819af3886c3a10ba0 ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****** Bisector_BisecCC::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Bisector_BisecCC::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** Bisector_BisecCC::LinkBisCurve ******/
		/****** md5 signature: 55ab0cec865e9ea9faed38185d303c1b ******/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.
") LinkBisCurve;
		Standard_Real LinkBisCurve(const Standard_Real U);

		/****** Bisector_BisecCC::LinkCurveBis ******/
		/****** md5 signature: b0393e62df20de8ab3e4695b6cecfbc2 ******/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the reciproque of LinkBisCurve.
") LinkCurveBis;
		Standard_Real LinkCurveBis(const Standard_Real U);

		/****** Bisector_BisecCC::NbIntervals ******/
		/****** md5 signature: 2f9f3a515d8495f09df4987b6d0933b4 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****** Bisector_BisecCC::Parameter ******/
		/****** md5 signature: ca089b85d2f90fc99bae6c7f4cfeb9e5 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter(const gp_Pnt2d & P);

		/****** Bisector_BisecCC::Perform ******/
		/****** md5 signature: fae8efeaf20f5251b3bb2a78bdbbd0d6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
Side1: float
Side2: float
Origin: gp_Pnt2d
DistMax: float (optional, default to 500)

Return
-------
None

Description
-----------
Computes the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. //! <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const Standard_Real Side1, const Standard_Real Side2, const gp_Pnt2d & Origin, const Standard_Real DistMax = 500);

		/****** Bisector_BisecCC::Polygon ******/
		/****** md5 signature: 0adc7dc97a83bfc84693e7af983e76d4 ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "Return
-------
Bisector_PolyBis

Description
-----------
No available documentation.
") Polygon;
		const Bisector_PolyBis & Polygon();

		/****** Bisector_BisecCC::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** Bisector_BisecCC::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
No available documentation.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Bisector_BisecCC::Transform ******/
		/****** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Transformation of a geometric object. This transformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Bisector_BisecCC::ValueAndDist ******/
		/****** md5 signature: c1e89ac2312e0b68d9e854a27a72ebb0 ******/
		%feature("compactdefaultargs") ValueAndDist;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
U1: float
U2: float
Distance: float

Description
-----------
Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.
") ValueAndDist;
		gp_Pnt2d ValueAndDist(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bisector_BisecCC::ValueByInt ******/
		/****** md5 signature: 887792daba949624653f20427d8b1fcd ******/
		%feature("compactdefaultargs") ValueByInt;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
U1: float
U2: float
Distance: float

Description
-----------
Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.
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
		/****** Bisector_BisecPC::Bisector_BisecPC ******/
		/****** md5 signature: cf514e534127a826f335e20c812871d7 ******/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Bisector_BisecPC;
		 Bisector_BisecPC();

		/****** Bisector_BisecPC::Bisector_BisecPC ******/
		/****** md5 signature: 1365427db49d7771559efb2b783b9495 ******/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: float
DistMax: float (optional, default to 500)

Return
-------
None

Description
-----------
Constructs the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Bisector_BisecPC;
		 Bisector_BisecPC(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const Standard_Real Side, const Standard_Real DistMax = 500);

		/****** Bisector_BisecPC::Bisector_BisecPC ******/
		/****** md5 signature: c4a1dc45924f741e58ac3ed6ac71fc88 ******/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: float
UMin: float
UMax: float

Return
-------
None

Description
-----------
Constructs the bisector between the point <P> and the curve <Cu> Trimmed by <UMin> and <UMax> <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. Warning: the bisector is supposed all over defined between <UMin> and <UMax>.
") Bisector_BisecPC;
		 Bisector_BisecPC(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const Standard_Real Side, const Standard_Real UMin, const Standard_Real UMax);

		/****** Bisector_BisecPC::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Bisector_BisecPC::Copy ******/
		/****** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Bisector_BisecPC::D0 ******/
		/****** md5 signature: 01a5234aae6db090351bac35b3718fd9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****** Bisector_BisecPC::D1 ******/
		/****** md5 signature: 79a293d0b91ab6d1359881075119fb56 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** Bisector_BisecPC::D2 ******/
		/****** md5 signature: acc8c0955596bb0bf809102736ad1124 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Bisector_BisecPC::D3 ******/
		/****** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Bisector_BisecPC::DN ******/
		/****** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****** Bisector_BisecPC::Distance ******/
		/****** md5 signature: 2f53d099539d1d19d9f9030927d9cfd3 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the distance between the point of parameter U on <self> and my point or my curve.
") Distance;
		Standard_Real Distance(const Standard_Real U);

		/****** Bisector_BisecPC::Dump ******/
		/****** md5 signature: 23c1db28cacdaffb331052739c78df8b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Deep: int (optional, default to 0)
Offset: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer Deep = 0, const Standard_Integer Offset = 0);

		/****** Bisector_BisecPC::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Value of the first parameter.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Bisector_BisecPC::IntervalContinuity ******/
		/****** md5 signature: 4fe081a978745bbd0e32a19f5e1db952 ******/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity();

		/****** Bisector_BisecPC::IntervalFirst ******/
		/****** md5 signature: 26ceac01a62ec22c7e822fa07bd00ba8 ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		Standard_Real IntervalFirst(const Standard_Integer Index);

		/****** Bisector_BisecPC::IntervalLast ******/
		/****** md5 signature: ac3f1afc626dcb57a8f90c42ab96a1a6 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		Standard_Real IntervalLast(const Standard_Integer Index);

		/****** Bisector_BisecPC::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the curve. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Bisector_BisecPC::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Bisector_BisecPC::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <True> if the bisector is empty.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** Bisector_BisecPC::IsExtendAtEnd ******/
		/****** md5 signature: 726d1a23c6824c1f3df11fa9c8594123 ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the bisector is extended at end.
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****** Bisector_BisecPC::IsExtendAtStart ******/
		/****** md5 signature: eed6f2d113851eb819af3886c3a10ba0 ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the bisector is extended at start.
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****** Bisector_BisecPC::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Bisector_BisecPC::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Value of the last parameter.
") LastParameter;
		Standard_Real LastParameter();

		/****** Bisector_BisecPC::LinkBisCurve ******/
		/****** md5 signature: 55ab0cec865e9ea9faed38185d303c1b ******/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.
") LinkBisCurve;
		Standard_Real LinkBisCurve(const Standard_Real U);

		/****** Bisector_BisecPC::LinkCurveBis ******/
		/****** md5 signature: b0393e62df20de8ab3e4695b6cecfbc2 ******/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the reciproque of LinkBisCurve.
") LinkCurveBis;
		Standard_Real LinkCurveBis(const Standard_Real U);

		/****** Bisector_BisecPC::NbIntervals ******/
		/****** md5 signature: 2f9f3a515d8495f09df4987b6d0933b4 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****** Bisector_BisecPC::Parameter ******/
		/****** md5 signature: ca089b85d2f90fc99bae6c7f4cfeb9e5 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
float

Description
-----------
Returns the parameter on <self> corresponding to <P>.
") Parameter;
		Standard_Real Parameter(const gp_Pnt2d & P);

		/****** Bisector_BisecPC::Perform ******/
		/****** md5 signature: 4f1397939b801b8c018eca1a300ed682 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: float
DistMax: float (optional, default to 500)

Return
-------
None

Description
-----------
Construct the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const Standard_Real Side, const Standard_Real DistMax = 500);

		/****** Bisector_BisecPC::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the direction of parametrization of <self>. The orientation of the curve is modified. If the curve is bounded the StartPoint of the initial curve becomes the EndPoint of the reversed curve and the EndPoint of the initial curve becomes the StartPoint of the reversed curve.
") Reverse;
		void Reverse();

		/****** Bisector_BisecPC::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Bisector_BisecPC::Transform ******/
		/****** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Transformation of a geometric object. This transformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def bisector_IsConvex(*args):
	return bisector.IsConvex(*args)

}
