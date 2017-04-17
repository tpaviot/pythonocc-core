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
%module (package="OCC") GeomConvert

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


%include GeomConvert_headers.i


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

%rename(geomconvert) GeomConvert;
class GeomConvert {
	public:
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "	* Convert a curve from Geom by an approximation method //! This method computes the arc of B-spline curve between the two knots FromK1 and ToK2. If C is periodic the arc has the same orientation as C if SameOrientation = Standard_True. If C is not periodic SameOrientation is not used for the computation and C is oriented from the knot fromK1 to the knot toK2. We just keep the local definition of C between the knots FromK1 and ToK2. The returned B-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of C. The indexes of the knots FromK1 and ToK2 doesn't include the repetition of multiple knots in their definition. Raised if FromK1 = ToK2 Raised if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex]

	:param C:
	:type C: Handle_Geom_BSplineCurve &
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: Handle_Geom_BSplineCurve
") SplitBSplineCurve;
		static Handle_Geom_BSplineCurve SplitBSplineCurve (const Handle_Geom_BSplineCurve & C,const Standard_Integer FromK1,const Standard_Integer ToK2,const Standard_Boolean SameOrientation = Standard_True);
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "	* This function computes the segment of B-spline curve between the parametric values FromU1, ToU2. If C is periodic the arc has the same orientation as C if SameOrientation = True. If C is not periodic SameOrientation is not used for the computation and C is oriented fromU1 toU2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 are out of the parametric bounds of the curve (The tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance Raised if ParametricTolerance < Resolution from gp.

	:param C:
	:type C: Handle_Geom_BSplineCurve &
	:param FromU1:
	:type FromU1: float
	:param ToU2:
	:type ToU2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: Handle_Geom_BSplineCurve
") SplitBSplineCurve;
		static Handle_Geom_BSplineCurve SplitBSplineCurve (const Handle_Geom_BSplineCurve & C,const Standard_Real FromU1,const Standard_Real ToU2,const Standard_Real ParametricTolerance,const Standard_Boolean SameOrientation = Standard_True);
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "	* Computes the B-spline surface patche between the knots values FromUK1, ToUK2, FromVK1, ToVK2. If S is periodic in one direction the patche has the same orientation as S in this direction if the flag is true in this direction (SameUOrientation, SameVOrientation). If S is not periodic SameUOrientation and SameVOrientation are not used for the computation and S is oriented FromUK1 ToUK2 and FromVK1 ToVK2. Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2 FromUK1 or ToUK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] FromVK1 or ToVK2 are out of the bounds [FirstVKnotIndex, LastVKnotIndex]

	:param S:
	:type S: Handle_Geom_BSplineSurface &
	:param FromUK1:
	:type FromUK1: int
	:param ToUK2:
	:type ToUK2: int
	:param FromVK1:
	:type FromVK1: int
	:param ToVK2:
	:type ToVK2: int
	:param SameUOrientation: default value is Standard_True
	:type SameUOrientation: bool
	:param SameVOrientation: default value is Standard_True
	:type SameVOrientation: bool
	:rtype: Handle_Geom_BSplineSurface
") SplitBSplineSurface;
		static Handle_Geom_BSplineSurface SplitBSplineSurface (const Handle_Geom_BSplineSurface & S,const Standard_Integer FromUK1,const Standard_Integer ToUK2,const Standard_Integer FromVK1,const Standard_Integer ToVK2,const Standard_Boolean SameUOrientation = Standard_True,const Standard_Boolean SameVOrientation = Standard_True);
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "	* This method splits a B-spline surface patche between the knots values FromK1, ToK2 in one direction. If USplit = True then the splitting direction is the U parametric direction else it is the V parametric direction. If S is periodic in the considered direction the patche has the same orientation as S in this direction if SameOrientation is True If S is not periodic in this direction SameOrientation is not used for the computation and S is oriented FromK1 ToK2. Raised if FromK1 = ToK2 or if FromK1 or ToK2 are out of the bounds [FirstUKnotIndex, LastUKnotIndex] in the considered parametric direction.

	:param S:
	:type S: Handle_Geom_BSplineSurface &
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param USplit:
	:type USplit: bool
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: Handle_Geom_BSplineSurface
") SplitBSplineSurface;
		static Handle_Geom_BSplineSurface SplitBSplineSurface (const Handle_Geom_BSplineSurface & S,const Standard_Integer FromK1,const Standard_Integer ToK2,const Standard_Boolean USplit,const Standard_Boolean SameOrientation = Standard_True);
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "	* This method computes the B-spline surface patche between the parametric values FromU1, ToU2, FromV1, ToV2. If S is periodic in one direction the patche has the same orientation as S in this direction if the flag is True in this direction (SameUOrientation, SameVOrientation). If S is not periodic SameUOrientation and SameVOrientation are not used for the computation and S is oriented FromU1 ToU2 and FromV1 ToV2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raised if FromU1 or ToU2 or FromV1 or ToU2 are out of the parametric bounds of the surface (the tolerance criterion is ParametricTolerance). Raised if Abs (FromU1 - ToU2) <= ParametricTolerance or Abs (FromV1 - ToV2) <= ParametricTolerance. Raised if ParametricTolerance < Resolution.

