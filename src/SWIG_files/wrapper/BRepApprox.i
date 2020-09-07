/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
		/****************** BRepApprox_Approx ******************/
		/**** md5 signature: bd97e4db4f73bdf01c7574bc6f9beca1 ****/
		%feature("compactdefaultargs") BRepApprox_Approx;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepApprox_Approx;
		 BRepApprox_Approx();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbMultiCurves ******************/
		/**** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ****/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** SetParameters ******************/
		/**** md5 signature: 224b0c0bb8f1208adc055cd27769623b ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol3d: float
Tol2d: float
DegMin: int
DegMax: int
NbIterMax: int
NbPntMax: int,optional
	default value is 30
ApproxWithTangency: bool,optional
	default value is Standard_True
Parametrization: Approx_ParametrizationType,optional
	default value is Approx_ChordLength

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer DegMin, const Standard_Integer DegMax, const Standard_Integer NbIterMax, const Standard_Integer NbPntMax = 30, const Standard_Boolean ApproxWithTangency = Standard_True, const Approx_ParametrizationType Parametrization = Approx_ChordLength);

		/****************** TolReached2d ******************/
		/**** md5 signature: fec1cf227c913f78bf2cca534817572e ****/
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolReached2d;
		Standard_Real TolReached2d();

		/****************** TolReached3d ******************/
		/**** md5 signature: 683925467818325187b2612f3df211fb ****/
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolReached3d;
		Standard_Real TolReached3d();

		/****************** Value ******************/
		/**** md5 signature: 9d6e77e44b72348ce39d94f7175b467c ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value(const Standard_Integer Index);

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
		/****************** BRepApprox_ApproxLine ******************/
		/**** md5 signature: 06463c2cf339616f1188d08a9cedb916 ****/
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
CurveXYZ: Geom_BSplineCurve
CurveUV1: Geom2d_BSplineCurve
CurveUV2: Geom2d_BSplineCurve

Returns
-------
None
") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine(const opencascade::handle<Geom_BSplineCurve> & CurveXYZ, const opencascade::handle<Geom2d_BSplineCurve> & CurveUV1, const opencascade::handle<Geom2d_BSplineCurve> & CurveUV2);

		/****************** BRepApprox_ApproxLine ******************/
		/**** md5 signature: fc95bda6dedd235ff09c9509eeb57ba6 ****/
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "Thetang variable has been entered only for compatibility with the alias intpatch_wline. they are not used in this class.

Parameters
----------
lin: IntSurf_LineOn2S
theTang: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine(const opencascade::handle<IntSurf_LineOn2S> & lin, const Standard_Boolean theTang = Standard_False);

		/****************** NbPnts ******************/
		/**** md5 signature: 11421df812eef5f47a644a70b75ab60a ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** Point ******************/
		/**** md5 signature: 3f7bb7239d0d53fe95063c8fac27999e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
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
		/****************** BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 63a0f87512cd1e6b43564af60dd18905 ****/
		%feature("compactdefaultargs") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: float
Tolerance2d: float
Eps: float
NbIterations: int,optional
	default value is 200

Returns
-------
None
") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		/**** md5 signature: a6c0da888a257bf852b40b8daf6526dc ****/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: math_MultipleVarFunctionWithGradient

Returns
-------
bool
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
		/****************** BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 0371b3e981bd07f22a62b26d7304786b ****/
		%feature("compactdefaultargs") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has <nbpol> control points.

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

Returns
-------
None
") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer NbPol);

		/****************** CurveValue ******************/
		/**** md5 signature: c83ed6c1c3091309bccd8d719a30ec54 ****/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Returns the multibspcurve approximating the set after computing the value f or grad(f).

Returns
-------
AppParCurves_MultiBSpCurve
") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue();

		/****************** DerivativeFunctionMatrix ******************/
		/**** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ****/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the multiline.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Error ******************/
		/**** md5 signature: 540c96711689798ec6a7d515d5e5e1c7 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the distance between the multipoint of range ipoint and the curve curveindex.

Parameters
----------
IPoint: int
CurveIndex: int

Returns
-------
float
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		/**** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ****/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Returns
-------
AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****************** FunctionMatrix ******************/
		/**** md5 signature: aec90dd003c289db9092eb79712677e1 ****/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the multiline.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** Gradient ******************/
		/**** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the gradient g of the sum above for the parameters xi.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** Index ******************/
		/**** md5 signature: c11a6982042d7a2c5bf9fb50324ac971 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") Index;
		const math_IntegerVector & Index();

		/****************** LastConstraint ******************/
		/**** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ****/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Returns
-------
AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		/**** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ****/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum distance between the points and the multibspcurve.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum distance between the points and the multibspcurve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function. it corresponds to the number of multipoints.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** NewParameters ******************/
		/**** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ****/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Returns the new parameters of the multiline.

