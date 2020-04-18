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
		%feature("compactdefaultargs") Bisector_Bisec;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_Bisec;
		 Bisector_Bisec();

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Returns the curve of <self>.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
") ChangeValue;
		const opencascade::handle<Geom2d_TrimmedCurve> & ChangeValue();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtEnd;
		virtual Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtStart;
		virtual Standard_Boolean IsExtendAtStart();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_FunctionInter;
		 Bisector_FunctionInter();

		/****************** Bisector_FunctionInter ******************/
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
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_Inter;
		 Bisector_Inter();

		/****************** Bisector_Inter ******************/
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
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_PointOnBis;
		 Bisector_PointOnBis();

		/****************** Bisector_PointOnBis ******************/
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
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsInfinite ******************/
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
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsInfinite;
		Standard_Boolean IsInfinite();

		/****************** ParamOnBis ******************/
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
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParamOnBis;
		Standard_Real ParamOnBis();

		/****************** ParamOnC1 ******************/
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
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParamOnC1;
		Standard_Real ParamOnC1();

		/****************** ParamOnC2 ******************/
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
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParamOnC2;
		Standard_Real ParamOnC2();

		/****************** Point ******************/
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
		%feature("compactdefaultargs") Bisector_PolyBis;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_PolyBis;
		 Bisector_PolyBis();

		/****************** Append ******************/
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
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
Bisector_PointOnBis
") First;
		const Bisector_PointOnBis & First();

		/****************** Interval ******************/
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
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
Bisector_PointOnBis
") Last;
		const Bisector_PointOnBis & Last();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Transform ******************/
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
		%feature("compactdefaultargs") Bisector_BisecAna;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_BisecAna;
		 Bisector_BisecAna();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
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
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Geom2dCurve ******************/
		%feature("compactdefaultargs") Geom2dCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Geom2dCurve;
		opencascade::handle<Geom2d_Curve> Geom2dCurve();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsExtendAtEnd ******************/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") ParameterOfEndPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOfEndPoint;
		Standard_Real ParameterOfEndPoint();

		/****************** ParameterOfStartPoint ******************/
		%feature("compactdefaultargs") ParameterOfStartPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOfStartPoint;
		Standard_Real ParameterOfStartPoint();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
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
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_BisecCC;
		 Bisector_BisecCC();

		/****************** Bisector_BisecCC ******************/
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
		%feature("compactdefaultargs") ChangeGuide;
		%feature("autodoc", "The parameter on <self> is linked to the parameter on the first curve. this method creates the same bisector where the curves are inversed.

Returns
-------
opencascade::handle<Bisector_BisecCC>
") ChangeGuide;
		opencascade::handle<Bisector_BisecCC> ChangeGuide();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IntervalContinuity ******************/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity();

		/****************** IntervalFirst ******************/
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsExtendAtEnd ******************/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LinkBisCurve ******************/
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
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Returns
-------
Bisector_PolyBis
") Polygon;
		const Bisector_PolyBis & Polygon();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
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
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Bisector_BisecPC;
		 Bisector_BisecPC();

		/****************** Bisector_BisecPC ******************/
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
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
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
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Value of the first parameter.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IntervalContinuity ******************/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity();

		/****************** IntervalFirst ******************/
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns <true> if the bisector is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsExtendAtEnd ******************/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "Returns true if the bisector is extended at end.

Returns
-------
bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "Returns true if the bisector is extended at start.

Returns
-------
bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Value of the last parameter.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LinkBisCurve ******************/
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
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <c1>. and returns the number of intervals.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the orientation of the curve is modified. if the curve is bounded the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
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
