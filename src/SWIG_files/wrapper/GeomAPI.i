/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geomapi.html"
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
		/****** md5 signature: cf67c0a625d592607f391fe9ed6bd689 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
U1min: float
U1max: float
U2min: float
U2max: float

Return
-------
None

Description
-----------
Computes the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

		/****** GeomAPI_ExtremaCurveCurve::Distance ******/
		/****** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

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
		/****** md5 signature: ec9500c526586804614827847658370a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
U1min: float
U1max: float
U2min: float
U2max: float

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments and computes the extrema between: - the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

		/****** GeomAPI_ExtremaCurveCurve::IsParallel ******/
		/****** md5 signature: 1a61f067818333b9699057e51665b906 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** GeomAPI_ExtremaCurveCurve::LowerDistance ******/
		/****** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistance;
		Standard_Real LowerDistance();

		/****** GeomAPI_ExtremaCurveCurve::LowerDistanceParameters ******/
		/****** md5 signature: 8692eb96773a2ce4edf4599b17864e52 ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float

Description
-----------
Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveCurve::NbExtrema ******/
		/****** md5 signature: 29e39c32fb361964ef3fb09e088c11d8 ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.
") NbExtrema;
		Standard_Integer NbExtrema();

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
		/****** md5 signature: f35f3eb64c1cede9adcbe1fc2f680bb0 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: float
U2: float

Description
-----------
Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveCurve::Points ******/
		/****** md5 signature: 79cc8f2ceb24f7ce334d72d7116d374c ******/
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
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2);

		/****** GeomAPI_ExtremaCurveCurve::TotalLowerDistance ******/
		/****** md5 signature: bbe3edab05724b99eb1d289189b59dc9 ******/
		%feature("compactdefaultargs") TotalLowerDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
return the distance of the total nearest couple solution point. if <myExtCC> is not done.
") TotalLowerDistance;
		Standard_Real TotalLowerDistance();

		/****** GeomAPI_ExtremaCurveCurve::TotalLowerDistanceParameters ******/
		/****** md5 signature: 918e628c38cab528b8e9ffd40e74ec9f ******/
		%feature("compactdefaultargs") TotalLowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float

Description
-----------
set in <U1> and <U2> the parameters of the couple solution points which represents the total nearest solution.
") TotalLowerDistanceParameters;
		Standard_Boolean TotalLowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveCurve::TotalNearestPoints ******/
		/****** md5 signature: 5b96fd4d2868012457d21f38c05df9a4 ******/
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
		Standard_Boolean TotalNearestPoints(gp_Pnt & P1, gp_Pnt & P2);

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
		/****** md5 signature: a2215f2a78469c1af4760a32475d3683 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface
Wmin: float
Wmax: float
Umin: float
Umax: float
Vmin: float
Vmax: float

Return
-------
None

Description
-----------
Computes the extrema distances between the curve <C> and the surface <S>. The solution point are computed in the domain [Wmin,Wmax] of the curve and in the domain [Umin,Umax] [Vmin,Vmax] of the surface. Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Wmin, const Standard_Real Wmax, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****** GeomAPI_ExtremaCurveSurface::Distance ******/
		/****** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

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
		/****** md5 signature: d6404c0680afce59f0009686b12fb9f9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface
Wmin: float
Wmax: float
Umin: float
Umax: float
Vmin: float
Vmax: float

Return
-------
None

Description
-----------
Computes the extrema distances between the curve <C> and the surface <S>. The solution point are computed in the domain [Wmin,Wmax] of the curve and in the domain [Umin,Umax] [Vmin,Vmax] of the surface. Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Wmin, const Standard_Real Wmax, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****** GeomAPI_ExtremaCurveSurface::IsParallel ******/
		/****** md5 signature: 1a61f067818333b9699057e51665b906 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is on a parallel surface.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** GeomAPI_ExtremaCurveSurface::LowerDistance ******/
		/****** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
") LowerDistance;
		Standard_Real LowerDistance();

		/****** GeomAPI_ExtremaCurveSurface::LowerDistanceParameters ******/
		/****** md5 signature: 1d8b0b18b6eaeec3dd1d68420af77b77 ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
W: float
U: float
V: float

Description
-----------
Returns the parameters W of the point on the curve and (U,V) of the point on the surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveSurface::NbExtrema ******/
		/****** md5 signature: 29e39c32fb361964ef3fb09e088c11d8 ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.
") NbExtrema;
		Standard_Integer NbExtrema();

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
		/****** md5 signature: e6e64993bdd5467abdf3f059c86d56b5 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
W: float
U: float
V: float

Description
-----------
Returns the parameters W of the point on the curve, and (U,V) of the point on the surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaCurveSurface::Points ******/
		/****** md5 signature: 79cc8f2ceb24f7ce334d72d7116d374c ******/
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
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2);

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
		/****** md5 signature: 2059d74f0171f73f6daa37633f501200 ******/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
