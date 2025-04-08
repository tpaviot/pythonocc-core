/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_appdef.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Message_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(AppDef_SmoothCriterion)
%wrap_handle(AppDef_LinearCriteria)
%wrap_handle(AppDef_HArray1OfMultiPointConstraint)
/* end handles declaration */

/* templates */
%template(AppDef_Array1OfMultiPointConstraint) NCollection_Array1<AppDef_MultiPointConstraint>;
Array1ExtendIter(AppDef_MultiPointConstraint)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<AppDef_MultiPointConstraint> AppDef_Array1OfMultiPointConstraint;
/* end typedefs declaration */

/****************************************************************
* class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute *
****************************************************************/
class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute : public math_BFGS {
	public:
		/****** AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute::AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: b799c0288bfc80846933f29e0453169e ******/
		%feature("compactdefaultargs") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: float
Tolerance2d: float
Eps: float
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute::IsSolutionReached ******/
		/****** md5 signature: a6c0da888a257bf852b40b8daf6526dc ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient

Return
-------
bool

Description
-----------
No available documentation.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 659c146b3e69832c7073bcc94e62f2f9 ******/
		%feature("compactdefaultargs") AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NbPol: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has <NbPol> control points.
") AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer NbPol);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::CurveValue ******/
		/****** md5 signature: c83ed6c1c3091309bccd8d719a30ec54 ******/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the MultiBSpCurve approximating the set after computing the value F or Grad(F).
") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::DerivativeFunctionMatrix ******/
		/****** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ******/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the derivative function matrix used to approximate the multiline.
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::Error ******/
		/****** md5 signature: 540c96711689798ec6a7d515d5e5e1c7 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
float

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::FirstConstraint ******/
		/****** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::FunctionMatrix ******/
		/****** md5 signature: aec90dd003c289db9092eb79712677e1 ******/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the function matrix used to approximate the multiline.
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::Gradient ******/
		/****** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
returns the gradient G of the sum above for the parameters Xi.
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::Index ******/
		/****** md5 signature: c11a6982042d7a2c5bf9fb50324ac971 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
math_IntegerVector

Description
-----------
Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
") Index;
		const math_IntegerVector & Index();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::LastConstraint ******/
		/****** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiBSpCurve.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiBSpCurve.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		Standard_Integer NbVariables();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::NewParameters ******/
		/****** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ******/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the new parameters of the MultiLine.
") NewParameters;
		const math_Vector & NewParameters();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::SetFirstLambda ******/
		/****** md5 signature: 819efdb8532bd01857d5e29b79901d19 ******/
		%feature("compactdefaultargs") SetFirstLambda;
		%feature("autodoc", "
Parameters
----------
l1: float

Return
-------
None

Description
-----------
No available documentation.
") SetFirstLambda;
		void SetFirstLambda(const Standard_Real l1);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::SetLastLambda ******/
		/****** md5 signature: b34d15f9505b8355ba362a879a836d1a ******/
		%feature("compactdefaultargs") SetLastLambda;
		%feature("autodoc", "
Parameters
----------
l2: float

Return
-------
None

Description
-----------
No available documentation.
") SetLastLambda;
		void SetLastLambda(const Standard_Real l2);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::Value ******/
		/****** md5 signature: 33f8b9f75d238865cc320f57ac729801 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::Values ******/
		/****** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 7212679b8f6e008d4b7aa3fb8cfebd46 ******/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 95a7c9c221e01ce5ef38001c1e1f1ed1 ******/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 2780998f405468abc7dcea03504fb32f ******/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 23e53a2b39fe45234ff5600214a374ac ******/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::BSplineValue ******/
		/****** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ******/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BSplineValue;
		AppParCurves_MultiBSpCurve BSplineValue();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::BezierValue ******/
		/****** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ******/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::DerivativeFunctionMatrix ******/
		/****** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ******/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the derivative function matrix used to approximate the set.
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Distance ******/
		/****** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the distances between the points of the multiline and the approximation curves.
") Distance;
		const math_Matrix & Distance();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Error ******/
		/****** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::ErrorGradient ******/
		/****** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::FirstLambda ******/
		/****** md5 signature: 87ad21cc13708c47c81704b38426d999 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		Standard_Real FirstLambda();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::FunctionMatrix ******/
		/****** md5 signature: aec90dd003c289db9092eb79712677e1 ******/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the function matrix used to approximate the set.
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::KIndex ******/
		/****** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ******/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Return
-------
math_IntegerVector

Description
-----------
Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
") KIndex;
		const math_IntegerVector & KIndex();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::LastLambda ******/
		/****** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		Standard_Real LastLambda();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Perform ******/
		/****** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector

Return
-------
None

Description
-----------
Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
") Perform;
		void Perform(const math_Vector & Parameters);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Perform ******/
		/****** md5 signature: cbf083f2b8329680dc5a52f482f436ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Perform ******/
		/****** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Perform ******/
		/****** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Points ******/
		/****** md5 signature: 8a77545526c5096bca80b9c07f882412 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of points value.
") Points;
		const math_Matrix & Points();

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Poles ******/
		/****** md5 signature: 1437a652beb857bd22c16de65cb18857 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of resulting control points value.
") Poles;
		const math_Matrix & Poles();

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
		/****** AppDef_BSplineCompute::AppDef_BSplineCompute ******/
		/****** md5 signature: 2408a61abd93bf31117d7ba011536f8c ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-3)
Tolerance2d: float (optional, default to 1.0e-6)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all. //! The multiplicities of the internal knots is set by default.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const AppDef_MultiLine & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_BSplineCompute::AppDef_BSplineCompute ******/
		/****** md5 signature: 7b22210476c396af31272298fe953380 ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const AppDef_MultiLine & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_BSplineCompute::AppDef_BSplineCompute ******/
		/****** md5 signature: 37659dde443160bc04cf7ecedbff89a5 ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_BSplineCompute::AppDef_BSplineCompute ******/
		/****** md5 signature: 4beb8fca857f810f35b0c88e2b91fd54 ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_BSplineCompute::ChangeValue ******/
		/****** md5 signature: afc5e23129509014348d63bb72db41ec ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation.
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue();

		/****** AppDef_BSplineCompute::Error ******/
		/****** md5 signature: cda70ea4f3f90e8bdc1d9692db9c77b8 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
tol3d: float
tol2d: float

Description
-----------
returns the tolerances 2d and 3d of the MultiBSpCurve.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_BSplineCompute::Init ******/
		/****** md5 signature: 10f7f80e213a93740574c45700071b76 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Init;
		void Init(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_BSplineCompute::Interpol ******/
		/****** md5 signature: bc4286f280e57eaa20ef92f495fa1e33 ******/
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine

Return
-------
None

Description
-----------
Constructs an interpolation of the MultiLine <Line> The result will be a C2 curve of degree 3.
") Interpol;
		void Interpol(const AppDef_MultiLine & Line);

		/****** AppDef_BSplineCompute::IsAllApproximated ******/
		/****** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****** AppDef_BSplineCompute::IsToleranceReached ******/
		/****** md5 signature: cbd7380250e74c96655b10c8025eb873 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****** AppDef_BSplineCompute::Parameters ******/
		/****** md5 signature: 7c84e53bc11f80fb0f3c0e787e4b026e ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
returns the new parameters of the approximation corresponding to the points of the MultiBSpCurve.
") Parameters;
		const TColStd_Array1OfReal & Parameters();

		/****** AppDef_BSplineCompute::Perform ******/
		/****** md5 signature: ba94f8a8967068aa8bee6df81ea2be62 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const AppDef_MultiLine & Line);

		/****** AppDef_BSplineCompute::SetConstraints ******/
		/****** md5 signature: 99b92dc193142adf44568f800cd394dc ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
firstC: AppParCurves_Constraint
lastC: AppParCurves_Constraint

Return
-------
None

Description
-----------
changes the first and the last constraint points.
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);

		/****** AppDef_BSplineCompute::SetContinuity ******/
		/****** md5 signature: 004921b69180f9ee5c70f476a9b25f44 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
C: int

Return
-------
None

Description
-----------
sets the continuity of the spline. if C = 2, the spline will be C2.
") SetContinuity;
		void SetContinuity(const Standard_Integer C);

		/****** AppDef_BSplineCompute::SetDegrees ******/
		/****** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ******/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "
Parameters
----------
degreemin: int
degreemax: int

Return
-------
None

Description
-----------
changes the degrees of the approximation.
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****** AppDef_BSplineCompute::SetKnots ******/
		/****** md5 signature: 81377d2824af79de90394b654e5ac494 ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
The approximation will be done with the set of knots <Knots>. The multiplicities will be set with the degree and the desired continuity.
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & Knots);

		/****** AppDef_BSplineCompute::SetKnotsAndMultiplicities ******/
		/****** md5 signature: 78291c57c68644dfe7114ee9a585b271 ******/
		%feature("compactdefaultargs") SetKnotsAndMultiplicities;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
The approximation will be done with the set of knots <Knots> and the multiplicities <Mults>.
") SetKnotsAndMultiplicities;
		void SetKnotsAndMultiplicities(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults);

		/****** AppDef_BSplineCompute::SetParameters ******/
		/****** md5 signature: b1eab3f1f1c8f0892e7a87810e5892e3 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
ThePar: math_Vector

Return
-------
None

Description
-----------
The approximation will begin with the set of parameters <ThePar>.
") SetParameters;
		void SetParameters(const math_Vector & ThePar);

		/****** AppDef_BSplineCompute::SetPeriodic ******/
		/****** md5 signature: 3109823bbe448d62437b44b39b4d9b19 ******/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "
Parameters
----------
thePeriodic: bool

Return
-------
None

Description
-----------
Sets periodic flag. If thePeriodic = Standard_True, algorithm tries to build periodic multicurve using corresponding C1 boundary condition for first and last multipoints. Multiline must be closed.
") SetPeriodic;
		void SetPeriodic(const Standard_Boolean thePeriodic);

		/****** AppDef_BSplineCompute::SetTolerances ******/
		/****** md5 signature: ce7879738ace848f7a3a27c56467be10 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: float
Tolerance2d: float

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****** AppDef_BSplineCompute::Value ******/
		/****** md5 signature: c818c96a9a832640b6267a997c4dbd3b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation.
") Value;
		AppParCurves_MultiBSpCurve Value();

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
		/****** AppDef_Compute::AppDef_Compute ******/
		/****** md5 signature: c6833ee0a5b84d67a02d9dae53b24f5f ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-3)
Tolerance2d: float (optional, default to 1.0e-6)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
") AppDef_Compute;
		 AppDef_Compute(const AppDef_MultiLine & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_Compute::AppDef_Compute ******/
		/****** md5 signature: 9e4217e85d94e90315d60b7b75f82535 ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
") AppDef_Compute;
		 AppDef_Compute(const AppDef_MultiLine & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_Compute::AppDef_Compute ******/
		/****** md5 signature: ad9cd1ddc4958b27791ce973be5159af ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_Compute;
		 AppDef_Compute(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_Compute::AppDef_Compute ******/
		/****** md5 signature: c8eee3cf66b774bb63a317362fc20729 ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_Compute;
		 AppDef_Compute(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_Compute::ChangeValue ******/
		/****** md5 signature: 141696e747a4846a7446e394b31644d5 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the result of the approximation.
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue(const Standard_Integer Index = 1);

		/****** AppDef_Compute::Error ******/
		/****** md5 signature: 6a8061230005ba951097d8b73e7dbec6 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: float
tol2d: float

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_Compute::Init ******/
		/****** md5 signature: 10f7f80e213a93740574c45700071b76 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-03)
Tolerance2d: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to Standard_True)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Init;
		void Init(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** AppDef_Compute::IsAllApproximated ******/
		/****** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****** AppDef_Compute::IsToleranceReached ******/
		/****** md5 signature: cbd7380250e74c96655b10c8025eb873 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****** AppDef_Compute::NbMultiCurves ******/
		/****** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****** AppDef_Compute::Parameters ******/
		/****** md5 signature: 457fc00b4795a877d025353e491bb905 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
TColStd_Array1OfReal

Description
-----------
returns the new parameters of the approximation corresponding to the points of the multicurve <Index>.
") Parameters;
		const TColStd_Array1OfReal & Parameters(const Standard_Integer Index = 1);

		/****** AppDef_Compute::Parametrization ******/
		/****** md5 signature: 28de4bdef662891658a0d7c12417a76f ******/
		%feature("compactdefaultargs") Parametrization;
		%feature("autodoc", "Return
-------
Approx_ParametrizationType

Description
-----------
returns the type of parametrization.
") Parametrization;
		Approx_ParametrizationType Parametrization();

		/****** AppDef_Compute::Perform ******/
		/****** md5 signature: ba94f8a8967068aa8bee6df81ea2be62 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const AppDef_MultiLine & Line);

		/****** AppDef_Compute::SetConstraints ******/
		/****** md5 signature: 99b92dc193142adf44568f800cd394dc ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
firstC: AppParCurves_Constraint
lastC: AppParCurves_Constraint

Return
-------
None

Description
-----------
changes the first and the last constraint points.
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);

		/****** AppDef_Compute::SetDegrees ******/
		/****** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ******/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "
Parameters
----------
degreemin: int
degreemax: int

Return
-------
None

Description
-----------
changes the degrees of the approximation.
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****** AppDef_Compute::SetTolerances ******/
		/****** md5 signature: ce7879738ace848f7a3a27c56467be10 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: float
Tolerance2d: float

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****** AppDef_Compute::SplineValue ******/
		/****** md5 signature: 8abd3bdfb130cc23332c1960701072a6 ******/
		%feature("compactdefaultargs") SplineValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation.
") SplineValue;
		AppParCurves_MultiBSpCurve SplineValue();

		/****** AppDef_Compute::Value ******/
		/****** md5 signature: ce9a9d43a5aa1f3754abfba817bb7838 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the result of the approximation.
") Value;
		AppParCurves_MultiCurve Value(const Standard_Integer Index = 1);

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
		/****** AppDef_Gradient_BFGSOfMyGradientOfCompute::AppDef_Gradient_BFGSOfMyGradientOfCompute ******/
		/****** md5 signature: 126f77d585cdec22a8e8a8e4ae8c13ce ******/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: float
Tolerance2d: float
Eps: float
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_Gradient_BFGSOfMyGradientOfCompute;
		 AppDef_Gradient_BFGSOfMyGradientOfCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** AppDef_Gradient_BFGSOfMyGradientOfCompute::IsSolutionReached ******/
		/****** md5 signature: a6c0da888a257bf852b40b8daf6526dc ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient

Return
-------
bool

Description
-----------
No available documentation.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute::AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: db032bfef1a0cabc4126bb1cff8b2cd7 ******/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: float
Tolerance2d: float
Eps: float
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
		 AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute::IsSolutionReached ******/
		/****** md5 signature: a6c0da888a257bf852b40b8daf6526dc ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient

Return
-------
bool

Description
-----------
No available documentation.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** AppDef_Gradient_BFGSOfTheGradient::AppDef_Gradient_BFGSOfTheGradient ******/
		/****** md5 signature: a988e1566651277ba477ec7a76734981 ******/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfTheGradient;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: float
Tolerance2d: float
Eps: float
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_Gradient_BFGSOfTheGradient;
		 AppDef_Gradient_BFGSOfTheGradient(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** AppDef_Gradient_BFGSOfTheGradient::IsSolutionReached ******/
		/****** md5 signature: a6c0da888a257bf852b40b8daf6526dc ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient

Return
-------
bool

Description
-----------
No available documentation.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** AppDef_MultiLine::AppDef_MultiLine ******/
		/****** md5 signature: eca84113c714860aa7239eb211e137f5 ******/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an undefined MultiLine.
") AppDef_MultiLine;
		 AppDef_MultiLine();

		/****** AppDef_MultiLine::AppDef_MultiLine ******/
		/****** md5 signature: 12f50085378edce7cd43da048d563786 ******/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "
Parameters
----------
NbMult: int

Return
-------
None

Description
-----------
given the number NbMult of MultiPointConstraints of this MultiLine , it initializes all the fields.SetValue must be called in order for the values of the multipoint constraint to be taken into account. An exception is raised if NbMult < 0.
") AppDef_MultiLine;
		 AppDef_MultiLine(const Standard_Integer NbMult);

		/****** AppDef_MultiLine::AppDef_MultiLine ******/
		/****** md5 signature: 64ec35865d92daa24a03b18b2dd11882 ******/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "
Parameters
----------
tabMultiP: AppDef_Array1OfMultiPointConstraint

Return
-------
None

Description
-----------
Constructs a MultiLine with an array of MultiPointConstraints.
") AppDef_MultiLine;
		 AppDef_MultiLine(const AppDef_Array1OfMultiPointConstraint & tabMultiP);

		/****** AppDef_MultiLine::AppDef_MultiLine ******/
		/****** md5 signature: 1bf9d9b2d482b677ffc5d1deb2308402 ******/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "
Parameters
----------
tabP3d: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
The MultiLine constructed will have one line of 3d points without their tangencies.
") AppDef_MultiLine;
		 AppDef_MultiLine(const TColgp_Array1OfPnt & tabP3d);

		/****** AppDef_MultiLine::AppDef_MultiLine ******/
		/****** md5 signature: 1d6626e296ebc032e27692387207051e ******/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "
Parameters
----------
tabP2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
The MultiLine constructed will have one line of 2d points without their tangencies.
") AppDef_MultiLine;
		 AppDef_MultiLine(const TColgp_Array1OfPnt2d & tabP2d);

		/****** AppDef_MultiLine::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** AppDef_MultiLine::NbMultiPoints ******/
		/****** md5 signature: 3773aba9a0a09cf608eddf5448da667d ******/
		%feature("compactdefaultargs") NbMultiPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of MultiPointConstraints of the MultiLine.
") NbMultiPoints;
		Standard_Integer NbMultiPoints();

		/****** AppDef_MultiLine::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of Points from MultiPoints composing the MultiLine.
") NbPoints;
		Standard_Integer NbPoints();

		/****** AppDef_MultiLine::SetValue ******/
		/****** md5 signature: ae7924dceb17bb1bf8b5a017807c66cf ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Index: int
MPoint: AppDef_MultiPointConstraint

Return
-------
None

Description
-----------
It sets the MultiPointConstraint of range Index to the value MPoint. An exception is raised if Index < 0 or Index> MPoint. An exception is raised if the dimensions of the MultiPoints are different.
") SetValue;
		void SetValue(const Standard_Integer Index, const AppDef_MultiPointConstraint & MPoint);

		/****** AppDef_MultiLine::Value ******/
		/****** md5 signature: ec3432f3274bca28664158bc2414cf94 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
AppDef_MultiPointConstraint

Description
-----------
returns the MultiPointConstraint of range Index An exception is raised if Index<0 or Index>MPoint.
") Value;
		AppDef_MultiPointConstraint Value(const Standard_Integer Index);

};


%extend AppDef_MultiLine {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetParameter(self):
		pass
	}
};

/************************************
* class AppDef_MultiPointConstraint *
************************************/
class AppDef_MultiPointConstraint : public AppParCurves_MultiPoint {
	public:
		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 96027af1988322f99b6e55f7786bbfed ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an undefined MultiPointConstraint.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint();

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: ff76964ee920829861e64dfe38e9cb12 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
NbPoints: int
NbPoints2d: int

Return
-------
None

Description
-----------
constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const Standard_Integer NbPoints, const Standard_Integer NbPoints2d);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 9184167dca4027cf0f0b5603034fb92c ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
creates a MultiPoint only composed of 3D points.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 46a09e9865b6eb31d4538e09d085c188 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
creates a MultiPoint only composed of 2D points.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt2d & tabP);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 4b41af30a79a87deddbf4ee5cd31a158 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 44443bf947130186f3723c074454fa6c ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d
tabVec: TColgp_Array1OfVec
tabVec2d: TColgp_Array1OfVec2d
tabCur: TColgp_Array1OfVec
tabCur2d: TColgp_Array1OfVec2d

Return
-------
None

Description
-----------
creates a MultiPointConstraint with a constraint of Curvature. An exception is raised if (length of <tabP> + length of <tabP2d> ) is different from (length of <tabVec> + length of <tabVec2d> ) or from (length of <tabCur> + length of <tabCur2d> ).
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec & tabVec, const TColgp_Array1OfVec2d & tabVec2d, const TColgp_Array1OfVec & tabCur, const TColgp_Array1OfVec2d & tabCur2d);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: d748f264c5548ebcc67245703c451c24 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d
tabVec: TColgp_Array1OfVec
tabVec2d: TColgp_Array1OfVec2d

Return
-------
None

Description
-----------
creates a MultiPointConstraint with a constraint of Tangency. An exception is raised if (length of <tabP> + length of <tabP2d> ) is different from (length of <tabVec> + length of <tabVec2d> ).
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec & tabVec, const TColgp_Array1OfVec2d & tabVec2d);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 94d7957cb88369d49d63036eed746423 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt
tabVec: TColgp_Array1OfVec
tabCur: TColgp_Array1OfVec

Return
-------
None

Description
-----------
creates a MultiPointConstraint only composed of 3d points with constraints of curvature. An exception is raised if the length of tabP is different from the length of tabVec or from tabCur.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfVec & tabVec, const TColgp_Array1OfVec & tabCur);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 31f20878f084137d450aeb8e587bf928 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP: TColgp_Array1OfPnt
tabVec: TColgp_Array1OfVec

Return
-------
None

Description
-----------
creates a MultiPointConstraint only composed of 3d points with constraints of tangency. An exception is raised if the length of tabP is different from the length of tabVec.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfVec & tabVec);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 21d3ccff0015997a435f1a264a1c2e78 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP2d: TColgp_Array1OfPnt2d
tabVec2d: TColgp_Array1OfVec2d

