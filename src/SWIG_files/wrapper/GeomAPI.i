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
%module GeomAPI

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

%include GeomAPI_required_python_modules.i
%include GeomAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomapi) GeomAPI;
%nodefaultctor GeomAPI;
class GeomAPI {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	P(gp_Pln)

Returns:
	static Handle_Geom2d_Curve

To intersect a curve and a surface.  This function builds (in the  
parametric space of the plane P) a 2D curve equivalent to the 3D curve  
C. The 3D curve C is considered to be located in the plane P.  
Warning  
The 3D curve C must be of one of the following types:  
-      a line  
-      a circle  
-      an ellipse  
-      a hyperbola  
-      a parabola  
-      a Bezier curve  
-      a BSpline curve  
Exceptions Standard_NoSuchObject if C is not a defined type curve.") To2d;
		static Handle_Geom2d_Curve To2d (const Handle_Geom_Curve & C,const gp_Pln & P);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	P(gp_Pln)

Returns:
	static Handle_Geom_Curve

Builds a 3D curve equivalent to the 2D curve C  
described in the parametric space defined by the local  
coordinate system of plane P.  
The resulting 3D curve is of the same nature as that of the curve C.") To3d;
		static Handle_Geom_Curve To3d (const Handle_Geom2d_Curve & C,const gp_Pln & P);
};


