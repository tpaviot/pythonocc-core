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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define GEOMINTDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=GEOMINTDOCSTRING) GeomInt

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include GeomInt_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(GeomInt_VectorOfReal) NCollection_Vector <Standard_Real>;
%template(GeomInt_SequenceOfParameterAndOrientation) NCollection_Sequence <GeomInt_ParameterAndOrientation>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Vector <Standard_Real> GeomInt_VectorOfReal;
typedef NCollection_Sequence <GeomInt_ParameterAndOrientation> GeomInt_SequenceOfParameterAndOrientation;
/* end typedefs declaration */

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
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	* returns the MultiBSpCurve approximating the set after computing the value F or Grad(F).

	:rtype: AppParCurves_MultiBSpCurve
") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	* returns the derivative function matrix used to approximate the multiline.

	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.

	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	* returns the function matrix used to approximate the multiline.

	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* initializes the fields of the function. The approximating curve has <NbPol> control points.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
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
		 GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer NbPol);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* returns the gradient G of the sum above for the parameters Xi.

	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.

	:rtype: math_IntegerVector
") Index;
		const math_IntegerVector & Index ();
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	* returns the maximum distance between the points and the MultiBSpCurve.

	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	* returns the maximum distance between the points and the MultiBSpCurve.

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function. It corresponds to the number of MultiPoints.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	* returns the new parameters of the MultiLine.

	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
};


