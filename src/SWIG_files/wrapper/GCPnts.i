/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_gcpnts.html"
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
%include ../common/EnumTemplates.i
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

/* python proxy classes for enums */
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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint();

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: 994f7fd46e144d693934367c87eff7d8 ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0.

Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: e899defbc3b18b307a0f709838f26d36 ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0 with the given tolerance.

Parameters
----------
theTol: float
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Standard_Real theTol, const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: bf74800bc5e96e7e6bece681096cc227 ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0 with the given tolerance.

Parameters
----------
theTol: float
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Standard_Real theTol, const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: 149827954cacc4a64054884618228ebc ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0.

Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: f0d4479d46145782f8e11143c82b6809 ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0. theui is the starting value used in the iterative process which find the solution, it must be close to the final solution.

Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float
theUi: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi);

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: e276268e7f3319a5141ea9d9269d427e ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0. theui is the starting value used in the iterative process which find the solution, it must be closed to the final solution.

Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float
theUi: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi);

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: edb80e41eebb154b56723e549d17cd66 ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0. theui is the starting value used in the iterative process which find the solution, it must be close to the final solution.

Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float
theUi: float
theTol: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi, const Standard_Real theTol);

		/****************** GCPnts_AbscissaPoint ******************/
		/**** md5 signature: e2821bf35681332a03f6bfe49874a10b ****/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve at the distance theabscissa from the point of parameter theu0. theui is the starting value used in the iterative process which find the solution, it must be close to the final solution.

Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float
theUi: float
theTol: float

