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
		/****** md5 signature: 3043f157df1ec6e433b1cf10c1b6a0e7 ******/
		%feature("compactdefaultargs") Geom2dAPI_ExtremaCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
U1min: double
U1max: double
U2min: double
U2max: double

Return
-------
None

Description
-----------
Computes the extrema between - the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
") Geom2dAPI_ExtremaCurveCurve;
		 Geom2dAPI_ExtremaCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const double U1min, const double U1max, const double U2min, const double U2max);

		/****** Geom2dAPI_ExtremaCurveCurve::Distance ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::LowerDistanceParameters ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::NbExtrema ******/
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

		/****** Geom2dAPI_ExtremaCurveCurve::Points ******/
		/****** md5 signature: b7f0f713de4480891178092a36cb6f10 ******/
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
		void Points(const int Index, gp_Pnt2d & P1, gp_Pnt2d & P2);

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
		/****** md5 signature: 574bb274656880d344c11615bb67786e ******/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
Tol: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Creates an object and computes the intersections between the curves C1 and C2.
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const double Tol = 1.0e-6);

		/****** Geom2dAPI_InterCurveCurve::Geom2dAPI_InterCurveCurve ******/
		/****** md5 signature: e117ab6568080770b57d33e270403daf ******/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
Tol: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Creates an object and computes self-intersections of the curve C1. Tolerance value Tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. In case of a tangential intersection, Tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than Tol. Warning Use functions NbPoints and NbSegments to obtain the number of solutions. If the algorithm finds no intersections NbPoints and NbSegments return 0.
") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve(const opencascade::handle<Geom2d_Curve> & C1, const double Tol = 1.0e-6);

		/****** Geom2dAPI_InterCurveCurve::Init ******/
		/****** md5 signature: 751970c15195902cb81aaedcb1e3f1c0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve
Tol: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Initializes an algorithm with the given arguments and computes the intersections between the curves C1. and C2.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const double Tol = 1.0e-6);

		/****** Geom2dAPI_InterCurveCurve::Init ******/
		/****** md5 signature: d973f01f2a848ca4d9a8650827ec0b5a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
Tol: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Initializes an algorithm with the given arguments and computes the self-intersections of the curve C1. Tolerance value Tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. In case of a tangential intersection, Tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than Tol. Warning Use functions NbPoints and NbSegments to obtain the number of solutions. If the algorithm finds no intersections NbPoints and NbSegments return 0.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C1, const double Tol = 1.0e-6);

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
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection-points in case of cross intersections. NbPoints returns 0 if no intersections were found.
") NbPoints;
		int NbPoints();

		/****** Geom2dAPI_InterCurveCurve::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of tangential intersections. NbSegments returns 0 if no intersections were found.
") NbSegments;
		int NbSegments();

		/****** Geom2dAPI_InterCurveCurve::Point ******/
		/****** md5 signature: 995ca978d5adc3e56086d9fc48a6c3b8 ******/
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
		gp_Pnt2d Point(const int Index);

		/****** Geom2dAPI_InterCurveCurve::Segment ******/
		/****** md5 signature: 9f0418844671c4792556452039155305 ******/
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
		void Segment(const int Index, opencascade::handle<Geom2d_Curve> & Curve1, opencascade::handle<Geom2d_Curve> & Curve2);

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
		/****** md5 signature: 3e774a7ac874f5d85d7893a0f5694413 ******/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt2d
PeriodicFlag: bool
Tolerance: double

Return
-------
None

Description
-----------
Tolerance is to check if the points are not too close to one an other It is also used to check if the tangent vector is not too small. There should be at least 2 points if PeriodicFlag is True then the curve will be periodic.
") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt2d> & Points, const bool PeriodicFlag, const double Tolerance);

		/****** Geom2dAPI_Interpolate::Geom2dAPI_Interpolate ******/
		/****** md5 signature: a8409fd68105cc757e52a521785dbfc0 ******/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_HArray1OfPnt2d
Parameters: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: double

Return
-------
None

