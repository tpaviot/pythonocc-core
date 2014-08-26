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
%module GeomLib

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

%include GeomLib_required_python_modules.i
%include GeomLib_headers.i

/* typedefs */
typedef GeomLib_DenominatorMultiplier * GeomLib_DenominatorMultiplierPtr;
/* end typedefs declaration */

/* public enums */
enum GeomLib_InterpolationErrors {
	GeomLib_NoError = 0,
	GeomLib_NotEnoughtPoints = 1,
	GeomLib_DegreeSmallerThan3 = 2,
	GeomLib_InversionProblem = 3,
};

/* end public enums declaration */

%rename(geomlib) GeomLib;
%nodefaultctor GeomLib;
class GeomLib {
	public:
		%feature("autodoc", "Args:
	Position(gp_Ax2)
	Curve2d(Handle_Geom2d_Curve)

Returns:
	static Handle_Geom_Curve

Computes     the  curve  3d    from  package  Geom  
         corresponding to curve 2d  from package Geom2d, on  
         the plan defined with the local coordinate system  
         Position.") To3d;
		static Handle_Geom_Curve To3d (const gp_Ax2 & Position,const Handle_Geom2d_Curve & Curve2d);
		%feature("autodoc", "Args:
	Curve(Handle_Geom2d_Curve)
	GTrsf(gp_GTrsf2d)

Returns:
	static Handle_Geom2d_Curve

Computes the    curve    3d  from   package   Geom  
         corresponding  to the curve  3d from package Geom,  
         transformed with the transformation <GTrsf>  
         WARNING : this method may return a null Handle if  
         it's impossible to compute the transformation of  
         a curve. It's not implemented when :  
         1) the curve is an infinite parabola or hyperbola  
         2) the curve is an offsetcurve") GTransform;
		static Handle_Geom2d_Curve GTransform (const Handle_Geom2d_Curve & Curve,const gp_GTrsf2d & GTrsf);
		%feature("autodoc", "Args:
	Tolerance(Standard_Real)
	Curve2dPtr(Handle_Geom2d_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	RequestedFirst(Standard_Real)
	RequestedLast(Standard_Real)
	NewCurve2dPtr(Handle_Geom2d_Curve)

Returns:
	static void

Make the curve Curve2dPtr have the imposed  
         range First to List the most economic way,  
         that is if it can change the range without  
         changing the nature of the curve it will try  
         to do that. Otherwise it will produce a Bspline  
         curve that has the required range") SameRange;
		static void SameRange (const Standard_Real Tolerance,const Handle_Geom2d_Curve & Curve2dPtr,const Standard_Real First,const Standard_Real Last,const Standard_Real RequestedFirst,const Standard_Real RequestedLast,Handle_Geom2d_Curve & NewCurve2dPtr);
		%feature("autodoc", "Args:
	Tolerance(Standard_Real)
	CurvePtr(Adaptor3d_CurveOnSurface)
	FirstParameter(Standard_Real)
	LastParameter(Standard_Real)
	NewCurvePtr(Handle_Geom_Curve)
	MaxDeviation(Standard_Real)
	AverageDeviation(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1
	MaxDegree(Standard_Integer)=14
	MaxSegment(Standard_Integer)=30

Returns:
	static void

No detailed docstring for this function.") BuildCurve3d;
		static void BuildCurve3d (const Standard_Real Tolerance,Adaptor3d_CurveOnSurface & CurvePtr,const Standard_Real FirstParameter,const Standard_Real LastParameter,Handle_Geom_Curve & NewCurvePtr,Standard_Real &OutValue,Standard_Real &OutValue,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Integer MaxDegree = 14,const Standard_Integer MaxSegment = 30);
		%feature("autodoc", "Args:
	Curve(Handle_Geom_BoundedCurve)
	P1(gp_Pnt)
	P2(gp_Pnt)
	T1(gp_Vec)
	T2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") AdjustExtremity;
		static void AdjustExtremity (Handle_Geom_BoundedCurve & Curve,const gp_Pnt & P1,const gp_Pnt & P2,const gp_Vec & T1,const gp_Vec & T2);
		%feature("autodoc", "Args:
	Curve(Handle_Geom_BoundedCurve)
	Point(gp_Pnt)
	Cont(Standard_Integer)
	After(Standard_Boolean)

Returns:
	static void

Extends the bounded curve Curve to the point Point.  
The extension is built:  
-      at the end of the curve if After equals true, or  
-      at the beginning of the curve if After equals false.  
  The extension is performed according to a degree of  
continuity equal to Cont, which in its turn must be equal to 1, 2 or 3.  
This function converts the bounded curve Curve into a BSpline curve.  
Warning  
-   Nothing is done, and Curve is not modified if Cont is  
  not equal to 1, 2 or 3.  
-   It is recommended that the extension should not be  
  too large with respect to the size of the bounded  
  curve Curve: Point must not be located too far from  
  one of the extremities of Curve.") ExtendCurveToPoint;
		static void ExtendCurveToPoint (Handle_Geom_BoundedCurve & Curve,const gp_Pnt & Point,const Standard_Integer Cont,const Standard_Boolean After);
		%feature("autodoc", "Args:
	Surf(Handle_Geom_BoundedSurface)
	Length(Standard_Real)
	Cont(Standard_Integer)
	InU(Standard_Boolean)
	After(Standard_Boolean)

Returns:
	static void

Extends the bounded surface Surf along one of its  
boundaries. The chord length of the extension is equal to Length.  
The direction of the extension is given as:  
-   the u parametric direction of Surf, if InU equals true,   or  
-   the v parametric direction of Surf, if InU equals false.  
In this parametric direction, the extension is built on the side of:  
-   the last parameter of Surf, if After equals true, or  
-   the first parameter of Surf, if After equals false.  
The extension is performed according to a degree of  
continuity equal to Cont, which in its turn must be equal to 1, 2 or 3.  
This function converts the bounded surface Surf into a BSpline surface.  
Warning  
-   Nothing is done, and Surf is not modified if Cont is  
  not equal to 1, 2 or 3.  
-   It is recommended that Length, the size of the  
  extension should not be too large with respect to the  
 size of the bounded surface Surf.  
-   Surf must not be a periodic BSpline surface in the  
  parametric direction corresponding to the direction of extension.") ExtendSurfByLength;
		static void ExtendSurfByLength (Handle_Geom_BoundedSurface & Surf,const Standard_Real Length,const Standard_Integer Cont,const Standard_Boolean InU,const Standard_Boolean After);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	Axe(gp_Ax2)
	IsSingular(Standard_Boolean)
	Tol(Standard_Real)=1.0e-7

Returns:
	static void

Compute   axes of inertia,  of some  points --  -- --  
         <Axe>.Location() is the   BaryCentre -- -- --   -- --  
         <Axe>.XDirection is the axe of upper inertia -- -- --  
         -- <Axe>.Direction is the Normal to the average plane  
         -- -- -- IsSingular is True if  points are on line --  
         Tol is used to determine singular cases.") AxeOfInertia;
		static void AxeOfInertia (const TColgp_Array1OfPnt & Points,gp_Ax2 & Axe,Standard_Boolean & IsSingular,const Standard_Real Tol = 1.0e-7);
		%feature("autodoc", "Args:
	Points(TColgp_Array1OfPnt)
	Bary(gp_Pnt)
	XDir(gp_Dir)
	YDir(gp_Dir)
	Xgap(Standard_Real)
	YGap(Standard_Real)
	ZGap(Standard_Real)

Returns:
	static void

Compute principale axes  of  inertia, and dispertion  
           value  of some  points.") Inertia;
		static void Inertia (const TColgp_Array1OfPnt & Points,gp_Pnt & Bary,gp_Dir & XDir,gp_Dir & YDir,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	NumPoints(Standard_Integer)
	InParameters(TColStd_Array1OfReal)
	OutParameters(Handle_TColStd_HArray1OfReal)

Returns:
	static void

Warning!  This assume that the InParameter is an increasing sequence  
         of real number and it will not check for that : Unpredictable  
         result can happen if this is not satisfied. It is the caller  
         responsability to check for that property.  
 
 This  method makes uniform NumPoints segments S1,...SNumPoints out  
         of the segment defined by the first parameter and the  
         last  parameter ofthe  InParameter ; keeps   only one  
         point of the InParameters set of parameter in each of  
         the uniform segments taking care of the first and the  
         last   parameters. For the ith segment the element of  
         the InParameter is the one that is the first to exceed  
         the midpoint of the segment and to fall before the  
         midpoint of the next segment  
           There  will be  at  the  end at   most NumPoints + 1  if  
         NumPoints > 2 in the OutParameters Array") RemovePointsFromArray;
		static void RemovePointsFromArray (const Standard_Integer NumPoints,const TColStd_Array1OfReal & InParameters,Handle_TColStd_HArray1OfReal & OutParameters);
		%feature("autodoc", "Args:
	MinNumPoints(Standard_Integer)
	InParameters(TColStd_Array1OfReal)
	OutParameters(Handle_TColStd_HArray1OfReal)

Returns:
	static void

this  makes sure that there  is at least MinNumPoints  
         in OutParameters taking into account the parameters in  
         the InParameters array provided those are in order,  
         that is the sequence of real in the InParameter is strictly  
         non decreasing") DensifyArray1OfReal;
		static void DensifyArray1OfReal (const Standard_Integer MinNumPoints,const TColStd_Array1OfReal & InParameters,Handle_TColStd_HArray1OfReal & OutParameters);
		%feature("autodoc", "Args:
	Interval1(TColStd_Array1OfReal)
	Interval2(TColStd_Array1OfReal)
	Fusion(TColStd_SequenceOfReal)
	Confusion(Standard_Real)=1.0e-9

Returns:
	static void

No detailed docstring for this function.") FuseIntervals;
		static void FuseIntervals (const TColStd_Array1OfReal & Interval1,const TColStd_Array1OfReal & Interval2,TColStd_SequenceOfReal & Fusion,const Standard_Real Confusion = 1.0e-9);
		%feature("autodoc", "Args:
	Curve(Adaptor3d_Curve)
	AReferenceCurve(Adaptor3d_Curve)
	Tolerance(Standard_Real)
	Parameters(TColStd_Array1OfReal)
	MaxDistance(Standard_Real)

Returns:
	static void

this  will compute   the   maximum distance  at  the  
         parameters  given    in   the Parameters  array    by  
         evaluating each parameter  the two curves  and taking  
         the maximum of the evaluated distance") EvalMaxParametricDistance;
		static void EvalMaxParametricDistance (const Adaptor3d_Curve & Curve,const Adaptor3d_Curve & AReferenceCurve,const Standard_Real Tolerance,const TColStd_Array1OfReal & Parameters,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Curve(Adaptor3d_Curve)
	AReferenceCurve(Adaptor3d_Curve)
	Tolerance(Standard_Real)
	Parameters(TColStd_Array1OfReal)
	MaxDistance(Standard_Real)

Returns:
	static void

this will compute the maximum distancef at the parameters  
         given in the Parameters array by projecting from the Curve  
         to the reference curve and taking the minimum distance  
         Than the maximum will be taken on those minimas.") EvalMaxDistanceAlongParameter;
		static void EvalMaxDistanceAlongParameter (const Adaptor3d_Curve & Curve,const Adaptor3d_Curve & AReferenceCurve,const Standard_Real Tolerance,const TColStd_Array1OfReal & Parameters,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	BSurf(Handle_Geom_BSplineSurface)
	UDirection(Standard_Boolean)
	VDirection(Standard_Boolean)

Returns:
	static void

Cancel,on the boudaries,the denominator  first derivative  
         in  the directions wished by the user and set its value to 1.") CancelDenominatorDerivative;
		static void CancelDenominatorDerivative (Handle_Geom_BSplineSurface & BSurf,const Standard_Boolean UDirection,const Standard_Boolean VDirection);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UV(gp_Pnt2d)
	Tol(Standard_Real)
	N(gp_Dir)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NormEstim;
		static Standard_Integer NormEstim (const Handle_Geom_Surface & S,const gp_Pnt2d & UV,const Standard_Real Tol,gp_Dir & N);
};


%feature("shadow") GeomLib::~GeomLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_Array1OfMat;
class GeomLib_Array1OfMat {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomLib_Array1OfMat;
		 GeomLib_Array1OfMat (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(gp_Mat)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomLib_Array1OfMat;
		 GeomLib_Array1OfMat (const gp_Mat & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(gp_Mat)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Mat & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(GeomLib_Array1OfMat)

Returns:
	GeomLib_Array1OfMat

No detailed docstring for this function.") Assign;
		const GeomLib_Array1OfMat & Assign (const GeomLib_Array1OfMat & Other);
		%feature("autodoc", "Args:
	Other(GeomLib_Array1OfMat)

Returns:
	GeomLib_Array1OfMat

No detailed docstring for this function.") operator=;
		const GeomLib_Array1OfMat & operator = (const GeomLib_Array1OfMat & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(gp_Mat)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Mat & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Mat

No detailed docstring for this function.") Value;
		const gp_Mat & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Mat

No detailed docstring for this function.") ChangeValue;
		gp_Mat & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") GeomLib_Array1OfMat::~GeomLib_Array1OfMat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_Array1OfMat {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_Check2dBSplineCurve;
class GeomLib_Check2dBSplineCurve {
	public:
		%feature("autodoc", "Args:
	Curve(Handle_Geom2d_BSplineCurve)
	Tolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GeomLib_Check2dBSplineCurve;
		 GeomLib_Check2dBSplineCurve (const Handle_Geom2d_BSplineCurve & Curve,const Standard_Real Tolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	FirstFlag(Standard_Boolean)
	SecondFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") NeedTangentFix;
		void NeedTangentFix (Standard_Boolean & FirstFlag,Standard_Boolean & SecondFlag);
		%feature("autodoc", "Args:
	FirstFlag(Standard_Boolean)
	LastFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") FixTangent;
		void FixTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
		%feature("autodoc", "Args:
	FirstFlag(Standard_Boolean)
	LastFlag(Standard_Boolean)

Returns:
	Handle_Geom2d_BSplineCurve

modifies the curve  
by fixing the first or the last tangencies  
 if Index3D not in the Range [1,Nb3dSpaces]  if the Approx is not Done") FixedTangent;
		Handle_Geom2d_BSplineCurve FixedTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
};


%feature("shadow") GeomLib_Check2dBSplineCurve::~GeomLib_Check2dBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_Check2dBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_CheckBSplineCurve;
class GeomLib_CheckBSplineCurve {
	public:
		%feature("autodoc", "Args:
	Curve(Handle_Geom_BSplineCurve)
	Tolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GeomLib_CheckBSplineCurve;
		 GeomLib_CheckBSplineCurve (const Handle_Geom_BSplineCurve & Curve,const Standard_Real Tolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	FirstFlag(Standard_Boolean)
	SecondFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") NeedTangentFix;
		void NeedTangentFix (Standard_Boolean & FirstFlag,Standard_Boolean & SecondFlag);
		%feature("autodoc", "Args:
	FirstFlag(Standard_Boolean)
	LastFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") FixTangent;
		void FixTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
		%feature("autodoc", "Args:
	FirstFlag(Standard_Boolean)
	LastFlag(Standard_Boolean)

Returns:
	Handle_Geom_BSplineCurve

modifies the curve  
by fixing the first or the last tangencies  
 if Index3D not in the Range [1,Nb3dSpaces]  if the Approx is not Done") FixedTangent;
		Handle_Geom_BSplineCurve FixedTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
};


%feature("shadow") GeomLib_CheckBSplineCurve::~GeomLib_CheckBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_CheckBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_DenominatorMultiplier;
class GeomLib_DenominatorMultiplier {
	public:
		%feature("autodoc", "Args:
	Surface(Handle_Geom_BSplineSurface)
	KnotVector(TColStd_Array1OfReal)

Returns:
	None

if the surface is rational this will define the evaluator  
         of a real function of 2 variables a(u,v) such that  
         if we define a new surface by :  
                      a(u,v) * N(u,v)  
         NewF(u,v) = ----------------  
                      a(u,v) * D(u,v)") GeomLib_DenominatorMultiplier;
		 GeomLib_DenominatorMultiplier (const Handle_Geom_BSplineSurface & Surface,const TColStd_Array1OfReal & KnotVector);
		%feature("autodoc", "Args:
	UParameter(Standard_Real)
	VParameter(Standard_Real)

Returns:
	Standard_Real

Returns the value of  
         a(UParameter,VParameter)=  
 
           H0(UParameter)/Denominator(Umin,Vparameter)  
 
           D Denominator(Umin,Vparameter)  
         - ------------------------------[H1(u)]/(Denominator(Umin,Vparameter)^2)  
           D U  
 
         + H3(UParameter)/Denominator(Umax,Vparameter)  
 
           D Denominator(Umax,Vparameter)  
         - ------------------------------[H2(u)]/(Denominator(Umax,Vparameter)^2)  
           D U") Value;
		Standard_Real Value (const Standard_Real UParameter,const Standard_Real VParameter);
};


%feature("shadow") GeomLib_DenominatorMultiplier::~GeomLib_DenominatorMultiplier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_DenominatorMultiplier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_Interpolate;
class GeomLib_Interpolate {
	public:
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NumPoints(Standard_Integer)
	Points(TColgp_Array1OfPnt)
	Parameters(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") GeomLib_Interpolate;
		 GeomLib_Interpolate (const Standard_Integer Degree,const Standard_Integer NumPoints,const TColgp_Array1OfPnt & Points,const TColStd_Array1OfReal & Parameters);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns if everything went OK") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomLib_InterpolationErrors

returns the error type if any") Error;
		GeomLib_InterpolationErrors Error ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

returns the interpolated curve of the requested degree") Curve;
		Handle_Geom_BSplineCurve Curve ();
};


%feature("shadow") GeomLib_Interpolate::~GeomLib_Interpolate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_Interpolate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_IsPlanarSurface;
class GeomLib_IsPlanarSurface {
	public:
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	Tol(Standard_Real)=1.0e-7

Returns:
	None

No detailed docstring for this function.") GeomLib_IsPlanarSurface;
		 GeomLib_IsPlanarSurface (const Handle_Geom_Surface & S,const Standard_Real Tol = 1.0e-7);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Return if the Surface is a plan") IsPlanar;
		Standard_Boolean IsPlanar ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

Return the plan definition") Plan;
		const gp_Pln & Plan ();
};


%feature("shadow") GeomLib_IsPlanarSurface::~GeomLib_IsPlanarSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_IsPlanarSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_LogSample;
class GeomLib_LogSample : public math_FunctionSample {
	public:
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomLib_LogSample;
		 GeomLib_LogSample (const Standard_Real A,const Standard_Real B,const Standard_Integer N);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	virtual Standard_Real

Returns the value of parameter of the point of  
         range Index : A + ((Index-1)/(NbPoints-1))*B.  
         An exception is raised if Index<=0 or Index>NbPoints.") GetParameter;
		virtual Standard_Real GetParameter (const Standard_Integer Index);
};


%feature("shadow") GeomLib_LogSample::~GeomLib_LogSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_LogSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_MakeCurvefromApprox;
class GeomLib_MakeCurvefromApprox {
	public:
		%feature("autodoc", "Args:
	Approx(AdvApprox_ApproxAFunction)

Returns:
	None

No detailed docstring for this function.") GeomLib_MakeCurvefromApprox;
		 GeomLib_MakeCurvefromApprox (const AdvApprox_ApproxAFunction & Approx);
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

returns the number of 1D spaces of the Approx") Nb1DSpaces;
		Standard_Integer Nb1DSpaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of 3D spaces of the Approx") Nb2DSpaces;
		Standard_Integer Nb2DSpaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of 3D spaces of the Approx") Nb3DSpaces;
		Standard_Integer Nb3DSpaces ();
		%feature("autodoc", "Args:
	Index2d(Standard_Integer)

Returns:
	Handle_Geom2d_BSplineCurve

returns a polynomial curve whose poles correspond to  
the Index2d 2D space  if Index2d not in the Range [1,Nb2dSpaces]  if the Approx is not Done") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d (const Standard_Integer Index2d);
		%feature("autodoc", "Args:
	Index1d(Standard_Integer)
	Index2d(Standard_Integer)

Returns:
	Handle_Geom2d_BSplineCurve

returns a 2D curve building it from the 1D curve  
         in x at Index1d and y at Index2d amongst the  
         1D curves  if Index1d not in the Range [1,Nb1dSpaces]  
         if Index2d not in the Range [1,Nb1dSpaces]  if the Approx is not Done") Curve2dFromTwo1d;
		Handle_Geom2d_BSplineCurve Curve2dFromTwo1d (const Standard_Integer Index1d,const Standard_Integer Index2d);
		%feature("autodoc", "Args:
	Index1d(Standard_Integer)
	Index2d(Standard_Integer)

Returns:
	Handle_Geom2d_BSplineCurve

returns a rational curve whose poles correspond to  
the index2d of the 2D space and whose weights correspond  
to one dimensional space of index 1d  if Index1d not in the Range [1,Nb1dSpaces]  
         if Index2d not in the Range [1,Nb2dSpaces]  if the Approx is not Done") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d (const Standard_Integer Index1d,const Standard_Integer Index2d);
		%feature("autodoc", "Args:
	Index3d(Standard_Integer)

Returns:
	Handle_Geom_BSplineCurve

returns a polynomial curve whose poles correspond to  
the Index3D 3D space  if Index3D not in the Range [1,Nb3dSpaces]  if the Approx is not Done") Curve;
		Handle_Geom_BSplineCurve Curve (const Standard_Integer Index3d);
		%feature("autodoc", "Args:
	Index1D(Standard_Integer)
	Index3D(Standard_Integer)

Returns:
	Handle_Geom_BSplineCurve

returns a rational curve whose poles correspond to  
the index3D of the 3D space and whose weights correspond  
to the index1d 1D space.  if Index1D not in the Range [1,Nb1dSpaces]  
         if Index3D not in the Range [1,Nb3dSpaces]  if the Approx is not Done") Curve;
		Handle_Geom_BSplineCurve Curve (const Standard_Integer Index1D,const Standard_Integer Index3D);
};


%feature("shadow") GeomLib_MakeCurvefromApprox::~GeomLib_MakeCurvefromApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_MakeCurvefromApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_PolyFunc;
class GeomLib_PolyFunc : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	Coeffs(math_Vector)

Returns:
	None

No detailed docstring for this function.") GeomLib_PolyFunc;
		 GeomLib_PolyFunc (const math_Vector & Coeffs);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	virtual Standard_Boolean

computes the value <F>of the function for the variable <X>.  
         Returns True if the calculation were successfully done,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	virtual Standard_Boolean

computes the derivative <D> of the function  
         for the variable <X>.  
          Returns True if the calculation were successfully done,  
          False otherwise.") Derivative;
		virtual Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	virtual Standard_Boolean

computes the value <F> and the derivative <D> of the  
         function for the variable <X>.  
         Returns True if the calculation were successfully done,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") GeomLib_PolyFunc::~GeomLib_PolyFunc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_PolyFunc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLib_Tool;
class GeomLib_Tool {
	public:
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	Point(gp_Pnt)
	Tolerance(Standard_Real)
	U(Standard_Real)

Returns:
	static Standard_Boolean

Extracts the parameter of a 3D point lying on a 3D curve  
or at a distance less than the tolerance value.") Parameter;
		static Standard_Boolean Parameter (const Handle_Geom_Curve & Curve,const gp_Pnt & Point,const Standard_Real Tolerance,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Surface(Handle_Geom_Surface)
	Point(gp_Pnt)
	Tolerance(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static Standard_Boolean

Extracts the parameter of a 3D point lying on a surface  
or at a distance less than the tolerance value.") Parameters;
		static Standard_Boolean Parameters (const Handle_Geom_Surface & Surface,const gp_Pnt & Point,const Standard_Real Tolerance,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Curve(Handle_Geom2d_Curve)
	Point(gp_Pnt2d)
	Tolerance(Standard_Real)
	U(Standard_Real)

Returns:
	static Standard_Boolean

Extracts the parameter of a 2D point lying on a 2D curve  
or at a distance less than the tolerance value.") Parameter;
		static Standard_Boolean Parameter (const Handle_Geom2d_Curve & Curve,const gp_Pnt2d & Point,const Standard_Real Tolerance,Standard_Real &OutValue);
};


%feature("shadow") GeomLib_Tool::~GeomLib_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLib_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
