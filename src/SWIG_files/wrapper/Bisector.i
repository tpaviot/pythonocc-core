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
		/****** md5 signature: ef1b51cd2f0bdb2f39ef5776bd234202 ******/
		%feature("compactdefaultargs") IsConvex;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
Sign: double

Return
-------
bool

Description
-----------
No available documentation.
") IsConvex;
		static bool IsConvex(const opencascade::handle<Geom2d_Curve> & Cu, const double Sign);

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
		/****** md5 signature: 70fea80849d2cd56acb33dcd47d16670 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
ajointype: GeomAbs_JoinType
Tolerance: double
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const GeomAbs_JoinType ajointype, const double Tolerance, const bool oncurve = true);

		/****** Bisector_Bisec::Perform ******/
		/****** md5 signature: 20f45a1530f2ab0b313c9c963fcff4c6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
Pnt: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
Tolerance: double
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const opencascade::handle<Geom2d_Point> & Pnt, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const double Tolerance, const bool oncurve = true);

		/****** Bisector_Bisec::Perform ******/
		/****** md5 signature: b9236c163bc170a7b056320452f57dc2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt: Geom2d_Point
Cu: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
Tolerance: double
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt, const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const double Tolerance, const bool oncurve = true);

		/****** Bisector_Bisec::Perform ******/
		/****** md5 signature: 5261f4895bba68019db3e1ff26bd8bbe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt1: Geom2d_Point
Pnt2: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
Tolerance: double (optional, default to 0.0)
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the two points <Pnt1> and <Pnt2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt1, const opencascade::handle<Geom2d_Point> & Pnt2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const double Tolerance = 0.0, const bool oncurve = true);

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
		/****** md5 signature: 99655552b7b62c29e80f640aa19081ce ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		virtual double IntervalFirst(const int Index);

		/****** Bisector_Curve::IntervalLast ******/
		/****** md5 signature: 56d5c069007d30a03e949764a72e378f ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		virtual double IntervalLast(const int Index);

		/****** Bisector_Curve::IsExtendAtEnd ******/
		/****** md5 signature: 8d9a64697ea335e8c2213dcc746aa6cb ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtEnd;
		virtual bool IsExtendAtEnd();

		/****** Bisector_Curve::IsExtendAtStart ******/
		/****** md5 signature: ec8b34296bb245ae693d3da5449ef9e8 ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtStart;
		virtual bool IsExtendAtStart();

		/****** Bisector_Curve::NbIntervals ******/
		/****** md5 signature: d3bf3d684887aead8770e729a42dcaf2 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		virtual int NbIntervals();

		/****** Bisector_Curve::Parameter ******/
		/****** md5 signature: 2d52d0e66493fe9cd350f91c32316d8a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		virtual double Parameter(const gp_Pnt2d & P);

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
		/****** md5 signature: 5b661e723f14c67a734d7bc68bb6cabf ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
No available documentation.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** Bisector_FunctionH::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
Computes the values of the Functions for the variable <X>.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** Bisector_FunctionH::Values ******/
		/****** md5 signature: 44ea1ebbd1c996779e93f28435817e28 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
Returns the values of the functions and the derivatives for the variable <X>.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 5b661e723f14c67a734d7bc68bb6cabf ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
No available documentation.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

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
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
Computes the values of the Functions for the variable <X>.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** Bisector_FunctionInter::Values ******/
		/****** md5 signature: 44ea1ebbd1c996779e93f28435817e28 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
Returns the values of the functions and the derivatives for the variable <X>.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 9dee11125fdd245a200954f9a614f36f ******/
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "
Parameters
----------
C1: Bisector_Bisec
D1: IntRes2d_Domain
C2: Bisector_Bisec
D2: IntRes2d_Domain
TolConf: double
Tol: double
ComunElement: bool

Return
-------
None

