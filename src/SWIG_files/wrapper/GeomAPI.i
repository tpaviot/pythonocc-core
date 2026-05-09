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
%define GEOMAPIDOCSTRING
"GeomAPI module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomapi.html"
%enddef
%module (package="OCC.Core", docstring=GEOMAPIDOCSTRING) GeomAPI


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
#include<GeomAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<Extrema_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<AppParCurves_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import gp.i
%import Geom2d.i
%import Extrema.i
%import TColgp.i
%import TColStd.i
%import GeomAbs.i
%import Approx.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************
* class GeomAPI *
****************/
%rename(geomapi) GeomAPI;
class GeomAPI {
	public:
		/****** GeomAPI::To2d ******/
		/****** md5 signature: 46767ba0b9de8c155b0c1451dc4d31a0 ******/
		%feature("compactdefaultargs") To2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
P: gp_Pln

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
This function builds (in the parametric space of the plane P) a 2D curve equivalent to the 3D curve C. The 3D curve C is considered to be located in the plane P. Warning The 3D curve C must be of one of the following types: - a line - a circle - an ellipse - a hyperbola - a parabola - a Bezier curve - a BSpline curve Exceptions Standard_NoSuchObject if C is not a defined type curve.
") To2d;
		static opencascade::handle<Geom2d_Curve> To2d(const opencascade::handle<Geom_Curve> & C, const gp_Pln & P);

		/****** GeomAPI::To3d ******/
		/****** md5 signature: c6040ccc3dbcd8e3934502306b71f14f ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
P: gp_Pln

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Builds a 3D curve equivalent to the 2D curve C described in the parametric space defined by the local coordinate system of plane P. The resulting 3D curve is of the same nature as that of the curve C.
") To3d;
		static opencascade::handle<Geom_Curve> To3d(const opencascade::handle<Geom2d_Curve> & C, const gp_Pln & P);

};


%extend GeomAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomAPI_ExtremaCurveCurve *
**********************************/
class GeomAPI_ExtremaCurveCurve {
	public:
		/****** GeomAPI_ExtremaCurveCurve::GeomAPI_ExtremaCurveCurve ******/
		/****** md5 signature: a3010c7573b0359accbee1e737d0c0c9 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm for computing extrema between two curves. Use an Init function to define the curves on which it is going to work.
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve();

		/****** GeomAPI_ExtremaCurveCurve::GeomAPI_ExtremaCurveCurve ******/
		/****** md5 signature: 0c7a7ec6c28252d008d2320948a498fe ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve

Return
-------
None

Description
-----------
Computes the extrema between the curves C1 and C2.
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****** GeomAPI_ExtremaCurveCurve::GeomAPI_ExtremaCurveCurve ******/
		/****** md5 signature: a62c3981eb5c0809da9cf3ef53b3b275 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
U1min: double
U1max: double
U2min: double
U2max: double

Return
-------
None

Description
-----------
Computes the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const double U1min, const double U1max, const double U2min, const double U2max);

		/****** GeomAPI_ExtremaCurveCurve::Distance ******/
		/****** md5 signature: 424acc809a4ab476bd27a028fe3e0ca1 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Distance;
		double Distance(const int Index);

		/****** GeomAPI_ExtremaCurveCurve::Extrema ******/
		/****** md5 signature: d20597ca5df7eb3eb3c7b2cc10a25ce9 ******/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return
-------
Extrema_ExtCC

Description
-----------
return the algorithmic object from Extrema.
") Extrema;
		const Extrema_ExtCC & Extrema();

		/****** GeomAPI_ExtremaCurveCurve::Init ******/
		/****** md5 signature: 921fb84113845f665798bcd7f0f3d2e1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments and computes the extrema between the curves C1 and C2.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****** GeomAPI_ExtremaCurveCurve::Init ******/
		/****** md5 signature: 680ecced86fd2ed0637c1a7c9b1c16c0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
U1min: double
U1max: double
U2min: double
U2max: double

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments and computes the extrema between: - the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const double U1min, const double U1max, const double U2min, const double U2max);

		/****** GeomAPI_ExtremaCurveCurve::IsParallel ******/
		/****** md5 signature: 7046a6b3b457e744360b84ad9c060428 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		bool IsParallel();

		/****** GeomAPI_ExtremaCurveCurve::LowerDistance ******/
		/****** md5 signature: 9bdea8626c0ad11eceaa6b7d1fe4c47b ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistance;
		double LowerDistance();

		/****** GeomAPI_ExtremaCurveCurve::LowerDistanceParameters ******/
		/****** md5 signature: 1eb95ddbe72514181a70f3a90eefec4d ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double

Description
-----------
Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveCurve::NbExtrema ******/
		/****** md5 signature: 8a15c7200086211498613f19615ee932 ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.
") NbExtrema;
		int NbExtrema();

		/****** GeomAPI_ExtremaCurveCurve::NearestPoints ******/
		/****** md5 signature: 4930be161c652c11e7ff1600e5a2e89e ******/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") NearestPoints;
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2);

