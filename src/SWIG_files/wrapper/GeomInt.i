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
%define GEOMINTDOCSTRING
"GeomInt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomint.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** AdjustPeriodic ******************/
		/**** md5 signature: 798d1ad218945fa35f5e8004cf62fd89 ****/
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "Adjusts the parameter <thepar> to the range [theparmin, theparmax].

Parameters
----------
thePar: float
theParMin: float
theParMax: float
thePeriod: float
theEps: float,optional
	default value is 0.0

Returns
-------
theNewPar: float
theOffset: float
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
		/****************** GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: 95f162f6aaa1531a89b1428f339b406c ****/
		%feature("compactdefaultargs") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
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
") GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

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
		/****************** GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: df96df7d447ec20a697dde958e29bc35 ****/
		%feature("compactdefaultargs") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has <nbpol> control points.

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

Returns
-------
None
") GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer NbPol);

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
		/****************** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: a8700d677486ee164c3875093b4f932e ****/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: dc8709e15541387f4cb3f3aaea1efcaf ****/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: cd2b3cf8887d1f86e582feb25784d913 ****/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: c14b01f81ed49c62b910737a79c92f91 ****/
		%feature("compactdefaultargs") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/****************** GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: 2f331a9c91663dd49e0fb5b969bb4dcf ****/
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
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
") GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

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
		/****************** GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: c354604ffaf7830c5f69861ec1a4ae13 ****/
		%feature("compactdefaultargs") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
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
") GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

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
		/****************** GeomInt_IntSS ******************/
		/**** md5 signature: 6a673aba797288807b9b0c47fa8133f9 ****/
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_IntSS;
		 GeomInt_IntSS();

		/****************** GeomInt_IntSS ******************/
		/**** md5 signature: 4c7a2342f594f741697ac3face12ccf7 ****/
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "Performs general intersection of two surfaces just now.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float
Approx: bool,optional
	default value is Standard_True
ApproxS1: bool,optional
	default value is Standard_False
ApproxS2: bool,optional
	default value is Standard_False

