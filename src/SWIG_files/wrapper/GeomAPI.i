/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") GeomAPI

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include GeomAPI_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomapi) GeomAPI;
class GeomAPI {
	public:
		%feature("compactdefaultargs") To2d;
		%feature("autodoc", "	* This function builds (in the parametric space of the plane P) a 2D curve equivalent to the 3D curve C. The 3D curve C is considered to be located in the plane P. Warning The 3D curve C must be of one of the following types: - a line - a circle - an ellipse - a hyperbola - a parabola - a Bezier curve - a BSpline curve Exceptions Standard_NoSuchObject if C is not a defined type curve.

	:param C:
	:type C: Handle_Geom_Curve &
	:param P:
	:type P: gp_Pln
	:rtype: Handle_Geom2d_Curve
") To2d;
		static Handle_Geom2d_Curve To2d (const Handle_Geom_Curve & C,const gp_Pln & P);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	* Builds a 3D curve equivalent to the 2D curve C described in the parametric space defined by the local coordinate system of plane P. The resulting 3D curve is of the same nature as that of the curve C.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pln
	:rtype: Handle_Geom_Curve
") To3d;
		static Handle_Geom_Curve To3d (const Handle_Geom2d_Curve & C,const gp_Pln & P);
};


%extend GeomAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_ExtremaCurveCurve;
class GeomAPI_ExtremaCurveCurve {
	public:
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "	* Constructs an empty algorithm for computing extrema between two curves. Use an Init function to define the curves on which it is going to work.

	:rtype: None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve ();
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "	* Computes the extrema between the curves C1 and C2.

	:param C1:
	:type C1: Handle_Geom_Curve &
	:param C2:
	:type C2: Handle_Geom_Curve &
	:rtype: None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2);
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "	* Computes the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.

	:param C1:
	:type C1: Handle_Geom_Curve &
	:param C2:
	:type C2: Handle_Geom_Curve &
	:param U1min:
	:type U1min: Quantity_Parameter
	:param U1max:
	:type U1max: Quantity_Parameter
	:param U2min:
	:type U2min: Quantity_Parameter
	:param U2max:
	:type U2max: Quantity_Parameter
	:rtype: None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes this algorithm with the given arguments and computes the extrema between the curves C1 and C2

	:param C1:
	:type C1: Handle_Geom_Curve &
	:param C2:
	:type C2: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes this algorithm with the given arguments and computes the extrema between : - the portion of the curve C1 limited by the two points of parameter (U1min,U1max), and - the portion of the curve C2 limited by the two points of parameter (U2min,U2max). Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.

	:param C1:
	:type C1: Handle_Geom_Curve &
	:param C2:
	:type C2: Handle_Geom_Curve &
	:param U1min:
	:type U1min: Quantity_Parameter
	:param U1max:
	:type U1max: Quantity_Parameter
	:param U2min:
	:type U2min: Quantity_Parameter
	:param U2max:
	:type U2max: Quantity_Parameter
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max);
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "	* Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema ();
		%feature("compactdefaultargs") operator Standard_Integer;
		%feature("autodoc", "	:rtype: 
") operator Standard_Integer;
		 operator Standard_Integer ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Points;
		void Points (const Standard_Integer Index,gp_Pnt & P1,gp_Pnt & P2);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param U1:
	:type U1: Quantity_Parameter &
	:param U2:
	:type U2: Quantity_Parameter &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "	* Returns the points P1 on the first curve and P2 on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") NearestPoints;
		void NearestPoints (gp_Pnt & P1,gp_Pnt & P2);
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "	* Returns the parameters U1 of the point on the first curve and U2 of the point on the second curve, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.

	:param U1:
	:type U1: Quantity_Parameter &
	:param U2:
	:type U2: Quantity_Parameter &
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "	* Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.

	:rtype: Quantity_Length
") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("compactdefaultargs") operator Standard_Real;
		%feature("autodoc", "	:rtype: 
") operator Standard_Real;
		 operator Standard_Real ();
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "	* return the algorithmic object from Extrema

	:rtype: Extrema_ExtCC
") Extrema;
		const Extrema_ExtCC & Extrema ();
		%feature("compactdefaultargs") TotalNearestPoints;
		%feature("autodoc", "	* set in <P1> and <P2> the couple solution points such a the distance [P1,P2] is the minimum. taking in account extremity points of curves.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: bool
") TotalNearestPoints;
		Standard_Boolean TotalNearestPoints (gp_Pnt & P1,gp_Pnt & P2);
		%feature("compactdefaultargs") TotalLowerDistanceParameters;
		%feature("autodoc", "	* set in <U1> and <U2> the parameters of the couple solution points which represents the total nearest solution.

	:param U1:
	:type U1: Quantity_Parameter &
	:param U2:
	:type U2: Quantity_Parameter &
	:rtype: bool
") TotalLowerDistanceParameters;
		Standard_Boolean TotalLowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") TotalLowerDistance;
		%feature("autodoc", "	* return the distance of the total nearest couple solution point. if <myExtCC> is not done

	:rtype: Quantity_Length
") TotalLowerDistance;
		Quantity_Length TotalLowerDistance ();
};


%extend GeomAPI_ExtremaCurveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_ExtremaCurveSurface;
class GeomAPI_ExtremaCurveSurface {
	public:
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "	* Constructs an empty algorithm for computing extrema between a curve and a surface. Use an Init function to define the curve and the surface on which it is going to work.

	:rtype: None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface ();
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "	* Computes the extrema distances between the curve <C> and the surface <S>.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:rtype: None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface);
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "	* Computes the extrema distances between the curve <C> and the surface <S>. The solution point are computed in the domain [Wmin,Wmax] of the curve and in the domain [Umin,Umax] [Vmin,Vmax] of the surface. Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Wmin:
	:type Wmin: Quantity_Parameter
	:param Wmax:
	:type Wmax: Quantity_Parameter
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Umax:
	:type Umax: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vmax:
	:type Vmax: Quantity_Parameter
	:rtype: None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface,const Quantity_Parameter Wmin,const Quantity_Parameter Wmax,const Quantity_Parameter Umin,const Quantity_Parameter Umax,const Quantity_Parameter Vmin,const Quantity_Parameter Vmax);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Computes the extrema distances between the curve <C> and the surface <S>.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Computes the extrema distances between the curve <C> and the surface <S>. The solution point are computed in the domain [Wmin,Wmax] of the curve and in the domain [Umin,Umax] [Vmin,Vmax] of the surface. Warning Use the function NbExtrema to obtain the number of solutions. If this algorithm fails, NbExtrema returns 0.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Wmin:
	:type Wmin: Quantity_Parameter
	:param Wmax:
	:type Wmax: Quantity_Parameter
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Umax:
	:type Umax: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vmax:
	:type Vmax: Quantity_Parameter
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & Curve,const Handle_Geom_Surface & Surface,const Quantity_Parameter Wmin,const Quantity_Parameter Wmax,const Quantity_Parameter Umin,const Quantity_Parameter Umax,const Quantity_Parameter Vmin,const Quantity_Parameter Vmax);
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "	* Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema ();
		%feature("compactdefaultargs") operator Standard_Integer;
		%feature("autodoc", "	:rtype: 
") operator Standard_Integer;
		 operator Standard_Integer ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points P1 on the curve and P2 on the surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Points;
		void Points (const Standard_Integer Index,gp_Pnt & P1,gp_Pnt & P2);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters W of the point on the curve, and (U,V) of the point on the surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param W:
	:type W: Quantity_Parameter &
	:param U:
	:type U: Quantity_Parameter &
	:param V:
	:type V: Quantity_Parameter &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "	* Returns the points PC on the curve and PS on the surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.

	:param PC:
	:type PC: gp_Pnt
	:param PS:
	:type PS: gp_Pnt
	:rtype: None
") NearestPoints;
		void NearestPoints (gp_Pnt & PC,gp_Pnt & PS);
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "	* Returns the parameters W of the point on the curve and (U,V) of the point on the surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.

	:param W:
	:type W: Quantity_Parameter &
	:param U:
	:type U: Quantity_Parameter &
	:param V:
	:type V: Quantity_Parameter &
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "	* Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.

	:rtype: Quantity_Length
") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("compactdefaultargs") operator Standard_Real;
		%feature("autodoc", "	:rtype: 
") operator Standard_Real;
		 operator Standard_Real ();
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "	* Missing detailed docstringic object from Extrema

	:rtype: Extrema_ExtCS
") Extrema;
		const Extrema_ExtCS & Extrema ();
};


%extend GeomAPI_ExtremaCurveSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_ExtremaSurfaceSurface;
class GeomAPI_ExtremaSurfaceSurface {
	public:
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "	* Constructs an empty algorithm for computing extrema between two surfaces. Use an Init function to define the surfaces on which it is going to work.

	:rtype: None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface ();
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "	* Computes the extrema distances between the surfaces <S1> and <S2>

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:rtype: None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2);
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "	* Computes the extrema distances between the portion of the surface S1 limited by the two values of parameter (U1min,U1max) in the u parametric direction, and by the two values of parameter (V1min,V1max) in the v parametric direction, and - the portion of the surface S2 limited by the two values of parameter (U2min,U2max) in the u parametric direction, and by the two values of parameter (V2min,V2max) in the v parametric direction.

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:param U1min:
	:type U1min: Quantity_Parameter
	:param U1max:
	:type U1max: Quantity_Parameter
	:param V1min:
	:type V1min: Quantity_Parameter
	:param V1max:
	:type V1max: Quantity_Parameter
	:param U2min:
	:type U2min: Quantity_Parameter
	:param U2max:
	:type U2max: Quantity_Parameter
	:param V2min:
	:type V2min: Quantity_Parameter
	:param V2max:
	:type V2max: Quantity_Parameter
	:rtype: None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter V1min,const Quantity_Parameter V1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max,const Quantity_Parameter V2min,const Quantity_Parameter V2max);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes this algorithm with the given arguments and computes the extrema distances between the surfaces <S1> and <S2>

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes this algorithm with the given arguments and computes the extrema distances between - the portion of the surface S1 limited by the two values of parameter (U1min,U1max) in the u parametric direction, and by the two values of parameter (V1min,V1max) in the v parametric direction, and - the portion of the surface S2 limited by the two values of parameter (U2min,U2max) in the u parametric direction, and by the two values of parameter (V2min,V2max) in the v parametric direction.

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:param U1min:
	:type U1min: Quantity_Parameter
	:param U1max:
	:type U1max: Quantity_Parameter
	:param V1min:
	:type V1min: Quantity_Parameter
	:param V1max:
	:type V1max: Quantity_Parameter
	:param U2min:
	:type U2min: Quantity_Parameter
	:param U2max:
	:type U2max: Quantity_Parameter
	:param V2min:
	:type V2min: Quantity_Parameter
	:param V2max:
	:type V2max: Quantity_Parameter
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Quantity_Parameter U1min,const Quantity_Parameter U1max,const Quantity_Parameter V1min,const Quantity_Parameter V1max,const Quantity_Parameter U2min,const Quantity_Parameter U2max,const Quantity_Parameter V2min,const Quantity_Parameter V2max);
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "	* Returns the number of extrema computed by this algorithm. Note: if this algorithm fails, NbExtrema returns 0.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema ();
		%feature("compactdefaultargs") operator Standard_Integer;
		%feature("autodoc", "	:rtype: 
") operator Standard_Integer;
		 operator Standard_Integer ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points P1 on the first surface and P2 on the second surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Points;
		void Points (const Standard_Integer Index,gp_Pnt & P1,gp_Pnt & P2);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters (U1,V1) of the point on the first surface, and (U2,V2) of the point on the second surface, which are the ends of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param U1:
	:type U1: Quantity_Parameter &
	:param V1:
	:type V1: Quantity_Parameter &
	:param U2:
	:type U2: Quantity_Parameter &
	:param V2:
	:type V2: Quantity_Parameter &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between the end points of the extremum of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbExtrema ], where NbExtrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "	* Returns the points P1 on the first surface and P2 on the second surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") NearestPoints;
		void NearestPoints (gp_Pnt & P1,gp_Pnt & P2);
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "	* Returns the parameters (U1,V1) of the point on the first surface and (U2,V2) of the point on the second surface, which are the ends of the shortest extremum computed by this algorithm. Exceptions - StdFail_NotDone if this algorithm fails.

	:param U1:
	:type U1: Quantity_Parameter &
	:param V1:
	:type V1: Quantity_Parameter &
	:param U2:
	:type U2: Quantity_Parameter &
	:param V2:
	:type V2: Quantity_Parameter &
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "	* Computes the distance between the end points of the shortest extremum computed by this algorithm. Exceptions StdFail_NotDone if this algorithm fails.

	:rtype: Quantity_Length
") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("compactdefaultargs") operator Standard_Real;
		%feature("autodoc", "	:rtype: 
") operator Standard_Real;
		 operator Standard_Real ();
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "	* return the algorithmic object from Extrema

	:rtype: Extrema_ExtSS
") Extrema;
		const Extrema_ExtSS & Extrema ();
};


%extend GeomAPI_ExtremaSurfaceSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_IntCS;
class GeomAPI_IntCS {
	public:
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "	* Creates an empty object. Use the function Perform for further initialization of the algorithm by the curve and the surface.

	:rtype: None
") GeomAPI_IntCS;
		 GeomAPI_IntCS ();
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "	* Computes the intersections between the curve C and the surface S. Warning Use function IsDone to verify that the intersections are computed successfully.

	:param C:
	:type C: Handle_Geom_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") GeomAPI_IntCS;
		 GeomAPI_IntCS (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* This function Initializes an algorithm with the curve C and the surface S and computes the intersections between C and S. Warning Use function IsDone to verify that the intersections are computed successfully.

	:param C:
	:type C: Handle_Geom_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Perform;
		void Perform (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the intersections are successfully computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of Intersection Points if IsDone returns True. else NotDone is raised.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Intersection Point of range <Index>in case of cross intersection. Raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbPoints>

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns parameter W on the curve and (parameters U,V) on the surface of the computed intersection point of index Index in case of cross intersection. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of computed intersection points.

	:param Index:
	:type Index: int
	:param U:
	:type U: Quantity_Parameter &
	:param V:
	:type V: Quantity_Parameter &
	:param W:
	:type W: Quantity_Parameter &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* Returns the number of computed intersection segments in case of tangential intersection. Exceptions StdFail_NotDone if the intersection algorithm fails or is not initialized.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns the computed intersection segment of index Index in case of tangential intersection. Intersection segment is a portion of the initial curve tangent to surface. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbSegments ], where NbSegments is the number of computed intersection segments.

	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") Segment;
		Handle_Geom_Curve Segment (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters of the first (U1,V1) and the last (U2,V2) points of curve's segment on the surface in case of tangential intersection. Index is the number of computed intersection segments. Exceptions StdFail_NotDone if intersection algorithm fails or is not initialized. Standard_OutOfRange if Index is not in the range [ 1,NbSegments ], where NbSegments is the number of computed intersection segments.

	:param Index:
	:type Index: int
	:param U1:
	:type U1: Quantity_Parameter &
	:param V1:
	:type V1: Quantity_Parameter &
	:param U2:
	:type U2: Quantity_Parameter &
	:param V2:
	:type V2: Quantity_Parameter &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend GeomAPI_IntCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_IntSS;
class GeomAPI_IntSS {
	public:
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "	* Constructs an empty object. Use the function Perform for further initialization algorithm by two surfaces.

	:rtype: None
") GeomAPI_IntSS;
		 GeomAPI_IntSS ();
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "	* Computes the intersection curves between the two surfaces S1 and S2. Parameter Tol defines the precision of curves computation. For most cases the value 1.0e-7 is recommended to use. Warning Use the function IsDone to verify that the intersections are successfully computed.I

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:param Tol:
	:type Tol: float
	:rtype: None
") GeomAPI_IntSS;
		 GeomAPI_IntSS (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Initializes an algorithm with the given arguments and computes the intersection curves between the two surfaces S1 and S2. Parameter Tol defines the precision of curves computation. For most cases the value 1.0e-7 is recommended to use. Warning Use function IsDone to verify that the intersections are successfully computed.

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Standard_Real Tol);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the intersection was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the number of computed intersection curves. Exceptions StdFail_NotDone if the computation fails.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the computed intersection curve of index Index. Exceptions StdFail_NotDone if the computation fails. Standard_OutOfRange if Index is out of range [1, NbLines] where NbLines is the number of computed intersection curves.

	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") Line;
		Handle_Geom_Curve Line (const Standard_Integer Index);
};


%extend GeomAPI_IntSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_Interpolate;
class GeomAPI_Interpolate {
	public:
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "	* Initializes an algorithm for constructing a constrained BSpline curve passing through the points of the table Points. Tangential vectors can then be assigned, using the function Load. If PeriodicFlag is true, the constrained BSpline curve will be periodic and closed. In this case, the junction point is the first point of the table Points. The tolerance value Tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function Load) are not too small. The resulting BSpline curve will be 'C2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the Load function). In this case, it will be only 'C1' continuous. Once all the constraints are defined, use the function Perform to compute the curve. Warning - There must be at least 2 points in the table Points. - If PeriodicFlag is false, there must be as many parameters in the array Parameters as there are points in the array Points. - If PeriodicFlag is true, there must be one more parameter in the table Parameters: this is used to give the parameter on the resulting BSpline curve of the junction point of the curve (which is also the first point of the table Points). Exceptions - Standard_ConstructionError if the distance between two consecutive points in the table Points is less than or equal to Tolerance. - Standard_OutOfRange if: - there are less than two points in the table Points, or - conditions relating to the respective number of elements in the parallel tables Points and Parameters are not respected.

	:param Points:
	:type Points: Handle_TColgp_HArray1OfPnt
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate (const Handle_TColgp_HArray1OfPnt & Points,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "	* Initializes an algorithm for constructing a constrained BSpline curve passing through the points of the table Points, where the parameters of each of its points are given by the parallel table Parameters. Tangential vectors can then be assigned, using the function Load. If PeriodicFlag is true, the constrained BSpline curve will be periodic and closed. In this case, the junction point is the first point of the table Points. The tolerance value Tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function Load) are not too small. The resulting BSpline curve will be 'C2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the Load function). In this case, it will be only 'C1' continuous. Once all the constraints are defined, use the function Perform to compute the curve. Warning - There must be at least 2 points in the table Points. - If PeriodicFlag is false, there must be as many parameters in the array Parameters as there are points in the array Points. - If PeriodicFlag is true, there must be one more parameter in the table Parameters: this is used to give the parameter on the resulting BSpline curve of the junction point of the curve (which is also the first point of the table Points). Exceptions - Standard_ConstructionError if the distance between two consecutive points in the table Points is less than or equal to Tolerance. - Standard_OutOfRange if: - there are less than two points in the table Points, or - conditions relating to the respective number of elements in the parallel tables Points and Parameters are not respected.

	:param Points:
	:type Points: Handle_TColgp_HArray1OfPnt
	:param Parameters:
	:type Parameters: Handle_TColStd_HArray1OfReal &
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate (const Handle_TColgp_HArray1OfPnt & Points,const Handle_TColStd_HArray1OfReal & Parameters,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Assigns this constrained BSpline curve to be tangential to vectors InitialTangent and FinalTangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization).

	:param InitialTangent:
	:type InitialTangent: gp_Vec
	:param FinalTangent:
	:type FinalTangent: gp_Vec
	:param Scale: default value is Standard_True
	:type Scale: bool
	:rtype: None
") Load;
		void Load (const gp_Vec & InitialTangent,const gp_Vec & FinalTangent,const Standard_Boolean Scale = Standard_True);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Assigns this constrained BSpline curve to be tangential to vectors defined in the table Tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. Vectors in the table Tangents are defined only if the flag given in the parallel table TangentFlags is true: only these vectors are set as tangency constraints.

	:param Tangents:
	:type Tangents: TColgp_Array1OfVec
	:param TangentFlags:
	:type TangentFlags: Handle_TColStd_HArray1OfBoolean &
	:param Scale: default value is Standard_True
	:type Scale: bool
	:rtype: None
") Load;
		void Load (const TColgp_Array1OfVec & Tangents,const Handle_TColStd_HArray1OfBoolean & TangentFlags,const Standard_Boolean Scale = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the constrained BSpline curve. Use the function IsDone to verify that the computation is successful, and then the function Curve to obtain the result.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the computed BSpline curve. Raises StdFail_NotDone if the interpolation fails.

	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the constrained BSpline curve is successfully constructed. Note: in this case, the result is given by the function Curve.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend GeomAPI_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_PointsToBSpline;
class GeomAPI_PointsToBSpline {
	public:
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "	* Constructs an empty approximation algorithm. Use an Init function to define and build the BSpline curve.

	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline ();
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal &
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion

	:param Points:
	:type Points: TColgp_Array1OfPnt
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
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline (const TColgp_Array1OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point, which parameters are given by the array <Parameters>. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal &
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & Points,const TColStd_Array1OfReal & Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximate a BSpline Curve passing through an array of Point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion

	:param Points:
	:type Points: TColgp_Array1OfPnt
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
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the computed BSpline curve. Raises StdFail_NotDone if the curve is not built.

	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend GeomAPI_PointsToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_PointsToBSplineSurface;
class GeomAPI_PointsToBSplineSurface {
	public:
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	* Constructs an empty algorithm for approximation or interpolation of a surface. Use: - an Init function to define and build the BSpline surface by approximation, or - an Interpolate function to define and build the BSpline surface by interpolation.

	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface ();
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of Points. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColgp_Array2OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of Points. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColgp_Array2OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of points using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion

	:param Points:
	:type Points: TColgp_Array2OfPnt
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
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColgp_Array2OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of Points. //! The points will be constructed as follow: P(i,j) = gp_Pnt( X0 + (i-1)*dX , Y0 + (j-1)*dY , ZPoints(i,j) ) //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D 4- the parametrization of the surface will verify: S->Value( U, V) = gp_Pnt( U, V, Z(U,V) );

	:param ZPoints:
	:type ZPoints: TColStd_Array2OfReal &
	:param X0:
	:type X0: float
	:param dX:
	:type dX: float
	:param Y0:
	:type Y0: float
	:param dY:
	:type dY: float
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface (const TColStd_Array2OfReal & ZPoints,const Standard_Real X0,const Standard_Real dX,const Standard_Real Y0,const Standard_Real dY,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init (const TColgp_Array2OfPnt & Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	* Interpolates a BSpline Surface passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be 3. 2- his continuity will be C2.

	:param Points:
	:type Points: TColgp_Array2OfPnt
	:rtype: None
") Interpolate;
		void Interpolate (const TColgp_Array2OfPnt & Points);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	* Interpolates a BSpline Surface passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be 3. 2- his continuity will be C2.

	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:rtype: None
") Interpolate;
		void Interpolate (const TColgp_Array2OfPnt & Points,const Approx_ParametrizationType ParType);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of Points. //! The points will be constructed as follow: P(i,j) = gp_Pnt( X0 + (i-1)*dX , Y0 + (j-1)*dY , ZPoints(i,j) ) //! The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D 4- the parametrization of the surface will verify: S->Value( U, V) = gp_Pnt( U, V, Z(U,V) );

	:param ZPoints:
	:type ZPoints: TColStd_Array2OfReal &
	:param X0:
	:type X0: float
	:param dX:
	:type dX: float
	:param Y0:
	:type Y0: float
	:param dY:
	:type dY: float
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init (const TColStd_Array2OfReal & ZPoints,const Standard_Real X0,const Standard_Real dX,const Standard_Real Y0,const Standard_Real dY,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	* Interpolates a BSpline Surface passing through an array of Points. //! The points will be constructed as follow: P(i,j) = gp_Pnt( X0 + (i-1)*dX , Y0 + (j-1)*dY , ZPoints(i,j) ) //! The resulting BSpline will have the following properties: 1- his degree will be 3 2- his continuity will be C2. 4- the parametrization of the surface will verify: S->Value( U, V) = gp_Pnt( U, V, Z(U,V) );

	:param ZPoints:
	:type ZPoints: TColStd_Array2OfReal &
	:param X0:
	:type X0: float
	:param dX:
	:type dX: float
	:param Y0:
	:type Y0: float
	:param dY:
	:type dY: float
	:rtype: None
") Interpolate;
		void Interpolate (const TColStd_Array2OfReal & ZPoints,const Standard_Real X0,const Standard_Real dX,const Standard_Real Y0,const Standard_Real dY);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of Point. The resulting BSpline will have the following properties: 1- his degree will be in the range [Degmin,Degmax] 2- his continuity will be at least <Continuity> 3- the distance from the point <Points> to the BSpline will be lower to Tol3D

	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init (const TColgp_Array2OfPnt & Points,const Approx_ParametrizationType ParType,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Approximates a BSpline Surface passing through an array of point using variational smoothing algorithm, which tries to minimize additional criterium: Weight1*CurveLength + Weight2*Curvature + Weight3*Torsion

	:param Points:
	:type Points: TColgp_Array2OfPnt
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
	:rtype: None
") Init;
		void Init (const TColgp_Array2OfPnt & Points,const Standard_Real Weight1,const Standard_Real Weight2,const Standard_Real Weight3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the approximate BSpline Surface

	:rtype: Handle_Geom_BSplineSurface
") Surface;
		Handle_Geom_BSplineSurface Surface ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend GeomAPI_PointsToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_ProjectPointOnCurve;
class GeomAPI_ProjectPointOnCurve {
	public:
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "	* Creates an empty object. Use an Init function for further initialization.

	:rtype: None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve ();
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "	* Create the projection of a point <P> on a curve <Curve>

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:rtype: None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve (const gp_Pnt & P,const Handle_Geom_Curve & Curve);
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "	* Create the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:rtype: None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve (const gp_Pnt & P,const Handle_Geom_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Init the projection of a point <P> on a curve <Curve>

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Curve & Curve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Init the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:rtype: None
") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Init the projection of a point <P> on a curve <Curve> limited by the two points of parameter Umin and Usup.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & Curve,const Quantity_Parameter Umin,const Quantity_Parameter Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the projection of a point on the current curve.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of computed orthogonal projection points. Note: if this algorithm fails, NbPoints returns 0.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") operator Standard_Integer;
		%feature("autodoc", "	:rtype: 
") operator Standard_Integer;
		 operator Standard_Integer ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the orthogonal projection on the curve. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on the curve of the point, which is the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: Quantity_Parameter
") Parameter;
		Quantity_Parameter Parameter (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on the curve of the point, which is the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.-

	:param Index:
	:type Index: int
	:param U:
	:type U: Quantity_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between the point and its orthogonal projection on the curve. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "	* Returns the nearest orthogonal projection of the point on the curve. Exceptions: StdFail_NotDone if this algorithm fails.

	:rtype: gp_Pnt
") NearestPoint;
		gp_Pnt NearestPoint ();
		%feature("compactdefaultargs") operator gp_Pnt;
		%feature("autodoc", "	:rtype: 
") operator gp_Pnt;
		 operator gp_Pnt ();
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "	* Returns the parameter on the curve of the nearest orthogonal projection of the point. Exceptions: StdFail_NotDone if this algorithm fails.

	:rtype: Quantity_Parameter
") LowerDistanceParameter;
		Quantity_Parameter LowerDistanceParameter ();
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "	* Computes the distance between the point and its nearest orthogonal projection on the curve. Exceptions: StdFail_NotDone if this algorithm fails.

	:rtype: Quantity_Length
") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("compactdefaultargs") operator Standard_Real;
		%feature("autodoc", "	:rtype: 
") operator Standard_Real;
		 operator Standard_Real ();
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "	* return the algorithmic object from Extrema

	:rtype: Extrema_ExtPC
") Extrema;
		const Extrema_ExtPC & Extrema ();
};


%extend GeomAPI_ProjectPointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAPI_ProjectPointOnSurf;
class GeomAPI_ProjectPointOnSurf {
	public:
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "	* Creates an empty object. Use the Init function for further initialization.

	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf ();
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "	* Create the projection of a point <P> on a surface <Surface>

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "	* Create the projection of a point <P> on a surface <Surface> Create the projection of a point <P> on a surface <Surface>. The solution are computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vsup:
	:type Vsup: Quantity_Parameter
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "	* Init the projection of a point <P> on a surface <Surface>

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vsup:
	:type Vsup: Quantity_Parameter
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Init the projection of a point <P> on a surface <Surface>. The solution are computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vsup:
	:type Vsup: Quantity_Parameter
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Init the projection for many points on a surface <Surface>. The solutions will be computed in the domain [Umin,Usup] [Vmin,Vsup] of the surface.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vsup:
	:type Vsup: Quantity_Parameter
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init (const gp_Pnt & P,const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vsup:
	:type Vsup: Quantity_Parameter
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Standard_Real Tolerance,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Umin:
	:type Umin: Quantity_Parameter
	:param Usup:
	:type Usup: Quantity_Parameter
	:param Vmin:
	:type Vmin: Quantity_Parameter
	:param Vsup:
	:type Vsup: Quantity_Parameter
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & Surface,const Quantity_Parameter Umin,const Quantity_Parameter Usup,const Quantity_Parameter Vmin,const Quantity_Parameter Vsup,const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the projection of a point on the current surface.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of computed orthogonal projection points. Note: if projection fails, NbPoints returns 0.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") operator Standard_Integer;
		%feature("autodoc", "	:rtype: 
") operator Standard_Integer;
		 operator Standard_Integer ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the orthogonal projection on the surface. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters (U,V) on the surface of the orthogonal projection. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.

	:param Index:
	:type Index: int
	:param U:
	:type U: Quantity_Parameter &
	:param V:
	:type V: Quantity_Parameter &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between the point and its orthogonal projection on the surface. Index is a number of a computed point. Exceptions Standard_OutOfRange if Index is not in the range [ 1,NbPoints ], where NbPoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") Distance;
		Quantity_Length Distance (const Standard_Integer Index);
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "	* Returns the nearest orthogonal projection of the point on the surface. Exceptions StdFail_NotDone if projection fails.

	:rtype: gp_Pnt
") NearestPoint;
		gp_Pnt NearestPoint ();
		%feature("compactdefaultargs") operator gp_Pnt;
		%feature("autodoc", "	:rtype: 
") operator gp_Pnt;
		 operator gp_Pnt ();
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "	* Returns the parameters (U,V) on the surface of the nearest computed orthogonal projection of the point. Exceptions StdFail_NotDone if projection fails.

	:param U:
	:type U: Quantity_Parameter &
	:param V:
	:type V: Quantity_Parameter &
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "	* Computes the distance between the point and its nearest orthogonal projection on the surface. Exceptions StdFail_NotDone if projection fails.

	:rtype: Quantity_Length
") LowerDistance;
		Quantity_Length LowerDistance ();
		%feature("compactdefaultargs") operator Standard_Real;
		%feature("autodoc", "	:rtype: 
") operator Standard_Real;
		 operator Standard_Real ();
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "	* return the algorithmic object from Extrema

	:rtype: Extrema_ExtPS
") Extrema;
		const Extrema_ExtPS & Extrema ();
};


%extend GeomAPI_ProjectPointOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