		/****** GeomAPI_ExtremaCurveCurve::Parameters ******/
		/****** md5 signature: d68f60f291b4e469b0325d05c26caa6c ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: double
U2: double

Description
-----------
Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveCurve::Points ******/
		/****** md5 signature: 1816060b88e5f30af143193ee46b8ffe ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
Index: int
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Points;
		void Points(const int Index, gp_Pnt & P1, gp_Pnt & P2);

		/****** GeomAPI_ExtremaCurveCurve::TotalLowerDistance ******/
		/****** md5 signature: 6bd482b5b9fb846bd51882257c60aba0 ******/
		%feature("compactdefaultargs") TotalLowerDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
return the distance of the total nearest couple solution point. if <myExtCC> is not done.
") TotalLowerDistance;
		double TotalLowerDistance();

		/****** GeomAPI_ExtremaCurveCurve::TotalLowerDistanceParameters ******/
		/****** md5 signature: fccbe0d2ae503aa103b79d78ce550e49 ******/
		%feature("compactdefaultargs") TotalLowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double

Description
-----------
set in <U1> and <U2> the parameters of the couple solution points which represents the total nearest solution.
") TotalLowerDistanceParameters;
		bool TotalLowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveCurve::TotalNearestPoints ******/
		/****** md5 signature: cbf25aa37b52d461457ce60e69797c7e ******/
		%feature("compactdefaultargs") TotalNearestPoints;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
bool

Description
-----------
set in <P1> and <P2> the couple solution points such a the distance [P1,P2] is the minimum. taking in account extremity points of curves.
") TotalNearestPoints;
		bool TotalNearestPoints(gp_Pnt & P1, gp_Pnt & P2);

};


%extend GeomAPI_ExtremaCurveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomAPI_ExtremaCurveSurface *
************************************/
class GeomAPI_ExtremaCurveSurface {
	public:
		/****** GeomAPI_ExtremaCurveSurface::GeomAPI_ExtremaCurveSurface ******/
		/****** md5 signature: ad5451d66f7a0b9e46e9db373fe46faa ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm for computing extrema between a curve and a surface. Use an Init function to define the curve and the surface on which it is going to work.
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface();

		/****** GeomAPI_ExtremaCurveSurface::GeomAPI_ExtremaCurveSurface ******/
		/****** md5 signature: cef525ab700b90764fd82ec76526a951 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface

Return
-------
None

Description
-----------
Computes the extrema distances between the curve <C> and the surface <S>.
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface);

		/****** GeomAPI_ExtremaCurveSurface::GeomAPI_ExtremaCurveSurface ******/
		/****** md5 signature: 073ccf1cfe69b7a3b9fdc1c91ea928e3 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface
Wmin: double
Wmax: double
Umin: double
Umax: double
Vmin: double
Vmax: double

Return
-------
None

Description
-----------
Computes the extrema distances between the curve <C> and the surface <S>. The solution point are computed in the domain [Wmin,Wmax] of the curve and in the domain [Umin,Umax] [Vmin,Vmax] of the surface. Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const double Wmin, const double Wmax, const double Umin, const double Umax, const double Vmin, const double Vmax);

		/****** GeomAPI_ExtremaCurveSurface::Distance ******/
		/****** md5 signature: 424acc809a4ab476bd27a028fe3e0ca1 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Distance;
		double Distance(const int Index);

		/****** GeomAPI_ExtremaCurveSurface::Extrema ******/
		/****** md5 signature: adcf7d7d93c740fa26f7543ee94e20ec ******/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return
-------
Extrema_ExtCS

Description
-----------
Returns the algorithmic object from Extrema.
") Extrema;
		const Extrema_ExtCS & Extrema();

		/****** GeomAPI_ExtremaCurveSurface::Init ******/
		/****** md5 signature: dd5e8dfd1899f88b374f7f1be823f2b1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface

Return
-------
None

Description
-----------
Computes the extrema distances between the curve <C> and the surface <S>.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface);

		/****** GeomAPI_ExtremaCurveSurface::Init ******/
		/****** md5 signature: cf07546e18dce0db487be8ad7f21090b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface
Wmin: double
Wmax: double
Umin: double
Umax: double
Vmin: double
Vmax: double

Return
-------
None

Description
-----------
Computes the extrema distances between the curve <C> and the surface <S>. The solution point are computed in the domain [Wmin,Wmax] of the curve and in the domain [Umin,Umax] [Vmin,Vmax] of the surface. Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const double Wmin, const double Wmax, const double Umin, const double Umax, const double Vmin, const double Vmax);

		/****** GeomAPI_ExtremaCurveSurface::IsParallel ******/
		/****** md5 signature: 7046a6b3b457e744360b84ad9c060428 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is on a parallel surface.
") IsParallel;
		bool IsParallel();

		/****** GeomAPI_ExtremaCurveSurface::LowerDistance ******/
		/****** md5 signature: 9bdea8626c0ad11eceaa6b7d1fe4c47b ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
") LowerDistance;
		double LowerDistance();

		/****** GeomAPI_ExtremaCurveSurface::LowerDistanceParameters ******/
		/****** md5 signature: 21feca260ab712c286921c05ac2b0e5e ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
W: double
U: double
V: double

Description
-----------
Returns the parameters W of the point on the curve and (U,V) of the point on the surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveSurface::NbExtrema ******/
		/****** md5 signature: 8a15c7200086211498613f19615ee932 ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.
") NbExtrema;
		int NbExtrema();

		/****** GeomAPI_ExtremaCurveSurface::NearestPoints ******/
		/****** md5 signature: 5cdc647c1b5fc9f834b7700fd001104f ******/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "
Parameters
----------
PC: gp_Pnt
PS: gp_Pnt

Return
-------
None

Description
-----------
Returns the points PC on the curve and PS on the surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
") NearestPoints;
		void NearestPoints(gp_Pnt & PC, gp_Pnt & PS);

