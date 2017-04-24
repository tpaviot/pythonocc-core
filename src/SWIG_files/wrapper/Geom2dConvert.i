/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Geom2dConvert

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Geom2dConvert_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geom2dconvert) Geom2dConvert;
class Geom2dConvert {
	public:
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "	* -- Convert a curve to BSpline by Approximation //! This method computes the arc of B-spline curve between the two knots FromK1 and ToK2. If C is periodic the arc has the same orientation as C if SameOrientation = Standard_True. If C is not periodic SameOrientation is not used for the computation and C is oriented from the knot fromK1 to the knot toK2. We just keep the local definition of C between the knots FromK1 and ToK2. The returned B-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of C. The indexes of the knots FromK1 and ToK2 doesn't include the repetition of multiple knots in their definition. //! Raised if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] Raised if FromK1 = ToK2

	:param C:
	:type C: Handle_Geom2d_BSplineCurve &
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: Handle_Geom2d_BSplineCurve
") SplitBSplineCurve;
		static Handle_Geom2d_BSplineCurve SplitBSplineCurve (const Handle_Geom2d_BSplineCurve & C,const Standard_Integer FromK1,const Standard_Integer ToK2,const Standard_Boolean SameOrientation = Standard_True);
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "	* This function computes the segment of B-spline curve between the parametric values FromU1, ToU2. If C is periodic the arc has the same orientation as C if SameOrientation = True. If C is not periodic SameOrientation is not used for the computation and C is oriented fromU1 toU2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 are out of the parametric bounds of the curve (The tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance Raised if ParametricTolerance < Resolution from gp.

