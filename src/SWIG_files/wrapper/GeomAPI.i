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
%define GEOMAPIDOCSTRING
"GeomAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomapi.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** To2d ******************/
		/**** md5 signature: 46767ba0b9de8c155b0c1451dc4d31a0 ****/
		%feature("compactdefaultargs") To2d;
		%feature("autodoc", "This function builds (in the parametric space of the plane p) a 2d curve equivalent to the 3d curve c. the 3d curve c is considered to be located in the plane p. warning the 3d curve c must be of one of the following types: - a line - a circle - an ellipse - a hyperbola - a parabola - a bezier curve - a bspline curve exceptions standard_nosuchobject if c is not a defined type curve.

Parameters
----------
C: Geom_Curve
P: gp_Pln

Returns
-------
opencascade::handle<Geom2d_Curve>
") To2d;
		static opencascade::handle<Geom2d_Curve> To2d(const opencascade::handle<Geom_Curve> & C, const gp_Pln & P);

		/****************** To3d ******************/
		/**** md5 signature: c6040ccc3dbcd8e3934502306b71f14f ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "Builds a 3d curve equivalent to the 2d curve c described in the parametric space defined by the local coordinate system of plane p. the resulting 3d curve is of the same nature as that of the curve c.

Parameters
----------
C: Geom2d_Curve
P: gp_Pln

Returns
-------
opencascade::handle<Geom_Curve>
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
		/****************** GeomAPI_ExtremaCurveCurve ******************/
		/**** md5 signature: a3010c7573b0359accbee1e737d0c0c9 ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "Constructs an empty algorithm for computing extrema between two curves. use an init function to define the curves on which it is going to work.

Returns
-------
None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve();

		/****************** GeomAPI_ExtremaCurveCurve ******************/
		/**** md5 signature: 0c7a7ec6c28252d008d2320948a498fe ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "Computes the extrema between the curves c1 and c2.

Parameters
----------
C1: Geom_Curve
C2: Geom_Curve

Returns
-------
None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****************** GeomAPI_ExtremaCurveCurve ******************/
		/**** md5 signature: cf67c0a625d592607f391fe9ed6bd689 ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "Computes the portion of the curve c1 limited by the two points of parameter (u1min,u1max), and - the portion of the curve c2 limited by the two points of parameter (u2min,u2max). warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
U1min: float
U1max: float
U2min: float
U2max: float

Returns
-------
None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

		/****************** Distance ******************/
		/**** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the end points of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		/**** md5 signature: d20597ca5df7eb3eb3c7b2cc10a25ce9 ****/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

Returns
-------
Extrema_ExtCC
") Extrema;
		const Extrema_ExtCC & Extrema();

		/****************** Init ******************/
		/**** md5 signature: 921fb84113845f665798bcd7f0f3d2e1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema between the curves c1 and c2.

Parameters
----------
C1: Geom_Curve
C2: Geom_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****************** Init ******************/
		/**** md5 signature: ec9500c526586804614827847658370a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema between : - the portion of the curve c1 limited by the two points of parameter (u1min,u1max), and - the portion of the curve c2 limited by the two points of parameter (u2min,u2max). warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
U1min: float
U1max: float
U2min: float
U2max: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

		/****************** LowerDistance ******************/
		/**** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ****/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the end points of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

Returns
-------
float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		/**** md5 signature: 8692eb96773a2ce4edf4599b17864e52 ****/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters u1 of the point on the first curve and u2 of the point on the second curve, which are the ends of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

Parameters
----------

Returns
-------
U1: float
U2: float
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		/**** md5 signature: 29e39c32fb361964ef3fb09e088c11d8 ****/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Returns the number of extrema computed by this algorithm. note: if this algorithm fails, nbextrema returns 0.

Returns
-------
int
") NbExtrema;
		Standard_Integer NbExtrema();

		/****************** NearestPoints ******************/
		/**** md5 signature: 4930be161c652c11e7ff1600e5a2e89e ****/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "Returns the points p1 on the first curve and p2 on the second curve, which are the ends of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") NearestPoints;
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2);

		/****************** Parameters ******************/
		/**** md5 signature: f35f3eb64c1cede9adcbe1fc2f680bb0 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters u1 of the point on the first curve and u2 of the point on the second curve, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
U1: float
U2: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Points ******************/
		/**** md5 signature: 79cc8f2ceb24f7ce334d72d7116d374c ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points p1 on the first curve and p2 on the second curve, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") Points;
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2);

		/****************** TotalLowerDistance ******************/
		/**** md5 signature: bbe3edab05724b99eb1d289189b59dc9 ****/
		%feature("compactdefaultargs") TotalLowerDistance;
		%feature("autodoc", "Return the distance of the total nearest couple solution point. if <myextcc> is not done.

Returns
-------
float
") TotalLowerDistance;
		Standard_Real TotalLowerDistance();

		/****************** TotalLowerDistanceParameters ******************/
		/**** md5 signature: 918e628c38cab528b8e9ffd40e74ec9f ****/
		%feature("compactdefaultargs") TotalLowerDistanceParameters;
		%feature("autodoc", "Set in <u1> and <u2> the parameters of the couple solution points which represents the total nearest solution.

Parameters
----------

Returns
-------
U1: float
U2: float
") TotalLowerDistanceParameters;
		Standard_Boolean TotalLowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TotalNearestPoints ******************/
		/**** md5 signature: 5b96fd4d2868012457d21f38c05df9a4 ****/
		%feature("compactdefaultargs") TotalNearestPoints;
		%feature("autodoc", "Set in <p1> and <p2> the couple solution points such a the distance [p1,p2] is the minimum. taking in account extremity points of curves.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
bool
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
		/****************** GeomAPI_ExtremaCurveSurface ******************/
		/**** md5 signature: ad5451d66f7a0b9e46e9db373fe46faa ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "Constructs an empty algorithm for computing extrema between a curve and a surface. use an init function to define the curve and the surface on which it is going to work.

Returns
-------
None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface();

		/****************** GeomAPI_ExtremaCurveSurface ******************/
		/**** md5 signature: cef525ab700b90764fd82ec76526a951 ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>.

Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface

Returns
-------
None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface);

		/****************** GeomAPI_ExtremaCurveSurface ******************/
		/**** md5 signature: a2215f2a78469c1af4760a32475d3683 ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>. the solution point are computed in the domain [wmin,wmax] of the curve and in the domain [umin,umax] [vmin,vmax] of the surface. warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

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

Returns
-------
None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Wmin, const Standard_Real Wmax, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****************** Distance ******************/
		/**** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the end points of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		/**** md5 signature: adcf7d7d93c740fa26f7543ee94e20ec ****/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Returns the algorithmic object from extrema.

Returns
-------
Extrema_ExtCS
") Extrema;
		const Extrema_ExtCS & Extrema();

		/****************** Init ******************/
		/**** md5 signature: dd5e8dfd1899f88b374f7f1be823f2b1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>.

Parameters
----------
Curve: Geom_Curve
Surface: Geom_Surface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface);

		/****************** Init ******************/
		/**** md5 signature: d6404c0680afce59f0009686b12fb9f9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>. the solution point are computed in the domain [wmin,wmax] of the curve and in the domain [umin,umax] [vmin,vmax] of the surface. warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Wmin, const Standard_Real Wmax, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****************** LowerDistance ******************/
		/**** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ****/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the end points of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

Returns
-------
float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		/**** md5 signature: 1d8b0b18b6eaeec3dd1d68420af77b77 ****/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters w of the point on the curve and (u,v) of the point on the surface, which are the ends of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

Parameters
----------

Returns
-------
W: float
U: float
V: float
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		/**** md5 signature: 29e39c32fb361964ef3fb09e088c11d8 ****/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Returns the number of extrema computed by this algorithm. note: if this algorithm fails, nbextrema returns 0.

Returns
-------
int
") NbExtrema;
		Standard_Integer NbExtrema();

		/****************** NearestPoints ******************/
		/**** md5 signature: 5cdc647c1b5fc9f834b7700fd001104f ****/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "Returns the points pc on the curve and ps on the surface, which are the ends of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

Parameters
----------
PC: gp_Pnt
PS: gp_Pnt

Returns
-------
None
") NearestPoints;
		void NearestPoints(gp_Pnt & PC, gp_Pnt & PS);

		/****************** Parameters ******************/
		/**** md5 signature: e6e64993bdd5467abdf3f059c86d56b5 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters w of the point on the curve, and (u,v) of the point on the surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
W: float
U: float
V: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Points ******************/
		/**** md5 signature: 79cc8f2ceb24f7ce334d72d7116d374c ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points p1 on the curve and p2 on the surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
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
		/****************** GeomAPI_ExtremaSurfaceSurface ******************/
		/**** md5 signature: 6c3848e0fca2ded28728d3f6d8b44686 ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "Constructs an empty algorithm for computing extrema between two surfaces. use an init function to define the surfaces on which it is going to work.

Returns
-------
None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface();

		/****************** GeomAPI_ExtremaSurfaceSurface ******************/
		/**** md5 signature: 28b59a021ad63b73a4dc0533e0a6f0ef ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "Computes the extrema distances between the surfaces <s1> and <s2>.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface

Returns
-------
None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2);

		/****************** GeomAPI_ExtremaSurfaceSurface ******************/
		/**** md5 signature: 2059d74f0171f73f6daa37633f501200 ****/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "Computes the extrema distances between the portion of the surface s1 limited by the two values of parameter (u1min,u1max) in the u parametric direction, and by the two values of parameter (v1min,v1max) in the v parametric direction, and - the portion of the surface s2 limited by the two values of parameter (u2min,u2max) in the u parametric direction, and by the two values of parameter (v2min,v2max) in the v parametric direction.

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

Returns
-------
None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real V1min, const Standard_Real V1max, const Standard_Real U2min, const Standard_Real U2max, const Standard_Real V2min, const Standard_Real V2max);

		/****************** Distance ******************/
		/**** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the end points of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		/**** md5 signature: 4e9266c25801d466046033a02435b14c ****/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

Returns
-------
Extrema_ExtSS
") Extrema;
		const Extrema_ExtSS & Extrema();

		/****************** Init ******************/
		/**** md5 signature: 65c310fb65763eea9a805df773c030e8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema distances between the surfaces <s1> and <s2>.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2);

		/****************** Init ******************/
		/**** md5 signature: 81d2a4fd09309402d7e36c6fb1d3e40d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema distances between - the portion of the surface s1 limited by the two values of parameter (u1min,u1max) in the u parametric direction, and by the two values of parameter (v1min,v1max) in the v parametric direction, and - the portion of the surface s2 limited by the two values of parameter (u2min,u2max) in the u parametric direction, and by the two values of parameter (v2min,v2max) in the v parametric direction.

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real V1min, const Standard_Real V1max, const Standard_Real U2min, const Standard_Real U2max, const Standard_Real V2min, const Standard_Real V2max);

		/****************** LowerDistance ******************/
		/**** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ****/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the end points of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

Returns
-------
float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		/**** md5 signature: ec805ec8c6e320fe6a04db9189b1cfa5 ****/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters (u1,v1) of the point on the first surface and (u2,v2) of the point on the second surface, which are the ends of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

Parameters
----------

Returns
-------
U1: float
V1: float
U2: float
V2: float
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		/**** md5 signature: 29e39c32fb361964ef3fb09e088c11d8 ****/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Returns the number of extrema computed by this algorithm. note: if this algorithm fails, nbextrema returns 0.

Returns
-------
int
") NbExtrema;
		Standard_Integer NbExtrema();

		/****************** NearestPoints ******************/
		/**** md5 signature: 4930be161c652c11e7ff1600e5a2e89e ****/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "Returns the points p1 on the first surface and p2 on the second surface, which are the ends of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") NearestPoints;
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2);

		/****************** Parameters ******************/
		/**** md5 signature: 6f89f63d1628a1a0a52449e028c59bf0 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters (u1,v1) of the point on the first surface, and (u2,v2) of the point on the second surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Points ******************/
		/**** md5 signature: 79cc8f2ceb24f7ce334d72d7116d374c ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points p1 on the first surface and p2 on the second surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
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
		/****************** GeomAPI_IntCS ******************/
		/**** md5 signature: 0791811afd31ee46ff9fd55c0cc30352 ****/
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "Creates an empty object. use the function perform for further initialization of the algorithm by the curve and the surface.

