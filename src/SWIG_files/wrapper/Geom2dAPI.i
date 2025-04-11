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
%define GEOM2DAPIDOCSTRING
"Geom2dAPI module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2dapi.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/************************************
* class Geom2dAPI_ExtremaCurveCurve *
************************************/
class Geom2dAPI_ExtremaCurveCurve {
	public:
		/****** Geom2dAPI_ExtremaCurveCurve::Geom2dAPI_ExtremaCurveCurve ******/
		/****** md5 signature: 8f2f31b9577dc2d995aebb74682e6a81 ******/
		%feature("compactdefaultargs") Geom2dAPI_ExtremaCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
U1min: float
U1max: float
U2min: float
U2max: float

Return
-------
None

Description
-----------
Computes the extrema between - the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") Geom2dAPI_ExtremaCurveCurve;
		 Geom2dAPI_ExtremaCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

		/****** Geom2dAPI_ExtremaCurveCurve::Distance ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::Extrema ******/
		/****** md5 signature: b1d6dfe7a95af8a82b7106fd7bcb56f9 ******/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return
-------
Extrema_ExtCC2d

Description
-----------
No available documentation.
") Extrema;
		const Extrema_ExtCC2d & Extrema();

		/****** Geom2dAPI_ExtremaCurveCurve::LowerDistance ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::LowerDistanceParameters ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::NbExtrema ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::NearestPoints ******/
		/****** md5 signature: d1cedc9a4b8798a784e5474f9d0aa977 ******/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
") NearestPoints;
		void NearestPoints(gp_Pnt2d & P1, gp_Pnt2d & P2);

		/****** Geom2dAPI_ExtremaCurveCurve::Parameters ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::Points ******/
		/****** md5 signature: e7ce8c9f5202ad3a50be862129fd5390 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
Index: int
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
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
		/****** Geom2dAPI_InterCurveCurve::Geom2dAPI_InterCurveCurve ******/
		/****** md5 signature: d3ab574ddf861c120b18e9c93d89c339 ******/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create an empty intersector. Use the function Init for further initialization of the intersection algorithm by curves or curve.
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve();

		/****** Geom2dAPI_InterCurveCurve::Geom2dAPI_InterCurveCurve ******/
		/****** md5 signature: 46b74a2815829c9dfa15b95e8e1ce241 ******/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
Tol: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Creates an object and computes the intersections between the curves C1 and C2.
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const Standard_Real Tol = 1.0e-6);

		/****** Geom2dAPI_InterCurveCurve::Geom2dAPI_InterCurveCurve ******/
		/****** md5 signature: 931286664b6e6aefcf2c51062461087c ******/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
Tol: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Creates an object and computes self-intersections of the curve C1. Tolerance value Tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. In case of a tangential intersection, Tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than Tol. Warning Use functions NbPoints and NbSegments to obtain the number of solutions. If the algorithm finds no intersections NbPoints and NbSegments return 0.
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const Standard_Real Tol = 1.0e-6);

		/****** Geom2dAPI_InterCurveCurve::Init ******/
		/****** md5 signature: 16764f90ec7716443cef53da1c6adea1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
Tol: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Initializes an algorithm with the given arguments and computes the intersections between the curves C1. and C2.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const Standard_Real Tol = 1.0e-6);

		/****** Geom2dAPI_InterCurveCurve::Init ******/
		/****** md5 signature: dcca515b62d5af999e8065406a32e82b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
Tol: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Initializes an algorithm with the given arguments and computes the self-intersections of the curve C1. Tolerance value Tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. In case of a tangential intersection, Tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than Tol. Warning Use functions NbPoints and NbSegments to obtain the number of solutions. If the algorithm finds no intersections NbPoints and NbSegments return 0.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C1, const Standard_Real Tol = 1.0e-6);

		/****** Geom2dAPI_InterCurveCurve::Intersector ******/
		/****** md5 signature: 4ebbf59c42ad801a63e34dfa17e19ef4 ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
Geom2dInt_GInter

Description
-----------
return the algorithmic object from Intersection.
") Intersector;
		const Geom2dInt_GInter & Intersector();

		/****** Geom2dAPI_InterCurveCurve::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection-points in case of cross intersections. NbPoints returns 0 if no intersections were found.
") NbPoints;
		Standard_Integer NbPoints();

		/****** Geom2dAPI_InterCurveCurve::NbSegments ******/
		/****** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of tangential intersections. NbSegments returns 0 if no intersections were found.
") NbSegments;
		Standard_Integer NbSegments();

		/****** Geom2dAPI_InterCurveCurve::Point ******/
		/****** md5 signature: dfa31b44e58975a6577c15284df2704c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the intersection point of index Index. Intersection points are computed in case of cross intersections with a precision equal to the tolerance value assigned at the time of construction or in the function Init (this value is defaulted to 1.0e-6). Exceptions Standard_OutOfRange if index is not in the range [ 1,NbPoints ], where NbPoints is the number of computed intersection points.
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****** Geom2dAPI_InterCurveCurve::Segment ******/
		/****** md5 signature: b37643f2678b364da2f6153ed330844f ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
Index: int
Curve1: Geom2d_Curve
Curve2: Geom2d_Curve

Return
-------
None

Description
-----------
Use this syntax only to get solutions of tangential intersection between two curves. Output values Curve1 and Curve2 are the intersection segments on the first curve and on the second curve accordingly. Parameter Index defines a number of computed solution. An intersection segment is a portion of an initial curve limited by two points. The distance from each point of this segment to the other curve is less or equal to the tolerance value assigned at the time of construction or in function Init (this value is defaulted to 1.0e-6). Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbSegments ], where NbSegments is the number of computed tangential intersections. Standard_NullObject if the algorithm is initialized for the computing of self-intersections on a curve.
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
		/****** Geom2dAPI_Interpolate::Geom2dAPI_Interpolate ******/
		/****** md5 signature: 49377e07923a612a4e586c2817e4aac7 ******/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt2d
