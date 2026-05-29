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
%define BREPAPPROXDOCSTRING
"BRepApprox module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepapprox.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BRepApprox_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Approx_module.hxx>
#include<math_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<IntSurf_module.hxx>
#include<TColStd_module.hxx>
#include<AppParCurves_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<IntImp_module.hxx>
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
#include<Bnd_module.hxx>
#include<IntPatch_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Approx.i
%import math.i
%import Geom.i
%import Geom2d.i
%import IntSurf.i
%import TColStd.i
%import AppParCurves.i
%import BRepAdaptor.i
%import gp.i
%import Adaptor3d.i
%import GeomAbs.i
%import IntImp.i
%import ApproxInt.i
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
		/****** BRepApprox_Approx::BRepApprox_Approx ******/
		/****** md5 signature: bd97e4db4f73bdf01c7574bc6f9beca1 ******/
		%feature("compactdefaultargs") BRepApprox_Approx;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_Approx;
		 BRepApprox_Approx();

		/****** BRepApprox_Approx::IsDone ******/
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

		/****** BRepApprox_Approx::NbMultiCurves ******/
		/****** md5 signature: eed274d77446bf2416a954e7f34c2bf0 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbMultiCurves;
		int NbMultiCurves();

		/****** BRepApprox_Approx::Parameters ******/
		/****** md5 signature: 93bf4c2c9d0c4e0fc08fa1ff730285f0 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
firstP: int
lastP: int
Par: Approx_ParametrizationType
TheParameters: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") Parameters;
		static void Parameters(const BRepApprox_TheMultiLineOfApprox & Line, const int firstP, const int lastP, const Approx_ParametrizationType Par, math_Vector & TheParameters);

		/****** BRepApprox_Approx::SetParameters ******/
		/****** md5 signature: 94210ea120b2d257f05e1acbccf3cb0a ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double
DegMin: int
DegMax: int
NbIterMax: int
NbPntMax: int (optional, default to 30)
ApproxWithTangency: bool (optional, default to true)
Parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)

Return
-------
None

Description
-----------
No available documentation.
") SetParameters;
		void SetParameters(const double Tol3d, const double Tol2d, const int DegMin, const int DegMax, const int NbIterMax, const int NbPntMax = 30, const bool ApproxWithTangency = true, const Approx_ParametrizationType Parametrization = Approx_ChordLength);

		/****** BRepApprox_Approx::TolReached2d ******/
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

		/****** BRepApprox_Approx::TolReached3d ******/
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

		/****** BRepApprox_Approx::Value ******/
		/****** md5 signature: 9e5c4f70c7e3f940e4ce9b7e43b0a7d4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
No available documentation.
") Value;
		AppParCurves_MultiBSpCurve Value(const int Index);

};


%extend BRepApprox_Approx {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Perform(self):
		pass
	}
};

/******************************
* class BRepApprox_ApproxLine *
******************************/
class BRepApprox_ApproxLine : public Standard_Transient {
	public:
		/****** BRepApprox_ApproxLine::BRepApprox_ApproxLine ******/
		/****** md5 signature: 06463c2cf339616f1188d08a9cedb916 ******/
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "
Parameters
----------
CurveXYZ: Geom_BSplineCurve
CurveUV1: Geom2d_BSplineCurve
CurveUV2: Geom2d_BSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine(const opencascade::handle<Geom_BSplineCurve> & CurveXYZ, const opencascade::handle<Geom2d_BSplineCurve> & CurveUV1, const opencascade::handle<Geom2d_BSplineCurve> & CurveUV2);

		/****** BRepApprox_ApproxLine::BRepApprox_ApproxLine ******/
		/****** md5 signature: da5f81a1a5ac0ded4f450e19bb4af7c3 ******/
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "
Parameters
----------
lin: IntSurf_LineOn2S
theTang: bool (optional, default to false)

Return
-------
None

Description
-----------
theTang variable has been entered only for compatibility with the alias IntPatch_WLine. They are not used in this class.
") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine(const opencascade::handle<IntSurf_LineOn2S> & lin, const bool theTang = false);

