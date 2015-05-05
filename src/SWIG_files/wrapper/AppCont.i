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
%module (package="OCC") AppCont

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

%include AppCont_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor AppCont_FitFunction;
class AppCont_FitFunction {
	public:
		%feature("autodoc", "	:param SSP:
	:type SSP: AppCont_Function &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Deg:
	:type Deg: Standard_Integer
	:param NbPoints: default value is 24
	:type NbPoints: Standard_Integer
	:rtype: None
") AppCont_FitFunction;
		 AppCont_FitFunction (const AppCont_Function & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
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
		%feature("autodoc", "	:param SSP:
	:type SSP: AppCont_Function2d &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Deg:
	:type Deg: Standard_Integer
	:param NbPoints: default value is 24
	:type NbPoints: Standard_Integer
	:rtype: None
") AppCont_FitFunction2d;
		 AppCont_FitFunction2d (const AppCont_Function2d & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
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
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	* returns the first parameter of the function.

	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "	* returns the last parameter of the function.

	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "	* returns the point at parameter <U>.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		virtual gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "	* returns the point and the derivative values at the parameter <U>.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: bool
") D1;
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
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	* returns the first parameter of the function.

	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "	* returns the last parameter of the function.

	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "	* returns the point at parameter <U>.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "	* returns the point and the derivative values at the parameter <U>.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: bool
") D1;
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
class AppCont_FunctionTool {
	public:
		%feature("autodoc", "	* returns the first parameter of the Function.

	:param C:
	:type C: AppCont_Function &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const AppCont_Function & C);
		%feature("autodoc", "	* returns the last parameter of the Function.

	:param C:
	:type C: AppCont_Function &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const AppCont_Function & C);
		%feature("autodoc", "	* Returns 0.

	:param C:
	:type C: AppCont_Function &
	:rtype: int
") NbP2d;
		static Standard_Integer NbP2d (const AppCont_Function & C);
		%feature("autodoc", "	* Returns 1. (the approximation will be done only for one function.

	:param C:
	:type C: AppCont_Function &
	:rtype: int
") NbP3d;
		static Standard_Integer NbP3d (const AppCont_Function & C);
		%feature("autodoc", "	* <tabP> is an array of only 1 element, the point value at the parameter <U>.

	:param C:
	:type C: AppCont_Function &
	:param U:
	:type U: float
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: void
") Value;
		static void Value (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt);
		%feature("autodoc", "	* <tabV> is an array of only 1 element, the derivative value at the parameter <U>.

	:param C:
	:type C: AppCont_Function &
	:param U:
	:type U: float
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") D1;
		static Standard_Boolean D1 (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfVec & tabV);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function &
	:param U:
	:type U: float
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function &
	:param U:
	:type U: float
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function &
	:param U:
	:type U: float
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
		static Standard_Boolean D1 (const AppCont_Function & C,const Standard_Real U,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function &
	:param U:
	:type U: float
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
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
class AppCont_FunctionTool2d {
	public:
		%feature("autodoc", "	* returns the first parameter of the Function.

	:param C:
	:type C: AppCont_Function2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const AppCont_Function2d & C);
		%feature("autodoc", "	* returns the last parameter of the Function.

	:param C:
	:type C: AppCont_Function2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const AppCont_Function2d & C);
		%feature("autodoc", "	* Returns 1. (the approximation will be done only for one function.

	:param C:
	:type C: AppCont_Function2d &
	:rtype: int
") NbP2d;
		static Standard_Integer NbP2d (const AppCont_Function2d & C);
		%feature("autodoc", "	* Returns 0.

	:param C:
	:type C: AppCont_Function2d &
	:rtype: int
") NbP3d;
		static Standard_Integer NbP3d (const AppCont_Function2d & C);
		%feature("autodoc", "	* <tabP> is an array of only 1 element, the point value at the parameter <U>.

	:param C:
	:type C: AppCont_Function2d &
	:param U:
	:type U: float
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfPnt2d & tabPt);
		%feature("autodoc", "	* <tabV> is an array of only 1 element, the derivative value at the parameter <U>.

	:param C:
	:type C: AppCont_Function2d &
	:param U:
	:type U: float
	:param tabV:
	:type tabV: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
		static Standard_Boolean D1 (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfVec2d & tabV);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function2d &
	:param U:
	:type U: float
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt
	:rtype: void
") Value;
		static void Value (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt2d);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function2d &
	:param U:
	:type U: float
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function2d &
	:param U:
	:type U: float
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec
	:rtype: bool
") D1;
		static Standard_Boolean D1 (const AppCont_Function2d & C,const Standard_Real U,TColgp_Array1OfVec & tabV2d);
		%feature("autodoc", "	:param C:
	:type C: AppCont_Function2d &
	:param U:
	:type U: float
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
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