Returns
-------
math_Vector
") NewParameters;
		const math_Vector & NewParameters();

		/****************** SetFirstLambda ******************/
		/**** md5 signature: 819efdb8532bd01857d5e29b79901d19 ****/
		%feature("compactdefaultargs") SetFirstLambda;
		%feature("autodoc", "No available documentation.

Parameters
----------
l1: float

Returns
-------
None
") SetFirstLambda;
		void SetFirstLambda(const Standard_Real l1);

		/****************** SetLastLambda ******************/
		/**** md5 signature: b34d15f9505b8355ba362a879a836d1a ****/
		%feature("compactdefaultargs") SetLastLambda;
		%feature("autodoc", "No available documentation.

Parameters
----------
l2: float

Returns
-------
None
") SetLastLambda;
		void SetLastLambda(const Standard_Real l2);

		/****************** Value ******************/
		/**** md5 signature: 33f8b9f75d238865cc320f57ac729801 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "This method computes the new approximation of the multiline ssp and calculates f = sum (||pui - bi*pi||2) for each point of the multiline.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the value f=sum(||pui - bi*pi||)2. returns the value g = grad(f) for the parameters xi.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
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
		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 7d9f95650b38892d69ea383796b7ac06 ****/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: ed896d992fcd6877f972dd893988b683 ****/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 54d7cb68618ead710433102a8be8682a ****/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 1daf31a668cb0e28d1e3be57fca0e751 ****/
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		/**** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ****/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue();

		/****************** BezierValue ******************/
		/**** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ****/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****************** DerivativeFunctionMatrix ******************/
		/**** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ****/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the set.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Distance ******************/
		/**** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distances between the points of the multiline and the approximation curves.

Returns
-------
math_Matrix
") Distance;
		const math_Matrix & Distance();

		/****************** Error ******************/
		/**** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the maximum errors between the multiline and the approximation curves. f is the sum of the square distances.

Parameters
----------

Returns
-------
F: float
MaxE3d: float
MaxE2d: float
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		/**** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ****/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "Returns the maximum errors between the multiline and the approximation curves. f is the sum of the square distances. grad is the derivative vector of the function f.

Parameters
----------
Grad: math_Vector

Returns
-------
F: float
MaxE3d: float
MaxE2d: float
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		/**** md5 signature: 87ad21cc13708c47c81704b38426d999 ****/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Returns the value (p2 - p1)/ v1 if the first point was a tangency point.

Returns
-------
float
") FirstLambda;
		Standard_Real FirstLambda();

		/****************** FunctionMatrix ******************/
		/**** md5 signature: aec90dd003c289db9092eb79712677e1 ****/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the set.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** KIndex ******************/
		/**** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ****/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex();

		/****************** LastLambda ******************/
		/**** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ****/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Returns the value (pn - pn-1)/ vn if the last point was a tangency point.

Returns
-------
float
") LastLambda;
		Standard_Real LastLambda();

		/****************** Perform ******************/
		/**** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. the case 'curvaturepoint' is not treated in this method.

Parameters
----------
Parameters: math_Vector

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters);

		/****************** Perform ******************/
		/**** md5 signature: cbf083f2b8329680dc5a52f482f436ad ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields.

Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****************** Perform ******************/
		/**** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. <v1t> is the tangent vector at the first point. <v2t> is the tangent vector at the last point.

Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****************** Perform ******************/
		/**** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. <v1t> is the tangent vector at the first point. <v2t> is the tangent vector at the last point. <v1c> is the tangent vector at the first point. <v2c> is the tangent vector at the last point.

Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****************** Points ******************/
		/**** md5 signature: 8a77545526c5096bca80b9c07f882412 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the matrix of points value.

Returns
-------
math_Matrix
") Points;
		const math_Matrix & Points();

		/****************** Poles ******************/
		/**** md5 signature: 1437a652beb857bd22c16de65cb18857 ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the matrix of resulting control points value.

Returns
-------
math_Matrix
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
		/****************** BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: a882919bf6f4818f7c85495cfc3ed0e3 ****/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: float
Tolerance2d: float
Eps: float
NbIterations: int,optional
	default value is 200

Returns
-------
None
") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		/**** md5 signature: a6c0da888a257bf852b40b8daf6526dc ****/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: math_MultipleVarFunctionWithGradient

Returns
-------
bool
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
		/****************** BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 546c0cbcdb8b46db6c5066bcf0c3b9d4 ****/
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector
Tolerance3d: float
Tolerance2d: float
Eps: float
NbIterations: int,optional
	default value is 200

Returns
-------
None
") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

		/****************** IsSolutionReached ******************/
		/**** md5 signature: a6c0da888a257bf852b40b8daf6526dc ****/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: math_MultipleVarFunctionWithGradient

Returns
-------
bool
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
		/****************** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 74aae5255d1c464d98317338f1ddd977 ****/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bspline curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 1

Returns
-------
None
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 1);

		/****************** BRepApprox_MyBSplGradientOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 4460f494a9f34dc845cd63bbb5e64be2 ****/
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bspline curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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

Returns
-------
None
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);

		/****************** AverageError ******************/
		/**** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ****/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the old and the new approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Error ******************/
		/**** md5 signature: 94d11b0fe58daf5df892c75e38905cde ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the difference between the old and the new approximation. an exception is raised if notdone. an exception is raised if index<1 or index>nbparameters.

Parameters
----------
Index: int

Returns
-------
float
") Error;
		Standard_Real Error(const Standard_Integer Index);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d ******************/
		/**** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ****/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** Value ******************/
		/**** md5 signature: 35d2ee100f1a9fc11f00b074d7d3553e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns all the bspline curves approximating the multiline ssp after minimization of the parameter.

Returns
-------
AppParCurves_MultiBSpCurve
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
		/****************** BRepApprox_MyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 8693996965e51eac054b6488ab22bbc9 ****/
		%feature("compactdefaultargs") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bezier curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 200

Returns
-------
None
") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_MyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****************** AverageError ******************/
		/**** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ****/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the old and the new approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Error ******************/
		/**** md5 signature: 94d11b0fe58daf5df892c75e38905cde ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the difference between the old and the new approximation. an exception is raised if notdone. an exception is raised if index<1 or index>nbparameters.

Parameters
----------
Index: int

Returns
-------
float
") Error;
		Standard_Real Error(const Standard_Integer Index);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d ******************/
		/**** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ****/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** Value ******************/
		/**** md5 signature: dac7e49320bc0e9a268aeb92592734dc ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns all the bezier curves approximating the multiline ssp after minimization of the parameter.

Returns
-------
AppParCurves_MultiCurve
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
		/****************** BRepApprox_MyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 10fa2f46a78f50fbbd545ab4bed91a1e ****/
		%feature("compactdefaultargs") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bezier curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 200

Returns
-------
None
") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_MyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

		/****************** AverageError ******************/
		/**** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ****/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the old and the new approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Error ******************/
		/**** md5 signature: 94d11b0fe58daf5df892c75e38905cde ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the difference between the old and the new approximation. an exception is raised if notdone. an exception is raised if index<1 or index>nbparameters.

Parameters
----------
Index: int

Returns
-------
float
") Error;
		Standard_Real Error(const Standard_Integer Index);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d ******************/
		/**** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ****/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** Value ******************/
		/**** md5 signature: dac7e49320bc0e9a268aeb92592734dc ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns all the bezier curves approximating the multiline ssp after minimization of the parameter.

Returns
-------
AppParCurves_MultiCurve
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
		/****************** BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: bff681b6be5a6a4e25fa90b5bd01acfb ****/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****************** CurveValue ******************/
		/**** md5 signature: c2e2cb976554936214bdfe3487b0362c ****/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Returns the multicurve approximating the set after computing the value f or grad(f).

Returns
-------
AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue();

		/****************** Error ******************/
		/**** md5 signature: 59bc36aa259ae04fcbc9c2a60fae6dfb ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the distance between the multipoint of range ipoint and the curve curveindex.

Parameters
----------
IPoint: int
CurveIndex: int

Returns
-------
float
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		/**** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ****/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Returns
-------
AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****************** Gradient ******************/
		/**** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the gradient g of the sum above for the parameters xi.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** LastConstraint ******************/
		/**** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ****/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Returns
