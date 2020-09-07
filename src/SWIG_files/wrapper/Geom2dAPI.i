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
%define GEOM2DAPIDOCSTRING
"Geom2dAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dapi.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DAPIDOCSTRING) Geom2dAPI


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
#include<Geom2dAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<Extrema_module.hxx>
#include<gp_module.hxx>
#include<Geom2dInt_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<Approx_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Bnd_module.hxx>
#include<AppParCurves_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import Extrema.i
%import gp.i
%import Geom2dInt.i
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

/************************************
* class Geom2dAPI_ExtremaCurveCurve *
************************************/
class Geom2dAPI_ExtremaCurveCurve {
	public:
		/****************** Geom2dAPI_ExtremaCurveCurve ******************/
		/**** md5 signature: 8f2f31b9577dc2d995aebb74682e6a81 ****/
		%feature("compactdefaultargs") Geom2dAPI_ExtremaCurveCurve;
		%feature("autodoc", "Computes the extrema between - the portion of the curve c1 limited by the two points of parameter (u1min,u1max), and - the portion of the curve c2 limited by the two points of parameter (u2min,u2max). warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
U1min: float
U1max: float
U2min: float
U2max: float

Returns
-------
None
") Geom2dAPI_ExtremaCurveCurve;
		 Geom2dAPI_ExtremaCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

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
		/**** md5 signature: b1d6dfe7a95af8a82b7106fd7bcb56f9 ****/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "No available documentation.

Returns
-------
Extrema_ExtCC2d
") Extrema;
		const Extrema_ExtCC2d & Extrema();

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
		/**** md5 signature: d1cedc9a4b8798a784e5474f9d0aa977 ****/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "Returns the points p1 on the first curve and p2 on the second curve, which are the ends of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") NearestPoints;
		void NearestPoints(gp_Pnt2d & P1, gp_Pnt2d & P2);

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
		/**** md5 signature: e7ce8c9f5202ad3a50be862129fd5390 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points p1 on the first curve and p2 on the second curve, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

Parameters
----------
Index: int
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer Index, gp_Pnt2d & P1, gp_Pnt2d & P2);

};


%extend Geom2dAPI_ExtremaCurveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dAPI_InterCurveCurve *
**********************************/
class Geom2dAPI_InterCurveCurve {
	public:
		/****************** Geom2dAPI_InterCurveCurve ******************/
		/**** md5 signature: d3ab574ddf861c120b18e9c93d89c339 ****/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "Create an empty intersector. use the function init for further initialization of the intersection algorithm by curves or curve.

Returns
-------
None
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve();

		/****************** Geom2dAPI_InterCurveCurve ******************/
		/**** md5 signature: 46b74a2815829c9dfa15b95e8e1ce241 ****/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "Creates an object and computes the intersections between the curves c1 and c2.

Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
Tol: float,optional
	default value is 1.0e-6

Returns
-------
None
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const Standard_Real Tol = 1.0e-6);

		/****************** Geom2dAPI_InterCurveCurve ******************/
		/**** md5 signature: 931286664b6e6aefcf2c51062461087c ****/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "Creates an object and computes self-intersections of the curve c1. tolerance value tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. in case of a tangential intersection, tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than tol. warning use functions nbpoints and nbsegments to obtain the number of solutions. if the algorithm finds no intersections nbpoints and nbsegments return 0.

Parameters
----------
C1: Geom2d_Curve
Tol: float,optional
	default value is 1.0e-6

Returns
-------
None
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const Standard_Real Tol = 1.0e-6);

		/****************** Init ******************/
		/**** md5 signature: 16764f90ec7716443cef53da1c6adea1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes an algorithm with the given arguments and computes the intersections between the curves c1. and c2.

Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
Tol: float,optional
	default value is 1.0e-6

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const Standard_Real Tol = 1.0e-6);

		/****************** Init ******************/
		/**** md5 signature: dcca515b62d5af999e8065406a32e82b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes an algorithm with the given arguments and computes the self-intersections of the curve c1. tolerance value tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. in case of a tangential intersection, tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than tol. warning use functions nbpoints and nbsegments to obtain the number of solutions. if the algorithm finds no intersections nbpoints and nbsegments return 0.

Parameters
----------
C1: Geom2d_Curve
Tol: float,optional
	default value is 1.0e-6

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C1, const Standard_Real Tol = 1.0e-6);

		/****************** Intersector ******************/
		/**** md5 signature: 4ebbf59c42ad801a63e34dfa17e19ef4 ****/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return the algorithmic object from intersection.

