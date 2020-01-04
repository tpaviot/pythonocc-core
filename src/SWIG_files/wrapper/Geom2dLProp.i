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
%define GEOM2DLPROPDOCSTRING
"Geom2dLProp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dlprop.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DLPROPDOCSTRING) Geom2dLProp


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
#include<Geom2dLProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<LProp_module.hxx>
#include<math_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom2d.i
%import LProp.i
%import math.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class Geom2dLProp_CLProps2d *
******************************/
class Geom2dLProp_CLProps2d {
	public:
		/****************** CentreOfCurvature ******************/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "* Returns the centre of curvature <P>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt2d & P);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* Returns the curvature.
	:rtype: float") Curvature;
		Standard_Real Curvature ();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Returns the first derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec2d") D1;
		const gp_Vec2d  D1 ();

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the second derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec2d") D2;
		const gp_Vec2d  D2 ();

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the third derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec2d") D3;
		const gp_Vec2d  D3 ();

		/****************** Geom2dLProp_CLProps2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "* Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
	:param C:
	:type C: Geom2d_Curve
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const opencascade::handle<Geom2d_Curve> & C,const Standard_Integer N,const Standard_Real Resolution);

		/****************** Geom2dLProp_CLProps2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
	:param C:
	:type C: Geom2d_Curve
	:param U:
	:type U: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);

		/****************** Geom2dLProp_CLProps2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U> and the curve is set with SetCurve. the curve can have a empty constructor All the computations done will be related to <C> and <U> when the functions 'set' will be done.
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d (const Standard_Integer N,const Standard_Real Resolution);

		/****************** IsTangentDefined ******************/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "* Returns True if the tangent is defined. For example, the tangent is not defined if the three first derivatives are all null.
	:rtype: bool") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Returns the normal direction <N>.
	:param N:
	:type N: gp_Dir2d
	:rtype: None") Normal;
		void Normal (gp_Dir2d & N);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "* Initializes the local properties of the curve for the new curve.
	:param C:
	:type C: Geom2d_Curve
	:rtype: None") SetCurve;
		void SetCurve (const opencascade::handle<Geom2d_Curve> & C);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Initializes the local properties of the curve for the parameter value <U>.
	:param U:
	:type U: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real U);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "* output the tangent direction <D>
	:param D:
	:type D: gp_Dir2d
	:rtype: None") Tangent;
		void Tangent (gp_Dir2d & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Point.
	:rtype: gp_Pnt2d") Value;
		const gp_Pnt2d  Value ();

};


%extend Geom2dLProp_CLProps2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dLProp_CurAndInf2d *
********************************/
class Geom2dLProp_CurAndInf2d : public LProp_CurAndInf {
	public:
		/****************** Geom2dLProp_CurAndInf2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CurAndInf2d;
		%feature("autodoc", "* Initializes the framework. Note: The curve on which the local properties are computed is defined using one of the following functions: Perform, PerformCurExt or PerformInf.
	:rtype: None") Geom2dLProp_CurAndInf2d;
		 Geom2dLProp_CurAndInf2d ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* True if the solutions are found.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* For the curve C, Computes both the inflection points and the maximum and minimum curvatures.
	:param C:
	:type C: Geom2d_Curve
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom2d_Curve> & C);

		/****************** PerformCurExt ******************/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "* For the curve C, Computes the locals extremas of curvature.
	:param C:
	:type C: Geom2d_Curve
	:rtype: None") PerformCurExt;
		void PerformCurExt (const opencascade::handle<Geom2d_Curve> & C);

		/****************** PerformInf ******************/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "* For the curve C, Computes the inflections. After computation, the following functions can be used: - IsDone to check if the computation was successful - NbPoints to obtain the number of computed particular points - Parameter to obtain the parameter on the curve for each particular point - Type to check if the point is an inflection point or an extremum of curvature of the curve C. Warning These functions can be used to analyze a series of curves, however it is necessary to clear the table of results between each computation.
	:param C:
	:type C: Geom2d_Curve
	:rtype: None") PerformInf;
		void PerformInf (const opencascade::handle<Geom2d_Curve> & C);

};


