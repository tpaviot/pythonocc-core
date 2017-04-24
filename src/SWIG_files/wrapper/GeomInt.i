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
%module (package="OCC") GeomInt

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


%include GeomInt_headers.i


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
typedef NCollection_Vector <Standard_Real> GeomInt_VectorOfReal;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomint) GeomInt;
class GeomInt {
	public:
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "	* Adjusts the parameter <thePar> to the range [theParMin, theParMax]

	:param thePar:
	:type thePar: float
	:param theParMin:
	:type theParMin: float
	:param theParMax:
	:type theParMax: float
	:param thePeriod:
	:type thePeriod: float
	:param theNewPar:
	:type theNewPar: float &
	:param theOffset:
	:type theOffset: float &
	:param theEps: default value is 0.0
	:type theEps: float
	:rtype: bool
") AdjustPeriodic;
		static Standard_Boolean AdjustPeriodic (const Standard_Real thePar,const Standard_Real theParMin,const Standard_Real theParMax,const Standard_Real thePeriod,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real theEps = 0.0);
};


%extend GeomInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox : public math_BFGS {
	public:
		%feature("compactdefaultargs") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%extend GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer NbPol);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: math_IntegerVector
") Index;
		const math_IntegerVector & Index ();
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
		%feature("compactdefaultargs") SetFirstLambda;
		%feature("autodoc", "	:param l1:
	:type l1: float
	:rtype: None
") SetFirstLambda;
		void SetFirstLambda (const Standard_Real l1);
		%feature("compactdefaultargs") SetLastLambda;
		%feature("autodoc", "	:param l2:
	:type l2: float
	:rtype: None
") SetLastLambda;
		void SetLastLambda (const Standard_Real l2);
};


%extend GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param V1c:
	:type V1c: math_Vector &
	:param V2c:
	:type V2c: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	:param Grad:
	:type Grad: math_Vector &
	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
};


