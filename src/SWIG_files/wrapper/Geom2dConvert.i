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
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************
* class Geom2dConvert *
**********************/
%rename(geom2dconvert) Geom2dConvert;
class Geom2dConvert {
	public:
		/****** Geom2dConvert::C0BSplineToArrayOfC1BSplineCurve ******/
		/****** md5 signature: 0521cffd444c8568f2f3e1ae64cf221e ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
tabBS: NCollection_HArray1<
Tolerance: double

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. Tolerance is a geometrical tolerance.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<NCollection_HArray1<opencascade::handle<Geom2d_BSplineCurve> > > & tabBS, const double Tolerance);

		/****** Geom2dConvert::C0BSplineToArrayOfC1BSplineCurve ******/
		/****** md5 signature: 100d0c7c18c9e0c2d75d80a28a8bca90 ******/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
tabBS: NCollection_HArray1<
AngularTolerance: double
Tolerance: double

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance.
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<NCollection_HArray1<opencascade::handle<Geom2d_BSplineCurve> > > & tabBS, const double AngularTolerance, const double Tolerance);

		/****** Geom2dConvert::C0BSplineToC1BSplineCurve ******/
		/****** md5 signature: 2952d1f61314338daedceedc133e42eb ******/
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
Tolerance: double

Return
-------
None

Description
-----------
This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns a new BSpline which could still be C0. tolerance is a geometrical tolerance.
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve(opencascade::handle<Geom2d_BSplineCurve> & BS, const double Tolerance);

		/****** Geom2dConvert::ConcatC1 ******/
		/****** md5 signature: d221ffe7e52018673446e188413ae15e ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: Geom2d_BSplineCurve
ArrayOfToler: NCollection_Array1<double>
ArrayOfIndices: NCollection_HArray1<int
ArrayOfConcatenated: NCollection_HArray1<
ClosedTolerance: double

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(NCollection_Array1<opencascade::handle<Geom2d_BSplineCurve> > & ArrayOfCurves, const NCollection_Array1<double> & ArrayOfToler, opencascade::handle<NCollection_HArray1<int> > & ArrayOfIndices, opencascade::handle<NCollection_HArray1<opencascade::handle<Geom2d_BSplineCurve> > > & ArrayOfConcatenated, Standard_Boolean &OutValue, const double ClosedTolerance);

		/****** Geom2dConvert::ConcatC1 ******/
		/****** md5 signature: 17e56e215492d0c5354740f16edbf4a5 ******/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: Geom2d_BSplineCurve
ArrayOfToler: NCollection_Array1<double>
ArrayOfIndices: NCollection_HArray1<int
ArrayOfConcatenated: NCollection_HArray1<
ClosedTolerance: double
AngularTolerance: double

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatC1;
		static void ConcatC1(NCollection_Array1<opencascade::handle<Geom2d_BSplineCurve> > & ArrayOfCurves, const NCollection_Array1<double> & ArrayOfToler, opencascade::handle<NCollection_HArray1<int> > & ArrayOfIndices, opencascade::handle<NCollection_HArray1<opencascade::handle<Geom2d_BSplineCurve> > > & ArrayOfConcatenated, Standard_Boolean &OutValue, const double ClosedTolerance, const double AngularTolerance);

		/****** Geom2dConvert::ConcatG1 ******/
		/****** md5 signature: 2bc189a116493fb64f76810ed3cd9848 ******/
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "
Parameters
----------
ArrayOfCurves: Geom2d_BSplineCurve
ArrayOfToler: NCollection_Array1<double>
ArrayOfConcatenated: NCollection_HArray1<
ClosedTolerance: double

Return
-------
ClosedFlag: bool

Description
-----------
This Method concatenates G1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedFlag indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0 ClosedFlag becomes False on the output if it is impossible to build closed curve.
") ConcatG1;
		static void ConcatG1(NCollection_Array1<opencascade::handle<Geom2d_BSplineCurve> > & ArrayOfCurves, const NCollection_Array1<double> & ArrayOfToler, opencascade::handle<NCollection_HArray1<opencascade::handle<Geom2d_BSplineCurve> > > & ArrayOfConcatenated, Standard_Boolean &OutValue, const double ClosedTolerance);

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
		/****** md5 signature: 0eed7e0e4c6113b00bdcc672e5c3d5e6 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_BSplineCurve
FromK1: int
ToK2: int
SameOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Convert a curve to BSpline by Approximation //! This method computes the arc of B-spline curve between the two knots FromK1 and ToK2. If C is periodic the arc has the same orientation as C if SameOrientation = true. If C is not periodic SameOrientation is not used for the computation and C is oriented from the knot fromK1 to the knot toK2. We just keep the local definition of C between the knots FromK1 and ToK2. The returned B-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of C. The indexes of the knots FromK1 and ToK2 doesn't include the repetition of multiple knots in their definition. //! Raised if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] Raised if FromK1 = ToK2.
") SplitBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & C, const int FromK1, const int ToK2, const bool SameOrientation = true);

		/****** Geom2dConvert::SplitBSplineCurve ******/
		/****** md5 signature: 8270eec43716e43a61fcf250e86f29a2 ******/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_BSplineCurve
