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
%module BRepApprox

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

%include BRepApprox_required_python_modules.i
%include BRepApprox_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepApprox_Approx;
class BRepApprox_Approx {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepApprox_Approx;
		 BRepApprox_Approx ();
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	DegMin(Standard_Integer)
	DegMax(Standard_Integer)
	NbIterMax(Standard_Integer)
	ApproxWithTangency(Standard_Boolean)=Standard_True
	Parametrization(Approx_ParametrizationType)=Approx_ChordLength

Returns:
	None

No detailed docstring for this function.") SetParameters;
		void SetParameters (const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer DegMin,const Standard_Integer DegMax,const Standard_Integer NbIterMax,const Standard_Boolean ApproxWithTangency = Standard_True,const Approx_ParametrizationType Parametrization = Approx_ChordLength);
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	RelativeTol(Standard_Boolean)
	DegMin(Standard_Integer)
	DegMax(Standard_Integer)
	NbIterMax(Standard_Integer)
	NbPntMax(Standard_Integer)
	ApproxWithTangency(Standard_Boolean)=Standard_True
	Parametrization(Approx_ParametrizationType)=Approx_ChordLength

Returns:
	None

No detailed docstring for this function.") SetParameters;
		void SetParameters (const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Boolean RelativeTol,const Standard_Integer DegMin,const Standard_Integer DegMax,const Standard_Integer NbIterMax,const Standard_Integer NbPntMax,const Standard_Boolean ApproxWithTangency = Standard_True,const Approx_ParametrizationType Parametrization = Approx_ChordLength);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TolReached3d;
		Standard_Real TolReached3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TolReached2d;
		Standard_Real TolReached2d ();
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

No detailed docstring for this function.") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiBSpCurve & Value (const Standard_Integer Index);
};


