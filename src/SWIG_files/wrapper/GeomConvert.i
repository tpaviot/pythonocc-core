/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOMCONVERTDOCSTRING
"GeomConvert module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomconvert.html"
%enddef
%module (package="OCC.Core", docstring=GEOMCONVERTDOCSTRING) GeomConvert


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
#include<GeomConvert_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TColGeom_module.hxx>
#include<TColStd_module.hxx>
#include<Convert_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<math_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2d_module.hxx>
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
%import Geom.i
%import TColGeom.i
%import TColStd.i
%import Convert.i
%import GeomAbs.i
%import Adaptor3d.i
%import TColgp.i
%import gp.i
%import math.i
%import Geom2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum GeomConvert_ConvType {
	GeomConvert_Target = 0,
	GeomConvert_Simplest = 1,
	GeomConvert_MinGap = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GeomConvert_ConvType(IntEnum):
	GeomConvert_Target = 0
	GeomConvert_Simplest = 1
	GeomConvert_MinGap = 2
GeomConvert_Target = GeomConvert_ConvType.GeomConvert_Target
GeomConvert_Simplest = GeomConvert_ConvType.GeomConvert_Simplest
GeomConvert_MinGap = GeomConvert_ConvType.GeomConvert_MinGap
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class GeomConvert *
********************/
%rename(geomconvert) GeomConvert;
class GeomConvert {
	public:
		/****** GeomConvert::C0BSplineToArrayOfC1BSplineCurve ******/
		/****** md5 signature: 41169b66757e4cfa5f15edbf27ab0bbd ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
tabBS: TColGeom_HArray1OfBSplineCurve
tolerance: float

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & tabBS, const Standard_Real tolerance);

		/****** GeomConvert::C0BSplineToArrayOfC1BSplineCurve ******/
		/****** md5 signature: 642848ca313fd2ca0214d071305bb2e0 ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
tabBS: TColGeom_HArray1OfBSplineCurve
AngularTolerance: float
tolerance: float

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance: it allows for the maximum deformation The Angular tolerance is in radians and measures the angle of the tangents on the left and on the right to decide if the curve is C1 or not at a given point.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & tabBS, const Standard_Real AngularTolerance, const Standard_Real tolerance);

		/****** GeomConvert::C0BSplineToC1BSplineCurve ******/
		/****** md5 signature: ef882946a5c095f1fb37b97f8bd44ee6 ******/
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
tolerance: float
AngularTolerance: float (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns a new BSpline which could still be C0. tolerance is a geometrical tolerance. The Angular toleranceis in radians and measures the angle of the tangents on the left and on the right to decide if the curve is G1 or not at a given point.
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve(opencascade::handle<Geom_BSplineCurve> & BS, const Standard_Real tolerance, const Standard_Real AngularTolerance = 1.0e-7);

		/****** GeomConvert::ConcatC1 ******/
		/****** md5 signature: 5d5e2e87942027f106ce8a17ab78a60f ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
ClosedTolerance: float

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****** GeomConvert::ConcatC1 ******/
		/****** md5 signature: 1d7403130766ba9faef1b3ec1f50931f ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
ClosedTolerance: float
AngularTolerance: float

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance, const Standard_Real AngularTolerance);

		/****** GeomConvert::ConcatG1 ******/
		/****** md5 signature: a560c18a6b8d480c03a201b4d9829dc3 ******/
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
ClosedTolerance: float

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates G1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatG1;
		static void ConcatG1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****** GeomConvert::CurveToBSplineCurve ******/
		/****** md5 signature: 3e5139193c14a02aa43c1594a7f95e33 ******/
		%feature("compactdefaultargs") CurveToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
This function converts a non infinite curve from Geom into a B-spline curve. C must be an ellipse or a circle or a trimmed conic or a trimmed line or a Bezier curve or a trimmed Bezier curve or a BSpline curve or a trimmed BSpline curve or an OffsetCurve. The returned B-spline is not periodic except if C is a Circle or an Ellipse. If the Parameterisation is QuasiAngular than the returned curve is NOT periodic in case a periodic Geom_Circle or Geom_Ellipse. For TgtThetaOver2_1 and TgtThetaOver2_2 the method raises an exception in case of a periodic Geom_Circle or a Geom_Ellipse ParameterisationType applies only if the curve is a Circle or an ellipse: TgtThetaOver2, -- TgtThetaOver2_1, -- TgtThetaOver2_2, -- TgtThetaOver2_3, -- TgtThetaOver2_4, //! Purpose: this is the classical rational parameterisation 2 1 - t cos(theta) = ------ 2 1 + t //! 2t sin(theta) = ------ 2 1 + t //! t = tan (theta/2) //! with TgtThetaOver2 the routine will compute the number of spans using the rule num_spans = [ (ULast - UFirst) / 1.2 ] + 1 with TgtThetaOver2_N, N spans will be forced: an error will be raized if (ULast - UFirst) >= PI and N = 1, ULast - UFirst >= 2 PI and N = 2 //! QuasiAngular, here t is a rational function that approximates theta ----> tan(theta/2). Nevetheless the composing with above function yields exact functions whose square sum up to 1 RationalC1 ; t is replaced by a polynomial function of u so as to grant C1 contiuity across knots. Exceptions Standard_DomainError: - if the curve C is infinite, or - if C is a (complete) circle or ellipse, and Parameterisation is equal to Convert_TgtThetaOver2_1 or Convert_TgtThetaOver2_2. Standard_ConstructionError: - if C is a (complete) circle or ellipse, and if Parameterisation is not equal to Convert_TgtThetaOver2, Convert_RationalC1, Convert_QuasiAngular (the curve is converted in these three cases) or to Convert_TgtThetaOver2_1 or Convert_TgtThetaOver2_2 (another exception is raised in these two cases). - if C is a trimmed circle or ellipse, if Parameterisation is equal to Convert_TgtThetaOver2_1 and if U2 - U1 > 0.9999 * Pi, where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a half-circle or a half-ellipse, for example), or - if C is a trimmed circle or ellipse, if Parameterisation is equal to Convert_TgtThetaOver2_2 and U2 - U1 > 1.9999 * Pi where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a quasi-complete circle or ellipse).
") CurveToBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> CurveToBSplineCurve(const opencascade::handle<Geom_Curve> & C, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** GeomConvert::SplitBSplineCurve ******/
		/****** md5 signature: 7d474a7726cb1a7f866678edbe4872d6 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_BSplineCurve
FromK1: int
ToK2: int
SameOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Convert a curve from Geom by an approximation method //! This method computes the arc of B-spline curve between the two knots FromK1 and ToK2. If C is periodic the arc has the same orientation as C if SameOrientation = Standard_True. If C is not periodic SameOrientation is not used for the computation and C is oriented from the knot fromK1 to the knot toK2. We just keep the local definition of C between the knots FromK1 and ToK2. The returned B-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of C. The indexes of the knots FromK1 and ToK2 doesn't include the repetition of multiple knots in their definition. Raised if FromK1 = ToK2 Raised if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex].
") SplitBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & C, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Boolean SameOrientation = Standard_True);

		/****** GeomConvert::SplitBSplineCurve ******/
		/****** md5 signature: 2adc95e91201b6735cd34c28f58db352 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_BSplineCurve
FromU1: float
ToU2: float
ParametricTolerance: float
SameOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
This function computes the segment of B-spline curve between the parametric values FromU1, ToU2. If C is periodic the arc has the same orientation as C if SameOrientation = True. If C is not periodic SameOrientation is not used for the computation and C is oriented fromU1 toU2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 are out of the parametric bounds of the curve (The tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance Raised if ParametricTolerance < Resolution from gp.
") SplitBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & C, const Standard_Real FromU1, const Standard_Real ToU2, const Standard_Real ParametricTolerance, const Standard_Boolean SameOrientation = Standard_True);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: 0153ae151f4a629c855fafb7b085968c ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
SameUOrientation: bool (optional, default to Standard_True)
SameVOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Computes the B-spline surface patche between the knots values FromUK1, ToUK2, FromVK1, ToVK2. If S is periodic in one direction the patche has the same orientation as S in this direction if the flag is true in this direction (SameUOrientation, SameVOrientation). If S is not periodic SameUOrientation and SameVOrientation are not used for the computation and S is oriented FromUK1 ToUK2 and FromVK1 ToVK2. Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2 FromUK1 or ToUK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] FromVK1 or ToVK2 are out of the bounds [FirstVKnotIndex, LastVKnotIndex].
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, const Standard_Boolean SameUOrientation = Standard_True, const Standard_Boolean SameVOrientation = Standard_True);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: cfec6fffb32edadb3a13e059445aaa86 ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromK1: int
ToK2: int
USplit: bool
SameOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This method splits a B-spline surface patche between the knots values FromK1, ToK2 in one direction. If USplit = True then the splitting direction is the U parametric direction else it is the V parametric direction. If S is periodic in the considered direction the patche has the same orientation as S in this direction if SameOrientation is True If S is not periodic in this direction SameOrientation is not used for the computation and S is oriented FromK1 ToK2. Raised if FromK1 = ToK2 or if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] in the considered parametric direction.
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Boolean USplit, const Standard_Boolean SameOrientation = Standard_True);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: f1e357d5052b4bf97bf93e496a913147 ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromU1: float
ToU2: float
FromV1: float
ToV2: float
ParametricTolerance: float
SameUOrientation: bool (optional, default to Standard_True)
SameVOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This method computes the B-spline surface patche between the parametric values FromU1, ToU2, FromV1, ToV2. If S is periodic in one direction the patche has the same orientation as S in this direction if the flag is True in this direction (SameUOrientation, SameVOrientation). If S is not periodic SameUOrientation and SameVOrientation are not used for the computation and S is oriented FromU1 ToU2 and FromV1 ToV2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 or FromV1 or ToU2 are out of the parametric bounds of the surface (the tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance or Abs (FromV1 - ToV2) <= ParametricTolerance. Raised if ParametricTolerance < Resolution.
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Real FromU1, const Standard_Real ToU2, const Standard_Real FromV1, const Standard_Real ToV2, const Standard_Real ParametricTolerance, const Standard_Boolean SameUOrientation = Standard_True, const Standard_Boolean SameVOrientation = Standard_True);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: 6f9b9adbfd5c02b1dfe09346c297f805 ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromParam1: float
ToParam2: float
USplit: bool
ParametricTolerance: float
SameOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This method splits the B-spline surface S in one direction between the parametric values FromParam1, ToParam2. If USplit = True then the Splitting direction is the U parametric direction else it is the V parametric direction. If S is periodic in the considered direction the patche has the same orientation as S in this direction if SameOrientation is true. If S is not periodic in the considered direction SameOrientation is not used for the computation and S is oriented FromParam1 ToParam2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raises if FromParam1 or ToParam2 are out of the parametric bounds of the surface in the considered direction. Raises if Abs (FromParam1 - ToParam2) <= ParametricTolerance.
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Real FromParam1, const Standard_Real ToParam2, const Standard_Boolean USplit, const Standard_Real ParametricTolerance, const Standard_Boolean SameOrientation = Standard_True);

		/****** GeomConvert::SurfaceToBSplineSurface ******/
		/****** md5 signature: 3108125370fbb69736fb4c9452599391 ******/
		%feature("compactdefaultargs") SurfaceToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This algorithm converts a non infinite surface from Geom into a B-spline surface. S must be a trimmed plane or a trimmed cylinder or a trimmed cone or a trimmed sphere or a trimmed torus or a sphere or a torus or a Bezier surface of a trimmed Bezier surface or a trimmed swept surface with a corresponding basis curve which can be turned into a B-spline curve (see the method CurveToBSplineCurve). Raises DomainError if the type of the surface is not previously defined.
") SurfaceToBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SurfaceToBSplineSurface(const opencascade::handle<Geom_Surface> & S);

};


%extend GeomConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomConvert_ApproxCurve *
********************************/
class GeomConvert_ApproxCurve {
	public:
		/****** GeomConvert_ApproxCurve::GeomConvert_ApproxCurve ******/
		/****** md5 signature: 4a6711b694deda6cc7bbaf24ce219e32 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Tol3d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
None

Description
-----------
Constructs a curve approximation framework defined by - - the conic Curve, - the tolerance value Tol3d, - the degree of continuity Order, - the maximum number of segments MaxSegments allowed in the resulting BSpline curve, and - the highest degree MaxDeg which the polynomial defining the BSpline curve may have.
") GeomConvert_ApproxCurve;
		 GeomConvert_ApproxCurve(const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Tol3d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** GeomConvert_ApproxCurve::GeomConvert_ApproxCurve ******/
		/****** md5 signature: 07ff5ce50e6da2c21caae83805537027 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Tol3d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
None

Description
-----------
Constructs a curve approximation framework defined by - - the Curve, - the tolerance value Tol3d, - the degree of continuity Order, - the maximum number of segments MaxSegments allowed in the resulting BSpline curve, and - the highest degree MaxDeg which the polynomial defining the BSpline curve may have.
") GeomConvert_ApproxCurve;
		 GeomConvert_ApproxCurve(const opencascade::handle<Adaptor3d_Curve> & Curve, const Standard_Real Tol3d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** GeomConvert_ApproxCurve::Curve ******/
		/****** md5 signature: 8f61eb8bebb31bbd1fd75a7da450accd ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Returns the BSpline curve resulting from the approximation algorithm.
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();

		/****** GeomConvert_ApproxCurve::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Print on the stream o information about the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** GeomConvert_ApproxCurve::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance.
") HasResult;
		Standard_Boolean HasResult();

		/****** GeomConvert_ApproxCurve::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns Standard_True if the approximation has been done within required tolerance.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomConvert_ApproxCurve::MaxError ******/
		/****** md5 signature: 90f2419f0b1537a77da84305579339a2 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the greatest distance between a point on the source conic and the BSpline curve resulting from the approximation. (>0 when an approximation has been done, 0 if no approximation).
") MaxError;
		Standard_Real MaxError();

};


%extend GeomConvert_ApproxCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomConvert_ApproxSurface *
**********************************/
class GeomConvert_ApproxSurface {
	public:
		/****** GeomConvert_ApproxSurface::GeomConvert_ApproxSurface ******/
		/****** md5 signature: ec8c2f80fedc48543f7557ba90584058 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Geom_Surface
Tol3d: float
UContinuity: GeomAbs_Shape
VContinuity: GeomAbs_Shape
MaxDegU: int
MaxDegV: int
MaxSegments: int
PrecisCode: int

Return
-------
None

Description
-----------
Constructs a surface approximation framework defined by - the conic Surf - the tolerance value Tol3d - the degree of continuity UContinuity, VContinuity in the directions of the U and V parameters - the highest degree MaxDegU, MaxDegV which the polynomial defining the BSpline curve may have in the directions of the U and V parameters - the maximum number of segments MaxSegments allowed in the resulting BSpline curve - the index of precision PrecisCode.
") GeomConvert_ApproxSurface;
		 GeomConvert_ApproxSurface(const opencascade::handle<Geom_Surface> & Surf, const Standard_Real Tol3d, const GeomAbs_Shape UContinuity, const GeomAbs_Shape VContinuity, const Standard_Integer MaxDegU, const Standard_Integer MaxDegV, const Standard_Integer MaxSegments, const Standard_Integer PrecisCode);

		/****** GeomConvert_ApproxSurface::GeomConvert_ApproxSurface ******/
		/****** md5 signature: d94294b366a492bb4f771c6129ee0101 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Tol3d: float
UContinuity: GeomAbs_Shape
VContinuity: GeomAbs_Shape
MaxDegU: int
MaxDegV: int
MaxSegments: int
PrecisCode: int

Return
-------
None

Description
-----------
Constructs a surface approximation framework defined by - the Surf - the tolerance value Tol3d - the degree of continuity UContinuity, VContinuity in the directions of the U and V parameters - the highest degree MaxDegU, MaxDegV which the polynomial defining the BSpline curve may have in the directions of the U and V parameters - the maximum number of segments MaxSegments allowed in the resulting BSpline curve - the index of precision PrecisCode.
") GeomConvert_ApproxSurface;
		 GeomConvert_ApproxSurface(const opencascade::handle<Adaptor3d_Surface> & Surf, const Standard_Real Tol3d, const GeomAbs_Shape UContinuity, const GeomAbs_Shape VContinuity, const Standard_Integer MaxDegU, const Standard_Integer MaxDegV, const Standard_Integer MaxSegments, const Standard_Integer PrecisCode);

		/****** GeomConvert_ApproxSurface::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** GeomConvert_ApproxSurface::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the approximation did come out with a result that is not NECESSARILY within the required tolerance or a result that is not recognized with the wished continuities.
") HasResult;
		Standard_Boolean HasResult();

		/****** GeomConvert_ApproxSurface::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if the approximation has be done.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomConvert_ApproxSurface::MaxError ******/
		/****** md5 signature: 90f2419f0b1537a77da84305579339a2 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the greatest distance between a point on the source conic surface and the BSpline surface resulting from the approximation (>0 when an approximation has been done, 0 if no approximation ).
") MaxError;
		Standard_Real MaxError();

		/****** GeomConvert_ApproxSurface::Surface ******/
		/****** md5 signature: 2f50ef783efd4092d3a11c39580e031f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the BSpline surface resulting from the approximation algorithm.
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface();

};


%extend GeomConvert_ApproxSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomConvert_BSplineCurveKnotSplitting *
**********************************************/
class GeomConvert_BSplineCurveKnotSplitting {
	public:
		/****** GeomConvert_BSplineCurveKnotSplitting::GeomConvert_BSplineCurveKnotSplitting ******/
		/****** md5 signature: 7a577457113d6d98bc191e491add8706 ******/
		%feature("compactdefaultargs") GeomConvert_BSplineCurveKnotSplitting;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom_BSplineCurve
ContinuityRange: int

Return
-------
None

Description
-----------
Determines points at which the BSpline curve BasisCurve should be split in order to obtain arcs with a degree of continuity equal to ContinuityRange. These points are knot values of BasisCurve. They are identified by indices in the knots table of BasisCurve. Use the available interrogation functions to access computed values, followed by the global function SplitBSplineCurve (provided by the package GeomConvert) to split the curve. Exceptions Standard_RangeError if ContinuityRange is less than zero.
") GeomConvert_BSplineCurveKnotSplitting;
		 GeomConvert_BSplineCurveKnotSplitting(const opencascade::handle<Geom_BSplineCurve> & BasisCurve, const Standard_Integer ContinuityRange);

		/****** GeomConvert_BSplineCurveKnotSplitting::NbSplits ******/
		/****** md5 signature: 4531d20d48cc2f1c4ba8fba36f455258 ******/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points at which the analyzed BSpline curve should be split, in order to obtain arcs with the continuity required by this framework. All these points correspond to knot values. Note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.
") NbSplits;
		Standard_Integer NbSplits();

		/****** GeomConvert_BSplineCurveKnotSplitting::SplitValue ******/
		/****** md5 signature: 721f3b88e9b98541767484bae1df7e27 ******/
		%feature("compactdefaultargs") SplitValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
Returns the split knot of index Index to the split knots table computed in this framework. The returned value is an index in the knots table of the BSpline curve analyzed by this algorithm. Notes: - If Index is equal to 1, the corresponding knot gives the first point of the curve. - If Index is equal to the number of split knots computed in this framework, the corresponding point is the last point of the curve. Exceptions Standard_RangeError if Index is less than 1 or greater than the number of split knots computed in this framework.
") SplitValue;
		Standard_Integer SplitValue(const Standard_Integer Index);

		/****** GeomConvert_BSplineCurveKnotSplitting::Splitting ******/
		/****** md5 signature: 735443fa5e885793b9df881715b055c2 ******/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "
Parameters
----------
SplitValues: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Loads the SplitValues table with the split knots values computed in this framework. Each value in the table is an index in the knots table of the BSpline curve analyzed by this algorithm. The values in SplitValues are given in ascending order and comprise the indices of the knots which give the first and last points of the curve. Use two consecutive values from the table as arguments of the global function SplitBSplineCurve (provided by the package GeomConvert) to split the curve. Exceptions Standard_DimensionError if the array SplitValues was not created with the following bounds: - 1, and - the number of split points computed in this framework (as given by the function NbSplits).
") Splitting;
		void Splitting(TColStd_Array1OfInteger & SplitValues);

};


%extend GeomConvert_BSplineCurveKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomConvert_BSplineCurveToBezierCurve *
**********************************************/
class GeomConvert_BSplineCurveToBezierCurve {
	public:
		/****** GeomConvert_BSplineCurveToBezierCurve::GeomConvert_BSplineCurveToBezierCurve ******/
		/****** md5 signature: 02d7a7510002481ab96243add745d673 ******/
		%feature("compactdefaultargs") GeomConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom_BSplineCurve

Return
-------
None

Description
-----------
Computes all the data needed to convert the BSpline curve BasisCurve into a series of adjacent Bezier arcs.
") GeomConvert_BSplineCurveToBezierCurve;
		 GeomConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom_BSplineCurve> & BasisCurve);

		/****** GeomConvert_BSplineCurveToBezierCurve::GeomConvert_BSplineCurveToBezierCurve ******/
		/****** md5 signature: dcc3b5187228ccadbb5f087b5a9ab184 ******/
		%feature("compactdefaultargs") GeomConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom_BSplineCurve
U1: float
U2: float
ParametricTolerance: float

Return
-------
None

Description
-----------
Computes all the data needed to convert the portion of the BSpline curve BasisCurve limited by the two parameter values U1 and U2 into a series of adjacent Bezier arcs. The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 are out of the parametric bounds of the basis curve [FirstParameter, LastParameter]. The Tolerance criterion is ParametricTolerance. Raised if Abs (U2 - U1) <= ParametricTolerance.
") GeomConvert_BSplineCurveToBezierCurve;
		 GeomConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom_BSplineCurve> & BasisCurve, const Standard_Real U1, const Standard_Real U2, const Standard_Real ParametricTolerance);

		/****** GeomConvert_BSplineCurveToBezierCurve::Arc ******/
		/****** md5 signature: 95759e24d4243410fb6f5ba187be6019 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
Constructs and returns the Bezier curve of index Index to the table of adjacent Bezier arcs computed by this algorithm. This Bezier curve has the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_OutOfRange if Index is less than 1 or greater than the number of adjacent Bezier arcs computed by this algorithm.
") Arc;
		opencascade::handle<Geom_BezierCurve> Arc(const Standard_Integer Index);

		/****** GeomConvert_BSplineCurveToBezierCurve::Arcs ******/
		/****** md5 signature: a5f791af1537635bcd5a0666a4d6f74a ******/
		%feature("compactdefaultargs") Arcs;
		%feature("autodoc", "
Parameters
----------
Curves: TColGeom_Array1OfBezierCurve

Return
-------
None

Description
-----------
Constructs all the Bezier curves whose data is computed by this algorithm and loads these curves into the Curves table. The Bezier curves have the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_DimensionError if the Curves array was not created with the following bounds: - 1 , and - the number of adjacent Bezier arcs computed by this algorithm (as given by the function NbArcs).
") Arcs;
		void Arcs(TColGeom_Array1OfBezierCurve & Curves);

		/****** GeomConvert_BSplineCurveToBezierCurve::Knots ******/
		/****** md5 signature: 4ce44c7a3fc1e54d65161ad10947be07 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
This methode returns the bspline's knots associated to the converted arcs Raised if the length of Curves is not equal to NbArcs + 1.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomConvert_BSplineCurveToBezierCurve::NbArcs ******/
		/****** md5 signature: 5ed9ffd03d9f325b6e3f5ea37278c31f ******/
		%feature("compactdefaultargs") NbArcs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of BezierCurve arcs. If at the creation time you have decomposed the basis curve between the parametric values UFirst, ULast the number of BezierCurve arcs depends on the number of knots included inside the interval [UFirst, ULast]. If you have decomposed the whole basis B-spline curve the number of BezierCurve arcs NbArcs is equal to the number of knots less one.
") NbArcs;
		Standard_Integer NbArcs();

};


%extend GeomConvert_BSplineCurveToBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class GeomConvert_BSplineSurfaceKnotSplitting *
************************************************/
class GeomConvert_BSplineSurfaceKnotSplitting {
	public:
		/****** GeomConvert_BSplineSurfaceKnotSplitting::GeomConvert_BSplineSurfaceKnotSplitting ******/
		/****** md5 signature: 4f7bf866b0b663536743786ab6c49a35 ******/
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceKnotSplitting;
		%feature("autodoc", "
Parameters
----------
BasisSurface: Geom_BSplineSurface
UContinuityRange: int
VContinuityRange: int

Return
-------
None

Description
-----------
Determines the u- and v-isoparametric curves along which the BSpline surface BasisSurface should be split in order to obtain patches with a degree of continuity equal to UContinuityRange in the u parametric direction, and to VContinuityRange in the v parametric direction. These isoparametric curves are defined by parameters, which are BasisSurface knot values in the u or v parametric direction. They are identified by indices in the BasisSurface knots table in the corresponding parametric direction. Use the available interrogation functions to access computed values, followed by the global function SplitBSplineSurface (provided by the package GeomConvert) to split the surface. Exceptions Standard_RangeError if UContinuityRange or VContinuityRange is less than zero.
") GeomConvert_BSplineSurfaceKnotSplitting;
		 GeomConvert_BSplineSurfaceKnotSplitting(const opencascade::handle<Geom_BSplineSurface> & BasisSurface, const Standard_Integer UContinuityRange, const Standard_Integer VContinuityRange);

		/****** GeomConvert_BSplineSurfaceKnotSplitting::NbUSplits ******/
		/****** md5 signature: f38f51a3829bd17423f80563dd69fc89 ******/
		%feature("compactdefaultargs") NbUSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of u-isoparametric curves along which the analysed BSpline surface should be split in order to obtain patches with the continuity required by this framework. The parameters which define these curves are knot values in the corresponding parametric direction. Note that the four curves which bound the surface are counted among these splitting curves.
") NbUSplits;
		Standard_Integer NbUSplits();

		/****** GeomConvert_BSplineSurfaceKnotSplitting::NbVSplits ******/
		/****** md5 signature: dec024b23940401d121c0104e585c1c2 ******/
		%feature("compactdefaultargs") NbVSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of v-isoparametric curves along which the analysed BSpline surface should be split in order to obtain patches with the continuity required by this framework. The parameters which define these curves are knot values in the corresponding parametric direction. Note that the four curves which bound the surface are counted among these splitting curves.
") NbVSplits;
		Standard_Integer NbVSplits();

		/****** GeomConvert_BSplineSurfaceKnotSplitting::Splitting ******/
		/****** md5 signature: dc3f95db858c5376c9dc451aed4bd8fb ******/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "
Parameters
----------
USplit: TColStd_Array1OfInteger
VSplit: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Loads the USplit and VSplit tables with the split knots values computed in this framework. Each value in these tables is an index in the knots table corresponding to the u or v parametric direction of the BSpline surface analysed by this algorithm. The USplit and VSplit values are given in ascending order and comprise the indices of the knots which give the first and last isoparametric curves of the surface in the corresponding parametric direction. Use two consecutive values from the USplit table and two consecutive values from the VSplit table as arguments of the global function SplitBSplineSurface (provided by the package GeomConvert) to split the surface. Exceptions Standard_DimensionError if: - the array USplit was not created with the following bounds: - 1 , and - the number of split knots in the u parametric direction computed in this framework (as given by the function NbUSplits); or - the array VSplit was not created with the following bounds: - 1 , and - the number of split knots in the v parametric direction computed in this framework (as given by the function NbVSplits).
") Splitting;
		void Splitting(TColStd_Array1OfInteger & USplit, TColStd_Array1OfInteger & VSplit);

		/****** GeomConvert_BSplineSurfaceKnotSplitting::USplitValue ******/
		/****** md5 signature: 17cc2a94fd1c12d63fe91fb3ee2162e2 ******/
		%feature("compactdefaultargs") USplitValue;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
int

Description
-----------
Returns the split knot of index UIndex to the split knots table for the u parametric direction computed in this framework. The returned value is an index in the knots table relative to the u parametric direction of the BSpline surface analysed by this algorithm. Note: If UIndex is equal to 1, or to the number of split knots for the u parametric direction computed in this framework, the corresponding knot gives the parameter of one of the bounding curves of the surface. Exceptions Standard_RangeError if UIndex is less than 1 or greater than the number of split knots for the u parametric direction computed in this framework.
") USplitValue;
		Standard_Integer USplitValue(const Standard_Integer UIndex);

		/****** GeomConvert_BSplineSurfaceKnotSplitting::VSplitValue ******/
		/****** md5 signature: f659a94c69e2fc5ded0fb9374d02b0a6 ******/
		%feature("compactdefaultargs") VSplitValue;
		%feature("autodoc", "
Parameters
----------
VIndex: int

Return
-------
int

Description
-----------
Returns the split knot of index VIndex to the split knots table for the v parametric direction computed in this framework. The returned value is an index in the knots table relative to the v parametric direction of the BSpline surface analysed by this algorithm. Note: If UIndex is equal to 1, or to the number of split knots for the v parametric direction computed in this framework, the corresponding knot gives the parameter of one of the bounding curves of the surface. Exceptions Standard_RangeError if VIndex is less than 1 or greater than the number of split knots for the v parametric direction computed in this framework.
") VSplitValue;
		Standard_Integer VSplitValue(const Standard_Integer VIndex);

};


%extend GeomConvert_BSplineSurfaceKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class GeomConvert_BSplineSurfaceToBezierSurface *
**************************************************/
class GeomConvert_BSplineSurfaceToBezierSurface {
	public:
		/****** GeomConvert_BSplineSurfaceToBezierSurface::GeomConvert_BSplineSurfaceToBezierSurface ******/
		/****** md5 signature: 1183db9a4452c7fc68809ed7924171c9 ******/
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceToBezierSurface;
		%feature("autodoc", "
Parameters
----------
BasisSurface: Geom_BSplineSurface

Return
-------
None

Description
-----------
Computes all the data needed to convert - the BSpline surface BasisSurface into a series of adjacent Bezier surfaces. The result consists of a grid of BasisSurface patches limited by isoparametric curves corresponding to knot values, both in the u and v parametric directions of the surface. A row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves. A column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves. Use the available interrogation functions to ascertain the number of computed Bezier patches, and then to construct each individual Bezier surface (or all Bezier surfaces). Note: ParametricTolerance is not used.
") GeomConvert_BSplineSurfaceToBezierSurface;
		 GeomConvert_BSplineSurfaceToBezierSurface(const opencascade::handle<Geom_BSplineSurface> & BasisSurface);

		/****** GeomConvert_BSplineSurfaceToBezierSurface::GeomConvert_BSplineSurfaceToBezierSurface ******/
		/****** md5 signature: 6c70a4683a2a0dbdb1df7d8f55283cae ******/
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceToBezierSurface;
		%feature("autodoc", "
Parameters
----------
BasisSurface: Geom_BSplineSurface
U1: float
U2: float
V1: float
V2: float
ParametricTolerance: float

Return
-------
None

Description
-----------
Computes all the data needed to convert the patch of the BSpline surface BasisSurface limited by the two parameter values U1 and U2 in the u parametric direction, and by the two parameter values V1 and V2 in the v parametric direction, into a series of adjacent Bezier surfaces. The result consists of a grid of BasisSurface patches limited by isoparametric curves corresponding to knot values, both in the u and v parametric directions of the surface. A row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves. A column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves. Use the available interrogation functions to ascertain the number of computed Bezier patches, and then to construct each individual Bezier surface (or all Bezier surfaces). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 or V1 or V2 are out of the parametric bounds of the basis surface [FirstUKnotIndex, LastUKnotIndex] , [FirstVKnotIndex, LastVKnotIndex] The tolerance criterion is ParametricTolerance. Raised if U2 - U1 <= ParametricTolerance or V2 - V1 <= ParametricTolerance.
") GeomConvert_BSplineSurfaceToBezierSurface;
		 GeomConvert_BSplineSurfaceToBezierSurface(const opencascade::handle<Geom_BSplineSurface> & BasisSurface, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real ParametricTolerance);

		/****** GeomConvert_BSplineSurfaceToBezierSurface::NbUPatches ******/
		/****** md5 signature: 6b0ad1d8cd917ddafd65ec74fe6e89da ******/
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Bezier surfaces in the U direction. If at the creation time you have decomposed the basis Surface between the parametric values UFirst, ULast the number of Bezier surfaces in the U direction depends on the number of knots included inside the interval [UFirst, ULast]. If you have decomposed the whole basis B-spline surface the number of Bezier surfaces NbUPatches is equal to the number of UKnots less one.
") NbUPatches;
		Standard_Integer NbUPatches();

		/****** GeomConvert_BSplineSurfaceToBezierSurface::NbVPatches ******/
		/****** md5 signature: 90a9eb7fe715a81477e403cf8ccff1b9 ******/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Bezier surfaces in the V direction. If at the creation time you have decomposed the basis surface between the parametric values VFirst, VLast the number of Bezier surfaces in the V direction depends on the number of knots included inside the interval [VFirst, VLast]. If you have decomposed the whole basis B-spline surface the number of Bezier surfaces NbVPatches is equal to the number of VKnots less one.
") NbVPatches;
		Standard_Integer NbVPatches();

		/****** GeomConvert_BSplineSurfaceToBezierSurface::Patch ******/
		/****** md5 signature: 9a3b705348fea48bacf1c9a8e270b260 ******/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
Constructs and returns the Bezier surface of indices (UIndex, VIndex) to the patch grid computed on the BSpline surface analyzed by this algorithm. This Bezier surface has the same orientation as the BSpline surface analyzed in this framework. UIndex is an index common to a row in the patch grid. A row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves of the surface. VIndex is an index common to a column in the patch grid. A column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves of the surface. Exceptions Standard_OutOfRange if: - UIndex is less than 1 or greater than the number of rows in the patch grid computed on the BSpline surface analyzed by this algorithm (as returned by the function NbUPatches); or if - VIndex is less than 1 or greater than the number of columns in the patch grid computed on the BSpline surface analyzed by this algorithm (as returned by the function NbVPatches).
") Patch;
		opencascade::handle<Geom_BezierSurface> Patch(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****** GeomConvert_BSplineSurfaceToBezierSurface::Patches ******/
		/****** md5 signature: 908402b15b885f6ee3f80d400a6e9b14 ******/
		%feature("compactdefaultargs") Patches;
		%feature("autodoc", "
Parameters
----------
Surfaces: TColGeom_Array2OfBezierSurface

Return
-------
None

Description
-----------
Constructs all the Bezier surfaces whose data is computed by this algorithm, and loads them into the Surfaces table. These Bezier surfaces have the same orientation as the BSpline surface analyzed in this framework. The Surfaces array is organised in the same way as the patch grid computed on the BSpline surface analyzed by this algorithm. A row in the array corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves of the surface. A column in the array corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves of the surface. Exceptions Standard_DimensionError if the Surfaces array was not created with the following bounds: - 1, and the number of adjacent patch series in the u parametric direction of the patch grid computed on the BSpline surface, analyzed by this algorithm (as given by the function NbUPatches) as row bounds, - 1, and the number of adjacent patch series in the v parametric direction of the patch grid computed on the BSpline surface, analyzed by this algorithm (as given by the function NbVPatches) as column bounds.
") Patches;
		void Patches(TColGeom_Array2OfBezierSurface & Surfaces);

		/****** GeomConvert_BSplineSurfaceToBezierSurface::UKnots ******/
		/****** md5 signature: a1b7c3a34769a964c3e6f254c8352af4 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
This methode returns the bspline's u-knots associated to the converted Patches Raised if the length of Curves is not equal to NbUPatches + 1.
") UKnots;
		void UKnots(TColStd_Array1OfReal & TKnots);

		/****** GeomConvert_BSplineSurfaceToBezierSurface::VKnots ******/
		/****** md5 signature: 8977b325b44f44fd45a8ff69d707de23 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
This methode returns the bspline's v-knots associated to the converted Patches Raised if the length of Curves is not equal to NbVPatches + 1.
") VKnots;
		void VKnots(TColStd_Array1OfReal & TKnots);

};


%extend GeomConvert_BSplineSurfaceToBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class GeomConvert_CompBezierSurfacesToBSplineSurface *
*******************************************************/
class GeomConvert_CompBezierSurfacesToBSplineSurface {
	public:
		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::GeomConvert_CompBezierSurfacesToBSplineSurface ******/
		/****** md5 signature: d7d868206c90d8ef14dd941018c8d112 ******/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Beziers: TColGeom_Array2OfBezierSurface

Return
-------
None

Description
-----------
Computes all the data needed to build a 'C0' continuous BSpline surface equivalent to the grid of adjacent non-rational Bezier surfaces Beziers. Each surface in the Beziers grid becomes a natural patch, limited by knots values, on the BSpline surface whose data is computed. Surfaces in the grid must satisfy the following conditions: - Coincident bounding curves between two consecutive surfaces in a row of the Beziers grid must be u-isoparametric bounding curves of these two surfaces. - Coincident bounding curves between two consecutive surfaces in a column of the Beziers grid must be v-isoparametric bounding curves of these two surfaces. The BSpline surface whose data is computed has the following characteristics: - Its degree in the u (respectively v) parametric direction is equal to that of the Bezier surface which has the highest degree in the u (respectively v) parametric direction in the Beziers grid. - It is a 'Piecewise Bezier' in both u and v parametric directions, i.e.: - the knots are regularly spaced in each parametric direction (i.e. the difference between two consecutive knots is a constant), and - all the multiplicities of the surface knots in a given parametric direction are equal to Degree, which is the degree of the BSpline surface in this parametric direction, except for the first and last knots for which the multiplicity is equal to Degree + 1. - Coincident bounding curves between two consecutive columns of Bezier surfaces in the Beziers grid become u-isoparametric curves, corresponding to knots values of the BSpline surface. - Coincident bounding curves between two consecutive rows of Bezier surfaces in the Beziers grid become v-isoparametric curves corresponding to knots values of the BSpline surface. Use the available consultation functions to access the computed data. This data may be used to construct the BSpline surface. Warning The surfaces in the Beziers grid must be adjacent, i.e. two consecutive Bezier surfaces in the grid (in a row or column) must have a coincident bounding curve. In addition, the location of the parameterization on each of these surfaces (i.e. the relative location of u and v isoparametric curves on the surface) is of importance with regard to the positioning of the surfaces in the Beziers grid. Care must be taken with respect to the above, as these properties are not checked and an error may occur if they are not satisfied. Exceptions Standard_NotImplemented if one of the Bezier surfaces of the Beziers grid is rational.
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers);

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::GeomConvert_CompBezierSurfacesToBSplineSurface ******/
		/****** md5 signature: e7dce0cc47287d475aec5981c18bd406 ******/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Beziers: TColGeom_Array2OfBezierSurface
Tolerance: float
RemoveKnots: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Build an Ci uniform (Rational) BSpline surface The highest Continuity Ci is imposed, like the maximal deformation is lower than <Tolerance>. Warning: The Continuity C0 is imposed without any check.
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers, const Standard_Real Tolerance, const Standard_Boolean RemoveKnots = Standard_True);

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::GeomConvert_CompBezierSurfacesToBSplineSurface ******/
		/****** md5 signature: 9023f479b9dd7990ab8b434e132ab54b ******/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Beziers: TColGeom_Array2OfBezierSurface
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UContinuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
VContinuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
Tolerance: float (optional, default to 1.0e-4)

Return
-------
None

Description
-----------
Computes all the data needed to construct a BSpline surface equivalent to the adjacent non-rational Bezier surfaces Beziers grid. Each surface in the Beziers grid becomes a natural patch, limited by knots values, on the BSpline surface whose data is computed. Surfaces in the grid must satisfy the following conditions: - Coincident bounding curves between two consecutive surfaces in a row of the Beziers grid must be u-isoparametric bounding curves of these two surfaces. - Coincident bounding curves between two consecutive surfaces in a column of the Beziers grid must be v-isoparametric bounding curves of these two surfaces. The BSpline surface whose data is computed has the following characteristics: - Its degree in the u (respectively v) parametric direction is equal to that of the Bezier surface which has the highest degree in the u (respectively v) parametric direction in the Beziers grid. - Coincident bounding curves between two consecutive columns of Bezier surfaces in the Beziers grid become u-isoparametric curves corresponding to knots values of the BSpline surface. - Coincident bounding curves between two consecutive rows of Bezier surfaces in the Beziers grid become v-isoparametric curves corresponding to knots values of the BSpline surface. Knots values of the BSpline surface are given in the two tables: - UKnots for the u parametric direction (which corresponds to the order of Bezier surface columns in the Beziers grid), and - VKnots for the v parametric direction (which corresponds to the order of Bezier surface rows in the Beziers grid). The dimensions of UKnots (respectively VKnots) must be equal to the number of columns (respectively, rows) of the Beziers grid, plus 1 . UContinuity and VContinuity, which are both defaulted to GeomAbs_C0, specify the required continuity on the BSpline surface. If the required degree of continuity is greater than 0 in a given parametric direction, a deformation is applied locally on the initial surface (as defined by the Beziers grid) to satisfy this condition. This local deformation is not applied however, if it is greater than Tolerance (defaulted to 1.0 e-7). In such cases, the continuity condition is not satisfied, and the function IsDone will return false. A small tolerance value prevents any modification of the surface and a large tolerance value 'smoothes' the surface. Use the available consultation functions to access the computed data. This data may be used to construct the BSpline surface. Warning The surfaces in the Beziers grid must be adjacent, i.e. two consecutive Bezier surfaces in the grid (in a row or column) must have a coincident bounding curve. In addition, the location of the parameterization on each of these surfaces (i.e. the relative location of u and v isoparametric curves on the surface) is of importance with regard to the positioning of the surfaces in the Beziers grid. Care must be taken with respect to the above, as these properties are not checked and an error may occur if they are not satisfied. Exceptions Standard_DimensionMismatch: - if the number of knots in the UKnots table (i.e. the length of the UKnots array) is not equal to the number of columns of Bezier surfaces in the Beziers grid plus 1, or - if the number of knots in the VKnots table (i.e. the length of the VKnots array) is not equal to the number of rows of Bezier surfaces in the Beziers grid, plus 1. Standard_ConstructionError: - if UContinuity and VContinuity are not equal to one of the following values: GeomAbs_C0, GeomAbs_C1, GeomAbs_C2 and GeomAbs_C3; or - if the number of columns in the Beziers grid is greater than 1, and the required degree of continuity in the u parametric direction is greater than that of the Bezier surface with the highest degree in the u parametric direction (in the Beziers grid), minus 1; or - if the number of rows in the Beziers grid is greater than 1, and the required degree of continuity in the v parametric direction is greater than that of the Bezier surface with the highest degree in the v parametric direction (in the Beziers grid), minus 1 . Standard_NotImplemented if one of the Bezier surfaces in the Beziers grid is rational.
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const GeomAbs_Shape UContinuity = GeomAbs_C0, const GeomAbs_Shape VContinuity = GeomAbs_C0, const Standard_Real Tolerance = 1.0e-4);

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the conversion was successful. Unless an exception was raised at the time of construction, the conversion of the Bezier surface grid assigned to this algorithm is always carried out. IsDone returns false if the constraints defined at the time of construction cannot be respected. This occurs when there is an incompatibility between a required degree of continuity on the BSpline surface, and the maximum tolerance accepted for local deformations of the surface. In such a case the computed data does not satisfy all the initial constraints.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbUKnots ******/
		/****** md5 signature: dad62b27d386c8d79ed8a3faddece815 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the U direction of the BSpline surface whose data is computed in this framework.
") NbUKnots;
		Standard_Integer NbUKnots();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbUPoles ******/
		/****** md5 signature: fb7c625af5aeee8be8cffdd28f1b08d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of poles in the U direction of the BSpline surface whose data is computed in this framework.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbVKnots ******/
		/****** md5 signature: c5483500ef062c3949009d9a2ec75b29 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the V direction of the BSpline surface whose data is computed in this framework.
") NbVKnots;
		Standard_Integer NbVKnots();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbVPoles ******/
		/****** md5 signature: 098754ae7893287e442d0a3c48b39cf0 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the V direction of the BSpline surface whose data is computed in this framework.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::Poles ******/
		/****** md5 signature: 4e616536627e10a4a11def3d5743d611 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray2OfPnt>

Description
-----------
Returns the table of poles of the BSpline surface whose data is computed in this framework.
") Poles;
		const opencascade::handle<TColgp_HArray2OfPnt> & Poles();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree for the u parametric direction of the BSpline surface whose data is computed in this framework.
") UDegree;
		Standard_Integer UDegree();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::UKnots ******/
		/****** md5 signature: e4c765c1a34f73676b6a0f23e63a42f7 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the knots table for the u parametric direction of the BSpline surface whose data is computed in this framework.
") UKnots;
		const opencascade::handle<TColStd_HArray1OfReal> & UKnots();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::UMultiplicities ******/
		/****** md5 signature: dd6df83c242f8c2d61f6fb2cc00d6d9a ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns the multiplicities table for the u parametric direction of the knots of the BSpline surface whose data is computed in this framework.
") UMultiplicities;
		const opencascade::handle<TColStd_HArray1OfInteger> & UMultiplicities();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree for the v parametric direction of the BSpline surface whose data is computed in this framework.
") VDegree;
		Standard_Integer VDegree();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::VKnots ******/
		/****** md5 signature: 56d691f001e3cbff620cca50aeeea333 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the knots table for the v parametric direction of the BSpline surface whose data is computed in this framework.
") VKnots;
		const opencascade::handle<TColStd_HArray1OfReal> & VKnots();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::VMultiplicities ******/
		/****** md5 signature: 36fc4847dd11076b629833ec28b74b5a ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
-- Returns the multiplicities table for the v parametric direction of the knots of the BSpline surface whose data is computed in this framework.
") VMultiplicities;
		const opencascade::handle<TColStd_HArray1OfInteger> & VMultiplicities();

};


%extend GeomConvert_CompBezierSurfacesToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class GeomConvert_CompCurveToBSplineCurve *
********************************************/
class GeomConvert_CompCurveToBSplineCurve {
	public:
		/****** GeomConvert_CompCurveToBSplineCurve::GeomConvert_CompCurveToBSplineCurve ******/
		/****** md5 signature: a96791634acde1f55395d6866064395e ******/
		%feature("compactdefaultargs") GeomConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
Initialize the algorithme - Parameterisation is used to convert.
") GeomConvert_CompCurveToBSplineCurve;
		 GeomConvert_CompCurveToBSplineCurve(const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** GeomConvert_CompCurveToBSplineCurve::GeomConvert_CompCurveToBSplineCurve ******/
		/****** md5 signature: 3aeb1eb8d2522e7e127a7c770b7a8f81 ******/
		%feature("compactdefaultargs") GeomConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom_BoundedCurve
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
Initialize the algorithme with one curve - Parameterisation is used to convert.
") GeomConvert_CompCurveToBSplineCurve;
		 GeomConvert_CompCurveToBSplineCurve(const opencascade::handle<Geom_BoundedCurve> & BasisCurve, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** GeomConvert_CompCurveToBSplineCurve::Add ******/
		/****** md5 signature: bc61762bbfef9f8aa367bbd6d1a81d53 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
NewCurve: Geom_BoundedCurve
Tolerance: float
After: bool (optional, default to Standard_False)
WithRatio: bool (optional, default to Standard_True)
MinM: int (optional, default to 0)

Return
-------
bool

Description
-----------
Append a curve in the BSpline Return False if the curve is not G0 with the BSplineCurve. Tolerance is used to check continuity and decrease Multiplicity at the common Knot until MinM if MinM = 0, the common Knot can be removed //! WithRatio defines whether the resulting curve should have a uniform parameterization. Setting WithRatio to Standard_False may greatly decrease the speed of algorithms like CPnts_AbscissaPoint::AdvPerform when applied to the resulting curve.
") Add;
		Standard_Boolean Add(const opencascade::handle<Geom_BoundedCurve> & NewCurve, const Standard_Real Tolerance, const Standard_Boolean After = Standard_False, const Standard_Boolean WithRatio = Standard_True, const Standard_Integer MinM = 0);

		/****** GeomConvert_CompCurveToBSplineCurve::BSplineCurve ******/
		/****** md5 signature: f990dacdae77505b5b71a450dd20ad64 ******/
		%feature("compactdefaultargs") BSplineCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSplineCurve;
		opencascade::handle<Geom_BSplineCurve> BSplineCurve();

};


%extend GeomConvert_CompCurveToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Clear(self):
		pass
	}
};

/************************************
* class GeomConvert_CurveToAnaCurve *
************************************/
class GeomConvert_CurveToAnaCurve {
	public:
		/****** GeomConvert_CurveToAnaCurve::GeomConvert_CurveToAnaCurve ******/
		/****** md5 signature: ec961824468293cd902f1969c652e26c ******/
		%feature("compactdefaultargs") GeomConvert_CurveToAnaCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomConvert_CurveToAnaCurve;
		 GeomConvert_CurveToAnaCurve();

		/****** GeomConvert_CurveToAnaCurve::GeomConvert_CurveToAnaCurve ******/
		/****** md5 signature: b1ece9c96194a4a80262bfa8a26ee2ab ******/
		%feature("compactdefaultargs") GeomConvert_CurveToAnaCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomConvert_CurveToAnaCurve;
		 GeomConvert_CurveToAnaCurve(const opencascade::handle<Geom_Curve> & C);

		/****** GeomConvert_CurveToAnaCurve::ComputeCircle ******/
		/****** md5 signature: ea256c1493cd79f11cc19a93be84040a ******/
		%feature("compactdefaultargs") ComputeCircle;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: float
c1: float
c2: float

Return
-------
cf: float
cl: float
Deviation: float

Description
-----------
Tries to convert the given curve to circle with given tolerance. Returns NULL curve if conversion is not possible.
") ComputeCircle;
		static opencascade::handle<Geom_Curve> ComputeCircle(const opencascade::handle<Geom_Curve> & curve, const Standard_Real tolerance, const Standard_Real c1, const Standard_Real c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::ComputeCurve ******/
		/****** md5 signature: c66a84ff606c6ec09706eec6eb45f9d8 ******/
		%feature("compactdefaultargs") ComputeCurve;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: float
c1: float
c2: float
theCurvType: GeomConvert_ConvType (optional, default to GeomConvert_MinGap)
theTarget: GeomAbs_CurveType (optional, default to GeomAbs_Line)

Return
-------
cf: float
cl: float
theGap: float

Description
-----------
No available documentation.
") ComputeCurve;
		static opencascade::handle<Geom_Curve> ComputeCurve(const opencascade::handle<Geom_Curve> & curve, const Standard_Real tolerance, const Standard_Real c1, const Standard_Real c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const GeomConvert_ConvType theCurvType = GeomConvert_MinGap, const GeomAbs_CurveType theTarget = GeomAbs_Line);

		/****** GeomConvert_CurveToAnaCurve::ComputeEllipse ******/
		/****** md5 signature: e0bb1bde95947083b93efaccf7353272 ******/
		%feature("compactdefaultargs") ComputeEllipse;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: float
c1: float
c2: float

Return
-------
cf: float
cl: float
Deviation: float

Description
-----------
Tries to convert the given curve to ellipse with given tolerance. Returns NULL curve if conversion is not possible.
") ComputeEllipse;
		static opencascade::handle<Geom_Curve> ComputeEllipse(const opencascade::handle<Geom_Curve> & curve, const Standard_Real tolerance, const Standard_Real c1, const Standard_Real c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::ComputeLine ******/
		/****** md5 signature: bc5142fb7fe1aa589de179e14ba11de0 ******/
		%feature("compactdefaultargs") ComputeLine;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: float
c1: float
c2: float

Return
-------
cf: float
cl: float
Deviation: float

Description
-----------
Tries to convert the given curve to line with given tolerance. Returns NULL curve if conversion is not possible.
") ComputeLine;
		static opencascade::handle<Geom_Line> ComputeLine(const opencascade::handle<Geom_Curve> & curve, const Standard_Real tolerance, const Standard_Real c1, const Standard_Real c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::ConvertToAnalytical ******/
		/****** md5 signature: 549770939dd4922960c2746330467b86 ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
theTol: float
theResultCurve: Geom_Curve
F: float
L: float

Return
-------
newF: float
newL: float

Description
-----------
Converts me to analytical if possible with given tolerance. The new first and last parameters are returned to newF, newL.
") ConvertToAnalytical;
		Standard_Boolean ConvertToAnalytical(const Standard_Real theTol, opencascade::handle<Geom_Curve> & theResultCurve, const Standard_Real F, const Standard_Real L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::Gap ******/
		/****** md5 signature: ff26c000138f3c6675ca82e0935201b1 ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximal deviation of converted surface from the original one computed by last call to ConvertToAnalytical.
") Gap;
		Standard_Real Gap();

		/****** GeomConvert_CurveToAnaCurve::GetCircle ******/
		/****** md5 signature: 54fff07540fbc3c56e68304652c6011a ******/
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
P0: gp_Pnt
P1: gp_Pnt
P2: gp_Pnt

Return
-------
bool

Description
-----------
Creates circle on points. Returns true if OK.
") GetCircle;
		static Standard_Boolean GetCircle(gp_Circ & Circ, const gp_Pnt & P0, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** GeomConvert_CurveToAnaCurve::GetConvType ******/
		/****** md5 signature: 3380d79ecc2a38ee84684af221c8db7d ******/
		%feature("compactdefaultargs") GetConvType;
		%feature("autodoc", "Return
-------
GeomConvert_ConvType

Description
-----------
Returns conversion type.
") GetConvType;
		GeomConvert_ConvType GetConvType();

		/****** GeomConvert_CurveToAnaCurve::GetLine ******/
		/****** md5 signature: f5adcee8a16048ac03ea0dd1162c6076 ******/
		%feature("compactdefaultargs") GetLine;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
cf: float
cl: float

Description
-----------
Creates line on two points. Resulting parameters returned.
") GetLine;
		static gp_Lin GetLine(const gp_Pnt & P1, const gp_Pnt & P2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::GetTarget ******/
		/****** md5 signature: 5c2574892803a79756a17ac0020a223f ******/
		%feature("compactdefaultargs") GetTarget;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns target curve type.
") GetTarget;
		GeomAbs_CurveType GetTarget();

		/****** GeomConvert_CurveToAnaCurve::Init ******/
		/****** md5 signature: 3a7fb0adde1a97c68f435539513bba2c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

		/****** GeomConvert_CurveToAnaCurve::IsLinear ******/
		/****** md5 signature: 3fffa92876acf756eec0fb545af7bee0 ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "
Parameters
----------
aPoints: TColgp_Array1OfPnt
tolerance: float

Return
-------
Deviation: float

Description
-----------
Returns true if the set of points is linear with given tolerance.
") IsLinear;
		static Standard_Boolean IsLinear(const TColgp_Array1OfPnt & aPoints, const Standard_Real tolerance, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::SetConvType ******/
		/****** md5 signature: dc5b7fda06c157912253fd5c8fdcffe7 ******/
		%feature("compactdefaultargs") SetConvType;
		%feature("autodoc", "
Parameters
----------
theConvType: GeomConvert_ConvType

Return
-------
None

Description
-----------
Sets type of conversion.
") SetConvType;
		void SetConvType(const GeomConvert_ConvType theConvType);

		/****** GeomConvert_CurveToAnaCurve::SetTarget ******/
		/****** md5 signature: ea3732f46794fadef2b53622915d7a0a ******/
		%feature("compactdefaultargs") SetTarget;
		%feature("autodoc", "
Parameters
----------
theTarget: GeomAbs_CurveType

Return
-------
None

Description
-----------
Sets target curve type.
") SetTarget;
		void SetTarget(const GeomAbs_CurveType theTarget);

};


%extend GeomConvert_CurveToAnaCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomConvert_FuncConeLSDist *
***********************************/
class GeomConvert_FuncConeLSDist : public math_MultipleVarFunction {
	public:
		/****** GeomConvert_FuncConeLSDist::GeomConvert_FuncConeLSDist ******/
		/****** md5 signature: c18fa0e2e30905df7fa7d871ba339b12 ******/
		%feature("compactdefaultargs") GeomConvert_FuncConeLSDist;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") GeomConvert_FuncConeLSDist;
		 GeomConvert_FuncConeLSDist();

		/****** GeomConvert_FuncConeLSDist::GeomConvert_FuncConeLSDist ******/
		/****** md5 signature: 92c3b44800588b998b0bdcce35d8c57d ******/
		%feature("compactdefaultargs") GeomConvert_FuncConeLSDist;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_HArray1OfXYZ
theDir: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") GeomConvert_FuncConeLSDist;
		 GeomConvert_FuncConeLSDist(const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints, const gp_Dir & theDir);

		/****** GeomConvert_FuncConeLSDist::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		Standard_Integer NbVariables();

		/****** GeomConvert_FuncConeLSDist::SetDir ******/
		/****** md5 signature: 1d0b77c139a977d9a07e3e8f20d2c562 ******/
		%feature("compactdefaultargs") SetDir;
		%feature("autodoc", "
Parameters
----------
theDir: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") SetDir;
		void SetDir(const gp_Dir & theDir);

		/****** GeomConvert_FuncConeLSDist::SetPoints ******/
		/****** md5 signature: 4eab7dc5fdb6ba550172fa84344d274b ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_HArray1OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") SetPoints;
		void SetPoints(const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints);

		/****** GeomConvert_FuncConeLSDist::Value ******/
		/****** md5 signature: 785b7201af1c2abaa75ddcb4aefd5f9e ******/
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
Value.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend GeomConvert_FuncConeLSDist {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomConvert_FuncCylinderLSDist *
***************************************/
class GeomConvert_FuncCylinderLSDist : public math_MultipleVarFunctionWithGradient {
	public:
		/****** GeomConvert_FuncCylinderLSDist::GeomConvert_FuncCylinderLSDist ******/
		/****** md5 signature: 9294d6c0e3d8b33feb6b8f55c7f9a765 ******/
		%feature("compactdefaultargs") GeomConvert_FuncCylinderLSDist;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") GeomConvert_FuncCylinderLSDist;
		 GeomConvert_FuncCylinderLSDist();

		/****** GeomConvert_FuncCylinderLSDist::GeomConvert_FuncCylinderLSDist ******/
		/****** md5 signature: c28ebf082656d19dd5bbcd73e94e4d3c ******/
		%feature("compactdefaultargs") GeomConvert_FuncCylinderLSDist;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_HArray1OfXYZ
theDir: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") GeomConvert_FuncCylinderLSDist;
		 GeomConvert_FuncCylinderLSDist(const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints, const gp_Dir & theDir);

		/****** GeomConvert_FuncCylinderLSDist::Gradient ******/
		/****** md5 signature: 3c2c6e3dc1adb80c90a5b990a7bd765e ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
Gradient.
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** GeomConvert_FuncCylinderLSDist::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		Standard_Integer NbVariables();

		/****** GeomConvert_FuncCylinderLSDist::SetDir ******/
		/****** md5 signature: 1d0b77c139a977d9a07e3e8f20d2c562 ******/
		%feature("compactdefaultargs") SetDir;
		%feature("autodoc", "
Parameters
----------
theDir: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") SetDir;
		void SetDir(const gp_Dir & theDir);

		/****** GeomConvert_FuncCylinderLSDist::SetPoints ******/
		/****** md5 signature: 4eab7dc5fdb6ba550172fa84344d274b ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_HArray1OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") SetPoints;
		void SetPoints(const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints);

		/****** GeomConvert_FuncCylinderLSDist::Value ******/
		/****** md5 signature: 785b7201af1c2abaa75ddcb4aefd5f9e ******/
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
Value.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** GeomConvert_FuncCylinderLSDist::Values ******/
		/****** md5 signature: f0f16d7b5e9269bb29d01310f0af0e74 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
Value and gradient.
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend GeomConvert_FuncCylinderLSDist {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class GeomConvert_FuncSphereLSDist *
*************************************/
class GeomConvert_FuncSphereLSDist : public math_MultipleVarFunctionWithGradient {
	public:
		/****** GeomConvert_FuncSphereLSDist::GeomConvert_FuncSphereLSDist ******/
		/****** md5 signature: ecd22e69071f4a915806374c28120477 ******/
		%feature("compactdefaultargs") GeomConvert_FuncSphereLSDist;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") GeomConvert_FuncSphereLSDist;
		 GeomConvert_FuncSphereLSDist();

		/****** GeomConvert_FuncSphereLSDist::GeomConvert_FuncSphereLSDist ******/
		/****** md5 signature: fda9d28bcb623805c42baa638f23890c ******/
		%feature("compactdefaultargs") GeomConvert_FuncSphereLSDist;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_HArray1OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") GeomConvert_FuncSphereLSDist;
		 GeomConvert_FuncSphereLSDist(const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints);

		/****** GeomConvert_FuncSphereLSDist::Gradient ******/
		/****** md5 signature: 3c2c6e3dc1adb80c90a5b990a7bd765e ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
Gradient.
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** GeomConvert_FuncSphereLSDist::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		Standard_Integer NbVariables();

		/****** GeomConvert_FuncSphereLSDist::SetPoints ******/
		/****** md5 signature: 4eab7dc5fdb6ba550172fa84344d274b ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_HArray1OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") SetPoints;
		void SetPoints(const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints);

		/****** GeomConvert_FuncSphereLSDist::Value ******/
		/****** md5 signature: 785b7201af1c2abaa75ddcb4aefd5f9e ******/
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
Value.
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** GeomConvert_FuncSphereLSDist::Values ******/
		/****** md5 signature: f0f16d7b5e9269bb29d01310f0af0e74 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
Value and gradient.
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend GeomConvert_FuncSphereLSDist {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomConvert_SurfToAnaSurf *
**********************************/
class GeomConvert_SurfToAnaSurf {
	public:
		/****** GeomConvert_SurfToAnaSurf::GeomConvert_SurfToAnaSurf ******/
		/****** md5 signature: bdd7948b4c741cf42bf7406c87cb003b ******/
		%feature("compactdefaultargs") GeomConvert_SurfToAnaSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomConvert_SurfToAnaSurf;
		 GeomConvert_SurfToAnaSurf();

		/****** GeomConvert_SurfToAnaSurf::GeomConvert_SurfToAnaSurf ******/
		/****** md5 signature: a26e73f3d11a0e1e50ab31901a426539 ******/
		%feature("compactdefaultargs") GeomConvert_SurfToAnaSurf;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") GeomConvert_SurfToAnaSurf;
		 GeomConvert_SurfToAnaSurf(const opencascade::handle<Geom_Surface> & S);

		/****** GeomConvert_SurfToAnaSurf::ConvertToAnalytical ******/
		/****** md5 signature: e57ac2326fa470e5e6cce2c0710d834d ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
InitialToler: float

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Tries to convert the Surface to an Analytic form Returns the result In case of failure, returns a Null Handle //!.
") ConvertToAnalytical;
		opencascade::handle<Geom_Surface> ConvertToAnalytical(const Standard_Real InitialToler);

		/****** GeomConvert_SurfToAnaSurf::ConvertToAnalytical ******/
		/****** md5 signature: 33b00422234d22dc8293f4611ee298de ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
InitialToler: float
Umin: float
Umax: float
Vmin: float
Vmax: float

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") ConvertToAnalytical;
		opencascade::handle<Geom_Surface> ConvertToAnalytical(const Standard_Real InitialToler, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****** GeomConvert_SurfToAnaSurf::Gap ******/
		/****** md5 signature: ff26c000138f3c6675ca82e0935201b1 ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximal deviation of converted surface from the original one computed by last call to ConvertToAnalytical.
") Gap;
		Standard_Real Gap();

		/****** GeomConvert_SurfToAnaSurf::Init ******/
		/****** md5 signature: ae778074c5c355f705c26cfe08f002f6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S);

		/****** GeomConvert_SurfToAnaSurf::IsCanonical ******/
		/****** md5 signature: 65430f5df436025e37dd842c4efa5212 ******/
		%feature("compactdefaultargs") IsCanonical;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
bool

Description
-----------
Returns true, if surface is canonical.
") IsCanonical;
		static Standard_Boolean IsCanonical(const opencascade::handle<Geom_Surface> & S);

		/****** GeomConvert_SurfToAnaSurf::IsSame ******/
		/****** md5 signature: 349e0ba479554f88945ea67ac1ab3569 ******/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
tol: float

Return
-------
bool

Description
-----------
Returns true if surfaces is same with the given tolerance.
") IsSame;
		static Standard_Boolean IsSame(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real tol);

		/****** GeomConvert_SurfToAnaSurf::SetConvType ******/
		/****** md5 signature: 03bbc5678dadf68c699f6a038fd4fd40 ******/
		%feature("compactdefaultargs") SetConvType;
		%feature("autodoc", "
Parameters
----------
theConvType: GeomConvert_ConvType (optional, default to GeomConvert_Simplest)

Return
-------
None

Description
-----------
No available documentation.
") SetConvType;
		void SetConvType(const GeomConvert_ConvType theConvType = GeomConvert_Simplest);

		/****** GeomConvert_SurfToAnaSurf::SetTarget ******/
		/****** md5 signature: 78977fc6a03db0963d60bdba17618653 ******/
		%feature("compactdefaultargs") SetTarget;
		%feature("autodoc", "
Parameters
----------
theSurfType: GeomAbs_SurfaceType (optional, default to GeomAbs_Plane)

Return
-------
None

Description
-----------
No available documentation.
") SetTarget;
		void SetTarget(const GeomAbs_SurfaceType theSurfType = GeomAbs_Plane);

};


%extend GeomConvert_SurfToAnaSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomConvert_Units *
**************************/
class GeomConvert_Units {
	public:
		/****** GeomConvert_Units::DegreeToRadian ******/
		/****** md5 signature: 69ed7e606bb67cc6d9c8165770462427 ******/
		%feature("compactdefaultargs") DegreeToRadian;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve
theSurface: Geom_Surface
theLengthFactor: float
theFactorRadianDegree: float

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Convert 2d curve for change angle unit from degree to radian.
") DegreeToRadian;
		static opencascade::handle<Geom2d_Curve> DegreeToRadian(const opencascade::handle<Geom2d_Curve> & theCurve, const opencascade::handle<Geom_Surface> & theSurface, const Standard_Real theLengthFactor, const Standard_Real theFactorRadianDegree);

		/****** GeomConvert_Units::MirrorPCurve ******/
		/****** md5 signature: 96315e1e393b6c68ef42cbc8bec665c6 ******/
		%feature("compactdefaultargs") MirrorPCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
return 2d curve as 'mirror' for given.
") MirrorPCurve;
		static opencascade::handle<Geom2d_Curve> MirrorPCurve(const opencascade::handle<Geom2d_Curve> & theCurve);

		/****** GeomConvert_Units::RadianToDegree ******/
		/****** md5 signature: 97864706bc2811ff080d2cdd739d339c ******/
		%feature("compactdefaultargs") RadianToDegree;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve
theSurface: Geom_Surface
theLengthFactor: float
theFactorRadianDegree: float

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Convert 2d curve for change angle unit from radian to degree.
") RadianToDegree;
		static opencascade::handle<Geom2d_Curve> RadianToDegree(const opencascade::handle<Geom2d_Curve> & theCurve, const opencascade::handle<Geom_Surface> & theSurface, const Standard_Real theLengthFactor, const Standard_Real theFactorRadianDegree);

};


%extend GeomConvert_Units {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geomconvert_C0BSplineToArrayOfC1BSplineCurve(*args):
	return geomconvert.C0BSplineToArrayOfC1BSplineCurve(*args)

@deprecated
def geomconvert_C0BSplineToArrayOfC1BSplineCurve(*args):
	return geomconvert.C0BSplineToArrayOfC1BSplineCurve(*args)

@deprecated
def geomconvert_C0BSplineToC1BSplineCurve(*args):
	return geomconvert.C0BSplineToC1BSplineCurve(*args)

@deprecated
def geomconvert_ConcatC1(*args):
	return geomconvert.ConcatC1(*args)

@deprecated
def geomconvert_ConcatC1(*args):
	return geomconvert.ConcatC1(*args)

@deprecated
def geomconvert_ConcatG1(*args):
	return geomconvert.ConcatG1(*args)

@deprecated
def geomconvert_CurveToBSplineCurve(*args):
	return geomconvert.CurveToBSplineCurve(*args)

@deprecated
def geomconvert_SplitBSplineCurve(*args):
	return geomconvert.SplitBSplineCurve(*args)

@deprecated
def geomconvert_SplitBSplineCurve(*args):
	return geomconvert.SplitBSplineCurve(*args)

@deprecated
def geomconvert_SplitBSplineSurface(*args):
	return geomconvert.SplitBSplineSurface(*args)

@deprecated
def geomconvert_SplitBSplineSurface(*args):
	return geomconvert.SplitBSplineSurface(*args)

@deprecated
def geomconvert_SplitBSplineSurface(*args):
	return geomconvert.SplitBSplineSurface(*args)

@deprecated
def geomconvert_SplitBSplineSurface(*args):
	return geomconvert.SplitBSplineSurface(*args)

@deprecated
def geomconvert_SurfaceToBSplineSurface(*args):
	return geomconvert.SurfaceToBSplineSurface(*args)

@deprecated
def GeomConvert_CurveToAnaCurve_ComputeCircle(*args):
	return GeomConvert_CurveToAnaCurve.ComputeCircle(*args)

@deprecated
def GeomConvert_CurveToAnaCurve_ComputeCurve(*args):
	return GeomConvert_CurveToAnaCurve.ComputeCurve(*args)

@deprecated
def GeomConvert_CurveToAnaCurve_ComputeEllipse(*args):
	return GeomConvert_CurveToAnaCurve.ComputeEllipse(*args)

@deprecated
def GeomConvert_CurveToAnaCurve_ComputeLine(*args):
	return GeomConvert_CurveToAnaCurve.ComputeLine(*args)

@deprecated
def GeomConvert_CurveToAnaCurve_GetCircle(*args):
	return GeomConvert_CurveToAnaCurve.GetCircle(*args)

@deprecated
def GeomConvert_CurveToAnaCurve_GetLine(*args):
	return GeomConvert_CurveToAnaCurve.GetLine(*args)

@deprecated
def GeomConvert_CurveToAnaCurve_IsLinear(*args):
	return GeomConvert_CurveToAnaCurve.IsLinear(*args)

@deprecated
def GeomConvert_SurfToAnaSurf_IsCanonical(*args):
	return GeomConvert_SurfToAnaSurf.IsCanonical(*args)

@deprecated
def GeomConvert_SurfToAnaSurf_IsSame(*args):
	return GeomConvert_SurfToAnaSurf.IsSame(*args)

@deprecated
def GeomConvert_Units_DegreeToRadian(*args):
	return GeomConvert_Units.DegreeToRadian(*args)

@deprecated
def GeomConvert_Units_MirrorPCurve(*args):
	return GeomConvert_Units.MirrorPCurve(*args)

@deprecated
def GeomConvert_Units_RadianToDegree(*args):
	return GeomConvert_Units.RadianToDegree(*args)

}
