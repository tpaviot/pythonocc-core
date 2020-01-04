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
%define BREPAPPROXDOCSTRING
"BRepApprox module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepapprox.html"
%enddef
%module (package="OCC.Core", docstring=BREPAPPROXDOCSTRING) BRepApprox


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
#include<BRepApprox_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Approx_module.hxx>
#include<AppParCurves_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<IntSurf_module.hxx>
#include<math_module.hxx>
#include<TColStd_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<IntImp_module.hxx>
#include<gp_module.hxx>
#include<ApproxInt_module.hxx>
#include<TColgp_module.hxx>
#include<TopLoc_module.hxx>
#include<TopoDS_module.hxx>
#include<FEmTool_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Approx.i
%import AppParCurves.i
%import Geom.i
%import Geom2d.i
%import IntSurf.i
%import math.i
%import TColStd.i
%import BRepAdaptor.i
%import IntImp.i
%import gp.i
%import ApproxInt.i
%import TColgp.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BRepApprox_ApproxLine)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************
* class BRepApprox_Approx *
**************************/
class BRepApprox_Approx {
	public:
		class Approx_Data {};
		/****************** BRepApprox_Approx ******************/
		%feature("compactdefaultargs") BRepApprox_Approx;
		%feature("autodoc", ":rtype: None") BRepApprox_Approx;
		 BRepApprox_Approx ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", ":rtype: int") NbMultiCurves;
		Standard_Integer NbMultiCurves ();

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", ":param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param DegMin:
	:type DegMin: int
	:param DegMax:
	:type DegMax: int
	:param NbIterMax:
	:type NbIterMax: int
	:param NbPntMax: default value is 30
	:type NbPntMax: int
	:param ApproxWithTangency: default value is Standard_True
	:type ApproxWithTangency: bool
	:param Parametrization: default value is Approx_ChordLength
	:type Parametrization: Approx_ParametrizationType
	:rtype: None") SetParameters;
		void SetParameters (const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer DegMin,const Standard_Integer DegMax,const Standard_Integer NbIterMax,const Standard_Integer NbPntMax = 30,const Standard_Boolean ApproxWithTangency = Standard_True,const Approx_ParametrizationType Parametrization = Approx_ChordLength);

		/****************** TolReached2d ******************/
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", ":rtype: float") TolReached2d;
		Standard_Real TolReached2d ();

		/****************** TolReached3d ******************/
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", ":rtype: float") TolReached3d;
		Standard_Real TolReached3d ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve") Value;
		const AppParCurves_MultiBSpCurve & Value (const Standard_Integer Index);

};


%extend BRepApprox_Approx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepApprox_ApproxLine *
******************************/
class BRepApprox_ApproxLine : public Standard_Transient {
	public:
		/****************** BRepApprox_ApproxLine ******************/
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", ":param CurveXYZ:
	:type CurveXYZ: Geom_BSplineCurve
	:param CurveUV1:
	:type CurveUV1: Geom2d_BSplineCurve
	:param CurveUV2:
	:type CurveUV2: Geom2d_BSplineCurve
	:rtype: None") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine (const opencascade::handle<Geom_BSplineCurve> & CurveXYZ,const opencascade::handle<Geom2d_BSplineCurve> & CurveUV1,const opencascade::handle<Geom2d_BSplineCurve> & CurveUV2);

		/****************** BRepApprox_ApproxLine ******************/
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "* theTang variable has been entered only for compatibility with the alias IntPatch_WLine. They are not used in this class.
	:param lin:
	:type lin: IntSurf_LineOn2S
	:param theTang: default value is Standard_False
	:type theTang: bool
	:rtype: None") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine (const opencascade::handle<IntSurf_LineOn2S> & lin,const Standard_Boolean theTang = Standard_False);

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", ":rtype: int") NbPnts;
		Standard_Integer NbPnts ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Point;
		IntSurf_PntOn2S Point (const Standard_Integer Index);

};


%make_alias(BRepApprox_ApproxLine)

%extend BRepApprox_ApproxLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************************
* class BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox *
****************************************************************************/
class BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox : public math_BFGS {
	public:
		/****************** BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
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
	:rtype: None") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);

};


%extend BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************************
* class BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox *
**************************************************************************/
class BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has <NbPol> control points.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer NbPol);

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