-------
AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		/**** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ****/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function. it corresponds to the number of multipoints.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** NewParameters ******************/
		/**** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ****/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Returns the new parameters of the multiline.

Returns
-------
math_Vector
") NewParameters;
		const math_Vector & NewParameters();

		/****************** Value ******************/
		/**** md5 signature: 33f8b9f75d238865cc320f57ac729801 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "This method computes the new approximation of the multiline ssp and calculates f = sum (||pui - bi*pi||2) for each point of the multiline.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the value f=sum(||pui - bi*pi||)2. returns the value g = grad(f) for the parameters xi.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
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
		/****************** BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 8b57a9539a2a4df5112bf9db1c1bdd18 ****/
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

		/****************** CurveValue ******************/
		/**** md5 signature: c2e2cb976554936214bdfe3487b0362c ****/
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Returns the multicurve approximating the set after computing the value f or grad(f).

Returns
-------
AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue();

		/****************** Error ******************/
		/**** md5 signature: 59bc36aa259ae04fcbc9c2a60fae6dfb ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the distance between the multipoint of range ipoint and the curve curveindex.

Parameters
----------
IPoint: int
CurveIndex: int

Returns
-------
float
") Error;
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);

		/****************** FirstConstraint ******************/
		/**** md5 signature: 6814c8615ee3f59417c740c77d2ce795 ****/
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
FirstPoint: int

Returns
-------
AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer FirstPoint);

		/****************** Gradient ******************/
		/**** md5 signature: 5ee531ceab07ab216991e3bf02edf0f7 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the gradient g of the sum above for the parameters xi.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** LastConstraint ******************/
		/**** md5 signature: f3572ad2cc7e299a1f7b6cb9d14677cf ****/
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheConstraints: AppParCurves_HArray1OfConstraintCouple
LastPoint: int

Returns
-------
AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer LastPoint);

		/****************** MaxError2d ******************/
		/**** md5 signature: 2590e15e02ab7eeda39345ef64189e30 ****/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function. it corresponds to the number of multipoints.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** NewParameters ******************/
		/**** md5 signature: 1d606e7b2aa9813a84f6984ebdf52bb7 ****/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Returns the new parameters of the multiline.

Returns
-------
math_Vector
") NewParameters;
		const math_Vector & NewParameters();

		/****************** Value ******************/
		/**** md5 signature: 33f8b9f75d238865cc320f57ac729801 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "This method computes the new approximation of the multiline ssp and calculates f = sum (||pui - bi*pi||2) for each point of the multiline.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 66c7c08f6bec2933f700c6f45cf14285 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the value f=sum(||pui - bi*pi||)2. returns the value g = grad(f) for the parameters xi.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
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
		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 63854fa8eaf1a59d1f6521f47cb949f4 ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 13862a104259244c7e66c3cf257e5f13 ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 111e73f87885e55b085cf3e991ef150e ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 0c7b493715ad0c1a97b3332bbc089cbb ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		/**** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ****/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue();

		/****************** BezierValue ******************/
		/**** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ****/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****************** DerivativeFunctionMatrix ******************/
		/**** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ****/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the set.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Distance ******************/
		/**** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distances between the points of the multiline and the approximation curves.

Returns
-------
math_Matrix
") Distance;
		const math_Matrix & Distance();

		/****************** Error ******************/
		/**** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the maximum errors between the multiline and the approximation curves. f is the sum of the square distances.

Parameters
----------

Returns
-------
F: float
MaxE3d: float
MaxE2d: float
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		/**** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ****/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "Returns the maximum errors between the multiline and the approximation curves. f is the sum of the square distances. grad is the derivative vector of the function f.

Parameters
----------
Grad: math_Vector

Returns
-------
F: float
MaxE3d: float
MaxE2d: float
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		/**** md5 signature: 87ad21cc13708c47c81704b38426d999 ****/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Returns the value (p2 - p1)/ v1 if the first point was a tangency point.

Returns
-------
float
") FirstLambda;
		Standard_Real FirstLambda();

		/****************** FunctionMatrix ******************/
		/**** md5 signature: aec90dd003c289db9092eb79712677e1 ****/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the set.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** KIndex ******************/
		/**** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ****/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex();

		/****************** LastLambda ******************/
		/**** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ****/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Returns the value (pn - pn-1)/ vn if the last point was a tangency point.

Returns
-------
float
") LastLambda;
		Standard_Real LastLambda();

		/****************** Perform ******************/
		/**** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. the case 'curvaturepoint' is not treated in this method.

Parameters
----------
Parameters: math_Vector

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters);

		/****************** Perform ******************/
		/**** md5 signature: cbf083f2b8329680dc5a52f482f436ad ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields.

Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****************** Perform ******************/
		/**** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. <v1t> is the tangent vector at the first point. <v2t> is the tangent vector at the last point.

Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****************** Perform ******************/
		/**** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. <v1t> is the tangent vector at the first point. <v2t> is the tangent vector at the last point. <v1c> is the tangent vector at the first point. <v2c> is the tangent vector at the last point.

Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****************** Points ******************/
		/**** md5 signature: 8a77545526c5096bca80b9c07f882412 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the matrix of points value.

Returns
-------
math_Matrix
") Points;
		const math_Matrix & Points();

		/****************** Poles ******************/
		/**** md5 signature: 1437a652beb857bd22c16de65cb18857 ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the matrix of resulting control points value.

Returns
-------
math_Matrix
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
		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 3ac00deeb526d442bc1969e7ff78b1c3 ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 76f12d56ace7dfc439e7e0354cf1bd1c ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: 29e7f98ecf848591af511976103e0377 ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: d4db96f964b7c67c71af6a1ce55ab129 ****/
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** BSplineValue ******************/
		/**** md5 signature: a38863f7c9b6fa566ee9fea09f971d5c ****/
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue();

		/****************** BezierValue ******************/
		/**** md5 signature: 2bbd29cb039e6bcdcdf61afe82651ac1 ****/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****************** DerivativeFunctionMatrix ******************/
		/**** md5 signature: c2dbca1da1c1c1aaf2ff7895be813eaf ****/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the set.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Distance ******************/
		/**** md5 signature: 608fad06f540e822f2b9f4d329c097b6 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distances between the points of the multiline and the approximation curves.

Returns
-------
math_Matrix
") Distance;
		const math_Matrix & Distance();

		/****************** Error ******************/
		/**** md5 signature: 7c05c0164fc88dbacc4d90d301fe7f12 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the maximum errors between the multiline and the approximation curves. f is the sum of the square distances.

Parameters
----------

Returns
-------
F: float
MaxE3d: float
MaxE2d: float
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ErrorGradient ******************/
		/**** md5 signature: 3e5c3757aad8d0f394eda590c0bc62e3 ****/
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "Returns the maximum errors between the multiline and the approximation curves. f is the sum of the square distances. grad is the derivative vector of the function f.

