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
%module AppCont

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

%include AppCont_required_python_modules.i
%include AppCont_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor AppCont_FitFunction;
class AppCont_FitFunction {
	public:
		%feature("autodoc", "Args:
	SSP(AppCont_Function)
	U0(Standard_Real)
	U1(Standard_Real)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Deg(Standard_Integer)
	NbPoints(Standard_Integer)=24

Returns:
	None

No detailed docstring for this function.") AppCont_FitFunction;
		 AppCont_FitFunction (const AppCont_Function & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") AppCont_FitFunction::~AppCont_FitFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppCont_FitFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AppCont_FitFunction2d;
class AppCont_FitFunction2d {
	public:
		%feature("autodoc", "Args:
	SSP(AppCont_Function2d)
	U0(Standard_Real)
	U1(Standard_Real)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Deg(Standard_Integer)
	NbPoints(Standard_Integer)=24

Returns:
	None

No detailed docstring for this function.") AppCont_FitFunction2d;
		 AppCont_FitFunction2d (const AppCont_Function2d & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") AppCont_FitFunction2d::~AppCont_FitFunction2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppCont_FitFunction2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AppCont_Function;
class AppCont_Function {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the first parameter of the function.") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the last parameter of the function.") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual gp_Pnt

returns the point at parameter <U>.") Value;
		virtual gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	virtual Standard_Boolean

returns the point and the derivative values at  
         the parameter <U>.") D1;
		virtual Standard_Boolean D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
};


%feature("shadow") AppCont_Function::~AppCont_Function %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppCont_Function {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AppCont_Function2d;
class AppCont_Function2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the first parameter of the function.") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the last parameter of the function.") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual gp_Pnt2d

returns the point at parameter <U>.") Value;
		virtual gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	virtual Standard_Boolean

returns the point and the derivative values at  
         the parameter <U>.") D1;
		virtual Standard_Boolean D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
};


%feature("shadow") AppCont_Function2d::~AppCont_Function2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppCont_Function2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AppCont_FunctionTool;
class AppCont_FunctionTool {
	public:
		%feature("autodoc", "Args:
	C(AppCont_Function)

Returns:
	static Standard_Real

returns the first parameter of the Function.") FirstParameter;
		static Standard_Real FirstParameter (const AppCont_Function & C);
		%feature("autodoc", "Args:
	C(AppCont_Function)

Returns:
	static Standard_Real

returns the last parameter of the Function.") LastParameter;
		static Standard_Real LastParameter (const AppCont_Function & C);
		%feature("autodoc", "Args:
	C(AppCont_Function)

Returns:
	static Standard_Integer

Returns 0.") NbP2d;
		static Standard_Integer NbP2d (const AppCont_Function & C);
		%feature("autodoc", "Args:
	C(AppCont_Function)

Returns:
	static Standard_Integer

Returns 1. (the approximation will be done only for one  
         function.") NbP3d;
		static Standard_Integer NbP3d (const AppCont_Function & C);
		%feature("autodoc", "Args:
	C(AppCont_Function)
	U(Standard_Real)
	tabPt(TColgp_Array1OfPnt)

Returns:
	static void

<tabP> is an array of only 1 element, the point value at  
         the parameter <U>.") Value;
		static void Value (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt);
		%feature("autodoc", "Args:
	C(AppCont_Function)
	U(Standard_Real)
	tabV(TColgp_Array1OfVec)

Returns:
	static Standard_Boolean

<tabV> is an array of only 1 element, the derivative  
         value at the parameter <U>.") D1;
		static Standard_Boolean D1 (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfVec & tabV);
		%feature("autodoc", "Args:
	C(AppCont_Function)
	U(Standard_Real)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	C(AppCont_Function)
	U(Standard_Real)
	tabPt(TColgp_Array1OfPnt)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	C(AppCont_Function)
	U(Standard_Real)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") D1;
		static Standard_Boolean D1 (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	C(AppCont_Function)
	U(Standard_Real)
	tabV(TColgp_Array1OfVec)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") D1;
		static Standard_Boolean D1 (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
};


%feature("shadow") AppCont_FunctionTool::~AppCont_FunctionTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppCont_FunctionTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AppCont_FunctionTool2d;
class AppCont_FunctionTool2d {
	public:
		%feature("autodoc", "Args:
	C(AppCont_Function2d)

Returns:
	static Standard_Real

returns the first parameter of the Function.") FirstParameter;
		static Standard_Real FirstParameter (const AppCont_Function2d & C);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)

Returns:
	static Standard_Real

returns the last parameter of the Function.") LastParameter;
		static Standard_Real LastParameter (const AppCont_Function2d & C);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)

Returns:
	static Standard_Integer

Returns 1. (the approximation will be done only for one  
         function.") NbP2d;
		static Standard_Integer NbP2d (const AppCont_Function2d & C);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)

Returns:
	static Standard_Integer

Returns 0.") NbP3d;
		static Standard_Integer NbP3d (const AppCont_Function2d & C);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)
	U(Standard_Real)
	tabPt(TColgp_Array1OfPnt2d)

Returns:
	static void

<tabP> is an array of only 1 element, the point value at  
         the parameter <U>.") Value;
		static void Value (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfPnt2d & tabPt);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)
	U(Standard_Real)
	tabV(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

<tabV> is an array of only 1 element, the derivative  
         value at the parameter <U>.") D1;
		static Standard_Boolean D1 (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfVec2d & tabV);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)
	U(Standard_Real)
	tabPt2d(TColgp_Array1OfPnt)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt2d);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)
	U(Standard_Real)
	tabPt(TColgp_Array1OfPnt)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)
	U(Standard_Real)
	tabV2d(TColgp_Array1OfVec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") D1;
		static Standard_Boolean D1 (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfVec & tabV2d);
		%feature("autodoc", "Args:
	C(AppCont_Function2d)
	U(Standard_Real)
	tabV(TColgp_Array1OfVec)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") D1;
		static Standard_Boolean D1 (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
};


%feature("shadow") AppCont_FunctionTool2d::~AppCont_FunctionTool2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppCont_FunctionTool2d {
	void _kill_pointed() {
		delete $self;
	}
};