%extend BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************************
* class BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox *
*****************************************************************************/
class BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox {
	public:
		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

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


%extend BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************************
* class BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox *
***************************************************************************/
class BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox : public math_BFGS {
	public:
		/****************** BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
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
	:rtype: None") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);

};


%extend BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox *
************************************************************************/
class BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox : public math_BFGS {
	public:
		/****************** BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
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
	:rtype: None") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", ":param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);

};


%extend BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class BRepApprox_MyBSplGradientOfTheComputeLineOfApprox *
**********************************************************/
class BRepApprox_MyBSplGradientOfTheComputeLineOfApprox {
	public:
		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the old and the new approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 1);

		/****************** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations,const Standard_Real lambda1,const Standard_Real lambda2);

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


%extend BRepApprox_MyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class BRepApprox_MyGradientOfTheComputeLineBezierOfApprox *
************************************************************/
class BRepApprox_MyGradientOfTheComputeLineBezierOfApprox {
	public:
		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the old and the new approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_MyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);

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


%extend BRepApprox_MyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class BRepApprox_MyGradientbisOfTheComputeLineOfApprox *
*********************************************************/
class BRepApprox_MyGradientbisOfTheComputeLineOfApprox {
	public:
		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "* returns the average error between the old and the new approximation.
	:rtype: float") AverageError;
		Standard_Real AverageError ();

		/****************** BRepApprox_MyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "* Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_MyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);

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


%extend BRepApprox_MyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************************
* class BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox *
*************************************************************************/
class BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has the desired degree Deg.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);

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


%extend BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************************
* class BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox *
**********************************************************************/
class BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "* initializes the fields of the function. The approximating curve has the desired degree Deg.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);

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


%extend BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************************
* class BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox *
****************************************************************************/
class BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

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


%extend BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************************
* class BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox *
*************************************************************************/
class BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "* given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "* Initializes the fields of the object.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);

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


%extend BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************************
* class BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox *
***************************************************************************/
class BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		/****************** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "* Returns the derivative of the constraint matrix.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix
	:rtype: math_Matrix") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const BRepApprox_TheMultiLineOfApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);

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


%extend BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox *
************************************************************************/
class BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		/****************** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "* Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "* Returns the derivative of the constraint matrix.
	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox
	:param Parameters:
	:type Parameters: math_Vector
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix
	:rtype: math_Matrix") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const BRepApprox_TheMultiLineOfApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);

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


%extend BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class BRepApprox_TheComputeLineBezierOfApprox *
************************************************/
class BRepApprox_TheComputeLineBezierOfApprox {
	public:
		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
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
	:rtype: None") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
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
	:rtype: None") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

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
	:type Line: BRepApprox_TheMultiLineOfApprox
	:rtype: None") Perform;
		void Perform (const BRepApprox_TheMultiLineOfApprox & Line);

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


%extend BRepApprox_TheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRepApprox_TheComputeLineOfApprox *
******************************************/
class BRepApprox_TheComputeLineOfApprox {
	public:
		/****************** BRepApprox_TheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all. //! The multiplicities of the internal knots is set by default.
	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox
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
	:rtype: None") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
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
	:rtype: None") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
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
	:rtype: None") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);

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
	:type Line: BRepApprox_TheMultiLineOfApprox
	:rtype: None") Interpol;
		void Interpol (const BRepApprox_TheMultiLineOfApprox & Line);

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
	:type Line: BRepApprox_TheMultiLineOfApprox
	:rtype: None") Perform;
		void Perform (const BRepApprox_TheMultiLineOfApprox & Line);

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


%extend BRepApprox_TheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************************
* class BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox *
**********************************************************************/
class BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		/****************** AuxillarSurface1 ******************/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", ":rtype: BRepAdaptor_Surface") AuxillarSurface1;
		const BRepAdaptor_Surface & AuxillarSurface1 ();

		/****************** AuxillarSurface2 ******************/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", ":rtype: BRepAdaptor_Surface") AuxillarSurface2;
		const BRepAdaptor_Surface & AuxillarSurface2 ();