		/****** GeomAPI_ExtremaCurveSurface::Parameters ******/
		/****** md5 signature: 8822264320685078c2fe80efae5a57f2 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
W: double
U: double
V: double

Description
-----------
Returns the parameters W of the point on the curve, and (U,V) of the point on the surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveSurface::Points ******/
		/****** md5 signature: 1816060b88e5f30af143193ee46b8ffe ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
Index: int
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Returns the points P1 on the curve and P2 on the surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Points;
		void Points(const int Index, gp_Pnt & P1, gp_Pnt & P2);

};


%extend GeomAPI_ExtremaCurveSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomAPI_ExtremaSurfaceSurface *
**************************************/
class GeomAPI_ExtremaSurfaceSurface {
	public:
		/****** GeomAPI_ExtremaSurfaceSurface::GeomAPI_ExtremaSurfaceSurface ******/
		/****** md5 signature: 6c3848e0fca2ded28728d3f6d8b44686 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm for computing extrema between two surfaces. Use an Init function to define the surfaces on which it is going to work.
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface();

		/****** GeomAPI_ExtremaSurfaceSurface::GeomAPI_ExtremaSurfaceSurface ******/
		/****** md5 signature: 28b59a021ad63b73a4dc0533e0a6f0ef ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface

Return
-------
None

Description
-----------
Computes the extrema distances between the surfaces <S1> and <S2>.
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2);

		/****** GeomAPI_ExtremaSurfaceSurface::GeomAPI_ExtremaSurfaceSurface ******/
		/****** md5 signature: 191f3213d338aecdfa74bb46677e484b ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
U1min: double
U1max: double
V1min: double
V1max: double
U2min: double
U2max: double
V2min: double
V2max: double

Return
-------
None

Description
-----------
Computes the extrema distances between the portion of the surface S1 limited by the two values of parameter (U1min,U1max) in the u parametric direction, and by the two values of parameter (V1min,V1max) in the v parametric direction, and - the portion of the surface S2 limited by the two values of parameter (U2min,U2max) in the u parametric direction, and by the two values of parameter (V2min,V2max) in the v parametric direction.
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double U1min, const double U1max, const double V1min, const double V1max, const double U2min, const double U2max, const double V2min, const double V2max);

		/****** GeomAPI_ExtremaSurfaceSurface::Distance ******/
		/****** md5 signature: 424acc809a4ab476bd27a028fe3e0ca1 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Distance;
		double Distance(const int Index);

		/****** GeomAPI_ExtremaSurfaceSurface::Extrema ******/
		/****** md5 signature: 4e9266c25801d466046033a02435b14c ******/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return
-------
Extrema_ExtSS

Description
-----------
return the algorithmic object from Extrema.
") Extrema;
		const Extrema_ExtSS & Extrema();

		/****** GeomAPI_ExtremaSurfaceSurface::Init ******/
		/****** md5 signature: 65c310fb65763eea9a805df773c030e8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments and computes the extrema distances between the surfaces <S1> and <S2>.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2);

		/****** GeomAPI_ExtremaSurfaceSurface::Init ******/
		/****** md5 signature: 361213a7ac84789817c6d683e4ae4a99 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
U1min: double
U1max: double
V1min: double
V1max: double
U2min: double
U2max: double
V2min: double
V2max: double

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments and computes the extrema distances between - the portion of the surface S1 limited by the two values of parameter (U1min,U1max) in the u parametric direction, and by the two values of parameter (V1min,V1max) in the v parametric direction, and - the portion of the surface S2 limited by the two values of parameter (U2min,U2max) in the u parametric direction, and by the two values of parameter (V2min,V2max) in the v parametric direction.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double U1min, const double U1max, const double V1min, const double V1max, const double U2min, const double U2max, const double V2min, const double V2max);

		/****** GeomAPI_ExtremaSurfaceSurface::IsParallel ******/
		/****** md5 signature: 7046a6b3b457e744360b84ad9c060428 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are parallel.
") IsParallel;
		bool IsParallel();

		/****** GeomAPI_ExtremaSurfaceSurface::LowerDistance ******/
		/****** md5 signature: 9bdea8626c0ad11eceaa6b7d1fe4c47b ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistance;
		double LowerDistance();

		/****** GeomAPI_ExtremaSurfaceSurface::LowerDistanceParameters ******/
		/****** md5 signature: e8f067751d03926af9386f1605926b51 ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
V1: double
U2: double
V2: double

Description
-----------
Returns the parameters (U1,V1) of the point on the first surface and (U2,V2) of the point on the second surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaSurfaceSurface::NbExtrema ******/
		/****** md5 signature: 8a15c7200086211498613f19615ee932 ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.
") NbExtrema;
		int NbExtrema();

		/****** GeomAPI_ExtremaSurfaceSurface::NearestPoints ******/
		/****** md5 signature: 4930be161c652c11e7ff1600e5a2e89e ******/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Returns the points P1 on the first surface and P2 on the second surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") NearestPoints;
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2);