	:param S:
	:type S: Handle_Geom_BSplineSurface &
	:param FromU1:
	:type FromU1: float
	:param ToU2:
	:type ToU2: float
	:param FromV1:
	:type FromV1: float
	:param ToV2:
	:type ToV2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param SameUOrientation: default value is Standard_True
	:type SameUOrientation: bool
	:param SameVOrientation: default value is Standard_True
	:type SameVOrientation: bool
	:rtype: Handle_Geom_BSplineSurface
") SplitBSplineSurface;
		static Handle_Geom_BSplineSurface SplitBSplineSurface (const Handle_Geom_BSplineSurface & S,const Standard_Real FromU1,const Standard_Real ToU2,const Standard_Real FromV1,const Standard_Real ToV2,const Standard_Real ParametricTolerance,const Standard_Boolean SameUOrientation = Standard_True,const Standard_Boolean SameVOrientation = Standard_True);
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "	* This method splits the B-spline surface S in one direction between the parametric values FromParam1, ToParam2. If USplit = True then the Splitting direction is the U parametric direction else it is the V parametric direction. If S is periodic in the considered direction the patche has the same orientation as S in this direction if SameOrientation is true. If S is not periodic in the considered direction SameOrientation is not used for the computation and S is oriented FromParam1 ToParam2. If U1 and U2 and two parametric values we consider that U1 = U2 if Abs (U1 - U2) <= ParametricTolerance and ParametricTolerance must be greater or equal to Resolution from package gp. //! Raises if FromParam1 or ToParam2 are out of the parametric bounds of the surface in the considered direction. Raises if Abs (FromParam1 - ToParam2) <= ParametricTolerance.