		/****************** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", ":param S1:
	:type S1: BRepAdaptor_Surface
	:param S2:
	:type S2: BRepAdaptor_Surface
	:rtype: None") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);

		/****************** ComputeParameters ******************/
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", ":param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param UVap:
	:type UVap: math_Vector
	:param BornInf:
	:type BornInf: math_Vector
	:param BornSup:
	:type BornSup: math_Vector
	:param Tolerance:
	:type Tolerance: math_Vector
	:rtype: None") ComputeParameters;
		void ComputeParameters (const IntImp_ConstIsoparametric ChoixIso,const TColStd_Array1OfReal & Param,math_Vector & UVap,math_Vector & BornInf,math_Vector & BornSup,math_Vector & Tolerance);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		gp_Dir Direction ();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", ":rtype: gp_Dir2d") DirectionOnS1;
		gp_Dir2d DirectionOnS1 ();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", ":rtype: gp_Dir2d") DirectionOnS2;
		gp_Dir2d DirectionOnS2 ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", ":param UVap:
	:type UVap: math_Vector
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param BestChoix:
	:type BestChoix: IntImp_ConstIsoparametric
	:rtype: bool") IsTangent;
		Standard_Boolean IsTangent (const math_Vector & UVap,TColStd_Array1OfReal & Param,IntImp_ConstIsoparametric & BestChoix);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", ":rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", ":rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt") Point;
		gp_Pnt Point ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* returns somme des fi*fi
	:rtype: float") Root;
		Standard_Real Root ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

};


%extend BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class BRepApprox_TheImpPrmSvSurfacesOfApprox *
***********************************************/
class BRepApprox_TheImpPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		/****************** BRepApprox_TheImpPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", ":param Surf1:
	:type Surf1: BRepAdaptor_Surface
	:param Surf2:
	:type Surf2: IntSurf_Quadric
	:rtype: None") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & Surf1,const IntSurf_Quadric & Surf2);

		/****************** BRepApprox_TheImpPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", ":param Surf1:
	:type Surf1: IntSurf_Quadric
	:param Surf2:
	:type Surf2: BRepAdaptor_Surface
	:rtype: None") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox (const IntSurf_Quadric & Surf1,const BRepAdaptor_Surface & Surf2);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* returns True if Tg,Tguv1 Tguv2 can be computed.
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);

		/****************** SeekPoint ******************/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Point:
	:type Point: IntSurf_PntOn2S
	:rtype: bool") SeekPoint;
		Standard_Boolean SeekPoint (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,IntSurf_PntOn2S & Point);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);

		/****************** TangencyOnSurf1 ******************/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);

		/****************** TangencyOnSurf2 ******************/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);

};


%extend BRepApprox_TheImpPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox *
*********************************************************/
class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	public:
		/****************** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "* compute the solution point with the close point
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param S1:
	:type S1: BRepAdaptor_Surface
	:param S2:
	:type S2: BRepAdaptor_Surface
	:param TolTangency:
	:type TolTangency: float
	:rtype: None") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox (const TColStd_Array1OfReal & Param,const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const Standard_Real TolTangency);

		/****************** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "* initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }
	:param S1:
	:type S1: BRepAdaptor_Surface
	:param S2:
	:type S2: BRepAdaptor_Surface
	:param TolTangency:
	:type TolTangency: float
	:rtype: None") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const Standard_Real TolTangency);

		/****************** ChangePoint ******************/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "* return the intersection point which is enable for changing.
	:rtype: IntSurf_PntOn2S") ChangePoint;
		IntSurf_PntOn2S & ChangePoint ();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the tangent at the intersection line.
	:rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "* Returns the tangent at the intersection line in the parametric space of the first surface.
	:rtype: gp_Dir2d") DirectionOnS1;
		const gp_Dir2d  DirectionOnS1 ();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "* Returns the tangent at the intersection line in the parametric space of the second surface.
	:rtype: gp_Dir2d") DirectionOnS2;
		const gp_Dir2d  DirectionOnS2 ();

		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "* return the math function which is used to compute the intersection
	:rtype: BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox") Function;
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox & Function ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the creation completed without failure.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns True when there is no solution to the problem.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "* Returns True if the surfaces are tangent at the intersection point.
	:rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is calculated)
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot
	:rtype: IntImp_ConstIsoparametric") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is given by ChoixIso)
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:rtype: IntImp_ConstIsoparametric") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld,const IntImp_ConstIsoparametric ChoixIso);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point.
	:rtype: IntSurf_PntOn2S") Point;
		const IntSurf_PntOn2S & Point ();

};


