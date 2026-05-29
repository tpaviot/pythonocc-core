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
		/****** md5 signature: e9bfde0cb0ca28c882dae81f811309ba ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
tabBS: TColGeom_HArray1OfBSplineCurve
tolerance: double

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HArray1OfBSplineCurve > & tabBS, const double tolerance);

		/****** GeomConvert::C0BSplineToArrayOfC1BSplineCurve ******/
		/****** md5 signature: ebcff7370fda04e75adb6b320adbec7c ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
tabBS: TColGeom_HArray1OfBSplineCurve
AngularTolerance: double
tolerance: double

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance: it allows for the maximum deformation The Angular tolerance is in radians and measures the angle of the tangents on the left and on the right to decide if the curve is C1 or not at a given point.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HArray1OfBSplineCurve > & tabBS, const double AngularTolerance, const double tolerance);

		/****** GeomConvert::C0BSplineToC1BSplineCurve ******/
		/****** md5 signature: 9bfc8d48e3a5b8eb22714e909d6cb215 ******/
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
tolerance: double
AngularTolerance: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns a new BSpline which could still be C0. tolerance is a geometrical tolerance. The Angular toleranceis in radians and measures the angle of the tangents on the left and on the right to decide if the curve is G1 or not at a given point.
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve(opencascade::handle<Geom_BSplineCurve> & BS, const double tolerance, const double AngularTolerance = 1.0e-7);

		/****** GeomConvert::ConcatC1 ******/
		/****** md5 signature: 5ea0f2010c0fb2f9edc503aeb26d2626 ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
ClosedTolerance: double

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom_HArray1OfBSplineCurve > & ArrayOfConcatenated, Standard_Boolean &OutValue, const double ClosedTolerance);

		/****** GeomConvert::ConcatC1 ******/
		/****** md5 signature: de1e4b382316ce1b282cbe0d3b33bb96 ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
ClosedTolerance: double
AngularTolerance: double

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom_HArray1OfBSplineCurve > & ArrayOfConcatenated, Standard_Boolean &OutValue, const double ClosedTolerance, const double AngularTolerance);

		/****** GeomConvert::ConcatG1 ******/
		/****** md5 signature: a92fee44aa28a6c583b4afd70562f03b ******/
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
ClosedTolerance: double

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates G1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatG1;
		static void ConcatG1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColGeom_HArray1OfBSplineCurve > & ArrayOfConcatenated, Standard_Boolean &OutValue, const double ClosedTolerance);

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
This function converts a non infinite curve from Geom into a B-spline curve. C must be an ellipse or a circle or a trimmed conic or a trimmed line or a Bezier curve or a trimmed Bezier curve or a BSpline curve or a trimmed BSpline curve or an OffsetCurve. The returned B-spline is not periodic except if C is a Circle or an Ellipse. If the Parameterisation is QuasiAngular than the returned curve is NOT periodic in case a periodic Geom_Circle or Geom_Ellipse. For TgtThetaOver2_1 and TgtThetaOver2_2 the method raises an exception in case of a periodic Geom_Circle or a Geom_Ellipse ParameterisationType applies only if the curve is a Circle or an ellipse: TgtThetaOver2, TgtThetaOver2_1, TgtThetaOver2_2, TgtThetaOver2_3, TgtThetaOver2_4, //! Purpose: this is the classical rational parameterisation 2 1 - t cos(theta) = ------ 2 1 + t //! 2t sin(theta) = ------ 2 1 + t //! t = tan (theta/2) //! with TgtThetaOver2 the routine will compute the number of spans using the rule num_spans = [ (ULast - UFirst) / 1.2 ] + 1 with TgtThetaOver2_N, N spans will be forced: an error will be raized if (ULast - UFirst) >= PI and N = 1, ULast - UFirst >= 2 PI and N = 2 //! QuasiAngular, here t is a rational function that approximates theta ----> tan(theta/2). Nevetheless the composing with above function yields exact functions whose square sum up to 1 RationalC1 ; t is replaced by a polynomial function of u so as to grant C1 contiuity across knots. Exceptions Standard_DomainError: - if the curve C is infinite, or - if C is a (complete) circle or ellipse, and Parameterisation is equal to Convert_TgtThetaOver2_1 or Convert_TgtThetaOver2_2. Standard_ConstructionError: - if C is a (complete) circle or ellipse, and if Parameterisation is not equal to Convert_TgtThetaOver2, Convert_RationalC1, Convert_QuasiAngular (the curve is converted in these three cases) or to Convert_TgtThetaOver2_1 or Convert_TgtThetaOver2_2 (another exception is raised in these two cases). - if C is a trimmed circle or ellipse, if Parameterisation is equal to Convert_TgtThetaOver2_1 and if U2 - U1 > 0.9999 * Pi, where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a half-circle or a half-ellipse, for example), or - if C is a trimmed circle or ellipse, if Parameterisation is equal to Convert_TgtThetaOver2_2 and U2 - U1 > 1.9999 * Pi where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a quasi-complete circle or ellipse).
") CurveToBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> CurveToBSplineCurve(const opencascade::handle<Geom_Curve> & C, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** GeomConvert::SplitBSplineCurve ******/
		/****** md5 signature: ba73ce312a7a5f7900af66b0ca66ba19 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_BSplineCurve
FromK1: int
ToK2: int
SameOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Convert a curve from Geom by an approximation method //! This method computes the arc of B-spline curve between the two knots FromK1 and ToK2. If C is periodic the arc has the same orientation as C if SameOrientation = true. If C is not periodic SameOrientation is not used for the computation and C is oriented from the knot fromK1 to the knot toK2. We just keep the local definition of C between the knots FromK1 and ToK2. The returned B-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of C. The indexes of the knots FromK1 and ToK2 doesn't include the repetition of multiple knots in their definition. Raised if FromK1 = ToK2 Raised if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex].
") SplitBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & C, const int FromK1, const int ToK2, const bool SameOrientation = true);

		/****** GeomConvert::SplitBSplineCurve ******/
		/****** md5 signature: 9ab3ec24447c06406e8959677b94a652 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_BSplineCurve
FromU1: double
ToU2: double
ParametricTolerance: double
SameOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
This function computes the segment of B-spline curve between the parametric values FromU1, ToU2. If C is periodic the arc has the same orientation as C if SameOrientation = True. If C is not periodic SameOrientation is not used for the computation and C is oriented fromU1 toU2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 are out of the parametric bounds of the curve (The tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance Raised if ParametricTolerance < Resolution from gp.
") SplitBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & C, const double FromU1, const double ToU2, const double ParametricTolerance, const bool SameOrientation = true);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: 863ce2b3aea5cfb48e978ccced33d13a ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
SameUOrientation: bool (optional, default to true)
SameVOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Computes the B-spline surface patche between the knots values FromUK1, ToUK2, FromVK1, ToVK2. If S is periodic in one direction the patche has the same orientation as S in this direction if the flag is true in this direction (SameUOrientation, SameVOrientation). If S is not periodic SameUOrientation and SameVOrientation are not used for the computation and S is oriented FromUK1 ToUK2 and FromVK1 ToVK2. Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2 FromUK1 or ToUK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] FromVK1 or ToVK2 are out of the bounds [FirstVKnotIndex, LastVKnotIndex].
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const int FromUK1, const int ToUK2, const int FromVK1, const int ToVK2, const bool SameUOrientation = true, const bool SameVOrientation = true);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: 8ddffaf6bf0da92bc0eef7a450608486 ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromK1: int
ToK2: int
USplit: bool
SameOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This method splits a B-spline surface patche between the knots values FromK1, ToK2 in one direction. If USplit = True then the splitting direction is the U parametric direction else it is the V parametric direction. If S is periodic in the considered direction the patche has the same orientation as S in this direction if SameOrientation is True If S is not periodic in this direction SameOrientation is not used for the computation and S is oriented FromK1 ToK2. Raised if FromK1 = ToK2 or if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] in the considered parametric direction.
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const int FromK1, const int ToK2, const bool USplit, const bool SameOrientation = true);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: 7426e43df3453f9628d7bd02fe4ae9c4 ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromU1: double
ToU2: double
FromV1: double
ToV2: double
ParametricTolerance: double
SameUOrientation: bool (optional, default to true)
SameVOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This method computes the B-spline surface patche between the parametric values FromU1, ToU2, FromV1, ToV2. If S is periodic in one direction the patche has the same orientation as S in this direction if the flag is True in this direction (SameUOrientation, SameVOrientation). If S is not periodic SameUOrientation and SameVOrientation are not used for the computation and S is oriented FromU1 ToU2 and FromV1 ToV2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 or FromV1 or ToU2 are out of the parametric bounds of the surface (the tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance or Abs (FromV1 - ToV2) <= ParametricTolerance. Raised if ParametricTolerance < Resolution.
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const double FromU1, const double ToU2, const double FromV1, const double ToV2, const double ParametricTolerance, const bool SameUOrientation = true, const bool SameVOrientation = true);

		/****** GeomConvert::SplitBSplineSurface ******/
		/****** md5 signature: 01bbcfc5b5cd2ae37bbb9d89892f7ed0 ******/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
