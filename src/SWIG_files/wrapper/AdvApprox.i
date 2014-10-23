/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include AdvApprox_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor AdvApprox_ApproxAFunction;
class AdvApprox_ApproxAFunction {
	public:
		%feature("autodoc", "	* Constructs approximator tool. Warning: the Func should be valid reference to object of type inherited from class EvaluatorFunction from Approx with life time longer than that of the approximator tool; //!	 the result should be formatted in the following way : <--Num1DSS--> <--2 * Num2DSS--> <--3 * Num3DSS--> R[0] .... R[Num1DSS].....  R[Dimension-1] the order in which each Subspace appears should be consistent with the tolerances given in the create function and the results will be given in that order as well that is : Curve2d(n) will correspond to the nth entry described by Num2DSS, Curve(n) will correspond to the nth entry described by Num3DSS The same type of schema applies to the Poles1d, Poles2d and Poles.

	:param Num1DSS:
	:type Num1DSS: Standard_Integer
	:param Num2DSS:
	:type Num2DSS: Standard_Integer
	:param Num3DSS:
	:type Num3DSS: Standard_Integer
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
	:type MaxDeg: Standard_Integer
	:param MaxSeg:
	:type MaxSeg: Standard_Integer
	:param Func:
	:type Func: AdvApprox_EvaluatorFunction &
	:rtype: None
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Standard_Real First,const Standard_Real Last,const GeomAbs_Shape Continuity,const Standard_Integer MaxDeg,const Standard_Integer MaxSeg,const AdvApprox_EvaluatorFunction & Func);
		%feature("autodoc", "	* Approximation with user methode of cutting

	:param Num1DSS:
	:type Num1DSS: Standard_Integer
	:param Num2DSS:
	:type Num2DSS: Standard_Integer
	:param Num3DSS:
	:type Num3DSS: Standard_Integer
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
	:type MaxDeg: Standard_Integer
	:param MaxSeg:
	:type MaxSeg: Standard_Integer
	:param Func:
	:type Func: AdvApprox_EvaluatorFunction &
	:param CutTool:
	:type CutTool: AdvApprox_Cutting &
	:rtype: None
") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Standard_Real First,const Standard_Real Last,const GeomAbs_Shape Continuity,const Standard_Integer MaxDeg,const Standard_Integer MaxSeg,const AdvApprox_EvaluatorFunction & Func,const AdvApprox_Cutting & CutTool);
		%feature("autodoc", "	:param TotalDimension:
	:type TotalDimension: Standard_Integer
	:param TotalNumSS:
	:type TotalNumSS: Standard_Integer
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
	:type ContinuityOrder: Standard_Integer
	:param NumMaxCoeffs:
	:type NumMaxCoeffs: Standard_Integer
	:param MaxSegments:
	:type MaxSegments: Standard_Integer
	:param TolerancesArray:
	:type TolerancesArray: TColStd_Array1OfReal &
	:param code_precis:
	:type code_precis: Standard_Integer
	:param NumCurves:
	:type NumCurves: Standard_Integer &
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
	:type ErrorCode: Standard_Integer &
	:rtype: void
") Approximation;
		static void Approximation (const Standard_Integer TotalDimension,const Standard_Integer TotalNumSS,const TColStd_Array1OfInteger & LocalDimension,const Standard_Real First,const Standard_Real Last,AdvApprox_EvaluatorFunction & Evaluator,const AdvApprox_Cutting & CutTool,const Standard_Integer ContinuityOrder,const Standard_Integer NumMaxCoeffs,const Standard_Integer MaxSegments,const TColStd_Array1OfReal & TolerancesArray,const Standard_Integer code_precis,Standard_Integer &OutValue,TColStd_Array1OfInteger & NumCoeffPerCurveArray,TColStd_Array1OfReal & LocalCoefficientArray,TColStd_Array1OfReal & IntervalsArray,TColStd_Array1OfReal & ErrorMaxArray,TColStd_Array1OfReal & AverageErrorArray,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "	* returns the poles from the algorithms as is

	:rtype: Handle_TColStd_HArray2OfReal
") Poles1d;
		Handle_TColStd_HArray2OfReal Poles1d ();
		%feature("autodoc", "	* returns the poles from the algorithms as is

	:rtype: Handle_TColgp_HArray2OfPnt2d
") Poles2d;
		Handle_TColgp_HArray2OfPnt2d Poles2d ();
		%feature("autodoc", "	* -- returns the poles from the algorithms as is

	:rtype: Handle_TColgp_HArray2OfPnt
") Poles;
		Handle_TColgp_HArray2OfPnt Poles ();
		%feature("autodoc", "	* as the name says

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "	* returns the poles at Index from the 1d subspace

	:param Index:
	:type Index: Standard_Integer
	:param P:
	:type P: TColStd_Array1OfReal &
	:rtype: None
") Poles1d;
		void Poles1d (const Standard_Integer Index,TColStd_Array1OfReal & P);
		%feature("autodoc", "	* returns the poles at Index from the 2d subspace

	:param Index:
	:type Index: Standard_Integer
	:param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: None
") Poles2d;
		void Poles2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & P);
		%feature("autodoc", "	* returns the poles at Index from the 3d subspace

	:param Index:
	:type Index: Standard_Integer
	:param P:
	:type P: TColgp_Array1OfPnt
	:rtype: None
") Poles;
		void Poles (const Standard_Integer Index,TColgp_Array1OfPnt & P);
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "	:param Dimension:
	:type Dimension: Standard_Integer
	:rtype: int
") NumSubSpaces;
		Standard_Integer NumSubSpaces (const Standard_Integer Dimension);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Knots;
		Handle_TColStd_HArray1OfReal Knots ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") Multiplicities;
		Handle_TColStd_HArray1OfInteger Multiplicities ();
		%feature("autodoc", "	* returns the error as is in the algorithms

	:param Dimension:
	:type Dimension: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfReal
") MaxError;
		Handle_TColStd_HArray1OfReal MaxError (const Standard_Integer Dimension);
		%feature("autodoc", "	* returns the error as is in the algorithms

	:param Dimension:
	:type Dimension: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfReal
") AverageError;
		Handle_TColStd_HArray1OfReal AverageError (const Standard_Integer Dimension);
		%feature("autodoc", "	:param Dimension:
	:type Dimension: Standard_Integer
	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("autodoc", "	:param Dimension:
	:type Dimension: Standard_Integer
	:param Index:
	:type Index: Standard_Integer
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


%feature("shadow") AdvApprox_ApproxAFunction::~AdvApprox_ApproxAFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApprox_ApproxAFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApprox_Cutting;
class AdvApprox_Cutting {
	public:
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
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


%feature("shadow") AdvApprox_Cutting::~AdvApprox_Cutting %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApprox_Cutting {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApprox_SimpleApprox;
class AdvApprox_SimpleApprox {
	public:
		%feature("autodoc", "	:param TotalDimension:
	:type TotalDimension: Standard_Integer
	:param TotalNumSS:
	:type TotalNumSS: Standard_Integer
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param WorkDegree:
	:type WorkDegree: Standard_Integer
	:param NbGaussPoints:
	:type NbGaussPoints: Standard_Integer
	:param JacobiBase:
	:type JacobiBase: Handle_PLib_JacobiPolynomial &
	:param Func:
	:type Func: AdvApprox_EvaluatorFunction &
	:rtype: None
") AdvApprox_SimpleApprox;
		 AdvApprox_SimpleApprox (const Standard_Integer TotalDimension,const Standard_Integer TotalNumSS,const GeomAbs_Shape Continuity,const Standard_Integer WorkDegree,const Standard_Integer NbGaussPoints,const Handle_PLib_JacobiPolynomial & JacobiBase,const AdvApprox_EvaluatorFunction & Func);
		%feature("autodoc", "	* Constructs approximator tool. Warning: the Func should be valid reference to object of type inherited from class EvaluatorFunction from Approx with life time longer than that of the approximator tool;

	:param LocalDimension:
	:type LocalDimension: TColStd_Array1OfInteger &
	:param LocalTolerancesArray:
	:type LocalTolerancesArray: TColStd_Array1OfReal &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:rtype: None
") Perform;
		void Perform (const TColStd_Array1OfInteger & LocalDimension,const TColStd_Array1OfReal & LocalTolerancesArray,const Standard_Real First,const Standard_Real Last,const Standard_Integer MaxDegree);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	* returns the coefficients in the Jacobi Base

	:rtype: Handle_TColStd_HArray1OfReal
") Coefficients;
		Handle_TColStd_HArray1OfReal Coefficients ();
		%feature("autodoc", "	* returns the constraints at First

	:rtype: Handle_TColStd_HArray2OfReal
") FirstConstr;
		Handle_TColStd_HArray2OfReal FirstConstr ();
		%feature("autodoc", "	* returns the constraints at Last

	:rtype: Handle_TColStd_HArray2OfReal
") LastConstr;
		Handle_TColStd_HArray2OfReal LastConstr ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") SomTab;
		Handle_TColStd_HArray1OfReal SomTab ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") DifTab;
		Handle_TColStd_HArray1OfReal DifTab ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
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


%feature("shadow") AdvApprox_SimpleApprox::~AdvApprox_SimpleApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApprox_SimpleApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApprox_DichoCutting;
class AdvApprox_DichoCutting : public AdvApprox_Cutting {
	public:
		%feature("autodoc", "	:rtype: None
") AdvApprox_DichoCutting;
		 AdvApprox_DichoCutting ();
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


%feature("shadow") AdvApprox_DichoCutting::~AdvApprox_DichoCutting %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApprox_DichoCutting {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApprox_PrefAndRec;
class AdvApprox_PrefAndRec : public AdvApprox_Cutting {
	public:
		%feature("autodoc", "	:param RecomendedCut:
	:type RecomendedCut: TColStd_Array1OfReal &
	:param PrefferedCut:
	:type PrefferedCut: TColStd_Array1OfReal &
	:param Weight: default value is 5
	:type Weight: float
	:rtype: None
") AdvApprox_PrefAndRec;
		 AdvApprox_PrefAndRec (const TColStd_Array1OfReal & RecomendedCut,const TColStd_Array1OfReal & PrefferedCut,const Standard_Real Weight = 5);
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


%feature("shadow") AdvApprox_PrefAndRec::~AdvApprox_PrefAndRec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApprox_PrefAndRec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApprox_PrefCutting;
class AdvApprox_PrefCutting : public AdvApprox_Cutting {
	public:
		%feature("autodoc", "	:param CutPnts:
	:type CutPnts: TColStd_Array1OfReal &
	:rtype: None
") AdvApprox_PrefCutting;
		 AdvApprox_PrefCutting (const TColStd_Array1OfReal & CutPnts);
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


%feature("shadow") AdvApprox_PrefCutting::~AdvApprox_PrefCutting %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApprox_PrefCutting {
	void _kill_pointed() {
		delete $self;
	}
};