		/****** BRepApprox_ApproxLine::NbPnts ******/
		/****** md5 signature: 62ca8b9c803953d23e1f278d77f7b8f6 ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPnts;
		int NbPnts();

		/****** BRepApprox_ApproxLine::Point ******/
		/****** md5 signature: b74b588c04301d3568484df9ef527a7e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
No available documentation.
") Point;
		IntSurf_PntOn2S Point(const int Index);

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
		/****** BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: d04b93cfb53ff7a2403930bf9bf642d4 ******/
		%feature("compactdefaultargs") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
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
") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox::IsSolutionReached ******/
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
		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 8bb85f580c7149bcbcf6ef6fd56026fb ******/
		%feature("compactdefaultargs") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int NbPol);

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::CurveValue ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::DerivativeFunctionMatrix ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::FirstConstraint ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::FunctionMatrix ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::Gradient ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::Index ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::LastConstraint ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::MaxError3d ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::NbVariables ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::NewParameters ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::SetFirstLambda ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::SetLastLambda ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::Value ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::Values ******/
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
		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 3e29d9107d5e33dc3f34064fd99f49da ******/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 1a88db7ffec3315c922cbef5a8464e3e ******/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 929100c15e77dbc9d6a7853a477fe946 ******/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 3762e4e9700c96e5cbc459e940cb49fa ******/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BSplineValue ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BezierValue ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::DerivativeFunctionMatrix ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Distance ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::ErrorGradient ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::FirstLambda ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::FunctionMatrix ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::IsDone ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::KIndex ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::LastLambda ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Points ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Poles ******/
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
		/****** BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: bd3f59b2e69f2ae20204239a26bb5c84 ******/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
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
") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox::IsSolutionReached ******/
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
		/****** BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 45e837f68011e8aa08fdeca4c5e577ae ******/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
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
") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const double Tolerance3d, const double Tolerance2d, const double Eps, const int NbIterations = 200);

		/****** BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox::IsSolutionReached ******/
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
		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::BRepApprox_MyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 2d4c56d73b804907e1aa9d08659cbdfa ******/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 1);

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::BRepApprox_MyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: dec6c50afbd43b3dd1d8a1af1d7df9d2 ******/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations, const double lambda1, const double lambda2);

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::AverageError ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::IsDone ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::MaxError3d ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::Value ******/
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
		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::BRepApprox_MyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: a494f82d347f565b5b11ec872d7875d9 ******/
		%feature("compactdefaultargs") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_MyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 200);

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::AverageError ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::Error ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::IsDone ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::MaxError2d ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::MaxError3d ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::Value ******/
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
		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::BRepApprox_MyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: a07326014fd6e229c7293a4a1f663235 ******/
		%feature("compactdefaultargs") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_MyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, math_Vector & Parameters, const int Deg, const double Tol3d, const double Tol2d, const int NbIterations = 200);

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::AverageError ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::IsDone ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::MaxError3d ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::Value ******/
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
		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: b1f6fa1b7df099004ea6bc289dc5d382 ******/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::CurveValue ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::Error ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::FirstConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::Gradient ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::LastConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::MaxError2d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::MaxError3d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::NbVariables ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::NewParameters ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::Value ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::Values ******/
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
		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: a883ebf46455b80fed8ae0c2b1707231 ******/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & TheConstraints, const math_Vector & Parameters, const int Deg);

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::CurveValue ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::FirstConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::Gradient ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::LastConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::MaxError3d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::NbVariables ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::NewParameters ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::Value ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::Values ******/
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
		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: 6564a47280505fdf93f88286235ae9bf ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: da66fa58bbf968f2ec33d04861660cb8 ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: 5e6ed6e4e0e7da138a2809231ed6cc17 ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: a7c9def60d522eef59c937c52eae8bba ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BSplineValue ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BezierValue ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::DerivativeFunctionMatrix ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Distance ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Error ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::ErrorGradient ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::FirstLambda ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::FunctionMatrix ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::IsDone ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::KIndex ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::LastLambda ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Points ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Poles ******/
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
		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 6c761c1d1988939f055edc75b314df20 ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 4bd1c87a652107e21401652897a47a1f ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 756b77de8fb8de1b54de2644261e3d0c ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 3da8566bb8693901ade7e18d36d47577 ******/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const int FirstPoint, const int LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BSplineValue ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BezierValue ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::DerivativeFunctionMatrix ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Distance ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::ErrorGradient ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::FirstLambda ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::FunctionMatrix ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::IsDone ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::KIndex ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::LastLambda ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Points ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Poles ******/
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
		/****** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: ab7b420979bb033f52a127a2386c569d ******/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::ConstraintDerivative ******/
		/****** md5 signature: 92ea400ded2e0fa6962fdeccd6b3e54a ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

		/****** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::ConstraintMatrix ******/
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

		/****** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::Duale ******/
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

		/****** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::InverseMatrix ******/
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

		/****** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::IsDone ******/
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


%extend BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/************************************************************************
* class BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox *
************************************************************************/
class BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		/****** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 1792fca104ee7f45869fd05e2dd6d239 ******/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, AppParCurves_MultiCurve & SCurv, const int FirstPoint, const int LastPoint, const opencascade::handle<NCollection_HArray1<AppParCurves_ConstraintCouple>> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const double Tolerance = 1.0e-10);

		/****** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::ConstraintDerivative ******/
		/****** md5 signature: 92ea400ded2e0fa6962fdeccd6b3e54a ******/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox & SSP, const math_Vector & Parameters, const int Deg, const math_Matrix & DA);

		/****** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::ConstraintMatrix ******/
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

		/****** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::Duale ******/
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

		/****** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::InverseMatrix ******/
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

		/****** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::IsDone ******/
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


%extend BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Error(self):
		pass
	}
};

