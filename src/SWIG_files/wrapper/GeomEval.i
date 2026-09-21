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
%define GEOMEVALDOCSTRING
"GeomEval module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomeval.html"
%enddef
%module (package="OCC.Core", docstring=GEOMEVALDOCSTRING) GeomEval


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
#include<GeomEval_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
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
%wrap_handle(GeomEval_AHTBezierCurve)
%wrap_handle(GeomEval_AHTBezierSurface)
%wrap_handle(GeomEval_CircularHelicoidSurface)
%wrap_handle(GeomEval_CircularHelixCurve)
%wrap_handle(GeomEval_EllipsoidSurface)
%wrap_handle(GeomEval_HypParaboloidSurface)
%wrap_handle(GeomEval_HyperboloidSurface)
%wrap_handle(GeomEval_ParaboloidSurface)
%wrap_handle(GeomEval_SineWaveCurve)
%wrap_handle(GeomEval_TBezierCurve)
%wrap_handle(GeomEval_TBezierSurface)
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
/*****************
* class Domain2d *
*****************/
/*************
* class Full *
*************/
/********************************
* class GeomEval_AHTBezierCurve *
********************************/
class GeomEval_AHTBezierCurve : public Geom_BoundedCurve {
	public:
		/****** GeomEval_AHTBezierCurve::GeomEval_AHTBezierCurve ******/
		/****** md5 signature: 5844d9bffc42fe3688659cda82deebc0 ******/
		%feature("compactdefaultargs") GeomEval_AHTBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt
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
") GeomEval_AHTBezierCurve;
		 GeomEval_AHTBezierCurve(const TColgp_Array1OfPnt & thePoles, int theAlgDegree, double theAlpha, double theBeta);

		/****** GeomEval_AHTBezierCurve::GeomEval_AHTBezierCurve ******/
		/****** md5 signature: b6e2c1df64656fe0c43014c54287c241 ******/
		%feature("compactdefaultargs") GeomEval_AHTBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt
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
") GeomEval_AHTBezierCurve;
		 GeomEval_AHTBezierCurve(const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal & theWeights, int theAlgDegree, double theAlpha, double theBeta);

		/****** GeomEval_AHTBezierCurve::AlgDegree ******/
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

		/****** GeomEval_AHTBezierCurve::Alpha ******/
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

		/****** GeomEval_AHTBezierCurve::Beta ******/
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

		/****** GeomEval_AHTBezierCurve::Continuity ******/
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

		/****** GeomEval_AHTBezierCurve::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_AHTBezierCurve::EndPoint ******/
		/****** md5 signature: 1d65a54ecc39cd5733d739743335f6ff ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the end point of the curve (at parameter 1).
") EndPoint;
		gp_Pnt EndPoint();

		/****** GeomEval_AHTBezierCurve::EvalD0 ******/
		/****** md5 signature: 6d2f6bda2def2f1a5c06450e18a2448e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point at parameter U.
") EvalD0;
		gp_Pnt EvalD0(const double U);

		/****** GeomEval_AHTBezierCurve::EvalD1 ******/
		/****** md5 signature: 710afaf4eeb9572f5a2c4ff8202a1d98 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double U);

		/****** GeomEval_AHTBezierCurve::EvalD2 ******/
		/****** md5 signature: 6fcc40610ad4d1edfd19ad102d31116c ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double U);

		/****** GeomEval_AHTBezierCurve::EvalD3 ******/
		/****** md5 signature: 18218212c42fff5822f57b4b4973baff ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double U);

		/****** GeomEval_AHTBezierCurve::EvalDN ******/
		/****** md5 signature: 2ba89277702b68c9eb2b5061d04892f2 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec

Description
-----------
Computes the N-th derivative at parameter U. 
Input parameter: U the parameter value 
Input parameter: N the derivative order (must be >= 1) 
Return: the N-th derivative vector.
") EvalDN;
		gp_Vec EvalDN(const double U, const int N);

		/****** GeomEval_AHTBezierCurve::FirstParameter ******/
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

		/****** GeomEval_AHTBezierCurve::IsCN ******/
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

		/****** GeomEval_AHTBezierCurve::IsClosed ******/
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

		/****** GeomEval_AHTBezierCurve::IsPeriodic ******/
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

		/****** GeomEval_AHTBezierCurve::IsRational ******/
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

		/****** GeomEval_AHTBezierCurve::LastParameter ******/
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

		/****** GeomEval_AHTBezierCurve::NbPoles ******/
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

		/****** GeomEval_AHTBezierCurve::Poles ******/
		/****** md5 signature: 663bb42f249a1a7e08feff11d136eca9 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt

Description
-----------
Returns the array of poles.
") Poles;
		const TColgp_Array1OfPnt & Poles();

		/****** GeomEval_AHTBezierCurve::Reverse ******/
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

		/****** GeomEval_AHTBezierCurve::ReversedParameter ******/
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

		/****** GeomEval_AHTBezierCurve::StartPoint ******/
		/****** md5 signature: 8a586296583b30cec9a994e9c703d6ca ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the start point of the curve (at parameter 0).
") StartPoint;
		gp_Pnt StartPoint();

		/****** GeomEval_AHTBezierCurve::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_AHTBezierCurve::Weights ******/
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


%make_alias(GeomEval_AHTBezierCurve)

%extend GeomEval_AHTBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomEval_AHTBezierSurface *
**********************************/
class GeomEval_AHTBezierSurface : public Geom_BoundedSurface {
	public:
		/****** GeomEval_AHTBezierSurface::GeomEval_AHTBezierSurface ******/
		/****** md5 signature: b2dd187ee0aa93bff8cd418082f56701 ******/
		%feature("compactdefaultargs") GeomEval_AHTBezierSurface;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array2OfPnt
theAlgDegreeU: int
theAlgDegreeV: int
theAlphaU: double
theAlphaV: double
theBetaU: double
theBetaV: double

Return
-------
None

Description
-----------
Non-rational constructor. 
Input parameter: thePoles 2D array of control points 
Input parameter: theAlgDegreeU algebraic polynomial degree in U (>= 0) 
Input parameter: theAlgDegreeV algebraic polynomial degree in V (>= 0) 
Input parameter: theAlphaU hyperbolic frequency in U (>= 0) 
Input parameter: theAlphaV hyperbolic frequency in V (>= 0) 
Input parameter: theBetaU trigonometric frequency in U (>= 0) 
Input parameter: theBetaV trigonometric frequency in V (>= 0).
") GeomEval_AHTBezierSurface;
		 GeomEval_AHTBezierSurface(const TColgp_Array2OfPnt & thePoles, int theAlgDegreeU, int theAlgDegreeV, double theAlphaU, double theAlphaV, double theBetaU, double theBetaV);

		/****** GeomEval_AHTBezierSurface::GeomEval_AHTBezierSurface ******/
		/****** md5 signature: 4f002e5f50e8918e9ca5a4920fd07233 ******/
		%feature("compactdefaultargs") GeomEval_AHTBezierSurface;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array2OfPnt
theWeights: TColStd_Array2OfReal
theAlgDegreeU: int
theAlgDegreeV: int
theAlphaU: double
theAlphaV: double
theBetaU: double
theBetaV: double

Return
-------
None

Description
-----------
Rational constructor. 
Input parameter: thePoles 2D array of control points 
Input parameter: theWeights 2D array of weights (must be > 0) 
Input parameter: theAlgDegreeU algebraic polynomial degree in U (>= 0) 
Input parameter: theAlgDegreeV algebraic polynomial degree in V (>= 0) 
Input parameter: theAlphaU hyperbolic frequency in U (>= 0) 
Input parameter: theAlphaV hyperbolic frequency in V (>= 0) 
Input parameter: theBetaU trigonometric frequency in U (>= 0) 
Input parameter: theBetaV trigonometric frequency in V (>= 0).
") GeomEval_AHTBezierSurface;
		 GeomEval_AHTBezierSurface(const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal & theWeights, int theAlgDegreeU, int theAlgDegreeV, double theAlphaU, double theAlphaV, double theBetaU, double theBetaV);

		/****** GeomEval_AHTBezierSurface::AlgDegreeU ******/
		/****** md5 signature: 256776091df7a92b59ad1b06477f968b ******/
		%feature("compactdefaultargs") AlgDegreeU;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the algebraic polynomial degree in U.
") AlgDegreeU;
		int AlgDegreeU();

		/****** GeomEval_AHTBezierSurface::AlgDegreeV ******/
		/****** md5 signature: a8efca0a0b7baebf573ae36b6b3b5f18 ******/
		%feature("compactdefaultargs") AlgDegreeV;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the algebraic polynomial degree in V.
") AlgDegreeV;
		int AlgDegreeV();