		/****** GeomAPI_ExtremaSurfaceSurface::Parameters ******/
		/****** md5 signature: b87c52b1271da99e5fe2e5f22fed07e0 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: double
V1: double
U2: double
V2: double

Description
-----------
Returns the parameters (U1,V1) of the point on the first surface, and (U2,V2) of the point on the second surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaSurfaceSurface::Points ******/
		/****** md5 signature: 1816060b88e5f30af143193ee46b8ffe ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
Index: int
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Returns the points P1 on the first surface and P2 on the second surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Points;
		void Points(const int Index, gp_Pnt & P1, gp_Pnt & P2);

};


%extend GeomAPI_ExtremaSurfaceSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GeomAPI_IntCS *
**********************/
class GeomAPI_IntCS {
	public:
		/****** GeomAPI_IntCS::GeomAPI_IntCS ******/
		/****** md5 signature: 0791811afd31ee46ff9fd55c0cc30352 ******/
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty object. Use the function Perform for further initialization of the algorithm by the curve and the surface.
") GeomAPI_IntCS;
		 GeomAPI_IntCS();

		/****** GeomAPI_IntCS::GeomAPI_IntCS ******/
		/****** md5 signature: b5e98b376c9b3d0e4b5a614f0cd99b35 ******/
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface

Return
-------
None

Description
-----------
Computes the intersections between the curve C and the surface S. Warning Use function IsDone to verify that the intersections are computed successfully.
") GeomAPI_IntCS;
		 GeomAPI_IntCS(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****** GeomAPI_IntCS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the intersections are successfully computed.
") IsDone;
		bool IsDone();

		/****** GeomAPI_IntCS::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Intersection Points if IsDone returns True. else NotDone is raised.
") NbPoints;
		int NbPoints();

		/****** GeomAPI_IntCS::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed intersection segments in case of tangential intersection. Exceptions StdFail_NotDone if the intersection algorithm fails or is not initialized.
") NbSegments;
		int NbSegments();

		/****** GeomAPI_IntCS::Parameters ******/
		/****** md5 signature: 308a3638f6f36120bebfb6f0c9bd8e0c ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: double
V: double
W: double

Description
-----------
Returns parameter W on the curve and (parameters U,V) on the surface of the computed intersection point of index Index in case of cross intersection. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of computed intersection points.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_IntCS::Parameters ******/
		/****** md5 signature: b87c52b1271da99e5fe2e5f22fed07e0 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: double
V1: double
U2: double
V2: double

Description
-----------
Returns the parameters of the first (U1,V1) and the last (U2,V2) points of curve's segment on the surface in case of tangential intersection. Index is the number of computed intersection segments. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbSegments ], where NbSegments is the number of computed intersection segments.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_IntCS::Perform ******/
		/****** md5 signature: 99d3460d4845c1186bfbed85af97b966 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface

Return
-------
None

Description
-----------
This function Initializes an algorithm with the curve C and the surface S and computes the intersections between C and S. Warning Use function IsDone to verify that the intersections are computed successfully.
") Perform;
		void Perform(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****** GeomAPI_IntCS::Point ******/
		/****** md5 signature: eb74c35cb622203c0151813552619b64 ******/
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
Returns the Intersection Point of range <Index>in case of cross intersection. Raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbPoints>.
") Point;
		const gp_Pnt Point(const int Index);

		/****** GeomAPI_IntCS::Segment ******/
		/****** md5 signature: c1b56611f16e01cacb14e5d31e0f8f9b ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the computed intersection segment of index Index in case of tangential intersection. Intersection segment is a portion of the initial curve tangent to surface. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbSegments ], where NbSegments is the number of computed intersection segments.
") Segment;
		opencascade::handle<Geom_Curve> Segment(const int Index);

};


%extend GeomAPI_IntCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GeomAPI_IntSS *
**********************/
class GeomAPI_IntSS {
	public:
		/****** GeomAPI_IntSS::GeomAPI_IntSS ******/
		/****** md5 signature: 16b596a87a9a3dfbb4308a0fe15c86ea ******/
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty object. Use the function Perform for further initialization algorithm by two surfaces.
") GeomAPI_IntSS;
		 GeomAPI_IntSS();

		/****** GeomAPI_IntSS::GeomAPI_IntSS ******/
		/****** md5 signature: 8375b6a76fbe542f62e38a1ad3890e18 ******/
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: double

Return
-------
None

Description
-----------
Computes the intersection curves between the two surfaces S1 and S2. Parameter Tol defines the precision of curves computation. For most cases the value 1.0e-7 is recommended to use. Warning Use the function IsDone to verify that the intersections are successfully computed.I.
") GeomAPI_IntSS;
		 GeomAPI_IntSS(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double Tol);

		/****** GeomAPI_IntSS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection was successful.
") IsDone;
		bool IsDone();

		/****** GeomAPI_IntSS::Line ******/
		/****** md5 signature: d80f6ed49125ed2b23ecf3b9088f2dd9 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the computed intersection curve of index Index. Exceptions StdFail_NotDone if the computation fails. Standard_OutOfRange if Index is out of range [1, NbLines] where NbLines is the number of computed intersection curves.
") Line;
		const opencascade::handle<Geom_Curve> & Line(const int Index);

		/****** GeomAPI_IntSS::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed intersection curves. Exceptions StdFail_NotDone if the computation fails.
") NbLines;
		int NbLines();

		/****** GeomAPI_IntSS::Perform ******/
		/****** md5 signature: 003d459033dfcbd5368d2671138ad89a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: double

Return
-------
None

Description
-----------
Initializes an algorithm with the given arguments and computes the intersection curves between the two surfaces S1 and S2. Parameter Tol defines the precision of curves computation. For most cases the value 1.0e-7 is recommended to use. Warning Use function IsDone to verify that the intersections are successfully computed.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double Tol);

};


%extend GeomAPI_IntSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomAPI_Interpolate *
****************************/
class GeomAPI_Interpolate {
	public:
		/****** GeomAPI_Interpolate::GeomAPI_Interpolate ******/
		/****** md5 signature: be59e10300ee8581ffac2adff1e3b0f5 ******/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt
PeriodicFlag: bool
Tolerance: double

Return
-------
None

Description
-----------
Initializes an algorithm for constructing a constrained BSpline curve passing through the points of the table Points. Tangential vectors can then be assigned, using the function Load. If PeriodicFlag is true, the constrained BSpline curve will be periodic and closed. In this case, the junction point is the first point of the table Points. The tolerance value Tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function Load) are not too small. The resulting BSpline curve will be 'C2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the Load function). In this case, it will be only 'C1' continuous. Once all the constraints are defined, use the function Perform to compute the curve. Warning - There must be at least 2 points in the table Points. - If PeriodicFlag is false, there must be as many parameters in the array Parameters as there are points in the array Points. - If PeriodicFlag is true, there must be one more parameter in the table Parameters: this is used to give the parameter on the resulting BSpline curve of the junction point of the curve (which is also the first point of the table Points). Exceptions - Standard_ConstructionError if the distance between two consecutive points in the table Points is less than or equal to Tolerance. - Standard_OutOfRange if: - there are less than two points in the table Points, or - conditions relating to the respective number of elements in the parallel tables Points and Parameters are not respected.
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const bool PeriodicFlag, const double Tolerance);

		/****** GeomAPI_Interpolate::GeomAPI_Interpolate ******/
		/****** md5 signature: 97cf75f9781f97e8aab7b1cab92cdb76 ******/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt
Parameters: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: double

Return
-------
None

Description
-----------
Initializes an algorithm for constructing a constrained BSpline curve passing through the points of the table Points, where the parameters of each of its points are given by the parallel table Parameters. Tangential vectors can then be assigned, using the function Load. If PeriodicFlag is true, the constrained BSpline curve will be periodic and closed. In this case, the junction point is the first point of the table Points. The tolerance value Tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function Load) are not too small. The resulting BSpline curve will be 'C2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the Load function). In this case, it will be only 'C1' continuous. Once all the constraints are defined, use the function Perform to compute the curve. Warning - There must be at least 2 points in the table Points. - If PeriodicFlag is false, there must be as many parameters in the array Parameters as there are points in the array Points. - If PeriodicFlag is true, there must be one more parameter in the table Parameters: this is used to give the parameter on the resulting BSpline curve of the junction point of the curve (which is also the first point of the table Points). Exceptions - Standard_ConstructionError if the distance between two consecutive points in the table Points is less than or equal to Tolerance. - Standard_OutOfRange if: - there are less than two points in the table Points, or - conditions relating to the respective number of elements in the parallel tables Points and Parameters are not respected.
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const bool PeriodicFlag, const double Tolerance);

