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
#include<Extrema_module.hxx>
#include<Geom2d_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Extrema.i
%import Geom2d.i
%import gp.i
%import Geom2dInt.i
%import TColgp.i
%import TColStd.i
%import GeomAbs.i
%import Approx.i
/* public enums */
/* end public enums declaration */

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
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
	:param Index:
	:type Index: int
	:rtype: float") Distance;
		Standard_Real Distance (const Standard_Integer Index);

		/****************** Extrema ******************/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", ":rtype: Extrema_ExtCC2d") Extrema;
		const Extrema_ExtCC2d & Extrema ();

		/****************** Geom2dAPI_ExtremaCurveCurve ******************/
		%feature("compactdefaultargs") Geom2dAPI_ExtremaCurveCurve;
		%feature("autodoc", "* Computes the extrema between - the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:param U1min:
	:type U1min: float
	:param U1max:
	:type U1max: float
	:param U2min:
	:type U2min: float
	:param U2max:
	:type U2max: float
	:rtype: None") Geom2dAPI_ExtremaCurveCurve;
		 Geom2dAPI_ExtremaCurveCurve (const opencascade::handle<Geom2d_Curve> & C1,const opencascade::handle<Geom2d_Curve> & C2,const Standard_Real U1min,const Standard_Real U1max,const Standard_Real U2min,const Standard_Real U2max);

		/****************** LowerDistance ******************/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "* Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.
	:rtype: float") LowerDistance;
		Standard_Real LowerDistance ();

		/****************** LowerDistanceParameters ******************/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "* Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "* Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.
	:rtype: int") NbExtrema;
		Standard_Integer NbExtrema ();

		/****************** NearestPoints ******************/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "* Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") NearestPoints;
		void NearestPoints (gp_Pnt2d & P1,gp_Pnt2d & P2);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
	:param Index:
	:type Index: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "* Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.
	:param Index:
	:type Index: int
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Points;
		void Points (const Standard_Integer Index,gp_Pnt2d & P1,gp_Pnt2d & P2);

		/****************** operator Standard_Integer ******************/
		%feature("compactdefaultargs") operator Standard_Integer;
		%feature("autodoc", ":rtype:") operator Standard_Integer;
		 operator Standard_Integer ();

		/****************** operator Standard_Real ******************/
		%feature("compactdefaultargs") operator Standard_Real;
		%feature("autodoc", ":rtype:") operator Standard_Real;
		 operator Standard_Real ();

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
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "* Create an empty intersector. Use the function Init for further initialization of the intersection algorithm by curves or curve.
	:rtype: None") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve ();

		/****************** Geom2dAPI_InterCurveCurve ******************/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "* Creates an object and computes the intersections between the curves C1 and C2.
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:param Tol: default value is 1.0e-6
	:type Tol: float
	:rtype: None") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve (const opencascade::handle<Geom2d_Curve> & C1,const opencascade::handle<Geom2d_Curve> & C2,const Standard_Real Tol = 1.0e-6);

		/****************** Geom2dAPI_InterCurveCurve ******************/
		%feature("compactdefaultargs") Geom2dAPI_InterCurveCurve;
		%feature("autodoc", "* Creates an object and computes self-intersections of the curve C1. Tolerance value Tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. In case of a tangential intersection, Tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than Tol. Warning Use functions NbPoints and NbSegments to obtain the number of solutions. If the algorithm finds no intersections NbPoints and NbSegments return 0.
	:param C1:
	:type C1: Geom2d_Curve
	:param Tol: default value is 1.0e-6
	:type Tol: float
	:rtype: None") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve (const opencascade::handle<Geom2d_Curve> & C1,const Standard_Real Tol = 1.0e-6);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes an algorithm with the given arguments and computes the intersections between the curves C1. and C2.
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:param Tol: default value is 1.0e-6
	:type Tol: float
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom2d_Curve> & C1,const opencascade::handle<Geom2d_Curve> & C2,const Standard_Real Tol = 1.0e-6);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes an algorithm with the given arguments and computes the self-intersections of the curve C1. Tolerance value Tol, defaulted to 1.0e-6, defines the precision of computing the intersection points. In case of a tangential intersection, Tol also defines the size of intersection segments (limited portions of the curves) where the distance between all points from two curves (or a curve in case of self-intersection) is less than Tol. Warning Use functions NbPoints and NbSegments to obtain the number of solutions. If the algorithm finds no intersections NbPoints and NbSegments return 0.
	:param C1:
	:type C1: Geom2d_Curve
	:param Tol: default value is 1.0e-6
	:type Tol: float
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom2d_Curve> & C1,const Standard_Real Tol = 1.0e-6);

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "* return the algorithmic object from Intersection.
	:rtype: Geom2dInt_GInter") Intersector;
		const Geom2dInt_GInter & Intersector ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection-points in case of cross intersections. NbPoints returns 0 if no intersections were found.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* Returns the number of tangential intersections. NbSegments returns 0 if no intersections were found
	:rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point of index Index. Intersection points are computed in case of cross intersections with a precision equal to the tolerance value assigned at the time of construction or in the function Init (this value is defaulted to 1.0e-6). Exceptions Standard_OutOfRange if index is not in the range [ 1,NbPoints ], where NbPoints is the number of computed intersection points
	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d") Point;
		gp_Pnt2d Point (const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Use this syntax only to get solutions of tangential intersection between two curves. Output values Curve1 and Curve2 are the intersection segments on the first curve and on the second curve accordingly. Parameter Index defines a number of computed solution. An intersection segment is a portion of an initial curve limited by two points. The distance from each point of this segment to the other curve is less or equal to the tolerance value assigned at the time of construction or in function Init (this value is defaulted to 1.0e-6). Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbSegments ], where NbSegments is the number of computed tangential intersections. Standard_NullObject if the algorithm is initialized for the computing of self-intersections on a curve.
	:param Index:
	:type Index: int
	:param Curve1:
	:type Curve1: Geom2d_Curve
	:param Curve2:
	:type Curve2: Geom2d_Curve
	:rtype: None") Segment;
		void Segment (const Standard_Integer Index,opencascade::handle<Geom2d_Curve> & Curve1,opencascade::handle<Geom2d_Curve> & Curve2);

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
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the computed BSpline curve. Raises StdFail_NotDone if the interpolation fails.
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Curve;
		const opencascade::handle<Geom2d_BSplineCurve> & Curve ();

		/****************** Geom2dAPI_Interpolate ******************/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "* Tolerance is to check if the points are not too close to one an other It is also used to check if the tangent vector is not too small. There should be at least 2 points if PeriodicFlag is True then the curve will be periodic.
	:param Points:
	:type Points: TColgp_HArray1OfPnt2d
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate (const opencascade::handle<TColgp_HArray1OfPnt2d> & Points,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);

		/****************** Geom2dAPI_Interpolate ******************/
		%feature("compactdefaultargs") Geom2dAPI_Interpolate;
		%feature("autodoc", "* if PeriodicFlag is True then the curve will be periodic Warning: There should be as many parameters as there are points except if PeriodicFlag is True : then there should be one more parameter to close the curve
	:param Points:
	:type Points: TColgp_HArray1OfPnt2d
	:param Parameters:
	:type Parameters: TColStd_HArray1OfReal
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate (const opencascade::handle<TColgp_HArray1OfPnt2d> & Points,const opencascade::handle<TColStd_HArray1OfReal> & Parameters,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns true if the constrained BSpline curve is successfully constructed. Note: in this case, the result is given by the function Curve.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Assigns this constrained BSpline curve to be tangential to vectors InitialTangent and FinalTangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization). <Scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.
	:param InitialTangent:
	:type InitialTangent: gp_Vec2d
	:param FinalTangent:
	:type FinalTangent: gp_Vec2d
	:param Scale: default value is Standard_True
	:type Scale: bool
	:rtype: None") Load;
		void Load (const gp_Vec2d & InitialTangent,const gp_Vec2d & FinalTangent,const Standard_Boolean Scale = Standard_True);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Assigns this constrained BSpline curve to be tangential to vectors defined in the table Tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. Vectors in the table Tangents are defined only if the flag given in the parallel table TangentFlags is true: only these vectors are set as tangency constraints. <Scale> - boolean flag defining whether tangent vectors are to be scaled according to derivatives of lagrange interpolation.
	:param Tangents:
	:type Tangents: TColgp_Array1OfVec2d
	:param TangentFlags:
	:type TangentFlags: TColStd_HArray1OfBoolean
	:param Scale: default value is Standard_True
	:type Scale: bool
	:rtype: None") Load;
		void Load (const TColgp_Array1OfVec2d & Tangents,const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags,const Standard_Boolean Scale = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the constrained BSpline curve. Use the function IsDone to verify that the computation is successful, and then the function Curve to obtain the result.
	:rtype: None") Perform;
		void Perform ();

};


%extend Geom2dAPI_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dAPI_PointsToBSpline *
**********************************/
class Geom2dAPI_PointsToBSpline {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the approximate BSpline Curve
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Curve;
		const opencascade::handle<Geom2d_BSplineCurve> & Curve ();

		/****************** Geom2dAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "* Constructs an empty approximation algorithm. Use an Init function to define and build the BSpline curve.
	:rtype: None") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline ();

		/****************** Geom2dAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-6
	:type Tol2D: float
	:rtype: None") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point. Of coordinates : //! X = X0 + DX * (i-YValues.Lower()) Y = YValues(i) //! With i in the range YValues.Lower(), YValues.Upper() //! The BSpline will be parametrized from t = X0 to X0 + DX * (YValues.Upper() - YValues.Lower()) //! And will satisfy X(t) = t //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param YValues:
	:type YValues: TColStd_Array1OfReal
	:param X0:
	:type X0: float
	:param DX:
	:type DX: float
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-6
	:type Tol2D: float
	:rtype: None") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColStd_Array1OfReal & YValues,const Standard_Real X0,const Standard_Real DX,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-3
	:type Tol2D: float
	:rtype: None") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-3
	:type Tol2D: float
	:rtype: None") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);

		/****************** Geom2dAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") Geom2dAPI_PointsToBSpline;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param Weight1:
	:type Weight1: float
	:param Weight2:
	:type Weight2: float
	:param Weight3:
	:type Weight3: float
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-6
	:type Tol2D: float
	:rtype: None") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point. Of coordinates : //! X = X0 + DX * (i-YValues.Lower()) Y = YValues(i) //! With i in the range YValues.Lower(), YValues.Upper() //! The BSpline will be parametrized from t = X0 to X0 + DX * (YValues.Upper() - YValues.Lower()) //! And will satisfy X(t) = t //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param YValues:
	:type YValues: TColStd_Array1OfReal
	:param X0:
	:type X0: float
	:param DX:
	:type DX: float
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-6
	:type Tol2D: float
	:rtype: None") Init;
		void Init (const TColStd_Array1OfReal & YValues,const Standard_Real X0,const Standard_Real DX,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-3
	:type Tol2D: float
	:rtype: None") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol2D
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-3
	:type Tol2D: float
	:rtype: None") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion
	:param Points:
	:type Points: TColgp_Array1OfPnt2d
	:param Weight1:
	:type Weight1: float
	:param Weight2:
	:type Weight2: float
	:param Weight3:
	:type Weight3: float
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol2D: default value is 1.0e-3
	:type Tol2D: float
	:rtype: None") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

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
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between the point and its computed orthogonal projection on the curve. Index is a number of computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
	:param Index:
	:type Index: int
	:rtype: float") Distance;
		Standard_Real Distance (const Standard_Integer Index);

		/****************** Extrema ******************/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "* return the algorithmic object from Extrema
	:rtype: Extrema_ExtPC2d") Extrema;
		const Extrema_ExtPC2d & Extrema ();

		/****************** Geom2dAPI_ProjectPointOnCurve ******************/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "* Constructs an empty projector algorithm. Use an Init function to define the point and the curve on which it is going to work.
	:rtype: None") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve ();

		/****************** Geom2dAPI_ProjectPointOnCurve ******************/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "* Create the projection of a point <P> on a curve <Curve>
	:param P:
	:type P: gp_Pnt2d
	:param Curve:
	:type Curve: Geom2d_Curve
	:rtype: None") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve (const gp_Pnt2d & P,const opencascade::handle<Geom2d_Curve> & Curve);

		/****************** Geom2dAPI_ProjectPointOnCurve ******************/
		%feature("compactdefaultargs") Geom2dAPI_ProjectPointOnCurve;
		%feature("autodoc", "* Create the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup. Warning Use the function NbPoints to obtain the number of solutions. If projection fails, NbPoints returns 0.
	:param P:
	:type P: gp_Pnt2d
	:param Curve:
	:type Curve: Geom2d_Curve
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:rtype: None") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve (const gp_Pnt2d & P,const opencascade::handle<Geom2d_Curve> & Curve,const Standard_Real Umin,const Standard_Real Usup);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this algorithm with the given arguments, and computes the orthogonal projections of a point <P> on a curve <Curve>
	:param P:
	:type P: gp_Pnt2d
	:param Curve:
	:type Curve: Geom2d_Curve
	:rtype: None") Init;
		void Init (const gp_Pnt2d & P,const opencascade::handle<Geom2d_Curve> & Curve);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this algorithm with the given arguments, and computes the orthogonal projections of the point P onto the portion of the curve Curve limited by the two points of parameter Umin and Usup.
	:param P:
	:type P: gp_Pnt2d
	:param Curve:
	:type Curve: Geom2d_Curve
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:rtype: None") Init;
		void Init (const gp_Pnt2d & P,const opencascade::handle<Geom2d_Curve> & Curve,const Standard_Real Umin,const Standard_Real Usup);

		/****************** LowerDistance ******************/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "* Computes the distance between the point and its nearest orthogonal projection on the curve. Exceptions StdFail_NotDone if this algorithm fails.
	:rtype: float") LowerDistance;
		Standard_Real LowerDistance ();

		/****************** LowerDistanceParameter ******************/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "* Returns the parameter on the curve of the nearest orthogonal projection of the point. Exceptions StdFail_NotDone if this algorithm fails.
	:rtype: float") LowerDistanceParameter;
		Standard_Real LowerDistanceParameter ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* return the number of of computed orthogonal projectionn points.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NearestPoint ******************/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "* Returns the nearest orthogonal projection of the point on the curve. Exceptions StdFail_NotDone if this algorithm fails.
	:rtype: gp_Pnt2d") NearestPoint;
		gp_Pnt2d NearestPoint ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter on the curve of a point which is the orthogonal projection. Index is a number of a computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
	:param Index:
	:type Index: int
	:rtype: float") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter on the curve of a point which is the orthogonal projection. Index is a number of a computed projected point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points
	:param Index:
	:type Index: int
	:param U:
	:type U: float
	:rtype: None") Parameter;
		void Parameter (const Standard_Integer Index,Standard_Real &OutValue);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the orthogonal projection on the curve. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d") Point;
		gp_Pnt2d Point (const Standard_Integer Index);

		/****************** operator Standard_Integer ******************/
		%feature("compactdefaultargs") operator Standard_Integer;
		%feature("autodoc", ":rtype:") operator Standard_Integer;
		 operator Standard_Integer ();

		/****************** operator Standard_Real ******************/
		%feature("compactdefaultargs") operator Standard_Real;
		%feature("autodoc", ":rtype:") operator Standard_Real;
		 operator Standard_Real ();

		/****************** operator gp_Pnt2d ******************/
		%feature("compactdefaultargs") operator gp_Pnt2d;
		%feature("autodoc", ":rtype:") operator gp_Pnt2d;
		 operator gp_Pnt2d ();

};


%extend Geom2dAPI_ProjectPointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