		/****** GeomEval_AHTBezierSurface::AlphaU ******/
		/****** md5 signature: a13b516a3d18b134dda1db97aa6e5b5a ******/
		%feature("compactdefaultargs") AlphaU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the hyperbolic frequency in U.
") AlphaU;
		double AlphaU();

		/****** GeomEval_AHTBezierSurface::AlphaV ******/
		/****** md5 signature: fde4defa25bb05c817ccc3d35f44dd51 ******/
		%feature("compactdefaultargs") AlphaV;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the hyperbolic frequency in V.
") AlphaV;
		double AlphaV();

		/****** GeomEval_AHTBezierSurface::BetaU ******/
		/****** md5 signature: 0755b0ce6f3234015124316612be2e45 ******/
		%feature("compactdefaultargs") BetaU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the trigonometric frequency in U.
") BetaU;
		double BetaU();

		/****** GeomEval_AHTBezierSurface::BetaV ******/
		/****** md5 signature: 0b5c441a4fbc530dd443a0535a2a52dd ******/
		%feature("compactdefaultargs") BetaV;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the trigonometric frequency in V.
") BetaV;
		double BetaV();

		/****** GeomEval_AHTBezierSurface::Bounds ******/
		/****** md5 signature: 00d684b8aaf3d1078ecb2fe950638d77 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns the parametric bounds. @param[out] U1 lower U bound (0) @param[out] U2 upper U bound (1) @param[out] V1 lower V bound (0) @param[out] V2 upper V bound (1).
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_AHTBezierSurface::Continuity ******/
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

		/****** GeomEval_AHTBezierSurface::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this surface.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_AHTBezierSurface::EvalD0 ******/
		/****** md5 signature: 350fc6f963b4f7ad3faccbc657de1f8c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point at parameters (U, V).
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomEval_AHTBezierSurface::EvalD1 ******/
		/****** md5 signature: 715a8ecdc89a0feb3af4c34f4c058eb6 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and first partial derivatives at (U, V).
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomEval_AHTBezierSurface::EvalD2 ******/
		/****** md5 signature: 4ec9141f6af0f8059ad5e5eb192fb519 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V).
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomEval_AHTBezierSurface::EvalD3 ******/
		/****** md5 signature: 8e3d70385fa2efac26fc5eabd699d449 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V).
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomEval_AHTBezierSurface::EvalDN ******/
		/****** md5 signature: 066e5f1f8cacfe362f11e807a1f2627e ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in U and Nv in V. 
Input parameter: U the u parameter 
Input parameter: V the v parameter 
Input parameter: Nu derivative order in u (must be >= 0) 
Input parameter: Nv derivative order in v (must be >= 0) 
Return: the derivative vector @throw Standard_RangeError if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomEval_AHTBezierSurface::IsCNu ******/
		/****** md5 signature: 9a6f533916836c9b7c4f0ff0a609fae2 ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true for any N.
") IsCNu;
		bool IsCNu(const int N);

		/****** GeomEval_AHTBezierSurface::IsCNv ******/
		/****** md5 signature: 4e12377e4fee255bb2fbd018134f6b55 ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true for any N.
") IsCNv;
		bool IsCNv(const int N);

		/****** GeomEval_AHTBezierSurface::IsUClosed ******/
		/****** md5 signature: fe32a3e14eefd34f9b5ebf36eb79f283 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. The AHT-Bezier surface is not closed in U.
") IsUClosed;
		bool IsUClosed();

		/****** GeomEval_AHTBezierSurface::IsUPeriodic ******/
		/****** md5 signature: af4d7f95dcec12492d73d3d9bab79ae6 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. The AHT-Bezier surface is not periodic in U.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomEval_AHTBezierSurface::IsURational ******/
		/****** md5 signature: 87cbbf86ac97143534bf7a5183bdcf6e ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface is rational in U direction.
") IsURational;
		bool IsURational();

		/****** GeomEval_AHTBezierSurface::IsVClosed ******/
		/****** md5 signature: 12726371c104f701024f4c322b920d3b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. The AHT-Bezier surface is not closed in V.
") IsVClosed;
		bool IsVClosed();

		/****** GeomEval_AHTBezierSurface::IsVPeriodic ******/
		/****** md5 signature: 2c0bd84ed110fb9f9bb998223c49a395 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. The AHT-Bezier surface is not periodic in V.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomEval_AHTBezierSurface::IsVRational ******/
		/****** md5 signature: 38c5da014aa77cd1d45efe57cddbb954 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface is rational in V direction.
") IsVRational;
		bool IsVRational();

		/****** GeomEval_AHTBezierSurface::NbPolesU ******/
		/****** md5 signature: f8e1efdd7e7cad558667f26281e4e6f0 ******/
		%feature("compactdefaultargs") NbPolesU;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in U direction.
") NbPolesU;
		int NbPolesU();

		/****** GeomEval_AHTBezierSurface::NbPolesV ******/
		/****** md5 signature: 43b120d60676c01891cac2cfeadaba14 ******/
		%feature("compactdefaultargs") NbPolesV;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in V direction.
") NbPolesV;
		int NbPolesV();

		/****** GeomEval_AHTBezierSurface::Poles ******/
		/****** md5 signature: 14016e5d40bac5fa096e746e935d87cd ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
Returns the 2D array of poles.
") Poles;
		const TColgp_Array2OfPnt & Poles();

		/****** GeomEval_AHTBezierSurface::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_AHTBezierSurface::UIso ******/
		/****** md5 signature: 3030bc2ea2708d8c6595824c7f7be7f2 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Isoparametric curve extraction is not supported for this eval surface. @throw Standard_NotImplemented.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomEval_AHTBezierSurface::UReverse ******/
		/****** md5 signature: cebfb9b57b88817ec473af5443be776d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReverse;
		void UReverse();

		/****** GeomEval_AHTBezierSurface::UReversedParameter ******/
		/****** md5 signature: 4110bc22c0fb15535eb1019750434fed ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomEval_AHTBezierSurface::VIso ******/
		/****** md5 signature: 21b53846c2f42b60b8f8b2cab0ac0270 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Isoparametric curve extraction is not supported for this eval surface. @throw Standard_NotImplemented.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomEval_AHTBezierSurface::VReverse ******/
		/****** md5 signature: 9382c4825a17f3761861e610c481ab26 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReverse;
		void VReverse();

		/****** GeomEval_AHTBezierSurface::VReversedParameter ******/
		/****** md5 signature: b8382ca1a515d51126c89cc642c85f72 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReversedParameter;
		double VReversedParameter(const double V);

		/****** GeomEval_AHTBezierSurface::Weights ******/
		/****** md5 signature: 7f881df6c273a11e54472a6e9569e510 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
Returns the 2D array of weights.
") Weights;
		const TColStd_Array2OfReal & Weights();

};


%make_alias(GeomEval_AHTBezierSurface)

%extend GeomEval_AHTBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomEval_CircularHelicoidSurface *
*****************************************/
class GeomEval_CircularHelicoidSurface : public Geom_ElementarySurface {
	public:
		/****** GeomEval_CircularHelicoidSurface::GeomEval_CircularHelicoidSurface ******/
		/****** md5 signature: 7ede0d0e8f079b42513013ce8da799e8 ******/
		%feature("compactdefaultargs") GeomEval_CircularHelicoidSurface;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax3
thePitch: double

Return
-------
None

Description
-----------
Creates a circular helicoid surface. 
Input parameter: thePosition the local coordinate system 
Input parameter: thePitch the axial advance per 2*Pi turn (must be != 0) @throw Standard_ConstructionError if thePitch == 0.
") GeomEval_CircularHelicoidSurface;
		 GeomEval_CircularHelicoidSurface(const gp_Ax3 & thePosition, double thePitch);

		/****** GeomEval_CircularHelicoidSurface::Bounds ******/
		/****** md5 signature: 00d684b8aaf3d1078ecb2fe950638d77 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns infinite bounds for both parameters.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_CircularHelicoidSurface::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this surface.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_CircularHelicoidSurface::EvalD0 ******/
		/****** md5 signature: 350fc6f963b4f7ad3faccbc657de1f8c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point S(U, V) on the surface.
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomEval_CircularHelicoidSurface::EvalD1 ******/
		/****** md5 signature: 715a8ecdc89a0feb3af4c34f4c058eb6 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and first partial derivatives at (U, V).
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomEval_CircularHelicoidSurface::EvalD2 ******/
		/****** md5 signature: 4ec9141f6af0f8059ad5e5eb192fb519 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V).
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomEval_CircularHelicoidSurface::EvalD3 ******/
		/****** md5 signature: 8e3d70385fa2efac26fc5eabd699d449 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V).
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomEval_CircularHelicoidSurface::EvalDN ******/
		/****** md5 signature: 066e5f1f8cacfe362f11e807a1f2627e ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in u and Nv in v. @throw Geom_UndefinedDerivative if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomEval_CircularHelicoidSurface::IsUClosed ******/
		/****** md5 signature: fe32a3e14eefd34f9b5ebf36eb79f283 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsUClosed;
		bool IsUClosed();

		/****** GeomEval_CircularHelicoidSurface::IsUPeriodic ******/
		/****** md5 signature: af4d7f95dcec12492d73d3d9bab79ae6 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomEval_CircularHelicoidSurface::IsVClosed ******/
		/****** md5 signature: 12726371c104f701024f4c322b920d3b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsVClosed;
		bool IsVClosed();

		/****** GeomEval_CircularHelicoidSurface::IsVPeriodic ******/
		/****** md5 signature: 2c0bd84ed110fb9f9bb998223c49a395 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomEval_CircularHelicoidSurface::Pitch ******/
		/****** md5 signature: 0021de1ddd2f36404cc1bc602e8a1d97 ******/
		%feature("compactdefaultargs") Pitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the pitch.
") Pitch;
		double Pitch();

