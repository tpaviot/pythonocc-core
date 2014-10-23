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
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const Handle_Geom2d_Curve & C,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const Handle_Geom2d_Curve & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") D1;
		const gp_Vec2d  D1 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") D2;
		const gp_Vec2d  D2 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") D3;
		const gp_Vec2d  D3 ();
		%feature("autodoc", "	:rtype: bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();
		%feature("autodoc", "	:param D:
	:type D: gp_Dir2d
	:rtype: None
") Tangent;
		void Tangent (gp_Dir2d & D);
		%feature("autodoc", "	:rtype: float
") Curvature;
		Standard_Real Curvature ();
		%feature("autodoc", "	:param N:
	:type N: gp_Dir2d
	:rtype: None
") Normal;
		void Normal (gp_Dir2d & N);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") CentreOfCurvature;
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
		%feature("autodoc", "	* Initializes the framework. Note: The curve on which the local properties are computed is defined using one of the following functions: Perform, PerformCurExt or PerformInf.

	:rtype: None
") Geom2dLProp_CurAndInf2d;
		 Geom2dLProp_CurAndInf2d ();
		%feature("autodoc", "	* For the curve C, Computes both the inflection points and the maximum and minimum curvatures.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* For the curve C, Computes the locals extremas of curvature.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") PerformCurExt;
		void PerformCurExt (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* For the curve C, Computes the inflections. After computation, the following functions can be used: - IsDone to check if the computation was successful - NbPoints to obtain the number of computed particular points - Parameter to obtain the parameter on the curve for each particular point - Type to check if the point is an inflection point or an extremum of curvature of the curve C. Warning These functions can be used to analyze a series of curves, however it is necessary to clear the table of results between each computation.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") PerformInf;
		void PerformInf (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* True if the solutions are found.

	:rtype: bool
") IsDone;
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
		%feature("autodoc", "	* Computes the point <P> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") Value;
		static void Value (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	* Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Handle_Geom2d_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	* returns the order of continuity of the curve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: int
") Continuity;
		static Standard_Integer Continuity (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* returns the first parameter bound of the curve.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* returns the last parameter bound of the curve. FirstParameter must be less than LastParameter.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: float
") LastParameter;
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
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dLProp_FCurExtOfNumericCurInf2d;
		 Geom2dLProp_FCurExtOfNumericCurInf2d (const Handle_Geom2d_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: bool
") IsMinKC;
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
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") Geom2dLProp_FCurNulOfNumericCurInf2d;
		 Geom2dLProp_FCurNulOfNumericCurInf2d (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
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
		%feature("autodoc", "	:rtype: None
") Geom2dLProp_NumericCurInf2d;
		 Geom2dLProp_NumericCurInf2d ();
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Result:
	:type Result: LProp_CurAndInf &
	:rtype: None
") PerformCurExt;
		void PerformCurExt (const Handle_Geom2d_Curve & C,LProp_CurAndInf & Result);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Result:
	:type Result: LProp_CurAndInf &
	:rtype: None
") PerformInf;
		void PerformInf (const Handle_Geom2d_Curve & C,LProp_CurAndInf & Result);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param Result:
	:type Result: LProp_CurAndInf &
	:rtype: None
") PerformCurExt;
		void PerformCurExt (const Handle_Geom2d_Curve & C,const Standard_Real UMin,const Standard_Real UMax,LProp_CurAndInf & Result);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param Result:
	:type Result: LProp_CurAndInf &
	:rtype: None
") PerformInf;
		void PerformInf (const Handle_Geom2d_Curve & C,const Standard_Real UMin,const Standard_Real UMax,LProp_CurAndInf & Result);
		%feature("autodoc", "	:rtype: bool
") IsDone;
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
