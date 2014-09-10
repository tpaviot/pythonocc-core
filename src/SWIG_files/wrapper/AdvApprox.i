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
		%feature("autodoc", "Args:
	Num1DSS(Standard_Integer)
	Num2DSS(Standard_Integer)
	Num3DSS(Standard_Integer)
	OneDTol(Handle_TColStd_HArray1OfReal)
	TwoDTol(Handle_TColStd_HArray1OfReal)
	ThreeDTol(Handle_TColStd_HArray1OfReal)
	First(Standard_Real)
	Last(Standard_Real)
	Continuity(GeomAbs_Shape)
	MaxDeg(Standard_Integer)
	MaxSeg(Standard_Integer)
	Func(AdvApprox_EvaluatorFunction)

Returns:
	None

Constructs approximator tool.  
 
 Warning:  
    the Func should be valid reference to object of type  
    inherited from class EvaluatorFunction from Approx  
    with life time longer than that of the approximator tool;  
 
//!	  the result should be formatted in the following way :  
<--Num1DSS--> <--2 * Num2DSS--> <--3 * Num3DSS-->  
R[0] ....     R[Num1DSS].....                   R[Dimension-1]  
 
 the order in which each Subspace appears should be consistent  
 with the tolerances given in the create function and the  
 results will be given in that order as well that is :  
 Curve2d(n)  will correspond to the nth entry  
 described by Num2DSS, Curve(n) will correspond to  
 the nth entry described by Num3DSS  
 The same type of schema applies to the Poles1d, Poles2d and  
 Poles.") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Standard_Real First,const Standard_Real Last,const GeomAbs_Shape Continuity,const Standard_Integer MaxDeg,const Standard_Integer MaxSeg,const AdvApprox_EvaluatorFunction & Func);
		%feature("autodoc", "Args:
	Num1DSS(Standard_Integer)
	Num2DSS(Standard_Integer)
	Num3DSS(Standard_Integer)
	OneDTol(Handle_TColStd_HArray1OfReal)
	TwoDTol(Handle_TColStd_HArray1OfReal)
	ThreeDTol(Handle_TColStd_HArray1OfReal)
	First(Standard_Real)
	Last(Standard_Real)
	Continuity(GeomAbs_Shape)
	MaxDeg(Standard_Integer)
	MaxSeg(Standard_Integer)
	Func(AdvApprox_EvaluatorFunction)
	CutTool(AdvApprox_Cutting)

Returns:
	None

Approximation with user methode of cutting") AdvApprox_ApproxAFunction;
		 AdvApprox_ApproxAFunction (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Standard_Real First,const Standard_Real Last,const GeomAbs_Shape Continuity,const Standard_Integer MaxDeg,const Standard_Integer MaxSeg,const AdvApprox_EvaluatorFunction & Func,const AdvApprox_Cutting & CutTool);
		%feature("autodoc", "Args:
	TotalDimension(Standard_Integer)
	TotalNumSS(Standard_Integer)
	LocalDimension(TColStd_Array1OfInteger)
	First(Standard_Real)
	Last(Standard_Real)
	Evaluator(AdvApprox_EvaluatorFunction)
	CutTool(AdvApprox_Cutting)
	ContinuityOrder(Standard_Integer)
	NumMaxCoeffs(Standard_Integer)
	MaxSegments(Standard_Integer)
	TolerancesArray(TColStd_Array1OfReal)
	code_precis(Standard_Integer)
	NumCurves(Standard_Integer)
	NumCoeffPerCurveArray(TColStd_Array1OfInteger)
	LocalCoefficientArray(TColStd_Array1OfReal)
	IntervalsArray(TColStd_Array1OfReal)
	ErrorMaxArray(TColStd_Array1OfReal)
	AverageErrorArray(TColStd_Array1OfReal)
	ErrorCode(Standard_Integer)

Returns:
	static void

No detailed docstring for this function.") Approximation;
		static void Approximation (const Standard_Integer TotalDimension,const Standard_Integer TotalNumSS,const TColStd_Array1OfInteger & LocalDimension,const Standard_Real First,const Standard_Real Last,AdvApprox_EvaluatorFunction & Evaluator,const AdvApprox_Cutting & CutTool,const Standard_Integer ContinuityOrder,const Standard_Integer NumMaxCoeffs,const Standard_Integer MaxSegments,const TColStd_Array1OfReal & TolerancesArray,const Standard_Integer code_precis,Standard_Integer &OutValue,TColStd_Array1OfInteger & NumCoeffPerCurveArray,TColStd_Array1OfReal & LocalCoefficientArray,TColStd_Array1OfReal & IntervalsArray,TColStd_Array1OfReal & ErrorMaxArray,TColStd_Array1OfReal & AverageErrorArray,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray2OfReal

returns the poles from the algorithms as is") Poles1d;
		Handle_TColStd_HArray2OfReal Poles1d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray2OfPnt2d

returns the poles from the algorithms as is") Poles2d;
		Handle_TColgp_HArray2OfPnt2d Poles2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray2OfPnt

-- returns the poles from the algorithms as is") Poles;
		Handle_TColgp_HArray2OfPnt Poles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

as the name says") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(TColStd_Array1OfReal)

Returns:
	None

returns the poles at Index from the 1d subspace") Poles1d;
		void Poles1d (const Standard_Integer Index,TColStd_Array1OfReal & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(TColgp_Array1OfPnt2d)

Returns:
	None

returns the poles at Index from the 2d subspace") Poles2d;
		void Poles2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(TColgp_Array1OfPnt)

Returns:
	None

returns the poles at Index from the 3d subspace") Poles;
		void Poles (const Standard_Integer Index,TColgp_Array1OfPnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NumSubSpaces;
		Standard_Integer NumSubSpaces (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Knots;
		Handle_TColStd_HArray1OfReal Knots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfInteger

No detailed docstring for this function.") Multiplicities;
		Handle_TColStd_HArray1OfInteger Multiplicities ();
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

returns the error as is in the algorithms") MaxError;
		Handle_TColStd_HArray1OfReal MaxError (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

returns the error as is in the algorithms") AverageError;
		Handle_TColStd_HArray1OfReal AverageError (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") AverageError;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	a(Standard_Real)
	b(Standard_Real)
	cuttingvalue(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	TotalDimension(Standard_Integer)
	TotalNumSS(Standard_Integer)
	Continuity(GeomAbs_Shape)
	WorkDegree(Standard_Integer)
	NbGaussPoints(Standard_Integer)
	JacobiBase(Handle_PLib_JacobiPolynomial)
	Func(AdvApprox_EvaluatorFunction)

Returns:
	None

No detailed docstring for this function.") AdvApprox_SimpleApprox;
		 AdvApprox_SimpleApprox (const Standard_Integer TotalDimension,const Standard_Integer TotalNumSS,const GeomAbs_Shape Continuity,const Standard_Integer WorkDegree,const Standard_Integer NbGaussPoints,const Handle_PLib_JacobiPolynomial & JacobiBase,const AdvApprox_EvaluatorFunction & Func);
		%feature("autodoc", "Args:
	LocalDimension(TColStd_Array1OfInteger)
	LocalTolerancesArray(TColStd_Array1OfReal)
	First(Standard_Real)
	Last(Standard_Real)
	MaxDegree(Standard_Integer)

Returns:
	None

Constructs approximator tool.  
 
 Warning:  
    the Func should be valid reference to object of type  
    inherited from class EvaluatorFunction from Approx  
    with life time longer than that of the approximator tool;") Perform;
		void Perform (const TColStd_Array1OfInteger & LocalDimension,const TColStd_Array1OfReal & LocalTolerancesArray,const Standard_Real First,const Standard_Real Last,const Standard_Integer MaxDegree);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

returns the coefficients in the Jacobi Base") Coefficients;
		Handle_TColStd_HArray1OfReal Coefficients ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray2OfReal

returns the constraints at First") FirstConstr;
		Handle_TColStd_HArray2OfReal FirstConstr ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray2OfReal

returns the constraints at Last") LastConstr;
		Handle_TColStd_HArray2OfReal LastConstr ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") SomTab;
		Handle_TColStd_HArray1OfReal SomTab ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") DifTab;
		Handle_TColStd_HArray1OfReal DifTab ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") MaxError;
		Standard_Real MaxError (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") AverageError;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApprox_DichoCutting;
		 AdvApprox_DichoCutting ();
		%feature("autodoc", "Args:
	a(Standard_Real)
	b(Standard_Real)
	cuttingvalue(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	RecomendedCut(TColStd_Array1OfReal)
	PrefferedCut(TColStd_Array1OfReal)
	Weight(Standard_Real)=5

Returns:
	None

No detailed docstring for this function.") AdvApprox_PrefAndRec;
		 AdvApprox_PrefAndRec (const TColStd_Array1OfReal & RecomendedCut,const TColStd_Array1OfReal & PrefferedCut,const Standard_Real Weight = 5);
		%feature("autodoc", "Args:
	a(Standard_Real)
	b(Standard_Real)
	cuttingvalue(Standard_Real)

Returns:
	virtual Standard_Boolean

cuting value is  
   - the recommended point nerest of (a+b)/2  
     if pi is in ]a,b[ or else  
  -  the preferential point nearest of (a+b) / 2  
    if pi is in ](r*a+b)/(r+1) , (a+r*b)/(r+1)[ where r = Weight  
  -  or (a+b)/2 else.") Value;
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
		%feature("autodoc", "Args:
	CutPnts(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") AdvApprox_PrefCutting;
		 AdvApprox_PrefCutting (const TColStd_Array1OfReal & CutPnts);
		%feature("autodoc", "Args:
	a(Standard_Real)
	b(Standard_Real)
	cuttingvalue(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
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
