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
%define GCPNTSDOCSTRING
"GCPnts module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gcpnts.html"
%enddef
%module (package="OCC.Core", docstring=GCPNTSDOCSTRING) GCPnts


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
#include<GCPnts_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<math_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import Adaptor2d.i
%import math.i
%import GeomAbs.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum GCPnts_DeflectionType {
	GCPnts_Linear = 0,
	GCPnts_Circular = 1,
	GCPnts_Curved = 2,
	GCPnts_DefComposite = 3,
};

enum GCPnts_AbscissaType {
	GCPnts_LengthParametrized = 0,
	GCPnts_Parametrized = 1,
	GCPnts_AbsComposite = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class GCPnts_DeflectionType(IntEnum):
	GCPnts_Linear = 0
	GCPnts_Circular = 1
	GCPnts_Curved = 2
	GCPnts_DefComposite = 3
GCPnts_Linear = GCPnts_DeflectionType.GCPnts_Linear
GCPnts_Circular = GCPnts_DeflectionType.GCPnts_Circular
GCPnts_Curved = GCPnts_DeflectionType.GCPnts_Curved
GCPnts_DefComposite = GCPnts_DeflectionType.GCPnts_DefComposite

class GCPnts_AbscissaType(IntEnum):
	GCPnts_LengthParametrized = 0
	GCPnts_Parametrized = 1
	GCPnts_AbsComposite = 2
GCPnts_LengthParametrized = GCPnts_AbscissaType.GCPnts_LengthParametrized
GCPnts_Parametrized = GCPnts_AbscissaType.GCPnts_Parametrized
GCPnts_AbsComposite = GCPnts_AbscissaType.GCPnts_AbsComposite
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************************
* class GCPnts_AbscissaPoint *
*****************************/
class GCPnts_AbscissaPoint {
	public:
		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint();

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
U0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0);

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0> with the given tolerance.

Parameters
----------
Tol: float
C: Adaptor3d_Curve
Abscissa: float
U0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Standard_Real Tol, const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0);

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0> with the given tolerance.

