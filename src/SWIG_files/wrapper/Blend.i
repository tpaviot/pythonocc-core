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
%module (package="OCC") Blend

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

%include Blend_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Blend_DecrochStatus {
	Blend_NoDecroch = 0,
	Blend_DecrochRst1 = 1,
	Blend_DecrochRst2 = 2,
	Blend_DecrochBoth = 3,
};

enum Blend_Status {
	Blend_StepTooLarge = 0,
	Blend_StepTooSmall = 1,
	Blend_Backward = 2,
	Blend_SamePoints = 3,
	Blend_OnRst1 = 4,
	Blend_OnRst2 = 5,
	Blend_OnRst12 = 6,
	Blend_OK = 7,
};

/* end public enums declaration */

%nodefaultctor Blend_AppFunction;
class Blend_AppFunction : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of variables of the function.") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	virtual void

Sets the value of the parameter along the guide line.  
         This determines the plane in which the solution has  
         to be found.") Set;
		virtual void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual void

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each of the 4 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each of the 4 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 4 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.  
         The computation is made at the current value of  
         the parameter on the guide line.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the first support.") Pnt1;
		virtual const gp_Pnt & Pnt1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the first support.") Pnt2;
		virtual const gp_Pnt & Pnt2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns  if the section is rationnal") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the length of the maximum section") GetSectionSize;
		virtual Standard_Real GetSectionSize ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the minimal value of weight for each poles  
         of all sections.") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()  
   raises  
   	OutOfRange from Standard") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	virtual void

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

