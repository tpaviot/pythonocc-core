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
%define ADVAPPROXDOCSTRING
"AdvApprox module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_advapprox.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<AdvApprox_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<PLib_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import GeomAbs.i
%import TColgp.i
%import PLib.i

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

/**********************************
* class AdvApprox_ApproxAFunction *
**********************************/
class AdvApprox_ApproxAFunction {
	public:
		/****************** AdvApprox_ApproxAFunction ******************/
		%feature("compactdefaultargs") AdvApprox_ApproxAFunction;
		%feature("autodoc", "Constructs approximator tool. //! warning: the func should be valid reference to object of type inherited from class evaluatorfunction from approx with life time longer than that of the approximator tool; //! the result should be formatted in the following way : <--num1dss--> <--2 * num2dss--> <--3 * num3dss--> r[0] .... r[num1dss].....  r[dimension-1] //! the order in which each subspace appears should be consistent with the tolerances given in the create function and the results will be given in that order as well that is : curve2d(n) will correspond to the nth entry described by num2dss, curve(n) will correspond to the nth entry described by num3dss the same type of schema applies to the poles1d, poles2d and poles.

Parameters
----------
Num1DSS: int
Num2DSS: int
Num3DSS: int
OneDTol: TColStd_HArray1OfReal
TwoDTol: TColStd_HArray1OfReal
ThreeDTol: TColStd_HArray1OfReal
First: float
Last: float
Continuity: GeomAbs_Shape
MaxDeg: int
MaxSeg: int
Func: AdvApprox_EvaluatorFunction

Returns
-------
None
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction(const Standard_Integer Num1DSS, const Standard_Integer Num2DSS, const Standard_Integer Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const Standard_Real First, const Standard_Real Last, const GeomAbs_Shape Continuity, const Standard_Integer MaxDeg, const Standard_Integer MaxSeg, const AdvApprox_EvaluatorFunction & Func);

		/****************** AdvApprox_ApproxAFunction ******************/
		%feature("compactdefaultargs") AdvApprox_ApproxAFunction;
		%feature("autodoc", "Approximation with user methode of cutting.

Parameters
----------
Num1DSS: int
Num2DSS: int
Num3DSS: int
OneDTol: TColStd_HArray1OfReal
TwoDTol: TColStd_HArray1OfReal
ThreeDTol: TColStd_HArray1OfReal
First: float
Last: float
Continuity: GeomAbs_Shape
MaxDeg: int
MaxSeg: int
Func: AdvApprox_EvaluatorFunction
CutTool: AdvApprox_Cutting

Returns
-------
None
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction(const Standard_Integer Num1DSS, const Standard_Integer Num2DSS, const Standard_Integer Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const Standard_Real First, const Standard_Real Last, const GeomAbs_Shape Continuity, const Standard_Integer MaxDeg, const Standard_Integer MaxSeg, const AdvApprox_EvaluatorFunction & Func, const AdvApprox_Cutting & CutTool);

		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "No available documentation.

Parameters
----------
TotalDimension: int
TotalNumSS: int
LocalDimension: TColStd_Array1OfInteger
First: float
Last: float
Evaluator: AdvApprox_EvaluatorFunction
CutTool: AdvApprox_Cutting
ContinuityOrder: int
NumMaxCoeffs: int
MaxSegments: int
TolerancesArray: TColStd_Array1OfReal
code_precis: int
NumCoeffPerCurveArray: TColStd_Array1OfInteger
LocalCoefficientArray: TColStd_Array1OfReal
IntervalsArray: TColStd_Array1OfReal
ErrorMaxArray: TColStd_Array1OfReal
AverageErrorArray: TColStd_Array1OfReal

Returns
-------
NumCurves: int
ErrorCode: int
") Approximation;
		static void Approximation(const Standard_Integer TotalDimension, const Standard_Integer TotalNumSS, const TColStd_Array1OfInteger & LocalDimension, const Standard_Real First, const Standard_Real Last, AdvApprox_EvaluatorFunction & Evaluator, const AdvApprox_Cutting & CutTool, const Standard_Integer ContinuityOrder, const Standard_Integer NumMaxCoeffs, const Standard_Integer MaxSegments, const TColStd_Array1OfReal & TolerancesArray, const Standard_Integer code_precis, Standard_Integer &OutValue, TColStd_Array1OfInteger & NumCoeffPerCurveArray, TColStd_Array1OfReal & LocalCoefficientArray, TColStd_Array1OfReal & IntervalsArray, TColStd_Array1OfReal & ErrorMaxArray, TColStd_Array1OfReal & AverageErrorArray, Standard_Integer &OutValue);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the error as is in the algorithms.

Parameters
----------
Dimension: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") AverageError;
		opencascade::handle<TColStd_HArray1OfReal> AverageError(const Standard_Integer Dimension);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
Index: int

Returns
-------
float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Knots;
		opencascade::handle<TColStd_HArray1OfReal> Knots();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the error as is in the algorithms.

Parameters
----------
Dimension: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") MaxError;
		opencascade::handle<TColStd_HArray1OfReal> MaxError(const Standard_Integer Dimension);

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
Index: int

Returns
-------
float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Multiplicities;
		opencascade::handle<TColStd_HArray1OfInteger> Multiplicities();

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "As the name says.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** NumSubSpaces ******************/
		%feature("compactdefaultargs") NumSubSpaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int

Returns
-------
int
") NumSubSpaces;
		Standard_Integer NumSubSpaces(const Standard_Integer Dimension);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "-- returns the poles from the algorithms as is.

Returns
-------
opencascade::handle<TColgp_HArray2OfPnt>
") Poles;
		opencascade::handle<TColgp_HArray2OfPnt> Poles();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles at index from the 3d subspace.

Parameters
----------
Index: int
P: TColgp_Array1OfPnt

Returns
-------
None
") Poles;
		void Poles(const Standard_Integer Index, TColgp_Array1OfPnt & P);

		/****************** Poles1d ******************/
		%feature("compactdefaultargs") Poles1d;
		%feature("autodoc", "Returns the poles from the algorithms as is.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") Poles1d;
		opencascade::handle<TColStd_HArray2OfReal> Poles1d();

		/****************** Poles1d ******************/
		%feature("compactdefaultargs") Poles1d;
		%feature("autodoc", "Returns the poles at index from the 1d subspace.

Parameters
----------
Index: int
P: TColStd_Array1OfReal

Returns
-------
None
") Poles1d;
		void Poles1d(const Standard_Integer Index, TColStd_Array1OfReal & P);

		/****************** Poles2d ******************/
		%feature("compactdefaultargs") Poles2d;
		%feature("autodoc", "Returns the poles from the algorithms as is.

Returns
-------
opencascade::handle<TColgp_HArray2OfPnt2d>
") Poles2d;
		opencascade::handle<TColgp_HArray2OfPnt2d> Poles2d();

		/****************** Poles2d ******************/
		%feature("compactdefaultargs") Poles2d;
		%feature("autodoc", "Returns the poles at index from the 2d subspace.

Parameters
----------
Index: int
P: TColgp_Array1OfPnt2d

Returns
-------
None
") Poles2d;
		void Poles2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & P);

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
		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
a: float
b: float

Returns
-------
cuttingvalue: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real a, const Standard_Real b, Standard_Real &OutValue);

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
		/****************** AdvApprox_SimpleApprox ******************/
		%feature("compactdefaultargs") AdvApprox_SimpleApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
TotalDimension: int
TotalNumSS: int
Continuity: GeomAbs_Shape
WorkDegree: int
NbGaussPoints: int
JacobiBase: PLib_JacobiPolynomial
Func: AdvApprox_EvaluatorFunction

Returns
-------
None
") AdvApprox_SimpleApprox;
		 AdvApprox_SimpleApprox(const Standard_Integer TotalDimension, const Standard_Integer TotalNumSS, const GeomAbs_Shape Continuity, const Standard_Integer WorkDegree, const Standard_Integer NbGaussPoints, const opencascade::handle<PLib_JacobiPolynomial> & JacobiBase, const AdvApprox_EvaluatorFunction & Func);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Index);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients in the jacobi base.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Coefficients;
		opencascade::handle<TColStd_HArray1OfReal> Coefficients();

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** DifTab ******************/
		%feature("compactdefaultargs") DifTab;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") DifTab;
		opencascade::handle<TColStd_HArray1OfReal> DifTab();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FirstConstr ******************/
		%feature("compactdefaultargs") FirstConstr;
		%feature("autodoc", "Returns the constraints at first.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") FirstConstr;
		opencascade::handle<TColStd_HArray2OfReal> FirstConstr();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LastConstr ******************/
		%feature("compactdefaultargs") LastConstr;
		%feature("autodoc", "Returns the constraints at last.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") LastConstr;
		opencascade::handle<TColStd_HArray2OfReal> LastConstr();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Index);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Constructs approximator tool. //! warning: the func should be valid reference to object of type inherited from class evaluatorfunction from approx with life time longer than that of the approximator tool;.

Parameters
----------
LocalDimension: TColStd_Array1OfInteger
LocalTolerancesArray: TColStd_Array1OfReal
First: float
Last: float
MaxDegree: int

Returns
-------
None
") Perform;
		void Perform(const TColStd_Array1OfInteger & LocalDimension, const TColStd_Array1OfReal & LocalTolerancesArray, const Standard_Real First, const Standard_Real Last, const Standard_Integer MaxDegree);

		/****************** SomTab ******************/
		%feature("compactdefaultargs") SomTab;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") SomTab;
		opencascade::handle<TColStd_HArray1OfReal> SomTab();

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
		/****************** AdvApprox_DichoCutting ******************/
		%feature("compactdefaultargs") AdvApprox_DichoCutting;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApprox_DichoCutting;
		 AdvApprox_DichoCutting();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
a: float
b: float

Returns
-------
cuttingvalue: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real a, const Standard_Real b, Standard_Real &OutValue);

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
		/****************** AdvApprox_PrefAndRec ******************/
		%feature("compactdefaultargs") AdvApprox_PrefAndRec;
		%feature("autodoc", "No available documentation.

Parameters
----------
RecomendedCut: TColStd_Array1OfReal
PrefferedCut: TColStd_Array1OfReal
Weight: float,optional
	default value is 5

Returns
-------
None
") AdvApprox_PrefAndRec;
		 AdvApprox_PrefAndRec(const TColStd_Array1OfReal & RecomendedCut, const TColStd_Array1OfReal & PrefferedCut, const Standard_Real Weight = 5);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Cuting value is - the recommended point nerest of (a+b)/2 if pi is in ]a,b[ or else - the preferential point nearest of (a+b) / 2 if pi is in ](r*a+b)/(r+1) , (a+r*b)/(r+1)[ where r = weight - or (a+b)/2 else.

Parameters
----------
a: float
b: float

Returns
-------
cuttingvalue: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real a, const Standard_Real b, Standard_Real &OutValue);

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
		/****************** AdvApprox_PrefCutting ******************/
		%feature("compactdefaultargs") AdvApprox_PrefCutting;
		%feature("autodoc", "No available documentation.

Parameters
----------
CutPnts: TColStd_Array1OfReal

Returns
-------
None
") AdvApprox_PrefCutting;
		 AdvApprox_PrefCutting(const TColStd_Array1OfReal & CutPnts);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
a: float
b: float

Returns
-------
cuttingvalue: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real a, const Standard_Real b, Standard_Real &OutValue);

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
