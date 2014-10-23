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
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "	* get the number of 2d curves to approximate.

	:rtype: int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:param Degree:
	:type Degree: Standard_Integer &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	* Returns if the section is rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> -- This information is usfull to find an good tolerance in 2d approximation

	:param Index:
	:type Index: Standard_Integer
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to respecte BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal &
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("autodoc", "	* Is usfull, if (me) have to be run numerical algorithme to perform D0, D1 or D2

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditionned rational approximation.

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("autodoc", "	* Returns the length of the maximum section. This information is usefull to perform well conditionned rational approximation.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections. This information is usefull to perform well conditionned rational approximation.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_AppFunction &
	:param Param:
	:type Param: float
	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: void
") Point;
		virtual void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: void
") Vec;
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
		%feature("autodoc", "	:rtype: None
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf ();
		%feature("autodoc", "	:param Degmin:
	:type Degmin: Standard_Integer
	:param Degmax:
	:type Degmax: Standard_Integer
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: Standard_Integer
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("autodoc", "	:param Degmin:
	:type Degmin: Standard_Integer
	:param Degmax:
	:type Degmax: Standard_Integer
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: Standard_Integer
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("autodoc", "	:param ParType:
	:type ParType: Approx_ParametrizationType
	:rtype: None
") SetParType;
		void SetParType (const Approx_ParametrizationType ParType);
		%feature("autodoc", "	:param C:
	:type C: GeomAbs_Shape
	:rtype: None
") SetContinuity;
		void SetContinuity (const GeomAbs_Shape C);
		%feature("autodoc", "	:param W1:
	:type W1: float
	:param W2:
	:type W2: float
	:param W3:
	:type W3: float
	:rtype: None
") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real W1,const Standard_Real W2,const Standard_Real W3);
		%feature("autodoc", "	:rtype: Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	:param W1:
	:type W1: float &
	:param W2:
	:type W2: float &
	:param W3:
	:type W3: float &
	:rtype: None
") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Lin:
	:type Lin: Handle_BRepBlend_Line &
	:param SecGen:
	:type SecGen: Blend_AppFunction &
	:param SpApprox: default value is Standard_False
	:type SpApprox: bool
	:rtype: None
") Perform;
		void Perform (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen,const Standard_Boolean SpApprox = Standard_False);
		%feature("autodoc", "	:param Lin:
	:type Lin: Handle_BRepBlend_Line &
	:param SecGen:
	:type SecGen: Blend_AppFunction &
	:rtype: None
") PerformSmoothing;
		void PerformSmoothing (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen);
		%feature("autodoc", "	:param Lin:
	:type Lin: Handle_BRepBlend_Line &
	:param SecGen:
	:type SecGen: Blend_AppFunction &
	:param NbMaxP:
	:type NbMaxP: Standard_Integer
	:rtype: None
") Perform;
		void Perform (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen,const Standard_Integer NbMaxP);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:param UDegree:
	:type UDegree: Standard_Integer &
	:param VDegree:
	:type VDegree: Standard_Integer &
	:param NbUPoles:
	:type NbUPoles: Standard_Integer &
	:param NbVPoles:
	:type NbVPoles: Standard_Integer &
	:param NbUKnots:
	:type NbUKnots: Standard_Integer &
	:param NbVKnots:
	:type NbVKnots: Standard_Integer &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal &
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal &
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal &
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger &
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger &
	:rtype: None
") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("autodoc", "	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: None
") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") TolCurveOnSurf;
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
		%feature("autodoc", "	* Approximation of the new Surface (and eventually the 2d Curves on the support surfaces). Normaly the 2d curve are approximated with an tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used.

	:param Funct:
	:type Funct: Handle_Approx_SweepFunction &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param TolAngular:
	:type TolAngular: float
	:param Continuity: default value is GeomAbs_C0
	:type Continuity: GeomAbs_Shape
	:param Degmax: default value is 11
	:type Degmax: Standard_Integer
	:param Segmax: default value is 50
	:type Segmax: Standard_Integer
	:rtype: None
") BRepBlend_AppSurface;
		 BRepBlend_AppSurface (Handle_Approx_SweepFunction & Funct,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Real TolAngular,const GeomAbs_Shape Continuity = GeomAbs_C0,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 50);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:param UDegree:
	:type UDegree: Standard_Integer &
	:param VDegree:
	:type VDegree: Standard_Integer &
	:param NbUPoles:
	:type NbUPoles: Standard_Integer &
	:param NbVPoles:
	:type NbVPoles: Standard_Integer &
	:param NbUKnots:
	:type NbUKnots: Standard_Integer &
	:param NbVKnots:
	:type NbVKnots: Standard_Integer &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal &
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal &
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal &
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger &
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger &
	:rtype: None
") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "	* returns the maximum error in the suface approximation.

	:rtype: float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf ();
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("autodoc", "	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: None
") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* returns the maximum error in the <Index> 2d curve approximation.

	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") Max2dError;
		Standard_Real Max2dError (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") TolCurveOnSurf;
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
		%feature("autodoc", "	* Projects the point P on the arc C. If the methods returns Standard_True, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Dist is the distance between P and the curve.. If the method returns Standard_False, Param proj and Dist are not significant.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Paramproj:
	:type Paramproj: float &
	:param Dist:
	:type Dist: float &
	:rtype: bool
") Project;
		static Standard_Boolean Project (const gp_Pnt2d & P,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Param:
	:type Param: float &
	:param Dist:
	:type Dist: float &
	:rtype: bool
") Inters;
		static Standard_Boolean Inters (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the parameter of the vertex V on the edge A.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "	* Returns the parametric tolerance on the arc A used to consider that the vertex and another point meet, i-e if Abs(Parameter(Vertex)-Parameter(OtherPnt))<= Tolerance, the points are 'merged'.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnUMin;
		static Standard_Boolean SingularOnUMin (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnUMax;
		static Standard_Boolean SingularOnUMax (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnVMin;
		static Standard_Boolean SingularOnVMin (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnVMax;
		static Standard_Boolean SingularOnVMax (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
		%feature("autodoc", "	* Returns the parametric limits on the arc C. These limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Ufirst:
	:type Ufirst: float &
	:param Ulast:
	:type Ulast: float &
	:rtype: void
") Bounds;
		static void Bounds (const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Adaptor2d_HCurve2d
") CurveOnSurf;
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
		%feature("autodoc", "	:param Curv:
	:type Curv: Handle_Adaptor3d_HCurve &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:rtype: None
") BRepBlend_CSWalking;
		 BRepBlend_CSWalking (const Handle_Adaptor3d_HCurve & Curv,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain);
		%feature("autodoc", "	:param F:
	:type F: Blend_CSFunction &
	:param Pdep:
	:type Pdep: float
	:param Pmax:
	:type Pmax: float
	:param MaxStep:
	:type MaxStep: float
	:param TolGuide:
	:type TolGuide: float
	:param Soldep:
	:type Soldep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param Fleche:
	:type Fleche: float
	:param Appro: default value is Standard_False
	:type Appro: bool
	:rtype: None
") Perform;
		void Perform (Blend_CSFunction & F,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "	:param F:
	:type F: Blend_CSFunction &
	:param Pmin:
	:type Pmin: float
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Blend_CSFunction & F,const Standard_Real Pmin);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
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
		%feature("autodoc", "	:param C1:
	:type C1: Handle_Adaptor3d_HCurve &
	:param C2:
	:type C2: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_CurvPointRadInv;
		 BRepBlend_CurvPointRadInv (const Handle_Adaptor3d_HCurve & C1,const Handle_Adaptor3d_HCurve & C2);
		%feature("autodoc", "	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "	* returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
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
		%feature("autodoc", "	:rtype: None
") BRepBlend_Extremity;
		 BRepBlend_Extremity ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Param:
	:type Param: float
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepBlend_Extremity;
		 BRepBlend_Extremity (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Param:
	:type Param: float
	:param Tol:
	:type Tol: float
	:param Vtx:
	:type Vtx: Handle_Adaptor3d_HVertex &
	:rtype: None
") BRepBlend_Extremity;
		 BRepBlend_Extremity (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & Vtx);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param W:
	:type W: float
	:param Param:
	:type Param: float
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepBlend_Extremity;
		 BRepBlend_Extremity (const gp_Pnt & P,const Standard_Real W,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Param:
	:type Param: float
	:param Tol:
	:type Tol: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Param:
	:type Param: float
	:param Tol:
	:type Tol: float
	:param Vtx:
	:type Vtx: Handle_Adaptor3d_HVertex &
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const Standard_Real Param,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & Vtx);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param W:
	:type W: float
	:param Param:
	:type Param: float
	:param Tol:
	:type Tol: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real W,const Standard_Real Param,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "	:param Tangent:
	:type Tangent: gp_Vec
	:rtype: None
") SetTangent;
		void SetTangent (const gp_Vec & Tangent);
		%feature("autodoc", "	:rtype: bool
") HasTangent;
		Standard_Boolean HasTangent ();
		%feature("autodoc", "	:rtype: gp_Vec
") Tangent;
		const gp_Vec & Tangent ();
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: None
") SetVertex;
		void SetVertex (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Param:
	:type Param: float
	:param TLine:
	:type TLine: IntSurf_Transition &
	:param TArc:
	:type TArc: IntSurf_Transition &
	:rtype: None
") AddArc;
		void AddArc (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		const Handle_Adaptor3d_HVertex & Vertex ();
		%feature("autodoc", "	:rtype: int
") NbPointOnRst;
		Standard_Integer NbPointOnRst ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepBlend_PointOnRst
") PointOnRst;
		const BRepBlend_PointOnRst & PointOnRst (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: float
") ParameterOnGuide;
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
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor2d_HCurve2d & C,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Handle_Adaptor2d_HCurve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Period;
		static Standard_Real Period (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real R3d);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
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
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor3d_HCurve & C,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Handle_Adaptor3d_HCurve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") Period;
		static Standard_Real Period (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Handle_Adaptor3d_HCurve & C,const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor3d_HCurve & C,const Standard_Real R3d);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: Handle_Geom_BezierCurve
") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
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
		%feature("autodoc", "	:rtype: None
") BRepBlend_Line;
		 BRepBlend_Line ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:rtype: None
") Append;
		void Append (const Blend_Point & P);
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:rtype: None
") Prepend;
		void Prepend (const Blend_Point & P);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param P:
	:type P: Blend_Point &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Blend_Point & P);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	:param TranS1:
	:type TranS1: IntSurf_TypeTrans
	:param TranS2:
	:type TranS2: IntSurf_TypeTrans
	:rtype: None
") Set;
		void Set (const IntSurf_TypeTrans TranS1,const IntSurf_TypeTrans TranS2);
		%feature("autodoc", "	:param Trans:
	:type Trans: IntSurf_TypeTrans
	:rtype: None
") Set;
		void Set (const IntSurf_TypeTrans Trans);
		%feature("autodoc", "	:param StartPt1:
	:type StartPt1: BRepBlend_Extremity &
	:param StartPt2:
	:type StartPt2: BRepBlend_Extremity &
	:rtype: None
") SetStartPoints;
		void SetStartPoints (const BRepBlend_Extremity & StartPt1,const BRepBlend_Extremity & StartPt2);
		%feature("autodoc", "	:param EndPt1:
	:type EndPt1: BRepBlend_Extremity &
	:param EndPt2:
	:type EndPt2: BRepBlend_Extremity &
	:rtype: None
") SetEndPoints;
		void SetEndPoints (const BRepBlend_Extremity & EndPt1,const BRepBlend_Extremity & EndPt2);
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Blend_Point
") Point;
		const Blend_Point & Point (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1 ();
		%feature("autodoc", "	:rtype: IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2 ();
		%feature("autodoc", "	:rtype: BRepBlend_Extremity
") StartPointOnFirst;
		const BRepBlend_Extremity & StartPointOnFirst ();
		%feature("autodoc", "	:rtype: BRepBlend_Extremity
") StartPointOnSecond;
		const BRepBlend_Extremity & StartPointOnSecond ();
		%feature("autodoc", "	:rtype: BRepBlend_Extremity
") EndPointOnFirst;
		const BRepBlend_Extremity & EndPointOnFirst ();
		%feature("autodoc", "	:rtype: BRepBlend_Extremity
") EndPointOnSecond;
		const BRepBlend_Extremity & EndPointOnSecond ();
		%feature("autodoc", "	:rtype: IntSurf_TypeTrans
") TransitionOnS;
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
		%feature("autodoc", "	:rtype: None
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst ();
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Param:
	:type Param: float
	:param TLine:
	:type TLine: IntSurf_Transition &
	:param TArc:
	:type TArc: IntSurf_Transition &
	:rtype: None
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Param:
	:type Param: float
	:param TLine:
	:type TLine: IntSurf_Transition &
	:param TArc:
	:type TArc: IntSurf_Transition &
	:rtype: None
") SetArc;
		void SetArc (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine ();
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc ();
		%feature("autodoc", "	:rtype: float
") ParameterOnArc;
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
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Rst1:
	:type Rst1: Handle_Adaptor2d_HCurve2d &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param Rst2:
	:type Rst2: Handle_Adaptor2d_HCurve2d &
	:param CGuide:
	:type CGuide: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_RstRstConstRad;
		 BRepBlend_RstRstConstRad (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & Rst1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst2,const Handle_Adaptor3d_HCurve & CGuide);
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	:param SurfRef1:
	:type SurfRef1: Handle_Adaptor3d_HSurface &
	:param RstRef1:
	:type RstRef1: Handle_Adaptor2d_HCurve2d &
	:param SurfRef2:
	:type SurfRef2: Handle_Adaptor3d_HSurface &
	:param RstRef2:
	:type RstRef2: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef1,const Handle_Adaptor2d_HCurve2d & RstRef1,const Handle_Adaptor3d_HSurface & SurfRef2,const Handle_Adaptor2d_HCurve2d & RstRef2);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst1;
		const gp_Pnt & PointOnRst1 ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst2;
		const gp_Pnt & PointOnRst2 ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d & Pnt2dOnRst1 ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d & Pnt2dOnRst2 ();
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1 ();
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2 ();
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst1;
		const gp_Vec & TangentOnRst1 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d & Tangent2dOnRst1 ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst2;
		const gp_Vec & TangentOnRst2 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d & Tangent2dOnRst2 ();
		%feature("autodoc", "	* Permet d ' implementer un critere de decrochage specifique a la fonction.

	:param Sol:
	:type Sol: math_Vector &
	:param NRst1:
	:type NRst1: gp_Vec
	:param TgRst1:
	:type TgRst1: gp_Vec
	:param NRst2:
	:type NRst2: gp_Vec
	:param TgRst2:
	:type TgRst2: gp_Vec
	:rtype: Blend_DecrochStatus
") Decroch;
		Blend_DecrochStatus Decroch (const math_Vector & Sol,gp_Vec & NRst1,gp_Vec & TgRst1,gp_Vec & NRst2,gp_Vec & TgRst2);
		%feature("autodoc", "	:param Radius:
	:type Radius: float
	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Real Radius,const Standard_Integer Choix);
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "	* Give the center of circle define by PtRst1, PtRst2 and radius ray.

	:param PtRst1:
	:type PtRst1: gp_Pnt
	:param PtRst2:
	:type PtRst2: gp_Pnt
	:param np:
	:type np: gp_Vec
	:param Center:
	:type Center: gp_Pnt
	:param VdMed:
	:type VdMed: gp_Vec
	:rtype: bool
") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2 (const gp_Pnt & PtRst1,const gp_Pnt & PtRst2,const gp_Vec & np,gp_Pnt & Center,gp_Vec & VdMed);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Circ
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles2d:
	:type NbPoles2d: Standard_Integer &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to respecte BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: math_Vector &
	:param Tol1D:
	:type Tol1D: math_Vector &
	:rtype: None
") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	* Used for the first and last section

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "	:param IC2d:
	:type IC2d: Standard_Integer
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: None
") Resolution;
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
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Rst1:
	:type Rst1: Handle_Adaptor2d_HCurve2d &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param Rst2:
	:type Rst2: Handle_Adaptor2d_HCurve2d &
	:param CGuide:
	:type CGuide: Handle_Adaptor3d_HCurve &
	:param Evol:
	:type Evol: Handle_Law_Function &
	:rtype: None
") BRepBlend_RstRstEvolRad;
		 BRepBlend_RstRstEvolRad (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & Rst1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst2,const Handle_Adaptor3d_HCurve & CGuide,const Handle_Law_Function & Evol);
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	:param SurfRef1:
	:type SurfRef1: Handle_Adaptor3d_HSurface &
	:param RstRef1:
	:type RstRef1: Handle_Adaptor2d_HCurve2d &
	:param SurfRef2:
	:type SurfRef2: Handle_Adaptor3d_HSurface &
	:param RstRef2:
	:type RstRef2: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef1,const Handle_Adaptor2d_HCurve2d & RstRef1,const Handle_Adaptor3d_HSurface & SurfRef2,const Handle_Adaptor2d_HCurve2d & RstRef2);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst1;
		const gp_Pnt & PointOnRst1 ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst2;
		const gp_Pnt & PointOnRst2 ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d & Pnt2dOnRst1 ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d & Pnt2dOnRst2 ();
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1 ();
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2 ();
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst1;
		const gp_Vec & TangentOnRst1 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d & Tangent2dOnRst1 ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst2;
		const gp_Vec & TangentOnRst2 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d & Tangent2dOnRst2 ();
		%feature("autodoc", "	* Enables implementation of a criterion of decrochage specific to the function.

	:param Sol:
	:type Sol: math_Vector &
	:param NRst1:
	:type NRst1: gp_Vec
	:param TgRst1:
	:type TgRst1: gp_Vec
	:param NRst2:
	:type NRst2: gp_Vec
	:param TgRst2:
	:type TgRst2: gp_Vec
	:rtype: Blend_DecrochStatus
") Decroch;
		Blend_DecrochStatus Decroch (const math_Vector & Sol,gp_Vec & NRst1,gp_Vec & TgRst1,gp_Vec & NRst2,gp_Vec & TgRst2);
		%feature("autodoc", "	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "	* Gives the center of circle defined by PtRst1, PtRst2 and radius ray.

	:param PtRst1:
	:type PtRst1: gp_Pnt
	:param PtRst2:
	:type PtRst2: gp_Pnt
	:param np:
	:type np: gp_Vec
	:param Center:
	:type Center: gp_Pnt
	:param VdMed:
	:type VdMed: gp_Vec
	:rtype: bool
") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2 (const gp_Pnt & PtRst1,const gp_Pnt & PtRst2,const gp_Vec & np,gp_Pnt & Center,gp_Vec & VdMed);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Circ
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles2d:
	:type NbPoles2d: Standard_Integer &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to respecte BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: math_Vector &
	:param Tol1D:
	:type Tol1D: math_Vector &
	:rtype: None
") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	* Used for the first and last section

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "	:param IC2d:
	:type IC2d: Standard_Integer
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: None
") Resolution;
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
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Rst1:
	:type Rst1: Handle_Adaptor2d_HCurve2d &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param Rst2:
	:type Rst2: Handle_Adaptor2d_HCurve2d &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:rtype: None
") BRepBlend_RstRstLineBuilder;
		 BRepBlend_RstRstLineBuilder (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & Rst1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst2,const Handle_Adaptor3d_TopolTool & Domain2);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_RstRstFunction &
	:param Finv1:
	:type Finv1: Blend_SurfCurvFuncInv &
	:param FinvP1:
	:type FinvP1: Blend_CurvPointFuncInv &
	:param Finv2:
	:type Finv2: Blend_SurfCurvFuncInv &
	:param FinvP2:
	:type FinvP2: Blend_CurvPointFuncInv &
	:param Pdep:
	:type Pdep: float
	:param Pmax:
	:type Pmax: float
	:param MaxStep:
	:type MaxStep: float
	:param TolGuide:
	:type TolGuide: float
	:param Soldep:
	:type Soldep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param Fleche:
	:type Fleche: float
	:param Appro: default value is Standard_False
	:type Appro: bool
	:rtype: None
") Perform;
		void Perform (Blend_RstRstFunction & Func,Blend_SurfCurvFuncInv & Finv1,Blend_CurvPointFuncInv & FinvP1,Blend_SurfCurvFuncInv & Finv2,Blend_CurvPointFuncInv & FinvP2,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_RstRstFunction &
	:param Finv1:
	:type Finv1: Blend_SurfCurvFuncInv &
	:param FinvP1:
	:type FinvP1: Blend_CurvPointFuncInv &
	:param Finv2:
	:type Finv2: Blend_SurfCurvFuncInv &
	:param FinvP2:
	:type FinvP2: Blend_CurvPointFuncInv &
	:param Pdep:
	:type Pdep: float
	:param Pmax:
	:type Pmax: float
	:param Soldep:
	:type Soldep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param TolGuide:
	:type TolGuide: float
	:param RecRst1:
	:type RecRst1: bool
	:param RecP1:
	:type RecP1: bool
	:param RecRst2:
	:type RecRst2: bool
	:param RecP2:
	:type RecP2: bool
	:param Psol:
	:type Psol: float &
	:param ParSol:
	:type ParSol: math_Vector &
	:rtype: bool
") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_RstRstFunction & Func,Blend_SurfCurvFuncInv & Finv1,Blend_CurvPointFuncInv & FinvP1,Blend_SurfCurvFuncInv & Finv2,Blend_CurvPointFuncInv & FinvP2,const Standard_Real Pdep,const Standard_Real Pmax,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real TolGuide,const Standard_Boolean RecRst1,const Standard_Boolean RecP1,const Standard_Boolean RecRst2,const Standard_Boolean RecP2,Standard_Real &OutValue,math_Vector & ParSol);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_RstRstFunction &
	:param Finv1:
	:type Finv1: Blend_SurfCurvFuncInv &
	:param FinvP1:
	:type FinvP1: Blend_CurvPointFuncInv &
	:param Finv2:
	:type Finv2: Blend_SurfCurvFuncInv &
	:param FinvP2:
	:type FinvP2: Blend_CurvPointFuncInv &
	:param Pmin:
	:type Pmin: float
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Blend_RstRstFunction & Func,Blend_SurfCurvFuncInv & Finv1,Blend_CurvPointFuncInv & FinvP1,Blend_SurfCurvFuncInv & Finv2,Blend_CurvPointFuncInv & FinvP2,const Standard_Real Pmin);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
		const Handle_BRepBlend_Line & Line ();
		%feature("autodoc", "	:rtype: bool
") Decroch1Start;
		Standard_Boolean Decroch1Start ();
		%feature("autodoc", "	:rtype: bool
") Decroch1End;
		Standard_Boolean Decroch1End ();
		%feature("autodoc", "	:rtype: bool
") Decroch2Start;
		Standard_Boolean Decroch2Start ();
		%feature("autodoc", "	:rtype: bool
") Decroch2End;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_BRepBlend_Line &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepBlend_SequenceNodeOfSequenceOfLine;
		 BRepBlend_SequenceNodeOfSequenceOfLine (const Handle_BRepBlend_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: BRepBlend_PointOnRst &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepBlend_SequenceNodeOfSequenceOfPointOnRst;
		 BRepBlend_SequenceNodeOfSequenceOfPointOnRst (const BRepBlend_PointOnRst & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: BRepBlend_PointOnRst
") Value;
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
		%feature("autodoc", "	:rtype: None
") BRepBlend_SequenceOfLine;
		 BRepBlend_SequenceOfLine ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfLine &
	:rtype: BRepBlend_SequenceOfLine
") Assign;
		const BRepBlend_SequenceOfLine & Assign (const BRepBlend_SequenceOfLine & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfLine &
	:rtype: BRepBlend_SequenceOfLine
") operator=;
		const BRepBlend_SequenceOfLine & operator = (const BRepBlend_SequenceOfLine & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") Append;
		void Append (const Handle_BRepBlend_Line & T);
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") Append;
		void Append (BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") Prepend;
		void Prepend (const Handle_BRepBlend_Line & T);
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") Prepend;
		void Prepend (BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_BRepBlend_Line & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_BRepBlend_Line & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepBlend_SequenceOfLine & S);
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") First;
		const Handle_BRepBlend_Line & First ();
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Last;
		const Handle_BRepBlend_Line & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: BRepBlend_SequenceOfLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepBlend_SequenceOfLine & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_BRepBlend_Line
") Value;
		const Handle_BRepBlend_Line & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_BRepBlend_Line &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_BRepBlend_Line & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_BRepBlend_Line
") ChangeValue;
		Handle_BRepBlend_Line & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") BRepBlend_SequenceOfPointOnRst;
		 BRepBlend_SequenceOfPointOnRst ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfPointOnRst &
	:rtype: BRepBlend_SequenceOfPointOnRst
") Assign;
		const BRepBlend_SequenceOfPointOnRst & Assign (const BRepBlend_SequenceOfPointOnRst & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfPointOnRst &
	:rtype: BRepBlend_SequenceOfPointOnRst
") operator=;
		const BRepBlend_SequenceOfPointOnRst & operator = (const BRepBlend_SequenceOfPointOnRst & Other);
		%feature("autodoc", "	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") Append;
		void Append (const BRepBlend_PointOnRst & T);
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") Append;
		void Append (BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") Prepend;
		void Prepend (const BRepBlend_PointOnRst & T);
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") Prepend;
		void Prepend (BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepBlend_PointOnRst & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepBlend_PointOnRst & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & S);
		%feature("autodoc", "	:rtype: BRepBlend_PointOnRst
") First;
		const BRepBlend_PointOnRst & First ();
		%feature("autodoc", "	:rtype: BRepBlend_PointOnRst
") Last;
		const BRepBlend_PointOnRst & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepBlend_PointOnRst
") Value;
		const BRepBlend_PointOnRst & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: BRepBlend_PointOnRst &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepBlend_PointOnRst & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepBlend_PointOnRst
") ChangeValue;
		BRepBlend_PointOnRst & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Cg:
	:type Cg: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_SurfCurvConstRadInv;
		 BRepBlend_SurfCurvConstRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HCurve & Cg);
		%feature("autodoc", "	:param R:
	:type R: float
	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Real R,const Standard_Integer Choix);
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	* Set the restriction on which a solution has to be found.

	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
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
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Cg:
	:type Cg: Handle_Adaptor3d_HCurve &
	:param Evol:
	:type Evol: Handle_Law_Function &
	:rtype: None
") BRepBlend_SurfCurvEvolRadInv;
		 BRepBlend_SurfCurvEvolRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HCurve & Cg,const Handle_Law_Function & Evol);
		%feature("autodoc", "	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	* Set the restriction on which a solution has to be found.

	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
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
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_SurfPointConstRadInv;
		 BRepBlend_SurfPointConstRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param R:
	:type R: float
	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Real R,const Standard_Integer Choix);
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
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
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Evol:
	:type Evol: Handle_Law_Function &
	:rtype: None
") BRepBlend_SurfPointEvolRadInv;
		 BRepBlend_SurfPointEvolRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Law_Function & Evol);
		%feature("autodoc", "	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
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
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param SurfRst:
	:type SurfRst: Handle_Adaptor3d_HSurface &
	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:param CGuide:
	:type CGuide: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_SurfRstConstRad;
		 BRepBlend_SurfRstConstRad (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_HSurface & SurfRst,const Handle_Adaptor2d_HCurve2d & Rst,const Handle_Adaptor3d_HCurve & CGuide);
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	:param SurfRef:
	:type SurfRef: Handle_Adaptor3d_HSurface &
	:param RstRef:
	:type RstRef: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef,const Handle_Adaptor2d_HCurve2d & RstRef);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt & PointOnS ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst;
		const gp_Pnt & PointOnRst ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d & Pnt2dOnS ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d & Pnt2dOnRst ();
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst;
		Standard_Real ParameterOnRst ();
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec & TangentOnS ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d & Tangent2dOnS ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst;
		const gp_Vec & TangentOnRst ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d & Tangent2dOnRst ();
		%feature("autodoc", "	* Enables implementation of a criterion of decrochage specific to the function. Warning: Can be called without previous call of issolution but the values calculated can be senseless.

	:param Sol:
	:type Sol: math_Vector &
	:param NS:
	:type NS: gp_Vec
	:param TgS:
	:type TgS: gp_Vec
	:rtype: bool
") Decroch;
		Standard_Boolean Decroch (const math_Vector & Sol,gp_Vec & NS,gp_Vec & TgS);
		%feature("autodoc", "	:param Radius:
	:type Radius: float
	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Real Radius,const Standard_Integer Choix);
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Circ
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles2d:
	:type NbPoles2d: Standard_Integer &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to respecte BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: math_Vector &
	:param Tol1D:
	:type Tol1D: math_Vector &
	:rtype: None
") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	* Used for the first and last section

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	:param IC2d:
	:type IC2d: Standard_Integer
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: None
") Resolution;
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
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param SurfRst:
	:type SurfRst: Handle_Adaptor3d_HSurface &
	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:param CGuide:
	:type CGuide: Handle_Adaptor3d_HCurve &
	:param Evol:
	:type Evol: Handle_Law_Function &
	:rtype: None
") BRepBlend_SurfRstEvolRad;
		 BRepBlend_SurfRstEvolRad (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_HSurface & SurfRst,const Handle_Adaptor2d_HCurve2d & Rst,const Handle_Adaptor3d_HCurve & CGuide,const Handle_Law_Function & Evol);
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	:param SurfRef:
	:type SurfRef: Handle_Adaptor3d_HSurface &
	:param RstRef:
	:type RstRef: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef,const Handle_Adaptor2d_HCurve2d & RstRef);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt & PointOnS ();
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst;
		const gp_Pnt & PointOnRst ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d & Pnt2dOnS ();
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d & Pnt2dOnRst ();
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst;
		Standard_Real ParameterOnRst ();
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec & TangentOnS ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d & Tangent2dOnS ();
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst;
		const gp_Vec & TangentOnRst ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d & Tangent2dOnRst ();
		%feature("autodoc", "	* Permet d ' implementer un critere de decrochage specifique a la fonction.

	:param Sol:
	:type Sol: math_Vector &
	:param NS:
	:type NS: gp_Vec
	:param TgS:
	:type TgS: gp_Vec
	:rtype: bool
") Decroch;
		Standard_Boolean Decroch (const math_Vector & Sol,gp_Vec & NS,gp_Vec & TgS);
		%feature("autodoc", "	:param Choix:
	:type Choix: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Circ
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles2d:
	:type NbPoles2d: Standard_Integer &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to respecte BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: math_Vector &
	:param Tol1D:
	:type Tol1D: math_Vector &
	:rtype: None
") GetTolerance;
		void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	* Used for the first and last section

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	:param IC2d:
	:type IC2d: Standard_Integer
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: None
") Resolution;
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
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:rtype: None
") BRepBlend_SurfRstLineBuilder;
		 BRepBlend_SurfRstLineBuilder (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor2d_HCurve2d & Rst,const Handle_Adaptor3d_TopolTool & Domain2);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_SurfRstFunction &
	:param Finv:
	:type Finv: Blend_FuncInv &
	:param FinvP:
	:type FinvP: Blend_SurfPointFuncInv &
	:param FinvC:
	:type FinvC: Blend_SurfCurvFuncInv &
	:param Pdep:
	:type Pdep: float
	:param Pmax:
	:type Pmax: float
	:param MaxStep:
	:type MaxStep: float
	:param TolGuide:
	:type TolGuide: float
	:param Soldep:
	:type Soldep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param Fleche:
	:type Fleche: float
	:param Appro: default value is Standard_False
	:type Appro: bool
	:rtype: None
") Perform;
		void Perform (Blend_SurfRstFunction & Func,Blend_FuncInv & Finv,Blend_SurfPointFuncInv & FinvP,Blend_SurfCurvFuncInv & FinvC,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_SurfRstFunction &
	:param Finv:
	:type Finv: Blend_FuncInv &
	:param FinvP:
	:type FinvP: Blend_SurfPointFuncInv &
	:param FinvC:
	:type FinvC: Blend_SurfCurvFuncInv &
	:param Pdep:
	:type Pdep: float
	:param Pmax:
	:type Pmax: float
	:param Soldep:
	:type Soldep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param TolGuide:
	:type TolGuide: float
	:param RecRst:
	:type RecRst: bool
	:param RecP:
	:type RecP: bool
	:param RecS:
	:type RecS: bool
	:param Psol:
	:type Psol: float &
	:param ParSol:
	:type ParSol: math_Vector &
	:rtype: bool
") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_SurfRstFunction & Func,Blend_FuncInv & Finv,Blend_SurfPointFuncInv & FinvP,Blend_SurfCurvFuncInv & FinvC,const Standard_Real Pdep,const Standard_Real Pmax,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real TolGuide,const Standard_Boolean RecRst,const Standard_Boolean RecP,const Standard_Boolean RecS,Standard_Real &OutValue,math_Vector & ParSol);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_SurfRstFunction &
	:param Finv:
	:type Finv: Blend_FuncInv &
	:param FinvP:
	:type FinvP: Blend_SurfPointFuncInv &
	:param FinvC:
	:type FinvC: Blend_SurfCurvFuncInv &
	:param Pmin:
	:type Pmin: float
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Blend_SurfRstFunction & Func,Blend_FuncInv & Finv,Blend_SurfPointFuncInv & FinvP,Blend_SurfCurvFuncInv & FinvC,const Standard_Real Pmin);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param PrevIndex:
	:type PrevIndex: Standard_Integer
	:param pt2d:
	:type pt2d: gp_Pnt2d
	:param lastpt2d:
	:type lastpt2d: gp_Pnt2d
	:param ponarc:
	:type ponarc: float &
	:rtype: int
") ArcToRecadre;
		Standard_Integer ArcToRecadre (const math_Vector & Sol,const Standard_Integer PrevIndex,gp_Pnt2d & pt2d,gp_Pnt2d & lastpt2d,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
		const Handle_BRepBlend_Line & Line ();
		%feature("autodoc", "	:rtype: bool
") DecrochStart;
		Standard_Boolean DecrochStart ();
		%feature("autodoc", "	:rtype: bool
") DecrochEnd;
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
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:rtype: None
") BRepBlend_Walking;
		 BRepBlend_Walking (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_TopolTool & Domain2);
		%feature("autodoc", "	:param RecDomain1:
	:type RecDomain1: Handle_Adaptor3d_TopolTool &
	:param RecDomain2:
	:type RecDomain2: Handle_Adaptor3d_TopolTool &
	:rtype: None
") SetDomainsToRecadre;
		void SetDomainsToRecadre (const Handle_Adaptor3d_TopolTool & RecDomain1,const Handle_Adaptor3d_TopolTool & RecDomain2);
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:rtype: None
") AddSingularPoint;
		void AddSingularPoint (const Blend_Point & P);
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param FInv:
	:type FInv: Blend_FuncInv &
	:param Pdep:
	:type Pdep: float
	:param Pmax:
	:type Pmax: float
	:param MaxStep:
	:type MaxStep: float
	:param TolGuide:
	:type TolGuide: float
	:param Soldep:
	:type Soldep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param Fleche:
	:type Fleche: float
	:param Appro: default value is Standard_False
	:type Appro: bool
	:rtype: None
") Perform;
		void Perform (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real Pdep,const Standard_Real Pmax,const Standard_Real MaxStep,const Standard_Real TolGuide,const math_Vector & Soldep,const Standard_Real Tolesp,const Standard_Real Fleche,const Standard_Boolean Appro = Standard_False);
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param Pdep:
	:type Pdep: float
	:param ParDep:
	:type ParDep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param TolGuide:
	:type TolGuide: float
	:param Pos1:
	:type Pos1: TopAbs_State &
	:param Pos2:
	:type Pos2: TopAbs_State &
	:rtype: bool
") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_Function & F,const Standard_Real Pdep,math_Vector & ParDep,const Standard_Real Tolesp,const Standard_Real TolGuide,TopAbs_State & Pos1,TopAbs_State & Pos2);
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param FInv:
	:type FInv: Blend_FuncInv &
	:param Pdep:
	:type Pdep: float
	:param Pmax:
	:type Pmax: float
	:param ParDep:
	:type ParDep: math_Vector &
	:param Tolesp:
	:type Tolesp: float
	:param TolGuide:
	:type TolGuide: float
	:param RecOnS1:
	:type RecOnS1: bool
	:param RecOnS2:
	:type RecOnS2: bool
	:param Psol:
	:type Psol: float &
	:param ParSol:
	:type ParSol: math_Vector &
	:rtype: bool
") PerformFirstSection;
		Standard_Boolean PerformFirstSection (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real Pdep,const Standard_Real Pmax,const math_Vector & ParDep,const Standard_Real Tolesp,const Standard_Real TolGuide,const Standard_Boolean RecOnS1,const Standard_Boolean RecOnS2,Standard_Real &OutValue,math_Vector & ParSol);
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param FInv:
	:type FInv: Blend_FuncInv &
	:param P:
	:type P: float
	:rtype: bool
") Continu;
		Standard_Boolean Continu (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real P);
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param FInv:
	:type FInv: Blend_FuncInv &
	:param P:
	:type P: float
	:param OnS1:
	:type OnS1: bool
	:rtype: bool
") Continu;
		Standard_Boolean Continu (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real P,const Standard_Boolean OnS1);
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param FInv:
	:type FInv: Blend_FuncInv &
	:param Pmin:
	:type Pmin: float
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real Pmin);
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") ClassificationOnS1;
		void ClassificationOnS1 (const Standard_Boolean C);
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") ClassificationOnS2;
		void ClassificationOnS2 (const Standard_Boolean C);
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") Check2d;
		void Check2d (const Standard_Boolean C);
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") Check;
		void Check (const Standard_Boolean C);
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		Standard_Boolean TwistOnS1 ();
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		Standard_Boolean TwistOnS2 ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
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
		%feature("autodoc", "	:param Line:
	:type Line: Handle_BRepBlend_Line &
	:param Func:
	:type Func: Blend_Function &
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") BRepBlend_AppFunc;
		 BRepBlend_AppFunc (Handle_BRepBlend_Line & Line,Blend_Function & Func,const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_AppFunction &
	:param Param:
	:type Param: float
	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Point;
		void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Vec;
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
		%feature("autodoc", "	:param Line:
	:type Line: Handle_BRepBlend_Line &
	:param Func:
	:type Func: Blend_SurfRstFunction &
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") BRepBlend_AppFuncRst;
		 BRepBlend_AppFuncRst (Handle_BRepBlend_Line & Line,Blend_SurfRstFunction & Func,const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_AppFunction &
	:param Param:
	:type Param: float
	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Point;
		void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Vec;
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
		%feature("autodoc", "	:param Line:
	:type Line: Handle_BRepBlend_Line &
	:param Func:
	:type Func: Blend_RstRstFunction &
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") BRepBlend_AppFuncRstRst;
		 BRepBlend_AppFuncRstRst (Handle_BRepBlend_Line & Line,Blend_RstRstFunction & Func,const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "	:param Func:
	:type Func: Blend_AppFunction &
	:param Param:
	:type Param: float
	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Point;
		void Point (const Blend_AppFunction & Func,const Standard_Real Param,const math_Vector & Sol,Blend_Point & Pnt);
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Vec;
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

