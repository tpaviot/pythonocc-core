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
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Returns the multibspcurve approximating the set after computing the value f or grad(f).

Returns
-------
AppParCurves_MultiBSpCurve
") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the multiline.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the multiline.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** Gradient ******************/
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
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") Index;
		const math_IntegerVector & Index();

		/****************** LastConstraint ******************/
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
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum distance between the points and the multibspcurve.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum distance between the points and the multibspcurve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function. it corresponds to the number of multipoints.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Returns the new parameters of the multiline.

Returns
-------
math_Vector
") NewParameters;
		const math_Vector & NewParameters();

		/****************** SetFirstLambda ******************/
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
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the set.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distances between the points of the multiline and the approximation curves.

Returns
-------
math_Matrix
") Distance;
		const math_Matrix & Distance();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Returns the value (p2 - p1)/ v1 if the first point was a tangency point.

Returns
-------
float
") FirstLambda;
		Standard_Real FirstLambda();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the set.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Returns the value (pn - pn-1)/ vn if the last point was a tangency point.

Returns
-------
float
") LastLambda;
		Standard_Real LastLambda();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the matrix of points value.

Returns
-------
math_Matrix
") Points;
		const math_Matrix & Points();

		/****************** Poles ******************/
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
		%feature("compactdefaultargs") GeomInt_IntSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_IntSS;
		 GeomInt_IntSS();

		/****************** GeomInt_IntSS ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
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
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBoundaries;
		Standard_Integer NbBoundaries();

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolReached2d;
		Standard_Real TolReached2d();

		/****************** TolReached3d ******************/
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolReached3d;
		Standard_Real TolReached3d();

		/****************** TreatRLine ******************/
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
		%feature("compactdefaultargs") GeomInt_LineConstructor;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") GeomInt_LineConstructor;
		 GeomInt_LineConstructor();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if splitting was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "Returns number of splits.

Returns
-------
int
") NbParts;
		Standard_Integer NbParts();

		/****************** Part ******************/
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
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the old and the new approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the old and the new approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the old and the new approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d ******************/
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum difference between the old and the new approximation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Returns the multicurve approximating the set after computing the value f or grad(f).

Returns
-------
AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function. it corresponds to the number of multipoints.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Returns the new parameters of the multiline.

Returns
-------
math_Vector
") NewParameters;
		const math_Vector & NewParameters();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "Returns the multicurve approximating the set after computing the value f or grad(f).

Returns
-------
AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError2d;
		Standard_Real MaxError2d();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum distance between the points and the multicurve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function. it corresponds to the number of multipoints.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** NewParameters ******************/
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "Returns the new parameters of the multiline.

Returns
-------
math_Vector
") NewParameters;
		const math_Vector & NewParameters();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the set.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distances between the points of the multiline and the approximation curves.

Returns
-------
math_Matrix
") Distance;
		const math_Matrix & Distance();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Returns the value (p2 - p1)/ v1 if the first point was a tangency point.

Returns
-------
float
") FirstLambda;
		Standard_Real FirstLambda();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the set.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Returns the value (pn - pn-1)/ vn if the last point was a tangency point.

Returns
-------
float
") LastLambda;
		Standard_Real LastLambda();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the matrix of points value.

Returns
-------
math_Matrix
") Points;
		const math_Matrix & Points();

		/****************** Poles ******************/
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
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue();

		/****************** BezierValue ******************/
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "Returns the result of the approximation, i.e. all the curves. an exception is raised if notdone.

Returns
-------
AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue();

		/****************** DerivativeFunctionMatrix ******************/
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "Returns the derivative function matrix used to approximate the set.

Returns
-------
math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distances between the points of the multiline and the approximation curves.

Returns
-------
math_Matrix
") Distance;
		const math_Matrix & Distance();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "Returns the value (p2 - p1)/ v1 if the first point was a tangency point.

Returns
-------
float
") FirstLambda;
		Standard_Real FirstLambda();

		/****************** FunctionMatrix ******************/
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "Returns the function matrix used to approximate the set.