	:param C:
	:type C: Handle_Geom2d_BSplineCurve &
	:param FromU1:
	:type FromU1: float
	:param ToU2:
	:type ToU2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: Handle_Geom2d_BSplineCurve
") SplitBSplineCurve;
		static Handle_Geom2d_BSplineCurve SplitBSplineCurve (const Handle_Geom2d_BSplineCurve & C,const Standard_Real FromU1,const Standard_Real ToU2,const Standard_Real ParametricTolerance,const Standard_Boolean SameOrientation = Standard_True);
		%feature("compactdefaultargs") CurveToBSplineCurve;
		%feature("autodoc", "	* This function converts a non infinite curve from Geom into a B-spline curve. C must be an ellipse or a circle or a trimmed conic or a trimmed line or a Bezier curve or a trimmed Bezier curve or a BSpline curve or a trimmed BSpline curve or an Offset curve or a trimmed Offset curve. The returned B-spline is not periodic except if C is a Circle or an Ellipse. ParameterisationType applies only if the curve is a Circle or an ellipse : TgtThetaOver2, TgtThetaOver2_1, TgtThetaOver2_2, TgtThetaOver2_3, TgtThetaOver2_4, Purpose: this is the classical rational parameterisation 2 1 - t cos(theta) = ------ 2 1 + t //! 2t sin(theta) = ------ 2 1 + t //! t = tan (theta/2) //! with TgtThetaOver2 the routine will compute the number of spans using the rule num_spans = [ (ULast - UFirst) / 1.2 ] + 1 with TgtThetaOver2_N, N spans will be forced: an error will be raized if (ULast - UFirst) >= PI and N = 1, ULast - UFirst >= 2 PI and N = 2 //! QuasiAngular, here t is a rational function that approximates theta ----> tan(theta/2). Neverthless the composing with above function yields exact functions whose square sum up to 1 RationalC1 ; t is replaced by a polynomial function of u so as to grant C1 contiuity across knots. Exceptions Standard_DomainError if the curve C is infinite. Standard_ConstructionError: - if C is a complete circle or ellipse, and if Parameterisation is not equal to Convert_TgtThetaOver2 or to Convert_RationalC1, or - if C is a trimmed circle or ellipse and if Parameterisation is equal to Convert_TgtThetaOver2_1 and if U2 - U1 > 0.9999 * Pi where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a half-circle or a half-ellipse, for example), or - if C is a trimmed circle or ellipse and Parameterisation is equal to Convert_TgtThetaOver2_2 and U2 - U1 > 1.9999 * Pi where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a quasi-complete circle or ellipse).

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: Handle_Geom2d_BSplineCurve
") CurveToBSplineCurve;
		static Handle_Geom2d_BSplineCurve CurveToBSplineCurve (const Handle_Geom2d_Curve & C,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "	* This Method concatenates G1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedTolerance indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve &
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal &
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: Handle_TColGeom2d_HArray1OfBSplineCurve &
	:param ClosedFlag:
	:type ClosedFlag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:rtype: void
") ConcatG1;
		static void ConcatG1 (TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves,const TColStd_Array1OfReal & ArrayOfToler,Handle_TColGeom2d_HArray1OfBSplineCurve & ArrayOfConcatenated,const Standard_Boolean ClosedFlag,const Standard_Real ClosedTolerance);
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "	* This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedTolerance indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve &
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal &
	:param ArrayOfIndices:
	:type ArrayOfIndices: Handle_TColStd_HArray1OfInteger &
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: Handle_TColGeom2d_HArray1OfBSplineCurve &
	:param ClosedFlag:
	:type ClosedFlag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:rtype: void
") ConcatC1;
		static void ConcatC1 (TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves,const TColStd_Array1OfReal & ArrayOfToler,Handle_TColStd_HArray1OfInteger & ArrayOfIndices,Handle_TColGeom2d_HArray1OfBSplineCurve & ArrayOfConcatenated,const Standard_Boolean ClosedFlag,const Standard_Real ClosedTolerance);
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "	* This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedTolerance indicates if the ArrayOfCurves is closed. In this case ClosedTolerance contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve &
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal &
	:param ArrayOfIndices:
	:type ArrayOfIndices: Handle_TColStd_HArray1OfInteger &
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: Handle_TColGeom2d_HArray1OfBSplineCurve &
	:param ClosedFlag:
	:type ClosedFlag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: void
") ConcatC1;
		static void ConcatC1 (TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves,const TColStd_Array1OfReal & ArrayOfToler,Handle_TColStd_HArray1OfInteger & ArrayOfIndices,Handle_TColGeom2d_HArray1OfBSplineCurve & ArrayOfConcatenated,const Standard_Boolean ClosedFlag,const Standard_Real ClosedTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "	* This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns a new BSpline which could still be C0. tolerance is a geometrical tolerance

	:param BS:
	:type BS: Handle_Geom2d_BSplineCurve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: void
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve (Handle_Geom2d_BSplineCurve & BS,const Standard_Real Tolerance);
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "	* This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. Tolerance is a geometrical tolerance

	:param BS:
	:type BS: Handle_Geom2d_BSplineCurve &
	:param tabBS:
	:type tabBS: Handle_TColGeom2d_HArray1OfBSplineCurve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: void
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve (const Handle_Geom2d_BSplineCurve & BS,Handle_TColGeom2d_HArray1OfBSplineCurve & tabBS,const Standard_Real Tolerance);
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "	* This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance

	:param BS:
	:type BS: Handle_Geom2d_BSplineCurve &
	:param tabBS:
	:type tabBS: Handle_TColGeom2d_HArray1OfBSplineCurve &
	:param AngularTolerance:
	:type AngularTolerance: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: void
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve (const Handle_Geom2d_BSplineCurve & BS,Handle_TColGeom2d_HArray1OfBSplineCurve & tabBS,const Standard_Real AngularTolerance,const Standard_Real Tolerance);
};


%extend Geom2dConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dConvert_ApproxCurve;
class Geom2dConvert_ApproxCurve {
	public:
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "	* Constructs an approximation framework defined by - the 2D conic Curve - the tolerance value Tol2d - the degree of continuity Order - the maximum number of segments allowed MaxSegments - the highest degree MaxDegree which the polynomial defining the BSpline is allowed to have.

	:param Curve:
	:type Curve: Handle_Geom2d_Curve &
	:param Tol2d:
	:type Tol2d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") Geom2dConvert_ApproxCurve;
		 Geom2dConvert_ApproxCurve (const Handle_Geom2d_Curve & Curve,const Standard_Real Tol2d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "	* Constructs an approximation framework defined by - the 2D conic Curve - the tolerance value Tol2d - the degree of continuity Order - the maximum number of segments allowed MaxSegments - the highest degree MaxDegree which the polynomial defining the BSpline is allowed to have.

	:param Curve:
	:type Curve: Handle_Adaptor2d_HCurve2d &
	:param Tol2d:
	:type Tol2d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") Geom2dConvert_ApproxCurve;
		 Geom2dConvert_ApproxCurve (const Handle_Adaptor2d_HCurve2d & Curve,const Standard_Real Tol2d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the 2D BSpline curve resulting from the approximation algorithm.

	:rtype: Handle_Geom2d_BSplineCurve
") Curve;
		Handle_Geom2d_BSplineCurve Curve ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns Standard_True if the approximation has been done with within requiered tolerance

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	* Returns the greatest distance between a point on the source conic and the BSpline curve resulting from the approximation. (>0 when an approximation has been done, 0 if no approximation)

	:rtype: float
") MaxError;
		Standard_Real MaxError ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend Geom2dConvert_ApproxCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dConvert_BSplineCurveKnotSplitting;
class Geom2dConvert_BSplineCurveKnotSplitting {
	public:
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveKnotSplitting;
		%feature("autodoc", "	* Determines points at which the BSpline curve BasisCurve should be split in order to obtain arcs with a degree of continuity equal to ContinuityRange. These points are knot values of BasisCurve. They are identified by indices in the knots table of BasisCurve. Use the available interrogation functions to access computed values, followed by the global function SplitBSplineCurve (provided by the package Geom2dConvert) to split the curve. Exceptions Standard_RangeError if ContinuityRange is less than zero.

	:param BasisCurve:
	:type BasisCurve: Handle_Geom2d_BSplineCurve &
	:param ContinuityRange:
	:type ContinuityRange: int
	:rtype: None
") Geom2dConvert_BSplineCurveKnotSplitting;
		 Geom2dConvert_BSplineCurveKnotSplitting (const Handle_Geom2d_BSplineCurve & BasisCurve,const Standard_Integer ContinuityRange);
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "	* Returns the number of points at which the analysed BSpline curve should be split, in order to obtain arcs with the continuity required by this framework. All these points correspond to knot values. Note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.

	:rtype: int
") NbSplits;
		Standard_Integer NbSplits ();
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "	* Loads the SplitValues table with the split knots values computed in this framework. Each value in the table is an index in the knots table of the BSpline curve analysed by this algorithm. The values in SplitValues are given in ascending order and comprise the indices of the knots which give the first and last points of the curve. Use two consecutive values from the table as arguments of the global function SplitBSplineCurve (provided by the package Geom2dConvert) to split the curve. Exceptions Standard_DimensionError if the array SplitValues was not created with the following bounds: - 1, and - the number of split points computed in this framework (as given by the function NbSplits).

	:param SplitValues:
	:type SplitValues: TColStd_Array1OfInteger &
	:rtype: None
") Splitting;
		void Splitting (TColStd_Array1OfInteger & SplitValues);
		%feature("compactdefaultargs") SplitValue;
		%feature("autodoc", "	* Returns the split knot of index Index to the split knots table computed in this framework. The returned value is an index in the knots table of the BSpline curve analysed by this algorithm. Notes: - If Index is equal to 1, the corresponding knot gives the first point of the curve. - If Index is equal to the number of split knots computed in this framework, the corresponding point is the last point of the curve. Exceptions Standard_RangeError if Index is less than 1 or greater than the number of split knots computed in this framework.

	:param Index:
	:type Index: int
	:rtype: int
") SplitValue;
		Standard_Integer SplitValue (const Standard_Integer Index);
};


%extend Geom2dConvert_BSplineCurveKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dConvert_BSplineCurveToBezierCurve;
class Geom2dConvert_BSplineCurveToBezierCurve {
	public:
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "	* Computes all the data needed to convert - the BSpline curve BasisCurve, into a series of adjacent Bezier arcs. The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used.

	:param BasisCurve:
	:type BasisCurve: Handle_Geom2d_BSplineCurve &
	:rtype: None
") Geom2dConvert_BSplineCurveToBezierCurve;
		 Geom2dConvert_BSplineCurveToBezierCurve (const Handle_Geom2d_BSplineCurve & BasisCurve);
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "	* Computes all the data needed to convert the portion of the BSpline curve BasisCurve limited by the two parameter values U1 and U2 for Example if there is a Knot Uk and Uk < U < Uk + ParametricTolerance/2 the last curve corresponds to the span [Uk-1, Uk] and not to [Uk, Uk+1] The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 are out of the parametric bounds of the basis curve [FirstParameter, LastParameter]. The Tolerance criterion is ParametricTolerance. Raised if Abs (U2 - U1) <= ParametricTolerance.

	:param BasisCurve:
	:type BasisCurve: Handle_Geom2d_BSplineCurve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:rtype: None
") Geom2dConvert_BSplineCurveToBezierCurve;
		 Geom2dConvert_BSplineCurveToBezierCurve (const Handle_Geom2d_BSplineCurve & BasisCurve,const Standard_Real U1,const Standard_Real U2,const Standard_Real ParametricTolerance);
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	* Constructs and returns the Bezier curve of index Index to the table of adjacent Bezier arcs computed by this algorithm. This Bezier curve has the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_OutOfRange if Index is less than 1 or greater than the number of adjacent Bezier arcs computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BezierCurve
") Arc;
		Handle_Geom2d_BezierCurve Arc (const Standard_Integer Index);
		%feature("compactdefaultargs") Arcs;
		%feature("autodoc", "	* Constructs all the Bezier curves whose data is computed by this algorithm and loads these curves into the Curves table. The Bezier curves have the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_DimensionError if the Curves array was not created with the following bounds: - 1 , and - the number of adjacent Bezier arcs computed by this algorithm (as given by the function NbArcs).

	:param Curves:
	:type Curves: TColGeom2d_Array1OfBezierCurve &
	:rtype: None
") Arcs;
		void Arcs (TColGeom2d_Array1OfBezierCurve & Curves);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* This methode returns the bspline's knots associated to the converted arcs Raises DimensionError if the length of Curves is not equal to NbArcs + 1

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") NbArcs;
		%feature("autodoc", "	* Returns the number of BezierCurve arcs. If at the creation time you have decomposed the basis curve between the parametric values UFirst, ULast the number of BezierCurve arcs depends on the number of knots included inside the interval [UFirst, ULast]. If you have decomposed the whole basis B-spline curve the number of BezierCurve arcs NbArcs is equal to the number of knots less one.

	:rtype: int
") NbArcs;
		Standard_Integer NbArcs ();
};


%extend Geom2dConvert_BSplineCurveToBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dConvert_CompCurveToBSplineCurve;
class Geom2dConvert_CompCurveToBSplineCurve {
	public:
		%feature("compactdefaultargs") Geom2dConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "	* Initialize the algorithme - Parameterisation is used to convert

	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") Geom2dConvert_CompCurveToBSplineCurve;
		 Geom2dConvert_CompCurveToBSplineCurve (const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") Geom2dConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "	* Initialize the algorithme with one curve - Parameterisation is used to convert

	:param BasisCurve:
	:type BasisCurve: Handle_Geom2d_BoundedCurve &
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") Geom2dConvert_CompCurveToBSplineCurve;
		 Geom2dConvert_CompCurveToBSplineCurve (const Handle_Geom2d_BoundedCurve & BasisCurve,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Append a curve in the BSpline Return False if the curve is not G0 with the BSplineCurve. Tolerance is used to check continuity and decrease Multiplicty at the common Knot After is usefull if BasisCurve is a closed curve .

	:param NewCurve:
	:type NewCurve: Handle_Geom2d_BoundedCurve &
	:param Tolerance:
	:type Tolerance: float
	:param After: default value is Standard_False
	:type After: bool
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Geom2d_BoundedCurve & NewCurve,const Standard_Real Tolerance,const Standard_Boolean After = Standard_False);
		%feature("compactdefaultargs") BSplineCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSplineCurve;
		Handle_Geom2d_BSplineCurve BSplineCurve ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear result curve

	:rtype: None
") Clear;
		void Clear ();
};


%extend Geom2dConvert_CompCurveToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