%extend BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepApprox_TheMultiLineOfApprox *
****************************************/
class BRepApprox_TheMultiLineOfApprox {
	public:
		/****************** BRepApprox_TheMultiLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", ":rtype: None") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox ();

		/****************** BRepApprox_TheMultiLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "* The class SvSurfaces is used when the approximation algorithm needs some extra points on the line <line>. A New line is then created which shares the same surfaces and functions. SvSurfaces is a deferred class which allows several implementations of this algorithm with different surfaces (bi-parametric ones, or implicit and biparametric ones)
	:param line:
	:type line: BRepApprox_ApproxLine
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
	:rtype: None") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox (const opencascade::handle<BRepApprox_ApproxLine> & line,const Standard_Address PtrSvSurfaces,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Boolean ApproxU1V1,const Standard_Boolean ApproxU2V2,const Standard_Real xo,const Standard_Real yo,const Standard_Real zo,const Standard_Real u1o,const Standard_Real v1o,const Standard_Real u2o,const Standard_Real v2o,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);

		/****************** BRepApprox_TheMultiLineOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "* No Extra points will be added on the current line
	:param line:
	:type line: BRepApprox_ApproxLine
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
	:rtype: None") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox (const opencascade::handle<BRepApprox_ApproxLine> & line,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Boolean ApproxU1V1,const Standard_Boolean ApproxU2V2,const Standard_Real xo,const Standard_Real yo,const Standard_Real zo,const Standard_Real u1o,const Standard_Real v1o,const Standard_Real u2o,const Standard_Real v2o,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump of the current multi-line.
	:rtype: None") Dump;
		void Dump ();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", ":rtype: int") FirstPoint;
		Standard_Integer FirstPoint ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", ":rtype: int") LastPoint;
		Standard_Integer LastPoint ();

		/****************** MakeMLBetween ******************/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "* Tries to make a sub-line between <Low> and <High> points of this line by adding <NbPointsToInsert> new points
	:param Low:
	:type Low: int
	:param High:
	:type High: int
	:param NbPointsToInsert:
	:type NbPointsToInsert: int
	:rtype: BRepApprox_TheMultiLineOfApprox") MakeMLBetween;
		BRepApprox_TheMultiLineOfApprox MakeMLBetween (const Standard_Integer Low,const Standard_Integer High,const Standard_Integer NbPointsToInsert);

		/****************** MakeMLOneMorePoint ******************/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "* Tries to make a sub-line between <Low> and <High> points of this line by adding one more point between (indbad-1)-th and indbad-th points
	:param Low:
	:type Low: int
	:param High:
	:type High: int
	:param indbad:
	:type indbad: int
	:param OtherLine:
	:type OtherLine: BRepApprox_TheMultiLineOfApprox
	:rtype: bool") MakeMLOneMorePoint;
		Standard_Boolean MakeMLOneMorePoint (const Standard_Integer Low,const Standard_Integer High,const Standard_Integer indbad,BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****************** NbP2d ******************/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "* Returns the number of 2d points of a TheLine.
	:rtype: int") NbP2d;
		Standard_Integer NbP2d ();

		/****************** NbP3d ******************/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "* Returns the number of 3d points of a TheLine.
	:rtype: int") NbP3d;
		Standard_Integer NbP3d ();

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* Returns the 3d tangency points of the multipoint <MPointIndex> only when 3d points exist.
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* Returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* Returns the 3d and 2d points of the multipoint <MPointIndex>.
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: None") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the 3d and 2d points of the multipoint <MPointIndex>.
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);

		/****************** WhatStatus ******************/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", ":rtype: Approx_Status") WhatStatus;
		Approx_Status WhatStatus ();

};