/*******************************
* class BRepApprox_SurfaceTool *
*******************************/
class BRepApprox_SurfaceTool {
	public:
		/****** BRepApprox_SurfaceTool::AxeOfRevolution ******/
		/****** md5 signature: e74ddc82b514035b2ffd7f88d2b60038 ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::BSpline ******/
		/****** md5 signature: 8823cc18f3c251d3ffceeccbb2153a6e ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::BasisCurve ******/
		/****** md5 signature: e478db15ad97826612a335af3f6203d4 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		static opencascade::handle<Adaptor3d_Curve> BasisCurve(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::Bezier ******/
		/****** md5 signature: 62f42b64dcf4c9aa24777b580455fde2 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::Cone ******/
		/****** md5 signature: 60e200b1f39d35dabc589ba60baa4aca ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		static gp_Cone Cone(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::Cylinder ******/
		/****** md5 signature: bfaaa184a2452948fdd6ce69925769c3 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		static gp_Cylinder Cylinder(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::D0 ******/
		/****** md5 signature: e5da3b3efc17e44d280656fa2fa8d50b ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: double
v: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const BRepAdaptor_Surface & S, const double u, const double v, gp_Pnt & P);

		/****** BRepApprox_SurfaceTool::D1 ******/
		/****** md5 signature: dffe14f018f256d94455a00cd21309ad ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: double
v: double
P: gp_Pnt
D1u: gp_Vec
D1v: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const BRepAdaptor_Surface & S, const double u, const double v, gp_Pnt & P, gp_Vec & D1u, gp_Vec & D1v);

		/****** BRepApprox_SurfaceTool::D2 ******/
		/****** md5 signature: 5396afceabe6c36d01dc7688afa11ae9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: double
v: double
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const BRepAdaptor_Surface & S, const double u, const double v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** BRepApprox_SurfaceTool::D3 ******/
		/****** md5 signature: aad038c5601f31e2d10ca05cead3843d ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: double
v: double
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const BRepAdaptor_Surface & S, const double u, const double v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** BRepApprox_SurfaceTool::DN ******/
		/****** md5 signature: b8a0eb71a4f9fdf16ad6def9ed4457d8 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: double
v: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const BRepAdaptor_Surface & S, const double u, const double v, const int Nu, const int Nv);

		/****** BRepApprox_SurfaceTool::Direction ******/
		/****** md5 signature: fd02ced937782132e0e4554d6bbe3252 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		static gp_Dir Direction(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::FirstUParameter ******/
		/****** md5 signature: 79c77ff735d16bf83228e3d3a9ba2acb ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		static double FirstUParameter(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::FirstVParameter ******/
		/****** md5 signature: 35cd5a6e6e46ce89966ef258fcb6e9c1 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		static double FirstVParameter(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::GetType ******/
		/****** md5 signature: a6cd815bc857179031573432757ec63b ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
GeomAbs_SurfaceType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_SurfaceType GetType(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::IsUClosed ******/
		/****** md5 signature: 5908c13fb1a067e63a9d8c5ae72b76de ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		static bool IsUClosed(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::IsUPeriodic ******/
		/****** md5 signature: 59f5669217b77ddcdf1a990828a92e43 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		static bool IsUPeriodic(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::IsVClosed ******/
		/****** md5 signature: 3e005a6b7982e3622407d58c76c7315d ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		static bool IsVClosed(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::IsVPeriodic ******/
		/****** md5 signature: 1b6cd04494770f7a3c7e0d4d9915b800 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		static bool IsVPeriodic(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::LastUParameter ******/
		/****** md5 signature: f1d4d6b0a9f00b3560cd9b0f6caa6807 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		static double LastUParameter(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::LastVParameter ******/
		/****** md5 signature: b8bf1b5175b2694ffb64a4778918530d ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		static double LastVParameter(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: 14a7984975bec848816f7fd9da6d4e59 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: 6e95b7e8f12eb0d0857bdf713433a538 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u1: double
u2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const BRepAdaptor_Surface & S, const double u1, const double u2);

		/****** BRepApprox_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: 478503ab8d3543876b301702708a6f5c ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: 4a6fa736f7cea6124a972c8927940fc3 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
v1: double
v2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const BRepAdaptor_Surface & S, const double v1, const double v2);

		/****** BRepApprox_SurfaceTool::NbUIntervals ******/
		/****** md5 signature: ce9b7171ab9111a7a16e54b949e5f770 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
Sh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbUIntervals;
		static int NbUIntervals(const BRepAdaptor_Surface & S, const GeomAbs_Shape Sh);

		/****** BRepApprox_SurfaceTool::NbVIntervals ******/
		/****** md5 signature: 7fa8c38274dc5fd2c32ed680656a18ec ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
Sh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbVIntervals;
		static int NbVIntervals(const BRepAdaptor_Surface & S, const GeomAbs_Shape Sh);

		/****** BRepApprox_SurfaceTool::Plane ******/
		/****** md5 signature: d0190f93fe1c317fbab00796fd96a8dc ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		static gp_Pln Plane(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::Sphere ******/
		/****** md5 signature: 7ea900cd4234a848efc1dc920aae1ebf ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		static gp_Sphere Sphere(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::Torus ******/
		/****** md5 signature: 2b2cfc6e29aa0d6a184ce0e0783a8465 ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		static gp_Torus Torus(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::UIntervals ******/
		/****** md5 signature: 537d4f0ffef922b7fa4928b23647cdd2 ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") UIntervals;
		static void UIntervals(const BRepAdaptor_Surface & S, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****** BRepApprox_SurfaceTool::UPeriod ******/
		/****** md5 signature: 536103ae360613c32239f9ab11e503ab ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		static double UPeriod(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::UResolution ******/
		/****** md5 signature: 4b21a88fdb21d3260141ddc4fcb300ff ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
R3d: double

Return
-------
double

Description
-----------
No available documentation.
") UResolution;
		static double UResolution(const BRepAdaptor_Surface & S, const double R3d);

		/****** BRepApprox_SurfaceTool::UTrim ******/
		/****** md5 signature: 7f98bf21f16e5630cc77d4f6c8e94a71 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") UTrim;
		static opencascade::handle<Adaptor3d_Surface> UTrim(const BRepAdaptor_Surface & S, const double First, const double Last, const double Tol);

		/****** BRepApprox_SurfaceTool::VIntervals ******/
		/****** md5 signature: fa00613172ccca81e242e44f174e5aa6 ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") VIntervals;
		static void VIntervals(const BRepAdaptor_Surface & S, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****** BRepApprox_SurfaceTool::VPeriod ******/
		/****** md5 signature: 5c4a7dec6a8b1b3fc5cbae6c1a99ab4d ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		static double VPeriod(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::VResolution ******/
		/****** md5 signature: bee6ed58cd50c6c72b9e2f9d4a75d315 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
R3d: double

Return
-------
double

Description
-----------
No available documentation.
") VResolution;
		static double VResolution(const BRepAdaptor_Surface & S, const double R3d);

		/****** BRepApprox_SurfaceTool::VTrim ******/
		/****** md5 signature: df1366e740e417a0b76e7a2991793ada ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") VTrim;
		static opencascade::handle<Adaptor3d_Surface> VTrim(const BRepAdaptor_Surface & S, const double First, const double Last, const double Tol);

		/****** BRepApprox_SurfaceTool::Value ******/
		/****** md5 signature: bcdeb9ed5a9e008e6a22a964f85ae16b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: double
v: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const BRepAdaptor_Surface & S, const double u, const double v);

};


%extend BRepApprox_SurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class BRepApprox_TheComputeLineBezierOfApprox *
************************************************/
class BRepApprox_TheComputeLineBezierOfApprox {
	public:
		/****** BRepApprox_TheComputeLineBezierOfApprox::BRepApprox_TheComputeLineBezierOfApprox ******/
		/****** md5 signature: 507c9c26da7e57ec9ab8c3fe6ed2f52b ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-3, const double Tolerance2d = 1.0e-6, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** BRepApprox_TheComputeLineBezierOfApprox::BRepApprox_TheComputeLineBezierOfApprox ******/
		/****** md5 signature: 3fd846d4d51323e12009bec0714e9c8b ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** BRepApprox_TheComputeLineBezierOfApprox::BRepApprox_TheComputeLineBezierOfApprox ******/
		/****** md5 signature: eea13d114531e0c7e8901fd137a3214d ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** BRepApprox_TheComputeLineBezierOfApprox::BRepApprox_TheComputeLineBezierOfApprox ******/
		/****** md5 signature: cc7d07e6c2870c18953a0aabe7c3c437 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** BRepApprox_TheComputeLineBezierOfApprox::ChangeValue ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Error ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Init ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::IsAllApproximated ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::IsToleranceReached ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::NbMultiCurves ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Parameters ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Parametrization ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Perform ******/
		/****** md5 signature: cc979eff0e4e2337b1fcdd453d833794 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const BRepApprox_TheMultiLineOfApprox & Line);

		/****** BRepApprox_TheComputeLineBezierOfApprox::SetConstraints ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::SetDegrees ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::SetTolerances ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::SplineValue ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Value ******/
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
		/****** BRepApprox_TheComputeLineOfApprox::BRepApprox_TheComputeLineOfApprox ******/
		/****** md5 signature: 35d1c919ce15d57cf7de9267e099f66a ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-3, const double Tolerance2d = 1.0e-6, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** BRepApprox_TheComputeLineOfApprox::BRepApprox_TheComputeLineOfApprox ******/
		/****** md5 signature: 2c81ab77206adbb996527e5006e4fef2 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** BRepApprox_TheComputeLineOfApprox::BRepApprox_TheComputeLineOfApprox ******/
		/****** md5 signature: 02c58274a6f34f390bcc63d71aaece6a ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const math_Vector & Parameters, const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const bool Squares = false);

		/****** BRepApprox_TheComputeLineOfApprox::BRepApprox_TheComputeLineOfApprox ******/
		/****** md5 signature: 8e243d44958b201920f801a31bb13a22 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const int degreemin = 4, const int degreemax = 8, const double Tolerance3d = 1.0e-03, const double Tolerance2d = 1.0e-06, const int NbIterations = 5, const bool cutting = true, const Approx_ParametrizationType parametrization = Approx_ChordLength, const bool Squares = false);

		/****** BRepApprox_TheComputeLineOfApprox::ChangeValue ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::Init ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::Interpol ******/
		/****** md5 signature: dedf9a1871046c1f521092aee0a9a8a9 ******/
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox

Return
-------
None

Description
-----------
Constructs an interpolation of the MultiLine <Line> The result will be a C2 curve of degree 3.
") Interpol;
		void Interpol(const BRepApprox_TheMultiLineOfApprox & Line);