Returns
-------
None
") GeomInt_IntSS;
		 GeomInt_IntSS(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****************** Boundary ******************/
		/**** md5 signature: 420cfa2d7d64016c63bd891d1d3758c1 ****/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") Boundary;
		const opencascade::handle<Geom_Curve> & Boundary(const Standard_Integer Index);

		/****************** BuildPCurves ******************/
		/**** md5 signature: 2c2bdb53423075c70323712785098b12 ****/
		%feature("compactdefaultargs") BuildPCurves;
		%feature("autodoc", "Creates 2d-curve on given surface from given 3d-curve.

Parameters
----------
f: float
l: float
S: Geom_Surface
C: Geom_Curve
C2d: Geom2d_Curve

Returns
-------
Tol: float
") BuildPCurves;
		static void BuildPCurves(const Standard_Real f, const Standard_Real l, Standard_Real &OutValue, const opencascade::handle<Geom_Surface> & S, const opencascade::handle<Geom_Curve> & C, opencascade::handle<Geom2d_Curve> & C2d);

		/****************** HasLineOnS1 ******************/
		/**** md5 signature: e18393447cffe4a479bac4f84a4e58a0 ****/
		%feature("compactdefaultargs") HasLineOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
bool
") HasLineOnS1;
		Standard_Boolean HasLineOnS1(const Standard_Integer Index);

		/****************** HasLineOnS2 ******************/
		/**** md5 signature: e61aece789be767af954581faf3fa6ee ****/
		%feature("compactdefaultargs") HasLineOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
bool
") HasLineOnS2;
		Standard_Boolean HasLineOnS2(const Standard_Integer Index);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 2500cd198cb3b23b6a306899bd784df3 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") Line;
		const opencascade::handle<Geom_Curve> & Line(const Standard_Integer Index);

		/****************** LineOnS1 ******************/
		/**** md5 signature: ee9dcd84dc7ff66b770c9bc7ea47ce94 ****/
		%feature("compactdefaultargs") LineOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") LineOnS1;
		const opencascade::handle<Geom2d_Curve> & LineOnS1(const Standard_Integer Index);

		/****************** LineOnS2 ******************/
		/**** md5 signature: 674ebc778dc8f81d5681fe8b2cff46e2 ****/
		%feature("compactdefaultargs") LineOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") LineOnS2;
		const opencascade::handle<Geom2d_Curve> & LineOnS2(const Standard_Integer Index);

		/****************** MakeBSpline ******************/
		/**** md5 signature: 91c34a2d8593765c4e94b0ff2305a713 ****/
		%feature("compactdefaultargs") MakeBSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
WL: IntPatch_WLine
ideb: int
ifin: int

Returns
-------
opencascade::handle<Geom_Curve>
") MakeBSpline;
		static opencascade::handle<Geom_Curve> MakeBSpline(const opencascade::handle<IntPatch_WLine> & WL, const Standard_Integer ideb, const Standard_Integer ifin);

		/****************** MakeBSpline2d ******************/
		/**** md5 signature: 2867dd5c5ab38c1bd094feb37ea97ef8 ****/
		%feature("compactdefaultargs") MakeBSpline2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
theWLine: IntPatch_WLine
ideb: int
ifin: int
onFirst: bool

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") MakeBSpline2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeBSpline2d(const opencascade::handle<IntPatch_WLine> & theWLine, const Standard_Integer ideb, const Standard_Integer ifin, const Standard_Boolean onFirst);

		/****************** NbBoundaries ******************/
		/**** md5 signature: 323b6e26295515e892919c1c737b3943 ****/
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBoundaries;
		Standard_Integer NbBoundaries();

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Perform ******************/
		/**** md5 signature: 40f08bb639a130ba527e1c323da22e12 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "General intersection of two surfaces.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float
Approx: bool,optional
	default value is Standard_True
ApproxS1: bool,optional
	default value is Standard_False
ApproxS2: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: b2a019dcc3a6698ca6e543f29c1a5fdb ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection of adapted surfaces.

Parameters
----------
HS1: GeomAdaptor_HSurface
HS2: GeomAdaptor_HSurface
Tol: float
Approx: bool,optional
	default value is Standard_True
ApproxS1: bool,optional
	default value is Standard_False
ApproxS2: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<GeomAdaptor_HSurface> & HS1, const opencascade::handle<GeomAdaptor_HSurface> & HS2, const Standard_Real Tol, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: 73c48116f09d9e8b379e1bbb117b10b1 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "General intersection using a starting point.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
Tol: float
U1: float
V1: float
U2: float
V2: float
Approx: bool,optional
	default value is Standard_True
ApproxS1: bool,optional
	default value is Standard_False
ApproxS2: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: b9277d7ddec70e649af5066d9199c604 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection of adapted surfaces using a starting point.

Parameters
----------
HS1: GeomAdaptor_HSurface
HS2: GeomAdaptor_HSurface
Tol: float
U1: float
V1: float
U2: float
V2: float
Approx: bool,optional
	default value is Standard_True
ApproxS1: bool,optional
	default value is Standard_False
ApproxS2: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<GeomAdaptor_HSurface> & HS1, const opencascade::handle<GeomAdaptor_HSurface> & HS2, const Standard_Real Tol, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Boolean Approx = Standard_True, const Standard_Boolean ApproxS1 = Standard_False, const Standard_Boolean ApproxS2 = Standard_False);

		/****************** Pnt2d ******************/
		/**** md5 signature: 70e3cf4a0a6f4cd62919c61b21b8dac0 ****/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
OnFirst: bool

Returns
-------
gp_Pnt2d
") Pnt2d;
		gp_Pnt2d Pnt2d(const Standard_Integer Index, const Standard_Boolean OnFirst);

		/****************** Point ******************/
		/**** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

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

		/****************** TreatRLine ******************/
		/**** md5 signature: 491c3dacd5f6421cc8110e8eca9b2a74 ****/
		%feature("compactdefaultargs") TreatRLine;
		%feature("autodoc", "Converts rline to geom(2d)_curve.

Parameters
----------
theRL: IntPatch_RLine
theHS1: GeomAdaptor_HSurface
theHS2: GeomAdaptor_HSurface
theC3d: Geom_Curve
theC2d1: Geom2d_Curve
theC2d2: Geom2d_Curve

Returns
-------
theTolReached: float
") TreatRLine;
		static void TreatRLine(const opencascade::handle<IntPatch_RLine> & theRL, const opencascade::handle<GeomAdaptor_HSurface> & theHS1, const opencascade::handle<GeomAdaptor_HSurface> & theHS2, opencascade::handle<Geom_Curve> & theC3d, opencascade::handle<Geom2d_Curve> & theC2d1, opencascade::handle<Geom2d_Curve> & theC2d2, Standard_Real &OutValue);

		/****************** TrimILineOnSurfBoundaries ******************/
		/**** md5 signature: 296ff18403a193bd148a0bb591fb60d7 ****/
		%feature("compactdefaultargs") TrimILineOnSurfBoundaries;
		%feature("autodoc", "Puts into thearrayofparameters the parameters of intersection points of given thec2d1 and thec2d2 curves with the boundaries of the source surface.

Parameters
----------
theC2d1: Geom2d_Curve
theC2d2: Geom2d_Curve
theBound1: Bnd_Box2d
theBound2: Bnd_Box2d
theArrayOfParameters: GeomInt_VectorOfReal

Returns
-------
None
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
		/****************** GeomInt_LineConstructor ******************/
		/**** md5 signature: cd9ef8ff25f29daf3b77b53b5c420a5c ****/
		%feature("compactdefaultargs") GeomInt_LineConstructor;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") GeomInt_LineConstructor;
		 GeomInt_LineConstructor();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if splitting was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		/**** md5 signature: 4d5aac89c4d3cac18412238d60b86a1b ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Initializes me by two surfaces and corresponding tools which represent boundaries of surfaces.

Parameters
----------
D1: Adaptor3d_TopolTool
D2: Adaptor3d_TopolTool
S1: GeomAdaptor_HSurface
S2: GeomAdaptor_HSurface

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_TopolTool> & D2, const opencascade::handle<GeomAdaptor_HSurface> & S1, const opencascade::handle<GeomAdaptor_HSurface> & S2);

		/****************** NbParts ******************/
		/**** md5 signature: 309ebdfe06afb1fef88f3046131c3deb ****/
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "Returns number of splits.

Returns
-------
int
") NbParts;
		Standard_Integer NbParts();

		/****************** Part ******************/
		/**** md5 signature: f69002d2370fd30ad15125b001cbb694 ****/
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "Return first and last parameters for given index of split.

Parameters
----------
I: int

Returns
-------
WFirst: float
WLast: float
") Part;
		void Part(const Standard_Integer I, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: d53bad4defc45a0373f63fc1ec36aed1 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Splits line.

Parameters
----------
L: IntPatch_Line

Returns
-------
None
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
		/****************** DecompositionOfWLine ******************/
		/**** md5 signature: 774f308a6369fea4648dea0a75ae1a0c ****/
		%feature("compactdefaultargs") DecompositionOfWLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
theWLine: IntPatch_WLine
theSurface1: GeomAdaptor_HSurface
theSurface2: GeomAdaptor_HSurface
aTolSum: float
theLConstructor: GeomInt_LineConstructor
theNewLines: IntPatch_SequenceOfLine

Returns
-------
bool
") DecompositionOfWLine;
		static Standard_Boolean DecompositionOfWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<GeomAdaptor_HSurface> & theSurface1, const opencascade::handle<GeomAdaptor_HSurface> & theSurface2, const Standard_Real aTolSum, const GeomInt_LineConstructor & theLConstructor, IntPatch_SequenceOfLine & theNewLines);

		/****************** FirstParameter ******************/
		/**** md5 signature: cccff448706b5dedef51e7fc2e64ae95 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntPatch_Line

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<IntPatch_Line> & L);

		/****************** LastParameter ******************/
		/**** md5 signature: effa0368a17acb3c5d6f9de6aafb3fae ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntPatch_Line

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<IntPatch_Line> & L);

		/****************** NbVertex ******************/
		/**** md5 signature: 969a69912df71ff6b80fd9d961e7de16 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntPatch_Line

Returns
-------
int
") NbVertex;
		static Standard_Integer NbVertex(const opencascade::handle<IntPatch_Line> & L);

		/****************** Vertex ******************/
		/**** md5 signature: 73a6affecb297c4b446319a49f00e19e ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntPatch_Line
I: int

Returns
-------
IntPatch_Point
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
		/****************** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: ef87cfba3c24ea93888e71a3c0be29c3 ****/
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bspline curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 1

Returns
-------
None
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 1);

		/****************** GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: b831b1795f058879cd6239890cf1ae05 ****/
		%feature("compactdefaultargs") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bspline curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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

Returns
-------
None
") GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
		 GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);

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
		/****************** GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: bf922070a3642543d5a1224019e030ae ****/
		%feature("compactdefaultargs") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bezier curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 200

Returns
-------
None
") GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

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
		/****************** GeomInt_MyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: b62fe6cd4df1ba01832d61fdca6243e0 ****/
		%feature("compactdefaultargs") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bezier curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 200

Returns
-------
None
") GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_MyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

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
		/****************** GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: ee53c09a9de2b424080cb5c75793a11f ****/
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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
		/****************** GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: 43deda66782b5bd2478b5a836627b0bc ****/
		%feature("compactdefaultargs") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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
		/****************** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: 58c9576076f46b91ce462defe4858397 ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: 9edc3e6891a4c97484af8d201ee5e98f ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: 9907f51b3bd6fb246ef53897e07579ba ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: 4b95fadc5aa7b8b9cd9fec91a6736b15 ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/****************** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: b3aa14c52d753e7c6fc1d3758e7f2b7d ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: 69c2c37ad9c67af2e09ba84b86e50ac0 ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: 766e9208ee9e5caa7e7d9d398a958987 ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: 1230eab1cecef29cac8dba6e1e650983 ****/
		%feature("compactdefaultargs") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/****************** GeomInt_ParameterAndOrientation ******************/
		/**** md5 signature: 6cca03108fc212d5bbc31cdd4fbf3487 ****/
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation();

		/****************** GeomInt_ParameterAndOrientation ******************/
		/**** md5 signature: b73c024866826e866f0fd78b03287d5b ****/
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Returns
-------
None
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation(const Standard_Real P, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2);

		/****************** Orientation1 ******************/
		/**** md5 signature: 7587ff7fc48025bbff368ace10cabd2a ****/
		%feature("compactdefaultargs") Orientation1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation1;
		TopAbs_Orientation Orientation1();

		/****************** Orientation2 ******************/
		/**** md5 signature: 2d7cc584f2695a7121e03b04cbcb8b4e ****/
		%feature("compactdefaultargs") Orientation2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation2;
		TopAbs_Orientation Orientation2();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetOrientation1 ******************/
		/**** md5 signature: 7f2401488589d25382e9294a24a4b0e0 ****/
		%feature("compactdefaultargs") SetOrientation1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Or: TopAbs_Orientation

Returns
-------
None
") SetOrientation1;
		void SetOrientation1(const TopAbs_Orientation Or);

		/****************** SetOrientation2 ******************/
		/**** md5 signature: 17a43583865b1a0ff0f3cb64de3abb59 ****/
		%feature("compactdefaultargs") SetOrientation2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Or: TopAbs_Orientation

Returns
-------
None
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
		/****************** GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: dd14ed0559c25c663dfedf76e3dfc970 ****/
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: b38314c9e183aafa4dafa7b68667019e ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const GeomInt_TheMultiLineOfWLApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****************** GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox ******************/
		/**** md5 signature: 1a702a4b62bddf4a5e9212eaefa3fffb ****/
		%feature("compactdefaultargs") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox;
		 GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: b38314c9e183aafa4dafa7b68667019e ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: GeomInt_TheMultiLineOfWLApprox
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const GeomInt_TheMultiLineOfWLApprox & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****************** GeomInt_TheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: c343bc7d9f3ec6dbfbcccc03ba9d1218 ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** GeomInt_TheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: aff89dcdd1a255b74c6a0dc776f7a5e6 ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** GeomInt_TheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: 46052aa41112b64cb818bc868ab55acb ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** GeomInt_TheComputeLineBezierOfWLApprox ******************/
		/**** md5 signature: 960afef161988f9bdfa23a34d861d040 ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineBezierOfWLApprox;
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
") GeomInt_TheComputeLineBezierOfWLApprox;
		 GeomInt_TheComputeLineBezierOfWLApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

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
		/**** md5 signature: e115d44c5fb2b2b1ce99193ba9c7c351 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox

Returns
-------
None
") Perform;
		void Perform(const GeomInt_TheMultiLineOfWLApprox & Line);

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
		/****************** GeomInt_TheComputeLineOfWLApprox ******************/
		/**** md5 signature: b9b2eea770dde3a33acff69b797c5194 ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all. //! the multiplicities of the internal knots is set by default.

Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** GeomInt_TheComputeLineOfWLApprox ******************/
		/**** md5 signature: 9d604b4be0a608e72118113e8ef7c3d1 ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** GeomInt_TheComputeLineOfWLApprox ******************/
		/**** md5 signature: eec3ddd81d818d27b5b39aee9259754d ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** GeomInt_TheComputeLineOfWLApprox ******************/
		/**** md5 signature: 628a249bcbcdca28ed481dc6e592f2a8 ****/
		%feature("compactdefaultargs") GeomInt_TheComputeLineOfWLApprox;
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
") GeomInt_TheComputeLineOfWLApprox;
		 GeomInt_TheComputeLineOfWLApprox(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

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
		/**** md5 signature: a80615bcc8b246576877bfac3620ec30 ****/
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "Constructs an interpolation of the multiline <line> the result will be a c2 curve of degree 3.

Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox

Returns
-------
None
") Interpol;
		void Interpol(const GeomInt_TheMultiLineOfWLApprox & Line);

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
		/**** md5 signature: e115d44c5fb2b2b1ce99193ba9c7c351 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: GeomInt_TheMultiLineOfWLApprox

Returns
-------
None
") Perform;
		void Perform(const GeomInt_TheMultiLineOfWLApprox & Line);

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
		/****************** GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 04e99abbd3cd62b143bbab42c401762d ****/
		%feature("compactdefaultargs") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface

Returns
-------
None
") GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2);

		/****************** AuxillarSurface1 ******************/
		/**** md5 signature: de137e38f3f056bf64cd7e4eab548eaf ****/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface1();

		/****************** AuxillarSurface2 ******************/
		/**** md5 signature: 02af9eff198053eb68634237a25ca989 ****/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface2();

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
		/****************** GeomInt_TheImpPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 67802e9ec30b002579345b39c4c42061 ****/
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
Surf2: IntSurf_Quadric

Returns
-------
None
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const IntSurf_Quadric & Surf2);

		/****************** GeomInt_TheImpPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: e34c1e0ff4d487121cdafcee827c63a9 ****/
		%feature("compactdefaultargs") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: IntSurf_Quadric
Surf2: Adaptor3d_HSurface

Returns
-------
None
") GeomInt_TheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheImpPrmSvSurfacesOfWLApprox(const IntSurf_Quadric & Surf1, const opencascade::handle<Adaptor3d_HSurface> & Surf2);

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
		/****************** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 04b2619a6f98ac1a5927c14c79f12519 ****/
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "Compute the solution point with the close point.

Parameters
----------
Param: TColStd_Array1OfReal
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
TolTangency: float

Returns
-------
None
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const TColStd_Array1OfReal & Param, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Real TolTangency);

		/****************** GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 040b8daf3619bbcc53290d53fda04889 ****/
		%feature("compactdefaultargs") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "Initialize the parameters to compute the solution point it 's possible to write to optimize: intimp_int2s inter(s1,s2,func,toltangency); math_functionsetroot rsnld(inter.function()); while ...{ param(1)=... param(2)=... param(3)=... inter.perform(param,rsnld); }.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
TolTangency: float

Returns
-------
None
") GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Real TolTangency);

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
		/**** md5 signature: 43bb8650e368bc791dc8eaaa177bb74e ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox
") Function;
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox & Function();

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
		/****************** GeomInt_TheMultiLineOfWLApprox ******************/
		/**** md5 signature: c2ed49fafe35b388b0ef3d545c75a2a8 ****/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox();

		/****************** GeomInt_TheMultiLineOfWLApprox ******************/
		/**** md5 signature: 4ddf30ac96d36e8ce49087ee99c94be7 ****/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "The class svsurfaces is used when the approximation algorithm needs some extra points on the line <line>. a new line is then created which shares the same surfaces and functions. svsurfaces is a deferred class which allows several implementations of this algorithm with different surfaces (bi-parametric ones, or implicit and biparametric ones).

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
IndMin: int,optional
	default value is 0
IndMax: int,optional
	default value is 0

Returns
-------
None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox(const opencascade::handle<IntPatch_WLine> & line, const Standard_Address PtrSvSurfaces, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

		/****************** GeomInt_TheMultiLineOfWLApprox ******************/
		/**** md5 signature: 3fd1ba939844ce5e4adc270eda1c3b31 ****/
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "No extra points will be added on the current line.

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
IndMin: int,optional
	default value is 0
IndMax: int,optional
	default value is 0

Returns
-------
None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox(const opencascade::handle<IntPatch_WLine> & line, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Boolean ApproxU1V1, const Standard_Boolean ApproxU2V2, const Standard_Real xo, const Standard_Real yo, const Standard_Real zo, const Standard_Real u1o, const Standard_Real v1o, const Standard_Real u2o, const Standard_Real v2o, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin = 0, const Standard_Integer IndMax = 0);

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
		/**** md5 signature: 6392dc6977d6e5a43ecf048227776d01 ****/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "Tries to make a sub-line between <low> and <high> points of this line by adding <nbpointstoinsert> new points.

Parameters
----------
Low: int
High: int
NbPointsToInsert: int

Returns
-------
GeomInt_TheMultiLineOfWLApprox
") MakeMLBetween;
		GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer NbPointsToInsert);

		/****************** MakeMLOneMorePoint ******************/
		/**** md5 signature: b8f4516c2a73f53099399a42161e3b64 ****/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "Tries to make a sub-line between <low> and <high> points of this line by adding one more point between (indbad-1)-th and indbad-th points.

Parameters
----------
Low: int
High: int
indbad: int
OtherLine: GeomInt_TheMultiLineOfWLApprox

Returns
-------
bool
") MakeMLOneMorePoint;
		Standard_Boolean MakeMLOneMorePoint(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer indbad, GeomInt_TheMultiLineOfWLApprox & OtherLine);

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
		/****************** Curvature ******************/
		/**** md5 signature: 540f8f1f5f9e6b29b07e6966846f1f09 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 3d curvature of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****************** Curvature ******************/
		/**** md5 signature: c07b9a55ac59da6337af380487b5f09c ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 2d curvature points of the multipoint <mpointindex> only when 2d points exist.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****************** Curvature ******************/
		/**** md5 signature: a6c585cced878685c8942720833d81d6 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 3d and 2d curvature of the multipoint <mpointindex>.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****************** Dump ******************/
		/**** md5 signature: 83bb31963a02a9571556f72963cd8928 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the current multi-line.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Returns
-------
None
") Dump;
		static void Dump(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****************** FirstPoint ******************/
		/**** md5 signature: 7f320dfe381ccce1af50c7e445e6a63f ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the number of multipoints of the themultiline.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Returns
-------
int
") FirstPoint;
		static Standard_Integer FirstPoint(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****************** LastPoint ******************/
		/**** md5 signature: f44699157422da1732c4d8c428fd2a1d ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the number of multipoints of the themultiline.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Returns
-------
int
") LastPoint;
		static Standard_Integer LastPoint(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****************** MakeMLBetween ******************/
		/**** md5 signature: cac050178e72daca646228b097714ad8 ****/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "Is called if whatstatus returned 'pointsadded'.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
I1: int
I2: int
NbPMin: int

Returns
-------
GeomInt_TheMultiLineOfWLApprox
") MakeMLBetween;
		static GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);

		/****************** MakeMLOneMorePoint ******************/
		/**** md5 signature: 22c9099dde84e1b3c0fe48c406759fa2 ****/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "Is called when the bezier curve contains a loop.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
