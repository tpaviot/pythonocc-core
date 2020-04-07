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
%define GEOM2DCONVERTDOCSTRING
"Geom2dConvert module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dconvert.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Geom2dConvert_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom2d_module.hxx>
#include<TColStd_module.hxx>
#include<Convert_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor2d_module.hxx>
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
%import GeomAbs.i
%import Adaptor2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
		/****************** C0BSplineToArrayOfC1BSplineCurve ******************/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "This method reduces as far as it is possible the multiplicities of the knots of the bspline bs.(keeping the geometry). it returns an array of bspline c1. tolerance is a geometrical tolerance.

Parameters
----------
BS: Geom2d_BSplineCurve
tabBS: TColGeom2d_HArray1OfBSplineCurve
Tolerance: float

Returns
-------
None
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & tabBS, const Standard_Real Tolerance);

		/****************** C0BSplineToArrayOfC1BSplineCurve ******************/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "This method reduces as far as it is possible the multiplicities of the knots of the bspline bs.(keeping the geometry). it returns an array of bspline c1. tolerance is a geometrical tolerance.

Parameters
----------
BS: Geom2d_BSplineCurve
tabBS: TColGeom2d_HArray1OfBSplineCurve
AngularTolerance: float
Tolerance: float

Returns
-------
None
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & tabBS, const Standard_Real AngularTolerance, const Standard_Real Tolerance);

		/****************** C0BSplineToC1BSplineCurve ******************/
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "This method reduces as far as it is possible the multiplicities of the knots of the bspline bs.(keeping the geometry). it returns a new bspline which could still be c0. tolerance is a geometrical tolerance.

Parameters
----------
BS: Geom2d_BSplineCurve
Tolerance: float

Returns
-------
None
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve(opencascade::handle<Geom2d_BSplineCurve> & BS, const Standard_Real Tolerance);

		/****************** ConcatC1 ******************/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "This method concatenates c1 the arrayofcurves as far as it is possible. arrayofcurves[0..n-1] arrayoftoler contains the biggest tolerance of the two points shared by two consecutives curves. its dimension: [0..n-2] closedflag indicates if the arrayofcurves is closed. in this case closedtolerance contains the biggest tolerance of the two points which are at the closure. otherwise its value is 0.0 closedflag becomes false on the output if it is impossible to build closed curve.

Parameters
----------
ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom2d_HArray1OfBSplineCurve
ClosedTolerance: float