FromU1: double
ToU2: double
ParametricTolerance: double
SameOrientation: bool (optional, default to true)

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
This function computes the segment of B-spline curve between the parametric values FromU1, ToU2. If C is periodic the arc has the same orientation as C if SameOrientation = True. If C is not periodic SameOrientation is not used for the computation and C is oriented fromU1 toU2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 are out of the parametric bounds of the curve (The tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance Raised if ParametricTolerance < Resolution from gp.
") SplitBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & C, const double FromU1, const double ToU2, const double ParametricTolerance, const bool SameOrientation = true);

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
		/****** md5 signature: 95a272638ae0fa737deebb61420d5056 ******/
		%feature("compactdefaultargs") Geom2dConvert_ApproxArcsSegments;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor2d_Curve2d
theTolerance: double
theAngleTol: double

Return
-------
None

Description
-----------
Constructor.
") Geom2dConvert_ApproxArcsSegments;
		 Geom2dConvert_ApproxArcsSegments(const Adaptor2d_Curve2d & theCurve, const double theTolerance, const double theAngleTol);

		/****** Geom2dConvert_ApproxArcsSegments::GetResult ******/
		/****** md5 signature: 3c1ce7d090d65b2db875d85c30a9dcd8 ******/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<Geom2d_Curve>>

Description
-----------
Get the result curve after approximation.
") GetResult;
		const NCollection_Sequence<opencascade::handle<Geom2d_Curve>> & GetResult();

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
		/****** md5 signature: f33ed000964b44eabcdc1bd3e2cd8701 ******/
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2d_Curve
Tol2d: double
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
		 Geom2dConvert_ApproxCurve(const opencascade::handle<Geom2d_Curve> & Curve, const double Tol2d, const GeomAbs_Shape Order, const int MaxSegments, const int MaxDegree);

		/****** Geom2dConvert_ApproxCurve::Geom2dConvert_ApproxCurve ******/
		/****** md5 signature: 0d7ecced8dd8b2abefbd91cd140d6123 ******/
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d
Tol2d: double
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
		 Geom2dConvert_ApproxCurve(const opencascade::handle<Adaptor2d_Curve2d> & Curve, const double Tol2d, const GeomAbs_Shape Order, const int MaxSegments, const int MaxDegree);

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
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the approximation did come out with a result that is not NECESSARELY within the required tolerance.
") HasResult;
		bool HasResult();

		/****** Geom2dConvert_ApproxCurve::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the approximation has been done with within required tolerance.
") IsDone;
		bool IsDone();

		/****** Geom2dConvert_ApproxCurve::MaxError ******/
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
		/****** md5 signature: 262a1c73da414ce6c981b5b6c554fef0 ******/
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
		 Geom2dConvert_BSplineCurveKnotSplitting(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve, const int ContinuityRange);

		/****** Geom2dConvert_BSplineCurveKnotSplitting::NbSplits ******/
		/****** md5 signature: 450e59ea60ccd5f46ae4d2b16e989c5a ******/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points at which the analysed BSpline curve should be split, in order to obtain arcs with the continuity required by this framework. All these points correspond to knot values. Note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.
") NbSplits;
		int NbSplits();

		/****** Geom2dConvert_BSplineCurveKnotSplitting::SplitValue ******/
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
Returns the split knot of index Index to the split knots table computed in this framework. The returned value is an index in the knots table of the BSpline curve analysed by this algorithm. Notes: - If Index is equal to 1, the corresponding knot gives the first point of the curve. - If Index is equal to the number of split knots computed in this framework, the corresponding point is the last point of the curve. Exceptions Standard_RangeError if Index is less than 1 or greater than the number of split knots computed in this framework.
") SplitValue;
		int SplitValue(const int Index);

		/****** Geom2dConvert_BSplineCurveKnotSplitting::Splitting ******/
		/****** md5 signature: 6e6d594c00cac556bf0f204ddde3dabf ******/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "
Parameters
----------
SplitValues: NCollection_Array1<int>

Return
-------
None

Description
-----------
Loads the SplitValues table with the split knots values computed in this framework. Each value in the table is an index in the knots table of the BSpline curve analysed by this algorithm. The values in SplitValues are given in ascending order and comprise the indices of the knots which give the first and last points of the curve. Use two consecutive values from the table as arguments of the global function SplitBSplineCurve (provided by the package Geom2dConvert) to split the curve. Exceptions Standard_DimensionError if the array SplitValues was not created with the following bounds: - 1, and - the number of split points computed in this framework (as given by the function NbSplits).
") Splitting;
		void Splitting(NCollection_Array1<int> & SplitValues);

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
		/****** md5 signature: f069dbb2133fc4c8521970e60dd6be0f ******/
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "
Parameters
----------
BasisCurve: Geom2d_BSplineCurve
U1: double
U2: double
ParametricTolerance: double

Return
-------
None

Description
-----------
Computes all the data needed to convert the portion of the BSpline curve BasisCurve limited by the two parameter values U1 and U2 for Example if there is a Knot Uk and Uk < U < Uk + ParametricTolerance/2 the last curve corresponds to the span [Uk-1, Uk] and not to [Uk, Uk+1] The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 are out of the parametric bounds of the basis curve [FirstParameter, LastParameter]. The Tolerance criterion is ParametricTolerance. Raised if Abs (U2 - U1) <= ParametricTolerance.
") Geom2dConvert_BSplineCurveToBezierCurve;
		 Geom2dConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve, const double U1, const double U2, const double ParametricTolerance);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::Arc ******/
		/****** md5 signature: 599e86a6443cf3f34f1d5449c41ff45c ******/
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
		opencascade::handle<Geom2d_BezierCurve> Arc(const int Index);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::Arcs ******/
		/****** md5 signature: be21a17f406bac49c1d672cb848304b2 ******/
		%feature("compactdefaultargs") Arcs;
		%feature("autodoc", "
Parameters
----------
Curves: Geom2d_BezierCurve

Return
-------
None

Description
-----------
Constructs all the Bezier curves whose data is computed by this algorithm and loads these curves into the Curves table. The Bezier curves have the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_DimensionError if the Curves array was not created with the following bounds: - 1 , and - the number of adjacent Bezier arcs computed by this algorithm (as given by the function NbArcs).
") Arcs;
		void Arcs(NCollection_Array1<opencascade::handle<Geom2d_BezierCurve> > & Curves);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::Knots ******/
		/****** md5 signature: 0c997620b63f032cdc3c9768bd4c0468 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
This methode returns the bspline's knots associated to the converted arcs Raises DimensionError if the length of Curves is not equal to NbArcs + 1.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** Geom2dConvert_BSplineCurveToBezierCurve::NbArcs ******/
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
Initialize the algorithm - Parameterisation is used to convert.
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
Initialize the algorithm with one curve - Parameterisation is used to convert.
") Geom2dConvert_CompCurveToBSplineCurve;
		 Geom2dConvert_CompCurveToBSplineCurve(const opencascade::handle<Geom2d_BoundedCurve> & BasisCurve, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** Geom2dConvert_CompCurveToBSplineCurve::Add ******/
		/****** md5 signature: a3dc7c8bdb71b4e71a4d4c365fa78418 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
NewCurve: Geom2d_BoundedCurve
Tolerance: double
After: bool (optional, default to false)

Return
-------
bool

Description
-----------
Append a curve in the BSpline Return False if the curve is not G0 with the BSplineCurve. Tolerance is used to check continuity and decrease Multiplicity at the common Knot After is useful if BasisCurve is a closed curve .
") Add;
		bool Add(const opencascade::handle<Geom2d_BoundedCurve> & NewCurve, const double Tolerance, const bool After = false);

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
		/****** md5 signature: e2855923996b1bde16594f278678d8af ******/
		%feature("compactdefaultargs") Geom2dConvert_PPoint;
		%feature("autodoc", "
Parameters
----------
theParameter: double
thePoint: gp_XY
theD1: gp_XY

Return
-------
None

Description
-----------
Constructor.
") Geom2dConvert_PPoint;
		 Geom2dConvert_PPoint(const double theParameter, const gp_XY & thePoint, const gp_XY & theD1);

		/****** Geom2dConvert_PPoint::Geom2dConvert_PPoint ******/
		/****** md5 signature: 195cf2572702d0094455195b82b2b6ef ******/
		%feature("compactdefaultargs") Geom2dConvert_PPoint;
		%feature("autodoc", "
Parameters
----------
theParameter: double
theAdaptor: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Constructor.
") Geom2dConvert_PPoint;
		 Geom2dConvert_PPoint(const double theParameter, const Adaptor2d_Curve2d & theAdaptor);

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
		/****** md5 signature: eabbba68d29d58b5f0a49e835f349d03 ******/
		%feature("compactdefaultargs") Dist;
		%feature("autodoc", "
Parameters
----------
theOth: Geom2dConvert_PPoint

Return
-------
double

Description
-----------
Compute the distance between two 2d points.
") Dist;
		double Dist(const Geom2dConvert_PPoint & theOth);

		/****** Geom2dConvert_PPoint::Parameter ******/
		/****** md5 signature: c0b45528e8667a6c37e49cb918397f85 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Query the parameter value.
") Parameter;
		double Parameter();

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
