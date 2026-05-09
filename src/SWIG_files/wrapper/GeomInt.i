/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomint.html"
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
#include<TColStd_module.hxx>
#include<AppParCurves_module.hxx>
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
%import TColStd.i
%import AppParCurves.i
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
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(GeomInt_VectorOfReal) NCollection_DynamicArray<double>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<GeomInt_ParameterAndOrientation> GeomInt_SequenceOfParameterAndOrientation;
typedef NCollection_DynamicArray<double> GeomInt_VectorOfReal;
/* end typedefs declaration */

/****************
* class GeomInt *
****************/
%rename(geomint) GeomInt;
class GeomInt {
	public:
		/****** GeomInt::AdjustPeriodic ******/
		/****** md5 signature: e05571b72270b3f9d68dac22f0b3b239 ******/
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "
Parameters
----------
thePar: double
theParMin: double
theParMax: double
thePeriod: double
theEps: double (optional, default to 0.0)

Return
-------
theNewPar: double
theOffset: double

Description
-----------
Adjusts the parameter <thePar> to the range [theParMin, theParMax].
") AdjustPeriodic;
		static bool AdjustPeriodic(const double thePar, const double theParMin, const double theParMax, const double thePeriod, Standard_Real &OutValue, Standard_Real &OutValue, const double theEps = 0.0);

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
		/****** md5 signature: 606abeb32da1696e0990dcd8caf7d369 ******/
		%feature("compactdefaultargs") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
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
") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox::IsSolutionReached ******/
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
		/****** md5 signature: faaf859603ef52d3f78289c8bdeccac9 ******/
		%feature("compactdefaultargs") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int NbPol);

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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::FirstConstraint ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::NbVariables ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::SetLastLambda ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::Value ******/
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

		/****** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox::Values ******/
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
		/****** md5 signature: 69901665b4c4825cb6911720ef4c52f0 ******/
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
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 1e0d6c4639b085a55a143cebbd2d15ef ******/
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
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 3a8b6a57ac427eb3b2ec7db5c0298be4 ******/
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
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 29d064c457661edf32624c1b4b134615 ******/
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
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::ErrorGradient ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::FirstLambda ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox::Perform ******/
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
		/****** md5 signature: 58845da4899660a8749eb3611b918800 ******/
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
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
") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox::IsSolutionReached ******/
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
		/****** md5 signature: 0c9e9cd9735674685d04880f0a4846e1 ******/
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
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
") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox::IsSolutionReached ******/
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
		/****** md5 signature: ed0475bb7eb4d87a4e1a424c3b123048 ******/
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: double
Approx: bool (optional, default to true)
ApproxS1: bool (optional, default to false)
ApproxS2: bool (optional, default to false)

Return
-------
None

Description
-----------
performs general intersection of two surfaces just now.
") GeomInt_IntSS;
		 GeomInt_IntSS(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double Tol, const bool Approx = true, const bool ApproxS1 = false, const bool ApproxS2 = false);

		/****** GeomInt_IntSS::Boundary ******/
		/****** md5 signature: e7d20dfb8912aa687b442f67be6ec648 ******/
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
		const opencascade::handle<Geom_Curve> & Boundary(const int Index);

		/****** GeomInt_IntSS::BuildPCurves ******/
		/****** md5 signature: cf8260ab4776b1619452a925ea785965 ******/
		%feature("compactdefaultargs") BuildPCurves;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double
theUmin: double
theUmax: double
theVmin: double
theVmax: double
theSurface: Geom_Surface
theCurve: Geom_Curve
theCurve2d: Geom2d_Curve

Return
-------
theTol: double