%extend GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.

	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.

	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	* returns the derivative function matrix used to approximate the set.

	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* returns the distances between the points of the multiline and the approximation curves.

	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.

	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.

	:param Grad:
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
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	* returns the value (P2 - P1)/ V1 if the first point was a tangency point.

	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	* returns the function matrix used to approximate the set.

	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).

	:param SSP:
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
		%feature("autodoc", "	* Initializes the fields of the object.

	:param SSP:
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
		%feature("autodoc", "	* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).

	:param SSP:
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
		%feature("autodoc", "	* Initializes the fields of the object.

	:param SSP:
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.

	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	* returns the value (PN - PN-1)/ VN if the last point was a tangency point.

	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.

	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields.

	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.

	:param Parameters:
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
		%feature("autodoc", "	* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.

	:param Parameters:
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
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* returns the matrix of points value.

	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* returns the matrix of resulting control points value.

	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
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
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Curve>
") Boundary;
		const opencascade::handle<Geom_Curve> & Boundary (const Standard_Integer Index);
		%feature("compactdefaultargs") BuildPCurves;
		%feature("autodoc", "	* creates 2D-curve on given surface from given 3D-curve

	:param f:
	:type f: float
	:param l:
	:type l: float
	:param Tol:
	:type Tol: float &
	:param S:
	:type S: opencascade::handle<Geom_Surface> &
	:param C:
	:type C: opencascade::handle<Geom_Curve> &
	:param C2d:
	:type C2d: opencascade::handle<Geom2d_Curve> &
	:rtype: void
") BuildPCurves;
		static void BuildPCurves (const Standard_Real f,const Standard_Real l,Standard_Real &OutValue,const opencascade::handle<Geom_Surface> & S,const opencascade::handle<Geom_Curve> & C,opencascade::handle<Geom2d_Curve> & C2d);
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "	:rtype: None
") GeomInt_IntSS;
		 GeomInt_IntSS ();
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "	* performs general intersection of two surfaces just now

	:param S1:
	:type S1: opencascade::handle<Geom_Surface> &
	:param S2:
	:type S2: opencascade::handle<Geom_Surface> &
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
		 GeomInt_IntSS (const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const Standard_Real Tol,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") HasLineOnS1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") HasLineOnS1;
		Standard_Boolean HasLineOnS1 (const Standard_Integer Index);
		%feature("compactdefaultargs") HasLineOnS2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") HasLineOnS2;
		Standard_Boolean HasLineOnS2 (const Standard_Integer Index);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Curve>
") Line;
		const opencascade::handle<Geom_Curve> & Line (const Standard_Integer Index);
		%feature("compactdefaultargs") LineOnS1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Curve>
") LineOnS1;
		const opencascade::handle<Geom2d_Curve> & LineOnS1 (const Standard_Integer Index);
		%feature("compactdefaultargs") LineOnS2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Curve>
") LineOnS2;
		const opencascade::handle<Geom2d_Curve> & LineOnS2 (const Standard_Integer Index);
		%feature("compactdefaultargs") MakeBSpline;
		%feature("autodoc", "	:param WL:
	:type WL: opencascade::handle<IntPatch_WLine> &
	:param ideb:
	:type ideb: int
	:param ifin:
	:type ifin: int
	:rtype: opencascade::handle<Geom_Curve>
") MakeBSpline;
		static opencascade::handle<Geom_Curve> MakeBSpline (const opencascade::handle<IntPatch_WLine> & WL,const Standard_Integer ideb,const Standard_Integer ifin);
		%feature("compactdefaultargs") MakeBSpline2d;
		%feature("autodoc", "	:param theWLine:
	:type theWLine: opencascade::handle<IntPatch_WLine> &
	:param ideb:
	:type ideb: int
	:param ifin:
	:type ifin: int
	:param onFirst:
	:type onFirst: bool
	:rtype: opencascade::handle<Geom2d_BSplineCurve>
") MakeBSpline2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeBSpline2d (const opencascade::handle<IntPatch_WLine> & theWLine,const Standard_Integer ideb,const Standard_Integer ifin,const Standard_Boolean onFirst);
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "	:rtype: int
") NbBoundaries;
		Standard_Integer NbBoundaries ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* general intersection of two surfaces

	:param S1:
	:type S1: opencascade::handle<Geom_Surface> &
	:param S2:
	:type S2: opencascade::handle<Geom_Surface> &
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
		void Perform (const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const Standard_Real Tol,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* intersection of adapted surfaces

	:param HS1:
	:type HS1: opencascade::handle<GeomAdaptor_HSurface> &
	:param HS2:
	:type HS2: opencascade::handle<GeomAdaptor_HSurface> &
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
		void Perform (const opencascade::handle<GeomAdaptor_HSurface> & HS1,const opencascade::handle<GeomAdaptor_HSurface> & HS2,const Standard_Real Tol,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* general intersection using a starting point

	:param S1:
	:type S1: opencascade::handle<Geom_Surface> &
	:param S2:
	:type S2: opencascade::handle<Geom_Surface> &
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
		void Perform (const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const Standard_Real Tol,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* intersection of adapted surfaces using a starting point

	:param HS1:
	:type HS1: opencascade::handle<GeomAdaptor_HSurface> &
	:param HS2:
	:type HS2: opencascade::handle<GeomAdaptor_HSurface> &
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
		void Perform (const opencascade::handle<GeomAdaptor_HSurface> & HS1,const opencascade::handle<GeomAdaptor_HSurface> & HS2,const Standard_Real Tol,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Boolean Approx = Standard_True,const Standard_Boolean ApproxS1 = Standard_False,const Standard_Boolean ApproxS2 = Standard_False);
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param OnFirst:
	:type OnFirst: bool
	:rtype: gp_Pnt2d
") Pnt2d;
		gp_Pnt2d Pnt2d (const Standard_Integer Index,const Standard_Boolean OnFirst);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer Index);
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", "	:rtype: float
") TolReached2d;
		Standard_Real TolReached2d ();
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", "	:rtype: float
") TolReached3d;
		Standard_Real TolReached3d ();
		%feature("compactdefaultargs") TreatRLine;
		%feature("autodoc", "	* converts RLine to Geom(2d)_Curve.

	:param theRL:
	:type theRL: opencascade::handle<IntPatch_RLine> &
	:param theHS1:
	:type theHS1: opencascade::handle<GeomAdaptor_HSurface> &
	:param theHS2:
	:type theHS2: opencascade::handle<GeomAdaptor_HSurface> &
	:param theC3d:
	:type theC3d: opencascade::handle<Geom_Curve> &
	:param theC2d1:
	:type theC2d1: opencascade::handle<Geom2d_Curve> &
	:param theC2d2:
	:type theC2d2: opencascade::handle<Geom2d_Curve> &
	:param theTolReached:
	:type theTolReached: float &
	:rtype: void
") TreatRLine;
		static void TreatRLine (const opencascade::handle<IntPatch_RLine> & theRL,const opencascade::handle<GeomAdaptor_HSurface> & theHS1,const opencascade::handle<GeomAdaptor_HSurface> & theHS2,opencascade::handle<Geom_Curve> & theC3d,opencascade::handle<Geom2d_Curve> & theC2d1,opencascade::handle<Geom2d_Curve> & theC2d2,Standard_Real &OutValue);
		%feature("compactdefaultargs") TrimILineOnSurfBoundaries;
		%feature("autodoc", "	* puts into theArrayOfParameters the parameters of intersection points of given theC2d1 and theC2d2 curves with the boundaries of the source surface.

	:param theC2d1:
	:type theC2d1: opencascade::handle<Geom2d_Curve> &
	:param theC2d2:
	:type theC2d2: opencascade::handle<Geom2d_Curve> &
	:param theBound1:
	:type theBound1: Bnd_Box2d &
	:param theBound2:
	:type theBound2: Bnd_Box2d &
	:param theArrayOfParameters:
	:type theArrayOfParameters: GeomInt_VectorOfReal &
	:rtype: void
") TrimILineOnSurfBoundaries;
		static void TrimILineOnSurfBoundaries (const opencascade::handle<Geom2d_Curve> & theC2d1,const opencascade::handle<Geom2d_Curve> & theC2d2,const Bnd_Box2d & theBound1,const Bnd_Box2d & theBound2,GeomInt_VectorOfReal & theArrayOfParameters);
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if splitting was successful

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Initializes me by two surfaces and corresponding tools which represent boundaries of surfaces

	:param D1:
	:type D1: opencascade::handle<Adaptor3d_TopolTool> &
	:param D2:
	:type D2: opencascade::handle<Adaptor3d_TopolTool> &
	:param S1:
	:type S1: opencascade::handle<GeomAdaptor_HSurface> &
	:param S2:
	:type S2: opencascade::handle<GeomAdaptor_HSurface> &
	:rtype: None
") Load;
		void Load (const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_TopolTool> & D2,const opencascade::handle<GeomAdaptor_HSurface> & S1,const opencascade::handle<GeomAdaptor_HSurface> & S2);
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Splits line

	:param L:
	:type L: opencascade::handle<IntPatch_Line> &
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<IntPatch_Line> & L);
};


%extend GeomInt_LineConstructor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class GeomInt_LineTool {
	public:
		%feature("compactdefaultargs") DecompositionOfWLine;
		%feature("autodoc", "	:param theWLine:
	:type theWLine: opencascade::handle<IntPatch_WLine> &
	:param theSurface1:
	:type theSurface1: opencascade::handle<GeomAdaptor_HSurface> &
	:param theSurface2:
	:type theSurface2: opencascade::handle<GeomAdaptor_HSurface> &
	:param aTolSum:
	:type aTolSum: float
	:param theLConstructor:
	:type theLConstructor: GeomInt_LineConstructor &
	:param theNewLines:
	:type theNewLines: IntPatch_SequenceOfLine &
	:rtype: bool
") DecompositionOfWLine;
		static Standard_Boolean DecompositionOfWLine (const opencascade::handle<IntPatch_WLine> & theWLine,const opencascade::handle<GeomAdaptor_HSurface> & theSurface1,const opencascade::handle<GeomAdaptor_HSurface> & theSurface2,const Standard_Real aTolSum,const GeomInt_LineConstructor & theLConstructor,IntPatch_SequenceOfLine & theNewLines);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param L:
	:type L: opencascade::handle<IntPatch_Line> &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const opencascade::handle<IntPatch_Line> & L);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param L:
	:type L: opencascade::handle<IntPatch_Line> &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const opencascade::handle<IntPatch_Line> & L);
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "	:param L:
	:type L: opencascade::handle<IntPatch_Line> &
	:rtype: int
") NbVertex;
		static Standard_Integer NbVertex (const opencascade::handle<IntPatch_Line> & L);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param L:
	:type L: opencascade::handle<IntPatch_Line> &
	:param I:
	:type I: int
	:rtype: IntPatch_Point
") Vertex;
		static const IntPatch_Point & Vertex (const opencascade::handle<IntPatch_Line> & L,const Standard_Integer I);
};


%extend GeomInt_LineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	* returns the average error between the old and the new approximation.

	:rtype: float
") AverageError;
		Standard_Real AverageError ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.

	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
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
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 1);
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
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
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations,const Standard_Real lambda1,const Standard_Real lambda2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	* returns the maximum difference between the old and the new approximation.

	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	* returns the maximum difference between the old and the new approximation.

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns all the BSpline curves approximating the MultiLine SSP after minimization of the parameter.

	:rtype: AppParCurves_MultiBSpCurve
") Value;
		AppParCurves_MultiBSpCurve Value ();
};


%extend GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	* returns the average error between the old and the new approximation.

	:rtype: float
") AverageError;
		Standard_Real AverageError ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.

	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
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
		 GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	* returns the maximum difference between the old and the new approximation.

	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	* returns the maximum difference between the old and the new approximation.

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.

	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value ();
};


%extend GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_MyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	* returns the average error between the old and the new approximation.

	:rtype: float
") AverageError;
		Standard_Real AverageError ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.

	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
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
		 GeomInt_MyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	* returns the maximum difference between the old and the new approximation.

	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	* returns the maximum difference between the old and the new approximation.

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.

	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value ();
};


%extend GeomInt_MyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	* returns the MultiCurve approximating the set after computing the value F or Grad(F).

	:rtype: AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.

	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	* initializes the fields of the function. The approximating curve has the desired degree Deg.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:rtype: None
") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* returns the gradient G of the sum above for the parameters Xi.

	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	* returns the maximum distance between the points and the MultiCurve.

	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	* returns the maximum distance between the points and the MultiCurve.

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function. It corresponds to the number of MultiPoints.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	* returns the new parameters of the MultiLine.

	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
};


%extend GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	* returns the MultiCurve approximating the set after computing the value F or Grad(F).

	:rtype: AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.

	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* initializes the fields of the function. The approximating curve has the desired degree Deg.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:rtype: None
") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* returns the gradient G of the sum above for the parameters Xi.

	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	* returns the maximum distance between the points and the MultiCurve.

	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	* returns the maximum distance between the points and the MultiCurve.

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function. It corresponds to the number of MultiPoints.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	* returns the new parameters of the MultiLine.

	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
};


%extend GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.

	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.

	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	* returns the derivative function matrix used to approximate the set.

	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* returns the distances between the points of the multiline and the approximation curves.

	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.

	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.

	:param Grad:
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
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	* returns the value (P2 - P1)/ V1 if the first point was a tangency point.

	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	* returns the function matrix used to approximate the set.

	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).

	:param SSP:
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
		%feature("autodoc", "	* Initializes the fields of the object.

	:param SSP:
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
		%feature("autodoc", "	* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).

	:param SSP:
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
		%feature("autodoc", "	* Initializes the fields of the object.

	:param SSP:
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.

	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	* returns the value (PN - PN-1)/ VN if the last point was a tangency point.

	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.

	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields.

	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.

	:param Parameters:
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
		%feature("autodoc", "	* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.

	:param Parameters:
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
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* returns the matrix of points value.

	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* returns the matrix of resulting control points value.

	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
};


%extend GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.

	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.

	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	* returns the derivative function matrix used to approximate the set.

	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* returns the distances between the points of the multiline and the approximation curves.

	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.

	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.

	:param Grad:
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
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	* returns the value (P2 - P1)/ V1 if the first point was a tangency point.

	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	* returns the function matrix used to approximate the set.

	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).

	:param SSP:
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
		%feature("autodoc", "	* Initializes the fields of the object.

	:param SSP:
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
		%feature("autodoc", "	* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).

	:param SSP:
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
		%feature("autodoc", "	* Initializes the fields of the object.

	:param SSP:
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.

	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	* returns the value (PN - PN-1)/ VN if the last point was a tangency point.

	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.

	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields.

	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.

	:param Parameters:
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
		%feature("autodoc", "	* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.

	:param Parameters:
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
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* returns the matrix of points value.

	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* returns the matrix of resulting control points value.

	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
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
		%feature("compactdefaultargs") Orientation1;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation1;
		TopAbs_Orientation Orientation1 ();
		%feature("compactdefaultargs") Orientation2;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation2;
		TopAbs_Orientation Orientation2 ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
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
};


%extend GeomInt_ParameterAndOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "	* Returns the derivative of the constraint matrix.

	:param SSP:
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
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "	* returns the duale variables of the system.

	:rtype: math_Vector
") Duale;
		const math_Vector & Duale ();
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param Bern:
	:type Bern: math_Matrix &
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix &
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None
") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "	* returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.

	:rtype: math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "	* Returns the derivative of the constraint matrix.

	:param SSP:
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
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "	* returns the duale variables of the system.

	:rtype: math_Vector
") Duale;
		const math_Vector & Duale ();
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "	* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.

	:param SSP:
	:type SSP: GeomInt_TheMultiLineOfWLApprox &
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: opencascade::handle<AppParCurves_HArray1OfConstraintCouple> &
	:param Bern:
	:type Bern: math_Matrix &
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix &
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None
") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox (const GeomInt_TheMultiLineOfWLApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "	* returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.

	:rtype: math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheComputeLineBezierOfWLApprox;
class GeomInt_TheComputeLineBezierOfWLApprox {
	public:
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* returns the result of the approximation.

	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the tolerances 2d and 3d of the <Index> MultiCurve.

	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.

	:param Line:
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
		%feature("autodoc", "	* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.

	:param Line:
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
		%feature("autodoc", "	* Initializes the fields of the algorithm.

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
		 GeomInt_TheComputeLineBezierOfWLApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

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
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

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
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	* returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.

	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	* returns False if the status NoPointsAdded has been sent.

	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "	* Returns the number of MultiCurve doing the approximation of the MultiLine.

	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* returns the new parameters of the approximation corresponding to the points of the multicurve <Index>.

	:param Index: default value is 1
	:type Index: int
	:rtype: TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") Parametrization;
		%feature("autodoc", "	* returns the type of parametrization

	:rtype: Approx_ParametrizationType
") Parametrization;
		Approx_ParametrizationType Parametrization ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* runs the algorithm after having initialized the fields.

	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:rtype: None
") Perform;
		void Perform (const GeomInt_TheMultiLineOfWLApprox & Line);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	* changes the first and the last constraint points.

	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	* changes the degrees of the approximation.

	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	* Changes the tolerances of the approximation.

	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SplineValue;
		%feature("autodoc", "	* returns the result of the approximation.

	:rtype: AppParCurves_MultiBSpCurve
") SplineValue;
		const AppParCurves_MultiBSpCurve & SplineValue ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the result of the approximation.

	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index = 1);
};


%extend GeomInt_TheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheComputeLineOfWLApprox;
class GeomInt_TheComputeLineOfWLApprox {
	public:
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* returns the result of the approximation.

	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the tolerances 2d and 3d of the MultiBSpCurve.

	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "	* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all. //! The multiplicities of the internal knots is set by default.

	:param Line:
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
		%feature("autodoc", "	* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.

	:param Line:
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
		%feature("autodoc", "	* Initializes the fields of the algorithm.

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
		 GeomInt_TheComputeLineOfWLApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

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
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

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
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "	* Constructs an interpolation of the MultiLine <Line> The result will be a C2 curve of degree 3.

	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:rtype: None
") Interpol;
		void Interpol (const GeomInt_TheMultiLineOfWLApprox & Line);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	* returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.

	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	* returns False if the status NoPointsAdded has been sent.

	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* returns the new parameters of the approximation corresponding to the points of the MultiBSpCurve.

	:rtype: TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* runs the algorithm after having initialized the fields.

	:param Line:
	:type Line: GeomInt_TheMultiLineOfWLApprox &
	:rtype: None
") Perform;
		void Perform (const GeomInt_TheMultiLineOfWLApprox & Line);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	* changes the first and the last constraint points.

	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	* sets the continuity of the spline. if C = 2, the spline will be C2.

	:param C:
	:type C: int
	:rtype: None
") SetContinuity;
		void SetContinuity (const Standard_Integer C);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	* changes the degrees of the approximation.

	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "	* The approximation will be done with the set of knots <Knots>. The multiplicities will be set with the degree and the desired continuity.

	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:rtype: None
") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & Knots);
		%feature("compactdefaultargs") SetKnotsAndMultiplicities;
		%feature("autodoc", "	* The approximation will be done with the set of knots <Knots> and the multiplicities <Mults>.

	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") SetKnotsAndMultiplicities;
		void SetKnotsAndMultiplicities (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* The approximation will begin with the set of parameters <ThePar>.

	:param ThePar:
	:type ThePar: math_Vector &
	:rtype: None
") SetParameters;
		void SetParameters (const math_Vector & ThePar);
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "	* Sets periodic flag. If thePeriodic = Standard_True, algorith tries to build periodic multicurve using corresponding C1 boundary condition for first and last multipoints. Multiline must be closed.

	:param thePeriodic:
	:type thePeriodic: bool
	:rtype: None
") SetPeriodic;
		void SetPeriodic (const Standard_Boolean thePeriodic);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	* Changes the tolerances of the approximation.

	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the result of the approximation.

	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value ();
};


%extend GeomInt_TheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface1 ();
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface2 ();
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
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		%feature("compactdefaultargs") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param S1:
	:type S1: opencascade::handle<Adaptor3d_HSurface> &
	:param S2:
	:type S2: opencascade::handle<Adaptor3d_HSurface> &
	:rtype: None
") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2);
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		gp_Pnt Point ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* returns somme des fi*fi

	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
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
};


%extend GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheImpPrmSvSurfacesOfWLApprox;
class GeomInt_TheImpPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* returns True if Tg,Tguv1 Tguv2 can be computed.

	:param u1:
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
		%feature("compactdefaultargs") FillInitialVectorOfSolution;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param binfu:
	:type binfu: float
	:param bsupu:
	:type bsupu: float
	:param binfv:
	:type binfv: float
	:param bsupv:
	:type bsupv: float
	:param X:
	:type X: math_Vector &
	:param TranslationU:
	:type TranslationU: float &
	:param TranslationV:
	:type TranslationV: float &
	:rtype: bool
") FillInitialVectorOfSolution;
		Standard_Boolean FillInitialVectorOfSolution (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,const Standard_Real binfu,const Standard_Real bsupu,const Standard_Real binfv,const Standard_Real bsupv,math_Vector & X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: opencascade::handle<Adaptor3d_HSurface> &
	:param Surf2:
	:type Surf2: IntSurf_Quadric &
	:rtype: None
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox (const opencascade::handle<Adaptor3d_HSurface> & Surf1,const IntSurf_Quadric & Surf2);
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: IntSurf_Quadric &
	:param Surf2:
	:type Surf2: opencascade::handle<Adaptor3d_HSurface> &
	:rtype: None
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox (const IntSurf_Quadric & Surf1,const opencascade::handle<Adaptor3d_HSurface> & Surf2);
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
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Point:
	:type Point: IntSurf_PntOn2S &
	:rtype: bool
") SeekPoint;
		Standard_Boolean SeekPoint (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,IntSurf_PntOn2S & Point);
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
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	* return the intersection point which is enable for changing.

	:rtype: IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the tangent at the intersection line.

	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "	* Returns the tangent at the intersection line in the parametric space of the first surface.

	:rtype: gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d  DirectionOnS1 ();
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "	* Returns the tangent at the intersection line in the parametric space of the second surface.

	:rtype: gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d  DirectionOnS2 ();
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* return the math function which is used to compute the intersection

	:rtype: GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox
") Function;
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox & Function ();
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	* compute the solution point with the close point

	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param S1:
	:type S1: opencascade::handle<Adaptor3d_HSurface> &
	:param S2:
	:type S2: opencascade::handle<Adaptor3d_HSurface> &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox (const TColStd_Array1OfReal & Param,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	* initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }

	:param S1:
	:type S1: opencascade::handle<Adaptor3d_HSurface> &
	:param S2:
	:type S2: opencascade::handle<Adaptor3d_HSurface> &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the creation completed without failure.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True when there is no solution to the problem.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	* Returns True if the surfaces are tangent at the intersection point.

	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is calculated)

	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is given by ChoixIso)

	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld,const IntImp_ConstIsoparametric ChoixIso);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the intersection point.

	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point ();
};


%extend GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_TheMultiLineOfWLApprox;
class GeomInt_TheMultiLineOfWLApprox {
	public:
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump of the current multi-line.

	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "	:rtype: None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox ();
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "	* The class SvSurfaces is used when the approximation algorithm needs some extra points on the line <line>. A New line is then created which shares the same surfaces and functions. SvSurfaces is a deferred class which allows several implementations of this algorithm with different surfaces (bi-parametric ones, or implicit and biparametric ones)

	:param line:
	:type line: opencascade::handle<IntPatch_WLine> &
	:param PtrSvSurfaces:
	:type PtrSvSurfaces: Standard_Address
	:param NbP3d:
	:type NbP3d: int
	:param NbP2d:
	:type NbP2d: int
	:param ApproxU1V1:
	:type ApproxU1V1: bool
	:param ApproxU2V2:
	:type ApproxU2V2: bool
	:param xo:
	:type xo: float
	:param yo:
	:type yo: float
	:param zo:
	:type zo: float
	:param u1o:
	:type u1o: float
	:param v1o:
	:type v1o: float
	:param u2o:
	:type u2o: float
	:param v2o:
	:type v2o: float
	:param P2DOnFirst:
	:type P2DOnFirst: bool
	:param IndMin: default value is 0
	:type IndMin: int
	:param IndMax: default value is 0
	:type IndMax: int
	:rtype: None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox (const opencascade::handle<IntPatch_WLine> & line,const Standard_Address PtrSvSurfaces,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Boolean ApproxU1V1,const Standard_Boolean ApproxU2V2,const Standard_Real xo,const Standard_Real yo,const Standard_Real zo,const Standard_Real u1o,const Standard_Real v1o,const Standard_Real u2o,const Standard_Real v2o,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "	* No Extra points will be added on the current line

	:param line:
	:type line: opencascade::handle<IntPatch_WLine> &
	:param NbP3d:
	:type NbP3d: int
	:param NbP2d:
	:type NbP2d: int
	:param ApproxU1V1:
	:type ApproxU1V1: bool
	:param ApproxU2V2:
	:type ApproxU2V2: bool
	:param xo:
	:type xo: float
	:param yo:
	:type yo: float
	:param zo:
	:type zo: float
	:param u1o:
	:type u1o: float
	:param v1o:
	:type v1o: float
	:param u2o:
	:type u2o: float
	:param v2o:
	:type v2o: float
	:param P2DOnFirst:
	:type P2DOnFirst: bool
	:param IndMin: default value is 0
	:type IndMin: int
	:param IndMax: default value is 0
	:type IndMax: int
	:rtype: None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox (const opencascade::handle<IntPatch_WLine> & line,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Boolean ApproxU1V1,const Standard_Boolean ApproxU2V2,const Standard_Real xo,const Standard_Real yo,const Standard_Real zo,const Standard_Real u1o,const Standard_Real v1o,const Standard_Real u2o,const Standard_Real v2o,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:rtype: int
") LastPoint;
		Standard_Integer LastPoint ();
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "	* Tries to make a sub-line between <Low> and <High> points of this line by adding <NbPointsToInsert> new points

	:param Low:
	:type Low: int
	:param High:
	:type High: int
	:param NbPointsToInsert:
	:type NbPointsToInsert: int
	:rtype: GeomInt_TheMultiLineOfWLApprox
") MakeMLBetween;
		GeomInt_TheMultiLineOfWLApprox MakeMLBetween (const Standard_Integer Low,const Standard_Integer High,const Standard_Integer NbPointsToInsert);
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "	* Tries to make a sub-line between <Low> and <High> points of this line by adding one more point between (indbad-1)-th and indbad-th points

	:param Low:
	:type Low: int
	:param High:
	:type High: int
	:param indbad:
	:type indbad: int
	:param OtherLine:
	:type OtherLine: GeomInt_TheMultiLineOfWLApprox &
	:rtype: bool
") MakeMLOneMorePoint;
		Standard_Boolean MakeMLOneMorePoint (const Standard_Integer Low,const Standard_Integer High,const Standard_Integer indbad,GeomInt_TheMultiLineOfWLApprox & OtherLine);
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "	* Returns the number of 2d points of a TheLine.

	:rtype: int
") NbP2d;
		Standard_Integer NbP2d ();
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "	* Returns the number of 3d points of a TheLine.

	:rtype: int
") NbP3d;
		Standard_Integer NbP3d ();
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	* Returns the 3d tangency points of the multipoint <MPointIndex> only when 3d points exist.

	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	* Returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.

	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	* Returns the 3d and 2d points of the multipoint <MPointIndex>.

	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.

	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.

	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the 3d and 2d points of the multipoint <MPointIndex>.

	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "	:rtype: Approx_Status
") WhatStatus;
		Approx_Status WhatStatus ();
};


%extend GeomInt_TheMultiLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class GeomInt_TheMultiLineToolOfWLApprox {
	public:
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	* returns the 3d curvature of the multipoint <MPointIndex> when only 3d points exist.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	* returns the 2d curvature points of the multipoint <MPointIndex> only when 2d points exist.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	* returns the 3d and 2d curvature of the multipoint <MPointIndex>.

	:param ML:
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
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump of the current multi-line.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: None
") Dump;
		static void Dump (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* Returns the number of multipoints of the TheMultiLine.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") FirstPoint;
		static Standard_Integer FirstPoint (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	* Returns the number of multipoints of the TheMultiLine.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") LastPoint;
		static Standard_Integer LastPoint (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "	* Is called if WhatStatus returned 'PointsAdded'.

	:param ML:
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
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "	* Is called when the Bezier curve contains a loop

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param indbad:
	:type indbad: int
	:param OtherLine:
	:type OtherLine: GeomInt_TheMultiLineOfWLApprox &
	:rtype: bool
") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer indbad,GeomInt_TheMultiLineOfWLApprox & OtherLine);
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "	* Returns the number of 2d points of a TheMultiLine.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") NbP2d;
		static Standard_Integer NbP2d (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "	* Returns the number of 3d points of a TheMultiLine.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:rtype: int
") NbP3d;
		static Standard_Integer NbP3d (const GeomInt_TheMultiLineOfWLApprox & ML);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	* returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	* returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	* returns the 3d and 2d points of the multipoint <MPointIndex>.

	:param ML:
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: None
") Value;
		static void Value (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		static void Value (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the 3d and 2d points of the multipoint <MPointIndex>.

	:param ML:
	:type ML: GeomInt_TheMultiLineOfWLApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		static void Value (const GeomInt_TheMultiLineOfWLApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
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
};


%extend GeomInt_TheMultiLineToolOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_ThePrmPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* returns True if Tg,Tguv1 Tguv2 can be computed.

	:param u1:
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
		%feature("compactdefaultargs") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: opencascade::handle<Adaptor3d_HSurface> &
	:param Surf2:
	:type Surf2: opencascade::handle<Adaptor3d_HSurface> &
	:rtype: None
") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_ThePrmPrmSvSurfacesOfWLApprox (const opencascade::handle<Adaptor3d_HSurface> & Surf1,const opencascade::handle<Adaptor3d_HSurface> & Surf2);
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
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Point:
	:type Point: IntSurf_PntOn2S &
	:rtype: bool
") SeekPoint;
		Standard_Boolean SeekPoint (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,IntSurf_PntOn2S & Point);
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
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Direction2d;
		const gp_Dir2d  Direction2d ();
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction3d;
		const gp_Vec  Direction3d ();
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:rtype: None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ();
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param PS:
	:type PS: opencascade::handle<Adaptor3d_HSurface> &
	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox (const opencascade::handle<Adaptor3d_HSurface> & PS,const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "	:rtype: IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HSurface>
") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param PS:
	:type PS: opencascade::handle<Adaptor3d_HSurface> &
	:rtype: None
") Set;
		void Set (const opencascade::handle<Adaptor3d_HSurface> & PS);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Set;
		void Set (const Standard_Real Tolerance);
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") SetImplicitSurface;
		void SetImplicitSurface (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns the value Tol so that if Abs(Func.Root())<Tol the function is considered null.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
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
};


%extend GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