FromParam1: double
ToParam2: double
USplit: bool
ParametricTolerance: double
SameOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This method splits the B-spline surface S in one direction between the parametric values FromParam1, ToParam2. If USplit = True then the Splitting direction is the U parametric direction else it is the V parametric direction. If S is periodic in the considered direction the patche has the same orientation as S in this direction if SameOrientation is true. If S is not periodic in the considered direction SameOrientation is not used for the computation and S is oriented FromParam1 ToParam2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raises if FromParam1 or ToParam2 are out of the parametric bounds of the surface in the considered direction. Raises if Abs (FromParam1 - ToParam2) <= ParametricTolerance.
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const double FromParam1, const double ToParam2, const bool USplit, const double ParametricTolerance, const bool SameOrientation = true);

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
		/****** md5 signature: e73ce1c9e4918e9c0024b7ce400a78b7 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Tol3d: double
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
		 GeomConvert_ApproxCurve(const opencascade::handle<Geom_Curve> & Curve, const double Tol3d, const GeomAbs_Shape Order, const int MaxSegments, const int MaxDegree);

		/****** GeomConvert_ApproxCurve::GeomConvert_ApproxCurve ******/
		/****** md5 signature: 7779b0dba8798552f8c4398facbabf44 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Tol3d: double
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
		 GeomConvert_ApproxCurve(const opencascade::handle<Adaptor3d_Curve> & Curve, const double Tol3d, const GeomAbs_Shape Order, const int MaxSegments, const int MaxDegree);

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
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the approximation did come out with a result that is not NECESSARELY within the required tolerance.
") HasResult;
		bool HasResult();

		/****** GeomConvert_ApproxCurve::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the approximation has been done within required tolerance.
") IsDone;
		bool IsDone();

		/****** GeomConvert_ApproxCurve::MaxError ******/
		/****** md5 signature: 4f47ae0b40baa70b5c95e40911df418d ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the greatest distance between a point on the source conic and the BSpline curve resulting from the approximation. (>0 when an approximation has been done, 0 if no approximation).
") MaxError;
		double MaxError();

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
		/****** md5 signature: 48306be50c27c3c94ca2683ab3ebfcf4 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Geom_Surface
Tol3d: double
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
		 GeomConvert_ApproxSurface(const opencascade::handle<Geom_Surface> & Surf, const double Tol3d, const GeomAbs_Shape UContinuity, const GeomAbs_Shape VContinuity, const int MaxDegU, const int MaxDegV, const int MaxSegments, const int PrecisCode);

		/****** GeomConvert_ApproxSurface::GeomConvert_ApproxSurface ******/
		/****** md5 signature: b8cbe2e41282bd0d6892ae1e4100e6e0 ******/
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Tol3d: double
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
		 GeomConvert_ApproxSurface(const opencascade::handle<Adaptor3d_Surface> & Surf, const double Tol3d, const GeomAbs_Shape UContinuity, const GeomAbs_Shape VContinuity, const int MaxDegU, const int MaxDegV, const int MaxSegments, const int PrecisCode);

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
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the approximation did come out with a result that is not NECESSARILY within the required tolerance or a result that is not recognized with the wished continuities.
") HasResult;
		bool HasResult();

		/****** GeomConvert_ApproxSurface::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the approximation has be done.
") IsDone;
		bool IsDone();

		/****** GeomConvert_ApproxSurface::MaxError ******/
		/****** md5 signature: 4f47ae0b40baa70b5c95e40911df418d ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the greatest distance between a point on the source conic surface and the BSpline surface resulting from the approximation (>0 when an approximation has been done, 0 if no approximation ).
") MaxError;
		double MaxError();

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
		/****** md5 signature: b3f4700e6c11a56938466c9f9149b5ff ******/
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
		 GeomConvert_BSplineCurveKnotSplitting(const opencascade::handle<Geom_BSplineCurve> & BasisCurve, const int ContinuityRange);

		/****** GeomConvert_BSplineCurveKnotSplitting::NbSplits ******/
		/****** md5 signature: 450e59ea60ccd5f46ae4d2b16e989c5a ******/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points at which the analyzed BSpline curve should be split, in order to obtain arcs with the continuity required by this framework. All these points correspond to knot values. Note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.