		/****** GeomAPI_Interpolate::Curve ******/
		/****** md5 signature: c38eea3d03f43cd4ac9ae236a908e33c ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Returns the computed BSpline curve. Raises StdFail_NotDone if the interpolation fails.
") Curve;
		const opencascade::handle<Geom_BSplineCurve> & Curve();

		/****** GeomAPI_Interpolate::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the constrained BSpline curve is successfully constructed. Note: in this case, the result is given by the function Curve.
") IsDone;
		bool IsDone();

		/****** GeomAPI_Interpolate::Load ******/
		/****** md5 signature: 7b779f715df07147093ce23022cee380 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
InitialTangent: gp_Vec
FinalTangent: gp_Vec
Scale: bool (optional, default to true)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors InitialTangent and FinalTangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization).
") Load;
		void Load(const gp_Vec & InitialTangent, const gp_Vec & FinalTangent, const bool Scale = true);

		/****** GeomAPI_Interpolate::Load ******/
		/****** md5 signature: 61de27459543cf35aeaa840ef7df5164 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Tangents: TColgp_Array1OfVec
TangentFlags: TColStd_HArray1OfBoolean
Scale: bool (optional, default to true)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors defined in the table Tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. Vectors in the table Tangents are defined only if the flag given in the parallel table TangentFlags is true: only these vectors are set as tangency constraints.
") Load;
		void Load(const TColgp_Array1OfVec & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags, const bool Scale = true);

		/****** GeomAPI_Interpolate::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the constrained BSpline curve. Use the function IsDone to verify that the computation is successful, and then the function Curve to obtain the result.
") Perform;
		void Perform();

};


%extend GeomAPI_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ClearTangents(self):
		pass
	}
};

/********************************
* class GeomAPI_PointsToBSpline *
********************************/
class GeomAPI_PointsToBSpline {
	public:
		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: 3661034a8629c1e55ec2861e146bbee3 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty approximation algorithm. Use an Init function to define and build the BSpline curve.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline();

		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: 6697998f8c4eed083ac4ba1f44797c5a ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: cf1674c6a58435cc8a33543efff343d8 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: 2bb59fc5e877fd4c2dd4666aeda21273 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: fd42a08b1a26d75f9c442fbf4fc5da29 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Weight1: double
Weight2: double
Weight3: double
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const double Weight1, const double Weight2, const double Weight3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::Curve ******/
		/****** md5 signature: c38eea3d03f43cd4ac9ae236a908e33c ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Returns the computed BSpline curve. Raises StdFail_NotDone if the curve is not built.
") Curve;
		const opencascade::handle<Geom_BSplineCurve> & Curve();

		/****** GeomAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 858c255de36cce505df9cfce91dacdf1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 9a7ae442ee33f4a23bf5c72958a068d1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 753db1671321fb7e50c73c47081cd615 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 9bcbe45b2b2377115f598f2040712668 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Weight1: double
Weight2: double
Weight3: double
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const double Weight1, const double Weight2, const double Weight3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

};


%extend GeomAPI_PointsToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomAPI_PointsToBSplineSurface *
***************************************/
class GeomAPI_PointsToBSplineSurface {
	public:
		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: 5e47f6c049e83fdf88c926c7208fb3ae ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm for approximation or interpolation of a surface. Use: - an Init function to define and build the BSpline surface by approximation, or - an Interpolate function to define and build the BSpline surface by interpolation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface();

		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: 0a47ffdc4ecebb3412d0a054bf8898dc ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: a0a58417114bde911fb758ef76cf1cf3 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: 44a043c18aeb3a47002fd49b0779d286 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
Weight1: double
Weight2: double
Weight3: double
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const double Weight1, const double Weight2, const double Weight3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: 00aab86305c52761aac70dedd19ac44b ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: double
dX: double
Y0: double
dY: double
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColStd_Array2OfReal & ZPoints, const double X0, const double dX, const double Y0, const double dY, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: 7258862529d166bdb7c6247630250c92 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: 0df21153bdece096e4308cd5e72fe888 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: double
dX: double
Y0: double
dY: double
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColStd_Array2OfReal & ZPoints, const double X0, const double dX, const double Y0, const double dY, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: bdca28b64d431ee25890b5191d59e2ad ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)
thePeriodic: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3, const bool thePeriodic = false);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: 14c14546fa2a7f581859f8bb0b83d132 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
Weight1: double
Weight2: double
Weight3: double
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const double Weight1, const double Weight2, const double Weight3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Interpolate ******/
		/****** md5 signature: 1865c103f2f63ede9b5b87ba10bb394b ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
thePeriodic: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const bool thePeriodic = false);

		/****** GeomAPI_PointsToBSplineSurface::Interpolate ******/
		/****** md5 signature: 22bea25ae929d0cf4d0d5a4f6224b7f3 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
thePeriodic: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const bool thePeriodic = false);

		/****** GeomAPI_PointsToBSplineSurface::Interpolate ******/
		/****** md5 signature: 6c2693e51b767eb915d7ae8fae32925a ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: double
dX: double
Y0: double
dY: double

Return
-------
None

Description
-----------
No available documentation.
") Interpolate;
		void Interpolate(const TColStd_Array2OfReal & ZPoints, const double X0, const double dX, const double Y0, const double dY);

		/****** GeomAPI_PointsToBSplineSurface::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** GeomAPI_PointsToBSplineSurface::Surface ******/
		/****** md5 signature: 671a5de971e9a6baf08b4e111daa768f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the approximate BSpline Surface.
") Surface;
		const opencascade::handle<Geom_BSplineSurface> & Surface();

};


%extend GeomAPI_PointsToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomAPI_ProjectPointOnCurve *
************************************/
class GeomAPI_ProjectPointOnCurve {
	public:
		/****** GeomAPI_ProjectPointOnCurve::GeomAPI_ProjectPointOnCurve ******/
		/****** md5 signature: 69d2ff1a2c2a276bcd4ac63b780f962d ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty object. Use an Init function for further initialization.
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve();

		/****** GeomAPI_ProjectPointOnCurve::GeomAPI_ProjectPointOnCurve ******/
		/****** md5 signature: 98d2970e0388654e7771e359678049bb ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve

Return
-------
None

Description
-----------
Create the projection of a point <P> on a curve <Curve>.
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve);

		/****** GeomAPI_ProjectPointOnCurve::GeomAPI_ProjectPointOnCurve ******/
		/****** md5 signature: 5a53d83e62ba5fde42e7fe20ea7e4a9d ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve
Umin: double
Usup: double

Return
-------
None

Description
-----------
Create the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const double Umin, const double Usup);

		/****** GeomAPI_ProjectPointOnCurve::Distance ******/
		/****** md5 signature: 424acc809a4ab476bd27a028fe3e0ca1 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Computes the distance between the point and its orthogonal projection on the curve. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Distance;
		double Distance(const int Index);

		/****** GeomAPI_ProjectPointOnCurve::Extrema ******/
		/****** md5 signature: 2a2c7c9268b8bc0a62547ade486fcb4b ******/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return
-------
Extrema_ExtPC

Description
-----------
return the algorithmic object from Extrema.
") Extrema;
		const Extrema_ExtPC & Extrema();

