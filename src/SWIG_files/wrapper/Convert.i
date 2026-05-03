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
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
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
%template(Convert_SequenceOfArray1OfPoles2d) NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt2d>>;

%extend NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt2d>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt>> Convert_SequenceOfArray1OfPoles;
typedef NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt2d>> Convert_SequenceOfArray1OfPoles2d;
/* end typedefs declaration */

/***************************************************
* class Convert_CompBezierCurvesToBSplineCurveBase *
***************************************************/
/**************************************
* class Convert_CompPolynomialToPoles *
**************************************/
class Convert_CompPolynomialToPoles {
	public:
		/****** Convert_CompPolynomialToPoles::Convert_CompPolynomialToPoles ******/
		/****** md5 signature: 0a09a81ba8f5208b574c4d0b2d7dfa5b ******/
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
NumCurves: int
Continuity: int
Dimension: int
MaxDegree: int
NumCoeffPerCurve: NCollection_HArray1<int
Coefficients: NCollection_HArray1<double
PolynomialIntervals: NCollection_HArray2<double
TrueIntervals: NCollection_HArray1<double

Return
-------
None

Description
-----------
Warning! Continuity can be at MOST the maximum degree of the polynomial functions TrueIntervals: this is the true parameterisation for the composite curve that is: the curve has myContinuity if the nth curve is parameterized between myTrueIntervals(n) and myTrueIntervals(n+1) //! Coefficients have to be the implicit 'c form': Coefficients[Numcurves][MaxDegree+1][Dimension] //! Warning! The NumberOfCoefficient of an polynome is his degree + 1 Example: To convert the linear function f(x) = 2*x + 1 on the domaine [2,5] to BSpline with the bound [-1,1]. Arguments are: NumCurves = 1; Continuity = 1; Dimension = 1; MaxDegree = 1; NumCoeffPerCurve [1] = {2}; Coefficients[2] = {1, 2}; PolynomialIntervals[1,2] = {{2,5}} TrueIntervals[2] = {-1, 1}.
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles(const int NumCurves, const int Continuity, const int Dimension, const int MaxDegree, const opencascade::handle<NCollection_HArray1<int> > & NumCoeffPerCurve, const opencascade::handle<NCollection_HArray1<double> > & Coefficients, const opencascade::handle<NCollection_HArray2<double> > & PolynomialIntervals, const opencascade::handle<NCollection_HArray1<double> > & TrueIntervals);

		/****** Convert_CompPolynomialToPoles::Convert_CompPolynomialToPoles ******/
		/****** md5 signature: f301b4a6e8d022445164f4279d43cf0d ******/
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
NumCurves: int
Dimension: int
MaxDegree: int
Continuity: NCollection_Array1<int>
NumCoeffPerCurve: NCollection_Array1<int>
Coefficients: NCollection_Array1<double>
PolynomialIntervals: NCollection_Array2<double>
TrueIntervals: NCollection_Array1<double>

Return
-------
None

Description
-----------
To Convert several span with different order of Continuity. Warning: The Length of Continuity have to be NumCurves-1.
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles(const int NumCurves, const int Dimension, const int MaxDegree, const NCollection_Array1<int> & Continuity, const NCollection_Array1<int> & NumCoeffPerCurve, const NCollection_Array1<double> & Coefficients, const NCollection_Array2<double> & PolynomialIntervals, const NCollection_Array1<double> & TrueIntervals);

		/****** Convert_CompPolynomialToPoles::Convert_CompPolynomialToPoles ******/
		/****** md5 signature: 57b6b24dbf3ea7dd5957e59bc478c01c ******/
		%feature("compactdefaultargs") Convert_CompPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MaxDegree: int
Degree: int
Coefficients: NCollection_Array1<double>
PolynomialIntervals: NCollection_Array1<double>
TrueIntervals: NCollection_Array1<double>

Return
-------
None

Description
-----------
To Convert only one span.
") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles(const int Dimension, const int MaxDegree, const int Degree, const NCollection_Array1<double> & Coefficients, const NCollection_Array1<double> & PolynomialIntervals, const NCollection_Array1<double> & TrueIntervals);

