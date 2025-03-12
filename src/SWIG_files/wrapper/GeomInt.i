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
%define GEOMINTDOCSTRING
"GeomInt module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geomint.html"
%enddef
%module (package="OCC.Core", docstring=GEOMINTDOCSTRING) GeomInt


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
#include<GeomInt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<AppParCurves_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<IntPatch_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<gp_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopAbs_module.hxx>
#include<Approx_module.hxx>
#include<IntImp_module.hxx>
#include<ApproxInt_module.hxx>
#include<IntSurf_module.hxx>
#include<TColgp_module.hxx>
#include<Bnd_module.hxx>
#include<IntAna_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
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
%import Geom.i
%import Geom2d.i
%import IntPatch.i
%import GeomAdaptor.i
%import gp.i
%import Bnd.i
%import Adaptor3d.i
%import TopAbs.i
%import Approx.i
%import IntImp.i
%import ApproxInt.i
%import IntSurf.i
%import TColgp.i

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
/* end handles declaration */

/* templates */
%template(GeomInt_SequenceOfParameterAndOrientation) NCollection_Sequence<GeomInt_ParameterAndOrientation>;

%extend NCollection_Sequence<GeomInt_ParameterAndOrientation> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(GeomInt_VectorOfReal) NCollection_Vector<Standard_Real>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<GeomInt_ParameterAndOrientation> GeomInt_SequenceOfParameterAndOrientation;
typedef NCollection_Vector<Standard_Real> GeomInt_VectorOfReal;
/* end typedefs declaration */

/****************
* class GeomInt *
****************/
%rename(geomint) GeomInt;
class GeomInt {
	public:
		/****** GeomInt::AdjustPeriodic ******/
		/****** md5 signature: 798d1ad218945fa35f5e8004cf62fd89 ******/
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "
Parameters
----------
thePar: float
theParMin: float
theParMax: float
thePeriod: float
theEps: float (optional, default to 0.0)

Return
-------
theNewPar: float
theOffset: float

Description
-----------
Adjusts the parameter <thePar> to the range [theParMin, theParMax].
") AdjustPeriodic;
		static Standard_Boolean AdjustPeriodic(const Standard_Real thePar, const Standard_Real theParMin, const Standard_Real theParMax, const Standard_Real thePeriod, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real theEps = 0.0);

};


%extend GeomInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************************
* class GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox *
***************************************************************************/
class GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox : public math_BFGS {
	public:
		/****** GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 95f162f6aaa1531a89b1428f339b406c ******/
		%feature("compactdefaultargs") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
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
") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox::IsSolutionReached ******/
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


%extend GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************************
* class GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox *
*************************************************************************/
class GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: df96df7d447ec20a697dde958e29bc35 ******/
		%feature("compactdefaultargs") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer NbPol);

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::CurveValue ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::DerivativeFunctionMatrix ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::FirstConstraint ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::FunctionMatrix ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::Gradient ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::Index ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::LastConstraint ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::NbVariables ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::NewParameters ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::SetFirstLambda ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::SetLastLambda ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::Value ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::Values ******/
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


%extend GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************************
* class GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox *
****************************************************************************/
class GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: a8700d677486ee164c3875093b4f932e ******/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: dc8709e15541387f4cb3f3aaea1efcaf ******/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: cd2b3cf8887d1f86e582feb25784d913 ******/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: c14b01f81ed49c62b910737a79c92f91 ******/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::BSplineValue ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::BezierValue ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::DerivativeFunctionMatrix ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Distance ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::ErrorGradient ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::FirstLambda ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::FunctionMatrix ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::IsDone ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::KIndex ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::LastLambda ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Points ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Poles ******/
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


%extend GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************************
* class GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox *
**************************************************************************/
class GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox : public math_BFGS {
	public:
		/****** GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 2f331a9c91663dd49e0fb5b969bb4dcf ******/
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
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
") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox::IsSolutionReached ******/
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


%extend GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox *
***********************************************************************/
class GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox : public math_BFGS {
	public:
		/****** GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: c354604ffaf7830c5f69861ec1a4ae13 ******/
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
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
") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox::IsSolutionReached ******/
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


%extend GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GeomInt_IntSS *
**********************/
class GeomInt_IntSS {
	public:
		/****** GeomInt_IntSS::GeomInt_IntSS ******/
		/****** md5 signature: 6a673aba797288807b9b0c47fa8133f9 ******/
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomInt_IntSS;
		 GeomInt_IntSS();