		/****** BRepApprox_TheComputeLineOfApprox::IsAllApproximated ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::IsToleranceReached ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::Parameters ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::Perform ******/
		/****** md5 signature: cc979eff0e4e2337b1fcdd453d833794 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const BRepApprox_TheMultiLineOfApprox & Line);

		/****** BRepApprox_TheComputeLineOfApprox::SetConstraints ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetContinuity ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetDegrees ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetKnots ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetKnotsAndMultiplicities ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetParameters ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetPeriodic ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetTolerances ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::Value ******/
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
		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox ******/
		/****** md5 signature: fd1150e117774d6c220dfd74355e5440 ******/
		%feature("compactdefaultargs") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface

Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2);

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::AuxillarSurface1 ******/
		/****** md5 signature: 35d4a58811ea11f385418cfaab72d7ba ******/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "Return
-------
BRepAdaptor_Surface

Description
-----------
No available documentation.
") AuxillarSurface1;
		BRepAdaptor_Surface AuxillarSurface1();

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::AuxillarSurface2 ******/
		/****** md5 signature: 6195097157048ebf7856e69ebf2099cb ******/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "Return
-------
BRepAdaptor_Surface

Description
-----------
No available documentation.
") AuxillarSurface2;
		BRepAdaptor_Surface AuxillarSurface2();

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::ComputeParameters ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Derivatives ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Direction ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::DirectionOnS1 ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::DirectionOnS2 ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::IsTangent ******/
		/****** md5 signature: 764eb67880e4e84c6807135e3e9a351c ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "
Parameters
----------
UVap: math_Vector
Param: TColStd_Array1OfReal

Return
-------
BestChoix: IntImp_ConstIsoparametric

Description
-----------
No available documentation.
") IsTangent;
		bool IsTangent(const math_Vector & UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric &OutValue);

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::NbEquations ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::NbVariables ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Point ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Root ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Value ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Values ******/
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
		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::BRepApprox_TheImpPrmSvSurfacesOfApprox ******/
		/****** md5 signature: 351f816713979fa454a2d27963cc84ed ******/
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
Surf1: BRepAdaptor_Surface
Surf2: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & Surf1, const IntSurf_Quadric & Surf2);

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::BRepApprox_TheImpPrmSvSurfacesOfApprox ******/
		/****** md5 signature: 07325ab325390fd9130b8085a321a96c ******/
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
Surf1: IntSurf_Quadric
Surf2: BRepAdaptor_Surface

Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox(const IntSurf_Quadric & Surf1, const BRepAdaptor_Surface & Surf2);

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::Compute ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::Pnt ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::SeekPoint ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::Tangency ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::TangencyOnSurf1 ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::TangencyOnSurf2 ******/
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