Parameters
----------
Grad: math_Vector

Returns
-------
F: float
MaxE3d: float
MaxE2d: float
") ErrorGradient;
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FirstLambda ******************/
		/**** md5 signature: 87ad21cc13708c47c81704b38426d999 ****/
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Returns the value (p2 - p1)/ v1 if the first point was a tangency point.

Returns
-------
float
") FirstLambda;
		Standard_Real FirstLambda();

		/****************** FunctionMatrix ******************/
		/**** md5 signature: aec90dd003c289db9092eb79712677e1 ****/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the set.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** KIndex ******************/
		/**** md5 signature: 2821052a9bfe72ec4f531ccb52a80ffb ****/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex();

		/****************** LastLambda ******************/
		/**** md5 signature: f7e26790258c4ab513bae9dd1a5955e1 ****/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Returns the value (pn - pn-1)/ vn if the last point was a tangency point.

Returns
-------
float
") LastLambda;
		Standard_Real LastLambda();

		/****************** Perform ******************/
		/**** md5 signature: 5b8f20d810ea57d5223b42dfd01410ad ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. the case 'curvaturepoint' is not treated in this method.

Parameters
----------
Parameters: math_Vector

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters);

		/****************** Perform ******************/
		/**** md5 signature: cbf083f2b8329680dc5a52f482f436ad ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields.

Parameters
----------
Parameters: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const Standard_Real l1, const Standard_Real l2);

		/****************** Perform ******************/
		/**** md5 signature: 380f2440b07e3b3805c4eda2da2e8c6e ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. <v1t> is the tangent vector at the first point. <v2t> is the tangent vector at the last point.

Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const Standard_Real l1, const Standard_Real l2);

		/****************** Perform ******************/
		/**** md5 signature: 5f7ecae6d947ca76138d939cdd616b0f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used after having initialized the fields. <v1t> is the tangent vector at the first point. <v2t> is the tangent vector at the last point. <v1c> is the tangent vector at the first point. <v2c> is the tangent vector at the last point.

Parameters
----------
Parameters: math_Vector
V1t: math_Vector
V2t: math_Vector
V1c: math_Vector
V2c: math_Vector
l1: float
l2: float

Returns
-------
None
") Perform;
		void Perform(const math_Vector & Parameters, const math_Vector & V1t, const math_Vector & V2t, const math_Vector & V1c, const math_Vector & V2c, const Standard_Real l1, const Standard_Real l2);

		/****************** Points ******************/
		/**** md5 signature: 8a77545526c5096bca80b9c07f882412 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the matrix of points value.

Returns
-------
math_Matrix
") Points;
		const math_Matrix & Points();

		/****************** Poles ******************/
		/**** md5 signature: 1437a652beb857bd22c16de65cb18857 ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the matrix of resulting control points value.

Returns
-------
math_Matrix
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
		/****************** BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 99259d6924dc08d39374b51f073bcefa ****/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: AppParCurves_HArray1OfConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: float,optional
	default value is 1.0e-10

Returns
-------
None
") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: e6efe1da7f8bd48fafb9318a027deeea ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****************** ConstraintMatrix ******************/
		/**** md5 signature: 22481357cd3fa297d87302ab5bf68ab7 ****/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "No available documentation.

Returns
-------
math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****************** Duale ******************/
		/**** md5 signature: fa2d61bba97045a52b936ca097de9f1b ****/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Returns the duale variables of the system.

Returns
-------
math_Vector
") Duale;
		const math_Vector & Duale();

		/****************** InverseMatrix ******************/
		/**** md5 signature: 6c593c2bc8580243a5ff315f7f6a1f0e ****/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Returns the inverse of cont*transposed(cont), where cont is the constraint matrix for the algorithm.

Returns
-------
math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
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
		/****************** BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox ******************/
		/**** md5 signature: fb3d32286bcfc0e8b2a0d9780cdbeefd ****/
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
SCurv: AppParCurves_MultiCurve
FirstPoint: int
LastPoint: int
Constraints: AppParCurves_HArray1OfConstraintCouple
Bern: math_Matrix
DerivativeBern: math_Matrix
Tolerance: float,optional
	default value is 1.0e-10

Returns
-------
None
") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: e6efe1da7f8bd48fafb9318a027deeea ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: BRepApprox_TheMultiLineOfApprox
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

		/****************** ConstraintMatrix ******************/
		/**** md5 signature: 22481357cd3fa297d87302ab5bf68ab7 ****/
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "No available documentation.

Returns
-------
math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****************** Duale ******************/
		/**** md5 signature: fa2d61bba97045a52b936ca097de9f1b ****/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Returns the duale variables of the system.

Returns
-------
math_Vector
") Duale;
		const math_Vector & Duale();

		/****************** InverseMatrix ******************/
		/**** md5 signature: 6c593c2bc8580243a5ff315f7f6a1f0e ****/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Returns the inverse of cont*transposed(cont), where cont is the constraint matrix for the algorithm.

Returns
-------
math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
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

