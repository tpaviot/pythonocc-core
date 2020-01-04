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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", ":param Cu:
	:type Cu: Geom2d_Curve
	:param Sign:
	:type Sign: float
	:rtype: bool") IsConvex;
		static Standard_Boolean IsConvex (const opencascade::handle<Geom2d_Curve> & Cu,const Standard_Real Sign);

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
		%feature("autodoc", ":rtype: None") Bisector_Bisec;
		 Bisector_Bisec ();

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "* Returns the Curve of <self>.
	:rtype: opencascade::handle<Geom2d_TrimmedCurve>") ChangeValue;
		const opencascade::handle<Geom2d_TrimmedCurve> & ChangeValue ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.
	:param Cu1:
	:type Cu1: Geom2d_Curve
	:param Cu2:
	:type Cu2: Geom2d_Curve
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param ajointype:
	:type ajointype: GeomAbs_JoinType
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & Cu1,const opencascade::handle<Geom2d_Curve> & Cu2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const GeomAbs_JoinType ajointype,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
	:param Cu:
	:type Cu: Geom2d_Curve
	:param Pnt:
	:type Pnt: Geom2d_Point
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & Cu,const opencascade::handle<Geom2d_Point> & Pnt,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
	:param Pnt:
	:type Pnt: Geom2d_Point
	:param Cu:
	:type Cu: Geom2d_Curve
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Point> & Pnt,const opencascade::handle<Geom2d_Curve> & Cu,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the two points <Pnt1> and <Pnt2>.
	:param Pnt1:
	:type Pnt1: Geom2d_Point
	:param Pnt2:
	:type Pnt2: Geom2d_Point
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance: default value is 0.0
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Point> & Pnt1,const opencascade::handle<Geom2d_Point> & Pnt2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance = 0.0,const Standard_Boolean oncurve = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Curve of <self>.
	:rtype: opencascade::handle<Geom2d_TrimmedCurve>") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value ();

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
		%feature("autodoc", "* Returns the first parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalFirst;
		virtual Standard_Real IntervalFirst (const Standard_Integer Index);

		/****************** IntervalLast ******************/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "* Returns the last parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalLast;
		virtual Standard_Real IntervalLast (const Standard_Integer Index);

		/****************** IsExtendAtEnd ******************/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", ":rtype: bool") IsExtendAtEnd;
		virtual Standard_Boolean IsExtendAtEnd ();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", ":rtype: bool") IsExtendAtStart;
		virtual Standard_Boolean IsExtendAtStart ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
	:rtype: int") NbIntervals;
		virtual Standard_Integer NbIntervals ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: float") Parameter;
		virtual Standard_Real Parameter (const gp_Pnt2d & P);

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
		%feature("autodoc", ":param C2:
	:type C2: Geom2d_Curve
	:param P1:
	:type P1: gp_Pnt2d
	:param T1:
	:type T1: gp_Vec2d
	:rtype: None") Bisector_FunctionH;
		 Bisector_FunctionH (const opencascade::handle<Geom2d_Curve> & C2,const gp_Pnt2d & P1,const gp_Vec2d & T1);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", ":param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the values of the Functions for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* Returns the values of the functions and the derivatives for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

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
		%feature("autodoc", ":rtype: None") Bisector_FunctionInter;
		 Bisector_FunctionInter ();

		/****************** Bisector_FunctionInter ******************/
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:param Bis1:
	:type Bis1: Bisector_Curve
	:param Bis2:
	:type Bis2: Bisector_Curve
	:rtype: None") Bisector_FunctionInter;
		 Bisector_FunctionInter (const opencascade::handle<Geom2d_Curve> & C,const opencascade::handle<Bisector_Curve> & Bis1,const opencascade::handle<Bisector_Curve> & Bis2);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", ":param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:param Bis1:
	:type Bis1: Bisector_Curve
	:param Bis2:
	:type Bis2: Bisector_Curve
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & C,const opencascade::handle<Bisector_Curve> & Bis1,const opencascade::handle<Bisector_Curve> & Bis2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the values of the Functions for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* Returns the values of the functions and the derivatives for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

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
		%feature("autodoc", ":rtype: None") Bisector_Inter;
		 Bisector_Inter ();

		/****************** Bisector_Inter ******************/
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "* Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimiztion of the computation.
	:param C1:
	:type C1: Bisector_Bisec
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Bisector_Bisec
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:param ComunElement:
	:type ComunElement: bool
	:rtype: None") Bisector_Inter;
		 Bisector_Inter (const Bisector_Bisec & C1,const IntRes2d_Domain & D1,const Bisector_Bisec & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol,const Standard_Boolean ComunElement);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimiztion of the computation.
	:param C1:
	:type C1: Bisector_Bisec
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Bisector_Bisec
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:param ComunElement:
	:type ComunElement: bool
	:rtype: None") Perform;
		void Perform (const Bisector_Bisec & C1,const IntRes2d_Domain & D1,const Bisector_Bisec & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol,const Standard_Boolean ComunElement);

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
		%feature("autodoc", ":rtype: None") Bisector_PointOnBis;
		 Bisector_PointOnBis ();

		/****************** Bisector_PointOnBis ******************/
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", ":param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param ParamBis:
	:type ParamBis: float
	:param Distance:
	:type Distance: float
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None") Bisector_PointOnBis;
		 Bisector_PointOnBis (const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamBis,const Standard_Real Distance,const gp_Pnt2d & Point);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", ":param Distance:
	:type Distance: float
	:rtype: None") Distance;
		void Distance (const Standard_Real Distance);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", ":rtype: float") Distance;
		Standard_Real Distance ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** IsInfinite ******************/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", ":param Infinite:
	:type Infinite: bool
	:rtype: None") IsInfinite;
		void IsInfinite (const Standard_Boolean Infinite);

		/****************** IsInfinite ******************/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", ":rtype: bool") IsInfinite;
		Standard_Boolean IsInfinite ();

		/****************** ParamOnBis ******************/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", ":param Param:
	:type Param: float
	:rtype: None") ParamOnBis;
		void ParamOnBis (const Standard_Real Param);

		/****************** ParamOnBis ******************/
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", ":rtype: float") ParamOnBis;
		Standard_Real ParamOnBis ();

		/****************** ParamOnC1 ******************/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", ":param Param:
	:type Param: float
	:rtype: None") ParamOnC1;
		void ParamOnC1 (const Standard_Real Param);

		/****************** ParamOnC1 ******************/
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", ":rtype: float") ParamOnC1;
		Standard_Real ParamOnC1 ();

		/****************** ParamOnC2 ******************/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", ":param Param:
	:type Param: float
	:rtype: None") ParamOnC2;
		void ParamOnC2 (const Standard_Real Param);

		/****************** ParamOnC2 ******************/
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", ":rtype: float") ParamOnC2;
		Standard_Real ParamOnC2 ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Point;
		void Point (const gp_Pnt2d & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt2d") Point;
		gp_Pnt2d Point ();

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
		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", ":param Point:
	:type Point: Bisector_PointOnBis
	:rtype: None") Append;
		void Append (const Bisector_PointOnBis & Point);

		/****************** Bisector_PolyBis ******************/
		%feature("compactdefaultargs") Bisector_PolyBis;
		%feature("autodoc", ":rtype: None") Bisector_PolyBis;
		 Bisector_PolyBis ();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", ":rtype: Bisector_PointOnBis") First;
		const Bisector_PointOnBis & First ();

		/****************** Interval ******************/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", ":param U:
	:type U: float
	:rtype: int") Interval;
		Standard_Integer Interval (const Standard_Real U);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", ":rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", ":rtype: Bisector_PointOnBis") Last;
		const Bisector_PointOnBis & Last ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", ":rtype: int") Length;
		Standard_Integer Length ();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: Bisector_PointOnBis") Value;
		const Bisector_PointOnBis & Value (const Standard_Integer Index);

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
		%feature("autodoc", ":rtype: None") Bisector_BisecAna;
		 Bisector_BisecAna ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Geometry>") Copy;
		opencascade::handle<Geom2d_Geometry> Copy ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param Deep: default value is 0
	:type Deep: int
	:param Offset: default value is 0
	:type Offset: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** Geom2dCurve ******************/
		%feature("compactdefaultargs") Geom2dCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") Geom2dCurve;
		opencascade::handle<Geom2d_Curve> Geom2dCurve ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param bisector:
	:type bisector: Geom2d_TrimmedCurve
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom2d_TrimmedCurve> & bisector);

		/****************** IntervalFirst ******************/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "* Returns the first parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);

		/****************** IntervalLast ******************/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "* Returns the last parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "* Returns the order of continuity of the curve. Raised if N < 0.
	:param N:
	:type N: int
	:rtype: bool") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsExtendAtEnd ******************/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", ":rtype: bool") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", ":rtype: bool") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: float") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);

		/****************** ParameterOfEndPoint ******************/
		%feature("compactdefaultargs") ParameterOfEndPoint;
		%feature("autodoc", ":rtype: float") ParameterOfEndPoint;
		Standard_Real ParameterOfEndPoint ();

		/****************** ParameterOfStartPoint ******************/
		%feature("compactdefaultargs") ParameterOfStartPoint;
		%feature("autodoc", ":rtype: float") ParameterOfStartPoint;
		Standard_Real ParameterOfStartPoint ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.
	:param Cu1:
	:type Cu1: Geom2d_Curve
	:param Cu2:
	:type Cu2: Geom2d_Curve
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param jointype:
	:type jointype: GeomAbs_JoinType
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & Cu1,const opencascade::handle<Geom2d_Curve> & Cu2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const GeomAbs_JoinType jointype,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
	:param Cu:
	:type Cu: Geom2d_Curve
	:param Pnt:
	:type Pnt: Geom2d_Point
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & Cu,const opencascade::handle<Geom2d_Point> & Pnt,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.
	:param Pnt:
	:type Pnt: Geom2d_Point
	:param Cu:
	:type Cu: Geom2d_Curve
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Point> & Pnt,const opencascade::handle<Geom2d_Curve> & Cu,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the bisecting line between the two points <Pnt1> and <Pnt2>.
	:param Pnt1:
	:type Pnt1: Geom2d_Point
	:param Pnt2:
	:type Pnt2: Geom2d_Point
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance: default value is 0.0
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Point> & Pnt1,const opencascade::handle<Geom2d_Point> & Pnt2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance = 0.0,const Standard_Boolean oncurve = Standard_True);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", ":param U:
	:type U: float
	:rtype: float") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);

		/****************** SetTrim ******************/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "* Trim <self> by a domain defined by the curve <Cu>. This domain is the set of the points which are nearest from <Cu> than the extremitis of <Cu>.
	:param Cu:
	:type Cu: Geom2d_Curve
	:rtype: None") SetTrim;
		void SetTrim (const opencascade::handle<Geom2d_Curve> & Cu);

		/****************** SetTrim ******************/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "* Trim <self> by a domain defined by uf and ul
	:param uf:
	:type uf: float
	:param ul:
	:type ul: float
	:rtype: None") SetTrim;
		void SetTrim (const Standard_Real uf,const Standard_Real ul);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

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
		%feature("autodoc", ":rtype: None") Bisector_BisecCC;
		 Bisector_BisecCC ();

		/****************** Bisector_BisecCC ******************/
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "* Constructs the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
	:param Cu1:
	:type Cu1: Geom2d_Curve
	:param Cu2:
	:type Cu2: Geom2d_Curve
	:param Side1:
	:type Side1: float
	:param Side2:
	:type Side2: float
	:param Origin:
	:type Origin: gp_Pnt2d
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None") Bisector_BisecCC;
		 Bisector_BisecCC (const opencascade::handle<Geom2d_Curve> & Cu1,const opencascade::handle<Geom2d_Curve> & Cu2,const Standard_Real Side1,const Standard_Real Side2,const gp_Pnt2d & Origin,const Standard_Real DistMax = 500);

		/****************** ChangeGuide ******************/
		%feature("compactdefaultargs") ChangeGuide;
		%feature("autodoc", "* The parameter on <self> is linked to the parameter on the first curve. This method creates the same bisector where the curves are inversed.
	:rtype: opencascade::handle<Bisector_BisecCC>") ChangeGuide;
		opencascade::handle<Bisector_BisecCC> ChangeGuide ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Geometry>") Copy;
		opencascade::handle<Geom2d_Geometry> Copy ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":param IndCurve:
	:type IndCurve: int
	:rtype: opencascade::handle<Geom2d_Curve>") Curve;
		opencascade::handle<Geom2d_Curve> Curve (const Standard_Integer IndCurve);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param Deep: default value is 0
	:type Deep: int
	:param Offset: default value is 0
	:type Offset: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** IntervalContinuity ******************/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity ();

		/****************** IntervalFirst ******************/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "* Returns the first parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);

		/****************** IntervalLast ******************/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "* Returns the last parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "* Returns the order of continuity of the curve. Raised if N < 0.
	:param N:
	:type N: int
	:rtype: bool") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", ":rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsExtendAtEnd ******************/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", ":rtype: bool") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", ":rtype: bool") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** LinkBisCurve ******************/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "* Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.
	:param U:
	:type U: float
	:rtype: float") LinkBisCurve;
		Standard_Real LinkBisCurve (const Standard_Real U);

		/****************** LinkCurveBis ******************/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "* Returns the reciproque of LinkBisCurve.
	:param U:
	:type U: float
	:rtype: float") LinkCurveBis;
		Standard_Real LinkCurveBis (const Standard_Real U);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: float") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. //! <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
	:param Cu1:
	:type Cu1: Geom2d_Curve
	:param Cu2:
	:type Cu2: Geom2d_Curve
	:param Side1:
	:type Side1: float
	:param Side2:
	:type Side2: float
	:param Origin:
	:type Origin: gp_Pnt2d
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & Cu1,const opencascade::handle<Geom2d_Curve> & Cu2,const Standard_Real Side1,const Standard_Real Side2,const gp_Pnt2d & Origin,const Standard_Real DistMax = 500);

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", ":rtype: Bisector_PolyBis") Polygon;
		const Bisector_PolyBis & Polygon ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", ":param U:
	:type U: float
	:rtype: float") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Transformation of a geometric object. This tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.
	:param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** ValueAndDist ******************/
		%feature("compactdefaultargs") ValueAndDist;
		%feature("autodoc", "* Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.
	:param U:
	:type U: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Distance:
	:type Distance: float
	:rtype: gp_Pnt2d") ValueAndDist;
		gp_Pnt2d ValueAndDist (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ValueByInt ******************/
		%feature("compactdefaultargs") ValueByInt;
		%feature("autodoc", "* Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.
	:param U:
	:type U: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Distance:
	:type Distance: float
	:rtype: gp_Pnt2d") ValueByInt;
		gp_Pnt2d ValueByInt (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

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
		%feature("autodoc", ":rtype: None") Bisector_BisecPC;
		 Bisector_BisecPC ();

		/****************** Bisector_BisecPC ******************/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "* Constructs the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
	:param Cu:
	:type Cu: Geom2d_Curve
	:param P:
	:type P: gp_Pnt2d
	:param Side:
	:type Side: float
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None") Bisector_BisecPC;
		 Bisector_BisecPC (const opencascade::handle<Geom2d_Curve> & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real DistMax = 500);

		/****************** Bisector_BisecPC ******************/
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "* Constructs the bisector between the point <P> and the curve <Cu> Trimmed by <UMin> and <UMax> <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. Warning: the bisector is supposed all over defined between <UMin> and <UMax>.
	:param Cu:
	:type Cu: Geom2d_Curve
	:param P:
	:type P: gp_Pnt2d
	:param Side:
	:type Side: float
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:rtype: None") Bisector_BisecPC;
		 Bisector_BisecPC (const opencascade::handle<Geom2d_Curve> & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real UMin,const Standard_Real UMax);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Geometry>") Copy;
		opencascade::handle<Geom2d_Geometry> Copy ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Returns the distance between the point of parameter U on <self> and my point or my curve.
	:param U:
	:type U: float
	:rtype: float") Distance;
		Standard_Real Distance (const Standard_Real U);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param Deep: default value is 0
	:type Deep: int
	:param Offset: default value is 0
	:type Offset: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* Value of the first parameter.
	:rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** IntervalContinuity ******************/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity ();

		/****************** IntervalFirst ******************/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "* Returns the first parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);

		/****************** IntervalLast ******************/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "* Returns the last parameter of the current interval.
	:param Index:
	:type Index: int
	:rtype: float") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "* Returns the order of continuity of the curve. Raised if N < 0.
	:param N:
	:type N: int
	:rtype: bool") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns <True> if the bisector is empty.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsExtendAtEnd ******************/
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "* Returns True if the bisector is extended at end.
	:rtype: bool") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();

		/****************** IsExtendAtStart ******************/
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "* Returns True if the bisector is extended at start.
	:rtype: bool") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* Value of the last parameter.
	:rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** LinkBisCurve ******************/
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "* Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.
	:param U:
	:type U: float
	:rtype: float") LinkBisCurve;
		Standard_Real LinkBisCurve (const Standard_Real U);

		/****************** LinkCurveBis ******************/
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "* Returns the reciproque of LinkBisCurve.
	:param U:
	:type U: float
	:rtype: float") LinkCurveBis;
		Standard_Real LinkCurveBis (const Standard_Real U);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter on <self> corresponding to <P>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: float") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Construct the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.
	:param Cu:
	:type Cu: Geom2d_Curve
	:param P:
	:type P: gp_Pnt2d
	:param Side:
	:type Side: float
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real DistMax = 500);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Changes the direction of parametrization of <self>. The orientation of the curve is modified. If the curve is bounded the StartPoint of the initial curve becomes the EndPoint of the reversed curve and the EndPoint of the initial curve becomes the StartPoint of the reversed curve.
	:rtype: None") Reverse;
		void Reverse ();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "* Returns the parameter on the reversed curve for the point of parameter U on <self>.
	:param U:
	:type U: float
	:rtype: float") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Transformation of a geometric object. This tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.
	:param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

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