		/****** GeomAPI_ProjectPointOnCurve::Init ******/
		/****** md5 signature: 584a6ccc485f9268fa6ad5924e296d14 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve

Return
-------
None

Description
-----------
Init the projection of a point <P> on a curve <Curve>.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve);

		/****** GeomAPI_ProjectPointOnCurve::Init ******/
		/****** md5 signature: b34e29cd05bc1282c40d12b835ec7dfa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve
Umin: double
Usup: double

Return
-------
None

Description
-----------
Init the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const double Umin, const double Usup);

		/****** GeomAPI_ProjectPointOnCurve::Init ******/
		/****** md5 signature: 4eeb27a5927861e02ed46ad7b5985f5b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Umin: double
Usup: double

Return
-------
None

Description
-----------
Init the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const double Umin, const double Usup);

		/****** GeomAPI_ProjectPointOnCurve::LowerDistance ******/
		/****** md5 signature: 9bdea8626c0ad11eceaa6b7d1fe4c47b ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the distance between the point and its nearest orthogonal projection on the curve. Exceptions: StdFail_NotDone if this algorithm fails.
") LowerDistance;
		double LowerDistance();

		/****** GeomAPI_ProjectPointOnCurve::LowerDistanceParameter ******/
		/****** md5 signature: 995a7a6802398fc73878dc586c07f02b ******/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the curve of the nearest orthogonal projection of the point. Exceptions: StdFail_NotDone if this algorithm fails.
") LowerDistanceParameter;
		double LowerDistanceParameter();