") NbSplits;
		int NbSplits();

		/****** GeomConvert_BSplineCurveKnotSplitting::SplitValue ******/
		/****** md5 signature: 58aee47f7f155f97d1a4ec76b6cebd87 ******/
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
		int SplitValue(const int Index);

		/****** GeomConvert_BSplineCurveKnotSplitting::Splitting ******/
		/****** md5 signature: 6e6d594c00cac556bf0f204ddde3dabf ******/
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
		/****** md5 signature: c9f771a3d65da46c3b4d50abf3808810 ******/
		%feature("compactdefaultargs") GeomConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom_BSplineCurve
U1: double
U2: double
ParametricTolerance: double

Return
-------
None

Description
-----------
Computes all the data needed to convert the portion of the BSpline curve BasisCurve limited by the two parameter values U1 and U2 into a series of adjacent Bezier arcs. The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 are out of the parametric bounds of the basis curve [FirstParameter, LastParameter]. The Tolerance criterion is ParametricTolerance. Raised if Abs (U2 - U1) <= ParametricTolerance.
") GeomConvert_BSplineCurveToBezierCurve;
		 GeomConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom_BSplineCurve> & BasisCurve, const double U1, const double U2, const double ParametricTolerance);

		/****** GeomConvert_BSplineCurveToBezierCurve::Arc ******/
		/****** md5 signature: 7858d2d55529b4e475e533f5684539af ******/
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
		opencascade::handle<Geom_BezierCurve> Arc(const int Index);

		/****** GeomConvert_BSplineCurveToBezierCurve::Arcs ******/
		/****** md5 signature: 22a5518dfba66f0327fd6cc7b5c3d4e2 ******/
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
		/****** md5 signature: 0c997620b63f032cdc3c9768bd4c0468 ******/
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
		/****** md5 signature: c1c862e41d849390df4d036d37a1ae92 ******/
		%feature("compactdefaultargs") NbArcs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of BezierCurve arcs. If at the creation time you have decomposed the basis curve between the parametric values UFirst, ULast the number of BezierCurve arcs depends on the number of knots included inside the interval [UFirst, ULast]. If you have decomposed the whole basis B-spline curve the number of BezierCurve arcs NbArcs is equal to the number of knots less one.
