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
%module (package="OCC") AdvApprox

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


%include AdvApprox_headers.i


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

%nodefaultctor AdvApprox_ApproxAFunction;
class AdvApprox_ApproxAFunction {
	public:
		%feature("compactdefaultargs") AdvApprox_ApproxAFunction;
		%feature("autodoc", "	* Constructs approximator tool. //! Warning: the Func should be valid reference to object of type inherited from class EvaluatorFunction from Approx with life time longer than that of the approximator tool; //! the result should be formatted in the following way : <--Num1DSS--> <--2 * Num2DSS--> <--3 * Num3DSS--> R[0] .... R[Num1DSS].....  R[Dimension-1] //! the order in which each Subspace appears should be consistent with the tolerances given in the create function and the results will be given in that order as well that is : Curve2d(n) will correspond to the nth entry described by Num2DSS, Curve(n) will correspond to the nth entry described by Num3DSS The same type of schema applies to the Poles1d, Poles2d and Poles.

	:param Num1DSS:
	:type Num1DSS: int
	:param Num2DSS:
	:type Num2DSS: int
	:param Num3DSS:
	:type Num3DSS: int
	:param OneDTol:
	:type OneDTol: Handle_TColStd_HArray1OfReal &
	:param TwoDTol:
	:type TwoDTol: Handle_TColStd_HArray1OfReal &
	:param ThreeDTol:
	:type ThreeDTol: Handle_TColStd_HArray1OfReal &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxDeg:
	:type MaxDeg: int
	:param MaxSeg:
	:type MaxSeg: int
	:param Func:
	:type Func: AdvApprox_EvaluatorFunction &
	:rtype: None
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Standard_Real First,const Standard_Real Last,const GeomAbs_Shape Continuity,const Standard_Integer MaxDeg,const Standard_Integer MaxSeg,const AdvApprox_EvaluatorFunction & Func);
		%feature("compactdefaultargs") AdvApprox_ApproxAFunction;
		%feature("autodoc", "	* Approximation with user methode of cutting

	:param Num1DSS:
	:type Num1DSS: int
	:param Num2DSS:
	:type Num2DSS: int
	:param Num3DSS:
	:type Num3DSS: int
	:param OneDTol:
	:type OneDTol: Handle_TColStd_HArray1OfReal &
	:param TwoDTol:
	:type TwoDTol: Handle_TColStd_HArray1OfReal &
	:param ThreeDTol:
	:type ThreeDTol: Handle_TColStd_HArray1OfReal &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxDeg:
	:type MaxDeg: int
	:param MaxSeg:
	:type MaxSeg: int
	:param Func:
	:type Func: AdvApprox_EvaluatorFunction &
	:param CutTool:
	:type CutTool: AdvApprox_Cutting &
	:rtype: None
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Standard_Real First,const Standard_Real Last,const GeomAbs_Shape Continuity,const Standard_Integer MaxDeg,const Standard_Integer MaxSeg,const AdvApprox_EvaluatorFunction & Func,const AdvApprox_Cutting & CutTool);
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "	:param TotalDimension:
	:type TotalDimension: int
	:param TotalNumSS:
	:type TotalNumSS: int
	:param LocalDimension:
	:type LocalDimension: TColStd_Array1OfInteger &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Evaluator:
	:type Evaluator: AdvApprox_EvaluatorFunction &
	:param CutTool:
	:type CutTool: AdvApprox_Cutting &
	:param ContinuityOrder:
	:type ContinuityOrder: int
	:param NumMaxCoeffs:
	:type NumMaxCoeffs: int
	:param MaxSegments:
	:type MaxSegments: int
	:param TolerancesArray:
	:type TolerancesArray: TColStd_Array1OfReal &
	:param code_precis:
	:type code_precis: int
	:param NumCurves:
	:type NumCurves: int &
	:param NumCoeffPerCurveArray:
	:type NumCoeffPerCurveArray: TColStd_Array1OfInteger &
	:param LocalCoefficientArray:
	:type LocalCoefficientArray: TColStd_Array1OfReal &
	:param IntervalsArray:
	:type IntervalsArray: TColStd_Array1OfReal &
	:param ErrorMaxArray:
	:type ErrorMaxArray: TColStd_Array1OfReal &
	:param AverageErrorArray:
	:type AverageErrorArray: TColStd_Array1OfReal &
	:param ErrorCode:
	:type ErrorCode: int &
	:rtype: void
") Approximation;
		static void Approximation (const Standard_Integer TotalDimension,const Standard_Integer TotalNumSS,const TColStd_Array1OfInteger & LocalDimension,const Standard_Real First,const Standard_Real Last,AdvApprox_EvaluatorFunction & Evaluator,const AdvApprox_Cutting & CutTool,const Standard_Integer ContinuityOrder,const Standard_Integer NumMaxCoeffs,const Standard_Integer MaxSegments,const TColStd_Array1OfReal & TolerancesArray,const Standard_Integer code_precis,Standard_Integer &OutValue,TColStd_Array1OfInteger & NumCoeffPerCurveArray,TColStd_Array1OfReal & LocalCoefficientArray,TColStd_Array1OfReal & IntervalsArray,TColStd_Array1OfReal & ErrorMaxArray,TColStd_Array1OfReal & AverageErrorArray,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") Poles1d;
		%feature("autodoc", "	* returns the poles from the algorithms as is

	:rtype: Handle_TColStd_HArray2OfReal
") Poles1d;
		Handle_TColStd_HArray2OfReal Poles1d ();
		%feature("compactdefaultargs") Poles2d;
		%feature("autodoc", "	* returns the poles from the algorithms as is

	:rtype: Handle_TColgp_HArray2OfPnt2d
") Poles2d;
		Handle_TColgp_HArray2OfPnt2d Poles2d ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* -- returns the poles from the algorithms as is

	:rtype: Handle_TColgp_HArray2OfPnt
") Poles;
		Handle_TColgp_HArray2OfPnt Poles ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* as the name says

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Poles1d;
		%feature("autodoc", "	* returns the poles at Index from the 1d subspace

	:param Index:
	:type Index: int
	:param P:
	:type P: TColStd_Array1OfReal &
	:rtype: None
") Poles1d;
		void Poles1d (const Standard_Integer Index,TColStd_Array1OfReal & P);
		%feature("compactdefaultargs") Poles2d;
		%feature("autodoc", "	* returns the poles at Index from the 2d subspace

	:param Index:
	:type Index: int
	:param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: None
") Poles2d;
		void Poles2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & P);
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* returns the poles at Index from the 3d subspace

	:param Index:
	:type Index: int
	:param P:
	:type P: TColgp_Array1OfPnt
	:rtype: None
") Poles;
		void Poles (const Standard_Integer Index,TColgp_Array1OfPnt & P);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") NumSubSpaces;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:rtype: int
") NumSubSpaces;
		Standard_Integer NumSubSpaces (const Standard_Integer Dimension);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Knots;
		Handle_TColStd_HArray1OfReal Knots ();
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") Multiplicities;
		Handle_TColStd_HArray1OfInteger Multiplicities ();
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	* returns the error as is in the algorithms

	:param Dimension:
	:type Dimension: int
	:rtype: Handle_TColStd_HArray1OfReal
") MaxError;
		Handle_TColStd_HArray1OfReal MaxError (const Standard_Integer Dimension);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	* returns the error as is in the algorithms

	:param Dimension:
	:type Dimension: int
	:rtype: Handle_TColStd_HArray1OfReal
") AverageError;
		Handle_TColStd_HArray1OfReal AverageError (const Standard_Integer Dimension);
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param Index:
	:type Index: int
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param Index:
	:type Index: int
	:rtype: float
") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,const Standard_Integer Index);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend AdvApprox_ApproxAFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApprox_Cutting;
class AdvApprox_Cutting {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param a:
	:type a: float
	:param b:
	:type b: float
	:param cuttingvalue:
	:type cuttingvalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real a,const Standard_Real b,Standard_Real &OutValue);
};


%extend AdvApprox_Cutting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApprox_SimpleApprox;
class AdvApprox_SimpleApprox {
	public:
		%feature("compactdefaultargs") AdvApprox_SimpleApprox;
		%feature("autodoc", "	:param TotalDimension:
	:type TotalDimension: int
	:param TotalNumSS:
	:type TotalNumSS: int
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param WorkDegree:
	:type WorkDegree: int
	:param NbGaussPoints:
	:type NbGaussPoints: int
	:param JacobiBase:
	:type JacobiBase: Handle_PLib_JacobiPolynomial &
	:param Func:
	:type Func: AdvApprox_EvaluatorFunction &
	:rtype: None
") AdvApprox_SimpleApprox;
		 AdvApprox_SimpleApprox (const Standard_Integer TotalDimension,const Standard_Integer TotalNumSS,const GeomAbs_Shape Continuity,const Standard_Integer WorkDegree,const Standard_Integer NbGaussPoints,const Handle_PLib_JacobiPolynomial & JacobiBase,const AdvApprox_EvaluatorFunction & Func);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Constructs approximator tool. //! Warning: the Func should be valid reference to object of type inherited from class EvaluatorFunction from Approx with life time longer than that of the approximator tool;

	:param LocalDimension:
	:type LocalDimension: TColStd_Array1OfInteger &
	:param LocalTolerancesArray:
	:type LocalTolerancesArray: TColStd_Array1OfReal &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") Perform;
		void Perform (const TColStd_Array1OfInteger & LocalDimension,const TColStd_Array1OfReal & LocalTolerancesArray,const Standard_Real First,const Standard_Real Last,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* returns the coefficients in the Jacobi Base

	:rtype: Handle_TColStd_HArray1OfReal
") Coefficients;
		Handle_TColStd_HArray1OfReal Coefficients ();
		%feature("compactdefaultargs") FirstConstr;
		%feature("autodoc", "	* returns the constraints at First

	:rtype: Handle_TColStd_HArray2OfReal
") FirstConstr;
		Handle_TColStd_HArray2OfReal FirstConstr ();
		%feature("compactdefaultargs") LastConstr;
		%feature("autodoc", "	* returns the constraints at Last

	:rtype: Handle_TColStd_HArray2OfReal
") LastConstr;
		Handle_TColStd_HArray2OfReal LastConstr ();
		%feature("compactdefaultargs") SomTab;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") SomTab;
		Handle_TColStd_HArray1OfReal SomTab ();
		%feature("compactdefaultargs") DifTab;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") DifTab;
		Handle_TColStd_HArray1OfReal DifTab ();
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Index);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") AverageError;
		Standard_Real AverageError (const Standard_Integer Index);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend AdvApprox_SimpleApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApprox_DichoCutting;
class AdvApprox_DichoCutting : public AdvApprox_Cutting {
	public:
		%feature("compactdefaultargs") AdvApprox_DichoCutting;
		%feature("autodoc", "	:rtype: None
") AdvApprox_DichoCutting;
		 AdvApprox_DichoCutting ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param a:
	:type a: float
	:param b:
	:type b: float
	:param cuttingvalue:
	:type cuttingvalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real a,const Standard_Real b,Standard_Real &OutValue);
};


%extend AdvApprox_DichoCutting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApprox_PrefAndRec;
class AdvApprox_PrefAndRec : public AdvApprox_Cutting {
	public:
		%feature("compactdefaultargs") AdvApprox_PrefAndRec;
		%feature("autodoc", "	:param RecomendedCut:
	:type RecomendedCut: TColStd_Array1OfReal &
	:param PrefferedCut:
	:type PrefferedCut: TColStd_Array1OfReal &
	:param Weight: default value is 5
	:type Weight: float
	:rtype: None
") AdvApprox_PrefAndRec;
		 AdvApprox_PrefAndRec (const TColStd_Array1OfReal & RecomendedCut,const TColStd_Array1OfReal & PrefferedCut,const Standard_Real Weight = 5);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* cuting value is - the recommended point nerest of (a+b)/2 if pi is in ]a,b[ or else - the preferential point nearest of (a+b) / 2 if pi is in ](r*a+b)/(r+1) , (a+r*b)/(r+1)[ where r = Weight - or (a+b)/2 else.

	:param a:
	:type a: float
	:param b:
	:type b: float
	:param cuttingvalue:
	:type cuttingvalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real a,const Standard_Real b,Standard_Real &OutValue);
};


%extend AdvApprox_PrefAndRec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApprox_PrefCutting;
class AdvApprox_PrefCutting : public AdvApprox_Cutting {
	public:
		%feature("compactdefaultargs") AdvApprox_PrefCutting;
		%feature("autodoc", "	:param CutPnts:
	:type CutPnts: TColStd_Array1OfReal &
	:rtype: None
") AdvApprox_PrefCutting;
		 AdvApprox_PrefCutting (const TColStd_Array1OfReal & CutPnts);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param a:
	:type a: float
	:param b:
	:type b: float
	:param cuttingvalue:
	:type cuttingvalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real a,const Standard_Real b,Standard_Real &OutValue);
};


%extend AdvApprox_PrefCutting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