I1: int
I2: int
indbad: int
OtherLine: GeomInt_TheMultiLineOfWLApprox

Returns
-------
bool
") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer indbad, GeomInt_TheMultiLineOfWLApprox & OtherLine);

		/****************** NbP2d ******************/
		/**** md5 signature: d08a23fc3cec468ea2dc9d62333ca0b6 ****/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "Returns the number of 2d points of a themultiline.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Returns
-------
int
") NbP2d;
		static Standard_Integer NbP2d(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****************** NbP3d ******************/
		/**** md5 signature: 104c9830afe0ee70317cec9bd26a0f31 ****/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "Returns the number of 3d points of a themultiline.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox

Returns
-------
int
") NbP3d;
		static Standard_Integer NbP3d(const GeomInt_TheMultiLineOfWLApprox & ML);

		/****************** Tangency ******************/
		/**** md5 signature: 353ffbc60b2066d01b722d42beaf0003 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d points of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV: TColgp_Array1OfVec

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****************** Tangency ******************/
		/**** md5 signature: 66667d666a7ba7b699e82ca544cfb484 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 2d tangency points of the multipoint <mpointindex> only when 2d points exist.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****************** Tangency ******************/
		/**** md5 signature: c205bac8076782b30c36cb6c5b727e8f ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****************** Value ******************/
		/**** md5 signature: e3b5836b7076ecd000b242828d45b542 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d points of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Returns
-------
None
") Value;
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****************** Value ******************/
		/**** md5 signature: e5458e490d179e2affedc4bbf2e0f104 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 2d points of the multipoint <mpointindex> when only 2d points exist.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** Value ******************/
		/**** md5 signature: 18d25f4dbf3d41db67b9c06463625c87 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
MPointIndex: int
tabPt: TColgp_Array1OfPnt
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		static void Value(const GeomInt_TheMultiLineOfWLApprox & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** WhatStatus ******************/
		/**** md5 signature: baef7139cfc25c86bff783f36400301b ****/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
ML: GeomInt_TheMultiLineOfWLApprox
I1: int
I2: int

Returns
-------
Approx_Status
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
		/****************** GeomInt_ThePrmPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 7eee316f3f8c667ac175b17810322d14 ****/
		%feature("compactdefaultargs") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
Surf2: Adaptor3d_HSurface

Returns
-------
None
") GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
		 GeomInt_ThePrmPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor3d_HSurface> & Surf2);

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
		/****************** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 6082126d7f99fad2aa2897d2cb23375d ****/
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox();

		/****************** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 2101093207590f04c74bb5f87f45afed ****/
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: Adaptor3d_HSurface
IS: IntSurf_Quadric

Returns
-------
None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox(const opencascade::handle<Adaptor3d_HSurface> & PS, const IntSurf_Quadric & IS);

		/****************** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ******************/
		/**** md5 signature: 2f8aa55f338308969cc539957c11e030 ****/
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS: IntSurf_Quadric

Returns
-------
None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox(const IntSurf_Quadric & IS);

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
		/**** md5 signature: 0a40ce1f5ad8ff1450f2b3c7ab3a7140 ****/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface();

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
		/**** md5 signature: 9ecb67ee9b893e382519f5f1648548ac ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & PS);

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