Description
-----------
if PeriodicFlag is True then the curve will be periodic Warning: There should be as many parameters as there are points except if PeriodicFlag is True: then there should be one more parameter to close the curve.
") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt2d> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const bool PeriodicFlag, const double Tolerance);

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

		/****** Geom2dAPI_Interpolate::Load ******/
		/****** md5 signature: 3bf685f1ec0b3ff64a20034624374e1d ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
InitialTangent: gp_Vec2d
FinalTangent: gp_Vec2d
Scale: bool (optional, default to true)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors InitialTangent and FinalTangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization). <Scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.
") Load;
		void Load(const gp_Vec2d & InitialTangent, const gp_Vec2d & FinalTangent, const bool Scale = true);

		/****** Geom2dAPI_Interpolate::Load ******/
		/****** md5 signature: 0639eff2dad6cba436cca4dfa677d0ba ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Tangents: TColgp_Array1OfVec2d
TangentFlags: TColStd_HArray1OfBoolean
Scale: bool (optional, default to true)

Return
-------
None

Description
-----------
Assigns this constrained BSpline curve to be tangential to vectors defined in the table Tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. Vectors in the table Tangents are defined only if the flag given in the parallel table TangentFlags is true: only these vectors are set as tangency constraints. <Scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.
") Load;
		void Load(const TColgp_Array1OfVec2d & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags, const bool Scale = true);

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
		/****** md5 signature: b25f08bbc9beb682019e8783f31bf509 ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: f8aef268849dbbca8f4afda11ae3897d ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
YValues: TColStd_Array1OfReal
X0: double
DX: double
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. Of coordinates: //! X = X0 + DX * (i-YValues.Lower()) Y = YValues(i) //! With i in the range YValues.Lower(), YValues.Upper() //! The BSpline will be parametrized from t = X0 to X0 + DX * (YValues.Upper() - YValues.Lower()) //! And will satisfy X(t) = t //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColStd_Array1OfReal & YValues, const double X0, const double DX, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 208525b64287ae0fa02495ad01158abb ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const Approx_ParametrizationType ParType, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 5870ff88f848ac9852b02ea362b7718b ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const TColStd_Array1OfReal & Parameters, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Geom2dAPI_PointsToBSpline ******/
		/****** md5 signature: 6a0cb0098d7b9ac5d2fa09e0b1b58020 ******/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
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
") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d & Points, const double Weight1, const double Weight2, const double Weight3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol3D = 1.0e-3);

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
		/****** md5 signature: f0a841efc2e0be3d0e956e18e8eb4d2a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 3cd75176178c0c5dbe64939058eb3f45 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
YValues: TColStd_Array1OfReal
X0: double
DX: double
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. Of coordinates: //! X = X0 + DX * (i-YValues.Lower()) Y = YValues(i) //! With i in the range YValues.Lower(), YValues.Upper() //! The BSpline will be parametrized from t = X0 to X0 + DX * (YValues.Upper() - YValues.Lower()) //! And will satisfy X(t) = t //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColStd_Array1OfReal & YValues, const double X0, const double DX, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-6);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 64039c0a97f28229db0f8aca9d395191 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
ParType: Approx_ParametrizationType
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const Approx_ParametrizationType ParType, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 0b035bf1a8afa446a8f97a7aae55e19d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
Parameters: TColStd_Array1OfReal
DegMin: int (optional, default to 3)
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const TColStd_Array1OfReal & Parameters, const int DegMin = 3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::Init ******/
		/****** md5 signature: 2909d6a3f917f037336e8abad46db4b6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt2d
Weight1: double
Weight2: double
Weight3: double
DegMax: int (optional, default to 8)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Tol2D: double (optional, default to 1.0e-3)

Return
-------
None

Description
-----------
Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion.
") Init;
		void Init(const TColgp_Array1OfPnt2d & Points, const double Weight1, const double Weight2, const double Weight3, const int DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const double Tol2D = 1.0e-3);

		/****** Geom2dAPI_PointsToBSpline::IsDone ******/
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
		/****** md5 signature: e62aebb059de7c3b6bd6d04b2ee9933c ******/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve
Umin: double
Usup: double

Return
-------
None

Description
-----------
Create the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup. Warning Use the function NbPoints to obtain the number of solutions. If projection fails, NbPoints returns 0.
") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve, const double Umin, const double Usup);

		/****** Geom2dAPI_ProjectPointOnCurve::Distance ******/
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
Computes the distance between the point and its computed orthogonal projection on the curve. Index is a number of computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Distance;
		double Distance(const int Index);

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
		/****** md5 signature: 9675d65948bb8596ff77682c43c852b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Curve: Geom2d_Curve
Umin: double
Usup: double

Return
-------
None

Description
-----------
Initializes this algorithm with the given arguments, and computes the orthogonal projections of the point P onto the portion of the curve Curve limited by the two points of parameter Umin and Usup.
") Init;
		void Init(const gp_Pnt2d & P, const opencascade::handle<Geom2d_Curve> & Curve, const double Umin, const double Usup);

		/****** Geom2dAPI_ProjectPointOnCurve::LowerDistance ******/
		/****** md5 signature: 9bdea8626c0ad11eceaa6b7d1fe4c47b ******/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the distance between the point and its nearest orthogonal projection on the curve. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistance;
		double LowerDistance();

		/****** Geom2dAPI_ProjectPointOnCurve::LowerDistanceParameter ******/
		/****** md5 signature: 995a7a6802398fc73878dc586c07f02b ******/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the curve of the nearest orthogonal projection of the point. Exceptions StdFail_NotDone if this algorithm fails.
") LowerDistanceParameter;
		double LowerDistanceParameter();

		/****** Geom2dAPI_ProjectPointOnCurve::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
return the number of of computed orthogonal projectionn points.
") NbPoints;
		int NbPoints();

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
Returns the parameter on the curve of a point which is the orthogonal projection. Index is a number of a computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameter;
		double Parameter(const int Index);

		/****** Geom2dAPI_ProjectPointOnCurve::Parameter ******/
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
Returns the parameter on the curve of a point which is the orthogonal projection. Index is a number of a computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
") Parameter;
		void Parameter(const int Index, Standard_Real &OutValue);

		/****** Geom2dAPI_ProjectPointOnCurve::Point ******/
		/****** md5 signature: 995ca978d5adc3e56086d9fc48a6c3b8 ******/
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
		gp_Pnt2d Point(const int Index);

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