%extend BRepApprox_TheMultiLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BRepApprox_TheMultiLineToolOfApprox *
********************************************/
class BRepApprox_TheMultiLineToolOfApprox {
	public:
		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* returns the 3d curvature of the multipoint <MPointIndex> when only 3d points exist.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* returns the 2d curvature points of the multipoint <MPointIndex> only when 2d points exist.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* returns the 3d and 2d curvature of the multipoint <MPointIndex>.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump of the current multi-line.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:rtype: None") Dump;
		static void Dump (const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the number of multipoints of the TheMultiLine.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:rtype: int") FirstPoint;
		static Standard_Integer FirstPoint (const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the number of multipoints of the TheMultiLine.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:rtype: int") LastPoint;
		static Standard_Integer LastPoint (const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** MakeMLBetween ******************/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "* Is called if WhatStatus returned 'PointsAdded'.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param NbPMin:
	:type NbPMin: int
	:rtype: BRepApprox_TheMultiLineOfApprox") MakeMLBetween;
		static BRepApprox_TheMultiLineOfApprox MakeMLBetween (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer NbPMin);

		/****************** MakeMLOneMorePoint ******************/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "* Is called when the Bezier curve contains a loop
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param indbad:
	:type indbad: int
	:param OtherLine:
	:type OtherLine: BRepApprox_TheMultiLineOfApprox
	:rtype: bool") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer indbad,BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****************** NbP2d ******************/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "* Returns the number of 2d points of a TheMultiLine.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:rtype: int") NbP2d;
		static Standard_Integer NbP2d (const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** NbP3d ******************/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "* Returns the number of 3d points of a TheMultiLine.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:rtype: int") NbP3d;
		static Standard_Integer NbP3d (const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "* returns the 3d and 2d points of the multipoint <MPointIndex>.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: None") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the 3d and 2d points of the multipoint <MPointIndex>.
	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);

		/****************** WhatStatus ******************/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", ":param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: Approx_Status") WhatStatus;
		static Approx_Status WhatStatus (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer I1,const Standard_Integer I2);

};


%extend BRepApprox_TheMultiLineToolOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class BRepApprox_ThePrmPrmSvSurfacesOfApprox *
***********************************************/
class BRepApprox_ThePrmPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		/****************** BRepApprox_ThePrmPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", ":param Surf1:
	:type Surf1: BRepAdaptor_Surface
	:param Surf2:
	:type Surf2: BRepAdaptor_Surface
	:rtype: None") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_ThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & Surf1,const BRepAdaptor_Surface & Surf2);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* returns True if Tg,Tguv1 Tguv2 can be computed.
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);

		/****************** SeekPoint ******************/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Point:
	:type Point: IntSurf_PntOn2S
	:rtype: bool") SeekPoint;
		Standard_Boolean SeekPoint (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,IntSurf_PntOn2S & Point);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);

		/****************** TangencyOnSurf1 ******************/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);

		/****************** TangencyOnSurf2 ******************/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);

};


%extend BRepApprox_ThePrmPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox *
**************************************************************/
class BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		/****************** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", ":rtype: None") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ();

		/****************** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", ":param PS:
	:type PS: BRepAdaptor_Surface
	:param IS:
	:type IS: IntSurf_Quadric
	:rtype: None") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & PS,const IntSurf_Quadric & IS);

		/****************** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******************/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", ":param IS:
	:type IS: IntSurf_Quadric
	:rtype: None") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox (const IntSurf_Quadric & IS);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", ":rtype: gp_Dir2d") Direction2d;
		const gp_Dir2d  Direction2d ();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", ":rtype: gp_Vec") Direction3d;
		const gp_Vec  Direction3d ();

		/****************** ISurface ******************/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", ":rtype: IntSurf_Quadric") ISurface;
		const IntSurf_Quadric & ISurface ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", ":rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", ":rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", ":rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** PSurface ******************/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", ":rtype: BRepAdaptor_Surface") PSurface;
		const BRepAdaptor_Surface & PSurface ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", ":rtype: float") Root;
		Standard_Real Root ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param PS:
	:type PS: BRepAdaptor_Surface
	:rtype: None") Set;
		void Set (const BRepAdaptor_Surface & PS);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Tolerance:
	:type Tolerance: float
	:rtype: None") Set;
		void Set (const Standard_Real Tolerance);

		/****************** SetImplicitSurface ******************/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", ":param IS:
	:type IS: IntSurf_Quadric
	:rtype: None") SetImplicitSurface;
		void SetImplicitSurface (const IntSurf_Quadric & IS);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the value Tol so that if Abs(Func.Root())<Tol the function is considered null.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

};


%extend BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