Description
-----------
creates 2D-curve on given surface from given 3D-curve.
") BuildPCurves;
		static void BuildPCurves(const double theFirst, const double theLast, const double theUmin, const double theUmax, const double theVmin, const double theVmax, Standard_Real &OutValue, const opencascade::handle<Geom_Surface> & theSurface, const opencascade::handle<Geom_Curve> & theCurve, opencascade::handle<Geom2d_Curve> & theCurve2d);

		/****** GeomInt_IntSS::BuildPCurves ******/
		/****** md5 signature: 174904f23d2dbcd23899fcbf32811919 ******/
		%feature("compactdefaultargs") BuildPCurves;
		%feature("autodoc", "
Parameters
----------
f: double
l: double
S: Geom_Surface
C: Geom_Curve
C2d: Geom2d_Curve

Return
-------
Tol: double

Description
-----------
creates 2D-curve on given surface from given 3D-curve.
") BuildPCurves;
		static void BuildPCurves(const double f, const double l, Standard_Real &OutValue, const opencascade::handle<Geom_Surface> & S, const opencascade::handle<Geom_Curve> & C, opencascade::handle<Geom2d_Curve> & C2d);

		/****** GeomInt_IntSS::HasLineOnS1 ******/
		/****** md5 signature: feb665a3d0eb956014e9f14ad4922895 ******/
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
		bool HasLineOnS1(const int Index);

		/****** GeomInt_IntSS::HasLineOnS2 ******/
		/****** md5 signature: 733bfbe152937cd6f49ac662789a600a ******/
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
		bool HasLineOnS2(const int Index);

		/****** GeomInt_IntSS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** GeomInt_IntSS::Line ******/
		/****** md5 signature: d80f6ed49125ed2b23ecf3b9088f2dd9 ******/
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
		const opencascade::handle<Geom_Curve> & Line(const int Index);

		/****** GeomInt_IntSS::LineOnS1 ******/
		/****** md5 signature: 1ff3b61e19eefbb1a62d999490a8cfc1 ******/
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
		const opencascade::handle<Geom2d_Curve> & LineOnS1(const int Index);

		/****** GeomInt_IntSS::LineOnS2 ******/
		/****** md5 signature: ff6d1c051698a7c1a8465e59fddead75 ******/
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
		const opencascade::handle<Geom2d_Curve> & LineOnS2(const int Index);

		/****** GeomInt_IntSS::MakeBSpline ******/
		/****** md5 signature: 2673fecd3c629789fe81eb19a3b31fe4 ******/
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
		static opencascade::handle<Geom_Curve> MakeBSpline(const opencascade::handle<IntPatch_WLine> & WL, const int ideb, const int ifin);

		/****** GeomInt_IntSS::MakeBSpline2d ******/
		/****** md5 signature: 7074ad23a7dd7a09940560082b664c48 ******/
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
		static opencascade::handle<Geom2d_BSplineCurve> MakeBSpline2d(const opencascade::handle<IntPatch_WLine> & theWLine, const int ideb, const int ifin, const bool onFirst);

		/****** GeomInt_IntSS::NbBoundaries ******/
		/****** md5 signature: 43189ef7fcb7eeed3dc343df92fce525 ******/
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBoundaries;
		int NbBoundaries();

		/****** GeomInt_IntSS::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLines;
		int NbLines();

		/****** GeomInt_IntSS::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: b56f9feb78a8a3a862a4ffd1a8e3a4a9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: double
Approx: bool (optional, default to true)
ApproxS1: bool (optional, default to false)
ApproxS2: bool (optional, default to false)

Return
-------
None

Description
-----------
general intersection of two surfaces.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double Tol, const bool Approx = true, const bool ApproxS1 = false, const bool ApproxS2 = false);

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: d9f1e317b77a73d609e71eac46bc785f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HS1: GeomAdaptor_Surface
HS2: GeomAdaptor_Surface
Tol: double
Approx: bool (optional, default to true)
ApproxS1: bool (optional, default to false)
ApproxS2: bool (optional, default to false)

Return
-------
None

Description
-----------
intersection of adapted surfaces.
") Perform;
		void Perform(const opencascade::handle<GeomAdaptor_Surface> & HS1, const opencascade::handle<GeomAdaptor_Surface> & HS2, const double Tol, const bool Approx = true, const bool ApproxS1 = false, const bool ApproxS2 = false);

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: 4047397e83f8ea7ca09c52c644580fd6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: double
U1: double
V1: double
U2: double
V2: double
Approx: bool (optional, default to true)
ApproxS1: bool (optional, default to false)
ApproxS2: bool (optional, default to false)

Return
-------
None

Description
-----------
general intersection using a starting point.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double Tol, const double U1, const double V1, const double U2, const double V2, const bool Approx = true, const bool ApproxS1 = false, const bool ApproxS2 = false);

		/****** GeomInt_IntSS::Perform ******/
		/****** md5 signature: 53647c9b928c98918f759e27df6ca5f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HS1: GeomAdaptor_Surface
HS2: GeomAdaptor_Surface
Tol: double
U1: double
V1: double
U2: double
V2: double
Approx: bool (optional, default to true)
ApproxS1: bool (optional, default to false)
ApproxS2: bool (optional, default to false)

Return
-------
None

Description
-----------
intersection of adapted surfaces using a starting point.
") Perform;
		void Perform(const opencascade::handle<GeomAdaptor_Surface> & HS1, const opencascade::handle<GeomAdaptor_Surface> & HS2, const double Tol, const double U1, const double V1, const double U2, const double V2, const bool Approx = true, const bool ApproxS1 = false, const bool ApproxS2 = false);

		/****** GeomInt_IntSS::Pnt2d ******/
		/****** md5 signature: f05aa3291b8445acab9ef0e5e5121160 ******/
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
		gp_Pnt2d Pnt2d(const int Index, const bool OnFirst);

		/****** GeomInt_IntSS::Point ******/
		/****** md5 signature: 5dbead83432d512d83f6d5260a8475b5 ******/
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
		gp_Pnt Point(const int Index);

		/****** GeomInt_IntSS::TolReached2d ******/
		/****** md5 signature: 71f2e67c8f4f4710d5cf228e07b08caa ******/
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") TolReached2d;
		double TolReached2d();

		/****** GeomInt_IntSS::TolReached3d ******/
		/****** md5 signature: 4e947d53f233e22f0dadbde870316f95 ******/
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") TolReached3d;
		double TolReached3d();

		/****** GeomInt_IntSS::TreatRLine ******/
		/****** md5 signature: 836b69e7848004d4bd0d6aff709582fb ******/
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
theTolReached: double

Description
-----------
converts RLine to Geom(2d)_Curve.
") TreatRLine;
		static void TreatRLine(const opencascade::handle<IntPatch_RLine> & theRL, const opencascade::handle<GeomAdaptor_Surface> & theHS1, const opencascade::handle<GeomAdaptor_Surface> & theHS2, opencascade::handle<Geom_Curve> & theC3d, opencascade::handle<Geom2d_Curve> & theC2d1, opencascade::handle<Geom2d_Curve> & theC2d2, Standard_Real &OutValue);

		/****** GeomInt_IntSS::TrimILineOnSurfBoundaries ******/
		/****** md5 signature: b97d82e914a23fb06a48f0916420ecb4 ******/
		%feature("compactdefaultargs") TrimILineOnSurfBoundaries;
		%feature("autodoc", "
Parameters
----------
theC2d1: Geom2d_Curve
theC2d2: Geom2d_Curve
theBound1: Bnd_Box2d
theBound2: Bnd_Box2d
theArrayOfParameters: NCollection_DynamicArray<double>

Return
-------
None

Description
-----------
puts into theArrayOfParameters the parameters of intersection points of given theC2d1 and theC2d2 curves with the boundaries of the source surface.
") TrimILineOnSurfBoundaries;
		static void TrimILineOnSurfBoundaries(const opencascade::handle<Geom2d_Curve> & theC2d1, const opencascade::handle<Geom2d_Curve> & theC2d2, const Bnd_Box2d & theBound1, const Bnd_Box2d & theBound2, NCollection_DynamicArray<double> & theArrayOfParameters);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if splitting was successful.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: ef279100fcdd37d9e8ea613738ad3539 ******/
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of splits.
") NbParts;
		int NbParts();

		/****** GeomInt_LineConstructor::Part ******/
		/****** md5 signature: e8bb9e044652c72a1763de3ec337992d ******/
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
WFirst: double
WLast: double

Description
-----------
Return first and last parameters for given index of split.
") Part;
		void Part(const int I, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 46d22de6463d44357dd67d1b0525b83a ******/
		%feature("compactdefaultargs") DecompositionOfWLine;
		%feature("autodoc", "
Parameters
----------
theWLine: IntPatch_WLine
theSurface1: GeomAdaptor_Surface
theSurface2: GeomAdaptor_Surface
aTolSum: double
theLConstructor: GeomInt_LineConstructor
theNewLines: IntPatch_Line

Return
-------
bool

Description
-----------
No available documentation.
") DecompositionOfWLine;
		static bool DecompositionOfWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<GeomAdaptor_Surface> & theSurface1, const opencascade::handle<GeomAdaptor_Surface> & theSurface2, const double aTolSum, const GeomInt_LineConstructor & theLConstructor, NCollection_Sequence<opencascade::handle<IntPatch_Line>> & theNewLines);

		/****** GeomInt_LineTool::FirstParameter ******/
		/****** md5 signature: 20e748e32634f14a0845f9b64c25bc02 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const opencascade::handle<IntPatch_Line> & L);

		/****** GeomInt_LineTool::LastParameter ******/
		/****** md5 signature: 2cb1ea117fc336a45d4508fee172f128 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const opencascade::handle<IntPatch_Line> & L);

		/****** GeomInt_LineTool::NbVertex ******/
		/****** md5 signature: 363bcfc362652539d6a1f2c28c980e19 ******/
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
		static int NbVertex(const opencascade::handle<IntPatch_Line> & L);

		/****** GeomInt_LineTool::Vertex ******/
		/****** md5 signature: 70bc0dfa79532f980d3c2dda7e23c6dd ******/
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
		static const IntPatch_Point & Vertex(const opencascade::handle<IntPatch_Line> & L, const int I);

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
		/****** md5 signature: 1b8ebb305bbd67c1f61187632a6d436e ******/
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 1);

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 1f6360802debb3350301f1e774964d35 ******/
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations, const double lambda1, const double lambda2);

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::AverageError ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::IsDone ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox::MaxError3d ******/
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
		/****** md5 signature: df48f5b5d45fb6bc5a8c146dba9d9166 ******/
		%feature("compactdefaultargs") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 200);

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::AverageError ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::Error ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::IsDone ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox::MaxError3d ******/
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
		/****** md5 signature: 30faa010bffbc7435720fe8f0ab1242c ******/
		%feature("compactdefaultargs") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_MyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 200);

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::AverageError ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::Error ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::IsDone ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox::MaxError3d ******/
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
		/****** md5 signature: ea7afdf8933858b963dd712099b270de ******/
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::FirstConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::Gradient ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::LastConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::NbVariables ******/
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

		/****** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox::Values ******/
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
		/****** md5 signature: e6e6322064368b65bd705be1f011537d ******/
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::FirstConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::Gradient ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::LastConstraint ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::MaxError2d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::MaxError3d ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::NbVariables ******/
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

		/****** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox::Values ******/
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
		/****** md5 signature: 9f6d6044fc5ef3cc39e153caf0cdb058 ******/
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
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: b305ad2ab92d8ce393b451d9ee741445 ******/
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
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: d9e256331f1562e72993c704f3691814 ******/
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
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: a9317d4635097eef902ce4fca8b01333 ******/
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
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::ErrorGradient ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::FirstLambda ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox::Perform ******/
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
		/****** md5 signature: 1a387c01edb96287a0b200a2d9299f16 ******/
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
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: b47cccf2ab53f0a75e2654ec3ff3354c ******/
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
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 921aee33ce5285a78927fe06dbd60196 ******/
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
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******/
		/****** md5 signature: 15357c09a5382af2ea2fb121a79aa626 ******/
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
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::ErrorGradient ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::FirstLambda ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Perform ******/
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

		/****** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox::Perform ******/
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
		/****** md5 signature: d65f799f621b63e90fecad787ba967dc ******/
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "
Parameters
----------
P: double
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation(const double P, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2);

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
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

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
		/****** md5 signature: 23f6d226129c840ceda14377fe9db74e ******/
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox::ConstraintDerivative ******/
		/****** md5 signature: 855ddd04145278d0e8f361d24afbc420 ******/
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
		const math_Matrix & ConstraintDerivative(const GeomInt_TheMultiLineOfWLApprox & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

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
		/****** md5 signature: 772642da674d32e138b38ade8fcd37d0 ******/
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox::ConstraintDerivative ******/
		/****** md5 signature: 855ddd04145278d0e8f361d24afbc420 ******/
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
		const math_Matrix & ConstraintDerivative(const GeomInt_TheMultiLineOfWLApprox & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

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
		/****** md5 signature: ef04849f8bf5e40a07e2d2c02729b50f ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-3, const double Tolerance2d = 1.0e-6, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::GeomInt_TheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 73bac66b54715d74be239942ef5de631 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::GeomInt_TheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 534f9eb61f7e6363e77c2f96d96e9965 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::GeomInt_TheComputeLineBezierOfWLApprox ******/
		/****** md5 signature: 639a24703252c95920804ecb1a93e679 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** GeomInt_TheComputeLineBezierOfWLApprox::ChangeValue ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Error ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Init ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::IsAllApproximated ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::IsToleranceReached ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::NbMultiCurves ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::Parameters ******/
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

		/****** GeomInt_TheComputeLineBezierOfWLApprox::SetTolerances ******/
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
		/****** md5 signature: 63515ab2f17287046da3bb4b50ee5ccb ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-3, const double Tolerance2d = 1.0e-6, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** GeomInt_TheComputeLineOfWLApprox::GeomInt_TheComputeLineOfWLApprox ******/
		/****** md5 signature: f9ed2aa1635bed0d9f107c69edd6e920 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** GeomInt_TheComputeLineOfWLApprox::GeomInt_TheComputeLineOfWLApprox ******/
		/****** md5 signature: 5a65793d44b960881dd236f2fda2d44c ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** GeomInt_TheComputeLineOfWLApprox::GeomInt_TheComputeLineOfWLApprox ******/
		/****** md5 signature: 4bcba75c17786382783d58c99e497336 ******/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

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

		/****** GeomInt_TheComputeLineOfWLApprox::Init ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::IsToleranceReached ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::Parameters ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetDegrees ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetKnots ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetKnotsAndMultiplicities ******/
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

		/****** GeomInt_TheComputeLineOfWLApprox::SetTolerances ******/
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
		/****** md5 signature: 1783678026f1f00e7bd2b3570378cdb6 ******/
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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

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
		/****** md5 signature: 764eb67880e4e84c6807135e3e9a351c ******/
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
		bool IsTangent(const math_Vector & UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric & BestChoix);

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns somme des fi*fi.
") Root;
		double Root();

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 11b8b8096e3a645c50e1f0d3a504f69f ******/
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
u1: double
v1: double
u2: double
v2: double

Description
-----------
returns True if Tg,Tguv1 Tguv2 can be computed.
") Compute;
		bool Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::Pnt ******/
		/****** md5 signature: d77bbf722fb56193d518648efbccfdcc ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Pnt;
		void Pnt(const double u1, const double v1, const double u2, const double v2, gp_Pnt & P);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::SeekPoint ******/
		/****** md5 signature: 085f7d205addd666e9f01b7748c802fa ******/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Point: IntSurf_PntOn2S

Return
-------
bool

Description
-----------
No available documentation.
") SeekPoint;
		bool SeekPoint(const double u1, const double v1, const double u2, const double v2, IntSurf_PntOn2S & Point);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::Tangency ******/
		/****** md5 signature: 4de18c917f129589194950dbcfd65a70 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") Tangency;
		bool Tangency(const double u1, const double v1, const double u2, const double v2, gp_Vec & Tg);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::TangencyOnSurf1 ******/
		/****** md5 signature: 55526a3e85efacfd16f0c8d760461290 ******/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf1;
		bool TangencyOnSurf1(const double u1, const double v1, const double u2, const double v2, gp_Vec2d & Tg);

		/****** GeomInt_TheImpPrmSvSurfacesOfWLApprox::TangencyOnSurf2 ******/
		/****** md5 signature: eb07438b4c9db2a39b9b5b8bd1ed4cd7 ******/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf2;
		bool TangencyOnSurf2(const double u1, const double v1, const double u2, const double v2, gp_Vec2d & Tg);

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
		/****** md5 signature: ccbaaa8d8633e963fd842df34be0a484 ******/
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolTangency: double

Return
-------
None

Description
-----------
compute the solution point with the close point.
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const TColStd_Array1OfReal & Param, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const double TolTangency);

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox ******/
		/****** md5 signature: 371e69ab9621de386354ac7796064e5a ******/
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolTangency: double

Return
-------
None

Description
-----------
initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }.
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const double TolTangency);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		bool IsDone();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when there is no solution to the problem.
") IsEmpty;
		bool IsEmpty();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::IsTangent ******/
		/****** md5 signature: baca3d34e02c226d40f886fc1be3d673 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are tangent at the intersection point.
") IsTangent;
		bool IsTangent();

		/****** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox::Perform ******/
		/****** md5 signature: d659bc97d56b1d57957cfd897c4e043b ******/
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
		/****** md5 signature: ba4d806ab7c094897017f5371cb7c643 ******/
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
		/****** md5 signature: 6a292aa1529e44438f7261035475fb3e ******/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
