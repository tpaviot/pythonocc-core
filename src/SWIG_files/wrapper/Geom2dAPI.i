/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Geom2dAPI

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include Geom2dAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Geom2dAPI_ExtremaCurveCurve;
class Geom2dAPI_ExtremaCurveCurve {
	public:
		%feature("autodoc", "Args:
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)
	U1min(Quantity_Parameter)
	U1max(Quantity_Parameter)
	U2min(Quantity_Parameter)
	U2max(Quantity_Parameter)

Returns:
	None

Computes the extrema between  
-   the portion of the curve C1 limited by the two  
  points of parameter (U1min,U1max), and  
-   the portion of the curve C2 limited by the two  
  points of parameter (U2min,U2max).  
Warning  
Use the function NbExtrema to obtain the number  
of solutions. If this algorithm fails, NbExtrema returns 0.") Geom2dAPI_ExtremaCurveCurve;
		 Geom2dAPI_ExtremaCurveCurve (const Handle_Geom2d_Curve & C1,const Handle_Geom2d_Curve & C2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extrema computed by this algorithm.  
Note: if this algorithm fails, NbExtrema returns 0.") NbExtrema;
		Standard_Integer NbExtrema ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Integer;
		 operator Standard_Integer ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Returns the points P1 on the first curve and P2 on  
the second curve, which are the ends of the  
extremum of index Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Points;
		void Points (const Standard_Integer Index,gp_Pnt2d & P1,gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U1(Quantity_Parameter)
	U2(Quantity_Parameter)

Returns:
	None

Returns the parameters U1 of the point on the first  
curve and U2 of the point on the second curve, which  
are the ends of the extremum of index Index  
computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

Computes the distance between the end points of the  
extremum of index Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Returns the points P1 on the first curve and P2 on  
the second curve, which are the ends of the shortest  
extremum computed by this algorithm.  
Exceptions StdFail_NotDone if this algorithm fails.") NearestPoints;
		void NearestPoints (gp_Pnt2d & P1,gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	U1(Quantity_Parameter)
	U2(Quantity_Parameter)

Returns:
	None

Returns the parameters U1 of the point on the first  
curve and U2 of the point on the second curve, which  
are the ends of the shortest extremum computed by this algorithm.  
Exceptions  
StdFail_NotDone if this algorithm fails.") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Computes the distance between the end points of the  
shortest extremum computed by this algorithm.  
Exceptions - StdFail_NotDone if this algorithm fails.") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Real;
		 operator Standard_Real ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_ExtCC2d

No detailed docstring for this function.") Extrema;
		const Extrema_ExtCC2d & Extrema ();
};


%feature("shadow") Geom2dAPI_ExtremaCurveCurve::~Geom2dAPI_ExtremaCurveCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAPI_ExtremaCurveCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dAPI_InterCurveCurve;
class Geom2dAPI_InterCurveCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Create an empty intersector. Use the  
function Init for further initialization of the intersection  
algorithm by curves or curve.") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve ();
		%feature("autodoc", "Args:
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)
	Tol(Standard_Real)=1.0e-6

Returns:
	None

Creates an object and computes the  
intersections between the curves C1 and C2.") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve (const Handle_Geom2d_Curve & C1,const Handle_Geom2d_Curve & C2,const Standard_Real Tol = 1.0e-6);
		%feature("autodoc", "Args:
	C1(Handle_Geom2d_Curve)
	Tol(Standard_Real)=1.0e-6

Returns:
	None

Creates an object and computes self-intersections of the curve C1.  
  Tolerance value Tol, defaulted to 1.0e-6, defines the precision of  
computing the intersection points.  
In case of a tangential intersection, Tol also defines the  
size of intersection segments (limited portions of the curves)  
where the distance between all points from two curves (or a curve  
in case of self-intersection) is less than Tol.  
Warning  
Use functions NbPoints and NbSegments to obtain the number of  
solutions. If the algorithm finds no intersections NbPoints and  
NbSegments return 0.") Geom2dAPI_InterCurveCurve;
		 Geom2dAPI_InterCurveCurve (const Handle_Geom2d_Curve & C1,const Standard_Real Tol = 1.0e-6);
		%feature("autodoc", "Args:
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)
	Tol(Standard_Real)=1.0e-6

Returns:
	None

Initializes an algorithm with the  
given arguments and computes the intersections between the curves C1. and C2.") Init;
		void Init (const Handle_Geom2d_Curve & C1,const Handle_Geom2d_Curve & C2,const Standard_Real Tol = 1.0e-6);
		%feature("autodoc", "Args:
	C1(Handle_Geom2d_Curve)
	Tol(Standard_Real)=1.0e-6

Returns:
	None

Initializes an algorithm with the  
given arguments and computes the self-intersections of the curve C1.  
Tolerance value Tol, defaulted to 1.0e-6, defines the precision of  
computing the intersection points. In case of a tangential  
intersection, Tol also defines the size of intersection segments  
(limited portions of the curves) where the distance between all  
points from two curves (or a curve in case of self-intersection) is less than Tol.  
Warning  
Use functions NbPoints and NbSegments to obtain the number  
of solutions. If the algorithm finds no intersections NbPoints  
and NbSegments return 0.") Init;
		void Init (const Handle_Geom2d_Curve & C1,const Standard_Real Tol = 1.0e-6);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of intersection-points in case of cross intersections.  
       NbPoints returns 0 if no intersections were found.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt2d

Returns the intersection point of index Index.  
Intersection points are computed in case of cross intersections with a  
precision equal to the tolerance value assigned at the time of  
construction or in the function Init (this value is defaulted to 1.0e-6).  
Exceptions  
Standard_OutOfRange if index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of computed intersection points") Point;
		gp_Pnt2d Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of tangential intersections.  
NbSegments returns 0 if no intersections were found") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Curve1(Handle_Geom2d_Curve)
	Curve2(Handle_Geom2d_Curve)

Returns:
	None

Use this syntax only to get  
solutions of tangential intersection between two curves.  
Output values Curve1 and Curve2 are the intersection segments on the  
first curve and on the second curve accordingly. Parameter Index  
defines a number of computed solution.  
An intersection segment is a portion of an initial curve limited  
by two points. The distance from each point of this segment to the  
other curve is less or equal to the tolerance value assigned at the  
time of construction or in function Init (this value is defaulted to 1.0e-6).  
  Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbSegments ],  
where NbSegments is the number of computed tangential intersections.  
Standard_NullObject if the algorithm is initialized for the  
computing of self-intersections on a curve.") Segment;
		void Segment (const Standard_Integer Index,Handle_Geom2d_Curve & Curve1,Handle_Geom2d_Curve & Curve2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Curve1(Handle_Geom2d_Curve)

Returns:
	None

Use this syntax to get solutions of  
tangential intersections only in case of a self-intersected curve.  
Output value Curve1 is the intersection segment of the curve  
defined by number Index. An intersection segment is a  
portion of the initial curve limited by two points. The distance  
between each point of this segment to another portion of the curve is  
less or equal to the tolerance value assigned at the time of  
construction or in the function Init (this value is defaulted to 1.0e-6).  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbSegments ],  
where NbSegments is the number of computed tangential intersections.") Segment;
		void Segment (const Standard_Integer Index,Handle_Geom2d_Curve & Curve1);
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dInt_GInter

return the algorithmic object from Intersection.") Intersector;
		const Geom2dInt_GInter & Intersector ();
};


%feature("shadow") Geom2dAPI_InterCurveCurve::~Geom2dAPI_InterCurveCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAPI_InterCurveCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dAPI_Interpolate;
class Geom2dAPI_Interpolate {
	public:
		%feature("autodoc", "Args:
	Points(Handle_TColgp_HArray1OfPnt2d)
	PeriodicFlag(Standard_Boolean)
	Tolerance(Standard_Real)

Returns:
	None

Tolerance is to check if the points are not too close to one an other  
It is also used to check if the tangent vector is not too small.  
There should be at least 2 points  
if PeriodicFlag is True then the curve will be periodic.") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate (const Handle_TColgp_HArray1OfPnt2d & Points,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Points(Handle_TColgp_HArray1OfPnt2d)
	Parameters(Handle_TColStd_HArray1OfReal)
	PeriodicFlag(Standard_Boolean)
	Tolerance(Standard_Real)

Returns:
	None

if PeriodicFlag is True then the curve will be periodic  
 Warning:  
 There should be as many parameters as there are points  
 except if PeriodicFlag is True : then there should be one more  
 parameter to close the curve") Geom2dAPI_Interpolate;
		 Geom2dAPI_Interpolate (const Handle_TColgp_HArray1OfPnt2d & Points,const Handle_TColStd_HArray1OfReal & Parameters,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	InitialTangent(gp_Vec2d)
	FinalTangent(gp_Vec2d)

Returns:
	None

Assigns this constrained BSpline curve to be  
tangential to vectors InitialTangent and FinalTangent  
  at its first and last points respectively (i.e.  
  the first and last points of the table of  
  points through which the curve passes, as  
  defined at the time of initialization).") Load;
		void Load (const gp_Vec2d & InitialTangent,const gp_Vec2d & FinalTangent);
		%feature("autodoc", "Args:
	Tangents(TColgp_Array1OfVec2d)
	TangentFlags(Handle_TColStd_HArray1OfBoolean)

Returns:
	None

Assigns this constrained BSpline curve to be  
tangential to vectors defined in the table Tangents,  
  which is parallel to the table of points  
  through which the curve passes, as  
  defined at the time of initialization. Vectors  
  in the table Tangents are defined only if  
  the flag given in the parallel table  
  TangentFlags is true: only these vectors  
  are set as tangency constraints.") Load;
		void Load (const TColgp_Array1OfVec2d & Tangents,const Handle_TColStd_HArray1OfBoolean & TangentFlags);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes the constrained BSpline curve. Use the function IsDone to verify that the  
computation is successful, and then the function Curve to obtain the result.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

Returns the computed BSpline curve. Raises  StdFail_NotDone if the interpolation fails.") Curve;
		const Handle_Geom2d_BSplineCurve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the constrained BSpline curve is successfully constructed.  
Note: in this case, the result is given by the function Curve.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") Geom2dAPI_Interpolate::~Geom2dAPI_Interpolate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAPI_Interpolate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dAPI_PointsToBSpline;
class Geom2dAPI_PointsToBSpline {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty approximation algorithm.  
Use an Init function to define and build the BSpline curve.") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline ();
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-6

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);
		%feature("autodoc", "Args:
	YValues(TColStd_Array1OfReal)
	X0(Standard_Real)
	DX(Standard_Real)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-6

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  Of coordinates :  
 
         X = X0 + DX * (i-YValues.Lower())  
         Y = YValues(i)  
 
         With i in the range YValues.Lower(), YValues.Upper()  
 
         The BSpline will be parametrized  from t = X0 to  
         X0 + DX * (YValues.Upper() - YValues.Lower())  
 
         And will satisfy X(t) = t  
 
         The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColStd_Array1OfReal & YValues,const Standard_Real X0,const Standard_Real DX,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	ParType(Approx_ParametrizationType)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	Parameters(TColStd_Array1OfReal)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a  BSpline  Curve  passing through an  
         array of Point,  which parameters are given by the  
          array <Parameters>.  
         The resulting  BSpline   will have the   following  
         properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	Weight1(Standard_Real)
	Weight2(Standard_Real)
	Weight3(Standard_Real)
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximate a BSpline Curve  passing through an  
         array of Point using variational smoothing algorithm,  
         which tries to minimize additional criterium:  
         Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion") Geom2dAPI_PointsToBSpline;
		 Geom2dAPI_PointsToBSpline (const TColgp_Array1OfPnt2d & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-6

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);
		%feature("autodoc", "Args:
	YValues(TColStd_Array1OfReal)
	X0(Standard_Real)
	DX(Standard_Real)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-6

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  Of coordinates :  
 
         X = X0 + DX * (i-YValues.Lower())  
         Y = YValues(i)  
 
         With i in the range YValues.Lower(), YValues.Upper()  
 
         The BSpline will be parametrized  from t = X0 to  
         X0 + DX * (YValues.Upper() - YValues.Lower())  
 
         And will satisfy X(t) = t  
 
         The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Init;
		void Init (const TColStd_Array1OfReal & YValues,const Standard_Real X0,const Standard_Real DX,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-6);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	ParType(Approx_ParametrizationType)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	Parameters(TColStd_Array1OfReal)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a  BSpline  Curve  passing through an  
         array of Point,  which parameters are given by the  
          array <Parameters>.  
         The resulting  BSpline   will have the   following  
         properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol2D") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt2d)
	Weight1(Standard_Real)
	Weight2(Standard_Real)
	Weight3(Standard_Real)
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol2D(Standard_Real)=1.0e-3

Returns:
	None

Approximate a BSpline Curve  passing through an  
         array of Point using variational smoothing algorithm,  
         which tries to minimize additional criterium:  
         Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion") Init;
		void Init (const TColgp_Array1OfPnt2d & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol2D = 1.0e-3);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

Returns the approximate BSpline Curve") Curve;
		const Handle_Geom2d_BSplineCurve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") Geom2dAPI_PointsToBSpline::~Geom2dAPI_PointsToBSpline %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAPI_PointsToBSpline {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dAPI_ProjectPointOnCurve;
class Geom2dAPI_ProjectPointOnCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty projector algorithm. Use an Init  
function to define the point and the curve on which it is going to work.") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Curve(Handle_Geom2d_Curve)

Returns:
	None

Create the projection  of a  point  <P> on a curve  
         <Curve>") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve (const gp_Pnt2d & P,const Handle_Geom2d_Curve & Curve);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Curve(Handle_Geom2d_Curve)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)

Returns:
	None

Create  the projection  of a point <P>  on a curve  
         <Curve> limited by the two   points of parameter Umin and Usup.  
   Warning  
Use the function NbPoints to obtain the number of solutions. If  
projection fails, NbPoints returns 0.") Geom2dAPI_ProjectPointOnCurve;
		 Geom2dAPI_ProjectPointOnCurve (const gp_Pnt2d & P,const Handle_Geom2d_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Curve(Handle_Geom2d_Curve)

Returns:
	None

Initializes this algorithm with the given arguments, and  
computes the orthogonal  projections  of a  point  <P> on a curve <Curve>") Init;
		void Init (const gp_Pnt2d & P,const Handle_Geom2d_Curve & Curve);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Curve(Handle_Geom2d_Curve)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)

Returns:
	None

Initializes this algorithm with the given arguments, and  
computes the orthogonal projections of the point P onto the portion  
of the curve Curve limited by the two points of parameter Umin and Usup.") Init;
		void Init (const gp_Pnt2d & P,const Handle_Geom2d_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

return the number of of computed  
orthogonal projectionn points.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Integer;
		 operator Standard_Integer ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt2d

Returns the orthogonal projection  
on the curve. Index is a number of a computed point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Point;
		gp_Pnt2d Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Parameter

Returns the parameter on the curve  
of a point which is the orthogonal projection. Index is a number of a  
computed projected point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Parameter;
		Quantity_Parameter Parameter (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U(Quantity_Parameter)

Returns:
	None

Returns the parameter on the curve  
of a point which is the orthogonal projection. Index is a number of a  
computed projected point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points") Parameter;
		void Parameter (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

Computes the distance between the  
point and its computed orthogonal projection on the curve. Index is a  
number of computed projected point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the nearest orthogonal projection of the point on the curve.  
Exceptions  
StdFail_NotDone if this algorithm fails.") NearestPoint;
		gp_Pnt2d NearestPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Pnt2d;
		 operator gp_Pnt2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Parameter

Returns the parameter on the curve  
of the nearest orthogonal projection of the point.  
Exceptions  
StdFail_NotDone if this algorithm fails.") LowerDistanceParameter;
		Quantity_Parameter LowerDistanceParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Computes the distance between the  
point and its nearest orthogonal projection on the curve.  
Exceptions  
StdFail_NotDone if this algorithm fails.") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Real;
		 operator Standard_Real ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_ExtPC2d

return the algorithmic object from Extrema") Extrema;
		const Extrema_ExtPC2d & Extrema ();
};


%feature("shadow") Geom2dAPI_ProjectPointOnCurve::~Geom2dAPI_ProjectPointOnCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAPI_ProjectPointOnCurve {
	void _kill_pointed() {
		delete $self;
	}
};
