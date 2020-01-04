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
%define APPDEFDOCSTRING
"AppDef module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_appdef.html"
%enddef
%module (package="OCC.Core", docstring=APPDEFDOCSTRING) AppDef


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
#include<AppDef_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<AppParCurves_module.hxx>
#include<TColStd_module.hxx>
#include<Approx_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<FEmTool_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<PLib_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import AppParCurves.i
%import TColStd.i
%import Approx.i
%import TColgp.i
%import gp.i
%import FEmTool.i
%import GeomAbs.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(AppDef_SmoothCriterion)
%wrap_handle(AppDef_LinearCriteria)
%wrap_handle(AppDef_HArray1OfMultiPointConstraint)
/* end handles declaration */

/* templates */
%template(AppDef_Array1OfMultiPointConstraint) NCollection_Array1 <AppDef_MultiPointConstraint>;

%extend NCollection_Array1 <AppDef_MultiPointConstraint> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <AppDef_MultiPointConstraint> AppDef_Array1OfMultiPointConstraint;
/* end typedefs declaration */

/****************************************************************
* class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute *
****************************************************************/
class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute : public math_BFGS {
	public:
		/****************** AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:param StartingPoint:
	:type StartingPoint: math_Vector
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);

};


%extend AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute *
**************************************************************/
class AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has <NbPol> control points.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer NbPol);

		/****************** CurveValue ******************/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "* returns the MultiBSpCurve approximating the set after computing the value F or Grad(F).
	:rtype: AppParCurves_MultiBSpCurve") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue ();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "* returns the derivative function matrix used to approximate the multiline.
	:rtype: math_Matrix") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "* returns the function matrix used to approximate the multiline.
	:rtype: math_Matrix") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "* returns the gradient G of the sum above for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param G:
	:type G: math_Vector
	:rtype: bool") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
	:rtype: math_IntegerVector") Index;
		const math_IntegerVector & Index ();

		/****************** LastConstraint ******************/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiBSpCurve.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiBSpCurve.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* returns the number of variables of the function. It corresponds to the number of MultiPoints.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "* returns the new parameters of the MultiLine.
	:rtype: math_Vector") NewParameters;
		const math_Vector & NewParameters ();

		/****************** SetFirstLambda ******************/
		%feature("compactdefaultargs") SetFirstLambda;
		%feature("autodoc", ":param l1:
	:type l1: float
	:rtype: None") SetFirstLambda;
		void SetFirstLambda (const Standard_Real l1);

		/****************** SetLastLambda ******************/
		%feature("compactdefaultargs") SetLastLambda;
		%feature("autodoc", ":param l2:
	:type l2: float
	:rtype: None") SetLastLambda;
		void SetLastLambda (const Standard_Real l2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);

};


%extend AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute *
*****************************************************************/
class AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute {
	public:
		/****************** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
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
	:rtype: None") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
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
	:rtype: None") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiBSpCurve") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiCurve") BezierValue;
		AppParCurves_MultiCurve BezierValue ();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "* returns the derivative function matrix used to approximate the set.
	:rtype: math_Matrix") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* returns the distances between the points of the multiline and the approximation curves.
	:rtype: math_Matrix") Distance;
		const math_Matrix & Distance ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
	:param Grad:
	:type Grad: math_Vector
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "* returns the value (P2 - P1)/ V1 if the first point was a tangency point.
	:rtype: float") FirstLambda;
		Standard_Real FirstLambda ();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "* returns the function matrix used to approximate the set.
	:rtype: math_Matrix") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
	:rtype: math_IntegerVector") KIndex;
		const math_IntegerVector & KIndex ();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "* returns the value (PN - PN-1)/ VN if the last point was a tangency point.
	:rtype: float") LastLambda;
		Standard_Real LastLambda ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
	:param Parameters:
	:type Parameters: math_Vector
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields.
	:param Parameters:
	:type Parameters: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param V1c:
	:type V1c: math_Vector
	:param V2c:
	:type V2c: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "* returns the matrix of points value.
	:rtype: math_Matrix") Points;
		const math_Matrix & Points ();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "* returns the matrix of resulting control points value.
	:rtype: math_Matrix") Poles;
		const math_Matrix & Poles ();

};


%extend AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class AppDef_BSplineCompute *
******************************/
class AppDef_BSplineCompute {
	public:
		/****************** AppDef_BSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all. //! The multiplicities of the internal knots is set by default.
	:param Line:
	:type Line: AppDef_MultiLine
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
	:rtype: None") AppDef_BSplineCompute;
		 AppDef_BSplineCompute (const AppDef_MultiLine & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_BSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
	:param Line:
	:type Line: AppDef_MultiLine
	:param Parameters:
	:type Parameters: math_Vector
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
	:rtype: None") AppDef_BSplineCompute;
		 AppDef_BSplineCompute (const AppDef_MultiLine & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_BSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "* Initializes the fields of the algorithm.
	:param Parameters:
	:type Parameters: math_Vector
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
	:rtype: None") AppDef_BSplineCompute;
		 AppDef_BSplineCompute (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_BSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "* Initializes the fields of the algorithm.
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
	:rtype: None") AppDef_BSplineCompute;
		 AppDef_BSplineCompute (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "* returns the result of the approximation.
	:rtype: AppParCurves_MultiBSpCurve") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the tolerances 2d and 3d of the MultiBSpCurve.
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the fields of the algorithm.
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
	:rtype: None") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** Interpol ******************/
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "* Constructs an interpolation of the MultiLine <Line> The result will be a C2 curve of degree 3.
	:param Line:
	:type Line: AppDef_MultiLine
	:rtype: None") Interpol;
		void Interpol (const AppDef_MultiLine & Line);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "* returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
	:rtype: bool") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "* returns False if the status NoPointsAdded has been sent.
	:rtype: bool") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* returns the new parameters of the approximation corresponding to the points of the MultiBSpCurve.
	:rtype: TColStd_Array1OfReal") Parameters;
		const TColStd_Array1OfReal & Parameters ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* runs the algorithm after having initialized the fields.
	:param Line:
	:type Line: AppDef_MultiLine
	:rtype: None") Perform;
		void Perform (const AppDef_MultiLine & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "* changes the first and the last constraint points.
	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "* sets the continuity of the spline. if C = 2, the spline will be C2.
	:param C:
	:type C: int
	:rtype: None") SetContinuity;
		void SetContinuity (const Standard_Integer C);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "* changes the degrees of the approximation.
	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);

		/****************** SetKnots ******************/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "* The approximation will be done with the set of knots <Knots>. The multiplicities will be set with the degree and the desired continuity.
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:rtype: None") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & Knots);

		/****************** SetKnotsAndMultiplicities ******************/
		%feature("compactdefaultargs") SetKnotsAndMultiplicities;
		%feature("autodoc", "* The approximation will be done with the set of knots <Knots> and the multiplicities <Mults>.
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:rtype: None") SetKnotsAndMultiplicities;
		void SetKnotsAndMultiplicities (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "* The approximation will begin with the set of parameters <ThePar>.
	:param ThePar:
	:type ThePar: math_Vector
	:rtype: None") SetParameters;
		void SetParameters (const math_Vector & ThePar);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "* Sets periodic flag. If thePeriodic = Standard_True, algorith tries to build periodic multicurve using corresponding C1 boundary condition for first and last multipoints. Multiline must be closed.
	:param thePeriodic:
	:type thePeriodic: bool
	:rtype: None") SetPeriodic;
		void SetPeriodic (const Standard_Boolean thePeriodic);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "* Changes the tolerances of the approximation.
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the result of the approximation.
	:rtype: AppParCurves_MultiBSpCurve") Value;
		const AppParCurves_MultiBSpCurve & Value ();

};


%extend AppDef_BSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class AppDef_Compute *
***********************/
class AppDef_Compute {
	public:
		/****************** AppDef_Compute ******************/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
	:param Line:
	:type Line: AppDef_MultiLine
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
	:rtype: None") AppDef_Compute;
		 AppDef_Compute (const AppDef_MultiLine & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_Compute ******************/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
	:param Line:
	:type Line: AppDef_MultiLine
	:param Parameters:
	:type Parameters: math_Vector
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
	:rtype: None") AppDef_Compute;
		 AppDef_Compute (const AppDef_MultiLine & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_Compute ******************/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "* Initializes the fields of the algorithm.
	:param Parameters:
	:type Parameters: math_Vector
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
	:rtype: None") AppDef_Compute;
		 AppDef_Compute (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_Compute ******************/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "* Initializes the fields of the algorithm.
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
	:rtype: None") AppDef_Compute;
		 AppDef_Compute (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "* returns the result of the approximation.
	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index = 1);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the tolerances 2d and 3d of the <Index> MultiCurve.
	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the fields of the algorithm.
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
	:rtype: None") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "* returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
	:rtype: bool") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "* returns False if the status NoPointsAdded has been sent.
	:rtype: bool") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "* Returns the number of MultiCurve doing the approximation of the MultiLine.
	:rtype: int") NbMultiCurves;
		Standard_Integer NbMultiCurves ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* returns the new parameters of the approximation corresponding to the points of the multicurve <Index>.
	:param Index: default value is 1
	:type Index: int
	:rtype: TColStd_Array1OfReal") Parameters;
		const TColStd_Array1OfReal & Parameters (const Standard_Integer Index = 1);

		/****************** Parametrization ******************/
		%feature("compactdefaultargs") Parametrization;
		%feature("autodoc", "* returns the type of parametrization
	:rtype: Approx_ParametrizationType") Parametrization;
		Approx_ParametrizationType Parametrization ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* runs the algorithm after having initialized the fields.
	:param Line:
	:type Line: AppDef_MultiLine
	:rtype: None") Perform;
		void Perform (const AppDef_MultiLine & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "* changes the first and the last constraint points.
	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "* changes the degrees of the approximation.
	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "* Changes the tolerances of the approximation.
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);

		/****************** SplineValue ******************/
		%feature("compactdefaultargs") SplineValue;
		%feature("autodoc", "* returns the result of the approximation.
	:rtype: AppParCurves_MultiBSpCurve") SplineValue;
		const AppParCurves_MultiBSpCurve & SplineValue ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the result of the approximation.
	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index = 1);

};


%extend AppDef_Compute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class AppDef_Gradient_BFGSOfMyGradientOfCompute *
**************************************************/
class AppDef_Gradient_BFGSOfMyGradientOfCompute : public math_BFGS {
	public:
		/****************** AppDef_Gradient_BFGSOfMyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientOfCompute;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:param StartingPoint:
	:type StartingPoint: math_Vector
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None") AppDef_Gradient_BFGSOfMyGradientOfCompute;
		 AppDef_Gradient_BFGSOfMyGradientOfCompute (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);

};


%extend AppDef_Gradient_BFGSOfMyGradientOfCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute *
************************************************************/
class AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute : public math_BFGS {
	public:
		/****************** AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:param StartingPoint:
	:type StartingPoint: math_Vector
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
		 AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);

};


%extend AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class AppDef_Gradient_BFGSOfTheGradient *
******************************************/
class AppDef_Gradient_BFGSOfTheGradient : public math_BFGS {
	public:
		/****************** AppDef_Gradient_BFGSOfTheGradient ******************/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfTheGradient;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:param StartingPoint:
	:type StartingPoint: math_Vector
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None") AppDef_Gradient_BFGSOfTheGradient;
		 AppDef_Gradient_BFGSOfTheGradient (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);

};


%extend AppDef_Gradient_BFGSOfTheGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class AppDef_MultiLine *
*************************/
class AppDef_MultiLine {
	public:
		/****************** AppDef_MultiLine ******************/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "* creates an undefined MultiLine.
	:rtype: None") AppDef_MultiLine;
		 AppDef_MultiLine ();

		/****************** AppDef_MultiLine ******************/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "* given the number NbMult of MultiPointConstraints of this MultiLine , it initializes all the fields.SetValue must be called in order for the values of the multipoint constraint to be taken into account. An exception is raised if NbMult < 0.
	:param NbMult:
	:type NbMult: int
	:rtype: None") AppDef_MultiLine;
		 AppDef_MultiLine (const Standard_Integer NbMult);

		/****************** AppDef_MultiLine ******************/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "* Constructs a MultiLine with an array of MultiPointConstraints.
	:param tabMultiP:
	:type tabMultiP: AppDef_Array1OfMultiPointConstraint
	:rtype: None") AppDef_MultiLine;
		 AppDef_MultiLine (const AppDef_Array1OfMultiPointConstraint & tabMultiP);

		/****************** AppDef_MultiLine ******************/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "* The MultiLine constructed will have one line of 3d points without their tangencies.
	:param tabP3d:
	:type tabP3d: TColgp_Array1OfPnt
	:rtype: None") AppDef_MultiLine;
		 AppDef_MultiLine (const TColgp_Array1OfPnt & tabP3d);

		/****************** AppDef_MultiLine ******************/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "* The MultiLine constructed will have one line of 2d points without their tangencies.
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:rtype: None") AppDef_MultiLine;
		 AppDef_MultiLine (const TColgp_Array1OfPnt2d & tabP2d);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** NbMultiPoints ******************/
		%feature("compactdefaultargs") NbMultiPoints;
		%feature("autodoc", "* returns the number of MultiPointConstraints of the MultiLine.
	:rtype: int") NbMultiPoints;
		Standard_Integer NbMultiPoints ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* returns the number of Points from MultiPoints composing the MultiLine.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* It sets the MultiPointConstraint of range Index to the value MPoint. An exception is raised if Index < 0 or Index> MPoint. An exception is raised if the dimensions of the MultiPoints are different.
	:param Index:
	:type Index: int
	:param MPoint:
	:type MPoint: AppDef_MultiPointConstraint
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer Index,const AppDef_MultiPointConstraint & MPoint);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the MultiPointConstraint of range Index An exception is raised if Index<0 or Index>MPoint.
	:param Index:
	:type Index: int
	:rtype: AppDef_MultiPointConstraint") Value;
		AppDef_MultiPointConstraint Value (const Standard_Integer Index);

};


%extend AppDef_MultiLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class AppDef_MultiPointConstraint *
************************************/
class AppDef_MultiPointConstraint : public AppParCurves_MultiPoint {
	public:
		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates an undefined MultiPointConstraint.
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint ();

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d.
	:param NbPoints:
	:type NbPoints: int
	:param NbPoints2d:
	:type NbPoints2d: int
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const Standard_Integer NbPoints,const Standard_Integer NbPoints2d);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPoint only composed of 3D points.
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt & tabP);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPoint only composed of 2D points.
	:param tabP:
	:type tabP: TColgp_Array1OfPnt2d
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt2d & tabP);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d.
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt & tabP,const TColgp_Array1OfPnt2d & tabP2d);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPointConstraint with a constraint of Curvature. An exception is raised if (length of <tabP> + length of <tabP2d> ) is different from (length of <tabVec> + length of <tabVec2d> ) or from (length of <tabCur> + length of <tabCur2d> )
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:param tabVec:
	:type tabVec: TColgp_Array1OfVec
	:param tabVec2d:
	:type tabVec2d: TColgp_Array1OfVec2d
	:param tabCur:
	:type tabCur: TColgp_Array1OfVec
	:param tabCur2d:
	:type tabCur2d: TColgp_Array1OfVec2d
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt & tabP,const TColgp_Array1OfPnt2d & tabP2d,const TColgp_Array1OfVec & tabVec,const TColgp_Array1OfVec2d & tabVec2d,const TColgp_Array1OfVec & tabCur,const TColgp_Array1OfVec2d & tabCur2d);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPointConstraint with a constraint of Tangency. An exception is raised if (length of <tabP> + length of <tabP2d> ) is different from (length of <tabVec> + length of <tabVec2d> )
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:param tabVec:
	:type tabVec: TColgp_Array1OfVec
	:param tabVec2d:
	:type tabVec2d: TColgp_Array1OfVec2d
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt & tabP,const TColgp_Array1OfPnt2d & tabP2d,const TColgp_Array1OfVec & tabVec,const TColgp_Array1OfVec2d & tabVec2d);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPointConstraint only composed of 3d points with constraints of curvature. An exception is raised if the length of tabP is different from the length of tabVec or from tabCur.
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabVec:
	:type tabVec: TColgp_Array1OfVec
	:param tabCur:
	:type tabCur: TColgp_Array1OfVec
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt & tabP,const TColgp_Array1OfVec & tabVec,const TColgp_Array1OfVec & tabCur);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPointConstraint only composed of 3d points with constraints of tangency. An exception is raised if the length of tabP is different from the length of tabVec.
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabVec:
	:type tabVec: TColgp_Array1OfVec
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt & tabP,const TColgp_Array1OfVec & tabVec);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPointConstraint only composed of 2d points with constraints of tangency. An exception is raised if the length of tabP is different from the length of tabVec2d.
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:param tabVec2d:
	:type tabVec2d: TColgp_Array1OfVec2d
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt2d & tabP2d,const TColgp_Array1OfVec2d & tabVec2d);

		/****************** AppDef_MultiPointConstraint ******************/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "* creates a MultiPointConstraint only composed of 2d points with constraints of curvature. An exception is raised if the length of tabP is different from the length of tabVec2d or from tabCur2d.
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:param tabVec2d:
	:type tabVec2d: TColgp_Array1OfVec2d
	:param tabCur2d:
	:type tabCur2d: TColgp_Array1OfVec2d
	:rtype: None") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint (const TColgp_Array1OfPnt2d & tabP2d,const TColgp_Array1OfVec2d & tabVec2d,const TColgp_Array1OfVec2d & tabCur2d);

		/****************** Curv ******************/
		%feature("compactdefaultargs") Curv;
		%feature("autodoc", "* returns the normal vector at the point of range Index. An exception is raised if Index < 0 or if Index > number of 3d points.
	:param Index:
	:type Index: int
	:rtype: gp_Vec") Curv;
		gp_Vec Curv (const Standard_Integer Index);

		/****************** Curv2d ******************/
		%feature("compactdefaultargs") Curv2d;
		%feature("autodoc", "* returns the normal vector at the point of range Index. An exception is raised if Index < 0 or if Index > number of 3d points.
	:param Index:
	:type Index: int
	:rtype: gp_Vec2d") Curv2d;
		gp_Vec2d Curv2d (const Standard_Integer Index);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** IsCurvaturePoint ******************/
		%feature("compactdefaultargs") IsCurvaturePoint;
		%feature("autodoc", "* returns True if the MultiPoint has a curvature value.
	:rtype: bool") IsCurvaturePoint;
		Standard_Boolean IsCurvaturePoint ();

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "* returns True if the MultiPoint has a tangency value.
	:rtype: bool") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();

		/****************** SetCurv ******************/
		%feature("compactdefaultargs") SetCurv;
		%feature("autodoc", "* Vec sets the value of the normal vector at the point of index Index. The norm of the normal vector at the point of position Index is set to the normal curvature. An exception is raised if Index <0 or if Index > number of 3d points. An exception is raised if Curv has an incorrect number of dimensions.
	:param Index:
	:type Index: int
	:param Curv:
	:type Curv: gp_Vec
	:rtype: None") SetCurv;
		void SetCurv (const Standard_Integer Index,const gp_Vec & Curv);

		/****************** SetCurv2d ******************/
		%feature("compactdefaultargs") SetCurv2d;
		%feature("autodoc", "* Vec sets the value of the normal vector at the point of index Index. The norm of the normal vector at the point of position Index is set to the normal curvature. An exception is raised if Index <0 or if Index > number of 3d points. An exception is raised if Curv has an incorrect number of dimensions.
	:param Index:
	:type Index: int
	:param Curv2d:
	:type Curv2d: gp_Vec2d
	:rtype: None") SetCurv2d;
		void SetCurv2d (const Standard_Integer Index,const gp_Vec2d & Curv2d);

		/****************** SetTang ******************/
		%feature("compactdefaultargs") SetTang;
		%feature("autodoc", "* sets the value of the tangency of the point of range Index. An exception is raised if Index <0 or if Index > number of 3d points. An exception is raised if Tang has an incorrect number of dimensions.
	:param Index:
	:type Index: int
	:param Tang:
	:type Tang: gp_Vec
	:rtype: None") SetTang;
		void SetTang (const Standard_Integer Index,const gp_Vec & Tang);

		/****************** SetTang2d ******************/
		%feature("compactdefaultargs") SetTang2d;
		%feature("autodoc", "* sets the value of the tangency of the point of range Index. An exception is raised if Index <number of 3d points or if Index > total number of Points An exception is raised if Tang has an incorrect number of dimensions.
	:param Index:
	:type Index: int
	:param Tang2d:
	:type Tang2d: gp_Vec2d
	:rtype: None") SetTang2d;
		void SetTang2d (const Standard_Integer Index,const gp_Vec2d & Tang2d);

		/****************** Tang ******************/
		%feature("compactdefaultargs") Tang;
		%feature("autodoc", "* returns the tangency value of the point of range Index. An exception is raised if Index < 0 or if Index > number of 3d points.
	:param Index:
	:type Index: int
	:rtype: gp_Vec") Tang;
		gp_Vec Tang (const Standard_Integer Index);

		/****************** Tang2d ******************/
		%feature("compactdefaultargs") Tang2d;
		%feature("autodoc", "* returns the tangency value of the point of range Index. An exception is raised if Index < number of 3d points or if Index > total number of points.
	:param Index:
	:type Index: int
	:rtype: gp_Vec2d") Tang2d;
		gp_Vec2d Tang2d (const Standard_Integer Index);

};


%extend AppDef_MultiPointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class AppDef_MyBSplGradientOfBSplineCompute *
**********************************************/
class AppDef_MyBSplGradientOfBSplineCompute {
	public:
		/****************** AppDef_MyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 1
	:type NbIterations: int
	:rtype: None") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 1);

		/****************** AppDef_MyBSplGradientOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
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
	:rtype: None") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations,const Standard_Real lambda1,const Standard_Real lambda2);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the old and the new approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
	:param Index:
	:type Index: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer Index);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns all the BSpline curves approximating the MultiLine SSP after minimization of the parameter.
	:rtype: AppParCurves_MultiBSpCurve") Value;
		AppParCurves_MultiBSpCurve Value ();

};


%extend AppDef_MyBSplGradientOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class AppDef_MyGradientOfCompute *
***********************************/
class AppDef_MyGradientOfCompute {
	public:
		/****************** AppDef_MyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_MyGradientOfCompute;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None") AppDef_MyGradientOfCompute;
		 AppDef_MyGradientOfCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the old and the new approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
	:param Index:
	:type Index: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer Index);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.
	:rtype: AppParCurves_MultiCurve") Value;
		AppParCurves_MultiCurve Value ();

};


%extend AppDef_MyGradientOfCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class AppDef_MyGradientbisOfBSplineCompute *
*********************************************/
class AppDef_MyGradientbisOfBSplineCompute {
	public:
		/****************** AppDef_MyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_MyGradientbisOfBSplineCompute;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None") AppDef_MyGradientbisOfBSplineCompute;
		 AppDef_MyGradientbisOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the old and the new approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
	:param Index:
	:type Index: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer Index);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.
	:rtype: AppParCurves_MultiCurve") Value;
		AppParCurves_MultiCurve Value ();

};


%extend AppDef_MyGradientbisOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AppDef_MyLineTool *
**************************/
class AppDef_MyLineTool {
	public:
		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* returns the 3d curvatures of the multipoint <MPointIndex> when only 3d points exist.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool") Curvature;
		static Standard_Boolean Curvature (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* returns the 2d curvatures of the multipoint <MPointIndex> only when 2d points exist.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Curvature;
		static Standard_Boolean Curvature (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* returns the 3d and 2d curvatures of the multipoint <MPointIndex>.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Curvature;
		static Standard_Boolean Curvature (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first index of multipoints of the MultiLine.
	:param ML:
	:type ML: AppDef_MultiLine
	:rtype: int") FirstPoint;
		static Standard_Integer FirstPoint (const AppDef_MultiLine & ML);

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the last index of multipoints of the MultiLine.
	:param ML:
	:type ML: AppDef_MultiLine
	:rtype: int") LastPoint;
		static Standard_Integer LastPoint (const AppDef_MultiLine & ML);

		/****************** MakeMLBetween ******************/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "* Is never called in the algorithms. Nothing is done.
	:param ML:
	:type ML: AppDef_MultiLine
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param NbPMin:
	:type NbPMin: int
	:rtype: AppDef_MultiLine") MakeMLBetween;
		static AppDef_MultiLine MakeMLBetween (const AppDef_MultiLine & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer NbPMin);

		/****************** MakeMLOneMorePoint ******************/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "* Is never called in the algorithms. Nothing is done.
	:param ML:
	:type ML: AppDef_MultiLine
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param indbad:
	:type indbad: int
	:param OtherLine:
	:type OtherLine: AppDef_MultiLine
	:rtype: bool") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint (const AppDef_MultiLine & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer indbad,AppDef_MultiLine & OtherLine);

		/****************** NbP2d ******************/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "* Returns the number of 2d points of a MultiLine.
	:param ML:
	:type ML: AppDef_MultiLine
	:rtype: int") NbP2d;
		static Standard_Integer NbP2d (const AppDef_MultiLine & ML);

		/****************** NbP3d ******************/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "* Returns the number of 3d points of a MultiLine.
	:param ML:
	:type ML: AppDef_MultiLine
	:rtype: int") NbP3d;
		static Standard_Integer NbP3d (const AppDef_MultiLine & ML);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool") Tangency;
		static Standard_Boolean Tangency (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Tangency;
		static Standard_Boolean Tangency (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* returns the 3d and 2d points of the multipoint <MPointIndex>.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Tangency;
		static Standard_Boolean Tangency (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: void") Value;
		static void Value (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void") Value;
		static void Value (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the 3d and 2d points of the multipoint <MPointIndex>.
	:param ML:
	:type ML: AppDef_MultiLine
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void") Value;
		static void Value (const AppDef_MultiLine & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);

		/****************** WhatStatus ******************/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "* returns NoPointsAdded
	:param ML:
	:type ML: AppDef_MultiLine
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: Approx_Status") WhatStatus;
		static Approx_Status WhatStatus (const AppDef_MultiLine & ML,const Standard_Integer I1,const Standard_Integer I2);

};


%extend AppDef_MyLineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class AppDef_ParFunctionOfMyGradientOfCompute *
************************************************/
class AppDef_ParFunctionOfMyGradientOfCompute : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** AppDef_ParFunctionOfMyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientOfCompute;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has the desired degree Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:rtype: None") AppDef_ParFunctionOfMyGradientOfCompute;
		 AppDef_ParFunctionOfMyGradientOfCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);

		/****************** CurveValue ******************/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "* returns the MultiCurve approximating the set after computing the value F or Grad(F).
	:rtype: AppParCurves_MultiCurve") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "* returns the gradient G of the sum above for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param G:
	:type G: math_Vector
	:rtype: bool") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);

		/****************** LastConstraint ******************/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* returns the number of variables of the function. It corresponds to the number of MultiPoints.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "* returns the new parameters of the MultiLine.
	:rtype: math_Vector") NewParameters;
		const math_Vector & NewParameters ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);

};


%extend AppDef_ParFunctionOfMyGradientOfCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class AppDef_ParFunctionOfMyGradientbisOfBSplineCompute *
**********************************************************/
class AppDef_ParFunctionOfMyGradientbisOfBSplineCompute : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has the desired degree Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:rtype: None") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		 AppDef_ParFunctionOfMyGradientbisOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);

		/****************** CurveValue ******************/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "* returns the MultiCurve approximating the set after computing the value F or Grad(F).
	:rtype: AppParCurves_MultiCurve") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "* returns the gradient G of the sum above for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param G:
	:type G: math_Vector
	:rtype: bool") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);

		/****************** LastConstraint ******************/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* returns the number of variables of the function. It corresponds to the number of MultiPoints.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "* returns the new parameters of the MultiLine.
	:rtype: math_Vector") NewParameters;
		const math_Vector & NewParameters ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);

};


%extend AppDef_ParFunctionOfMyGradientbisOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class AppDef_ParFunctionOfTheGradient *
****************************************/
class AppDef_ParFunctionOfTheGradient : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** AppDef_ParFunctionOfTheGradient ******************/
		%feature("compactdefaultargs") AppDef_ParFunctionOfTheGradient;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has the desired degree Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:rtype: None") AppDef_ParFunctionOfTheGradient;
		 AppDef_ParFunctionOfTheGradient (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);

		/****************** CurveValue ******************/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "* returns the MultiCurve approximating the set after computing the value F or Grad(F).
	:rtype: AppParCurves_MultiCurve") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "* returns the gradient G of the sum above for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param G:
	:type G: math_Vector
	:rtype: bool") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);

		/****************** LastConstraint ******************/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* returns the number of variables of the function. It corresponds to the number of MultiPoints.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "* returns the new parameters of the MultiLine.
	:rtype: math_Vector") NewParameters;
		const math_Vector & NewParameters ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);

};


%extend AppDef_ParFunctionOfTheGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class AppDef_ParLeastSquareOfMyGradientOfCompute *
***************************************************/
class AppDef_ParLeastSquareOfMyGradientOfCompute {
	public:
		/****************** AppDef_ParLeastSquareOfMyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
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
	:rtype: None") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
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
	:rtype: None") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiBSpCurve") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiCurve") BezierValue;
		AppParCurves_MultiCurve BezierValue ();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "* returns the derivative function matrix used to approximate the set.
	:rtype: math_Matrix") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* returns the distances between the points of the multiline and the approximation curves.
	:rtype: math_Matrix") Distance;
		const math_Matrix & Distance ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
	:param Grad:
	:type Grad: math_Vector
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "* returns the value (P2 - P1)/ V1 if the first point was a tangency point.
	:rtype: float") FirstLambda;
		Standard_Real FirstLambda ();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "* returns the function matrix used to approximate the set.
	:rtype: math_Matrix") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
	:rtype: math_IntegerVector") KIndex;
		const math_IntegerVector & KIndex ();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "* returns the value (PN - PN-1)/ VN if the last point was a tangency point.
	:rtype: float") LastLambda;
		Standard_Real LastLambda ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
	:param Parameters:
	:type Parameters: math_Vector
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields.
	:param Parameters:
	:type Parameters: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param V1c:
	:type V1c: math_Vector
	:param V2c:
	:type V2c: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "* returns the matrix of points value.
	:rtype: math_Matrix") Points;
		const math_Matrix & Points ();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "* returns the matrix of resulting control points value.
	:rtype: math_Matrix") Poles;
		const math_Matrix & Poles ();

};


%extend AppDef_ParLeastSquareOfMyGradientOfCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute *
*************************************************************/
class AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute {
	public:
		/****************** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
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
	:rtype: None") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
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
	:rtype: None") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiBSpCurve") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiCurve") BezierValue;
		AppParCurves_MultiCurve BezierValue ();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "* returns the derivative function matrix used to approximate the set.
	:rtype: math_Matrix") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* returns the distances between the points of the multiline and the approximation curves.
	:rtype: math_Matrix") Distance;
		const math_Matrix & Distance ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
	:param Grad:
	:type Grad: math_Vector
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "* returns the value (P2 - P1)/ V1 if the first point was a tangency point.
	:rtype: float") FirstLambda;
		Standard_Real FirstLambda ();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "* returns the function matrix used to approximate the set.
	:rtype: math_Matrix") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
	:rtype: math_IntegerVector") KIndex;
		const math_IntegerVector & KIndex ();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "* returns the value (PN - PN-1)/ VN if the last point was a tangency point.
	:rtype: float") LastLambda;
		Standard_Real LastLambda ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
	:param Parameters:
	:type Parameters: math_Vector
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields.
	:param Parameters:
	:type Parameters: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param V1c:
	:type V1c: math_Vector
	:param V2c:
	:type V2c: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "* returns the matrix of points value.
	:rtype: math_Matrix") Points;
		const math_Matrix & Points ();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "* returns the matrix of resulting control points value.
	:rtype: math_Matrix") Poles;
		const math_Matrix & Poles ();

};


%extend AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class AppDef_ParLeastSquareOfTheGradient *
*******************************************/
class AppDef_ParLeastSquareOfTheGradient {
	public:
		/****************** AppDef_ParLeastSquareOfTheGradient ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfTheGradient ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
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
	:rtype: None") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfTheGradient ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfTheGradient ******************/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
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
	:rtype: None") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiBSpCurve") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiCurve") BezierValue;
		AppParCurves_MultiCurve BezierValue ();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "* returns the derivative function matrix used to approximate the set.
	:rtype: math_Matrix") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* returns the distances between the points of the multiline and the approximation curves.
	:rtype: math_Matrix") Distance;
		const math_Matrix & Distance ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
	:param Grad:
	:type Grad: math_Vector
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "* returns the value (P2 - P1)/ V1 if the first point was a tangency point.
	:rtype: float") FirstLambda;
		Standard_Real FirstLambda ();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "* returns the function matrix used to approximate the set.
	:rtype: math_Matrix") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
	:rtype: math_IntegerVector") KIndex;
		const math_IntegerVector & KIndex ();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "* returns the value (PN - PN-1)/ VN if the last point was a tangency point.
	:rtype: float") LastLambda;
		Standard_Real LastLambda ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
	:param Parameters:
	:type Parameters: math_Vector
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields.
	:param Parameters:
	:type Parameters: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param V1c:
	:type V1c: math_Vector
	:param V2c:
	:type V2c: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "* returns the matrix of points value.
	:rtype: math_Matrix") Points;
		const math_Matrix & Points ();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "* returns the matrix of resulting control points value.
	:rtype: math_Matrix") Poles;
		const math_Matrix & Poles ();

};


%extend AppDef_ParLeastSquareOfTheGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class AppDef_ResConstraintOfMyGradientOfCompute *
**************************************************/
class AppDef_ResConstraintOfMyGradientOfCompute {
	public:
		/****************** AppDef_ResConstraintOfMyGradientOfCompute ******************/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientOfCompute;
		%feature("autodoc", "* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: AppParCurves_HArray1OfConstraintCouple
	:param Bern:
	:type Bern: math_Matrix
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None") AppDef_ResConstraintOfMyGradientOfCompute;
		 AppDef_ResConstraintOfMyGradientOfCompute (const AppDef_MultiLine & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "* Returns the derivative of the constraint matrix.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix
	:rtype: math_Matrix") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const AppDef_MultiLine & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);

		/****************** ConstraintMatrix ******************/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", ":rtype: math_Matrix") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();

		/****************** Duale ******************/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "* returns the duale variables of the system.
	:rtype: math_Vector") Duale;
		const math_Vector & Duale ();

		/****************** InverseMatrix ******************/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "* returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
	:rtype: math_Matrix") InverseMatrix;
		const math_Matrix & InverseMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

};


%extend AppDef_ResConstraintOfMyGradientOfCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class AppDef_ResConstraintOfMyGradientbisOfBSplineCompute *
************************************************************/
class AppDef_ResConstraintOfMyGradientbisOfBSplineCompute {
	public:
		/****************** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute ******************/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: AppParCurves_HArray1OfConstraintCouple
	:param Bern:
	:type Bern: math_Matrix
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		 AppDef_ResConstraintOfMyGradientbisOfBSplineCompute (const AppDef_MultiLine & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "* Returns the derivative of the constraint matrix.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix
	:rtype: math_Matrix") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const AppDef_MultiLine & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);

		/****************** ConstraintMatrix ******************/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", ":rtype: math_Matrix") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();

		/****************** Duale ******************/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "* returns the duale variables of the system.
	:rtype: math_Vector") Duale;
		const math_Vector & Duale ();

		/****************** InverseMatrix ******************/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "* returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
	:rtype: math_Matrix") InverseMatrix;
		const math_Matrix & InverseMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

};


%extend AppDef_ResConstraintOfMyGradientbisOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class AppDef_ResConstraintOfTheGradient *
******************************************/
class AppDef_ResConstraintOfTheGradient {
	public:
		/****************** AppDef_ResConstraintOfTheGradient ******************/
		%feature("compactdefaultargs") AppDef_ResConstraintOfTheGradient;
		%feature("autodoc", "* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: AppParCurves_HArray1OfConstraintCouple
	:param Bern:
	:type Bern: math_Matrix
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None") AppDef_ResConstraintOfTheGradient;
		 AppDef_ResConstraintOfTheGradient (const AppDef_MultiLine & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "* Returns the derivative of the constraint matrix.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix
	:rtype: math_Matrix") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const AppDef_MultiLine & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);

		/****************** ConstraintMatrix ******************/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", ":rtype: math_Matrix") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();

		/****************** Duale ******************/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "* returns the duale variables of the system.
	:rtype: math_Vector") Duale;
		const math_Vector & Duale ();

		/****************** InverseMatrix ******************/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "* returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
	:rtype: math_Matrix") InverseMatrix;
		const math_Matrix & InverseMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

};


%extend AppDef_ResConstraintOfTheGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AppDef_SmoothCriterion *
*******************************/
%nodefaultctor AppDef_SmoothCriterion;
class AppDef_SmoothCriterion : public Standard_Transient {
	public:
		/****************** AssemblyTable ******************/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", ":rtype: opencascade::handle<FEmTool_HAssemblyTable>") AssemblyTable;
		virtual opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable ();

		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HArray2OfInteger>") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable ();

		/****************** ErrorValues ******************/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", ":param MaxError:
	:type MaxError: float
	:param QuadraticError:
	:type QuadraticError: float
	:param AverageError:
	:type AverageError: float
	:rtype: void") ErrorValues;
		virtual void ErrorValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** EstLength ******************/
		%feature("compactdefaultargs") EstLength;
		%feature("autodoc", ":rtype: float") EstLength;
		virtual Standard_Real & EstLength ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", ":param C:
	:type C: FEmTool_Curve
	:rtype: void") GetCurve;
		virtual void GetCurve (opencascade::handle<FEmTool_Curve> & C);

		/****************** GetEstimation ******************/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", ":param E1:
	:type E1: float
	:param E2:
	:type E2: float
	:param E3:
	:type E3: float
	:rtype: void") GetEstimation;
		virtual void GetEstimation (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetWeight ******************/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", ":param QuadraticWeight:
	:type QuadraticWeight: float
	:param QualityWeight:
	:type QualityWeight: float
	:rtype: void") GetWeight;
		virtual void GetWeight (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", ":param Element:
	:type Element: int
	:param Dimension:
	:type Dimension: int
	:param G:
	:type G: math_Vector
	:rtype: void") Gradient;
		virtual void Gradient (const Standard_Integer Element,const Standard_Integer Dimension,math_Vector & G);

		/****************** Hessian ******************/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", ":param Element:
	:type Element: int
	:param Dimension1:
	:type Dimension1: int
	:param Dimension2:
	:type Dimension2: int
	:param H:
	:type H: math_Matrix
	:rtype: void") Hessian;
		virtual void Hessian (const Standard_Integer Element,const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);

		/****************** InputVector ******************/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "* Convert the assembly Vector in an Curve;
	:param X:
	:type X: math_Vector
	:param AssTable:
	:type AssTable: FEmTool_HAssemblyTable
	:rtype: void") InputVector;
		virtual void InputVector (const math_Vector & X,const opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****************** QualityValues ******************/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", ":param J1min:
	:type J1min: float
	:param J2min:
	:type J2min: float
	:param J3min:
	:type J3min: float
	:param J1:
	:type J1: float
	:param J2:
	:type J2: float
	:param J3:
	:type J3: float
	:rtype: int") QualityValues;
		virtual Standard_Integer QualityValues (const Standard_Real J1min,const Standard_Real J2min,const Standard_Real J3min,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", ":param C:
	:type C: FEmTool_Curve
	:rtype: void") SetCurve;
		virtual void SetCurve (const opencascade::handle<FEmTool_Curve> & C);

		/****************** SetEstimation ******************/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", ":param E1:
	:type E1: float
	:param E2:
	:type E2: float
	:param E3:
	:type E3: float
	:rtype: void") SetEstimation;
		virtual void SetEstimation (const Standard_Real E1,const Standard_Real E2,const Standard_Real E3);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", ":param Parameters:
	:type Parameters: TColStd_HArray1OfReal
	:rtype: void") SetParameters;
		virtual void SetParameters (const opencascade::handle<TColStd_HArray1OfReal> & Parameters);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", ":param QuadraticWeight:
	:type QuadraticWeight: float
	:param QualityWeight:
	:type QualityWeight: float
	:param percentJ1:
	:type percentJ1: float
	:param percentJ2:
	:type percentJ2: float
	:param percentJ3:
	:type percentJ3: float
	:rtype: void") SetWeight;
		virtual void SetWeight (const Standard_Real QuadraticWeight,const Standard_Real QualityWeight,const Standard_Real percentJ1,const Standard_Real percentJ2,const Standard_Real percentJ3);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", ":param Weight:
	:type Weight: TColStd_Array1OfReal
	:rtype: void") SetWeight;
		virtual void SetWeight (const TColStd_Array1OfReal & Weight);

};


%make_alias(AppDef_SmoothCriterion)

%extend AppDef_SmoothCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AppDef_TheFunction *
***************************/
class AppDef_TheFunction : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** AppDef_TheFunction ******************/
		%feature("compactdefaultargs") AppDef_TheFunction;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has the desired degree Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:rtype: None") AppDef_TheFunction;
		 AppDef_TheFunction (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);

		/****************** CurveValue ******************/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "* returns the MultiCurve approximating the set after computing the value F or Grad(F).
	:rtype: AppParCurves_MultiCurve") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer FirstPoint);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "* returns the gradient G of the sum above for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param G:
	:type G: math_Vector
	:rtype: bool") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);

		/****************** LastConstraint ******************/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", ":param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint") LastConstraint;
		AppParCurves_Constraint LastConstraint (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum distance between the points and the MultiCurve.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* returns the number of variables of the function. It corresponds to the number of MultiPoints.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "* returns the new parameters of the MultiLine.
	:rtype: math_Vector") NewParameters;
		const math_Vector & NewParameters ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);

};


%extend AppDef_TheFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AppDef_TheGradient *
***************************/
class AppDef_TheGradient {
	public:
		/****************** AppDef_TheGradient ******************/
		%feature("compactdefaultargs") AppDef_TheGradient;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None") AppDef_TheGradient;
		 AppDef_TheGradient (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the old and the new approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
	:param Index:
	:type Index: int
	:rtype: float") Error;
		Standard_Real Error (const Standard_Integer Index);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError2d;
		Standard_Real MaxError2d ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum difference between the old and the new approximation.
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.
	:rtype: AppParCurves_MultiCurve") Value;
		AppParCurves_MultiCurve Value ();

};


%extend AppDef_TheGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AppDef_TheLeastSquares *
*******************************/
class AppDef_TheLeastSquares {
	public:
		/****************** AppDef_TheLeastSquares ******************/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_TheLeastSquares ******************/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
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
	:rtype: None") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** AppDef_TheLeastSquares ******************/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector
	:param NbPol:
	:type NbPol: int
	:rtype: None") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** AppDef_TheLeastSquares ******************/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
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
	:rtype: None") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares (const AppDef_MultiLine & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiBSpCurve") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "* returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
	:rtype: AppParCurves_MultiCurve") BezierValue;
		AppParCurves_MultiCurve BezierValue ();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "* returns the derivative function matrix used to approximate the set.
	:rtype: math_Matrix") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* returns the distances between the points of the multiline and the approximation curves.
	:rtype: math_Matrix") Distance;
		const math_Matrix & Distance ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "* returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
	:param Grad:
	:type Grad: math_Vector
	:param F:
	:type F: float
	:param MaxE3d:
	:type MaxE3d: float
	:param MaxE2d:
	:type MaxE2d: float
	:rtype: None") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "* returns the value (P2 - P1)/ V1 if the first point was a tangency point.
	:rtype: float") FirstLambda;
		Standard_Real FirstLambda ();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "* returns the function matrix used to approximate the set.
	:rtype: math_Matrix") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "* Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
	:rtype: math_IntegerVector") KIndex;
		const math_IntegerVector & KIndex ();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "* returns the value (PN - PN-1)/ VN if the last point was a tangency point.
	:rtype: float") LastLambda;
		Standard_Real LastLambda ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
	:param Parameters:
	:type Parameters: math_Vector
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields.
	:param Parameters:
	:type Parameters: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
	:param Parameters:
	:type Parameters: math_Vector
	:param V1t:
	:type V1t: math_Vector
	:param V2t:
	:type V2t: math_Vector
	:param V1c:
	:type V1c: math_Vector
	:param V2c:
	:type V2c: math_Vector
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "* returns the matrix of points value.
	:rtype: math_Matrix") Points;
		const math_Matrix & Points ();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "* returns the matrix of resulting control points value.
	:rtype: math_Matrix") Poles;
		const math_Matrix & Poles ();

};


%extend AppDef_TheLeastSquares {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class AppDef_TheResol *
************************/
class AppDef_TheResol {
	public:
		/****************** AppDef_TheResol ******************/
		%feature("compactdefaultargs") AppDef_TheResol;
		%feature("autodoc", "* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: AppParCurves_HArray1OfConstraintCouple
	:param Bern:
	:type Bern: math_Matrix
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None") AppDef_TheResol;
		 AppDef_TheResol (const AppDef_MultiLine & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "* Returns the derivative of the constraint matrix.
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix
	:rtype: math_Matrix") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const AppDef_MultiLine & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);

		/****************** ConstraintMatrix ******************/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", ":rtype: math_Matrix") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();

		/****************** Duale ******************/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "* returns the duale variables of the system.
	:rtype: math_Vector") Duale;
		const math_Vector & Duale ();

		/****************** InverseMatrix ******************/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "* returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
	:rtype: math_Matrix") InverseMatrix;
		const math_Matrix & InverseMatrix ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

};


%extend AppDef_TheResol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AppDef_Variational *
***************************/
class AppDef_Variational {
	public:
		/****************** AppDef_Variational ******************/
		%feature("compactdefaultargs") AppDef_Variational;
		%feature("autodoc", "* Constructor. Initialization of the fields. warning : Nc0 : number of PassagePoint consraints Nc2 : number of TangencyPoint constraints Nc3 : number of CurvaturePoint constraints if ((MaxDegree-Continuity)*MaxSegment -Nc0 - 2*Nc1 -3*Nc2) is negative The problem is over-constrained. //! Limitation : The MultiLine from AppDef has to be composed by only one Line ( Dimension 2 or 3).
	:param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: AppParCurves_HArray1OfConstraintCouple
	:param MaxDegree: default value is 14
	:type MaxDegree: int
	:param MaxSegment: default value is 100
	:type MaxSegment: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param WithMinMax: default value is Standard_False
	:type WithMinMax: bool
	:param WithCutting: default value is Standard_True
	:type WithCutting: bool
	:param Tolerance: default value is 1.0
	:type Tolerance: float
	:param NbIterations: default value is 2
	:type NbIterations: int
	:rtype: None") AppDef_Variational;
		 AppDef_Variational (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const Standard_Integer MaxDegree = 14,const Standard_Integer MaxSegment = 100,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Boolean WithMinMax = Standard_False,const Standard_Boolean WithCutting = Standard_True,const Standard_Real Tolerance = 1.0,const Standard_Integer NbIterations = 2);

		/****************** Approximate ******************/
		%feature("compactdefaultargs") Approximate;
		%feature("autodoc", "* Makes the approximation with the current fields.
	:rtype: None") Approximate;
		void Approximate ();

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the MultiLine from AppDef and the approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the Continuity used in the approximation
	:rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Criterium ******************/
		%feature("compactdefaultargs") Criterium;
		%feature("autodoc", "* returns the values of the quality criterium.
	:param VFirstOrder:
	:type VFirstOrder: float
	:param VSecondOrder:
	:type VSecondOrder: float
	:param VThirdOrder:
	:type VThirdOrder: float
	:rtype: None") Criterium;
		void Criterium (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CriteriumWeight ******************/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "* returns the Weights (as percent) associed to the criterium used in the optimization.
	:param Percent1:
	:type Percent1: float
	:param Percent2:
	:type Percent2: float
	:param Percent3:
	:type Percent3: float
	:rtype: None") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* returns the distances between the points of the multiline and the approximation curves.
	:param mat:
	:type mat: math_Matrix
	:rtype: None") Distance;
		void Distance (math_Matrix & mat);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** IsCreated ******************/
		%feature("compactdefaultargs") IsCreated;
		%feature("autodoc", "* returns True if the creation is done and correspond to the current fields.
	:rtype: bool") IsCreated;
		Standard_Boolean IsCreated ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if the approximation is ok and correspond to the current fields.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsOverConstrained ******************/
		%feature("compactdefaultargs") IsOverConstrained;
		%feature("autodoc", "* returns True if the problem is overconstrained in this case, approximation cannot be done.
	:rtype: bool") IsOverConstrained;
		Standard_Boolean IsOverConstrained ();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "* returns the knots uses to the approximations
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") Knots;
		const opencascade::handle<TColStd_HArray1OfReal> & Knots ();

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "* returns the Maximum Degree used in the approximation
	:rtype: int") MaxDegree;
		Standard_Integer MaxDegree ();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "* returns the maximum of the distances between the points of the multiline and the approximation curves.
	:rtype: float") MaxError;
		Standard_Real MaxError ();

		/****************** MaxErrorIndex ******************/
		%feature("compactdefaultargs") MaxErrorIndex;
		%feature("autodoc", "* returns the index of the MultiPoint of ErrorMax
	:rtype: int") MaxErrorIndex;
		Standard_Integer MaxErrorIndex ();

		/****************** MaxSegment ******************/
		%feature("compactdefaultargs") MaxSegment;
		%feature("autodoc", "* returns the Maximum of segment used in the approximation
	:rtype: int") MaxSegment;
		Standard_Integer MaxSegment ();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "* returns the number of iterations used in the approximation.
	:rtype: int") NbIterations;
		Standard_Integer NbIterations ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* returns the parameters uses to the approximations
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") Parameters;
		const opencascade::handle<TColStd_HArray1OfReal> & Parameters ();

		/****************** QuadraticError ******************/
		%feature("compactdefaultargs") QuadraticError;
		%feature("autodoc", "* returns the quadratic average of the distances between the points of the multiline and the approximation curves.
	:rtype: float") QuadraticError;
		Standard_Real QuadraticError ();

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "* Define the constraints to approximate If this value is incompatible with the others fields this method modify nothing and returns false
	:param aConstrainst:
	:type aConstrainst: AppParCurves_HArray1OfConstraintCouple
	:rtype: bool") SetConstraints;
		Standard_Boolean SetConstraints (const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & aConstrainst);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "* Define the Continuity used in the approximation If this value is incompatible with the others fields this method modify nothing and returns false
	:param C:
	:type C: GeomAbs_Shape
	:rtype: bool") SetContinuity;
		Standard_Boolean SetContinuity (const GeomAbs_Shape C);

		/****************** SetCriteriumWeight ******************/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "* define the Weights (as percent) associed to the criterium used in the optimization. //! if Percent <= 0
	:param Percent1:
	:type Percent1: float
	:param Percent2:
	:type Percent2: float
	:param Percent3:
	:type Percent3: float
	:rtype: None") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real Percent1,const Standard_Real Percent2,const Standard_Real Percent3);

		/****************** SetCriteriumWeight ******************/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "* define the Weight (as percent) associed to the criterium Order used in the optimization : Others weights are updated. if Percent < 0 if Order < 1 or Order > 3
	:param Order:
	:type Order: int
	:param Percent:
	:type Percent: float
	:rtype: None") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Integer Order,const Standard_Real Percent);

		/****************** SetKnots ******************/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "* Defines the knots used by the approximations If this value is incompatible with the others fields this method modify nothing and returns false
	:param knots:
	:type knots: TColStd_HArray1OfReal
	:rtype: bool") SetKnots;
		Standard_Boolean SetKnots (const opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****************** SetMaxDegree ******************/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "* Define the Maximum Degree used in the approximation If this value is incompatible with the others fields this method modify nothing and returns false
	:param Degree:
	:type Degree: int
	:rtype: bool") SetMaxDegree;
		Standard_Boolean SetMaxDegree (const Standard_Integer Degree);

		/****************** SetMaxSegment ******************/
		%feature("compactdefaultargs") SetMaxSegment;
		%feature("autodoc", "* Define the maximum number of segments used in the approximation If this value is incompatible with the others fields this method modify nothing and returns false
	:param NbSegment:
	:type NbSegment: int
	:rtype: bool") SetMaxSegment;
		Standard_Boolean SetMaxSegment (const Standard_Integer NbSegment);

		/****************** SetNbIterations ******************/
		%feature("compactdefaultargs") SetNbIterations;
		%feature("autodoc", "* define the number of iterations used in the approximation. if Iter < 1
	:param Iter:
	:type Iter: int
	:rtype: None") SetNbIterations;
		void SetNbIterations (const Standard_Integer Iter);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "* Defines the parameters used by the approximations.
	:param param:
	:type param: TColStd_HArray1OfReal
	:rtype: None") SetParameters;
		void SetParameters (const opencascade::handle<TColStd_HArray1OfReal> & param);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* define the tolerance used in the approximation.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** SetWithCutting ******************/
		%feature("compactdefaultargs") SetWithCutting;
		%feature("autodoc", "* Define if the approximation can insert new Knots or not. If this value is incompatible with the others fields this method modify nothing and returns false
	:param Cutting:
	:type Cutting: bool
	:rtype: bool") SetWithCutting;
		Standard_Boolean SetWithCutting (const Standard_Boolean Cutting);

		/****************** SetWithMinMax ******************/
		%feature("compactdefaultargs") SetWithMinMax;
		%feature("autodoc", "* Define if the approximation search to minimize the maximum Error or not.
	:param MinMax:
	:type MinMax: bool
	:rtype: None") SetWithMinMax;
		void SetWithMinMax (const Standard_Boolean MinMax);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* returns the tolerance used in the approximation.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns all the BSpline curves approximating the MultiLine from AppDef SSP after minimization of the parameter.
	:rtype: AppParCurves_MultiBSpCurve") Value;
		AppParCurves_MultiBSpCurve Value ();

		/****************** WithCutting ******************/
		%feature("compactdefaultargs") WithCutting;
		%feature("autodoc", "* returns if the approximation can insert new Knots or not.
	:rtype: bool") WithCutting;
		Standard_Boolean WithCutting ();

		/****************** WithMinMax ******************/
		%feature("compactdefaultargs") WithMinMax;
		%feature("autodoc", "* returns if the approximation search to minimize the maximum Error or not.
	:rtype: bool") WithMinMax;
		Standard_Boolean WithMinMax ();

};


%extend AppDef_Variational {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class AppDef_LinearCriteria *
******************************/
class AppDef_LinearCriteria : public AppDef_SmoothCriterion {
	public:
		/****************** AppDef_LinearCriteria ******************/
		%feature("compactdefaultargs") AppDef_LinearCriteria;
		%feature("autodoc", ":param SSP:
	:type SSP: AppDef_MultiLine
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:rtype: None") AppDef_LinearCriteria;
		 AppDef_LinearCriteria (const AppDef_MultiLine & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint);

		/****************** AssemblyTable ******************/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", ":rtype: opencascade::handle<FEmTool_HAssemblyTable>") AssemblyTable;
		opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable ();

		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HArray2OfInteger>") DependenceTable;
		opencascade::handle<TColStd_HArray2OfInteger> DependenceTable ();

		/****************** ErrorValues ******************/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", ":param MaxError:
	:type MaxError: float
	:param QuadraticError:
	:type QuadraticError: float
	:param AverageError:
	:type AverageError: float
	:rtype: None") ErrorValues;
		void ErrorValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetEstLength() {
            return (Standard_Real) $self->EstLength();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetEstLength(Standard_Real value) {
            $self->EstLength()=value;
            }
        };
		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", ":param C:
	:type C: FEmTool_Curve
	:rtype: None") GetCurve;
		void GetCurve (opencascade::handle<FEmTool_Curve> & C);

		/****************** GetEstimation ******************/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", ":param E1:
	:type E1: float
	:param E2:
	:type E2: float
	:param E3:
	:type E3: float
	:rtype: None") GetEstimation;
		void GetEstimation (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetWeight ******************/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", ":param QuadraticWeight:
	:type QuadraticWeight: float
	:param QualityWeight:
	:type QualityWeight: float
	:rtype: None") GetWeight;
		void GetWeight (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", ":param Element:
	:type Element: int
	:param Dimension:
	:type Dimension: int
	:param G:
	:type G: math_Vector
	:rtype: None") Gradient;
		void Gradient (const Standard_Integer Element,const Standard_Integer Dimension,math_Vector & G);

		/****************** Hessian ******************/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", ":param Element:
	:type Element: int
	:param Dimension1:
	:type Dimension1: int
	:param Dimension2:
	:type Dimension2: int
	:param H:
	:type H: math_Matrix
	:rtype: None") Hessian;
		void Hessian (const Standard_Integer Element,const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);

		/****************** InputVector ******************/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "* Convert the assembly Vector in an Curve;
	:param X:
	:type X: math_Vector
	:param AssTable:
	:type AssTable: FEmTool_HAssemblyTable
	:rtype: None") InputVector;
		void InputVector (const math_Vector & X,const opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****************** QualityValues ******************/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", ":param J1min:
	:type J1min: float
	:param J2min:
	:type J2min: float
	:param J3min:
	:type J3min: float
	:param J1:
	:type J1: float
	:param J2:
	:type J2: float
	:param J3:
	:type J3: float
	:rtype: int") QualityValues;
		Standard_Integer QualityValues (const Standard_Real J1min,const Standard_Real J2min,const Standard_Real J3min,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", ":param C:
	:type C: FEmTool_Curve
	:rtype: None") SetCurve;
		void SetCurve (const opencascade::handle<FEmTool_Curve> & C);

		/****************** SetEstimation ******************/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", ":param E1:
	:type E1: float
	:param E2:
	:type E2: float
	:param E3:
	:type E3: float
	:rtype: None") SetEstimation;
		void SetEstimation (const Standard_Real E1,const Standard_Real E2,const Standard_Real E3);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", ":param Parameters:
	:type Parameters: TColStd_HArray1OfReal
	:rtype: None") SetParameters;
		void SetParameters (const opencascade::handle<TColStd_HArray1OfReal> & Parameters);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", ":param QuadraticWeight:
	:type QuadraticWeight: float
	:param QualityWeight:
	:type QualityWeight: float
	:param percentJ1:
	:type percentJ1: float
	:param percentJ2:
	:type percentJ2: float
	:param percentJ3:
	:type percentJ3: float
	:rtype: None") SetWeight;
		void SetWeight (const Standard_Real QuadraticWeight,const Standard_Real QualityWeight,const Standard_Real percentJ1,const Standard_Real percentJ2,const Standard_Real percentJ3);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", ":param Weight:
	:type Weight: TColStd_Array1OfReal
	:rtype: None") SetWeight;
		void SetWeight (const TColStd_Array1OfReal & Weight);

};


%make_alias(AppDef_LinearCriteria)

%extend AppDef_LinearCriteria {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class AppDef_HArray1OfMultiPointConstraint : public  AppDef_Array1OfMultiPointConstraint, public Standard_Transient {
  public:
    AppDef_HArray1OfMultiPointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppDef_HArray1OfMultiPointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper, const  AppDef_Array1OfMultiPointConstraint::value_type& theValue);
    AppDef_HArray1OfMultiPointConstraint(const  AppDef_Array1OfMultiPointConstraint& theOther);
    const  AppDef_Array1OfMultiPointConstraint& Array1();
     AppDef_Array1OfMultiPointConstraint& ChangeArray1();
};
%make_alias(AppDef_HArray1OfMultiPointConstraint)


/* harray2 classes */
/* hsequence classes */