U1min: float
U1max: float
V1min: float
V1max: float
U2min: float
U2max: float
V2min: float
V2max: float

Return
-------
None

Description
-----------
Computes the extrema distances between the portion of the surface S1 limited by the two values of parameter (U1min,U1max) in the u parametric direction, and by the two values of parameter (V1min,V1max) in the v parametric direction, and - the portion of the surface S2 limited by the two values of parameter (U2min,U2max) in the u parametric direction, and by the two values of parameter (V2min,V2max) in the v parametric direction.
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real V1min, const Standard_Real V1max, const Standard_Real U2min, const Standard_Real U2max, const Standard_Real V2min, const Standard_Real V2max);

		/****** GeomAPI_ExtremaSurfaceSurface::Distance ******/
		/****** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

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
		/****** md5 signature: 81d2a4fd09309402d7e36c6fb1d3e40d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
U1min: float
U1max: float
V1min: float
V1max: float
U2min: float
U2max: float
V2min: float
V2max: float

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments and computes the extrema distances between - the portion of the surface S1 limited by the two values of parameter (U1min,U1max) in the u parametric direction, and by the two values of parameter (V1min,V1max) in the v parametric direction, and - the portion of the surface S2 limited by the two values of parameter (U2min,U2max) in the u parametric direction, and by the two values of parameter (V2min,V2max) in the v parametric direction.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real V1min, const Standard_Real V1max, const Standard_Real U2min, const Standard_Real U2max, const Standard_Real V2min, const Standard_Real V2max);

		/****** GeomAPI_ExtremaSurfaceSurface::IsParallel ******/
		/****** md5 signature: 1a61f067818333b9699057e51665b906 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** GeomAPI_ExtremaSurfaceSurface::LowerDistance ******/
		/****** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistance;
		Standard_Real LowerDistance();

		/****** GeomAPI_ExtremaSurfaceSurface::LowerDistanceParameters ******/
		/****** md5 signature: ec805ec8c6e320fe6a04db9189b1cfa5 ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
Returns the parameters (U1,V1) of the point on the first surface and (U2,V2) of the point on the second surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaSurfaceSurface::NbExtrema ******/
		/****** md5 signature: 29e39c32fb361964ef3fb09e088c11d8 ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.
") NbExtrema;
		Standard_Integer NbExtrema();

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
		/****** md5 signature: 6f89f63d1628a1a0a52449e028c59bf0 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
Returns the parameters (U1,V1) of the point on the first surface, and (U2,V2) of the point on the second surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ExtremaSurfaceSurface::Points ******/
		/****** md5 signature: 79cc8f2ceb24f7ce334d72d7116d374c ******/
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
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the intersections are successfully computed.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomAPI_IntCS::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Intersection Points if IsDone returns True. else NotDone is raised.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GeomAPI_IntCS::NbSegments ******/
		/****** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed intersection segments in case of tangential intersection. Exceptions StdFail_NotDone if the intersection algorithm fails or is not initialized.
") NbSegments;
		Standard_Integer NbSegments();

		/****** GeomAPI_IntCS::Parameters ******/
		/****** md5 signature: 36177eb42eb48aa94ff536cea1ae7c13 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: float
V: float
W: float

Description
-----------
Returns parameter W on the curve and (parameters U,V) on the surface of the computed intersection point of index Index in case of cross intersection. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of computed intersection points.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_IntCS::Parameters ******/
		/****** md5 signature: 6f89f63d1628a1a0a52449e028c59bf0 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
Returns the parameters of the first (U1,V1) and the last (U2,V2) points of curve's segment on the surface in case of tangential intersection. Index is the number of computed intersection segments. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbSegments ], where NbSegments is the number of computed intersection segments.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: ee1d88fa34d027a5da9aa36f1333c940 ******/
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
		const gp_Pnt Point(const Standard_Integer Index);

		/****** GeomAPI_IntCS::Segment ******/
		/****** md5 signature: a5a3725890b7c5a68d73d1fc8ad30c69 ******/
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
		opencascade::handle<Geom_Curve> Segment(const Standard_Integer Index);

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
		/****** md5 signature: 03033b28bd581f32a8ce9a9e2796ba8c ******/
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float

