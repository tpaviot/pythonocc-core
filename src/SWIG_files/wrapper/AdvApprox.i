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
%define ADVAPPROXDOCSTRING
"AdvApprox module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_advapprox.html"
%enddef
%module (package="OCC.Core", docstring=ADVAPPROXDOCSTRING) AdvApprox


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
#include<AdvApprox_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<PLib_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GeomAbs.i
%import PLib.i

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

/**********************************
* class AdvApprox_ApproxAFunction *
**********************************/
class AdvApprox_ApproxAFunction {
	public:
		/****** AdvApprox_ApproxAFunction::AdvApprox_ApproxAFunction ******/
		/****** md5 signature: 57f7105626d3065ff0fe81000dc45c05 ******/
		%feature("compactdefaultargs") AdvApprox_ApproxAFunction;
		%feature("autodoc", "
Parameters
----------
Num1DSS: int
Num2DSS: int
Num3DSS: int
OneDTol: NCollection_HArray1<double
TwoDTol: NCollection_HArray1<double
ThreeDTol: NCollection_HArray1<double
First: double
Last: double
Continuity: GeomAbs_Shape
MaxDeg: int
MaxSeg: int
Func: AdvApprox_EvaluatorFunction

Return
-------
None

Description
-----------
Constructs approximator tool. //! Warning: the Func should be valid reference to object of type inherited from class EvaluatorFunction from Approx with life time longer than that of the approximator tool; //! the result should be formatted in the following way: <--Num1DSS--> <--2 * Num2DSS--> <--3 * Num3DSS--> R[0] .... R[Num1DSS].....  R[Dimension-1] //! the order in which each Subspace appears should be consistent with the tolerances given in the create function and the results will be given in that order as well that is: Curve2d(n) will correspond to the nth entry described by Num2DSS, Curve(n) will correspond to the nth entry described by Num3DSS The same type of schema applies to the Poles1d, Poles2d and Poles.
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction(const int Num1DSS, const int Num2DSS, const int Num3DSS, const opencascade::handle<NCollection_HArray1<double> > & OneDTol, const opencascade::handle<NCollection_HArray1<double> > & TwoDTol, const opencascade::handle<NCollection_HArray1<double> > & ThreeDTol, const double First, const double Last, const GeomAbs_Shape Continuity, const int MaxDeg, const int MaxSeg, const AdvApprox_EvaluatorFunction & Func);

		/****** AdvApprox_ApproxAFunction::AdvApprox_ApproxAFunction ******/
		/****** md5 signature: 42344e44c59ef1acfb438986c5a99bcb ******/
		%feature("compactdefaultargs") AdvApprox_ApproxAFunction;
		%feature("autodoc", "
Parameters
----------
Num1DSS: int
Num2DSS: int
Num3DSS: int
OneDTol: NCollection_HArray1<double
TwoDTol: NCollection_HArray1<double
ThreeDTol: NCollection_HArray1<double
First: double
Last: double
Continuity: GeomAbs_Shape
MaxDeg: int
MaxSeg: int
Func: AdvApprox_EvaluatorFunction
CutTool: AdvApprox_Cutting

Return
-------
None

Description
-----------
Approximation with user method of cutting.
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction(const int Num1DSS, const int Num2DSS, const int Num3DSS, const opencascade::handle<NCollection_HArray1<double> > & OneDTol, const opencascade::handle<NCollection_HArray1<double> > & TwoDTol, const opencascade::handle<NCollection_HArray1<double> > & ThreeDTol, const double First, const double Last, const GeomAbs_Shape Continuity, const int MaxDeg, const int MaxSeg, const AdvApprox_EvaluatorFunction & Func, const AdvApprox_Cutting & CutTool);

		/****** AdvApprox_ApproxAFunction::Approximation ******/
		/****** md5 signature: 1eb56da86856c22be13126881f77cc64 ******/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "
Parameters
----------
TotalDimension: int
TotalNumSS: int
LocalDimension: NCollection_Array1<int>
First: double
Last: double
Evaluator: AdvApprox_EvaluatorFunction
CutTool: AdvApprox_Cutting
ContinuityOrder: int
NumMaxCoeffs: int
MaxSegments: int
TolerancesArray: NCollection_Array1<double>
code_precis: int
NumCoeffPerCurveArray: NCollection_Array1<int>
LocalCoefficientArray: NCollection_Array1<double>
IntervalsArray: NCollection_Array1<double>
ErrorMaxArray: NCollection_Array1<double>
AverageErrorArray: NCollection_Array1<double>

Return
-------
NumCurves: int
ErrorCode: int

Description
-----------
No available documentation.
") Approximation;
		static void Approximation(const int TotalDimension, const int TotalNumSS, const NCollection_Array1<int> & LocalDimension, const double First, const double Last, AdvApprox_EvaluatorFunction & Evaluator, const AdvApprox_Cutting & CutTool, const int ContinuityOrder, const int NumMaxCoeffs, const int MaxSegments, const NCollection_Array1<double> & TolerancesArray, const int code_precis, Standard_Integer &OutValue, NCollection_Array1<int> & NumCoeffPerCurveArray, NCollection_Array1<double> & LocalCoefficientArray, NCollection_Array1<double> & IntervalsArray, NCollection_Array1<double> & ErrorMaxArray, NCollection_Array1<double> & AverageErrorArray, Standard_Integer &OutValue);

		/****** AdvApprox_ApproxAFunction::AverageError ******/
		/****** md5 signature: 2f6bf7ea0e0cfb3b392f43df654829e3 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
returns the error as is in the algorithms.
") AverageError;
		opencascade::handle<NCollection_HArray1<double>> AverageError(const int Dimension);

		/****** AdvApprox_ApproxAFunction::AverageError ******/
		/****** md5 signature: ed4d67908b569de9e3571c9f53547394 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
double

Description
-----------
No available documentation.
") AverageError;
		double AverageError(const int Dimension, const int Index);

		/****** AdvApprox_ApproxAFunction::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** AdvApprox_ApproxAFunction::Dump ******/
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
display information on approximation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** AdvApprox_ApproxAFunction::HasResult ******/
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		bool HasResult();

		/****** AdvApprox_ApproxAFunction::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** AdvApprox_ApproxAFunction::Knots ******/
		/****** md5 signature: b13c1fe2b119dff6f267e3e7c76fc339 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
No available documentation.
") Knots;
		opencascade::handle<NCollection_HArray1<double>> Knots();

		/****** AdvApprox_ApproxAFunction::MaxError ******/
		/****** md5 signature: ab9966d45e8ce7fa710ffb9f899f7a08 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
returns the error as is in the algorithms.
") MaxError;
		opencascade::handle<NCollection_HArray1<double>> MaxError(const int Dimension);

		/****** AdvApprox_ApproxAFunction::MaxError ******/
		/****** md5 signature: 61a4677e31f18ea56a128d2bb9e750a6 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
double

Description
-----------
No available documentation.
") MaxError;
		double MaxError(const int Dimension, const int Index);

		/****** AdvApprox_ApproxAFunction::Multiplicities ******/
		/****** md5 signature: 1dd4e249ecb56e6ea985b02f7dfe7500 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<int>>

Description
-----------
No available documentation.
") Multiplicities;
		opencascade::handle<NCollection_HArray1<int>> Multiplicities();

		/****** AdvApprox_ApproxAFunction::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** AdvApprox_ApproxAFunction::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
as the name says.
") NbPoles;
		int NbPoles();

		/****** AdvApprox_ApproxAFunction::NumSubSpaces ******/
		/****** md5 signature: 1c9032115985612a399c1ddcdf11e7ff ******/
		%feature("compactdefaultargs") NumSubSpaces;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
int

Description
-----------
No available documentation.
") NumSubSpaces;
		int NumSubSpaces(const int Dimension);

		/****** AdvApprox_ApproxAFunction::Poles ******/
		/****** md5 signature: 987331e5eabfae357b972aa80d023723 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<gp_Pnt>>

Description
-----------
-- returns the poles from the algorithms as is.
") Poles;
		opencascade::handle<NCollection_HArray2<gp_Pnt>> Poles();

		/****** AdvApprox_ApproxAFunction::Poles ******/
		/****** md5 signature: 41839908c3607d3b024c2489b7c285fb ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
Index: int
P: NCollection_Array1<gp_Pnt>

Return
-------
None

Description
-----------
returns the poles at Index from the 3d subspace.
") Poles;
		void Poles(const int Index, NCollection_Array1<gp_Pnt> & P);

		/****** AdvApprox_ApproxAFunction::Poles1d ******/
		/****** md5 signature: fe896e14900c09862915d9fedc5d4efd ******/
		%feature("compactdefaultargs") Poles1d;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<double>>

Description
-----------
returns the poles from the algorithms as is.
") Poles1d;
		opencascade::handle<NCollection_HArray2<double>> Poles1d();

		/****** AdvApprox_ApproxAFunction::Poles1d ******/
		/****** md5 signature: 7a7828e9b26128507eda408e7222867c ******/
		%feature("compactdefaultargs") Poles1d;
		%feature("autodoc", "
Parameters
----------
Index: int
P: NCollection_Array1<double>

Return
-------
None

Description
-----------
returns the poles at Index from the 1d subspace.
") Poles1d;
		void Poles1d(const int Index, NCollection_Array1<double> & P);

		/****** AdvApprox_ApproxAFunction::Poles2d ******/
		/****** md5 signature: d41bc009da873234c2117e23225ed286 ******/
		%feature("compactdefaultargs") Poles2d;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<gp_Pnt2d>>

Description
-----------
returns the poles from the algorithms as is.
") Poles2d;
		opencascade::handle<NCollection_HArray2<gp_Pnt2d>> Poles2d();

		/****** AdvApprox_ApproxAFunction::Poles2d ******/
		/****** md5 signature: 2240c5a5f0c0792d13c451e349ab7444 ******/
		%feature("compactdefaultargs") Poles2d;
		%feature("autodoc", "
Parameters
----------
Index: int
P: NCollection_Array1<gp_Pnt2d>

Return
-------
None

Description
-----------
returns the poles at Index from the 2d subspace.
") Poles2d;
		void Poles2d(const int Index, NCollection_Array1<gp_Pnt2d> & P);

};


%extend AdvApprox_ApproxAFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AdvApprox_Cutting *
**************************/
%nodefaultctor AdvApprox_Cutting;
class AdvApprox_Cutting {
	public:
		/****** AdvApprox_Cutting::Value ******/
		/****** md5 signature: f9f896e306b47df93671981042a6b15c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
a: double
b: double

Return
-------
cuttingvalue: double

Description
-----------
No available documentation.
") Value;
		virtual bool Value(const double a, const double b, Standard_Real &OutValue);

};


%extend AdvApprox_Cutting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class AdvApprox_EvaluatorFunction *
************************************/
/*******************************
* class AdvApprox_SimpleApprox *
*******************************/
class AdvApprox_SimpleApprox {
	public:
		/****** AdvApprox_SimpleApprox::AdvApprox_SimpleApprox ******/
		/****** md5 signature: edb57a1b549070815b8f477aa6b00864 ******/
		%feature("compactdefaultargs") AdvApprox_SimpleApprox;
		%feature("autodoc", "
Parameters
----------
TotalDimension: int
TotalNumSS: int
Continuity: GeomAbs_Shape
WorkDegree: int
NbGaussPoints: int
JacobiBase: PLib_JacobiPolynomial
Func: AdvApprox_EvaluatorFunction

Return
-------
None

Description
-----------
No available documentation.
") AdvApprox_SimpleApprox;
		 AdvApprox_SimpleApprox(const int TotalDimension, const int TotalNumSS, const GeomAbs_Shape Continuity, const int WorkDegree, const int NbGaussPoints, const PLib_JacobiPolynomial & JacobiBase, const AdvApprox_EvaluatorFunction & Func);

		/****** AdvApprox_SimpleApprox::AverageError ******/
		/****** md5 signature: 2ac84a9254f174cfe85f43498a456997 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") AverageError;
		double AverageError(const int Index);

		/****** AdvApprox_SimpleApprox::Coefficients ******/
		/****** md5 signature: d211a3ee274167c2f1978def8d85f415 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
returns the coefficients in the Jacobi Base.
") Coefficients;
		opencascade::handle<NCollection_HArray1<double>> Coefficients();

		/****** AdvApprox_SimpleApprox::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** AdvApprox_SimpleApprox::DifTab ******/
		/****** md5 signature: dc602f097981ff346ad091b16b7818b4 ******/
		%feature("compactdefaultargs") DifTab;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
No available documentation.
") DifTab;
		opencascade::handle<NCollection_HArray1<double>> DifTab();

		/****** AdvApprox_SimpleApprox::Dump ******/
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
display information on approximation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** AdvApprox_SimpleApprox::FirstConstr ******/
		/****** md5 signature: 0b49edb668bebd19776e9dea09f8be68 ******/
		%feature("compactdefaultargs") FirstConstr;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<double>>

Description
-----------
returns the constraints at First.
") FirstConstr;
		opencascade::handle<NCollection_HArray2<double>> FirstConstr();

		/****** AdvApprox_SimpleApprox::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** AdvApprox_SimpleApprox::LastConstr ******/
		/****** md5 signature: d6c738d496704293651a45708e967b5b ******/
		%feature("compactdefaultargs") LastConstr;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<double>>

Description
-----------
returns the constraints at Last.
") LastConstr;
		opencascade::handle<NCollection_HArray2<double>> LastConstr();

		/****** AdvApprox_SimpleApprox::MaxError ******/
		/****** md5 signature: ce54a0bc8bce0f03a7e5d85bc81e29bf ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") MaxError;
		double MaxError(const int Index);

		/****** AdvApprox_SimpleApprox::Perform ******/
		/****** md5 signature: 7ed562e5709f6b09cc936d0443d59b44 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
LocalDimension: NCollection_Array1<int>
LocalTolerancesArray: NCollection_Array1<double>
First: double
Last: double
MaxDegree: int

Return
-------
None

Description
-----------
Constructs approximator tool. //! Warning: the Func should be valid reference to object of type inherited from class EvaluatorFunction from Approx with life time longer than that of the approximator tool;.
") Perform;
		void Perform(const NCollection_Array1<int> & LocalDimension, const NCollection_Array1<double> & LocalTolerancesArray, const double First, const double Last, const int MaxDegree);

		/****** AdvApprox_SimpleApprox::SomTab ******/
		/****** md5 signature: a4ad48128c7504b324d05ebc59ad3b45 ******/
		%feature("compactdefaultargs") SomTab;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
No available documentation.
") SomTab;
		opencascade::handle<NCollection_HArray1<double>> SomTab();

};


%extend AdvApprox_SimpleApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AdvApprox_DichoCutting *
*******************************/
class AdvApprox_DichoCutting : public AdvApprox_Cutting {
	public:
		/****** AdvApprox_DichoCutting::AdvApprox_DichoCutting ******/
		/****** md5 signature: 49eacbf0bb8c2a4e18a60b06e528d4ee ******/
		%feature("compactdefaultargs") AdvApprox_DichoCutting;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AdvApprox_DichoCutting;
		 AdvApprox_DichoCutting();

		/****** AdvApprox_DichoCutting::Value ******/
		/****** md5 signature: 93c0717eea62660d28edc79ee86328f9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
a: double
b: double

Return
-------
cuttingvalue: double

Description
-----------
No available documentation.
") Value;
		bool Value(const double a, const double b, Standard_Real &OutValue);

};


%extend AdvApprox_DichoCutting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AdvApprox_PrefAndRec *
*****************************/
class AdvApprox_PrefAndRec : public AdvApprox_Cutting {
	public:
		/****** AdvApprox_PrefAndRec::AdvApprox_PrefAndRec ******/
		/****** md5 signature: 082b1136bed172c5ffc4d4f9a4c0b8bf ******/
		%feature("compactdefaultargs") AdvApprox_PrefAndRec;
		%feature("autodoc", "
Parameters
----------
RecomendedCut: NCollection_Array1<double>
PrefferedCut: NCollection_Array1<double>
Weight: double (optional, default to 5)

Return
-------
None

Description
-----------
No available documentation.
") AdvApprox_PrefAndRec;
		 AdvApprox_PrefAndRec(const NCollection_Array1<double> & RecomendedCut, const NCollection_Array1<double> & PrefferedCut, const double Weight = 5);

		/****** AdvApprox_PrefAndRec::Value ******/
		/****** md5 signature: 93c0717eea62660d28edc79ee86328f9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
a: double
b: double

Return
-------
cuttingvalue: double

Description
-----------
cuting value is - the recommended point nerest of (a+b)/2 if pi is in ]a,b[ or else - the preferential point nearest of (a+b) / 2 if pi is in ](r*a+b)/(r+1) , (a+r*b)/(r+1)[ where r = Weight - or (a+b)/2 else.
") Value;
		bool Value(const double a, const double b, Standard_Real &OutValue);

};


%extend AdvApprox_PrefAndRec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class AdvApprox_PrefCutting *
******************************/
class AdvApprox_PrefCutting : public AdvApprox_Cutting {
	public:
		/****** AdvApprox_PrefCutting::AdvApprox_PrefCutting ******/
		/****** md5 signature: 2a6fc8064b15f2110eca5ee39c64799b ******/
		%feature("compactdefaultargs") AdvApprox_PrefCutting;
		%feature("autodoc", "
Parameters
----------
CutPnts: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") AdvApprox_PrefCutting;
		 AdvApprox_PrefCutting(const NCollection_Array1<double> & CutPnts);

		/****** AdvApprox_PrefCutting::Value ******/
		/****** md5 signature: 93c0717eea62660d28edc79ee86328f9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
a: double
b: double

Return
-------
cuttingvalue: double

Description
-----------
No available documentation.
") Value;
		bool Value(const double a, const double b, Standard_Real &OutValue);

};


%extend AdvApprox_PrefCutting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class AdvApprox_EvaluatorFunction:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def AdvApprox_ApproxAFunction_Approximation(*args):
	return AdvApprox_ApproxAFunction.Approximation(*args)

}