%extend GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox : public math_BFGS {
	public:
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%extend GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox : public math_BFGS {
	public:
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%extend GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_IntSS;
class GeomInt_IntSS {
	public:
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "	:rtype: None
") GeomInt_IntSS;
		 GeomInt_IntSS ();
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "	* performs general intersection of two surfaces just now

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:param Tol:
	:type Tol: float
	:param Approx: default value is Standard_True
	:type Approx: bool
	:param ApproxS1: default value is Standard_False
	:type ApproxS1: bool
	:param ApproxS2: default value is Standard_False
	:type ApproxS2: bool
	:rtype: None
") GeomInt_IntSS;
		 GeomInt_IntSS (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Standard_Real Tol,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* general intersection of two surfaces

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:param Tol:
	:type Tol: float
	:param Approx: default value is Standard_True
	:type Approx: bool
	:param ApproxS1: default value is Standard_False
	:type ApproxS1: bool
	:param ApproxS2: default value is Standard_False
	:type ApproxS2: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Standard_Real Tol,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* intersection of adapted surfaces

	:param HS1:
	:type HS1: Handle_GeomAdaptor_HSurface &
	:param HS2:
	:type HS2: Handle_GeomAdaptor_HSurface &
	:param Tol:
	:type Tol: float
	:param Approx: default value is Standard_True
	:type Approx: bool
	:param ApproxS1: default value is Standard_False
	:type ApproxS1: bool
	:param ApproxS2: default value is Standard_False
	:type ApproxS2: bool
	:rtype: None
") Perform;
		void Perform (const Handle_GeomAdaptor_HSurface & HS1,const Handle_GeomAdaptor_HSurface & HS2,const Standard_Real Tol,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* general intersection using a starting point

	:param S1:
	:type S1: Handle_Geom_Surface &
	:param S2:
	:type S2: Handle_Geom_Surface &
	:param Tol:
	:type Tol: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Approx: default value is Standard_True
	:type Approx: bool
	:param ApproxS1: default value is Standard_False
	:type ApproxS1: bool
	:param ApproxS2: default value is Standard_False
	:type ApproxS2: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const Standard_Real Tol,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* intersection of adapted surfaces using a starting point

	:param HS1:
	:type HS1: Handle_GeomAdaptor_HSurface &
	:param HS2:
	:type HS2: Handle_GeomAdaptor_HSurface &
	:param Tol:
	:type Tol: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Approx: default value is Standard_True
	:type Approx: bool
	:param ApproxS1: default value is Standard_False
	:type ApproxS1: bool
	:param ApproxS2: default value is Standard_False
	:type ApproxS2: bool
	:rtype: None
") Perform;
		void Perform (const Handle_GeomAdaptor_HSurface & HS1,const Handle_GeomAdaptor_HSurface & HS2,const Standard_Real Tol,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", "	:rtype: float
") TolReached3d;
		Standard_Real TolReached3d ();
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", "	:rtype: float
") TolReached2d;
		Standard_Real TolReached2d ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") Line;
		Handle_Geom_Curve Line (const Standard_Integer Index);
		%feature("compactdefaultargs") HasLineOnS1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") HasLineOnS1;
		Standard_Boolean HasLineOnS1 (const Standard_Integer Index);
		%feature("compactdefaultargs") LineOnS1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") LineOnS1;
		Handle_Geom2d_Curve LineOnS1 (const Standard_Integer Index);
		%feature("compactdefaultargs") HasLineOnS2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") HasLineOnS2;
		Standard_Boolean HasLineOnS2 (const Standard_Integer Index);
		%feature("compactdefaultargs") LineOnS2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") LineOnS2;
		Handle_Geom2d_Curve LineOnS2 (const Standard_Integer Index);
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "	:rtype: int
") NbBoundaries;
		Standard_Integer NbBoundaries ();
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") Boundary;
		Handle_Geom_Curve Boundary (const Standard_Integer Index);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer Index);
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param OnFirst:
	:type OnFirst: bool
	:rtype: gp_Pnt2d
") Pnt2d;
		gp_Pnt2d Pnt2d (const Standard_Integer Index,const Standard_Boolean OnFirst);
		%feature("compactdefaultargs") TreatRLine;
		%feature("autodoc", "	* converts RLine to Geom(2d)_Curve.

	:param theRL:
	:type theRL: Handle_IntPatch_RLine &
	:param theHS1:
	:type theHS1: Handle_GeomAdaptor_HSurface &
	:param theHS2:
	:type theHS2: Handle_GeomAdaptor_HSurface &
	:param theC3d:
	:type theC3d: Handle_Geom_Curve &
	:param theC2d1:
	:type theC2d1: Handle_Geom2d_Curve &
	:param theC2d2:
	:type theC2d2: Handle_Geom2d_Curve &
	:param theTolReached:
	:type theTolReached: float &
	:rtype: void
") TreatRLine;
		static void TreatRLine (const Handle_IntPatch_RLine & theRL,const Handle_GeomAdaptor_HSurface & theHS1,const Handle_GeomAdaptor_HSurface & theHS2,Handle_Geom_Curve & theC3d,Handle_Geom2d_Curve & theC2d1,Handle_Geom2d_Curve & theC2d2,Standard_Real &OutValue);
		%feature("compactdefaultargs") BuildPCurves;
		%feature("autodoc", "	* creates 2D-curve on given surface from given 3D-curve

	:param f:
	:type f: float
	:param l:
	:type l: float
	:param Tol:
	:type Tol: float &
	:param S:
	:type S: Handle_Geom_Surface &
	:param C:
	:type C: Handle_Geom_Curve &
	:param C2d:
	:type C2d: Handle_Geom2d_Curve &
	:rtype: void
") BuildPCurves;
		static void BuildPCurves (const Standard_Real f,const Standard_Real l,Standard_Real &OutValue,const Handle_Geom_Surface & S,const Handle_Geom_Curve & C,Handle_Geom2d_Curve & C2d);
		%feature("compactdefaultargs") TrimILineOnSurfBoundaries;
		%feature("autodoc", "	* puts into theArrayOfParameters the parameters of intersection points of given theC2d1 and theC2d2 curves with the boundaries of the source surface.

	:param theC2d1:
	:type theC2d1: Handle_Geom2d_Curve &
	:param theC2d2:
	:type theC2d2: Handle_Geom2d_Curve &
	:param theBound1:
	:type theBound1: Bnd_Box2d &
	:param theBound2:
	:type theBound2: Bnd_Box2d &
	:param theArrayOfParameters:
	:type theArrayOfParameters: GeomInt_VectorOfReal &
	:rtype: void
") TrimILineOnSurfBoundaries;
		static void TrimILineOnSurfBoundaries (const Handle_Geom2d_Curve & theC2d1,const Handle_Geom2d_Curve & theC2d2,const Bnd_Box2d & theBound1,const Bnd_Box2d & theBound2,GeomInt_VectorOfReal & theArrayOfParameters);
};


%extend GeomInt_IntSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_LineConstructor;
class GeomInt_LineConstructor {
	public:
		%feature("compactdefaultargs") GeomInt_LineConstructor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") GeomInt_LineConstructor;
		 GeomInt_LineConstructor ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Initializes me by two surfaces and corresponding tools which represent boundaries of surfaces

	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param S1:
	:type S1: Handle_GeomAdaptor_HSurface &
	:param S2:
	:type S2: Handle_GeomAdaptor_HSurface &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_TopolTool & D2,const Handle_GeomAdaptor_HSurface & S1,const Handle_GeomAdaptor_HSurface & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Splits line

	:param L:
	:type L: Handle_IntPatch_Line &
	:rtype: None
") Perform;
		void Perform (const Handle_IntPatch_Line & L);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if splitting was successful

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "	* Returns number of splits

	:rtype: int
") NbParts;
		Standard_Integer NbParts ();
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "	* Return first and last parameters for given index of split

	:param I:
	:type I: int
	:param WFirst:
	:type WFirst: float &
	:param WLast:
	:type WLast: float &
	:rtype: None
") Part;
		void Part (const Standard_Integer I,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend GeomInt_LineConstructor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class GeomInt_LineTool {
	public:
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "	:param L:
	:type L: Handle_IntPatch_Line &
	:rtype: int
") NbVertex;
		static Standard_Integer NbVertex (const Handle_IntPatch_Line & L);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param L:
	:type L: Handle_IntPatch_Line &
	:param I:
	:type I: int
	:rtype: IntPatch_Point
") Vertex;
		static const IntPatch_Point & Vertex (const Handle_IntPatch_Line & L,const Standard_Integer I);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param L:
	:type L: Handle_IntPatch_Line &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_IntPatch_Line & L);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param L:
	:type L: Handle_IntPatch_Line &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_IntPatch_Line & L);
};


%extend GeomInt_LineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 1
	:type NbIterations: int
	:rtype: None
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 1);
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations:
	:type NbIterations: int
	:param lambda1:
	:type lambda1: float
	:param lambda2:
	:type lambda2: float
	:rtype: None
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations,const Standard_Real lambda1,const Standard_Real lambda2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") Value;
		AppParCurves_MultiBSpCurve Value ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:rtype: float
") AverageError;
		Standard_Real AverageError ();
};


%extend GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:rtype: float
") AverageError;
		Standard_Real AverageError ();
};


%extend GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_MyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_MyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:rtype: float
") AverageError;
		Standard_Real AverageError ();
};


%extend GeomInt_MyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:rtype: None
") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
};


%extend GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:rtype: None
") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
};


%extend GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param V1c:
	:type V1c: math_Vector &
	:param V2c:
	:type V2c: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	:param Grad:
	:type Grad: math_Vector &
	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
};