Returns
-------
Geom2dInt_GInter
") Intersector;
		const Geom2dInt_GInter & Intersector();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection-points in case of cross intersections. nbpoints returns 0 if no intersections were found.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of tangential intersections. nbsegments returns 0 if no intersections were found.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Point ******************/
		/**** md5 signature: dfa31b44e58975a6577c15284df2704c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of index index. intersection points are computed in case of cross intersections with a precision equal to the tolerance value assigned at the time of construction or in the function init (this value is defaulted to 1.0e-6). exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of computed intersection points.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****************** Segment ******************/
		/**** md5 signature: b37643f2678b364da2f6153ed330844f ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Use this syntax only to get solutions of tangential intersection between two curves. output values curve1 and curve2 are the intersection segments on the first curve and on the second curve accordingly. parameter index defines a number of computed solution. an intersection segment is a portion of an initial curve limited by two points. the distance from each point of this segment to the other curve is less or equal to the tolerance value assigned at the time of construction or in function init (this value is defaulted to 1.0e-6). exceptions standard_outofrange if index is not in the range [ 1,nbsegments ], where nbsegments is the number of computed tangential intersections. standard_nullobject if the algorithm is initialized for the computing of self-intersections on a curve.

Parameters
----------
Index: int
Curve1: Geom2d_Curve
Curve2: Geom2d_Curve

Returns
-------
None
") Segment;
		void Segment(const Standard_Integer Index, opencascade::handle<Geom2d_Curve> & Curve1, opencascade::handle<Geom2d_Curve> & Curve2);

};


%extend Geom2dAPI_InterCurveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2dAPI_Interpolate *
******************************/
class Geom2dAPI_Interpolate {
	public:
		/****************** Geom2dAPI_Interpolate ******************/
		/**** md5 signature: 49377e07923a612a4e586c2817e4aac7 ****/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "Tolerance is to check if the points are not too close to one an other it is also used to check if the tangent vector is not too small. there should be at least 2 points if periodicflag is true then the curve will be periodic.

Parameters
----------
Points: TColgp_HArray1OfPnt2d
PeriodicFlag: bool
Tolerance: float

Returns
-------
None
") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt2d> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** Geom2dAPI_Interpolate ******************/
		/**** md5 signature: 2d0547cfca5a9782d47bfd0d341e2b99 ****/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "If periodicflag is true then the curve will be periodic warning: there should be as many parameters as there are points except if periodicflag is true : then there should be one more parameter to close the curve.

Parameters
----------
Points: TColgp_HArray1OfPnt2d
Parameters: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: float

Returns
-------
None
") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt2d> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** Curve ******************/
		/**** md5 signature: c8126eab6a406e6375cef128d14447d1 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the computed bspline curve. raises stdfail_notdone if the interpolation fails.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve;
		const opencascade::handle<Geom2d_BSplineCurve> & Curve();

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
		/**** md5 signature: 0f23e749706437cef362026287716abb ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Assigns this constrained bspline curve to be tangential to vectors initialtangent and finaltangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization). <scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.

Parameters
----------
InitialTangent: gp_Vec2d
FinalTangent: gp_Vec2d
Scale: bool,optional
	default value is Standard_True

Returns
-------
None
") Load;
		void Load(const gp_Vec2d & InitialTangent, const gp_Vec2d & FinalTangent, const Standard_Boolean Scale = Standard_True);

		/****************** Load ******************/
		/**** md5 signature: f5bd9744b516b42691af1429f15fb3a9 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Assigns this constrained bspline curve to be tangential to vectors defined in the table tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. vectors in the table tangents are defined only if the flag given in the parallel table tangentflags is true: only these vectors are set as tangency constraints. <scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.

Parameters
----------
Tangents: TColgp_Array1OfVec2d
TangentFlags: TColStd_HArray1OfBoolean
Scale: bool,optional
	default value is Standard_True

Returns
-------
None
") Load;
		void Load(const TColgp_Array1OfVec2d & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags, const Standard_Boolean Scale = Standard_True);

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


%extend Geom2dAPI_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ClearTangents(self):
		pass
	}
};

/**********************************
* class Geom2dAPI_PointsToBSpline *
**********************************/
class Geom2dAPI_PointsToBSpline {
	public:
		/****************** Geom2dAPI_PointsToBSpline ******************/
		/**** md5 signature: 37f5e5ef14db831b4c1f14c10abd6e48 ****/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "Constructs an empty approximation algorithm. use an init function to define and build the bspline curve.

Returns
-------
None
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline();