line: IntPatch_WLine
PtrSvSurfaces: void *
NbP3d: int
NbP2d: int
ApproxU1V1: bool
ApproxU2V2: bool
xo: double
yo: double
zo: double
u1o: double
v1o: double
u2o: double
v2o: double
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
		 GeomInt_TheMultiLineOfWLApprox(const opencascade::handle<IntPatch_WLine> & line, void * const PtrSvSurfaces, const int NbP3d, const int NbP2d, const bool ApproxU1V1, const bool ApproxU2V2, const double xo, const double yo, const double zo, const double u1o, const double v1o, const double u2o, const double v2o, const bool P2DOnFirst, const int IndMin = 0, const int IndMax = 0);

		/****** GeomInt_TheMultiLineOfWLApprox::GeomInt_TheMultiLineOfWLApprox ******/
		/****** md5 signature: e6a9fb45e66f5ba26c420d19351544cf ******/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "
Parameters
----------
line: IntPatch_WLine
NbP3d: int
NbP2d: int
ApproxU1V1: bool
ApproxU2V2: bool
xo: double
yo: double
zo: double
u1o: double
v1o: double
u2o: double
v2o: double
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
		 GeomInt_TheMultiLineOfWLApprox(const opencascade::handle<IntPatch_WLine> & line, const int NbP3d, const int NbP2d, const bool ApproxU1V1, const bool ApproxU2V2, const double xo, const double yo, const double zo, const double u1o, const double v1o, const double u2o, const double v2o, const bool P2DOnFirst, const int IndMin = 0, const int IndMax = 0);

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
		/****** md5 signature: aa7adff2c31e170754932c9201745763 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FirstPoint;
		int FirstPoint();

		/****** GeomInt_TheMultiLineOfWLApprox::LastPoint ******/
		/****** md5 signature: f65a3f570516bd4ffe035d0125837342 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LastPoint;
		int LastPoint();

		/****** GeomInt_TheMultiLineOfWLApprox::MakeMLBetween ******/
		/****** md5 signature: badef83f76ccdf4b6fd9b4180d05710b ******/
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
		GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const int Low, const int High, const int NbPointsToInsert);

		/****** GeomInt_TheMultiLineOfWLApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: db9169986726d12a6e22d645f1b3fa74 ******/
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
		bool MakeMLOneMorePoint(const int Low, const int High, const int indbad, GeomInt_TheMultiLineOfWLApprox & OtherLine);

		/****** GeomInt_TheMultiLineOfWLApprox::NbP2d ******/
		/****** md5 signature: 71d76df8d66740461c246ee478d5281c ******/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 2d points of a TheLine.