No detailed docstring for this function.") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	IC2d(Standard_Integer)
	Tol(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") Resolution;
		virtual void Resolution (const Standard_Integer IC2d,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(Blend_Point)

Returns:
	Standard_Real

Returns  the parameter  of  the point  P. Used  to  
         impose the parameters in the approximation.") Parameter;
		Standard_Real Parameter (const Blend_Point & P);
};


%feature("shadow") Blend_AppFunction::~Blend_AppFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_AppFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_CurvPointFuncInv;
class Blend_CurvPointFuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 3.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	virtual void

Set the Point on which a solution has to be found.") Set;
		virtual void Set (const gp_Pnt & P);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") Blend_CurvPointFuncInv::~Blend_CurvPointFuncInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_CurvPointFuncInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_FuncInv;
class Blend_FuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 4.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	OnFirst(Standard_Boolean)
	COnSurf(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual void

Sets the CurveOnSurface on which a solution has  
         to be found. If <OnFirst> is set to Standard_True,  
         the curve will be on the first surface, otherwise the  
         curve is on the second one.") Set;
		virtual void Set (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & COnSurf);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each of the 4 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each of the 4 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 4 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") Blend_FuncInv::~Blend_FuncInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_FuncInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_Point;
class Blend_Point {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Blend_Point;
		 Blend_Point ();
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	Tg1(gp_Vec)
	Tg2(gp_Vec)
	Tg12d(gp_Vec2d)
	Tg22d(gp_Vec2d)

Returns:
	None

Creates a point on 2 surfaces, with tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Creates a point on 2 surfaces, without tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("autodoc", "Args:
	Pts(gp_Pnt)
	Ptc(gp_Pnt)
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	Tgs(gp_Vec)
	Tgc(gp_Vec)
	Tg2d(gp_Vec2d)

Returns:
	None

Creates a point on a surface and a curve, with tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,const gp_Vec & Tgs,const gp_Vec & Tgc,const gp_Vec2d & Tg2d);
		%feature("autodoc", "Args:
	Pts(gp_Pnt)
	Ptc(gp_Pnt)
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)

Returns:
	None

Creates a point on a surface and a curve, without tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC(Standard_Real)
	Tg1(gp_Vec)
	Tg2(gp_Vec)
	Tg12d(gp_Vec2d)
	Tg22d(gp_Vec2d)

Returns:
	None

Creates a point on a surface and a curve on surface,  
         with tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC(Standard_Real)

Returns:
	None

Creates a point on a surface and a curve on surface,  
         without tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC1(Standard_Real)
	PC2(Standard_Real)
	Tg1(gp_Vec)
	Tg2(gp_Vec)
	Tg12d(gp_Vec2d)
	Tg22d(gp_Vec2d)

Returns:
	None

Creates a point on two curves on surfaces, with tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC1(Standard_Real)
	PC2(Standard_Real)

Returns:
	None

Creates a point on two curves on surfaces, with tangents.") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	Tg1(gp_Vec)
	Tg2(gp_Vec)
	Tg12d(gp_Vec2d)
	Tg22d(gp_Vec2d)

Returns:
	None

Set the values for a point on 2 surfaces, with tangents.") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Set the values for a point on 2 surfaces, without tangents.") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("autodoc", "Args:
	Pts(gp_Pnt)
	Ptc(gp_Pnt)
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	Tgs(gp_Vec)
	Tgc(gp_Vec)
	Tg2d(gp_Vec2d)

Returns:
	None

Set the values for a point on a surface and a curve,  
         with tangents.") SetValue;
		void SetValue (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,const gp_Vec & Tgs,const gp_Vec & Tgc,const gp_Vec2d & Tg2d);
		%feature("autodoc", "Args:
	Pts(gp_Pnt)
	Ptc(gp_Pnt)
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)

Returns:
	None

Set the values for a point on a surface and a curve,  
         without tangents.") SetValue;
		void SetValue (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC(Standard_Real)
	Tg1(gp_Vec)
	Tg2(gp_Vec)
	Tg12d(gp_Vec2d)
	Tg22d(gp_Vec2d)

Returns:
	None

Creates a point on a surface and a curve on surface,  
         with tangents.") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC(Standard_Real)

Returns:
	None

Creates a point on a surface and a curve on surface,  
         without tangents.") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC1(Standard_Real)
	PC2(Standard_Real)
	Tg1(gp_Vec)
	Tg2(gp_Vec)
	Tg12d(gp_Vec2d)
	Tg22d(gp_Vec2d)

Returns:
	None

Creates a point on two curves on surfaces, with tangents.") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	PC1(Standard_Real)
	PC2(Standard_Real)

Returns:
	None

Creates a point on two curves on surfaces, without tangents.") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2);
		%feature("autodoc", "Args:
	Pt1(gp_Pnt)
	Pt2(gp_Pnt)
	Param(Standard_Real)
	PC1(Standard_Real)
	PC2(Standard_Real)

Returns:
	None

Creates a point on two curves.") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real PC1,const Standard_Real PC2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if it was not possible to compute  
         the tangent vectors at PointOnS1 and/or PointOnS2.") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnS1;
		const gp_Pnt & PointOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnS2;
		const gp_Pnt & PointOnS2 ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnS1;
		const gp_Vec & TangentOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnS2;
		const gp_Vec & TangentOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnS1;
		gp_Vec2d Tangent2dOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnS2;
		gp_Vec2d Tangent2dOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnS;
		const gp_Pnt & PointOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnC;
		const gp_Pnt & PointOnC ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParametersOnS;
		void ParametersOnS (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnC;
		Standard_Real ParameterOnC ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnS;
		const gp_Vec & TangentOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnC;
		const gp_Vec & TangentOnC ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2d;
		gp_Vec2d Tangent2d ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnC1;
		const gp_Pnt & PointOnC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnC2;
		const gp_Pnt & PointOnC2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnC1;
		Standard_Real ParameterOnC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnC2;
		Standard_Real ParameterOnC2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnC1;
		const gp_Vec & TangentOnC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnC2;
		const gp_Vec & TangentOnC2 ();
};


%feature("shadow") Blend_Point::~Blend_Point %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_Point {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_SequenceNodeOfSequenceOfPoint;
class Blend_SequenceNodeOfSequenceOfPoint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Blend_Point)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Blend_SequenceNodeOfSequenceOfPoint;
		 Blend_SequenceNodeOfSequenceOfPoint (const Blend_Point & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Blend_Point

No detailed docstring for this function.") Value;
		Blend_Point & Value ();
};


%feature("shadow") Blend_SequenceNodeOfSequenceOfPoint::~Blend_SequenceNodeOfSequenceOfPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_SequenceNodeOfSequenceOfPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Blend_SequenceNodeOfSequenceOfPoint {
	Handle_Blend_SequenceNodeOfSequenceOfPoint GetHandle() {
	return *(Handle_Blend_SequenceNodeOfSequenceOfPoint*) &$self;
	}
};

%nodefaultctor Handle_Blend_SequenceNodeOfSequenceOfPoint;
class Handle_Blend_SequenceNodeOfSequenceOfPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Blend_SequenceNodeOfSequenceOfPoint();
        Handle_Blend_SequenceNodeOfSequenceOfPoint(const Handle_Blend_SequenceNodeOfSequenceOfPoint &aHandle);
        Handle_Blend_SequenceNodeOfSequenceOfPoint(const Blend_SequenceNodeOfSequenceOfPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Blend_SequenceNodeOfSequenceOfPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Blend_SequenceNodeOfSequenceOfPoint {
    Blend_SequenceNodeOfSequenceOfPoint* GetObject() {
    return (Blend_SequenceNodeOfSequenceOfPoint*)$self->Access();
    }
};
%feature("shadow") Handle_Blend_SequenceNodeOfSequenceOfPoint::~Handle_Blend_SequenceNodeOfSequenceOfPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Blend_SequenceNodeOfSequenceOfPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Blend_SequenceOfPoint;
class Blend_SequenceOfPoint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Blend_SequenceOfPoint;
		 Blend_SequenceOfPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Blend_SequenceOfPoint)

Returns:
	Blend_SequenceOfPoint

No detailed docstring for this function.") Assign;
		const Blend_SequenceOfPoint & Assign (const Blend_SequenceOfPoint & Other);
		%feature("autodoc", "Args:
	Other(Blend_SequenceOfPoint)

Returns:
	Blend_SequenceOfPoint

No detailed docstring for this function.") operator=;
		const Blend_SequenceOfPoint & operator = (const Blend_SequenceOfPoint & Other);
		%feature("autodoc", "Args:
	T(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Blend_Point & T);
		%feature("autodoc", "Args:
	S(Blend_SequenceOfPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Blend_SequenceOfPoint & S);
		%feature("autodoc", "Args:
	T(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Blend_Point & T);
		%feature("autodoc", "Args:
	S(Blend_SequenceOfPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Blend_SequenceOfPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Blend_Point)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Blend_Point & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Blend_SequenceOfPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Blend_SequenceOfPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Blend_Point)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Blend_Point & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Blend_SequenceOfPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Blend_SequenceOfPoint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Blend_Point

No detailed docstring for this function.") First;
		const Blend_Point & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Blend_Point

No detailed docstring for this function.") Last;
		const Blend_Point & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Blend_SequenceOfPoint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Blend_SequenceOfPoint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Blend_Point

No detailed docstring for this function.") Value;
		const Blend_Point & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Blend_Point)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Blend_Point & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Blend_Point

No detailed docstring for this function.") ChangeValue;
		Blend_Point & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Blend_SequenceOfPoint::~Blend_SequenceOfPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_SequenceOfPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_SurfCurvFuncInv;
class Blend_SurfCurvFuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 3.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Rst(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual void

Set the Point on which a solution has to be found.") Set;
		virtual void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") Blend_SurfCurvFuncInv::~Blend_SurfCurvFuncInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_SurfCurvFuncInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_SurfPointFuncInv;
class Blend_SurfPointFuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 3.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	virtual void

Set the Point on which a solution has to be found.") Set;
		virtual void Set (const gp_Pnt & P);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") Blend_SurfPointFuncInv::~Blend_SurfPointFuncInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_SurfPointFuncInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_CSFunction;
class Blend_CSFunction : public Blend_AppFunction {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns 3 (default value). Can be redefined.") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	virtual void

Sets the value of the parameter along the guide line.  
         This determines the plane in which the solution has  
         to be found.") Set;
		virtual void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual void

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.  
         The computation is made at the current value of  
         the parameter on the guide line.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the first support.") Pnt1;
		const gp_Pnt & Pnt1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the seconde support.") Pnt2;
		const gp_Pnt & Pnt2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the surface.") PointOnS;
		virtual const gp_Pnt & PointOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the curve.") PointOnC;
		virtual const gp_Pnt & PointOnC ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt2d

Returns U,V coordinates of the point on the surface.") Pnt2d;
		virtual const gp_Pnt2d & Pnt2d ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns parameter of the point on the curve.") ParameterOnC;
		virtual Standard_Real ParameterOnC ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True when it is not possible to compute  
         the tangent vectors at PointOnS and/or PointOnC.") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnS, in 3d space.") TangentOnS;
		virtual const gp_Vec & TangentOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec2d

Returns the tangent vector at PointOnS, in the  
         parametric space of the first surface.") Tangent2d;
		virtual const gp_Vec2d & Tangent2d ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnC, in 3d space.") TangentOnC;
		virtual const gp_Vec & TangentOnC ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	TgS(gp_Vec)
	NormS(gp_Vec)

Returns:
	virtual void

Returns the tangent vector at the section,  
         at the beginning and the end of the section, and  
         returns the normal (of the surfaces) at  
         these points.") Tangent;
		virtual void Tangent (const Standard_Real U,const Standard_Real V,gp_Vec & TgS,gp_Vec & NormS);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	virtual void

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

No detailed docstring for this function.") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
};


%feature("shadow") Blend_CSFunction::~Blend_CSFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_CSFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_Function;
class Blend_Function : public Blend_AppFunction {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 4.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	virtual void

Sets the value of the parameter along the guide line.  
         This determines the plane in which the solution has  
         to be found.") Set;
		virtual void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual void

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each of the 4 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each of the 4 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 4 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.  
         The computation is made at the current value of  
         the parameter on the guide line.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the first support.") Pnt1;
		const gp_Pnt & Pnt1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the seconde support.") Pnt2;
		const gp_Pnt & Pnt2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the first surface, at parameter  
         Sol(1),Sol(2) (Sol is the vector used in the call of  
         IsSolution.") PointOnS1;
		virtual const gp_Pnt & PointOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the second surface, at parameter  
         Sol(3),Sol(4) (Sol is the vector used in the call of  
         IsSolution.") PointOnS2;
		virtual const gp_Pnt & PointOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True when it is not possible to compute  
         the tangent vectors at PointOnS1 and/or PointOnS2.") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnS1, in 3d space.") TangentOnS1;
		virtual const gp_Vec & TangentOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec2d

Returns the tangent vector at PointOnS1, in the  
         parametric space of the first surface.") Tangent2dOnS1;
		virtual const gp_Vec2d & Tangent2dOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnS2, in 3d space.") TangentOnS2;
		virtual const gp_Vec & TangentOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec2d

Returns the tangent vector at PointOnS2, in the  
         parametric space of the second surface.") Tangent2dOnS2;
		virtual const gp_Vec2d & Tangent2dOnS2 ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	TgFirst(gp_Vec)
	TgLast(gp_Vec)
	NormFirst(gp_Vec)
	NormLast(gp_Vec)

Returns:
	virtual void

Returns the tangent vector at the section,  
         at the beginning and the end of the section, and  
         returns the normal (of the surfaces) at  
         these points.") Tangent;
		virtual void Tangent (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,gp_Vec & TgFirst,gp_Vec & TgLast,gp_Vec & NormFirst,gp_Vec & NormLast);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") TwistOnS1;
		virtual Standard_Boolean TwistOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") TwistOnS2;
		virtual Standard_Boolean TwistOnS2 ();
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	virtual void

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

No detailed docstring for this function.") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
};


%feature("shadow") Blend_Function::~Blend_Function %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_Function {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_RstRstFunction;
class Blend_RstRstFunction : public Blend_AppFunction {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns 2 (default value). Can be redefined.") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	virtual void

Sets the value of the parameter along the guide line.  
         This determines the plane in which the solution has  
         to be found.") Set;
		virtual void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual void

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each variable;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.  
         The computation is made at the current value of  
         the parameter on the guide line.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the first support.") Pnt1;
		const gp_Pnt & Pnt1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the seconde support.") Pnt2;
		const gp_Pnt & Pnt2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the surface.") PointOnRst1;
		virtual const gp_Pnt & PointOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the curve.") PointOnRst2;
		virtual const gp_Pnt & PointOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt2d

Returns U,V coordinates of the point on the surface.") Pnt2dOnRst1;
		virtual const gp_Pnt2d & Pnt2dOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt2d

Returns  U,V coordinates of the point  on the curve on  
         surface.") Pnt2dOnRst2;
		virtual const gp_Pnt2d & Pnt2dOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst1;
		virtual Standard_Real ParameterOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst2;
		virtual Standard_Real ParameterOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True when it is not possible to compute  
         the tangent vectors at PointOnS and/or PointOnRst.") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnS, in 3d space.") TangentOnRst1;
		virtual const gp_Vec & TangentOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec2d

Returns the tangent vector at PointOnS, in the  
         parametric space of the first surface.") Tangent2dOnRst1;
		virtual const gp_Vec2d & Tangent2dOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnC, in 3d space.") TangentOnRst2;
		virtual const gp_Vec & TangentOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec2d

Returns the tangent vector at PointOnRst, in the  
         parametric space of the second surface.") Tangent2dOnRst2;
		virtual const gp_Vec2d & Tangent2dOnRst2 ();
		%feature("autodoc", "Args:
	Sol(math_Vector)
	NRst1(gp_Vec)
	TgRst1(gp_Vec)
	NRst2(gp_Vec)
	TgRst2(gp_Vec)

Returns:
	virtual Blend_DecrochStatus

Enables to implement a  criterion  of  decrochage  
         specific to the function.  
 Warning: Can  be  called  without  previous  call  of issolution  
         but  the  values  calculated can  be  senseless.") Decroch;
		virtual Blend_DecrochStatus Decroch (const math_Vector & Sol,gp_Vec & NRst1,gp_Vec & TgRst1,gp_Vec & NRst2,gp_Vec & TgRst2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns  if the section is rationnal") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the length of the maximum section") GetSectionSize;
		virtual Standard_Real GetSectionSize ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the minimal value of weight for each poles  
         of all sections.") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	virtual void

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

No detailed docstring for this function.") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
};


%feature("shadow") Blend_RstRstFunction::~Blend_RstRstFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_RstRstFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Blend_SurfRstFunction;
class Blend_SurfRstFunction : public Blend_AppFunction {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns 3 (default value). Can be redefined.") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	virtual Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	virtual void

Sets the value of the parameter along the guide line.  
         This determines the plane in which the solution has  
         to be found.") Set;
		virtual void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual void

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual void

Returns in the vector Tolerance the parametric tolerance  
         for each variable;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	virtual void

Returns in the vector InfBound the lowest values allowed  
         for each variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.  
         The computation is made at the current value of  
         the parameter on the guide line.") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the first support.") Pnt1;
		const gp_Pnt & Pnt1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point on the seconde support.") Pnt2;
		const gp_Pnt & Pnt2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the surface.") PointOnS;
		virtual const gp_Pnt & PointOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

Returns the point on the curve.") PointOnRst;
		virtual const gp_Pnt & PointOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt2d

Returns U,V coordinates of the point on the surface.") Pnt2dOnS;
		virtual const gp_Pnt2d & Pnt2dOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt2d

Returns  U,V coordinates of the point  on the curve on  
         surface.") Pnt2dOnRst;
		virtual const gp_Pnt2d & Pnt2dOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst;
		virtual Standard_Real ParameterOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True when it is not possible to compute  
         the tangent vectors at PointOnS and/or PointOnRst.") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnS, in 3d space.") TangentOnS;
		virtual const gp_Vec & TangentOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec2d

Returns the tangent vector at PointOnS, in the  
         parametric space of the first surface.") Tangent2dOnS;
		virtual const gp_Vec2d & Tangent2dOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec

Returns the tangent vector at PointOnC, in 3d space.") TangentOnRst;
		virtual const gp_Vec & TangentOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Vec2d

Returns the tangent vector at PointOnRst, in the  
         parametric space of the second surface.") Tangent2dOnRst;
		virtual const gp_Vec2d & Tangent2dOnRst ();
		%feature("autodoc", "Args:
	Sol(math_Vector)
	NS(gp_Vec)
	TgS(gp_Vec)

Returns:
	virtual Standard_Boolean

Enables implementation  of a criterion of decrochage  
         specific to  the function.") Decroch;
		virtual Standard_Boolean Decroch (const math_Vector & Sol,gp_Vec & NS,gp_Vec & TgS);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns  if the section is rationnal") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the length of the maximum section") GetSectionSize;
		virtual Standard_Real GetSectionSize ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the minimal value of weight for each poles  
         of all sections.") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	virtual void

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

No detailed docstring for this function.") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

No detailed docstring for this function.") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
};


%feature("shadow") Blend_SurfRstFunction::~Blend_SurfRstFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Blend_SurfRstFunction {
	void _kill_pointed() {
		delete $self;
	}
};