%extend GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param V1c:
	:type V1c: math_Vector &
	:param V2c:
	:type V2c: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	:param Grad:
	:type Grad: math_Vector &
	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
};


%extend GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParameterAndOrientation;
class GeomInt_ParameterAndOrientation {
	public:
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "	:rtype: None
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation ();
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "	:param P:
	:type P: float
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:rtype: None
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation (const Standard_Real P,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2);
		%feature("compactdefaultargs") SetOrientation1;
		%feature("autodoc", "	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") SetOrientation1;
		void SetOrientation1 (const TopAbs_Orientation Or);
		%feature("compactdefaultargs") SetOrientation2;
		%feature("autodoc", "	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") SetOrientation2;
		void SetOrientation2 (const TopAbs_Orientation Or);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Orientation1;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation1;
		TopAbs_Orientation Orientation1 ();
		%feature("compactdefaultargs") Orientation2;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation2;
		TopAbs_Orientation Orientation2 ();
};


%extend GeomInt_ParameterAndOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Bern:
	:type Bern: math_Matrix &
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix &
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None
") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "	:rtype: math_Vector
") Duale;
		const math_Vector & Duale ();
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix &
	:rtype: math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const GeomInt_TheMultiLineOfWLApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix ();
};


%extend GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Bern:
	:type Bern: math_Matrix &
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix &
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None
") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "	:rtype: math_Vector
") Duale;
		const math_Vector & Duale ();
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix &
	:rtype: math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const GeomInt_TheMultiLineOfWLApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix ();
};