Return
-------
None

Description
-----------
Computes the intersection curves between the two surfaces S1 and S2. Parameter Tol defines the precision of curves computation. For most cases the value 1.0e-7 is recommended to use. Warning Use the function IsDone to verify that the intersections are successfully computed.I.
") GeomAPI_IntSS;
		 GeomAPI_IntSS(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol);

		/****** GeomAPI_IntSS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomAPI_IntSS::Line ******/
		/****** md5 signature: 2500cd198cb3b23b6a306899bd784df3 ******/
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
		const opencascade::handle<Geom_Curve> & Line(const Standard_Integer Index);

		/****** GeomAPI_IntSS::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed intersection curves. Exceptions StdFail_NotDone if the computation fails.
") NbLines;
		Standard_Integer NbLines();

		/****** GeomAPI_IntSS::Perform ******/
		/****** md5 signature: 7d516f7f691f1d7f4f72ff6e7908b4f6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float

Return
-------
None

Description
-----------
Initializes an algorithm with the given arguments and computes the intersection curves between the two surfaces S1 and S2. Parameter Tol defines the precision of curves computation. For most cases the value 1.0e-7 is recommended to use. Warning Use function IsDone to verify that the intersections are successfully computed.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol);

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
		/****** md5 signature: 7bcbe68f50c152239bbd9f150f3ba779 ******/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt
PeriodicFlag: bool
Tolerance: float

Return
-------
None

Description
-----------
Initializes an algorithm for constructing a constrained BSpline curve passing through the points of the table Points. Tangential vectors can then be assigned, using the function Load. If PeriodicFlag is true, the constrained BSpline curve will be periodic and closed. In this case, the junction point is the first point of the table Points. The tolerance value Tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function Load) are not too small. The resulting BSpline curve will be 'C2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the Load function). In this case, it will be only 'C1' continuous. Once all the constraints are defined, use the function Perform to compute the curve. Warning - There must be at least 2 points in the table Points. - If PeriodicFlag is false, there must be as many parameters in the array Parameters as there are points in the array Points. - If PeriodicFlag is true, there must be one more parameter in the table Parameters: this is used to give the parameter on the resulting BSpline curve of the junction point of the curve (which is also the first point of the table Points). Exceptions - Standard_ConstructionError if the distance between two consecutive points in the table Points is less than or equal to Tolerance. - Standard_OutOfRange if: - there are less than two points in the table Points, or - conditions relating to the respective number of elements in the parallel tables Points and Parameters are not respected.
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****** GeomAPI_Interpolate::GeomAPI_Interpolate ******/
		/****** md5 signature: 68963c383e6700975a895834802b30d2 ******/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt
Parameters: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: float

Return
-------
None