Returns
-------
None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi, const Standard_Real theTol);

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
		/**** md5 signature: 042f9221edd3ab5e957807852ec69e0f ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the 3d curve.

Parameters
----------
theC: Adaptor3d_Curve

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC);

		/****************** Length ******************/
		/**** md5 signature: 2ab2e1b92a4eeed3a8a63ee4e4e8d78d ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the 2d curve.

Parameters
----------
theC: Adaptor2d_Curve2d

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC);

		/****************** Length ******************/
		/**** md5 signature: 9a1db470fe18f3a43cf1c177415bed7c ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the 3d curve with the given tolerance.

Parameters
----------
theC: Adaptor3d_Curve
theTol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC, const Standard_Real theTol);

		/****************** Length ******************/
		/**** md5 signature: 4782e2d3c54640d45f3910856a523a0d ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the 2d curve with the given tolerance.

Parameters
----------
theC: Adaptor2d_Curve2d
theTol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC, const Standard_Real theTol);

		/****************** Length ******************/
		/**** md5 signature: 92a3bd66d06c2f69fd7d3efcc4a1a170 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the 3d curve.

Parameters
----------
theC: Adaptor3d_Curve
theU1: float
theU2: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC, const Standard_Real theU1, const Standard_Real theU2);

		/****************** Length ******************/
		/**** md5 signature: 2b066742b0469dfd4834243e7a135d11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the 2d curve.

Parameters
----------
theC: Adaptor2d_Curve2d
theU1: float
theU2: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC, const Standard_Real theU1, const Standard_Real theU2);

		/****************** Length ******************/
		/**** md5 signature: bb6b4be428e60ce7959343316ec50d58 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the 3d curve with the given tolerance.

Parameters
----------
theC: Adaptor3d_Curve
theU1: float
theU2: float
theTol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theTol);

		/****************** Length ******************/
		/**** md5 signature: 57f71acf7ac66837fcd814ff6da0c063 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve with the given tolerance.

Parameters
----------
theC: Adaptor2d_Curve2d
theU1: float
theU2: float
theTol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theTol);

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
		/**** md5 signature: dd562f7cb1072dc4828085b7acd50b2f ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points - on the curve where abscissa is the curvilinear distance between two consecutive points of the distribution.

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints);

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		/**** md5 signature: 208585ff814fd87a45d0395b14d6927b ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the part of curve limited by the two parameter values theu1 and theu2, where abscissa is the curvilinear distance between two consecutive points of the distribution. the first point of the distribution is either the origin of curve or the point of parameter theu1. the following points are computed such that the curvilinear distance between two consecutive points is equal to abscissa. the last point of the distribution is either the end point of curve or the point of parameter theu2. however the curvilinear distance between this last point and the point just preceding it in the distribution is, of course, generally not equal to abscissa. use the function isdone() to verify that the computation was successful, the function nbpoints() to obtain the number of points of the computed distribution, and the function parameter() to read the parameter of each point. //! warning the roles of theu1 and theu2 are inverted if theu1 > theu2. warning thec is an adapted curve, that is, an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), - and those required on the curve by the computation algorithm. @param thec [in] input 3d curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve.

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		/**** md5 signature: 5b685a23d5e0c95b72641488537f0bb4 ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the 2d curve. @param thec [in] input 2d curve @param thenbpoints [in] defines the number of desired points.

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints);

		/****************** GCPnts_QuasiUniformAbscissa ******************/
		/**** md5 signature: 68eba7225e3210dd556f8f7c730aed8f ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the 2d curve. @param thec [in] input 2d curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve.

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float

Returns
-------
None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

		/****************** Initialize ******************/
		/**** md5 signature: b84c4aadf7906dd0835d7108bad17a6f ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve and target number of points. @param thec [in] input 3d curve @param thenbpoints [in] defines the number of desired points.

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints);

		/****************** Initialize ******************/
		/**** md5 signature: 53ce7362fdacfdc7fff6d7912f75ef9f ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve, target number of points and curve parameter range. @param thec [in] input 3d curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve.

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

		/****************** Initialize ******************/
		/**** md5 signature: c0645af498cba44e7fdc2497f9e35b9d ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve and target number of points. @param thec [in] input 2d curve @param thenbpoints [in] defines the number of desired points.

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints);

		/****************** Initialize ******************/
		/**** md5 signature: ed4a2afda240c0f04b820d3a8e6dfb1a ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve, target number of points and curve parameter range. @param thec [in] input 2d curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve.

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

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
		%feature("autodoc", "Constructs an empty algorithm. to define the problem to be solved, use the function initialize().

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection();

		/****************** GCPnts_QuasiUniformDeflection ******************/
		/**** md5 signature: 9f427f22da8d1765aa59c8978c365230 ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on the curve.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****************** GCPnts_QuasiUniformDeflection ******************/
		/**** md5 signature: 47da4f025691c83a80f04c6175d1185d ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on the curve.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****************** GCPnts_QuasiUniformDeflection ******************/
		/**** md5 signature: 70a0f4989745d4e7d0413f64ba479aa8 ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on a part of the curve.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****************** GCPnts_QuasiUniformDeflection ******************/
		/**** md5 signature: dbd5412a35e8329eb249a545ab74b89d ****/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Computes a quasiuniform deflection distribution of points on a part of the curve. this and the above algorithms compute a distribution of points: - on the curve thec, or - on the part of curve thec limited by the two parameter values theu1 and theu2, where the deflection resulting from the distributed points is not greater than thedeflection. //! the first point of the distribution is either the origin of curve thec or the point of parameter theu1. the last point of the distribution is either the end point of curve thec or the point of parameter theu2. //! intermediate points of the distribution are built such that the deflection is not greater than thedeflection. using the following evaluation of the deflection: if pi and pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of pi and pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2] on curve thec). thecontinuity, defaulted to geomabs_c1, gives the degree of continuity of the curve thec. (note that c is an adaptor3d_curve or an adaptor2d_curve2d object, and does not know the degree of continuity of the underlying curve). use the function isdone() to verify that the computation was successful, the function nbpoints() to obtain the number of points of the computed distribution, and the function parameter() to read the parameter of each point. //! warning - the roles of theu1 and theu2 are inverted if theu1 > theu2. - derivative functions on the curve are called according to thecontinuity. an error may occur if thecontinuity is greater than the real degree of continuity of the curve. //! warning thec is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), - and those required on the curve by the computation algorithm.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

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
		/**** md5 signature: 82b0287725f04e0899a9450752ed5d64 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve and deflection.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****************** Initialize ******************/
		/**** md5 signature: 04b5bf695538016e85b1a76c8d15238f ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve and deflection.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****************** Initialize ******************/
		/**** md5 signature: 8d2138e60f7bf0b16e0be1feef9962ca ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve, deflection and parameter range.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****************** Initialize ******************/
		/**** md5 signature: 367f2a9f47dcc2fe28b985d61eeb7da5 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with thec, thedeflection, theu1, theu2. this and the above algorithms initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve thec, or - on the part of curve thec limited by the two parameter values theu1 and theu2, where the deflection resulting from the distributed points is not greater than thedeflection. //! the first point of the distribution is either the origin of curve thec or the point of parameter theu1. the last point of the distribution is either the end point of curve thec or the point of parameter theu2. //! intermediate points of the distribution are built in such a way that the deflection is not greater than thedeflection. using the following evaluation of the deflection: if pi and pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of pi and pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2] on curve thec). thecontinuity, defaulted to geomabs_c1, gives the degree of continuity of the curve thec. (note that c is an adaptor3d_curve or an adaptor2d_curve2d object, and does not know the degree of continuity of the underlying curve). use the function isdone to verify that the computation was successful, the function nbpoints() to obtain the number of points of the computed distribution, and the function parameter() to read the parameter of each point. //! warning - the roles of theu1 and theu2 are inverted if theu1 > theu2. - derivative functions on the curve are called according to thecontinuity. an error may occur if thecontinuity is greater than the real degree of continuity of the curve. //! warning thec is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), and those required on the curve by the computation algorithm.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

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

/***************************
* class GCPnts_TCurveTypes *
***************************/
/**********************************************
* class GCPnts_TCurveTypes<Adaptor2d_Curve2d> *
**********************************************/
class GCPnts_TCurveTypes<Adaptor2d_Curve2d> {
	public:
typedef gp_Pnt2d Point;
typedef Geom2d_BezierCurve BezierCurve;
typedef Geom2d_BSplineCurve BSplineCurve;
typedef GCPnts_DistFunction2d DistFunction;
typedef GCPnts_DistFunction2dMV DistFunctionMV;
};