Description
-----------
Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimization of the computation.
") Bisector_Inter;
		 Bisector_Inter(const Bisector_Bisec & C1, const IntRes2d_Domain & D1, const Bisector_Bisec & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol, const bool ComunElement);

		/****** Bisector_Inter::Perform ******/
		/****** md5 signature: 4a1f73534672cede01c1d4601629c0dc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Bisector_Bisec
D1: IntRes2d_Domain
C2: Bisector_Bisec
D2: IntRes2d_Domain
TolConf: double
Tol: double
ComunElement: bool

Return
-------
None

Description
-----------
Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimization of the computation.
") Perform;
		void Perform(const Bisector_Bisec & C1, const IntRes2d_Domain & D1, const Bisector_Bisec & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol, const bool ComunElement);

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
		/****** md5 signature: 08905c373fdb669d3c8a363fbfad08e2 ******/
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "
Parameters
----------
Param1: double
Param2: double
ParamBis: double
Distance: double
Point: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Bisector_PointOnBis;
		 Bisector_PointOnBis(const double Param1, const double Param2, const double ParamBis, const double Distance, const gp_Pnt2d & Point);

		/****** Bisector_PointOnBis::Distance ******/
		/****** md5 signature: 71b12f543bf97ed4cc0bf3009a2c1231 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Distance: double

Return
-------
None

Description
-----------
No available documentation.
") Distance;
		void Distance(const double Distance);

		/****** Bisector_PointOnBis::Distance ******/
		/****** md5 signature: 4132595ec8b1977b3cfc8920d72365c4 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Distance;
		double Distance();

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
		/****** md5 signature: 77e94d2cd49ded99066ba46acaf7cc76 ******/
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
		void IsInfinite(const bool Infinite);

		/****** Bisector_PointOnBis::IsInfinite ******/
		/****** md5 signature: 347147d43ae7004cb4238ce68cb49a93 ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsInfinite;
		bool IsInfinite();

		/****** Bisector_PointOnBis::ParamOnBis ******/
		/****** md5 signature: 19c5810987b97e190e63b356cd5efa2c ******/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") ParamOnBis;
		void ParamOnBis(const double Param);

		/****** Bisector_PointOnBis::ParamOnBis ******/
		/****** md5 signature: b8a8e85fa5ede397d5cbdf3432e1cec8 ******/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParamOnBis;
		double ParamOnBis();

		/****** Bisector_PointOnBis::ParamOnC1 ******/
		/****** md5 signature: 9c81231e3681f1bb571b85bfae1be125 ******/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") ParamOnC1;
		void ParamOnC1(const double Param);

		/****** Bisector_PointOnBis::ParamOnC1 ******/
		/****** md5 signature: 3d7de9d3dad89a823b588f053b3ba169 ******/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParamOnC1;
		double ParamOnC1();

		/****** Bisector_PointOnBis::ParamOnC2 ******/
		/****** md5 signature: 86e3836832a3d1eb167743f9802a50e8 ******/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") ParamOnC2;
		void ParamOnC2(const double Param);

		/****** Bisector_PointOnBis::ParamOnC2 ******/
		/****** md5 signature: ae51f460c3d39c33b1a8a0b1f0803e25 ******/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParamOnC2;
		double ParamOnC2();

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
		/****** md5 signature: 98891b3be011e0e035597d01f91dcca2 ******/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
int

