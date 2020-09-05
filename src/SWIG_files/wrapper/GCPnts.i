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
		/**** md5 signature: e9e9ed8389a2f8082b7f1c66900c4a47 ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint();

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: 13fa7fec22d8738eacffcc71a526050d ****/
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
		/**** md5 signature: 39fc08c89f4b15376ce9f8b70371c087 ****/
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
		/**** md5 signature: e7e8411a006f0f65fb4638306f22291e ****/
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
		/**** md5 signature: f663f2726ca2323b0a9fe699b88229e4 ****/
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
		/**** md5 signature: 02c0c16c94f3338047ec03f03649ea26 ****/
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
		/**** md5 signature: bb7188368d709950161699b43569abd9 ****/
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
		/**** md5 signature: c680835ef5a8e88805b58e15c8f414ed ****/
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
		/**** md5 signature: 71164c1b7987746efc1115470883c54e ****/
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
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the computation was successful, false otherwise. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Length ******************/
		/**** md5 signature: eba769e16675af7987425cafd53458ca ****/
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
		/**** md5 signature: 765cbebd0c62408a590e139d7941ff63 ****/
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
		/**** md5 signature: 0c294f64dbc0f6a4115eef7dd6094c0a ****/
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
		/**** md5 signature: 2369489a44197d1ca38f55d75b7ed4bb ****/
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
		/**** md5 signature: 0ff9ac31546f5bd02057bb36f563f5d4 ****/
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
		/**** md5 signature: 1e46daf657fccb259b7d9f58dc7e413b ****/
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
		/**** md5 signature: 2e36ed9a5703e01dfe14dffcfd406a78 ****/
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
		/**** md5 signature: 01305edaf2437396737fa3c58ad94127 ****/
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
		/**** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ****/
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
		/**** md5 signature: 0d9319bb50af83ef2abfff64957748fe ****/
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
		/**** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 22e87ab6030399152b72d08cc5e678ff ****/
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
		/**** md5 signature: efa8497fab01e3580f20a6c2f8d82b39 ****/
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
		/**** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 22e87ab6030399152b72d08cc5e678ff ****/
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
		/**** md5 signature: 61f40721b265b162b0de66806a8f9775 ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Constructs an empty algorithm. to define the problem to be solved, use the function initialize.

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa();

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		/**** md5 signature: 8fe67c8bf8bcaeb8dd81c44abc998e63 ****/
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
		/**** md5 signature: d6b8d649ee5bc9861491ee8690fc7ddd ****/
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
		/**** md5 signature: 91115d7f24542ea7b8be7fd060ecf888 ****/
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
		/**** md5 signature: 30dc0733afd16e4522e4245467edee5a ****/
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
		/**** md5 signature: 78e009081d465109cd710d1f4a75cd46 ****/
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
		/**** md5 signature: b376ca3f00cc8baa31efada6f557917b ****/
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
		/**** md5 signature: e198761a4b69ce7c00e5cf592491a6f7 ****/
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
		/**** md5 signature: dbb71176aee097012f26a1d2c4d8b47c ****/
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
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: e92014a2f157c195ed77b7745c7eae3f ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the distribution computed by this algorithm. this value is either: - the one imposed on the algorithm at the time of construction (or initialization), or - the one computed by the algorithm when the curvilinear distance between two consecutive points of the distribution is imposed on the algorithm at the time of construction (or initialization). exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		/**** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ****/
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
		/**** md5 signature: efa98a17078c26984adf714d01a559d0 ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Constructs an empty algorithm. to define the problem to be solved, use the function initialize.

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection();

		/****************** GCPnts_QuasiUniformDeflection ******************/
		/**** md5 signature: 21f3cdb414dfacc1adb769f5feeefaa5 ****/
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
		/**** md5 signature: 4406b6f8f6b53db0691121375ca5097b ****/
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
		/**** md5 signature: e5c32f3d7419a9ad1125046a26eedbb9 ****/
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
		/**** md5 signature: d88ae7d685789f15a2fd2e2380727de9 ****/
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
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. this is the value given to the algorithm at the time of construction (or initialization). exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Initialize ******************/
		/**** md5 signature: 8037dff755addb429b7afa155db10600 ****/
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
		/**** md5 signature: 3d070484282d8ce5900ff21b78680257 ****/
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
		/**** md5 signature: c07ec77c5c33688ac1ac7c53a0f3a6bf ****/
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
		/**** md5 signature: cbd8869806d86afcd8a644ce9d87c19a ****/
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
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: e92014a2f157c195ed77b7745c7eae3f ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the distribution computed by this algorithm. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		/**** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ****/
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
		/**** md5 signature: ae91500dcf1bb71f5f0b013f5ee88108 ****/
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
		/**** md5 signature: d6a43ebbe398bf311982f493adb5385b ****/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection();

		/****************** GCPnts_TangentialDeflection ******************/
		/**** md5 signature: c660a8d8e12a218029eb29218515686c ****/
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
		/**** md5 signature: f48b065a496b32f5dce300dd35e83635 ****/
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
		/**** md5 signature: 43c0c45cc41c56b61c30dfaf69e3bbbd ****/
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
		/**** md5 signature: f8aa47debd82b4b67a49483e1077bc14 ****/
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
		/**** md5 signature: f541c04e71bbea5ee903e5e80a7a0852 ****/
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
		/**** md5 signature: cc35f2d87b7b0047d50b6331b6dbffd0 ****/
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
		/**** md5 signature: 3f4810501754bd962ba0f8c60ff6c7c8 ****/
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
		/**** md5 signature: 7b53b2f250c25c5924285ae631b934ac ****/
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
		/**** md5 signature: c3a2bc0838a75a314ec8f5af318457e9 ****/
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
		/**** md5 signature: f9dcd1eb0295207081e937bfab5b9041 ****/
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
		/**** md5 signature: e92014a2f157c195ed77b7745c7eae3f ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		/**** md5 signature: ab2ee3538366e49e8a85b5df2a3326e9 ****/
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
		/**** md5 signature: 5103bc5ccd682fa2223d60324c3863c5 ****/
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
		/**** md5 signature: 62d00f7322d01bc2b00f3850f30fb1a6 ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Creation of a indefinite uniformabscissa.

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa();

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: 847d116290d70c3d449113ed2d5fa49b ****/
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
		/**** md5 signature: 6c78d0b33249d925e4a2f842e86b46a6 ****/
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
		/**** md5 signature: 8adeb75e606dbe750d9590e3fbce5517 ****/
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
		/**** md5 signature: 73c98ea46a55c86c72f4e645b09c4908 ****/
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
		/**** md5 signature: 203be95da802e634bc2e764ecf26cdfe ****/
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
		/**** md5 signature: fa4b7a0f35377ce7c9fd83832ce80d64 ****/
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
		/**** md5 signature: 21d9281621986ccbc891e403456bbbe4 ****/
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
		/**** md5 signature: 9aa42f43a3eb602b4e98329d33781bb3 ****/
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
		/**** md5 signature: c89bcc85ff4523eefe5f7f8d1fd84247 ****/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Returne the current abscissa ie the distance between two consecutive points.