		/****** GeomInt_IntSS::GeomInt_IntSS ******/
		/****** md5 signature: 4c7a2342f594f741697ac3face12ccf7 ******/
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float
Approx: bool (optional, default to Standard_True)
ApproxS1: bool (optional, default to Standard_False)
ApproxS2: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
performs general intersection of two surfaces just now.
") GeomInt_IntSS;
		 GeomInt_IntSS(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****** GeomInt_IntSS::Boundary ******/
		/****** md5 signature: 420cfa2d7d64016c63bd891d1d3758c1 ******/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Boundary;
		const opencascade::handle<Geom_Curve> & Boundary(const Standard_Integer Index);

		/****** GeomInt_IntSS::BuildPCurves ******/
		/****** md5 signature: 6965f43fd020f13216b45cd065743faa ******/
		%feature("compactdefaultargs") BuildPCurves;
		%feature("autodoc", "
Parameters
----------
theFirst: float
theLast: float
theUmin: float
theUmax: float
theVmin: float
theVmax: float
theSurface: Geom_Surface
theCurve: Geom_Curve
theCurve2d: Geom2d_Curve

Return
-------
theTol: float

Description
-----------
creates 2D-curve on given surface from given 3D-curve.
") BuildPCurves;
		static void BuildPCurves(const Standard_Real theFirst, const Standard_Real theLast, const Standard_Real theUmin, const Standard_Real theUmax, const Standard_Real theVmin, const Standard_Real theVmax, Standard_Real &OutValue, const opencascade::handle<Geom_Surface> & theSurface, const opencascade::handle<Geom_Curve> & theCurve, opencascade::handle<Geom2d_Curve> & theCurve2d);

		/****** GeomInt_IntSS::BuildPCurves ******/
		/****** md5 signature: 2c2bdb53423075c70323712785098b12 ******/
		%feature("compactdefaultargs") BuildPCurves;
		%feature("autodoc", "
Parameters
----------
f: float
l: float
S: Geom_Surface
C: Geom_Curve
C2d: Geom2d_Curve

Return
-------
Tol: float

Description
-----------
creates 2D-curve on given surface from given 3D-curve.
") BuildPCurves;
		static void BuildPCurves(const Standard_Real f, const Standard_Real l, Standard_Real &OutValue, const opencascade::handle<Geom_Surface> & S, const opencascade::handle<Geom_Curve> & C, opencascade::handle<Geom2d_Curve> & C2d);

		/****** GeomInt_IntSS::HasLineOnS1 ******/
		/****** md5 signature: e18393447cffe4a479bac4f84a4e58a0 ******/
		%feature("compactdefaultargs") HasLineOnS1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
No available documentation.
") HasLineOnS1;
		Standard_Boolean HasLineOnS1(const Standard_Integer Index);

		/****** GeomInt_IntSS::HasLineOnS2 ******/
		/****** md5 signature: e61aece789be767af954581faf3fa6ee ******/
		%feature("compactdefaultargs") HasLineOnS2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
No available documentation.
") HasLineOnS2;
		Standard_Boolean HasLineOnS2(const Standard_Integer Index);

		/****** GeomInt_IntSS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomInt_IntSS::Line ******/
		/****** md5 signature: 2500cd198cb3b23b6a306899bd784df3 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Line;
		const opencascade::handle<Geom_Curve> & Line(const Standard_Integer Index);

		/****** GeomInt_IntSS::LineOnS1 ******/
		/****** md5 signature: ee9dcd84dc7ff66b770c9bc7ea47ce94 ******/
		%feature("compactdefaultargs") LineOnS1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") LineOnS1;
		const opencascade::handle<Geom2d_Curve> & LineOnS1(const Standard_Integer Index);

		/****** GeomInt_IntSS::LineOnS2 ******/
		/****** md5 signature: 674ebc778dc8f81d5681fe8b2cff46e2 ******/
		%feature("compactdefaultargs") LineOnS2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") LineOnS2;
		const opencascade::handle<Geom2d_Curve> & LineOnS2(const Standard_Integer Index);

		/****** GeomInt_IntSS::MakeBSpline ******/
		/****** md5 signature: 91c34a2d8593765c4e94b0ff2305a713 ******/
		%feature("compactdefaultargs") MakeBSpline;
		%feature("autodoc", "
Parameters
----------
WL: IntPatch_WLine
ideb: int
ifin: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") MakeBSpline;
		static opencascade::handle<Geom_Curve> MakeBSpline(const opencascade::handle<IntPatch_WLine> & WL, const Standard_Integer ideb, const Standard_Integer ifin);

		/****** GeomInt_IntSS::MakeBSpline2d ******/
		/****** md5 signature: 2867dd5c5ab38c1bd094feb37ea97ef8 ******/
		%feature("compactdefaultargs") MakeBSpline2d;
		%feature("autodoc", "
Parameters
----------
theWLine: IntPatch_WLine
ideb: int
ifin: int
onFirst: bool

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") MakeBSpline2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeBSpline2d(const opencascade::handle<IntPatch_WLine> & theWLine, const Standard_Integer ideb, const Standard_Integer ifin, const Standard_Boolean onFirst);

		/****** GeomInt_IntSS::NbBoundaries ******/
		/****** md5 signature: 323b6e26295515e892919c1c737b3943 ******/
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBoundaries;
		Standard_Integer NbBoundaries();

		/****** GeomInt_IntSS::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLines;
		Standard_Integer NbLines();

		/****** GeomInt_IntSS::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: 40f08bb639a130ba527e1c323da22e12 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float
Approx: bool (optional, default to Standard_True)
ApproxS1: bool (optional, default to Standard_False)
ApproxS2: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
general intersection of two surfaces.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: 941b2b95a9b8f4e8d1f31d8f8f515e3d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HS1: GeomAdaptor_Surface
HS2: GeomAdaptor_Surface
Tol: float
Approx: bool (optional, default to Standard_True)
ApproxS1: bool (optional, default to Standard_False)
ApproxS2: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
intersection of adapted surfaces.
") Perform;
		void Perform(const opencascade::handle<GeomAdaptor_Surface> & HS1, const opencascade::handle<GeomAdaptor_Surface> & HS2, const Standard_Real Tol, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: 73c48116f09d9e8b379e1bbb117b10b1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float
U1: float
V1: float
U2: float
V2: float
Approx: bool (optional, default to Standard_True)
ApproxS1: bool (optional, default to Standard_False)
ApproxS2: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
general intersection using a starting point.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: a1e4f1bf6f4cefe55312366702abfa51 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HS1: GeomAdaptor_Surface
HS2: GeomAdaptor_Surface
Tol: float
U1: float
V1: float
U2: float
V2: float
Approx: bool (optional, default to Standard_True)
ApproxS1: bool (optional, default to Standard_False)
ApproxS2: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
intersection of adapted surfaces using a starting point.
") Perform;
		void Perform(const opencascade::handle<GeomAdaptor_Surface> & HS1, const opencascade::handle<GeomAdaptor_Surface> & HS2, const Standard_Real Tol, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****** GeomInt_IntSS::Pnt2d ******/
		/****** md5 signature: 70e3cf4a0a6f4cd62919c61b21b8dac0 ******/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "
Parameters
----------
Index: int
OnFirst: bool

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Pnt2d;
		gp_Pnt2d Pnt2d(const Standard_Integer Index, const Standard_Boolean OnFirst);

		/****** GeomInt_IntSS::Point ******/
		/****** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		gp_Pnt Point(const Standard_Integer Index);

		/****** GeomInt_IntSS::TolReached2d ******/
		/****** md5 signature: fec1cf227c913f78bf2cca534817572e ******/
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TolReached2d;
		Standard_Real TolReached2d();

		/****** GeomInt_IntSS::TolReached3d ******/
		/****** md5 signature: 683925467818325187b2612f3df211fb ******/
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TolReached3d;
		Standard_Real TolReached3d();

		/****** GeomInt_IntSS::TreatRLine ******/
		/****** md5 signature: 937cc34b25e05ec74387ed10ee40296e ******/
		%feature("compactdefaultargs") TreatRLine;
		%feature("autodoc", "
Parameters
----------
theRL: IntPatch_RLine
theHS1: GeomAdaptor_Surface
theHS2: GeomAdaptor_Surface
theC3d: Geom_Curve
theC2d1: Geom2d_Curve
theC2d2: Geom2d_Curve

Return
-------
theTolReached: float

Description
-----------
converts RLine to Geom(2d)_Curve.
") TreatRLine;
		static void TreatRLine(const opencascade::handle<IntPatch_RLine> & theRL, const opencascade::handle<GeomAdaptor_Surface> & theHS1, const opencascade::handle<GeomAdaptor_Surface> & theHS2, opencascade::handle<Geom_Curve> & theC3d, opencascade::handle<Geom2d_Curve> & theC2d1, opencascade::handle<Geom2d_Curve> & theC2d2, Standard_Real &OutValue);

		/****** GeomInt_IntSS::TrimILineOnSurfBoundaries ******/
		/****** md5 signature: 296ff18403a193bd148a0bb591fb60d7 ******/
		%feature("compactdefaultargs") TrimILineOnSurfBoundaries;
		%feature("autodoc", "
Parameters
----------
theC2d1: Geom2d_Curve
theC2d2: Geom2d_Curve
theBound1: Bnd_Box2d
theBound2: Bnd_Box2d
theArrayOfParameters: GeomInt_VectorOfReal

Return
-------
None

Description
-----------
puts into theArrayOfParameters the parameters of intersection points of given theC2d1 and theC2d2 curves with the boundaries of the source surface.
") TrimILineOnSurfBoundaries;
		static void TrimILineOnSurfBoundaries(const opencascade::handle<Geom2d_Curve> & theC2d1, const opencascade::handle<Geom2d_Curve> & theC2d2, const Bnd_Box2d & theBound1, const Bnd_Box2d & theBound2, GeomInt_VectorOfReal & theArrayOfParameters);

};


%extend GeomInt_IntSS {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def TolFixTangents(self):
		pass

	@methodnotwrapped
	def SetTolFixTangents(self):
		pass
	}
};

/********************************
* class GeomInt_LineConstructor *
********************************/
class GeomInt_LineConstructor {
	public:
		/****** GeomInt_LineConstructor::GeomInt_LineConstructor ******/
		/****** md5 signature: cd9ef8ff25f29daf3b77b53b5c420a5c ******/
		%feature("compactdefaultargs") GeomInt_LineConstructor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") GeomInt_LineConstructor;
		 GeomInt_LineConstructor();

		/****** GeomInt_LineConstructor::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if splitting was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomInt_LineConstructor::Load ******/
		/****** md5 signature: 79e3a2dc3b8e325809da53bf6db5f35b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
D1: Adaptor3d_TopolTool
D2: Adaptor3d_TopolTool
S1: GeomAdaptor_Surface
S2: GeomAdaptor_Surface

Return
-------
None

Description
-----------
Initializes me by two surfaces and corresponding tools which represent boundaries of surfaces.
") Load;
		void Load(const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_TopolTool> & D2, const opencascade::handle<GeomAdaptor_Surface> & S1, const opencascade::handle<GeomAdaptor_Surface> & S2);

		/****** GeomInt_LineConstructor::NbParts ******/
		/****** md5 signature: 309ebdfe06afb1fef88f3046131c3deb ******/
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of splits.
") NbParts;
		Standard_Integer NbParts();

		/****** GeomInt_LineConstructor::Part ******/
		/****** md5 signature: f69002d2370fd30ad15125b001cbb694 ******/
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
WFirst: float
WLast: float

Description
-----------
Return first and last parameters for given index of split.
") Part;
		void Part(const Standard_Integer I, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomInt_LineConstructor::Perform ******/
		/****** md5 signature: d53bad4defc45a0373f63fc1ec36aed1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line

Return
-------
None

Description
-----------
Splits line.
") Perform;
		void Perform(const opencascade::handle<IntPatch_Line> & L);

};


%extend GeomInt_LineConstructor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomInt_LineTool *
*************************/
class GeomInt_LineTool {
	public:
		/****** GeomInt_LineTool::DecompositionOfWLine ******/
		/****** md5 signature: a11cd86ba4ec963237a16709f49a30e5 ******/
		%feature("compactdefaultargs") DecompositionOfWLine;
		%feature("autodoc", "
Parameters
----------
theWLine: IntPatch_WLine
theSurface1: GeomAdaptor_Surface
theSurface2: GeomAdaptor_Surface
aTolSum: float
theLConstructor: GeomInt_LineConstructor
theNewLines: IntPatch_SequenceOfLine

Return
-------
bool

Description
-----------
No available documentation.
") DecompositionOfWLine;
		static Standard_Boolean DecompositionOfWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<GeomAdaptor_Surface> & theSurface1, const opencascade::handle<GeomAdaptor_Surface> & theSurface2, const Standard_Real aTolSum, const GeomInt_LineConstructor & theLConstructor, IntPatch_SequenceOfLine & theNewLines);

		/****** GeomInt_LineTool::FirstParameter ******/
		/****** md5 signature: cccff448706b5dedef51e7fc2e64ae95 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<IntPatch_Line> & L);

		/****** GeomInt_LineTool::LastParameter ******/
		/****** md5 signature: effa0368a17acb3c5d6f9de6aafb3fae ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<IntPatch_Line> & L);

		/****** GeomInt_LineTool::NbVertex ******/
		/****** md5 signature: 969a69912df71ff6b80fd9d961e7de16 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line

Return
-------
int

Description
-----------
No available documentation.
") NbVertex;
		static Standard_Integer NbVertex(const opencascade::handle<IntPatch_Line> & L);

		/****** GeomInt_LineTool::Vertex ******/
		/****** md5 signature: 73a6affecb297c4b446319a49f00e19e ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line
I: int

Return
-------
IntPatch_Point

Description
-----------
No available documentation.
") Vertex;
		static const IntPatch_Point & Vertex(const opencascade::handle<IntPatch_Line> & L, const Standard_Integer I);

};


%extend GeomInt_LineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox *
*********************************************************/
class GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: ef87cfba3c24ea93888e71a3c0be29c3 ******/
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 1);

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: b831b1795f058879cd6239890cf1ae05 ******/
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::AverageError ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::IsDone ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::Value ******/
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


%extend GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox *
***********************************************************/
class GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: bf922070a3642543d5a1224019e030ae ******/
		%feature("compactdefaultargs") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::AverageError ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::Error ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::IsDone ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::Value ******/
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


%extend GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class GeomInt_MyGradientbisOfTheComputeLineOfWLApprox *
********************************************************/
class GeomInt_MyGradientbisOfTheComputeLineOfWLApprox {
	public:
		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::GeomInt_MyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: b62fe6cd4df1ba01832d61fdca6243e0 ******/
		%feature("compactdefaultargs") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_MyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::AverageError ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::IsDone ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::Value ******/
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


%extend GeomInt_MyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox *
************************************************************************/
class GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: ee53c09a9de2b424080cb5c75793a11f ******/
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::CurveValue ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::Error ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::FirstConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::Gradient ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::LastConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::NbVariables ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::NewParameters ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::Value ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::Values ******/
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


%extend GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************************
* class GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox *
*********************************************************************/
class GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 43deda66782b5bd2478b5a836627b0bc ******/
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::CurveValue ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::FirstConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::Gradient ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::LastConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::NbVariables ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::NewParameters ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::Value ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::Values ******/
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


%extend GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************************
* class GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox *
***************************************************************************/
class GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 58c9576076f46b91ce462defe4858397 ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 9edc3e6891a4c97484af8d201ee5e98f ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 9907f51b3bd6fb246ef53897e07579ba ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 4b95fadc5aa7b8b9cd9fec91a6736b15 ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::BSplineValue ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::BezierValue ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::DerivativeFunctionMatrix ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Distance ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Error ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::ErrorGradient ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::FirstLambda ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::FunctionMatrix ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::IsDone ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::KIndex ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::LastLambda ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Points ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Poles ******/
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


%extend GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox *
************************************************************************/
class GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox {
	public:
		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: b3aa14c52d753e7c6fc1d3758e7f2b7d ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 69c2c37ad9c67af2e09ba84b86e50ac0 ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 766e9208ee9e5caa7e7d9d398a958987 ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 1230eab1cecef29cac8dba6e1e650983 ******/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::BSplineValue ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::BezierValue ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::DerivativeFunctionMatrix ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Distance ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::ErrorGradient ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::FirstLambda ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::FunctionMatrix ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::IsDone ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::KIndex ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::LastLambda ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Points ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Poles ******/
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


%extend GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomInt_ParameterAndOrientation *
****************************************/
class GeomInt_ParameterAndOrientation {
	public:
		/****** GeomInt_ParameterAndOrientation::GeomInt_ParameterAndOrientation ******/
		/****** md5 signature: 6cca03108fc212d5bbc31cdd4fbf3487 ******/
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation();

		/****** GeomInt_ParameterAndOrientation::GeomInt_ParameterAndOrientation ******/
		/****** md5 signature: b73c024866826e866f0fd78b03287d5b ******/
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "
Parameters
----------
P: float
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation(const Standard_Real P, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2);

		/****** GeomInt_ParameterAndOrientation::Orientation1 ******/
		/****** md5 signature: 7587ff7fc48025bbff368ace10cabd2a ******/
		%feature("compactdefaultargs") Orientation1;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation1;
		TopAbs_Orientation Orientation1();

		/****** GeomInt_ParameterAndOrientation::Orientation2 ******/
		/****** md5 signature: 2d7cc584f2695a7121e03b04cbcb8b4e ******/
		%feature("compactdefaultargs") Orientation2;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation2;
		TopAbs_Orientation Orientation2();

		/****** GeomInt_ParameterAndOrientation::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****** GeomInt_ParameterAndOrientation::SetOrientation1 ******/
		/****** md5 signature: 7f2401488589d25382e9294a24a4b0e0 ******/
		%feature("compactdefaultargs") SetOrientation1;
		%feature("autodoc", "
Parameters
----------
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation1;
		void SetOrientation1(const TopAbs_Orientation Or);

		/****** GeomInt_ParameterAndOrientation::SetOrientation2 ******/
		/****** md5 signature: 17a43583865b1a0ff0f3cb64de3abb59 ******/
		%feature("compactdefaultargs") SetOrientation2;
		%feature("autodoc", "
Parameters
----------
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation2;
		void SetOrientation2(const TopAbs_Orientation Or);

};


%extend GeomInt_ParameterAndOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************************
* class GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox *
**************************************************************************/
class GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		/****** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: dd14ed0559c25c663dfedf76e3dfc970 ******/
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox::ConstraintDerivative ******/
		/****** md5 signature: b38314c9e183aafa4dafa7b68667019e ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
		const math_Matrix & ConstraintDerivative(const GeomInt_TheMultiLineOfWLApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox::ConstraintMatrix ******/
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

		/****** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox::Duale ******/
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

		/****** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox::InverseMatrix ******/
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

		/****** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox::IsDone ******/
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


%extend GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/***********************************************************************
* class GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox *
***********************************************************************/
class GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox {
	public:
		/****** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 1a702a4b62bddf4a5e9212eaefa3fffb ******/
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox::ConstraintDerivative ******/
		/****** md5 signature: b38314c9e183aafa4dafa7b68667019e ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
		const math_Matrix & ConstraintDerivative(const GeomInt_TheMultiLineOfWLApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox::ConstraintMatrix ******/
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

		/****** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox::Duale ******/
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

		/****** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox::InverseMatrix ******/
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

		/****** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox::IsDone ******/
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


%extend GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/***********************************************
* class GeomInt_TheComputeLineBezierOfWLApprox *
***********************************************/
class GeomInt_TheComputeLineBezierOfWLApprox {
	public:
		/****** GeomInt_TheComputeLineBezierOfWLApprox::GeomInt_TheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: c343bc7d9f3ec6dbfbcccc03ba9d1218 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::GeomInt_TheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: aff89dcdd1a255b74c6a0dc776f7a5e6 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::GeomInt_TheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 46052aa41112b64cb818bc868ab55acb ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::GeomInt_TheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 960afef161988f9bdfa23a34d861d040 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::ChangeValue ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Error ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Init ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::IsAllApproximated ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::IsToleranceReached ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::NbMultiCurves ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Parameters ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Parametrization ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Perform ******/
		/****** md5 signature: e115d44c5fb2b2b1ce99193ba9c7c351 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const GeomInt_TheMultiLineOfWLApprox & Line);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::SetConstraints ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::SetDegrees ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::SetTolerances ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::SplineValue ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Value ******/
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


%extend GeomInt_TheComputeLineBezierOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomInt_TheComputeLineOfWLApprox *
*****************************************/
class GeomInt_TheComputeLineOfWLApprox {
	public:
		/****** GeomInt_TheComputeLineOfWLApprox::GeomInt_TheComputeLineOfWLApprox ******/
		/****** md5 signature: b9b2eea770dde3a33acff69b797c5194 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineOfWLApprox::GeomInt_TheComputeLineOfWLApprox ******/
		/****** md5 signature: 9d604b4be0a608e72118113e8ef7c3d1 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineOfWLApprox::GeomInt_TheComputeLineOfWLApprox ******/
		/****** md5 signature: eec3ddd81d818d27b5b39aee9259754d ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineOfWLApprox::GeomInt_TheComputeLineOfWLApprox ******/
		/****** md5 signature: 628a249bcbcdca28ed481dc6e592f2a8 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** GeomInt_TheComputeLineOfWLApprox::ChangeValue ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::Init ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::Interpol ******/
		/****** md5 signature: a80615bcc8b246576877bfac3620ec30 ******/
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox

Return
-------
None

Description
-----------
Constructs an interpolation of the MultiLine <Line> The result will be a C2 curve of degree 3.
") Interpol;
		void Interpol(const GeomInt_TheMultiLineOfWLApprox & Line);

		/****** GeomInt_TheComputeLineOfWLApprox::IsAllApproximated ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::IsToleranceReached ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::Parameters ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::Perform ******/
		/****** md5 signature: e115d44c5fb2b2b1ce99193ba9c7c351 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const GeomInt_TheMultiLineOfWLApprox & Line);

		/****** GeomInt_TheComputeLineOfWLApprox::SetConstraints ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetContinuity ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetDegrees ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetKnots ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetKnotsAndMultiplicities ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetParameters ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetPeriodic ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetTolerances ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::Value ******/
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


%extend GeomInt_TheComputeLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************************
* class GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox *
*********************************************************************/
class GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox : public math_FunctionSetWithDerivatives {
	public:
		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 25a05e92e7b02b3aa541cd2ad3d594a9 ******/
		%feature("compactdefaultargs") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2);

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::AuxillarSurface1 ******/
		/****** md5 signature: 2bcc0e8f6b940dfbbbc22a207b96f139 ******/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface1();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::AuxillarSurface2 ******/
		/****** md5 signature: 00eb01b56212c9640d2242fafdf3e920 ******/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface2();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::ComputeParameters ******/
		/****** md5 signature: 5686d6c4ca7c470ce5a820727bd25544 ******/
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", "
Parameters
----------
ChoixIso: IntImp_ConstIsoparametric
Param: TColStd_Array1OfReal
UVap: math_Vector
BornInf: math_Vector
BornSup: math_Vector
Tolerance: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") ComputeParameters;
		void ComputeParameters(const IntImp_ConstIsoparametric ChoixIso, const TColStd_Array1OfReal & Param, math_Vector & UVap, math_Vector & BornInf, math_Vector & BornSup, math_Vector & Tolerance);

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Direction ******/
		/****** md5 signature: 7db1622a0b370b4453af0886bb5f840c ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::DirectionOnS1 ******/
		/****** md5 signature: bc5dc0d8303d35b67ad8c11b04c94ec5 ******/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") DirectionOnS1;
		gp_Dir2d DirectionOnS1();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::DirectionOnS2 ******/
		/****** md5 signature: caea60e56e0b7869c8e3533543115136 ******/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") DirectionOnS2;
		gp_Dir2d DirectionOnS2();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::IsTangent ******/
		/****** md5 signature: 9e73991f5144c0e218a14c453bc89c5f ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "
Parameters
----------
UVap: math_Vector
Param: TColStd_Array1OfReal
BestChoix: IntImp_ConstIsoparametric

Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		Standard_Boolean IsTangent(const math_Vector & UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric & BestChoix);

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Point ******/
		/****** md5 signature: aacd847206090cc43a493e5072f97000 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		gp_Pnt Point();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns somme des fi*fi.
") Root;
		Standard_Real Root();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomInt_TheImpPrmSvSurfacesOfWLApprox *
**********************************************/
class GeomInt_TheImpPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::GeomInt_TheImpPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 756b0be5f48f711bd5c404150aa6617e ******/
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
Surf2: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_Surface> & Surf1, const IntSurf_Quadric & Surf2);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::GeomInt_TheImpPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 206f2546010b9fbe1ff8c3002f470f88 ******/
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Surf1: IntSurf_Quadric
Surf2: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox(const IntSurf_Quadric & Surf1, const opencascade::handle<Adaptor3d_Surface> & Surf2);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::Compute ******/
		/****** md5 signature: 1b6699512251d1cde0fa87fb6fb9f2bf ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
Tg: gp_Vec
Tguv1: gp_Vec2d
Tguv2: gp_Vec2d

Return
-------
u1: float
v1: float
u2: float
v2: float

Description
-----------
returns True if Tg,Tguv1 Tguv2 can be computed.
") Compute;
		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::Pnt ******/
		/****** md5 signature: 9b8bce66add52a246baf1e5f56b41c57 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Pnt;
		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::SeekPoint ******/
		/****** md5 signature: 1cbe34841922a959c2a9bca52603cce9 ******/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Point: IntSurf_PntOn2S

Return
-------
bool

Description
-----------
No available documentation.
") SeekPoint;
		Standard_Boolean SeekPoint(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, IntSurf_PntOn2S & Point);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::Tangency ******/
		/****** md5 signature: c0c9891902a6459b409f1a9c52228000 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") Tangency;
		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::TangencyOnSurf1 ******/
		/****** md5 signature: 92ffba31e07343330c44d9dee4123c55 ******/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::TangencyOnSurf2 ******/
		/****** md5 signature: 0c3b4c57afa7cd03a0f9030ecd47326b ******/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

};


%extend GeomInt_TheImpPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def FillInitialVectorOfSolution(self):
		pass
	}
};

/********************************************************
* class GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox *
********************************************************/
class GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	public:
		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: e56262fd3a0a528ff9551e1825dcea4c ******/
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolTangency: float

Return
-------
None

Description
-----------
compute the solution point with the close point.
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const TColStd_Array1OfReal & Param, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const Standard_Real TolTangency);

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 4c370cda13592e56acd24cbe06174af1 ******/
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolTangency: float

Return
-------
None

Description
-----------
initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }.
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const Standard_Real TolTangency);

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::ChangePoint ******/
		/****** md5 signature: 1b1852ae04e18b1e3ae0c1ea8c1f6773 ******/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return
-------
IntSurf_PntOn2S

Description
-----------
return the intersection point which is enable for changing.
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Direction ******/
		/****** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the tangent at the intersection line.
") Direction;
		const gp_Dir Direction();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::DirectionOnS1 ******/
		/****** md5 signature: 0ea23aedfa0d65293f06d50c4f4fd61f ******/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the tangent at the intersection line in the parametric space of the first surface.
") DirectionOnS1;
		const gp_Dir2d DirectionOnS1();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::DirectionOnS2 ******/
		/****** md5 signature: 9fe51e029e5ffcecf563550ef1c567fd ******/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the tangent at the intersection line in the parametric space of the second surface.
") DirectionOnS2;
		const gp_Dir2d DirectionOnS2();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Function ******/
		/****** md5 signature: 43bb8650e368bc791dc8eaaa177bb74e ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox

Description
-----------
return the math function which is used to compute the intersection.
") Function;
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox & Function();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when there is no solution to the problem.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::IsTangent ******/
		/****** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are tangent at the intersection point.
") IsTangent;
		Standard_Boolean IsTangent();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Perform ******/
		/****** md5 signature: ba19d26576d52e0e2824307d3171f0bf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot

Return
-------
IntImp_ConstIsoparametric

Description
-----------
returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is calculated).
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld);

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Perform ******/
		/****** md5 signature: 01d0aa4ed60a8ef13ed05d29863bed35 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot
ChoixIso: IntImp_ConstIsoparametric

Return
-------
IntImp_ConstIsoparametric

Description
-----------
returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is given by ChoixIso).
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld, const IntImp_ConstIsoparametric ChoixIso);

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Point ******/
		/****** md5 signature: be121892232ab68ab537f33c0dca8dfd ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point.
") Point;
		const IntSurf_PntOn2S & Point();

};


%extend GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomInt_TheMultiLineOfWLApprox *
***************************************/
class GeomInt_TheMultiLineOfWLApprox {
	public:
		/****** GeomInt_TheMultiLineOfWLApprox::GeomInt_TheMultiLineOfWLApprox ******/
		/****** md5 signature: c2ed49fafe35b388b0ef3d545c75a2a8 ******/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox();

		/****** GeomInt_TheMultiLineOfWLApprox::GeomInt_TheMultiLineOfWLApprox ******/
		/****** md5 signature: 4ddf30ac96d36e8ce49087ee99c94be7 ******/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
line: IntPatch_WLine
PtrSvSurfaces: Standard_Address
NbP3d: int
NbP2d: int
ApproxU1V1: bool
ApproxU2V2: bool
xo: float
yo: float
zo: float
u1o: float
v1o: float
u2o: float
v2o: float
P2DOnFirst: bool
IndMin: int (optional, default to 0)
IndMax: int (optional, default to 0)

Return
-------
None

Description
-----------
The class SvSurfaces is used when the approximation algorithm needs some extra points on the line <line>. A New line is then created which shares the same surfaces and functions. SvSurfaces is a deferred class which allows several implementations of this algorithm with different surfaces (bi-parametric ones, or implicit and biparametric ones).
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox(const opencascade::handle<IntPatch_WLine> & line, const Standard_Address PtrSvSurfaces, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

		/****** GeomInt_TheMultiLineOfWLApprox::GeomInt_TheMultiLineOfWLApprox ******/
		/****** md5 signature: 3fd1ba939844ce5e4adc270eda1c3b31 ******/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
line: IntPatch_WLine
NbP3d: int
NbP2d: int
ApproxU1V1: bool
ApproxU2V2: bool
xo: float
yo: float
zo: float
u1o: float
v1o: float
u2o: float
v2o: float
P2DOnFirst: bool
IndMin: int (optional, default to 0)
IndMax: int (optional, default to 0)

Return
-------
None

Description
-----------
No Extra points will be added on the current line.
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox(const opencascade::handle<IntPatch_WLine> & line, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

		/****** GeomInt_TheMultiLineOfWLApprox::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump of the current multi-line.
") Dump;
		void Dump();

		/****** GeomInt_TheMultiLineOfWLApprox::FirstPoint ******/
		/****** md5 signature: 6036aa5f9c36e4ed29b55026423af997 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FirstPoint;
		Standard_Integer FirstPoint();

		/****** GeomInt_TheMultiLineOfWLApprox::LastPoint ******/
		/****** md5 signature: e2615285c6676dba4ad25275a0d452ca ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LastPoint;
		Standard_Integer LastPoint();

		/****** GeomInt_TheMultiLineOfWLApprox::MakeMLBetween ******/
		/****** md5 signature: 6392dc6977d6e5a43ecf048227776d01 ******/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "
Parameters
----------
Low: int
High: int
NbPointsToInsert: int

Return
-------
GeomInt_TheMultiLineOfWLApprox

Description
-----------
Tries to make a sub-line between <Low> and <High> points of this line by adding <NbPointsToInsert> new points.
") MakeMLBetween;
		GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer NbPointsToInsert);

		/****** GeomInt_TheMultiLineOfWLApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: b8f4516c2a73f53099399a42161e3b64 ******/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "
Parameters
----------
Low: int
High: int
indbad: int
OtherLine: GeomInt_TheMultiLineOfWLApprox

Return
-------
bool

Description
-----------
Tries to make a sub-line between <Low> and <High> points of this line by adding one more point between (indbad-1)-th and indbad-th points.
") MakeMLOneMorePoint;
		Standard_Boolean MakeMLOneMorePoint(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer indbad, GeomInt_TheMultiLineOfWLApprox & OtherLine);

		/****** GeomInt_TheMultiLineOfWLApprox::NbP2d ******/
		/****** md5 signature: 9ba8c102bdeba2dda342e0db8269bbf5 ******/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 2d points of a TheLine.
") NbP2d;
		Standard_Integer NbP2d();

		/****** GeomInt_TheMultiLineOfWLApprox::NbP3d ******/
		/****** md5 signature: 89b8d7613eeb2675b9641bf825abe487 ******/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 3d points of a TheLine.
") NbP3d;
		Standard_Integer NbP3d();

		/****** GeomInt_TheMultiLineOfWLApprox::Tangency ******/
		/****** md5 signature: c6cbaf0059f48e429c903570a14ee737 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
MPointIndex: int
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
Returns the 3d tangency points of the multipoint <MPointIndex> only when 3d points exist.
") Tangency;
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****** GeomInt_TheMultiLineOfWLApprox::Tangency ******/
		/****** md5 signature: e9d5611508aa120465fde3464ad5ef52 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
Returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.
") Tangency;
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineOfWLApprox::Tangency ******/
		/****** md5 signature: c8caf611c9dc97dd9b8842534059cab9 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
Returns the 3d and 2d points of the multipoint <MPointIndex>.
") Tangency;
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineOfWLApprox::Value ******/
		/****** md5 signature: 511d3e7ebcd62cd9cfde5bca091161ea ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
") Value;
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** GeomInt_TheMultiLineOfWLApprox::Value ******/
		/****** md5 signature: 6626a2a082c59909a2d396794f2d2a4e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
Returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.
") Value;
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** GeomInt_TheMultiLineOfWLApprox::Value ******/
		/****** md5 signature: 9ace448e14090fa28f4ee0cbe190ed29 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
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
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** GeomInt_TheMultiLineOfWLApprox::WhatStatus ******/
		/****** md5 signature: 76f55e4a417176afbc003868c157efc5 ******/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "Return
-------
Approx_Status

Description
-----------
No available documentation.
") WhatStatus;
		Approx_Status WhatStatus();

};


%extend GeomInt_TheMultiLineOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class GeomInt_TheMultiLineToolOfWLApprox *
*******************************************/
class GeomInt_TheMultiLineToolOfWLApprox {
	public:
		/****** GeomInt_TheMultiLineToolOfWLApprox::Curvature ******/
		/****** md5 signature: 540f8f1f5f9e6b29b07e6966846f1f09 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
returns the 3d curvature of the multipoint <MPointIndex> when only 3d points exist.
") Curvature;
		static Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Curvature ******/
		/****** md5 signature: c07b9a55ac59da6337af380487b5f09c ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 2d curvature points of the multipoint <MPointIndex> only when 2d points exist.
") Curvature;
		static Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Curvature ******/
		/****** md5 signature: a6c585cced878685c8942720833d81d6 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 3d and 2d curvature of the multipoint <MPointIndex>.
") Curvature;
		static Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Dump ******/
		/****** md5 signature: 83bb31963a02a9571556f72963cd8928 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Return
-------
None

Description
-----------
Dump of the current multi-line.
") Dump;
		static void Dump(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::FirstPoint ******/
		/****** md5 signature: 7f320dfe381ccce1af50c7e445e6a63f ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Return
-------
int

Description
-----------
Returns the number of multipoints of the TheMultiLine.
") FirstPoint;
		static Standard_Integer FirstPoint(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::LastPoint ******/
		/****** md5 signature: f44699157422da1732c4d8c428fd2a1d ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Return
-------
int

Description
-----------
Returns the number of multipoints of the TheMultiLine.
") LastPoint;
		static Standard_Integer LastPoint(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::MakeMLBetween ******/
		/****** md5 signature: cac050178e72daca646228b097714ad8 ******/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
I1: int
I2: int
NbPMin: int

Return
-------
GeomInt_TheMultiLineOfWLApprox

Description
-----------
Is called if WhatStatus returned 'PointsAdded'.
") MakeMLBetween;
		static GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);

		/****** GeomInt_TheMultiLineToolOfWLApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: 22c9099dde84e1b3c0fe48c406759fa2 ******/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
I1: int
I2: int
indbad: int
OtherLine: GeomInt_TheMultiLineOfWLApprox

Return
-------
bool

Description
-----------
Is called when the Bezier curve contains a loop.
") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer indbad, GeomInt_TheMultiLineOfWLApprox & OtherLine);

		/****** GeomInt_TheMultiLineToolOfWLApprox::NbP2d ******/
		/****** md5 signature: d08a23fc3cec468ea2dc9d62333ca0b6 ******/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Return
-------
int

Description
-----------
Returns the number of 2d points of a TheMultiLine.
") NbP2d;
		static Standard_Integer NbP2d(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::NbP3d ******/
		/****** md5 signature: 104c9830afe0ee70317cec9bd26a0f31 ******/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Return
-------
int

Description
-----------
Returns the number of 3d points of a TheMultiLine.
") NbP3d;
		static Standard_Integer NbP3d(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Tangency ******/
		/****** md5 signature: 353ffbc60b2066d01b722d42beaf0003 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
") Tangency;
		static Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Tangency ******/
		/****** md5 signature: 66667d666a7ba7b699e82ca544cfb484 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.
") Tangency;
		static Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Tangency ******/
		/****** md5 signature: c205bac8076782b30c36cb6c5b727e8f ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
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
		static Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Value ******/
		/****** md5 signature: e3b5836b7076ecd000b242828d45b542 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
") Value;
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Value ******/
		/****** md5 signature: e5458e490d179e2affedc4bbf2e0f104 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.
") Value;
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Value ******/
		/****** md5 signature: 18d25f4dbf3d41db67b9c06463625c87 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
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
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::WhatStatus ******/
		/****** md5 signature: baef7139cfc25c86bff783f36400301b ******/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "
Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
I1: int
I2: int

Return
-------
Approx_Status

Description
-----------
No available documentation.
") WhatStatus;
		static Approx_Status WhatStatus(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer I1, const Standard_Integer I2);

};


%extend GeomInt_TheMultiLineToolOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomInt_ThePrmPrmSvSurfacesOfWLApprox *
**********************************************/
class GeomInt_ThePrmPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::GeomInt_ThePrmPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 4fba916203d8e976746fb2838ff206f9 ******/
		%feature("compactdefaultargs") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
Surf2: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_ThePrmPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor3d_Surface> & Surf2);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::Compute ******/
		/****** md5 signature: 1b6699512251d1cde0fa87fb6fb9f2bf ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
Tg: gp_Vec
Tguv1: gp_Vec2d
Tguv2: gp_Vec2d

Return
-------
u1: float
v1: float
u2: float
v2: float

Description
-----------
returns True if Tg,Tguv1 Tguv2 can be computed.
") Compute;
		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::Pnt ******/
		/****** md5 signature: 9b8bce66add52a246baf1e5f56b41c57 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Pnt;
		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::SeekPoint ******/
		/****** md5 signature: 1cbe34841922a959c2a9bca52603cce9 ******/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Point: IntSurf_PntOn2S

Return
-------
bool

Description
-----------
No available documentation.
") SeekPoint;
		Standard_Boolean SeekPoint(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, IntSurf_PntOn2S & Point);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::Tangency ******/
		/****** md5 signature: c0c9891902a6459b409f1a9c52228000 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") Tangency;
		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::TangencyOnSurf1 ******/
		/****** md5 signature: 92ffba31e07343330c44d9dee4123c55 ******/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::TangencyOnSurf2 ******/
		/****** md5 signature: 0c3b4c57afa7cd03a0f9030ecd47326b ******/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "
Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

};


%extend GeomInt_ThePrmPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox *
*************************************************************/
class GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox : public math_FunctionSetWithDerivatives {
	public:
		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 6082126d7f99fad2aa2897d2cb23375d ******/
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 8ded961e5c3205c0b178bffeb780a030 ******/
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
PS: Adaptor3d_Surface
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_Surface> & PS, const IntSurf_Quadric & IS);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 2f8aa55f338308969cc539957c11e030 ******/
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox(const IntSurf_Quadric & IS);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Direction2d ******/
		/****** md5 signature: e46e583c3b745511fb8654831bfa19d7 ******/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") Direction2d;
		const gp_Dir2d Direction2d();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Direction3d ******/
		/****** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ******/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction3d;
		const gp_Vec Direction3d();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::ISurface ******/
		/****** md5 signature: 0401f703cbd4484a6014535602bb165f ******/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "Return
-------
IntSurf_Quadric

Description
-----------
No available documentation.
") ISurface;
		const IntSurf_Quadric & ISurface();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::IsTangent ******/
		/****** md5 signature: 52337431677eb50512a9391c1db95a81 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		Standard_Boolean IsTangent();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::PSurface ******/
		/****** md5 signature: ba545ec7900073a2f2c5530d5104284d ******/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") PSurface;
		const opencascade::handle<Adaptor3d_Surface> & PSurface();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Root;
		Standard_Real Root();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Set ******/
		/****** md5 signature: 9ddb344b11924e5532d547145d17d9e5 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
PS: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & PS);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Set ******/
		/****** md5 signature: 7e3e1092ebe5da1f71e965a1091893e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Tolerance: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Tolerance);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::SetImplicitSurface ******/
		/****** md5 signature: 0ad3b55688a2be8e3aa7ec9c9bcbd283 ******/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "
Parameters
----------
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") SetImplicitSurface;
		void SetImplicitSurface(const IntSurf_Quadric & IS);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value Tol so that if Abs(Func.Root())<Tol the function is considered null.
") Tolerance;
		Standard_Real Tolerance();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomInt_WLApprox *
*************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class GeomInt_WLApprox:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geomint_AdjustPeriodic(*args):
	return geomint.AdjustPeriodic(*args)

@deprecated
def GeomInt_IntSS_BuildPCurves(*args):
	return GeomInt_IntSS.BuildPCurves(*args)

@deprecated
def GeomInt_IntSS_BuildPCurves(*args):
	return GeomInt_IntSS.BuildPCurves(*args)

@deprecated
def GeomInt_IntSS_MakeBSpline(*args):
	return GeomInt_IntSS.MakeBSpline(*args)

@deprecated
def GeomInt_IntSS_MakeBSpline2d(*args):
	return GeomInt_IntSS.MakeBSpline2d(*args)

@deprecated
def GeomInt_IntSS_TreatRLine(*args):
	return GeomInt_IntSS.TreatRLine(*args)

@deprecated
def GeomInt_IntSS_TrimILineOnSurfBoundaries(*args):
	return GeomInt_IntSS.TrimILineOnSurfBoundaries(*args)

@deprecated
def GeomInt_LineTool_DecompositionOfWLine(*args):
	return GeomInt_LineTool.DecompositionOfWLine(*args)

@deprecated
def GeomInt_LineTool_FirstParameter(*args):
	return GeomInt_LineTool.FirstParameter(*args)

@deprecated
def GeomInt_LineTool_LastParameter(*args):
	return GeomInt_LineTool.LastParameter(*args)

@deprecated
def GeomInt_LineTool_NbVertex(*args):
	return GeomInt_LineTool.NbVertex(*args)

@deprecated
def GeomInt_LineTool_Vertex(*args):
	return GeomInt_LineTool.Vertex(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Curvature(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Curvature(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Curvature(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Curvature(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Curvature(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Curvature(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Dump(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Dump(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_FirstPoint(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.FirstPoint(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_LastPoint(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.LastPoint(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_MakeMLBetween(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.MakeMLBetween(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_MakeMLOneMorePoint(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.MakeMLOneMorePoint(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_NbP2d(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.NbP2d(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_NbP3d(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.NbP3d(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Tangency(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Tangency(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Tangency(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Tangency(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Tangency(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Tangency(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Value(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Value(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Value(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Value(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_Value(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.Value(*args)

@deprecated
def GeomInt_TheMultiLineToolOfWLApprox_WhatStatus(*args):
	return GeomInt_TheMultiLineToolOfWLApprox.WhatStatus(*args)

}