Description
-----------
No available documentation.
") Interval;
		int Interval(const double U);

		/****** Bisector_PolyBis::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

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
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Length;
		int Length();

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
		/****** md5 signature: dcc03978ae4229c6d4e5dbb94d6d25ba ******/
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
		const Bisector_PointOnBis & Value(const int Index);

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
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
		/****** md5 signature: 357e0361ce7af4bdc756de6d7ba219d9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Bisector_BisecAna::Dump ******/
		/****** md5 signature: 80020b5ebb73e4528ffd0899ab5418e2 ******/
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
		void Dump(const int Deep = 0, const int Offset = 0);

		/****** Bisector_BisecAna::EvalD0 ******/
		/****** md5 signature: 906c1954ad2c441a8d2d10327423eb22 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Bisector_BisecAna::EvalD1 ******/
		/****** md5 signature: 9411f79f4780b96d9e9fd540bc850db2 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
No available documentation.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Bisector_BisecAna::EvalD2 ******/
		/****** md5 signature: 873d39bbe6726a825ce2692aa540639a ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
No available documentation.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Bisector_BisecAna::EvalD3 ******/
		/****** md5 signature: 0ba3f739127d2d82fd4e9592e677c79f ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
No available documentation.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Bisector_BisecAna::EvalDN ******/
		/****** md5 signature: 59d817433f8dda304d1c0b135cce1876 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Bisector_BisecAna::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

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
		/****** md5 signature: f758b97d76c39edfd490abe5c4b54053 ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		double IntervalFirst(const int Index);

		/****** Bisector_BisecAna::IntervalLast ******/
		/****** md5 signature: d450818d2902f52b874c31871811c146 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		double IntervalLast(const int Index);

		/****** Bisector_BisecAna::IsCN ******/
		/****** md5 signature: 7148abeb948e78dbe081ec4edd4357f0 ******/
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
		bool IsCN(const int N);

		/****** Bisector_BisecAna::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** Bisector_BisecAna::IsExtendAtEnd ******/
		/****** md5 signature: cbc5318cdb2ef3a576b63d79ef09cb2a ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtEnd;
		bool IsExtendAtEnd();

		/****** Bisector_BisecAna::IsExtendAtStart ******/
		/****** md5 signature: 32d0a6a20a5cb358cd05cfbca7d8f624 ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtStart;
		bool IsExtendAtStart();

		/****** Bisector_BisecAna::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** Bisector_BisecAna::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** Bisector_BisecAna::NbIntervals ******/
		/****** md5 signature: 3a4cef1c1a259df13c4a400a83407531 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals();

		/****** Bisector_BisecAna::Parameter ******/
		/****** md5 signature: 626e16d27b509da60a1f611e7ce38a78 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter(const gp_Pnt2d & P);

		/****** Bisector_BisecAna::ParameterOfEndPoint ******/
		/****** md5 signature: 351e04155b9d286242bcaa2ba2b7cdef ******/
		%feature("compactdefaultargs") ParameterOfEndPoint;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOfEndPoint;
		double ParameterOfEndPoint();

		/****** Bisector_BisecAna::ParameterOfStartPoint ******/
		/****** md5 signature: e43be26d00b489a59cbab49a9336b65f ******/
		%feature("compactdefaultargs") ParameterOfStartPoint;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOfStartPoint;
		double ParameterOfStartPoint();

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: 52b7eb910fe6f5c43cffc8b9ac563fc3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
jointype: GeomAbs_JoinType
Tolerance: double
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const GeomAbs_JoinType jointype, const double Tolerance, const bool oncurve = true);

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: 20f45a1530f2ab0b313c9c963fcff4c6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
Pnt: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
Tolerance: double
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const opencascade::handle<Geom2d_Point> & Pnt, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const double Tolerance, const bool oncurve = true);

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: b9236c163bc170a7b056320452f57dc2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt: Geom2d_Point
Cu: Geom2d_Curve
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
Tolerance: double
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt, const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const double Tolerance, const bool oncurve = true);

		/****** Bisector_BisecAna::Perform ******/
		/****** md5 signature: 5261f4895bba68019db3e1ff26bd8bbe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnt1: Geom2d_Point
Pnt2: Geom2d_Point
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
Sense: double
Tolerance: double (optional, default to 0.0)
oncurve: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the bisecting line between the two points <Pnt1> and <Pnt2>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Point> & Pnt1, const opencascade::handle<Geom2d_Point> & Pnt2, const gp_Pnt2d & P, const gp_Vec2d & V1, const gp_Vec2d & V2, const double Sense, const double Tolerance = 0.0, const bool oncurve = true);

		/****** Bisector_BisecAna::Reverse ******/
		/****** md5 signature: 061259e9a1d8313b86b97b8a1591d999 ******/
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
		/****** md5 signature: d1c5381c0a990adfec963bc4b96f0b60 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
No available documentation.
") ReversedParameter;
		double ReversedParameter(const double U);

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
		/****** md5 signature: f0d5986749f42812e2f1fd670aad29f0 ******/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "
Parameters
----------
uf: double
ul: double

Return
-------
None

Description
-----------
Trim <self> by a domain defined by uf and ul.
") SetTrim;
		void SetTrim(const double uf, const double ul);

		/****** Bisector_BisecAna::Transform ******/
		/****** md5 signature: c3e9d0cbb6ef2be1d446ca43c7e51616 ******/
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
		/****** md5 signature: c1972b51f45b20ffd0d560bf5a353fdb ******/
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "
Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
Side1: double
Side2: double
Origin: gp_Pnt2d
DistMax: double (optional, default to 500)

Return
-------
None

