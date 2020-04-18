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
		%feature("compactdefaultargs") BRepApprox_Approx;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepApprox_Approx;
		 BRepApprox_Approx();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** SetParameters ******************/
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

		/****************** Value ******************/
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
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** Point ******************/
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
Line: BRepApprox_TheMultiLineOfApprox

Returns
-------
None
") Perform;
		void Perform(const BRepApprox_TheMultiLineOfApprox & Line);

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
Line: BRepApprox_TheMultiLineOfApprox

Returns
-------
None
") Interpol;
		void Interpol(const BRepApprox_TheMultiLineOfApprox & Line);

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
Line: BRepApprox_TheMultiLineOfApprox

Returns
-------
None
") Perform;
		void Perform(const BRepApprox_TheMultiLineOfApprox & Line);

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
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepAdaptor_Surface
") AuxillarSurface1;
		const BRepAdaptor_Surface & AuxillarSurface1();

		/****************** AuxillarSurface2 ******************/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepAdaptor_Surface
") AuxillarSurface2;
		const BRepAdaptor_Surface & AuxillarSurface2();

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
BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox
") Function;
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox & Function();

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
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox();

		/****************** BRepApprox_TheMultiLineOfApprox ******************/
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
BRepApprox_TheMultiLineOfApprox
") MakeMLBetween;
		BRepApprox_TheMultiLineOfApprox MakeMLBetween(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer NbPointsToInsert);

		/****************** MakeMLOneMorePoint ******************/
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
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox();

		/****************** BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ******************/
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
BRepAdaptor_Surface
") PSurface;
		const BRepAdaptor_Surface & PSurface();

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
PS: BRepAdaptor_Surface

Returns
-------
None
") Set;
		void Set(const BRepAdaptor_Surface & PS);

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


%extend BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
