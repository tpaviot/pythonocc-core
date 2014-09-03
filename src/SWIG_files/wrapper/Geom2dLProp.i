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
%module (package="OCC") Geom2dLProp

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

%include Geom2dLProp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Geom2dLProp_CLProps2d;
class Geom2dLProp_CLProps2d {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const Handle_Geom2d_Curve & C,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	U(Standard_Real)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const Handle_Geom2d_Curve & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameter;
		void SetParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value;
		const gp_Pnt2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") D1;
		const gp_Vec2d & D1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") D2;
		const gp_Vec2d & D2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") D3;
		const gp_Vec2d & D3 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();
		%feature("autodoc", "Args:
	D(gp_Dir2d)

Returns:
	None

No detailed docstring for this function.") Tangent;
		void Tangent (gp_Dir2d & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Curvature;
		Standard_Real Curvature ();
		%feature("autodoc", "Args:
	N(gp_Dir2d)

Returns:
	None

No detailed docstring for this function.") Normal;
		void Normal (gp_Dir2d & N);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt2d & P);
};


%feature("shadow") Geom2dLProp_CLProps2d::~Geom2dLProp_CLProps2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dLProp_CLProps2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dLProp_CurAndInf2d;
class Geom2dLProp_CurAndInf2d : public LProp_CurAndInf {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the framework.  
Note: The curve on which the local properties are  
computed is defined using one of the following  
functions: Perform, PerformCurExt or PerformInf.") Geom2dLProp_CurAndInf2d;
		 Geom2dLProp_CurAndInf2d ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

For the curve C, Computes both the  
 inflection points and the maximum and minimum curvatures.") Perform;
		void Perform (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

For the curve C, Computes the locals extremas of curvature.") PerformCurExt;
		void PerformCurExt (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

For the curve C, Computes the inflections.  
After computation, the following functions can be used:  
- IsDone to check if the computation was successful  
- NbPoints to obtain the number of computed particular points  
- Parameter to obtain the parameter on the curve for  
  each particular point  
- Type to check if the point is an inflection point or an  
  extremum of curvature of the curve C.  
  Warning  
These functions can be used to analyze a series of  
curves, however it is necessary to clear the table of  
results between each computation.") PerformInf;
		void PerformInf (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the solutions are found.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") Geom2dLProp_CurAndInf2d::~Geom2dLProp_CurAndInf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dLProp_CurAndInf2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dLProp_Curve2dTool;
class Geom2dLProp_Curve2dTool {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static void

Computes the point <P> of parameter <U> on the curve <C>.") Value;
		static void Value (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

Computes the point <P> and first derivative <V1> of  
         parameter <U> on the curve <C>.") D1;
		static void D1 (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

Computes the point <P>, the first derivative <V1> and second  
         derivative <V2> of parameter <U> on the curve <C>.") D2;
		static void D2 (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

Computes the point <P>, the first derivative <V1>, the  
         second derivative <V2> and third derivative <V3> of  
         parameter <U> on the curve <C>.") D3;
		static void D3 (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	static Standard_Integer

returns the order of continuity of the curve <C>.  
         returns 1 : first derivative only is computable  
         returns 2 : first and second derivative only are computable.  
         returns 3 : first, second and third are computable.") Continuity;
		static Standard_Integer Continuity (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	static Standard_Real

returns the first parameter bound of the curve.") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	static Standard_Real

returns the last parameter bound of the curve.  
         FirstParameter must be less than LastParameter.") LastParameter;
		static Standard_Real LastParameter (const Handle_Geom2d_Curve & C);
};


%feature("shadow") Geom2dLProp_Curve2dTool::~Geom2dLProp_Curve2dTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dLProp_Curve2dTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dLProp_FCurExtOfNumericCurInf2d;
class Geom2dLProp_FCurExtOfNumericCurInf2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dLProp_FCurExtOfNumericCurInf2d;
		 Geom2dLProp_FCurExtOfNumericCurInf2d (const Handle_Geom2d_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMinKC;
		Standard_Boolean IsMinKC (const Standard_Real Param);
};


%feature("shadow") Geom2dLProp_FCurExtOfNumericCurInf2d::~Geom2dLProp_FCurExtOfNumericCurInf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dLProp_FCurExtOfNumericCurInf2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dLProp_FCurNulOfNumericCurInf2d;
class Geom2dLProp_FCurNulOfNumericCurInf2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dLProp_FCurNulOfNumericCurInf2d;
		 Geom2dLProp_FCurNulOfNumericCurInf2d (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Geom2dLProp_FCurNulOfNumericCurInf2d::~Geom2dLProp_FCurNulOfNumericCurInf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dLProp_FCurNulOfNumericCurInf2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dLProp_NumericCurInf2d;
class Geom2dLProp_NumericCurInf2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dLProp_NumericCurInf2d;
		 Geom2dLProp_NumericCurInf2d ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	Result(LProp_CurAndInf)

Returns:
	None

No detailed docstring for this function.") PerformCurExt;
		void PerformCurExt (const Handle_Geom2d_Curve & C,LProp_CurAndInf & Result);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	Result(LProp_CurAndInf)

Returns:
	None

No detailed docstring for this function.") PerformInf;
		void PerformInf (const Handle_Geom2d_Curve & C,LProp_CurAndInf & Result);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	UMin(Standard_Real)
	UMax(Standard_Real)
	Result(LProp_CurAndInf)

Returns:
	None

No detailed docstring for this function.") PerformCurExt;
		void PerformCurExt (const Handle_Geom2d_Curve & C,const Standard_Real UMin,const Standard_Real UMax,LProp_CurAndInf & Result);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	UMin(Standard_Real)
	UMax(Standard_Real)
	Result(LProp_CurAndInf)

Returns:
	None

No detailed docstring for this function.") PerformInf;
		void PerformInf (const Handle_Geom2d_Curve & C,const Standard_Real UMin,const Standard_Real UMax,LProp_CurAndInf & Result);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") Geom2dLProp_NumericCurInf2d::~Geom2dLProp_NumericCurInf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dLProp_NumericCurInf2d {
	void _kill_pointed() {
		delete $self;
	}
};