		/****** GeomEval_CircularHelicoidSurface::SetPitch ******/
		/****** md5 signature: 648de5ae7fefb0bf66b050fbe8e0a8d1 ******/
		%feature("compactdefaultargs") SetPitch;
		%feature("autodoc", "
Parameters
----------
thePitch: double

Return
-------
None

Description
-----------
Sets a new pitch value. 
Input parameter: thePitch the new pitch (must be != 0) @throw Standard_ConstructionError if thePitch == 0.
") SetPitch;
		void SetPitch(double thePitch);

		/****** GeomEval_CircularHelicoidSurface::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_CircularHelicoidSurface::UIso ******/
		/****** md5 signature: 3030bc2ea2708d8c6595824c7f7be7f2 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Isoparametric curve extraction is not supported for this eval surface. @throw Standard_NotImplemented.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomEval_CircularHelicoidSurface::UReverse ******/
		/****** md5 signature: cebfb9b57b88817ec473af5443be776d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReverse;
		void UReverse();

		/****** GeomEval_CircularHelicoidSurface::UReversedParameter ******/
		/****** md5 signature: 4110bc22c0fb15535eb1019750434fed ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomEval_CircularHelicoidSurface::VIso ******/
		/****** md5 signature: 21b53846c2f42b60b8f8b2cab0ac0270 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Isoparametric curve extraction is not supported for this eval surface. @throw Standard_NotImplemented.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomEval_CircularHelicoidSurface::VReverse ******/
		/****** md5 signature: 9382c4825a17f3761861e610c481ab26 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReverse;
		void VReverse();

		/****** GeomEval_CircularHelicoidSurface::VReversedParameter ******/
		/****** md5 signature: b8382ca1a515d51126c89cc642c85f72 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReversedParameter;
		double VReversedParameter(const double V);

};


%make_alias(GeomEval_CircularHelicoidSurface)

%extend GeomEval_CircularHelicoidSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomEval_CircularHelixCurve *
************************************/
class GeomEval_CircularHelixCurve : public Geom_Curve {
	public:
		/****** GeomEval_CircularHelixCurve::GeomEval_CircularHelixCurve ******/
		/****** md5 signature: 54e7ce45835ae421e0fe9f61224cdafd ******/
		%feature("compactdefaultargs") GeomEval_CircularHelixCurve;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2
theRadius: double
thePitch: double

Return
-------
None

Description
-----------
Creates a circular helix with the given coordinate system, radius, and pitch. 
Input parameter: thePosition the local coordinate system 
Input parameter: theRadius the helix radius (must be > 0) 
Input parameter: thePitch the axial advance per 2*Pi turn (can be negative) @throw Standard_ConstructionError if theRadius <= 0.
") GeomEval_CircularHelixCurve;
		 GeomEval_CircularHelixCurve(const gp_Ax2 & thePosition, double theRadius, double thePitch);

		/****** GeomEval_CircularHelixCurve::Continuity ******/
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

		/****** GeomEval_CircularHelixCurve::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_CircularHelixCurve::EvalD0 ******/
		/****** md5 signature: 6d2f6bda2def2f1a5c06450e18a2448e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point at parameter U.
") EvalD0;
		gp_Pnt EvalD0(const double U);

		/****** GeomEval_CircularHelixCurve::EvalD1 ******/
		/****** md5 signature: 710afaf4eeb9572f5a2c4ff8202a1d98 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double U);

		/****** GeomEval_CircularHelixCurve::EvalD2 ******/
		/****** md5 signature: 6fcc40610ad4d1edfd19ad102d31116c ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double U);

		/****** GeomEval_CircularHelixCurve::EvalD3 ******/
		/****** md5 signature: 18218212c42fff5822f57b4b4973baff ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double U);

		/****** GeomEval_CircularHelixCurve::EvalDN ******/
		/****** md5 signature: 2ba89277702b68c9eb2b5061d04892f2 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec

Description
-----------
Computes the N-th derivative at parameter U. 
Input parameter: U the parameter value 
Input parameter: N the derivative order (must be >= 1) 
Return: the N-th derivative vector @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec EvalDN(const double U, const int N);

		/****** GeomEval_CircularHelixCurve::FirstParameter ******/
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

		/****** GeomEval_CircularHelixCurve::IsCN ******/
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

		/****** GeomEval_CircularHelixCurve::IsClosed ******/
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

		/****** GeomEval_CircularHelixCurve::IsPeriodic ******/
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

		/****** GeomEval_CircularHelixCurve::LastParameter ******/
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

		/****** GeomEval_CircularHelixCurve::Pitch ******/
		/****** md5 signature: 0021de1ddd2f36404cc1bc602e8a1d97 ******/
		%feature("compactdefaultargs") Pitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the pitch (axial advance per 2*Pi turn).
") Pitch;
		double Pitch();

		/****** GeomEval_CircularHelixCurve::Position ******/
		/****** md5 signature: 4998eb006d0dfaf45366e64da028e2d8 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the local coordinate system.
") Position;
		const gp_Ax2 Position();

		/****** GeomEval_CircularHelixCurve::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the helix radius.
") Radius;
		double Radius();

		/****** GeomEval_CircularHelixCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal of parametrization is not supported for this eval geometry. @throw Standard_NotImplemented.
") Reverse;
		void Reverse();

		/****** GeomEval_CircularHelixCurve::ReversedParameter ******/
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
Reversal of parametrization is not supported for this eval geometry. @throw Standard_NotImplemented.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** GeomEval_CircularHelixCurve::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(GeomEval_CircularHelixCurve)

%extend GeomEval_CircularHelixCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomEval_EllipsoidSurface *
**********************************/
class GeomEval_EllipsoidSurface : public Geom_ElementarySurface {
	public:
		/****** GeomEval_EllipsoidSurface::GeomEval_EllipsoidSurface ******/
		/****** md5 signature: e97d6f17c29aafe6b39fda80a70f96ac ******/
		%feature("compactdefaultargs") GeomEval_EllipsoidSurface;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax3
theA: double
theB: double
theC: double

Return
-------
None

Description
-----------
Creates a triaxial ellipsoid surface with the given local coordinate system and three semi-axes. 
Input parameter: thePosition the local coordinate system 
Input parameter: theA the semi-axis along XDir (must be > 0) 
Input parameter: theB the semi-axis along YDir (must be > 0) 
Input parameter: theC the semi-axis along ZDir (must be > 0) @throw Standard_ConstructionError if any semi-axis <= 0.
") GeomEval_EllipsoidSurface;
		 GeomEval_EllipsoidSurface(const gp_Ax3 & thePosition, double theA, double theB, double theC);

		/****** GeomEval_EllipsoidSurface::Bounds ******/
		/****** md5 signature: 00d684b8aaf3d1078ecb2fe950638d77 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this ellipsoid. @param[out] U1 lower U bound (0) @param[out] U2 upper U bound (2*Pi) @param[out] V1 lower V bound (-Pi/2) @param[out] V2 upper V bound (Pi/2).
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_EllipsoidSurface::Coefficients ******/
		/****** md5 signature: 6935e281981cbb88a046cf41d5fed67a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
A1: double
A2: double
A3: double
B1: double
B2: double
B3: double
C1: double
C2: double
C3: double
D: double

Description
-----------
Returns the coefficients of the implicit equation of the quadric in the absolute Cartesian coordinate system: @code A1*X^2 + A2*Y^2 + A3*Z^2 + 2*(B1*X*Y + B2*X*Z + B3*Y*Z) + 2*(C1*X + C2*Y + C3*Z) + D = 0 @endcode In local coordinates the equation is: X^2/A^2 + Y^2/B^2 + Z^2/C^2 - 1 = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_EllipsoidSurface::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this ellipsoid.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_EllipsoidSurface::EvalD0 ******/
		/****** md5 signature: 350fc6f963b4f7ad3faccbc657de1f8c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point P(U, V) on the surface. @code P(U, V) = O + A*cos(V)*cos(U)*XDir + B*cos(V)*sin(U)*YDir + C*sin(V)*ZDir @endcode.
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomEval_EllipsoidSurface::EvalD1 ******/
		/****** md5 signature: 715a8ecdc89a0feb3af4c34f4c058eb6 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and the first partial derivatives at (U, V).
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomEval_EllipsoidSurface::EvalD2 ******/
		/****** md5 signature: 4ec9141f6af0f8059ad5e5eb192fb519 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V).
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomEval_EllipsoidSurface::EvalD3 ******/
		/****** md5 signature: 8e3d70385fa2efac26fc5eabd699d449 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V).
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomEval_EllipsoidSurface::EvalDN ******/
		/****** md5 signature: 066e5f1f8cacfe362f11e807a1f2627e ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. 
Input parameter: U the u parameter 
Input parameter: V the v parameter 
Input parameter: Nu derivative order in u (must be >= 0) 
Input parameter: Nv derivative order in v (must be >= 0) 
Return: the derivative vector @throw Geom_UndefinedDerivative if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomEval_EllipsoidSurface::IsUClosed ******/
		/****** md5 signature: fe32a3e14eefd34f9b5ebf36eb79f283 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True. The ellipsoid is closed in U (period 2*Pi).
") IsUClosed;
		bool IsUClosed();

		/****** GeomEval_EllipsoidSurface::IsUPeriodic ******/
		/****** md5 signature: af4d7f95dcec12492d73d3d9bab79ae6 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True. The ellipsoid is periodic in U (period 2*Pi).
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomEval_EllipsoidSurface::IsVClosed ******/
		/****** md5 signature: 12726371c104f701024f4c322b920d3b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVClosed;
		bool IsVClosed();

		/****** GeomEval_EllipsoidSurface::IsVPeriodic ******/
		/****** md5 signature: 2c0bd84ed110fb9f9bb998223c49a395 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomEval_EllipsoidSurface::SemiAxisA ******/
		/****** md5 signature: 437d5197fcd5710db19ddb11c83ebc8e ******/
		%feature("compactdefaultargs") SemiAxisA;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the semi-axis A (along XDir).
") SemiAxisA;
		double SemiAxisA();

		/****** GeomEval_EllipsoidSurface::SemiAxisB ******/
		/****** md5 signature: 26578c2ada3742d0e12cc914cdc351d4 ******/
		%feature("compactdefaultargs") SemiAxisB;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the semi-axis B (along YDir).
") SemiAxisB;
		double SemiAxisB();

		/****** GeomEval_EllipsoidSurface::SemiAxisC ******/
		/****** md5 signature: c8f2ab2a33e999bd7401e22f9d80fafc ******/
		%feature("compactdefaultargs") SemiAxisC;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the semi-axis C (along ZDir).
") SemiAxisC;
		double SemiAxisC();

		/****** GeomEval_EllipsoidSurface::SetSemiAxisA ******/
		/****** md5 signature: 3a7060027f29598365a0a8b952432a91 ******/
		%feature("compactdefaultargs") SetSemiAxisA;
		%feature("autodoc", "
Parameters
----------
theA: double

Return
-------
None

Description
-----------
Assigns the value theA to the semi-axis A. 
Input parameter: theA the new semi-axis value (must be > 0) @throw Standard_ConstructionError if theA <= 0.
") SetSemiAxisA;
		void SetSemiAxisA(double theA);

		/****** GeomEval_EllipsoidSurface::SetSemiAxisB ******/
		/****** md5 signature: e5e9ebef6c6e8cc28b52e08577d838a0 ******/
		%feature("compactdefaultargs") SetSemiAxisB;
		%feature("autodoc", "
Parameters
----------
theB: double

Return
-------
None

Description
-----------
Assigns the value theB to the semi-axis B. 
Input parameter: theB the new semi-axis value (must be > 0) @throw Standard_ConstructionError if theB <= 0.
") SetSemiAxisB;
		void SetSemiAxisB(double theB);

		/****** GeomEval_EllipsoidSurface::SetSemiAxisC ******/
		/****** md5 signature: 26a6a366bb21f59c037dbf3178a35720 ******/
		%feature("compactdefaultargs") SetSemiAxisC;
		%feature("autodoc", "
Parameters
----------
theC: double

Return
-------
None

Description
-----------
Assigns the value theC to the semi-axis C. 
Input parameter: theC the new semi-axis value (must be > 0) @throw Standard_ConstructionError if theC <= 0.
") SetSemiAxisC;
		void SetSemiAxisC(double theC);

		/****** GeomEval_EllipsoidSurface::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_EllipsoidSurface::UIso ******/
		/****** md5 signature: 3030bc2ea2708d8c6595824c7f7be7f2 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. For a triaxial ellipsoid, the U isoparametric curve is not a standard Geom_Curve type. @throw Standard_NotImplemented.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomEval_EllipsoidSurface::UReverse ******/
		/****** md5 signature: cebfb9b57b88817ec473af5443be776d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReverse;
		void UReverse();

		/****** GeomEval_EllipsoidSurface::UReversedParameter ******/
		/****** md5 signature: 4110bc22c0fb15535eb1019750434fed ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomEval_EllipsoidSurface::VIso ******/
		/****** md5 signature: 21b53846c2f42b60b8f8b2cab0ac0270 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. For a triaxial ellipsoid, the V isoparametric curve is not a standard Geom_Curve type (it is an ellipse only when A == B). @throw Standard_NotImplemented.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomEval_EllipsoidSurface::VReverse ******/
		/****** md5 signature: 9382c4825a17f3761861e610c481ab26 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReverse;
		void VReverse();

		/****** GeomEval_EllipsoidSurface::VReversedParameter ******/
		/****** md5 signature: b8382ca1a515d51126c89cc642c85f72 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReversedParameter;
		double VReversedParameter(const double V);

};


%make_alias(GeomEval_EllipsoidSurface)

%extend GeomEval_EllipsoidSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomEval_HypParaboloidSurface *
**************************************/
class GeomEval_HypParaboloidSurface : public Geom_ElementarySurface {
	public:
		/****** GeomEval_HypParaboloidSurface::GeomEval_HypParaboloidSurface ******/
		/****** md5 signature: 3bdb8cb71e481e02f7fe2350f55af36a ******/
		%feature("compactdefaultargs") GeomEval_HypParaboloidSurface;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax3
theA: double
theB: double

Return
-------
None

Description
-----------
Creates a hyperbolic paraboloid surface with the given local coordinate system and semi-axis lengths. 
Input parameter: thePosition the local coordinate system 
Input parameter: theA the first semi-axis length (must be > 0) 
Input parameter: theB the second semi-axis length (must be > 0) @throw Standard_ConstructionError if theA <= 0 or theB <= 0.
") GeomEval_HypParaboloidSurface;
		 GeomEval_HypParaboloidSurface(const gp_Ax3 & thePosition, double theA, double theB);

		/****** GeomEval_HypParaboloidSurface::Bounds ******/
		/****** md5 signature: 00d684b8aaf3d1078ecb2fe950638d77 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this surface. @param[out] U1 lower U bound (-Precision::Infinite()) @param[out] U2 upper U bound (Precision::Infinite()) @param[out] V1 lower V bound (-Precision::Infinite()) @param[out] V2 upper V bound (Precision::Infinite()).
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_HypParaboloidSurface::Coefficients ******/
		/****** md5 signature: 6935e281981cbb88a046cf41d5fed67a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
A1: double
A2: double
A3: double
B1: double
B2: double
B3: double
C1: double
C2: double
C3: double
D: double

Description
-----------
Returns the coefficients of the implicit equation of the quadric in the absolute Cartesian coordinate system: @code A1*X^2 + A2*Y^2 + A3*Z^2 + 2*(B1*X*Y + B2*X*Z + B3*Y*Z) + 2*(C1*X + C2*Y + C3*Z) + D = 0 @endcode In local coordinates the equation is: X^2/A^2 - Y^2/B^2 - Z = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_HypParaboloidSurface::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this hyperbolic paraboloid.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_HypParaboloidSurface::EvalD0 ******/
		/****** md5 signature: 350fc6f963b4f7ad3faccbc657de1f8c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point P(U, V) on the surface. @code P(U, V) = O + U*XDir + V*YDir + (U^2/A^2 - V^2/B^2)*ZDir @endcode.
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomEval_HypParaboloidSurface::EvalD1 ******/
		/****** md5 signature: 715a8ecdc89a0feb3af4c34f4c058eb6 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and the first partial derivatives at (U, V).
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomEval_HypParaboloidSurface::EvalD2 ******/
		/****** md5 signature: 4ec9141f6af0f8059ad5e5eb192fb519 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V).
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomEval_HypParaboloidSurface::EvalD3 ******/
		/****** md5 signature: 8e3d70385fa2efac26fc5eabd699d449 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V).
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomEval_HypParaboloidSurface::EvalDN ******/
		/****** md5 signature: 066e5f1f8cacfe362f11e807a1f2627e ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. 
Input parameter: U the u parameter 
Input parameter: V the v parameter 
Input parameter: Nu derivative order in u (must be >= 0) 
Input parameter: Nv derivative order in v (must be >= 0) 
Return: the derivative vector @throw Geom_UndefinedDerivative if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomEval_HypParaboloidSurface::IsUClosed ******/
		/****** md5 signature: fe32a3e14eefd34f9b5ebf36eb79f283 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False. The hyperbolic paraboloid is not closed in U.
") IsUClosed;
		bool IsUClosed();

		/****** GeomEval_HypParaboloidSurface::IsUPeriodic ******/
		/****** md5 signature: af4d7f95dcec12492d73d3d9bab79ae6 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False. The hyperbolic paraboloid is not periodic in U.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomEval_HypParaboloidSurface::IsVClosed ******/
		/****** md5 signature: 12726371c104f701024f4c322b920d3b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False. The hyperbolic paraboloid is not closed in V.
") IsVClosed;
		bool IsVClosed();

		/****** GeomEval_HypParaboloidSurface::IsVPeriodic ******/
		/****** md5 signature: 2c0bd84ed110fb9f9bb998223c49a395 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False. The hyperbolic paraboloid is not periodic in V.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomEval_HypParaboloidSurface::SemiAxisA ******/
		/****** md5 signature: 437d5197fcd5710db19ddb11c83ebc8e ******/
		%feature("compactdefaultargs") SemiAxisA;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first semi-axis length A.
") SemiAxisA;
		double SemiAxisA();

		/****** GeomEval_HypParaboloidSurface::SemiAxisB ******/
		/****** md5 signature: 26578c2ada3742d0e12cc914cdc351d4 ******/
		%feature("compactdefaultargs") SemiAxisB;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the second semi-axis length B.
") SemiAxisB;
		double SemiAxisB();

		/****** GeomEval_HypParaboloidSurface::SetSemiAxisA ******/
		/****** md5 signature: 3a7060027f29598365a0a8b952432a91 ******/
		%feature("compactdefaultargs") SetSemiAxisA;
		%feature("autodoc", "
Parameters
----------
theA: double

Return
-------
None

Description
-----------
Assigns the value theA to the first semi-axis length. 
Input parameter: theA the new first semi-axis length (must be > 0) @throw Standard_ConstructionError if theA <= 0.
") SetSemiAxisA;
		void SetSemiAxisA(double theA);

		/****** GeomEval_HypParaboloidSurface::SetSemiAxisB ******/
		/****** md5 signature: e5e9ebef6c6e8cc28b52e08577d838a0 ******/
		%feature("compactdefaultargs") SetSemiAxisB;
		%feature("autodoc", "
Parameters
----------
theB: double

Return
-------
None

Description
-----------
Assigns the value theB to the second semi-axis length. 
Input parameter: theB the new second semi-axis length (must be > 0) @throw Standard_ConstructionError if theB <= 0.
") SetSemiAxisB;
		void SetSemiAxisB(double theB);

		/****** GeomEval_HypParaboloidSurface::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_HypParaboloidSurface::UIso ******/
		/****** md5 signature: 3030bc2ea2708d8c6595824c7f7be7f2 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. For a hyperbolic paraboloid, no standard Geom_Curve representation is available. @throw Standard_NotImplemented.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomEval_HypParaboloidSurface::UReverse ******/
		/****** md5 signature: cebfb9b57b88817ec473af5443be776d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReverse;
		void UReverse();

		/****** GeomEval_HypParaboloidSurface::UReversedParameter ******/
		/****** md5 signature: 4110bc22c0fb15535eb1019750434fed ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomEval_HypParaboloidSurface::VIso ******/
		/****** md5 signature: 21b53846c2f42b60b8f8b2cab0ac0270 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. For a hyperbolic paraboloid, no standard Geom_Curve representation is available. @throw Standard_NotImplemented.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomEval_HypParaboloidSurface::VReverse ******/
		/****** md5 signature: 9382c4825a17f3761861e610c481ab26 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReverse;
		void VReverse();

		/****** GeomEval_HypParaboloidSurface::VReversedParameter ******/
		/****** md5 signature: b8382ca1a515d51126c89cc642c85f72 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReversedParameter;
		double VReversedParameter(const double V);

};


%make_alias(GeomEval_HypParaboloidSurface)

%extend GeomEval_HypParaboloidSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomEval_HyperboloidSurface *
************************************/
class GeomEval_HyperboloidSurface : public Geom_ElementarySurface {
	public:
/* public enums */
enum class SheetMode {
	OneSheet = 0,
	TwoSheets = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class SheetMode(IntEnum):
	OneSheet = 0
	TwoSheets = 1
OneSheet = SheetMode.OneSheet
TwoSheets = SheetMode.TwoSheets
};
/* end python proxy for enums */

		/****** GeomEval_HyperboloidSurface::GeomEval_HyperboloidSurface ******/
		/****** md5 signature: bf2fbd5e8cfb1e495e175e783af672ad ******/
		%feature("compactdefaultargs") GeomEval_HyperboloidSurface;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax3
theR1: double
theR2: double
theMode: SheetMode (optional, default to SheetMode::OneSheet)

Return
-------
None

Description
-----------
Creates a hyperboloid surface with the given local coordinate system, semi-axis radii, and sheet mode. 
Input parameter: thePosition local coordinate system 
Input parameter: theR1 first semi-axis radius (must be > 0) 
Input parameter: theR2 second semi-axis radius (must be > 0) 
Input parameter: theMode one-sheet or two-sheet mode @throw Standard_ConstructionError if theR1 <= 0 or theR2 <= 0.
") GeomEval_HyperboloidSurface;
		 GeomEval_HyperboloidSurface(const gp_Ax3 & thePosition, double theR1, double theR2, SheetMode theMode = SheetMode::OneSheet);

		/****** GeomEval_HyperboloidSurface::Bounds ******/
		/****** md5 signature: 00d684b8aaf3d1078ecb2fe950638d77 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this hyperboloid. @param[out] U1 lower U bound (0) @param[out] U2 upper U bound (2*Pi) @param[out] V1 lower V bound (-Precision::Infinite()) @param[out] V2 upper V bound (Precision::Infinite()).
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_HyperboloidSurface::Coefficients ******/
		/****** md5 signature: 6935e281981cbb88a046cf41d5fed67a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
A1: double
A2: double
A3: double
B1: double
B2: double
B3: double
C1: double
C2: double
C3: double
D: double

Description
-----------
Returns the coefficients of the implicit equation of the quadric in the absolute Cartesian coordinate system: @code A1*X^2 + A2*Y^2 + A3*Z^2 + 2*(B1*X*Y + B2*X*Z + B3*Y*Z) + 2*(C1*X + C2*Y + C3*Z) + D = 0 @endcode For one-sheet (local): X^2/R1^2 + Y^2/R1^2 - Z^2/R2^2 - 1 = 0. For two-sheet (local): X^2/R2^2 + Y^2/R2^2 - Z^2/R1^2 + 1 = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_HyperboloidSurface::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this hyperboloid.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_HyperboloidSurface::EvalD0 ******/
		/****** md5 signature: 350fc6f963b4f7ad3faccbc657de1f8c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point P(U, V) on the surface.
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomEval_HyperboloidSurface::EvalD1 ******/
		/****** md5 signature: 715a8ecdc89a0feb3af4c34f4c058eb6 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and the first partial derivatives at (U, V).
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomEval_HyperboloidSurface::EvalD2 ******/
		/****** md5 signature: 4ec9141f6af0f8059ad5e5eb192fb519 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V).
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomEval_HyperboloidSurface::EvalD3 ******/
		/****** md5 signature: 8e3d70385fa2efac26fc5eabd699d449 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V).
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomEval_HyperboloidSurface::EvalDN ******/
		/****** md5 signature: 066e5f1f8cacfe362f11e807a1f2627e ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. 
Input parameter: U the u parameter 
Input parameter: V the v parameter 
Input parameter: Nu derivative order in u (must be >= 0) 
Input parameter: Nv derivative order in v (must be >= 0) 
Return: the derivative vector @throw Geom_UndefinedDerivative if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomEval_HyperboloidSurface::IsUClosed ******/
		/****** md5 signature: fe32a3e14eefd34f9b5ebf36eb79f283 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True. The hyperboloid is closed in U (period 2*Pi).
") IsUClosed;
		bool IsUClosed();

		/****** GeomEval_HyperboloidSurface::IsUPeriodic ******/
		/****** md5 signature: af4d7f95dcec12492d73d3d9bab79ae6 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True. The hyperboloid is periodic in U (period 2*Pi).
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomEval_HyperboloidSurface::IsVClosed ******/
		/****** md5 signature: 12726371c104f701024f4c322b920d3b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVClosed;
		bool IsVClosed();

		/****** GeomEval_HyperboloidSurface::IsVPeriodic ******/
		/****** md5 signature: 2c0bd84ed110fb9f9bb998223c49a395 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomEval_HyperboloidSurface::Mode ******/
		/****** md5 signature: 3b145d873bef30f74e2c459eb9bcd1b9 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
GeomEval_HyperboloidSurface::SheetMode

Description
-----------
Returns the sheet mode.
") Mode;
		GeomEval_HyperboloidSurface::SheetMode Mode();

		/****** GeomEval_HyperboloidSurface::R1 ******/
		/****** md5 signature: b3387fdc442107c8defa0b49a854cb01 ******/
		%feature("compactdefaultargs") R1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first semi-axis radius.
") R1;
		double R1();

		/****** GeomEval_HyperboloidSurface::R2 ******/
		/****** md5 signature: 12ba4a5b191c111f123be7331b991e48 ******/
		%feature("compactdefaultargs") R2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the second semi-axis radius.
") R2;
		double R2();

		/****** GeomEval_HyperboloidSurface::SetMode ******/
		/****** md5 signature: 28d7a60bfeefd34d33fcfe10f1d29ad1 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
theMode: SheetMode

Return
-------
None

Description
-----------
Sets the sheet mode. 
Input parameter: theMode one-sheet or two-sheet mode.
") SetMode;
		void SetMode(SheetMode theMode);

		/****** GeomEval_HyperboloidSurface::SetR1 ******/
		/****** md5 signature: 16388bffad3c6c1e9ad5b2aacf66247f ******/
		%feature("compactdefaultargs") SetR1;
		%feature("autodoc", "
Parameters
----------
theR1: double

Return
-------
None

Description
-----------
Assigns the value theR1 to the first semi-axis radius. 
Input parameter: theR1 the new first semi-axis radius (must be > 0) @throw Standard_ConstructionError if theR1 <= 0.
") SetR1;
		void SetR1(double theR1);

		/****** GeomEval_HyperboloidSurface::SetR2 ******/
		/****** md5 signature: d635f1a85d4ccc6854f33435cb905e43 ******/
		%feature("compactdefaultargs") SetR2;
		%feature("autodoc", "
Parameters
----------
theR2: double

Return
-------
None

Description
-----------
Assigns the value theR2 to the second semi-axis radius. 
Input parameter: theR2 the new second semi-axis radius (must be > 0) @throw Standard_ConstructionError if theR2 <= 0.
") SetR2;
		void SetR2(double theR2);

		/****** GeomEval_HyperboloidSurface::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_HyperboloidSurface::UIso ******/
		/****** md5 signature: 3030bc2ea2708d8c6595824c7f7be7f2 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. For a hyperboloid, no standard Geom_Curve representation is available. @throw Standard_NotImplemented.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomEval_HyperboloidSurface::UReverse ******/
		/****** md5 signature: cebfb9b57b88817ec473af5443be776d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReverse;
		void UReverse();

		/****** GeomEval_HyperboloidSurface::UReversedParameter ******/
		/****** md5 signature: 4110bc22c0fb15535eb1019750434fed ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomEval_HyperboloidSurface::VIso ******/
		/****** md5 signature: 21b53846c2f42b60b8f8b2cab0ac0270 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. For a hyperboloid, no standard Geom_Curve representation is available. @throw Standard_NotImplemented.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomEval_HyperboloidSurface::VReverse ******/
		/****** md5 signature: 9382c4825a17f3761861e610c481ab26 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReverse;
		void VReverse();

		/****** GeomEval_HyperboloidSurface::VReversedParameter ******/
		/****** md5 signature: b8382ca1a515d51126c89cc642c85f72 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReversedParameter;
		double VReversedParameter(const double V);

};


%make_alias(GeomEval_HyperboloidSurface)

%extend GeomEval_HyperboloidSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomEval_ParaboloidSurface *
***********************************/
class GeomEval_ParaboloidSurface : public Geom_ElementarySurface {
	public:
		/****** GeomEval_ParaboloidSurface::GeomEval_ParaboloidSurface ******/
		/****** md5 signature: e7820b015a54a528f355a15e0777f189 ******/
		%feature("compactdefaultargs") GeomEval_ParaboloidSurface;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax3
theFocal: double

Return
-------
None

Description
-----------
Creates a paraboloid surface with the given local coordinate system and focal distance. 
Input parameter: thePosition the local coordinate system 
Input parameter: theFocal the focal distance (must be > 0) @throw Standard_ConstructionError if theFocal <= 0.
") GeomEval_ParaboloidSurface;
		 GeomEval_ParaboloidSurface(const gp_Ax3 & thePosition, double theFocal);

		/****** GeomEval_ParaboloidSurface::Bounds ******/
		/****** md5 signature: 00d684b8aaf3d1078ecb2fe950638d77 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this paraboloid. @param[out] U1 lower U bound (0) @param[out] U2 upper U bound (2*Pi) @param[out] V1 lower V bound (-Precision::Infinite()) @param[out] V2 upper V bound (Precision::Infinite()).
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_ParaboloidSurface::Coefficients ******/
		/****** md5 signature: 6935e281981cbb88a046cf41d5fed67a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
A1: double
A2: double
A3: double
B1: double
B2: double
B3: double
C1: double
C2: double
C3: double
D: double

Description
-----------
Returns the coefficients of the implicit equation of the quadric in the absolute Cartesian coordinate system: @code A1*X^2 + A2*Y^2 + A3*Z^2 + 2*(B1*X*Y + B2*X*Z + B3*Y*Z) + 2*(C1*X + C2*Y + C3*Z) + D = 0 @endcode In local coordinates the equation is: X^2 + Y^2 - 4*F*Z = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_ParaboloidSurface::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this paraboloid.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_ParaboloidSurface::EvalD0 ******/
		/****** md5 signature: 350fc6f963b4f7ad3faccbc657de1f8c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point P(U, V) on the surface. @code P(U, V) = O + V*cos(U)*XDir + V*sin(U)*YDir + V^2/(4*F)*ZDir @endcode.
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomEval_ParaboloidSurface::EvalD1 ******/
		/****** md5 signature: 715a8ecdc89a0feb3af4c34f4c058eb6 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and the first partial derivatives at (U, V).
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomEval_ParaboloidSurface::EvalD2 ******/
		/****** md5 signature: 4ec9141f6af0f8059ad5e5eb192fb519 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V).
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomEval_ParaboloidSurface::EvalD3 ******/
		/****** md5 signature: 8e3d70385fa2efac26fc5eabd699d449 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V).
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomEval_ParaboloidSurface::EvalDN ******/
		/****** md5 signature: 066e5f1f8cacfe362f11e807a1f2627e ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. 
Input parameter: U the u parameter 
Input parameter: V the v parameter 
Input parameter: Nu derivative order in u (must be >= 0) 
Input parameter: Nv derivative order in v (must be >= 0) 
Return: the derivative vector @throw Geom_UndefinedDerivative if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomEval_ParaboloidSurface::Focal ******/
		/****** md5 signature: 3803e722169e3501b54b680807b4ccc1 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the focal distance of this paraboloid.
") Focal;
		double Focal();

		/****** GeomEval_ParaboloidSurface::IsUClosed ******/
		/****** md5 signature: fe32a3e14eefd34f9b5ebf36eb79f283 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True. The paraboloid is closed in U (period 2*Pi).
") IsUClosed;
		bool IsUClosed();

		/****** GeomEval_ParaboloidSurface::IsUPeriodic ******/
		/****** md5 signature: af4d7f95dcec12492d73d3d9bab79ae6 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True. The paraboloid is periodic in U (period 2*Pi).
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomEval_ParaboloidSurface::IsVClosed ******/
		/****** md5 signature: 12726371c104f701024f4c322b920d3b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVClosed;
		bool IsVClosed();

		/****** GeomEval_ParaboloidSurface::IsVPeriodic ******/
		/****** md5 signature: 2c0bd84ed110fb9f9bb998223c49a395 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomEval_ParaboloidSurface::SetFocal ******/
		/****** md5 signature: a021fc7436d200744abefba63f007e2f ******/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "
Parameters
----------
theFocal: double

Return
-------
None

Description
-----------
Assigns the value theFocal to the focal distance of this paraboloid. 
Input parameter: theFocal the new focal distance (must be > 0) @throw Standard_ConstructionError if theFocal <= 0.
") SetFocal;
		void SetFocal(double theFocal);

		/****** GeomEval_ParaboloidSurface::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_ParaboloidSurface::UIso ******/
		/****** md5 signature: 3030bc2ea2708d8c6595824c7f7be7f2 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. For a paraboloid, the U isoparametric curve is a parabola, which is not a standard Geom_Curve type. @throw Standard_NotImplemented.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomEval_ParaboloidSurface::UReverse ******/
		/****** md5 signature: cebfb9b57b88817ec473af5443be776d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReverse;
		void UReverse();

		/****** GeomEval_ParaboloidSurface::UReversedParameter ******/
		/****** md5 signature: 4110bc22c0fb15535eb1019750434fed ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomEval_ParaboloidSurface::VIso ******/
		/****** md5 signature: 21b53846c2f42b60b8f8b2cab0ac0270 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. For a paraboloid, the V isoparametric curve is a circle of radius |v|, which degenerates to a point at v=0. @throw Standard_NotImplemented.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomEval_ParaboloidSurface::VReverse ******/
		/****** md5 signature: 9382c4825a17f3761861e610c481ab26 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReverse;
		void VReverse();

		/****** GeomEval_ParaboloidSurface::VReversedParameter ******/
		/****** md5 signature: b8382ca1a515d51126c89cc642c85f72 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReversedParameter;
		double VReversedParameter(const double V);

};


%make_alias(GeomEval_ParaboloidSurface)

%extend GeomEval_ParaboloidSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomEval_SineWaveCurve *
*******************************/
class GeomEval_SineWaveCurve : public Geom_Curve {
	public:
		/****** GeomEval_SineWaveCurve::GeomEval_SineWaveCurve ******/
		/****** md5 signature: f0377e0cf7ef322a8b3feb1a896c2fa0 ******/
		%feature("compactdefaultargs") GeomEval_SineWaveCurve;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2
theAmplitude: double
theOmega: double
thePhase: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates a 3D sine wave curve. 
Input parameter: thePosition the local coordinate system 
Input parameter: theAmplitude the wave amplitude (must be > 0) 
Input parameter: theOmega the angular frequency (must be > 0) 
Input parameter: thePhase the phase shift (default 0) @throw Standard_ConstructionError if theAmplitude <= 0 or theOmega <= 0.
") GeomEval_SineWaveCurve;
		 GeomEval_SineWaveCurve(const gp_Ax2 & thePosition, double theAmplitude, double theOmega, double thePhase = 0.0);

		/****** GeomEval_SineWaveCurve::Amplitude ******/
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

		/****** GeomEval_SineWaveCurve::Continuity ******/
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

		/****** GeomEval_SineWaveCurve::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_SineWaveCurve::EvalD0 ******/
		/****** md5 signature: 6d2f6bda2def2f1a5c06450e18a2448e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point at parameter U.
") EvalD0;
		gp_Pnt EvalD0(const double U);

		/****** GeomEval_SineWaveCurve::EvalD1 ******/
		/****** md5 signature: 710afaf4eeb9572f5a2c4ff8202a1d98 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter U.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double U);

		/****** GeomEval_SineWaveCurve::EvalD2 ******/
		/****** md5 signature: 6fcc40610ad4d1edfd19ad102d31116c ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter U.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double U);

		/****** GeomEval_SineWaveCurve::EvalD3 ******/
		/****** md5 signature: 18218212c42fff5822f57b4b4973baff ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter U.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double U);

		/****** GeomEval_SineWaveCurve::EvalDN ******/
		/****** md5 signature: 2ba89277702b68c9eb2b5061d04892f2 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec

Description
-----------
Computes the N-th derivative at parameter U. @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec EvalDN(const double U, const int N);

		/****** GeomEval_SineWaveCurve::FirstParameter ******/
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

		/****** GeomEval_SineWaveCurve::IsCN ******/
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

		/****** GeomEval_SineWaveCurve::IsClosed ******/
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

		/****** GeomEval_SineWaveCurve::IsPeriodic ******/
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

		/****** GeomEval_SineWaveCurve::LastParameter ******/
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

		/****** GeomEval_SineWaveCurve::Omega ******/
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

		/****** GeomEval_SineWaveCurve::Phase ******/
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

		/****** GeomEval_SineWaveCurve::Position ******/
		/****** md5 signature: 4998eb006d0dfaf45366e64da028e2d8 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the local coordinate system.
") Position;
		const gp_Ax2 Position();

		/****** GeomEval_SineWaveCurve::Reverse ******/
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

		/****** GeomEval_SineWaveCurve::ReversedParameter ******/
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

		/****** GeomEval_SineWaveCurve::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(GeomEval_SineWaveCurve)

%extend GeomEval_SineWaveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomEval_TBezierCurve *
******************************/
class GeomEval_TBezierCurve : public Geom_BoundedCurve {
	public:
		/****** GeomEval_TBezierCurve::GeomEval_TBezierCurve ******/
		/****** md5 signature: f4eb02c37647c12c7b90c9d96700c700 ******/
		%feature("compactdefaultargs") GeomEval_TBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt
theAlpha: double

Return
-------
None

Description
-----------
Constructs a non-rational T-Bezier curve from poles and alpha. 
Input parameter: thePoles control points (1-based, size must be odd >= 3) 
Input parameter: theAlpha frequency parameter (must be > 0) @throw Standard_ConstructionError if NbPoles is not odd or < 3 or theAlpha <= 0.
") GeomEval_TBezierCurve;
		 GeomEval_TBezierCurve(const TColgp_Array1OfPnt & thePoles, double theAlpha);

		/****** GeomEval_TBezierCurve::GeomEval_TBezierCurve ******/
		/****** md5 signature: 2761db160ba1fdabd12c34d169b5da73 ******/
		%feature("compactdefaultargs") GeomEval_TBezierCurve;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt
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
") GeomEval_TBezierCurve;
		 GeomEval_TBezierCurve(const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal & theWeights, double theAlpha);

		/****** GeomEval_TBezierCurve::Alpha ******/
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

		/****** GeomEval_TBezierCurve::Continuity ******/
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

		/****** GeomEval_TBezierCurve::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this T-Bezier curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_TBezierCurve::EndPoint ******/
		/****** md5 signature: 1d65a54ecc39cd5733d739743335f6ff ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the end point C(Pi/alpha).
") EndPoint;
		gp_Pnt EndPoint();

		/****** GeomEval_TBezierCurve::EvalD0 ******/
		/****** md5 signature: 6d2f6bda2def2f1a5c06450e18a2448e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point C(U).
") EvalD0;
		gp_Pnt EvalD0(const double U);

		/****** GeomEval_TBezierCurve::EvalD1 ******/
		/****** md5 signature: 710afaf4eeb9572f5a2c4ff8202a1d98 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point and first derivative at U.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double U);

		/****** GeomEval_TBezierCurve::EvalD2 ******/
		/****** md5 signature: 6fcc40610ad4d1edfd19ad102d31116c ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at U.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double U);

		/****** GeomEval_TBezierCurve::EvalD3 ******/
		/****** md5 signature: 18218212c42fff5822f57b4b4973baff ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at U.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double U);

		/****** GeomEval_TBezierCurve::EvalDN ******/
		/****** md5 signature: 2ba89277702b68c9eb2b5061d04892f2 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec

Description
-----------
Computes the N-th derivative at U. 
Input parameter: U parameter value 
Input parameter: N derivative order (must be >= 1) 
Return: the N-th derivative vector @throw Standard_RangeError if N < 1.
") EvalDN;
		gp_Vec EvalDN(const double U, const int N);

		/****** GeomEval_TBezierCurve::FirstParameter ******/
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

		/****** GeomEval_TBezierCurve::IsCN ******/
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

		/****** GeomEval_TBezierCurve::IsClosed ******/
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

		/****** GeomEval_TBezierCurve::IsPeriodic ******/
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

		/****** GeomEval_TBezierCurve::IsRational ******/
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

		/****** GeomEval_TBezierCurve::LastParameter ******/
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

		/****** GeomEval_TBezierCurve::NbPoles ******/
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

		/****** GeomEval_TBezierCurve::Order ******/
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

		/****** GeomEval_TBezierCurve::Poles ******/
		/****** md5 signature: 663bb42f249a1a7e08feff11d136eca9 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt

Description
-----------
Returns the poles array.
") Poles;
		const TColgp_Array1OfPnt & Poles();

		/****** GeomEval_TBezierCurve::Reverse ******/
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

		/****** GeomEval_TBezierCurve::ReversedParameter ******/
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

		/****** GeomEval_TBezierCurve::StartPoint ******/
		/****** md5 signature: 8a586296583b30cec9a994e9c703d6ca ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the start point C(0).
") StartPoint;
		gp_Pnt StartPoint();

		/****** GeomEval_TBezierCurve::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_TBezierCurve::Weights ******/
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


%make_alias(GeomEval_TBezierCurve)

%extend GeomEval_TBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomEval_TBezierSurface *
********************************/
class GeomEval_TBezierSurface : public Geom_BoundedSurface {
	public:
		/****** GeomEval_TBezierSurface::GeomEval_TBezierSurface ******/
		/****** md5 signature: 6305a85158d6a6ff7a2479ad019d5e26 ******/
		%feature("compactdefaultargs") GeomEval_TBezierSurface;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array2OfPnt
theAlphaU: double
theAlphaV: double

Return
-------
None

Description
-----------
Constructs a non-rational T-Bezier surface from poles and alpha parameters. 
Input parameter: thePoles control points grid (row count and col count must be odd >= 3) 
Input parameter: theAlphaU frequency parameter in U direction (must be > 0) 
Input parameter: theAlphaV frequency parameter in V direction (must be > 0) @throw Standard_ConstructionError if validation fails.
") GeomEval_TBezierSurface;
		 GeomEval_TBezierSurface(const TColgp_Array2OfPnt & thePoles, double theAlphaU, double theAlphaV);

		/****** GeomEval_TBezierSurface::GeomEval_TBezierSurface ******/
		/****** md5 signature: a35e8f96d8434de90bb3424dd1f97967 ******/
		%feature("compactdefaultargs") GeomEval_TBezierSurface;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array2OfPnt
theWeights: TColStd_Array2OfReal
theAlphaU: double
theAlphaV: double

Return
-------
None

Description
-----------
Constructs a rational T-Bezier surface. 
Input parameter: thePoles control points grid 
Input parameter: theWeights weights grid (same dimensions as poles, all > 0) 
Input parameter: theAlphaU frequency parameter in U direction (must be > 0) 
Input parameter: theAlphaV frequency parameter in V direction (must be > 0) @throw Standard_ConstructionError if validation fails.
") GeomEval_TBezierSurface;
		 GeomEval_TBezierSurface(const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal & theWeights, double theAlphaU, double theAlphaV);

		/****** GeomEval_TBezierSurface::AlphaU ******/
		/****** md5 signature: a13b516a3d18b134dda1db97aa6e5b5a ******/
		%feature("compactdefaultargs") AlphaU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the frequency parameter alpha in the U direction.
") AlphaU;
		double AlphaU();

		/****** GeomEval_TBezierSurface::AlphaV ******/
		/****** md5 signature: fde4defa25bb05c817ccc3d35f44dd51 ******/
		%feature("compactdefaultargs") AlphaV;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the frequency parameter alpha in the V direction.
") AlphaV;
		double AlphaV();

		/****** GeomEval_TBezierSurface::Bounds ******/
		/****** md5 signature: 00d684b8aaf3d1078ecb2fe950638d77 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns the parametric bounds. @param[out] U1 lower U bound (0) @param[out] U2 upper U bound (Pi/alphaU) @param[out] V1 lower V bound (0) @param[out] V2 upper V bound (Pi/alphaV).
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomEval_TBezierSurface::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN. T-Bezier surfaces are infinitely differentiable.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** GeomEval_TBezierSurface::Copy ******/
		/****** md5 signature: dc6e70a88406e0550a58922812e47ece ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this T-Bezier surface.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();


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
		/****** GeomEval_TBezierSurface::EvalD0 ******/
		/****** md5 signature: 350fc6f963b4f7ad3faccbc657de1f8c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point S(U, V).
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** GeomEval_TBezierSurface::EvalD1 ******/
		/****** md5 signature: 715a8ecdc89a0feb3af4c34f4c058eb6 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and first partial derivatives at (U, V).
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** GeomEval_TBezierSurface::EvalD2 ******/
		/****** md5 signature: 4ec9141f6af0f8059ad5e5eb192fb519 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V).
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** GeomEval_TBezierSurface::EvalD3 ******/
		/****** md5 signature: 8e3d70385fa2efac26fc5eabd699d449 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V).
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** GeomEval_TBezierSurface::EvalDN ******/
		/****** md5 signature: 066e5f1f8cacfe362f11e807a1f2627e ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in U and Nv in V. 
Input parameter: U the u parameter 
Input parameter: V the v parameter 
Input parameter: Nu derivative order in U (must be >= 0) 
Input parameter: Nv derivative order in V (must be >= 0) 
Return: the derivative vector @throw Standard_RangeError if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** GeomEval_TBezierSurface::IsCNu ******/
		/****** md5 signature: 9a6f533916836c9b7c4f0ff0a609fae2 ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true for all N. T-Bezier surfaces are infinitely differentiable in U.
") IsCNu;
		bool IsCNu(const int N);

		/****** GeomEval_TBezierSurface::IsCNv ******/
		/****** md5 signature: 4e12377e4fee255bb2fbd018134f6b55 ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true for all N. T-Bezier surfaces are infinitely differentiable in V.
") IsCNv;
		bool IsCNv(const int N);

		/****** GeomEval_TBezierSurface::IsRational ******/
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface is rational.
") IsRational;
		bool IsRational();

		/****** GeomEval_TBezierSurface::IsUClosed ******/
		/****** md5 signature: fe32a3e14eefd34f9b5ebf36eb79f283 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface is closed in U.
") IsUClosed;
		bool IsUClosed();

		/****** GeomEval_TBezierSurface::IsUPeriodic ******/
		/****** md5 signature: af4d7f95dcec12492d73d3d9bab79ae6 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. T-Bezier surfaces are not periodic in U.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomEval_TBezierSurface::IsVClosed ******/
		/****** md5 signature: 12726371c104f701024f4c322b920d3b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface is closed in V.
") IsVClosed;
		bool IsVClosed();

		/****** GeomEval_TBezierSurface::IsVPeriodic ******/
		/****** md5 signature: 2c0bd84ed110fb9f9bb998223c49a395 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false. T-Bezier surfaces are not periodic in V.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomEval_TBezierSurface::NbUPoles ******/
		/****** md5 signature: ecab3cbbaf18559e002fccdfa81aa0d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the U direction.
") NbUPoles;
		int NbUPoles();

		/****** GeomEval_TBezierSurface::NbVPoles ******/
		/****** md5 signature: fd4ae03f2a37db0cb241bb2f458a15bb ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the V direction.
") NbVPoles;
		int NbVPoles();

		/****** GeomEval_TBezierSurface::OrderU ******/
		/****** md5 signature: e4be86a9645cc36154f568835f8d2729 ******/
		%feature("compactdefaultargs") OrderU;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the trigonometric order in U (NbUPoles = 2*nU + 1).
") OrderU;
		int OrderU();

		/****** GeomEval_TBezierSurface::OrderV ******/
		/****** md5 signature: a8e0730a368726ef9b19f73d57529bd0 ******/
		%feature("compactdefaultargs") OrderV;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the trigonometric order in V (NbVPoles = 2*nV + 1).
") OrderV;
		int OrderV();

		/****** GeomEval_TBezierSurface::Poles ******/
		/****** md5 signature: 14016e5d40bac5fa096e746e935d87cd ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
Returns the poles grid.
") Poles;
		const TColgp_Array2OfPnt & Poles();

		/****** GeomEval_TBezierSurface::Transform ******/
		/****** md5 signature: dbcb855e51c20670a25d86074457a834 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation is not supported for this eval geometry. @throw Standard_NotImplemented.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomEval_TBezierSurface::UIso ******/
		/****** md5 signature: 3030bc2ea2708d8c6595824c7f7be7f2 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Isoparametric curve extraction is not supported for this eval surface. @throw Standard_NotImplemented.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** GeomEval_TBezierSurface::UReverse ******/
		/****** md5 signature: cebfb9b57b88817ec473af5443be776d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReverse;
		void UReverse();

		/****** GeomEval_TBezierSurface::UReversedParameter ******/
		/****** md5 signature: 4110bc22c0fb15535eb1019750434fed ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** GeomEval_TBezierSurface::VIso ******/
		/****** md5 signature: 21b53846c2f42b60b8f8b2cab0ac0270 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Isoparametric curve extraction is not supported for this eval surface. @throw Standard_NotImplemented.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** GeomEval_TBezierSurface::VReverse ******/
		/****** md5 signature: 9382c4825a17f3761861e610c481ab26 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReverse;
		void VReverse();

		/****** GeomEval_TBezierSurface::VReversedParameter ******/
		/****** md5 signature: b8382ca1a515d51126c89cc642c85f72 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Reversal is not supported for this eval surface. @throw Standard_NotImplemented.
") VReversedParameter;
		double VReversedParameter(const double V);

		/****** GeomEval_TBezierSurface::Weights ******/
		/****** md5 signature: 7f881df6c273a11e54472a6e9569e510 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
Returns the weights grid (empty if non-rational).
") Weights;
		const TColStd_Array2OfReal & Weights();

};


%make_alias(GeomEval_TBezierSurface)

%extend GeomEval_TBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************
* class Map1d *
**************/
/**************
* class Map2d *
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

@classnotwrapped
class Map2d:
	pass

@classnotwrapped
class Domain2d:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