/************************************************
* class BRepApprox_TheComputeLineBezierOfApprox *
************************************************/
class BRepApprox_TheComputeLineBezierOfApprox {
	public:
		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		/**** md5 signature: d31d365e1d6f25c58216a527367f35f3 ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-3
Tolerance2d: float,optional
	default value is 1.0e-6
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
parametrization: Approx_ParametrizationType,optional
	default value is Approx_ChordLength
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 5ce81f24eed0e783537a046f76c5aa51 ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
Parameters: math_Vector
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		/**** md5 signature: e6393cd2ed1ebcee8edef58897732a18 ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
Parameters: math_Vector
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineBezierOfApprox ******************/
		/**** md5 signature: 26c9b30b638a7f29b682161b89c9230c ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
parametrization: Approx_ParametrizationType,optional
	default value is Approx_ChordLength
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** ChangeValue ******************/
		/**** md5 signature: 141696e747a4846a7446e394b31644d5 ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Returns the result of the approximation.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
AppParCurves_MultiCurve
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue(const Standard_Integer Index = 1);

		/****************** Error ******************/
		/**** md5 signature: 6a8061230005ba951097d8b73e7dbec6 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the tolerances 2d and 3d of the <index> multicurve.

Parameters
----------
Index: int

Returns
-------
tol3d: float
tol2d: float
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 10f7f80e213a93740574c45700071b76 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
parametrization: Approx_ParametrizationType,optional
	default value is Approx_ChordLength
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** IsAllApproximated ******************/
		/**** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ****/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		/**** md5 signature: cbd7380250e74c96655b10c8025eb873 ****/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** NbMultiCurves ******************/
		/**** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ****/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Returns the number of multicurve doing the approximation of the multiline.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** Parameters ******************/
		/**** md5 signature: 457fc00b4795a877d025353e491bb905 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the new parameters of the approximation corresponding to the points of the multicurve <index>.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters(const Standard_Integer Index = 1);

		/****************** Parametrization ******************/
		/**** md5 signature: 28de4bdef662891658a0d7c12417a76f ****/
		%feature("compactdefaultargs") Parametrization;
		%feature("autodoc", "Returns the type of parametrization.

Returns
-------
Approx_ParametrizationType
") Parametrization;
		Approx_ParametrizationType Parametrization();

		/****************** Perform ******************/
		/**** md5 signature: cc979eff0e4e2337b1fcdd453d833794 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox

Returns
-------
None
") Perform;
		void Perform(const BRepApprox_TheMultiLineOfApprox & Line);

		/****************** SetConstraints ******************/
		/**** md5 signature: 99b92dc193142adf44568f800cd394dc ****/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Changes the first and the last constraint points.

Parameters
----------
firstC: AppParCurves_Constraint
lastC: AppParCurves_Constraint

Returns
-------
None
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);

		/****************** SetDegrees ******************/
		/**** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ****/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "Changes the degrees of the approximation.

Parameters
----------
degreemin: int
degreemax: int

Returns
-------
None
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****************** SetTolerances ******************/
		/**** md5 signature: ce7879738ace848f7a3a27c56467be10 ****/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Changes the tolerances of the approximation.

Parameters
----------
Tolerance3d: float
Tolerance2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****************** SplineValue ******************/
		/**** md5 signature: 8abd3bdfb130cc23332c1960701072a6 ****/
		%feature("compactdefaultargs") SplineValue;
		%feature("autodoc", "Returns the result of the approximation.

Returns
-------
AppParCurves_MultiBSpCurve
") SplineValue;
		const AppParCurves_MultiBSpCurve & SplineValue();

		/****************** Value ******************/
		/**** md5 signature: ce9a9d43a5aa1f3754abfba817bb7838 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the result of the approximation.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value(const Standard_Integer Index = 1);

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
		/**** md5 signature: 9a6d3c8c47cf418e6f4f046d4cf9f79d ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all. //! the multiplicities of the internal knots is set by default.

Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-3
Tolerance2d: float,optional
	default value is 1.0e-6
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
parametrization: Approx_ParametrizationType,optional
	default value is Approx_ChordLength
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineOfApprox ******************/
		/**** md5 signature: f9a03ed8ef6cd6bf796c5329d942956b ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox
Parameters: math_Vector
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineOfApprox ******************/
		/**** md5 signature: 3f471de7553798c720ada1908a2f8324 ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
Parameters: math_Vector
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** BRepApprox_TheComputeLineOfApprox ******************/
		/**** md5 signature: d8f49093a0f2f316909086b8720f3947 ****/
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
parametrization: Approx_ParametrizationType,optional
	default value is Approx_ChordLength
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** ChangeValue ******************/
		/**** md5 signature: afc5e23129509014348d63bb72db41ec ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Returns the result of the approximation.

Returns
-------
AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue();

		/****************** Error ******************/
		/**** md5 signature: cda70ea4f3f90e8bdc1d9692db9c77b8 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the tolerances 2d and 3d of the multibspcurve.

Parameters
----------

Returns
-------
tol3d: float
tol2d: float
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 10f7f80e213a93740574c45700071b76 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 4
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-03
Tolerance2d: float,optional
	default value is 1.0e-06
NbIterations: int,optional
	default value is 5
cutting: bool,optional
	default value is Standard_True
parametrization: Approx_ParametrizationType,optional
	default value is Approx_ChordLength
Squares: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** Interpol ******************/
		/**** md5 signature: dedf9a1871046c1f521092aee0a9a8a9 ****/
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "Constructs an interpolation of the multiline <line> the result will be a c2 curve of degree 3.

Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox

Returns
-------
None
") Interpol;
		void Interpol(const BRepApprox_TheMultiLineOfApprox & Line);

		/****************** IsAllApproximated ******************/
		/**** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ****/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		/**** md5 signature: cbd7380250e74c96655b10c8025eb873 ****/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** Parameters ******************/
		/**** md5 signature: 7c84e53bc11f80fb0f3c0e787e4b026e ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the new parameters of the approximation corresponding to the points of the multibspcurve.

Returns
-------
TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters();

		/****************** Perform ******************/
		/**** md5 signature: cc979eff0e4e2337b1fcdd453d833794 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: BRepApprox_TheMultiLineOfApprox

Returns
-------
None
") Perform;
		void Perform(const BRepApprox_TheMultiLineOfApprox & Line);

		/****************** SetConstraints ******************/
		/**** md5 signature: 99b92dc193142adf44568f800cd394dc ****/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Changes the first and the last constraint points.

Parameters
----------
firstC: AppParCurves_Constraint
lastC: AppParCurves_Constraint

Returns
-------
None
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);

		/****************** SetContinuity ******************/
		/**** md5 signature: 004921b69180f9ee5c70f476a9b25f44 ****/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Sets the continuity of the spline. if c = 2, the spline will be c2.

Parameters
----------
C: int

Returns
-------
None
") SetContinuity;
		void SetContinuity(const Standard_Integer C);