") NbArcs;
		int NbArcs();

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
		/****** md5 signature: ff072ea133e7bddbe828c11ccc998075 ******/
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
		 GeomConvert_BSplineSurfaceKnotSplitting(const opencascade::handle<Geom_BSplineSurface> & BasisSurface, const int UContinuityRange, const int VContinuityRange);

		/****** GeomConvert_BSplineSurfaceKnotSplitting::NbUSplits ******/
		/****** md5 signature: ff1879066924e6976cc6b1a59653596d ******/
		%feature("compactdefaultargs") NbUSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of u-isoparametric curves along which the analysed BSpline surface should be split in order to obtain patches with the continuity required by this framework. The parameters which define these curves are knot values in the corresponding parametric direction. Note that the four curves which bound the surface are counted among these splitting curves.
") NbUSplits;
		int NbUSplits();

		/****** GeomConvert_BSplineSurfaceKnotSplitting::NbVSplits ******/
		/****** md5 signature: 47f35848bf9a2d9ac0564178c91c639a ******/
		%feature("compactdefaultargs") NbVSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of v-isoparametric curves along which the analysed BSpline surface should be split in order to obtain patches with the continuity required by this framework. The parameters which define these curves are knot values in the corresponding parametric direction. Note that the four curves which bound the surface are counted among these splitting curves.
