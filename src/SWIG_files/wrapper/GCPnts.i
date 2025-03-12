/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_gcpnts.html"
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
		/****** md5 signature: 994f7fd46e144d693934367c87eff7d8 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: e899defbc3b18b307a0f709838f26d36 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theTol: float
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0 with the given tolerance.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Standard_Real theTol, const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: bf74800bc5e96e7e6bece681096cc227 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theTol: float
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0 with the given tolerance.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Standard_Real theTol, const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: 149827954cacc4a64054884618228ebc ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: f0d4479d46145782f8e11143c82b6809 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float
theUi: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be close to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: e276268e7f3319a5141ea9d9269d427e ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float
theUi: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be closed to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: edb80e41eebb154b56723e549d17cd66 ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU0: float
theUi: float
theTol: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be close to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi, const Standard_Real theTol);

		/****** GCPnts_AbscissaPoint::GCPnts_AbscissaPoint ******/
		/****** md5 signature: e2821bf35681332a03f6bfe49874a10b ******/
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU0: float
theUi: float
theTol: float

Return
-------
None

Description
-----------
The algorithm computes a point on a curve at the distance theAbscissa from the point of parameter theU0. theUi is the starting value used in the iterative process which find the solution, it must be close to the final solution.
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU0, const Standard_Real theUi, const Standard_Real theTol);

		/****** GCPnts_AbscissaPoint::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the computation was successful, False otherwise. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 042f9221edd3ab5e957807852ec69e0f ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
float

Description
-----------
Computes the length of the 3D Curve.
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 2ab2e1b92a4eeed3a8a63ee4e4e8d78d ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
Computes the length of the 2D Curve.
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 9a1db470fe18f3a43cf1c177415bed7c ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theTol: float

Return
-------
float

Description
-----------
Computes the length of the 3D Curve with the given tolerance.
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC, const Standard_Real theTol);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 4782e2d3c54640d45f3910856a523a0d ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theTol: float

Return
-------
float

Description
-----------
Computes the length of the 2D Curve with the given tolerance.
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC, const Standard_Real theTol);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 92a3bd66d06c2f69fd7d3efcc4a1a170 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU1: float
theU2: float

Return
-------
float

Description
-----------
Computes the length of the 3D Curve.
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC, const Standard_Real theU1, const Standard_Real theU2);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 2b066742b0469dfd4834243e7a135d11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU1: float
theU2: float

Return
-------
float

Description
-----------
Computes the length of the 2D Curve.
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC, const Standard_Real theU1, const Standard_Real theU2);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: bb6b4be428e60ce7959343316ec50d58 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU1: float
theU2: float
theTol: float

Return
-------
float

Description
-----------
Computes the length of the 3D Curve with the given tolerance.
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & theC, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theTol);

		/****** GCPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 57f71acf7ac66837fcd814ff6da0c063 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU1: float
theU2: float
theTol: float

Return
-------
float

Description
-----------
Computes the length of the Curve with the given tolerance.
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & theC, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theTol);

		/****** GCPnts_AbscissaPoint::Parameter ******/
		/****** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the curve of the point solution of this algorithm. Exceptions StdFail_NotDone if the computation was not successful, or was not done.
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
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** GCPnts_DistFunction2dMV::Value ******/
		/****** md5 signature: 22e87ab6030399152b72d08cc5e678ff ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
No available documentation.
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
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** GCPnts_DistFunctionMV::Value ******/
		/****** md5 signature: 22e87ab6030399152b72d08cc5e678ff ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
No available documentation.
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
		/****** md5 signature: dd562f7cb1072dc4828085b7acd50b2f ******/
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
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: 208585ff814fd87a45d0395b14d6927b ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float

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
		 GCPnts_QuasiUniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: 5b685a23d5e0c95b72641488537f0bb4 ******/
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
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::GCPnts_QuasiUniformAbscissa ******/
		/****** md5 signature: 68eba7225e3210dd556f8f7c730aed8f ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float

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
		 GCPnts_QuasiUniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: b84c4aadf7906dd0835d7108bad17a6f ******/
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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: 53ce7362fdacfdc7fff6d7912f75ef9f ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float

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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: c0645af498cba44e7fdc2497f9e35b9d ******/
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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints);

		/****** GCPnts_QuasiUniformAbscissa::Initialize ******/
		/****** md5 signature: ed4a2afda240c0f04b820d3a8e6dfb1a ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float

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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2);

		/****** GCPnts_QuasiUniformAbscissa::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GCPnts_QuasiUniformAbscissa::NbPoints ******/
		/****** md5 signature: e92014a2f157c195ed77b7745c7eae3f ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the distribution computed by this algorithm. This value is either: - the one imposed on the algorithm at the time of construction (or initialization), or - the one computed by the algorithm when the curvilinear distance between two consecutive points of the distribution is imposed on the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GCPnts_QuasiUniformAbscissa::Parameter ******/
		/****** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
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
		/****** md5 signature: 9f427f22da8d1765aa59c8978c365230 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on the Curve.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: 47da4f025691c83a80f04c6175d1185d ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on the Curve.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: 70a0f4989745d4e7d0413f64ba479aa8 ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on a part of the Curve.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::GCPnts_QuasiUniformDeflection ******/
		/****** md5 signature: dbd5412a35e8329eb249a545ab74b89d ******/
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Computes a QuasiUniform Deflection distribution of points on a part of the Curve. This and the above algorithms compute a distribution of points: - on the curve theC, or - on the part of curve theC limited by the two parameter values theU1 and theU2, where the deflection resulting from the distributed points is not greater than theDeflection. //! The first point of the distribution is either the origin of curve theC or the point of parameter theU1. The last point of the distribution is either the end point of curve theC or the point of parameter theU2. //! Intermediate points of the distribution are built such that the deflection is not greater than theDeflection. Using the following evaluation of the deflection: if Pi and Pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of Pi and Pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2] on curve theC). theContinuity, defaulted to GeomAbs_C1, gives the degree of continuity of the curve theC. (Note that C is an Adaptor3d_Curve or an Adaptor2d_Curve2d object, and does not know the degree of continuity of the underlying curve). Use the function IsDone() to verify that the computation was successful, the function NbPoints() to obtain the number of points of the computed distribution, and the function Parameter() to read the parameter of each point. //! Warning - The roles of theU1 and theU2 are inverted if theU1 > theU2. - Derivative functions on the curve are called according to theContinuity. An error may occur if theContinuity is greater than the real degree of continuity of the curve. //! Warning theC is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm.
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Deflection ******/
		/****** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. This is the value given to the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Deflection;
		Standard_Real Deflection();

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: 82b0287725f04e0899a9450752ed5d64 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve and deflection.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: 04b5bf695538016e85b1a76c8d15238f ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve and deflection.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: 8d2138e60f7bf0b16e0be1feef9962ca ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, deflection and parameter range.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::Initialize ******/
		/****** md5 signature: 367f2a9f47dcc2fe28b985d61eeb7da5 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theContinuity: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Initialize the algorithms with theC, theDeflection, theU1, theU2. This and the above algorithms initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve theC, or - on the part of curve theC limited by the two parameter values theU1 and theU2, where the deflection resulting from the distributed points is not greater than theDeflection. //! The first point of the distribution is either the origin of curve theC or the point of parameter theU1. The last point of the distribution is either the end point of curve theC or the point of parameter theU2. //! Intermediate points of the distribution are built in such a way that the deflection is not greater than theDeflection. Using the following evaluation of the deflection: if Pi and Pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of Pi and Pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2] on curve theC). theContinuity, defaulted to GeomAbs_C1, gives the degree of continuity of the curve theC. (Note that C is an Adaptor3d_Curve or an Adaptor2d_Curve2d object, and does not know the degree of continuity of the underlying curve). Use the function IsDone to verify that the computation was successful, the function NbPoints() to obtain the number of points of the computed distribution, and the function Parameter() to read the parameter of each point. //! Warning - The roles of theU1 and theU2 are inverted if theU1 > theU2. - Derivative functions on the curve are called according to theContinuity. An error may occur if theContinuity is greater than the real degree of continuity of the curve. //! Warning theC is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), and those required on the curve by the computation algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const GeomAbs_Shape theContinuity = GeomAbs_C1);

		/****** GCPnts_QuasiUniformDeflection::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GCPnts_QuasiUniformDeflection::NbPoints ******/
		/****** md5 signature: e92014a2f157c195ed77b7745c7eae3f ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the distribution computed by this algorithm. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GCPnts_QuasiUniformDeflection::Parameter ******/
		/****** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****** GCPnts_QuasiUniformDeflection::Value ******/
		/****** md5 signature: ae91500dcf1bb71f5f0b013f5ee88108 ******/
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
		/****** md5 signature: e2876f14004b1580160f394dc792d41c ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: e7a79d9031269c6fe80fc514568ab577 ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		 GCPnts_TangentialDeflection(const Adaptor3d_Curve & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: 5e673103e112601047af3ac0bac3a4fd ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::GCPnts_TangentialDeflection ******/
		/****** md5 signature: 02f053303f91ec596066601be7daba5c ******/
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		 GCPnts_TangentialDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::AddPoint ******/
		/****** md5 signature: f541c04e71bbea5ee903e5e80a7a0852 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theParam: float
theIsReplace: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Add point to already calculated points (or replace existing) Returns index of new added point or founded with parametric tolerance (replaced if theIsReplace is true).
") AddPoint;
		Standard_Integer AddPoint(const gp_Pnt & thePnt, const Standard_Real theParam, const Standard_Boolean theIsReplace = Standard_True);

		/****** GCPnts_TangentialDeflection::ArcAngularStep ******/
		/****** md5 signature: cc35f2d87b7b0047d50b6331b6dbffd0 ******/
		%feature("compactdefaultargs") ArcAngularStep;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theLinearDeflection: float