		/****************** SetDegrees ******************/
		/**** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ****/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "Changes the degrees of the approximation.

Parameters
----------
degreemin: int
degreemax: int

Returns
-------
None
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****************** SetKnots ******************/
		/**** md5 signature: 81377d2824af79de90394b654e5ac494 ****/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "The approximation will be done with the set of knots <knots>. the multiplicities will be set with the degree and the desired continuity.

Parameters
----------
Knots: TColStd_Array1OfReal

Returns
-------
None
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & Knots);

		/****************** SetKnotsAndMultiplicities ******************/
		/**** md5 signature: 78291c57c68644dfe7114ee9a585b271 ****/
		%feature("compactdefaultargs") SetKnotsAndMultiplicities;
		%feature("autodoc", "The approximation will be done with the set of knots <knots> and the multiplicities <mults>.

Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Returns
-------
None
") SetKnotsAndMultiplicities;
		void SetKnotsAndMultiplicities(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults);

		/****************** SetParameters ******************/
		/**** md5 signature: b1eab3f1f1c8f0892e7a87810e5892e3 ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "The approximation will begin with the set of parameters <thepar>.

Parameters
----------
ThePar: math_Vector

Returns
-------
None
") SetParameters;
		void SetParameters(const math_Vector & ThePar);

		/****************** SetPeriodic ******************/
		/**** md5 signature: 3109823bbe448d62437b44b39b4d9b19 ****/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Sets periodic flag. if theperiodic = standard_true, algorith tries to build periodic multicurve using corresponding c1 boundary condition for first and last multipoints. multiline must be closed.

Parameters
----------
thePeriodic: bool

Returns
-------
None
") SetPeriodic;
		void SetPeriodic(const Standard_Boolean thePeriodic);

		/****************** SetTolerances ******************/
		/**** md5 signature: ce7879738ace848f7a3a27c56467be10 ****/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Changes the tolerances of the approximation.

Parameters
----------
Tolerance3d: float
Tolerance2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****************** Value ******************/
		/**** md5 signature: c818c96a9a832640b6267a997c4dbd3b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the result of the approximation.

Returns
-------
AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value();

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
		/****************** BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: fd1150e117774d6c220dfd74355e5440 ****/
		%feature("compactdefaultargs") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface

Returns
-------
None
") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2);

		/****************** AuxillarSurface1 ******************/
		/**** md5 signature: 35d4a58811ea11f385418cfaab72d7ba ****/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepAdaptor_Surface
") AuxillarSurface1;
		const BRepAdaptor_Surface & AuxillarSurface1();

		/****************** AuxillarSurface2 ******************/
		/**** md5 signature: 6195097157048ebf7856e69ebf2099cb ****/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepAdaptor_Surface
") AuxillarSurface2;
		const BRepAdaptor_Surface & AuxillarSurface2();

		/****************** ComputeParameters ******************/
		/**** md5 signature: 5686d6c4ca7c470ce5a820727bd25544 ****/
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
ChoixIso: IntImp_ConstIsoparametric
Param: TColStd_Array1OfReal
UVap: math_Vector
BornInf: math_Vector
BornSup: math_Vector
Tolerance: math_Vector

Returns
-------
None
") ComputeParameters;
		void ComputeParameters(const IntImp_ConstIsoparametric ChoixIso, const TColStd_Array1OfReal & Param, math_Vector & UVap, math_Vector & BornInf, math_Vector & BornSup, math_Vector & Tolerance);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction ******************/
		/**** md5 signature: 7db1622a0b370b4453af0886bb5f840c ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		/**** md5 signature: bc5dc0d8303d35b67ad8c11b04c94ec5 ****/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		/**** md5 signature: caea60e56e0b7869c8e3533543115136 ****/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		gp_Dir2d DirectionOnS2();

		/****************** IsTangent ******************/
		/**** md5 signature: 9e73991f5144c0e218a14c453bc89c5f ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
UVap: math_Vector
Param: TColStd_Array1OfReal
BestChoix: IntImp_ConstIsoparametric

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent(const math_Vector & UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric & BestChoix);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		/**** md5 signature: aacd847206090cc43a493e5072f97000 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns somme des fi*fi.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
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
		/****************** BRepApprox_TheImpPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: 351f816713979fa454a2d27963cc84ed ****/
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: BRepAdaptor_Surface
Surf2: IntSurf_Quadric

Returns
-------
None
") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & Surf1, const IntSurf_Quadric & Surf2);

		/****************** BRepApprox_TheImpPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: 07325ab325390fd9130b8085a321a96c ****/
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: IntSurf_Quadric
Surf2: BRepAdaptor_Surface

Returns
-------
None
") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox(const IntSurf_Quadric & Surf1, const BRepAdaptor_Surface & Surf2);

		/****************** Compute ******************/
		/**** md5 signature: 1b6699512251d1cde0fa87fb6fb9f2bf ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns true if tg,tguv1 tguv2 can be computed.

Parameters
----------
Pt: gp_Pnt
Tg: gp_Vec
Tguv1: gp_Vec2d
Tguv2: gp_Vec2d

Returns
-------
u1: float
v1: float
u2: float
v2: float
") Compute;
		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****************** Pnt ******************/
		/**** md5 signature: 9b8bce66add52a246baf1e5f56b41c57 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
P: gp_Pnt

Returns
-------
None
") Pnt;
		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);

		/****************** SeekPoint ******************/
		/**** md5 signature: 1cbe34841922a959c2a9bca52603cce9 ****/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Point: IntSurf_PntOn2S

Returns
-------
bool
") SeekPoint;
		Standard_Boolean SeekPoint(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, IntSurf_PntOn2S & Point);

		/****************** Tangency ******************/
		/**** md5 signature: c0c9891902a6459b409f1a9c52228000 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec

Returns
-------
bool
") Tangency;
		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);

		/****************** TangencyOnSurf1 ******************/
		/**** md5 signature: 92ffba31e07343330c44d9dee4123c55 ****/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Returns
-------
bool
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

		/****************** TangencyOnSurf2 ******************/
		/**** md5 signature: 0c3b4c57afa7cd03a0f9030ecd47326b ****/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Returns
-------
bool
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
		/****************** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: d3ed7255941cd2b0a551739eda53debc ****/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "Compute the solution point with the close point.

Parameters
----------
Param: TColStd_Array1OfReal
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
TolTangency: float

Returns
-------
None
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const TColStd_Array1OfReal & Param, const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const Standard_Real TolTangency);

		/****************** BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: fb5174c3acb3fe83c13bf6c1aa515267 ****/
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "Initialize the parameters to compute the solution point it 's possible to write to optimize: intimp_int2s inter(s1,s2,func,toltangency); math_functionsetroot rsnld(inter.function()); while ...{ param(1)=... param(2)=... param(3)=... inter.perform(param,rsnld); }.

Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
TolTangency: float

Returns
-------
None
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const Standard_Real TolTangency);

		/****************** ChangePoint ******************/
		/**** md5 signature: 1b1852ae04e18b1e3ae0c1ea8c1f6773 ****/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return the intersection point which is enable for changing.