Returns
-------
math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** KIndex ******************/
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "Returns the indexes of the first non null values of a and da. the values are non null from index(ieme point) +1 to index(ieme point) + degree +1.

Returns
-------
math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex();

		/****************** LastLambda ******************/
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "Returns the value (pn - pn-1)/ vn if the last point was a tangency point.

Returns
-------
float
") LastLambda;
		Standard_Real LastLambda();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the matrix of points value.

Returns
-------
math_Matrix
") Points;
		const math_Matrix & Points();

		/****************** Poles ******************/
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
		%feature("compactdefaultargs") GeomInt_ParameterAndOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_ParameterAndOrientation;
		 GeomInt_ParameterAndOrientation();

		/****************** GeomInt_ParameterAndOrientation ******************/
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
		%feature("compactdefaultargs") Orientation1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation1;
		TopAbs_Orientation Orientation1();

		/****************** Orientation2 ******************/
		%feature("compactdefaultargs") Orientation2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation2;
		TopAbs_Orientation Orientation2();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetOrientation1 ******************/
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
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "No available documentation.

Returns
-------
math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****************** Duale ******************/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Returns the duale variables of the system.

Returns
-------
math_Vector
") Duale;
		const math_Vector & Duale();

		/****************** InverseMatrix ******************/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Returns the inverse of cont*transposed(cont), where cont is the constraint matrix for the algorithm.

Returns
-------
math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****************** IsDone ******************/
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
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "No available documentation.

Returns
-------
math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix();

		/****************** Duale ******************/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Returns the duale variables of the system.

Returns
-------
math_Vector
") Duale;
		const math_Vector & Duale();

		/****************** InverseMatrix ******************/
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "Returns the inverse of cont*transposed(cont), where cont is the constraint matrix for the algorithm.

Returns
-------
math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix();

		/****************** IsDone ******************/
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
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Returns the number of multicurve doing the approximation of the multiline.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** Parameters ******************/
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
		%feature("compactdefaultargs") Parametrization;
		%feature("autodoc", "Returns the type of parametrization.

Returns
-------
Approx_ParametrizationType
") Parametrization;
		Approx_ParametrizationType Parametrization();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") SplineValue;
		%feature("autodoc", "Returns the result of the approximation.

Returns
-------
AppParCurves_MultiBSpCurve
") SplineValue;
		const AppParCurves_MultiBSpCurve & SplineValue();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Returns the result of the approximation.

Returns
-------
AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue();

		/****************** Error ******************/
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
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the new parameters of the approximation corresponding to the points of the multibspcurve.

Returns
-------
TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface1();

		/****************** AuxillarSurface2 ******************/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface2();

		/****************** ComputeParameters ******************/
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
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		gp_Dir2d DirectionOnS2();

		/****************** IsTangent ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns somme des fi*fi.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return the intersection point which is enable for changing.

Returns
-------
IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the tangent at the intersection line.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the first surface.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the second surface.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d DirectionOnS2();

		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox
") Function;
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox & Function();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true when there is no solution to the problem.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the surfaces are tangent at the intersection point.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") GeomInt_TheMultiLineOfWLApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_TheMultiLineOfWLApprox;
		 GeomInt_TheMultiLineOfWLApprox();

		/****************** GeomInt_TheMultiLineOfWLApprox ******************/
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
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the current multi-line.

Returns
-------
None
") Dump;
		void Dump();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FirstPoint;
		Standard_Integer FirstPoint();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LastPoint;
		Standard_Integer LastPoint();

		/****************** MakeMLBetween ******************/
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
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "Returns the number of 2d points of a theline.

Returns
-------
int
") NbP2d;
		Standard_Integer NbP2d();

		/****************** NbP3d ******************/
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "Returns the number of 3d points of a theline.

Returns
-------
int
") NbP3d;
		Standard_Integer NbP3d();

		/****************** Tangency ******************/
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
		%feature("compactdefaultargs") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
		 GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox();

		/****************** GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox ******************/
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
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** ISurface ******************/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PSurface ******************/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the value tol so that if abs(func.root())<tol the function is considered null.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
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