Description
-----------
Constructs the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Bisector_BisecCC;
		 Bisector_BisecCC(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const double Side1, const double Side2, const gp_Pnt2d & Origin, const double DistMax = 500);

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
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
		/****** md5 signature: 357e0361ce7af4bdc756de6d7ba219d9 ******/
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
		/****** md5 signature: 34b09ddd189e72a82d3e222f6e62ab3b ******/
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
		opencascade::handle<Geom2d_Curve> Curve(const int IndCurve);

		/****** Bisector_BisecCC::Dump ******/
		/****** md5 signature: 80020b5ebb73e4528ffd0899ab5418e2 ******/
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
		void Dump(const int Deep = 0, const int Offset = 0);

		/****** Bisector_BisecCC::EvalD0 ******/
		/****** md5 signature: 906c1954ad2c441a8d2d10327423eb22 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Bisector_BisecCC::EvalD1 ******/
		/****** md5 signature: 9411f79f4780b96d9e9fd540bc850db2 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
No available documentation.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Bisector_BisecCC::EvalD2 ******/
		/****** md5 signature: 873d39bbe6726a825ce2692aa540639a ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
No available documentation.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Bisector_BisecCC::EvalD3 ******/
		/****** md5 signature: 0ba3f739127d2d82fd4e9592e677c79f ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
No available documentation.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Bisector_BisecCC::EvalDN ******/
		/****** md5 signature: 59d817433f8dda304d1c0b135cce1876 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Bisector_BisecCC::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

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
		/****** md5 signature: f758b97d76c39edfd490abe5c4b54053 ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		double IntervalFirst(const int Index);

		/****** Bisector_BisecCC::IntervalLast ******/
		/****** md5 signature: d450818d2902f52b874c31871811c146 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		double IntervalLast(const int Index);

		/****** Bisector_BisecCC::IsCN ******/
		/****** md5 signature: 7148abeb948e78dbe081ec4edd4357f0 ******/
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
		bool IsCN(const int N);

		/****** Bisector_BisecCC::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** Bisector_BisecCC::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** Bisector_BisecCC::IsExtendAtEnd ******/
		/****** md5 signature: cbc5318cdb2ef3a576b63d79ef09cb2a ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtEnd;
		bool IsExtendAtEnd();

		/****** Bisector_BisecCC::IsExtendAtStart ******/
		/****** md5 signature: 32d0a6a20a5cb358cd05cfbca7d8f624 ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExtendAtStart;
		bool IsExtendAtStart();

		/****** Bisector_BisecCC::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** Bisector_BisecCC::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** Bisector_BisecCC::LinkBisCurve ******/
		/****** md5 signature: 380fc41e5c34b67d7744c7f5809964bb ******/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.
") LinkBisCurve;
		double LinkBisCurve(const double U);

		/****** Bisector_BisecCC::LinkCurveBis ******/
		/****** md5 signature: 71b368d0f37ae05ae071b164a263a522 ******/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the reciproque of LinkBisCurve.
") LinkCurveBis;
		double LinkCurveBis(const double U);

		/****** Bisector_BisecCC::NbIntervals ******/
		/****** md5 signature: 3a4cef1c1a259df13c4a400a83407531 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals();

		/****** Bisector_BisecCC::Parameter ******/
		/****** md5 signature: 626e16d27b509da60a1f611e7ce38a78 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter(const gp_Pnt2d & P);

		/****** Bisector_BisecCC::Perform ******/
		/****** md5 signature: c3ba8b3264981b546d953b604ef28375 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu1: Geom2d_Curve
Cu2: Geom2d_Curve
Side1: double
Side2: double
Origin: gp_Pnt2d
DistMax: double (optional, default to 500)

Return
-------
None

Description
-----------
Computes the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. //! <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu1, const opencascade::handle<Geom2d_Curve> & Cu2, const double Side1, const double Side2, const gp_Pnt2d & Origin, const double DistMax = 500);

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
		/****** md5 signature: 061259e9a1d8313b86b97b8a1591d999 ******/
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
		/****** md5 signature: d1c5381c0a990adfec963bc4b96f0b60 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
No available documentation.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Bisector_BisecCC::Transform ******/
		/****** md5 signature: c3e9d0cbb6ef2be1d446ca43c7e51616 ******/
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
		/****** md5 signature: 9b342b5985b27e56a4c2034ea5260282 ******/
		%feature("compactdefaultargs") ValueAndDist;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
U1: double
U2: double
Distance: double