Returns
-------
None
") GeomAPI_IntCS;
		 GeomAPI_IntCS();

		/****************** GeomAPI_IntCS ******************/
		/**** md5 signature: b5e98b376c9b3d0e4b5a614f0cd99b35 ****/
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "Computes the intersections between the curve c and the surface s. warning use function isdone to verify that the intersections are computed successfully.

Parameters
----------
C: Geom_Curve
S: Geom_Surface

Returns
-------
None
") GeomAPI_IntCS;
		 GeomAPI_IntCS(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the intersections are successfully computed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection points if isdone returns true. else notdone is raised.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of computed intersection segments in case of tangential intersection. exceptions stdfail_notdone if the intersection algorithm fails or is not initialized.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Parameters ******************/
		/**** md5 signature: 36177eb42eb48aa94ff536cea1ae7c13 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns parameter w on the curve and (parameters u,v) on the surface of the computed intersection point of index index in case of cross intersection. exceptions stdfail_notdone if intersection algorithm fails or is not initialized. standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of computed intersection points.

Parameters
----------
Index: int

Returns
-------
U: float
V: float
W: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Parameters ******************/
		/**** md5 signature: 6f89f63d1628a1a0a52449e028c59bf0 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters of the first (u1,v1) and the last (u2,v2) points of curve's segment on the surface in case of tangential intersection. index is the number of computed intersection segments. exceptions stdfail_notdone if intersection algorithm fails or is not initialized. standard_outofrange if index is not in the range [ 1,nbsegments ], where nbsegments is the number of computed intersection segments.

Parameters
----------
Index: int

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 99d3460d4845c1186bfbed85af97b966 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "This function initializes an algorithm with the curve c and the surface s and computes the intersections between c and s. warning use function isdone to verify that the intersections are computed successfully.

Parameters
----------
C: Geom_Curve
S: Geom_Surface

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****************** Point ******************/
		/**** md5 signature: ee1d88fa34d027a5da9aa36f1333c940 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range <index>in case of cross intersection. raises notdone if the computation has failed or if the computation has not been done raises outofrange if index is not in the range <1..nbpoints>.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point(const Standard_Integer Index);

		/****************** Segment ******************/
		/**** md5 signature: a5a3725890b7c5a68d73d1fc8ad30c69 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the computed intersection segment of index index in case of tangential intersection. intersection segment is a portion of the initial curve tangent to surface. exceptions stdfail_notdone if intersection algorithm fails or is not initialized. standard_outofrange if index is not in the range [ 1,nbsegments ], where nbsegments is the number of computed intersection segments.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
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
		/****************** GeomAPI_IntSS ******************/
		/**** md5 signature: 16b596a87a9a3dfbb4308a0fe15c86ea ****/
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "Constructs an empty object. use the function perform for further initialization algorithm by two surfaces.

Returns
-------
None
") GeomAPI_IntSS;
		 GeomAPI_IntSS();

		/****************** GeomAPI_IntSS ******************/
		/**** md5 signature: 03033b28bd581f32a8ce9a9e2796ba8c ****/
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "Computes the intersection curves between the two surfaces s1 and s2. parameter tol defines the precision of curves computation. for most cases the value 1.0e-7 is recommended to use. warning use the function isdone to verify that the intersections are successfully computed.i.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float

Returns
-------
None
") GeomAPI_IntSS;
		 GeomAPI_IntSS(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the intersection was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 2500cd198cb3b23b6a306899bd784df3 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the computed intersection curve of index index. exceptions stdfail_notdone if the computation fails. standard_outofrange if index is out of range [1, nblines] where nblines is the number of computed intersection curves.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") Line;
		const opencascade::handle<Geom_Curve> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of computed intersection curves. exceptions stdfail_notdone if the computation fails.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		/**** md5 signature: 7d516f7f691f1d7f4f72ff6e7908b4f6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Initializes an algorithm with the given arguments and computes the intersection curves between the two surfaces s1 and s2. parameter tol defines the precision of curves computation. for most cases the value 1.0e-7 is recommended to use. warning use function isdone to verify that the intersections are successfully computed.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float

Returns
-------
None
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
		/****************** GeomAPI_Interpolate ******************/
		/**** md5 signature: 7bcbe68f50c152239bbd9f150f3ba779 ****/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "Initializes an algorithm for constructing a constrained bspline curve passing through the points of the table points. tangential vectors can then be assigned, using the function load. if periodicflag is true, the constrained bspline curve will be periodic and closed. in this case, the junction point is the first point of the table points. the tolerance value tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function load) are not too small. the resulting bspline curve will be 'c2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the load function). in this case, it will be only 'c1' continuous. once all the constraints are defined, use the function perform to compute the curve. warning - there must be at least 2 points in the table points. - if periodicflag is false, there must be as many parameters in the array parameters as there are points in the array points. - if periodicflag is true, there must be one more parameter in the table parameters: this is used to give the parameter on the resulting bspline curve of the junction point of the curve (which is also the first point of the table points). exceptions - standard_constructionerror if the distance between two consecutive points in the table points is less than or equal to tolerance. - standard_outofrange if: - there are less than two points in the table points, or - conditions relating to the respective number of elements in the parallel tables points and parameters are not respected.

Parameters
----------
Points: TColgp_HArray1OfPnt
PeriodicFlag: bool
Tolerance: float

Returns
-------
None
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** GeomAPI_Interpolate ******************/
		/**** md5 signature: 68963c383e6700975a895834802b30d2 ****/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "Initializes an algorithm for constructing a constrained bspline curve passing through the points of the table points, where the parameters of each of its points are given by the parallel table parameters. tangential vectors can then be assigned, using the function load. if periodicflag is true, the constrained bspline curve will be periodic and closed. in this case, the junction point is the first point of the table points. the tolerance value tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function load) are not too small. the resulting bspline curve will be 'c2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the load function). in this case, it will be only 'c1' continuous. once all the constraints are defined, use the function perform to compute the curve. warning - there must be at least 2 points in the table points. - if periodicflag is false, there must be as many parameters in the array parameters as there are points in the array points. - if periodicflag is true, there must be one more parameter in the table parameters: this is used to give the parameter on the resulting bspline curve of the junction point of the curve (which is also the first point of the table points). exceptions - standard_constructionerror if the distance between two consecutive points in the table points is less than or equal to tolerance. - standard_outofrange if: - there are less than two points in the table points, or - conditions relating to the respective number of elements in the parallel tables points and parameters are not respected.

Parameters
----------
Points: TColgp_HArray1OfPnt
Parameters: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: float

Returns
-------
None
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** Curve ******************/
		/**** md5 signature: c38eea3d03f43cd4ac9ae236a908e33c ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the computed bspline curve. raises stdfail_notdone if the interpolation fails.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve;
		const opencascade::handle<Geom_BSplineCurve> & Curve();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the constrained bspline curve is successfully constructed. note: in this case, the result is given by the function curve.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		/**** md5 signature: 5d6d63d49911c50b81c3c2693d0463f3 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Assigns this constrained bspline curve to be tangential to vectors initialtangent and finaltangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization).

Parameters
----------
InitialTangent: gp_Vec
FinalTangent: gp_Vec
Scale: bool,optional
	default value is Standard_True

Returns
-------
None
") Load;
		void Load(const gp_Vec & InitialTangent, const gp_Vec & FinalTangent, const Standard_Boolean Scale = Standard_True);

		/****************** Load ******************/
		/**** md5 signature: 6e958e722c5b850819cfe62e39373686 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Assigns this constrained bspline curve to be tangential to vectors defined in the table tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. vectors in the table tangents are defined only if the flag given in the parallel table tangentflags is true: only these vectors are set as tangency constraints.

Parameters
----------
Tangents: TColgp_Array1OfVec
TangentFlags: TColStd_HArray1OfBoolean
Scale: bool,optional
	default value is Standard_True

Returns
-------
None
") Load;
		void Load(const TColgp_Array1OfVec & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags, const Standard_Boolean Scale = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the constrained bspline curve. use the function isdone to verify that the computation is successful, and then the function curve to obtain the result.

Returns
-------
None
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
		/****************** GeomAPI_PointsToBSpline ******************/
		/**** md5 signature: 3661034a8629c1e55ec2861e146bbee3 ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Constructs an empty approximation algorithm. use an init function to define and build the bspline curve.

Returns
-------
None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline();

		/****************** GeomAPI_PointsToBSpline ******************/
		/**** md5 signature: b8a5ae54f1e67503747f6b2d860b47e6 ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

Parameters
----------
Points: TColgp_Array1OfPnt
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSpline ******************/
		/**** md5 signature: 7da5462d395829eab8cd8ed6f4046a35 ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

Parameters
----------
Points: TColgp_Array1OfPnt
ParType: Approx_ParametrizationType
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSpline ******************/
		/**** md5 signature: 7d01ef338620c57fb1891b75778cc30b ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point, which parameters are given by the array <parameters>. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

Parameters
----------
Points: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSpline ******************/
		/**** md5 signature: 34963b1b863337c3d1e3741c4854bc6d ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point using variational smoothing algorithm, which tries to minimize additional criterium: weight1*curvelength + weight2*curvature + weight3*torsion.

Parameters
----------
Points: TColgp_Array1OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Curve ******************/
		/**** md5 signature: c38eea3d03f43cd4ac9ae236a908e33c ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the computed bspline curve. raises stdfail_notdone if the curve is not built.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve;
		const opencascade::handle<Geom_BSplineCurve> & Curve();

		/****************** Init ******************/
		/**** md5 signature: 0cd0d010b8424c636f034852b958d965 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

Parameters
----------
Points: TColgp_Array1OfPnt
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: df0a75860e09f776ab7b4929f1db91bd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

Parameters
----------
Points: TColgp_Array1OfPnt
ParType: Approx_ParametrizationType
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: b8b6478b2ccc511f9acaa21e6f643069 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point, which parameters are given by the array <parameters>. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

Parameters
----------
Points: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: f1539dc955f00777d335dbbd5c371c15 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point using variational smoothing algorithm, which tries to minimize additional criterium: weight1*curvelength + weight2*curvature + weight3*torsion.

Parameters
----------
Points: TColgp_Array1OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		/****************** GeomAPI_PointsToBSplineSurface ******************/
		/**** md5 signature: 5e47f6c049e83fdf88c926c7208fb3ae ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "Constructs an empty algorithm for approximation or interpolation of a surface. use: - an init function to define and build the bspline surface by approximation, or - an interpolate function to define and build the bspline surface by interpolation.

Returns
-------
None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface();

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		/**** md5 signature: 89e4fef7b36ea0cc4809845df2ec0702 ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		/**** md5 signature: b06632372e631834dec233be4c6062b7 ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		/**** md5 signature: 0f92d967ca91e638ce16cb1de728d40e ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		/**** md5 signature: 18c9dc77b1398b22b7b96c2894279ca8 ****/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: float
dX: float
Y0: float
dY: float
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: d1fe1adbe74945ffd2f0b0828c24cbba ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: 1f71893fa018098b5de546e2782bf809 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: float
dX: float
Y0: float
dY: float
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: cbcc6dc6d8d95c3356809760518dbbe5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3
thePeriodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3, const Standard_Boolean thePeriodic = Standard_False);

		/****************** Init ******************/
		/**** md5 signature: b8b27b2e999215a80edec006fc879478 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
Weight1: float
Weight2: float
Weight3: float
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol3D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Interpolate ******************/
		/**** md5 signature: 39a2fafd0536bd02290befa9647199e4 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
thePeriodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const Standard_Boolean thePeriodic = Standard_False);

		/****************** Interpolate ******************/
		/**** md5 signature: bc163deb29fcb86c6c064c33384a7741 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "No available documentation.

Parameters
----------
Points: TColgp_Array2OfPnt
ParType: Approx_ParametrizationType
thePeriodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Boolean thePeriodic = Standard_False);

		/****************** Interpolate ******************/
		/**** md5 signature: 90cbcca9c810e9398c32dca0c12c513c ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "No available documentation.

Parameters
----------
ZPoints: TColStd_Array2OfReal
X0: float
dX: float
Y0: float
dY: float

Returns
-------
None
") Interpolate;
		void Interpolate(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Surface ******************/
		/**** md5 signature: 671a5de971e9a6baf08b4e111daa768f ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the approximate bspline surface.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
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
		/****************** GeomAPI_ProjectPointOnCurve ******************/
		/**** md5 signature: 69d2ff1a2c2a276bcd4ac63b780f962d ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "Creates an empty object. use an init function for further initialization.

Returns
-------
None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve();

		/****************** GeomAPI_ProjectPointOnCurve ******************/
		/**** md5 signature: 98d2970e0388654e7771e359678049bb ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "Create the projection of a point <p> on a curve <curve>.

Parameters
----------
P: gp_Pnt
Curve: Geom_Curve

Returns
-------
None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve);

		/****************** GeomAPI_ProjectPointOnCurve ******************/
		/**** md5 signature: 0cf3465d2e1ac87e9f07440abc59b2c4 ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "Create the projection of a point <p> on a curve <curve> limited by the two points of parameter umin and usup.

Parameters
----------
P: gp_Pnt
Curve: Geom_Curve
Umin: float
Usup: float

Returns
-------
None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** Distance ******************/
		/**** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the point and its orthogonal projection on the curve. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		/**** md5 signature: 2a2c7c9268b8bc0a62547ade486fcb4b ****/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

Returns
-------
Extrema_ExtPC
") Extrema;
		const Extrema_ExtPC & Extrema();

		/****************** Init ******************/
		/**** md5 signature: 584a6ccc485f9268fa6ad5924e296d14 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a curve <curve>.

Parameters
----------
P: gp_Pnt
Curve: Geom_Curve

Returns
-------
None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve);

		/****************** Init ******************/
		/**** md5 signature: b368274eeebfa09906ebc42b43b184d7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a curve <curve> limited by the two points of parameter umin and usup.

Parameters
----------
P: gp_Pnt
Curve: Geom_Curve
Umin: float
Usup: float

Returns
-------
None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** Init ******************/
		/**** md5 signature: 52a239c872679af14487eef439a0dfed ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a curve <curve> limited by the two points of parameter umin and usup.

Parameters
----------
Curve: Geom_Curve
Umin: float
Usup: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** LowerDistance ******************/
		/**** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ****/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the point and its nearest orthogonal projection on the curve. exceptions: stdfail_notdone if this algorithm fails.

Returns
-------
float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameter ******************/
		/**** md5 signature: d92357b64b8dcbaeedf932cd195aa800 ****/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "Returns the parameter on the curve of the nearest orthogonal projection of the point. exceptions: stdfail_notdone if this algorithm fails.

Returns
-------
float
") LowerDistanceParameter;
		Standard_Real LowerDistanceParameter();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of computed orthogonal projection points. note: if this algorithm fails, nbpoints returns 0.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NearestPoint ******************/
		/**** md5 signature: 483270796058353f575fc5981b06215a ****/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Returns the nearest orthogonal projection of the point on the curve. exceptions: stdfail_notdone if this algorithm fails.

Returns
-------
gp_Pnt
") NearestPoint;
		gp_Pnt NearestPoint();

		/****************** Parameter ******************/
		/**** md5 signature: 82ceab80f2b18ab921fa91f907001d9f ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve of the point, which is the orthogonal projection. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****************** Parameter ******************/
		/**** md5 signature: 27513c7a9d44f786990664b216249792 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve of the point, which is the orthogonal projection. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.-.

Parameters
----------
Index: int

Returns
-------
U: float
") Parameter;
		void Parameter(const Standard_Integer Index, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the projection of a point on the current curve.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the orthogonal projection on the curve. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
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
		/****************** GeomAPI_ProjectPointOnSurf ******************/
		/**** md5 signature: fae07e2100bfda9b7082817f1e3bdc9e ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Creates an empty object. use the init function for further initialization.

Returns
-------
None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf();

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		/**** md5 signature: 091b2414733bc45759b0163e7de1668a ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Create the projection of a point <p> on a surface <surface>.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		/**** md5 signature: 6e639d1176f8d6c4cc9bfb034078690a ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Create the projection of a point <p> on a surface <surface> create the projection of a point <p> on a surface <surface>. the solution are computed in the domain [umin,usup] [vmin,vsup] of the surface.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Tolerance: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		/**** md5 signature: 3500d152d98f28bb9d87698e6e6e033a ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Tolerance: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		/**** md5 signature: 1fbc9836447ce9275912797e7e0d6742 ****/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Init the projection of a point <p> on a surface <surface>.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Distance ******************/
		/**** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the point and its orthogonal projection on the surface. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		/**** md5 signature: 5d88f4e1c84a05757ee93d4ab14118bb ****/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

Returns
-------
Extrema_ExtPS
") Extrema;
		const Extrema_ExtPS & Extrema();

		/****************** Init ******************/
		/**** md5 signature: dcd62304e8a43273745da92105df5cb5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Tolerance: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		/**** md5 signature: da40c40255ca65231b6acdc32da0236d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a surface <surface>. the solution are computed in the domain [umin,usup] [vmin,vsup] of the surface.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		/**** md5 signature: 4ea17db8b6282bc904c5166687a5aa54 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Tolerance: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		/**** md5 signature: bc9b77dc832b2ca0d6dc2423c06b1d9e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection for many points on a surface <surface>. the solutions will be computed in the domain [umin,usup] [vmin,vsup] of the surface.

Parameters
----------
P: gp_Pnt
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		/**** md5 signature: e929c11afc1134afecf9eff3467e4167 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Tolerance: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		/**** md5 signature: c017d628907d680cc5e0a8343510d739 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surface: Geom_Surface
Umin: float
Usup: float
Vmin: float
Vsup: float
Algo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LowerDistance ******************/
		/**** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ****/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the point and its nearest orthogonal projection on the surface. exceptions stdfail_notdone if projection fails.

Returns
-------
float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		/**** md5 signature: 170a67f317186c155b5ea34d87c8b23c ****/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters (u,v) on the surface of the nearest computed orthogonal projection of the point. exceptions stdfail_notdone if projection fails.

Parameters
----------

Returns
-------
U: float
V: float
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of computed orthogonal projection points. note: if projection fails, nbpoints returns 0.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NearestPoint ******************/
		/**** md5 signature: 483270796058353f575fc5981b06215a ****/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Returns the nearest orthogonal projection of the point on the surface. exceptions stdfail_notdone if projection fails.

Returns
-------
gp_Pnt
") NearestPoint;
		gp_Pnt NearestPoint();

		/****************** Parameters ******************/
		/**** md5 signature: e9cd1a857a99bf64aba6fcfeffe41477 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters (u,v) on the surface of the orthogonal projection. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
U: float
V: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the projection of a point on the current surface.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the orthogonal projection on the surface. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

		/****************** SetExtremaAlgo ******************/
		/**** md5 signature: 271740dfa1218f60cc3b4e8b5cc1d298 ****/
		%feature("compactdefaultargs") SetExtremaAlgo;
		%feature("autodoc", "Sets the extrema search algorithm - grad or tree. by default the extrema is initialized with grad algorithm.

Parameters
----------
theAlgo: Extrema_ExtAlgo

Returns
-------
None
") SetExtremaAlgo;
		void SetExtremaAlgo(const Extrema_ExtAlgo theAlgo);

		/****************** SetExtremaFlag ******************/
		/**** md5 signature: 399fd1734b5c259e95e5285524e15a9e ****/
		%feature("compactdefaultargs") SetExtremaFlag;
		%feature("autodoc", "Sets the extrema search flag - min or max or minmax. by default the extrema is set to search the minmax solutions.

Parameters
----------
theExtFlag: Extrema_ExtFlag

Returns
-------
None
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