	:param S:
	:type S: Handle_Geom_BSplineSurface &
	:param FromParam1:
	:type FromParam1: float
	:param ToParam2:
	:type ToParam2: float
	:param USplit:
	:type USplit: bool
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: Handle_Geom_BSplineSurface
") SplitBSplineSurface;
		static Handle_Geom_BSplineSurface SplitBSplineSurface (const Handle_Geom_BSplineSurface & S,const Standard_Real FromParam1,const Standard_Real ToParam2,const Standard_Boolean USplit,const Standard_Real ParametricTolerance,const Standard_Boolean SameOrientation = Standard_True);
		%feature("compactdefaultargs") CurveToBSplineCurve;
		%feature("autodoc", "	* This function converts a non infinite curve from Geom into a B-spline curve. C must be an ellipse or a circle or a trimmed conic or a trimmed line or a Bezier curve or a trimmed Bezier curve or a BSpline curve or a trimmed BSpline curve or an OffsetCurve. The returned B-spline is not periodic except if C is a Circle or an Ellipse. If the Parameterisation is QuasiAngular than the returned curve is NOT periodic in case a periodic Geom_Circle or Geom_Ellipse. For TgtThetaOver2_1 and TgtThetaOver2_2 the method raises an exception in case of a periodic Geom_Circle or a Geom_Ellipse ParameterisationType applies only if the curve is a Circle or an ellipse : TgtThetaOver2, -- TgtThetaOver2_1, -- TgtThetaOver2_2, -- TgtThetaOver2_3, -- TgtThetaOver2_4, //! Purpose: this is the classical rational parameterisation 2 1 - t cos(theta) = ------ 2 1 + t //! 2t sin(theta) = ------ 2 1 + t //! t = tan (theta/2) //! with TgtThetaOver2 the routine will compute the number of spans using the rule num_spans = [ (ULast - UFirst) / 1.2 ] + 1 with TgtThetaOver2_N, N spans will be forced: an error will be raized if (ULast - UFirst) >= PI and N = 1, ULast - UFirst >= 2 PI and N = 2 //! QuasiAngular, here t is a rational function that approximates theta ----> tan(theta/2). Neverthless the composing with above function yields exact functions whose square sum up to 1 RationalC1 ; t is replaced by a polynomial function of u so as to grant C1 contiuity across knots. Exceptions Standard_DomainError: - if the curve C is infinite, or - if C is a (complete) circle or ellipse, and Parameterisation is equal to Convert_TgtThetaOver2_1 or Convert_TgtThetaOver2_2. Standard_ConstructionError: - if C is a (complete) circle or ellipse, and if Parameterisation is not equal to Convert_TgtThetaOver2, Convert_RationalC1, Convert_QuasiAngular (the curve is converted in these three cases) or to Convert_TgtThetaOver2_1 or Convert_TgtThetaOver2_2 (another exception is raised in these two cases). - if C is a trimmed circle or ellipse, if Parameterisation is equal to Convert_TgtThetaOver2_1 and if U2 - U1 > 0.9999 * Pi, where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a half-circle or a half-ellipse, for example), or - if C is a trimmed circle or ellipse, if Parameterisation is equal to Convert_TgtThetaOver2_2 and U2 - U1 > 1.9999 * Pi where U1 and U2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a quasi-complete circle or ellipse).

	:param C:
	:type C: Handle_Geom_Curve &
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: Handle_Geom_BSplineCurve
") CurveToBSplineCurve;
		static Handle_Geom_BSplineCurve CurveToBSplineCurve (const Handle_Geom_Curve & C,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") SurfaceToBSplineSurface;
		%feature("autodoc", "	* This algorithm converts a non infinite surface from Geom into a B-spline surface. S must be a trimmed plane or a trimmed cylinder or a trimmed cone or a trimmed sphere or a trimmed torus or a sphere or a torus or a Bezier surface of a trimmed Bezier surface or a trimmed swept surface with a corresponding basis curve which can be turned into a B-spline curve (see the method CurveToBSplineCurve). Raises DomainError if the type of the surface is not previously defined.

	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Handle_Geom_BSplineSurface
") SurfaceToBSplineSurface;
		static Handle_Geom_BSplineSurface SurfaceToBSplineSurface (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "	* This Method concatenates G1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedG1 indicates if the ArrayOfCurves is closed. In this case ClosedG1 contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom_Array1OfBSplineCurve &
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal &
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: Handle_TColGeom_HArray1OfBSplineCurve &
	:param ClosedG1Flag:
	:type ClosedG1Flag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:rtype: void
") ConcatG1;
		static void ConcatG1 (TColGeom_Array1OfBSplineCurve & ArrayOfCurves,const TColStd_Array1OfReal & ArrayOfToler,Handle_TColGeom_HArray1OfBSplineCurve & ArrayOfConcatenated,const Standard_Boolean ClosedG1Flag,const Standard_Real ClosedTolerance);
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "	* This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedG1 indicates if the ArrayOfCurves is closed. In this case ClosedG1 contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom_Array1OfBSplineCurve &
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal &
	:param ArrayOfIndices:
	:type ArrayOfIndices: Handle_TColStd_HArray1OfInteger &
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: Handle_TColGeom_HArray1OfBSplineCurve &
	:param ClosedG1Flag:
	:type ClosedG1Flag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:rtype: void
") ConcatC1;
		static void ConcatC1 (TColGeom_Array1OfBSplineCurve & ArrayOfCurves,const TColStd_Array1OfReal & ArrayOfToler,Handle_TColStd_HArray1OfInteger & ArrayOfIndices,Handle_TColGeom_HArray1OfBSplineCurve & ArrayOfConcatenated,const Standard_Boolean ClosedG1Flag,const Standard_Real ClosedTolerance);
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "	* This Method concatenates C1 the ArrayOfCurves as far as it is possible. ArrayOfCurves[0..N-1] ArrayOfToler contains the biggest tolerance of the two points shared by two consecutives curves. Its dimension: [0..N-2] ClosedG1 indicates if the ArrayOfCurves is closed. In this case ClosedG1 contains the biggest tolerance of the two points which are at the closure. Otherwise its value is 0.0

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom_Array1OfBSplineCurve &
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal &
	:param ArrayOfIndices:
	:type ArrayOfIndices: Handle_TColStd_HArray1OfInteger &
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: Handle_TColGeom_HArray1OfBSplineCurve &
	:param ClosedG1Flag:
	:type ClosedG1Flag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: void
") ConcatC1;
		static void ConcatC1 (TColGeom_Array1OfBSplineCurve & ArrayOfCurves,const TColStd_Array1OfReal & ArrayOfToler,Handle_TColStd_HArray1OfInteger & ArrayOfIndices,Handle_TColGeom_HArray1OfBSplineCurve & ArrayOfConcatenated,const Standard_Boolean ClosedG1Flag,const Standard_Real ClosedTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "	* This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns a new BSpline which could still be C0. tolerance is a geometrical tolerance. The Angular toleranceis in radians and mesures the angle of the tangents on the left and on the right to decide if the curve is G1 or not at a given point

	:param BS:
	:type BS: Handle_Geom_BSplineCurve &
	:param tolerance:
	:type tolerance: float
	:param AngularTolerance: default value is 1.0e-7
	:type AngularTolerance: float
	:rtype: void
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve (Handle_Geom_BSplineCurve & BS,const Standard_Real tolerance,const Standard_Real AngularTolerance = 1.0e-7);
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "	* This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance.

	:param BS:
	:type BS: Handle_Geom_BSplineCurve &
	:param tabBS:
	:type tabBS: Handle_TColGeom_HArray1OfBSplineCurve &
	:param tolerance:
	:type tolerance: float
	:rtype: void
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve (const Handle_Geom_BSplineCurve & BS,Handle_TColGeom_HArray1OfBSplineCurve & tabBS,const Standard_Real tolerance);
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "	* This Method reduces as far as it is possible the multiplicities of the knots of the BSpline BS.(keeping the geometry). It returns an array of BSpline C1. tolerance is a geometrical tolerance : it allows for the maximum deformation The Angular tolerance is in radians and mesures the angle of the tangents on the left and on the right to decide if the curve is C1 or not at a given point

	:param BS:
	:type BS: Handle_Geom_BSplineCurve &
	:param tabBS:
	:type tabBS: Handle_TColGeom_HArray1OfBSplineCurve &
	:param AngularTolerance:
	:type AngularTolerance: float
	:param tolerance:
	:type tolerance: float
	:rtype: void
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve (const Handle_Geom_BSplineCurve & BS,Handle_TColGeom_HArray1OfBSplineCurve & tabBS,const Standard_Real AngularTolerance,const Standard_Real tolerance);
};


%extend GeomConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_ApproxCurve;
class GeomConvert_ApproxCurve {
	public:
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "	* Constructs a curve approximation framework defined by - - the conic Curve, - the tolerance value Tol3d, - the degree of continuity Order, - the maximum number of segments MaxSegments allowed in the resulting BSpline curve, and - the highest degree MaxDeg which the polynomial defining the BSpline curve may have.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Tol3d:
	:type Tol3d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") GeomConvert_ApproxCurve;
		 GeomConvert_ApproxCurve (const Handle_Geom_Curve & Curve,const Standard_Real Tol3d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "	* Constructs a curve approximation framework defined by - - the Curve, - the tolerance value Tol3d, - the degree of continuity Order, - the maximum number of segments MaxSegments allowed in the resulting BSpline curve, and - the highest degree MaxDeg which the polynomial defining the BSpline curve may have.

	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Tol3d:
	:type Tol3d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") GeomConvert_ApproxCurve;
		 GeomConvert_ApproxCurve (const Handle_Adaptor3d_HCurve & Curve,const Standard_Real Tol3d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the BSpline curve resulting from the approximation algorithm.

	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns Standard_True if the approximation has been done within requiered tolerance

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* Returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance

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


%extend GeomConvert_ApproxCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_ApproxSurface;
class GeomConvert_ApproxSurface {
	public:
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "	* Constructs a surface approximation framework defined by - the conic Surf - the tolerance value Tol3d - the degree of continuity UContinuity, VContinuity in the directions of the U and V parameters - the highest degree MaxDegU, MaxDegV which the polynomial defining the BSpline curve may have in the directions of the U and V parameters - the maximum number of segments MaxSegments allowed in the resulting BSpline curve - the index of precision PrecisCode.

	:param Surf:
	:type Surf: Handle_Geom_Surface &
	:param Tol3d:
	:type Tol3d: float
	:param UContinuity:
	:type UContinuity: GeomAbs_Shape
	:param VContinuity:
	:type VContinuity: GeomAbs_Shape
	:param MaxDegU:
	:type MaxDegU: int
	:param MaxDegV:
	:type MaxDegV: int
	:param MaxSegments:
	:type MaxSegments: int
	:param PrecisCode:
	:type PrecisCode: int
	:rtype: None
") GeomConvert_ApproxSurface;
		 GeomConvert_ApproxSurface (const Handle_Geom_Surface & Surf,const Standard_Real Tol3d,const GeomAbs_Shape UContinuity,const GeomAbs_Shape VContinuity,const Standard_Integer MaxDegU,const Standard_Integer MaxDegV,const Standard_Integer MaxSegments,const Standard_Integer PrecisCode);
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "	* Constructs a surface approximation framework defined by - the Surf - the tolerance value Tol3d - the degree of continuity UContinuity, VContinuity in the directions of the U and V parameters - the highest degree MaxDegU, MaxDegV which the polynomial defining the BSpline curve may have in the directions of the U and V parameters - the maximum number of segments MaxSegments allowed in the resulting BSpline curve - the index of precision PrecisCode.

	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Tol3d:
	:type Tol3d: float
	:param UContinuity:
	:type UContinuity: GeomAbs_Shape
	:param VContinuity:
	:type VContinuity: GeomAbs_Shape
	:param MaxDegU:
	:type MaxDegU: int
	:param MaxDegV:
	:type MaxDegV: int
	:param MaxSegments:
	:type MaxSegments: int
	:param PrecisCode:
	:type PrecisCode: int
	:rtype: None
") GeomConvert_ApproxSurface;
		 GeomConvert_ApproxSurface (const Handle_Adaptor3d_HSurface & Surf,const Standard_Real Tol3d,const GeomAbs_Shape UContinuity,const GeomAbs_Shape VContinuity,const Standard_Integer MaxDegU,const Standard_Integer MaxDegV,const Standard_Integer MaxSegments,const Standard_Integer PrecisCode);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the BSpline surface resulting from the approximation algorithm.

	:rtype: Handle_Geom_BSplineSurface
") Surface;
		Handle_Geom_BSplineSurface Surface ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns Standard_True if the approximation has be done

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* Returns true if the approximation did come out with a result that is not NECESSARILY within the required tolerance or a result that is not recognized with the wished continuities.

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	* Returns the greatest distance between a point on the source conic surface and the BSpline surface resulting from the approximation (>0 when an approximation has been done, 0 if no approximation )

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


%extend GeomConvert_ApproxSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_BSplineCurveKnotSplitting;
class GeomConvert_BSplineCurveKnotSplitting {
	public:
		%feature("compactdefaultargs") GeomConvert_BSplineCurveKnotSplitting;
		%feature("autodoc", "	* Determines points at which the BSpline curve BasisCurve should be split in order to obtain arcs with a degree of continuity equal to ContinuityRange. These points are knot values of BasisCurve. They are identified by indices in the knots table of BasisCurve. Use the available interrogation functions to access computed values, followed by the global function SplitBSplineCurve (provided by the package GeomConvert) to split the curve. Exceptions Standard_RangeError if ContinuityRange is less than zero.

	:param BasisCurve:
	:type BasisCurve: Handle_Geom_BSplineCurve &
	:param ContinuityRange:
	:type ContinuityRange: int
	:rtype: None
") GeomConvert_BSplineCurveKnotSplitting;
		 GeomConvert_BSplineCurveKnotSplitting (const Handle_Geom_BSplineCurve & BasisCurve,const Standard_Integer ContinuityRange);
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "	* Returns the number of points at which the analyzed BSpline curve should be split, in order to obtain arcs with the continuity required by this framework. All these points correspond to knot values. Note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.

	:rtype: int
") NbSplits;
		Standard_Integer NbSplits ();
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "	* Loads the SplitValues table with the split knots values computed in this framework. Each value in the table is an index in the knots table of the BSpline curve analyzed by this algorithm. The values in SplitValues are given in ascending order and comprise the indices of the knots which give the first and last points of the curve. Use two consecutive values from the table as arguments of the global function SplitBSplineCurve (provided by the package GeomConvert) to split the curve. Exceptions Standard_DimensionError if the array SplitValues was not created with the following bounds: - 1, and - the number of split points computed in this framework (as given by the function NbSplits).

	:param SplitValues:
	:type SplitValues: TColStd_Array1OfInteger &
	:rtype: None
") Splitting;
		void Splitting (TColStd_Array1OfInteger & SplitValues);
		%feature("compactdefaultargs") SplitValue;
		%feature("autodoc", "	* Returns the split knot of index Index to the split knots table computed in this framework. The returned value is an index in the knots table of the BSpline curve analyzed by this algorithm. Notes: - If Index is equal to 1, the corresponding knot gives the first point of the curve. - If Index is equal to the number of split knots computed in this framework, the corresponding point is the last point of the curve. Exceptions Standard_RangeError if Index is less than 1 or greater than the number of split knots computed in this framework.

	:param Index:
	:type Index: int
	:rtype: int
") SplitValue;
		Standard_Integer SplitValue (const Standard_Integer Index);
};


%extend GeomConvert_BSplineCurveKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_BSplineCurveToBezierCurve;
class GeomConvert_BSplineCurveToBezierCurve {
	public:
		%feature("compactdefaultargs") GeomConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "	* Computes all the data needed to convert the BSpline curve BasisCurve into a series of adjacent Bezier arcs.

	:param BasisCurve:
	:type BasisCurve: Handle_Geom_BSplineCurve &
	:rtype: None
") GeomConvert_BSplineCurveToBezierCurve;
		 GeomConvert_BSplineCurveToBezierCurve (const Handle_Geom_BSplineCurve & BasisCurve);
		%feature("compactdefaultargs") GeomConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "	* Computes all the data needed to convert the portion of the BSpline curve BasisCurve limited by the two parameter values U1 and U2 into a series of adjacent Bezier arcs. The result consists of a series of BasisCurve arcs limited by points corresponding to knot values of the curve. Use the available interrogation functions to ascertain the number of computed Bezier arcs, and then to construct each individual Bezier curve (or all Bezier curves). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 are out of the parametric bounds of the basis curve [FirstParameter, LastParameter]. The Tolerance criterion is ParametricTolerance. Raised if Abs (U2 - U1) <= ParametricTolerance.

	:param BasisCurve:
	:type BasisCurve: Handle_Geom_BSplineCurve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:rtype: None
") GeomConvert_BSplineCurveToBezierCurve;
		 GeomConvert_BSplineCurveToBezierCurve (const Handle_Geom_BSplineCurve & BasisCurve,const Standard_Real U1,const Standard_Real U2,const Standard_Real ParametricTolerance);
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	* Constructs and returns the Bezier curve of index Index to the table of adjacent Bezier arcs computed by this algorithm. This Bezier curve has the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_OutOfRange if Index is less than 1 or greater than the number of adjacent Bezier arcs computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BezierCurve
") Arc;
		Handle_Geom_BezierCurve Arc (const Standard_Integer Index);
		%feature("compactdefaultargs") Arcs;
		%feature("autodoc", "	* Constructs all the Bezier curves whose data is computed by this algorithm and loads these curves into the Curves table. The Bezier curves have the same orientation as the BSpline curve analyzed in this framework. Exceptions Standard_DimensionError if the Curves array was not created with the following bounds: - 1 , and - the number of adjacent Bezier arcs computed by this algorithm (as given by the function NbArcs).

	:param Curves:
	:type Curves: TColGeom_Array1OfBezierCurve &
	:rtype: None
") Arcs;
		void Arcs (TColGeom_Array1OfBezierCurve & Curves);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* This methode returns the bspline's knots associated to the converted arcs Raised if the length of Curves is not equal to NbArcs + 1.

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


%extend GeomConvert_BSplineCurveToBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_BSplineSurfaceKnotSplitting;
class GeomConvert_BSplineSurfaceKnotSplitting {
	public:
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceKnotSplitting;
		%feature("autodoc", "	* Determines the u- and v-isoparametric curves along which the BSpline surface BasisSurface should be split in order to obtain patches with a degree of continuity equal to UContinuityRange in the u parametric direction, and to VContinuityRange in the v parametric direction. These isoparametric curves are defined by parameters, which are BasisSurface knot values in the u or v parametric direction. They are identified by indices in the BasisSurface knots table in the corresponding parametric direction. Use the available interrogation functions to access computed values, followed by the global function SplitBSplineSurface (provided by the package GeomConvert) to split the surface. Exceptions Standard_RangeError if UContinuityRange or VContinuityRange is less than zero.

	:param BasisSurface:
	:type BasisSurface: Handle_Geom_BSplineSurface &
	:param UContinuityRange:
	:type UContinuityRange: int
	:param VContinuityRange:
	:type VContinuityRange: int
	:rtype: None
") GeomConvert_BSplineSurfaceKnotSplitting;
		 GeomConvert_BSplineSurfaceKnotSplitting (const Handle_Geom_BSplineSurface & BasisSurface,const Standard_Integer UContinuityRange,const Standard_Integer VContinuityRange);
		%feature("compactdefaultargs") NbUSplits;
		%feature("autodoc", "	* Returns the number of u-isoparametric curves along which the analysed BSpline surface should be split in order to obtain patches with the continuity required by this framework. The parameters which define these curves are knot values in the corresponding parametric direction. Note that the four curves which bound the surface are counted among these splitting curves.

	:rtype: int
") NbUSplits;
		Standard_Integer NbUSplits ();
		%feature("compactdefaultargs") NbVSplits;
		%feature("autodoc", "	* Returns the number of v-isoparametric curves along which the analysed BSpline surface should be split in order to obtain patches with the continuity required by this framework. The parameters which define these curves are knot values in the corresponding parametric direction. Note that the four curves which bound the surface are counted among these splitting curves.

	:rtype: int
") NbVSplits;
		Standard_Integer NbVSplits ();
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "	* Loads the USplit and VSplit tables with the split knots values computed in this framework. Each value in these tables is an index in the knots table corresponding to the u or v parametric direction of the BSpline surface analysed by this algorithm. The USplit and VSplit values are given in ascending order and comprise the indices of the knots which give the first and last isoparametric curves of the surface in the corresponding parametric direction. Use two consecutive values from the USplit table and two consecutive values from the VSplit table as arguments of the global function SplitBSplineSurface (provided by the package GeomConvert) to split the surface. Exceptions Standard_DimensionError if: - the array USplit was not created with the following bounds: - 1 , and - the number of split knots in the u parametric direction computed in this framework (as given by the function NbUSplits); or - the array VSplit was not created with the following bounds: - 1 , and - the number of split knots in the v parametric direction computed in this framework (as given by the function NbVSplits).

	:param USplit:
	:type USplit: TColStd_Array1OfInteger &
	:param VSplit:
	:type VSplit: TColStd_Array1OfInteger &
	:rtype: None
") Splitting;
		void Splitting (TColStd_Array1OfInteger & USplit,TColStd_Array1OfInteger & VSplit);
		%feature("compactdefaultargs") USplitValue;
		%feature("autodoc", "	* Returns the split knot of index UIndex to the split knots table for the u parametric direction computed in this framework. The returned value is an index in the knots table relative to the u parametric direction of the BSpline surface analysed by this algorithm. Note: If UIndex is equal to 1, or to the number of split knots for the u parametric direction computed in this framework, the corresponding knot gives the parameter of one of the bounding curves of the surface. Exceptions Standard_RangeError if UIndex is less than 1 or greater than the number of split knots for the u parametric direction computed in this framework.

	:param UIndex:
	:type UIndex: int
	:rtype: int
") USplitValue;
		Standard_Integer USplitValue (const Standard_Integer UIndex);
		%feature("compactdefaultargs") VSplitValue;
		%feature("autodoc", "	* Returns the split knot of index VIndex to the split knots table for the v parametric direction computed in this framework. The returned value is an index in the knots table relative to the v parametric direction of the BSpline surface analysed by this algorithm. Note: If UIndex is equal to 1, or to the number of split knots for the v parametric direction computed in this framework, the corresponding knot gives the parameter of one of the bounding curves of the surface. Exceptions Standard_RangeError if VIndex is less than 1 or greater than the number of split knots for the v parametric direction computed in this framework.

	:param VIndex:
	:type VIndex: int
	:rtype: int
") VSplitValue;
		Standard_Integer VSplitValue (const Standard_Integer VIndex);
};


%extend GeomConvert_BSplineSurfaceKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_BSplineSurfaceToBezierSurface;
class GeomConvert_BSplineSurfaceToBezierSurface {
	public:
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceToBezierSurface;
		%feature("autodoc", "	* Computes all the data needed to convert - the BSpline surface BasisSurface into a series of adjacent Bezier surfaces. The result consists of a grid of BasisSurface patches limited by isoparametric curves corresponding to knot values, both in the u and v parametric directions of the surface. A row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves. A column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves. Use the available interrogation functions to ascertain the number of computed Bezier patches, and then to construct each individual Bezier surface (or all Bezier surfaces). Note: ParametricTolerance is not used.

	:param BasisSurface:
	:type BasisSurface: Handle_Geom_BSplineSurface &
	:rtype: None
") GeomConvert_BSplineSurfaceToBezierSurface;
		 GeomConvert_BSplineSurfaceToBezierSurface (const Handle_Geom_BSplineSurface & BasisSurface);
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceToBezierSurface;
		%feature("autodoc", "	* Computes all the data needed to convert the patch of the BSpline surface BasisSurface limited by the two parameter values U1 and U2 in the u parametric direction, and by the two parameter values V1 and V2 in the v parametric direction, into a series of adjacent Bezier surfaces. The result consists of a grid of BasisSurface patches limited by isoparametric curves corresponding to knot values, both in the u and v parametric directions of the surface. A row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves. A column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves. Use the available interrogation functions to ascertain the number of computed Bezier patches, and then to construct each individual Bezier surface (or all Bezier surfaces). Note: ParametricTolerance is not used. Raises DomainError if U1 or U2 or V1 or V2 are out of the parametric bounds of the basis surface [FirstUKnotIndex, LastUKnotIndex] , [FirstVKnotIndex, LastVKnotIndex] The tolerance criterion is ParametricTolerance. Raised if U2 - U1 <= ParametricTolerance or V2 - V1 <= ParametricTolerance.

	:param BasisSurface:
	:type BasisSurface: Handle_Geom_BSplineSurface &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:rtype: None
") GeomConvert_BSplineSurfaceToBezierSurface;
		 GeomConvert_BSplineSurfaceToBezierSurface (const Handle_Geom_BSplineSurface & BasisSurface,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real ParametricTolerance);
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "	* Constructs and returns the Bezier surface of indices (UIndex, VIndex) to the patch grid computed on the BSpline surface analyzed by this algorithm. This Bezier surface has the same orientation as the BSpline surface analyzed in this framework. UIndex is an index common to a row in the patch grid. A row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves of the surface. VIndex is an index common to a column in the patch grid. A column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves of the surface. Exceptions Standard_OutOfRange if: - UIndex is less than 1 or greater than the number of rows in the patch grid computed on the BSpline surface analyzed by this algorithm (as returned by the function NbUPatches); or if - VIndex is less than 1 or greater than the number of columns in the patch grid computed on the BSpline surface analyzed by this algorithm (as returned by the function NbVPatches).

	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:rtype: Handle_Geom_BezierSurface
") Patch;
		Handle_Geom_BezierSurface Patch (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("compactdefaultargs") Patches;
		%feature("autodoc", "	* Constructs all the Bezier surfaces whose data is computed by this algorithm, and loads them into the Surfaces table. These Bezier surfaces have the same orientation as the BSpline surface analyzed in this framework. The Surfaces array is organised in the same way as the patch grid computed on the BSpline surface analyzed by this algorithm. A row in the array corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves of the surface. A column in the array corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves of the surface. Exceptions Standard_DimensionError if the Surfaces array was not created with the following bounds: - 1, and the number of adjacent patch series in the u parametric direction of the patch grid computed on the BSpline surface, analyzed by this algorithm (as given by the function NbUPatches) as row bounds, - 1, and the number of adjacent patch series in the v parametric direction of the patch grid computed on the BSpline surface, analyzed by this algorithm (as given by the function NbVPatches) as column bounds.

	:param Surfaces:
	:type Surfaces: TColGeom_Array2OfBezierSurface &
	:rtype: None
") Patches;
		void Patches (TColGeom_Array2OfBezierSurface & Surfaces);
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "	* This methode returns the bspline's u-knots associated to the converted Patches Raised if the length of Curves is not equal to NbUPatches + 1.

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") UKnots;
		void UKnots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "	* This methode returns the bspline's v-knots associated to the converted Patches Raised if the length of Curves is not equal to NbVPatches + 1.

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") VKnots;
		void VKnots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "	* Returns the number of Bezier surfaces in the U direction. If at the creation time you have decomposed the basis Surface between the parametric values UFirst, ULast the number of Bezier surfaces in the U direction depends on the number of knots included inside the interval [UFirst, ULast]. If you have decomposed the whole basis B-spline surface the number of Bezier surfaces NbUPatches is equal to the number of UKnots less one.

	:rtype: int
") NbUPatches;
		Standard_Integer NbUPatches ();
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "	* Returns the number of Bezier surfaces in the V direction. If at the creation time you have decomposed the basis surface between the parametric values VFirst, VLast the number of Bezier surfaces in the V direction depends on the number of knots included inside the interval [VFirst, VLast]. If you have decomposed the whole basis B-spline surface the number of Bezier surfaces NbVPatches is equal to the number of VKnots less one.

	:rtype: int
") NbVPatches;
		Standard_Integer NbVPatches ();
};


%extend GeomConvert_BSplineSurfaceToBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_CompBezierSurfacesToBSplineSurface;
class GeomConvert_CompBezierSurfacesToBSplineSurface {
	public:
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "	* Computes all the data needed to build a 'C0' continuous BSpline surface equivalent to the grid of adjacent non-rational Bezier surfaces Beziers. Each surface in the Beziers grid becomes a natural patch, limited by knots values, on the BSpline surface whose data is computed. Surfaces in the grid must satisfy the following conditions: - Coincident bounding curves between two consecutive surfaces in a row of the Beziers grid must be u-isoparametric bounding curves of these two surfaces. - Coincident bounding curves between two consecutive surfaces in a column of the Beziers grid must be v-isoparametric bounding curves of these two surfaces. The BSpline surface whose data is computed has the following characteristics: - Its degree in the u (respectively v) parametric direction is equal to that of the Bezier surface which has the highest degree in the u (respectively v) parametric direction in the Beziers grid. - It is a 'Piecewise Bezier' in both u and v parametric directions, i.e.: - the knots are regularly spaced in each parametric direction (i.e. the difference between two consecutive knots is a constant), and - all the multiplicities of the surface knots in a given parametric direction are equal to Degree, which is the degree of the BSpline surface in this parametric direction, except for the first and last knots for which the multiplicity is equal to Degree + 1. - Coincident bounding curves between two consecutive columns of Bezier surfaces in the Beziers grid become u-isoparametric curves, corresponding to knots values of the BSpline surface. - Coincident bounding curves between two consecutive rows of Bezier surfaces in the Beziers grid become v-isoparametric curves corresponding to knots values of the BSpline surface. Use the available consultation functions to access the computed data. This data may be used to construct the BSpline surface. Warning The surfaces in the Beziers grid must be adjacent, i.e. two consecutive Bezier surfaces in the grid (in a row or column) must have a coincident bounding curve. In addition, the location of the parameterization on each of these surfaces (i.e. the relative location of u and v isoparametric curves on the surface) is of importance with regard to the positioning of the surfaces in the Beziers grid. Care must be taken with respect to the above, as these properties are not checked and an error may occur if they are not satisfied. Exceptions Standard_NotImplemented if one of the Bezier surfaces of the Beziers grid is rational.

	:param Beziers:
	:type Beziers: TColGeom_Array2OfBezierSurface &
	:rtype: None
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface (const TColGeom_Array2OfBezierSurface & Beziers);
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "	* Build an Ci uniform (Rational) BSpline surface The higest Continuity Ci is imposed, like the maximal deformation is lower than <Tolerance>. Warning: The Continuity C0 is imposed without any check.

	:param Beziers:
	:type Beziers: TColGeom_Array2OfBezierSurface &
	:param Tolerance:
	:type Tolerance: float
	:param RemoveKnots: default value is Standard_True
	:type RemoveKnots: bool
	:rtype: None
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface (const TColGeom_Array2OfBezierSurface & Beziers,const Standard_Real Tolerance,const Standard_Boolean RemoveKnots = Standard_True);
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "	* Computes all the data needed to construct a BSpline surface equivalent to the adjacent non-rational Bezier surfaces Beziers grid. Each surface in the Beziers grid becomes a natural patch, limited by knots values, on the BSpline surface whose data is computed. Surfaces in the grid must satisfy the following conditions: - Coincident bounding curves between two consecutive surfaces in a row of the Beziers grid must be u-isoparametric bounding curves of these two surfaces. - Coincident bounding curves between two consecutive surfaces in a column of the Beziers grid must be v-isoparametric bounding curves of these two surfaces. The BSpline surface whose data is computed has the following characteristics: - Its degree in the u (respectively v) parametric direction is equal to that of the Bezier surface which has the highest degree in the u (respectively v) parametric direction in the Beziers grid. - Coincident bounding curves between two consecutive columns of Bezier surfaces in the Beziers grid become u-isoparametric curves corresponding to knots values of the BSpline surface. - Coincident bounding curves between two consecutive rows of Bezier surfaces in the Beziers grid become v-isoparametric curves corresponding to knots values of the BSpline surface. Knots values of the BSpline surface are given in the two tables: - UKnots for the u parametric direction (which corresponds to the order of Bezier surface columns in the Beziers grid), and - VKnots for the v parametric direction (which corresponds to the order of Bezier surface rows in the Beziers grid). The dimensions of UKnots (respectively VKnots) must be equal to the number of columns (respectively, rows) of the Beziers grid, plus 1 . UContinuity and VContinuity, which are both defaulted to GeomAbs_C0, specify the required continuity on the BSpline surface. If the required degree of continuity is greater than 0 in a given parametric direction, a deformation is applied locally on the initial surface (as defined by the Beziers grid) to satisfy this condition. This local deformation is not applied however, if it is greater than Tolerance (defaulted to 1.0 e-7). In such cases, the continuity condition is not satisfied, and the function IsDone will return false. A small tolerance value prevents any modification of the surface and a large tolerance value 'smoothes' the surface. Use the available consultation functions to access the computed data. This data may be used to construct the BSpline surface. Warning The surfaces in the Beziers grid must be adjacent, i.e. two consecutive Bezier surfaces in the grid (in a row or column) must have a coincident bounding curve. In addition, the location of the parameterization on each of these surfaces (i.e. the relative location of u and v isoparametric curves on the surface) is of importance with regard to the positioning of the surfaces in the Beziers grid. Care must be taken with respect to the above, as these properties are not checked and an error may occur if they are not satisfied. Exceptions Standard_DimensionMismatch: - if the number of knots in the UKnots table (i.e. the length of the UKnots array) is not equal to the number of columns of Bezier surfaces in the Beziers grid plus 1, or - if the number of knots in the VKnots table (i.e. the length of the VKnots array) is not equal to the number of rows of Bezier surfaces in the Beziers grid, plus 1. Standard_ConstructionError: - if UContinuity and VContinuity are not equal to one of the following values: GeomAbs_C0, GeomAbs_C1, GeomAbs_C2 and GeomAbs_C3; or - if the number of columns in the Beziers grid is greater than 1, and the required degree of continuity in the u parametric direction is greater than that of the Bezier surface with the highest degree in the u parametric direction (in the Beziers grid), minus 1; or - if the number of rows in the Beziers grid is greater than 1, and the required degree of continuity in the v parametric direction is greater than that of the Bezier surface with the highest degree in the v parametric direction (in the Beziers grid), minus 1 . Standard_NotImplemented if one of the Bezier surfaces in the Beziers grid is rational.

	:param Beziers:
	:type Beziers: TColGeom_Array2OfBezierSurface &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UContinuity: default value is GeomAbs_C0
	:type UContinuity: GeomAbs_Shape
	:param VContinuity: default value is GeomAbs_C0
	:type VContinuity: GeomAbs_Shape
	:param Tolerance: default value is 1.0e-4
	:type Tolerance: float
	:rtype: None
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface (const TColGeom_Array2OfBezierSurface & Beziers,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const GeomAbs_Shape UContinuity = GeomAbs_C0,const GeomAbs_Shape VContinuity = GeomAbs_C0,const Standard_Real Tolerance = 1.0e-4);
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	* Returns the number of knots in the U direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	* Returns number of poles in the U direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	* Returns the number of knots in the V direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	* Returns the number of poles in the V direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* Returns the table of poles of the BSpline surface whose data is computed in this framework.

	:rtype: Handle_TColgp_HArray2OfPnt
") Poles;
		Handle_TColgp_HArray2OfPnt Poles ();
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "	* Returns the knots table for the u parametric direction of the BSpline surface whose data is computed in this framework.

	:rtype: Handle_TColStd_HArray1OfReal
") UKnots;
		Handle_TColStd_HArray1OfReal UKnots ();
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	* Returns the degree for the u parametric direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "	* Returns the knots table for the v parametric direction of the BSpline surface whose data is computed in this framework.

	:rtype: Handle_TColStd_HArray1OfReal
") VKnots;
		Handle_TColStd_HArray1OfReal VKnots ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	* Returns the degree for the v parametric direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "	* Returns the multiplicities table for the u parametric direction of the knots of the BSpline surface whose data is computed in this framework.

	:rtype: Handle_TColStd_HArray1OfInteger
") UMultiplicities;
		Handle_TColStd_HArray1OfInteger UMultiplicities ();
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "	* -- Returns the multiplicities table for the v parametric direction of the knots of the BSpline surface whose data is computed in this framework.

	:rtype: Handle_TColStd_HArray1OfInteger
") VMultiplicities;
		Handle_TColStd_HArray1OfInteger VMultiplicities ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the conversion was successful. Unless an exception was raised at the time of construction, the conversion of the Bezier surface grid assigned to this algorithm is always carried out. IsDone returns false if the constraints defined at the time of construction cannot be respected. This occurs when there is an incompatibility between a required degree of continuity on the BSpline surface, and the maximum tolerance accepted for local deformations of the surface. In such a case the computed data does not satisfy all the initial constraints.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend GeomConvert_CompBezierSurfacesToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomConvert_CompCurveToBSplineCurve;
class GeomConvert_CompCurveToBSplineCurve {
	public:
		%feature("compactdefaultargs") GeomConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "	* Initialize the algorithme - Parameterisation is used to convert

	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") GeomConvert_CompCurveToBSplineCurve;
		 GeomConvert_CompCurveToBSplineCurve (const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") GeomConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "	* Initialize the algorithme with one curve - Parameterisation is used to convert

	:param BasisCurve:
	:type BasisCurve: Handle_Geom_BoundedCurve &
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") GeomConvert_CompCurveToBSplineCurve;
		 GeomConvert_CompCurveToBSplineCurve (const Handle_Geom_BoundedCurve & BasisCurve,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Append a curve in the BSpline Return False if the curve is not G0 with the BSplineCurve. Tolerance is used to check continuity and decrease Multiplicity at the common Knot until MinM if MinM = 0, the common Knot can be removed

	:param NewCurve:
	:type NewCurve: Handle_Geom_BoundedCurve &
	:param Tolerance:
	:type Tolerance: float
	:param After: default value is Standard_False
	:type After: bool
	:param WithRatio: default value is Standard_True
	:type WithRatio: bool
	:param MinM: default value is 0
	:type MinM: int
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Geom_BoundedCurve & NewCurve,const Standard_Real Tolerance,const Standard_Boolean After = Standard_False,const Standard_Boolean WithRatio = Standard_True,const Standard_Integer MinM = 0);
		%feature("compactdefaultargs") BSplineCurve;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSplineCurve;
		Handle_Geom_BSplineCurve BSplineCurve ();
};


%extend GeomConvert_CompCurveToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