Parameters
----------
Tol: float
C: Adaptor2d_Curve2d
Abscissa: float
U0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Standard_Real Tol, const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0);

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
U0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0);

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be close to the final solution.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
U0: float
Ui: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui);

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
U0: float
Ui: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui);

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be close to the final solution.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
U0: float
Ui: float
Tol: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Tol);

		/****************** GCPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be close to the final solution.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
U0: float
Ui: float
Tol: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Tol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the computation was successful, false otherwise. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance.

Parameters
----------
C: Adaptor3d_Curve
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance.

Parameters
----------
C: Adaptor2d_Curve2d
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

Parameters
----------
C: Adaptor2d_Curve2d
U1: float
U2: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance.

Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance. constructs an empty algorithm. this function is used only for initializing a framework to compute the length of a curve (or a series of curves). warning the function isdone will return the value false after the use of this function.

Parameters
----------
C: Adaptor2d_Curve2d
U1: float
U2: float
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve of the point solution of this algorithm. exceptions stdfail_notdone if the computation was not successful, or was not done.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

};


%extend GCPnts_AbscissaPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GCPnts_DistFunction *
****************************/
/******************************
* class GCPnts_DistFunction2d *
******************************/
/********************************
* class GCPnts_DistFunction2dMV *
********************************/
class GCPnts_DistFunction2dMV : public math_MultipleVarFunction {
	public:
		/****************** GCPnts_DistFunction2dMV ******************/
		%feature("compactdefaultargs") GCPnts_DistFunction2dMV;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCurvLinDist: GCPnts_DistFunction2d

Returns
-------
None
") GCPnts_DistFunction2dMV;
		 GCPnts_DistFunction2dMV(GCPnts_DistFunction2d & theCurvLinDist);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend GCPnts_DistFunction2dMV {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GCPnts_DistFunctionMV *
******************************/
class GCPnts_DistFunctionMV : public math_MultipleVarFunction {
	public:
		/****************** GCPnts_DistFunctionMV ******************/
		%feature("compactdefaultargs") GCPnts_DistFunctionMV;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCurvLinDist: GCPnts_DistFunction

Returns
-------
None
") GCPnts_DistFunctionMV;
		 GCPnts_DistFunctionMV(GCPnts_DistFunction & theCurvLinDist);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend GCPnts_DistFunctionMV {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GCPnts_QuasiUniformAbscissa *
************************************/
class GCPnts_QuasiUniformAbscissa {
	public:
		/****************** GCPnts_QuasiUniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Constructs an empty algorithm. to define the problem to be solved, use the function initialize.

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa();

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points - on the curve c where abscissa is the curvilinear distance between two consecutive points of the distribution.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & C, const Standard_Integer NbPoints);

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the part of curve c limited by the two parameter values u1 and u2, where abscissa is the curvilinear distance between two consecutive points of the distribution. the first point of the distribution is either the origin of curve c or the point of parameter u1. the following points are computed such that the curvilinear distance between two consecutive points is equal to abscissa. the last point of the distribution is either the end point of curve c or the point of parameter u2. however the curvilinear distance between this last point and the point just preceding it in the distribution is, of course, generally not equal to abscissa. use the function isdone to verify that the computation was successful, the function nbpoints to obtain the number of points of the computed distribution, and the function parameter to read the parameter of each point. warning the roles of u1 and u2 are inverted if u1 > u2 . warning c is an adapted curve, that is, an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), - and those required on the curve by the computation algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int
U1: float
U2: float

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2);

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the curve2d <c>. <nbpoints> defines the nomber of desired points.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints);

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the curve2d <c>.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int
U1: float
U2: float

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <nbpoints> and.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbPoints);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <u1>, <u2>.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int
U1: float
U2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <nbpoints> and.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <u1>, <u2>.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int
U1: float
U2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the distribution computed by this algorithm. this value is either: - the one imposed on the algorithm at the time of construction (or initialization), or - the one computed by the algorithm when the curvilinear distance between two consecutive points of the distribution is imposed on the algorithm at the time of construction (or initialization). exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the point of index index in the distribution computed by this algorithm. warning index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. however, pay particular attention as this condition is not checked by this function. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Parameters
----------
Index: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

};


%extend GCPnts_QuasiUniformAbscissa {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GCPnts_QuasiUniformDeflection *
**************************************/
class GCPnts_QuasiUniformDeflection {
	public:
		/****************** GCPnts_QuasiUniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Constructs an empty algorithm. to define the problem to be solved, use the function initialize.

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection();

		/****************** GCPnts_QuasiUniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on the curve <c>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** GCPnts_QuasiUniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on the curve <c>.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** GCPnts_QuasiUniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on a part of the curve <c>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
U1: float
U2: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** GCPnts_QuasiUniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on a part of the curve <c>. this and the above algorithms compute a distribution of points: - on the curve c, or - on the part of curve c limited by the two parameter values u1 and u2, where the deflection resulting from the distributed points is not greater than deflection. the first point of the distribution is either the origin of curve c or the point of parameter u1. the last point of the distribution is either the end point of curve c or the point of parameter u2. intermediate points of the distribution are built such that the deflection is not greater than deflection. using the following evaluation of the deflection: if pi and pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of pi and pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2 ] on curve c). continuity, defaulted to geomabs_c1, gives the degree of continuity of the curve c. (note that c is an adaptor3d_curve or an adaptor2d_curve2d object, and does not know the degree of continuity of the underlying curve). use the function isdone to verify that the computation was successful, the function nbpoints to obtain the number of points of the computed distribution, and the function parameter to read the parameter of each point. warning - the roles of u1 and u2 are inverted if u1 > u2. - derivative functions on the curve are called according to continuity. an error may occur if continuity is greater than the real degree of continuity of the curve. warning c is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), - and those required on the curve by the computation algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
U1: float
U2: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. this is the value given to the algorithm at the time of construction (or initialization). exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <u1>,<u2>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
U1: float
U2: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, -- <u1>,<u2> this and the above algorithms initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve c, or - on the part of curve c limited by the two parameter values u1 and u2, where the deflection resulting from the distributed points is not greater than deflection. the first point of the distribution is either the origin of curve c or the point of parameter u1. the last point of the distribution is either the end point of curve c or the point of parameter u2. intermediate points of the distribution are built in such a way that the deflection is not greater than deflection. using the following evaluation of the deflection: if pi and pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of pi and pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2 ] on curve c). continuity, defaulted to geomabs_c1, gives the degree of continuity of the curve c. (note that c is an adaptor3d_curve or an adaptor2d_curve2d object, and does not know the degree of continuity of the underlying curve). use the function isdone to verify that the computation was successful, the function nbpoints to obtain the number of points of the computed distribution, and the function parameter to read the parameter of each point. warning - the roles of u1 and u2 are inverted if u1 > u2. - derivative functions on the curve are called according to continuity. an error may occur if continuity is greater than the real degree of continuity of the curve. warning c is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), and those required on the curve by the computation algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
U1: float
U2: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const GeomAbs_Shape Continuity = GeomAbs_C1);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the distribution computed by this algorithm. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the point of index index in the distribution computed by this algorithm. warning index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. however, pay particular attention as this condition is not checked by this function. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Parameters
----------
Index: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of index index in the distribution computed by this algorithm. warning index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. however, pay particular attention as this condition is not checked by this function. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Integer Index);

};


%extend GCPnts_QuasiUniformDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GCPnts_TangentialDeflection *
************************************/
class GCPnts_TangentialDeflection {
	public:
		/****************** GCPnts_TangentialDeflection ******************/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection();

		/****************** GCPnts_TangentialDeflection ******************/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & C, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** GCPnts_TangentialDeflection ******************/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
FirstParameter: float
LastParameter: float
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & C, const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** GCPnts_TangentialDeflection ******************/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & C, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** GCPnts_TangentialDeflection ******************/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
FirstParameter: float
LastParameter: float
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & C, const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Add point to already calculated points (or replace existing) returns index of new added point or founded with parametric tolerance (replaced if theisreplace is true).

Parameters
----------
thePnt: gp_Pnt
theParam: float
theIsReplace: bool,optional
	default value is Standard_True

Returns
-------
int
") AddPoint;
		Standard_Integer AddPoint(const gp_Pnt & thePnt, const Standard_Real theParam, const Standard_Boolean theIsReplace = Standard_True);

		/****************** ArcAngularStep ******************/
		%feature("compactdefaultargs") ArcAngularStep;
		%feature("autodoc", "Computes angular step for the arc using the given parameters.

Parameters
----------
theRadius: float
theLinearDeflection: float
theAngularDeflection: float
theMinLength: float

Returns
-------
float
") ArcAngularStep;
		static Standard_Real ArcAngularStep(const Standard_Real theRadius, const Standard_Real theLinearDeflection, const Standard_Real theAngularDeflection, const Standard_Real theMinLength);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
FirstParameter: float
LastParameter: float
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
FirstParameter: float
LastParameter: float
AngularDeflection: float
CurvatureDeflection: float
MinimumOfPoints: int,optional
	default value is 2
UTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Real AngularDeflection, const Standard_Real CurvatureDeflection, const Standard_Integer MinimumOfPoints = 2, const Standard_Real UTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer I);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Integer I);

};


%extend GCPnts_TangentialDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GCPnts_UniformAbscissa *
*******************************/
class GCPnts_UniformAbscissa {
	public:
		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Creation of a indefinite uniformabscissa.

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa();

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the curve <c>. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real Toler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the curve <c>. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the curve <c>. <nbpoints> defines the nomber of desired points. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & C, const Standard_Integer NbPoints, const Standard_Real Toler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the curve <c>. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the curve2d <c>. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real Toler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the curve2d <c>. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the curve2d <c>. <nbpoints> defines the nomber of desired points. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints, const Standard_Real Toler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the curve2d <c>. parameter toler is equal precision::confusion by default. it is used for more precise calculation of curve length.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Returne the current abscissa ie the distance between two consecutive points.

Returns
-------
float
") Abscissa;
		Standard_Real Abscissa();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <toler>.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real Toler = -1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <u1>, <u2>, <toler>.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <nbpoints>, <toler> and.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbPoints, const Standard_Real Toler = -1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <u1>, <u2>, <toler>.

Parameters
----------
C: Adaptor3d_Curve
NbPoints: int
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <toler>.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real Toler = -1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <u1>, <u2>, <toler>.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <nbpoints>, <toler> and.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints, const Standard_Real Toler = -1);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <abscissa>, <u1>, <u2>, <toler>.

Parameters
----------
C: Adaptor2d_Curve2d
NbPoints: int
U1: float
U2: float
Toler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbPoints, const Standard_Real U1, const Standard_Real U2, const Standard_Real Toler = -1);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the computed parameter of index <index>.

Parameters
----------
Index: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

};


%extend GCPnts_UniformAbscissa {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GCPnts_UniformDeflection *
*********************************/
class GCPnts_UniformDeflection {
	public:
		/****************** GCPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Constructs an empty algorithm. to define the problem to be solved, use the function initialize.

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection();

		/****************** GCPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on the curve <c>. if <withcontrol> is true,the algorithm controls the estimate deflection.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Boolean WithControl = Standard_True);

		/****************** GCPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on the curve <c>. if <withcontrol> is true,the algorithm controls the estimate deflection.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Boolean WithControl = Standard_True);

		/****************** GCPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on a part of the curve <c>. if <withcontrol> is true,the algorithm controls the estimate deflection.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
U1: float
U2: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean WithControl = Standard_True);

		/****************** GCPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on a part of the curve <c>. if <withcontrol> is true,the algorithm controls the estimate deflection.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
U1: float
U2: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean WithControl = Standard_True);

		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. this value is the one given to the algorithm at the time of construction (or initialization). exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Boolean WithControl = Standard_True);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Boolean WithControl = Standard_True);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <u1>,<u2>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
U1: float
U2: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean WithControl = Standard_True);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <u1>,<u2> this and the above methods initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve c, or - on the part of curve c limited by the two parameter values u1 and u2, where the maximum distance between c and the polygon that results from the points of the distribution is not greater than deflection. the first point of the distribution is either the origin of curve c or the point of parameter u1. the last point of the distribution is either the end point of curve c or the point of parameter u2. intermediate points of the distribution are built using interpolations of segments of the curve limited at the 2nd degree. the construction ensures, in a first step, that the chordal deviation for this interpolation of the curve is less than or equal to deflection. however, it does not ensure that the chordal deviation for the curve itself is less than or equal to deflection. to do this a check is necessary, which may generate (second step) additional intermediate points. this check is time consuming, and can be avoided by setting withcontrol to false. note that by default withcontrol is true and check is performed. use the function isdone to verify that the computation was successful, the function nbpoints to obtain the number of points of the computed distribution, and the function parameter to read the parameter of each point. warning - c is necessary, 'c2' continuous. this property is not checked at construction time. - the roles of u1 and u2 are inverted if u1 > u2. warning c is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), - and those required on the curve by the computation algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
U1: float
U2: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean WithControl = Standard_True);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the distribution computed by this algorithm. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the point of index index in the distribution computed by this algorithm. warning index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. however, pay particular attention as this condition is not checked by this function. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Parameters
----------
Index: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of index index in the distribution computed by this algorithm. warning index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. however, pay particular attention as this condition is not checked by this function. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Integer Index);

};


%extend GCPnts_UniformDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class GCPnts_DistFunction:
	pass

@classnotwrapped
class GCPnts_DistFunction2d:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