Description
-----------
Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.
") ValueAndDist;
		gp_Pnt2d ValueAndDist(const double U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bisector_BisecCC::ValueByInt ******/
		/****** md5 signature: 4a46baa5ec4d61812811285296689089 ******/
		%feature("compactdefaultargs") ValueByInt;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
U1: double
U2: double
Distance: double

Description
-----------
Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.
") ValueByInt;
		gp_Pnt2d ValueByInt(const double U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: d0a18b799e0d88ec9f5d4c498f5d7278 ******/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: double
DistMax: double (optional, default to 500)

Return
-------
None

Description
-----------
Constructs the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Bisector_BisecPC;
		 Bisector_BisecPC(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const double Side, const double DistMax = 500);

		/****** Bisector_BisecPC::Bisector_BisecPC ******/
		/****** md5 signature: afdb8ed21562b269f8e7c4e70a51086f ******/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: double
UMin: double
UMax: double

Return
-------
None

Description
-----------
Constructs the bisector between the point <P> and the curve <Cu> Trimmed by <UMin> and <UMax> <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. Warning: the bisector is supposed all over defined between <UMin> and <UMax>.
") Bisector_BisecPC;
		 Bisector_BisecPC(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const double Side, const double UMin, const double UMax);

		/****** Bisector_BisecPC::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
		/****** md5 signature: 357e0361ce7af4bdc756de6d7ba219d9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Bisector_BisecPC::Distance ******/
		/****** md5 signature: 0c1036e505ef7d6a4a13f216e6a1450c ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the distance between the point of parameter U on <self> and my point or my curve.
") Distance;
		double Distance(const double U);

		/****** Bisector_BisecPC::Dump ******/
		/****** md5 signature: 80020b5ebb73e4528ffd0899ab5418e2 ******/
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
		void Dump(const int Deep = 0, const int Offset = 0);

		/****** Bisector_BisecPC::EvalD0 ******/
		/****** md5 signature: 906c1954ad2c441a8d2d10327423eb22 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Bisector_BisecPC::EvalD1 ******/
		/****** md5 signature: 9411f79f4780b96d9e9fd540bc850db2 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
No available documentation.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Bisector_BisecPC::EvalD2 ******/
		/****** md5 signature: 873d39bbe6726a825ce2692aa540639a ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
No available documentation.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Bisector_BisecPC::EvalD3 ******/
		/****** md5 signature: 0ba3f739127d2d82fd4e9592e677c79f ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
No available documentation.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Bisector_BisecPC::EvalDN ******/
		/****** md5 signature: 59d817433f8dda304d1c0b135cce1876 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Bisector_BisecPC::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Value of the first parameter.
") FirstParameter;
		double FirstParameter();

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
		/****** md5 signature: f758b97d76c39edfd490abe5c4b54053 ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		double IntervalFirst(const int Index);

		/****** Bisector_BisecPC::IntervalLast ******/
		/****** md5 signature: d450818d2902f52b874c31871811c146 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		double IntervalLast(const int Index);

		/****** Bisector_BisecPC::IsCN ******/
		/****** md5 signature: 7148abeb948e78dbe081ec4edd4357f0 ******/
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
		bool IsCN(const int N);

		/****** Bisector_BisecPC::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** Bisector_BisecPC::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <True> if the bisector is empty.
") IsEmpty;
		bool IsEmpty();

		/****** Bisector_BisecPC::IsExtendAtEnd ******/
		/****** md5 signature: cbc5318cdb2ef3a576b63d79ef09cb2a ******/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the bisector is extended at end.
") IsExtendAtEnd;
		bool IsExtendAtEnd();

		/****** Bisector_BisecPC::IsExtendAtStart ******/
		/****** md5 signature: 32d0a6a20a5cb358cd05cfbca7d8f624 ******/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the bisector is extended at start.
") IsExtendAtStart;
		bool IsExtendAtStart();

		/****** Bisector_BisecPC::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** Bisector_BisecPC::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Value of the last parameter.
") LastParameter;
		double LastParameter();

		/****** Bisector_BisecPC::LinkBisCurve ******/
		/****** md5 signature: 380fc41e5c34b67d7744c7f5809964bb ******/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.
") LinkBisCurve;
		double LinkBisCurve(const double U);

		/****** Bisector_BisecPC::LinkCurveBis ******/
		/****** md5 signature: 71b368d0f37ae05ae071b164a263a522 ******/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the reciproque of LinkBisCurve.
") LinkCurveBis;
		double LinkCurveBis(const double U);

		/****** Bisector_BisecPC::NbIntervals ******/
		/****** md5 signature: 3a4cef1c1a259df13c4a400a83407531 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals();

		/****** Bisector_BisecPC::Parameter ******/
		/****** md5 signature: 626e16d27b509da60a1f611e7ce38a78 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
double

Description
-----------
Returns the parameter on <self> corresponding to <P>.
") Parameter;
		double Parameter(const gp_Pnt2d & P);

		/****** Bisector_BisecPC::Perform ******/
		/****** md5 signature: 683fece077350b0b82077b8df599c507 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cu: Geom2d_Curve
P: gp_Pnt2d
Side: double
DistMax: double (optional, default to 500)

Return
-------
None

Description
-----------
Construct the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & Cu, const gp_Pnt2d & P, const double Side, const double DistMax = 500);

		/****** Bisector_BisecPC::Reverse ******/
		/****** md5 signature: 061259e9a1d8313b86b97b8a1591d999 ******/
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
		/****** md5 signature: d1c5381c0a990adfec963bc4b96f0b60 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Bisector_BisecPC::Transform ******/
		/****** md5 signature: c3e9d0cbb6ef2be1d446ca43c7e51616 ******/
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