		/****** Convert_CompPolynomialToPoles::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the n-dimensional BSpline.
") Degree;
		int Degree();

		/****** Convert_CompPolynomialToPoles::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the conversion was successful.
") IsDone;
		bool IsDone();

		/****** Convert_CompPolynomialToPoles::Knots ******/
		/****** md5 signature: 40e5d7863b64333908f7ebce7f29fffe ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
Returns the knots of the n-dimensional BSpline.
") Knots;
		const NCollection_Array1<double> & Knots();

		/****** Convert_CompPolynomialToPoles::Knots ******/
		/****** md5 signature: 378ed3f75f0cf624594cb5dfaaf354f8 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
theKnots: NCollection_HArray1<double

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(opencascade::handle<NCollection_HArray1<double> > & theKnots);

		/****** Convert_CompPolynomialToPoles::Multiplicities ******/
		/****** md5 signature: abbd7cb742db6e8534100ea895e298c9 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
Returns the multiplicities of the knots in the BSpline.
") Multiplicities;
		const NCollection_Array1<int> & Multiplicities();

		/****** Convert_CompPolynomialToPoles::Multiplicities ******/
		/****** md5 signature: 95242acc5d0b3d2767cba661962c9651 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "
Parameters
----------
theMults: NCollection_HArray1<int

Return
-------
None

Description
-----------
No available documentation.
") Multiplicities;
		void Multiplicities(opencascade::handle<NCollection_HArray1<int> > & theMults);

		/****** Convert_CompPolynomialToPoles::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots of the n-dimensional BSpline.
") NbKnots;
		int NbKnots();

		/****** Convert_CompPolynomialToPoles::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles of the n-dimensional BSpline.
") NbPoles;
		int NbPoles();

		/****** Convert_CompPolynomialToPoles::Poles ******/
		/****** md5 signature: 1f17048a14e21e75f8e40b07f53ad40e ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
NCollection_Array2<double>

Description
-----------
Returns the poles of the n-dimensional BSpline in the following format: [1..NumPoles][1..Dimension].
") Poles;
		const NCollection_Array2<double> & Poles();

		/****** Convert_CompPolynomialToPoles::Poles ******/
		/****** md5 signature: d50ce4a256dd38d7819abda041d6d185 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
thePoles: NCollection_HArray2<double

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		void Poles(opencascade::handle<NCollection_HArray2<double> > & thePoles);

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
		/****** md5 signature: d0fcf50aec70e94f91061dada599a233 ******/
		%feature("compactdefaultargs") BuildCosAndSin;
		%feature("autodoc", "
Parameters
----------
theParametrisation: Convert_ParameterisationType
theCosNumerator: NCollection_HArray1<double
theSinNumerator: NCollection_HArray1<double
theDenominator: NCollection_HArray1<double
theKnots: NCollection_HArray1<double
theMults: NCollection_HArray1<int

Return
-------
theDegree: int

Description
-----------
No available documentation.
") BuildCosAndSin;
		void BuildCosAndSin(const Convert_ParameterisationType theParametrisation, opencascade::handle<NCollection_HArray1<double> > & theCosNumerator, opencascade::handle<NCollection_HArray1<double> > & theSinNumerator, opencascade::handle<NCollection_HArray1<double> > & theDenominator, Standard_Integer &OutValue, opencascade::handle<NCollection_HArray1<double> > & theKnots, opencascade::handle<NCollection_HArray1<int> > & theMults);

		/****** Convert_ConicToBSplineCurve::BuildCosAndSin ******/
		/****** md5 signature: 2cd39a5dd3b4cccad7fc749de77ba968 ******/
		%feature("compactdefaultargs") BuildCosAndSin;
		%feature("autodoc", "
Parameters
----------
theParametrisation: Convert_ParameterisationType
theUFirst: double
theULast: double
theCosNumerator: NCollection_HArray1<double
theSinNumerator: NCollection_HArray1<double
theDenominator: NCollection_HArray1<double
theKnots: NCollection_HArray1<double
theMults: NCollection_HArray1<int

Return
-------
theDegree: int

Description
-----------
No available documentation.
") BuildCosAndSin;
		void BuildCosAndSin(const Convert_ParameterisationType theParametrisation, const double theUFirst, const double theULast, opencascade::handle<NCollection_HArray1<double> > & theCosNumerator, opencascade::handle<NCollection_HArray1<double> > & theSinNumerator, opencascade::handle<NCollection_HArray1<double> > & theDenominator, Standard_Integer &OutValue, opencascade::handle<NCollection_HArray1<double> > & theKnots, opencascade::handle<NCollection_HArray1<int> > & theMults);

		/****** Convert_ConicToBSplineCurve::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the BSpline curve whose data is computed in this framework.
") Degree;
		int Degree();

		/****** Convert_ConicToBSplineCurve::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the BSpline curve whose data is computed in this framework is periodic.
") IsPeriodic;
		bool IsPeriodic();

		/****** Convert_ConicToBSplineCurve::Knot ******/
		/****** md5 signature: 281ef90c37471f9462a125477daed37d ******/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
No available documentation.
") Knot;
		double Knot(const int theIndex);

		/****** Convert_ConicToBSplineCurve::Knots ******/
		/****** md5 signature: 40e5d7863b64333908f7ebce7f29fffe ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
Returns the knots of the BSpline curve.
") Knots;
		const NCollection_Array1<double> & Knots();

		/****** Convert_ConicToBSplineCurve::Multiplicities ******/
		/****** md5 signature: abbd7cb742db6e8534100ea895e298c9 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
Returns the multiplicities of the BSpline curve.
") Multiplicities;
		const NCollection_Array1<int> & Multiplicities();

		/****** Convert_ConicToBSplineCurve::Multiplicity ******/
		/****** md5 signature: 0da8c91e0049068a2a6fa429a9347c8b ******/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
No available documentation.
") Multiplicity;
		int Multiplicity(const int theIndex);

		/****** Convert_ConicToBSplineCurve::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots of the BSpline curve whose data is computed in this framework.
") NbKnots;
		int NbKnots();

		/****** Convert_ConicToBSplineCurve::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles of the BSpline curve whose data is computed in this framework.
") NbPoles;
		int NbPoles();

		/****** Convert_ConicToBSplineCurve::Pole ******/
		/****** md5 signature: 10a6412b6e9b04b086c222a6bee68202 ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Pole;
		gp_Pnt2d Pole(const int theIndex);

		/****** Convert_ConicToBSplineCurve::Poles ******/
		/****** md5 signature: 8afae95fa5301d98d2ab229e2b82ae7d ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
NCollection_Array1<gp_Pnt2d>

Description
-----------
Returns the poles of the BSpline curve.
") Poles;
		const NCollection_Array1<gp_Pnt2d> Poles();

		/****** Convert_ConicToBSplineCurve::Weight ******/
		/****** md5 signature: ccfa24ffddf0f5f72a33299a562e240e ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
No available documentation.
") Weight;
		double Weight(const int theIndex);

		/****** Convert_ConicToBSplineCurve::Weights ******/
		/****** md5 signature: 75fed9e302ad46e4cac4d74daae13ea5 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
Returns the weights of the BSpline curve.
") Weights;
		const NCollection_Array1<double> & Weights();

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
		/****** md5 signature: d278b07fad43db30084c681d056c49cc ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface is periodic in the U parametric direction.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** Convert_ElementarySurfaceToBSplineSurface::IsVPeriodic ******/
		/****** md5 signature: 1bef4645da712e835a18d12bef76f573 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface is periodic in the V parametric direction.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbUKnots ******/
		/****** md5 signature: 790406b6b06efba57c5111fd80daea5d ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the U parametric direction.
") NbUKnots;
		int NbUKnots();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbUPoles ******/
		/****** md5 signature: ecab3cbbaf18559e002fccdfa81aa0d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the U parametric direction.
") NbUPoles;
		int NbUPoles();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbVKnots ******/
		/****** md5 signature: b077d9245cbc08be7809ba04ff1e0c69 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the V parametric direction.
") NbVKnots;
		int NbVKnots();

		/****** Convert_ElementarySurfaceToBSplineSurface::NbVPoles ******/
		/****** md5 signature: fd4ae03f2a37db0cb241bb2f458a15bb ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the V parametric direction.
") NbVPoles;
		int NbVPoles();

		/****** Convert_ElementarySurfaceToBSplineSurface::Pole ******/
		/****** md5 signature: af1e439afcec9c69b6df9b4ae0510eb8 ******/
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
No available documentation.
") Pole;
		gp_Pnt Pole(const int UIndex, const int VIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::Poles ******/
		/****** md5 signature: 14016e5d40bac5fa096e746e935d87cd ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
NCollection_Array2<gp_Pnt>

Description
-----------
Returns the poles of the BSpline surface.
") Poles;
		const NCollection_Array2<gp_Pnt> Poles();

		/****** Convert_ElementarySurfaceToBSplineSurface::UDegree ******/
		/****** md5 signature: 82316803b09fa91a345f15577c8b3c82 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree in the U parametric direction.
") UDegree;
		int UDegree();

		/****** Convert_ElementarySurfaceToBSplineSurface::UKnot ******/
		/****** md5 signature: 433ebc61c3e83e25f4005a3ddcae8671 ******/
		%feature("compactdefaultargs") UKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
double

Description
-----------
No available documentation.
") UKnot;
		double UKnot(const int UIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::UKnots ******/
		/****** md5 signature: 6ecfa59fde3ec7a93d4fab6d03e9d808 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
Returns the U-knots of the BSpline surface.
") UKnots;
		const NCollection_Array1<double> & UKnots();

		/****** Convert_ElementarySurfaceToBSplineSurface::UMultiplicities ******/
		/****** md5 signature: f91dc895c87c8659e5d59a6c9ef08414 ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
Returns the U-multiplicities of the BSpline surface.
") UMultiplicities;
		const NCollection_Array1<int> & UMultiplicities();

		/****** Convert_ElementarySurfaceToBSplineSurface::UMultiplicity ******/
		/****** md5 signature: 1fecbf807fed760eda3f998c7edb022f ******/
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
No available documentation.
") UMultiplicity;
		int UMultiplicity(const int UIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::VDegree ******/
		/****** md5 signature: 10a01c94db483e5b8afe43596e767a03 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree in the V parametric direction.
") VDegree;
		int VDegree();

		/****** Convert_ElementarySurfaceToBSplineSurface::VKnot ******/
		/****** md5 signature: 7a34fd18cd37b135f5e7e2ad1721f5f3 ******/
		%feature("compactdefaultargs") VKnot;
		%feature("autodoc", "
Parameters
----------
VIndex: int

Return
-------
double

Description
-----------
No available documentation.
") VKnot;
		double VKnot(const int VIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::VKnots ******/
		/****** md5 signature: 6c058920a211da67a7dff7af61adb682 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
Returns the V-knots of the BSpline surface.
") VKnots;
		const NCollection_Array1<double> & VKnots();

		/****** Convert_ElementarySurfaceToBSplineSurface::VMultiplicities ******/
		/****** md5 signature: f3771e3659943e959f4851e67f385973 ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
Returns the V-multiplicities of the BSpline surface.
") VMultiplicities;
		const NCollection_Array1<int> & VMultiplicities();

		/****** Convert_ElementarySurfaceToBSplineSurface::VMultiplicity ******/
		/****** md5 signature: ff1ff8db7d362092f1741bc8fc99fee6 ******/
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
No available documentation.
") VMultiplicity;
		int VMultiplicity(const int VIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::Weight ******/
		/****** md5 signature: f9d2ad63ef5103b3682048034554eb8b ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
double

Description
-----------
No available documentation.
") Weight;
		double Weight(const int UIndex, const int VIndex);

		/****** Convert_ElementarySurfaceToBSplineSurface::Weights ******/
		/****** md5 signature: 7f881df6c273a11e54472a6e9569e510 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
NCollection_Array2<double>

Description
-----------
Returns the weights of the BSpline surface.
") Weights;
		const NCollection_Array2<double> & Weights();

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
		/****** md5 signature: caf0cfa30897676f20bfeeadf0ccfce3 ******/
		%feature("compactdefaultargs") Convert_GridPolynomialToPoles;
		%feature("autodoc", "
Parameters
----------
MaxUDegree: int
MaxVDegree: int
NumCoeff: NCollection_HArray1<int
Coefficients: NCollection_HArray1<double
PolynomialUIntervals: NCollection_HArray1<double
PolynomialVIntervals: NCollection_HArray1<double

Return
-------
None

Description
-----------
To only one polynomial Surface. The Length of <PolynomialUIntervals> and <PolynomialVIntervals> have to be 2. This values defined the parametric domain of the Polynomial Equation. //! Coefficients: The <Coefficients> have to be formatted than an 'C array' [MaxUDegree+1] [MaxVDegree+1] [3].
") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles(const int MaxUDegree, const int MaxVDegree, const opencascade::handle<NCollection_HArray1<int> > & NumCoeff, const opencascade::handle<NCollection_HArray1<double> > & Coefficients, const opencascade::handle<NCollection_HArray1<double> > & PolynomialUIntervals, const opencascade::handle<NCollection_HArray1<double> > & PolynomialVIntervals);

		/****** Convert_GridPolynomialToPoles::Convert_GridPolynomialToPoles ******/
		/****** md5 signature: fece90d636d49bb5b2a9645afdbf9b03 ******/
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
NumCoeffPerSurface: NCollection_HArray2<int
Coefficients: NCollection_HArray1<double
PolynomialUIntervals: NCollection_HArray1<double
PolynomialVIntervals: NCollection_HArray1<double
TrueUIntervals: NCollection_HArray1<double
TrueVIntervals: NCollection_HArray1<double

Return
-------
None

Description
-----------
To one grid of polynomial Surface. Warning! Continuity in each parametric direction can be at MOST the maximum degree of the polynomial functions. //! <TrueUIntervals>, <TrueVIntervals>: this is the true parameterisation for the composite surface //! Coefficients: The Coefficients have to be formatted than an 'C array' [NbVSurfaces] [NBUSurfaces] [MaxUDegree+1] [MaxVDegree+1] [3] raises DomainError if <NumCoeffPerSurface> is not a [1, NbVSurfaces*NbUSurfaces, 1,2] array. if <Coefficients> is not a.
") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles(const int NbUSurfaces, const int NBVSurfaces, const int UContinuity, const int VContinuity, const int MaxUDegree, const int MaxVDegree, const opencascade::handle<NCollection_HArray2<int> > & NumCoeffPerSurface, const opencascade::handle<NCollection_HArray1<double> > & Coefficients, const opencascade::handle<NCollection_HArray1<double> > & PolynomialUIntervals, const opencascade::handle<NCollection_HArray1<double> > & PolynomialVIntervals, const opencascade::handle<NCollection_HArray1<double> > & TrueUIntervals, const opencascade::handle<NCollection_HArray1<double> > & TrueVIntervals);

		/****** Convert_GridPolynomialToPoles::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the conversion was successful.
") IsDone;
		bool IsDone();

		/****** Convert_GridPolynomialToPoles::NbUKnots ******/
		/****** md5 signature: 790406b6b06efba57c5111fd80daea5d ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the U parametric direction.
") NbUKnots;
		int NbUKnots();

		/****** Convert_GridPolynomialToPoles::NbUPoles ******/
		/****** md5 signature: ecab3cbbaf18559e002fccdfa81aa0d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the U parametric direction.
") NbUPoles;
		int NbUPoles();

		/****** Convert_GridPolynomialToPoles::NbVKnots ******/
		/****** md5 signature: b077d9245cbc08be7809ba04ff1e0c69 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the V parametric direction.
") NbVKnots;
		int NbVKnots();

		/****** Convert_GridPolynomialToPoles::NbVPoles ******/
		/****** md5 signature: fd4ae03f2a37db0cb241bb2f458a15bb ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the V parametric direction.
") NbVPoles;
		int NbVPoles();

		/****** Convert_GridPolynomialToPoles::Poles ******/
		/****** md5 signature: 14016e5d40bac5fa096e746e935d87cd ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
NCollection_Array2<gp_Pnt>

Description
-----------
Returns the poles of the BSpline Surface.
") Poles;
		const NCollection_Array2<gp_Pnt> Poles();

		/****** Convert_GridPolynomialToPoles::UDegree ******/
		/****** md5 signature: 82316803b09fa91a345f15577c8b3c82 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree in the U parametric direction.
") UDegree;
		int UDegree();

		/****** Convert_GridPolynomialToPoles::UKnots ******/
		/****** md5 signature: 6ecfa59fde3ec7a93d4fab6d03e9d808 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
Returns the knots in the U direction.
") UKnots;
		const NCollection_Array1<double> & UKnots();

		/****** Convert_GridPolynomialToPoles::UMultiplicities ******/
		/****** md5 signature: f91dc895c87c8659e5d59a6c9ef08414 ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
Returns the multiplicities of the knots in the U direction.
") UMultiplicities;
		const NCollection_Array1<int> & UMultiplicities();

		/****** Convert_GridPolynomialToPoles::VDegree ******/
		/****** md5 signature: 10a01c94db483e5b8afe43596e767a03 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree in the V parametric direction.
") VDegree;
		int VDegree();

		/****** Convert_GridPolynomialToPoles::VKnots ******/
		/****** md5 signature: 6c058920a211da67a7dff7af61adb682 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
Returns the knots in the V direction.
") VKnots;
		const NCollection_Array1<double> & VKnots();

		/****** Convert_GridPolynomialToPoles::VMultiplicities ******/
		/****** md5 signature: f3771e3659943e959f4851e67f385973 ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
Returns the multiplicities of the knots in the V direction.
") VMultiplicities;
		const NCollection_Array1<int> & VMultiplicities();

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
		/****** md5 signature: 5bec676001f55ba1173d11ff59121836 ******/
		%feature("compactdefaultargs") Convert_CircleToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
U1: double
U2: double
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
The circle C is limited between the parametric values U1, U2 in radians. U1 and U2 [0.0, 2*Pi] . The equivalent B-spline curve is oriented from U1 to U2 and has the same orientation as the circle C. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi.
") Convert_CircleToBSplineCurve;
		 Convert_CircleToBSplineCurve(const gp_Circ2d & C, const double U1, const double U2, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

};


%extend Convert_CircleToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class Convert_CompBezierCurves2dToBSplineCurve2d *
***************************************************/
class Convert_CompBezierCurves2dToBSplineCurve2d : public Convert_CompBezierCurvesToBSplineCurveBase<gp_Pnt2d,gp_Vec2d> {
	public:
		/****** Convert_CompBezierCurves2dToBSplineCurve2d::Convert_CompBezierCurves2dToBSplineCurve2d ******/
		/****** md5 signature: 95fecf221fb8210e2cb032de6de7d56f ******/
		%feature("compactdefaultargs") Convert_CompBezierCurves2dToBSplineCurve2d;
		%feature("autodoc", "
Parameters
----------
theAngularTolerance: double (optional, default to 1.0e-4)

Return
-------
None

Description
-----------
Constructs a framework for converting a sequence of adjacent non-rational Bezier curves into a BSpline curve. 
Input parameter: theAngularTolerance angular tolerance in radians for checking tangent parallelism at junction points.
") Convert_CompBezierCurves2dToBSplineCurve2d;
		 Convert_CompBezierCurves2dToBSplineCurve2d(const double theAngularTolerance = 1.0e-4);

};


%extend Convert_CompBezierCurves2dToBSplineCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class Convert_CompBezierCurvesToBSplineCurve *
***********************************************/
class Convert_CompBezierCurvesToBSplineCurve : public Convert_CompBezierCurvesToBSplineCurveBase<gp_Pnt,gp_Vec> {
	public:
		/****** Convert_CompBezierCurvesToBSplineCurve::Convert_CompBezierCurvesToBSplineCurve ******/
		/****** md5 signature: 779b8a61d70504950f1c4a6137311709 ******/
		%feature("compactdefaultargs") Convert_CompBezierCurvesToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
theAngularTolerance: double (optional, default to 1.0e-4)

Return
-------
None

Description
-----------
Constructs a framework for converting a sequence of adjacent non-rational Bezier curves into a BSpline curve. 
Input parameter: theAngularTolerance angular tolerance in radians for checking tangent parallelism at junction points.
") Convert_CompBezierCurvesToBSplineCurve;
		 Convert_CompBezierCurvesToBSplineCurve(const double theAngularTolerance = 1.0e-4);

};


%extend Convert_CompBezierCurvesToBSplineCurve {
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
		/****** md5 signature: f00c3dc0f9922eb31f2d9eac59175e81 ******/
		%feature("compactdefaultargs") Convert_ConeToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
U1: double
U2: double
V1: double
V2: double

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the Cone in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.
") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface(const gp_Cone & C, const double U1, const double U2, const double V1, const double V2);

		/****** Convert_ConeToBSplineSurface::Convert_ConeToBSplineSurface ******/
		/****** md5 signature: 2be3819b12cdc566a8606090c783b6bc ******/
		%feature("compactdefaultargs") Convert_ConeToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
V1: double
V2: double

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the Cone in the U and V parametric directions. //! Raised if V1 = V2.
") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface(const gp_Cone & C, const double V1, const double V2);

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
		/****** md5 signature: 8639bf5f46b645a3bafdacc3aa6652bb ******/
		%feature("compactdefaultargs") Convert_CylinderToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
U1: double
U2: double
V1: double
V2: double

Return
-------
None

Description
-----------
The equivalent B-splineSurface as the same orientation as the cylinder in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.
") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface(const gp_Cylinder & Cyl, const double U1, const double U2, const double V1, const double V2);

		/****** Convert_CylinderToBSplineSurface::Convert_CylinderToBSplineSurface ******/
		/****** md5 signature: dd8d40d324d1a1368da4c3948bbb2d22 ******/
		%feature("compactdefaultargs") Convert_CylinderToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
V1: double
V2: double

Return
-------
None

Description
-----------
The equivalent B-splineSurface as the same orientation as the cylinder in the U and V parametric directions. //! Raised if V1 = V2.
") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface(const gp_Cylinder & Cyl, const double V1, const double V2);

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
		/****** md5 signature: d60f10c90e561b4900add5efe08eae57 ******/
		%feature("compactdefaultargs") Convert_EllipseToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
U1: double
U2: double
Parameterisation: Convert_ParameterisationType (optional, default to Convert_TgtThetaOver2)

Return
-------
None

Description
-----------
The ellipse E is limited between the parametric values U1, U2. The equivalent B-spline curve is oriented from U1 to U2 and has the same orientation as E. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi.
") Convert_EllipseToBSplineCurve;
		 Convert_EllipseToBSplineCurve(const gp_Elips2d & E, const double U1, const double U2, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

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
		/****** md5 signature: 9063d1ef719e599b5b87d37d3c156bc8 ******/
		%feature("compactdefaultargs") Convert_HyperbolaToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
U1: double
U2: double

Return
-------
None

Description
-----------
The hyperbola H is limited between the parametric values U1, U2 and the equivalent B-spline curve has the same orientation as the hyperbola.
") Convert_HyperbolaToBSplineCurve;
		 Convert_HyperbolaToBSplineCurve(const gp_Hypr2d & H, const double U1, const double U2);

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
		/****** md5 signature: 81bdb5a8abde677359b0750abc2cff0a ******/
		%feature("compactdefaultargs") Convert_ParabolaToBSplineCurve;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
U1: double
U2: double

Return
-------
None

Description
-----------
The parabola Prb is limited between the parametric values U1, U2 and the equivalent B-spline curve as the same orientation as the parabola Prb.
") Convert_ParabolaToBSplineCurve;
		 Convert_ParabolaToBSplineCurve(const gp_Parab2d & Prb, const double U1, const double U2);

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
		/****** md5 signature: 8fdde222e3665ec8078c61182df643eb ******/
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
U1: double
U2: double
V1: double
V2: double

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2.
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface(const gp_Sphere & Sph, const double U1, const double U2, const double V1, const double V2);

		/****** Convert_SphereToBSplineSurface::Convert_SphereToBSplineSurface ******/
		/****** md5 signature: e1ff24d70e6a9b5c69da5e6e014831bb ******/
		%feature("compactdefaultargs") Convert_SphereToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Param1: double
Param2: double
UTrim: bool (optional, default to true)

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the sphere in the U and V parametric directions. //! Raised if UTrim = True and Param1 = Param2 or Param1 = Param2 + 2.0 * Pi Raised if UTrim = False and Param1 = Param2.
") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface(const gp_Sphere & Sph, const double Param1, const double Param2, const bool UTrim = true);

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
		/****** md5 signature: c135ed8f443957a569c4e651e8127f15 ******/
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus
U1: double
U2: double
V1: double
V2: double

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions. //! Raised if U1 = U2 or U1 = U2 + 2.0 * Pi Raised if V1 = V2 or V1 = V2 + 2.0 * Pi.
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface(const gp_Torus & T, const double U1, const double U2, const double V1, const double V2);

		/****** Convert_TorusToBSplineSurface::Convert_TorusToBSplineSurface ******/
		/****** md5 signature: f65df6030dfe75e754cf3d6cea965a6d ******/
		%feature("compactdefaultargs") Convert_TorusToBSplineSurface;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus
Param1: double
Param2: double
UTrim: bool (optional, default to true)

Return
-------
None

Description
-----------
The equivalent B-spline surface as the same orientation as the torus in the U and V parametric directions. //! Raised if Param1 = Param2 or Param1 = Param2 + 2.0 * Pi.
") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface(const gp_Torus & T, const double Param1, const double Param2, const bool UTrim = true);

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
}