%extend GCPnts_TCurveTypes<Adaptor2d_Curve2d> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class GCPnts_TCurveTypes<Adaptor3d_Curve> *
********************************************/
class GCPnts_TCurveTypes<Adaptor3d_Curve> {
	public:
typedef gp_Pnt Point;
typedef Geom_BezierCurve BezierCurve;
typedef Geom_BSplineCurve BSplineCurve;
typedef GCPnts_DistFunction DistFunction;
typedef GCPnts_DistFunctionMV DistFunctionMV;
};


%extend GCPnts_TCurveTypes<Adaptor3d_Curve> {
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
		%feature("autodoc", "Empty constructor. @sa initialize().

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection();

		/****************** GCPnts_TangentialDeflection ******************/
		/**** md5 signature: e2876f14004b1580160f394dc792d41c ****/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "Constructor for 3d curve. @param thec [in] 3d curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theutol [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor3d_Curve
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** GCPnts_TangentialDeflection ******************/
		/**** md5 signature: e7a79d9031269c6fe80fc514568ab577 ****/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "Constructor for 3d curve with restricted range. @param thec [in] 3d curve @param thefirstparameter [in] first parameter on curve @param thelastparameter [in] last parameter on curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theuto l [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor3d_Curve
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** GCPnts_TangentialDeflection ******************/
		/**** md5 signature: 5e673103e112601047af3ac0bac3a4fd ****/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "Constructor for 2d curve. @param thec [in] 2d curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theutol [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor2d_Curve2d
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** GCPnts_TangentialDeflection ******************/
		/**** md5 signature: 02f053303f91ec596066601be7daba5c ****/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "Constructor for 2d curve with restricted range. @param thec [in] 2d curve @param thefirstparameter [in] first parameter on curve @param thelastparameter [in] last parameter on curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theutol [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor2d_Curve2d
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

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
		/**** md5 signature: 45dfbf57c6460a500be0ab7afd32d9a9 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize algorithm for 3d curve. @param thec [in] 3d curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theutol [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor3d_Curve
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** Initialize ******************/
		/**** md5 signature: ceed2a4aeba90562a9390be05e1707d1 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize algorithm for 3d curve with restricted range. @param thec [in] 3d curve @param thefirstparameter [in] first parameter on curve @param thelastparameter [in] last parameter on curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theutol [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor3d_Curve
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** Initialize ******************/
		/**** md5 signature: ab28884c050d2a18b4766f5812a89976 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize algorithm for 2d curve. @param thec [in] 2d curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theutol [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor2d_Curve2d
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****************** Initialize ******************/
		/**** md5 signature: f84b8cf525a400a6e86d7d8444bff702 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize algorithm for 2d curve with restricted range. @param thec [in] 2d curve @param thefirstparameter [in] first parameter on curve @param thelastparameter [in] last parameter on curve @param theangulardeflection [in] angular deflection in radians @param thecurvaturedeflection [in] linear deflection @param theminimumofpoints [in] minimum number of points @param theutol [in] tolerance in curve parametric scope @param theminlen [in] minimal length.

Parameters
----------
theC: Adaptor2d_Curve2d
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int,optional
	default value is 2
theUTol: float,optional
	default value is 1.0e-9
theMinLen: float,optional
	default value is 1.0e-7

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

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
		/**** md5 signature: 067c34c9d2c8769449e50d61b02e7f5b ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the 3d curve. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: 0eb5f5a11094ce6bd3b46636cfc0f0d2 ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the 3d curve. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: e3357fe7bf7c1f17214b690b4a50931b ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the 3d curve. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: b9d6d100e05d95af13a4f10cd1b4a3a0 ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the 3d curve. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: dcc249075db75a8a30eec5756a74803d ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the 2d curve. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: 4e52fdb748a3a0c4a321d10fe2d811d0 ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the 2d curve. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: 7cf2d5fda64d545a74dfb6676b73c92b ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on the 2d curve. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****************** GCPnts_UniformAbscissa ******************/
		/**** md5 signature: 3e022da984e879ec9bd91c909485d5b9 ****/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Computes a uniform abscissa distribution of points on a part of the 2d curve. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****************** Abscissa ******************/
		/**** md5 signature: c89bcc85ff4523eefe5f7f8d1fd84247 ****/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Returns the current abscissa, i.e. the distance between two consecutive points.

Returns
-------
float
") Abscissa;
		Standard_Real Abscissa();

		/****************** Initialize ******************/
		/**** md5 signature: ff8ed44ea9e8cfca56786c72d93727e4 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve, abscissa, and tolerance. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****************** Initialize ******************/
		/**** md5 signature: 8b44b683fe0d6498b3497a9091ec2a9c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve, abscissa, tolerance, and parameter range. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****************** Initialize ******************/
		/**** md5 signature: 6eca052b89a1db443ccc9f720a731ca8 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve, number of points, and tolerance. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****************** Initialize ******************/
		/**** md5 signature: 6eeb18455b67ea7baed1e86dfe5be46e ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve, number of points, tolerance, and parameter range. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****************** Initialize ******************/
		/**** md5 signature: d082dd0da5c8b7e9d016381b64adbe8a ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve, abscissa, and tolerance. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****************** Initialize ******************/
		/**** md5 signature: 5fed61a500498f1212f77bb22ba940f8 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve, abscissa, tolerance, and parameter range. @param thec [in] input curve @param theabscissa [in] abscissa (distance between two consecutive points) @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****************** Initialize ******************/
		/**** md5 signature: 745a95a2b151a47cf5b22071d4b33bdc ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve, number of points, and tolerance. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****************** Initialize ******************/
		/**** md5 signature: f19f9a0beef93e46dbd6b52969a74201 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve, number of points, tolerance, and parameter range. @param thec [in] input curve @param thenbpoints [in] defines the number of desired points @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thetoler [in] used for more precise calculation of curve length  (precision::confusion() by default).

Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float
theToler: float,optional
	default value is -1

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

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
		/**** md5 signature: 474b0144d7ee1af0847eba83fb74e324 ****/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on the curve. @param thec [in] input 3d curve @param thedeflection [in] target deflection @param thewithcontrol [in] when true, the algorithm controls the estimate deflection.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****************** GCPnts_UniformDeflection ******************/
		/**** md5 signature: c3b66ef8894abe8e285c7908a277a990 ****/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on the curve. @param thec [in] input 2d curve @param thedeflection [in] target deflection @param thewithcontrol [in] when true, the algorithm controls the estimate deflection.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****************** GCPnts_UniformDeflection ******************/
		/**** md5 signature: 467225835404cd4e0f4b8fd6d878c18c ****/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on a part of the curve. @param thec [in] input 3d curve @param thedeflection [in] target deflection @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thewithcontrol [in] when true, the algorithm controls the estimate deflection.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

		/****************** GCPnts_UniformDeflection ******************/
		/**** md5 signature: bba43a3bb954557da4c6c6ab78fc8468 ****/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on a part of the curve. @param thec [in] input 2d curve @param thedeflection [in] target deflection @param theu1 [in] first parameter on curve @param theu2 [in] last parameter on curve @param thewithcontrol [in] when true, the algorithm controls the estimate deflection.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

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
		/**** md5 signature: 7de03351085fb8daea53a5f412261592 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve and deflection.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****************** Initialize ******************/
		/**** md5 signature: 846a126a55a539a4287ae056e82c995c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 2d curve and deflection.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****************** Initialize ******************/
		/**** md5 signature: a64a6e461e094380d38a15977c86637a ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with 3d curve, deflection, parameter range.

Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

		/****************** Initialize ******************/
		/**** md5 signature: 2d624d7604e4e23f6a84fe4515c62859 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algorithms with curve, deflection, parameter range. this and the above methods initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve thec, or - on the part of curve thec limited by the two parameter values theu1 and theu2, where the maximum distance between thec and the polygon that results from the points of the distribution is not greater than thedeflection. the first point of the distribution is either the origin of curve thec or the point of parameter theu1. the last point of the distribution is either the end point of curve thec or the point of parameter theu2. intermediate points of the distribution are built using interpolations of segments of the curve limited at the 2nd degree. the construction ensures, in a first step, that the chordal deviation for this interpolation of the curve is less than or equal to thedeflection. however, it does not ensure that the chordal deviation for the curve itself is less than or equal to thedeflection. to do this a check is necessary, which may generate (second step) additional intermediate points. this check is time consuming, and can be avoided by setting thewithcontrol to false. note that by default thewithcontrol is true and check is performed. use the function isdone to verify that the computation was successful, the function nbpoints() to obtain the number of points of the computed distribution, and the function parameter to read the parameter of each point. //! warning - thec is necessary, 'c2' continuous. this property is not checked at construction time. - the roles of theu1 and theu2 are inverted if theu1 > theu2. //! warning thec is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2d curve from the package geom2d (in the case of an adaptor2d_curve2d curve) or a 3d curve from the package geom (in the case of an adaptor3d_curve curve), - and those required on the curve by the computation algorithm.

Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theWithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

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

@classnotwrapped
class GCPnts_TCurveTypes:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