") NbP2d;
		int NbP2d();

		/****** GeomInt_TheMultiLineOfWLApprox::NbP3d ******/
		/****** md5 signature: 6ed680c69fb10cf5bf00d59661c55e37 ******/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 3d points of a TheLine.
") NbP3d;
		int NbP3d();

		/****** GeomInt_TheMultiLineOfWLApprox::Tangency ******/
		/****** md5 signature: 3deb19aee2db8a1823452ad28ba29d3d ******/
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
		bool Tangency(const int MPointIndex, TColgp_Array1OfVec & tabV);

		/****** GeomInt_TheMultiLineOfWLApprox::Tangency ******/
		/****** md5 signature: 6adca0bdfc2f14a9b2d2e748dd223ff3 ******/
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
		bool Tangency(const int MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineOfWLApprox::Tangency ******/
		/****** md5 signature: f4a861843c0d21680dada851aa5373fe ******/
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
		bool Tangency(const int MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineOfWLApprox::Value ******/
		/****** md5 signature: bf9db9427c08427650d3a62ba7773999 ******/
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
		void Value(const int MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** GeomInt_TheMultiLineOfWLApprox::Value ******/
		/****** md5 signature: a98900519cdc0086a3f3828b0190bebb ******/
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
		void Value(const int MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** GeomInt_TheMultiLineOfWLApprox::Value ******/
		/****** md5 signature: 9d7b6d0990f59d91fd43833bb2d1f05b ******/
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
		void Value(const int MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

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
		/****** md5 signature: 18545c213218446cc32dc69fe5779617 ******/
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
		static bool Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Curvature ******/
		/****** md5 signature: 004fcbbecb9b445ea9e9fa5882b98bbb ******/
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
		static bool Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Curvature ******/
		/****** md5 signature: f1e6ed1ee00aa94f7ea4cc7b50a8d773 ******/
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
		static bool Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

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
		/****** md5 signature: 3cbdca8e7ca8e800cea71e84ff638deb ******/
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
		static int FirstPoint(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::LastPoint ******/
		/****** md5 signature: ad9653145df4476757961a73fcc92d7c ******/
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
		static int LastPoint(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::MakeMLBetween ******/
		/****** md5 signature: 5cb6e36209e112e8dc38bb30a961abba ******/
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
		static GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const GeomInt_TheMultiLineOfWLApprox & ML, const int I1, const int I2, const int NbPMin);

		/****** GeomInt_TheMultiLineToolOfWLApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: 8fc5392191a1037b844d294cc48852d3 ******/
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
		static bool MakeMLOneMorePoint(const GeomInt_TheMultiLineOfWLApprox & ML, const int I1, const int I2, const int indbad, GeomInt_TheMultiLineOfWLApprox & OtherLine);

		/****** GeomInt_TheMultiLineToolOfWLApprox::NbP2d ******/
		/****** md5 signature: fb31337e095df5df983d3f3033efee2c ******/
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
		static int NbP2d(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::NbP3d ******/
		/****** md5 signature: e08c0d485f49220c96b4631553865ffa ******/
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
		static int NbP3d(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Tangency ******/
		/****** md5 signature: 21e87fe6b892e60168b5816770819e15 ******/
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
		static bool Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Tangency ******/
		/****** md5 signature: 38f6796d869f78c679632c804cee5d1d ******/
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
		static bool Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Tangency ******/
		/****** md5 signature: 43789a04b5e1bc606095a53d65fa04a3 ******/
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
		static bool Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Value ******/
		/****** md5 signature: d82d5fd0603904d3c8e9a2799e76a078 ******/
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
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Value ******/
		/****** md5 signature: e2c0494bbd1751a65a6fd73538172c1d ******/
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
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::Value ******/
		/****** md5 signature: f3c601701db780535d7442f21f99276c ******/
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
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const int MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** GeomInt_TheMultiLineToolOfWLApprox::WhatStatus ******/
		/****** md5 signature: e97cc886b4a0923ba9f35918844ae084 ******/
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
		static Approx_Status WhatStatus(const GeomInt_TheMultiLineOfWLApprox & ML, const int I1, const int I2);

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
		/****** md5 signature: 11b8b8096e3a645c50e1f0d3a504f69f ******/
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
u1: double
v1: double
u2: double
v2: double

Description
-----------
returns True if Tg,Tguv1 Tguv2 can be computed.
") Compute;
		bool Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::Pnt ******/
		/****** md5 signature: d77bbf722fb56193d518648efbccfdcc ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Pnt;
		void Pnt(const double u1, const double v1, const double u2, const double v2, gp_Pnt & P);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::SeekPoint ******/
		/****** md5 signature: 085f7d205addd666e9f01b7748c802fa ******/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Point: IntSurf_PntOn2S

Return
-------
bool

Description
-----------
No available documentation.
") SeekPoint;
		bool SeekPoint(const double u1, const double v1, const double u2, const double v2, IntSurf_PntOn2S & Point);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::Tangency ******/
		/****** md5 signature: 4de18c917f129589194950dbcfd65a70 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") Tangency;
		bool Tangency(const double u1, const double v1, const double u2, const double v2, gp_Vec & Tg);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::TangencyOnSurf1 ******/
		/****** md5 signature: 55526a3e85efacfd16f0c8d760461290 ******/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf1;
		bool TangencyOnSurf1(const double u1, const double v1, const double u2, const double v2, gp_Vec2d & Tg);

		/****** GeomInt_ThePrmPrmSvSurfacesOfWLApprox::TangencyOnSurf2 ******/
		/****** md5 signature: eb07438b4c9db2a39b9b5b8bd1ed4cd7 ******/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf2;
		bool TangencyOnSurf2(const double u1, const double v1, const double u2, const double v2, gp_Vec2d & Tg);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

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
		/****** md5 signature: 57430bba54a67cd70f0eb7addde8c3c7 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		bool IsTangent();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Root;
		double Root();

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
		/****** md5 signature: bf508c67cd63b5bb26c659d2af54ab81 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Tolerance: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Tolerance);

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
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value Tol so that if std::abs(Func.Root())<Tol the function is considered null.
") Tolerance;
		double Tolerance();

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
