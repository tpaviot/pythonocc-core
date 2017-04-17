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
%module (package="OCC") Convert

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


%include Convert_headers.i


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
typedef void Convert_CosAndSinEvalFunction ( Standard_Real , 	 	 	 	 	 const Standard_Integer , 	 	 	 	 	 const TColgp_Array1OfPnt2d & , 	 	 	 	 	 const TColStd_Array1OfReal & , 	 	 	 	 	 const TColStd_Array1OfInteger & , 	 	 	 	 	 Standard_Real Result [ 2 ] );
typedef TColgp_SequenceOfArray1OfPnt2d Convert_SequenceOfArray1OfPoles2d;
/* end typedefs declaration */

/* public enums */
enum Convert_ParameterisationType {
	Convert_TgtThetaOver2 = 0,
	Convert_TgtThetaOver2_1 = 1,
	Convert_TgtThetaOver2_2 = 2,
	Convert_TgtThetaOver2_3 = 3,
	Convert_TgtThetaOver2_4 = 4,
	Convert_QuasiAngular = 5,
	Convert_RationalC1 = 6,
	Convert_Polynomial = 7,
};

/* end public enums declaration */

%nodefaultctor Convert_CompBezierCurves2dToBSplineCurve2d;
class Convert_CompBezierCurves2dToBSplineCurve2d {
	public:
		%feature("compactdefaultargs") Convert_CompBezierCurves2dToBSplineCurve2d;
		%feature("autodoc", "	* Constructs a framework for converting a sequence of adjacent non-rational Bezier curves into a BSpline curve. Knots will be created on the computed BSpline curve at each junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. AngularTolerance (given in radians, and defaulted to 1.0 e-4) will be used to check the parallelism of the two tangent vectors. Use the following functions: - AddCurve to define in sequence the adjacent Bezier curves to be converted, - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve.

	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: None
") Convert_CompBezierCurves2dToBSplineCurve2d;
		 Convert_CompBezierCurves2dToBSplineCurve2d (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "	* Adds the Bezier curve defined by the table of poles Poles, to the sequence (still contained in this framework) of adjacent Bezier curves to be converted into a BSpline curve. Only polynomial (i.e. non-rational) Bezier curves are converted using this framework. If this is not the first call to the function (i.e. if this framework still contains data in its sequence of Bezier curves), the degree of continuity of the BSpline curve will be increased at the time of computation at the first point of the added Bezier curve (i.e. the first point of the Poles table). This will be the case if the tangent vector of the curve at this point is parallel to the tangent vector at the end point of the preceding Bezier curve in the sequence of Bezier curves still contained in this framework. An angular tolerance given at the time of construction of this framework, will be used to check the parallelism of the two tangent vectors. This checking procedure, and all the relative computations will be performed by the function Perform. When the sequence of adjacent Bezier curves is complete, use the following functions: - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve. Warning The sequence of Bezier curves treated by this framework is automatically initialized with the first Bezier curve when the function is first called. During subsequent use of this function, ensure that the first point of the added Bezier curve (i.e. the first point of the Poles table) is coincident with the last point of the sequence (i.e. the last point of the preceding Bezier curve in the sequence) of Bezier curves still contained in this framework. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above, as this condition is not checked either when defining the sequence of Bezier curves or at the time of computation.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:rtype: None
") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt2d & Poles);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes all the data needed to build a BSpline curve equivalent to the sequence of adjacent Bezier curves still contained in this framework. A knot is inserted on the computed BSpline curve at the junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. An angular tolerance given at the time of construction of this framework is used to check the parallelism of the two tangent vectors. Use the available consultation functions to access the computed data. This data may then be used to construct the BSpline curve. Warning Ensure that the curves in the sequence of Bezier curves contained in this framework are adjacent. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above as this condition is not checked, either when defining the Bezier curve sequence or at the time of computation.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* Returns the degree of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* Returns the number of poles of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* Loads the Poles table with the poles of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Poles array must be equal to the number of poles of the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above, as these conditions are not checked, and an error may occur.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:rtype: None
") Poles;
		void Poles (TColgp_Array1OfPnt2d & Poles);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	* Returns the number of knots of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "	* Loads the Knots table with the knots and the Mults table with the corresponding multiplicities of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Knots and Mults arrays must be equal to the number of knots in the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above as these conditions are not checked, and an error may occur.

	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%extend Convert_CompBezierCurves2dToBSplineCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_CompBezierCurvesToBSplineCurve;
class Convert_CompBezierCurvesToBSplineCurve {
	public:
		%feature("compactdefaultargs") Convert_CompBezierCurvesToBSplineCurve;
		%feature("autodoc", "	* Constructs a framework for converting a sequence of adjacent non-rational Bezier curves into a BSpline curve. Knots will be created on the computed BSpline curve at each junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. AngularTolerance (given in radians, and defaulted to 1.0 e-4) will be used to check the parallelism of the two tangent vectors. Use the following functions: - AddCurve to define in sequence the adjacent Bezier curves to be converted, - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve.

	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: None
") Convert_CompBezierCurvesToBSplineCurve;
		 Convert_CompBezierCurvesToBSplineCurve (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "	* Adds the Bezier curve defined by the table of poles Poles, to the sequence (still contained in this framework) of adjacent Bezier curves to be converted into a BSpline curve. Only polynomial (i.e. non-rational) Bezier curves are converted using this framework. If this is not the first call to the function (i.e. if this framework still contains data in its Bezier curve sequence), the degree of continuity of the BSpline curve will be increased at the time of computation at the first point of the added Bezier curve (i.e. the first point of the Poles table). This will be the case if the tangent vector of the curve at this point is parallel to the tangent vector at the end point of the preceding Bezier curve in the Bezier curve sequence still contained in this framework. An angular tolerance given at the time of construction of this framework will be used to check the parallelism of the two tangent vectors. This checking procedure and all related computations will be performed by the Perform function. When the adjacent Bezier curve sequence is complete, use the following functions: - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve. Warning The Bezier curve sequence treated by this framework is automatically initialized with the first Bezier curve when the function is first called. During subsequent use of this function, ensure that the first point of the added Bezier curve (i.e. the first point of the Poles table) is coincident with the last point of the Bezier curve sequence (i.e. the last point of the preceding Bezier curve in the sequence) still contained in this framework. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above, as this condition is not checked either when defining the Bezier curve sequence or at the time of computation.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: None
") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt & Poles);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes all the data needed to build a BSpline curve equivalent to the adjacent Bezier curve sequence still contained in this framework. A knot is inserted on the computed BSpline curve at the junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. An angular tolerance given at the time of construction of this framework is used to check the parallelism of the two tangent vectors. Use the available consultation functions to access the computed data. This data may then be used to construct the BSpline curve. Warning Make sure that the curves in the Bezier curve sequence contained in this framework are adjacent. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above as this condition is not checked, either when defining the Bezier curve sequence or at the time of computation.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* Returns the degree of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* Returns the number of poles of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* Loads the Poles table with the poles of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Poles array must be equal to the number of poles of the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above, as these conditions are not checked, and an error may occur.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: None
") Poles;
		void Poles (TColgp_Array1OfPnt & Poles);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	* Returns the number of knots of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "	* - loads the Knots table with the knots, - and loads the Mults table with the corresponding multiplicities of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Knots and Mults arrays must be equal to the number of knots in the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above as these conditions are not checked, and an error may occur.

	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%extend Convert_CompBezierCurvesToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_CompPolynomialToPoles;
class Convert_CompPolynomialToPoles {
	public:
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "	* Warning! Continuity can be at MOST the maximum degree of the polynomial functions TrueIntervals : this is the true parameterisation for the composite curve that is : the curve has myContinuity if the nth curve is parameterized between myTrueIntervals(n) and myTrueIntervals(n+1) //! Coefficients have to be the implicit 'c form': Coefficients[Numcurves][MaxDegree+1][Dimension] //! Warning! The NumberOfCoefficient of an polynome is his degree + 1 Example: To convert the linear function f(x) = 2*x + 1 on the domaine [2,5] to BSpline with the bound [-1,1]. Arguments are : NumCurves = 1; Continuity = 1; Dimension = 1; MaxDegree = 1; NumCoeffPerCurve [1] = {2}; Coefficients[2] = {1, 2}; PolynomialIntervals[1,2] = {{2,5}} TrueIntervals[2] = {-1, 1}

	:param NumCurves:
	:type NumCurves: int
	:param Continuity:
	:type Continuity: int
	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param NumCoeffPerCurve:
	:type NumCoeffPerCurve: Handle_TColStd_HArray1OfInteger &
	:param Coefficients:
	:type Coefficients: Handle_TColStd_HArray1OfReal &
	:param PolynomialIntervals:
	:type PolynomialIntervals: Handle_TColStd_HArray2OfReal &
	:param TrueIntervals:
	:type TrueIntervals: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles (const Standard_Integer NumCurves,const Standard_Integer Continuity,const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Handle_TColStd_HArray1OfInteger & NumCoeffPerCurve,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray2OfReal & PolynomialIntervals,const Handle_TColStd_HArray1OfReal & TrueIntervals);
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "	* To Convert sevral span with different order of Continuity. Warning: The Length of Continuity have to be NumCurves-1

	:param NumCurves:
	:type NumCurves: int
	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Continuity:
	:type Continuity: TColStd_Array1OfInteger &
	:param NumCoeffPerCurve:
	:type NumCoeffPerCurve: TColStd_Array1OfInteger &
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal &
	:param PolynomialIntervals:
	:type PolynomialIntervals: TColStd_Array2OfReal &
	:param TrueIntervals:
	:type TrueIntervals: TColStd_Array1OfReal &
	:rtype: None
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles (const Standard_Integer NumCurves,const Standard_Integer Dimension,const Standard_Integer MaxDegree,const TColStd_Array1OfInteger & Continuity,const TColStd_Array1OfInteger & NumCoeffPerCurve,const TColStd_Array1OfReal & Coefficients,const TColStd_Array2OfReal & PolynomialIntervals,const TColStd_Array1OfReal & TrueIntervals);
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "	* To Convert only one span.

	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Degree:
	:type Degree: int
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal &
	:param PolynomialIntervals:
	:type PolynomialIntervals: TColStd_Array1OfReal &
	:param TrueIntervals:
	:type TrueIntervals: TColStd_Array1OfReal &
	:rtype: None
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles (const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Standard_Integer Degree,const TColStd_Array1OfReal & Coefficients,const TColStd_Array1OfReal & PolynomialIntervals,const TColStd_Array1OfReal & TrueIntervals);
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* number of poles of the n-dimensional BSpline

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* returns the poles of the n-dimensional BSpline in the following format : [1..NumPoles][1..Dimension]

	:param Poles:
	:type Poles: Handle_TColStd_HArray2OfReal &
	:rtype: None
") Poles;
		void Poles (Handle_TColStd_HArray2OfReal & Poles);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	* Degree of the n-dimensional Bspline

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* Knots of the n-dimensional Bspline

	:param K:
	:type K: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Knots;
		void Knots (Handle_TColStd_HArray1OfReal & K);
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "	* Multiplicities of the knots in the BSpline

	:param M:
	:type M: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") Multiplicities;
		void Multiplicities (Handle_TColStd_HArray1OfInteger & M);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend Convert_CompPolynomialToPoles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_ConicToBSplineCurve;
class Convert_ConicToBSplineCurve {
	public:
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* Returns the degree of the BSpline curve whose data is computed in this framework.

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* Returns the number of poles of the BSpline curve whose data is computed in this framework.

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	* Returns the number of knots of the BSpline curve whose data is computed in this framework.

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	* Returns true if the BSpline curve whose data is computed in this framework is periodic.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "	* Returns the pole of index Index to the poles table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table of the BSpline curve whose data is computed in this framework.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Pole;
		gp_Pnt2d Pole (const Standard_Integer Index);
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "	* Returns the weight of the pole of index Index to the poles table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table of the BSpline curve whose data is computed in this framework.

	:param Index:
	:type Index: int
	:rtype: float
") Weight;
		Standard_Real Weight (const Standard_Integer Index);
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "	* Returns the knot of index Index to the knots table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table of the BSpline curve whose data is computed in this framework.

	:param Index:
	:type Index: int
	:rtype: float
") Knot;
		Standard_Real Knot (const Standard_Integer Index);
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "	* Returns the multiplicity of the knot of index Index to the knots table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table of the BSpline curve whose data is computed in this framework.

	:param Index:
	:type Index: int
	:rtype: int
") Multiplicity;
		Standard_Integer Multiplicity (const Standard_Integer Index);
		%feature("compactdefaultargs") BuildCosAndSin;
		%feature("autodoc", "	:param Parametrisation:
	:type Parametrisation: Convert_ParameterisationType
	:param CosNumerator:
	:type CosNumerator: Handle_TColStd_HArray1OfReal &
	:param SinNumerator:
	:type SinNumerator: Handle_TColStd_HArray1OfReal &
	:param Denominator:
	:type Denominator: Handle_TColStd_HArray1OfReal &
	:param Degree:
	:type Degree: int &
	:param Knots:
	:type Knots: Handle_TColStd_HArray1OfReal &
	:param Mults:
	:type Mults: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") BuildCosAndSin;
		void BuildCosAndSin (const Convert_ParameterisationType Parametrisation,Handle_TColStd_HArray1OfReal & CosNumerator,Handle_TColStd_HArray1OfReal & SinNumerator,Handle_TColStd_HArray1OfReal & Denominator,Standard_Integer &OutValue,Handle_TColStd_HArray1OfReal & Knots,Handle_TColStd_HArray1OfInteger & Mults);
		%feature("compactdefaultargs") BuildCosAndSin;
		%feature("autodoc", "	:param Parametrisation:
	:type Parametrisation: Convert_ParameterisationType
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param CosNumerator:
	:type CosNumerator: Handle_TColStd_HArray1OfReal &
	:param SinNumerator:
	:type SinNumerator: Handle_TColStd_HArray1OfReal &
	:param Denominator:
	:type Denominator: Handle_TColStd_HArray1OfReal &
	:param Degree:
	:type Degree: int &
	:param Knots:
	:type Knots: Handle_TColStd_HArray1OfReal &
	:param Mults:
	:type Mults: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") BuildCosAndSin;
		void BuildCosAndSin (const Convert_ParameterisationType Parametrisation,const Standard_Real UFirst,const Standard_Real ULast,Handle_TColStd_HArray1OfReal & CosNumerator,Handle_TColStd_HArray1OfReal & SinNumerator,Handle_TColStd_HArray1OfReal & Denominator,Standard_Integer &OutValue,Handle_TColStd_HArray1OfReal & Knots,Handle_TColStd_HArray1OfInteger & Mults);
};


%extend Convert_ConicToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_ElementarySurfaceToBSplineSurface;
class Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	* Returns the degree for the u or v parametric direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	* Returns the number of poles for the u or v parametric direction of the BSpline surface whose data is computed in this framework.

	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	* Returns the number of knots for the u or v parametric direction of the BSpline surface whose data is computed in this framework .

	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	* Returns true if the BSpline surface whose data is computed in this framework is periodic in the u or v parametric direction.

	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "	* Returns the pole of index (UIndex,VIndex) to the poles table of the BSpline surface whose data is computed in this framework. Exceptions Standard_OutOfRange if, for the BSpline surface whose data is computed in this framework: - UIndex is outside the bounds of the poles table in the u parametric direction, or - VIndex is outside the bounds of the poles table in the v parametric direction.

	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:rtype: gp_Pnt
") Pole;
		gp_Pnt Pole (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "	* Returns the weight of the pole of index (UIndex,VIndex) to the poles table of the BSpline surface whose data is computed in this framework. Exceptions Standard_OutOfRange if, for the BSpline surface whose data is computed in this framework: - UIndex is outside the bounds of the poles table in the u parametric direction, or - VIndex is outside the bounds of the poles table in the v parametric direction.

	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:rtype: float
") Weight;
		Standard_Real Weight (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("compactdefaultargs") UKnot;
		%feature("autodoc", "	* Returns the U-knot of range UIndex. Raised if UIndex < 1 or UIndex > NbUKnots.

	:param UIndex:
	:type UIndex: int
	:rtype: float
") UKnot;
		Standard_Real UKnot (const Standard_Integer UIndex);
		%feature("compactdefaultargs") VKnot;
		%feature("autodoc", "	* Returns the V-knot of range VIndex. Raised if VIndex < 1 or VIndex > NbVKnots.

	:param UIndex:
	:type UIndex: int
	:rtype: float
") VKnot;
		Standard_Real VKnot (const Standard_Integer UIndex);
		%feature("compactdefaultargs") UMultiplicity;
		%feature("autodoc", "	* Returns the multiplicity of the U-knot of range UIndex. Raised if UIndex < 1 or UIndex > NbUKnots.

	:param UIndex:
	:type UIndex: int
	:rtype: int
") UMultiplicity;
		Standard_Integer UMultiplicity (const Standard_Integer UIndex);
		%feature("compactdefaultargs") VMultiplicity;
		%feature("autodoc", "	* Returns the multiplicity of the V-knot of range VIndex. Raised if VIndex < 1 or VIndex > NbVKnots.

	:param VIndex:
	:type VIndex: int
	:rtype: int
") VMultiplicity;
		Standard_Integer VMultiplicity (const Standard_Integer VIndex);
};


%extend Convert_ElementarySurfaceToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_GridPolynomialToPoles;
class Convert_GridPolynomialToPoles {
	public:
		%feature("compactdefaultargs") Convert_GridPolynomialToPoles;
		%feature("autodoc", "	* To only one polynomial Surface. The Length of <PolynomialUIntervals> and <PolynomialVIntervals> have to be 2. This values defined the parametric domain of the Polynomial Equation. //! Coefficients : The <Coefficients> have to be formated than an 'C array' [MaxUDegree+1] [MaxVDegree+1] [3]

	:param MaxUDegree:
	:type MaxUDegree: int
	:param MaxVDegree:
	:type MaxVDegree: int
	:param NumCoeff:
	:type NumCoeff: Handle_TColStd_HArray1OfInteger &
	:param Coefficients:
	:type Coefficients: Handle_TColStd_HArray1OfReal &
	:param PolynomialUIntervals:
	:type PolynomialUIntervals: Handle_TColStd_HArray1OfReal &
	:param PolynomialVIntervals:
	:type PolynomialVIntervals: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles (const Standard_Integer MaxUDegree,const Standard_Integer MaxVDegree,const Handle_TColStd_HArray1OfInteger & NumCoeff,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray1OfReal & PolynomialUIntervals,const Handle_TColStd_HArray1OfReal & PolynomialVIntervals);
		%feature("compactdefaultargs") Convert_GridPolynomialToPoles;
		%feature("autodoc", "	* To one grid of polynomial Surface. Warning! Continuity in each parametric direction can be at MOST the maximum degree of the polynomial functions. //! <TrueUIntervals>, <TrueVIntervals> : this is the true parameterisation for the composite surface //! Coefficients : The Coefficients have to be formated than an 'C array' [NbVSurfaces] [NBUSurfaces] [MaxUDegree+1] [MaxVDegree+1] [3] raises DomainError if <NumCoeffPerSurface> is not a [1, NbVSurfaces*NbUSurfaces, 1,2] array. if <Coefficients> is not a

	:param NbUSurfaces:
	:type NbUSurfaces: int
	:param NBVSurfaces:
	:type NBVSurfaces: int
	:param UContinuity:
	:type UContinuity: int
	:param VContinuity:
	:type VContinuity: int
	:param MaxUDegree:
	:type MaxUDegree: int
	:param MaxVDegree:
	:type MaxVDegree: int
	:param NumCoeffPerSurface:
	:type NumCoeffPerSurface: Handle_TColStd_HArray2OfInteger &
	:param Coefficients:
	:type Coefficients: Handle_TColStd_HArray1OfReal &
	:param PolynomialUIntervals:
	:type PolynomialUIntervals: Handle_TColStd_HArray1OfReal &
	:param PolynomialVIntervals:
	:type PolynomialVIntervals: Handle_TColStd_HArray1OfReal &
	:param TrueUIntervals:
	:type TrueUIntervals: Handle_TColStd_HArray1OfReal &
	:param TrueVIntervals:
	:type TrueVIntervals: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles (const Standard_Integer NbUSurfaces,const Standard_Integer NBVSurfaces,const Standard_Integer UContinuity,const Standard_Integer VContinuity,const Standard_Integer MaxUDegree,const Standard_Integer MaxVDegree,const Handle_TColStd_HArray2OfInteger & NumCoeffPerSurface,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray1OfReal & PolynomialUIntervals,const Handle_TColStd_HArray1OfReal & PolynomialVIntervals,const Handle_TColStd_HArray1OfReal & TrueUIntervals,const Handle_TColStd_HArray1OfReal & TrueVIntervals);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param UContinuity:
	:type UContinuity: int
	:param VContinuity:
	:type VContinuity: int
	:param MaxUDegree:
	:type MaxUDegree: int
	:param MaxVDegree:
	:type MaxVDegree: int
	:param NumCoeffPerSurface:
	:type NumCoeffPerSurface: Handle_TColStd_HArray2OfInteger &
	:param Coefficients:
	:type Coefficients: Handle_TColStd_HArray1OfReal &
	:param PolynomialUIntervals:
	:type PolynomialUIntervals: Handle_TColStd_HArray1OfReal &
	:param PolynomialVIntervals:
	:type PolynomialVIntervals: Handle_TColStd_HArray1OfReal &
	:param TrueUIntervals:
	:type TrueUIntervals: Handle_TColStd_HArray1OfReal &
	:param TrueVIntervals:
	:type TrueVIntervals: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Perform;
		void Perform (const Standard_Integer UContinuity,const Standard_Integer VContinuity,const Standard_Integer MaxUDegree,const Standard_Integer MaxVDegree,const Handle_TColStd_HArray2OfInteger & NumCoeffPerSurface,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray1OfReal & PolynomialUIntervals,const Handle_TColStd_HArray1OfReal & PolynomialVIntervals,const Handle_TColStd_HArray1OfReal & TrueUIntervals,const Handle_TColStd_HArray1OfReal & TrueVIntervals);
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* returns the poles of the BSpline Surface

	:rtype: Handle_TColgp_HArray2OfPnt
") Poles;
		Handle_TColgp_HArray2OfPnt Poles ();
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "	* Knots in the U direction

	:rtype: Handle_TColStd_HArray1OfReal
") UKnots;
		Handle_TColStd_HArray1OfReal UKnots ();
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "	* Knots in the V direction

	:rtype: Handle_TColStd_HArray1OfReal
") VKnots;
		Handle_TColStd_HArray1OfReal VKnots ();
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "	* Multiplicities of the knots in the U direction

	:rtype: Handle_TColStd_HArray1OfInteger
") UMultiplicities;
		Handle_TColStd_HArray1OfInteger UMultiplicities ();
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "	* Multiplicities of the knots in the V direction

	:rtype: Handle_TColStd_HArray1OfInteger
") VMultiplicities;
		Handle_TColStd_HArray1OfInteger VMultiplicities ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend Convert_GridPolynomialToPoles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_SequenceNodeOfSequenceOfArray1OfPoles;
class Convert_SequenceNodeOfSequenceOfArray1OfPoles : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Convert_SequenceNodeOfSequenceOfArray1OfPoles;
		%feature("autodoc", "	:param I:
	:type I: Handle_TColgp_HArray1OfPnt
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Convert_SequenceNodeOfSequenceOfArray1OfPoles;
		 Convert_SequenceNodeOfSequenceOfArray1OfPoles (const Handle_TColgp_HArray1OfPnt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt
") Value;
		Handle_TColgp_HArray1OfPnt Value ();
};


%extend Convert_SequenceNodeOfSequenceOfArray1OfPoles {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles::Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles;
class Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles();
        Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles(const Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles &aHandle);
        Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles(const Convert_SequenceNodeOfSequenceOfArray1OfPoles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles {
    Convert_SequenceNodeOfSequenceOfArray1OfPoles* _get_reference() {
    return (Convert_SequenceNodeOfSequenceOfArray1OfPoles*)$self->Access();
    }
};

%extend Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Convert_SequenceNodeOfSequenceOfArray1OfPoles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_SequenceOfArray1OfPoles;
class Convert_SequenceOfArray1OfPoles : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Convert_SequenceOfArray1OfPoles;
		%feature("autodoc", "	:rtype: None
") Convert_SequenceOfArray1OfPoles;
		 Convert_SequenceOfArray1OfPoles ();
		%feature("compactdefaultargs") Convert_SequenceOfArray1OfPoles;
		%feature("autodoc", "	:param Other:
	:type Other: Convert_SequenceOfArray1OfPoles &
	:rtype: None
") Convert_SequenceOfArray1OfPoles;
		 Convert_SequenceOfArray1OfPoles (const Convert_SequenceOfArray1OfPoles & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Convert_SequenceOfArray1OfPoles &
	:rtype: Convert_SequenceOfArray1OfPoles
") Assign;
		const Convert_SequenceOfArray1OfPoles & Assign (const Convert_SequenceOfArray1OfPoles & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Convert_SequenceOfArray1OfPoles &
	:rtype: Convert_SequenceOfArray1OfPoles
") operator =;
		const Convert_SequenceOfArray1OfPoles & operator = (const Convert_SequenceOfArray1OfPoles & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HArray1OfPnt & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Convert_SequenceOfArray1OfPoles &
	:rtype: None
") Append;
		void Append (Convert_SequenceOfArray1OfPoles & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HArray1OfPnt & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Convert_SequenceOfArray1OfPoles &
	:rtype: None
") Prepend;
		void Prepend (Convert_SequenceOfArray1OfPoles & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColgp_HArray1OfPnt
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Convert_SequenceOfArray1OfPoles &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Convert_SequenceOfArray1OfPoles & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColgp_HArray1OfPnt
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Convert_SequenceOfArray1OfPoles &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Convert_SequenceOfArray1OfPoles & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt
") First;
		Handle_TColgp_HArray1OfPnt First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt
") Last;
		Handle_TColgp_HArray1OfPnt Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Convert_SequenceOfArray1OfPoles &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Convert_SequenceOfArray1OfPoles & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColgp_HArray1OfPnt
") Value;
		Handle_TColgp_HArray1OfPnt Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TColgp_HArray1OfPnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColgp_HArray1OfPnt
") ChangeValue;
		Handle_TColgp_HArray1OfPnt ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Convert_SequenceOfArray1OfPoles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_CircleToBSplineCurve;
class Convert_CircleToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("compactdefaultargs") Convert_CircleToBSplineCurve;
		%feature("autodoc", "	* The equivalent B-spline curve has the same orientation as the circle C.

	:param C:
	:type C: gp_Circ2d
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") Convert_CircleToBSplineCurve;
		 Convert_CircleToBSplineCurve (const gp_Circ2d & C,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") Convert_CircleToBSplineCurve;
		%feature("autodoc", "	* The circle C is limited between the parametric values U1, U2 in radians. U1 and U2 [0.0, 2*Pi] . The equivalent B-spline curve is oriented from U1 to U2 and has the same orientation as the circle C. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi

	:param C:
	:type C: gp_Circ2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") Convert_CircleToBSplineCurve;
		 Convert_CircleToBSplineCurve (const gp_Circ2d & C,const Standard_Real U1,const Standard_Real U2,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
};


%extend Convert_CircleToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_ConeToBSplineSurface;
class Convert_ConeToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("compactdefaultargs") Convert_ConeToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the Cone in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.

	:param C:
	:type C: gp_Cone
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface (const gp_Cone & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("compactdefaultargs") Convert_ConeToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the Cone in the U and V parametric directions. //! Raised if V1 = V2.

	:param C:
	:type C: gp_Cone
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface (const gp_Cone & C,const Standard_Real V1,const Standard_Real V2);
};


%extend Convert_ConeToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_CylinderToBSplineSurface;
class Convert_CylinderToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("compactdefaultargs") Convert_CylinderToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-splineSurface as the same orientation as the cylinder in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface (const gp_Cylinder & Cyl,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("compactdefaultargs") Convert_CylinderToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-splineSurface as the same orientation as the cylinder in the U and V parametric directions. //! Raised if V1 = V2.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface (const gp_Cylinder & Cyl,const Standard_Real V1,const Standard_Real V2);
};


%extend Convert_CylinderToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_EllipseToBSplineCurve;
class Convert_EllipseToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("compactdefaultargs") Convert_EllipseToBSplineCurve;
		%feature("autodoc", "	* The equivalent B-spline curve has the same orientation as the ellipse E.

	:param E:
	:type E: gp_Elips2d
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") Convert_EllipseToBSplineCurve;
		 Convert_EllipseToBSplineCurve (const gp_Elips2d & E,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("compactdefaultargs") Convert_EllipseToBSplineCurve;
		%feature("autodoc", "	* The ellipse E is limited between the parametric values U1, U2. The equivalent B-spline curve is oriented from U1 to U2 and has the same orientation as E. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi

	:param E:
	:type E: gp_Elips2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") Convert_EllipseToBSplineCurve;
		 Convert_EllipseToBSplineCurve (const gp_Elips2d & E,const Standard_Real U1,const Standard_Real U2,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
};


%extend Convert_EllipseToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_HyperbolaToBSplineCurve;
class Convert_HyperbolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("compactdefaultargs") Convert_HyperbolaToBSplineCurve;
		%feature("autodoc", "	* The hyperbola H is limited between the parametric values U1, U2 and the equivalent B-spline curve has the same orientation as the hyperbola.

	:param H:
	:type H: gp_Hypr2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Convert_HyperbolaToBSplineCurve;
		 Convert_HyperbolaToBSplineCurve (const gp_Hypr2d & H,const Standard_Real U1,const Standard_Real U2);
};


%extend Convert_HyperbolaToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_ParabolaToBSplineCurve;
class Convert_ParabolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("compactdefaultargs") Convert_ParabolaToBSplineCurve;
		%feature("autodoc", "	* The parabola Prb is limited between the parametric values U1, U2 and the equivalent B-spline curve as the same orientation as the parabola Prb.

	:param Prb:
	:type Prb: gp_Parab2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Convert_ParabolaToBSplineCurve;
		 Convert_ParabolaToBSplineCurve (const gp_Parab2d & Prb,const Standard_Real U1,const Standard_Real U2);
};


%extend Convert_ParabolaToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_SphereToBSplineSurface;
class Convert_SphereToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.

	:param Sph:
	:type Sph: gp_Sphere
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface (const gp_Sphere & Sph,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions. //! Raised if UTrim = True and Param1 = Param2 or Param1 = Param2 + 2.0 * Pi Raised if UTrim = False and Param1 = Param2

	:param Sph:
	:type Sph: gp_Sphere
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param UTrim: default value is Standard_True
	:type UTrim: bool
	:rtype: None
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface (const gp_Sphere & Sph,const Standard_Real Param1,const Standard_Real Param2,const Standard_Boolean UTrim = Standard_True);
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions.

	:param Sph:
	:type Sph: gp_Sphere
	:rtype: None
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface (const gp_Sphere & Sph);
};


%extend Convert_SphereToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Convert_TorusToBSplineSurface;
class Convert_TorusToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2 or V1 = V2 + 2.0 * Pi

	:param T:
	:type T: gp_Torus
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface (const gp_Torus & T,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions. //! Raised if Param1 = Param2 or Param1 = Param2 + 2.0 * Pi

	:param T:
	:type T: gp_Torus
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param UTrim: default value is Standard_True
	:type UTrim: bool
	:rtype: None
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface (const gp_Torus & T,const Standard_Real Param1,const Standard_Real Param2,const Standard_Boolean UTrim = Standard_True);
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "	* The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions.

	:param T:
	:type T: gp_Torus
	:rtype: None
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface (const gp_Torus & T);
};


%extend Convert_TorusToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