		/****************** Geom2dAPI_PointsToBSpline ******************/
		/**** md5 signature: 830d3938863063c3ae0bd0e19d46d2d6 ****/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
Points: TColgp_Array1OfPnt2d
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-6

Returns
-------
None
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		/**** md5 signature: 58a92343185d22f3ab354500f277e067 ****/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. of coordinates : //! x = x0 + dx * (i-yvalues.lower()) y = yvalues(i) //! with i in the range yvalues.lower(), yvalues.upper() //! the bspline will be parametrized from t = x0 to x0 + dx * (yvalues.upper() - yvalues.lower()) //! and will satisfy x(t) = t //! the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
YValues: TColStd_Array1OfReal
X0: float
DX: float
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-6

Returns
-------
None
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColStd_Array1OfReal & YValues, const Standard_Real X0, const Standard_Real DX, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		/**** md5 signature: ffd4c32899b0798f37f300c7c11ce76b ****/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
Points: TColgp_Array1OfPnt2d
ParType: Approx_ParametrizationType
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		/**** md5 signature: 38f4cc503788ef04ecb6b56426e8ab0c ****/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point, which parameters are given by the array <parameters>. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
Points: TColgp_Array1OfPnt2d
Parameters: TColStd_Array1OfReal
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		/**** md5 signature: 1f5e05b5f16b30a46e47882cbed57fbb ****/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point using variational smoothing algorithm, which tries to minimize additional criterium: weight1*curvelength + weight2*curvature + weight3*torsion.

Parameters
----------
Points: TColgp_Array1OfPnt2d
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
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Curve ******************/
		/**** md5 signature: c8126eab6a406e6375cef128d14447d1 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the approximate bspline curve.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve;
		const opencascade::handle<Geom2d_BSplineCurve> & Curve();

		/****************** Init ******************/
		/**** md5 signature: 6ca3783005f594fec489fa91fab16d07 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
Points: TColgp_Array1OfPnt2d
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-6

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****************** Init ******************/
		/**** md5 signature: d1f1fe186fd7fcfe0d0ab51721cd9f86 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. of coordinates : //! x = x0 + dx * (i-yvalues.lower()) y = yvalues(i) //! with i in the range yvalues.lower(), yvalues.upper() //! the bspline will be parametrized from t = x0 to x0 + dx * (yvalues.upper() - yvalues.lower()) //! and will satisfy x(t) = t //! the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
YValues: TColStd_Array1OfReal
X0: float
DX: float
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-6

Returns
-------
None
") Init;
		void Init(const TColStd_Array1OfReal & YValues, const Standard_Real X0, const Standard_Real DX, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****************** Init ******************/
		/**** md5 signature: 8f56492cb28274fe7d59263eedd837b6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
Points: TColgp_Array1OfPnt2d
ParType: Approx_ParametrizationType
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: dccd9fb501307ee3968c5149631048a3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point, which parameters are given by the array <parameters>. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol2d.

Parameters
----------
Points: TColgp_Array1OfPnt2d
Parameters: TColStd_Array1OfReal
DegMin: int,optional
	default value is 3
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****************** Init ******************/
		/**** md5 signature: ce994358c4ead47ddeae1a6d0064f3fc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point using variational smoothing algorithm, which tries to minimize additional criterium: weight1*curvelength + weight2*curvature + weight3*torsion.

Parameters
----------
Points: TColgp_Array1OfPnt2d
Weight1: float
Weight2: float
Weight3: float
DegMax: int,optional
	default value is 8
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Tol2D: float,optional
	default value is 1.0e-3

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

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


%extend Geom2dAPI_PointsToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Geom2dAPI_ProjectPointOnCurve *
**************************************/
class Geom2dAPI_ProjectPointOnCurve {
	public:
		/****************** Geom2dAPI_ProjectPointOnCurve ******************/
		/**** md5 signature: 00b869ffe6e5cde56143f245901cc73f ****/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "Constructs an empty projector algorithm. use an init function to define the point and the curve on which it is going to work.

Returns
-------
None
") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve();

