/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_appdef.html"
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
#include<TColStd_module.hxx>
#include<AppParCurves_module.hxx>
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
%import TColStd.i
%import AppParCurves.i
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
/* end handles declaration */

/* templates */
%template(AppDef_Array1OfMultiPointConstraint) NCollection_Array1<AppDef_MultiPointConstraint>;
Array1ExtendIter(AppDef_MultiPointConstraint)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<AppDef_MultiPointConstraint> AppDef_Array1OfMultiPointConstraint;
typedef NCollection_HArray1<AppDef_MultiPointConstraint> AppDef_HArray1OfMultiPointConstraint;
/* end typedefs declaration */

/****************************************************************
* class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute *
****************************************************************/
class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute : public math_BFGS {
	public:
		/****** AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute::AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 160e3d2cf3e07f5cb82687a648feaeca ******/
		%feature("compactdefaultargs") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: double
Tolerance2d: double
Eps: double
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute::IsSolutionReached ******/
		/****** md5 signature: c3201b5ad767b155f93f678a804b03f2 ******/
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
		bool IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** md5 signature: 46f0cb81181dbec5c711f55a53bfe575 ******/
		%feature("compactdefaultargs") AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
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
		 AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int NbPol);

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
		/****** md5 signature: 057333c63ab7a88a7371420a6c1219ea ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
double

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		double Error(const int IPoint, const int CurveIndex);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::FirstConstraint ******/
		/****** md5 signature: c886a69eb1732317ef08f04814939449 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int FirstPoint);

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
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

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
		/****** md5 signature: dab38d5cd2339455e93aa086852b5786 ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int LastPoint);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiBSpCurve.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiBSpCurve.
") MaxError3d;
		double MaxError3d();

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 8a02004afa2285e14e86881b7aa525ba ******/
		%feature("compactdefaultargs") SetFirstLambda;
		%feature("autodoc", "
Parameters
----------
l1: double

Return
-------
None

Description
-----------
No available documentation.
") SetFirstLambda;
		void SetFirstLambda(const double l1);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::SetLastLambda ******/
		/****** md5 signature: 65f6e83eec34c36c73c315c1a577bc1d ******/
		%feature("compactdefaultargs") SetLastLambda;
		%feature("autodoc", "
Parameters
----------
l2: double

Return
-------
None

Description
-----------
No available documentation.
") SetLastLambda;
		void SetLastLambda(const double l2);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::Value ******/
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: d07ab42822f64591c026e65dfde0b8ec ******/
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
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: aff654c5d5e20df0872f5c840bfacd78 ******/
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
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: f0d82dddd3d6a74a469fdb08dde1dbf2 ******/
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
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: fc5a9a692adf1b92d3cab926eac83e1d ******/
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
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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
		/****** md5 signature: 0a258e6832ff5fe8779c9e630282787a ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::ErrorGradient ******/
		/****** md5 signature: fc5a593b6fdfd1a7e10a6c72203888b0 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::FirstLambda ******/
		/****** md5 signature: 2d2b5f578dd8ef8d2cf33a7ce0a2ff85 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		double FirstLambda();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6bf1023b4898e81b52c32d9dde27c0f6 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		double LastLambda();

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
		/****** md5 signature: aa56ee2115a94d6af094bf8d4883e10a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const double l1, const double l2);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Perform ******/
		/****** md5 signature: 39c3fc9e00f038c06afb8734c658c413 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const double l1, const double l2);

		/****** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute::Perform ******/
		/****** md5 signature: d177c6fdf0aea693a3c72ad74045f683 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const double l1, const double l2);

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
		/****** md5 signature: 4bda3cbcece1ec4fb0d707fabefa3dc9 ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-3)
Tolerance2d: double (optional, default to 1.0e-6)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all. //! The multiplicities of the internal knots is set by default.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const AppDef_MultiLine & Line, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-3, const double Tolerance2d = 1.0e-6, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** AppDef_BSplineCompute::AppDef_BSplineCompute ******/
		/****** md5 signature: 75056b22b6899a3b8da216b8a1fdf7ed ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const AppDef_MultiLine & Line, const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** AppDef_BSplineCompute::AppDef_BSplineCompute ******/
		/****** md5 signature: 73c9d6228dd29b99b4e8c2504e853d01 ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** AppDef_BSplineCompute::AppDef_BSplineCompute ******/
		/****** md5 signature: d27628a4ecadc0dbe5c6d2ee22dc63d9 ******/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

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
		/****** md5 signature: d18fc3b040904ba6fc435937dfbd0183 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
tol3d: double
tol2d: double

Description
-----------
returns the tolerances 2d and 3d of the MultiBSpCurve.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_BSplineCompute::Init ******/
		/****** md5 signature: bcc8d8f763165c6be0dc6db1f9ef3667 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Init;
		void Init(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

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
		/****** md5 signature: 097042183394c222ee066430113409dd ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		bool IsAllApproximated();

		/****** AppDef_BSplineCompute::IsToleranceReached ******/
		/****** md5 signature: e68ff79913f1e1cb017e363f76fc9fc2 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		bool IsToleranceReached();

		/****** AppDef_BSplineCompute::Parameters ******/
		/****** md5 signature: 5c6424b3748c0fbf869b54f8e752f065 ******/
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
		/****** md5 signature: 2102c15e2e15905eb62da01cecb4ac7e ******/
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
		void SetContinuity(const int C);

		/****** AppDef_BSplineCompute::SetDegrees ******/
		/****** md5 signature: 83fc53ce842bc5ef5957903d76f43a4a ******/
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
		void SetDegrees(const int degreemin, const int degreemax);

		/****** AppDef_BSplineCompute::SetKnots ******/
		/****** md5 signature: 9146a7361df1fcecac0514aafcbcc2e8 ******/
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
		/****** md5 signature: 2bee60c8ad635ef591f756f28601492a ******/
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
		/****** md5 signature: 718ea83d411af3da01e7d7d1d2ed1779 ******/
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
Sets periodic flag. If thePeriodic = true, algorithm tries to build periodic multicurve using corresponding C1 boundary condition for first and last multipoints. Multiline must be closed.
") SetPeriodic;
		void SetPeriodic(const bool thePeriodic);

		/****** AppDef_BSplineCompute::SetTolerances ******/
		/****** md5 signature: 26249a86974aa99769435e28e43c6d33 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: double
Tolerance2d: double

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const double Tolerance3d, const double Tolerance2d);

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
		/****** md5 signature: bd99029639a3a5091fd0052f97392b7e ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-3)
Tolerance2d: double (optional, default to 1.0e-6)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
") AppDef_Compute;
		 AppDef_Compute(const AppDef_MultiLine & Line, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-3, const double Tolerance2d = 1.0e-6, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** AppDef_Compute::AppDef_Compute ******/
		/****** md5 signature: cc39eacb79f85141e791d90ef82b7ca7 ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
Line: AppDef_MultiLine
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True. If <Squares> is True, the computation will be done with no iteration at all.
") AppDef_Compute;
		 AppDef_Compute(const AppDef_MultiLine & Line, const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** AppDef_Compute::AppDef_Compute ******/
		/****** md5 signature: 4536d58e6147906bd02fcc46e174a375 ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_Compute;
		 AppDef_Compute(const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** AppDef_Compute::AppDef_Compute ******/
		/****** md5 signature: a329096fde768c8bf36520b6853a230a ******/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") AppDef_Compute;
		 AppDef_Compute(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** AppDef_Compute::ChangeValue ******/
		/****** md5 signature: f3fa0af427f9f8c0bbdc2e7a6b2416fb ******/
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
		AppParCurves_MultiCurve & ChangeValue(const int Index = 1);

		/****** AppDef_Compute::Error ******/
		/****** md5 signature: 16248cd92a25264d4b1676fa28492d15 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: double
tol2d: double

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_Compute::Init ******/
		/****** md5 signature: bcc8d8f763165c6be0dc6db1f9ef3667 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 4)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-03)
Tolerance2d: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 5)
cutting: bool (optional, default to true)
parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)
Squares: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Init;
		void Init(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** AppDef_Compute::IsAllApproximated ******/
		/****** md5 signature: 097042183394c222ee066430113409dd ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		bool IsAllApproximated();

		/****** AppDef_Compute::IsToleranceReached ******/
		/****** md5 signature: e68ff79913f1e1cb017e363f76fc9fc2 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		bool IsToleranceReached();

		/****** AppDef_Compute::NbMultiCurves ******/
		/****** md5 signature: eed274d77446bf2416a954e7f34c2bf0 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		int NbMultiCurves();

		/****** AppDef_Compute::Parameters ******/
		/****** md5 signature: 5292a6899dfaa94242ecae6a511c8cc3 ******/
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
		const TColStd_Array1OfReal & Parameters(const int Index = 1);

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
		/****** md5 signature: 83fc53ce842bc5ef5957903d76f43a4a ******/
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
		void SetDegrees(const int degreemin, const int degreemax);

		/****** AppDef_Compute::SetTolerances ******/
		/****** md5 signature: 26249a86974aa99769435e28e43c6d33 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: double
Tolerance2d: double

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const double Tolerance3d, const double Tolerance2d);

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
		/****** md5 signature: 0d67f6100bd40a78330bbdbe083cad77 ******/
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
		AppParCurves_MultiCurve Value(const int Index = 1);

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
		/****** md5 signature: ce8050352470fd3407b3fec47fe9cc28 ******/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: double
Tolerance2d: double
Eps: double
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_Gradient_BFGSOfMyGradientOfCompute;
		 AppDef_Gradient_BFGSOfMyGradientOfCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** AppDef_Gradient_BFGSOfMyGradientOfCompute::IsSolutionReached ******/
		/****** md5 signature: c3201b5ad767b155f93f678a804b03f2 ******/
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
		bool IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** md5 signature: b1c064c7d8a238984e92434a26be5d91 ******/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: double
Tolerance2d: double
Eps: double
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
		 AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute::IsSolutionReached ******/
		/****** md5 signature: c3201b5ad767b155f93f678a804b03f2 ******/
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
		bool IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** md5 signature: cfda5b6291fc3222a257374f644ebd0b ******/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfTheGradient;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: double
Tolerance2d: double
Eps: double
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
No available documentation.
") AppDef_Gradient_BFGSOfTheGradient;
		 AppDef_Gradient_BFGSOfTheGradient(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** AppDef_Gradient_BFGSOfTheGradient::IsSolutionReached ******/
		/****** md5 signature: c3201b5ad767b155f93f678a804b03f2 ******/
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
		bool IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** md5 signature: 60d002082c151075a1baa2b0303e8912 ******/
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
given the number NbMult of MultiPointConstraints of this MultiLine, it initializes all the fields.SetValue must be called in order for the values of the multipoint constraint to be taken into account. An exception is raised if NbMult < 0.
") AppDef_MultiLine;
		 AppDef_MultiLine(const int NbMult);

		/****** AppDef_MultiLine::AppDef_MultiLine ******/
		/****** md5 signature: 748b5587abd9f7648517c20c1906f001 ******/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "
Parameters
----------
tabMultiP: NCollection_Array1<AppDef_MultiPointConstraint>

Return
-------
None

Description
-----------
Constructs a MultiLine with an array of MultiPointConstraints.
") AppDef_MultiLine;
		 AppDef_MultiLine(const NCollection_Array1<AppDef_MultiPointConstraint> & tabMultiP);

		/****** AppDef_MultiLine::AppDef_MultiLine ******/
		/****** md5 signature: 0232ebf1fe4fd3ecd637546ad63db3c8 ******/
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
		/****** md5 signature: 37911cb82a6188fc1c098dca26ce4e1b ******/
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
		/****** md5 signature: e4a6c2d455990c86e4dd036e66d396cf ******/
		%feature("compactdefaultargs") NbMultiPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of MultiPointConstraints of the MultiLine.
") NbMultiPoints;
		int NbMultiPoints();

		/****** AppDef_MultiLine::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of Points from MultiPoints composing the MultiLine.
") NbPoints;
		int NbPoints();

		/****** AppDef_MultiLine::SetValue ******/
		/****** md5 signature: b6edb95cebcee9d64d37d61bbb3b75d9 ******/
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
		void SetValue(const int Index, const AppDef_MultiPointConstraint & MPoint);

		/****** AppDef_MultiLine::Value ******/
		/****** md5 signature: f2830f16a110be4cb7ee59a76a9cbbfc ******/
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
		AppDef_MultiPointConstraint Value(const int Index);

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
		/****** md5 signature: 0dfe03cdacb01a7e144131c49de5b6be ******/
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
		 AppDef_MultiPointConstraint(const int NbPoints, const int NbPoints2d);

		/****** AppDef_MultiPointConstraint::AppDef_MultiPointConstraint ******/
		/****** md5 signature: 7f48054d42b11d64316d4d0fc8e936bf ******/
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
		/****** md5 signature: 85b9c0777fba92b2336463606627950c ******/
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
		/****** md5 signature: 93ede81ccd009aaf812ab03e48d4d128 ******/
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
		/****** md5 signature: 13263e78d28f8b1e6cf04a44994bd955 ******/
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
		/****** md5 signature: 43de111c37d1be508a23cf0fcf5f2848 ******/
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
		/****** md5 signature: 2d437e4d54a742b673cfa8f3fe63225e ******/
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
		/****** md5 signature: e79a8970b885dd146e88e1cee67d70f1 ******/
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
		/****** md5 signature: 1e8f17c77166f0acb12c7fe5da14cf6c ******/
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
		/****** md5 signature: f4666f238c85f5a748502dbed468d937 ******/
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
		/****** md5 signature: 98c2aea23ce76323bc95a990ab1e2430 ******/
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
		gp_Vec Curv(const int Index);

		/****** AppDef_MultiPointConstraint::Curv2d ******/
		/****** md5 signature: 6b0f7e153c941f8e7ccfb48572dbc7b7 ******/
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
		gp_Vec2d Curv2d(const int Index);

		/****** AppDef_MultiPointConstraint::Dump ******/
		/****** md5 signature: 3c2a1f639f47eaff57a9bcd4d3fb612a ******/
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

		/****** AppDef_MultiPointConstraint::IsCurvaturePoint ******/
		/****** md5 signature: f7ef281e37c70128a83a41671bed0465 ******/
		%feature("compactdefaultargs") IsCurvaturePoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the MultiPoint has a curvature value.
") IsCurvaturePoint;
		bool IsCurvaturePoint();

		/****** AppDef_MultiPointConstraint::IsTangencyPoint ******/
		/****** md5 signature: 5fdbbb5c5371416b1705c6e1255262ea ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the MultiPoint has a tangency value.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** AppDef_MultiPointConstraint::SetCurv ******/
		/****** md5 signature: 0a887fb021ab40d0467c2e219b4afbbe ******/
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
		void SetCurv(const int Index, const gp_Vec & Curv);

		/****** AppDef_MultiPointConstraint::SetCurv2d ******/
		/****** md5 signature: 53674bec6faa1427f0ba0b494ee48951 ******/
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
		void SetCurv2d(const int Index, const gp_Vec2d & Curv2d);

		/****** AppDef_MultiPointConstraint::SetTang ******/
		/****** md5 signature: 06b217a32f8cfd48bc8af85ceec399c6 ******/
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
		void SetTang(const int Index, const gp_Vec & Tang);

		/****** AppDef_MultiPointConstraint::SetTang2d ******/
		/****** md5 signature: 6020ed438a4c64b9fa96d1145c2903bc ******/
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
		void SetTang2d(const int Index, const gp_Vec2d & Tang2d);

		/****** AppDef_MultiPointConstraint::Tang ******/
		/****** md5 signature: 67e7fdd0d378023bc7e6e89cc2a5ad53 ******/
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
		gp_Vec Tang(const int Index);

		/****** AppDef_MultiPointConstraint::Tang2d ******/
		/****** md5 signature: bb8d23e5ce22f1b983af29ad6d632779 ******/
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
		gp_Vec2d Tang2d(const int Index);

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
		/****** md5 signature: dfa506f827bd1402aa4d829683e000d8 ******/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Deg: int
Tol3d: double
Tol2d: double
NbIterations: int (optional, default to 1)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 1);

		/****** AppDef_MyBSplGradientOfBSplineCompute::AppDef_MyBSplGradientOfBSplineCompute ******/
		/****** md5 signature: 12544a653fea7f3473e8e8cc600226a0 ******/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Deg: int
Tol3d: double
Tol2d: double
NbIterations: int
lambda1: double
lambda2: double

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating BSpline curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations, const double lambda1, const double lambda2);

		/****** AppDef_MyBSplGradientOfBSplineCompute::AverageError ******/
		/****** md5 signature: 85ff9e1a5f7944ea296ab9fed61363d6 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		double AverageError();

		/****** AppDef_MyBSplGradientOfBSplineCompute::Error ******/
		/****** md5 signature: c628b3b203a1892c8da513c71806727d ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		double Error(const int Index);

		/****** AppDef_MyBSplGradientOfBSplineCompute::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

		/****** AppDef_MyBSplGradientOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_MyBSplGradientOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		double MaxError3d();

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
		/****** md5 signature: 3c508afbde9dae85bc7fa2d464f9b7ea ******/
		%feature("compactdefaultargs") AppDef_MyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Deg: int
Tol3d: double
Tol2d: double
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyGradientOfCompute;
		 AppDef_MyGradientOfCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 200);

		/****** AppDef_MyGradientOfCompute::AverageError ******/
		/****** md5 signature: 85ff9e1a5f7944ea296ab9fed61363d6 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		double AverageError();

		/****** AppDef_MyGradientOfCompute::Error ******/
		/****** md5 signature: c628b3b203a1892c8da513c71806727d ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		double Error(const int Index);

		/****** AppDef_MyGradientOfCompute::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

		/****** AppDef_MyGradientOfCompute::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_MyGradientOfCompute::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		double MaxError3d();

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
		/****** md5 signature: f052b74f5c85089357c1d0c2ba9181f1 ******/
		%feature("compactdefaultargs") AppDef_MyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Deg: int
Tol3d: double
Tol2d: double
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_MyGradientbisOfBSplineCompute;
		 AppDef_MyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 200);

		/****** AppDef_MyGradientbisOfBSplineCompute::AverageError ******/
		/****** md5 signature: 85ff9e1a5f7944ea296ab9fed61363d6 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		double AverageError();

		/****** AppDef_MyGradientbisOfBSplineCompute::Error ******/
		/****** md5 signature: c628b3b203a1892c8da513c71806727d ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		double Error(const int Index);

		/****** AppDef_MyGradientbisOfBSplineCompute::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

		/****** AppDef_MyGradientbisOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_MyGradientbisOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		double MaxError3d();

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
		/****** md5 signature: d10f49881cc09b400dbd2bcd8a2be630 ******/
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
		static bool Curvature(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfVec & tabV);

		/****** AppDef_MyLineTool::Curvature ******/
		/****** md5 signature: 71a3a79a422bd48c20744b4ca9d56457 ******/
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
		static bool Curvature(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::Curvature ******/
		/****** md5 signature: b39cb6de9ec43ea36e5a9b4e2f7913a1 ******/
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
		static bool Curvature(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::FirstPoint ******/
		/****** md5 signature: 8ea1ea611cdf9433a5fd11f910208664 ******/
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
		static int FirstPoint(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::LastPoint ******/
		/****** md5 signature: 3857fbe8c85130b6033a2a1faf1885c3 ******/
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
		static int LastPoint(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::MakeMLBetween ******/
		/****** md5 signature: 63bb75d619f5f5db00e07034a8995966 ******/
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
		static AppDef_MultiLine MakeMLBetween(const AppDef_MultiLine & ML, const int I1, const int I2, const int NbPMin);

		/****** AppDef_MyLineTool::MakeMLOneMorePoint ******/
		/****** md5 signature: bc9c751f094e47e7682653348afcf2a3 ******/
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
		static bool MakeMLOneMorePoint(const AppDef_MultiLine & ML, const int I1, const int I2, const int indbad, AppDef_MultiLine & OtherLine);

		/****** AppDef_MyLineTool::NbP2d ******/
		/****** md5 signature: fa3b75faee6b6cbee9356c09c672b7d6 ******/
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
		static int NbP2d(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::NbP3d ******/
		/****** md5 signature: 0f8a5c01498a2a52c14d7200881aaf1a ******/
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
		static int NbP3d(const AppDef_MultiLine & ML);

		/****** AppDef_MyLineTool::Tangency ******/
		/****** md5 signature: d73cd5b70950d80d561ffebe75777d20 ******/
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
		static bool Tangency(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfVec & tabV);

		/****** AppDef_MyLineTool::Tangency ******/
		/****** md5 signature: 382e44873cafba4a5cae55f90ccb3dc7 ******/
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
		static bool Tangency(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::Tangency ******/
		/****** md5 signature: 84a6fc57170a008105c1a3448f52ae62 ******/
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
		static bool Tangency(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** AppDef_MyLineTool::Value ******/
		/****** md5 signature: 8382ef53bd7bde8830094b722740fc82 ******/
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
		static void Value(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** AppDef_MyLineTool::Value ******/
		/****** md5 signature: bd967a6b2fe20dd967a05a8f15b3805d ******/
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
		static void Value(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** AppDef_MyLineTool::Value ******/
		/****** md5 signature: ca4ed29237799e7fcbcf0185f363c01d ******/
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
		static void Value(const AppDef_MultiLine & ML, const int MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** AppDef_MyLineTool::WhatStatus ******/
		/****** md5 signature: 325e3979ee95cd6d1ca790d9d041c543 ******/
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
		static Approx_Status WhatStatus(const AppDef_MultiLine & ML, const int I1, const int I2);

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
		/****** md5 signature: 72ea8fe6e09157e48b46d4d113cd7e60 ******/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_ParFunctionOfMyGradientOfCompute;
		 AppDef_ParFunctionOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

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
		/****** md5 signature: 6082404cf8493e28701309c5d66645f2 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
double

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		double Error(const int IPoint, const int CurveIndex);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::FirstConstraint ******/
		/****** md5 signature: c886a69eb1732317ef08f04814939449 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int FirstPoint);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::Gradient ******/
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::LastConstraint ******/
		/****** md5 signature: dab38d5cd2339455e93aa086852b5786 ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int LastPoint);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_ParFunctionOfMyGradientOfCompute::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		double MaxError3d();

		/****** AppDef_ParFunctionOfMyGradientOfCompute::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_ParFunctionOfMyGradientOfCompute::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: e771a55bfee74be0cb860e2a2691c9bb ******/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		 AppDef_ParFunctionOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

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
		/****** md5 signature: 6082404cf8493e28701309c5d66645f2 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
double

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		double Error(const int IPoint, const int CurveIndex);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::FirstConstraint ******/
		/****** md5 signature: c886a69eb1732317ef08f04814939449 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int FirstPoint);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::Gradient ******/
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::LastConstraint ******/
		/****** md5 signature: dab38d5cd2339455e93aa086852b5786 ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int LastPoint);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		double MaxError3d();

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_ParFunctionOfMyGradientbisOfBSplineCompute::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: e81fc1a65cbf14a932e2628b2da743ac ******/
		%feature("compactdefaultargs") AppDef_ParFunctionOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_ParFunctionOfTheGradient;
		 AppDef_ParFunctionOfTheGradient(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

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
		/****** md5 signature: 6082404cf8493e28701309c5d66645f2 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
double

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		double Error(const int IPoint, const int CurveIndex);

		/****** AppDef_ParFunctionOfTheGradient::FirstConstraint ******/
		/****** md5 signature: c886a69eb1732317ef08f04814939449 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int FirstPoint);

		/****** AppDef_ParFunctionOfTheGradient::Gradient ******/
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_ParFunctionOfTheGradient::LastConstraint ******/
		/****** md5 signature: dab38d5cd2339455e93aa086852b5786 ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int LastPoint);

		/****** AppDef_ParFunctionOfTheGradient::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_ParFunctionOfTheGradient::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		double MaxError3d();

		/****** AppDef_ParFunctionOfTheGradient::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_ParFunctionOfTheGradient::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: 0f971c9b9d3cdccb87d608b4feaff83a ******/
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
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::AppDef_ParLeastSquareOfMyGradientOfCompute ******/
		/****** md5 signature: 35eddb6dddf12c22f54ea489e989598e ******/
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
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::AppDef_ParLeastSquareOfMyGradientOfCompute ******/
		/****** md5 signature: 16eda0d2e8b89f64a7658a1eca70a45b ******/
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
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::AppDef_ParLeastSquareOfMyGradientOfCompute ******/
		/****** md5 signature: 253674f411670f342105bab049b61905 ******/
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
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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
		/****** md5 signature: 0a258e6832ff5fe8779c9e630282787a ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::ErrorGradient ******/
		/****** md5 signature: fc5a593b6fdfd1a7e10a6c72203888b0 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::FirstLambda ******/
		/****** md5 signature: 2d2b5f578dd8ef8d2cf33a7ce0a2ff85 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		double FirstLambda();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6bf1023b4898e81b52c32d9dde27c0f6 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		double LastLambda();

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
		/****** md5 signature: aa56ee2115a94d6af094bf8d4883e10a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const double l1, const double l2);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Perform ******/
		/****** md5 signature: 39c3fc9e00f038c06afb8734c658c413 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const double l1, const double l2);

		/****** AppDef_ParLeastSquareOfMyGradientOfCompute::Perform ******/
		/****** md5 signature: d177c6fdf0aea693a3c72ad74045f683 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const double l1, const double l2);

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
		/****** md5 signature: 963b9ffb1149741127112aeedc8d6f3e ******/
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
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: fea8121f3ad0ab7100753e6258077cd3 ******/
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
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: 4b548aadb855e34c5dee8b024a67d010 ******/
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
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******/
		/****** md5 signature: b8f231499996bd7ab735ed78dcc02bee ******/
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
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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
		/****** md5 signature: 0a258e6832ff5fe8779c9e630282787a ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::ErrorGradient ******/
		/****** md5 signature: fc5a593b6fdfd1a7e10a6c72203888b0 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::FirstLambda ******/
		/****** md5 signature: 2d2b5f578dd8ef8d2cf33a7ce0a2ff85 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		double FirstLambda();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6bf1023b4898e81b52c32d9dde27c0f6 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		double LastLambda();

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
		/****** md5 signature: aa56ee2115a94d6af094bf8d4883e10a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const double l1, const double l2);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Perform ******/
		/****** md5 signature: 39c3fc9e00f038c06afb8734c658c413 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const double l1, const double l2);

		/****** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute::Perform ******/
		/****** md5 signature: d177c6fdf0aea693a3c72ad74045f683 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const double l1, const double l2);

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
		/****** md5 signature: afc43dd7f9173126ef1e630d2151cffb ******/
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
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_ParLeastSquareOfTheGradient::AppDef_ParLeastSquareOfTheGradient ******/
		/****** md5 signature: fd19e802da3e6c0a395f4cfce472f1a4 ******/
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
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** AppDef_ParLeastSquareOfTheGradient::AppDef_ParLeastSquareOfTheGradient ******/
		/****** md5 signature: 84517d8eda6bc2b068824004d1d0cd81 ******/
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
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_ParLeastSquareOfTheGradient::AppDef_ParLeastSquareOfTheGradient ******/
		/****** md5 signature: 1c0941d1ef4d4569327676fa9dfe9ddc ******/
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
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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
		/****** md5 signature: 0a258e6832ff5fe8779c9e630282787a ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfTheGradient::ErrorGradient ******/
		/****** md5 signature: fc5a593b6fdfd1a7e10a6c72203888b0 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_ParLeastSquareOfTheGradient::FirstLambda ******/
		/****** md5 signature: 2d2b5f578dd8ef8d2cf33a7ce0a2ff85 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		double FirstLambda();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6bf1023b4898e81b52c32d9dde27c0f6 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		double LastLambda();

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
		/****** md5 signature: aa56ee2115a94d6af094bf8d4883e10a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const double l1, const double l2);

		/****** AppDef_ParLeastSquareOfTheGradient::Perform ******/
		/****** md5 signature: 39c3fc9e00f038c06afb8734c658c413 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const double l1, const double l2);

		/****** AppDef_ParLeastSquareOfTheGradient::Perform ******/
		/****** md5 signature: d177c6fdf0aea693a3c72ad74045f683 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const double l1, const double l2);

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
		/****** md5 signature: 8e0824b35caf3216f77d57554e0bb6fb ******/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientOfCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_ResConstraintOfMyGradientOfCompute;
		 AppDef_ResConstraintOfMyGradientOfCompute(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** AppDef_ResConstraintOfMyGradientOfCompute::ConstraintDerivative ******/
		/****** md5 signature: 6624b247eb3c133ce83158af9b1d85f5 ******/
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
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: a4e7d45cfc247b02dabdeb4a2d291557 ******/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		 AppDef_ResConstraintOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute::ConstraintDerivative ******/
		/****** md5 signature: 6624b247eb3c133ce83158af9b1d85f5 ******/
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
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 2c724820a576333826948df1ab6308f9 ******/
		%feature("compactdefaultargs") AppDef_ResConstraintOfTheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_ResConstraintOfTheGradient;
		 AppDef_ResConstraintOfTheGradient(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** AppDef_ResConstraintOfTheGradient::ConstraintDerivative ******/
		/****** md5 signature: 6624b247eb3c133ce83158af9b1d85f5 ******/
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
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 1cd1339adcb33a680c689d1c50cf64e1 ******/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<opencascade::handle<TColStd_HArray1OfInteger>>>

Description
-----------
No available documentation.
") AssemblyTable;
		virtual opencascade::handle<NCollection_HArray2<opencascade::handle<TColStd_HArray1OfInteger>>> AssemblyTable();

		/****** AppDef_SmoothCriterion::Curve ******/
		/****** md5 signature: 34260c3f4bcd122867c9d1dc1941b3d3 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<FEmTool_Curve>

Description
-----------
Returns the curve associated with this criterion. 
Return: handle to the FEmTool curve.
") Curve;
		opencascade::handle<FEmTool_Curve> Curve();

		/****** AppDef_SmoothCriterion::DependenceTable ******/
		/****** md5 signature: b98b4cbca8e5ad30a49bc2fb63838c44 ******/
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
		/****** md5 signature: 15f25c8052e25ca6900e43860d8e531d ******/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
MaxError: double
QuadraticError: double
AverageError: double

Description
-----------
No available documentation.
") ErrorValues;
		virtual void ErrorValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_SmoothCriterion::EstLength ******/
		/****** md5 signature: 23c4a2189a07f7274e6d83dc4ccdc523 ******/
		%feature("compactdefaultargs") EstLength;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") EstLength;
		virtual double & EstLength();

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
		/****** md5 signature: 7c8374a9c4b077da000cf95350fb70a9 ******/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", "
Parameters
----------

Return
-------
E1: double
E2: double
E3: double

Description
-----------
No available documentation.
") GetEstimation;
		virtual void GetEstimation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_SmoothCriterion::GetWeight ******/
		/****** md5 signature: ee9c7662c8ca3e318b85034d22468814 ******/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
QuadraticWeight: double
QualityWeight: double

Description
-----------
No available documentation.
") GetWeight;
		virtual void GetWeight(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_SmoothCriterion::Gradient ******/
		/****** md5 signature: 5777c1c294ddf2f7716ec905306bf50e ******/
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
		virtual void Gradient(const int Element, const int Dimension, math_Vector & G);

		/****** AppDef_SmoothCriterion::Hessian ******/
		/****** md5 signature: 663ace8b96f535bed12730f0737358ec ******/
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
		virtual void Hessian(const int Element, const int Dimension1, const int Dimension2, math_Matrix & H);

		/****** AppDef_SmoothCriterion::InputVector ******/
		/****** md5 signature: 71965fed40efbc9beb6be6525b6f7946 ******/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
AssTable: NCollection_HArray2<

Return
-------
None

Description
-----------
Convert the assembly Vector in an Curve;.
") InputVector;
		virtual void InputVector(const math_Vector & X, const opencascade::handle<NCollection_HArray2<opencascade::handle<TColStd_HArray1OfInteger> >> & AssTable);

		/****** AppDef_SmoothCriterion::QualityValues ******/
		/****** md5 signature: fd589255f90b841bb0d700162f492aa1 ******/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", "
Parameters
----------
J1min: double
J2min: double
J3min: double

Return
-------
J1: double
J2: double
J3: double

Description
-----------
No available documentation.
") QualityValues;
		virtual int QualityValues(const double J1min, const double J2min, const double J3min, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 9d70708b996e534fbca7657f0c08cd3e ******/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", "
Parameters
----------
E1: double
E2: double
E3: double

Return
-------
None

Description
-----------
No available documentation.
") SetEstimation;
		virtual void SetEstimation(const double E1, const double E2, const double E3);

		/****** AppDef_SmoothCriterion::SetParameters ******/
		/****** md5 signature: aa1927b879dc52dbbabbc1b5f7c131ea ******/
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
		/****** md5 signature: 2aa3be64663887e2dbf83a45968c5163 ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
QuadraticWeight: double
QualityWeight: double
percentJ1: double
percentJ2: double
percentJ3: double

Return
-------
None

Description
-----------
No available documentation.
") SetWeight;
		virtual void SetWeight(const double QuadraticWeight, const double QualityWeight, const double percentJ1, const double percentJ2, const double percentJ3);

		/****** AppDef_SmoothCriterion::SetWeight ******/
		/****** md5 signature: 9f402ec78fd3b50cffb89e2cf1f9f738 ******/
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

		%extend{
			double GetEstLength() { return self->EstLength(); }
			void SetEstLength(double value) { self->EstLength() = value; }
		};
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
		/****** md5 signature: 7a73c108f8d5973c47cf318228bba613 ******/
		%feature("compactdefaultargs") AppDef_TheFunction;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Deg: int

Return
-------
None

Description
-----------
initializes the fields of the function. The approximating curve has the desired degree Deg.
") AppDef_TheFunction;
		 AppDef_TheFunction(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

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
		/****** md5 signature: 6082404cf8493e28701309c5d66645f2 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
IPoint: int
CurveIndex: int

Return
-------
double

Description
-----------
returns the distance between the MultiPoint of range IPoint and the curve CurveIndex.
") Error;
		double Error(const int IPoint, const int CurveIndex);

		/****** AppDef_TheFunction::FirstConstraint ******/
		/****** md5 signature: c886a69eb1732317ef08f04814939449 ******/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
FirstPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int FirstPoint);

		/****** AppDef_TheFunction::Gradient ******/
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** AppDef_TheFunction::LastConstraint ******/
		/****** md5 signature: dab38d5cd2339455e93aa086852b5786 ******/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "
Parameters
----------
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
LastPoint: int

Return
-------
AppParCurves_Constraint

Description
-----------
No available documentation.
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int LastPoint);

		/****** AppDef_TheFunction::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_TheFunction::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum distance between the points and the MultiCurve.
") MaxError3d;
		double MaxError3d();

		/****** AppDef_TheFunction::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function. It corresponds to the number of MultiPoints.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
this method computes the new approximation of the MultiLine SSP and calculates F = sum (||Pui - Bi*Pi||2) for each point of the MultiLine.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** AppDef_TheFunction::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
returns the value F=sum(||Pui - Bi*Pi||)2. returns the value G = grad(F) for the parameters Xi.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: 900085fb5ace62f52081aeaecf97f22b ******/
		%feature("compactdefaultargs") AppDef_TheGradient;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Parameters: math_Vector
Deg: int
Tol3d: double
Tol2d: double
NbIterations: int (optional, default to 200)

Return
-------
None

Description
-----------
Tries to minimize the sum (square(||Qui - Bi*Pi||)) where Pui describe the approximating Bezier curves'Poles and Qi the MultiLine points with a parameter ui. In this algorithm, the parameters ui are the unknowns. The tolerance required on this sum is given by Tol. The desired degree of the resulting curve is Deg.
") AppDef_TheGradient;
		 AppDef_TheGradient(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 200);

		/****** AppDef_TheGradient::AverageError ******/
		/****** md5 signature: 85ff9e1a5f7944ea296ab9fed61363d6 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the average error between the old and the new approximation.
") AverageError;
		double AverageError();

		/****** AppDef_TheGradient::Error ******/
		/****** md5 signature: c628b3b203a1892c8da513c71806727d ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the difference between the old and the new approximation. An exception is raised if NotDone. An exception is raised if Index<1 or Index>NbParameters.
") Error;
		double Error(const int Index);

		/****** AppDef_TheGradient::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

		/****** AppDef_TheGradient::MaxError2d ******/
		/****** md5 signature: e40f7393d6ea618082caa59e47fa5a95 ******/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError2d;
		double MaxError2d();

		/****** AppDef_TheGradient::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum difference between the old and the new approximation.
") MaxError3d;
		double MaxError3d();

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
		/****** md5 signature: 26dc5be5c4ce58421f2f5d85aaff15f0 ******/
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
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_TheLeastSquares::AppDef_TheLeastSquares ******/
		/****** md5 signature: 532ff3d053866f70af31e3d172091409 ******/
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
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** AppDef_TheLeastSquares::AppDef_TheLeastSquares ******/
		/****** md5 signature: 4125e26e7efc36c50b9e02555583192c ******/
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
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** AppDef_TheLeastSquares::AppDef_TheLeastSquares ******/
		/****** md5 signature: 77aa6ff3345f4a32d57c0a29fddd808e ******/
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
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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
		/****** md5 signature: 0a258e6832ff5fe8779c9e630282787a ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_TheLeastSquares::ErrorGradient ******/
		/****** md5 signature: fc5a593b6fdfd1a7e10a6c72203888b0 ******/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
returns the maximum errors between the MultiLine and the approximation curves. F is the sum of the square distances. Grad is the derivative vector of the function F.
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_TheLeastSquares::FirstLambda ******/
		/****** md5 signature: 2d2b5f578dd8ef8d2cf33a7ce0a2ff85 ******/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (P2 - P1)/ V1 if the first point was a tangency point.
") FirstLambda;
		double FirstLambda();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6bf1023b4898e81b52c32d9dde27c0f6 ******/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value (PN - PN-1)/ VN if the last point was a tangency point.
") LastLambda;
		double LastLambda();

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
		/****** md5 signature: aa56ee2115a94d6af094bf8d4883e10a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields.
") Perform;
		void Perform(const math_Vector & Parameters, const double l1, const double l2);

		/****** AppDef_TheLeastSquares::Perform ******/
		/****** md5 signature: 39c3fc9e00f038c06afb8734c658c413 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const double l1, const double l2);

		/****** AppDef_TheLeastSquares::Perform ******/
		/****** md5 signature: d177c6fdf0aea693a3c72ad74045f683 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: double
l2: double

Return
-------
None

Description
-----------
Is used after having initialized the fields. <V1t> is the tangent vector at the first point. <V2t> is the tangent vector at the last point. <V1c> is the tangent vector at the first point. <V2c> is the tangent vector at the last point.
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const double l1, const double l2);

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
		/****** md5 signature: 543ec6cabe601c880a43f4b9816c8f72 ******/
		%feature("compactdefaultargs") AppDef_TheResol;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: NCollection_HArray1<AppParCurves_ConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Given a MultiLine SSP with constraints points, this algorithm finds the best curve solution to approximate it. The poles from SCurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. The tolerance used in the Uzawa algorithms is Tolerance. A is the Bernstein matrix associated to the MultiLine and DA is the derivative bernstein matrix.(They can come from an approximation with ParLeastSquare.) The MultiCurve is modified. New MultiPoles are given.
") AppDef_TheResol;
		 AppDef_TheResol(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** AppDef_TheResol::ConstraintDerivative ******/
		/****** md5 signature: 6624b247eb3c133ce83158af9b1d85f5 ******/
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
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: bb4e11b81bf4f99fa7a04bd5573e44c9 ******/
		%feature("compactdefaultargs") AppDef_Variational;
		%feature("autodoc", "
Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: NCollection_HArray1<AppParCurves_ConstraintCouple
MaxDegree: int (optional, default to 14)
MaxSegment: int (optional, default to 100)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
WithMinMax: bool (optional, default to false)
WithCutting: bool (optional, default to true)
Tolerance: double (optional, default to 1.0)
NbIterations: int (optional, default to 2)

Return
-------
None

Description
-----------
Constructor. Initialization of the fields. Warning: Nc0: number of PassagePoint consraints Nc2: number of TangencyPoint constraints Nc3: number of CurvaturePoint constraints if ((MaxDegree-Continuity)*MaxSegment -Nc0 - 2*Nc1 -3*Nc2) is negative The problem is over-constrained. //! Limitation: The MultiLine from AppDef has to be composed by only one Line ( Dimension 2 or 3).
") AppDef_Variational;
		 AppDef_Variational(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const int MaxDegree = 14, const int MaxSegment = 100, const GeomAbs_Shape Continuity = GeomAbs_C2, const bool WithMinMax = false, const bool WithCutting = true, const double Tolerance = 1.0, const int NbIterations = 2);

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
		/****** md5 signature: 85ff9e1a5f7944ea296ab9fed61363d6 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the average error between the MultiLine from AppDef and the approximation.
") AverageError;
		double AverageError();

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
		/****** md5 signature: 0fa952bee17ad264eef37768e46066e4 ******/
		%feature("compactdefaultargs") Criterium;
		%feature("autodoc", "
Parameters
----------

Return
-------
VFirstOrder: double
VSecondOrder: double
VThirdOrder: double

Description
-----------
returns the values of the quality criterium.
") Criterium;
		void Criterium(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_Variational::CriteriumWeight ******/
		/****** md5 signature: 1544acdfb9719eda43fde0599ef767af ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
Percent1: double
Percent2: double
Percent3: double

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
		/****** md5 signature: f422960c1d258c859e337bcd30afdf15 ******/
		%feature("compactdefaultargs") IsCreated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the creation is done and correspond to the current fields.
") IsCreated;
		bool IsCreated();

		/****** AppDef_Variational::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the approximation is ok and correspond to the current fields.
") IsDone;
		bool IsDone();

		/****** AppDef_Variational::IsOverConstrained ******/
		/****** md5 signature: 66cf3269b81347643cdd47cc6f12ab51 ******/
		%feature("compactdefaultargs") IsOverConstrained;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the problem is overconstrained in this case, approximation cannot be done.
") IsOverConstrained;
		bool IsOverConstrained();

		/****** AppDef_Variational::Knots ******/
		/****** md5 signature: 916a934e3fbc9131c9769cb933e143e3 ******/
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
		/****** md5 signature: 0d1cb72b1379ad321ead28abe36212aa ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the Maximum Degree used in the approximation.
") MaxDegree;
		int MaxDegree();

		/****** AppDef_Variational::MaxError ******/
		/****** md5 signature: 4f47ae0b40baa70b5c95e40911df418d ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum of the distances between the points of the multiline and the approximation curves.
") MaxError;
		double MaxError();

		/****** AppDef_Variational::MaxErrorIndex ******/
		/****** md5 signature: 589b7251d8fd4426ed59ece6df201506 ******/
		%feature("compactdefaultargs") MaxErrorIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the index of the MultiPoint of ErrorMax.
") MaxErrorIndex;
		int MaxErrorIndex();

		/****** AppDef_Variational::MaxSegment ******/
		/****** md5 signature: ed8a683c919f57040cc6f96b070d3d38 ******/
		%feature("compactdefaultargs") MaxSegment;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the Maximum of segment used in the approximation.
") MaxSegment;
		int MaxSegment();

		/****** AppDef_Variational::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations used in the approximation.
") NbIterations;
		int NbIterations();

		/****** AppDef_Variational::Parameters ******/
		/****** md5 signature: ec5ffc2b3a4e01e32f9c5f69e8948ebf ******/
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
		/****** md5 signature: 18c4dd3de727943534d24ba84ed7cdd5 ******/
		%feature("compactdefaultargs") QuadraticError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the quadratic average of the distances between the points of the multiline and the approximation curves.
") QuadraticError;
		double QuadraticError();

		/****** AppDef_Variational::SetConstraints ******/
		/****** md5 signature: 4fac2ef29203b85a5313f4a150d13c56 ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
aConstrainst: NCollection_HArray1<AppParCurves_ConstraintCouple

Return
-------
bool

Description
-----------
Define the constraints to approximate If this value is incompatible with the others fields this method modify nothing and returns false.
") SetConstraints;
		bool SetConstraints(const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & aConstrainst);

		/****** AppDef_Variational::SetContinuity ******/
		/****** md5 signature: 2f68d6ea40cf201b04b4380b9b620a1e ******/
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
		bool SetContinuity(const GeomAbs_Shape C);

		/****** AppDef_Variational::SetCriteriumWeight ******/
		/****** md5 signature: 82b85dd1ae6e7f94fe6395f5acbb65d0 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
Percent1: double
Percent2: double
Percent3: double

Return
-------
None

Description
-----------
define the Weights (as percent) associed to the criterium used in the optimization. //! if Percent <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const double Percent1, const double Percent2, const double Percent3);

		/****** AppDef_Variational::SetCriteriumWeight ******/
		/****** md5 signature: aeaa8cf534c553a1bfc99d4bffd66adc ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
Order: int
Percent: double

Return
-------
None

Description
-----------
define the Weight (as percent) associed to the criterium Order used in the optimization: Others weights are updated. if Percent < 0 if Order < 1 or Order > 3.
") SetCriteriumWeight;
		void SetCriteriumWeight(const int Order, const double Percent);

		/****** AppDef_Variational::SetKnots ******/
		/****** md5 signature: c430875f7d33f2d4d1fe8cb50a442d6a ******/
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
		bool SetKnots(const opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****** AppDef_Variational::SetMaxDegree ******/
		/****** md5 signature: 6f66d774e74903b4b5af2b8dfc5a299e ******/
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
		bool SetMaxDegree(const int Degree);

		/****** AppDef_Variational::SetMaxSegment ******/
		/****** md5 signature: 5cc1f561ea3340f917866ee70d18eedc ******/
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
		bool SetMaxSegment(const int NbSegment);

		/****** AppDef_Variational::SetNbIterations ******/
		/****** md5 signature: 64b621cb577db030f54d40380dfa7254 ******/
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
		void SetNbIterations(const int Iter);

		/****** AppDef_Variational::SetParameters ******/
		/****** md5 signature: a3868e2777146057db4363f249fbd63a ******/
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
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
define the tolerance used in the approximation.
") SetTolerance;
		void SetTolerance(const double Tol);

		/****** AppDef_Variational::SetWithCutting ******/
		/****** md5 signature: 26ea8dda644fcf699b68e6017a500694 ******/
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
		bool SetWithCutting(const bool Cutting);

		/****** AppDef_Variational::SetWithMinMax ******/
		/****** md5 signature: 2f7796325b6b5f1080fbf22e9904257d ******/
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
		void SetWithMinMax(const bool MinMax);

		/****** AppDef_Variational::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the tolerance used in the approximation.
") Tolerance;
		double Tolerance();

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
		/****** md5 signature: b768c1bde232a26a32955cefbad731a5 ******/
		%feature("compactdefaultargs") WithCutting;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if the approximation can insert new Knots or not.
") WithCutting;
		bool WithCutting();

		/****** AppDef_Variational::WithMinMax ******/
		/****** md5 signature: 789d365a8b0ca3fe33dd3c191ffbc999 ******/
		%feature("compactdefaultargs") WithMinMax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if the approximation search to minimize the maximum Error or not.
") WithMinMax;
		bool WithMinMax();

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
		/****** md5 signature: 0abb2d0ba87e5d4b5d333d9d1eb04758 ******/
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
		 AppDef_LinearCriteria(const AppDef_MultiLine & SSP, const int FirstPoint, const int LastPoint);

		/****** AppDef_LinearCriteria::AssemblyTable ******/
		/****** md5 signature: 2667831f5e51e952d18feb231f8b9040 ******/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<opencascade::handle<TColStd_HArray1OfInteger>>>

Description
-----------
No available documentation.
") AssemblyTable;
		opencascade::handle<NCollection_HArray2<opencascade::handle<TColStd_HArray1OfInteger>>> AssemblyTable();

		/****** AppDef_LinearCriteria::DependenceTable ******/
		/****** md5 signature: 3c6dd946c24496ab93cc5cb266bb098a ******/
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
		/****** md5 signature: da64e4eedaa767e2b61dc721899ddb72 ******/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
MaxError: double
QuadraticError: double
AverageError: double

Description
-----------
No available documentation.
") ErrorValues;
		void ErrorValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_LinearCriteria::EstLength ******/
		/****** md5 signature: 97c52113c5736aecf02c24f05a98899d ******/
		%feature("compactdefaultargs") EstLength;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") EstLength;
		double & EstLength();

		/****** AppDef_LinearCriteria::GetCurve ******/
		/****** md5 signature: 63e5c0923d2af959ede91bdad45cbf91 ******/
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
		/****** md5 signature: 3f74549f9d359a09af87b25151f0748b ******/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", "
Parameters
----------

Return
-------
E1: double
E2: double
E3: double

Description
-----------
No available documentation.
") GetEstimation;
		void GetEstimation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_LinearCriteria::GetWeight ******/
		/****** md5 signature: c55e1dce8913e427a0e81ccc32d6c5b7 ******/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
QuadraticWeight: double
QualityWeight: double

Description
-----------
No available documentation.
") GetWeight;
		void GetWeight(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_LinearCriteria::Gradient ******/
		/****** md5 signature: 0a5d3f54cbd3008f333b45bbd94d4102 ******/
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
		void Gradient(const int Element, const int Dimension, math_Vector & G);

		/****** AppDef_LinearCriteria::Hessian ******/
		/****** md5 signature: 7117052d6318106e456e896215767124 ******/
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
		void Hessian(const int Element, const int Dimension1, const int Dimension2, math_Matrix & H);

		/****** AppDef_LinearCriteria::InputVector ******/
		/****** md5 signature: 9dab3bc88225f997862f0d8f7ade1b08 ******/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
AssTable: NCollection_HArray2<

Return
-------
None

Description
-----------
Convert the assembly Vector in an Curve;.
") InputVector;
		void InputVector(const math_Vector & X, const opencascade::handle<NCollection_HArray2<opencascade::handle<TColStd_HArray1OfInteger> >> & AssTable);

		/****** AppDef_LinearCriteria::QualityValues ******/
		/****** md5 signature: dda6320c4b729449cfd9ab2379a97ea3 ******/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", "
Parameters
----------
J1min: double
J2min: double
J3min: double

Return
-------
J1: double
J2: double
J3: double

Description
-----------
No available documentation.
") QualityValues;
		int QualityValues(const double J1min, const double J2min, const double J3min, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppDef_LinearCriteria::SetCurve ******/
		/****** md5 signature: 1c457252c0e67a89e62141a01828cef5 ******/
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
		/****** md5 signature: 757ac19e61cde86d107bb72b6020f8f3 ******/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", "
Parameters
----------
E1: double
E2: double
E3: double

Return
-------
None

Description
-----------
No available documentation.
") SetEstimation;
		void SetEstimation(const double E1, const double E2, const double E3);

		/****** AppDef_LinearCriteria::SetParameters ******/
		/****** md5 signature: 59a05a7e3b6ca23ea2c438ea5c80f937 ******/
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
		/****** md5 signature: 6c2433fc5a233111aac0872874066487 ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
QuadraticWeight: double
QualityWeight: double
percentJ1: double
percentJ2: double
percentJ3: double

Return
-------
None

Description
-----------
No available documentation.
") SetWeight;
		void SetWeight(const double QuadraticWeight, const double QualityWeight, const double percentJ1, const double percentJ2, const double percentJ3);

		/****** AppDef_LinearCriteria::SetWeight ******/
		/****** md5 signature: 2d47ea96ac1a1d393362ca463ca76422 ******/
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

		%extend{
			double GetEstLength() { return self->EstLength(); }
			void SetEstLength(double value) { self->EstLength() = value; }
		};
};


%make_alias(AppDef_LinearCriteria)

%extend AppDef_LinearCriteria {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class AppDef_HArray1OfMultiPointConstraint : public NCollection_Array1<AppDef_MultiPointConstraint>, public Standard_Transient {
  public:
    AppDef_HArray1OfMultiPointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper);
    AppDef_HArray1OfMultiPointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<AppDef_MultiPointConstraint>::value_type& theValue);
    AppDef_HArray1OfMultiPointConstraint(const NCollection_Array1<AppDef_MultiPointConstraint>& theOther);
    const NCollection_Array1<AppDef_MultiPointConstraint>& Array1();
    NCollection_Array1<AppDef_MultiPointConstraint>& ChangeArray1();
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