Returns
-------
IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint();

		/****************** Direction ******************/
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the tangent at the intersection line.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		/**** md5 signature: 0ea23aedfa0d65293f06d50c4f4fd61f ****/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the first surface.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		/**** md5 signature: 9fe51e029e5ffcecf563550ef1c567fd ****/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the second surface.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d DirectionOnS2();

		/****************** Function ******************/
		/**** md5 signature: 5929136760b661f9c0d7a509de29d340 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox
") Function;
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox & Function();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true when there is no solution to the problem.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the surfaces are tangent at the intersection point.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** Perform ******************/
		/**** md5 signature: ba19d26576d52e0e2824307d3171f0bf ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is calculated).

Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot

Returns
-------
IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld);

		/****************** Perform ******************/
		/**** md5 signature: 01d0aa4ed60a8ef13ed05d29863bed35 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is given by choixiso).

Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot
ChoixIso: IntImp_ConstIsoparametric

Returns
-------
IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld, const IntImp_ConstIsoparametric ChoixIso);

		/****************** Point ******************/
		/**** md5 signature: be121892232ab68ab537f33c0dca8dfd ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point.

Returns
-------
IntSurf_PntOn2S
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
		/****************** BRepApprox_TheMultiLineOfApprox ******************/
		/**** md5 signature: 61f3332ae94879b6a2710bda28eece83 ****/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox();

		/****************** BRepApprox_TheMultiLineOfApprox ******************/
		/**** md5 signature: ad07dd28d2fb52ddfeff00bc4f3b39c1 ****/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "The class svsurfaces is used when the approximation algorithm needs some extra points on the line <line>. a new line is then created which shares the same surfaces and functions. svsurfaces is a deferred class which allows several implementations of this algorithm with different surfaces (bi-parametric ones, or implicit and biparametric ones).

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
IndMin: int,optional
	default value is 0
IndMax: int,optional
	default value is 0