Return
-------
None

Description
-----------
creates a MultiPointConstraint only composed of 2d points with constraints of tangency. An exception is raised if the length of tabP is different from the length of tabVec2d.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec2d & tabVec2d);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 66a61a1bf7f3832fb19b1df85df945e9 ******/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "
Parameters
----------
tabP2d: TColgp_Array1OfPnt2d
tabVec2d: TColgp_Array1OfVec2d
tabCur2d: TColgp_Array1OfVec2d

Return
-------
None

Description
-----------
creates a MultiPointConstraint only composed of 2d points with constraints of curvature. An exception is raised if the length of tabP is different from the length of tabVec2d or from tabCur2d.
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec2d & tabVec2d, const TColgp_Array1OfVec2d & tabCur2d);

		/****** AppDef_MultiPointConstraint::Curv ******/
		/****** md5 signature: 901fe2bd94b085eee25dc02982da6bce ******/
		%feature("compactdefaultargs") Curv;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Vec

Description
-----------
returns the normal vector at the point of range Index. An exception is raised if Index < 0 or if Index > number of 3d points.
") Curv;
		gp_Vec Curv(const Standard_Integer Index);

		/****** AppDef_MultiPointConstraint::Curv2d ******/
		/****** md5 signature: e6ac9d88d679b86619b3f52f8b16e6a4 ******/
		%feature("compactdefaultargs") Curv2d;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Vec2d