Returns
-------
float
") Abscissa;
		Standard_Real Abscissa();

		/****************** Initialize ******************/
		/**** md5 signature: 16a94ad18b431351ca533d12e2177995 ****/
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
		/**** md5 signature: 5494ef79aef105455cbf21673f497861 ****/
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
		/**** md5 signature: a5eabf8785fe352212dc7ad8a71f52a1 ****/
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
		/**** md5 signature: b4462395334b1b9a81f5ac0f05f23836 ****/
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
		/**** md5 signature: 963294d56d8ae76f3793d0e73f52b583 ****/
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
		/**** md5 signature: 8c8c47722deff6df8f0e6682f7c04be1 ****/
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
		/**** md5 signature: 243da27f5629ddff823669ce2b5eb0f7 ****/
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
		/**** md5 signature: e9fe989c38c211b313367cb90e4316f7 ****/
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
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: e92014a2f157c195ed77b7745c7eae3f ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		/**** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ****/
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
		/**** md5 signature: 1f68370c23021d6b6fd020f9adad493e ****/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Constructs an empty algorithm. to define the problem to be solved, use the function initialize.

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection();

		/****************** GCPnts_UniformDeflection ******************/
		/**** md5 signature: 4a44af6e4fc70090fa58cc125f52be7e ****/
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
		/**** md5 signature: b818db46c02144d112c562e9d6b77dc3 ****/
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
		/**** md5 signature: 4ece604037704318e350a35d09a7b882 ****/
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
		/**** md5 signature: 6db7439f6d931d574c8c10ee5c57a3ce ****/
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
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. this value is the one given to the algorithm at the time of construction (or initialization). exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Initialize ******************/
		/**** md5 signature: 2cd00e7a4e0e75cc1e5a6fb0cc956826 ****/
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
		/**** md5 signature: ea7c6dd872adbb3c0e195071800fc25c ****/
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
		/**** md5 signature: 526e683ceeb24974117f9305515bb24e ****/
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
		/**** md5 signature: f4240e246b02ba5995cb4b23215d0dc4 ****/
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
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful. isdone is a protection against: - non-convergence of the algorithm - querying the results before computation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: e92014a2f157c195ed77b7745c7eae3f ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the distribution computed by this algorithm. exceptions stdfail_notdone if this algorithm has not been initialized, or if the computation was not successful.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		/**** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ****/
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
		/**** md5 signature: ae91500dcf1bb71f5f0b013f5ee88108 ****/
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