		/****************** Geom2dAPI_ProjectPointOnCurve ******************/
		/**** md5 signature: 2a8697c5853111ca52cc2ff95f60a788 ****/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "Create the projection of a point <p> on a curve <curve>.

Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve

Returns
-------
None
") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve);

		/****************** Geom2dAPI_ProjectPointOnCurve ******************/
		/**** md5 signature: 2a966d6fa7adafea65c220fc5142a177 ****/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "Create the projection of a point <p> on a curve <curve> limited by the two points of parameter umin and usup. warning use the function nbpoints to obtain the number of solutions. if projection fails, nbpoints returns 0.

Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve
Umin: float
Usup: float

Returns
-------
None
") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** Distance ******************/
		/**** md5 signature: 37e7953cf025135cd465c5cdf9b17da9 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the point and its computed orthogonal projection on the curve. index is a number of computed projected point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		/**** md5 signature: 37af5c9efb51737c22aa348e6a3ceb1b ****/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

Returns
-------
Extrema_ExtPC2d
") Extrema;
		const Extrema_ExtPC2d & Extrema();

		/****************** Init ******************/
		/**** md5 signature: b7c760cd0a5800e0fff6c3a0ccbf56ea ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments, and computes the orthogonal projections of a point <p> on a curve <curve>.

Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve

Returns
-------
None
") Init;
		void Init(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve);

		/****************** Init ******************/
		/**** md5 signature: 88842ac6a9c774f96727660f342b896a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments, and computes the orthogonal projections of the point p onto the portion of the curve curve limited by the two points of parameter umin and usup.

Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve
Umin: float
Usup: float

Returns
-------
None
") Init;
		void Init(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** LowerDistance ******************/
		/**** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ****/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the point and its nearest orthogonal projection on the curve. exceptions stdfail_notdone if this algorithm fails.

Returns
-------
float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameter ******************/
		/**** md5 signature: d92357b64b8dcbaeedf932cd195aa800 ****/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "Returns the parameter on the curve of the nearest orthogonal projection of the point. exceptions stdfail_notdone if this algorithm fails.

Returns
-------
float
") LowerDistanceParameter;
		Standard_Real LowerDistanceParameter();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return the number of of computed orthogonal projectionn points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NearestPoint ******************/
		/**** md5 signature: cabb3a250e83e793f9286cffa3acff32 ****/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Returns the nearest orthogonal projection of the point on the curve. exceptions stdfail_notdone if this algorithm fails.

Returns
-------
gp_Pnt2d
") NearestPoint;
		gp_Pnt2d NearestPoint();

		/****************** Parameter ******************/
		/**** md5 signature: 82ceab80f2b18ab921fa91f907001d9f ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve of a point which is the orthogonal projection. index is a number of a computed projected point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

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
		%feature("autodoc", "Returns the parameter on the curve of a point which is the orthogonal projection. index is a number of a computed projected point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
U: float
") Parameter;
		void Parameter(const Standard_Integer Index, Standard_Real &OutValue);

		/****************** Point ******************/
		/**** md5 signature: dfa31b44e58975a6577c15284df2704c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the orthogonal projection on the curve. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

};


%extend Geom2dAPI_ProjectPointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