%extend GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation;
class GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation;
		%feature("autodoc", "	:param I:
	:type I: GeomInt_ParameterAndOrientation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation;
		 GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation (const GeomInt_ParameterAndOrientation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: GeomInt_ParameterAndOrientation
") Value;
		GeomInt_ParameterAndOrientation & Value ();
};


%extend GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation::Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation;
class Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation();
        Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation(const Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation &aHandle);
        Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation(const GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
    GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation* _get_reference() {
    return (GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation*)$self->Access();
    }
};

%extend Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_SequenceOfParameterAndOrientation;
class GeomInt_SequenceOfParameterAndOrientation : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") GeomInt_SequenceOfParameterAndOrientation;
		%feature("autodoc", "	:rtype: None
") GeomInt_SequenceOfParameterAndOrientation;
		 GeomInt_SequenceOfParameterAndOrientation ();
		%feature("compactdefaultargs") GeomInt_SequenceOfParameterAndOrientation;
		%feature("autodoc", "	:param Other:
	:type Other: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: None
") GeomInt_SequenceOfParameterAndOrientation;
		 GeomInt_SequenceOfParameterAndOrientation (const GeomInt_SequenceOfParameterAndOrientation & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: GeomInt_SequenceOfParameterAndOrientation
") Assign;
		const GeomInt_SequenceOfParameterAndOrientation & Assign (const GeomInt_SequenceOfParameterAndOrientation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: GeomInt_SequenceOfParameterAndOrientation
") operator =;
		const GeomInt_SequenceOfParameterAndOrientation & operator = (const GeomInt_SequenceOfParameterAndOrientation & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: GeomInt_ParameterAndOrientation &
	:rtype: None
") Append;
		void Append (const GeomInt_ParameterAndOrientation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: None
") Append;
		void Append (GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: GeomInt_ParameterAndOrientation &
	:rtype: None
") Prepend;
		void Prepend (const GeomInt_ParameterAndOrientation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: None
") Prepend;
		void Prepend (GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: GeomInt_ParameterAndOrientation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const GeomInt_ParameterAndOrientation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: GeomInt_ParameterAndOrientation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const GeomInt_ParameterAndOrientation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: GeomInt_ParameterAndOrientation
") First;
		const GeomInt_ParameterAndOrientation & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: GeomInt_ParameterAndOrientation
") Last;
		const GeomInt_ParameterAndOrientation & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: GeomInt_SequenceOfParameterAndOrientation &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,GeomInt_SequenceOfParameterAndOrientation & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: GeomInt_ParameterAndOrientation
") Value;
		const GeomInt_ParameterAndOrientation & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: GeomInt_ParameterAndOrientation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const GeomInt_ParameterAndOrientation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: GeomInt_ParameterAndOrientation
") ChangeValue;
		GeomInt_ParameterAndOrientation & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend GeomInt_SequenceOfParameterAndOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheComputeLineBezierOfWLApprox;
class GeomInt_TheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-3
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-6
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:rtype: None
") Perform;
		void Perform (const GeomInt_TheMultiLineOfWLApprox & Line);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") SplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") SplineValue;
		const AppParCurves_MultiBSpCurve & SplineValue ();
		%feature("compactdefaultargs") Parametrization;
		%feature("autodoc", "	:param partype:
	:type partype: Approx_ParametrizationType &
	:rtype: None
") Parametrization;
		void Parametrization (Approx_ParametrizationType & partype);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters (const Standard_Integer Index = 1);
};


%extend GeomInt_TheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheComputeLineOfWLApprox;
class GeomInt_TheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-3
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-6
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:rtype: None
") Interpol;
		void Interpol (const GeomInt_TheMultiLineOfWLApprox & Line);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:rtype: None
") Perform;
		void Perform (const GeomInt_TheMultiLineOfWLApprox & Line);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param ThePar:
	:type ThePar: math_Vector &
	:rtype: None
") SetParameters;
		void SetParameters (const math_Vector & ThePar);
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:rtype: None
") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & Knots);
		%feature("compactdefaultargs") SetKnotsAndMultiplicities;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") SetKnotsAndMultiplicities;
		void SetKnotsAndMultiplicities (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	:param C:
	:type C: int
	:rtype: None
") SetContinuity;
		void SetContinuity (const Standard_Integer C);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value ();
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters ();
};


%extend GeomInt_TheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:rtype: None
") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox ();
		%feature("compactdefaultargs") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:rtype: None
") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", "	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param UVap:
	:type UVap: math_Vector &
	:param BornInf:
	:type BornInf: math_Vector &
	:param BornSup:
	:type BornSup: math_Vector &
	:param Tolerance:
	:type Tolerance: math_Vector &
	:rtype: None
") ComputeParameters;
		void ComputeParameters (const IntImp_ConstIsoparametric ChoixIso,const TColStd_Array1OfReal & Param,math_Vector & UVap,math_Vector & BornInf,math_Vector & BornSup,math_Vector & Tolerance);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		gp_Pnt Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:param UVap:
	:type UVap: math_Vector &
	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param BestChoix:
	:type BestChoix: IntImp_ConstIsoparametric &
	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent (const math_Vector & UVap,TColStd_Array1OfReal & Param,IntImp_ConstIsoparametric & BestChoix);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS1;
		gp_Dir2d DirectionOnS1 ();
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS2;
		gp_Dir2d DirectionOnS2 ();
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") AuxillarSurface1;
		Handle_Adaptor3d_HSurface AuxillarSurface1 ();
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") AuxillarSurface2;
		Handle_Adaptor3d_HSurface AuxillarSurface2 ();
};


%extend GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheImpPrmSvSurfacesOfWLApprox;
class GeomInt_TheImpPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Surf2:
	:type Surf2: IntSurf_Quadric &
	:rtype: None
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox (const Handle_Adaptor3d_HSurface & Surf1,const IntSurf_Quadric & Surf2);
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: IntSurf_Quadric &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:rtype: None
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox (const IntSurf_Quadric & Surf1,const Handle_Adaptor3d_HSurface & Surf2);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param u1:
	:type u1: float &
	:param v1:
	:type v1: float &
	:param u2:
	:type u2: float &
	:param v2:
	:type v2: float &
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool
") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%extend GeomInt_TheImpPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:rtype: None
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox ();
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox (const TColStd_Array1OfReal & Param,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld,const IntImp_ConstIsoparametric ChoixIso);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d  DirectionOnS1 ();
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d  DirectionOnS2 ();
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	:rtype: GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox
") Function;
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox & Function ();
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint ();
};


%extend GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheMultiLineOfWLApprox;
class GeomInt_TheMultiLineOfWLApprox {
	public:
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "	:param line:
	:type line: Handle_IntPatch_WLine &
	:param PtrSvSurfaces:
	:type PtrSvSurfaces: Standard_Address
	:param NbP3d:
	:type NbP3d: int
	:param NbP2d:
	:type NbP2d: int
	:param xo:
	:type xo: float
	:param ax:
	:type ax: float
	:param yo:
	:type yo: float
	:param ay:
	:type ay: float
	:param zo:
	:type zo: float
	:param az:
	:type az: float
	:param u1o:
	:type u1o: float
	:param a1u:
	:type a1u: float
	:param v1o:
	:type v1o: float
	:param a1v:
	:type a1v: float
	:param u2o:
	:type u2o: float
	:param a2u:
	:type a2u: float
	:param v2o:
	:type v2o: float
	:param a2v:
	:type a2v: float
	:param P2DOnFirst:
	:type P2DOnFirst: bool
	:param IndMin: default value is 0
	:type IndMin: int
	:param IndMax: default value is 0
	:type IndMax: int
	:rtype: None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox (const Handle_IntPatch_WLine & line,const Standard_Address PtrSvSurfaces,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Real xo,const Standard_Real ax,const Standard_Real yo,const Standard_Real ay,const Standard_Real zo,const Standard_Real az,const Standard_Real u1o,const Standard_Real a1u,const Standard_Real v1o,const Standard_Real a1v,const Standard_Real u2o,const Standard_Real a2u,const Standard_Real v2o,const Standard_Real a2v,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "	:param line:
	:type line: Handle_IntPatch_WLine &
	:param NbP3d:
	:type NbP3d: int
	:param NbP2d:
	:type NbP2d: int
	:param xo:
	:type xo: float
	:param ax:
	:type ax: float
	:param yo:
	:type yo: float
	:param ay:
	:type ay: float
	:param zo:
	:type zo: float
	:param az:
	:type az: float
	:param u1o:
	:type u1o: float
	:param a1u:
	:type a1u: float
	:param v1o:
	:type v1o: float
	:param a1v:
	:type a1v: float
	:param u2o:
	:type u2o: float
	:param a2u:
	:type a2u: float
	:param v2o:
	:type v2o: float
	:param a2v:
	:type a2v: float
	:param P2DOnFirst:
	:type P2DOnFirst: bool
	:param IndMin: default value is 0
	:type IndMin: int
	:param IndMax: default value is 0
	:type IndMax: int
	:rtype: None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox (const Handle_IntPatch_WLine & line,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Real xo,const Standard_Real ax,const Standard_Real yo,const Standard_Real ay,const Standard_Real zo,const Standard_Real az,const Standard_Real u1o,const Standard_Real a1u,const Standard_Real v1o,const Standard_Real a1v,const Standard_Real u2o,const Standard_Real a2u,const Standard_Real v2o,const Standard_Real a2v,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:rtype: int
") LastPoint;
		Standard_Integer LastPoint ();
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "	:rtype: int
") NbP2d;
		Standard_Integer NbP2d ();
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "	:rtype: int
") NbP3d;
		Standard_Integer NbP3d ();
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "	:rtype: Approx_Status
") WhatStatus;
		Approx_Status WhatStatus ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param High:
	:type High: int
	:param NbPointsToInsert:
	:type NbPointsToInsert: int
	:rtype: GeomInt_TheMultiLineOfWLApprox
") MakeMLBetween;
		GeomInt_TheMultiLineOfWLApprox MakeMLBetween (const Standard_Integer Low,const Standard_Integer High,const Standard_Integer NbPointsToInsert);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend GeomInt_TheMultiLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class GeomInt_TheMultiLineToolOfWLApprox {
	public:
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") FirstPoint;
		static Standard_Integer FirstPoint (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") LastPoint;
		static Standard_Integer LastPoint (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") NbP2d;
		static Standard_Integer NbP2d (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") NbP3d;
		static Standard_Integer NbP3d (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: void
") Value;
		static void Value (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param NbPMin:
	:type NbPMin: int
	:rtype: GeomInt_TheMultiLineOfWLApprox
") MakeMLBetween;
		static GeomInt_TheMultiLineOfWLApprox MakeMLBetween (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer NbPMin);
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: Approx_Status
") WhatStatus;
		static Approx_Status WhatStatus (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer I1,const Standard_Integer I2);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: void
") Dump;
		static void Dump (const GeomInt_TheMultiLineOfWLApprox & ML);
};


%extend GeomInt_TheMultiLineToolOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_ThePrmPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("compactdefaultargs") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:rtype: None
") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_ThePrmPrmSvSurfacesOfWLApprox (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_HSurface & Surf2);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param u1:
	:type u1: float &
	:param v1:
	:type v1: float &
	:param u2:
	:type u2: float &
	:param v2:
	:type v2: float &
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool
") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%extend GeomInt_ThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
class GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:rtype: None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ();
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param PS:
	:type PS: Handle_Adaptor3d_HSurface &
	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox (const Handle_Adaptor3d_HSurface & PS,const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param PS:
	:type PS: Handle_Adaptor3d_HSurface &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & PS);
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") SetImplicitSurface;
		void SetImplicitSurface (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Set;
		void Set (const Standard_Real Tolerance);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction3d;
		const gp_Vec  Direction3d ();
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Direction2d;
		const gp_Dir2d  Direction2d ();
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") PSurface;
		Handle_Adaptor3d_HSurface PSurface ();
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "	:rtype: IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface ();
};


%extend GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
