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
%define GEOM2DCONVERTDOCSTRING
"Geom2dConvert module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2dconvert.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DCONVERTDOCSTRING) Geom2dConvert


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
#include<Geom2dConvert_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom2d_module.hxx>
#include<TColStd_module.hxx>
#include<Convert_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import TColGeom2d.i
%import TColStd.i
%import Convert.i
%import Adaptor2d.i
%import GeomAbs.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(Geom2dConvert_SequenceOfPPoint) NCollection_Sequence<Geom2dConvert_PPoint>;

%extend NCollection_Sequence<Geom2dConvert_PPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<Geom2dConvert_PPoint> Geom2dConvert_SequenceOfPPoint;
/* end typedefs declaration */

/**********************
* class Geom2dConvert *
**********************/
%rename(geom2dconvert) Geom2dConvert;
class Geom2dConvert {
	public:
		/****** Geom2dConvert::C0BSplineToArrayOfC1BSplineCurve ******/
		/****** md5 signature: 418e41b3f000190b9bb893d6a0f6f5d0 ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
tabBS: TColGeom2d_HArray1OfBSplineCurve
Tolerance: float

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. Tolerance is a geometrical tolerance.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & tabBS, const Standard_Real Tolerance);

		/****** Geom2dConvert::C0BSplineToArrayOfC1BSplineCurve ******/
		/****** md5 signature: 06271ef4a995d870a72c4ea333fb49db ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
tabBS: TColGeom2d_HArray1OfBSplineCurve
AngularTolerance: float
Tolerance: float

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & tabBS, const Standard_Real AngularTolerance, const Standard_Real Tolerance);

		/****** Geom2dConvert::C0BSplineToC1BSplineCurve ******/
		/****** md5 signature: 43d98081fc6289414094aef8a5a8373c ******/
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
Tolerance: float

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns a new BSpline which could still be C0. tolerance is a geometrical tolerance.
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve(opencascade::handle<Geom2d_BSplineCurve> & BS, const Standard_Real Tolerance);