Returns
-------
ClosedFlag: bool
") ConcatC1;
		static void ConcatC1(TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****************** ConcatC1 ******************/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "This method concatenates c1 the arrayofcurves as far as it is possible. arrayofcurves[0..n-1] arrayoftoler contains the biggest tolerance of the two points shared by two consecutives curves. its dimension: [0..n-2] closedflag indicates if the arrayofcurves is closed. in this case closedtolerance contains the biggest tolerance of the two points which are at the closure. otherwise its value is 0.0 closedflag becomes false on the output if it is impossible to build closed curve.

Parameters
----------
ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfIndices: TColStd_HArray1OfInteger
ArrayOfConcatenated: TColGeom2d_HArray1OfBSplineCurve
ClosedTolerance: float
AngularTolerance: float

Returns
-------
ClosedFlag: bool
") ConcatC1;
		static void ConcatC1(TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance, const Standard_Real AngularTolerance);

		/****************** ConcatG1 ******************/
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "This method concatenates g1 the arrayofcurves as far as it is possible. arrayofcurves[0..n-1] arrayoftoler contains the biggest tolerance of the two points shared by two consecutives curves. its dimension: [0..n-2] closedflag indicates if the arrayofcurves is closed. in this case closedtolerance contains the biggest tolerance of the two points which are at the closure. otherwise its value is 0.0 closedflag becomes false on the output if it is impossible to build closed curve.

Parameters
----------
ArrayOfCurves: TColGeom2d_Array1OfBSplineCurve
ArrayOfToler: TColStd_Array1OfReal
ArrayOfConcatenated: TColGeom2d_HArray1OfBSplineCurve
ClosedTolerance: float

Returns
-------
ClosedFlag: bool
") ConcatG1;
		static void ConcatG1(TColGeom2d_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColGeom2d_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****************** CurveToBSplineCurve ******************/
		%feature("compactdefaultargs") CurveToBSplineCurve;
		%feature("autodoc", "This function converts a non infinite curve from geom into a b-spline curve. c must be an ellipse or a circle or a trimmed conic or a trimmed line or a bezier curve or a trimmed bezier curve or a bspline curve or a trimmed bspline curve or an offset curve or a trimmed offset curve. the returned b-spline is not periodic except if c is a circle or an ellipse. parameterisationtype applies only if the curve is a circle or an ellipse : tgtthetaover2, tgtthetaover2_1, tgtthetaover2_2, tgtthetaover2_3, tgtthetaover2_4, purpose: this is the classical rational parameterisation 2 1 - t cos(theta) = ------ 2 1 + t //! 2t sin(theta) = ------ 2 1 + t //! t = tan (theta/2) //! with tgtthetaover2 the routine will compute the number of spans using the rule num_spans = [ (ulast - ufirst) / 1.2 ] + 1 with tgtthetaover2_n, n spans will be forced: an error will be raized if (ulast - ufirst) >= pi and n = 1, ulast - ufirst >= 2 pi and n = 2 //! quasiangular, here t is a rational function that approximates theta ----> tan(theta/2). neverthless the composing with above function yields exact functions whose square sum up to 1 rationalc1 ; t is replaced by a polynomial function of u so as to grant c1 contiuity across knots. exceptions standard_domainerror if the curve c is infinite. standard_constructionerror: - if c is a complete circle or ellipse, and if parameterisation is not equal to convert_tgtthetaover2 or to convert_rationalc1, or - if c is a trimmed circle or ellipse and if parameterisation is equal to convert_tgtthetaover2_1 and if u2 - u1 > 0.9999 * pi where u1 and u2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a half-circle or a half-ellipse, for example), or - if c is a trimmed circle or ellipse and parameterisation is equal to convert_tgtthetaover2_2 and u2 - u1 > 1.9999 * pi where u1 and u2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a quasi-complete circle or ellipse).

Parameters
----------
C: Geom2d_Curve
Parameterisation: Convert_ParameterisationType,optional
	default value is Convert_TgtThetaOver2

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") CurveToBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> CurveToBSplineCurve(const opencascade::handle<Geom2d_Curve> & C, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****************** SplitBSplineCurve ******************/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "-- convert a curve to bspline by approximation //! this method computes the arc of b-spline curve between the two knots fromk1 and tok2. if c is periodic the arc has the same orientation as c if sameorientation = standard_true. if c is not periodic sameorientation is not used for the computation and c is oriented from the knot fromk1 to the knot tok2. we just keep the local definition of c between the knots fromk1 and tok2. the returned b-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of c. the indexes of the knots fromk1 and tok2 doesn't include the repetition of multiple knots in their definition. //! raised if fromk1 or tok2 are out of the bounds [firstuknotindex, lastuknotindex] raised if fromk1 = tok2.

Parameters
----------
C: Geom2d_BSplineCurve
FromK1: int
ToK2: int
SameOrientation: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") SplitBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & C, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Boolean SameOrientation = Standard_True);

		/****************** SplitBSplineCurve ******************/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "This function computes the segment of b-spline curve between the parametric values fromu1, tou2. if c is periodic the arc has the same orientation as c if sameorientation = true. if c is not periodic sameorientation is not used for the computation and c is oriented fromu1 tou2. if u1 and u2 and two parametric values we consider that u1 = u2 if abs (u1 - u2) <= parametrictolerance and parametrictolerance must be greater or equal to resolution from package gp. //! raised if fromu1 or tou2 are out of the parametric bounds of the curve (the tolerance criterion is parametrictolerance). raised if abs (fromu1 - tou2) <= parametrictolerance raised if parametrictolerance < resolution from gp.

Parameters
----------
C: Geom2d_BSplineCurve
FromU1: float
ToU2: float
ParametricTolerance: float
SameOrientation: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") SplitBSplineCurve;
		static opencascade::handle<Geom2d_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & C, const Standard_Real FromU1, const Standard_Real ToU2, const Standard_Real ParametricTolerance, const Standard_Boolean SameOrientation = Standard_True);

};


%extend Geom2dConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dConvert_ApproxCurve *
**********************************/
class Geom2dConvert_ApproxCurve {
	public:
		/****************** Geom2dConvert_ApproxCurve ******************/
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "Constructs an approximation framework defined by - the 2d conic curve - the tolerance value tol2d - the degree of continuity order - the maximum number of segments allowed maxsegments - the highest degree maxdegree which the polynomial defining the bspline is allowed to have.

Parameters
----------
Curve: Geom2d_Curve
Tol2d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Returns
-------
None
") Geom2dConvert_ApproxCurve;
		 Geom2dConvert_ApproxCurve(const opencascade::handle<Geom2d_Curve> & Curve, const Standard_Real Tol2d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** Geom2dConvert_ApproxCurve ******************/
		%feature("compactdefaultargs") Geom2dConvert_ApproxCurve;
		%feature("autodoc", "Constructs an approximation framework defined by - the 2d conic curve - the tolerance value tol2d - the degree of continuity order - the maximum number of segments allowed maxsegments - the highest degree maxdegree which the polynomial defining the bspline is allowed to have.

Parameters
----------
Curve: Adaptor2d_HCurve2d
Tol2d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Returns
-------
None
") Geom2dConvert_ApproxCurve;
		 Geom2dConvert_ApproxCurve(const opencascade::handle<Adaptor2d_HCurve2d> & Curve, const Standard_Real Tol2d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the 2d bspline curve resulting from the approximation algorithm.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns standard_true if the approximation did come out with a result that is not necessarely within the required tolerance.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if the approximation has been done with within requiered tolerance.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the greatest distance between a point on the source conic and the bspline curve resulting from the approximation. (>0 when an approximation has been done, 0 if no approximation).

Returns
-------
float
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
		/****************** Geom2dConvert_BSplineCurveKnotSplitting ******************/
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveKnotSplitting;
		%feature("autodoc", "Determines points at which the bspline curve basiscurve should be split in order to obtain arcs with a degree of continuity equal to continuityrange. these points are knot values of basiscurve. they are identified by indices in the knots table of basiscurve. use the available interrogation functions to access computed values, followed by the global function splitbsplinecurve (provided by the package geom2dconvert) to split the curve. exceptions standard_rangeerror if continuityrange is less than zero.

Parameters
----------
BasisCurve: Geom2d_BSplineCurve
ContinuityRange: int

Returns
-------
None
") Geom2dConvert_BSplineCurveKnotSplitting;
		 Geom2dConvert_BSplineCurveKnotSplitting(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve, const Standard_Integer ContinuityRange);

		/****************** NbSplits ******************/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Returns the number of points at which the analysed bspline curve should be split, in order to obtain arcs with the continuity required by this framework. all these points correspond to knot values. note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.

Returns
-------
int
") NbSplits;
		Standard_Integer NbSplits();

		/****************** SplitValue ******************/
		%feature("compactdefaultargs") SplitValue;
		%feature("autodoc", "Returns the split knot of index index to the split knots table computed in this framework. the returned value is an index in the knots table of the bspline curve analysed by this algorithm. notes: - if index is equal to 1, the corresponding knot gives the first point of the curve. - if index is equal to the number of split knots computed in this framework, the corresponding point is the last point of the curve. exceptions standard_rangeerror if index is less than 1 or greater than the number of split knots computed in this framework.

Parameters
----------
Index: int

Returns
-------
int
") SplitValue;
		Standard_Integer SplitValue(const Standard_Integer Index);

		/****************** Splitting ******************/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "Loads the splitvalues table with the split knots values computed in this framework. each value in the table is an index in the knots table of the bspline curve analysed by this algorithm. the values in splitvalues are given in ascending order and comprise the indices of the knots which give the first and last points of the curve. use two consecutive values from the table as arguments of the global function splitbsplinecurve (provided by the package geom2dconvert) to split the curve. exceptions standard_dimensionerror if the array splitvalues was not created with the following bounds: - 1, and - the number of split points computed in this framework (as given by the function nbsplits).

Parameters
----------
SplitValues: TColStd_Array1OfInteger

Returns
-------
None
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
		/****************** Geom2dConvert_BSplineCurveToBezierCurve ******************/
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "Computes all the data needed to convert - the bspline curve basiscurve, into a series of adjacent bezier arcs. the result consists of a series of basiscurve arcs limited by points corresponding to knot values of the curve. use the available interrogation functions to ascertain the number of computed bezier arcs, and then to construct each individual bezier curve (or all bezier curves). note: parametrictolerance is not used.

Parameters
----------
BasisCurve: Geom2d_BSplineCurve

Returns
-------
None
") Geom2dConvert_BSplineCurveToBezierCurve;
		 Geom2dConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve);

		/****************** Geom2dConvert_BSplineCurveToBezierCurve ******************/
		%feature("compactdefaultargs") Geom2dConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "Computes all the data needed to convert the portion of the bspline curve basiscurve limited by the two parameter values u1 and u2 for example if there is a knot uk and uk < u < uk + parametrictolerance/2 the last curve corresponds to the span [uk-1, uk] and not to [uk, uk+1] the result consists of a series of basiscurve arcs limited by points corresponding to knot values of the curve. use the available interrogation functions to ascertain the number of computed bezier arcs, and then to construct each individual bezier curve (or all bezier curves). note: parametrictolerance is not used. raises domainerror if u1 or u2 are out of the parametric bounds of the basis curve [firstparameter, lastparameter]. the tolerance criterion is parametrictolerance. raised if abs (u2 - u1) <= parametrictolerance.

Parameters
----------
BasisCurve: Geom2d_BSplineCurve
U1: float
U2: float
ParametricTolerance: float

Returns
-------
None
") Geom2dConvert_BSplineCurveToBezierCurve;
		 Geom2dConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom2d_BSplineCurve> & BasisCurve, const Standard_Real U1, const Standard_Real U2, const Standard_Real ParametricTolerance);

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Constructs and returns the bezier curve of index index to the table of adjacent bezier arcs computed by this algorithm. this bezier curve has the same orientation as the bspline curve analyzed in this framework. exceptions standard_outofrange if index is less than 1 or greater than the number of adjacent bezier arcs computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Arc;
		opencascade::handle<Geom2d_BezierCurve> Arc(const Standard_Integer Index);

		/****************** Arcs ******************/
		%feature("compactdefaultargs") Arcs;
		%feature("autodoc", "Constructs all the bezier curves whose data is computed by this algorithm and loads these curves into the curves table. the bezier curves have the same orientation as the bspline curve analyzed in this framework. exceptions standard_dimensionerror if the curves array was not created with the following bounds: - 1 , and - the number of adjacent bezier arcs computed by this algorithm (as given by the function nbarcs).

Parameters
----------
Curves: TColGeom2d_Array1OfBezierCurve

Returns
-------
None
") Arcs;
		void Arcs(TColGeom2d_Array1OfBezierCurve & Curves);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "This methode returns the bspline's knots associated to the converted arcs raises dimensionerror if the length of curves is not equal to nbarcs + 1.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** NbArcs ******************/
		%feature("compactdefaultargs") NbArcs;
		%feature("autodoc", "Returns the number of beziercurve arcs. if at the creation time you have decomposed the basis curve between the parametric values ufirst, ulast the number of beziercurve arcs depends on the number of knots included inside the interval [ufirst, ulast]. if you have decomposed the whole basis b-spline curve the number of beziercurve arcs nbarcs is equal to the number of knots less one.

Returns
-------
int
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
		/****************** Geom2dConvert_CompCurveToBSplineCurve ******************/
		%feature("compactdefaultargs") Geom2dConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "Initialize the algorithme - parameterisation is used to convert.

Parameters
----------
Parameterisation: Convert_ParameterisationType,optional
	default value is Convert_TgtThetaOver2

Returns
-------
None
") Geom2dConvert_CompCurveToBSplineCurve;
		 Geom2dConvert_CompCurveToBSplineCurve(const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****************** Geom2dConvert_CompCurveToBSplineCurve ******************/
		%feature("compactdefaultargs") Geom2dConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "Initialize the algorithme with one curve - parameterisation is used to convert.

Parameters
----------
BasisCurve: Geom2d_BoundedCurve
Parameterisation: Convert_ParameterisationType,optional
	default value is Convert_TgtThetaOver2

Returns
-------
None
") Geom2dConvert_CompCurveToBSplineCurve;
		 Geom2dConvert_CompCurveToBSplineCurve(const opencascade::handle<Geom2d_BoundedCurve> & BasisCurve, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Append a curve in the bspline return false if the curve is not g0 with the bsplinecurve. tolerance is used to check continuity and decrease multiplicty at the common knot after is usefull if basiscurve is a closed curve .

Parameters
----------
NewCurve: Geom2d_BoundedCurve
Tolerance: float
After: bool,optional
	default value is Standard_False

Returns
-------
bool
") Add;
		Standard_Boolean Add(const opencascade::handle<Geom2d_BoundedCurve> & NewCurve, const Standard_Real Tolerance, const Standard_Boolean After = Standard_False);

		/****************** BSplineCurve ******************/
		%feature("compactdefaultargs") BSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSplineCurve;
		opencascade::handle<Geom2d_BSplineCurve> BSplineCurve();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear result curve.

Returns
-------
None
") Clear;
		void Clear();

};


%extend Geom2dConvert_CompCurveToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