%feature("shadow") BRepApprox_Approx::~BRepApprox_Approx %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_Approx {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ApproxLine;
class BRepApprox_ApproxLine : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	CurveXYZ(Handle_Geom_BSplineCurve)
	CurveUV1(Handle_Geom2d_BSplineCurve)
	CurveUV2(Handle_Geom2d_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine (const Handle_Geom_BSplineCurve & CurveXYZ,const Handle_Geom2d_BSplineCurve & CurveUV1,const Handle_Geom2d_BSplineCurve & CurveUV2);
		%feature("autodoc", "Args:
	lin(Handle_IntSurf_LineOn2S)
	Tang(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine (const Handle_IntSurf_LineOn2S & lin,const Standard_Boolean Tang);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPnts;
		Standard_Integer NbPnts ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") Point;
		IntSurf_PntOn2S Point (const Standard_Integer Index);
};


%feature("shadow") BRepApprox_ApproxLine::~BRepApprox_ApproxLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ApproxLine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepApprox_ApproxLine {
	Handle_BRepApprox_ApproxLine GetHandle() {
	return *(Handle_BRepApprox_ApproxLine*) &$self;
	}
};

%nodefaultctor Handle_BRepApprox_ApproxLine;
class Handle_BRepApprox_ApproxLine : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepApprox_ApproxLine();
        Handle_BRepApprox_ApproxLine(const Handle_BRepApprox_ApproxLine &aHandle);
        Handle_BRepApprox_ApproxLine(const BRepApprox_ApproxLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepApprox_ApproxLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepApprox_ApproxLine {
    BRepApprox_ApproxLine* GetObject() {
    return (BRepApprox_ApproxLine*)$self->Access();
    }
};
%feature("shadow") Handle_BRepApprox_ApproxLine::~Handle_BRepApprox_ApproxLine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepApprox_ApproxLine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox : public math_BFGS {
	public:
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithGradient)
	StartingPoint(math_Vector)
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)
	Eps(Standard_Real)
	NbIterations(Standard_Integer)=200

Returns:
	None

No detailed docstring for this function.") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithGradient)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%feature("shadow") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox::~BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Parameters(math_Vector)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(math_Vector)
	G(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(Standard_Real)
	G(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("autodoc", "Args:
	None
Returns:
	math_Vector

No detailed docstring for this function.") NewParameters;
		const math_Vector & NewParameters ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue ();
		%feature("autodoc", "Args:
	IPoint(Standard_Integer)
	CurveIndex(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	math_IntegerVector

No detailed docstring for this function.") Index;
		const math_IntegerVector & Index ();
		%feature("autodoc", "Args:
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	FirstPoint(Standard_Integer)

Returns:
	AppParCurves_Constraint

No detailed docstring for this function.") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("autodoc", "Args:
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	LastPoint(Standard_Integer)

Returns:
	AppParCurves_Constraint

No detailed docstring for this function.") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
		%feature("autodoc", "Args:
	l1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetFirstLambda;
		void SetFirstLambda (const Standard_Real l1);
		%feature("autodoc", "Args:
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetLastLambda;
		void SetLastLambda (const Standard_Real l2);
};


%feature("shadow") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox::~BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Parameters(math_Vector)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Parameters(math_Vector)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	Parameters(math_Vector)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	V1t(math_Vector)
	V2t(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	V1t(math_Vector)
	V2t(math_Vector)
	V1c(math_Vector)
	V2c(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("autodoc", "Args:
	Grad(math_Vector)
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Distance;
		const math_Matrix & Distance ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastLambda;
		Standard_Real LastLambda ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Points;
		const math_Matrix & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Poles;
		const math_Matrix & Poles ();
		%feature("autodoc", "Args:
	None
Returns:
	math_IntegerVector

No detailed docstring for this function.") KIndex;
		const math_IntegerVector & KIndex ();
};


%feature("shadow") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox::~BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox : public math_BFGS {
	public:
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithGradient)
	StartingPoint(math_Vector)
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)
	Eps(Standard_Real)
	NbIterations(Standard_Integer)=200

Returns:
	None

No detailed docstring for this function.") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithGradient)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%feature("shadow") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox::~BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox : public math_BFGS {
	public:
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithGradient)
	StartingPoint(math_Vector)
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)
	Eps(Standard_Real)
	NbIterations(Standard_Integer)=200

Returns:
	None

No detailed docstring for this function.") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithGradient)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%feature("shadow") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox::~BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_MyBSplGradientOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Parameters(math_Vector)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Deg(Standard_Integer)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	NbIterations(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 1);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Parameters(math_Vector)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Deg(Standard_Integer)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	NbIterations(Standard_Integer)
	lambda1(Standard_Real)
	lambda2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations,const Standard_Real lambda1,const Standard_Real lambda2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") Value;
		AppParCurves_MultiBSpCurve Value ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") AverageError;
		Standard_Real AverageError ();
};


%feature("shadow") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox::~BRepApprox_MyBSplGradientOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_MyBSplGradientOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_MyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Parameters(math_Vector)
	Deg(Standard_Integer)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	NbIterations(Standard_Integer)=200

Returns:
	None

No detailed docstring for this function.") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_MyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		AppParCurves_MultiCurve Value ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") AverageError;
		Standard_Real AverageError ();
};


%feature("shadow") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox::~BRepApprox_MyGradientOfTheComputeLineBezierOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_MyGradientOfTheComputeLineBezierOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_MyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Parameters(math_Vector)
	Deg(Standard_Integer)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	NbIterations(Standard_Integer)=200

Returns:
	None

No detailed docstring for this function.") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_MyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		AppParCurves_MultiCurve Value ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") AverageError;
		Standard_Real AverageError ();
};


%feature("shadow") BRepApprox_MyGradientbisOfTheComputeLineOfApprox::~BRepApprox_MyGradientbisOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_MyGradientbisOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Parameters(math_Vector)
	Deg(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(math_Vector)
	G(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(Standard_Real)
	G(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("autodoc", "Args:
	None
Returns:
	math_Vector

No detailed docstring for this function.") NewParameters;
		const math_Vector & NewParameters ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("autodoc", "Args:
	IPoint(Standard_Integer)
	CurveIndex(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("autodoc", "Args:
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	FirstPoint(Standard_Integer)

Returns:
	AppParCurves_Constraint

No detailed docstring for this function.") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("autodoc", "Args:
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	LastPoint(Standard_Integer)

Returns:
	AppParCurves_Constraint

No detailed docstring for this function.") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
};


%feature("shadow") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox::~BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Parameters(math_Vector)
	Deg(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(math_Vector)
	G(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(Standard_Real)
	G(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("autodoc", "Args:
	None
Returns:
	math_Vector

No detailed docstring for this function.") NewParameters;
		const math_Vector & NewParameters ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("autodoc", "Args:
	IPoint(Standard_Integer)
	CurveIndex(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("autodoc", "Args:
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	FirstPoint(Standard_Integer)

Returns:
	AppParCurves_Constraint

No detailed docstring for this function.") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("autodoc", "Args:
	TheConstraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	LastPoint(Standard_Integer)

Returns:
	AppParCurves_Constraint

No detailed docstring for this function.") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
};


%feature("shadow") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox::~BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Parameters(math_Vector)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Parameters(math_Vector)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	Parameters(math_Vector)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	V1t(math_Vector)
	V2t(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	V1t(math_Vector)
	V2t(math_Vector)
	V1c(math_Vector)
	V2c(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("autodoc", "Args:
	Grad(math_Vector)
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Distance;
		const math_Matrix & Distance ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastLambda;
		Standard_Real LastLambda ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Points;
		const math_Matrix & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Poles;
		const math_Matrix & Poles ();
		%feature("autodoc", "Args:
	None
Returns:
	math_IntegerVector

No detailed docstring for this function.") KIndex;
		const math_IntegerVector & KIndex ();
};


%feature("shadow") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox::~BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Parameters(math_Vector)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Parameters(math_Vector)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	NbPol(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("autodoc", "Args:
	Parameters(math_Vector)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	V1t(math_Vector)
	V2t(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	V1t(math_Vector)
	V2t(math_Vector)
	V1c(math_Vector)
	V2c(math_Vector)
	l1(Standard_Real)
	l2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("autodoc", "Args:
	Grad(math_Vector)
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Distance;
		const math_Matrix & Distance ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastLambda;
		Standard_Real LastLambda ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Points;
		const math_Matrix & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") Poles;
		const math_Matrix & Poles ();
		%feature("autodoc", "Args:
	None
Returns:
	math_IntegerVector

No detailed docstring for this function.") KIndex;
		const math_IntegerVector & KIndex ();
};


%feature("shadow") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox::~BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	SCurv(AppParCurves_MultiCurve)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	Constraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Bern(math_Matrix)
	DerivativeBern(math_Matrix)
	Tolerance(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Vector

No detailed docstring for this function.") Duale;
		const math_Vector & Duale ();
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Parameters(math_Vector)
	Deg(Standard_Integer)
	DA(math_Matrix)

Returns:
	math_Matrix

No detailed docstring for this function.") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const BRepApprox_TheMultiLineOfApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") InverseMatrix;
		const math_Matrix & InverseMatrix ();
};


%feature("shadow") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox::~BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	SCurv(AppParCurves_MultiCurve)
	FirstPoint(Standard_Integer)
	LastPoint(Standard_Integer)
	Constraints(Handle_AppParCurves_HArray1OfConstraintCouple)
	Bern(math_Matrix)
	DerivativeBern(math_Matrix)
	Tolerance(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	math_Vector

No detailed docstring for this function.") Duale;
		const math_Vector & Duale ();
		%feature("autodoc", "Args:
	SSP(BRepApprox_TheMultiLineOfApprox)
	Parameters(math_Vector)
	Deg(Standard_Integer)
	DA(math_Matrix)

Returns:
	math_Matrix

No detailed docstring for this function.") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const BRepApprox_TheMultiLineOfApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);
		%feature("autodoc", "Args:
	None
Returns:
	math_Matrix

No detailed docstring for this function.") InverseMatrix;
		const math_Matrix & InverseMatrix ();
};


%feature("shadow") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox::~BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_SurfaceTool;
class BRepApprox_SurfaceTool {
	public:
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstUParameter;
		static Standard_Real FirstUParameter (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstVParameter;
		static Standard_Real FirstVParameter (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastUParameter;
		static Standard_Real LastUParameter (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastVParameter;
		static Standard_Real LastVParameter (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	Sh(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbUIntervals;
		static Standard_Integer NbUIntervals (const BRepAdaptor_Surface & S,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	Sh(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbVIntervals;
		static Standard_Integer NbVIntervals (const BRepAdaptor_Surface & S,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	T(TColStd_Array1OfReal)
	Sh(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") UIntervals;
		static void UIntervals (const BRepAdaptor_Surface & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	T(TColStd_Array1OfReal)
	Sh(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") VIntervals;
		static void VIntervals (const BRepAdaptor_Surface & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Handle_Adaptor3d_HSurface

No detailed docstring for this function.") UTrim;
		static Handle_Adaptor3d_HSurface UTrim (const BRepAdaptor_Surface & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Handle_Adaptor3d_HSurface

No detailed docstring for this function.") VTrim;
		static Handle_Adaptor3d_HSurface VTrim (const BRepAdaptor_Surface & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		static Standard_Boolean IsUClosed (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		static Standard_Boolean IsVClosed (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		static Standard_Boolean IsUPeriodic (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Real

No detailed docstring for this function.") UPeriod;
		static Standard_Real UPeriod (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		static Standard_Boolean IsVPeriodic (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Real

No detailed docstring for this function.") VPeriod;
		static Standard_Real VPeriod (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const BRepAdaptor_Surface & S,const Standard_Real u,const Standard_Real v);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const BRepAdaptor_Surface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)
	D1u(gp_Vec)
	D1v(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const BRepAdaptor_Surface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1u,gp_Vec & D1v);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const BRepAdaptor_Surface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const BRepAdaptor_Surface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	u(Standard_Real)
	v(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const BRepAdaptor_Surface & S,const Standard_Real u,const Standard_Real v,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") UResolution;
		static Standard_Real UResolution (const BRepAdaptor_Surface & S,const Standard_Real R3d);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") VResolution;
		static Standard_Real VResolution (const BRepAdaptor_Surface & S,const Standard_Real R3d);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static GeomAbs_SurfaceType

No detailed docstring for this function.") GetType;
		static GeomAbs_SurfaceType GetType (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static gp_Pln

No detailed docstring for this function.") Plane;
		static gp_Pln Plane (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static gp_Cylinder

No detailed docstring for this function.") Cylinder;
		static gp_Cylinder Cylinder (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static gp_Cone

No detailed docstring for this function.") Cone;
		static gp_Cone Cone (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static gp_Torus

No detailed docstring for this function.") Torus;
		static gp_Torus Torus (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static gp_Sphere

No detailed docstring for this function.") Sphere;
		static gp_Sphere Sphere (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierSurface Bezier (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Handle_Geom_BSplineSurface

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineSurface BSpline (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static gp_Dir

No detailed docstring for this function.") Direction;
		static gp_Dir Direction (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Handle_Adaptor3d_HCurve

No detailed docstring for this function.") BasisCurve;
		static Handle_Adaptor3d_HCurve BasisCurve (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
		static Standard_Integer NbSamplesV (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	u1(Standard_Real)
	u2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const BRepAdaptor_Surface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	v1(Standard_Real)
	v2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
		static Standard_Integer NbSamplesV (const BRepAdaptor_Surface & S,const Standard_Real v1,const Standard_Real v2);
};


%feature("shadow") BRepApprox_SurfaceTool::~BRepApprox_SurfaceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_SurfaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheComputeLineBezierOfApprox;
class BRepApprox_TheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "Args:
	Line(BRepApprox_TheMultiLineOfApprox)
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-3
	Tolerance2d(Standard_Real)=1.0e-6
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	parametrization(Approx_ParametrizationType)=Approx_ChordLength
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	Line(BRepApprox_TheMultiLineOfApprox)
	Parameters(math_Vector)
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	parametrization(Approx_ParametrizationType)=Approx_ChordLength
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	parametrization(Approx_ParametrizationType)=Approx_ChordLength
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	Line(BRepApprox_TheMultiLineOfApprox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepApprox_TheMultiLineOfApprox & Line);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)
	degreemax(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("autodoc", "Args:
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("autodoc", "Args:
	firstC(AppParCurves_Constraint)
	lastC(AppParCurves_Constraint)

Returns:
	None

No detailed docstring for this function.") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)=1

Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index = 1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)=1

Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index = 1);
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") SplineValue;
		const AppParCurves_MultiBSpCurve & SplineValue ();
		%feature("autodoc", "Args:
	partype(Approx_ParametrizationType)

Returns:
	None

No detailed docstring for this function.") Parametrization;
		void Parametrization (Approx_ParametrizationType & partype);
		%feature("autodoc", "Args:
	Index(Standard_Integer)=1

Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Parameters;
		const TColStd_Array1OfReal & Parameters (const Standard_Integer Index = 1);
};


%feature("shadow") BRepApprox_TheComputeLineBezierOfApprox::~BRepApprox_TheComputeLineBezierOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheComputeLineBezierOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheComputeLineOfApprox;
class BRepApprox_TheComputeLineOfApprox {
	public:
		%feature("autodoc", "Args:
	Line(BRepApprox_TheMultiLineOfApprox)
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-3
	Tolerance2d(Standard_Real)=1.0e-6
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	parametrization(Approx_ParametrizationType)=Approx_ChordLength
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	Line(BRepApprox_TheMultiLineOfApprox)
	Parameters(math_Vector)
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	Parameters(math_Vector)
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	parametrization(Approx_ParametrizationType)=Approx_ChordLength
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	Line(BRepApprox_TheMultiLineOfApprox)

Returns:
	None

No detailed docstring for this function.") Interpol;
		void Interpol (const BRepApprox_TheMultiLineOfApprox & Line);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)=4
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-03
	Tolerance2d(Standard_Real)=1.0e-06
	NbIterations(Standard_Integer)=5
	cutting(Standard_Boolean)=Standard_True
	parametrization(Approx_ParametrizationType)=Approx_ChordLength
	Squares(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("autodoc", "Args:
	Line(BRepApprox_TheMultiLineOfApprox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepApprox_TheMultiLineOfApprox & Line);
		%feature("autodoc", "Args:
	ThePar(math_Vector)

Returns:
	None

No detailed docstring for this function.") SetParameters;
		void SetParameters (const math_Vector & ThePar);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & Knots);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") SetKnotsAndMultiplicities;
		void SetKnotsAndMultiplicities (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)
	degreemax(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("autodoc", "Args:
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("autodoc", "Args:
	C(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetContinuity;
		void SetContinuity (const Standard_Integer C);
		%feature("autodoc", "Args:
	firstC(AppParCurves_Constraint)
	lastC(AppParCurves_Constraint)

Returns:
	None

No detailed docstring for this function.") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("autodoc", "Args:
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiBSpCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

No detailed docstring for this function.") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Parameters;
		const TColStd_Array1OfReal & Parameters ();
};


%feature("shadow") BRepApprox_TheComputeLineOfApprox::~BRepApprox_TheComputeLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheComputeLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
class BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox ();
		%feature("autodoc", "Args:
	S1(BRepAdaptor_Surface)
	S2(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	ChoixIso(IntImp_ConstIsoparametric)
	Param(TColStd_Array1OfReal)
	UVap(math_Vector)
	BornInf(math_Vector)
	BornSup(math_Vector)
	Tolerance(math_Vector)

Returns:
	None

No detailed docstring for this function.") ComputeParameters;
		void ComputeParameters (const IntImp_ConstIsoparametric ChoixIso,const TColStd_Array1OfReal & Param,math_Vector & UVap,math_Vector & BornInf,math_Vector & BornSup,math_Vector & Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Root;
		Standard_Real Root ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		gp_Pnt Point ();
		%feature("autodoc", "Args:
	UVap(math_Vector)
	Param(TColStd_Array1OfReal)
	BestChoix(IntImp_ConstIsoparametric)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangent;
		Standard_Boolean IsTangent (const math_Vector & UVap,TColStd_Array1OfReal & Param,IntImp_ConstIsoparametric & BestChoix);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") DirectionOnS1;
		gp_Dir2d DirectionOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") DirectionOnS2;
		gp_Dir2d DirectionOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Surface

No detailed docstring for this function.") AuxillarSurface1;
		const BRepAdaptor_Surface & AuxillarSurface1 ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Surface

No detailed docstring for this function.") AuxillarSurface2;
		const BRepAdaptor_Surface & AuxillarSurface2 ();
};


%feature("shadow") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox::~BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheImpPrmSvSurfacesOfApprox;
class BRepApprox_TheImpPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("autodoc", "Args:
	Surf1(BRepAdaptor_Surface)
	Surf2(IntSurf_Quadric)

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & Surf1,const IntSurf_Quadric & Surf2);
		%feature("autodoc", "Args:
	Surf1(IntSurf_Quadric)
	Surf2(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox (const IntSurf_Quadric & Surf1,const BRepAdaptor_Surface & Surf2);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Pt(gp_Pnt)
	Tg(gp_Vec)
	Tguv1(gp_Vec2d)
	Tguv2(gp_Vec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%feature("shadow") BRepApprox_TheImpPrmSvSurfacesOfApprox::~BRepApprox_TheImpPrmSvSurfacesOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheImpPrmSvSurfacesOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ();
		%feature("autodoc", "Args:
	Param(TColStd_Array1OfReal)
	S1(BRepAdaptor_Surface)
	S2(BRepAdaptor_Surface)
	TolTangency(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox (const TColStd_Array1OfReal & Param,const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const Standard_Real TolTangency);
		%feature("autodoc", "Args:
	S1(BRepAdaptor_Surface)
	S2(BRepAdaptor_Surface)
	TolTangency(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const Standard_Real TolTangency);
		%feature("autodoc", "Args:
	Param(TColStd_Array1OfReal)
	Rsnld(math_FunctionSetRoot)

Returns:
	IntImp_ConstIsoparametric

No detailed docstring for this function.") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld);
		%feature("autodoc", "Args:
	Param(TColStd_Array1OfReal)
	Rsnld(math_FunctionSetRoot)
	ChoixIso(IntImp_ConstIsoparametric)

Returns:
	IntImp_ConstIsoparametric

No detailed docstring for this function.") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld,const IntImp_ConstIsoparametric ChoixIso);
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

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") Point;
		const IntSurf_PntOn2S & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") DirectionOnS1;
		const gp_Dir2d & DirectionOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") DirectionOnS2;
		const gp_Dir2d & DirectionOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox

No detailed docstring for this function.") Function;
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox & Function ();
};


%feature("shadow") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox::~BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheMultiLineOfApprox;
class BRepApprox_TheMultiLineOfApprox {
	public:
		%feature("autodoc", "Args:
	line(Handle_BRepApprox_ApproxLine)
	PtrSvSurfaces(Standard_Address)
	NbP3d(Standard_Integer)
	NbP2d(Standard_Integer)
	xo(Standard_Real)
	ax(Standard_Real)
	yo(Standard_Real)
	ay(Standard_Real)
	zo(Standard_Real)
	az(Standard_Real)
	u1o(Standard_Real)
	a1u(Standard_Real)
	v1o(Standard_Real)
	a1v(Standard_Real)
	u2o(Standard_Real)
	a2u(Standard_Real)
	v2o(Standard_Real)
	a2v(Standard_Real)
	P2DOnFirst(Standard_Boolean)
	IndMin(Standard_Integer)=0
	IndMax(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox (const Handle_BRepApprox_ApproxLine & line,const Standard_Address PtrSvSurfaces,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Real xo,const Standard_Real ax,const Standard_Real yo,const Standard_Real ay,const Standard_Real zo,const Standard_Real az,const Standard_Real u1o,const Standard_Real a1u,const Standard_Real v1o,const Standard_Real a1v,const Standard_Real u2o,const Standard_Real a2u,const Standard_Real v2o,const Standard_Real a2v,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("autodoc", "Args:
	line(Handle_BRepApprox_ApproxLine)
	NbP3d(Standard_Integer)
	NbP2d(Standard_Integer)
	xo(Standard_Real)
	ax(Standard_Real)
	yo(Standard_Real)
	ay(Standard_Real)
	zo(Standard_Real)
	az(Standard_Real)
	u1o(Standard_Real)
	a1u(Standard_Real)
	v1o(Standard_Real)
	a1v(Standard_Real)
	u2o(Standard_Real)
	a2u(Standard_Real)
	v2o(Standard_Real)
	a2v(Standard_Real)
	P2DOnFirst(Standard_Boolean)
	IndMin(Standard_Integer)=0
	IndMax(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox (const Handle_BRepApprox_ApproxLine & line,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Real xo,const Standard_Real ax,const Standard_Real yo,const Standard_Real ay,const Standard_Real zo,const Standard_Real az,const Standard_Real u1o,const Standard_Real a1u,const Standard_Real v1o,const Standard_Real a1v,const Standard_Real u2o,const Standard_Real a2u,const Standard_Real v2o,const Standard_Real a2v,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LastPoint;
		Standard_Integer LastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbP2d;
		Standard_Integer NbP2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbP3d;
		Standard_Integer NbP3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Approx_Status

No detailed docstring for this function.") WhatStatus;
		Approx_Status WhatStatus ();
		%feature("autodoc", "Args:
	MPointIndex(Standard_Integer)
	tabPt(TColgp_Array1OfPnt)

Returns:
	None

No detailed docstring for this function.") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("autodoc", "Args:
	MPointIndex(Standard_Integer)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	None

No detailed docstring for this function.") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	MPointIndex(Standard_Integer)
	tabPt(TColgp_Array1OfPnt)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	None

No detailed docstring for this function.") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	MPointIndex(Standard_Integer)
	tabV(TColgp_Array1OfVec)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("autodoc", "Args:
	MPointIndex(Standard_Integer)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	MPointIndex(Standard_Integer)
	tabV(TColgp_Array1OfVec)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	High(Standard_Integer)
	NbPointsToInsert(Standard_Integer)

Returns:
	BRepApprox_TheMultiLineOfApprox

No detailed docstring for this function.") MakeMLBetween;
		BRepApprox_TheMultiLineOfApprox MakeMLBetween (const Standard_Integer Low,const Standard_Integer High,const Standard_Integer NbPointsToInsert);
};


%feature("shadow") BRepApprox_TheMultiLineOfApprox::~BRepApprox_TheMultiLineOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheMultiLineOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheMultiLineToolOfApprox;
class BRepApprox_TheMultiLineToolOfApprox {
	public:
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)

Returns:
	static Standard_Integer

No detailed docstring for this function.") FirstPoint;
		static Standard_Integer FirstPoint (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)

Returns:
	static Standard_Integer

No detailed docstring for this function.") LastPoint;
		static Standard_Integer LastPoint (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbP2d;
		static Standard_Integer NbP2d (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbP3d;
		static Standard_Integer NbP3d (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabPt(TColgp_Array1OfPnt)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabPt(TColgp_Array1OfPnt)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabV(TColgp_Array1OfVec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabV(TColgp_Array1OfVec)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabV(TColgp_Array1OfVec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	MPointIndex(Standard_Integer)
	tabV(TColgp_Array1OfVec)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	I1(Standard_Integer)
	I2(Standard_Integer)
	NbPMin(Standard_Integer)

Returns:
	static BRepApprox_TheMultiLineOfApprox

No detailed docstring for this function.") MakeMLBetween;
		static BRepApprox_TheMultiLineOfApprox MakeMLBetween (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer NbPMin);
		%feature("autodoc", "Args:
	ML(BRepApprox_TheMultiLineOfApprox)
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	static Approx_Status

No detailed docstring for this function.") WhatStatus;
		static Approx_Status WhatStatus (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer I1,const Standard_Integer I2);
};


%feature("shadow") BRepApprox_TheMultiLineToolOfApprox::~BRepApprox_TheMultiLineToolOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheMultiLineToolOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_ThePrmPrmSvSurfacesOfApprox;
class BRepApprox_ThePrmPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("autodoc", "Args:
	Surf1(BRepAdaptor_Surface)
	Surf2(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_ThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & Surf1,const BRepAdaptor_Surface & Surf2);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Pt(gp_Pnt)
	Tg(gp_Vec)
	Tguv1(gp_Vec2d)
	Tguv2(gp_Vec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%feature("shadow") BRepApprox_ThePrmPrmSvSurfacesOfApprox::~BRepApprox_ThePrmPrmSvSurfacesOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_ThePrmPrmSvSurfacesOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
class BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ();
		%feature("autodoc", "Args:
	PS(BRepAdaptor_Surface)
	IS(IntSurf_Quadric)

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & PS,const IntSurf_Quadric & IS);
		%feature("autodoc", "Args:
	IS(IntSurf_Quadric)

Returns:
	None

No detailed docstring for this function.") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox (const IntSurf_Quadric & IS);
		%feature("autodoc", "Args:
	PS(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const BRepAdaptor_Surface & PS);
		%feature("autodoc", "Args:
	IS(IntSurf_Quadric)

Returns:
	None

No detailed docstring for this function.") SetImplicitSurface;
		void SetImplicitSurface (const IntSurf_Quadric & IS);
		%feature("autodoc", "Args:
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Root;
		Standard_Real Root ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") Direction3d;
		const gp_Vec & Direction3d ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") Direction2d;
		const gp_Dir2d & Direction2d ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Surface

No detailed docstring for this function.") PSurface;
		const BRepAdaptor_Surface & PSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Quadric

No detailed docstring for this function.") ISurface;
		const IntSurf_Quadric & ISurface ();
};


%feature("shadow") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox::~BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox {
	void _kill_pointed() {
		delete $self;
	}
};