Description
-----------
Initializes an algorithm for constructing a constrained BSpline curve passing through the points of the table Points, where the parameters of each of its points are given by the parallel table Parameters. Tangential vectors can then be assigned, using the function Load. If PeriodicFlag is true, the constrained BSpline curve will be periodic and closed. In this case, the junction point is the first point of the table Points. The tolerance value Tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function Load) are not too small. The resulting BSpline curve will be 'C2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the Load function). In this case, it will be only 'C1' continuous. Once all the constraints are defined, use the function Perform to compute the curve. Warning - There must be at least 2 points in the table Points. - If PeriodicFlag is false, there must be as many parameters in the array Parameters as there are points in the array Points. - If PeriodicFlag is true, there must be one more parameter in the table Parameters: this is used to give the parameter on the resulting BSpline curve of the junction point of the curve (which is also the first point of the table Points). Exceptions - Standard_ConstructionError if the distance between two consecutive points in the table Points is less than or equal to Tolerance. - Standard_OutOfRange if: - there are less than two points in the table Points, or - conditions relating to the respective number of elements in the parallel tables Points and Parameters are not respected.
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the constrained BSpline curve is successfully constructed. Note: in this case, the result is given by the function Curve.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomAPI_Interpolate::Load ******/
		/****** md5 signature: 5d6d63d49911c50b81c3c2693d0463f3 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
InitialTangent: gp_Vec
FinalTangent: gp_Vec
Scale: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors InitialTangent and FinalTangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization).
") Load;
		void Load(const gp_Vec & InitialTangent, const gp_Vec & FinalTangent, const Standard_Boolean Scale = Standard_True);

		/****** GeomAPI_Interpolate::Load ******/
		/****** md5 signature: 6e958e722c5b850819cfe62e39373686 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Tangents: TColgp_Array1OfVec
TangentFlags: TColStd_HArray1OfBoolean
Scale: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors defined in the table Tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. Vectors in the table Tangents are defined only if the flag given in the parallel table TangentFlags is true: only these vectors are set as tangency constraints.
") Load;
		void Load(const TColgp_Array1OfVec & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags, const Standard_Boolean Scale = Standard_True);

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
		/****** md5 signature: b8a5ae54f1e67503747f6b2d860b47e6 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: 7da5462d395829eab8cd8ed6f4046a35 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: 7d01ef338620c57fb1891b75778cc30b ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::GeomAPI_PointsToBSpline ******/
		/****** md5 signature: 34963b1b863337c3d1e3741c4854bc6d ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion.
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

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
		/****** md5 signature: 0cd0d010b8424c636f034852b958d965 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::Init ******/
		/****** md5 signature: df0a75860e09f776ab7b4929f1db91bd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::Init ******/
		/****** md5 signature: b8b6478b2ccc511f9acaa21e6f643069 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::Init ******/
		/****** md5 signature: f1539dc955f00777d335dbbd5c371c15 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion.
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSpline::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

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
		/****** md5 signature: 89e4fef7b36ea0cc4809845df2ec0702 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: b06632372e631834dec233be4c6062b7 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: 0f92d967ca91e638ce16cb1de728d40e ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::GeomAPI_PointsToBSplineSurface ******/
		/****** md5 signature: 18c9dc77b1398b22b7b96c2894279ca8 ******/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: float
dX: float
Y0: float
dY: float
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: d1fe1adbe74945ffd2f0b0828c24cbba ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: 1f71893fa018098b5de546e2782bf809 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: float
dX: float
Y0: float
dY: float
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: cbcc6dc6d8d95c3356809760518dbbe5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)
thePeriodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3, const Standard_Boolean thePeriodic = Standard_False);

		/****** GeomAPI_PointsToBSplineSurface::Init ******/
		/****** md5 signature: b8b27b2e999215a80edec006fc879478 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol3D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** GeomAPI_PointsToBSplineSurface::Interpolate ******/
		/****** md5 signature: 39a2fafd0536bd02290befa9647199e4 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
thePeriodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const Standard_Boolean thePeriodic = Standard_False);

		/****** GeomAPI_PointsToBSplineSurface::Interpolate ******/
		/****** md5 signature: bc163deb29fcb86c6c064c33384a7741 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
thePeriodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Boolean thePeriodic = Standard_False);

		/****** GeomAPI_PointsToBSplineSurface::Interpolate ******/
		/****** md5 signature: 90cbcca9c810e9398c32dca0c12c513c ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: float
dX: float
Y0: float
dY: float

Return
-------
None

Description
-----------
No available documentation.
") Interpolate;
		void Interpolate(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY);

		/****** GeomAPI_PointsToBSplineSurface::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

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
		/****** md5 signature: 0cf3465d2e1ac87e9f07440abc59b2c4 ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve
Umin: float
Usup: float

Return
-------
None

Description
-----------
Create the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****** GeomAPI_ProjectPointOnCurve::Distance ******/
		/****** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Computes the distance between the point and its orthogonal projection on the curve. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

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
		/****** md5 signature: b368274eeebfa09906ebc42b43b184d7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Curve: Geom_Curve
Umin: float
Usup: float

Return
-------
None

Description
-----------
Init the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****** GeomAPI_ProjectPointOnCurve::Init ******/
		/****** md5 signature: 52a239c872679af14487eef439a0dfed ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Umin: float
Usup: float

Return
-------
None

Description
-----------
Init the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****** GeomAPI_ProjectPointOnCurve::LowerDistance ******/
		/****** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the distance between the point and its nearest orthogonal projection on the curve. Exceptions: StdFail_NotDone if this algorithm fails.
") LowerDistance;
		Standard_Real LowerDistance();

		/****** GeomAPI_ProjectPointOnCurve::LowerDistanceParameter ******/
		/****** md5 signature: d92357b64b8dcbaeedf932cd195aa800 ******/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the curve of the nearest orthogonal projection of the point. Exceptions: StdFail_NotDone if this algorithm fails.