%extend Geom2dLProp_CurAndInf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dLProp_Curve2dTool *
********************************/
class Geom2dLProp_Curve2dTool {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the order of continuity of the curve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.
	:param C:
	:type C: Geom2d_Curve
	:rtype: int") Continuity;
		static Standard_Integer Continuity (const opencascade::handle<Geom2d_Curve> & C);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom2d_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void") D1;
		static void D1 (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom2d_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void") D2;
		static void D2 (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom2d_Curve
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
	:rtype: void") D3;
		static void D3 (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* returns the first parameter bound of the curve.
	:param C:
	:type C: Geom2d_Curve
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const opencascade::handle<Geom2d_Curve> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* returns the last parameter bound of the curve. FirstParameter must be less than LastParameter.
	:param C:
	:type C: Geom2d_Curve
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point <P> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom2d_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void") Value;
		static void Value (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real U,gp_Pnt2d & P);

};


%extend Geom2dLProp_Curve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom2dLProp_FuncCurExt *
*******************************/
class Geom2dLProp_FuncCurExt : public math_FunctionWithDerivative {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* Returns the derivative for the variable <X>.
	:param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Geom2dLProp_FuncCurExt ******************/
		%feature("compactdefaultargs") Geom2dLProp_FuncCurExt;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:param Tol:
	:type Tol: float
	:rtype: None") Geom2dLProp_FuncCurExt;
		 Geom2dLProp_FuncCurExt (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real Tol);

		/****************** IsMinKC ******************/
		%feature("compactdefaultargs") IsMinKC;
		%feature("autodoc", "* True if Param corresponds to a minus of the radius of curvature.
	:param Param:
	:type Param: float
	:rtype: bool") IsMinKC;
		Standard_Boolean IsMinKC (const Standard_Real Param);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* Returns the value of the function and the derivative for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend Geom2dLProp_FuncCurExt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom2dLProp_FuncCurNul *
*******************************/
class Geom2dLProp_FuncCurNul : public math_FunctionWithDerivative {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* Returns the derivative for the variable <X>
	:param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Geom2dLProp_FuncCurNul ******************/
		%feature("compactdefaultargs") Geom2dLProp_FuncCurNul;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: None") Geom2dLProp_FuncCurNul;
		 Geom2dLProp_FuncCurNul (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* Returns the value of the function and the derivative for the variable <X>.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend Geom2dLProp_FuncCurNul {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Geom2dLProp_NumericCurInf2d *
************************************/
class Geom2dLProp_NumericCurInf2d {
	public:
		/****************** Geom2dLProp_NumericCurInf2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_NumericCurInf2d;
		%feature("autodoc", ":rtype: None") Geom2dLProp_NumericCurInf2d;
		 Geom2dLProp_NumericCurInf2d ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* True if the solutions are found.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** PerformCurExt ******************/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "* Computes the locals extremas of curvature.
	:param C:
	:type C: Geom2d_Curve
	:param Result:
	:type Result: LProp_CurAndInf
	:rtype: None") PerformCurExt;
		void PerformCurExt (const opencascade::handle<Geom2d_Curve> & C,LProp_CurAndInf & Result);

		/****************** PerformCurExt ******************/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "* Computes the locals extremas of curvature. in the interval of parmeters [UMin,UMax].
	:param C:
	:type C: Geom2d_Curve
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param Result:
	:type Result: LProp_CurAndInf
	:rtype: None") PerformCurExt;
		void PerformCurExt (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real UMin,const Standard_Real UMax,LProp_CurAndInf & Result);

		/****************** PerformInf ******************/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "* Computes the inflections.
	:param C:
	:type C: Geom2d_Curve
	:param Result:
	:type Result: LProp_CurAndInf
	:rtype: None") PerformInf;
		void PerformInf (const opencascade::handle<Geom2d_Curve> & C,LProp_CurAndInf & Result);

		/****************** PerformInf ******************/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "* Computes the inflections in the interval of parmeters [UMin,UMax].
	:param C:
	:type C: Geom2d_Curve
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param Result:
	:type Result: LProp_CurAndInf
	:rtype: None") PerformInf;
		void PerformInf (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real UMin,const Standard_Real UMax,LProp_CurAndInf & Result);

};


%extend Geom2dLProp_NumericCurInf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
