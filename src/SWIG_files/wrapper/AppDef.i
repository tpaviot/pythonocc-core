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

/* python proy classes for enums */
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

%extend NCollection_Array1<AppDef_MultiPointConstraint> {
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
typedef NCollection_Array1<AppDef_MultiPointConstraint> AppDef_Array1OfMultiPointConstraint;
/* end typedefs declaration */

/****************************************************************
* class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute *
****************************************************************/
class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute : public math_BFGS {
	public:
		/****************** AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute ******************/
		/**** md5 signature: b799c0288bfc80846933f29e0453169e ****/
		%feature("compactdefaultargs") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
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
") AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

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
		/**** md5 signature: 659c146b3e69832c7073bcc94e62f2f9 ****/
		%feature("compactdefaultargs") AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has <nbpol> control points.

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

Returns
-------
None
") AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer NbPol);

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
		/**** md5 signature: 7212679b8f6e008d4b7aa3fb8cfebd46 ****/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******************/
		/**** md5 signature: 95a7c9c221e01ce5ef38001c1e1f1ed1 ****/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******************/
		/**** md5 signature: 2780998f405468abc7dcea03504fb32f ****/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute ******************/
		/**** md5 signature: 23e53a2b39fe45234ff5600214a374ac ****/
		%feature("compactdefaultargs") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute;
		 AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/**** md5 signature: 2408a61abd93bf31117d7ba011536f8c ****/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all. //! the multiplicities of the internal knots is set by default.

Parameters
----------
Line: AppDef_MultiLine
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
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const AppDef_MultiLine & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_BSplineCompute ******************/
		/**** md5 signature: 7b22210476c396af31272298fe953380 ****/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: AppDef_MultiLine
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
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const AppDef_MultiLine & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_BSplineCompute ******************/
		/**** md5 signature: 37659dde443160bc04cf7ecedbff89a5 ****/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
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
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_BSplineCompute ******************/
		/**** md5 signature: 4beb8fca857f810f35b0c88e2b91fd54 ****/
		%feature("compactdefaultargs") AppDef_BSplineCompute;
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
") AppDef_BSplineCompute;
		 AppDef_BSplineCompute(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

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
		/**** md5 signature: bc4286f280e57eaa20ef92f495fa1e33 ****/
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "Constructs an interpolation of the multiline <line> the result will be a c2 curve of degree 3.

Parameters
----------
Line: AppDef_MultiLine

Returns
-------
None
") Interpol;
		void Interpol(const AppDef_MultiLine & Line);

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
		/**** md5 signature: ba94f8a8967068aa8bee6df81ea2be62 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: AppDef_MultiLine

Returns
-------
None
") Perform;
		void Perform(const AppDef_MultiLine & Line);

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
		/**** md5 signature: c6833ee0a5b84d67a02d9dae53b24f5f ****/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: AppDef_MultiLine
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
") AppDef_Compute;
		 AppDef_Compute(const AppDef_MultiLine & Line, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-3, const Standard_Real Tolerance2d = 1.0e-6, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_Compute ******************/
		/**** md5 signature: 9e4217e85d94e90315d60b7b75f82535 ****/
		%feature("compactdefaultargs") AppDef_Compute;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true. if <squares> is true, the computation will be done with no iteration at all.

Parameters
----------
Line: AppDef_MultiLine
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
") AppDef_Compute;
		 AppDef_Compute(const AppDef_MultiLine & Line, const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_Compute ******************/
		/**** md5 signature: ad9cd1ddc4958b27791ce973be5159af ****/
		%feature("compactdefaultargs") AppDef_Compute;
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
") AppDef_Compute;
		 AppDef_Compute(const math_Vector & Parameters, const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Standard_Boolean Squares = Standard_False);

		/****************** AppDef_Compute ******************/
		/**** md5 signature: c8eee3cf66b774bb63a317362fc20729 ****/
		%feature("compactdefaultargs") AppDef_Compute;
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
") AppDef_Compute;
		 AppDef_Compute(const Standard_Integer degreemin = 4, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-03, const Standard_Real Tolerance2d = 1.0e-06, const Standard_Integer NbIterations = 5, const Standard_Boolean cutting = Standard_True, const Approx_ParametrizationType parametrization = Approx_ChordLength, const Standard_Boolean Squares = Standard_False);

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
		/**** md5 signature: ba94f8a8967068aa8bee6df81ea2be62 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: AppDef_MultiLine

Returns
-------
None
") Perform;
		void Perform(const AppDef_MultiLine & Line);

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
		/**** md5 signature: 126f77d585cdec22a8e8a8e4ae8c13ce ****/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientOfCompute;
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
") AppDef_Gradient_BFGSOfMyGradientOfCompute;
		 AppDef_Gradient_BFGSOfMyGradientOfCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

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
		/**** md5 signature: db032bfef1a0cabc4126bb1cff8b2cd7 ****/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
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
") AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute;
		 AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

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
		/**** md5 signature: a988e1566651277ba477ec7a76734981 ****/
		%feature("compactdefaultargs") AppDef_Gradient_BFGSOfTheGradient;
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
") AppDef_Gradient_BFGSOfTheGradient;
		 AppDef_Gradient_BFGSOfTheGradient(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations = 200);

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
		/**** md5 signature: eca84113c714860aa7239eb211e137f5 ****/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "Creates an undefined multiline.

Returns
-------
None
") AppDef_MultiLine;
		 AppDef_MultiLine();

		/****************** AppDef_MultiLine ******************/
		/**** md5 signature: 12f50085378edce7cd43da048d563786 ****/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "Given the number nbmult of multipointconstraints of this multiline , it initializes all the fields.setvalue must be called in order for the values of the multipoint constraint to be taken into account. an exception is raised if nbmult < 0.

Parameters
----------
NbMult: int

Returns
-------
None
") AppDef_MultiLine;
		 AppDef_MultiLine(const Standard_Integer NbMult);

		/****************** AppDef_MultiLine ******************/
		/**** md5 signature: 64ec35865d92daa24a03b18b2dd11882 ****/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "Constructs a multiline with an array of multipointconstraints.

Parameters
----------
tabMultiP: AppDef_Array1OfMultiPointConstraint

Returns
-------
None
") AppDef_MultiLine;
		 AppDef_MultiLine(const AppDef_Array1OfMultiPointConstraint & tabMultiP);

		/****************** AppDef_MultiLine ******************/
		/**** md5 signature: 1bf9d9b2d482b677ffc5d1deb2308402 ****/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "The multiline constructed will have one line of 3d points without their tangencies.

Parameters
----------
tabP3d: TColgp_Array1OfPnt

Returns
-------
None
") AppDef_MultiLine;
		 AppDef_MultiLine(const TColgp_Array1OfPnt & tabP3d);

		/****************** AppDef_MultiLine ******************/
		/**** md5 signature: 1d6626e296ebc032e27692387207051e ****/
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "The multiline constructed will have one line of 2d points without their tangencies.

Parameters
----------
tabP2d: TColgp_Array1OfPnt2d

Returns
-------
None
") AppDef_MultiLine;
		 AppDef_MultiLine(const TColgp_Array1OfPnt2d & tabP2d);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** NbMultiPoints ******************/
		/**** md5 signature: 3773aba9a0a09cf608eddf5448da667d ****/
		%feature("compactdefaultargs") NbMultiPoints;
		%feature("autodoc", "Returns the number of multipointconstraints of the multiline.

Returns
-------
int
") NbMultiPoints;
		Standard_Integer NbMultiPoints();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points from multipoints composing the multiline.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** SetValue ******************/
		/**** md5 signature: ae7924dceb17bb1bf8b5a017807c66cf ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "It sets the multipointconstraint of range index to the value mpoint. an exception is raised if index < 0 or index> mpoint. an exception is raised if the dimensions of the multipoints are different.

Parameters
----------
Index: int
MPoint: AppDef_MultiPointConstraint

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, const AppDef_MultiPointConstraint & MPoint);

		/****************** Value ******************/
		/**** md5 signature: ec3432f3274bca28664158bc2414cf94 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the multipointconstraint of range index an exception is raised if index<0 or index>mpoint.

Parameters
----------
Index: int

Returns
-------
AppDef_MultiPointConstraint
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
		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 96027af1988322f99b6e55f7786bbfed ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates an undefined multipointconstraint.

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint();

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: ff76964ee920829861e64dfe38e9cb12 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Constructs a set of points used to approximate a multiline. these points can be of 2 or 3 dimensions. points will be initialized with setpoint and setpoint2d.

Parameters
----------
NbPoints: int
NbPoints2d: int

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const Standard_Integer NbPoints, const Standard_Integer NbPoints2d);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 9184167dca4027cf0f0b5603034fb92c ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipoint only composed of 3d points.

Parameters
----------
tabP: TColgp_Array1OfPnt

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 46a09e9865b6eb31d4538e09d085c188 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipoint only composed of 2d points.

Parameters
----------
tabP: TColgp_Array1OfPnt2d

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt2d & tabP);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 4b41af30a79a87deddbf4ee5cd31a158 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Constructs a set of points used to approximate a multiline. these points can be of 2 or 3 dimensions. points will be initialized with setpoint and setpoint2d.

Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 44443bf947130186f3723c074454fa6c ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipointconstraint with a constraint of curvature. an exception is raised if (length of <tabp> + length of <tabp2d> ) is different from (length of <tabvec> + length of <tabvec2d> ) or from (length of <tabcur> + length of <tabcur2d> ).

Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d
tabVec: TColgp_Array1OfVec
tabVec2d: TColgp_Array1OfVec2d
tabCur: TColgp_Array1OfVec
tabCur2d: TColgp_Array1OfVec2d

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec & tabVec, const TColgp_Array1OfVec2d & tabVec2d, const TColgp_Array1OfVec & tabCur, const TColgp_Array1OfVec2d & tabCur2d);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: d748f264c5548ebcc67245703c451c24 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipointconstraint with a constraint of tangency. an exception is raised if (length of <tabp> + length of <tabp2d> ) is different from (length of <tabvec> + length of <tabvec2d> ).

Parameters
----------
tabP: TColgp_Array1OfPnt
tabP2d: TColgp_Array1OfPnt2d
tabVec: TColgp_Array1OfVec
tabVec2d: TColgp_Array1OfVec2d

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec & tabVec, const TColgp_Array1OfVec2d & tabVec2d);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 94d7957cb88369d49d63036eed746423 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipointconstraint only composed of 3d points with constraints of curvature. an exception is raised if the length of tabp is different from the length of tabvec or from tabcur.

Parameters
----------
tabP: TColgp_Array1OfPnt
tabVec: TColgp_Array1OfVec
tabCur: TColgp_Array1OfVec

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfVec & tabVec, const TColgp_Array1OfVec & tabCur);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 31f20878f084137d450aeb8e587bf928 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipointconstraint only composed of 3d points with constraints of tangency. an exception is raised if the length of tabp is different from the length of tabvec.

Parameters
----------
tabP: TColgp_Array1OfPnt
tabVec: TColgp_Array1OfVec

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt & tabP, const TColgp_Array1OfVec & tabVec);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 21d3ccff0015997a435f1a264a1c2e78 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipointconstraint only composed of 2d points with constraints of tangency. an exception is raised if the length of tabp is different from the length of tabvec2d.

Parameters
----------
tabP2d: TColgp_Array1OfPnt2d
tabVec2d: TColgp_Array1OfVec2d

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec2d & tabVec2d);

		/****************** AppDef_MultiPointConstraint ******************/
		/**** md5 signature: 66a61a1bf7f3832fb19b1df85df945e9 ****/
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates a multipointconstraint only composed of 2d points with constraints of curvature. an exception is raised if the length of tabp is different from the length of tabvec2d or from tabcur2d.

Parameters
----------
tabP2d: TColgp_Array1OfPnt2d
tabVec2d: TColgp_Array1OfVec2d
tabCur2d: TColgp_Array1OfVec2d

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint(const TColgp_Array1OfPnt2d & tabP2d, const TColgp_Array1OfVec2d & tabVec2d, const TColgp_Array1OfVec2d & tabCur2d);

		/****************** Curv ******************/
		/**** md5 signature: 901fe2bd94b085eee25dc02982da6bce ****/
		%feature("compactdefaultargs") Curv;
		%feature("autodoc", "Returns the normal vector at the point of range index. an exception is raised if index < 0 or if index > number of 3d points.

Parameters
----------
Index: int

Returns
-------
gp_Vec
") Curv;
		gp_Vec Curv(const Standard_Integer Index);

		/****************** Curv2d ******************/
		/**** md5 signature: e6ac9d88d679b86619b3f52f8b16e6a4 ****/
		%feature("compactdefaultargs") Curv2d;
		%feature("autodoc", "Returns the normal vector at the point of range index. an exception is raised if index < 0 or if index > number of 3d points.

Parameters
----------
Index: int

Returns
-------
gp_Vec2d
") Curv2d;
		gp_Vec2d Curv2d(const Standard_Integer Index);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsCurvaturePoint ******************/
		/**** md5 signature: d472719ada146163920fff12150b4a88 ****/
		%feature("compactdefaultargs") IsCurvaturePoint;
		%feature("autodoc", "Returns true if the multipoint has a curvature value.

Returns
-------
bool
") IsCurvaturePoint;
		Standard_Boolean IsCurvaturePoint();

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true if the multipoint has a tangency value.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** SetCurv ******************/
		/**** md5 signature: 0162d39bffdfbd1d75ead34617bd7b2e ****/
		%feature("compactdefaultargs") SetCurv;
		%feature("autodoc", "Vec sets the value of the normal vector at the point of index index. the norm of the normal vector at the point of position index is set to the normal curvature. an exception is raised if index <0 or if index > number of 3d points. an exception is raised if curv has an incorrect number of dimensions.

Parameters
----------
Index: int
Curv: gp_Vec

Returns
-------
None
") SetCurv;
		void SetCurv(const Standard_Integer Index, const gp_Vec & Curv);

		/****************** SetCurv2d ******************/
		/**** md5 signature: 3ec1dbcf520f618b653d5041e0c8d8dd ****/
		%feature("compactdefaultargs") SetCurv2d;
		%feature("autodoc", "Vec sets the value of the normal vector at the point of index index. the norm of the normal vector at the point of position index is set to the normal curvature. an exception is raised if index <0 or if index > number of 3d points. an exception is raised if curv has an incorrect number of dimensions.

Parameters
----------
Index: int
Curv2d: gp_Vec2d

Returns
-------
None
") SetCurv2d;
		void SetCurv2d(const Standard_Integer Index, const gp_Vec2d & Curv2d);

		/****************** SetTang ******************/
		/**** md5 signature: b9f6088507651a7284dea739ac0606f3 ****/
		%feature("compactdefaultargs") SetTang;
		%feature("autodoc", "Sets the value of the tangency of the point of range index. an exception is raised if index <0 or if index > number of 3d points. an exception is raised if tang has an incorrect number of dimensions.

Parameters
----------
Index: int
Tang: gp_Vec

Returns
-------
None
") SetTang;
		void SetTang(const Standard_Integer Index, const gp_Vec & Tang);

		/****************** SetTang2d ******************/
		/**** md5 signature: f8ceb77e6c6d212baca26c1596380f6f ****/
		%feature("compactdefaultargs") SetTang2d;
		%feature("autodoc", "Sets the value of the tangency of the point of range index. an exception is raised if index <number of 3d points or if index > total number of points an exception is raised if tang has an incorrect number of dimensions.

Parameters
----------
Index: int
Tang2d: gp_Vec2d

Returns
-------
None
") SetTang2d;
		void SetTang2d(const Standard_Integer Index, const gp_Vec2d & Tang2d);

		/****************** Tang ******************/
		/**** md5 signature: b3ab01973cc67e0139dc6df881bab23f ****/
		%feature("compactdefaultargs") Tang;
		%feature("autodoc", "Returns the tangency value of the point of range index. an exception is raised if index < 0 or if index > number of 3d points.

Parameters
----------
Index: int

Returns
-------
gp_Vec
") Tang;
		gp_Vec Tang(const Standard_Integer Index);

		/****************** Tang2d ******************/
		/**** md5 signature: 40fbe4c8c727eda957d23ce8b2313218 ****/
		%feature("compactdefaultargs") Tang2d;
		%feature("autodoc", "Returns the tangency value of the point of range index. an exception is raised if index < number of 3d points or if index > total number of points.

Parameters
----------
Index: int

Returns
-------
gp_Vec2d
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
		/****************** AppDef_MyBSplGradientOfBSplineCompute ******************/
		/**** md5 signature: 285b1c5b1288155aae98fcdade735980 ****/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bspline curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 1

Returns
-------
None
") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 1);

		/****************** AppDef_MyBSplGradientOfBSplineCompute ******************/
		/**** md5 signature: e90d26c95787b979a56c520408235daf ****/
		%feature("compactdefaultargs") AppDef_MyBSplGradientOfBSplineCompute;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bspline curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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

Returns
-------
None
") AppDef_MyBSplGradientOfBSplineCompute;
		 AppDef_MyBSplGradientOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);

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
		/**** md5 signature: d6d163c2b5b0d362b397ec1451a85a67 ****/
		%feature("compactdefaultargs") AppDef_MyGradientOfCompute;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bezier curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 200

Returns
-------
None
") AppDef_MyGradientOfCompute;
		 AppDef_MyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

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
		/**** md5 signature: 6bd7ad47a144857ac891dd606d181fd3 ****/
		%feature("compactdefaultargs") AppDef_MyGradientbisOfBSplineCompute;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bezier curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 200

Returns
-------
None
") AppDef_MyGradientbisOfBSplineCompute;
		 AppDef_MyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

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
		/**** md5 signature: 12e4a67b8d371d9f1a978704077ccbc8 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 3d curvatures of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****************** Curvature ******************/
		/**** md5 signature: da227696a9b2e067a20d3b5467649970 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 2d curvatures of the multipoint <mpointindex> only when 2d points exist.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****************** Curvature ******************/
		/**** md5 signature: c8420054f061601ba7d5d683c11ca2e7 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the 3d and 2d curvatures of the multipoint <mpointindex>.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Curvature;
		static Standard_Boolean Curvature(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****************** FirstPoint ******************/
		/**** md5 signature: aa6413da896459eb8c56102a045df964 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first index of multipoints of the multiline.

Parameters
----------
ML: AppDef_MultiLine

Returns
-------
int
") FirstPoint;
		static Standard_Integer FirstPoint(const AppDef_MultiLine & ML);

		/****************** LastPoint ******************/
		/**** md5 signature: 9f5446370dab90e6dc755040302f27ba ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last index of multipoints of the multiline.

Parameters
----------
ML: AppDef_MultiLine

Returns
-------
int
") LastPoint;
		static Standard_Integer LastPoint(const AppDef_MultiLine & ML);

		/****************** MakeMLBetween ******************/
		/**** md5 signature: 45eb4314bc229297ec468e0e68adda67 ****/
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "Is never called in the algorithms. nothing is done.

Parameters
----------
ML: AppDef_MultiLine
I1: int
I2: int
NbPMin: int

Returns
-------
AppDef_MultiLine
") MakeMLBetween;
		static AppDef_MultiLine MakeMLBetween(const AppDef_MultiLine & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);

		/****************** MakeMLOneMorePoint ******************/
		/**** md5 signature: 63482999c5c43dccf4668a0ab37a5909 ****/
		%feature("compactdefaultargs") MakeMLOneMorePoint;
		%feature("autodoc", "Is never called in the algorithms. nothing is done.

Parameters
----------
ML: AppDef_MultiLine
I1: int
I2: int
indbad: int
OtherLine: AppDef_MultiLine

Returns
-------
bool
") MakeMLOneMorePoint;
		static Standard_Boolean MakeMLOneMorePoint(const AppDef_MultiLine & ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer indbad, AppDef_MultiLine & OtherLine);

		/****************** NbP2d ******************/
		/**** md5 signature: 7a37caf206ab568500c96708d4d9f281 ****/
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "Returns the number of 2d points of a multiline.

Parameters
----------
ML: AppDef_MultiLine

Returns
-------
int
") NbP2d;
		static Standard_Integer NbP2d(const AppDef_MultiLine & ML);

		/****************** NbP3d ******************/
		/**** md5 signature: b37e0daf764f3796dfd4e04f1004f411 ****/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "Returns the number of 3d points of a multiline.

Parameters
----------
ML: AppDef_MultiLine

Returns
-------
int
") NbP3d;
		static Standard_Integer NbP3d(const AppDef_MultiLine & ML);

		/****************** Tangency ******************/
		/**** md5 signature: 899765c31b68f9d5622bb4f335d17af9 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d points of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV);

		/****************** Tangency ******************/
		/**** md5 signature: 0b0abe2371afc94bdc402cd3a5e13ca6 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 2d tangency points of the multipoint <mpointindex> only when 2d points exist.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d);

		/****************** Tangency ******************/
		/**** md5 signature: 260996d76e35422100d12a8ced363571 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabV: TColgp_Array1OfVec
tabV2d: TColgp_Array1OfVec2d

Returns
-------
bool
") Tangency;
		static Standard_Boolean Tangency(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d);

		/****************** Value ******************/
		/**** md5 signature: 8dcbf0fabc7c1e1761c0065a48505664 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d points of the multipoint <mpointindex> when only 3d points exist.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabPt: TColgp_Array1OfPnt

Returns
-------
None
") Value;
		static void Value(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt);

		/****************** Value ******************/
		/**** md5 signature: 531d0eb0a3bfd42e8f41bd5400fec8b8 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 2d points of the multipoint <mpointindex> when only 2d points exist.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		static void Value(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** Value ******************/
		/**** md5 signature: 2b0210374c28698cdc099922d8d2b967 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d and 2d points of the multipoint <mpointindex>.

Parameters
----------
ML: AppDef_MultiLine
MPointIndex: int
tabPt: TColgp_Array1OfPnt
tabPt2d: TColgp_Array1OfPnt2d

Returns
-------
None
") Value;
		static void Value(const AppDef_MultiLine & ML, const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d);

		/****************** WhatStatus ******************/
		/**** md5 signature: a4e05eb1bdb8d525ab7cc67865409902 ****/
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "Returns nopointsadded.

Parameters
----------
ML: AppDef_MultiLine
I1: int
I2: int

Returns
-------
Approx_Status
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
		/****************** AppDef_ParFunctionOfMyGradientOfCompute ******************/
		/**** md5 signature: 5e82b667e483741251b19a4b42af6a1c ****/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientOfCompute;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") AppDef_ParFunctionOfMyGradientOfCompute;
		 AppDef_ParFunctionOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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
		/**** md5 signature: 71e0b753e00d6144bda7beaa41e6a211 ****/
		%feature("compactdefaultargs") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") AppDef_ParFunctionOfMyGradientbisOfBSplineCompute;
		 AppDef_ParFunctionOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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
		/**** md5 signature: 6ae58b53fc28bc68999c5284f8bd72a8 ****/
		%feature("compactdefaultargs") AppDef_ParFunctionOfTheGradient;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") AppDef_ParFunctionOfTheGradient;
		 AppDef_ParFunctionOfTheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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
		/**** md5 signature: 0f470f8d09760a577136f1515d1bfb47 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientOfCompute ******************/
		/**** md5 signature: 4c1463e27c262a50e76b8fe5dff270c0 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientOfCompute ******************/
		/**** md5 signature: 6150d26142d95dfba2fe070d4d272305 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientOfCompute ******************/
		/**** md5 signature: 1e1086e0e59f1c54539147a819762a29 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientOfCompute;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientOfCompute;
		 AppDef_ParLeastSquareOfMyGradientOfCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/**** md5 signature: 5c7d889ff7c3c53d9c2d304f6513a770 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******************/
		/**** md5 signature: d358e31489791262a5431ebacf9dc7b9 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******************/
		/**** md5 signature: b4722672fa82bbd3c01a14c4f1ea81fb ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute ******************/
		/**** md5 signature: 9ac1102ac0cd7f24c5edbabd8d6c6d2a ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute;
		 AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/**** md5 signature: f10deca5c5a2f219a4aac3b29290f883 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfTheGradient ******************/
		/**** md5 signature: ffaf2f04cbeda05157e4779b39436d87 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfTheGradient ******************/
		/**** md5 signature: 0a6fa28c9440f806dc69f10826983565 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_ParLeastSquareOfTheGradient ******************/
		/**** md5 signature: 41e374c7b096bebe266c47cde703aa75 ****/
		%feature("compactdefaultargs") AppDef_ParLeastSquareOfTheGradient;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") AppDef_ParLeastSquareOfTheGradient;
		 AppDef_ParLeastSquareOfTheGradient(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/**** md5 signature: 6cfad4139f20fc94b0b10535a1a2b060 ****/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientOfCompute;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: AppDef_MultiLine
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
") AppDef_ResConstraintOfMyGradientOfCompute;
		 AppDef_ResConstraintOfMyGradientOfCompute(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****************** AppDef_ResConstraintOfMyGradientbisOfBSplineCompute ******************/
		/**** md5 signature: 19f1d924fc5c45098e224f6711eb1fac ****/
		%feature("compactdefaultargs") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: AppDef_MultiLine
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
") AppDef_ResConstraintOfMyGradientbisOfBSplineCompute;
		 AppDef_ResConstraintOfMyGradientbisOfBSplineCompute(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****************** AppDef_ResConstraintOfTheGradient ******************/
		/**** md5 signature: 28edbef59ca63ee686fc7b7c358570b5 ****/
		%feature("compactdefaultargs") AppDef_ResConstraintOfTheGradient;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: AppDef_MultiLine
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
") AppDef_ResConstraintOfTheGradient;
		 AppDef_ResConstraintOfTheGradient(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****************** AssemblyTable ******************/
		/**** md5 signature: 4ea475cc7902240e9011827552f2aa0e ****/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<FEmTool_HAssemblyTable>
") AssemblyTable;
		virtual opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable();

		/****************** DependenceTable ******************/
		/**** md5 signature: c016d827aafaa774489e50229cf20da6 ****/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** ErrorValues ******************/
		/**** md5 signature: cfe3e0a15201f20a76cdffc4832deb32 ****/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
MaxError: float
QuadraticError: float
AverageError: float
") ErrorValues;
		virtual void ErrorValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EstLength ******************/
		/**** md5 signature: 0b189fee7c9f70cecec55bd68f2b8b7e ****/
		%feature("compactdefaultargs") EstLength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") EstLength;
		virtual Standard_Real & EstLength();

		/****************** GetCurve ******************/
		/**** md5 signature: 8fb90ce90606b6bcb1989378cd53a4f9 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: FEmTool_Curve

Returns
-------
None
") GetCurve;
		virtual void GetCurve(opencascade::handle<FEmTool_Curve> & C);

		/****************** GetEstimation ******************/
		/**** md5 signature: 8ba11ef014057784f34452683585efb6 ****/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
E1: float
E2: float
E3: float
") GetEstimation;
		virtual void GetEstimation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetWeight ******************/
		/**** md5 signature: af9c1e5043bd3ead9bfc060a4fb69ec7 ****/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
QuadraticWeight: float
QualityWeight: float
") GetWeight;
		virtual void GetWeight(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Gradient ******************/
		/**** md5 signature: e66cfcf660598f9d33bd6c51e71787ee ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
Element: int
Dimension: int
G: math_Vector

Returns
-------
None
") Gradient;
		virtual void Gradient(const Standard_Integer Element, const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		/**** md5 signature: ae17248c337e30b997401d5573140102 ****/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "No available documentation.

Parameters
----------
Element: int
Dimension1: int
Dimension2: int
H: math_Matrix

Returns
-------
None
") Hessian;
		virtual void Hessian(const Standard_Integer Element, const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** InputVector ******************/
		/**** md5 signature: d70c25b60b28c3838fab1614a13293f8 ****/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "Convert the assembly vector in an curve;.

Parameters
----------
X: math_Vector
AssTable: FEmTool_HAssemblyTable

Returns
-------
None
") InputVector;
		virtual void InputVector(const math_Vector & X, const opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****************** QualityValues ******************/
		/**** md5 signature: b244d6cd90390992902f1f73faa0efd3 ****/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
J1min: float
J2min: float
J3min: float

Returns
-------
J1: float
J2: float
J3: float
") QualityValues;
		virtual Standard_Integer QualityValues(const Standard_Real J1min, const Standard_Real J2min, const Standard_Real J3min, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetCurve ******************/
		/**** md5 signature: f9249c904dd8eed90d010d71e8bbeb67 ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: FEmTool_Curve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<FEmTool_Curve> & C);

		/****************** SetEstimation ******************/
		/**** md5 signature: 1eee8cba9d7425225339e7da8aafbe68 ****/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: float
E2: float
E3: float

Returns
-------
None
") SetEstimation;
		virtual void SetEstimation(const Standard_Real E1, const Standard_Real E2, const Standard_Real E3);

		/****************** SetParameters ******************/
		/**** md5 signature: 27aab9728b5d765091cba886e9f49273 ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Parameters: TColStd_HArray1OfReal

Returns
-------
None
") SetParameters;
		virtual void SetParameters(const opencascade::handle<TColStd_HArray1OfReal> & Parameters);

		/****************** SetWeight ******************/
		/**** md5 signature: dc802dcd07fa8159f377bdea35a73f35 ****/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
QuadraticWeight: float
QualityWeight: float
percentJ1: float
percentJ2: float
percentJ3: float

Returns
-------
None
") SetWeight;
		virtual void SetWeight(const Standard_Real QuadraticWeight, const Standard_Real QualityWeight, const Standard_Real percentJ1, const Standard_Real percentJ2, const Standard_Real percentJ3);

		/****************** SetWeight ******************/
		/**** md5 signature: 7071df0ad4a367ddf80150dd3c3f5302 ****/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
Weight: TColStd_Array1OfReal

Returns
-------
None
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
		/****************** AppDef_TheFunction ******************/
		/**** md5 signature: da57d66f050dd8770549a173c8a381bb ****/
		%feature("compactdefaultargs") AppDef_TheFunction;
		%feature("autodoc", "Initializes the fields of the function. the approximating curve has the desired degree deg.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
Parameters: math_Vector
Deg: int

Returns
-------
None
") AppDef_TheFunction;
		 AppDef_TheFunction(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const math_Vector & Parameters, const Standard_Integer Deg);

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
		/**** md5 signature: 85b9700dca31ee16f7fb2f871aed88ab ****/
		%feature("compactdefaultargs") AppDef_TheGradient;
		%feature("autodoc", "Tries to minimize the sum (square(||qui - bi*pi||)) where pui describe the approximating bezier curves'poles and qi the multiline points with a parameter ui. in this algorithm, the parameters ui are the unknowns. the tolerance required on this sum is given by tol. the desired degree of the resulting curve is deg.

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
NbIterations: int,optional
	default value is 200

Returns
-------
None
") AppDef_TheGradient;
		 AppDef_TheGradient(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations = 200);

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
		/**** md5 signature: f752b383abdb9dda4b6c44712dd024e1 ****/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. nbpol is the number of control points wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bernstein matrix computed with the parameters, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Parameters: math_Vector
NbPol: int

Returns
-------
None
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_TheLeastSquares ******************/
		/**** md5 signature: ef6a5ff8da68e59f81011325a75bf3c6 ****/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "Initializes the fields of the object.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
NbPol: int

Returns
-------
None
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

		/****************** AppDef_TheLeastSquares ******************/
		/**** md5 signature: 3a5f460d8866bf1aa381c89f9b8a5452 ****/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "Given a multiline, this algorithm computes the least square resolution using the householder-qr method. if the first and/or the last point is a constraint point, the value of the tangency or curvature is computed in the resolution. deg is the degree wanted for the approximating curves. the system to solve is the following: a x = b. where a is the bspline functions matrix computed with <parameters>, b the points coordinates and x the poles solutions. the matrix a is the same for each coordinate x, y and z and is also the same for each multiline point because they are approximated in parallel(so with the same parameter, only the vector b changes).

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

Returns
-------
None
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector & Parameters, const Standard_Integer NbPol);

		/****************** AppDef_TheLeastSquares ******************/
		/**** md5 signature: 5bbebc9514a1e40a98553eefac06902f ****/
		%feature("compactdefaultargs") AppDef_TheLeastSquares;
		%feature("autodoc", "Initializes the fields of the object.

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

Returns
-------
None
") AppDef_TheLeastSquares;
		 AppDef_TheLeastSquares(const AppDef_MultiLine & SSP, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);

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
		/**** md5 signature: 4b9b6ad5df71d40b30db8c43f2f8211e ****/
		%feature("compactdefaultargs") AppDef_TheResol;
		%feature("autodoc", "Given a multiline ssp with constraints points, this algorithm finds the best curve solution to approximate it. the poles from scurv issued for example from the least squares are used as a guess solution for the uzawa algorithm. the tolerance used in the uzawa algorithms is tolerance. a is the bernstein matrix associated to the multiline and da is the derivative bernstein matrix.(they can come from an approximation with parleastsquare.) the multicurve is modified. new multipoles are given.

Parameters
----------
SSP: AppDef_MultiLine
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
") AppDef_TheResol;
		 AppDef_TheResol(const AppDef_MultiLine & SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & Constraints, const math_Matrix & Bern, const math_Matrix & DerivativeBern, const Standard_Real Tolerance = 1.0e-10);

		/****************** ConstraintDerivative ******************/
		/**** md5 signature: 03ceb3c5a326d9e5b704d04ea0088376 ****/
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "Returns the derivative of the constraint matrix.

Parameters
----------
SSP: AppDef_MultiLine
Parameters: math_Vector
Deg: int
DA: math_Matrix

Returns
-------
math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative(const AppDef_MultiLine & SSP, const math_Vector & Parameters, const Standard_Integer Deg, const math_Matrix & DA);

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
		/****************** AppDef_Variational ******************/
		/**** md5 signature: f90b6cf052ecf51b369ee723a9ac7b8b ****/
		%feature("compactdefaultargs") AppDef_Variational;
		%feature("autodoc", "Constructor. initialization of the fields. warning : nc0 : number of passagepoint consraints nc2 : number of tangencypoint constraints nc3 : number of curvaturepoint constraints if ((maxdegree-continuity)*maxsegment -nc0 - 2*nc1 -3*nc2) is negative the problem is over-constrained. //! limitation : the multiline from appdef has to be composed by only one line ( dimension 2 or 3).

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int
TheConstraints: AppParCurves_HArray1OfConstraintCouple
MaxDegree: int,optional
	default value is 14
MaxSegment: int,optional
	default value is 100
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
WithMinMax: bool,optional
	default value is Standard_False
WithCutting: bool,optional
	default value is Standard_True
Tolerance: float,optional
	default value is 1.0
NbIterations: int,optional
	default value is 2

Returns
-------
None
") AppDef_Variational;
		 AppDef_Variational(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & TheConstraints, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 100, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Boolean WithMinMax = Standard_False, const Standard_Boolean WithCutting = Standard_True, const Standard_Real Tolerance = 1.0, const Standard_Integer NbIterations = 2);

		/****************** Approximate ******************/
		/**** md5 signature: c99f59de561bcc5fc0bce8bf73c657b1 ****/
		%feature("compactdefaultargs") Approximate;
		%feature("autodoc", "Makes the approximation with the current fields.

Returns
-------
None
") Approximate;
		void Approximate();

		/****************** AverageError ******************/
		/**** md5 signature: 420f3b7884af8c019ac24a5fe5ae6ff8 ****/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the multiline from appdef and the approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Continuity ******************/
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Criterium ******************/
		/**** md5 signature: edb6a5a9c11d025eaea36c85716d20aa ****/
		%feature("compactdefaultargs") Criterium;
		%feature("autodoc", "Returns the values of the quality criterium.

Parameters
----------

Returns
-------
VFirstOrder: float
VSecondOrder: float
VThirdOrder: float
") Criterium;
		void Criterium(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CriteriumWeight ******************/
		/**** md5 signature: d1e8815ca315e3e933ecc550d2c9ab9d ****/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "Returns the weights (as percent) associed to the criterium used in the optimization.

Parameters
----------

Returns
-------
Percent1: float
Percent2: float
Percent3: float
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Distance ******************/
		/**** md5 signature: fb873fdfe64ff9a1fb1949ce5ba730e9 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distances between the points of the multiline and the approximation curves.

Parameters
----------
mat: math_Matrix

Returns
-------
None
") Distance;
		void Distance(math_Matrix & mat);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsCreated ******************/
		/**** md5 signature: ee98cd23a823f97ff49721b779c9bc76 ****/
		%feature("compactdefaultargs") IsCreated;
		%feature("autodoc", "Returns true if the creation is done and correspond to the current fields.

Returns
-------
bool
") IsCreated;
		Standard_Boolean IsCreated();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the approximation is ok and correspond to the current fields.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsOverConstrained ******************/
		/**** md5 signature: b90429989d8f8debd1e02927f18e060e ****/
		%feature("compactdefaultargs") IsOverConstrained;
		%feature("autodoc", "Returns true if the problem is overconstrained in this case, approximation cannot be done.

Returns
-------
bool
") IsOverConstrained;
		Standard_Boolean IsOverConstrained();

		/****************** Knots ******************/
		/**** md5 signature: 6fb22c3eaf6dc04bd29ac3396a7169a9 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knots uses to the approximations.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Knots;
		const opencascade::handle<TColStd_HArray1OfReal> & Knots();

		/****************** MaxDegree ******************/
		/**** md5 signature: 2c79ca8c281a4e3978650b16dd11f77d ****/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the maximum degree used in the approximation.

Returns
-------
int
") MaxDegree;
		Standard_Integer MaxDegree();

		/****************** MaxError ******************/
		/**** md5 signature: 90f2419f0b1537a77da84305579339a2 ****/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the maximum of the distances between the points of the multiline and the approximation curves.

Returns
-------
float
") MaxError;
		Standard_Real MaxError();

		/****************** MaxErrorIndex ******************/
		/**** md5 signature: 971e966c0fe3112e06e17b68cf389166 ****/
		%feature("compactdefaultargs") MaxErrorIndex;
		%feature("autodoc", "Returns the index of the multipoint of errormax.

Returns
-------
int
") MaxErrorIndex;
		Standard_Integer MaxErrorIndex();

		/****************** MaxSegment ******************/
		/**** md5 signature: 1053b33469d38c347d8d0e695823bcf7 ****/
		%feature("compactdefaultargs") MaxSegment;
		%feature("autodoc", "Returns the maximum of segment used in the approximation.

Returns
-------
int
") MaxSegment;
		Standard_Integer MaxSegment();

		/****************** NbIterations ******************/
		/**** md5 signature: 05334f1e34f7c858ac022754e906f2bf ****/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations used in the approximation.

Returns
-------
int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Parameters ******************/
		/**** md5 signature: 7527b844d237672b1654e0e34e57815c ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters uses to the approximations.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Parameters;
		const opencascade::handle<TColStd_HArray1OfReal> & Parameters();

		/****************** QuadraticError ******************/
		/**** md5 signature: 4966a1d89bf85fe81f2bcefbdff19919 ****/
		%feature("compactdefaultargs") QuadraticError;
		%feature("autodoc", "Returns the quadratic average of the distances between the points of the multiline and the approximation curves.

Returns
-------
float
") QuadraticError;
		Standard_Real QuadraticError();

		/****************** SetConstraints ******************/
		/**** md5 signature: cc790287f6182849f720a3c5328f25b7 ****/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Define the constraints to approximate if this value is incompatible with the others fields this method modify nothing and returns false.

Parameters
----------
aConstrainst: AppParCurves_HArray1OfConstraintCouple

Returns
-------
bool
") SetConstraints;
		Standard_Boolean SetConstraints(const opencascade::handle<AppParCurves_HArray1OfConstraintCouple> & aConstrainst);

		/****************** SetContinuity ******************/
		/**** md5 signature: f974005f1ed42db31f2565c8a366cbbe ****/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Define the continuity used in the approximation if this value is incompatible with the others fields this method modify nothing and returns false.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
bool
") SetContinuity;
		Standard_Boolean SetContinuity(const GeomAbs_Shape C);

		/****************** SetCriteriumWeight ******************/
		/**** md5 signature: 168b9075f5e06eafee2d48483e8549b2 ****/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "Define the weights (as percent) associed to the criterium used in the optimization. //! if percent <= 0.

Parameters
----------
Percent1: float
Percent2: float
Percent3: float

Returns
-------
None
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real Percent1, const Standard_Real Percent2, const Standard_Real Percent3);

		/****************** SetCriteriumWeight ******************/
		/**** md5 signature: 953a9a555201757eb4d851ed7bafb979 ****/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "Define the weight (as percent) associed to the criterium order used in the optimization : others weights are updated. if percent < 0 if order < 1 or order > 3.

Parameters
----------
Order: int
Percent: float

Returns
-------
None
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Integer Order, const Standard_Real Percent);

		/****************** SetKnots ******************/
		/**** md5 signature: e8661b15a04d92d82b8a0d602a32994c ****/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "Defines the knots used by the approximations if this value is incompatible with the others fields this method modify nothing and returns false.

Parameters
----------
knots: TColStd_HArray1OfReal

Returns
-------
bool
") SetKnots;
		Standard_Boolean SetKnots(const opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****************** SetMaxDegree ******************/
		/**** md5 signature: fca035c6d3f4efa993181625249e062c ****/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "Define the maximum degree used in the approximation if this value is incompatible with the others fields this method modify nothing and returns false.

Parameters
----------
Degree: int

Returns
-------
bool
") SetMaxDegree;
		Standard_Boolean SetMaxDegree(const Standard_Integer Degree);

		/****************** SetMaxSegment ******************/
		/**** md5 signature: a24ae9d7cd32cbd6c0a12b78e2965cbf ****/
		%feature("compactdefaultargs") SetMaxSegment;
		%feature("autodoc", "Define the maximum number of segments used in the approximation if this value is incompatible with the others fields this method modify nothing and returns false.

Parameters
----------
NbSegment: int

Returns
-------
bool
") SetMaxSegment;
		Standard_Boolean SetMaxSegment(const Standard_Integer NbSegment);

		/****************** SetNbIterations ******************/
		/**** md5 signature: 3ae76dd00e47cee8353c15b0f4494e29 ****/
		%feature("compactdefaultargs") SetNbIterations;
		%feature("autodoc", "Define the number of iterations used in the approximation. if iter < 1.

Parameters
----------
Iter: int

Returns
-------
None
") SetNbIterations;
		void SetNbIterations(const Standard_Integer Iter);

		/****************** SetParameters ******************/
		/**** md5 signature: 98407971ef258f529d76e2dc1e8651b1 ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Defines the parameters used by the approximations.

Parameters
----------
param: TColStd_HArray1OfReal

Returns
-------
None
") SetParameters;
		void SetParameters(const opencascade::handle<TColStd_HArray1OfReal> & param);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Define the tolerance used in the approximation.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SetWithCutting ******************/
		/**** md5 signature: 02d0c9b4b956a64bc1920736b5081e0f ****/
		%feature("compactdefaultargs") SetWithCutting;
		%feature("autodoc", "Define if the approximation can insert new knots or not. if this value is incompatible with the others fields this method modify nothing and returns false.

Parameters
----------
Cutting: bool

Returns
-------
bool
") SetWithCutting;
		Standard_Boolean SetWithCutting(const Standard_Boolean Cutting);

		/****************** SetWithMinMax ******************/
		/**** md5 signature: 1b54e87ae81f0f7a5b31ba668276567f ****/
		%feature("compactdefaultargs") SetWithMinMax;
		%feature("autodoc", "Define if the approximation search to minimize the maximum error or not.

Parameters
----------
MinMax: bool

Returns
-------
None
") SetWithMinMax;
		void SetWithMinMax(const Standard_Boolean MinMax);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance used in the approximation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: 35d2ee100f1a9fc11f00b074d7d3553e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns all the bspline curves approximating the multiline from appdef ssp after minimization of the parameter.

Returns
-------
AppParCurves_MultiBSpCurve
") Value;
		AppParCurves_MultiBSpCurve Value();

		/****************** WithCutting ******************/
		/**** md5 signature: d1aad1460fd0343f58333133d5abda17 ****/
		%feature("compactdefaultargs") WithCutting;
		%feature("autodoc", "Returns if the approximation can insert new knots or not.

Returns
-------
bool
") WithCutting;
		Standard_Boolean WithCutting();

		/****************** WithMinMax ******************/
		/**** md5 signature: 4a834814fd8ebdf3109c458400dbeda7 ****/
		%feature("compactdefaultargs") WithMinMax;
		%feature("autodoc", "Returns if the approximation search to minimize the maximum error or not.

Returns
-------
bool
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
		/****************** AppDef_LinearCriteria ******************/
		/**** md5 signature: 7971c8c3b54afa7d1e4ec19e4b96b14a ****/
		%feature("compactdefaultargs") AppDef_LinearCriteria;
		%feature("autodoc", "No available documentation.

Parameters
----------
SSP: AppDef_MultiLine
FirstPoint: int
LastPoint: int

Returns
-------
None
") AppDef_LinearCriteria;
		 AppDef_LinearCriteria(const AppDef_MultiLine & SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint);

		/****************** AssemblyTable ******************/
		/**** md5 signature: bfa501d807c9eb758d31854422707098 ****/
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<FEmTool_HAssemblyTable>
") AssemblyTable;
		opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable();

		/****************** DependenceTable ******************/
		/**** md5 signature: 74ba8d8ba6ec3333e18c69c449d161a3 ****/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** ErrorValues ******************/
		/**** md5 signature: a777f9d4f93c8023ace5e9d0026ef74c ****/
		%feature("compactdefaultargs") ErrorValues;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
MaxError: float
QuadraticError: float
AverageError: float
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
		/****************** GetCurve ******************/
		/**** md5 signature: cd8e9b34a7462f6d0e280ba39eb7013b ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: FEmTool_Curve

Returns
-------
None
") GetCurve;
		void GetCurve(opencascade::handle<FEmTool_Curve> & C);

		/****************** GetEstimation ******************/
		/**** md5 signature: c203dc9f9f35d061778069cc5bca8cde ****/
		%feature("compactdefaultargs") GetEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
E1: float
E2: float
E3: float
") GetEstimation;
		void GetEstimation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetWeight ******************/
		/**** md5 signature: 20228a28f0bf77c9b8a22ba4a2c3775a ****/
		%feature("compactdefaultargs") GetWeight;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
QuadraticWeight: float
QualityWeight: float
") GetWeight;
		void GetWeight(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Gradient ******************/
		/**** md5 signature: 321bc1515ee5e590e26f19411e445e89 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
Element: int
Dimension: int
G: math_Vector

Returns
-------
None
") Gradient;
		void Gradient(const Standard_Integer Element, const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		/**** md5 signature: 8b40c8291caedf88a740760d60139e94 ****/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "No available documentation.

Parameters
----------
Element: int
Dimension1: int
Dimension2: int
H: math_Matrix

Returns
-------
None
") Hessian;
		void Hessian(const Standard_Integer Element, const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** InputVector ******************/
		/**** md5 signature: 9fc6c35d42441a4e3e3012543ade00f3 ****/
		%feature("compactdefaultargs") InputVector;
		%feature("autodoc", "Convert the assembly vector in an curve;.

Parameters
----------
X: math_Vector
AssTable: FEmTool_HAssemblyTable

Returns
-------
None
") InputVector;
		void InputVector(const math_Vector & X, const opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****************** QualityValues ******************/
		/**** md5 signature: 827da749488066754087e937754eac94 ****/
		%feature("compactdefaultargs") QualityValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
J1min: float
J2min: float
J3min: float

Returns
-------
J1: float
J2: float
J3: float
") QualityValues;
		Standard_Integer QualityValues(const Standard_Real J1min, const Standard_Real J2min, const Standard_Real J3min, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetCurve ******************/
		/**** md5 signature: 04239691cf498ce7af97807decd2562a ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: FEmTool_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<FEmTool_Curve> & C);

		/****************** SetEstimation ******************/
		/**** md5 signature: 7e003424ca19f8200aab6824d74b9d27 ****/
		%feature("compactdefaultargs") SetEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: float
E2: float
E3: float

Returns
-------
None
") SetEstimation;
		void SetEstimation(const Standard_Real E1, const Standard_Real E2, const Standard_Real E3);

		/****************** SetParameters ******************/
		/**** md5 signature: 5a4d4d2d682d53038fd9018938ef98a7 ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Parameters: TColStd_HArray1OfReal

Returns
-------
None
") SetParameters;
		void SetParameters(const opencascade::handle<TColStd_HArray1OfReal> & Parameters);

		/****************** SetWeight ******************/
		/**** md5 signature: 8783a77241be255334f6fe96a205454d ****/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
QuadraticWeight: float
QualityWeight: float
percentJ1: float
percentJ2: float
percentJ3: float

Returns
-------
None
") SetWeight;
		void SetWeight(const Standard_Real QuadraticWeight, const Standard_Real QualityWeight, const Standard_Real percentJ1, const Standard_Real percentJ2, const Standard_Real percentJ3);

		/****************** SetWeight ******************/
		/**** md5 signature: e02860ae1c35c7abb2994c7477ce803e ****/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
Weight: TColStd_Array1OfReal

Returns
-------
None
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