") LowerDistanceParameter;
		Standard_Real LowerDistanceParameter();

		/****** GeomAPI_ProjectPointOnCurve::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed orthogonal projection points. Note: if this algorithm fails, NbPoints returns 0.
") NbPoints;
		Standard_Integer NbPoints();

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
		/****** md5 signature: 82ceab80f2b18ab921fa91f907001d9f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the parameter on the curve of the point, which is the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****** GeomAPI_ProjectPointOnCurve::Parameter ******/
		/****** md5 signature: 27513c7a9d44f786990664b216249792 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: float

Description
-----------
Returns the parameter on the curve of the point, which is the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.-.
") Parameter;
		void Parameter(const Standard_Integer Index, Standard_Real &OutValue);

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
		/****** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ******/
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
		gp_Pnt Point(const Standard_Integer Index);

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
		/****** md5 signature: 6e639d1176f8d6c4cc9bfb034078690a ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Tolerance: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Create the projection of a point <P> on a surface <Surface> Create the projection of a point <P> on a surface <Surface>. The solution are computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::GeomAPI_ProjectPointOnSurf ******/
		/****** md5 signature: 3500d152d98f28bb9d87698e6e6e033a ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Tolerance: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::GeomAPI_ProjectPointOnSurf ******/
		/****** md5 signature: 1fbc9836447ce9275912797e7e0d6742 ******/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Init the projection of a point <P> on a surface <Surface>.
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Distance ******/
		/****** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Computes the distance between the point and its orthogonal projection on the surface. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

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
		/****** md5 signature: dcd62304e8a43273745da92105df5cb5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Tolerance: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

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
		/****** md5 signature: 4ea17db8b6282bc904c5166687a5aa54 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Tolerance: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: bc9b77dc832b2ca0d6dc2423c06b1d9e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Init the projection for many points on a surface <Surface>. The solutions will be computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: e929c11afc1134afecf9eff3467e4167 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Tolerance: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::Init ******/
		/****** md5 signature: c017d628907d680cc5e0a8343510d739 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Algo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****** GeomAPI_ProjectPointOnSurf::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomAPI_ProjectPointOnSurf::LowerDistance ******/
		/****** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the distance between the point and its nearest orthogonal projection on the surface. Exceptions StdFail_NotDone if projection fails.
") LowerDistance;
		Standard_Real LowerDistance();

		/****** GeomAPI_ProjectPointOnSurf::LowerDistanceParameters ******/
		/****** md5 signature: 170a67f317186c155b5ea34d87c8b23c ******/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
Returns the parameters (U,V) on the surface of the nearest computed orthogonal projection of the point. Exceptions StdFail_NotDone if projection fails.
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAPI_ProjectPointOnSurf::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of computed orthogonal projection points. Note: if projection fails, NbPoints returns 0.
") NbPoints;
		Standard_Integer NbPoints();

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
		/****** md5 signature: e9cd1a857a99bf64aba6fcfeffe41477 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: float
V: float

Description
-----------
Returns the parameters (U,V) on the surface of the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ******/
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
		gp_Pnt Point(const Standard_Integer Index);

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
