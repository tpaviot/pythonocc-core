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
%define BREPAPPROXDOCSTRING
"BRepApprox module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepapprox.html"
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
#include<AppParCurves_module.hxx>
#include<TColStd_module.hxx>
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
%import AppParCurves.i
%import TColStd.i
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

		/****** BRepApprox_Approx::NbMultiCurves ******/
		/****** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****** BRepApprox_Approx::Parameters ******/
		/****** md5 signature: 81d60914d3a71865160546b151d21f82 ******/
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
		static void Parameters(const BRepApprox_TheMultiLineOfApprox & Line, const Standard_Integer firstP, const Standard_Integer lastP, const Approx_ParametrizationType Par, math_Vector & TheParameters);

		/****** BRepApprox_Approx::SetParameters ******/
		/****** md5 signature: 224b0c0bb8f1208adc055cd27769623b ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float
DegMin: int
DegMax: int
NbIterMax: int
NbPntMax: int (optional, default to 30)
ApproxWithTangency: bool (optional, default to Standard_True)
Parametrization: Approx_ParametrizationType (optional, default to Approx_ChordLength)

Return
-------
None

Description
-----------
No available documentation.
") SetParameters;
		void SetParameters(const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer DegMin, const Standard_Integer DegMax, const Standard_Integer NbIterMax, const Standard_Integer NbPntMax = 30, const Standard_Boolean ApproxWithTangency = Standard_True, const Approx_ParametrizationType Parametrization = Approx_ChordLength);

		/****** BRepApprox_Approx::TolReached2d ******/
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

		/****** BRepApprox_Approx::TolReached3d ******/
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

		/****** BRepApprox_Approx::Value ******/
		/****** md5 signature: 9d6e77e44b72348ce39d94f7175b467c ******/
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
		AppParCurves_MultiBSpCurve Value(const Standard_Integer Index);

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
		/****** md5 signature: fc95bda6dedd235ff09c9509eeb57ba6 ******/
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "
Parameters
----------
lin: IntSurf_LineOn2S
theTang: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
theTang variable has been entered only for compatibility with the alias IntPatch_WLine. They are not used in this class.
") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine(const opencascade::handle<IntSurf_LineOn2S> & lin, const Standard_Boolean theTang = Standard_False);

		/****** BRepApprox_ApproxLine::NbPnts ******/
		/****** md5 signature: 11421df812eef5f47a644a70b75ab60a ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPnts;
		Standard_Integer NbPnts();

		/****** BRepApprox_ApproxLine::Point ******/
		/****** md5 signature: 3f7bb7239d0d53fe95063c8fac27999e ******/
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
		IntSurf_PntOn2S Point(const Standard_Integer Index);

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
		/****** md5 signature: 63a0f87512cd1e6b43564af60dd18905 ******/
		%feature("compactdefaultargs") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
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
") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox::IsSolutionReached ******/
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
		/****** md5 signature: 0371b3e981bd07f22a62b26d7304786b ******/
		%feature("compactdefaultargs") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer NbPol);

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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::FirstConstraint ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::MaxError3d ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::NbVariables ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::SetLastLambda ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::Value ******/
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

		/****** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::Values ******/
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
		/****** md5 signature: 7d9f95650b38892d69ea383796b7ac06 ******/
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
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: ed896d992fcd6877f972dd893988b683 ******/
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
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 54d7cb68618ead710433102a8be8682a ******/
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
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 1daf31a668cb0e28d1e3be57fca0e751 ******/
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
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::ErrorGradient ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::FirstLambda ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::Perform ******/
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
		/****** md5 signature: a882919bf6f4818f7c85495cfc3ed0e3 ******/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
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
") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox::IsSolutionReached ******/
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
		/****** md5 signature: 546c0cbcdb8b46db6c5066bcf0c3b9d4 ******/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
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
") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****** BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox::IsSolutionReached ******/
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
		/****** md5 signature: 74aae5255d1c464d98317338f1ddd977 ******/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 1);

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::BRepApprox_MyBSplGradientOfTheComputeLineOfApprox ******/
		/****** md5 signature: 4460f494a9f34dc845cd63bbb5e64be2 ******/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::AverageError ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::IsDone ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::MaxError3d ******/
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
		/****** md5 signature: 8693996965e51eac054b6488ab22bbc9 ******/
		%feature("compactdefaultargs") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_MyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::AverageError ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::Error ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::IsDone ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::MaxError2d ******/
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

		/****** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::MaxError3d ******/
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
		/****** md5 signature: 10fa2f46a78f50fbbd545ab4bed91a1e ******/
		%feature("compactdefaultargs") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_MyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::AverageError ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::Error ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::IsDone ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_MyGradientbisOfTheComputeLineOfApprox::MaxError3d ******/
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
		/****** md5 signature: bff681b6be5a6a4e25fa90b5bd01acfb ******/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::FirstConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::Gradient ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::LastConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::MaxError2d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::MaxError3d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::NbVariables ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::Values ******/
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
		/****** md5 signature: 8b57a9539a2a4df5112bf9db1c1bdd18 ******/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::FirstConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::Gradient ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::LastConstraint ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::MaxError2d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::MaxError3d ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::NbVariables ******/
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

		/****** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::Values ******/
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
		/****** md5 signature: 63854fa8eaf1a59d1f6521f47cb949f4 ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: 13862a104259244c7e66c3cf257e5f13 ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: 111e73f87885e55b085cf3e991ef150e ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******/
		/****** md5 signature: 0c7b493715ad0c1a97b3332bbc089cbb ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::ErrorGradient ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::FirstLambda ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::Perform ******/
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
		/****** md5 signature: 3ac00deeb526d442bc1969e7ff78b1c3 ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 76f12d56ace7dfc439e7e0354cf1bd1c ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: 29e7f98ecf848591af511976103e0377 ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******/
		/****** md5 signature: d4db96f964b7c67c71af6a1ce55ab129 ******/
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
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::ErrorGradient ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::FirstLambda ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Perform ******/
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

		/****** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::Perform ******/
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
		/****** md5 signature: 99259d6924dc08d39374b51f073bcefa ******/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::ConstraintDerivative ******/
		/****** md5 signature: e6efe1da7f8bd48fafb9318a027deeea ******/
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
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****** md5 signature: fb3d32286bcfc0e8b2a0d9780cdbeefd ******/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::ConstraintDerivative ******/
		/****** md5 signature: e6efe1da7f8bd48fafb9318a027deeea ******/
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
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****** md5 signature: f6727a78f574aa9b66c39e1e96c68942 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: float
v: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const BRepAdaptor_Surface & S, const Standard_Real u, const Standard_Real v, gp_Pnt & P);

		/****** BRepApprox_SurfaceTool::D1 ******/
		/****** md5 signature: 592559bc5aad46ba1e187df1e73ad838 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: float
v: float
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
		static void D1(const BRepAdaptor_Surface & S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1u, gp_Vec & D1v);

		/****** BRepApprox_SurfaceTool::D2 ******/
		/****** md5 signature: a71fc6f6361481ce024985ac00c43f2e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: float
v: float
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
		static void D2(const BRepAdaptor_Surface & S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** BRepApprox_SurfaceTool::D3 ******/
		/****** md5 signature: 93d118ed99ecd1fad00e03761b8d27f7 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: float
v: float
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
		static void D3(const BRepAdaptor_Surface & S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** BRepApprox_SurfaceTool::DN ******/
		/****** md5 signature: d1b963467520172ef209df0b307bcadc ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: float
v: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const BRepAdaptor_Surface & S, const Standard_Real u, const Standard_Real v, const Standard_Integer Nu, const Standard_Integer Nv);

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
		/****** md5 signature: 215eefdde5b80a72e0c8d839d2b57409 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
float

Description
-----------
No available documentation.
") FirstUParameter;
		static Standard_Real FirstUParameter(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::FirstVParameter ******/
		/****** md5 signature: 1f862d65413056d08b9c3704b06a0163 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
float

Description
-----------
No available documentation.
") FirstVParameter;
		static Standard_Real FirstVParameter(const BRepAdaptor_Surface & S);

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
		/****** md5 signature: 6352112928c9c27caadc94909335e74d ******/
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
		static Standard_Boolean IsUClosed(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::IsUPeriodic ******/
		/****** md5 signature: f5b175e4f6dd57d65b7aa72c2941467e ******/
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
		static Standard_Boolean IsUPeriodic(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::IsVClosed ******/
		/****** md5 signature: d9c119797cf9f8b013e890abad3502ab ******/
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
		static Standard_Boolean IsVClosed(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::IsVPeriodic ******/
		/****** md5 signature: 1e0af70e4e59762e37b38845553d100d ******/
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
		static Standard_Boolean IsVPeriodic(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::LastUParameter ******/
		/****** md5 signature: 29020e982d52766d727d8ac302b0c02e ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
float

Description
-----------
No available documentation.
") LastUParameter;
		static Standard_Real LastUParameter(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::LastVParameter ******/
		/****** md5 signature: c3df7f5e21991452c33bf232ce7d9562 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
float

Description
-----------
No available documentation.
") LastVParameter;
		static Standard_Real LastVParameter(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: 9164ce7f9a16f7530e1e9750e637940d ******/
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
		static Standard_Integer NbSamplesU(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: 8e4fac5817077b00af0164eaa2215b8b ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u1: float
u2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static Standard_Integer NbSamplesU(const BRepAdaptor_Surface & S, const Standard_Real u1, const Standard_Real u2);

		/****** BRepApprox_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: 86d363ec0f4f7e93676b703a15088c2d ******/
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
		static Standard_Integer NbSamplesV(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: 54516aa4669245c8ce78f61e9ac5d717 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
v1: float
v2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static Standard_Integer NbSamplesV(const BRepAdaptor_Surface & S, const Standard_Real v1, const Standard_Real v2);

		/****** BRepApprox_SurfaceTool::NbUIntervals ******/
		/****** md5 signature: b5e43427d66fa95d633f0ee4dac920ea ******/
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
		static Standard_Integer NbUIntervals(const BRepAdaptor_Surface & S, const GeomAbs_Shape Sh);

		/****** BRepApprox_SurfaceTool::NbVIntervals ******/
		/****** md5 signature: 71031702e09c8708c0d4c82d81aa774c ******/
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
		static Standard_Integer NbVIntervals(const BRepAdaptor_Surface & S, const GeomAbs_Shape Sh);

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
		/****** md5 signature: fbe812da680c850950d7ed23300ce95c ******/
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
		/****** md5 signature: 1426e6a3ff241c573f4f523c672fd425 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
float

Description
-----------
No available documentation.
") UPeriod;
		static Standard_Real UPeriod(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::UResolution ******/
		/****** md5 signature: d2dc7ef7ab08f98e32e14a9c42fc67d4 ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
R3d: float

Return
-------
float

Description
-----------
No available documentation.
") UResolution;
		static Standard_Real UResolution(const BRepAdaptor_Surface & S, const Standard_Real R3d);

		/****** BRepApprox_SurfaceTool::UTrim ******/
		/****** md5 signature: bdf57f0192f6ba6a046f6fd4b1f37b23 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") UTrim;
		static opencascade::handle<Adaptor3d_Surface> UTrim(const BRepAdaptor_Surface & S, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepApprox_SurfaceTool::VIntervals ******/
		/****** md5 signature: f8f1b75e1a214b4246fee76165c9ced2 ******/
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
		/****** md5 signature: 76e1f053e14f3e5f4a44e609df017849 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
float

Description
-----------
No available documentation.
") VPeriod;
		static Standard_Real VPeriod(const BRepAdaptor_Surface & S);

		/****** BRepApprox_SurfaceTool::VResolution ******/
		/****** md5 signature: 774befbab33949449d55bbb78eb82b14 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
R3d: float

Return
-------
float

Description
-----------
No available documentation.
") VResolution;
		static Standard_Real VResolution(const BRepAdaptor_Surface & S, const Standard_Real R3d);

		/****** BRepApprox_SurfaceTool::VTrim ******/
		/****** md5 signature: 5d6a8558cceb08dff23363d72161ae0a ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") VTrim;
		static opencascade::handle<Adaptor3d_Surface> VTrim(const BRepAdaptor_Surface & S, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepApprox_SurfaceTool::Value ******/
		/****** md5 signature: 99956c15b75117616c431d8c98ec8815 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
u: float
v: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const BRepAdaptor_Surface & S, const Standard_Real u, const Standard_Real v);

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
		/****** md5 signature: d31d365e1d6f25c58216a527367f35f3 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** BRepApprox_TheComputeLineBezierOfApprox::BRepApprox_TheComputeLineBezierOfApprox ******/
		/****** md5 signature: 5ce81f24eed0e783537a046f76c5aa51 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** BRepApprox_TheComputeLineBezierOfApprox::BRepApprox_TheComputeLineBezierOfApprox ******/
		/****** md5 signature: e6393cd2ed1ebcee8edef58897732a18 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** BRepApprox_TheComputeLineBezierOfApprox::BRepApprox_TheComputeLineBezierOfApprox ******/
		/****** md5 signature: 26c9b30b638a7f29b682161b89c9230c ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
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
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** BRepApprox_TheComputeLineBezierOfApprox::ChangeValue ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Error ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Init ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::IsAllApproximated ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::IsToleranceReached ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::NbMultiCurves ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::Parameters ******/
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

		/****** BRepApprox_TheComputeLineBezierOfApprox::SetTolerances ******/
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
		/****** md5 signature: 9a6d3c8c47cf418e6f4f046d4cf9f79d ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****** BRepApprox_TheComputeLineOfApprox::BRepApprox_TheComputeLineOfApprox ******/
		/****** md5 signature: f9a03ed8ef6cd6bf796c5329d942956b ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "
Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** BRepApprox_TheComputeLineOfApprox::BRepApprox_TheComputeLineOfApprox ******/
		/****** md5 signature: 3f471de7553798c720ada1908a2f8324 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****** BRepApprox_TheComputeLineOfApprox::BRepApprox_TheComputeLineOfApprox ******/
		/****** md5 signature: d8f49093a0f2f316909086b8720f3947 ******/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
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
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

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

		/****** BRepApprox_TheComputeLineOfApprox::Init ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::IsToleranceReached ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::Parameters ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetDegrees ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetKnots ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetKnotsAndMultiplicities ******/
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

		/****** BRepApprox_TheComputeLineOfApprox::SetTolerances ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Derivatives ******/
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
		/****** md5 signature: 9e73991f5144c0e218a14c453bc89c5f ******/
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
		Standard_Boolean IsTangent(const math_Vector & UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric &OutValue);

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::NbEquations ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::NbVariables ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Value ******/
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

		/****** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::Values ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::Pnt ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::SeekPoint ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::Tangency ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::TangencyOnSurf1 ******/
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

		/****** BRepApprox_TheImpPrmSvSurfacesOfApprox::TangencyOnSurf2 ******/
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
		/****** md5 signature: d3ed7255941cd2b0a551739eda53debc ******/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
TolTangency: float

Return
-------
None

Description
-----------
compute the solution point with the close point.
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const TColStd_Array1OfReal & Param, const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const Standard_Real TolTangency);

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ******/
		/****** md5 signature: fb5174c3acb3fe83c13bf6c1aa515267 ******/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "
Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
TolTangency: float

Return
-------
None

Description
-----------
initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }.
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const Standard_Real TolTangency);

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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::IsEmpty ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::IsTangent ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::Perform ******/
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

		/****** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::Perform ******/
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
		/****** md5 signature: ad07dd28d2fb52ddfeff00bc4f3b39c1 ******/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "
Parameters
----------
line: BRepApprox_ApproxLine
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
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox(const opencascade::handle<BRepApprox_ApproxLine> & line, const Standard_Address PtrSvSurfaces, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

		/****** BRepApprox_TheMultiLineOfApprox::BRepApprox_TheMultiLineOfApprox ******/
		/****** md5 signature: 2c60ef9b4d8ce91c87f55b4589e84dcd ******/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "
Parameters
----------
line: BRepApprox_ApproxLine
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
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox(const opencascade::handle<BRepApprox_ApproxLine> & line, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

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

		/****** BRepApprox_TheMultiLineOfApprox::LastPoint ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::MakeMLBetween ******/
		/****** md5 signature: 87c3b2149dab9604268e6c6bc4f0c906 ******/
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
		BRepApprox_TheMultiLineOfApprox MakeMLBetween(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer NbPointsToInsert);

		/****** BRepApprox_TheMultiLineOfApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: 421c45436bad3eda04a112bcb72d86ce ******/
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
		Standard_Boolean MakeMLOneMorePoint(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer indbad, BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****** BRepApprox_TheMultiLineOfApprox::NbP2d ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::NbP3d ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Tangency ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Tangency ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Tangency ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Value ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Value ******/
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

		/****** BRepApprox_TheMultiLineOfApprox::Value ******/
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
Returns the 3d and 2d points of the multipoint <MPointIndex>.
") Value;
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

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
		/****** md5 signature: bf7ee67527922d9913db5a4fbf2e4afb ******/
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
		static Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****** BRepApprox_TheMultiLineToolOfApprox::Curvature ******/
		/****** md5 signature: febf4f9f7956f4982c5221e66708df55 ******/
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
		static Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Curvature ******/
		/****** md5 signature: ac0a699a5da9a476fb76822ea024d997 ******/
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
		static Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

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
		/****** md5 signature: 85a33a9acd8ba8a4e3e2371ddd20fc7c ******/
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
		static Standard_Integer FirstPoint(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::LastPoint ******/
		/****** md5 signature: 47721ef9a832798de7a827f5fa93cc6a ******/
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
		static Standard_Integer LastPoint(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::MakeMLBetween ******/
		/****** md5 signature: 0f95b389697bc413dc72ff9ef97cc6a8 ******/
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
		static BRepApprox_TheMultiLineOfApprox MakeMLBetween(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);

		/****** BRepApprox_TheMultiLineToolOfApprox::MakeMLOneMorePoint ******/
		/****** md5 signature: 4d363a38e0089ecaa07a9e81dab44599 ******/
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
		static Standard_Boolean MakeMLOneMorePoint(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer indbad, BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****** BRepApprox_TheMultiLineToolOfApprox::NbP2d ******/
		/****** md5 signature: 4dbf4c9efe98f097e7d61fb3638a07d9 ******/
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
		static Standard_Integer NbP2d(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::NbP3d ******/
		/****** md5 signature: cf55a696ef970abbf2e8f74b4a0daed1 ******/
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
		static Standard_Integer NbP3d(const BRepApprox_TheMultiLineOfApprox & ML);

		/****** BRepApprox_TheMultiLineToolOfApprox::Tangency ******/
		/****** md5 signature: b7b561fe15855fef28260b26ee552e4b ******/
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
		static Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****** BRepApprox_TheMultiLineToolOfApprox::Tangency ******/
		/****** md5 signature: 8152094c428170ba0f2f1fd17292c27c ******/
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
		static Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Tangency ******/
		/****** md5 signature: 6aef83009c20ac70bd1b04ba431473d4 ******/
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
		static Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Value ******/
		/****** md5 signature: ecc7784256b44d7c12f30c0b086997a2 ******/
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
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****** BRepApprox_TheMultiLineToolOfApprox::Value ******/
		/****** md5 signature: f04c8e8e6745056be43d70d16c74dcf5 ******/
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
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::Value ******/
		/****** md5 signature: a95dafe6ca3a1d888726e591cc020148 ******/
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
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****** BRepApprox_TheMultiLineToolOfApprox::WhatStatus ******/
		/****** md5 signature: d2b8e2cdf30a632e4776399c404b4817 ******/
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
		static Approx_Status WhatStatus(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer I1, const Standard_Integer I2);

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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::Pnt ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::SeekPoint ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::Tangency ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::TangencyOnSurf1 ******/
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

		/****** BRepApprox_ThePrmPrmSvSurfacesOfApprox::TangencyOnSurf2 ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::NbEquations ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::NbVariables ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Value ******/
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

		/****** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::Values ******/
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