Description
-----------
returns the normal vector at the point of range Index. An exception is raised if Index < 0 or if Index > number of 3d points.
") Curv2d;
		gp_Vec2d Curv2d(const Standard_Integer Index);

		/****** AppDef_MultiPointConstraint::Dump ******/
		/****** md5 signature: b42defe2d7a7208961fa81b225a70479 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		virtual void Dump(std::ostream &OutValue);

		/****** AppDef_MultiPointConstraint::IsCurvaturePoint ******/
		/****** md5 signature: d472719ada146163920fff12150b4a88 ******/
		%feature("compactdefaultargs") IsCurvaturePoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the MultiPoint has a curvature value.
") IsCurvaturePoint;
		Standard_Boolean IsCurvaturePoint();

		/****** AppDef_MultiPointConstraint::IsTangencyPoint ******/
		/****** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the MultiPoint has a tangency value.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** AppDef_MultiPointConstraint::SetCurv ******/
		/****** md5 signature: 0162d39bffdfbd1d75ead34617bd7b2e ******/
		%feature("compactdefaultargs") SetCurv;
		%feature("autodoc", "
Parameters
----------
Index: int
Curv: gp_Vec

Return
-------
None

Description
-----------
Vec sets the value of the normal vector at the point of index Index. The norm of the normal vector at the point of position Index is set to the normal curvature. An exception is raised if Index <0 or if Index > number of 3d points. An exception is raised if Curv has an incorrect number of dimensions.
") SetCurv;
		void SetCurv(const Standard_Integer Index, const gp_Vec & Curv);

		/****** AppDef_MultiPointConstraint::SetCurv2d ******/
		/****** md5 signature: 3ec1dbcf520f618b653d5041e0c8d8dd ******/
		%feature("compactdefaultargs") SetCurv2d;
		%feature("autodoc", "
Parameters
----------
Index: int
Curv2d: gp_Vec2d

Return
-------
None

Description
-----------
Vec sets the value of the normal vector at the point of index Index. The norm of the normal vector at the point of position Index is set to the normal curvature. An exception is raised if Index <0 or if Index > number of 3d points. An exception is raised if Curv has an incorrect number of dimensions.
") SetCurv2d;
		void SetCurv2d(const Standard_Integer Index, const gp_Vec2d & Curv2d);

		/****** AppDef_MultiPointConstraint::SetTang ******/
		/****** md5 signature: b9f6088507651a7284dea739ac0606f3 ******/
		%feature("compactdefaultargs") SetTang;
		%feature("autodoc", "
Parameters
----------
Index: int
Tang: gp_Vec

Return
-------
None

Description
-----------
sets the value of the tangency of the point of range Index. An exception is raised if Index <0 or if Index > number of 3d points. An exception is raised if Tang has an incorrect number of dimensions.
") SetTang;
		void SetTang(const Standard_Integer Index, const gp_Vec & Tang);

		/****** AppDef_MultiPointConstraint::SetTang2d ******/
		/****** md5 signature: f8ceb77e6c6d212baca26c1596380f6f ******/
		%feature("compactdefaultargs") SetTang2d;
		%feature("autodoc", "
Parameters
----------
Index: int
Tang2d: gp_Vec2d

Return
-------
None

Description
-----------
sets the value of the tangency of the point of range Index. An exception is raised if Index <number of 3d points or if Index > total number of Points An exception is raised if Tang has an incorrect number of dimensions.
") SetTang2d;
		void SetTang2d(const Standard_Integer Index, const gp_Vec2d & Tang2d);

		/****** AppDef_MultiPointConstraint::Tang ******/
		/****** md5 signature: b3ab01973cc67e0139dc6df881bab23f ******/
		%feature("compactdefaultargs") Tang;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Vec

Description
-----------
returns the tangency value of the point of range Index. An exception is raised if Index < 0 or if Index > number of 3d points.
") Tang;
		gp_Vec Tang(const Standard_Integer Index);

		/****** AppDef_MultiPointConstraint::Tang2d ******/
		/****** md5 signature: 40fbe4c8c727eda957d23ce8b2313218 ******/
		%feature("compactdefaultargs") Tang2d;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Vec2d

Description
-----------
returns the tangency value of the point of range Index. An exception is raised if Index < number of 3d points or if Index > total number of points.
") Tang2d;
		gp_Vec2d Tang2d(const Standard_Integer Index);

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
		/****** AppDef_MyBSplGradientOfBSplineCompute::AppDef_MyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 285b1c5b1288155aae98fcdade735980 ******/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Deg: int
Tol3d: float
Tol2d: float
NbIterations: int (optional, default to 1)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 1);

		/****** AppDef_MyBSplGradientOfBSplineCompute::AppDef_MyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: e90d26c95787b979a56c520408235daf ******/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Deg: int
Tol3d: float
Tol2d: float
NbIterations: int
lambda1: float
lambda2: float

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);

		/****** AppDef_MyBSplGradientOfBSplineCompute::AverageError ******/
		/****** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		Standard_Real AverageError();

		/****** AppDef_MyBSplGradientOfBSplineCompute::Error ******/
		/****** md5 signature: 94d11b0fe58daf5df892c75e38905cde ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		Standard_Real Error(const Standard_Integer Index);

		/****** AppDef_MyBSplGradientOfBSplineCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_MyBSplGradientOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_MyBSplGradientOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_MyBSplGradientOfBSplineCompute::Value ******/
		/****** md5 signature: 35d2ee100f1a9fc11f00b074d7d3553e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns all the BSpline curves approximating the MultiLine SSP after minimization of the parameter.
") Value;
		AppParCurves_MultiBSpCurve Value();

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
		/****** AppDef_MyGradientOfCompute::AppDef_MyGradientOfCompute ******/
		/****** md5 signature: d6d163c2b5b0d362b397ec1451a85a67 ******/
		%feature("compactdefaultargs") AppDef_MyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int
Tol3d: float
Tol2d: float
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyGradientOfCompute;
		 AppDef_MyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****** AppDef_MyGradientOfCompute::AverageError ******/
		/****** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		Standard_Real AverageError();

		/****** AppDef_MyGradientOfCompute::Error ******/
		/****** md5 signature: 94d11b0fe58daf5df892c75e38905cde ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		Standard_Real Error(const Standard_Integer Index);

		/****** AppDef_MyGradientOfCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_MyGradientOfCompute::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_MyGradientOfCompute::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_MyGradientOfCompute::Value ******/
		/****** md5 signature: dac7e49320bc0e9a268aeb92592734dc ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.
") Value;
		AppParCurves_MultiCurve Value();

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
		/****** AppDef_MyGradientbisOfBSplineCompute::AppDef_MyGradientbisOfBSplineCompute ******/
		/****** md5 signature: 6bd7ad47a144857ac891dd606d181fd3 ******/
		%feature("compactdefaultargs") AppDef_MyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int
Tol3d: float
Tol2d: float
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyGradientbisOfBSplineCompute;
		 AppDef_MyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****** AppDef_MyGradientbisOfBSplineCompute::AverageError ******/
		/****** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		Standard_Real AverageError();

		/****** AppDef_MyGradientbisOfBSplineCompute::Error ******/
		/****** md5 signature: 94d11b0fe58daf5df892c75e38905cde ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		Standard_Real Error(const Standard_Integer Index);

		/****** AppDef_MyGradientbisOfBSplineCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_MyGradientbisOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_MyGradientbisOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_MyGradientbisOfBSplineCompute::Value ******/
		/****** md5 signature: dac7e49320bc0e9a268aeb92592734dc ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.
") Value;
		AppParCurves_MultiCurve Value();

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
		/****** AppDef_MyLineTool::Curvature ******/
		/****** md5 signature: 12e4a67b8d371d9f1a978704077ccbc8 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
returns the 3d curvatures of the multipoint <MPointIndex> when only 3d points exist.
") Curvature;
		static Standard_Boolean Curvature(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****** AppDef_MyLineTool::Curvature ******/
		/****** md5 signature: da227696a9b2e067a20d3b5467649970 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 2d curvatures of the multipoint <MPointIndex> only when 2d points exist.
") Curvature;
		static Standard_Boolean Curvature(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::Curvature ******/
		/****** md5 signature: c8420054f061601ba7d5d683c11ca2e7 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 3d and 2d curvatures of the multipoint <MPointIndex>.
") Curvature;
		static Standard_Boolean Curvature(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::FirstPoint ******/
		/****** md5 signature: aa6413da896459eb8c56102a045df964 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine

Return
-------
int

Description
-----------
Returns the first index of multipoints of the MultiLine.
") FirstPoint;
		static Standard_Integer FirstPoint(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::LastPoint ******/
		/****** md5 signature: 9f5446370dab90e6dc755040302f27ba ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine

Return
-------
int

Description
-----------
Returns the last index of multipoints of the MultiLine.
") LastPoint;
		static Standard_Integer LastPoint(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::MakeMLBetween ******/
		/****** md5 signature: 45eb4314bc229297ec468e0e68adda67 ******/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
I1: int
I2: int
NbPMin: int

Return
-------
AppDef_MultiLine

Description
-----------
Is never called in the algorithms. Nothing is done.
") MakeMLBetween;
		static AppDef_MultiLine MakeMLBetween(const AppDef_MultiLine & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);

		/****** AppDef_MyLineTool::MakeMLOneMorePoint ******/
		/****** md5 signature: 63482999c5c43dccf4668a0ab37a5909 ******/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
I1: int
I2: int
indbad: int
OtherLine: AppDef_MultiLine

Return
-------
bool

Description
-----------
Is never called in the algorithms. Nothing is done.
") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint(const AppDef_MultiLine & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer indbad, AppDef_MultiLine & OtherLine);

		/****** AppDef_MyLineTool::NbP2d ******/
		/****** md5 signature: 7a37caf206ab568500c96708d4d9f281 ******/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine

Return
-------
int

Description
-----------
Returns the number of 2d points of a MultiLine.
") NbP2d;
		static Standard_Integer NbP2d(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::NbP3d ******/
		/****** md5 signature: b37e0daf764f3796dfd4e04f1004f411 ******/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine

Return
-------
int

Description
-----------
Returns the number of 3d points of a MultiLine.
") NbP3d;
		static Standard_Integer NbP3d(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::Tangency ******/
		/****** md5 signature: 899765c31b68f9d5622bb4f335d17af9 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
") Tangency;
		static Standard_Boolean Tangency(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****** AppDef_MyLineTool::Tangency ******/
		/****** md5 signature: 0b0abe2371afc94bdc402cd3a5e13ca6 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.
") Tangency;
		static Standard_Boolean Tangency(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::Tangency ******/
		/****** md5 signature: 260996d76e35422100d12a8ced363571 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 3d and 2d points of the multipoint <MPointIndex>.
") Tangency;
		static Standard_Boolean Tangency(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::Value ******/
		/****** md5 signature: 8dcbf0fabc7c1e1761c0065a48505664 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
") Value;
		static void Value(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** AppDef_MyLineTool::Value ******/
		/****** md5 signature: 531d0eb0a3bfd42e8f41bd5400fec8b8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.
") Value;
		static void Value(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** AppDef_MyLineTool::Value ******/
		/****** md5 signature: 2b0210374c28698cdc099922d8d2b967 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabPt: TColgp_Array1OfPnt
tabPt2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
returns the 3d and 2d points of the multipoint <MPointIndex>.
") Value;
		static void Value(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** AppDef_MyLineTool::WhatStatus ******/
		/****** md5 signature: a4e05eb1bdb8d525ab7cc67865409902 ******/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "
Parameters
----------
ML: AppDef_MultiLine
I1: int
I2: int

Return
-------
Approx_Status

Description
-----------
returns NoPointsAdded.
") WhatStatus;
		static Approx_Status WhatStatus(const AppDef_MultiLine & ML, const Standard_Integer I1, const Standard_Integer I2);

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
		/****** AppDef_ParFunctionOfMyGradientOfCompute::AppDef_ParFunctionOfMyGradientOfCompute ******/
		/****** md5 signature: 5e82b667e483741251b19a4b42af6a1c ******/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_ParFunctionOfMyGradientOfCompute;
		 AppDef_ParFunctionOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::CurveValue ******/
		/****** md5 signature: c2e2cb976554936214bdfe3487b0362c ******/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the MultiCurve approximating the set after computing the value F or Grad(F).
") CurveValue;
		AppParCurves_MultiCurve CurveValue();

		/****** AppDef_ParFunctionOfMyGradientOfCompute::Error ******/
		/****** md5 signature: 59bc36aa259ae04fcbc9c2a60fae6dfb ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
float

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::FirstConstraint ******/
		/****** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::Gradient ******/
		/****** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
returns the gradient G of the sum above for the parameters Xi.
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::LastConstraint ******/
		/****** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_ParFunctionOfMyGradientOfCompute::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_ParFunctionOfMyGradientOfCompute::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		Standard_Integer NbVariables();

		/****** AppDef_ParFunctionOfMyGradientOfCompute::NewParameters ******/
		/****** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ******/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the new parameters of the MultiLine.
") NewParameters;
		const math_Vector & NewParameters();

		/****** AppDef_ParFunctionOfMyGradientOfCompute::Value ******/
		/****** md5 signature: 33f8b9f75d238865cc320f57ac729801 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::Values ******/
		/****** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::AppDef_ParFunctionOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: 71e0b753e00d6144bda7beaa41e6a211 ******/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		 AppDef_ParFunctionOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::CurveValue ******/
		/****** md5 signature: c2e2cb976554936214bdfe3487b0362c ******/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the MultiCurve approximating the set after computing the value F or Grad(F).
") CurveValue;
		AppParCurves_MultiCurve CurveValue();

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::Error ******/
		/****** md5 signature: 59bc36aa259ae04fcbc9c2a60fae6dfb ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
float

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::FirstConstraint ******/
		/****** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::Gradient ******/
		/****** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
returns the gradient G of the sum above for the parameters Xi.
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::LastConstraint ******/
		/****** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		Standard_Integer NbVariables();

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::NewParameters ******/
		/****** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ******/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the new parameters of the MultiLine.
") NewParameters;
		const math_Vector & NewParameters();

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::Value ******/
		/****** md5 signature: 33f8b9f75d238865cc320f57ac729801 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::Values ******/
		/****** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** AppDef_ParFunctionOfTheGradient::AppDef_ParFunctionOfTheGradient ******/
		/****** md5 signature: 6ae58b53fc28bc68999c5284f8bd72a8 ******/
		%feature("compactdefaultargs") AppDef_ParFunctionOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_ParFunctionOfTheGradient;
		 AppDef_ParFunctionOfTheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****** AppDef_ParFunctionOfTheGradient::CurveValue ******/
		/****** md5 signature: c2e2cb976554936214bdfe3487b0362c ******/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the MultiCurve approximating the set after computing the value F or Grad(F).
") CurveValue;
		AppParCurves_MultiCurve CurveValue();

		/****** AppDef_ParFunctionOfTheGradient::Error ******/
		/****** md5 signature: 59bc36aa259ae04fcbc9c2a60fae6dfb ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
float

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****** AppDef_ParFunctionOfTheGradient::FirstConstraint ******/
		/****** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****** AppDef_ParFunctionOfTheGradient::Gradient ******/
		/****** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
returns the gradient G of the sum above for the parameters Xi.
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_ParFunctionOfTheGradient::LastConstraint ******/
		/****** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****** AppDef_ParFunctionOfTheGradient::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_ParFunctionOfTheGradient::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_ParFunctionOfTheGradient::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		Standard_Integer NbVariables();

		/****** AppDef_ParFunctionOfTheGradient::NewParameters ******/
		/****** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ******/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the new parameters of the MultiLine.
") NewParameters;
		const math_Vector & NewParameters();

		/****** AppDef_ParFunctionOfTheGradient::Value ******/
		/****** md5 signature: 33f8b9f75d238865cc320f57ac729801 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_ParFunctionOfTheGradient::Values ******/
		/****** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::AppDef_ParLeastSquareOfMyGradientOfCompute ******/
		/****** md5 signature: 0f470f8d09760a577136f1515d1bfb47 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::AppDef_ParLeastSquareOfMyGradientOfCompute ******/
		/****** md5 signature: 4c1463e27c262a50e76b8fe5dff270c0 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::AppDef_ParLeastSquareOfMyGradientOfCompute ******/
		/****** md5 signature: 6150d26142d95dfba2fe070d4d272305 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::AppDef_ParLeastSquareOfMyGradientOfCompute ******/
		/****** md5 signature: 1e1086e0e59f1c54539147a819762a29 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::BSplineValue ******/
		/****** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ******/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BSplineValue;
		AppParCurves_MultiBSpCurve BSplineValue();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::BezierValue ******/
		/****** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ******/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::DerivativeFunctionMatrix ******/
		/****** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ******/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the derivative function matrix used to approximate the set.
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Distance ******/
		/****** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the distances between the points of the multiline and the approximation curves.
") Distance;
		const math_Matrix & Distance();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Error ******/
		/****** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::ErrorGradient ******/
		/****** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::FirstLambda ******/
		/****** md5 signature: 87ad21cc13708c47c81704b38426d999 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		Standard_Real FirstLambda();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::FunctionMatrix ******/
		/****** md5 signature: aec90dd003c289db9092eb79712677e1 ******/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the function matrix used to approximate the set.
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::KIndex ******/
		/****** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ******/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Return
-------
math_IntegerVector

Description
-----------
Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
") KIndex;
		const math_IntegerVector & KIndex();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::LastLambda ******/
		/****** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		Standard_Real LastLambda();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Perform ******/
		/****** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector

Return
-------
None

Description
-----------
Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
") Perform;
		void Perform(const math_Vector & Parameters);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Perform ******/
		/****** md5 signature: cbf083f2b8329680dc5a52f482f436ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Perform ******/
		/****** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Perform ******/
		/****** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Points ******/
		/****** md5 signature: 8a77545526c5096bca80b9c07f882412 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of points value.
") Points;
		const math_Matrix & Points();

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Poles ******/
		/****** md5 signature: 1437a652beb857bd22c16de65cb18857 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of resulting control points value.
") Poles;
		const math_Matrix & Poles();

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
		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: 5c7d889ff7c3c53d9c2d304f6513a770 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: d358e31489791262a5431ebacf9dc7b9 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: b4722672fa82bbd3c01a14c4f1ea81fb ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: 9ac1102ac0cd7f24c5edbabd8d6c6d2a ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::BSplineValue ******/
		/****** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ******/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BSplineValue;
		AppParCurves_MultiBSpCurve BSplineValue();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::BezierValue ******/
		/****** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ******/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::DerivativeFunctionMatrix ******/
		/****** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ******/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the derivative function matrix used to approximate the set.
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Distance ******/
		/****** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the distances between the points of the multiline and the approximation curves.
") Distance;
		const math_Matrix & Distance();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Error ******/
		/****** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::ErrorGradient ******/
		/****** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::FirstLambda ******/
		/****** md5 signature: 87ad21cc13708c47c81704b38426d999 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		Standard_Real FirstLambda();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::FunctionMatrix ******/
		/****** md5 signature: aec90dd003c289db9092eb79712677e1 ******/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the function matrix used to approximate the set.
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::KIndex ******/
		/****** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ******/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Return
-------
math_IntegerVector

Description
-----------
Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
") KIndex;
		const math_IntegerVector & KIndex();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::LastLambda ******/
		/****** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		Standard_Real LastLambda();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Perform ******/
		/****** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector

Return
-------
None

Description
-----------
Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
") Perform;
		void Perform(const math_Vector & Parameters);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Perform ******/
		/****** md5 signature: cbf083f2b8329680dc5a52f482f436ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Perform ******/
		/****** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Perform ******/
		/****** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Points ******/
		/****** md5 signature: 8a77545526c5096bca80b9c07f882412 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of points value.
") Points;
		const math_Matrix & Points();

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Poles ******/
		/****** md5 signature: 1437a652beb857bd22c16de65cb18857 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of resulting control points value.
") Poles;
		const math_Matrix & Poles();

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
		/****** AppDef_ParLeastSquareOfTheGradient::AppDef_ParLeastSquareOfTheGradient ******/
		/****** md5 signature: f10deca5c5a2f219a4aac3b29290f883 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfTheGradient::AppDef_ParLeastSquareOfTheGradient ******/
		/****** md5 signature: ffaf2f04cbeda05157e4779b39436d87 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfTheGradient::AppDef_ParLeastSquareOfTheGradient ******/
		/****** md5 signature: 0a6fa28c9440f806dc69f10826983565 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfTheGradient::AppDef_ParLeastSquareOfTheGradient ******/
		/****** md5 signature: 41e374c7b096bebe266c47cde703aa75 ******/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_ParLeastSquareOfTheGradient::BSplineValue ******/
		/****** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ******/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BSplineValue;
		AppParCurves_MultiBSpCurve BSplineValue();

		/****** AppDef_ParLeastSquareOfTheGradient::BezierValue ******/
		/****** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ******/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****** AppDef_ParLeastSquareOfTheGradient::DerivativeFunctionMatrix ******/
		/****** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ******/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the derivative function matrix used to approximate the set.
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****** AppDef_ParLeastSquareOfTheGradient::Distance ******/
		/****** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the distances between the points of the multiline and the approximation curves.
") Distance;
		const math_Matrix & Distance();

		/****** AppDef_ParLeastSquareOfTheGradient::Error ******/
		/****** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfTheGradient::ErrorGradient ******/
		/****** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfTheGradient::FirstLambda ******/
		/****** md5 signature: 87ad21cc13708c47c81704b38426d999 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		Standard_Real FirstLambda();

		/****** AppDef_ParLeastSquareOfTheGradient::FunctionMatrix ******/
		/****** md5 signature: aec90dd003c289db9092eb79712677e1 ******/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the function matrix used to approximate the set.
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****** AppDef_ParLeastSquareOfTheGradient::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_ParLeastSquareOfTheGradient::KIndex ******/
		/****** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ******/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Return
-------
math_IntegerVector

Description
-----------
Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
") KIndex;
		const math_IntegerVector & KIndex();

		/****** AppDef_ParLeastSquareOfTheGradient::LastLambda ******/
		/****** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		Standard_Real LastLambda();

		/****** AppDef_ParLeastSquareOfTheGradient::Perform ******/
		/****** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector

Return
-------
None

Description
-----------
Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
") Perform;
		void Perform(const math_Vector & Parameters);

		/****** AppDef_ParLeastSquareOfTheGradient::Perform ******/
		/****** md5 signature: cbf083f2b8329680dc5a52f482f436ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfTheGradient::Perform ******/
		/****** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfTheGradient::Perform ******/
		/****** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_ParLeastSquareOfTheGradient::Points ******/
		/****** md5 signature: 8a77545526c5096bca80b9c07f882412 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of points value.
") Points;
		const math_Matrix & Points();

		/****** AppDef_ParLeastSquareOfTheGradient::Poles ******/
		/****** md5 signature: 1437a652beb857bd22c16de65cb18857 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of resulting control points value.
") Poles;
		const math_Matrix & Poles();

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
		/****** AppDef_ResConstraintOfMyGradientOfCompute::AppDef_ResConstraintOfMyGradientOfCompute ******/
		/****** md5 signature: 6cfad4139f20fc94b0b10535a1a2b060 ******/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: AppParCurves_HArray1OfConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_ResConstraintOfMyGradientOfCompute;
		 AppDef_ResConstraintOfMyGradientOfCompute(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** AppDef_ResConstraintOfMyGradientOfCompute::ConstraintDerivative ******/
		/****** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Return
-------
math_Matrix

Description
-----------
Returns the derivative of the constraint matrix.
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****** AppDef_ResConstraintOfMyGradientOfCompute::ConstraintMatrix ******/
		/****** md5 signature: 22481357cd3fa297d87302ab5bf68ab7 ******/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
No available documentation.
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****** AppDef_ResConstraintOfMyGradientOfCompute::Duale ******/
		/****** md5 signature: fa2d61bba97045a52b936ca097de9f1b ******/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the duale variables of the system.
") Duale;
		const math_Vector & Duale();

		/****** AppDef_ResConstraintOfMyGradientOfCompute::InverseMatrix ******/
		/****** md5 signature: 6c593c2bc8580243a5ff315f7f6a1f0e ******/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****** AppDef_ResConstraintOfMyGradientOfCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

};


%extend AppDef_ResConstraintOfMyGradientOfCompute {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/************************************************************
* class AppDef_ResConstraintOfMyGradientbisOfBSplineCompute *
************************************************************/
class AppDef_ResConstraintOfMyGradientbisOfBSplineCompute {
	public:
		/****** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute::AppDef_ResConstraintOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: 19f1d924fc5c45098e224f6711eb1fac ******/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: AppParCurves_HArray1OfConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		 AppDef_ResConstraintOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute::ConstraintDerivative ******/
		/****** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Return
-------
math_Matrix

Description
-----------
Returns the derivative of the constraint matrix.
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute::ConstraintMatrix ******/
		/****** md5 signature: 22481357cd3fa297d87302ab5bf68ab7 ******/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
No available documentation.
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute::Duale ******/
		/****** md5 signature: fa2d61bba97045a52b936ca097de9f1b ******/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the duale variables of the system.
") Duale;
		const math_Vector & Duale();

		/****** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute::InverseMatrix ******/
		/****** md5 signature: 6c593c2bc8580243a5ff315f7f6a1f0e ******/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

};


%extend AppDef_ResConstraintOfMyGradientbisOfBSplineCompute {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/******************************************
* class AppDef_ResConstraintOfTheGradient *
******************************************/
class AppDef_ResConstraintOfTheGradient {
	public:
		/****** AppDef_ResConstraintOfTheGradient::AppDef_ResConstraintOfTheGradient ******/
		/****** md5 signature: 28edbef59ca63ee686fc7b7c358570b5 ******/
		%feature("compactdefaultargs") AppDef_ResConstraintOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: AppParCurves_HArray1OfConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_ResConstraintOfTheGradient;
		 AppDef_ResConstraintOfTheGradient(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** AppDef_ResConstraintOfTheGradient::ConstraintDerivative ******/
		/****** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Return
-------
math_Matrix

Description
-----------
Returns the derivative of the constraint matrix.
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****** AppDef_ResConstraintOfTheGradient::ConstraintMatrix ******/
		/****** md5 signature: 22481357cd3fa297d87302ab5bf68ab7 ******/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
No available documentation.
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****** AppDef_ResConstraintOfTheGradient::Duale ******/
		/****** md5 signature: fa2d61bba97045a52b936ca097de9f1b ******/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the duale variables of the system.
") Duale;
		const math_Vector & Duale();

		/****** AppDef_ResConstraintOfTheGradient::InverseMatrix ******/
		/****** md5 signature: 6c593c2bc8580243a5ff315f7f6a1f0e ******/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****** AppDef_ResConstraintOfTheGradient::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

};


%extend AppDef_ResConstraintOfTheGradient {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/*******************************
* class AppDef_SmoothCriterion *
*******************************/
%nodefaultctor AppDef_SmoothCriterion;
class AppDef_SmoothCriterion : public Standard_Transient {
	public:
		/****** AppDef_SmoothCriterion::AssemblyTable ******/
		/****** md5 signature: 4ea475cc7902240e9011827552f2aa0e ******/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "Return
-------
opencascade::handle<FEmTool_HAssemblyTable>

Description
-----------
No available documentation.
") AssemblyTable;
		virtual opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable();

		/****** AppDef_SmoothCriterion::DependenceTable ******/
		/****** md5 signature: c016d827aafaa774489e50229cf20da6 ******/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
No available documentation.
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****** AppDef_SmoothCriterion::ErrorValues ******/
		/****** md5 signature: cfe3e0a15201f20a76cdffc4832deb32 ******/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
MaxError: float
QuadraticError: float
AverageError: float

Description
-----------
No available documentation.
") ErrorValues;
		virtual void ErrorValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_SmoothCriterion::EstLength ******/
		/****** md5 signature: 0b189fee7c9f70cecec55bd68f2b8b7e ******/
		%feature("compactdefaultargs") EstLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") EstLength;
		virtual Standard_Real & EstLength();

		/****** AppDef_SmoothCriterion::GetCurve ******/
		/****** md5 signature: 8fb90ce90606b6bcb1989378cd53a4f9 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "
Parameters
----------
C: FEmTool_Curve

Return
-------
None

Description
-----------
No available documentation.
") GetCurve;
		virtual void GetCurve(opencascade::handle<FEmTool_Curve> & C);

		/****** AppDef_SmoothCriterion::GetEstimation ******/
		/****** md5 signature: 8ba11ef014057784f34452683585efb6 ******/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", "
Parameters
----------

Return
-------
E1: float
E2: float
E3: float

Description
-----------
No available documentation.
") GetEstimation;
		virtual void GetEstimation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_SmoothCriterion::GetWeight ******/
		/****** md5 signature: af9c1e5043bd3ead9bfc060a4fb69ec7 ******/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
QuadraticWeight: float
QualityWeight: float

Description
-----------
No available documentation.
") GetWeight;
		virtual void GetWeight(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_SmoothCriterion::Gradient ******/
		/****** md5 signature: e66cfcf660598f9d33bd6c51e71787ee ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Element: int
Dimension: int
G: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") Gradient;
		virtual void Gradient(const Standard_Integer Element, const Standard_Integer Dimension, math_Vector & G);

		/****** AppDef_SmoothCriterion::Hessian ******/
		/****** md5 signature: ae17248c337e30b997401d5573140102 ******/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "
Parameters
----------
Element: int
Dimension1: int
Dimension2: int
H: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Hessian;
		virtual void Hessian(const Standard_Integer Element, const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****** AppDef_SmoothCriterion::InputVector ******/
		/****** md5 signature: d70c25b60b28c3838fab1614a13293f8 ******/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
AssTable: FEmTool_HAssemblyTable

Return
-------
None

Description
-----------
Convert the assembly Vector in an Curve;.
") InputVector;
		virtual void InputVector(const math_Vector & X, const opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****** AppDef_SmoothCriterion::QualityValues ******/
		/****** md5 signature: b244d6cd90390992902f1f73faa0efd3 ******/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", "
Parameters
----------
J1min: float
J2min: float
J3min: float

Return
-------
J1: float
J2: float
J3: float

Description
-----------
No available documentation.
") QualityValues;
		virtual Standard_Integer QualityValues(const Standard_Real J1min, const Standard_Real J2min, const Standard_Real J3min, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_SmoothCriterion::SetCurve ******/
		/****** md5 signature: f9249c904dd8eed90d010d71e8bbeb67 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: FEmTool_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		virtual void SetCurve(const opencascade::handle<FEmTool_Curve> & C);

		/****** AppDef_SmoothCriterion::SetEstimation ******/
		/****** md5 signature: 1eee8cba9d7425225339e7da8aafbe68 ******/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", "
Parameters
----------
E1: float
E2: float
E3: float

Return
-------
None

Description
-----------
No available documentation.
") SetEstimation;
		virtual void SetEstimation(const Standard_Real E1, const Standard_Real E2, const Standard_Real E3);

		/****** AppDef_SmoothCriterion::SetParameters ******/
		/****** md5 signature: 27aab9728b5d765091cba886e9f49273 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
Parameters: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetParameters;
		virtual void SetParameters(const opencascade::handle<TColStd_HArray1OfReal> & Parameters);

		/****** AppDef_SmoothCriterion::SetWeight ******/
		/****** md5 signature: dc802dcd07fa8159f377bdea35a73f35 ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
QuadraticWeight: float
QualityWeight: float
percentJ1: float
percentJ2: float
percentJ3: float

Return
-------
None

Description
-----------
No available documentation.
") SetWeight;
		virtual void SetWeight(const Standard_Real QuadraticWeight, const Standard_Real QualityWeight, const Standard_Real percentJ1, const Standard_Real percentJ2, const Standard_Real percentJ3);

		/****** AppDef_SmoothCriterion::SetWeight ******/
		/****** md5 signature: 7071df0ad4a367ddf80150dd3c3f5302 ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Weight: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeight;
		virtual void SetWeight(const TColStd_Array1OfReal & Weight);

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
		/****** AppDef_TheFunction::AppDef_TheFunction ******/
		/****** md5 signature: da57d66f050dd8770549a173c8a381bb ******/
		%feature("compactdefaultargs") AppDef_TheFunction;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_TheFunction;
		 AppDef_TheFunction(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****** AppDef_TheFunction::CurveValue ******/
		/****** md5 signature: c2e2cb976554936214bdfe3487b0362c ******/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the MultiCurve approximating the set after computing the value F or Grad(F).
") CurveValue;
		AppParCurves_MultiCurve CurveValue();

		/****** AppDef_TheFunction::Error ******/
		/****** md5 signature: 59bc36aa259ae04fcbc9c2a60fae6dfb ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
float

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****** AppDef_TheFunction::FirstConstraint ******/
		/****** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****** AppDef_TheFunction::Gradient ******/
		/****** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
returns the gradient G of the sum above for the parameters Xi.
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_TheFunction::LastConstraint ******/
		/****** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****** AppDef_TheFunction::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_TheFunction::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_TheFunction::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		Standard_Integer NbVariables();

		/****** AppDef_TheFunction::NewParameters ******/
		/****** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ******/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the new parameters of the MultiLine.
") NewParameters;
		const math_Vector & NewParameters();

		/****** AppDef_TheFunction::Value ******/
		/****** md5 signature: 33f8b9f75d238865cc320f57ac729801 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_TheFunction::Values ******/
		/****** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** AppDef_TheGradient::AppDef_TheGradient ******/
		/****** md5 signature: 85b9700dca31ee16f7fb2f871aed88ab ******/
		%feature("compactdefaultargs") AppDef_TheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int
Tol3d: float
Tol2d: float
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_TheGradient;
		 AppDef_TheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****** AppDef_TheGradient::AverageError ******/
		/****** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		Standard_Real AverageError();

		/****** AppDef_TheGradient::Error ******/
		/****** md5 signature: 94d11b0fe58daf5df892c75e38905cde ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		Standard_Real Error(const Standard_Integer Index);

		/****** AppDef_TheGradient::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_TheGradient::MaxError2d ******/
		/****** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		Standard_Real MaxError2d();

		/****** AppDef_TheGradient::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** AppDef_TheGradient::Value ******/
		/****** md5 signature: dac7e49320bc0e9a268aeb92592734dc ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns all the Bezier curves approximating the MultiLine SSP after minimization of the parameter.
") Value;
		AppParCurves_MultiCurve Value();

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
		/****** AppDef_TheLeastSquares::AppDef_TheLeastSquares ******/
		/****** md5 signature: f752b383abdb9dda4b6c44712dd024e1 ******/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. NbPol is the number of control points wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the Bernstein matrix computed with the parameters, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_TheLeastSquares::AppDef_TheLeastSquares ******/
		/****** md5 signature: ef6a5ff8da68e59f81011325a75bf3c6 ******/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_TheLeastSquares::AppDef_TheLeastSquares ******/
		/****** md5 signature: 3a5f460d8866bf1aa381c89f9b8a5452 ******/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Return
-------
None

Description
-----------
given a MultiLine, this algorithm computes the least square resolution using the Householder-QR method. If the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. Deg is the degree wanted for the approximating curves. The system to solve is the following: A X = B. Where A is the BSpline functions matrix computed with <parameters>, B the points coordinates and X the poles solutions. The matrix A is the same for each coordinate x, y and z and is also the same for each MultiLine point because they are approximated in parallel(so with the same parameter, only the vector B changes).
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** AppDef_TheLeastSquares::AppDef_TheLeastSquares ******/
		/****** md5 signature: 5bbebc9514a1e40a98553eefac06902f ******/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Return
-------
None

Description
-----------
Initializes the fields of the object.
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** AppDef_TheLeastSquares::BSplineValue ******/
		/****** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ******/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BSplineValue;
		AppParCurves_MultiBSpCurve BSplineValue();

		/****** AppDef_TheLeastSquares::BezierValue ******/
		/****** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ******/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the result of the approximation, i.e. all the Curves. An exception is raised if NotDone.
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****** AppDef_TheLeastSquares::DerivativeFunctionMatrix ******/
		/****** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ******/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the derivative function matrix used to approximate the set.
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****** AppDef_TheLeastSquares::Distance ******/
		/****** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the distances between the points of the multiline and the approximation curves.
") Distance;
		const math_Matrix & Distance();

		/****** AppDef_TheLeastSquares::Error ******/
		/****** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_TheLeastSquares::ErrorGradient ******/
		/****** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: float
MaxE3d: float
MaxE2d: float

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_TheLeastSquares::FirstLambda ******/
		/****** md5 signature: 87ad21cc13708c47c81704b38426d999 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		Standard_Real FirstLambda();

		/****** AppDef_TheLeastSquares::FunctionMatrix ******/
		/****** md5 signature: aec90dd003c289db9092eb79712677e1 ******/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the function matrix used to approximate the set.
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****** AppDef_TheLeastSquares::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_TheLeastSquares::KIndex ******/
		/****** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ******/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Return
-------
math_IntegerVector

Description
-----------
Returns the indexes of the first non null values of A and DA. The values are non null from Index(ieme point) +1 to Index(ieme point) + degree +1.
") KIndex;
		const math_IntegerVector & KIndex();

		/****** AppDef_TheLeastSquares::LastLambda ******/
		/****** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		Standard_Real LastLambda();

		/****** AppDef_TheLeastSquares::Perform ******/
		/****** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector

Return
-------
None

Description
-----------
Is used after having initialized the fields. The case 'CurvaturePoint' is not treated in this method.
") Perform;
		void Perform(const math_Vector & Parameters);

		/****** AppDef_TheLeastSquares::Perform ******/
		/****** md5 signature: cbf083f2b8329680dc5a52f482f436ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_TheLeastSquares::Perform ******/
		/****** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_TheLeastSquares::Perform ******/
		/****** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****** AppDef_TheLeastSquares::Points ******/
		/****** md5 signature: 8a77545526c5096bca80b9c07f882412 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of points value.
") Points;
		const math_Matrix & Points();

		/****** AppDef_TheLeastSquares::Poles ******/
		/****** md5 signature: 1437a652beb857bd22c16de65cb18857 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the matrix of resulting control points value.
") Poles;
		const math_Matrix & Poles();

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
		/****** AppDef_TheResol::AppDef_TheResol ******/
		/****** md5 signature: 4b9b6ad5df71d40b30db8c43f2f8211e ******/
		%feature("compactdefaultargs") AppDef_TheResol;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: AppParCurves_HArray1OfConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_TheResol;
		 AppDef_TheResol(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** AppDef_TheResol::ConstraintDerivative ******/
		/****** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Return
-------
math_Matrix

Description
-----------
Returns the derivative of the constraint matrix.
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****** AppDef_TheResol::ConstraintMatrix ******/
		/****** md5 signature: 22481357cd3fa297d87302ab5bf68ab7 ******/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
No available documentation.
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****** AppDef_TheResol::Duale ******/
		/****** md5 signature: fa2d61bba97045a52b936ca097de9f1b ******/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the duale variables of the system.
") Duale;
		const math_Vector & Duale();

		/****** AppDef_TheResol::InverseMatrix ******/
		/****** md5 signature: 6c593c2bc8580243a5ff315f7f6a1f0e ******/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the Inverse of Cont*Transposed(Cont), where Cont is the constraint matrix for the algorithm.
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****** AppDef_TheResol::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

};


%extend AppDef_TheResol {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/***************************
* class AppDef_Variational *
***************************/
class AppDef_Variational {
	public:
		/****** AppDef_Variational::AppDef_Variational ******/
		/****** md5 signature: f90b6cf052ecf51b369ee723a9ac7b8b ******/
		%feature("compactdefaultargs") AppDef_Variational;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
MaxDegree: int (optional, default to 14)
MaxSegment: int (optional, default to 100)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
WithMinMax: bool (optional, default to Standard_False)
WithCutting: bool (optional, default to Standard_True)
Tolerance: float (optional, default to 1.0)
NbIterations: int (optional, default to 2)

Return
-------
None

Description
-----------
Constructor. Initialization of the fields. warning: Nc0: number of PassagePoint consraints Nc2: number of TangencyPoint constraints Nc3: number of CurvaturePoint constraints if ((MaxDegree-Continuity)*MaxSegment -Nc0 - 2*Nc1 -3*Nc2) is negative The problem is over-constrained. //! Limitation: The MultiLine from AppDef has to be composed by only one Line ( Dimension 2 or 3).
") AppDef_Variational;
		 AppDef_Variational(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 100, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Boolean WithMinMax = Standard_False, const Standard_Boolean WithCutting = Standard_True, const Standard_Real Tolerance = 1.0, const Standard_Integer NbIterations = 2);

		/****** AppDef_Variational::Approximate ******/
		/****** md5 signature: c99f59de561bcc5fc0bce8bf73c657b1 ******/
		%feature("compactdefaultargs") Approximate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes the approximation with the current fields.
") Approximate;
		void Approximate();

		/****** AppDef_Variational::AverageError ******/
		/****** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the average error between the MultiLine from AppDef and the approximation.
") AverageError;
		Standard_Real AverageError();

		/****** AppDef_Variational::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns the Continuity used in the approximation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** AppDef_Variational::Criterium ******/
		/****** md5 signature: edb6a5a9c11d025eaea36c85716d20aa ******/
		%feature("compactdefaultargs") Criterium;
		%feature("autodoc", "
Parameters
----------

Return
-------
VFirstOrder: float
VSecondOrder: float
VThirdOrder: float

Description
-----------
returns the values of the quality criterium.
") Criterium;
		void Criterium(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_Variational::CriteriumWeight ******/
		/****** md5 signature: d1e8815ca315e3e933ecc550d2c9ab9d ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
Percent1: float
Percent2: float
Percent3: float

Description
-----------
returns the Weights (as percent) associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_Variational::Distance ******/
		/****** md5 signature: fb873fdfe64ff9a1fb1949ce5ba730e9 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
mat: math_Matrix

Return
-------
None

Description
-----------
returns the distances between the points of the multiline and the approximation curves.
") Distance;
		void Distance(math_Matrix & mat);

		/****** AppDef_Variational::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. MaxError,MaxErrorIndex,AverageError,QuadraticError,Criterium Distances,Degre,Nombre de poles, parametres, noeuds.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** AppDef_Variational::IsCreated ******/
		/****** md5 signature: ee98cd23a823f97ff49721b779c9bc76 ******/
		%feature("compactdefaultargs") IsCreated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the creation is done and correspond to the current fields.
") IsCreated;
		Standard_Boolean IsCreated();

		/****** AppDef_Variational::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the approximation is ok and correspond to the current fields.
") IsDone;
		Standard_Boolean IsDone();

		/****** AppDef_Variational::IsOverConstrained ******/
		/****** md5 signature: b90429989d8f8debd1e02927f18e060e ******/
		%feature("compactdefaultargs") IsOverConstrained;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the problem is overconstrained in this case, approximation cannot be done.
") IsOverConstrained;
		Standard_Boolean IsOverConstrained();

		/****** AppDef_Variational::Knots ******/
		/****** md5 signature: 6fb22c3eaf6dc04bd29ac3396a7169a9 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
returns the knots uses to the approximations.
") Knots;
		const opencascade::handle<TColStd_HArray1OfReal> & Knots();

		/****** AppDef_Variational::MaxDegree ******/
		/****** md5 signature: 2c79ca8c281a4e3978650b16dd11f77d ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the Maximum Degree used in the approximation.
") MaxDegree;
		Standard_Integer MaxDegree();

		/****** AppDef_Variational::MaxError ******/
		/****** md5 signature: 90f2419f0b1537a77da84305579339a2 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum of the distances between the points of the multiline and the approximation curves.
") MaxError;
		Standard_Real MaxError();

		/****** AppDef_Variational::MaxErrorIndex ******/
		/****** md5 signature: 971e966c0fe3112e06e17b68cf389166 ******/
		%feature("compactdefaultargs") MaxErrorIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the index of the MultiPoint of ErrorMax.
") MaxErrorIndex;
		Standard_Integer MaxErrorIndex();

		/****** AppDef_Variational::MaxSegment ******/
		/****** md5 signature: 1053b33469d38c347d8d0e695823bcf7 ******/
		%feature("compactdefaultargs") MaxSegment;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the Maximum of segment used in the approximation.
") MaxSegment;
		Standard_Integer MaxSegment();

		/****** AppDef_Variational::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations used in the approximation.
") NbIterations;
		Standard_Integer NbIterations();

		/****** AppDef_Variational::Parameters ******/
		/****** md5 signature: 7527b844d237672b1654e0e34e57815c ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
returns the parameters uses to the approximations.
") Parameters;
		const opencascade::handle<TColStd_HArray1OfReal> & Parameters();

		/****** AppDef_Variational::QuadraticError ******/
		/****** md5 signature: 4966a1d89bf85fe81f2bcefbdff19919 ******/
		%feature("compactdefaultargs") QuadraticError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the quadratic average of the distances between the points of the multiline and the approximation curves.
") QuadraticError;
		Standard_Real QuadraticError();

		/****** AppDef_Variational::SetConstraints ******/
		/****** md5 signature: cc790287f6182849f720a3c5328f25b7 ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
aConstrainst: AppParCurves_HArray1OfConstraintCouple

Return
-------
bool

Description
-----------
Define the constraints to approximate If this value is incompatible with the others fields this method modify nothing and returns false.
") SetConstraints;
		Standard_Boolean SetConstraints(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & aConstrainst);

		/****** AppDef_Variational::SetContinuity ******/
		/****** md5 signature: f974005f1ed42db31f2565c8a366cbbe ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
bool

Description
-----------
Define the Continuity used in the approximation If this value is incompatible with the others fields this method modify nothing and returns false.
") SetContinuity;
		Standard_Boolean SetContinuity(const GeomAbs_Shape C);

		/****** AppDef_Variational::SetCriteriumWeight ******/
		/****** md5 signature: 168b9075f5e06eafee2d48483e8549b2 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
Percent1: float
Percent2: float
Percent3: float

Return
-------
None

Description
-----------
define the Weights (as percent) associed to the criterium used in the optimization. //! if Percent <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real Percent1, const Standard_Real Percent2, const Standard_Real Percent3);

		/****** AppDef_Variational::SetCriteriumWeight ******/
		/****** md5 signature: 953a9a555201757eb4d851ed7bafb979 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
Order: int
Percent: float

Return
-------
None

Description
-----------
define the Weight (as percent) associed to the criterium Order used in the optimization: Others weights are updated. if Percent < 0 if Order < 1 or Order > 3.
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Integer Order, const Standard_Real Percent);

		/****** AppDef_Variational::SetKnots ******/
		/****** md5 signature: e8661b15a04d92d82b8a0d602a32994c ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
knots: TColStd_HArray1OfReal

Return
-------
bool

Description
-----------
Defines the knots used by the approximations If this value is incompatible with the others fields this method modify nothing and returns false.
") SetKnots;
		Standard_Boolean SetKnots(const opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****** AppDef_Variational::SetMaxDegree ******/
		/****** md5 signature: fca035c6d3f4efa993181625249e062c ******/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "
Parameters
----------
Degree: int

Return
-------
bool

Description
-----------
Define the Maximum Degree used in the approximation If this value is incompatible with the others fields this method modify nothing and returns false.
") SetMaxDegree;
		Standard_Boolean SetMaxDegree(const Standard_Integer Degree);

		/****** AppDef_Variational::SetMaxSegment ******/
		/****** md5 signature: a24ae9d7cd32cbd6c0a12b78e2965cbf ******/
		%feature("compactdefaultargs") SetMaxSegment;
		%feature("autodoc", "
Parameters
----------
NbSegment: int

Return
-------
bool

Description
-----------
Define the maximum number of segments used in the approximation If this value is incompatible with the others fields this method modify nothing and returns false.
") SetMaxSegment;
		Standard_Boolean SetMaxSegment(const Standard_Integer NbSegment);

		/****** AppDef_Variational::SetNbIterations ******/
		/****** md5 signature: 3ae76dd00e47cee8353c15b0f4494e29 ******/
		%feature("compactdefaultargs") SetNbIterations;
		%feature("autodoc", "
Parameters
----------
Iter: int

Return
-------
None

Description
-----------
define the number of iterations used in the approximation. if Iter < 1.
") SetNbIterations;
		void SetNbIterations(const Standard_Integer Iter);

		/****** AppDef_Variational::SetParameters ******/
		/****** md5 signature: 98407971ef258f529d76e2dc1e8651b1 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
param: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Defines the parameters used by the approximations.
") SetParameters;
		void SetParameters(const opencascade::handle<TColStd_HArray1OfReal> & param);

		/****** AppDef_Variational::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
define the tolerance used in the approximation.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** AppDef_Variational::SetWithCutting ******/
		/****** md5 signature: 02d0c9b4b956a64bc1920736b5081e0f ******/
		%feature("compactdefaultargs") SetWithCutting;
		%feature("autodoc", "
Parameters
----------
Cutting: bool

Return
-------
bool

Description
-----------
Define if the approximation can insert new Knots or not. If this value is incompatible with the others fields this method modify nothing and returns false.
") SetWithCutting;
		Standard_Boolean SetWithCutting(const Standard_Boolean Cutting);

		/****** AppDef_Variational::SetWithMinMax ******/
		/****** md5 signature: 1b54e87ae81f0f7a5b31ba668276567f ******/
		%feature("compactdefaultargs") SetWithMinMax;
		%feature("autodoc", "
Parameters
----------
MinMax: bool

Return
-------
None

Description
-----------
Define if the approximation search to minimize the maximum Error or not.
") SetWithMinMax;
		void SetWithMinMax(const Standard_Boolean MinMax);

		/****** AppDef_Variational::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the tolerance used in the approximation.
") Tolerance;
		Standard_Real Tolerance();

		/****** AppDef_Variational::Value ******/
		/****** md5 signature: 35d2ee100f1a9fc11f00b074d7d3553e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
returns all the BSpline curves approximating the MultiLine from AppDef SSP after minimization of the parameter.
") Value;
		AppParCurves_MultiBSpCurve Value();

		/****** AppDef_Variational::WithCutting ******/
		/****** md5 signature: d1aad1460fd0343f58333133d5abda17 ******/
		%feature("compactdefaultargs") WithCutting;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if the approximation can insert new Knots or not.
") WithCutting;
		Standard_Boolean WithCutting();

		/****** AppDef_Variational::WithMinMax ******/
		/****** md5 signature: 4a834814fd8ebdf3109c458400dbeda7 ******/
		%feature("compactdefaultargs") WithMinMax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if the approximation search to minimize the maximum Error or not.
") WithMinMax;
		Standard_Boolean WithMinMax();

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
		/****** AppDef_LinearCriteria::AppDef_LinearCriteria ******/
		/****** md5 signature: 7971c8c3b54afa7d1e4ec19e4b96b14a ******/
		%feature("compactdefaultargs") AppDef_LinearCriteria;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int

Return
-------
None

Description
-----------
No available documentation.
") AppDef_LinearCriteria;
		 AppDef_LinearCriteria(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint);

		/****** AppDef_LinearCriteria::AssemblyTable ******/
		/****** md5 signature: bfa501d807c9eb758d31854422707098 ******/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "Return
-------
opencascade::handle<FEmTool_HAssemblyTable>

Description
-----------
No available documentation.
") AssemblyTable;
		opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable();

		/****** AppDef_LinearCriteria::DependenceTable ******/
		/****** md5 signature: 74ba8d8ba6ec3333e18c69c449d161a3 ******/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
No available documentation.
") DependenceTable;
		opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****** AppDef_LinearCriteria::ErrorValues ******/
		/****** md5 signature: a777f9d4f93c8023ace5e9d0026ef74c ******/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
MaxError: float
QuadraticError: float
AverageError: float

Description
-----------
No available documentation.
") ErrorValues;
		void ErrorValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);


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
		/****** AppDef_LinearCriteria::GetCurve ******/
		/****** md5 signature: cd8e9b34a7462f6d0e280ba39eb7013b ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "
Parameters
----------
C: FEmTool_Curve

Return
-------
None

Description
-----------
No available documentation.
") GetCurve;
		void GetCurve(opencascade::handle<FEmTool_Curve> & C);

		/****** AppDef_LinearCriteria::GetEstimation ******/
		/****** md5 signature: c203dc9f9f35d061778069cc5bca8cde ******/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", "
Parameters
----------

Return
-------
E1: float
E2: float
E3: float

Description
-----------
No available documentation.
") GetEstimation;
		void GetEstimation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_LinearCriteria::GetWeight ******/
		/****** md5 signature: 20228a28f0bf77c9b8a22ba4a2c3775a ******/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
QuadraticWeight: float
QualityWeight: float

Description
-----------
No available documentation.
") GetWeight;
		void GetWeight(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_LinearCriteria::Gradient ******/
		/****** md5 signature: 321bc1515ee5e590e26f19411e445e89 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Element: int
Dimension: int
G: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") Gradient;
		void Gradient(const Standard_Integer Element, const Standard_Integer Dimension, math_Vector & G);

		/****** AppDef_LinearCriteria::Hessian ******/
		/****** md5 signature: 8b40c8291caedf88a740760d60139e94 ******/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "
Parameters
----------
Element: int
Dimension1: int
Dimension2: int
H: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Hessian;
		void Hessian(const Standard_Integer Element, const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****** AppDef_LinearCriteria::InputVector ******/
		/****** md5 signature: 9fc6c35d42441a4e3e3012543ade00f3 ******/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
AssTable: FEmTool_HAssemblyTable

Return
-------
None

Description
-----------
Convert the assembly Vector in an Curve;.
") InputVector;
		void InputVector(const math_Vector & X, const opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****** AppDef_LinearCriteria::QualityValues ******/
		/****** md5 signature: 827da749488066754087e937754eac94 ******/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", "
Parameters
----------
J1min: float
J2min: float
J3min: float

Return
-------
J1: float
J2: float
J3: float

Description
-----------
No available documentation.
") QualityValues;
		Standard_Integer QualityValues(const Standard_Real J1min, const Standard_Real J2min, const Standard_Real J3min, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_LinearCriteria::SetCurve ******/
		/****** md5 signature: 04239691cf498ce7af97807decd2562a ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: FEmTool_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const opencascade::handle<FEmTool_Curve> & C);

		/****** AppDef_LinearCriteria::SetEstimation ******/
		/****** md5 signature: 7e003424ca19f8200aab6824d74b9d27 ******/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", "
Parameters
----------
E1: float
E2: float
E3: float

Return
-------
None

Description
-----------
No available documentation.
") SetEstimation;
		void SetEstimation(const Standard_Real E1, const Standard_Real E2, const Standard_Real E3);

		/****** AppDef_LinearCriteria::SetParameters ******/
		/****** md5 signature: 5a4d4d2d682d53038fd9018938ef98a7 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
Parameters: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetParameters;
		void SetParameters(const opencascade::handle<TColStd_HArray1OfReal> & Parameters);

		/****** AppDef_LinearCriteria::SetWeight ******/
		/****** md5 signature: 8783a77241be255334f6fe96a205454d ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
QuadraticWeight: float
QualityWeight: float
percentJ1: float
percentJ2: float
percentJ3: float

Return
-------
None

Description
-----------
No available documentation.
") SetWeight;
		void SetWeight(const Standard_Real QuadraticWeight, const Standard_Real QualityWeight, const Standard_Real percentJ1, const Standard_Real percentJ2, const Standard_Real percentJ3);

		/****** AppDef_LinearCriteria::SetWeight ******/
		/****** md5 signature: e02860ae1c35c7abb2994c7477ce803e ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Weight: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeight;
		void SetWeight(const TColStd_Array1OfReal & Weight);

};


%make_alias(AppDef_LinearCriteria)

%extend AppDef_LinearCriteria {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class AppDef_HArray1OfMultiPointConstraint : public AppDef_Array1OfMultiPointConstraint, public Standard_Transient {
  public:
    AppDef_HArray1OfMultiPointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppDef_HArray1OfMultiPointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper, const AppDef_Array1OfMultiPointConstraint::value_type& theValue);
    AppDef_HArray1OfMultiPointConstraint(const AppDef_Array1OfMultiPointConstraint& theOther);
    const AppDef_Array1OfMultiPointConstraint& Array1();
    AppDef_Array1OfMultiPointConstraint& ChangeArray1();
};
%make_alias(AppDef_HArray1OfMultiPointConstraint)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def AppDef_MyLineTool_Curvature(*args):
	return AppDef_MyLineTool.Curvature(*args)

@deprecated
def AppDef_MyLineTool_Curvature(*args):
	return AppDef_MyLineTool.Curvature(*args)

@deprecated
def AppDef_MyLineTool_Curvature(*args):
	return AppDef_MyLineTool.Curvature(*args)

@deprecated
def AppDef_MyLineTool_FirstPoint(*args):
	return AppDef_MyLineTool.FirstPoint(*args)

@deprecated
def AppDef_MyLineTool_LastPoint(*args):
	return AppDef_MyLineTool.LastPoint(*args)

@deprecated
def AppDef_MyLineTool_MakeMLBetween(*args):
	return AppDef_MyLineTool.MakeMLBetween(*args)

@deprecated
def AppDef_MyLineTool_MakeMLOneMorePoint(*args):
	return AppDef_MyLineTool.MakeMLOneMorePoint(*args)

@deprecated
def AppDef_MyLineTool_NbP2d(*args):
	return AppDef_MyLineTool.NbP2d(*args)

@deprecated
def AppDef_MyLineTool_NbP3d(*args):
	return AppDef_MyLineTool.NbP3d(*args)

@deprecated
def AppDef_MyLineTool_Tangency(*args):
	return AppDef_MyLineTool.Tangency(*args)

@deprecated
def AppDef_MyLineTool_Tangency(*args):
	return AppDef_MyLineTool.Tangency(*args)

@deprecated
def AppDef_MyLineTool_Tangency(*args):
	return AppDef_MyLineTool.Tangency(*args)

@deprecated
def AppDef_MyLineTool_Value(*args):
	return AppDef_MyLineTool.Value(*args)

@deprecated
def AppDef_MyLineTool_Value(*args):
	return AppDef_MyLineTool.Value(*args)

@deprecated
def AppDef_MyLineTool_Value(*args):
	return AppDef_MyLineTool.Value(*args)

@deprecated
def AppDef_MyLineTool_WhatStatus(*args):
	return AppDef_MyLineTool.WhatStatus(*args)

}
