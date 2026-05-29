/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gcpnts.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
enum GCPnts_AbscissaType {
	GCPnts_LengthParametrized = 0,
	GCPnts_Parametrized = 1,
	GCPnts_AbsComposite = 2,
};

enum GCPnts_DeflectionType {
	GCPnts_Linear = 0,
	GCPnts_Circular = 1,
	GCPnts_Curved = 2,
	GCPnts_DefComposite = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GCPnts_AbscissaType(IntEnum):
	GCPnts_LengthParametrized = 0
	GCPnts_Parametrized = 1
	GCPnts_AbsComposite = 2
GCPnts_LengthParametrized = GCPnts_AbscissaType.GCPnts_LengthParametrized
GCPnts_Parametrized = GCPnts_AbscissaType.GCPnts_Parametrized
GCPnts_AbsComposite = GCPnts_AbscissaType.GCPnts_AbsComposite

class GCPnts_DeflectionType(IntEnum):
	GCPnts_Linear = 0
	GCPnts_Circular = 1
	GCPnts_Curved = 2
	GCPnts_DefComposite = 3
GCPnts_Linear = GCPnts_DeflectionType.GCPnts_Linear
GCPnts_Circular = GCPnts_DeflectionType.GCPnts_Circular
GCPnts_Curved = GCPnts_DeflectionType.GCPnts_Curved
GCPnts_DefComposite = GCPnts_DeflectionType.GCPnts_DefComposite
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
		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: e9e9ed8389a2f8082b7f1c66900c4a47 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint();

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: 7b24cad9a2cef354ba5aa496a725cfa5 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: double
theU0: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const double theAbscissa, const double theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: d9b513423c89fb1aa087c06ef2dbe48a ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theTol: double
theC: Adaptor3d_Curve
theAbscissa: double
theU0: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0 with the given tolerance.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const double theTol, const Adaptor3d_Curve & theC, const double theAbscissa, const double theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: d8423e337ad2e445f1c179db40cc54cb ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theTol: double
theC: Adaptor2d_Curve2d
theAbscissa: double
theU0: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0 with the given tolerance.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const double theTol, const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: cea1cf304b9d1c0eeb918b156fc797e7 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: double
theU0: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: 256f7dd56f9c46adfbb60645e4716cee ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: double
theU0: double
theUi: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be close to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const double theAbscissa, const double theU0, const double theUi);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: b1de7408effeb0d94c01b169f4b2bc72 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: double
theU0: double
theUi: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be closed to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theU0, const double theUi);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: 3edbcb7a9aecacc265439720e79906da ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: double
theU0: double
theUi: double
theTol: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be close to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const double theAbscissa, const double theU0, const double theUi, const double theTol);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: 178193900d6cf67dfc02560473f681d4 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: double
theU0: double
theUi: double
theTol: double

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be close to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theU0, const double theUi, const double theTol);

		/****** GCPnts_AbscissaPoint::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the computation was successful, False otherwise. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		bool IsDone();

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 5f05a4e428901e6ad31a119f7c33af2f ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
double

Description
-----------
Computes the length of the 3D Curve.
") Length;
		static double Length(const Adaptor3d_Curve & theC);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 6ea329f5a24fc2ef8645e303a11f16be ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Computes the length of the 2D Curve.
") Length;
		static double Length(const Adaptor2d_Curve2d & theC);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 0ec67b0d81a8c6b9401177aece824875 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theTol: double

Return
-------
double

Description
-----------
Computes the length of the 3D Curve with the given tolerance.
") Length;
		static double Length(const Adaptor3d_Curve & theC, const double theTol);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 6d8fb38d86c3a8a8d4aea7b63023baea ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theTol: double

Return
-------
double

Description
-----------
Computes the length of the 2D Curve with the given tolerance.
") Length;
		static double Length(const Adaptor2d_Curve2d & theC, const double theTol);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 8d9d9b2edccfa7c51f197aec293ef6e1 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU1: double
theU2: double

Return
-------
double

Description
-----------
Computes the length of the 3D Curve.
") Length;
		static double Length(const Adaptor3d_Curve & theC, const double theU1, const double theU2);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 2f9585d4e31397f8dac6532dc72f78cc ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU1: double
theU2: double

Return
-------
double

Description
-----------
Computes the length of the 2D Curve.
") Length;
		static double Length(const Adaptor2d_Curve2d & theC, const double theU1, const double theU2);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: e1d44d5784436fa9b93dd8f179a6a646 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU1: double
theU2: double
theTol: double

Return
-------
double

Description
-----------
Computes the length of the 3D Curve with the given tolerance.
") Length;
		static double Length(const Adaptor3d_Curve & theC, const double theU1, const double theU2, const double theTol);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 5c1f91ff4dd2d4fc2cdc9c5760adec38 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU1: double
theU2: double
theTol: double

Return
-------
double

Description
-----------
Computes the length of the Curve with the given tolerance.
") Length;
		static double Length(const Adaptor2d_Curve2d & theC, const double theU1, const double theU2, const double theTol);

		/****** GCPnts_AbscissaPoint::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the curve of the point solution of this algorithm. Exceptions StdFail_NotDone if the computation was not successful, or was not done.
") Parameter;
		double Parameter();

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
		/****** GCPnts_DistFunction2dMV::GCPnts_DistFunction2dMV ******/
		/****** md5 signature: 0d9319bb50af83ef2abfff64957748fe ******/
		%feature("compactdefaultargs") GCPnts_DistFunction2dMV;
		%feature("autodoc", "
Parameters
----------
theCurvLinDist: GCPnts_DistFunction2d

Return
-------
None

Description
-----------
No available documentation.
") GCPnts_DistFunction2dMV;
		 GCPnts_DistFunction2dMV(GCPnts_DistFunction2d & theCurvLinDist);

		/****** GCPnts_DistFunction2dMV::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** GCPnts_DistFunction2dMV::Value ******/
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

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
		/****** GCPnts_DistFunctionMV::GCPnts_DistFunctionMV ******/
		/****** md5 signature: efa8497fab01e3580f20a6c2f8d82b39 ******/
		%feature("compactdefaultargs") GCPnts_DistFunctionMV;
		%feature("autodoc", "
Parameters
----------
theCurvLinDist: GCPnts_DistFunction

Return
-------
None

Description
-----------
No available documentation.
") GCPnts_DistFunctionMV;
		 GCPnts_DistFunctionMV(GCPnts_DistFunction & theCurvLinDist);

		/****** GCPnts_DistFunctionMV::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** GCPnts_DistFunctionMV::Value ******/
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

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
		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: 61f40721b265b162b0de66806a8f9775 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm. To define the problem to be solved, use the function Initialize.
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa();

		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: d386588b13f3e5b6f8e0241364f51594 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int

Return
-------
None

Description
-----------
Computes a uniform abscissa distribution of points - on the curve where Abscissa is the curvilinear distance between two consecutive points of the distribution.
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & theC, const int theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: c8a862e0ecca5e483426f2a72dc8fc1b ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: double
theU2: double

Return
-------
None

Description
-----------
Computes a uniform abscissa distribution of points on the part of curve limited by the two parameter values theU1 and theU2, where Abscissa is the curvilinear distance between two consecutive points of the distribution. The first point of the distribution is either the origin of curve or the point of parameter theU1. The following points are computed such that the curvilinear distance between two consecutive points is equal to Abscissa. The last point of the distribution is either the end point of curve or the point of parameter theU2. However the curvilinear distance between this last point and the point just preceding it in the distribution is, of course, generally not equal to Abscissa. Use the function IsDone() to verify that the computation was successful, the function NbPoints() to obtain the number of points of the computed distribution, and the function Parameter() to read the parameter of each point. //! Warning The roles of theU1 and theU2 are inverted if theU1 > theU2. Warning theC is an adapted curve, that is, an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm. 
Input parameter: theC input 3D curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve.
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & theC, const int theNbPoints, const double theU1, const double theU2);

		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: 3f72dafc156158a14ca56f0725c160a3 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int

Return
-------
None

Description
-----------
Computes a uniform abscissa distribution of points on the 2D curve. 
Input parameter: theC input 2D curve 
Input parameter: theNbPoints defines the number of desired points.
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & theC, const int theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: 7a86d443a069ce4c82f783185852eec2 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: double
theU2: double

Return
-------
None

Description
-----------
Computes a Uniform abscissa distribution of points on a part of the 2D curve. 
Input parameter: theC input 2D curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve.
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & theC, const int theNbPoints, const double theU1, const double theU2);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: 65cc97f264b58b90dd86ebdcbeaefda3 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve and target number of points. 
Input parameter: theC input 3D curve 
Input parameter: theNbPoints defines the number of desired points.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const int theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: 887f18ecaf10cae7a2214b2815b7b722 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: double
theU2: double

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, target number of points and curve parameter range. 
Input parameter: theC input 3D curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const int theNbPoints, const double theU1, const double theU2);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: 796c669ccc4dcdeaac89bb5a41b4213c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve and target number of points. 
Input parameter: theC input 2D curve 
Input parameter: theNbPoints defines the number of desired points.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const int theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: 37c5ef2bab8bc9c1c7acbac31b820eb9 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: double
theU2: double

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve, target number of points and curve parameter range. 
Input parameter: theC input 2D curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const int theNbPoints, const double theU1, const double theU2);

		/****** GCPnts_QuasiUniformAbscissa::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		bool IsDone();

		/****** GCPnts_QuasiUniformAbscissa::NbPoints ******/
		/****** md5 signature: 30bb12ae17a0afd90d9bd428b1b70e1c ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the distribution computed by this algorithm. This value is either: - the one imposed on the algorithm at the time of construction (or initialization), or - the one computed by the algorithm when the curvilinear distance between two consecutive points of the distribution is imposed on the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") NbPoints;
		int NbPoints();

		/****** GCPnts_QuasiUniformAbscissa::Parameter ******/
		/****** md5 signature: 0eeecf2ca01d263bbaf620be4b3adcda ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Parameter;
		double Parameter(const int Index);

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
		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: efa98a17078c26984adf714d01a559d0 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm. To define the problem to be solved, use the function Initialize().
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection();

		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: 04f6ee825019edcbb9823745916021d6 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on the Curve.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & theC, const double theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: a265db635371cfc43bfa681d0597817f ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on the Curve.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & theC, const double theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: 75a3d7d268dd462f3c76d3a9d9ea0065 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theU1: double
theU2: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on a part of the Curve.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & theC, const double theDeflection, const double theU1, const double theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: a1e3b356c32ae9e5b8929a617720f862 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theU1: double
theU2: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on a part of the Curve. This and the above algorithms compute a distribution of points: - on the curve theC, or - on the part of curve theC limited by the two parameter values theU1 and theU2, where the deflection resulting from the distributed points is not greater than theDeflection. //! The first point of the distribution is either the origin of curve theC or the point of parameter theU1. The last point of the distribution is either the end point of curve theC or the point of parameter theU2. //! Intermediate points of the distribution are built such that the deflection is not greater than theDeflection. Using the following evaluation of the deflection: if Pi and Pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of Pi and Pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2] on curve theC). theContinuity, defaulted to GeomAbs_C1, gives the degree of continuity of the curve theC. (Note that C is an Adaptor3d_Curve or an Adaptor2d_Curve2d object, and does not know the degree of continuity of the underlying curve). Use the function IsDone() to verify that the computation was successful, the function NbPoints() to obtain the number of points of the computed distribution, and the function Parameter() to read the parameter of each point. //! Warning - The roles of theU1 and theU2 are inverted if theU1 > theU2. - Derivative functions on the curve are called according to theContinuity. An error may occur if theContinuity is greater than the real degree of continuity of the curve. //! Warning theC is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & theC, const double theDeflection, const double theU1, const double theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Deflection ******/
		/****** md5 signature: e7bafce0869e6419d801f7a7f285ba00 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. This is the value given to the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Deflection;
		double Deflection();

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: 267e541209dae36dcb67e9b9f65eca36 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve and deflection.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: 06482c8dd782743cc6d5720e2954f0ea ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve and deflection.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: ac41301fdffadb5689d0f4a2d96fcb9e ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theU1: double
theU2: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, deflection and parameter range.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theDeflection, const double theU1, const double theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: fef646e77f3e562f2f4317a67b645df9 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theU1: double
theU2: double
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with theC, theDeflection, theU1, theU2. This and the above algorithms initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve theC, or - on the part of curve theC limited by the two parameter values theU1 and theU2, where the deflection resulting from the distributed points is not greater than theDeflection. //! The first point of the distribution is either the origin of curve theC or the point of parameter theU1. The last point of the distribution is either the end point of curve theC or the point of parameter theU2. //! Intermediate points of the distribution are built in such a way that the deflection is not greater than theDeflection. Using the following evaluation of the deflection: if Pi and Pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of Pi and Pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2] on curve theC). theContinuity, defaulted to GeomAbs_C1, gives the degree of continuity of the curve theC. (Note that C is an Adaptor3d_Curve or an Adaptor2d_Curve2d object, and does not know the degree of continuity of the underlying curve). Use the function IsDone to verify that the computation was successful, the function NbPoints() to obtain the number of points of the computed distribution, and the function Parameter() to read the parameter of each point. //! Warning - The roles of theU1 and theU2 are inverted if theU1 > theU2. - Derivative functions on the curve are called according to theContinuity. An error may occur if theContinuity is greater than the real degree of continuity of the curve. //! Warning theC is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), and those required on the curve by the computation algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theDeflection, const double theU1, const double theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		bool IsDone();

		/****** GCPnts_QuasiUniformDeflection::NbPoints ******/
		/****** md5 signature: 30bb12ae17a0afd90d9bd428b1b70e1c ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the distribution computed by this algorithm. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") NbPoints;
		int NbPoints();

		/****** GCPnts_QuasiUniformDeflection::Parameter ******/
		/****** md5 signature: 0eeecf2ca01d263bbaf620be4b3adcda ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Parameter;
		double Parameter(const int Index);

		/****** GCPnts_QuasiUniformDeflection::Value ******/
		/****** md5 signature: ecf33dc776d811f09717f46fa04f7afe ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
Returns the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Value;
		gp_Pnt Value(const int Index);

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
/********************************************
* class GCPnts_TCurveTypes<Adaptor3d_Curve> *
********************************************/
/************************************
* class GCPnts_TangentialDeflection *
************************************/
class GCPnts_TangentialDeflection {
	public:
		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: d6a43ebbe398bf311982f493adb5385b ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor. 
See also: Initialize().
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection();

		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: 26b9b234da26aaaf8eb93fb260523a89 ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Constructor for 3D curve. 
Input parameter: theC 3d curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Input parameter: theUTol tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & theC, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: 31c7dd5fbde307464124bbea9c4006b1 ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theFirstParameter: double
theLastParameter: double
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Constructor for 3D curve with restricted range. 
Input parameter: theC 3d curve 
Input parameter: theFirstParameter first parameter on curve 
Input parameter: theLastParameter last parameter on curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Parameter theUTo l[in] tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & theC, const double theFirstParameter, const double theLastParameter, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: aa5395eaafc417a638f24ab46da1e8cc ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Constructor for 2D curve. 
Input parameter: theC 2d curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Input parameter: theUTol tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & theC, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: eb9368a86bd44e26a331c647a6ffba1c ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theFirstParameter: double
theLastParameter: double
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Constructor for 2D curve with restricted range. 
Input parameter: theC 2d curve 
Input parameter: theFirstParameter first parameter on curve 
Input parameter: theLastParameter last parameter on curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Input parameter: theUTol tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & theC, const double theFirstParameter, const double theLastParameter, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::AddPoint ******/
		/****** md5 signature: 20062d2fea11f1a435fd360422447051 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theParam: double
theIsReplace: bool (optional, default to true)

Return
-------
int

Description
-----------
Add point to already calculated points (or replace existing) Returns index of new added point or founded with parametric tolerance (replaced if theIsReplace is true).
") AddPoint;
		int AddPoint(const gp_Pnt & thePnt, const double theParam, const bool theIsReplace = true);

		/****** GCPnts_TangentialDeflection::ArcAngularStep ******/
		/****** md5 signature: be3ada20ef0826866671773d53764c26 ******/
		%feature("compactdefaultargs") ArcAngularStep;
		%feature("autodoc", "
Parameters
----------
theRadius: double
theLinearDeflection: double
theAngularDeflection: double
theMinLength: double

Return
-------
double

Description
-----------
Computes angular step for the arc using the given parameters.
") ArcAngularStep;
		static double ArcAngularStep(const double theRadius, const double theLinearDeflection, const double theAngularDeflection, const double theMinLength);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: 850635a51b1f243cddbe1e84362025c3 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Initialize algorithm for 3D curve. 
Input parameter: theC 3d curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Input parameter: theUTol tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: 89a07e122f308cfed264c45df56ccf09 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theFirstParameter: double
theLastParameter: double
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Initialize algorithm for 3D curve with restricted range. 
Input parameter: theC 3d curve 
Input parameter: theFirstParameter first parameter on curve 
Input parameter: theLastParameter last parameter on curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Input parameter: theUTol tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theFirstParameter, const double theLastParameter, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: 2d1c84154a696adfca80e1764e0ee37e ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Initialize algorithm for 2D curve. 
Input parameter: theC 2d curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Input parameter: theUTol tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: de26c578bfad597590b2c4689948c147 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theFirstParameter: double
theLastParameter: double
theAngularDeflection: double
theCurvatureDeflection: double
theMinimumOfPoints: int (optional, default to 2)
theUTol: double (optional, default to 1.0e-9)
theMinLen: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Initialize algorithm for 2D curve with restricted range. 
Input parameter: theC 2d curve 
Input parameter: theFirstParameter first parameter on curve 
Input parameter: theLastParameter last parameter on curve 
Input parameter: theAngularDeflection angular deflection in radians 
Input parameter: theCurvatureDeflection linear deflection 
Input parameter: theMinimumOfPoints minimum number of points 
Input parameter: theUTol tolerance in curve parametric scope 
Input parameter: theMinLen minimal length.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theFirstParameter, const double theLastParameter, const double theAngularDeflection, const double theCurvatureDeflection, const int theMinimumOfPoints = 2, const double theUTol = 1.0e-9, const double theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::NbPoints ******/
		/****** md5 signature: 30bb12ae17a0afd90d9bd428b1b70e1c ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** GCPnts_TangentialDeflection::Parameter ******/
		/****** md5 signature: 95166ba2a26596c51215ffb9febfa4d4 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter(const int I);

		/****** GCPnts_TangentialDeflection::Value ******/
		/****** md5 signature: 77fe27af893431bd228649e4315ed28b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const int I);

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
		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 62d00f7322d01bc2b00f3850f30fb1a6 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "Return
-------
None

Description
-----------
creation of a indefinite UniformAbscissa.
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa();

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: bd0444bd15c48e1701218d7fc114235f ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a uniform abscissa distribution of points on the 3D curve. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const double theAbscissa, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 5801221125da19c4bc95b90a44414184 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: double
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a Uniform abscissa distribution of points on a part of the 3D Curve. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const double theAbscissa, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 11f0f9f40fab56f06d216ea8d7afdd7c ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a uniform abscissa distribution of points on the 3D Curve. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const int theNbPoints, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 0e8d56ae5227f5da983077ee60d2d497 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a Uniform abscissa distribution of points on a part of the 3D Curve. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const int theNbPoints, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: a56b95fcecacca315a8bc8cc4e957cb6 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a uniform abscissa distribution of points on the 2D curve. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: be67fa9d265fc7eedf89e6c4fe107935 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: double
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a Uniform abscissa distribution of points on a part of the 2D Curve. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: d2ad06ddc0c567f43fd60664c4b8e80a ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a uniform abscissa distribution of points on the 2D Curve. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const int theNbPoints, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: cf90388ba31a948b40bf98e2a4be5dc5 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Computes a Uniform abscissa distribution of points on a part of the 2D Curve. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const int theNbPoints, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Abscissa ******/
		/****** md5 signature: b99f0e1b92d77e4a826d89e6a37072ea ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the current abscissa, i.e. the distance between two consecutive points.
") Abscissa;
		double Abscissa();

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 35eec9e50e5fc65a763baee924d6fdba ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, Abscissa, and Tolerance. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theAbscissa, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: c67c67a52e4d66d0c8c8787c25f683d8 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: double
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, Abscissa, Tolerance, and parameter range. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theAbscissa, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 53e0ffca34f0bc08f3451ad3843d9823 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, number of points, and Tolerance. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const int theNbPoints, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 9bdc48792a01d48dc84c867d90129eb6 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, number of points, Tolerance, and parameter range. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const int theNbPoints, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 78d81e3235043c6cb2a3cb1cec0f6bfc ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve, Abscissa, and Tolerance. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 1cee28e911ef0197b3205400e3c7c584 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: double
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve, Abscissa, Tolerance, and parameter range. 
Input parameter: theC input curve 
Input parameter: theAbscissa abscissa (distance between two consecutive points) 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theAbscissa, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: d8979b0c9efbac9a1d3f88612102c367 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve, number of points, and Tolerance. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const int theNbPoints, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 1ce1af295468103518232c7fa68c2ca2 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: double
theU2: double
theToler: double (optional, default to -1)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve, number of points, Tolerance, and parameter range. 
Input parameter: theC input curve 
Input parameter: theNbPoints defines the number of desired points 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theToler used for more precise calculation of curve length  (Precision::Confusion() by default).
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const int theNbPoints, const double theU1, const double theU2, const double theToler = -1);

		/****** GCPnts_UniformAbscissa::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** GCPnts_UniformAbscissa::NbPoints ******/
		/****** md5 signature: 30bb12ae17a0afd90d9bd428b1b70e1c ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** GCPnts_UniformAbscissa::Parameter ******/
		/****** md5 signature: 0eeecf2ca01d263bbaf620be4b3adcda ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the computed Parameter of index <Index>.
") Parameter;
		double Parameter(const int Index);

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
		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: 1f68370c23021d6b6fd020f9adad493e ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm. To define the problem to be solved, use the function Initialize.
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection();

		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: c24603f0cda405849ec22c5aa9c3d2ab ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Computes a uniform Deflection distribution of points on the curve. 
Input parameter: theC input 3D curve 
Input parameter: theDeflection target deflection 
Input parameter: theWithControl when True, the algorithm controls the estimate deflection.
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & theC, const double theDeflection, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: 6d763cdabd87e752ad5ea9a1e7fb130d ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Computes a uniform Deflection distribution of points on the curve. 
Input parameter: theC input 2D curve 
Input parameter: theDeflection target deflection 
Input parameter: theWithControl when True, the algorithm controls the estimate deflection.
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & theC, const double theDeflection, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: 88a637e93cad027c5e9644b399c7f07d ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theU1: double
theU2: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Computes a Uniform Deflection distribution of points on a part of the curve. 
Input parameter: theC input 3D curve 
Input parameter: theDeflection target deflection 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theWithControl when True, the algorithm controls the estimate deflection.
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & theC, const double theDeflection, const double theU1, const double theU2, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: 9c14b5b6a1dc6528e957f2516b91590f ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theU1: double
theU2: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Computes a Uniform Deflection distribution of points on a part of the curve. 
Input parameter: theC input 2D curve 
Input parameter: theDeflection target deflection 
Input parameter: theU1 first parameter on curve 
Input parameter: theU2 last parameter on curve 
Input parameter: theWithControl when True, the algorithm controls the estimate deflection.
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & theC, const double theDeflection, const double theU1, const double theU2, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::Deflection ******/
		/****** md5 signature: e7bafce0869e6419d801f7a7f285ba00 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. This value is the one given to the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Deflection;
		double Deflection();

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: b15d251c625eddcdcf60627e16ed67cf ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve and deflection.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theDeflection, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: edcfd703c1bab9646a09b955d80acc7d ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve and deflection.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theDeflection, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 7e609ec817faeb5920d50e412538b2d6 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: double
theU1: double
theU2: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, deflection, parameter range.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const double theDeflection, const double theU1, const double theU2, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 5a3b417d0384ad63642900afa97eeb2c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: double
theU1: double
theU2: double
theWithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Initialize the algorithms with curve, deflection, parameter range. This and the above methods initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve theC, or - on the part of curve theC limited by the two parameter values theU1 and theU2, where the maximum distance between theC and the polygon that results from the points of the distribution is not greater than theDeflection. The first point of the distribution is either the origin of curve theC or the point of parameter theU1. The last point of the distribution is either the end point of curve theC or the point of parameter theU2. Intermediate points of the distribution are built using interpolations of segments of the curve limited at the 2nd degree. The construction ensures, in a first step, that the chordal deviation for this interpolation of the curve is less than or equal to theDeflection. However, it does not ensure that the chordal deviation for the curve itself is less than or equal to theDeflection. To do this a check is necessary, which may generate (second step) additional intermediate points. This check is time consuming, and can be avoided by setting theWithControl to false. Note that by default theWithControl is true and check is performed. Use the function IsDone to verify that the computation was successful, the function NbPoints() to obtain the number of points of the computed distribution, and the function Parameter to read the parameter of each point. //! Warning - theC is necessary, 'C2' continuous. This property is not checked at construction time. - The roles of theU1 and theU2 are inverted if theU1 > theU2. //! Warning theC is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const double theDeflection, const double theU1, const double theU2, const bool theWithControl = true);

		/****** GCPnts_UniformDeflection::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		bool IsDone();

		/****** GCPnts_UniformDeflection::NbPoints ******/
		/****** md5 signature: 30bb12ae17a0afd90d9bd428b1b70e1c ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the distribution computed by this algorithm. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") NbPoints;
		int NbPoints();

		/****** GCPnts_UniformDeflection::Parameter ******/
		/****** md5 signature: 0eeecf2ca01d263bbaf620be4b3adcda ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Parameter;
		double Parameter(const int Index);

		/****** GCPnts_UniformDeflection::Value ******/
		/****** md5 signature: ecf33dc776d811f09717f46fa04f7afe ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
Returns the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFAil_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Value;
		gp_Pnt Value(const int Index);

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
/* deprecated methods */
%pythoncode {
@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_AbscissaPoint_Length(*args):
	return GCPnts_AbscissaPoint.Length(*args)

@deprecated
def GCPnts_TangentialDeflection_ArcAngularStep(*args):
	return GCPnts_TangentialDeflection.ArcAngularStep(*args)

}