") NbVSplits;
		int NbVSplits();

		/****** GeomConvert_BSplineSurfaceKnotSplitting::Splitting ******/
		/****** md5 signature: 0c50cf5b73ddb20b151151510bc34393 ******/
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
		/****** md5 signature: e1292a99d8b932ecd30274cf0bcd2ecb ******/
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
		int USplitValue(const int UIndex);

		/****** GeomConvert_BSplineSurfaceKnotSplitting::VSplitValue ******/
		/****** md5 signature: 9400b713b804bcceae54f7f5ff1a5693 ******/
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
		int VSplitValue(const int VIndex);

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
		/****** md5 signature: bf4d5c79b86bcde66f6ab14b7c0c821f ******/
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceToBezierSurface;
		%feature("autodoc", "
Parameters
----------
BasisSurface: Geom_BSplineSurface
U1: double
U2: double
V1: double
V2: double
ParametricTolerance: double

Return
-------
None

Description
-----------
Computes all the data needed to convert the patch of the BSpline surface BasisSurface limited by the two parameter values U1 and U2 in the u parametric direction, and by the two parameter values V1 and V2 in the v parametric direction, into a series of adjacent Bezier surfaces. The result consists of a grid of BasisSurface patches limited by isoparametric curves corresponding to knot values, both in the u and v parametric directions of the surface. A row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves. A column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves. Use the available interrogation functions to ascertain the number of computed Bezier patches, and then to construct each individual Bezier surface (or all Bezier surfaces). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 or V1 or V2 are out of the parametric bounds of the basis surface [FirstUKnotIndex, LastUKnotIndex] , [FirstVKnotIndex, LastVKnotIndex] The tolerance criterion is ParametricTolerance. Raised if U2 - U1 <= ParametricTolerance or V2 - V1 <= ParametricTolerance.
") GeomConvert_BSplineSurfaceToBezierSurface;
		 GeomConvert_BSplineSurfaceToBezierSurface(const opencascade::handle<Geom_BSplineSurface> & BasisSurface, const double U1, const double U2, const double V1, const double V2, const double ParametricTolerance);

		/****** GeomConvert_BSplineSurfaceToBezierSurface::NbUPatches ******/
		/****** md5 signature: c3277061f278847e336ea5563aab05a0 ******/
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Bezier surfaces in the U direction. If at the creation time you have decomposed the basis Surface between the parametric values UFirst, ULast the number of Bezier surfaces in the U direction depends on the number of knots included inside the interval [UFirst, ULast]. If you have decomposed the whole basis B-spline surface the number of Bezier surfaces NbUPatches is equal to the number of UKnots less one.
") NbUPatches;
		int NbUPatches();

		/****** GeomConvert_BSplineSurfaceToBezierSurface::NbVPatches ******/
		/****** md5 signature: 32d47250a5cb3e96bb06b22d6dd9800e ******/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Bezier surfaces in the V direction. If at the creation time you have decomposed the basis surface between the parametric values VFirst, VLast the number of Bezier surfaces in the V direction depends on the number of knots included inside the interval [VFirst, VLast]. If you have decomposed the whole basis B-spline surface the number of Bezier surfaces NbVPatches is equal to the number of VKnots less one.
") NbVPatches;
		int NbVPatches();

		/****** GeomConvert_BSplineSurfaceToBezierSurface::Patch ******/
		/****** md5 signature: c6a196c86312a5922366f982a923b16c ******/
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
		opencascade::handle<Geom_BezierSurface> Patch(const int UIndex, const int VIndex);

		/****** GeomConvert_BSplineSurfaceToBezierSurface::Patches ******/
		/****** md5 signature: 9323bab72870106e9e165dbe9e32c0ad ******/
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
		/****** md5 signature: f11b8a749df49798b1c2fac1f2170cc0 ******/
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
		/****** md5 signature: 8cba5e68907e7d7ab0cc251f78f4786e ******/
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
		/****** md5 signature: dfa7193ed6a219dc184d7f3ad506b838 ******/
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
		/****** md5 signature: d6d2e54f94800d27ce3193a50a6cee59 ******/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Beziers: TColGeom_Array2OfBezierSurface
Tolerance: double
RemoveKnots: bool (optional, default to true)

Return
-------
None

Description
-----------
Build an Ci uniform (Rational) BSpline surface The highest Continuity Ci is imposed, like the maximal deformation is lower than <Tolerance>. Warning: The Continuity C0 is imposed without any check.
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers, const double Tolerance, const bool RemoveKnots = true);

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::GeomConvert_CompBezierSurfacesToBSplineSurface ******/
		/****** md5 signature: 7ecc3293379c22a52b1caa80156ee863 ******/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Beziers: TColGeom_Array2OfBezierSurface
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UContinuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
VContinuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
Tolerance: double (optional, default to 1.0e-4)

Return
-------
None