%extend BRepApprox_TheImpPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def FillInitialVectorOfSolution(self):
		pass
	}
};

/*********************************************************
* class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox *
*********************************************************/
class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	public:
		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ******/
		/****** md5 signature: ca677bf0da9cf74e28ae87a307ad0a72 ******/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
TolTangency: double

Return
-------
None

Description
-----------
compute the solution point with the close point.
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const TColStd_Array1OfReal & Param, const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const double TolTangency);

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ******/
		/****** md5 signature: e88e2bca81f6d6372001e48700f4e4bd ******/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
TolTangency: double

Return
-------
None

Description
-----------
initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }.
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const double TolTangency);

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::ChangePoint ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::Direction ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::DirectionOnS1 ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::DirectionOnS2 ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::Function ******/
		/****** md5 signature: 5929136760b661f9c0d7a509de29d340 ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox

Description
-----------
return the math function which is used to compute the intersection.
") Function;
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox & Function();

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::IsDone ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::IsEmpty ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::IsTangent ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::Perform ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::Perform ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::Point ******/
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
		/****** BRepApprox_TheMultiLineOfApprox::BRepApprox_TheMultiLineOfApprox ******/
		/****** md5 signature: 61f3332ae94879b6a2710bda28eece83 ******/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox();

		/****** BRepApprox_TheMultiLineOfApprox::BRepApprox_TheMultiLineOfApprox ******/
		/****** md5 signature: 4d0fc04fc0e7c58e37b432f94341753c ******/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "
Parameters
----------
line: BRepApprox_ApproxLine
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
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox(const opencascade::handle<BRepApprox_ApproxLine> & line, void * const PtrSvSurfaces, const int NbP3d, const int NbP2d, const bool ApproxU1V1, const bool ApproxU2V2, const double xo, const double yo, const double zo, const double u1o, const double v1o, const double u2o, const double v2o, const bool P2DOnFirst, const int IndMin = 0, const int IndMax = 0);

		/****** BRepApprox_TheMultiLineOfApprox::BRepApprox_TheMultiLineOfApprox ******/
		/****** md5 signature: 3482229cd8e4db7796efcf49f4e3fcf5 ******/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "
Parameters
----------
line: BRepApprox_ApproxLine
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
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox(const opencascade::handle<BRepApprox_ApproxLine> & line, const int NbP3d, const int NbP2d, const bool ApproxU1V1, const bool ApproxU2V2, const double xo, const double yo, const double zo, const double u1o, const double v1o, const double u2o, const double v2o, const bool P2DOnFirst, const int IndMin = 0, const int IndMax = 0);

		/****** BRepApprox_TheMultiLineOfApprox::Dump ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::FirstPoint ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::LastPoint ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::MakeMLBetween ******/
		/****** md5 signature: 9f481d60307612c90b26276189b2ba09 ******/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "
Parameters
----------
Low: int
High: int
NbPointsToInsert: int

Return
-------
BRepApprox_TheMultiLineOfApprox

Description
-----------
Tries to make a sub-line between <Low> and <High> points of this line by adding <NbPointsToInsert> new points.
") MakeMLBetween;
		BRepApprox_TheMultiLineOfApprox MakeMLBetween(const int Low, const int High, const int NbPointsToInsert);

		/****** BRepApprox_TheMultiLineOfApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: bb48254d31ee43ab6a5b5db1d2f9aa8b ******/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "
Parameters
----------
Low: int
High: int
indbad: int
OtherLine: BRepApprox_TheMultiLineOfApprox

Return
-------
bool