Returns
-------
None
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox(const opencascade::handle<BRepApprox_ApproxLine> & line, const Standard_Address PtrSvSurfaces, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

		/****************** BRepApprox_TheMultiLineOfApprox ******************/
		/**** md5 signature: 2c60ef9b4d8ce91c87f55b4589e84dcd ****/
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "No extra points will be added on the current line.

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
IndMin: int,optional
	default value is 0
IndMax: int,optional
	default value is 0

Returns
-------
None
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox(const opencascade::handle<BRepApprox_ApproxLine> & line, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the current multi-line.

Returns
-------
None
") Dump;
		void Dump();

		/****************** FirstPoint ******************/
		/**** md5 signature: 6036aa5f9c36e4ed29b55026423af997 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FirstPoint;
		Standard_Integer FirstPoint();

		/****************** LastPoint ******************/
		/**** md5 signature: e2615285c6676dba4ad25275a0d452ca ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LastPoint;
		Standard_Integer LastPoint();

		/****************** MakeMLBetween ******************/
		/**** md5 signature: 87c3b2149dab9604268e6c6bc4f0c906 ****/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "Tries to make a sub-line between <low> and <high> points of this line by adding <nbpointstoinsert> new points.

Parameters
----------
Low: int
High: int
NbPointsToInsert: int

Returns
-------
BRepApprox_TheMultiLineOfApprox
") MakeMLBetween;
		BRepApprox_TheMultiLineOfApprox MakeMLBetween(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer NbPointsToInsert);

		/****************** MakeMLOneMorePoint ******************/
		/**** md5 signature: 421c45436bad3eda04a112bcb72d86ce ****/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "Tries to make a sub-line between <low> and <high> points of this line by adding one more point between (indbad-1)-th and indbad-th points.

Parameters
----------
Low: int
High: int
indbad: int
OtherLine: BRepApprox_TheMultiLineOfApprox

Returns
-------
bool
") MakeMLOneMorePoint;
		Standard_Boolean MakeMLOneMorePoint(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer indbad, BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****************** NbP2d ******************/
		/**** md5 signature: 9ba8c102bdeba2dda342e0db8269bbf5 ****/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "Returns the number of 2d points of a theline.

Returns
-------
int
") NbP2d;
		Standard_Integer NbP2d();

		/****************** NbP3d ******************/
		/**** md5 signature: 89b8d7613eeb2675b9641bf825abe487 ****/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "Returns the number of 3d points of a theline.

Returns
-------
int
") NbP3d;
		Standard_Integer NbP3d();

		/****************** Tangency ******************/
		/**** md5 signature: c6cbaf0059f48e429c903570a14ee737 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d tangency points of the multipoint <mpointindex> only when 3d points exist.

Parameters
----------
MPointIndex: int
tabV: TColgp_Array1OfVec

Returns
-------
bool
") Tangency;
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****************** Tangency ******************/
		/**** md5 signature: e9d5611508aa120465fde3464ad5ef52 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 2d tangency points of the multipoint <mpointindex> only when 2d points exist.

Parameters
----------
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****************** Tangency ******************/
		/**** md5 signature: c8caf611c9dc97dd9b8842534059cab9 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****************** Value ******************/
		/**** md5 signature: 511d3e7ebcd62cd9cfde5bca091161ea ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d points of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Returns
-------
None
") Value;
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****************** Value ******************/
		/**** md5 signature: 6626a2a082c59909a2d396794f2d2a4e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 2d points of the multipoint <mpointindex> when only 2d points exist.

Parameters
----------
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** Value ******************/
		/**** md5 signature: 9ace448e14090fa28f4ee0cbe190ed29 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
MPointIndex: int
tabPt: TColgp_Array1OfPnt
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** WhatStatus ******************/
		/**** md5 signature: 76f55e4a417176afbc003868c157efc5 ****/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
Approx_Status
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
		/****************** Curvature ******************/
		/**** md5 signature: bf7ee67527922d9913db5a4fbf2e4afb ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 3d curvature of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****************** Curvature ******************/
		/**** md5 signature: febf4f9f7956f4982c5221e66708df55 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 2d curvature points of the multipoint <mpointindex> only when 2d points exist.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****************** Curvature ******************/
		/**** md5 signature: ac0a699a5da9a476fb76822ea024d997 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 3d and 2d curvature of the multipoint <mpointindex>.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****************** Dump ******************/
		/**** md5 signature: b9cdb0fd704d7adbd581eb92bfcc2528 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the current multi-line.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Returns
-------
None
") Dump;
		static void Dump(const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** FirstPoint ******************/
		/**** md5 signature: 85a33a9acd8ba8a4e3e2371ddd20fc7c ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the number of multipoints of the themultiline.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Returns
-------
int
") FirstPoint;
		static Standard_Integer FirstPoint(const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** LastPoint ******************/
		/**** md5 signature: 47721ef9a832798de7a827f5fa93cc6a ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the number of multipoints of the themultiline.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Returns
-------
int
") LastPoint;
		static Standard_Integer LastPoint(const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** MakeMLBetween ******************/
		/**** md5 signature: 0f95b389697bc413dc72ff9ef97cc6a8 ****/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "Is called if whatstatus returned 'pointsadded'.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
I1: int
I2: int
NbPMin: int

Returns
-------
BRepApprox_TheMultiLineOfApprox
") MakeMLBetween;
		static BRepApprox_TheMultiLineOfApprox MakeMLBetween(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);

		/****************** MakeMLOneMorePoint ******************/
		/**** md5 signature: 4d363a38e0089ecaa07a9e81dab44599 ****/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "Is called when the bezier curve contains a loop.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
I1: int
I2: int
indbad: int
OtherLine: BRepApprox_TheMultiLineOfApprox

Returns
-------
bool
") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer indbad, BRepApprox_TheMultiLineOfApprox & OtherLine);

		/****************** NbP2d ******************/
		/**** md5 signature: 4dbf4c9efe98f097e7d61fb3638a07d9 ****/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "Returns the number of 2d points of a themultiline.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Returns
-------
int
") NbP2d;
		static Standard_Integer NbP2d(const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** NbP3d ******************/
		/**** md5 signature: cf55a696ef970abbf2e8f74b4a0daed1 ****/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "Returns the number of 3d points of a themultiline.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox

Returns
-------
int
") NbP3d;
		static Standard_Integer NbP3d(const BRepApprox_TheMultiLineOfApprox & ML);

		/****************** Tangency ******************/
		/**** md5 signature: b7b561fe15855fef28260b26ee552e4b ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d points of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****************** Tangency ******************/
		/**** md5 signature: 8152094c428170ba0f2f1fd17292c27c ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 2d tangency points of the multipoint <mpointindex> only when 2d points exist.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****************** Tangency ******************/
		/**** md5 signature: 6aef83009c20ac70bd1b04ba431473d4 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****************** Value ******************/
		/**** md5 signature: ecc7784256b44d7c12f30c0b086997a2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d points of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Returns
-------
None
") Value;
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****************** Value ******************/
		/**** md5 signature: f04c8e8e6745056be43d70d16c74dcf5 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 2d points of the multipoint <mpointindex> when only 2d points exist.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** Value ******************/
		/**** md5 signature: a95dafe6ca3a1d888726e591cc020148 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
MPointIndex: int
tabPt: TColgp_Array1OfPnt
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		static void Value(const BRepApprox_TheMultiLineOfApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** WhatStatus ******************/
		/**** md5 signature: d2b8e2cdf30a632e4776399c404b4817 ****/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
ML: BRepApprox_TheMultiLineOfApprox
I1: int
I2: int

Returns
-------
Approx_Status
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
		/****************** BRepApprox_ThePrmPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: e65d1da54b125e00ef167affcb368a96 ****/
		%feature("compactdefaultargs") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: BRepAdaptor_Surface
Surf2: BRepAdaptor_Surface

Returns
-------
None
") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_ThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & Surf1, const BRepAdaptor_Surface & Surf2);

		/****************** Compute ******************/
		/**** md5 signature: 1b6699512251d1cde0fa87fb6fb9f2bf ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns true if tg,tguv1 tguv2 can be computed.

Parameters
----------
Pt: gp_Pnt
Tg: gp_Vec
Tguv1: gp_Vec2d
Tguv2: gp_Vec2d

Returns
-------
u1: float
v1: float
u2: float
v2: float
") Compute;
		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****************** Pnt ******************/
		/**** md5 signature: 9b8bce66add52a246baf1e5f56b41c57 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
P: gp_Pnt

Returns
-------
None
") Pnt;
		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);

		/****************** SeekPoint ******************/
		/**** md5 signature: 1cbe34841922a959c2a9bca52603cce9 ****/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Point: IntSurf_PntOn2S

Returns
-------
bool
") SeekPoint;
		Standard_Boolean SeekPoint(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, IntSurf_PntOn2S & Point);

		/****************** Tangency ******************/
		/**** md5 signature: c0c9891902a6459b409f1a9c52228000 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec

Returns
-------
bool
") Tangency;
		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);

		/****************** TangencyOnSurf1 ******************/
		/**** md5 signature: 92ffba31e07343330c44d9dee4123c55 ****/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Returns
-------
bool
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

		/****************** TangencyOnSurf2 ******************/
		/**** md5 signature: 0c3b4c57afa7cd03a0f9030ecd47326b ****/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Returns
-------
bool
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
		/****************** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: b9ba9fb685c01d3cdaa6f5530485bceb ****/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox();

		/****************** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: a24c282cf420ee670be218df4f94a5f5 ****/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: BRepAdaptor_Surface
IS: IntSurf_Quadric

Returns
-------
None
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox(const BRepAdaptor_Surface & PS, const IntSurf_Quadric & IS);

		/****************** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******************/
		/**** md5 signature: 0dbcc591454534ee61d1672b023e50ce ****/
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS: IntSurf_Quadric

Returns
-------
None
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox(const IntSurf_Quadric & IS);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction2d ******************/
		/**** md5 signature: e46e583c3b745511fb8654831bfa19d7 ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		/**** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** ISurface ******************/
		/**** md5 signature: 0401f703cbd4484a6014535602bb165f ****/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface();

		/****************** IsTangent ******************/
		/**** md5 signature: 52337431677eb50512a9391c1db95a81 ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PSurface ******************/
		/**** md5 signature: 6400b2748022787da79a4e57d03a7e1a ****/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepAdaptor_Surface
") PSurface;
		const BRepAdaptor_Surface & PSurface();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Set ******************/
		/**** md5 signature: 9058e7788b2e34d9884944da3a219e67 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: BRepAdaptor_Surface

Returns
-------
None
") Set;
		void Set(const BRepAdaptor_Surface & PS);

		/****************** Set ******************/
		/**** md5 signature: 7e3e1092ebe5da1f71e965a1091893e3 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Tolerance);

		/****************** SetImplicitSurface ******************/
		/**** md5 signature: 0ad3b55688a2be8e3aa7ec9c9bcbd283 ****/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS: IntSurf_Quadric

Returns
-------
None
") SetImplicitSurface;
		void SetImplicitSurface(const IntSurf_Quadric & IS);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the value tol so that if abs(func.root())<tol the function is considered null.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
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