		/****** GeomAPI_ProjectPointOnCurve::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed orthogonal projection points. Note: if this algorithm fails, NbPoints returns 0.
") NbPoints;
		int NbPoints();

		/****** GeomAPI_ProjectPointOnCurve::NearestPoint ******/
		/****** md5 signature: 483270796058353f575fc5981b06215a ******/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the nearest orthogonal projection of the point on the curve. Exceptions: StdFail_NotDone if this algorithm fails.
") NearestPoint;
		gp_Pnt NearestPoint();

		/****** GeomAPI_ProjectPointOnCurve::Parameter ******/
		/****** md5 signature: bcd21197dacb6445c9784025e36f0a23 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the parameter on the curve of the point, which is the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameter;
		double Parameter(const int Index);

		/****** GeomAPI_ProjectPointOnCurve::Parameter ******/
		/****** md5 signature: 45f1b1c856d0db741edadd455f1176c7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: double

Description
-----------
Returns the parameter on the curve of the point, which is the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.-.
") Parameter;
		void Parameter(const int Index, Standard_Real &OutValue);

		/****** GeomAPI_ProjectPointOnCurve::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Performs the projection of a point on the current curve.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** GeomAPI_ProjectPointOnCurve::Point ******/
		/****** md5 signature: 5dbead83432d512d83f6d5260a8475b5 ******/
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
Returns the orthogonal projection on the curve. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Point;
		gp_Pnt Point(const int Index);

};


%extend GeomAPI_ProjectPointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomAPI_ProjectPointOnSurf *
***********************************/
class GeomAPI_ProjectPointOnSurf {
	public:
		/****** GeomAPI_ProjectPointOnSurf::GeomAPI_ProjectPointOnSurf ******/
		/****** md5 signature: fae07e2100bfda9b7082817f1e3bdc9e ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty object. Use the Init function for further initialization.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf();

		/****** GeomAPI_ProjectPointOnSurf::GeomAPI_ProjectPointOnSurf ******/
		/****** md5 signature: 091b2414733bc45759b0163e7de1668a ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Create the projection of a point <P> on a surface <Surface>.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::GeomAPI_ProjectPointOnSurf ******/
		/****** md5 signature: c054a1c602d16b86cd9e3cb5624a9610 ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Tolerance: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Create the projection of a point <P> on a surface <Surface> Create the projection of a point <P> on a surface <Surface>. The solution are computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const double Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::GeomAPI_ProjectPointOnSurf ******/
		/****** md5 signature: 2fa1c04b20549c7df058c4d4f64b589d ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: double
Usup: double
Vmin: double
Vsup: double
Tolerance: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const double Umin, const double Usup, const double Vmin, const double Vsup, const double Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::GeomAPI_ProjectPointOnSurf ******/
		/****** md5 signature: 4fb347dbe03dc128f33891802ce2e48e ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: double
Usup: double
Vmin: double
Vsup: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Init the projection of a point <P> on a surface <Surface>.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const double Umin, const double Usup, const double Vmin, const double Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Distance ******/
		/****** md5 signature: 424acc809a4ab476bd27a028fe3e0ca1 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Computes the distance between the point and its orthogonal projection on the surface. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Distance;
		double Distance(const int Index);

		/****** GeomAPI_ProjectPointOnSurf::Extrema ******/
		/****** md5 signature: 5d88f4e1c84a05757ee93d4ab14118bb ******/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return
-------
Extrema_ExtPS

Description
-----------
return the algorithmic object from Extrema.
") Extrema;
		const Extrema_ExtPS & Extrema();

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: 3c01becea2d2a8e622980734b9e162f0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Tolerance: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const double Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: da40c40255ca65231b6acdc32da0236d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Init the projection of a point <P> on a surface <Surface>. The solution are computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: 05b5c1c40746c92d1d875a7974dcc939 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: double
Usup: double
Vmin: double
Vsup: double
Tolerance: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const double Umin, const double Usup, const double Vmin, const double Vsup, const double Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: b91493bf8767ee60e8f0eff356176f1f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: double
Usup: double
Vmin: double
Vsup: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Init the projection for many points on a surface <Surface>. The solutions will be computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const double Umin, const double Usup, const double Vmin, const double Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: e09527dd8fb4a85c4534826f672ade32 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
Umin: double
Usup: double
Vmin: double
Vsup: double
Tolerance: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const double Umin, const double Usup, const double Vmin, const double Vsup, const double Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: b0ae0f2f1aef81d78a44a3520606cc20 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
Umin: double
Usup: double
Vmin: double
Vsup: double
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const double Umin, const double Usup, const double Vmin, const double Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** GeomAPI_ProjectPointOnSurf::LowerDistance ******/
		/****** md5 signature: 9bdea8626c0ad11eceaa6b7d1fe4c47b ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the distance between the point and its nearest orthogonal projection on the surface. Exceptions StdFail_NotDone if projection fails.
") LowerDistance;
		double LowerDistance();

		/****** GeomAPI_ProjectPointOnSurf::LowerDistanceParameters ******/
		/****** md5 signature: fa6d899db01b83a8a60ae858efaf1e81 ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
Returns the parameters (U,V) on the surface of the nearest computed orthogonal projection of the point. Exceptions StdFail_NotDone if projection fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ProjectPointOnSurf::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed orthogonal projection points. Note: if projection fails, NbPoints returns 0.
") NbPoints;
		int NbPoints();

		/****** GeomAPI_ProjectPointOnSurf::NearestPoint ******/
		/****** md5 signature: 483270796058353f575fc5981b06215a ******/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the nearest orthogonal projection of the point on the surface. Exceptions StdFail_NotDone if projection fails.
") NearestPoint;
		gp_Pnt NearestPoint();