Description
-----------
Computes all the data needed to construct a BSpline surface equivalent to the adjacent non-rational Bezier surfaces Beziers grid. Each surface in the Beziers grid becomes a natural patch, limited by knots values, on the BSpline surface whose data is computed. Surfaces in the grid must satisfy the following conditions: - Coincident bounding curves between two consecutive surfaces in a row of the Beziers grid must be u-isoparametric bounding curves of these two surfaces. - Coincident bounding curves between two consecutive surfaces in a column of the Beziers grid must be v-isoparametric bounding curves of these two surfaces. The BSpline surface whose data is computed has the following characteristics: - Its degree in the u (respectively v) parametric direction is equal to that of the Bezier surface which has the highest degree in the u (respectively v) parametric direction in the Beziers grid. - Coincident bounding curves between two consecutive columns of Bezier surfaces in the Beziers grid become u-isoparametric curves corresponding to knots values of the BSpline surface. - Coincident bounding curves between two consecutive rows of Bezier surfaces in the Beziers grid become v-isoparametric curves corresponding to knots values of the BSpline surface. Knots values of the BSpline surface are given in the two tables: - UKnots for the u parametric direction (which corresponds to the order of Bezier surface columns in the Beziers grid), and - VKnots for the v parametric direction (which corresponds to the order of Bezier surface rows in the Beziers grid). The dimensions of UKnots (respectively VKnots) must be equal to the number of columns (respectively, rows) of the Beziers grid, plus 1 . UContinuity and VContinuity, which are both defaulted to GeomAbs_C0, specify the required continuity on the BSpline surface. If the required degree of continuity is greater than 0 in a given parametric direction, a deformation is applied locally on the initial surface (as defined by the Beziers grid) to satisfy this condition. This local deformation is not applied however, if it is greater than Tolerance (defaulted to 1.0 e-7). In such cases, the continuity condition is not satisfied, and the function IsDone will return false. A small tolerance value prevents any modification of the surface and a large tolerance value 'smoothes' the surface. Use the available consultation functions to access the computed data. This data may be used to construct the BSpline surface. Warning The surfaces in the Beziers grid must be adjacent, i.e. two consecutive Bezier surfaces in the grid (in a row or column) must have a coincident bounding curve. In addition, the location of the parameterization on each of these surfaces (i.e. the relative location of u and v isoparametric curves on the surface) is of importance with regard to the positioning of the surfaces in the Beziers grid. Care must be taken with respect to the above, as these properties are not checked and an error may occur if they are not satisfied. Exceptions Standard_DimensionMismatch: - if the number of knots in the UKnots table (i.e. the length of the UKnots array) is not equal to the number of columns of Bezier surfaces in the Beziers grid plus 1, or - if the number of knots in the VKnots table (i.e. the length of the VKnots array) is not equal to the number of rows of Bezier surfaces in the Beziers grid, plus 1. Standard_ConstructionError: - if UContinuity and VContinuity are not equal to one of the following values: GeomAbs_C0, GeomAbs_C1, GeomAbs_C2 and GeomAbs_C3; or - if the number of columns in the Beziers grid is greater than 1, and the required degree of continuity in the u parametric direction is greater than that of the Bezier surface with the highest degree in the u parametric direction (in the Beziers grid), minus 1; or - if the number of rows in the Beziers grid is greater than 1, and the required degree of continuity in the v parametric direction is greater than that of the Bezier surface with the highest degree in the v parametric direction (in the Beziers grid), minus 1 . Standard_NotImplemented if one of the Bezier surfaces in the Beziers grid is rational.
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const GeomAbs_Shape UContinuity = GeomAbs_C0, const GeomAbs_Shape VContinuity = GeomAbs_C0, const double Tolerance = 1.0e-4);

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the conversion was successful. Unless an exception was raised at the time of construction, the conversion of the Bezier surface grid assigned to this algorithm is always carried out. IsDone returns false if the constraints defined at the time of construction cannot be respected. This occurs when there is an incompatibility between a required degree of continuity on the BSpline surface, and the maximum tolerance accepted for local deformations of the surface. In such a case the computed data does not satisfy all the initial constraints.
") IsDone;
		bool IsDone();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbUKnots ******/
		/****** md5 signature: 790406b6b06efba57c5111fd80daea5d ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the U direction of the BSpline surface whose data is computed in this framework.
") NbUKnots;
		int NbUKnots();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbUPoles ******/
		/****** md5 signature: ecab3cbbaf18559e002fccdfa81aa0d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of poles in the U direction of the BSpline surface whose data is computed in this framework.
") NbUPoles;
		int NbUPoles();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbVKnots ******/
		/****** md5 signature: b077d9245cbc08be7809ba04ff1e0c69 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the V direction of the BSpline surface whose data is computed in this framework.
") NbVKnots;
		int NbVKnots();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::NbVPoles ******/
		/****** md5 signature: fd4ae03f2a37db0cb241bb2f458a15bb ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the V direction of the BSpline surface whose data is computed in this framework.
") NbVPoles;
		int NbVPoles();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::Poles ******/
		/****** md5 signature: c90c07737122f9080817a34c63170f34 ******/
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
		/****** md5 signature: 82316803b09fa91a345f15577c8b3c82 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree for the u parametric direction of the BSpline surface whose data is computed in this framework.
") UDegree;
		int UDegree();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::UKnots ******/
		/****** md5 signature: ff5aae7a0e8c2689c96bc87f5fe50138 ******/
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
		/****** md5 signature: e29b833f2aefc8528565e4b41d0fa608 ******/
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
		/****** md5 signature: 10a01c94db483e5b8afe43596e767a03 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree for the v parametric direction of the BSpline surface whose data is computed in this framework.
") VDegree;
		int VDegree();

		/****** GeomConvert_CompBezierSurfacesToBSplineSurface::VKnots ******/
		/****** md5 signature: 65583604631a256aba2ec403706ee8f0 ******/
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
		/****** md5 signature: a5360dec1c11893871c1c42f8f64b8ec ******/
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
Initialize the algorithm - Parameterisation is used to convert.
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
Initialize the algorithm with one curve - Parameterisation is used to convert.
") GeomConvert_CompCurveToBSplineCurve;
		 GeomConvert_CompCurveToBSplineCurve(const opencascade::handle<Geom_BoundedCurve> & BasisCurve, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** GeomConvert_CompCurveToBSplineCurve::Add ******/
		/****** md5 signature: 13546c5d113472075b064611adc1916a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
NewCurve: Geom_BoundedCurve
Tolerance: double
After: bool (optional, default to false)
WithRatio: bool (optional, default to true)
MinM: int (optional, default to 0)

Return
-------
bool

Description
-----------
Append a curve in the BSpline Return False if the curve is not G0 with the BSplineCurve. Tolerance is used to check continuity and decrease Multiplicity at the common Knot until MinM if MinM = 0, the common Knot can be removed //! WithRatio defines whether the resulting curve should have a uniform parameterization. Setting WithRatio to false may greatly decrease the speed of algorithms like CPnts_AbscissaPoint::AdvPerform when applied to the resulting curve.
") Add;
		bool Add(const opencascade::handle<Geom_BoundedCurve> & NewCurve, const double Tolerance, const bool After = false, const bool WithRatio = true, const int MinM = 0);

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
		/****** md5 signature: 7251763f9b127ecb6b8bb897293a0e13 ******/
		%feature("compactdefaultargs") ComputeCircle;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: double
c1: double
c2: double

Return
-------
cf: double
cl: double
Deviation: double

Description
-----------
Tries to convert the given curve to circle with given tolerance. Returns NULL curve if conversion is not possible.
") ComputeCircle;
		static opencascade::handle<Geom_Curve> ComputeCircle(const opencascade::handle<Geom_Curve> & curve, const double tolerance, const double c1, const double c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::ComputeCurve ******/
		/****** md5 signature: 15a759bb6e20bdba4dddee7014a3159d ******/
		%feature("compactdefaultargs") ComputeCurve;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: double
c1: double
c2: double
theCurvType: GeomConvert_ConvType (optional, default to GeomConvert_MinGap)
theTarget: GeomAbs_CurveType (optional, default to GeomAbs_Line)

Return
-------
cf: double
cl: double
theGap: double

Description
-----------
No available documentation.
") ComputeCurve;
		static opencascade::handle<Geom_Curve> ComputeCurve(const opencascade::handle<Geom_Curve> & curve, const double tolerance, const double c1, const double c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const GeomConvert_ConvType theCurvType = GeomConvert_MinGap, const GeomAbs_CurveType theTarget = GeomAbs_Line);

		/****** GeomConvert_CurveToAnaCurve::ComputeEllipse ******/
		/****** md5 signature: 1d8751b4d94898194736e49d6dc249bf ******/
		%feature("compactdefaultargs") ComputeEllipse;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: double
c1: double
c2: double

Return
-------
cf: double
cl: double
Deviation: double

Description
-----------
Tries to convert the given curve to ellipse with given tolerance. Returns NULL curve if conversion is not possible.
") ComputeEllipse;
		static opencascade::handle<Geom_Curve> ComputeEllipse(const opencascade::handle<Geom_Curve> & curve, const double tolerance, const double c1, const double c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::ComputeLine ******/
		/****** md5 signature: 006fbc67acbeb9c373641eb534612c91 ******/
		%feature("compactdefaultargs") ComputeLine;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
tolerance: double
c1: double
c2: double

Return
-------
cf: double
cl: double
Deviation: double

Description
-----------
Tries to convert the given curve to line with given tolerance. Returns NULL curve if conversion is not possible.
") ComputeLine;
		static opencascade::handle<Geom_Line> ComputeLine(const opencascade::handle<Geom_Curve> & curve, const double tolerance, const double c1, const double c2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::ConvertToAnalytical ******/
		/****** md5 signature: 7bde70d4bac43cc95be63d2c3e00e751 ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
theTol: double
theResultCurve: Geom_Curve
F: double
L: double

Return
-------
newF: double
newL: double

Description
-----------
Converts me to analytical if possible with given tolerance. The new first and last parameters are returned to newF, newL.
") ConvertToAnalytical;
		bool ConvertToAnalytical(const double theTol, opencascade::handle<Geom_Curve> & theResultCurve, const double F, const double L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomConvert_CurveToAnaCurve::Gap ******/
		/****** md5 signature: 922e1770d2af6853f54f0633d555eded ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximal deviation of converted surface from the original one computed by last call to ConvertToAnalytical.
") Gap;
		double Gap();

		/****** GeomConvert_CurveToAnaCurve::GetCircle ******/
		/****** md5 signature: 0413f73d56ccaff7f9572178b49cd825 ******/
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
		static bool GetCircle(gp_Circ & Circ, const gp_Pnt & P0, const gp_Pnt & P1, const gp_Pnt & P2);

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
		/****** md5 signature: 2e886128ffcf3430f0ad3fb4f1a64fce ******/
		%feature("compactdefaultargs") GetLine;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
cf: double
cl: double

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
		/****** md5 signature: 461f5fa8ecf9d14e783ccac7e8f73803 ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "
Parameters
----------
aPoints: TColgp_Array1OfPnt
tolerance: double

Return
-------
Deviation: double

Description
-----------
Returns true if the set of points is linear with given tolerance.
") IsLinear;
		static bool IsLinear(const TColgp_Array1OfPnt & aPoints, const double tolerance, Standard_Real &OutValue);

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
		/****** md5 signature: eb49187e44726e8c8b3368cbd61f8083 ******/
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
		/****** md5 signature: dd8b81f9a58471acf6084fdcdf15e2b2 ******/
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
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: b67bcc8946a6ab2107ec916b7e2dc2db ******/
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
Value.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

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
		/****** md5 signature: 45cfafcc6853f5217dcff1ca5ad25fb4 ******/
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
		/****** md5 signature: 4e16429bf795a195f7836963c16aef23 ******/
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
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** GeomConvert_FuncCylinderLSDist::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: b67bcc8946a6ab2107ec916b7e2dc2db ******/
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
Value.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** GeomConvert_FuncCylinderLSDist::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
Value and gradient.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: bb33e9d50fa4e99532ffea124b238699 ******/
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
		/****** md5 signature: 01346cf6a502c63287e1fd86cbc3bf07 ******/
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
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** GeomConvert_FuncSphereLSDist::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		int NbVariables();

		/****** GeomConvert_FuncSphereLSDist::SetPoints ******/
		/****** md5 signature: b67bcc8946a6ab2107ec916b7e2dc2db ******/
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
Value.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** GeomConvert_FuncSphereLSDist::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
Value and gradient.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: ce55baa1af520183e88ddeeab7757d00 ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
InitialToler: double

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Tries to convert the Surface to an Analytic form Returns the result In case of failure, returns a Null Handle //!.
") ConvertToAnalytical;
		opencascade::handle<Geom_Surface> ConvertToAnalytical(const double InitialToler);

		/****** GeomConvert_SurfToAnaSurf::ConvertToAnalytical ******/
		/****** md5 signature: 14fec2c407bf345d1ab57ee509794bdd ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
InitialToler: double
Umin: double
Umax: double
Vmin: double
Vmax: double

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") ConvertToAnalytical;
		opencascade::handle<Geom_Surface> ConvertToAnalytical(const double InitialToler, const double Umin, const double Umax, const double Vmin, const double Vmax);

		/****** GeomConvert_SurfToAnaSurf::Gap ******/
		/****** md5 signature: 922e1770d2af6853f54f0633d555eded ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximal deviation of converted surface from the original one computed by last call to ConvertToAnalytical.
") Gap;
		double Gap();

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
		/****** md5 signature: 6d9426b1d919862e9dba7ba74a17f9c6 ******/
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
		static bool IsCanonical(const opencascade::handle<Geom_Surface> & S);

		/****** GeomConvert_SurfToAnaSurf::IsSame ******/
		/****** md5 signature: 85207932cea6946e88c471348e659ea0 ******/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
tol: double

Return
-------
bool

Description
-----------
Returns true if surfaces is same with the given tolerance.
") IsSame;
		static bool IsSame(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const double tol);

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
		/****** md5 signature: 47ab4b49f639b0a0e2f8e353d2468af2 ******/
		%feature("compactdefaultargs") DegreeToRadian;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve
theSurface: Geom_Surface
theLengthFactor: double
theFactorRadianDegree: double

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Convert 2d curve for change angle unit from degree to radian.
") DegreeToRadian;
		static opencascade::handle<Geom2d_Curve> DegreeToRadian(const opencascade::handle<Geom2d_Curve> & theCurve, const opencascade::handle<Geom_Surface> & theSurface, const double theLengthFactor, const double theFactorRadianDegree);

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
		/****** md5 signature: fb02ac7639b34415a7994654d600d211 ******/
		%feature("compactdefaultargs") RadianToDegree;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve
theSurface: Geom_Surface
theLengthFactor: double
theFactorRadianDegree: double

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Convert 2d curve for change angle unit from radian to degree.
") RadianToDegree;
		static opencascade::handle<Geom2d_Curve> RadianToDegree(const opencascade::handle<Geom2d_Curve> & theCurve, const opencascade::handle<Geom_Surface> & theSurface, const double theLengthFactor, const double theFactorRadianDegree);

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