		/****** Geom2dConvert::ConcatC1 ******/
		/****** md5 signature: a14010dff7bc07ad8e245f6a53f4fc55 ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom2d_HArray1OfBSplineCurve
ClosedTolerance: float

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****** Geom2dConvert::ConcatC1 ******/
		/****** md5 signature: 5a277b57b6adb52b8e6f919b7bd0fe59 ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom2d_HArray1OfBSplineCurve
ClosedTolerance: float
AngularTolerance: float

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance, const Standard_Real AngularTolerance);

		/****** Geom2dConvert::ConcatG1 ******/
		/****** md5 signature: d7fe6a64c566dd941ed17b92c56628e5 ******/
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfConcatenated: TColGeom2d_HArray1OfBSplineCurve
ClosedTolerance: float

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates G1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatG1;
		static void ConcatG1(TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****** Geom2dConvert::CurveToBSplineCurve ******/
		/****** md5 signature: 2605e8125c6f357bc9c5d1ed97296078 ******/
		%feature("compactdefaultargs") CurveToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
This function converts a non infinite curve from Geom into a B-spline curve. C must be an ellipse or a circle or a trimmed conic or a trimmed line or a Bezier curve or a trimmed Bezier curve or a BSpline curve or a trimmed BSpline curve or an Offset curve or a trimmed Offset curve. The returned B-spline is not periodic except if C is a Circle or an Ellipse. ParameterisationType applies only if the curve is a Circle or an ellipse: TgtThetaOver2, TgtThetaOver2_1, TgtThetaOver2_2, TgtThetaOver2_3, TgtThetaOver2_4, Purpose: this is the classical rational parameterisation 2 1 - t cos(theta) = ------ 2 1 + t //! 2t sin(theta) = ------ 2 1 + t //! t = tan (theta/2) //! with TgtThetaOver2 the routine will compute the number of spans using the rule num_spans = [ (ULast - UFirst) / 1.2 ] + 1 with TgtThetaOver2_N, N spans will be forced: an error will be raized if (ULast - UFirst) >= PI and N = 1, ULast - UFirst >= 2 PI and N = 2 //! QuasiAngular, here t is a rational function that approximates theta ----> tan(theta/2). Nevetheless the composing with above function yields exact functions whose square sum up to 1 RationalC1 ; t is replaced by a polynomial function of u so as to grant C1 contiuity across knots. Exceptions Standard_DomainError if the curve C is infinite. Standard_ConstructionError: - if C is a complete circle or ellipse, and if Parameterisation is not equal to Convert_TgtThetaOver2 or to Convert_RationalC1, or - if C is a trimmed circle or ellipse and if Parameterisation is equal to Convert_TgtThetaOver2_1 and if U2 - U1 > 0.9999 * Pi where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a half-circle or a half-ellipse, for example), or - if C is a trimmed circle or ellipse and Parameterisation is equal to Convert_TgtThetaOver2_2 and U2 - U1 > 1.9999 * Pi where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a quasi-complete circle or ellipse).
") CurveToBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> CurveToBSplineCurve(const opencascade::handle<Geom2d_Curve> & C, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** Geom2dConvert::SplitBSplineCurve ******/
		/****** md5 signature: 186212ac73a42e139a7d4feef3f60081 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_BSplineCurve
FromK1: int
ToK2: int
SameOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
-- Convert a curve to BSpline by Approximation //! This method computes the arc of B-spline curve between the two knots FromK1 and ToK2. If C is periodic the arc has the same orientation as C if SameOrientation = Standard_True. If C is not periodic SameOrientation is not used for the computation and C is oriented from the knot fromK1 to the knot toK2. We just keep the local definition of C between the knots FromK1 and ToK2. The returned B-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of C. The indexes of the knots FromK1 and ToK2 doesn't include the repetition of multiple knots in their definition. //! Raised if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] Raised if FromK1 = ToK2.
") SplitBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & C, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Boolean SameOrientation = Standard_True);

		/****** Geom2dConvert::SplitBSplineCurve ******/
		/****** md5 signature: 5aaeb3c50208c1ec4ec35beb2023e517 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_BSplineCurve
FromU1: float
ToU2: float
ParametricTolerance: float
SameOrientation: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
This function computes the segment of B-spline curve between the parametric values FromU1, ToU2. If C is periodic the arc has the same orientation as C if SameOrientation = True. If C is not periodic SameOrientation is not used for the computation and C is oriented fromU1 toU2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 are out of the parametric bounds of the curve (The tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance Raised if ParametricTolerance < Resolution from gp.
") SplitBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & C, const Standard_Real FromU1, const Standard_Real ToU2, const Standard_Real ParametricTolerance, const Standard_Boolean SameOrientation = Standard_True);

};


%extend Geom2dConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Geom2dConvert_ApproxArcsSegments *
*****************************************/
class Geom2dConvert_ApproxArcsSegments {
	public:
/* public enums */
enum Status {
	StatusOK = 0,
	StatusNotDone = 1,
	StatusError = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Status(IntEnum):
	StatusOK = 0
	StatusNotDone = 1
	StatusError = 2
StatusOK = Status.StatusOK
StatusNotDone = Status.StatusNotDone
StatusError = Status.StatusError
};
/* end python proxy for enums */

		/****** Geom2dConvert_ApproxArcsSegments::Geom2dConvert_ApproxArcsSegments ******/
		/****** md5 signature: 9436d6631fd8b7c74d966e3a9a65ee33 ******/
		%feature("compactdefaultargs") Geom2dConvert_ApproxArcsSegments;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor2d_Curve2d
theTolerance: float
theAngleTol: float

Return
-------
None

Description
-----------
Constructor.
") Geom2dConvert_ApproxArcsSegments;
		 Geom2dConvert_ApproxArcsSegments(const Adaptor2d_Curve2d & theCurve, const Standard_Real theTolerance, const Standard_Real theAngleTol);

		/****** Geom2dConvert_ApproxArcsSegments::GetResult ******/
		/****** md5 signature: a34db03551bc2315f5a46e5144fc58f3 ******/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Return
-------
TColGeom2d_SequenceOfCurve

Description
-----------
Get the result curve after approximation.
") GetResult;
		TColGeom2d_SequenceOfCurve GetResult();

};


%extend Geom2dConvert_ApproxArcsSegments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dConvert_ApproxCurve *
**********************************/
class Geom2dConvert_ApproxCurve {
	public:
		/****** Geom2dConvert_ApproxCurve::Geom2dConvert_ApproxCurve ******/
		/****** md5 signature: 865981d184c394b2356db9c527a84266 ******/
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2d_Curve
Tol2d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
None

Description
-----------
Constructs an approximation framework defined by - the 2D conic Curve - the tolerance value Tol2d - the degree of continuity Order - the maximum number of segments allowed MaxSegments - the highest degree MaxDegree which the polynomial defining the BSpline is allowed to have.
") Geom2dConvert_ApproxCurve;
		 Geom2dConvert_ApproxCurve(const opencascade::handle<Geom2d_Curve> & Curve, const Standard_Real Tol2d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** Geom2dConvert_ApproxCurve::Geom2dConvert_ApproxCurve ******/
		/****** md5 signature: fef67c6afa73a6f1c88612fc7cbae9d5 ******/
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d
Tol2d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
None

Description
-----------
Constructs an approximation framework defined by - the 2D conic Curve - the tolerance value Tol2d - the degree of continuity Order - the maximum number of segments allowed MaxSegments - the highest degree MaxDegree which the polynomial defining the BSpline is allowed to have.
") Geom2dConvert_ApproxCurve;
		 Geom2dConvert_ApproxCurve(const opencascade::handle<Adaptor2d_Curve2d> & Curve, const Standard_Real Tol2d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** Geom2dConvert_ApproxCurve::Curve ******/
		/****** md5 signature: 1960069de54819d72fccc75ab85806ec ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Returns the 2D BSpline curve resulting from the approximation algorithm.
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();

		/****** Geom2dConvert_ApproxCurve::Dump ******/
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

		/****** Geom2dConvert_ApproxCurve::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance.
") HasResult;
		Standard_Boolean HasResult();

		/****** Geom2dConvert_ApproxCurve::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns Standard_True if the approximation has been done with within required tolerance.
") IsDone;
		Standard_Boolean IsDone();

		/****** Geom2dConvert_ApproxCurve::MaxError ******/
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


%extend Geom2dConvert_ApproxCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class Geom2dConvert_BSplineCurveKnotSplitting *
************************************************/
class Geom2dConvert_BSplineCurveKnotSplitting {
	public:
		/****** Geom2dConvert_BSplineCurveKnotSplitting::Geom2dConvert_BSplineCurveKnotSplitting ******/
		/****** md5 signature: 82665f58283791971d3c2678a64b7a4a ******/
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveKnotSplitting;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom2d_BSplineCurve
ContinuityRange: int

Return
-------
None

Description
-----------
Determines points at which the BSpline curve BasisCurve should be split in order to obtain arcs with a degree of continuity equal to ContinuityRange. These points are knot values of BasisCurve. They are identified by indices in the knots table of BasisCurve. Use the available interrogation functions to access computed values, followed by the global function SplitBSplineCurve (provided by the package Geom2dConvert) to split the curve. Exceptions Standard_RangeError if ContinuityRange is less than zero.
") Geom2dConvert_BSplineCurveKnotSplitting;
		 Geom2dConvert_BSplineCurveKnotSplitting(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve, const Standard_Integer ContinuityRange);

		/****** Geom2dConvert_BSplineCurveKnotSplitting::NbSplits ******/
		/****** md5 signature: 4531d20d48cc2f1c4ba8fba36f455258 ******/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points at which the analysed BSpline curve should be split, in order to obtain arcs with the continuity required by this framework. All these points correspond to knot values. Note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.
") NbSplits;
		Standard_Integer NbSplits();

		/****** Geom2dConvert_BSplineCurveKnotSplitting::SplitValue ******/
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
Returns the split knot of index Index to the split knots table computed in this framework. The returned value is an index in the knots table of the BSpline curve analysed by this algorithm. Notes: - If Index is equal to 1, the corresponding knot gives the first point of the curve. - If Index is equal to the number of split knots computed in this framework, the corresponding point is the last point of the curve. Exceptions Standard_RangeError if Index is less than 1 or greater than the number of split knots computed in this framework.
") SplitValue;
		Standard_Integer SplitValue(const Standard_Integer Index);

		/****** Geom2dConvert_BSplineCurveKnotSplitting::Splitting ******/
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
Loads the SplitValues table with the split knots values computed in this framework. Each value in the table is an index in the knots table of the BSpline curve analysed by this algorithm. The values in SplitValues are given in ascending order and comprise the indices of the knots which give the first and last points of the curve. Use two consecutive values from the table as arguments of the global function SplitBSplineCurve (provided by the package Geom2dConvert) to split the curve. Exceptions Standard_DimensionError if the array SplitValues was not created with the following bounds: - 1, and - the number of split points computed in this framework (as given by the function NbSplits).
") Splitting;
		void Splitting(TColStd_Array1OfInteger & SplitValues);

};


%extend Geom2dConvert_BSplineCurveKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class Geom2dConvert_BSplineCurveToBezierCurve *
************************************************/
class Geom2dConvert_BSplineCurveToBezierCurve {
	public:
		/****** Geom2dConvert_BSplineCurveToBezierCurve::Geom2dConvert_BSplineCurveToBezierCurve ******/
		/****** md5 signature: 94785403141ad27f99b95da499f2604e ******/
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom2d_BSplineCurve

Return
-------
None

Description
-----------
Computes all the data needed to convert - the BSpline curve BasisCurve, into a series of adjacent Bezier arcs. The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used.
") Geom2dConvert_BSplineCurveToBezierCurve;
		 Geom2dConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::Geom2dConvert_BSplineCurveToBezierCurve ******/
		/****** md5 signature: 35135a63b65b320cd2cdd5ef8bc3a232 ******/
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom2d_BSplineCurve
U1: float
U2: float
ParametricTolerance: float

Return
-------
None

Description
-----------
Computes all the data needed to convert the portion of the BSpline curve BasisCurve limited by the two parameter values U1 and U2 for Example if there is a Knot Uk and Uk < U < Uk + ParametricTolerance/2 the last curve corresponds to the span [Uk-1, Uk] and not to [Uk, Uk+1] The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 are out of the parametric bounds of the basis curve [FirstParameter, LastParameter]. The Tolerance criterion is ParametricTolerance. Raised if Abs (U2 - U1) <= ParametricTolerance.
") Geom2dConvert_BSplineCurveToBezierCurve;
		 Geom2dConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve, const Standard_Real U1, const Standard_Real U2, const Standard_Real ParametricTolerance);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::Arc ******/
		/****** md5 signature: 6f8eca87e681791bf36b1028ac6c6130 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
Constructs and returns the Bezier curve of index Index to the table of adjacent Bezier arcs computed by this algorithm. This Bezier curve has the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_OutOfRange if Index is less than 1 or greater than the number of adjacent Bezier arcs computed by this algorithm.
") Arc;
		opencascade::handle<Geom2d_BezierCurve> Arc(const Standard_Integer Index);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::Arcs ******/
		/****** md5 signature: 51fd19b32fea76dfb44e9f64d6a96191 ******/
		%feature("compactdefaultargs") Arcs;
		%feature("autodoc", "
Parameters
----------
Curves: TColGeom2d_Array1OfBezierCurve

Return
-------
None

Description
-----------
Constructs all the Bezier curves whose data is computed by this algorithm and loads these curves into the Curves table. The Bezier curves have the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_DimensionError if the Curves array was not created with the following bounds: - 1 , and - the number of adjacent Bezier arcs computed by this algorithm (as given by the function NbArcs).
") Arcs;
		void Arcs(TColGeom2d_Array1OfBezierCurve & Curves);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::Knots ******/
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
This methode returns the bspline's knots associated to the converted arcs Raises DimensionError if the length of Curves is not equal to NbArcs + 1.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::NbArcs ******/
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


%extend Geom2dConvert_BSplineCurveToBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class Geom2dConvert_CompCurveToBSplineCurve *
**********************************************/
class Geom2dConvert_CompCurveToBSplineCurve {
	public:
		/****** Geom2dConvert_CompCurveToBSplineCurve::Geom2dConvert_CompCurveToBSplineCurve ******/
		/****** md5 signature: e25e84ddfd150ca07da5ea068bcdb97a ******/
		%feature("compactdefaultargs") Geom2dConvert_CompCurveToBSplineCurve;
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
") Geom2dConvert_CompCurveToBSplineCurve;
		 Geom2dConvert_CompCurveToBSplineCurve(const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** Geom2dConvert_CompCurveToBSplineCurve::Geom2dConvert_CompCurveToBSplineCurve ******/
		/****** md5 signature: 703cf5ab91dccabeaa3de22a9dd90aaa ******/
		%feature("compactdefaultargs") Geom2dConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom2d_BoundedCurve
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
Initialize the algorithme with one curve - Parameterisation is used to convert.
") Geom2dConvert_CompCurveToBSplineCurve;
		 Geom2dConvert_CompCurveToBSplineCurve(const opencascade::handle<Geom2d_BoundedCurve> & BasisCurve, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** Geom2dConvert_CompCurveToBSplineCurve::Add ******/
		/****** md5 signature: 98a5e3fa8e5a538111199b5b805f80b1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
NewCurve: Geom2d_BoundedCurve
Tolerance: float
After: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Append a curve in the BSpline Return False if the curve is not G0 with the BSplineCurve. Tolerance is used to check continuity and decrease Multiplicity at the common Knot After is useful if BasisCurve is a closed curve .
") Add;
		Standard_Boolean Add(const opencascade::handle<Geom2d_BoundedCurve> & NewCurve, const Standard_Real Tolerance, const Standard_Boolean After = Standard_False);

		/****** Geom2dConvert_CompCurveToBSplineCurve::BSplineCurve ******/
		/****** md5 signature: 2fb696f4c732267032b216f38baea435 ******/
		%feature("compactdefaultargs") BSplineCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSplineCurve;
		opencascade::handle<Geom2d_BSplineCurve> BSplineCurve();

		/****** Geom2dConvert_CompCurveToBSplineCurve::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear result curve.
") Clear;
		void Clear();

};


%extend Geom2dConvert_CompCurveToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2dConvert_PPoint *
*****************************/
class Geom2dConvert_PPoint {
	public:
		/****** Geom2dConvert_PPoint::Geom2dConvert_PPoint ******/
		/****** md5 signature: 9f97d79e0015cb789a1360bfe27a3d23 ******/
		%feature("compactdefaultargs") Geom2dConvert_PPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dConvert_PPoint;
		 Geom2dConvert_PPoint();

		/****** Geom2dConvert_PPoint::Geom2dConvert_PPoint ******/
		/****** md5 signature: 83fab53d710c50a2f43ab7d934212a29 ******/
		%feature("compactdefaultargs") Geom2dConvert_PPoint;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_XY
theD1: gp_XY

Return
-------
None

Description
-----------
Constructor.
") Geom2dConvert_PPoint;
		 Geom2dConvert_PPoint(const Standard_Real theParameter, const gp_XY & thePoint, const gp_XY & theD1);

		/****** Geom2dConvert_PPoint::Geom2dConvert_PPoint ******/
		/****** md5 signature: 8ca77da2aff18500051b72ae40ec0e35 ******/
		%feature("compactdefaultargs") Geom2dConvert_PPoint;
		%feature("autodoc", "
Parameters
----------
theParameter: float
theAdaptor: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Constructor.
") Geom2dConvert_PPoint;
		 Geom2dConvert_PPoint(const Standard_Real theParameter, const Adaptor2d_Curve2d & theAdaptor);

		/****** Geom2dConvert_PPoint::D1 ******/
		/****** md5 signature: 363c5218bb91ef153804430b7f543e9a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Query the first derivatives.
") D1;
		const gp_XY D1();

		/****** Geom2dConvert_PPoint::Dist ******/
		/****** md5 signature: fbe08e9f862a6f276bcef10b706a490f ******/
		%feature("compactdefaultargs") Dist;
		%feature("autodoc", "
Parameters
----------
theOth: Geom2dConvert_PPoint

Return
-------
float

Description
-----------
Compute the distance between two 2d points.
") Dist;
		Standard_Real Dist(const Geom2dConvert_PPoint & theOth);

		/****** Geom2dConvert_PPoint::Parameter ******/
		/****** md5 signature: 5d3812215998dd4ad07d1ceb370aa6b8 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Query the parameter value.
") Parameter;
		Standard_Real Parameter();

		/****** Geom2dConvert_PPoint::Point ******/
		/****** md5 signature: 0d3e0ab14ec3cab7ff6e03fe3e9807fc ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Query the point location.
") Point;
		const gp_XY Point();

		/****** Geom2dConvert_PPoint::SetD1 ******/
		/****** md5 signature: 5a5de6ec69bb60e69527c94d00e3b4b8 ******/
		%feature("compactdefaultargs") SetD1;
		%feature("autodoc", "
Parameters
----------
theD1: gp_XY

Return
-------
None

Description
-----------
Change the value of the derivative at the point.
") SetD1;
		void SetD1(const gp_XY & theD1);


%extend{
    bool __ne_wrapper__(const Geom2dConvert_PPoint other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __eq_wrapper__(const Geom2dConvert_PPoint other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend Geom2dConvert_PPoint {
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
def geom2dconvert_C0BSplineToArrayOfC1BSplineCurve(*args):
	return geom2dconvert.C0BSplineToArrayOfC1BSplineCurve(*args)

@deprecated
def geom2dconvert_C0BSplineToArrayOfC1BSplineCurve(*args):
	return geom2dconvert.C0BSplineToArrayOfC1BSplineCurve(*args)

@deprecated
def geom2dconvert_C0BSplineToC1BSplineCurve(*args):
	return geom2dconvert.C0BSplineToC1BSplineCurve(*args)

@deprecated
def geom2dconvert_ConcatC1(*args):
	return geom2dconvert.ConcatC1(*args)

@deprecated
def geom2dconvert_ConcatC1(*args):
	return geom2dconvert.ConcatC1(*args)

@deprecated
def geom2dconvert_ConcatG1(*args):
	return geom2dconvert.ConcatG1(*args)

@deprecated
def geom2dconvert_CurveToBSplineCurve(*args):
	return geom2dconvert.CurveToBSplineCurve(*args)

@deprecated
def geom2dconvert_SplitBSplineCurve(*args):
	return geom2dconvert.SplitBSplineCurve(*args)

@deprecated
def geom2dconvert_SplitBSplineCurve(*args):
	return geom2dconvert.SplitBSplineCurve(*args)

}