%feature("shadow") GeomAPI::~GeomAPI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_ExtremaCurveCurve;
class GeomAPI_ExtremaCurveCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm for computing  
extrema between two curves. Use an Init function  
to define the curves on which it is going to work.") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve ();
		%feature("autodoc", "Args:
	C1(Handle_Geom_Curve)
	C2(Handle_Geom_Curve)

Returns:
	None

Computes the extrema between the curves C1 and C2.") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2);
		%feature("autodoc", "Args:
	C1(Handle_Geom_Curve)
	C2(Handle_Geom_Curve)
	U1min(Quantity_Parameter)
	U1max(Quantity_Parameter)
	U2min(Quantity_Parameter)
	U2max(Quantity_Parameter)

Returns:
	None

Computes   the portion of the curve C1 limited by the two  
   points of parameter (U1min,U1max), and  
 -   the portion of the curve C2 limited by the two  
  points of parameter (U2min,U2max).  
       Warning  
Use the function NbExtrema to obtain the number  
of solutions. If this algorithm fails, NbExtrema returns 0.") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max);
		%feature("autodoc", "Args:
	C1(Handle_Geom_Curve)
	C2(Handle_Geom_Curve)

Returns:
	None

Initializes this algorithm with the given arguments  
and computes the extrema between the curves C1 and C2") Init;
		void Init (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2);
		%feature("autodoc", "Args:
	C1(Handle_Geom_Curve)
	C2(Handle_Geom_Curve)
	U1min(Quantity_Parameter)
	U1max(Quantity_Parameter)
	U2min(Quantity_Parameter)
	U2max(Quantity_Parameter)

Returns:
	None

Initializes this algorithm with the given arguments  
and computes the extrema between :  
  -   the portion of the curve C1 limited by the two  
   points of parameter (U1min,U1max), and  
  -   the portion of the curve C2 limited by the two  
   points of parameter (U2min,U2max).  
       Warning  
Use the function NbExtrema to obtain the number  
of solutions. If this algorithm fails, NbExtrema returns 0.") Init;
		void Init (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max);
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
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Returns the points P1 on the first curve and P2 on  
the second curve, which are the ends of the  
extremum of index Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Points;
		void Points (const Standard_Integer Index,gp_Pnt & P1,gp_Pnt & P2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U1(Quantity_Parameter)
	U2(Quantity_Parameter)

Returns:
	None

Returns the parameters U1 of the point on the first  
curve and U2 of the point on the second curve, which  
are the ends of the extremum of index Index computed by this algorithm.  
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
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Returns the points P1 on the first curve and P2 on  
the second curve, which are the ends of the shortest  
extremum computed by this algorithm.  
Exceptions StdFail_NotDone if this algorithm fails.") NearestPoints;
		void NearestPoints (gp_Pnt & P1,gp_Pnt & P2);
		%feature("autodoc", "Args:
	U1(Quantity_Parameter)
	U2(Quantity_Parameter)

Returns:
	None

Returns the parameters U1 of the point on the first  
curve and U2 of the point on the second curve, which  
are the ends of the shortest extremum computed by this algorithm.  
Exceptions StdFail_NotDone if this algorithm fails.") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Computes the distance between the end points of the  
shortest extremum computed by this algorithm.  
Exceptions StdFail_NotDone if this algorithm fails.") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Real;
		 operator Standard_Real ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_ExtCC

return the algorithmic object from Extrema") Extrema;
		const Extrema_ExtCC & Extrema ();
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	Standard_Boolean

set  in  <P1>  and <P2> the couple solution points  
         such a the distance [P1,P2] is the minimum. taking  in  account  
         extremity  points  of  curves.") TotalNearestPoints;
		Standard_Boolean TotalNearestPoints (gp_Pnt & P1,gp_Pnt & P2);
		%feature("autodoc", "Args:
	U1(Quantity_Parameter)
	U2(Quantity_Parameter)

Returns:
	Standard_Boolean

set  in <U1> and <U2> the parameters of the couple  
         solution   points  which  represents  the  total  nearest  
         solution.") TotalLowerDistanceParameters;
		Standard_Boolean TotalLowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

return the distance of the total  nearest couple solution  
         point.  if <myExtCC> is not done") TotalLowerDistance;
		Quantity_Length TotalLowerDistance ();
};


%feature("shadow") GeomAPI_ExtremaCurveCurve::~GeomAPI_ExtremaCurveCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_ExtremaCurveCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_ExtremaCurveSurface;
class GeomAPI_ExtremaCurveSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm for computing  
extrema between a curve and a surface. Use an  
Init function to define the curve and the surface on  
which it is going to work.") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface ();
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	Surface(Handle_Geom_Surface)

Returns:
	None

Computes  the  extrema  distances  between  the  
         curve <C> and the surface  <S>.") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface);
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	Surface(Handle_Geom_Surface)
	Wmin(Quantity_Parameter)
	Wmax(Quantity_Parameter)
	Umin(Quantity_Parameter)
	Umax(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vmax(Quantity_Parameter)

Returns:
	None

Computes  the  extrema  distances  between  the  
         curve <C>  and the  surface  <S>.  The solution  
         point are computed in the domain [Wmin,Wmax] of  
         the  curve   and  in  the  domain   [Umin,Umax]  
         [Vmin,Vmax] of the surface.  
//!	Warning  
Use the function NbExtrema to obtain the number  
of solutions. If this algorithm fails, NbExtrema returns 0.") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface,const Quantity_Parameter Wmin,const Quantity_Parameter Wmax,const Quantity_Parameter Umin,const Quantity_Parameter Umax,const Quantity_Parameter Vmin,const Quantity_Parameter Vmax);
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	Surface(Handle_Geom_Surface)

Returns:
	None

Computes  the  extrema  distances  between  the  
         curve <C> and the surface  <S>.") Init;
		void Init (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface);
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	Surface(Handle_Geom_Surface)
	Wmin(Quantity_Parameter)
	Wmax(Quantity_Parameter)
	Umin(Quantity_Parameter)
	Umax(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vmax(Quantity_Parameter)

Returns:
	None

Computes  the  extrema  distances  between  the  
         curve <C>  and the  surface  <S>.  The solution  
         point are computed in the domain [Wmin,Wmax] of  
         the  curve   and  in  the  domain   [Umin,Umax]  
         [Vmin,Vmax] of the surface.  
Warning  
Use the function NbExtrema to obtain the number  
of solutions. If this algorithm fails, NbExtrema returns 0.") Init;
		void Init (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface,const Quantity_Parameter Wmin,const Quantity_Parameter Wmax,const Quantity_Parameter Umin,const Quantity_Parameter Umax,const Quantity_Parameter Vmin,const Quantity_Parameter Vmax);
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
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Returns the points P1 on the curve and P2 on the  
surface, which are the ends of the extremum of index  
Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Points;
		void Points (const Standard_Integer Index,gp_Pnt & P1,gp_Pnt & P2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	W(Quantity_Parameter)
	U(Quantity_Parameter)
	V(Quantity_Parameter)

Returns:
	None

Returns the parameters W of the point on the curve,  
and (U,V) of the point on the surface, which are the  
ends of the extremum of index Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

Computes the distance between the end points of the  
extremum of index Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("autodoc", "Args:
	PC(gp_Pnt)
	PS(gp_Pnt)

Returns:
	None

Returns the points PC on the curve and PS on the  
surface, which are the ends of the shortest extremum computed by this algorithm.  
Exceptions - StdFail_NotDone if this algorithm fails.") NearestPoints;
		void NearestPoints (gp_Pnt & PC,gp_Pnt & PS);
		%feature("autodoc", "Args:
	W(Quantity_Parameter)
	U(Quantity_Parameter)
	V(Quantity_Parameter)

Returns:
	None

Returns the parameters W of the point on the curve  
and (U,V) of the point on the surface, which are the  
ends of the shortest extremum computed by this algorithm.  
Exceptions - StdFail_NotDone if this algorithm fails.") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
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
	Extrema_ExtCS

Missing detailed docstringic object from Extrema") Extrema;
		const Extrema_ExtCS & Extrema ();
};


%feature("shadow") GeomAPI_ExtremaCurveSurface::~GeomAPI_ExtremaCurveSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_ExtremaCurveSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_ExtremaSurfaceSurface;
class GeomAPI_ExtremaSurfaceSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm for computing  
extrema between two surfaces. Use an Init function  
to define the surfaces on which it is going to work.") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface ();
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)

Returns:
	None

Computes  the  extrema  distances  between  the  
         surfaces <S1>  and <S2>") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2);
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	U1min(Quantity_Parameter)
	U1max(Quantity_Parameter)
	V1min(Quantity_Parameter)
	V1max(Quantity_Parameter)
	U2min(Quantity_Parameter)
	U2max(Quantity_Parameter)
	V2min(Quantity_Parameter)
	V2max(Quantity_Parameter)

Returns:
	None

Computes  the  extrema  distances  between  
  the portion of the surface S1 limited by the  
 two values of parameter (U1min,U1max) in  
   the u parametric direction, and by the two  
   values of parameter (V1min,V1max) in the v  
   parametric direction, and  
  -   the portion of the surface S2 limited by the  
   two values of parameter (U2min,U2max) in  
   the u parametric direction, and by the two  
   values of parameter (V2min,V2max) in the v  
   parametric direction.") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter V1min,const Quantity_Parameter V1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max,const Quantity_Parameter V2min,const Quantity_Parameter V2max);
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)

Returns:
	None

Initializes this algorithm with the given arguments  
       and computes  the  extrema  distances  between  the  
         surfaces <S1>  and <S2>") Init;
		void Init (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2);
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	U1min(Quantity_Parameter)
	U1max(Quantity_Parameter)
	V1min(Quantity_Parameter)
	V1max(Quantity_Parameter)
	U2min(Quantity_Parameter)
	U2max(Quantity_Parameter)
	V2min(Quantity_Parameter)
	V2max(Quantity_Parameter)

Returns:
	None

Initializes this algorithm with the given arguments  
       and computes  the  extrema  distances  between -  
the portion of the surface S1 limited by the two  
   values of parameter (U1min,U1max) in the u  
   parametric direction, and by the two values of  
   parameter (V1min,V1max) in the v parametric direction, and  
  -   the portion of the surface S2 limited by the two  
   values of parameter (U2min,U2max) in the u  
   parametric direction, and by the two values of  
   parameter (V2min,V2max) in the v parametric direction.") Init;
		void Init (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter V1min,const Quantity_Parameter V1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max,const Quantity_Parameter V2min,const Quantity_Parameter V2max);
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
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Returns the points P1 on the first surface and P2 on  
the second surface, which are the ends of the  
extremum of index Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Points;
		void Points (const Standard_Integer Index,gp_Pnt & P1,gp_Pnt & P2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U1(Quantity_Parameter)
	V1(Quantity_Parameter)
	U2(Quantity_Parameter)
	V2(Quantity_Parameter)

Returns:
	None

Returns the parameters (U1,V1) of the point on the  
first surface, and (U2,V2) of the point on the second  
surface, which are the ends of the extremum of index  
Index computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is not in the range [  
1,NbExtrema ], where NbExtrema is the  
number of extrema computed by this algorithm.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
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
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Returns the points P1 on the first surface and P2 on  
the second surface, which are the ends of the  
shortest extremum computed by this algorithm.  
Exceptions StdFail_NotDone if this algorithm fails.") NearestPoints;
		void NearestPoints (gp_Pnt & P1,gp_Pnt & P2);
		%feature("autodoc", "Args:
	U1(Quantity_Parameter)
	V1(Quantity_Parameter)
	U2(Quantity_Parameter)
	V2(Quantity_Parameter)

Returns:
	None

Returns the parameters (U1,V1) of the point on the  
first surface and (U2,V2) of the point on the second  
surface, which are the ends of the shortest extremum  
computed by this algorithm.  
Exceptions - StdFail_NotDone if this algorithm fails.") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Computes the distance between the end points of the  
shortest extremum computed by this algorithm.  
Exceptions StdFail_NotDone if this algorithm fails.") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Real;
		 operator Standard_Real ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_ExtSS

return the algorithmic object from Extrema") Extrema;
		const Extrema_ExtSS & Extrema ();
};


%feature("shadow") GeomAPI_ExtremaSurfaceSurface::~GeomAPI_ExtremaSurfaceSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_ExtremaSurfaceSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_IntCS;
class GeomAPI_IntCS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty object. Use the  
function Perform for further initialization of the algorithm by  
the curve and the surface.") GeomAPI_IntCS;
		 GeomAPI_IntCS ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	S(Handle_Geom_Surface)

Returns:
	None

Computes the intersections between  
the curve C and the surface S.  
Warning  
Use function IsDone to verify that the intersections are computed successfully.") GeomAPI_IntCS;
		 GeomAPI_IntCS (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	S(Handle_Geom_Surface)

Returns:
	None

This function Initializes an algorithm with the curve C and the  
surface S and computes the intersections between C and S.  
Warning  
Use function IsDone to verify that the intersections are computed successfully.") Perform;
		void Perform (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the intersections are successfully computed.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of Intersection Points  
         if IsDone returns True.  
         else NotDone is raised.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the Intersection Point of range <Index>in case of cross intersection.  
        Raises NotDone if the computation has failed or if  
         the computation has not been done  
         raises OutOfRange if Index is not in the range <1..NbPoints>") Point;
		const gp_Pnt & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U(Quantity_Parameter)
	V(Quantity_Parameter)
	W(Quantity_Parameter)

Returns:
	None

Returns parameter W on the curve  
and (parameters U,V) on the surface of the computed intersection point  
of index Index in case of cross intersection.  
Exceptions  
StdFail_NotDone if intersection algorithm fails or is not initialized.  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of computed intersection points.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of computed  
intersection segments in case of tangential intersection.  
Exceptions  
StdFail_NotDone if the intersection algorithm fails or is not initialized.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

Returns the computed intersection  
segment of index Index in case of tangential intersection.  
Intersection segment is a portion of the initial curve tangent to surface.  
Exceptions  
StdFail_NotDone if intersection algorithm fails or is not initialized.  
Standard_OutOfRange if Index is not in the range [ 1,NbSegments ],  
where NbSegments is the number of computed intersection segments.") Segment;
		Handle_Geom_Curve Segment (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U1(Quantity_Parameter)
	V1(Quantity_Parameter)
	U2(Quantity_Parameter)
	V2(Quantity_Parameter)

Returns:
	None

Returns the parameters of the first (U1,V1) and the last (U2,V2) points  
of curve's segment on the surface in case of tangential intersection.  
Index is the number of computed intersection segments.  
Exceptions  
StdFail_NotDone if intersection algorithm fails or is not initialized.  
Standard_OutOfRange if Index is not in the range [ 1,NbSegments ],  
where NbSegments is the number of computed intersection segments.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") GeomAPI_IntCS::~GeomAPI_IntCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_IntCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_IntSS;
class GeomAPI_IntSS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty object. Use the  
function Perform for further initialization algorithm by two surfaces.") GeomAPI_IntSS;
		 GeomAPI_IntSS ();
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	Tol(Standard_Real)

Returns:
	None

Computes the intersection curves  
between the two surfaces S1 and S2. Parameter Tol defines the precision  
of curves computation. For most cases the value 1.0e-7 is recommended to use.  
Warning  
Use the function IsDone to verify that the intersections are successfully computed.I") GeomAPI_IntSS;
		 GeomAPI_IntSS (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	Tol(Standard_Real)

Returns:
	None

Initializes an algorithm with the  
given arguments and computes the intersection curves between the two surfaces S1 and S2.  
Parameter Tol defines the precision of curves computation. For most  
cases the value 1.0e-7 is recommended to use.  
Warning  
Use function IsDone to verify that the intersections are successfully computed.") Perform;
		void Perform (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the intersection was successful.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of computed intersection curves.  
Exceptions  
StdFail_NotDone if the computation fails.") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

Returns the computed intersection curve of index Index.  
Exceptions  
StdFail_NotDone if the computation fails.  
Standard_OutOfRange if Index is out of range [1, NbLines] where NbLines  
is the number of computed intersection curves.") Line;
		const Handle_Geom_Curve & Line (const Standard_Integer Index);
};


%feature("shadow") GeomAPI_IntSS::~GeomAPI_IntSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_IntSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_Interpolate;
class GeomAPI_Interpolate {
	public:
		%feature("autodoc", "Args:
	Points(Handle_TColgp_HArray1OfPnt)
	PeriodicFlag(Standard_Boolean)
	Tolerance(Standard_Real)

Returns:
	None

Initializes an algorithm for constructing a  
constrained BSpline curve passing through the points of the table   Points.  
Tangential vectors can then be assigned, using the function Load.  
If PeriodicFlag is true, the constrained BSpline  
curve will be periodic and closed. In this case,  
the junction point is the first point of the table Points.  
The tolerance value Tolerance is used to check that:  
  -   points are not too close to each other, or  
-   tangential vectors (defined using the  
  function Load) are not too small.  
The resulting BSpline curve will be 'C2'  
continuous, except where a tangency  
constraint is defined on a point through which  
the curve passes (by using the Load function).  
In this case, it will be only 'C1' continuous.  
Once all the constraints are defined, use the  
function Perform to compute the curve.  
Warning  
-   There must be at least 2 points in the table Points.  
-   If PeriodicFlag is false, there must be as  
  many parameters in the array Parameters as  
  there are points in the array Points.  
-   If PeriodicFlag is true, there must be one  
  more parameter in the table Parameters: this  
  is used to give the parameter on the  
  resulting BSpline curve of the junction point  
  of the curve (which is also the first point of the table Points).  
Exceptions  
-   Standard_ConstructionError if the  
  distance between two consecutive points in  
  the table Points is less than or equal to Tolerance.  
-   Standard_OutOfRange if:  
  -   there are less than two points in the table Points, or  
  -   conditions relating to the respective  
   number of elements in the parallel tables  
   Points and Parameters are not respected.") GeomAPI_Interpolate;
		 GeomAPI_Interpolate (const Handle_TColgp_HArray1OfPnt & Points,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Points(Handle_TColgp_HArray1OfPnt)
	Parameters(Handle_TColStd_HArray1OfReal)
	PeriodicFlag(Standard_Boolean)
	Tolerance(Standard_Real)

Returns:
	None

Initializes an algorithm for constructing a  
constrained BSpline curve passing through the points of the table  
  Points, where the parameters of each of its  
  points are given by the parallel table Parameters.  
Tangential vectors can then be assigned, using the function Load.  
If PeriodicFlag is true, the constrained BSpline  
curve will be periodic and closed. In this case,  
the junction point is the first point of the table Points.  
The tolerance value Tolerance is used to check that:  
-   points are not too close to each other, or  
-   tangential vectors (defined using the  
  function Load) are not too small.  
The resulting BSpline curve will be 'C2'  
continuous, except where a tangency  
constraint is defined on a point through which  
the curve passes (by using the Load function).  
In this case, it will be only 'C1' continuous.  
Once all the constraints are defined, use the  
function Perform to compute the curve.  
Warning  
-   There must be at least 2 points in the table Points.  
-   If PeriodicFlag is false, there must be as  
  many parameters in the array Parameters as  
  there are points in the array Points.  
-   If PeriodicFlag is true, there must be one  
  more parameter in the table Parameters: this  
  is used to give the parameter on the  
  resulting BSpline curve of the junction point  
  of the curve (which is also the first point of the table Points).  
Exceptions  
-   Standard_ConstructionError if the  
  distance between two consecutive points in  
  the table Points is less than or equal to Tolerance.  
-   Standard_OutOfRange if:  
  -   there are less than two points in the table Points, or  
  -   conditions relating to the respective  
   number of elements in the parallel tables  
   Points and Parameters are not respected.") GeomAPI_Interpolate;
		 GeomAPI_Interpolate (const Handle_TColgp_HArray1OfPnt & Points,const Handle_TColStd_HArray1OfReal & Parameters,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	InitialTangent(gp_Vec)
	FinalTangent(gp_Vec)
	Scale(Standard_Boolean)=Standard_True

Returns:
	None

Assigns this constrained BSpline curve to be  
tangential to vectors InitialTangent and FinalTangent  
  at its first and last points respectively (i.e.  
  the first and last points of the table of  
  points through which the curve passes, as  
  defined at the time of initialization).") Load;
		void Load (const gp_Vec & InitialTangent,const gp_Vec & FinalTangent,const Standard_Boolean Scale = Standard_True);
		%feature("autodoc", "Args:
	Tangents(TColgp_Array1OfVec)
	TangentFlags(Handle_TColStd_HArray1OfBoolean)
	Scale(Standard_Boolean)=Standard_True

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
		void Load (const TColgp_Array1OfVec & Tangents,const Handle_TColStd_HArray1OfBoolean & TangentFlags,const Standard_Boolean Scale = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes the constrained BSpline curve.  
Use the function IsDone to verify that the  
computation is successful, and then the function Curve to obtain the result.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

Returns the computed BSpline curve.  
Raises StdFail_NotDone if the interpolation fails.") Curve;
		const Handle_Geom_BSplineCurve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the constrained BSpline curve is successfully constructed.  
Note: in this case, the result is given by the function Curve.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") GeomAPI_Interpolate::~GeomAPI_Interpolate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_Interpolate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_PointsToBSpline;
class GeomAPI_PointsToBSpline {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty approximation algorithm.  
Use an Init function to define and build the BSpline curve.") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline ();
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	ParType(Approx_ParametrizationType)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	Parameters(TColStd_Array1OfReal)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

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
            BSpline will be lower to Tol3D") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
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
         Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") Init;
		void Init (const TColgp_Array1OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	ParType(Approx_ParametrizationType)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximate  a BSpline  Curve passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") Init;
		void Init (const TColgp_Array1OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	Parameters(TColStd_Array1OfReal)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

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
            BSpline will be lower to Tol3D") Init;
		void Init (const TColgp_Array1OfPnt & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
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
         Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion") Init;
		void Init (const TColgp_Array1OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

Returns the computed BSpline curve.  
Raises StdFail_NotDone if the curve is not built.") Curve;
		const Handle_Geom_BSplineCurve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") GeomAPI_PointsToBSpline::~GeomAPI_PointsToBSpline %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_PointsToBSpline {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_PointsToBSplineSurface;
class GeomAPI_PointsToBSplineSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm for  
approximation or interpolation of a surface.  
Use:  
-   an Init function to define and build the  
  BSpline surface by approximation, or  
-   an Interpolate function to define and build  
  the BSpline surface by interpolation.") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface ();
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline  Surface passing  through  an  
         array of  Points.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColgp_Array2OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)
	ParType(Approx_ParametrizationType)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline  Surface passing  through  an  
         array of  Points.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColgp_Array2OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)
	Weight1(Standard_Real)
	Weight2(Standard_Real)
	Weight3(Standard_Real)
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline  Surface passing  through  an  
         array of  points using variational smoothing algorithm,  
         which tries to minimize additional criterium:  
         Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColgp_Array2OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	ZPoints(TColStd_Array2OfReal)
	X0(Standard_Real)
	dX(Standard_Real)
	Y0(Standard_Real)
	dY(Standard_Real)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline  Surface passing  through  an  
         array of  Points.  
 
         The points will be constructed as follow:  
           P(i,j) = gp_Pnt( X0 + (i-1)*dX ,  
                            Y0 + (j-1)*dY ,  
                            ZPoints(i,j)   )  
 
         The resulting BSpline will  have the following  
         properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D  
         4- the parametrization of the surface will verify:  
              S->Value( U, V) = gp_Pnt( U, V, Z(U,V) );") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColStd_Array2OfReal & ZPoints,const Standard_Real X0,const Standard_Real dX,const Standard_Real Y0,const Standard_Real dY,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline Surface passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") Init;
		void Init (const TColgp_Array2OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)

Returns:
	None

Interpolates  a BSpline Surface passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be 3.  
         2- his  continuity will be  C2.") Interpolate;
		void Interpolate (const TColgp_Array2OfPnt & Points);
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)
	ParType(Approx_ParametrizationType)

Returns:
	None

Interpolates  a BSpline Surface passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be 3.  
         2- his  continuity will be  C2.") Interpolate;
		void Interpolate (const TColgp_Array2OfPnt & Points,const Approx_ParametrizationType ParType);
		%feature("autodoc", "Args:
	ZPoints(TColStd_Array2OfReal)
	X0(Standard_Real)
	dX(Standard_Real)
	Y0(Standard_Real)
	dY(Standard_Real)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline  Surface passing  through  an  
         array of  Points.  
 
         The points will be constructed as follow:  
           P(i,j) = gp_Pnt( X0 + (i-1)*dX ,  
                            Y0 + (j-1)*dY ,  
                            ZPoints(i,j)   )  
 
         The resulting BSpline will  have the following  
         properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D  
         4- the parametrization of the surface will verify:  
              S->Value( U, V) = gp_Pnt( U, V, Z(U,V) );") Init;
		void Init (const TColStd_Array2OfReal & ZPoints,const Standard_Real X0,const Standard_Real dX,const Standard_Real Y0,const Standard_Real dY,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	ZPoints(TColStd_Array2OfReal)
	X0(Standard_Real)
	dX(Standard_Real)
	Y0(Standard_Real)
	dY(Standard_Real)

Returns:
	None

Interpolates  a BSpline  Surface passing  through  an  
         array of  Points.  
 
         The points will be constructed as follow:  
           P(i,j) = gp_Pnt( X0 + (i-1)*dX ,  
                            Y0 + (j-1)*dY ,  
                            ZPoints(i,j)   )  
 
         The resulting BSpline will  have the following  
         properties:  
         1- his degree will be 3  
         2- his  continuity will be  C2.  
         4- the parametrization of the surface will verify:  
              S->Value( U, V) = gp_Pnt( U, V, Z(U,V) );") Interpolate;
		void Interpolate (const TColStd_Array2OfReal & ZPoints,const Standard_Real X0,const Standard_Real dX,const Standard_Real Y0,const Standard_Real dY);
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)
	ParType(Approx_ParametrizationType)
	DegMin(Standard_Integer)=3
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline Surface passing  through  an  
         array of  Point.  The resulting BSpline will  have  
         the following properties:  
         1- his degree will be in the range [Degmin,Degmax]  
         2- his  continuity will be  at  least <Continuity>  
         3- the distance from the point <Points> to the  
            BSpline will be lower to Tol3D") Init;
		void Init (const TColgp_Array2OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	Points(TColgp_Array2OfPnt)
	Weight1(Standard_Real)
	Weight2(Standard_Real)
	Weight3(Standard_Real)
	DegMax(Standard_Integer)=8
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Tol3D(Standard_Real)=1.0e-3

Returns:
	None

Approximates  a BSpline Surface passing  through  an  
         array of  point using variational smoothing algorithm,  
         which tries to minimize additional criterium:  
         Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion") Init;
		void Init (const TColgp_Array2OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

Returns the approximate BSpline Surface") Surface;
		const Handle_Geom_BSplineSurface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") GeomAPI_PointsToBSplineSurface::~GeomAPI_PointsToBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_PointsToBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_ProjectPointOnCurve;
class GeomAPI_ProjectPointOnCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty object. Use an  
Init function for further initialization.") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Curve(Handle_Geom_Curve)

Returns:
	None

Create the projection  of a  point  <P> on a curve  
         <Curve>") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve (const gp_Pnt & P,const Handle_Geom_Curve & Curve);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Curve(Handle_Geom_Curve)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)

Returns:
	None

Create  the projection  of a point <P>  on a curve  
         <Curve> limited by the two points of parameter Umin and Usup.") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve (const gp_Pnt & P,const Handle_Geom_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Curve(Handle_Geom_Curve)

Returns:
	None

Init the projection  of a  point  <P> on a curve  
         <Curve>") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Curve & Curve);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Curve(Handle_Geom_Curve)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)

Returns:
	None

Init  the  projection  of a  point <P>  on a curve  
         <Curve> limited by the two points of parameter Umin and Usup.") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)

Returns:
	None

Init  the  projection  of a  point <P>  on a curve  
         <Curve> limited by the two points of parameter Umin and Usup.") Init;
		void Init (const Handle_Geom_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Performs the projection of a point on the current curve.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of computed  
orthogonal projection points.  
Note: if this algorithm fails, NbPoints returns 0.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Integer;
		 operator Standard_Integer ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the orthogonal projection  
on the curve. Index is a number of a computed point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Point;
		gp_Pnt Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Parameter

Returns the parameter on the curve  
of the point, which is the orthogonal projection. Index is a  
number of a computed point.  
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
of the point, which is the orthogonal projection. Index is a  
number of a computed point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.-") Parameter;
		void Parameter (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

Computes the distance between the  
point and its orthogonal projection on the curve. Index is a number of a computed point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the nearest orthogonal  
projection of the point on the curve.  
Exceptions: StdFail_NotDone if this algorithm fails.") NearestPoint;
		gp_Pnt NearestPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Pnt;
		 operator gp_Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Parameter

Returns the parameter on the curve  
of the nearest orthogonal projection of the point.  
Exceptions: StdFail_NotDone if this algorithm fails.") LowerDistanceParameter;
		Quantity_Parameter LowerDistanceParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Computes the distance between the  
point and its nearest orthogonal projection on the curve.  
Exceptions: StdFail_NotDone if this algorithm fails.") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Real;
		 operator Standard_Real ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_ExtPC

return the algorithmic object from Extrema") Extrema;
		const Extrema_ExtPC & Extrema ();
};


%feature("shadow") GeomAPI_ProjectPointOnCurve::~GeomAPI_ProjectPointOnCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_ProjectPointOnCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAPI_ProjectPointOnSurf;
class GeomAPI_ProjectPointOnSurf {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty object. Use the  
Init function for further initialization.") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

Create the projection  of a point <P> on a surface  
         <Surface>") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Tolerance(Standard_Real)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

Create the projection  of a point <P> on a surface  
         <Surface>  Create the projection of a point <P>  on a surface  
         <Surface>. The solution are computed in the domain  
         [Umin,Usup] [Vmin,Vsup] of the surface.") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vsup(Quantity_Parameter)
	Tolerance(Standard_Real)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

No detailed docstring for this function.") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vsup(Quantity_Parameter)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

Init the projection  of a point <P> on a surface  
         <Surface>") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Tolerance(Standard_Real)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

Init the projection of a point <P>  on a surface  
         <Surface>. The solution are computed in the domain  
         [Umin,Usup] [Vmin,Vsup] of the surface.") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vsup(Quantity_Parameter)
	Tolerance(Standard_Real)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Surface(Handle_Geom_Surface)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vsup(Quantity_Parameter)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

Init the projection for many points on a surface  
         <Surface>. The solutions will be computed in the domain  
         [Umin,Usup] [Vmin,Vsup] of the surface.") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	Surface(Handle_Geom_Surface)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vsup(Quantity_Parameter)
	Tolerance(Standard_Real)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	Surface(Handle_Geom_Surface)
	Umin(Quantity_Parameter)
	Usup(Quantity_Parameter)
	Vmin(Quantity_Parameter)
	Vsup(Quantity_Parameter)
	Algo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Performs the projection of a point on the current surface.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of computed orthogonal projection points.  
Note: if projection fails, NbPoints returns 0.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Integer;
		 operator Standard_Integer ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the orthogonal projection  
on the surface. Index is a number of a computed point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Point;
		gp_Pnt Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U(Quantity_Parameter)
	V(Quantity_Parameter)

Returns:
	None

Returns the parameters (U,V) on the  
surface of the orthogonal projection. Index is a number of a  
computed point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

Computes the distance between the  
point and its orthogonal projection on the surface. Index is a number  
of a computed point.  
Exceptions  
Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where  
NbPoints is the number of solution points.") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the nearest orthogonal projection of the point  
on the surface.  
Exceptions  
StdFail_NotDone if projection fails.") NearestPoint;
		gp_Pnt NearestPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Pnt;
		 operator gp_Pnt ();
		%feature("autodoc", "Args:
	U(Quantity_Parameter)
	V(Quantity_Parameter)

Returns:
	None

Returns the parameters (U,V) on the  
surface of the nearest computed orthogonal projection of the point.  
Exceptions  
StdFail_NotDone if projection fails.") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Computes the distance between the  
point and its nearest orthogonal projection on the surface.  
Exceptions  
StdFail_NotDone if projection fails.") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorStandard_Real;
		 operator Standard_Real ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_ExtPS

return the algorithmic object from Extrema") Extrema;
		const Extrema_ExtPS & Extrema ();
};


%feature("shadow") GeomAPI_ProjectPointOnSurf::~GeomAPI_ProjectPointOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAPI_ProjectPointOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
