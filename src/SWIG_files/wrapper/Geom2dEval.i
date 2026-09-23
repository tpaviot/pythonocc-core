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
%define GEOM2DEVALDOCSTRING
"Geom2dEval module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2deval.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DEVALDOCSTRING) Geom2dEval


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
#include<Geom2dEval_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
#include<OSD_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import TColgp.i
%import TColStd.i
%import GeomAbs.i
%import gp.i

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
%wrap_handle(Geom2dEval_AHTBezierCurve)
%wrap_handle(Geom2dEval_ArchimedeanSpiralCurve)
%wrap_handle(Geom2dEval_CircleInvoluteCurve)
%wrap_handle(Geom2dEval_LogarithmicSpiralCurve)
%wrap_handle(Geom2dEval_SineWaveCurve)
%wrap_handle(Geom2dEval_TBezierCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************
* class Base *
*************/
/*********************
* class DerivBounded *
*********************/
/*****************
* class Domain1d *
*****************/
/*************
* class Full *
*************/
/**********************************
* class Geom2dEval_AHTBezierCurve *
**********************************/
class Geom2dEval_AHTBezierCurve : public Geom2d_BoundedCurve {
	public:
		/****** Geom2dEval_AHTBezierCurve::Geom2dEval_AHTBezierCurve ******/
		/****** md5 signature: c077a8295245701aae38d37156d69e42 ******/
		%feature("compactdefaultargs") Geom2dEval_AHTBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt2d
theAlgDegree: int
theAlpha: double
theBeta: double

Return
-------
None

Description
-----------
Non-rational constructor. 
Input parameter: thePoles control points 
Input parameter: theAlgDegree algebraic polynomial degree (>= 0) 
Input parameter: theAlpha hyperbolic frequency (>= 0, 0 = no hyperbolic terms) 
Input parameter: theBeta trigonometric frequency (>= 0, 0 = no trig terms).
") Geom2dEval_AHTBezierCurve;
		 Geom2dEval_AHTBezierCurve(const TColgp_Array1OfPnt2d & thePoles, int theAlgDegree, double theAlpha, double theBeta);

		/****** Geom2dEval_AHTBezierCurve::Geom2dEval_AHTBezierCurve ******/
		/****** md5 signature: 12532a0eab0c916a8262fc9bfece4aba ******/
		%feature("compactdefaultargs") Geom2dEval_AHTBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal
theAlgDegree: int
theAlpha: double
theBeta: double

Return
-------
None

Description
-----------
Rational constructor. 
Input parameter: thePoles control points 
Input parameter: theWeights weights for each pole (must be > 0) 
Input parameter: theAlgDegree algebraic polynomial degree (>= 0) 
Input parameter: theAlpha hyperbolic frequency (>= 0, 0 = no hyperbolic terms) 
Input parameter: theBeta trigonometric frequency (>= 0, 0 = no trig terms).
") Geom2dEval_AHTBezierCurve;
		 Geom2dEval_AHTBezierCurve(const TColgp_Array1OfPnt2d & thePoles, const TColStd_Array1OfReal & theWeights, int theAlgDegree, double theAlpha, double theBeta);

		/****** Geom2dEval_AHTBezierCurve::AlgDegree ******/
		/****** md5 signature: 043c2bee7b4dc90368c830c2bd1d8320 ******/
		%feature("compactdefaultargs") AlgDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the algebraic polynomial degree.
") AlgDegree;
		int AlgDegree();

		/****** Geom2dEval_AHTBezierCurve::Alpha ******/
		/****** md5 signature: 1249bfb26c689e960f720a1f10918fca ******/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the hyperbolic frequency parameter.
") Alpha;
		double Alpha();

		/****** Geom2dEval_AHTBezierCurve::Beta ******/
		/****** md5 signature: 04374867707749c17aa0164d2055dd21 ******/
		%feature("compactdefaultargs") Beta;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the trigonometric frequency parameter.
") Beta;
		double Beta();

		/****** Geom2dEval_AHTBezierCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2dEval_AHTBezierCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom2dEval_AHTBezierCurve::EndPoint ******/
		/****** md5 signature: 46b1d7929694ea99d1f1a364c0266b97 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the end point of the curve (at parameter 1).
") EndPoint;
		gp_Pnt2d EndPoint();

		/****** Geom2dEval_AHTBezierCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
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
Computes the point at parameter U.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2dEval_AHTBezierCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
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
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2dEval_AHTBezierCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
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
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2dEval_AHTBezierCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
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
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2dEval_AHTBezierCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
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
Computes the N-th derivative at parameter U. 
Input parameter: U the parameter value 
Input parameter: N the derivative order (must be >= 1) 
Return: the N-th derivative vector.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2dEval_AHTBezierCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the first parameter: 0.0.
") FirstParameter;
		double FirstParameter();

		/****** Geom2dEval_AHTBezierCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns true for any N. The AHT-Bezier curve is infinitely differentiable.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2dEval_AHTBezierCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the curve is closed.
") IsClosed;
		bool IsClosed();

		/****** Geom2dEval_AHTBezierCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. The AHT-Bezier curve is not periodic.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2dEval_AHTBezierCurve::IsRational ******/
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the curve is rational (has explicit weights).
") IsRational;
		bool IsRational();

		/****** Geom2dEval_AHTBezierCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the last parameter: 1.0.
") LastParameter;
		double LastParameter();

		/****** Geom2dEval_AHTBezierCurve::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles.
") NbPoles;
		int NbPoles();

		/****** Geom2dEval_AHTBezierCurve::Poles ******/
		/****** md5 signature: 8afae95fa5301d98d2ab229e2b82ae7d ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt2d

Description
-----------
Returns the array of poles.
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****** Geom2dEval_AHTBezierCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") Reverse;
		void Reverse();

		/****** Geom2dEval_AHTBezierCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
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
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2dEval_AHTBezierCurve::StartPoint ******/
		/****** md5 signature: 4c8f62db2cdb046b55fb2302933a985f ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the start point of the curve (at parameter 0).
") StartPoint;
		gp_Pnt2d StartPoint();

		/****** Geom2dEval_AHTBezierCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
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
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2dEval_AHTBezierCurve::Weights ******/
		/****** md5 signature: 75fed9e302ad46e4cac4d74daae13ea5 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the array of weights.
") Weights;
		const TColStd_Array1OfReal & Weights();

};


%make_alias(Geom2dEval_AHTBezierCurve)

%extend Geom2dEval_AHTBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class Geom2dEval_ArchimedeanSpiralCurve *
******************************************/
class Geom2dEval_ArchimedeanSpiralCurve : public Geom2d_Curve {
	public:
		/****** Geom2dEval_ArchimedeanSpiralCurve::Geom2dEval_ArchimedeanSpiralCurve ******/
		/****** md5 signature: fbe1e17484b56aac456ad0b79fc9f11a ******/
		%feature("compactdefaultargs") Geom2dEval_ArchimedeanSpiralCurve;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2d
theInitialRadius: double
theGrowthRate: double

Return
-------
None

Description
-----------
Creates an Archimedean spiral. 
Input parameter: thePosition the local coordinate system 
Input parameter: theInitialRadius the initial radius (must be >= 0) 
Input parameter: theGrowthRate the growth rate per radian (must be > 0) @throw Standard_ConstructionError if theInitialRadius < 0 or theGrowthRate <= 0.
") Geom2dEval_ArchimedeanSpiralCurve;
		 Geom2dEval_ArchimedeanSpiralCurve(const gp_Ax2d & thePosition, double theInitialRadius, double theGrowthRate);

		/****** Geom2dEval_ArchimedeanSpiralCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2dEval_ArchimedeanSpiralCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom2dEval_ArchimedeanSpiralCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
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
Computes the point at parameter U.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2dEval_ArchimedeanSpiralCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
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
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2dEval_ArchimedeanSpiralCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
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
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2dEval_ArchimedeanSpiralCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
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
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2dEval_ArchimedeanSpiralCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
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
Computes the N-th derivative at parameter U. @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2dEval_ArchimedeanSpiralCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 0.
") FirstParameter;
		double FirstParameter();

		/****** Geom2dEval_ArchimedeanSpiralCurve::GrowthRate ******/
		/****** md5 signature: 44f70579fa7d731f3526cc3da3e3d4ae ******/
		%feature("compactdefaultargs") GrowthRate;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the growth rate per radian.
") GrowthRate;
		double GrowthRate();

		/****** Geom2dEval_ArchimedeanSpiralCurve::InitialRadius ******/
		/****** md5 signature: 591f8bdf845220530599c3df63830e0d ******/
		%feature("compactdefaultargs") InitialRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the initial radius.
") InitialRadius;
		double InitialRadius();

		/****** Geom2dEval_ArchimedeanSpiralCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns true for any N >= 0.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2dEval_ArchimedeanSpiralCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsClosed;
		bool IsClosed();

		/****** Geom2dEval_ArchimedeanSpiralCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2dEval_ArchimedeanSpiralCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Precision::Infinite().
") LastParameter;
		double LastParameter();

		/****** Geom2dEval_ArchimedeanSpiralCurve::Position ******/
		/****** md5 signature: 918ef7d5550c41cbbd9512dcf1888fbe ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the local coordinate system.
") Position;
		const gp_Ax2d Position();

		/****** Geom2dEval_ArchimedeanSpiralCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") Reverse;
		void Reverse();

		/****** Geom2dEval_ArchimedeanSpiralCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
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
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2dEval_ArchimedeanSpiralCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
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
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2dEval_ArchimedeanSpiralCurve)

%extend Geom2dEval_ArchimedeanSpiralCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Geom2dEval_CircleInvoluteCurve *
***************************************/
class Geom2dEval_CircleInvoluteCurve : public Geom2d_Curve {
	public:
		/****** Geom2dEval_CircleInvoluteCurve::Geom2dEval_CircleInvoluteCurve ******/
		/****** md5 signature: 4dead45366d57e319716c1a4d77d5476 ******/
		%feature("compactdefaultargs") Geom2dEval_CircleInvoluteCurve;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2d
theRadius: double

Return
-------
None

Description
-----------
Creates an involute of a circle. 
Input parameter: thePosition the local coordinate system 
Input parameter: theRadius the base circle radius (must be > 0) @throw Standard_ConstructionError if theRadius <= 0.
") Geom2dEval_CircleInvoluteCurve;
		 Geom2dEval_CircleInvoluteCurve(const gp_Ax2d & thePosition, double theRadius);

		/****** Geom2dEval_CircleInvoluteCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2dEval_CircleInvoluteCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom2dEval_CircleInvoluteCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
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
Computes the point at parameter U.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2dEval_CircleInvoluteCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
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
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2dEval_CircleInvoluteCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
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
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2dEval_CircleInvoluteCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
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
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2dEval_CircleInvoluteCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
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
Computes the N-th derivative at parameter U. @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2dEval_CircleInvoluteCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 0.
") FirstParameter;
		double FirstParameter();

		/****** Geom2dEval_CircleInvoluteCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns true for any N >= 0.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2dEval_CircleInvoluteCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsClosed;
		bool IsClosed();

		/****** Geom2dEval_CircleInvoluteCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2dEval_CircleInvoluteCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Precision::Infinite().
") LastParameter;
		double LastParameter();

		/****** Geom2dEval_CircleInvoluteCurve::Position ******/
		/****** md5 signature: 918ef7d5550c41cbbd9512dcf1888fbe ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the local coordinate system.
") Position;
		const gp_Ax2d Position();

		/****** Geom2dEval_CircleInvoluteCurve::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the base circle radius.
") Radius;
		double Radius();

		/****** Geom2dEval_CircleInvoluteCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") Reverse;
		void Reverse();

		/****** Geom2dEval_CircleInvoluteCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
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
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2dEval_CircleInvoluteCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
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
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2dEval_CircleInvoluteCurve)

%extend Geom2dEval_CircleInvoluteCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class Geom2dEval_LogarithmicSpiralCurve *
******************************************/
class Geom2dEval_LogarithmicSpiralCurve : public Geom2d_Curve {
	public:
		/****** Geom2dEval_LogarithmicSpiralCurve::Geom2dEval_LogarithmicSpiralCurve ******/
		/****** md5 signature: 0c224a10c7def2c6d1504b9219885a5b ******/
		%feature("compactdefaultargs") Geom2dEval_LogarithmicSpiralCurve;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2d
theScale: double
theGrowthExponent: double

Return
-------
None

Description
-----------
Creates a logarithmic spiral. 
Input parameter: thePosition the local coordinate system 
Input parameter: theScale the scale factor (must be > 0) 
Input parameter: theGrowthExponent the growth exponent (must be > 0) @throw Standard_ConstructionError if theScale <= 0 or theGrowthExponent <= 0.
") Geom2dEval_LogarithmicSpiralCurve;
		 Geom2dEval_LogarithmicSpiralCurve(const gp_Ax2d & thePosition, double theScale, double theGrowthExponent);

		/****** Geom2dEval_LogarithmicSpiralCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2dEval_LogarithmicSpiralCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom2dEval_LogarithmicSpiralCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
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
Computes the point at parameter U.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2dEval_LogarithmicSpiralCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
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
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2dEval_LogarithmicSpiralCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
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
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2dEval_LogarithmicSpiralCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
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
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2dEval_LogarithmicSpiralCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
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
Computes the N-th derivative at parameter U. @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2dEval_LogarithmicSpiralCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns -Precision::Infinite().
") FirstParameter;
		double FirstParameter();

		/****** Geom2dEval_LogarithmicSpiralCurve::GrowthExponent ******/
		/****** md5 signature: ab54aaccc0b0ec36c31aaa58e44913d5 ******/
		%feature("compactdefaultargs") GrowthExponent;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the growth exponent.
") GrowthExponent;
		double GrowthExponent();

		/****** Geom2dEval_LogarithmicSpiralCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns true for any N >= 0.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2dEval_LogarithmicSpiralCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsClosed;
		bool IsClosed();

		/****** Geom2dEval_LogarithmicSpiralCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2dEval_LogarithmicSpiralCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Precision::Infinite().
") LastParameter;
		double LastParameter();

		/****** Geom2dEval_LogarithmicSpiralCurve::Position ******/
		/****** md5 signature: 918ef7d5550c41cbbd9512dcf1888fbe ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the local coordinate system.
") Position;
		const gp_Ax2d Position();

		/****** Geom2dEval_LogarithmicSpiralCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") Reverse;
		void Reverse();

		/****** Geom2dEval_LogarithmicSpiralCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
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
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2dEval_LogarithmicSpiralCurve::Scale ******/
		/****** md5 signature: 61c9c74d8ec40780bdfa84588e6789a4 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the scale factor.
") Scale;
		double Scale();

		/****** Geom2dEval_LogarithmicSpiralCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
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
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2dEval_LogarithmicSpiralCurve)

%extend Geom2dEval_LogarithmicSpiralCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dEval_SineWaveCurve *
*********************************/
class Geom2dEval_SineWaveCurve : public Geom2d_Curve {
	public:
		/****** Geom2dEval_SineWaveCurve::Geom2dEval_SineWaveCurve ******/
		/****** md5 signature: f056044ea78dee909ef4d91b5b653e16 ******/
		%feature("compactdefaultargs") Geom2dEval_SineWaveCurve;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2d
theAmplitude: double
theOmega: double
thePhase: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates a 2D sine wave curve. 
Input parameter: thePosition the local coordinate system 
Input parameter: theAmplitude the wave amplitude (must be > 0) 
Input parameter: theOmega the angular frequency (must be > 0) 
Input parameter: thePhase the phase shift (default 0) @throw Standard_ConstructionError if theAmplitude <= 0 or theOmega <= 0.
") Geom2dEval_SineWaveCurve;
		 Geom2dEval_SineWaveCurve(const gp_Ax2d & thePosition, double theAmplitude, double theOmega, double thePhase = 0.0);

		/****** Geom2dEval_SineWaveCurve::Amplitude ******/
		/****** md5 signature: 7a59c402df37904ac23cda739e3b9ac6 ******/
		%feature("compactdefaultargs") Amplitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the amplitude.
") Amplitude;
		double Amplitude();

		/****** Geom2dEval_SineWaveCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2dEval_SineWaveCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom2dEval_SineWaveCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
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
Computes the point at parameter U.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2dEval_SineWaveCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
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
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2dEval_SineWaveCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
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
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2dEval_SineWaveCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
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
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2dEval_SineWaveCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
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
Computes the N-th derivative at parameter U. @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2dEval_SineWaveCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns -Precision::Infinite().
") FirstParameter;
		double FirstParameter();

		/****** Geom2dEval_SineWaveCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns true for any N >= 0.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2dEval_SineWaveCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsClosed;
		bool IsClosed();

		/****** Geom2dEval_SineWaveCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2dEval_SineWaveCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Precision::Infinite().
") LastParameter;
		double LastParameter();

		/****** Geom2dEval_SineWaveCurve::Omega ******/
		/****** md5 signature: 4ff317da93a0e64e6b3b8f9fb74caec0 ******/
		%feature("compactdefaultargs") Omega;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the angular frequency.
") Omega;
		double Omega();

		/****** Geom2dEval_SineWaveCurve::Phase ******/
		/****** md5 signature: eae5adc6d06c0d499cf61eff82c2806b ******/
		%feature("compactdefaultargs") Phase;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the phase shift.
") Phase;
		double Phase();

		/****** Geom2dEval_SineWaveCurve::Position ******/
		/****** md5 signature: 918ef7d5550c41cbbd9512dcf1888fbe ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the local coordinate system.
") Position;
		const gp_Ax2d Position();

		/****** Geom2dEval_SineWaveCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") Reverse;
		void Reverse();

		/****** Geom2dEval_SineWaveCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
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
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2dEval_SineWaveCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
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
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2dEval_SineWaveCurve)

%extend Geom2dEval_SineWaveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dEval_TBezierCurve *
********************************/
class Geom2dEval_TBezierCurve : public Geom2d_BoundedCurve {
	public:
		/****** Geom2dEval_TBezierCurve::Geom2dEval_TBezierCurve ******/
		/****** md5 signature: 034d181e7d13a212bb8db3eb42f63df0 ******/
		%feature("compactdefaultargs") Geom2dEval_TBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt2d
theAlpha: double

Return
-------
None

Description
-----------
Constructs a non-rational T-Bezier curve from poles and alpha. 
Input parameter: thePoles control points (1-based, size must be odd >= 3) 
Input parameter: theAlpha frequency parameter (must be > 0) @throw Standard_ConstructionError if NbPoles is not odd or < 3 or theAlpha <= 0.
") Geom2dEval_TBezierCurve;
		 Geom2dEval_TBezierCurve(const TColgp_Array1OfPnt2d & thePoles, double theAlpha);

		/****** Geom2dEval_TBezierCurve::Geom2dEval_TBezierCurve ******/
		/****** md5 signature: 015f85d5c7372a3174a7758c93fdaf21 ******/
		%feature("compactdefaultargs") Geom2dEval_TBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal
theAlpha: double

Return
-------
None

Description
-----------
Constructs a rational T-Bezier curve. 
Input parameter: thePoles control points (1-based, size must be odd >= 3) 
Input parameter: theWeights weights (same size as poles, all > 0) 
Input parameter: theAlpha frequency parameter (must be > 0) @throw Standard_ConstructionError if validation fails.
") Geom2dEval_TBezierCurve;
		 Geom2dEval_TBezierCurve(const TColgp_Array1OfPnt2d & thePoles, const TColStd_Array1OfReal & theWeights, double theAlpha);

		/****** Geom2dEval_TBezierCurve::Alpha ******/
		/****** md5 signature: 1249bfb26c689e960f720a1f10918fca ******/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the frequency parameter alpha.
") Alpha;
		double Alpha();

		/****** Geom2dEval_TBezierCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN. T-Bezier curves are infinitely differentiable.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2dEval_TBezierCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this T-Bezier curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom2dEval_TBezierCurve::EndPoint ******/
		/****** md5 signature: 46b1d7929694ea99d1f1a364c0266b97 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the end point C(Pi/alpha).
") EndPoint;
		gp_Pnt2d EndPoint();

		/****** Geom2dEval_TBezierCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
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
Computes the point C(U).
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2dEval_TBezierCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
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
Computes the point and first derivative at U.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2dEval_TBezierCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
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
Computes the point and first two derivatives at U.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2dEval_TBezierCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
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
Computes the point and first three derivatives at U.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2dEval_TBezierCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
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
Computes the N-th derivative at U. 
Input parameter: U parameter value 
Input parameter: N derivative order (must be >= 1) 
Return: the N-th derivative vector @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2dEval_TBezierCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first parameter value: 0.0.
") FirstParameter;
		double FirstParameter();

		/****** Geom2dEval_TBezierCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns true for all N. T-Bezier curves are infinitely differentiable.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2dEval_TBezierCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if StartPoint and EndPoint coincide.
") IsClosed;
		bool IsClosed();

		/****** Geom2dEval_TBezierCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. T-Bezier curves are not periodic.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2dEval_TBezierCurve::IsRational ******/
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the curve is rational.
") IsRational;
		bool IsRational();

		/****** Geom2dEval_TBezierCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last parameter value: Pi/alpha.
") LastParameter;
		double LastParameter();

		/****** Geom2dEval_TBezierCurve::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles.
") NbPoles;
		int NbPoles();

		/****** Geom2dEval_TBezierCurve::Order ******/
		/****** md5 signature: f8203d17ff4236419ff00db5f6c14ffb ******/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the trigonometric order n (NbPoles = 2*n + 1).
") Order;
		int Order();

		/****** Geom2dEval_TBezierCurve::Poles ******/
		/****** md5 signature: 8afae95fa5301d98d2ab229e2b82ae7d ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt2d

Description
-----------
Returns the poles array.
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****** Geom2dEval_TBezierCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") Reverse;
		void Reverse();

		/****** Geom2dEval_TBezierCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
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
Reversal is not supported for this eval curve. @throw Standard_NotImplemented.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2dEval_TBezierCurve::StartPoint ******/
		/****** md5 signature: 4c8f62db2cdb046b55fb2302933a985f ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the start point C(0).
") StartPoint;
		gp_Pnt2d StartPoint();

		/****** Geom2dEval_TBezierCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
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
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2dEval_TBezierCurve::Weights ******/
		/****** md5 signature: 75fed9e302ad46e4cac4d74daae13ea5 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the weights array (empty if non-rational).
") Weights;
		const TColStd_Array1OfReal & Weights();

};


%make_alias(Geom2dEval_TBezierCurve)

%extend Geom2dEval_TBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************
* class Map1d *
**************/
/***************
* class Mapped *
***************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Base:
	pass

@classnotwrapped
class Full:
	pass

@classnotwrapped
class DerivBounded:
	pass

@classnotwrapped
class Mapped:
	pass

@classnotwrapped
class Map1d:
	pass

@classnotwrapped
class Domain1d:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