Description
-----------
Tries to make a sub-line between <Low> and <High> points of this line by adding one more point between (indbad-1)-th and indbad-th points.
") MakeMLOneMorePoint;
		bool MakeMLOneMorePoint(const int Low, const int High, const int indbad, BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****** BRepApprox_TheMultiLineOfApprox::NbP2d ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::NbP3d ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Tangency ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Tangency ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Tangency ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Value ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Value ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Value ******/
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
Returns the 3d and 2d points of the multipoint <MPointIndex>.
") Value;
		void Value(const int MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** BRepApprox_TheMultiLineOfApprox::WhatStatus ******/
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
		/****** BRepApprox_TheMultiLineToolOfApprox::Curvature ******/
		/****** md5 signature: 04ccf02599659e7ba70b86633f7bf957 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
returns the 3d curvature of the multipoint <MPointIndex> when only 3d points exist.
") Curvature;
		static bool Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV);

		/****** BRepApprox_TheMultiLineToolOfApprox::Curvature ******/
		/****** md5 signature: 6d0f87afc707956d98f934152bb1506a ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 2d curvature points of the multipoint <MPointIndex> only when 2d points exist.
") Curvature;
		static bool Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Curvature ******/
		/****** md5 signature: 50f1cd737b5bc9a3a2a932de55c0c4d0 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
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
		static bool Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Dump ******/
		/****** md5 signature: b9cdb0fd704d7adbd581eb92bfcc2528 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Return
-------
None

Description
-----------
Dump of the current multi-line.
") Dump;
		static void Dump(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::FirstPoint ******/
		/****** md5 signature: 12298688292f9d02a960272737e04236 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Return
-------
int

Description
-----------
Returns the number of multipoints of the TheMultiLine.
") FirstPoint;
		static int FirstPoint(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::LastPoint ******/
		/****** md5 signature: 534f0c3df26b84bc8fad1efeab26d263 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Return
-------
int

Description
-----------
Returns the number of multipoints of the TheMultiLine.
") LastPoint;
		static int LastPoint(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::MakeMLBetween ******/
		/****** md5 signature: 2e7b8e832a908227636b02ff6e190fad ******/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
I1: int
I2: int
NbPMin: int

Return
-------
BRepApprox_TheMultiLineOfApprox

Description
-----------
Is called if WhatStatus returned 'PointsAdded'.
") MakeMLBetween;
		static BRepApprox_TheMultiLineOfApprox MakeMLBetween(const BRepApprox_TheMultiLineOfApprox & ML, const int I1, const int I2, const int NbPMin);

		/****** BRepApprox_TheMultiLineToolOfApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: 11b8d38b0cd61fdfa418be1fef0ec4c1 ******/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
I1: int
I2: int
indbad: int
OtherLine: BRepApprox_TheMultiLineOfApprox

Return
-------
bool

Description
-----------
Is called when the Bezier curve contains a loop.
") MakeMLOneMorePoint;
		static bool MakeMLOneMorePoint(const BRepApprox_TheMultiLineOfApprox & ML, const int I1, const int I2, const int indbad, BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****** BRepApprox_TheMultiLineToolOfApprox::NbP2d ******/
		/****** md5 signature: a9d18311204b8b0b02aefca088a44d4d ******/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Return
-------
int

Description
-----------
Returns the number of 2d points of a TheMultiLine.
") NbP2d;
		static int NbP2d(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::NbP3d ******/
		/****** md5 signature: 93b5bc4bb1fa66f3c054f08071278a04 ******/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Return
-------
int

Description
-----------
Returns the number of 3d points of a TheMultiLine.
") NbP3d;
		static int NbP3d(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::Tangency ******/
		/****** md5 signature: 42f877965d1eef955e627a71e1cfba85 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
") Tangency;
		static bool Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV);

		/****** BRepApprox_TheMultiLineToolOfApprox::Tangency ******/
		/****** md5 signature: db2646ca50cae799cca6dd40cf74df09 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
returns the 2d tangency points of the multipoint <MPointIndex> only when 2d points exist.
") Tangency;
		static bool Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Tangency ******/
		/****** md5 signature: 1c9253a52137fae70ba804c8edcd72a0 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
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
		static bool Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Value ******/
		/****** md5 signature: af36572f05b95833633f6ced548d3138 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
returns the 3d points of the multipoint <MPointIndex> when only 3d points exist.
") Value;
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** BRepApprox_TheMultiLineToolOfApprox::Value ******/
		/****** md5 signature: d9cbfc74e55e4d713fc939be5f1e5da3 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
returns the 2d points of the multipoint <MPointIndex> when only 2d points exist.
") Value;
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Value ******/
		/****** md5 signature: bacd5facc77a33a65045f91f8580d343 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
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
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const int MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::WhatStatus ******/
		/****** md5 signature: 13e70058d9017178a8ca206ea5032eb9 ******/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "
Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
I1: int
I2: int

Return
-------
Approx_Status

Description
-----------
No available documentation.
") WhatStatus;
		static Approx_Status WhatStatus(const BRepApprox_TheMultiLineOfApprox & ML, const int I1, const int I2);

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
		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::BRepApprox_ThePrmPrmSvSurfacesOfApprox ******/
		/****** md5 signature: e65d1da54b125e00ef167affcb368a96 ******/
		%feature("compactdefaultargs") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
Surf1: BRepAdaptor_Surface
Surf2: BRepAdaptor_Surface

Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_ThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & Surf1, const BRepAdaptor_Surface & Surf2);

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::Compute ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::Pnt ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::SeekPoint ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::Tangency ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::TangencyOnSurf1 ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::TangencyOnSurf2 ******/
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
		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******/
		/****** md5 signature: b9ba9fb685c01d3cdaa6f5530485bceb ******/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox();

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******/
		/****** md5 signature: a24c282cf420ee670be218df4f94a5f5 ******/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
PS: BRepAdaptor_Surface
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & PS, const IntSurf_Quadric & IS);

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******/
		/****** md5 signature: 0dbcc591454534ee61d1672b023e50ce ******/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
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
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox(const IntSurf_Quadric & IS);

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Derivatives ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Direction2d ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Direction3d ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::ISurface ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::IsTangent ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::NbEquations ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::NbVariables ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::PSurface ******/
		/****** md5 signature: 6400b2748022787da79a4e57d03a7e1a ******/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Return
-------
BRepAdaptor_Surface

Description
-----------
No available documentation.
") PSurface;
		BRepAdaptor_Surface PSurface();

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Point ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Root ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Set ******/
		/****** md5 signature: 9058e7788b2e34d9884944da3a219e67 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
PS: BRepAdaptor_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const BRepAdaptor_Surface & PS);

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Set ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::SetImplicitSurface ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Tolerance ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Value ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Values ******/
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


%extend BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def BRepApprox_Approx_Parameters(*args):
	return BRepApprox_Approx.Parameters(*args)

@deprecated
def BRepApprox_SurfaceTool_AxeOfRevolution(*args):
	return BRepApprox_SurfaceTool.AxeOfRevolution(*args)

@deprecated
def BRepApprox_SurfaceTool_BSpline(*args):
	return BRepApprox_SurfaceTool.BSpline(*args)

@deprecated
def BRepApprox_SurfaceTool_BasisCurve(*args):
	return BRepApprox_SurfaceTool.BasisCurve(*args)

@deprecated
def BRepApprox_SurfaceTool_Bezier(*args):
	return BRepApprox_SurfaceTool.Bezier(*args)

@deprecated
def BRepApprox_SurfaceTool_Cone(*args):
	return BRepApprox_SurfaceTool.Cone(*args)

@deprecated
def BRepApprox_SurfaceTool_Cylinder(*args):
	return BRepApprox_SurfaceTool.Cylinder(*args)

@deprecated
def BRepApprox_SurfaceTool_D0(*args):
	return BRepApprox_SurfaceTool.D0(*args)

@deprecated
def BRepApprox_SurfaceTool_D1(*args):
	return BRepApprox_SurfaceTool.D1(*args)

@deprecated
def BRepApprox_SurfaceTool_D2(*args):
	return BRepApprox_SurfaceTool.D2(*args)

@deprecated
def BRepApprox_SurfaceTool_D3(*args):
	return BRepApprox_SurfaceTool.D3(*args)

@deprecated
def BRepApprox_SurfaceTool_DN(*args):
	return BRepApprox_SurfaceTool.DN(*args)

@deprecated
def BRepApprox_SurfaceTool_Direction(*args):
	return BRepApprox_SurfaceTool.Direction(*args)

@deprecated
def BRepApprox_SurfaceTool_FirstUParameter(*args):
	return BRepApprox_SurfaceTool.FirstUParameter(*args)

@deprecated
def BRepApprox_SurfaceTool_FirstVParameter(*args):
	return BRepApprox_SurfaceTool.FirstVParameter(*args)

@deprecated
def BRepApprox_SurfaceTool_GetType(*args):
	return BRepApprox_SurfaceTool.GetType(*args)

@deprecated
def BRepApprox_SurfaceTool_IsUClosed(*args):
	return BRepApprox_SurfaceTool.IsUClosed(*args)

@deprecated
def BRepApprox_SurfaceTool_IsUPeriodic(*args):
	return BRepApprox_SurfaceTool.IsUPeriodic(*args)

@deprecated
def BRepApprox_SurfaceTool_IsVClosed(*args):
	return BRepApprox_SurfaceTool.IsVClosed(*args)

@deprecated
def BRepApprox_SurfaceTool_IsVPeriodic(*args):
	return BRepApprox_SurfaceTool.IsVPeriodic(*args)

@deprecated
def BRepApprox_SurfaceTool_LastUParameter(*args):
	return BRepApprox_SurfaceTool.LastUParameter(*args)

@deprecated
def BRepApprox_SurfaceTool_LastVParameter(*args):
	return BRepApprox_SurfaceTool.LastVParameter(*args)

@deprecated
def BRepApprox_SurfaceTool_NbSamplesU(*args):
	return BRepApprox_SurfaceTool.NbSamplesU(*args)

@deprecated
def BRepApprox_SurfaceTool_NbSamplesU(*args):
	return BRepApprox_SurfaceTool.NbSamplesU(*args)

@deprecated
def BRepApprox_SurfaceTool_NbSamplesV(*args):
	return BRepApprox_SurfaceTool.NbSamplesV(*args)

@deprecated
def BRepApprox_SurfaceTool_NbSamplesV(*args):
	return BRepApprox_SurfaceTool.NbSamplesV(*args)

@deprecated
def BRepApprox_SurfaceTool_NbUIntervals(*args):
	return BRepApprox_SurfaceTool.NbUIntervals(*args)

@deprecated
def BRepApprox_SurfaceTool_NbVIntervals(*args):
	return BRepApprox_SurfaceTool.NbVIntervals(*args)

@deprecated
def BRepApprox_SurfaceTool_Plane(*args):
	return BRepApprox_SurfaceTool.Plane(*args)

@deprecated
def BRepApprox_SurfaceTool_Sphere(*args):
	return BRepApprox_SurfaceTool.Sphere(*args)

@deprecated
def BRepApprox_SurfaceTool_Torus(*args):
	return BRepApprox_SurfaceTool.Torus(*args)

@deprecated
def BRepApprox_SurfaceTool_UIntervals(*args):
	return BRepApprox_SurfaceTool.UIntervals(*args)

@deprecated
def BRepApprox_SurfaceTool_UPeriod(*args):
	return BRepApprox_SurfaceTool.UPeriod(*args)

@deprecated
def BRepApprox_SurfaceTool_UResolution(*args):
	return BRepApprox_SurfaceTool.UResolution(*args)

@deprecated
def BRepApprox_SurfaceTool_UTrim(*args):
	return BRepApprox_SurfaceTool.UTrim(*args)

@deprecated
def BRepApprox_SurfaceTool_VIntervals(*args):
	return BRepApprox_SurfaceTool.VIntervals(*args)

@deprecated
def BRepApprox_SurfaceTool_VPeriod(*args):
	return BRepApprox_SurfaceTool.VPeriod(*args)

@deprecated
def BRepApprox_SurfaceTool_VResolution(*args):
	return BRepApprox_SurfaceTool.VResolution(*args)

@deprecated
def BRepApprox_SurfaceTool_VTrim(*args):
	return BRepApprox_SurfaceTool.VTrim(*args)

@deprecated
def BRepApprox_SurfaceTool_Value(*args):
	return BRepApprox_SurfaceTool.Value(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Curvature(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Curvature(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Curvature(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Curvature(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Curvature(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Curvature(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Dump(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Dump(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_FirstPoint(*args):
	return BRepApprox_TheMultiLineToolOfApprox.FirstPoint(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_LastPoint(*args):
	return BRepApprox_TheMultiLineToolOfApprox.LastPoint(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_MakeMLBetween(*args):
	return BRepApprox_TheMultiLineToolOfApprox.MakeMLBetween(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_MakeMLOneMorePoint(*args):
	return BRepApprox_TheMultiLineToolOfApprox.MakeMLOneMorePoint(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_NbP2d(*args):
	return BRepApprox_TheMultiLineToolOfApprox.NbP2d(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_NbP3d(*args):
	return BRepApprox_TheMultiLineToolOfApprox.NbP3d(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Tangency(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Tangency(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Tangency(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Tangency(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Tangency(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Tangency(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Value(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Value(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Value(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Value(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_Value(*args):
	return BRepApprox_TheMultiLineToolOfApprox.Value(*args)

@deprecated
def BRepApprox_TheMultiLineToolOfApprox_WhatStatus(*args):
	return BRepApprox_TheMultiLineToolOfApprox.WhatStatus(*args)

}
