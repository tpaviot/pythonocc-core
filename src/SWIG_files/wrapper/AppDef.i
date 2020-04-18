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
Line: AppDef_MultiLine

Returns
-------
None
") Interpol;
		void Interpol(const AppDef_MultiLine & Line);

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
Line: AppDef_MultiLine

Returns
-------
None
") Perform;
		void Perform(const AppDef_MultiLine & Line);

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
Line: AppDef_MultiLine

Returns
-------
None
") Perform;
		void Perform(const AppDef_MultiLine & Line);

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
		%feature("compactdefaultargs") AppDef_MultiLine;
		%feature("autodoc", "Creates an undefined multiline.

Returns
-------
None
") AppDef_MultiLine;
		 AppDef_MultiLine();

		/****************** AppDef_MultiLine ******************/
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
		%feature("compactdefaultargs") NbMultiPoints;
		%feature("autodoc", "Returns the number of multipointconstraints of the multiline.

Returns
-------
int
") NbMultiPoints;
		Standard_Integer NbMultiPoints();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points from multipoints composing the multiline.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** SetValue ******************/
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
		%feature("compactdefaultargs") AppDef_MultiPointConstraint;
		%feature("autodoc", "Creates an undefined multipointconstraint.

Returns
-------
None
") AppDef_MultiPointConstraint;
		 AppDef_MultiPointConstraint();

		/****************** AppDef_MultiPointConstraint ******************/
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
		%feature("compactdefaultargs") IsCurvaturePoint;
		%feature("autodoc", "Returns true if the multipoint has a curvature value.

Returns
-------
bool
") IsCurvaturePoint;
		Standard_Boolean IsCurvaturePoint();

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true if the multipoint has a tangency value.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** SetCurv ******************/
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
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<FEmTool_HAssemblyTable>
") AssemblyTable;
		virtual opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable();

		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** ErrorValues ******************/
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
		%feature("compactdefaultargs") EstLength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") EstLength;
		virtual Standard_Real & EstLength();

		/****************** GetCurve ******************/
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
		%feature("compactdefaultargs") Approximate;
		%feature("autodoc", "Makes the approximation with the current fields.

Returns
-------
None
") Approximate;
		void Approximate();

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error between the multiline from appdef and the approximation.

Returns
-------
float
") AverageError;
		Standard_Real AverageError();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Criterium ******************/
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
		%feature("compactdefaultargs") IsCreated;
		%feature("autodoc", "Returns true if the creation is done and correspond to the current fields.

Returns
-------
bool
") IsCreated;
		Standard_Boolean IsCreated();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the approximation is ok and correspond to the current fields.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsOverConstrained ******************/
		%feature("compactdefaultargs") IsOverConstrained;
		%feature("autodoc", "Returns true if the problem is overconstrained in this case, approximation cannot be done.

Returns
-------
bool
") IsOverConstrained;
		Standard_Boolean IsOverConstrained();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knots uses to the approximations.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Knots;
		const opencascade::handle<TColStd_HArray1OfReal> & Knots();

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the maximum degree used in the approximation.

Returns
-------
int
") MaxDegree;
		Standard_Integer MaxDegree();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the maximum of the distances between the points of the multiline and the approximation curves.

Returns
-------
float
") MaxError;
		Standard_Real MaxError();

		/****************** MaxErrorIndex ******************/
		%feature("compactdefaultargs") MaxErrorIndex;
		%feature("autodoc", "Returns the index of the multipoint of errormax.

Returns
-------
int
") MaxErrorIndex;
		Standard_Integer MaxErrorIndex();

		/****************** MaxSegment ******************/
		%feature("compactdefaultargs") MaxSegment;
		%feature("autodoc", "Returns the maximum of segment used in the approximation.

Returns
-------
int
") MaxSegment;
		Standard_Integer MaxSegment();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations used in the approximation.

Returns
-------
int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters uses to the approximations.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Parameters;
		const opencascade::handle<TColStd_HArray1OfReal> & Parameters();

		/****************** QuadraticError ******************/
		%feature("compactdefaultargs") QuadraticError;
		%feature("autodoc", "Returns the quadratic average of the distances between the points of the multiline and the approximation curves.

Returns
-------
float
") QuadraticError;
		Standard_Real QuadraticError();

		/****************** SetConstraints ******************/
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
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance used in the approximation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns all the bspline curves approximating the multiline from appdef ssp after minimization of the parameter.

Returns
-------
AppParCurves_MultiBSpCurve
") Value;
		AppParCurves_MultiBSpCurve Value();

		/****************** WithCutting ******************/
		%feature("compactdefaultargs") WithCutting;
		%feature("autodoc", "Returns if the approximation can insert new knots or not.

Returns
-------
bool
") WithCutting;
		Standard_Boolean WithCutting();

		/****************** WithMinMax ******************/
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
		%feature("compactdefaultargs") AssemblyTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<FEmTool_HAssemblyTable>
") AssemblyTable;
		opencascade::handle<FEmTool_HAssemblyTable> AssemblyTable();

		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** ErrorValues ******************/
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
