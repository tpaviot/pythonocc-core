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
%module (package="OCC") BRepBlend

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

%include BRepBlend_headers.i

/* typedefs */
typedef BlendFunc_Chamfer BRepBlend_Chamfer;
typedef BlendFunc_CSConstRad BRepBlend_CSConstRad;
typedef BlendFunc_ChAsym BRepBlend_ChAsym;
typedef BlendFunc_ConstRad BRepBlend_ConstRad;
typedef BlendFunc_ChAsymInv BRepBlend_ChAsymInv;
typedef BlendFunc_Ruled BRepBlend_Ruled;
typedef BlendFunc_ChamfInv BRepBlend_ChamfInv;
typedef BlendFunc_RuledInv BRepBlend_RuledInv;
typedef BlendFunc_EvolRad BRepBlend_EvolRad;
typedef BlendFunc_CSCircular BRepBlend_CSCircular;
typedef BlendFunc_ConstRadInv BRepBlend_ConstRadInv;
typedef BlendFunc_EvolRadInv BRepBlend_EvolRadInv;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepBlend_AppFuncRoot;
class BRepBlend_AppFuncRoot : public Approx_SweepFunction {
	public:
		%feature("autodoc", "Args:
	Param(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

compute the section for v = param") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

compute the first  derivative in v direction  of the  
          section for v =  param") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

compute the second derivative  in v direction of the  
         section  for v = param") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

get the number of 2d curves to  approximate.") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)

Returns:
	virtual void

get the format of an  section") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	virtual void

get the Knots of the section") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

get the Multplicities of the section") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns if the section is rationnal or not") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual void

Sets the bounds of the parametric interval on  
         the fonction  
         This determines the derivatives in these values if the  
         function is not Cn.") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Tol(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	virtual void

Returns the resolutions in the  sub-space 2d <Index> --  
         This information is usfull to find an good tolerance in  
         2d approximation") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(TColStd_Array1OfReal)

Returns:
	virtual void

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary (in radian)  
         SurfTol error inside the surface.") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	virtual void

Is usfull, if (me) have to  be run numerical  
          algorithme to perform D0, D1 or D2") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pnt

Get    the   barycentre of   Surface.   An   very  poor  
         estimation is sufficent. This information is usefull  
         to perform well conditionned rational approximation.") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the   length of the maximum section. This  
         information is usefull to perform well conditionned rational  
         approximation.") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the minimal value of weight for each poles  
         of all  sections.  This information is  usefull to  
         perform well conditionned rational approximation.") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	Func(Blend_AppFunction)
	Param(Standard_Real)
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	virtual void

No detailed docstring for this function.") Point;
		virtual void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	virtual void

No detailed docstring for this function.") Vec;
		virtual void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%feature("shadow") BRepBlend_AppFuncRoot::~BRepBlend_AppFuncRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_AppFuncRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBlend_AppFuncRoot {
	Handle_BRepBlend_AppFuncRoot GetHandle() {
	return *(Handle_BRepBlend_AppFuncRoot*) &$self;
	}
};

%nodefaultctor Handle_BRepBlend_AppFuncRoot;
class Handle_BRepBlend_AppFuncRoot : public Handle_Approx_SweepFunction {

    public:
        // constructors
        Handle_BRepBlend_AppFuncRoot();
        Handle_BRepBlend_AppFuncRoot(const Handle_BRepBlend_AppFuncRoot &aHandle);
        Handle_BRepBlend_AppFuncRoot(const BRepBlend_AppFuncRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBlend_AppFuncRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBlend_AppFuncRoot {
    BRepBlend_AppFuncRoot* GetObject() {
    return (BRepBlend_AppFuncRoot*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBlend_AppFuncRoot::~Handle_BRepBlend_AppFuncRoot %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBlend_AppFuncRoot {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepBlend_AppSurf;
class BRepBlend_AppSurf : public AppBlend_Approx {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBlend_AppSurf;
		 BRepBlend_AppSurf ();
		%feature("autodoc", "Args:
	Degmin(Standard_Integer)
	Degmax(Standard_Integer)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	NbIt(Standard_Integer)
	KnownParameters(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepBlend_AppSurf;
		 BRepBlend_AppSurf (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("autodoc", "Args:
	Degmin(Standard_Integer)
	Degmax(Standard_Integer)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	NbIt(Standard_Integer)
	KnownParameters(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("autodoc", "Args:
	ParType(Approx_ParametrizationType)

Returns:
	None

No detailed docstring for this function.") SetParType;
		void SetParType (const Approx_ParametrizationType ParType);
		%feature("autodoc", "Args:
	C(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") SetContinuity;
		void SetContinuity (const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	W1(Standard_Real)
	W2(Standard_Real)
	W3(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real W1,const Standard_Real W2,const Standard_Real W3);
		%feature("autodoc", "Args:
	None
Returns:
	Approx_ParametrizationType

No detailed docstring for this function.") ParType;
		Approx_ParametrizationType ParType ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	W1(Standard_Real)
	W2(Standard_Real)
	W3(Standard_Real)

Returns:
	None

No detailed docstring for this function.") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Lin(Handle_BRepBlend_Line)
	SecGen(Blend_AppFunction)
	SpApprox(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen,const Standard_Boolean SpApprox = Standard_False);
		%feature("autodoc", "Args:
	Lin(Handle_BRepBlend_Line)
	SecGen(Blend_AppFunction)

Returns:
	None

No detailed docstring for this function.") PerformSmoothing;
		void PerformSmoothing (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen);
		%feature("autodoc", "Args:
	Lin(Handle_BRepBlend_Line)
	SecGen(Blend_AppFunction)
	NbMaxP(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen,const Standard_Integer NbMaxP);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	NbUPoles(Standard_Integer)
	NbVPoles(Standard_Integer)
	NbUKnots(Standard_Integer)
	NbVKnots(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	TPoles(TColgp_Array2OfPnt)
	TWeights(TColStd_Array2OfReal)
	TUKnots(TColStd_Array1OfReal)
	TVKnots(TColStd_Array1OfReal)
	TUMults(TColStd_Array1OfInteger)
	TVMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array2OfPnt

No detailed docstring for this function.") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	TPoles(TColgp_Array1OfPnt2d)
	TKnots(TColStd_Array1OfReal)
	TMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColgp_Array1OfPnt2d

No detailed docstring for this function.") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);
};


%feature("shadow") BRepBlend_AppSurf::~BRepBlend_AppSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_AppSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_AppSurface;
class BRepBlend_AppSurface : public AppBlend_Approx {
	public:
		%feature("autodoc", "Args:
	Funct(Handle_Approx_SweepFunction)
	First(Standard_Real)
	Last(Standard_Real)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	TolAngular(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C0
	Degmax(Standard_Integer)=11
	Segmax(Standard_Integer)=50

Returns:
	None

Approximation     of   the   new  Surface  (and  
         eventually the  2d    Curves   on the   support  
         surfaces).  
         Normaly     the  2d    curve are  
         approximated  with an  tolerance   given  by   the  
         resolution on   support surfaces,  but  if this  
         tolerance is too large Tol2d  is used.") BRepBlend_AppSurface;
		 BRepBlend_AppSurface (Handle_Approx_SweepFunction & Funct,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Real TolAngular,const GeomAbs_Shape Continuity = GeomAbs_C0,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 50);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	NbUPoles(Standard_Integer)
	NbVPoles(Standard_Integer)
	NbUKnots(Standard_Integer)
	NbVKnots(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	TPoles(TColgp_Array2OfPnt)
	TWeights(TColStd_Array2OfReal)
	TUKnots(TColStd_Array1OfReal)
	TVKnots(TColStd_Array1OfReal)
	TUMults(TColStd_Array1OfInteger)
	TVMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array2OfPnt

No detailed docstring for this function.") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the maximum error in the suface approximation.") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	TPoles(TColgp_Array1OfPnt2d)
	TKnots(TColStd_Array1OfReal)
	TMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColgp_Array1OfPnt2d

No detailed docstring for this function.") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the maximum error in the <Index> 2d curve approximation.") Max2dError;
		Standard_Real Max2dError (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%feature("shadow") BRepBlend_AppSurface::~BRepBlend_AppSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_AppSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_BlendTool;
class BRepBlend_BlendTool {
	public:
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor2d_HCurve2d)
	Paramproj(Standard_Real)
	Dist(Standard_Real)

Returns:
	static Standard_Boolean

Projects the point P on the arc C.  
         If the methods returns Standard_True, the projection is  
         successful, and Paramproj is the parameter on the arc  
         of the projected point, Dist is the distance between  
         P and the curve..  
         If the method returns Standard_False, Param proj and Dist  
         are not significant.") Project;
		static Standard_Boolean Project (const gp_Pnt2d & P,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor2d_HCurve2d)
	Param(Standard_Real)
	Dist(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Inters;
		static Standard_Boolean Inters (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)
	A(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

Returns the parameter of the vertex V on the edge A.") Parameter;
		static Standard_Real Parameter (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)
	A(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

Returns the parametric tolerance on the arc A  
         used to consider that the vertex and another point meet,  
         i-e if Abs(Parameter(Vertex)-Parameter(OtherPnt))<=  
         Tolerance, the points are 'merged'.") Tolerance;
		static Standard_Real Tolerance (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SingularOnUMin;
		static Standard_Boolean SingularOnUMin (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SingularOnUMax;
		static Standard_Boolean SingularOnUMax (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SingularOnVMin;
		static Standard_Boolean SingularOnVMin (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SingularOnVMax;
		static Standard_Boolean SingularOnVMax (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	u1(Standard_Real)
	u2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	v1(Standard_Real)
	v2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Ufirst(Standard_Real)
	Ulast(Standard_Real)

Returns:
	static void

Returns the parametric limits on the arc C.  
         These limits must be finite : they are either  
         the real limits of the arc, for a finite arc,  
         or a bounding box for an infinite arc.") Bounds;
		static void Bounds (const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") CurveOnSurf;
		static Handle_Adaptor2d_HCurve2d CurveOnSurf (const Handle_Adaptor2d_HCurve2d & C,const Handle_Adaptor3d_HSurface & S);
};


%feature("shadow") BRepBlend_BlendTool::~BRepBlend_BlendTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_BlendTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_CSWalking;
class BRepBlend_CSWalking {
	public:
		%feature("autodoc", "Args:
	Curv(Handle_Adaptor3d_HCurve)
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)

Returns:
	None

No detailed docstring for this function.") BRepBlend_CSWalking;
		 BRepBlend_CSWalking (const Handle_Adaptor3d_HCurve & Curv,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain);
		%feature("autodoc", "Args:
	F(Blend_CSFunction)
	Pdep(Standard_Real)
	Pmax(Standard_Real)
	MaxStep(Standard_Real)
	TolGuide(Standard_Real)
	Soldep(math_Vector)
	Tolesp(Standard_Real)
	Fleche(Standard_Real)
	Appro(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Blend_CSFunction & F,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "Args:
	F(Blend_CSFunction)
	Pmin(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Complete;
		Standard_Boolean Complete (Blend_CSFunction & F,const Standard_Real Pmin);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") Line;
		const Handle_BRepBlend_Line & Line ();
};


%feature("shadow") BRepBlend_CSWalking::~BRepBlend_CSWalking %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_CSWalking {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_CurvPointRadInv;
class BRepBlend_CurvPointRadInv : public Blend_CurvPointFuncInv {
	public:
		%feature("autodoc", "Args:
	C1(Handle_Adaptor3d_HCurve)
	C2(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") BRepBlend_CurvPointRadInv;
		 BRepBlend_CurvPointRadInv (const Handle_Adaptor3d_HCurve & C1,const Handle_Adaptor3d_HCurve & C2);
		%feature("autodoc", "Args:
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns 2.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Set the Point on which a solution has to be found.") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") BRepBlend_CurvPointRadInv::~BRepBlend_CurvPointRadInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_CurvPointRadInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_Extremity;
class BRepBlend_Extremity {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBlend_Extremity;
		 BRepBlend_Extremity ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)
	Param(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBlend_Extremity;
		 BRepBlend_Extremity (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)
	Param(Standard_Real)
	Tol(Standard_Real)
	Vtx(Handle_Adaptor3d_HVertex)

Returns:
	None

No detailed docstring for this function.") BRepBlend_Extremity;
		 BRepBlend_Extremity (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & Vtx);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	W(Standard_Real)
	Param(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBlend_Extremity;
		 BRepBlend_Extremity (const gp_Pnt & P,const Standard_Real W,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)
	Param(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)
	Param(Standard_Real)
	Tol(Standard_Real)
	Vtx(Handle_Adaptor3d_HVertex)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & Vtx);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	W(Standard_Real)
	Param(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real W,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	Tangent(gp_Vec)

Returns:
	None

No detailed docstring for this function.") SetTangent;
		void SetTangent (const gp_Vec & Tangent);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasTangent;
		Standard_Boolean HasTangent ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") Tangent;
		const gp_Vec & Tangent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)

Returns:
	None

No detailed docstring for this function.") SetVertex;
		void SetVertex (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)
	Param(Standard_Real)
	TLine(IntSurf_Transition)
	TArc(IntSurf_Transition)

Returns:
	None

No detailed docstring for this function.") AddArc;
		void AddArc (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HVertex

No detailed docstring for this function.") Vertex;
		const Handle_Adaptor3d_HVertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPointOnRst;
		Standard_Integer NbPointOnRst ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepBlend_PointOnRst

No detailed docstring for this function.") PointOnRst;
		const BRepBlend_PointOnRst & PointOnRst (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnGuide;
		Standard_Real ParameterOnGuide ();
};


%feature("shadow") BRepBlend_Extremity::~BRepBlend_Extremity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_Extremity {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_HCurve2dTool;
class BRepBlend_HCurve2dTool {
	public:
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor2d_HCurve2d & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") Intervals;
		static void Intervals (const Handle_Adaptor2d_HCurve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Line;
		static gp_Lin2d Line (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Circ2d

No detailed docstring for this function.") Circle;
		static gp_Circ2d Circle (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Elips2d

No detailed docstring for this function.") Ellipse;
		static gp_Elips2d Ellipse (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr2d Hyperbola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Parab2d

No detailed docstring for this function.") Parabola;
		static gp_Parab2d Parabola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U0,const Standard_Real U1);
};


%feature("shadow") BRepBlend_HCurve2dTool::~BRepBlend_HCurve2dTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_HCurve2dTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_HCurveTool;
class BRepBlend_HCurveTool {
	public:
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor3d_HCurve & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") Intervals;
		static void Intervals (const Handle_Adaptor3d_HCurve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Handle_Adaptor3d_HCurve & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor3d_HCurve & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Lin

No detailed docstring for this function.") Line;
		static gp_Lin Line (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Circ

No detailed docstring for this function.") Circle;
		static gp_Circ Circle (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Elips

No detailed docstring for this function.") Ellipse;
		static gp_Elips Ellipse (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Hypr

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr Hyperbola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Parab

No detailed docstring for this function.") Parabola;
		static gp_Parab Parabola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Handle_Adaptor3d_HCurve & C,const Standard_Real U0,const Standard_Real U1);
};


%feature("shadow") BRepBlend_HCurveTool::~BRepBlend_HCurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_HCurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_Line;
class BRepBlend_Line : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBlend_Line;
		 BRepBlend_Line ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	P(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Blend_Point & P);
		%feature("autodoc", "Args:
	P(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Blend_Point & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(Blend_Point)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Blend_Point & P);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	TranS1(IntSurf_TypeTrans)
	TranS2(IntSurf_TypeTrans)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const IntSurf_TypeTrans TranS1,const IntSurf_TypeTrans TranS2);
		%feature("autodoc", "Args:
	Trans(IntSurf_TypeTrans)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const IntSurf_TypeTrans Trans);
		%feature("autodoc", "Args:
	StartPt1(BRepBlend_Extremity)
	StartPt2(BRepBlend_Extremity)

Returns:
	None

No detailed docstring for this function.") SetStartPoints;
		void SetStartPoints (const BRepBlend_Extremity & StartPt1,const BRepBlend_Extremity & StartPt2);
		%feature("autodoc", "Args:
	EndPt1(BRepBlend_Extremity)
	EndPt2(BRepBlend_Extremity)

Returns:
	None

No detailed docstring for this function.") SetEndPoints;
		void SetEndPoints (const BRepBlend_Extremity & EndPt1,const BRepBlend_Extremity & EndPt2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Blend_Point

No detailed docstring for this function.") Point;
		const Blend_Point & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_TypeTrans

No detailed docstring for this function.") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_TypeTrans

No detailed docstring for this function.") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBlend_Extremity

No detailed docstring for this function.") StartPointOnFirst;
		const BRepBlend_Extremity & StartPointOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBlend_Extremity

No detailed docstring for this function.") StartPointOnSecond;
		const BRepBlend_Extremity & StartPointOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBlend_Extremity

No detailed docstring for this function.") EndPointOnFirst;
		const BRepBlend_Extremity & EndPointOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBlend_Extremity

No detailed docstring for this function.") EndPointOnSecond;
		const BRepBlend_Extremity & EndPointOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_TypeTrans

No detailed docstring for this function.") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS ();
};


%feature("shadow") BRepBlend_Line::~BRepBlend_Line %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_Line {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBlend_Line {
	Handle_BRepBlend_Line GetHandle() {
	return *(Handle_BRepBlend_Line*) &$self;
	}
};

%nodefaultctor Handle_BRepBlend_Line;
class Handle_BRepBlend_Line : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepBlend_Line();
        Handle_BRepBlend_Line(const Handle_BRepBlend_Line &aHandle);
        Handle_BRepBlend_Line(const BRepBlend_Line *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBlend_Line DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBlend_Line {
    BRepBlend_Line* GetObject() {
    return (BRepBlend_Line*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBlend_Line::~Handle_BRepBlend_Line %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBlend_Line {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepBlend_PointOnRst;
class BRepBlend_PointOnRst {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst ();
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)
	Param(Standard_Real)
	TLine(IntSurf_Transition)
	TArc(IntSurf_Transition)

Returns:
	None

No detailed docstring for this function.") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)
	Param(Standard_Real)
	TLine(IntSurf_Transition)
	TArc(IntSurf_Transition)

Returns:
	None

No detailed docstring for this function.") SetArc;
		void SetArc (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnArc;
		Standard_Real ParameterOnArc ();
};


%feature("shadow") BRepBlend_PointOnRst::~BRepBlend_PointOnRst %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_PointOnRst {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_RstRstConstRad;
class BRepBlend_RstRstConstRad : public Blend_RstRstFunction {
	public:
		%feature("autodoc", "Args:
	Surf1(Handle_Adaptor3d_HSurface)
	Rst1(Handle_Adaptor2d_HCurve2d)
	Surf2(Handle_Adaptor3d_HSurface)
	Rst2(Handle_Adaptor2d_HCurve2d)
	CGuide(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") BRepBlend_RstRstConstRad;
		 BRepBlend_RstRstConstRad (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & Rst1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst2,const Handle_Adaptor3d_HCurve & CGuide);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 2.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 2.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	SurfRef1(Handle_Adaptor3d_HSurface)
	RstRef1(Handle_Adaptor2d_HCurve2d)
	SurfRef2(Handle_Adaptor3d_HSurface)
	RstRef2(Handle_Adaptor2d_HCurve2d)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef1,const Handle_Adaptor2d_HCurve2d & RstRef1,const Handle_Adaptor3d_HSurface & SurfRef2,const Handle_Adaptor2d_HCurve2d & RstRef2);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

No detailed docstring for this function.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnRst1;
		const gp_Pnt & PointOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnRst2;
		const gp_Pnt & PointOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns U,V coordinates of the point on the surface.") Pnt2dOnRst1;
		const gp_Pnt2d & Pnt2dOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns  U,V coordinates of the point  on the curve on  
         surface.") Pnt2dOnRst2;
		const gp_Pnt2d & Pnt2dOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst1;
		Standard_Real ParameterOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst2;
		Standard_Real ParameterOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnRst1;
		const gp_Vec & TangentOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnRst1;
		const gp_Vec2d & Tangent2dOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnRst2;
		const gp_Vec & TangentOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnRst2;
		const gp_Vec2d & Tangent2dOnRst2 ();
		%feature("autodoc", "Args:
	Sol(math_Vector)
	NRst1(gp_Vec)
	TgRst1(gp_Vec)
	NRst2(gp_Vec)
	TgRst2(gp_Vec)

Returns:
	Blend_DecrochStatus

Permet  d ' implementer   un   critere  de  decrochage  
         specifique a la fonction.") Decroch;
		Blend_DecrochStatus Decroch (const math_Vector & Sol,gp_Vec & NRst1,gp_Vec & TgRst1,gp_Vec & NRst2,gp_Vec & TgRst2);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Radius,const Standard_Integer Choix);
		%feature("autodoc", "Args:
	TypeSection(BlendFunc_SectionShape)

Returns:
	None

Sets  the  type  of   section generation   for the  
         approximations.") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "Args:
	PtRst1(gp_Pnt)
	PtRst2(gp_Pnt)
	np(gp_Vec)
	Center(gp_Pnt)
	VdMed(gp_Vec)

Returns:
	Standard_Boolean

Give the center of circle define by PtRst1, PtRst2 and  
         radius ray.") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2 (const gp_Pnt & PtRst1,const gp_Pnt & PtRst2,const gp_Vec & np,gp_Pnt & Center,gp_Vec & VdMed);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	Pdeb(Standard_Real)
	Pfin(Standard_Real)
	C(gp_Circ)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  if the section is rationnal") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the length of the maximum section") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	None

Compute the minimal value of weight for each poles  
         of all sections.") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	None

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	IC2d(Standard_Integer)
	Tol(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Resolution;
		void Resolution (const Standard_Integer IC2d,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepBlend_RstRstConstRad::~BRepBlend_RstRstConstRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_RstRstConstRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_RstRstEvolRad;
class BRepBlend_RstRstEvolRad : public Blend_RstRstFunction {
	public:
		%feature("autodoc", "Args:
	Surf1(Handle_Adaptor3d_HSurface)
	Rst1(Handle_Adaptor2d_HCurve2d)
	Surf2(Handle_Adaptor3d_HSurface)
	Rst2(Handle_Adaptor2d_HCurve2d)
	CGuide(Handle_Adaptor3d_HCurve)
	Evol(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") BRepBlend_RstRstEvolRad;
		 BRepBlend_RstRstEvolRad (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & Rst1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst2,const Handle_Adaptor3d_HCurve & CGuide,const Handle_Law_Function & Evol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 2.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 2.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	SurfRef1(Handle_Adaptor3d_HSurface)
	RstRef1(Handle_Adaptor2d_HCurve2d)
	SurfRef2(Handle_Adaptor3d_HSurface)
	RstRef2(Handle_Adaptor2d_HCurve2d)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef1,const Handle_Adaptor2d_HCurve2d & RstRef1,const Handle_Adaptor3d_HSurface & SurfRef2,const Handle_Adaptor2d_HCurve2d & RstRef2);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

No detailed docstring for this function.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnRst1;
		const gp_Pnt & PointOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnRst2;
		const gp_Pnt & PointOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns U,V coordinates of the point on the surface.") Pnt2dOnRst1;
		const gp_Pnt2d & Pnt2dOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns  U,V coordinates of the point  on the curve on  
         surface.") Pnt2dOnRst2;
		const gp_Pnt2d & Pnt2dOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst1;
		Standard_Real ParameterOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst2;
		Standard_Real ParameterOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnRst1;
		const gp_Vec & TangentOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnRst1;
		const gp_Vec2d & Tangent2dOnRst1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnRst2;
		const gp_Vec & TangentOnRst2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnRst2;
		const gp_Vec2d & Tangent2dOnRst2 ();
		%feature("autodoc", "Args:
	Sol(math_Vector)
	NRst1(gp_Vec)
	TgRst1(gp_Vec)
	NRst2(gp_Vec)
	TgRst2(gp_Vec)

Returns:
	Blend_DecrochStatus

Enables  implementation of a criterion  of  decrochage  
         specific to the function.") Decroch;
		Blend_DecrochStatus Decroch (const math_Vector & Sol,gp_Vec & NRst1,gp_Vec & TgRst1,gp_Vec & NRst2,gp_Vec & TgRst2);
		%feature("autodoc", "Args:
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "Args:
	TypeSection(BlendFunc_SectionShape)

Returns:
	None

Sets  the  type  of   section generation   for the  
         approximations.") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "Args:
	PtRst1(gp_Pnt)
	PtRst2(gp_Pnt)
	np(gp_Vec)
	Center(gp_Pnt)
	VdMed(gp_Vec)

Returns:
	Standard_Boolean

Gives the center of circle defined   by PtRst1, PtRst2 and  
         radius ray.") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2 (const gp_Pnt & PtRst1,const gp_Pnt & PtRst2,const gp_Vec & np,gp_Pnt & Center,gp_Vec & VdMed);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	Pdeb(Standard_Real)
	Pfin(Standard_Real)
	C(gp_Circ)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  if the section is rationnal") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the length of the maximum section") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	None

Compute the minimal value of weight for each poles  
         of all sections.") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	None

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	IC2d(Standard_Integer)
	Tol(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Resolution;
		void Resolution (const Standard_Integer IC2d,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepBlend_RstRstEvolRad::~BRepBlend_RstRstEvolRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_RstRstEvolRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_RstRstLineBuilder;
class BRepBlend_RstRstLineBuilder {
	public:
		%feature("autodoc", "Args:
	Surf1(Handle_Adaptor3d_HSurface)
	Rst1(Handle_Adaptor2d_HCurve2d)
	Domain1(Handle_Adaptor3d_TopolTool)
	Surf2(Handle_Adaptor3d_HSurface)
	Rst2(Handle_Adaptor2d_HCurve2d)
	Domain2(Handle_Adaptor3d_TopolTool)

Returns:
	None

No detailed docstring for this function.") BRepBlend_RstRstLineBuilder;
		 BRepBlend_RstRstLineBuilder (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & Rst1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst2,const Handle_Adaptor3d_TopolTool & Domain2);
		%feature("autodoc", "Args:
	Func(Blend_RstRstFunction)
	Finv1(Blend_SurfCurvFuncInv)
	FinvP1(Blend_CurvPointFuncInv)
	Finv2(Blend_SurfCurvFuncInv)
	FinvP2(Blend_CurvPointFuncInv)
	Pdep(Standard_Real)
	Pmax(Standard_Real)
	MaxStep(Standard_Real)
	TolGuide(Standard_Real)
	Soldep(math_Vector)
	Tolesp(Standard_Real)
	Fleche(Standard_Real)
	Appro(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Blend_RstRstFunction & Func,Blend_SurfCurvFuncInv & Finv1,Blend_CurvPointFuncInv & FinvP1,Blend_SurfCurvFuncInv & Finv2,Blend_CurvPointFuncInv & FinvP2,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "Args:
	Func(Blend_RstRstFunction)
	Finv1(Blend_SurfCurvFuncInv)
	FinvP1(Blend_CurvPointFuncInv)
	Finv2(Blend_SurfCurvFuncInv)
	FinvP2(Blend_CurvPointFuncInv)
	Pdep(Standard_Real)
	Pmax(Standard_Real)
	Soldep(math_Vector)
	Tolesp(Standard_Real)
	TolGuide(Standard_Real)
	RecRst1(Standard_Boolean)
	RecP1(Standard_Boolean)
	RecRst2(Standard_Boolean)
	RecP2(Standard_Boolean)
	Psol(Standard_Real)
	ParSol(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_RstRstFunction & Func,Blend_SurfCurvFuncInv & Finv1,Blend_CurvPointFuncInv & FinvP1,Blend_SurfCurvFuncInv & Finv2,Blend_CurvPointFuncInv & FinvP2,const Standard_Real Pdep,const Standard_Real Pmax,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real TolGuide,const Standard_Boolean RecRst1,const Standard_Boolean RecP1,const Standard_Boolean RecRst2,const Standard_Boolean RecP2,Standard_Real &OutValue,math_Vector & ParSol);
		%feature("autodoc", "Args:
	Func(Blend_RstRstFunction)
	Finv1(Blend_SurfCurvFuncInv)
	FinvP1(Blend_CurvPointFuncInv)
	Finv2(Blend_SurfCurvFuncInv)
	FinvP2(Blend_CurvPointFuncInv)
	Pmin(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Complete;
		Standard_Boolean Complete (Blend_RstRstFunction & Func,Blend_SurfCurvFuncInv & Finv1,Blend_CurvPointFuncInv & FinvP1,Blend_SurfCurvFuncInv & Finv2,Blend_CurvPointFuncInv & FinvP2,const Standard_Real Pmin);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") Line;
		const Handle_BRepBlend_Line & Line ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Decroch1Start;
		Standard_Boolean Decroch1Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Decroch1End;
		Standard_Boolean Decroch1End ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Decroch2Start;
		Standard_Boolean Decroch2Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Decroch2End;
		Standard_Boolean Decroch2End ();
};


%feature("shadow") BRepBlend_RstRstLineBuilder::~BRepBlend_RstRstLineBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_RstRstLineBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SequenceNodeOfSequenceOfLine;
class BRepBlend_SequenceNodeOfSequenceOfLine : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_BRepBlend_Line)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SequenceNodeOfSequenceOfLine;
		 BRepBlend_SequenceNodeOfSequenceOfLine (const Handle_BRepBlend_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") Value;
		Handle_BRepBlend_Line & Value ();
};


%feature("shadow") BRepBlend_SequenceNodeOfSequenceOfLine::~BRepBlend_SequenceNodeOfSequenceOfLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SequenceNodeOfSequenceOfLine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBlend_SequenceNodeOfSequenceOfLine {
	Handle_BRepBlend_SequenceNodeOfSequenceOfLine GetHandle() {
	return *(Handle_BRepBlend_SequenceNodeOfSequenceOfLine*) &$self;
	}
};

%nodefaultctor Handle_BRepBlend_SequenceNodeOfSequenceOfLine;
class Handle_BRepBlend_SequenceNodeOfSequenceOfLine : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepBlend_SequenceNodeOfSequenceOfLine();
        Handle_BRepBlend_SequenceNodeOfSequenceOfLine(const Handle_BRepBlend_SequenceNodeOfSequenceOfLine &aHandle);
        Handle_BRepBlend_SequenceNodeOfSequenceOfLine(const BRepBlend_SequenceNodeOfSequenceOfLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBlend_SequenceNodeOfSequenceOfLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBlend_SequenceNodeOfSequenceOfLine {
    BRepBlend_SequenceNodeOfSequenceOfLine* GetObject() {
    return (BRepBlend_SequenceNodeOfSequenceOfLine*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBlend_SequenceNodeOfSequenceOfLine::~Handle_BRepBlend_SequenceNodeOfSequenceOfLine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBlend_SequenceNodeOfSequenceOfLine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepBlend_SequenceNodeOfSequenceOfPointOnRst;
class BRepBlend_SequenceNodeOfSequenceOfPointOnRst : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(BRepBlend_PointOnRst)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SequenceNodeOfSequenceOfPointOnRst;
		 BRepBlend_SequenceNodeOfSequenceOfPointOnRst (const BRepBlend_PointOnRst & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	BRepBlend_PointOnRst

No detailed docstring for this function.") Value;
		BRepBlend_PointOnRst & Value ();
};


%feature("shadow") BRepBlend_SequenceNodeOfSequenceOfPointOnRst::~BRepBlend_SequenceNodeOfSequenceOfPointOnRst %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SequenceNodeOfSequenceOfPointOnRst {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBlend_SequenceNodeOfSequenceOfPointOnRst {
	Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst GetHandle() {
	return *(Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst*) &$self;
	}
};

%nodefaultctor Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst;
class Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst();
        Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst(const Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst &aHandle);
        Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst(const BRepBlend_SequenceNodeOfSequenceOfPointOnRst *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst {
    BRepBlend_SequenceNodeOfSequenceOfPointOnRst* GetObject() {
    return (BRepBlend_SequenceNodeOfSequenceOfPointOnRst*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst::~Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepBlend_SequenceOfLine;
class BRepBlend_SequenceOfLine : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBlend_SequenceOfLine;
		 BRepBlend_SequenceOfLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepBlend_SequenceOfLine)

Returns:
	BRepBlend_SequenceOfLine

No detailed docstring for this function.") Assign;
		const BRepBlend_SequenceOfLine & Assign (const BRepBlend_SequenceOfLine & Other);
		%feature("autodoc", "Args:
	Other(BRepBlend_SequenceOfLine)

Returns:
	BRepBlend_SequenceOfLine

No detailed docstring for this function.") operator=;
		const BRepBlend_SequenceOfLine & operator = (const BRepBlend_SequenceOfLine & Other);
		%feature("autodoc", "Args:
	T(Handle_BRepBlend_Line)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_BRepBlend_Line & T);
		%feature("autodoc", "Args:
	S(BRepBlend_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "Args:
	T(Handle_BRepBlend_Line)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_BRepBlend_Line & T);
		%feature("autodoc", "Args:
	S(BRepBlend_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_BRepBlend_Line)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_BRepBlend_Line & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepBlend_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_BRepBlend_Line)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_BRepBlend_Line & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepBlend_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") First;
		const Handle_BRepBlend_Line & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") Last;
		const Handle_BRepBlend_Line & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepBlend_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepBlend_SequenceOfLine & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") Value;
		const Handle_BRepBlend_Line & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_BRepBlend_Line)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_BRepBlend_Line & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") ChangeValue;
		Handle_BRepBlend_Line & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepBlend_SequenceOfLine::~BRepBlend_SequenceOfLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SequenceOfLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SequenceOfPointOnRst;
class BRepBlend_SequenceOfPointOnRst : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBlend_SequenceOfPointOnRst;
		 BRepBlend_SequenceOfPointOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepBlend_SequenceOfPointOnRst)

Returns:
	BRepBlend_SequenceOfPointOnRst

No detailed docstring for this function.") Assign;
		const BRepBlend_SequenceOfPointOnRst & Assign (const BRepBlend_SequenceOfPointOnRst & Other);
		%feature("autodoc", "Args:
	Other(BRepBlend_SequenceOfPointOnRst)

Returns:
	BRepBlend_SequenceOfPointOnRst

No detailed docstring for this function.") operator=;
		const BRepBlend_SequenceOfPointOnRst & operator = (const BRepBlend_SequenceOfPointOnRst & Other);
		%feature("autodoc", "Args:
	T(BRepBlend_PointOnRst)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepBlend_PointOnRst & T);
		%feature("autodoc", "Args:
	S(BRepBlend_SequenceOfPointOnRst)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "Args:
	T(BRepBlend_PointOnRst)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepBlend_PointOnRst & T);
		%feature("autodoc", "Args:
	S(BRepBlend_SequenceOfPointOnRst)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepBlend_PointOnRst)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepBlend_PointOnRst & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepBlend_SequenceOfPointOnRst)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepBlend_PointOnRst)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepBlend_PointOnRst & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepBlend_SequenceOfPointOnRst)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "Args:
	None
Returns:
	BRepBlend_PointOnRst

No detailed docstring for this function.") First;
		const BRepBlend_PointOnRst & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBlend_PointOnRst

No detailed docstring for this function.") Last;
		const BRepBlend_PointOnRst & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepBlend_SequenceOfPointOnRst)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepBlend_PointOnRst

No detailed docstring for this function.") Value;
		const BRepBlend_PointOnRst & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(BRepBlend_PointOnRst)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepBlend_PointOnRst & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepBlend_PointOnRst

No detailed docstring for this function.") ChangeValue;
		BRepBlend_PointOnRst & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepBlend_SequenceOfPointOnRst::~BRepBlend_SequenceOfPointOnRst %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SequenceOfPointOnRst {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SurfCurvConstRadInv;
class BRepBlend_SurfCurvConstRadInv : public Blend_SurfCurvFuncInv {
	public:
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)
	Cg(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SurfCurvConstRadInv;
		 BRepBlend_SurfCurvConstRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HCurve & Cg);
		%feature("autodoc", "Args:
	R(Standard_Real)
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real R,const Standard_Integer Choix);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns 3.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Rst(Handle_Adaptor2d_HCurve2d)

Returns:
	None

Set the restriction on which a solution has to be found.") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") BRepBlend_SurfCurvConstRadInv::~BRepBlend_SurfCurvConstRadInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SurfCurvConstRadInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SurfCurvEvolRadInv;
class BRepBlend_SurfCurvEvolRadInv : public Blend_SurfCurvFuncInv {
	public:
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)
	Cg(Handle_Adaptor3d_HCurve)
	Evol(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SurfCurvEvolRadInv;
		 BRepBlend_SurfCurvEvolRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HCurve & Cg,const Handle_Law_Function & Evol);
		%feature("autodoc", "Args:
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns 3.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	Rst(Handle_Adaptor2d_HCurve2d)

Returns:
	None

Set the restriction on which a solution has to be found.") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") BRepBlend_SurfCurvEvolRadInv::~BRepBlend_SurfCurvEvolRadInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SurfCurvEvolRadInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SurfPointConstRadInv;
class BRepBlend_SurfPointConstRadInv : public Blend_SurfPointFuncInv {
	public:
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SurfPointConstRadInv;
		 BRepBlend_SurfPointConstRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	R(Standard_Real)
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real R,const Standard_Integer Choix);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns 3.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Set the Point on which a solution has to be found.") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") BRepBlend_SurfPointConstRadInv::~BRepBlend_SurfPointConstRadInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SurfPointConstRadInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SurfPointEvolRadInv;
class BRepBlend_SurfPointEvolRadInv : public Blend_SurfPointFuncInv {
	public:
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)
	Evol(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SurfPointEvolRadInv;
		 BRepBlend_SurfPointEvolRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Law_Function & Evol);
		%feature("autodoc", "Args:
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns 3.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Set the Point on which a solution has to be found.") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

Returns in the vector Tolerance the parametric tolerance  
         for each of the 3 variables;  
         Tol is the tolerance used in 3d space.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

Returns in the vector InfBound the lowest values allowed  
         for each of the 3 variables.  
         Returns in the vector SupBound the greatest values allowed  
         for each of the 3 variables.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if Sol is a zero of the function.  
         Tol is the tolerance used in 3d space.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%feature("shadow") BRepBlend_SurfPointEvolRadInv::~BRepBlend_SurfPointEvolRadInv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SurfPointEvolRadInv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SurfRstConstRad;
class BRepBlend_SurfRstConstRad : public Blend_SurfRstFunction {
	public:
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	SurfRst(Handle_Adaptor3d_HSurface)
	Rst(Handle_Adaptor2d_HCurve2d)
	CGuide(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SurfRstConstRad;
		 BRepBlend_SurfRstConstRad (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_HSurface & SurfRst,const Handle_Adaptor2d_HCurve2d & Rst,const Handle_Adaptor3d_HCurve & CGuide);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 3.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 3.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	SurfRef(Handle_Adaptor3d_HSurface)
	RstRef(Handle_Adaptor2d_HCurve2d)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef,const Handle_Adaptor2d_HCurve2d & RstRef);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

No detailed docstring for this function.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnS;
		const gp_Pnt & PointOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnRst;
		const gp_Pnt & PointOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns U,V coordinates of the point on the surface.") Pnt2dOnS;
		const gp_Pnt2d & Pnt2dOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns  U,V coordinates of the point  on the curve on  
         surface.") Pnt2dOnRst;
		const gp_Pnt2d & Pnt2dOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst;
		Standard_Real ParameterOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnS;
		const gp_Vec & TangentOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnS;
		const gp_Vec2d & Tangent2dOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnRst;
		const gp_Vec & TangentOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnRst;
		const gp_Vec2d & Tangent2dOnRst ();
		%feature("autodoc", "Args:
	Sol(math_Vector)
	NS(gp_Vec)
	TgS(gp_Vec)

Returns:
	Standard_Boolean

Enables  implementation  of  a criterion of  decrochage  
         specific to  the function.  
 Warning: Can  be  called  without  previous  call  of  issolution  
         but the values  calculated can  be  senseless.") Decroch;
		Standard_Boolean Decroch (const math_Vector & Sol,gp_Vec & NS,gp_Vec & TgS);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Radius,const Standard_Integer Choix);
		%feature("autodoc", "Args:
	TypeSection(BlendFunc_SectionShape)

Returns:
	None

Sets  the  type  of   section generation   for the  
         approximations.") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	Pdeb(Standard_Real)
	Pfin(Standard_Real)
	C(gp_Circ)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  if the section is rationnal") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the length of the maximum section") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	None

Compute the minimal value of weight for each poles  
         of all sections.") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	None

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	IC2d(Standard_Integer)
	Tol(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Resolution;
		void Resolution (const Standard_Integer IC2d,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepBlend_SurfRstConstRad::~BRepBlend_SurfRstConstRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SurfRstConstRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SurfRstEvolRad;
class BRepBlend_SurfRstEvolRad : public Blend_SurfRstFunction {
	public:
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	SurfRst(Handle_Adaptor3d_HSurface)
	Rst(Handle_Adaptor2d_HCurve2d)
	CGuide(Handle_Adaptor3d_HCurve)
	Evol(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SurfRstEvolRad;
		 BRepBlend_SurfRstEvolRad (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_HSurface & SurfRst,const Handle_Adaptor2d_HCurve2d & Rst,const Handle_Adaptor3d_HCurve & CGuide,const Handle_Law_Function & Evol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 3.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 3.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	SurfRef(Handle_Adaptor3d_HSurface)
	RstRef(Handle_Adaptor2d_HCurve2d)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef,const Handle_Adaptor2d_HCurve2d & RstRef);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Sets the bounds of the parametric interval on  
         the guide line.  
         This determines the derivatives in these values if the  
         function is not Cn.") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Tolerance(math_Vector)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InfBound(math_Vector)
	SupBound(math_Vector)

Returns:
	None

No detailed docstring for this function.") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns   the    minimal  Distance  beetween   two  
         extremitys of calculed sections.") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnS;
		const gp_Pnt & PointOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PointOnRst;
		const gp_Pnt & PointOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns U,V coordinates of the point on the surface.") Pnt2dOnS;
		const gp_Pnt2d & Pnt2dOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns  U,V coordinates of the point  on the curve on  
         surface.") Pnt2dOnRst;
		const gp_Pnt2d & Pnt2dOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of the point on the curve.") ParameterOnRst;
		Standard_Real ParameterOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnS;
		const gp_Vec & TangentOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnS;
		const gp_Vec2d & Tangent2dOnS ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") TangentOnRst;
		const gp_Vec & TangentOnRst ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Tangent2dOnRst;
		const gp_Vec2d & Tangent2dOnRst ();
		%feature("autodoc", "Args:
	Sol(math_Vector)
	NS(gp_Vec)
	TgS(gp_Vec)

Returns:
	Standard_Boolean

Permet  d ' implementer   un   critere  de  decrochage  
         specifique a la fonction.") Decroch;
		Standard_Boolean Decroch (const math_Vector & Sol,gp_Vec & NS,gp_Vec & TgS);
		%feature("autodoc", "Args:
	Choix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "Args:
	TypeSection(BlendFunc_SectionShape)

Returns:
	None

Sets  the  type  of   section generation   for the  
         approximations.") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	Pdeb(Standard_Real)
	Pfin(Standard_Real)
	C(gp_Circ)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  if the section is rationnal") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the length of the maximum section") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	None

Compute the minimal value of weight for each poles  
         of all sections.") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)
	NbPoles2d(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(math_Vector)
	Tol1D(math_Vector)

Returns:
	None

Returns the tolerance to reach in approximation  
         to respecte  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary  
         SurfTol error inside the surface.") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Used for the first and last section  
         The method returns Standard_True if the derivatives  
         are computed, otherwise it returns Standard_False.") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	P(Blend_Point)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	IC2d(Standard_Integer)
	Tol(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Resolution;
		void Resolution (const Standard_Integer IC2d,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepBlend_SurfRstEvolRad::~BRepBlend_SurfRstEvolRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SurfRstEvolRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_SurfRstLineBuilder;
class BRepBlend_SurfRstLineBuilder {
	public:
		%feature("autodoc", "Args:
	Surf1(Handle_Adaptor3d_HSurface)
	Domain1(Handle_Adaptor3d_TopolTool)
	Surf2(Handle_Adaptor3d_HSurface)
	Rst(Handle_Adaptor2d_HCurve2d)
	Domain2(Handle_Adaptor3d_TopolTool)

Returns:
	None

No detailed docstring for this function.") BRepBlend_SurfRstLineBuilder;
		 BRepBlend_SurfRstLineBuilder (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst,const Handle_Adaptor3d_TopolTool & Domain2);
		%feature("autodoc", "Args:
	Func(Blend_SurfRstFunction)
	Finv(Blend_FuncInv)
	FinvP(Blend_SurfPointFuncInv)
	FinvC(Blend_SurfCurvFuncInv)
	Pdep(Standard_Real)
	Pmax(Standard_Real)
	MaxStep(Standard_Real)
	TolGuide(Standard_Real)
	Soldep(math_Vector)
	Tolesp(Standard_Real)
	Fleche(Standard_Real)
	Appro(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Blend_SurfRstFunction & Func,Blend_FuncInv & Finv,Blend_SurfPointFuncInv & FinvP,Blend_SurfCurvFuncInv & FinvC,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "Args:
	Func(Blend_SurfRstFunction)
	Finv(Blend_FuncInv)
	FinvP(Blend_SurfPointFuncInv)
	FinvC(Blend_SurfCurvFuncInv)
	Pdep(Standard_Real)
	Pmax(Standard_Real)
	Soldep(math_Vector)
	Tolesp(Standard_Real)
	TolGuide(Standard_Real)
	RecRst(Standard_Boolean)
	RecP(Standard_Boolean)
	RecS(Standard_Boolean)
	Psol(Standard_Real)
	ParSol(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_SurfRstFunction & Func,Blend_FuncInv & Finv,Blend_SurfPointFuncInv & FinvP,Blend_SurfCurvFuncInv & FinvC,const Standard_Real Pdep,const Standard_Real Pmax,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real TolGuide,const Standard_Boolean RecRst,const Standard_Boolean RecP,const Standard_Boolean RecS,Standard_Real &OutValue,math_Vector & ParSol);
		%feature("autodoc", "Args:
	Func(Blend_SurfRstFunction)
	Finv(Blend_FuncInv)
	FinvP(Blend_SurfPointFuncInv)
	FinvC(Blend_SurfCurvFuncInv)
	Pmin(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Complete;
		Standard_Boolean Complete (Blend_SurfRstFunction & Func,Blend_FuncInv & Finv,Blend_SurfPointFuncInv & FinvP,Blend_SurfCurvFuncInv & FinvC,const Standard_Real Pmin);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	PrevIndex(Standard_Integer)
	pt2d(gp_Pnt2d)
	lastpt2d(gp_Pnt2d)
	ponarc(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") ArcToRecadre;
		Standard_Integer ArcToRecadre (const math_Vector & Sol,const Standard_Integer PrevIndex,gp_Pnt2d & pt2d,gp_Pnt2d & lastpt2d,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") Line;
		const Handle_BRepBlend_Line & Line ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") DecrochStart;
		Standard_Boolean DecrochStart ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") DecrochEnd;
		Standard_Boolean DecrochEnd ();
};


%feature("shadow") BRepBlend_SurfRstLineBuilder::~BRepBlend_SurfRstLineBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_SurfRstLineBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_Walking;
class BRepBlend_Walking {
	public:
		%feature("autodoc", "Args:
	Surf1(Handle_Adaptor3d_HSurface)
	Surf2(Handle_Adaptor3d_HSurface)
	Domain1(Handle_Adaptor3d_TopolTool)
	Domain2(Handle_Adaptor3d_TopolTool)

Returns:
	None

No detailed docstring for this function.") BRepBlend_Walking;
		 BRepBlend_Walking (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_TopolTool & Domain2);
		%feature("autodoc", "Args:
	RecDomain1(Handle_Adaptor3d_TopolTool)
	RecDomain2(Handle_Adaptor3d_TopolTool)

Returns:
	None

No detailed docstring for this function.") SetDomainsToRecadre;
		void SetDomainsToRecadre (const Handle_Adaptor3d_TopolTool & RecDomain1,const Handle_Adaptor3d_TopolTool & RecDomain2);
		%feature("autodoc", "Args:
	P(Blend_Point)

Returns:
	None

No detailed docstring for this function.") AddSingularPoint;
		void AddSingularPoint (const Blend_Point & P);
		%feature("autodoc", "Args:
	F(Blend_Function)
	FInv(Blend_FuncInv)
	Pdep(Standard_Real)
	Pmax(Standard_Real)
	MaxStep(Standard_Real)
	TolGuide(Standard_Real)
	Soldep(math_Vector)
	Tolesp(Standard_Real)
	Fleche(Standard_Real)
	Appro(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "Args:
	F(Blend_Function)
	Pdep(Standard_Real)
	ParDep(math_Vector)
	Tolesp(Standard_Real)
	TolGuide(Standard_Real)
	Pos1(TopAbs_State)
	Pos2(TopAbs_State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_Function & F,const Standard_Real Pdep,math_Vector & ParDep,const Standard_Real Tolesp,const Standard_Real TolGuide,TopAbs_State & Pos1,TopAbs_State & Pos2);
		%feature("autodoc", "Args:
	F(Blend_Function)
	FInv(Blend_FuncInv)
	Pdep(Standard_Real)
	Pmax(Standard_Real)
	ParDep(math_Vector)
	Tolesp(Standard_Real)
	TolGuide(Standard_Real)
	RecOnS1(Standard_Boolean)
	RecOnS2(Standard_Boolean)
	Psol(Standard_Real)
	ParSol(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real Pdep,const Standard_Real Pmax,const math_Vector & ParDep,const Standard_Real Tolesp,const Standard_Real TolGuide,const Standard_Boolean RecOnS1,const Standard_Boolean RecOnS2,Standard_Real &OutValue,math_Vector & ParSol);
		%feature("autodoc", "Args:
	F(Blend_Function)
	FInv(Blend_FuncInv)
	P(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Continu;
		Standard_Boolean Continu (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real P);
		%feature("autodoc", "Args:
	F(Blend_Function)
	FInv(Blend_FuncInv)
	P(Standard_Real)
	OnS1(Standard_Boolean)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Continu;
		Standard_Boolean Continu (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real P,const Standard_Boolean OnS1);
		%feature("autodoc", "Args:
	F(Blend_Function)
	FInv(Blend_FuncInv)
	Pmin(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Complete;
		Standard_Boolean Complete (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real Pmin);
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ClassificationOnS1;
		void ClassificationOnS1 (const Standard_Boolean C);
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ClassificationOnS2;
		void ClassificationOnS2 (const Standard_Boolean C);
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Check2d;
		void Check2d (const Standard_Boolean C);
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Check;
		void Check (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") TwistOnS1;
		Standard_Boolean TwistOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") TwistOnS2;
		Standard_Boolean TwistOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepBlend_Line

No detailed docstring for this function.") Line;
		const Handle_BRepBlend_Line & Line ();
};


%feature("shadow") BRepBlend_Walking::~BRepBlend_Walking %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_Walking {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBlend_AppFunc;
class BRepBlend_AppFunc : public BRepBlend_AppFuncRoot {
	public:
		%feature("autodoc", "Args:
	Line(Handle_BRepBlend_Line)
	Func(Blend_Function)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBlend_AppFunc;
		 BRepBlend_AppFunc (Handle_BRepBlend_Line & Line,Blend_Function & Func,const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	Func(Blend_AppFunction)
	Param(Standard_Real)
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Vec;
		void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%feature("shadow") BRepBlend_AppFunc::~BRepBlend_AppFunc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_AppFunc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBlend_AppFunc {
	Handle_BRepBlend_AppFunc GetHandle() {
	return *(Handle_BRepBlend_AppFunc*) &$self;
	}
};

%nodefaultctor Handle_BRepBlend_AppFunc;
class Handle_BRepBlend_AppFunc : public Handle_BRepBlend_AppFuncRoot {

    public:
        // constructors
        Handle_BRepBlend_AppFunc();
        Handle_BRepBlend_AppFunc(const Handle_BRepBlend_AppFunc &aHandle);
        Handle_BRepBlend_AppFunc(const BRepBlend_AppFunc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBlend_AppFunc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBlend_AppFunc {
    BRepBlend_AppFunc* GetObject() {
    return (BRepBlend_AppFunc*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBlend_AppFunc::~Handle_BRepBlend_AppFunc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBlend_AppFunc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepBlend_AppFuncRst;
class BRepBlend_AppFuncRst : public BRepBlend_AppFuncRoot {
	public:
		%feature("autodoc", "Args:
	Line(Handle_BRepBlend_Line)
	Func(Blend_SurfRstFunction)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBlend_AppFuncRst;
		 BRepBlend_AppFuncRst (Handle_BRepBlend_Line & Line,Blend_SurfRstFunction & Func,const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	Func(Blend_AppFunction)
	Param(Standard_Real)
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Vec;
		void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%feature("shadow") BRepBlend_AppFuncRst::~BRepBlend_AppFuncRst %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_AppFuncRst {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBlend_AppFuncRst {
	Handle_BRepBlend_AppFuncRst GetHandle() {
	return *(Handle_BRepBlend_AppFuncRst*) &$self;
	}
};

%nodefaultctor Handle_BRepBlend_AppFuncRst;
class Handle_BRepBlend_AppFuncRst : public Handle_BRepBlend_AppFuncRoot {

    public:
        // constructors
        Handle_BRepBlend_AppFuncRst();
        Handle_BRepBlend_AppFuncRst(const Handle_BRepBlend_AppFuncRst &aHandle);
        Handle_BRepBlend_AppFuncRst(const BRepBlend_AppFuncRst *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBlend_AppFuncRst DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBlend_AppFuncRst {
    BRepBlend_AppFuncRst* GetObject() {
    return (BRepBlend_AppFuncRst*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBlend_AppFuncRst::~Handle_BRepBlend_AppFuncRst %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBlend_AppFuncRst {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepBlend_AppFuncRstRst;
class BRepBlend_AppFuncRstRst : public BRepBlend_AppFuncRoot {
	public:
		%feature("autodoc", "Args:
	Line(Handle_BRepBlend_Line)
	Func(Blend_RstRstFunction)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBlend_AppFuncRstRst;
		 BRepBlend_AppFuncRstRst (Handle_BRepBlend_Line & Line,Blend_RstRstFunction & Func,const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	Func(Blend_AppFunction)
	Param(Standard_Real)
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "Args:
	Sol(math_Vector)
	Pnt(Blend_Point)

Returns:
	None

No detailed docstring for this function.") Vec;
		void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%feature("shadow") BRepBlend_AppFuncRstRst::~BRepBlend_AppFuncRstRst %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBlend_AppFuncRstRst {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBlend_AppFuncRstRst {
	Handle_BRepBlend_AppFuncRstRst GetHandle() {
	return *(Handle_BRepBlend_AppFuncRstRst*) &$self;
	}
};

%nodefaultctor Handle_BRepBlend_AppFuncRstRst;
class Handle_BRepBlend_AppFuncRstRst : public Handle_BRepBlend_AppFuncRoot {

    public:
        // constructors
        Handle_BRepBlend_AppFuncRstRst();
        Handle_BRepBlend_AppFuncRstRst(const Handle_BRepBlend_AppFuncRstRst &aHandle);
        Handle_BRepBlend_AppFuncRstRst(const BRepBlend_AppFuncRstRst *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBlend_AppFuncRstRst DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBlend_AppFuncRstRst {
    BRepBlend_AppFuncRstRst* GetObject() {
    return (BRepBlend_AppFuncRstRst*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBlend_AppFuncRstRst::~Handle_BRepBlend_AppFuncRstRst %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBlend_AppFuncRstRst {
    void _kill_pointed() {
        delete $self;
    }
};