PeriodicFlag: bool
Tolerance: float

Return
-------
None

Description
-----------
Tolerance is to check if the points are not too close to one an other It is also used to check if the tangent vector is not too small. There should be at least 2 points if PeriodicFlag is True then the curve will be periodic.
") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt2d> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****** Geom2dAPI_Interpolate::Geom2dAPI_Interpolate ******/
		/****** md5 signature: 2d0547cfca5a9782d47bfd0d341e2b99 ******/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt2d
Parameters: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: float

Return
-------
None

Description
-----------
if PeriodicFlag is True then the curve will be periodic Warning: There should be as many parameters as there are points except if PeriodicFlag is True: then there should be one more parameter to close the curve.
") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt2d> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****** Geom2dAPI_Interpolate::Curve ******/
		/****** md5 signature: c8126eab6a406e6375cef128d14447d1 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Returns the computed BSpline curve. Raises StdFail_NotDone if the interpolation fails.
") Curve;
		const opencascade::handle<Geom2d_BSplineCurve> & Curve();

		/****** Geom2dAPI_Interpolate::IsDone ******/
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

		/****** Geom2dAPI_Interpolate::Load ******/
		/****** md5 signature: 0f23e749706437cef362026287716abb ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
InitialTangent: gp_Vec2d
FinalTangent: gp_Vec2d
Scale: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors InitialTangent and FinalTangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization). <Scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.
") Load;
		void Load(const gp_Vec2d & InitialTangent, const gp_Vec2d & FinalTangent, const Standard_Boolean Scale = Standard_True);

		/****** Geom2dAPI_Interpolate::Load ******/
		/****** md5 signature: f5bd9744b516b42691af1429f15fb3a9 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Tangents: TColgp_Array1OfVec2d
TangentFlags: TColStd_HArray1OfBoolean
Scale: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors defined in the table Tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. Vectors in the table Tangents are defined only if the flag given in the parallel table TangentFlags is true: only these vectors are set as tangency constraints. <Scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.
") Load;
		void Load(const TColgp_Array1OfVec2d & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags, const Standard_Boolean Scale = Standard_True);

		/****** Geom2dAPI_Interpolate::Perform ******/
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
		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 37f5e5ef14db831b4c1f14c10abd6e48 ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty approximation algorithm. Use an Init function to define and build the BSpline curve.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline();

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 830d3938863063c3ae0bd0e19d46d2d6 ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 58a92343185d22f3ab354500f277e067 ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
YValues: TColStd_Array1OfReal
X0: float
DX: float
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. Of coordinates: //! X = X0 + DX * (i-YValues.Lower()) Y = YValues(i) //! With i in the range YValues.Lower(), YValues.Upper() //! The BSpline will be parametrized from t = X0 to X0 + DX * (YValues.Upper() - YValues.Lower()) //! And will satisfy X(t) = t //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColStd_Array1OfReal & YValues, const Standard_Real X0, const Standard_Real DX, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: ffd4c32899b0798f37f300c7c11ce76b ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 38f4cc503788ef04ecb6b56426e8ab0c ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 1f5e05b5f16b30a46e47882cbed57fbb ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
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
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Curve ******/
		/****** md5 signature: c8126eab6a406e6375cef128d14447d1 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Returns the approximate BSpline Curve.
") Curve;
		const opencascade::handle<Geom2d_BSplineCurve> & Curve();

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 6ca3783005f594fec489fa91fab16d07 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: d1f1fe186fd7fcfe0d0ab51721cd9f86 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
YValues: TColStd_Array1OfReal
X0: float
DX: float
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. Of coordinates: //! X = X0 + DX * (i-YValues.Lower()) Y = YValues(i) //! With i in the range YValues.Lower(), YValues.Upper() //! The BSpline will be parametrized from t = X0 to X0 + DX * (YValues.Upper() - YValues.Lower()) //! And will satisfy X(t) = t //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColStd_Array1OfReal & YValues, const Standard_Real X0, const Standard_Real DX, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 8f56492cb28274fe7d59263eedd837b6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: dccd9fb501307ee3968c5149631048a3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: ce994358c4ead47ddeae1a6d0064f3fc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
Weight1: float
Weight2: float
Weight3: float
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: float (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::IsDone ******/
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
		/****** Geom2dAPI_ProjectPointOnCurve::Geom2dAPI_ProjectPointOnCurve ******/
		/****** md5 signature: 00b869ffe6e5cde56143f245901cc73f ******/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty projector algorithm. Use an Init function to define the point and the curve on which it is going to work.
") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve();

		/****** Geom2dAPI_ProjectPointOnCurve::Geom2dAPI_ProjectPointOnCurve ******/
		/****** md5 signature: 2a8697c5853111ca52cc2ff95f60a788 ******/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve

Return
-------
None

Description
-----------
Create the projection of a point <P> on a curve <Curve>.
") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve);

		/****** Geom2dAPI_ProjectPointOnCurve::Geom2dAPI_ProjectPointOnCurve ******/
		/****** md5 signature: 2a966d6fa7adafea65c220fc5142a177 ******/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve
Umin: float
Usup: float

Return
-------
None

Description
-----------
Create the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup. Warning Use the function NbPoints to obtain the number of solutions. If projection fails, NbPoints returns 0.
") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****** Geom2dAPI_ProjectPointOnCurve::Distance ******/
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
Computes the distance between the point and its computed orthogonal projection on the curve. Index is a number of computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****** Geom2dAPI_ProjectPointOnCurve::Extrema ******/
		/****** md5 signature: 37af5c9efb51737c22aa348e6a3ceb1b ******/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return
-------
Extrema_ExtPC2d

Description
-----------
return the algorithmic object from Extrema.
") Extrema;
		const Extrema_ExtPC2d & Extrema();

		/****** Geom2dAPI_ProjectPointOnCurve::Init ******/
		/****** md5 signature: b7c760cd0a5800e0fff6c3a0ccbf56ea ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments, and computes the orthogonal projections of a point <P> on a curve <Curve>.
") Init;
		void Init(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve);

		/****** Geom2dAPI_ProjectPointOnCurve::Init ******/
		/****** md5 signature: 88842ac6a9c774f96727660f342b896a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve
Umin: float
Usup: float

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments, and computes the orthogonal projections of the point P onto the portion of the curve Curve limited by the two points of parameter Umin and Usup.
") Init;
		void Init(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****** Geom2dAPI_ProjectPointOnCurve::LowerDistance ******/
		/****** md5 signature: 9f0e68fdb00336442bc7528a9d585436 ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the distance between the point and its nearest orthogonal projection on the curve. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistance;
		Standard_Real LowerDistance();

		/****** Geom2dAPI_ProjectPointOnCurve::LowerDistanceParameter ******/
		/****** md5 signature: d92357b64b8dcbaeedf932cd195aa800 ******/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the curve of the nearest orthogonal projection of the point. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistanceParameter;
		Standard_Real LowerDistanceParameter();

		/****** Geom2dAPI_ProjectPointOnCurve::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
return the number of of computed orthogonal projectionn points.
") NbPoints;
		Standard_Integer NbPoints();

		/****** Geom2dAPI_ProjectPointOnCurve::NearestPoint ******/
		/****** md5 signature: cabb3a250e83e793f9286cffa3acff32 ******/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the nearest orthogonal projection of the point on the curve. Exceptions StdFail_NotDone if this algorithm fails.
") NearestPoint;
		gp_Pnt2d NearestPoint();

		/****** Geom2dAPI_ProjectPointOnCurve::Parameter ******/
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
Returns the parameter on the curve of a point which is the orthogonal projection. Index is a number of a computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****** Geom2dAPI_ProjectPointOnCurve::Parameter ******/
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
Returns the parameter on the curve of a point which is the orthogonal projection. Index is a number of a computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameter;
		void Parameter(const Standard_Integer Index, Standard_Real &OutValue);

		/****** Geom2dAPI_ProjectPointOnCurve::Point ******/
		/****** md5 signature: dfa31b44e58975a6577c15284df2704c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the orthogonal projection on the curve. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
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
/* class aliases */
%pythoncode {
}