		/****** GeomAPI_ProjectPointOnSurf::Parameters ******/
		/****** md5 signature: 3c22efb7729dbba204583f56be6ac7eb ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: double
V: double

Description
-----------
Returns the parameters (U,V) on the surface of the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ProjectPointOnSurf::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Performs the projection of a point on the current surface.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** GeomAPI_ProjectPointOnSurf::Point ******/
		/****** md5 signature: 5dbead83432d512d83f6d5260a8475b5 ******/
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
Returns the orthogonal projection on the surface. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Point;
		gp_Pnt Point(const int Index);

		/****** GeomAPI_ProjectPointOnSurf::SetExtremaAlgo ******/
		/****** md5 signature: 271740dfa1218f60cc3b4e8b5cc1d298 ******/
		%feature("compactdefaultargs") SetExtremaAlgo;
		%feature("autodoc", "
Parameters
----------
theAlgo: Extrema_ExtAlgo

Return
-------
None

Description
-----------
Sets the Extrema search algorithm - Grad or Tree. By default the Extrema is initialized with Grad algorithm.
") SetExtremaAlgo;
		void SetExtremaAlgo(const Extrema_ExtAlgo theAlgo);

		/****** GeomAPI_ProjectPointOnSurf::SetExtremaFlag ******/
		/****** md5 signature: 399fd1734b5c259e95e5285524e15a9e ******/
		%feature("compactdefaultargs") SetExtremaFlag;
		%feature("autodoc", "
Parameters
----------
theExtFlag: Extrema_ExtFlag

Return
-------
None

Description
-----------
Sets the Extrema search flag - MIN or MAX or MINMAX. By default the Extrema is set to search the MinMax solutions.
") SetExtremaFlag;
		void SetExtremaFlag(const Extrema_ExtFlag theExtFlag);

};


%extend GeomAPI_ProjectPointOnSurf {
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
def geomapi_To2d(*args):
	return geomapi.To2d(*args)

@deprecated
def geomapi_To3d(*args):
	return geomapi.To3d(*args)

}