theAngularDeflection: float
theMinLength: float

Return
-------
float

Description
-----------
Computes angular step for the arc using the given parameters.
") ArcAngularStep;
		static Standard_Real ArcAngularStep(const Standard_Real theRadius, const Standard_Real theLinearDeflection, const Standard_Real theAngularDeflection, const Standard_Real theMinLength);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: 45dfbf57c6460a500be0ab7afd32d9a9 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: ceed2a4aeba90562a9390be05e1707d1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: ab28884c050d2a18b4766f5812a89976 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::Initialize ******/
		/****** md5 signature: f84b8cf525a400a6e86d7d8444bff702 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theFirstParameter: float
theLastParameter: float
theAngularDeflection: float
theCurvatureDeflection: float
theMinimumOfPoints: int (optional, default to 2)
theUTol: float (optional, default to 1.0e-9)
theMinLen: float (optional, default to 1.0e-7)

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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theFirstParameter, const Standard_Real theLastParameter, const Standard_Real theAngularDeflection, const Standard_Real theCurvatureDeflection, const Standard_Integer theMinimumOfPoints = 2, const Standard_Real theUTol = 1.0e-9, const Standard_Real theMinLen = 1.0e-7);

		/****** GCPnts_TangentialDeflection::NbPoints ******/
		/****** md5 signature: e92014a2f157c195ed77b7745c7eae3f ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GCPnts_TangentialDeflection::Parameter ******/
		/****** md5 signature: ab2ee3538366e49e8a85b5df2a3326e9 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter(const Standard_Integer I);

		/****** GCPnts_TangentialDeflection::Value ******/
		/****** md5 signature: 5103bc5ccd682fa2223d60324c3863c5 ******/
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
		/****** md5 signature: 067c34c9d2c8769449e50d61b02e7f5b ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 0eb5f5a11094ce6bd3b46636cfc0f0d2 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: e3357fe7bf7c1f17214b690b4a50931b ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: b9d6d100e05d95af13a4f10cd1b4a3a0 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: dcc249075db75a8a30eec5756a74803d ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 4e52fdb748a3a0c4a321d10fe2d811d0 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 7cf2d5fda64d545a74dfb6676b73c92b ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::GCPnts_UniformAbscissa ******/
		/****** md5 signature: 3e022da984e879ec9bd91c909485d5b9 ******/
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		 GCPnts_UniformAbscissa(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Abscissa ******/
		/****** md5 signature: c89bcc85ff4523eefe5f7f8d1fd84247 ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the current abscissa, i.e. the distance between two consecutive points.
") Abscissa;
		Standard_Real Abscissa();

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: ff8ed44ea9e8cfca56786c72d93727e4 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 8b44b683fe0d6498b3497a9091ec2a9c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theAbscissa: float
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 6eca052b89a1db443ccc9f720a731ca8 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 6eeb18455b67ea7baed1e86dfe5be46e ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theNbPoints: int
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: d082dd0da5c8b7e9d016381b64adbe8a ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 5fed61a500498f1212f77bb22ba940f8 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theAbscissa: float
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theAbscissa, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: 745a95a2b151a47cf5b22071d4b33bdc ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::Initialize ******/
		/****** md5 signature: f19f9a0beef93e46dbd6b52969a74201 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theNbPoints: int
theU1: float
theU2: float
theToler: float (optional, default to -1)

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
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Integer theNbPoints, const Standard_Real theU1, const Standard_Real theU2, const Standard_Real theToler = -1);

		/****** GCPnts_UniformAbscissa::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GCPnts_UniformAbscissa::NbPoints ******/
		/****** md5 signature: e92014a2f157c195ed77b7745c7eae3f ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GCPnts_UniformAbscissa::Parameter ******/
		/****** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the computed Parameter of index <Index>.
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
		/****** md5 signature: 474b0144d7ee1af0847eba83fb74e324 ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theWithControl: bool (optional, default to Standard_True)

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
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: c3b66ef8894abe8e285c7908a277a990 ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theWithControl: bool (optional, default to Standard_True)

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
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: 467225835404cd4e0f4b8fd6d878c18c ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theWithControl: bool (optional, default to Standard_True)

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
		 GCPnts_UniformDeflection(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::GCPnts_UniformDeflection ******/
		/****** md5 signature: bba43a3bb954557da4c6c6ab78fc8468 ******/
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theWithControl: bool (optional, default to Standard_True)

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
		 GCPnts_UniformDeflection(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::Deflection ******/
		/****** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. This value is the one given to the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Deflection;
		Standard_Real Deflection();

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 7de03351085fb8daea53a5f412261592 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theWithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve and deflection.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 846a126a55a539a4287ae056e82c995c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theWithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initialize the algorithms with 2D curve and deflection.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: a64a6e461e094380d38a15977c86637a ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theDeflection: float
theU1: float
theU2: float
theWithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initialize the algorithms with 3D curve, deflection, parameter range.
") Initialize;
		void Initialize(const Adaptor3d_Curve & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 2d624d7604e4e23f6a84fe4515c62859 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theDeflection: float
theU1: float
theU2: float
theWithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initialize the algorithms with curve, deflection, parameter range. This and the above methods initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve theC, or - on the part of curve theC limited by the two parameter values theU1 and theU2, where the maximum distance between theC and the polygon that results from the points of the distribution is not greater than theDeflection. The first point of the distribution is either the origin of curve theC or the point of parameter theU1. The last point of the distribution is either the end point of curve theC or the point of parameter theU2. Intermediate points of the distribution are built using interpolations of segments of the curve limited at the 2nd degree. The construction ensures, in a first step, that the chordal deviation for this interpolation of the curve is less than or equal to theDeflection. However, it does not ensure that the chordal deviation for the curve itself is less than or equal to theDeflection. To do this a check is necessary, which may generate (second step) additional intermediate points. This check is time consuming, and can be avoided by setting theWithControl to false. Note that by default theWithControl is true and check is performed. Use the function IsDone to verify that the computation was successful, the function NbPoints() to obtain the number of points of the computed distribution, and the function Parameter to read the parameter of each point. //! Warning - theC is necessary, 'C2' continuous. This property is not checked at construction time. - The roles of theU1 and theU2 are inverted if theU1 > theU2. //! Warning theC is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & theC, const Standard_Real theDeflection, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theWithControl = Standard_True);

		/****** GCPnts_UniformDeflection::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GCPnts_UniformDeflection::NbPoints ******/
		/****** md5 signature: e92014a2f157c195ed77b7745c7eae3f ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the distribution computed by this algorithm. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GCPnts_UniformDeflection::Parameter ******/
		/****** md5 signature: 67620cfbe29369ea34fd1f8ac9835fb7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****** GCPnts_UniformDeflection::Value ******/
		/****** md5 signature: ae91500dcf1bb71f5f0b013f5ee88108 ******/
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
