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
%define CONVERTDOCSTRING
"Convert module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_convert.html"
%enddef
%module (package="OCC.Core", docstring=CONVERTDOCSTRING) Convert


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
#include<Convert_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import TColStd.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proxy classes for enums */
%pythoncode {

class Convert_ParameterisationType(IntEnum):
	Convert_TgtThetaOver2 = 0
	Convert_TgtThetaOver2_1 = 1
	Convert_TgtThetaOver2_2 = 2
	Convert_TgtThetaOver2_3 = 3
	Convert_TgtThetaOver2_4 = 4
	Convert_QuasiAngular = 5
	Convert_RationalC1 = 6
	Convert_Polynomial = 7
Convert_TgtThetaOver2 = Convert_ParameterisationType.Convert_TgtThetaOver2
Convert_TgtThetaOver2_1 = Convert_ParameterisationType.Convert_TgtThetaOver2_1
Convert_TgtThetaOver2_2 = Convert_ParameterisationType.Convert_TgtThetaOver2_2
Convert_TgtThetaOver2_3 = Convert_ParameterisationType.Convert_TgtThetaOver2_3
Convert_TgtThetaOver2_4 = Convert_ParameterisationType.Convert_TgtThetaOver2_4
Convert_QuasiAngular = Convert_ParameterisationType.Convert_QuasiAngular
Convert_RationalC1 = Convert_ParameterisationType.Convert_RationalC1
Convert_Polynomial = Convert_ParameterisationType.Convert_Polynomial
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(Convert_SequenceOfArray1OfPoles) NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt>>;

%extend NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef void Convert_CosAndSinEvalFunction ( Standard_Real, const Standard_Integer, const TColgp_Array1OfPnt2d &, const TColStd_Array1OfReal &, const TColStd_Array1OfInteger *, Standard_Real Result [ 2 ] );
typedef NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt>> Convert_SequenceOfArray1OfPoles;
typedef TColgp_SequenceOfArray1OfPnt2d Convert_SequenceOfArray1OfPoles2d;
/* end typedefs declaration */

/***************************************************
* class Convert_CompBezierCurves2dToBSplineCurve2d *
***************************************************/
class Convert_CompBezierCurves2dToBSplineCurve2d {
	public:
		/****** Convert_CompBezierCurves2dToBSplineCurve2d::Convert_CompBezierCurves2dToBSplineCurve2d ******/
		/****** md5 signature: c4cb0ce36704d61d9beb20d5c2f63d01 ******/
		%feature("compactdefaultargs") Convert_CompBezierCurves2dToBSplineCurve2d;
		%feature("autodoc", "
Parameters
----------
AngularTolerance: float (optional, default to 1.0e-4)

Return
-------
None

Description
-----------
Constructs a framework for converting a sequence of adjacent non-rational Bezier curves into a BSpline curve. Knots will be created on the computed BSpline curve at each junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. AngularTolerance (given in radians, and defaulted to 1.0 e-4) will be used to check the parallelism of the two tangent vectors. Use the following functions: - AddCurve to define in sequence the adjacent Bezier curves to be converted, - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve.
") Convert_CompBezierCurves2dToBSplineCurve2d;
		 Convert_CompBezierCurves2dToBSplineCurve2d(const Standard_Real AngularTolerance = 1.0e-4);

		/****** Convert_CompBezierCurves2dToBSplineCurve2d::AddCurve ******/
		/****** md5 signature: 0feacd0dc6d81d7f4b85c1af937b5233 ******/
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
Adds the Bezier curve defined by the table of poles Poles, to the sequence (still contained in this framework) of adjacent Bezier curves to be converted into a BSpline curve. Only polynomial (i.e. non-rational) Bezier curves are converted using this framework. If this is not the first call to the function (i.e. if this framework still contains data in its sequence of Bezier curves), the degree of continuity of the BSpline curve will be increased at the time of computation at the first point of the added Bezier curve (i.e. the first point of the Poles table). This will be the case if the tangent vector of the curve at this point is parallel to the tangent vector at the end point of the preceding Bezier curve in the sequence of Bezier curves still contained in this framework. An angular tolerance given at the time of construction of this framework, will be used to check the parallelism of the two tangent vectors. This checking procedure, and all the relative computations will be performed by the function Perform. When the sequence of adjacent Bezier curves is complete, use the following functions: - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve. Warning The sequence of Bezier curves treated by this framework is automatically initialized with the first Bezier curve when the function is first called. During subsequent use of this function, ensure that the first point of the added Bezier curve (i.e. the first point of the Poles table) is coincident with the last point of the sequence (i.e. the last point of the preceding Bezier curve in the sequence) of Bezier curves still contained in this framework. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above, as this condition is not checked either when defining the sequence of Bezier curves or at the time of computation.
") AddCurve;
		void AddCurve(const TColgp_Array1OfPnt2d & Poles);

		/****** Convert_CompBezierCurves2dToBSplineCurve2d::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.
") Degree;
		Standard_Integer Degree();

		/****** Convert_CompBezierCurves2dToBSplineCurve2d::KnotsAndMults ******/
		/****** md5 signature: 19787aa39b0400d3a08b5785b90459e8 ******/
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Loads the Knots table with the knots and the Mults table with the corresponding multiplicities of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Knots and Mults arrays must be equal to the number of knots in the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above as these conditions are not checked, and an error may occur.
") KnotsAndMults;
		void KnotsAndMults(TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults);

		/****** Convert_CompBezierCurves2dToBSplineCurve2d::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.
") NbKnots;
		Standard_Integer NbKnots();

		/****** Convert_CompBezierCurves2dToBSplineCurve2d::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.
") NbPoles;
		Standard_Integer NbPoles();

		/****** Convert_CompBezierCurves2dToBSplineCurve2d::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes all the data needed to build a BSpline curve equivalent to the sequence of adjacent Bezier curves still contained in this framework. A knot is inserted on the computed BSpline curve at the junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. An angular tolerance given at the time of construction of this framework is used to check the parallelism of the two tangent vectors. Use the available consultation functions to access the computed data. This data may then be used to construct the BSpline curve. Warning Ensure that the curves in the sequence of Bezier curves contained in this framework are adjacent. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above as this condition is not checked, either when defining the Bezier curve sequence or at the time of computation.
") Perform;
		void Perform();

		/****** Convert_CompBezierCurves2dToBSplineCurve2d::Poles ******/
		/****** md5 signature: e0f05ca95d0265dffb43e3a1c5806664 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
Loads the Poles table with the poles of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Poles array must be equal to the number of poles of the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above, as these conditions are not checked, and an error may occur.
") Poles;
		void Poles(TColgp_Array1OfPnt2d & Poles);

};


%extend Convert_CompBezierCurves2dToBSplineCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class Convert_CompBezierCurvesToBSplineCurve *
***********************************************/
class Convert_CompBezierCurvesToBSplineCurve {
	public:
		/****** Convert_CompBezierCurvesToBSplineCurve::Convert_CompBezierCurvesToBSplineCurve ******/
		/****** md5 signature: dd8780df5cd999b8ccbcf0298accf006 ******/
		%feature("compactdefaultargs") Convert_CompBezierCurvesToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
AngularTolerance: float (optional, default to 1.0e-4)

Return
-------
None

Description
-----------
Constructs a framework for converting a sequence of adjacent non-rational Bezier curves into a BSpline curve. Knots will be created on the computed BSpline curve at each junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. AngularTolerance (given in radians, and defaulted to 1.0 e-4) will be used to check the parallelism of the two tangent vectors. Use the following functions: - AddCurve to define in sequence the adjacent Bezier curves to be converted, - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve.
") Convert_CompBezierCurvesToBSplineCurve;
		 Convert_CompBezierCurvesToBSplineCurve(const Standard_Real AngularTolerance = 1.0e-4);

		/****** Convert_CompBezierCurvesToBSplineCurve::AddCurve ******/
		/****** md5 signature: 34c9c031fdd448cd83d9d5d7c8bd0d34 ******/
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Adds the Bezier curve defined by the table of poles Poles, to the sequence (still contained in this framework) of adjacent Bezier curves to be converted into a BSpline curve. Only polynomial (i.e. non-rational) Bezier curves are converted using this framework. If this is not the first call to the function (i.e. if this framework still contains data in its Bezier curve sequence), the degree of continuity of the BSpline curve will be increased at the time of computation at the first point of the added Bezier curve (i.e. the first point of the Poles table). This will be the case if the tangent vector of the curve at this point is parallel to the tangent vector at the end point of the preceding Bezier curve in the Bezier curve sequence still contained in this framework. An angular tolerance given at the time of construction of this framework will be used to check the parallelism of the two tangent vectors. This checking procedure and all related computations will be performed by the Perform function. When the adjacent Bezier curve sequence is complete, use the following functions: - Perform to compute the data needed to build the BSpline curve, - and the available consultation functions to access the computed data. This data may be used to construct the BSpline curve. Warning The Bezier curve sequence treated by this framework is automatically initialized with the first Bezier curve when the function is first called. During subsequent use of this function, ensure that the first point of the added Bezier curve (i.e. the first point of the Poles table) is coincident with the last point of the Bezier curve sequence (i.e. the last point of the preceding Bezier curve in the sequence) still contained in this framework. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above, as this condition is not checked either when defining the Bezier curve sequence or at the time of computation.
") AddCurve;
		void AddCurve(const TColgp_Array1OfPnt & Poles);

		/****** Convert_CompBezierCurvesToBSplineCurve::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.
") Degree;
		Standard_Integer Degree();

		/****** Convert_CompBezierCurvesToBSplineCurve::KnotsAndMults ******/
		/****** md5 signature: 19787aa39b0400d3a08b5785b90459e8 ******/
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
- loads the Knots table with the knots, - and loads the Mults table with the corresponding multiplicities of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Knots and Mults arrays must be equal to the number of knots in the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above as these conditions are not checked, and an error may occur.
") KnotsAndMults;
		void KnotsAndMults(TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults);

		/****** Convert_CompBezierCurvesToBSplineCurve::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.
") NbKnots;
		Standard_Integer NbKnots();

		/****** Convert_CompBezierCurvesToBSplineCurve::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles of the BSpline curve whose data is computed in this framework. Warning Take particular care not to use this function before the computation is performed (Perform function), as this condition is not checked and an error may therefore occur.
") NbPoles;
		Standard_Integer NbPoles();

		/****** Convert_CompBezierCurvesToBSplineCurve::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes all the data needed to build a BSpline curve equivalent to the adjacent Bezier curve sequence still contained in this framework. A knot is inserted on the computed BSpline curve at the junction point of two consecutive Bezier curves. The degree of continuity of the BSpline curve will be increased at the junction point of two consecutive Bezier curves if their tangent vectors at this point are parallel. An angular tolerance given at the time of construction of this framework is used to check the parallelism of the two tangent vectors. Use the available consultation functions to access the computed data. This data may then be used to construct the BSpline curve. Warning Make sure that the curves in the Bezier curve sequence contained in this framework are adjacent. An error may occur at the time of computation if this condition is not satisfied. Particular care must be taken with respect to the above as this condition is not checked, either when defining the Bezier curve sequence or at the time of computation.
") Perform;
		void Perform();

		/****** Convert_CompBezierCurvesToBSplineCurve::Poles ******/
		/****** md5 signature: 912b8e52236ad45599d7c99cda7e4145 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Loads the Poles table with the poles of the BSpline curve whose data is computed in this framework. Warning - Do not use this function before the computation is performed (Perform function). - The length of the Poles array must be equal to the number of poles of the BSpline curve whose data is computed in this framework. Particular care must be taken with respect to the above, as these conditions are not checked, and an error may occur.
") Poles;
		void Poles(TColgp_Array1OfPnt & Poles);

};


%extend Convert_CompBezierCurvesToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Convert_CompPolynomialToPoles *
**************************************/
class Convert_CompPolynomialToPoles {
	public:
		/****** Convert_CompPolynomialToPoles::Convert_CompPolynomialToPoles ******/
		/****** md5 signature: de288f2f04c458673b45ed6fd19833fe ******/
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
NumCurves: int
Continuity: int
Dimension: int
MaxDegree: int
NumCoeffPerCurve: TColStd_HArray1OfInteger
Coefficients: TColStd_HArray1OfReal
PolynomialIntervals: TColStd_HArray2OfReal
TrueIntervals: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Warning! Continuity can be at MOST the maximum degree of the polynomial functions TrueIntervals: this is the true parameterisation for the composite curve that is: the curve has myContinuity if the nth curve is parameterized between myTrueIntervals(n) and myTrueIntervals(n+1) //! Coefficients have to be the implicit 'c form': Coefficients[Numcurves][MaxDegree+1][Dimension] //! Warning! The NumberOfCoefficient of an polynome is his degree + 1 Example: To convert the linear function f(x) = 2*x + 1 on the domaine [2,5] to BSpline with the bound [-1,1]. Arguments are: NumCurves = 1; Continuity = 1; Dimension = 1; MaxDegree = 1; NumCoeffPerCurve [1] = {2}; Coefficients[2] = {1, 2}; PolynomialIntervals[1,2] = {{2,5}} TrueIntervals[2] = {-1, 1}.
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles(const Standard_Integer NumCurves, const Standard_Integer Continuity, const Standard_Integer Dimension, const Standard_Integer MaxDegree, const opencascade::handle<TColStd_HArray1OfInteger> & NumCoeffPerCurve, const opencascade::handle<TColStd_HArray1OfReal> & Coefficients, const opencascade::handle<TColStd_HArray2OfReal> & PolynomialIntervals, const opencascade::handle<TColStd_HArray1OfReal> & TrueIntervals);

		/****** Convert_CompPolynomialToPoles::Convert_CompPolynomialToPoles ******/
		/****** md5 signature: 1b14a4df4907be7d6fdaf67362ef7c34 ******/
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
NumCurves: int
Dimension: int
MaxDegree: int
Continuity: TColStd_Array1OfInteger
NumCoeffPerCurve: TColStd_Array1OfInteger
Coefficients: TColStd_Array1OfReal
PolynomialIntervals: TColStd_Array2OfReal
TrueIntervals: TColStd_Array1OfReal

Return
-------
None

Description
-----------
To Convert several span with different order of Continuity. Warning: The Length of Continuity have to be NumCurves-1.
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles(const Standard_Integer NumCurves, const Standard_Integer Dimension, const Standard_Integer MaxDegree, const TColStd_Array1OfInteger & Continuity, const TColStd_Array1OfInteger & NumCoeffPerCurve, const TColStd_Array1OfReal & Coefficients, const TColStd_Array2OfReal & PolynomialIntervals, const TColStd_Array1OfReal & TrueIntervals);

		/****** Convert_CompPolynomialToPoles::Convert_CompPolynomialToPoles ******/
		/****** md5 signature: 0f3a42e92e00e47d2761b90c1de482fb ******/
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MaxDegree: int
Degree: int
Coefficients: TColStd_Array1OfReal
PolynomialIntervals: TColStd_Array1OfReal
TrueIntervals: TColStd_Array1OfReal

Return
-------
None

Description
-----------
To Convert only one span.
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Integer Degree, const TColStd_Array1OfReal & Coefficients, const TColStd_Array1OfReal & PolynomialIntervals, const TColStd_Array1OfReal & TrueIntervals);

		/****** Convert_CompPolynomialToPoles::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		Standard_Integer Degree();

		/****** Convert_CompPolynomialToPoles::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** Convert_CompPolynomialToPoles::Knots ******/
		/****** md5 signature: c5c37fcf0cef117abb6c7b6ce8979316 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
K: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Knots of the n-dimensional Bspline.
") Knots;
		void Knots(opencascade::handle<TColStd_HArray1OfReal> & K);

		/****** Convert_CompPolynomialToPoles::Multiplicities ******/
		/****** md5 signature: 66b76e38789dbc2d221ed6266fa78593 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "
Parameters
----------
M: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Multiplicities of the knots in the BSpline.
") Multiplicities;
		void Multiplicities(opencascade::handle<TColStd_HArray1OfInteger> & M);

		/****** Convert_CompPolynomialToPoles::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Degree of the n-dimensional Bspline.
") NbKnots;
		Standard_Integer NbKnots();

		/****** Convert_CompPolynomialToPoles::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
number of poles of the n-dimensional BSpline.
") NbPoles;
		Standard_Integer NbPoles();

		/****** Convert_CompPolynomialToPoles::Poles ******/
		/****** md5 signature: e7e979b838fd5189d931c8757f3c41a0 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
Poles: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
returns the poles of the n-dimensional BSpline in the following format: [1..NumPoles][1..Dimension].
") Poles;
		void Poles(opencascade::handle<TColStd_HArray2OfReal> & Poles);

};


%extend Convert_CompPolynomialToPoles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Convert_ConicToBSplineCurve *
************************************/
%nodefaultctor Convert_ConicToBSplineCurve;
class Convert_ConicToBSplineCurve {
	public:
		/****** Convert_ConicToBSplineCurve::BuildCosAndSin ******/
		/****** md5 signature: aac1f775057dc2da3fac7888659e735a ******/
		%feature("compactdefaultargs") BuildCosAndSin;
		%feature("autodoc", "
Parameters
----------
Parametrisation: Convert_ParameterisationType
CosNumerator: TColStd_HArray1OfReal
SinNumerator: TColStd_HArray1OfReal
Denominator: TColStd_HArray1OfReal
Knots: TColStd_HArray1OfReal
Mults: TColStd_HArray1OfInteger

Return
-------
Degree: int

Description
-----------
No available documentation.
") BuildCosAndSin;
		void BuildCosAndSin(const Convert_ParameterisationType Parametrisation, opencascade::handle<TColStd_HArray1OfReal> & CosNumerator, opencascade::handle<TColStd_HArray1OfReal> & SinNumerator, opencascade::handle<TColStd_HArray1OfReal> & Denominator, Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfReal> & Knots, opencascade::handle<TColStd_HArray1OfInteger> & Mults);

		/****** Convert_ConicToBSplineCurve::BuildCosAndSin ******/
		/****** md5 signature: 37f37faf568f45a053c3573858f6f670 ******/
		%feature("compactdefaultargs") BuildCosAndSin;
		%feature("autodoc", "
Parameters
----------
Parametrisation: Convert_ParameterisationType
UFirst: float
ULast: float
CosNumerator: TColStd_HArray1OfReal
SinNumerator: TColStd_HArray1OfReal
Denominator: TColStd_HArray1OfReal
Knots: TColStd_HArray1OfReal
Mults: TColStd_HArray1OfInteger

Return
-------
Degree: int

Description
-----------
No available documentation.
") BuildCosAndSin;
		void BuildCosAndSin(const Convert_ParameterisationType Parametrisation, const Standard_Real UFirst, const Standard_Real ULast, opencascade::handle<TColStd_HArray1OfReal> & CosNumerator, opencascade::handle<TColStd_HArray1OfReal> & SinNumerator, opencascade::handle<TColStd_HArray1OfReal> & Denominator, Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfReal> & Knots, opencascade::handle<TColStd_HArray1OfInteger> & Mults);

		/****** Convert_ConicToBSplineCurve::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the BSpline curve whose data is computed in this framework.
") Degree;
		Standard_Integer Degree();

		/****** Convert_ConicToBSplineCurve::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the BSpline curve whose data is computed in this framework is periodic.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Convert_ConicToBSplineCurve::Knot ******/
		/****** md5 signature: 87780028b98a8253068f050487c4f4d5 ******/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the knot of index Index to the knots table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table of the BSpline curve whose data is computed in this framework.
") Knot;
		Standard_Real Knot(const Standard_Integer Index);

		/****** Convert_ConicToBSplineCurve::Multiplicity ******/
		/****** md5 signature: 0b00002ea9c75b6fa0f22b159f127931 ******/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
Returns the multiplicity of the knot of index Index to the knots table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table of the BSpline curve whose data is computed in this framework.
") Multiplicity;
		Standard_Integer Multiplicity(const Standard_Integer Index);

		/****** Convert_ConicToBSplineCurve::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots of the BSpline curve whose data is computed in this framework.
") NbKnots;
		Standard_Integer NbKnots();

		/****** Convert_ConicToBSplineCurve::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles of the BSpline curve whose data is computed in this framework.
") NbPoles;
		Standard_Integer NbPoles();

		/****** Convert_ConicToBSplineCurve::Pole ******/
		/****** md5 signature: e0902cc9b257d7d33c4c27e0ed977e8a ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the pole of index Index to the poles table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table of the BSpline curve whose data is computed in this framework.
") Pole;
		gp_Pnt2d Pole(const Standard_Integer Index);

		/****** Convert_ConicToBSplineCurve::Weight ******/
		/****** md5 signature: 70cf193bf7498ec22102a906ea9db6f5 ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the weight of the pole of index Index to the poles table of the BSpline curve whose data is computed in this framework. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table of the BSpline curve whose data is computed in this framework.
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

};


%extend Convert_ConicToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class Convert_ElementarySurfaceToBSplineSurface *
**************************************************/
%nodefaultctor Convert_ElementarySurfaceToBSplineSurface;
class Convert_ElementarySurfaceToBSplineSurface {
	public:
		/****** Convert_ElementarySurfaceToBSplineSurface::IsUPeriodic ******/
		/****** md5 signature: 3115f09325238f13df1a22947495381e ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Convert_ElementarySurfaceToBSplineSurface::IsVPeriodic ******/
		/****** md5 signature: 1c89d32f35a2ad1870438aec5474569f ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the BSpline surface whose data is computed in this framework is periodic in the u or v parametric direction.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbUKnots ******/
		/****** md5 signature: dad62b27d386c8d79ed8a3faddece815 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		Standard_Integer NbUKnots();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbUPoles ******/
		/****** md5 signature: fb7c625af5aeee8be8cffdd28f1b08d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbVKnots ******/
		/****** md5 signature: c5483500ef062c3949009d9a2ec75b29 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots for the u or v parametric direction of the BSpline surface whose data is computed in this framework .
") NbVKnots;
		Standard_Integer NbVKnots();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbVPoles ******/
		/****** md5 signature: 098754ae7893287e442d0a3c48b39cf0 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles for the u or v parametric direction of the BSpline surface whose data is computed in this framework.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** Convert_ElementarySurfaceToBSplineSurface::Pole ******/
		/****** md5 signature: 6573a55d7077cd8547a0b702bb3396eb ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns the pole of index (UIndex,VIndex) to the poles table of the BSpline surface whose data is computed in this framework. Exceptions Standard_OutOfRange if, for the BSpline surface whose data is computed in this framework: - UIndex is outside the bounds of the poles table in the u parametric direction, or - VIndex is outside the bounds of the poles table in the v parametric direction.
") Pole;
		gp_Pnt Pole(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** Convert_ElementarySurfaceToBSplineSurface::UKnot ******/
		/****** md5 signature: ea5353985fdf78f530adfdba4dac6b0b ******/
		%feature("compactdefaultargs") UKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
float

Description
-----------
Returns the U-knot of range UIndex. Raised if UIndex < 1 or UIndex > NbUKnots.
") UKnot;
		Standard_Real UKnot(const Standard_Integer UIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::UMultiplicity ******/
		/****** md5 signature: dad23f162889ff220e8176306861eaa1 ******/
		%feature("compactdefaultargs") UMultiplicity;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
int

Description
-----------
Returns the multiplicity of the U-knot of range UIndex. Raised if UIndex < 1 or UIndex > NbUKnots.
") UMultiplicity;
		Standard_Integer UMultiplicity(const Standard_Integer UIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree for the u or v parametric direction of the BSpline surface whose data is computed in this framework.
") VDegree;
		Standard_Integer VDegree();

		/****** Convert_ElementarySurfaceToBSplineSurface::VKnot ******/
		/****** md5 signature: 4d13bae76c1f4c639082e46dad241e7d ******/
		%feature("compactdefaultargs") VKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
float

Description
-----------
Returns the V-knot of range VIndex. Raised if VIndex < 1 or VIndex > NbVKnots.
") VKnot;
		Standard_Real VKnot(const Standard_Integer UIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::VMultiplicity ******/
		/****** md5 signature: d21b3a277f002a7f3b2fcadb35374bc1 ******/
		%feature("compactdefaultargs") VMultiplicity;
		%feature("autodoc", "
Parameters
----------
VIndex: int

Return
-------
int

Description
-----------
Returns the multiplicity of the V-knot of range VIndex. Raised if VIndex < 1 or VIndex > NbVKnots.
") VMultiplicity;
		Standard_Integer VMultiplicity(const Standard_Integer VIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::Weight ******/
		/****** md5 signature: 3f3d90bfc32174f677371ed3017fc02e ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
float

Description
-----------
Returns the weight of the pole of index (UIndex,VIndex) to the poles table of the BSpline surface whose data is computed in this framework. Exceptions Standard_OutOfRange if, for the BSpline surface whose data is computed in this framework: - UIndex is outside the bounds of the poles table in the u parametric direction, or - VIndex is outside the bounds of the poles table in the v parametric direction.
") Weight;
		Standard_Real Weight(const Standard_Integer UIndex, const Standard_Integer VIndex);

};


%extend Convert_ElementarySurfaceToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Convert_GridPolynomialToPoles *
**************************************/
class Convert_GridPolynomialToPoles {
	public:
		/****** Convert_GridPolynomialToPoles::Convert_GridPolynomialToPoles ******/
		/****** md5 signature: 5e19d6f7859f6437990e41ac8561873f ******/
		%feature("compactdefaultargs") Convert_GridPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
MaxUDegree: int
MaxVDegree: int
NumCoeff: TColStd_HArray1OfInteger
Coefficients: TColStd_HArray1OfReal
PolynomialUIntervals: TColStd_HArray1OfReal
PolynomialVIntervals: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
To only one polynomial Surface. The Length of <PolynomialUIntervals> and <PolynomialVIntervals> have to be 2. This values defined the parametric domain of the Polynomial Equation. //! Coefficients: The <Coefficients> have to be formatted than an 'C array' [MaxUDegree+1] [MaxVDegree+1] [3].
") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles(const Standard_Integer MaxUDegree, const Standard_Integer MaxVDegree, const opencascade::handle<TColStd_HArray1OfInteger> & NumCoeff, const opencascade::handle<TColStd_HArray1OfReal> & Coefficients, const opencascade::handle<TColStd_HArray1OfReal> & PolynomialUIntervals, const opencascade::handle<TColStd_HArray1OfReal> & PolynomialVIntervals);

		/****** Convert_GridPolynomialToPoles::Convert_GridPolynomialToPoles ******/
		/****** md5 signature: 51ca2d3289a0e8c21e7e42881ac480e0 ******/
		%feature("compactdefaultargs") Convert_GridPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
NbUSurfaces: int
NBVSurfaces: int
UContinuity: int
VContinuity: int
MaxUDegree: int
MaxVDegree: int
NumCoeffPerSurface: TColStd_HArray2OfInteger
Coefficients: TColStd_HArray1OfReal
PolynomialUIntervals: TColStd_HArray1OfReal
PolynomialVIntervals: TColStd_HArray1OfReal
TrueUIntervals: TColStd_HArray1OfReal
TrueVIntervals: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
To one grid of polynomial Surface. Warning! Continuity in each parametric direction can be at MOST the maximum degree of the polynomial functions. //! <TrueUIntervals>, <TrueVIntervals>: this is the true parameterisation for the composite surface //! Coefficients: The Coefficients have to be formatted than an 'C array' [NbVSurfaces] [NBUSurfaces] [MaxUDegree+1] [MaxVDegree+1] [3] raises DomainError if <NumCoeffPerSurface> is not a [1, NbVSurfaces*NbUSurfaces, 1,2] array. if <Coefficients> is not a.
") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles(const Standard_Integer NbUSurfaces, const Standard_Integer NBVSurfaces, const Standard_Integer UContinuity, const Standard_Integer VContinuity, const Standard_Integer MaxUDegree, const Standard_Integer MaxVDegree, const opencascade::handle<TColStd_HArray2OfInteger> & NumCoeffPerSurface, const opencascade::handle<TColStd_HArray1OfReal> & Coefficients, const opencascade::handle<TColStd_HArray1OfReal> & PolynomialUIntervals, const opencascade::handle<TColStd_HArray1OfReal> & PolynomialVIntervals, const opencascade::handle<TColStd_HArray1OfReal> & TrueUIntervals, const opencascade::handle<TColStd_HArray1OfReal> & TrueVIntervals);

		/****** Convert_GridPolynomialToPoles::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** Convert_GridPolynomialToPoles::NbUKnots ******/
		/****** md5 signature: dad62b27d386c8d79ed8a3faddece815 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		Standard_Integer NbUKnots();

		/****** Convert_GridPolynomialToPoles::NbUPoles ******/
		/****** md5 signature: fb7c625af5aeee8be8cffdd28f1b08d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** Convert_GridPolynomialToPoles::NbVKnots ******/
		/****** md5 signature: c5483500ef062c3949009d9a2ec75b29 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		Standard_Integer NbVKnots();

		/****** Convert_GridPolynomialToPoles::NbVPoles ******/
		/****** md5 signature: 098754ae7893287e442d0a3c48b39cf0 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** Convert_GridPolynomialToPoles::Perform ******/
		/****** md5 signature: 0d0e95444a993fbb95629a0bb85d48a8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
UContinuity: int
VContinuity: int
MaxUDegree: int
MaxVDegree: int
NumCoeffPerSurface: TColStd_HArray2OfInteger
Coefficients: TColStd_HArray1OfReal
PolynomialUIntervals: TColStd_HArray1OfReal
PolynomialVIntervals: TColStd_HArray1OfReal
TrueUIntervals: TColStd_HArray1OfReal
TrueVIntervals: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Integer UContinuity, const Standard_Integer VContinuity, const Standard_Integer MaxUDegree, const Standard_Integer MaxVDegree, const opencascade::handle<TColStd_HArray2OfInteger> & NumCoeffPerSurface, const opencascade::handle<TColStd_HArray1OfReal> & Coefficients, const opencascade::handle<TColStd_HArray1OfReal> & PolynomialUIntervals, const opencascade::handle<TColStd_HArray1OfReal> & PolynomialVIntervals, const opencascade::handle<TColStd_HArray1OfReal> & TrueUIntervals, const opencascade::handle<TColStd_HArray1OfReal> & TrueVIntervals);

		/****** Convert_GridPolynomialToPoles::Poles ******/
		/****** md5 signature: 4e616536627e10a4a11def3d5743d611 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray2OfPnt>

Description
-----------
returns the poles of the BSpline Surface.
") Poles;
		const opencascade::handle<TColgp_HArray2OfPnt> & Poles();

		/****** Convert_GridPolynomialToPoles::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** Convert_GridPolynomialToPoles::UKnots ******/
		/****** md5 signature: e4c765c1a34f73676b6a0f23e63a42f7 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Knots in the U direction.
") UKnots;
		const opencascade::handle<TColStd_HArray1OfReal> & UKnots();

		/****** Convert_GridPolynomialToPoles::UMultiplicities ******/
		/****** md5 signature: dd6df83c242f8c2d61f6fb2cc00d6d9a ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Multiplicities of the knots in the U direction.
") UMultiplicities;
		const opencascade::handle<TColStd_HArray1OfInteger> & UMultiplicities();

		/****** Convert_GridPolynomialToPoles::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		Standard_Integer VDegree();

		/****** Convert_GridPolynomialToPoles::VKnots ******/
		/****** md5 signature: 56d691f001e3cbff620cca50aeeea333 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Knots in the V direction.
") VKnots;
		const opencascade::handle<TColStd_HArray1OfReal> & VKnots();

		/****** Convert_GridPolynomialToPoles::VMultiplicities ******/
		/****** md5 signature: 36fc4847dd11076b629833ec28b74b5a ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Multiplicities of the knots in the V direction.
") VMultiplicities;
		const opencascade::handle<TColStd_HArray1OfInteger> & VMultiplicities();

};


%extend Convert_GridPolynomialToPoles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Convert_CircleToBSplineCurve *
*************************************/
class Convert_CircleToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		/****** Convert_CircleToBSplineCurve::Convert_CircleToBSplineCurve ******/
		/****** md5 signature: 1e97bd4399c8fac8360cc6f278f56d58 ******/
		%feature("compactdefaultargs") Convert_CircleToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
The equivalent B-spline curve has the same orientation as the circle C.
") Convert_CircleToBSplineCurve;
		 Convert_CircleToBSplineCurve(const gp_Circ2d & C, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** Convert_CircleToBSplineCurve::Convert_CircleToBSplineCurve ******/
		/****** md5 signature: e91e4e93afdc662004fe2d142e748a55 ******/
		%feature("compactdefaultargs") Convert_CircleToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
U1: float
U2: float
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
The circle C is limited between the parametric values U1, U2 in radians. U1 and U2 [0.0, 2*Pi] . The equivalent B-spline curve is oriented from U1 to U2 and has the same orientation as the circle C. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi.
") Convert_CircleToBSplineCurve;
		 Convert_CircleToBSplineCurve(const gp_Circ2d & C, const Standard_Real U1, const Standard_Real U2, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

};


%extend Convert_CircleToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Convert_ConeToBSplineSurface *
*************************************/
class Convert_ConeToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		/****** Convert_ConeToBSplineSurface::Convert_ConeToBSplineSurface ******/
		/****** md5 signature: 628910965d1881fda009c3a9e158145f ******/
		%feature("compactdefaultargs") Convert_ConeToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
U1: float
U2: float
V1: float
V2: float

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the Cone in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.
") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface(const gp_Cone & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****** Convert_ConeToBSplineSurface::Convert_ConeToBSplineSurface ******/
		/****** md5 signature: 79e4e6f2d39208d83752f73cd28a02df ******/
		%feature("compactdefaultargs") Convert_ConeToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
V1: float
V2: float

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the Cone in the U and V parametric directions. //! Raised if V1 = V2.
") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface(const gp_Cone & C, const Standard_Real V1, const Standard_Real V2);

};


%extend Convert_ConeToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Convert_CylinderToBSplineSurface *
*****************************************/
class Convert_CylinderToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		/****** Convert_CylinderToBSplineSurface::Convert_CylinderToBSplineSurface ******/
		/****** md5 signature: d2051a6454cc4de8531a03ee12f0eece ******/
		%feature("compactdefaultargs") Convert_CylinderToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
U1: float
U2: float
V1: float
V2: float

Return
-------
None

Description
-----------
The equivalent B-splineSurface as the same orientation as the cylinder in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.
") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface(const gp_Cylinder & Cyl, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****** Convert_CylinderToBSplineSurface::Convert_CylinderToBSplineSurface ******/
		/****** md5 signature: 611c8c81889e027674efa7f4f5043198 ******/
		%feature("compactdefaultargs") Convert_CylinderToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
V1: float
V2: float

Return
-------
None

Description
-----------
The equivalent B-splineSurface as the same orientation as the cylinder in the U and V parametric directions. //! Raised if V1 = V2.
") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface(const gp_Cylinder & Cyl, const Standard_Real V1, const Standard_Real V2);

};


%extend Convert_CylinderToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Convert_EllipseToBSplineCurve *
**************************************/
class Convert_EllipseToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		/****** Convert_EllipseToBSplineCurve::Convert_EllipseToBSplineCurve ******/
		/****** md5 signature: 9c542704f67a7fac8fcc89dbccd7a3bd ******/
		%feature("compactdefaultargs") Convert_EllipseToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
The equivalent B-spline curve has the same orientation as the ellipse E.
") Convert_EllipseToBSplineCurve;
		 Convert_EllipseToBSplineCurve(const gp_Elips2d & E, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****** Convert_EllipseToBSplineCurve::Convert_EllipseToBSplineCurve ******/
		/****** md5 signature: b92f7f2b44aff0d80c4670fd74987a31 ******/
		%feature("compactdefaultargs") Convert_EllipseToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
U1: float
U2: float
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
The ellipse E is limited between the parametric values U1, U2. The equivalent B-spline curve is oriented from U1 to U2 and has the same orientation as E. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi.
") Convert_EllipseToBSplineCurve;
		 Convert_EllipseToBSplineCurve(const gp_Elips2d & E, const Standard_Real U1, const Standard_Real U2, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

};


%extend Convert_EllipseToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class Convert_HyperbolaToBSplineCurve *
****************************************/
class Convert_HyperbolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		/****** Convert_HyperbolaToBSplineCurve::Convert_HyperbolaToBSplineCurve ******/
		/****** md5 signature: a968a5d2b5ca09e2e267d214e9c95428 ******/
		%feature("compactdefaultargs") Convert_HyperbolaToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
U1: float
U2: float

Return
-------
None

Description
-----------
The hyperbola H is limited between the parametric values U1, U2 and the equivalent B-spline curve has the same orientation as the hyperbola.
") Convert_HyperbolaToBSplineCurve;
		 Convert_HyperbolaToBSplineCurve(const gp_Hypr2d & H, const Standard_Real U1, const Standard_Real U2);

};


%extend Convert_HyperbolaToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Convert_ParabolaToBSplineCurve *
***************************************/
class Convert_ParabolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		/****** Convert_ParabolaToBSplineCurve::Convert_ParabolaToBSplineCurve ******/
		/****** md5 signature: 9b7db99737c85ce6fb0bba3c6d8790cc ******/
		%feature("compactdefaultargs") Convert_ParabolaToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
U1: float
U2: float

Return
-------
None

Description
-----------
The parabola Prb is limited between the parametric values U1, U2 and the equivalent B-spline curve as the same orientation as the parabola Prb.
") Convert_ParabolaToBSplineCurve;
		 Convert_ParabolaToBSplineCurve(const gp_Parab2d & Prb, const Standard_Real U1, const Standard_Real U2);

};


%extend Convert_ParabolaToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Convert_SphereToBSplineSurface *
***************************************/
class Convert_SphereToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		/****** Convert_SphereToBSplineSurface::Convert_SphereToBSplineSurface ******/
		/****** md5 signature: 2fc090f20fd08c42cdb17c6556154e61 ******/
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
U1: float
U2: float
V1: float
V2: float

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface(const gp_Sphere & Sph, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****** Convert_SphereToBSplineSurface::Convert_SphereToBSplineSurface ******/
		/****** md5 signature: ae7e60cab30de1fcabe19b199968346e ******/
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Param1: float
Param2: float
UTrim: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions. //! Raised if UTrim = True and Param1 = Param2 or Param1 = Param2 + 2.0 * Pi Raised if UTrim = False and Param1 = Param2.
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface(const gp_Sphere & Sph, const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim = Standard_True);

		/****** Convert_SphereToBSplineSurface::Convert_SphereToBSplineSurface ******/
		/****** md5 signature: b811c1ff160c29e5d3c8c9ae1cadb216 ******/
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions.
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface(const gp_Sphere & Sph);

};


%extend Convert_SphereToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Convert_TorusToBSplineSurface *
**************************************/
class Convert_TorusToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		/****** Convert_TorusToBSplineSurface::Convert_TorusToBSplineSurface ******/
		/****** md5 signature: 5a383bfb4e718af6b8f56e424593d26f ******/
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus
U1: float
U2: float
V1: float
V2: float

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2 or V1 = V2 + 2.0 * Pi.
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface(const gp_Torus & T, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****** Convert_TorusToBSplineSurface::Convert_TorusToBSplineSurface ******/
		/****** md5 signature: ba4763404d74aa517f9c00b9ecdbadf9 ******/
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus
Param1: float
Param2: float
UTrim: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions. //! Raised if Param1 = Param2 or Param1 = Param2 + 2.0 * Pi.
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface(const gp_Torus & T, const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim = Standard_True);

		/****** Convert_TorusToBSplineSurface::Convert_TorusToBSplineSurface ******/
		/****** md5 signature: 2d9b33e6b26b0c16a9b3b6bd957b94eb ******/
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions.
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface(const gp_Torus & T);

};


%extend Convert_TorusToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
Convert_SequenceOfArray1OfPoles2d=OCC.Core.TColgp.TColgp_SequenceOfArray1OfPnt2d
}
