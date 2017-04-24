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
%module (package="OCC") BRepBlend

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


%include BRepBlend_headers.i


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
		%feature("compactdefaultargs") D0;
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
		%feature("compactdefaultargs") D1;
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
		%feature("compactdefaultargs") D2;
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
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "	* get the number of 2d curves to approximate.

	:rtype: int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> -- This information is usfull to find an good tolerance in 2d approximation

	:param Index:
	:type Index: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetTolerance;
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
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Is usfull, if (me) have to be run numerical algorithme to perform D0, D1 or D2

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditionned rational approximation.

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "	* Returns the length of the maximum section. This information is usefull to perform well conditionned rational approximation.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections. This information is usefull to perform well conditionned rational approximation.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") Point;
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
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: void
") Vec;
		virtual void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%extend BRepBlend_AppFuncRoot {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBlend_AppFuncRoot(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBlend_AppFuncRoot::Handle_BRepBlend_AppFuncRoot %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBlend_AppFuncRoot* _get_reference() {
    return (BRepBlend_AppFuncRoot*)$self->Access();
    }
};

%extend Handle_BRepBlend_AppFuncRoot {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBlend_AppFuncRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_AppSurf;
class BRepBlend_AppSurf : public AppBlend_Approx {
	public:
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "	:rtype: None
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf ();
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "	:param Degmin:
	:type Degmin: int
	:param Degmax:
	:type Degmax: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: int
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Degmin:
	:type Degmin: int
	:param Degmax:
	:type Degmax: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: int
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "	:param ParType:
	:type ParType: Approx_ParametrizationType
	:rtype: None
") SetParType;
		void SetParType (const Approx_ParametrizationType ParType);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	:param C:
	:type C: GeomAbs_Shape
	:rtype: None
") SetContinuity;
		void SetContinuity (const GeomAbs_Shape C);
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "	:param W1:
	:type W1: float
	:param W2:
	:type W2: float
	:param W3:
	:type W3: float
	:rtype: None
") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real W1,const Standard_Real W2,const Standard_Real W3);
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "	:rtype: Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "	:param W1:
	:type W1: float &
	:param W2:
	:type W2: float &
	:param W3:
	:type W3: float &
	:rtype: None
") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Lin:
	:type Lin: Handle_BRepBlend_Line &
	:param SecGen:
	:type SecGen: Blend_AppFunction &
	:param SpApprox: default value is Standard_False
	:type SpApprox: bool
	:rtype: None
") Perform;
		void Perform (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen,const Standard_Boolean SpApprox = Standard_False);
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "	:param Lin:
	:type Lin: Handle_BRepBlend_Line &
	:param SecGen:
	:type SecGen: Blend_AppFunction &
	:rtype: None
") PerformSmoothing;
		void PerformSmoothing (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Lin:
	:type Lin: Handle_BRepBlend_Line &
	:param SecGen:
	:type SecGen: Blend_AppFunction &
	:param NbMaxP:
	:type NbMaxP: int
	:rtype: None
") Perform;
		void Perform (const Handle_BRepBlend_Line & Lin,Blend_AppFunction & SecGen,const Standard_Integer NbMaxP);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "	:param UDegree:
	:type UDegree: int &
	:param VDegree:
	:type VDegree: int &
	:param NbUPoles:
	:type NbUPoles: int &
	:param NbVPoles:
	:type NbVPoles: int &
	:param NbUKnots:
	:type NbUKnots: int &
	:param NbVKnots:
	:type NbVKnots: int &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Surface;
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
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "	:param Degree:
	:type Degree: int &
	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: None
") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);
};


%extend BRepBlend_AppSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_AppSurface;
class BRepBlend_AppSurface : public AppBlend_Approx {
	public:
		%feature("compactdefaultargs") BRepBlend_AppSurface;
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
	:type Degmax: int
	:param Segmax: default value is 50
	:type Segmax: int
	:rtype: None
") BRepBlend_AppSurface;
		 BRepBlend_AppSurface (Handle_Approx_SweepFunction & Funct,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Real TolAngular,const GeomAbs_Shape Continuity = GeomAbs_C0,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 50);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "	:param UDegree:
	:type UDegree: int &
	:param VDegree:
	:type VDegree: int &
	:param NbUPoles:
	:type NbUPoles: int &
	:param NbVPoles:
	:type NbVPoles: int &
	:param NbUKnots:
	:type NbUKnots: int &
	:param NbVKnots:
	:type NbVKnots: int &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Surface;
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
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "	* returns the maximum error in the suface approximation.

	:rtype: float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf ();
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "	:param Degree:
	:type Degree: int &
	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: None
") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "	* returns the maximum error in the <Index> 2d curve approximation.

	:param Index:
	:type Index: int
	:rtype: float
") Max2dError;
		Standard_Real Max2dError (const Standard_Integer Index);
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "	:param Index:
	:type Index: int
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


%extend BRepBlend_AppSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepBlend_BlendTool {
	public:
		%feature("compactdefaultargs") Project;
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
		%feature("compactdefaultargs") Inters;
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
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of the vertex V on the edge A.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns the parametric tolerance on the arc A used to consider that the vertex and another point meet, i-e if Abs(Parameter(Vertex)-Parameter(OtherPnt))<= Tolerance, the points are 'merged'.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnUMin;
		static Standard_Boolean SingularOnUMin (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnUMax;
		static Standard_Boolean SingularOnUMax (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnVMin;
		static Standard_Boolean SingularOnVMin (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnVMax;
		static Standard_Boolean SingularOnVMax (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
		%feature("compactdefaultargs") Bounds;
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
		%feature("compactdefaultargs") CurveOnSurf;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Adaptor2d_HCurve2d
") CurveOnSurf;
		static Handle_Adaptor2d_HCurve2d CurveOnSurf (const Handle_Adaptor2d_HCurve2d & C,const Handle_Adaptor3d_HSurface & S);
};


%extend BRepBlend_BlendTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_CSWalking;
class BRepBlend_CSWalking {
	public:
		%feature("compactdefaultargs") BRepBlend_CSWalking;
		%feature("autodoc", "	:param Curv:
	:type Curv: Handle_Adaptor3d_HCurve &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:rtype: None
") BRepBlend_CSWalking;
		 BRepBlend_CSWalking (const Handle_Adaptor3d_HCurve & Curv,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain);
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "	:param F:
	:type F: Blend_CSFunction &
	:param Pmin:
	:type Pmin: float
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Blend_CSFunction & F,const Standard_Real Pmin);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
		Handle_BRepBlend_Line Line ();
};


%extend BRepBlend_CSWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_CurvPointRadInv;
class BRepBlend_CurvPointRadInv : public Blend_CurvPointFuncInv {
	public:
		%feature("compactdefaultargs") BRepBlend_CurvPointRadInv;
		%feature("autodoc", "	:param C1:
	:type C1: Handle_Adaptor3d_HCurve &
	:param C2:
	:type C2: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_CurvPointRadInv;
		 BRepBlend_CurvPointRadInv (const Handle_Adaptor3d_HCurve & C1,const Handle_Adaptor3d_HCurve & C2);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & P);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend BRepBlend_CurvPointRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_Extremity;
class BRepBlend_Extremity {
	public:
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "	:rtype: None
") BRepBlend_Extremity;
		 BRepBlend_Extremity ();
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "	* Creates an extremity on a surface

	:param P:
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
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "	* Creates an extremity on a surface. This extremity matches the vertex <Vtx>.

	:param P:
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
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "	* Creates an extremity on a curve

	:param P:
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
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for an extremity on a surface.

	:param P:
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
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for an extremity on a surface.This extremity matches the vertex <Vtx>.

	:param P:
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
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for an extremity on curve.

	:param P:
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* This method returns the value of the point in 3d space.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") SetTangent;
		%feature("autodoc", "	* Set the tangent vector for an extremity on a surface.

	:param Tangent:
	:type Tangent: gp_Vec
	:rtype: None
") SetTangent;
		void SetTangent (const gp_Vec & Tangent);
		%feature("compactdefaultargs") HasTangent;
		%feature("autodoc", "	* Returns True if the Tangent is stored.

	:rtype: bool
") HasTangent;
		Standard_Boolean HasTangent ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* This method returns the value of tangent in 3d space.

	:rtype: gp_Vec
") Tangent;
		const gp_Vec  Tangent ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* This method returns the fuzziness on the point in 3d space.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	* Set the values for an extremity on a curve.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: None
") SetVertex;
		void SetVertex (const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") AddArc;
		%feature("autodoc", "	* Sets the values of a point which is on the arc A, at parameter Param.

	:param A:
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
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* This method returns the parameters of the point on the concerned surface.

	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Returns Standard_True when the point coincide with an existing vertex.

	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the vertex when IsVertex returns Standard_True.

	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		Handle_Adaptor3d_HVertex Vertex ();
		%feature("compactdefaultargs") NbPointOnRst;
		%feature("autodoc", "	* Returns the number of arc containing the extremity. If the method returns 0, the point is inside the surface. Otherwise, the extremity lies on at least 1 arc, and all the information (arc, parameter, transitions) are given by the point on restriction (PointOnRst) returned by the next method.

	:rtype: int
") NbPointOnRst;
		Standard_Integer NbPointOnRst ();
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepBlend_PointOnRst
") PointOnRst;
		const BRepBlend_PointOnRst & PointOnRst (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") ParameterOnGuide;
		%feature("autodoc", "	:rtype: float
") ParameterOnGuide;
		Standard_Real ParameterOnGuide ();
};


%extend BRepBlend_Extremity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_Line;
class BRepBlend_Line : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepBlend_Line;
		%feature("autodoc", "	:rtype: None
") BRepBlend_Line;
		 BRepBlend_Line ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the content of the line.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Adds a point in the line.

	:param P:
	:type P: Blend_Point &
	:rtype: None
") Append;
		void Append (const Blend_Point & P);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Adds a point in the line at the first place.

	:param P:
	:type P: Blend_Point &
	:rtype: None
") Prepend;
		void Prepend (const Blend_Point & P);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Adds a point in the line at the first place.

	:param Index:
	:type Index: int
	:param P:
	:type P: Blend_Point &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Blend_Point & P);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes from <self> all the items of positions between <FromIndex> and <ToIndex>. Raises an exception if the indices are out of bounds.

	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the transition of the line on S1 and the line on S2.

	:param TranS1:
	:type TranS1: IntSurf_TypeTrans
	:param TranS2:
	:type TranS2: IntSurf_TypeTrans
	:rtype: None
") Set;
		void Set (const IntSurf_TypeTrans TranS1,const IntSurf_TypeTrans TranS2);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the transition of the line on a surface

	:param Trans:
	:type Trans: IntSurf_TypeTrans
	:rtype: None
") Set;
		void Set (const IntSurf_TypeTrans Trans);
		%feature("compactdefaultargs") SetStartPoints;
		%feature("autodoc", "	* Sets the values of the start points for the line.

	:param StartPt1:
	:type StartPt1: BRepBlend_Extremity &
	:param StartPt2:
	:type StartPt2: BRepBlend_Extremity &
	:rtype: None
") SetStartPoints;
		void SetStartPoints (const BRepBlend_Extremity & StartPt1,const BRepBlend_Extremity & StartPt2);
		%feature("compactdefaultargs") SetEndPoints;
		%feature("autodoc", "	* Sets tne values of the end points for the line.

	:param EndPt1:
	:type EndPt1: BRepBlend_Extremity &
	:param EndPt2:
	:type EndPt2: BRepBlend_Extremity &
	:rtype: None
") SetEndPoints;
		void SetEndPoints (const BRepBlend_Extremity & EndPt1,const BRepBlend_Extremity & EndPt2);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of points in the line.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of range Index.

	:param Index:
	:type Index: int
	:rtype: Blend_Point
") Point;
		const Blend_Point & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "	* Returns the type of the transition of the line defined on the first surface. The transition is 'constant' along the line. The transition is IN if the line is oriented in such a way that the system of vectors (N,DRac,T) is right-handed, where N is the normal to the first surface at a point P, DRac is a vector tangent to the blending patch, oriented towards the valid part of this patch, T is the tangent to the line on S1 at P. The transitioon is OUT when the system of vectors is left-handed.

	:rtype: IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1 ();
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "	* Returns the type of the transition of the line defined on the second surface. The transition is 'constant' along the line.

	:rtype: IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2 ();
		%feature("compactdefaultargs") StartPointOnFirst;
		%feature("autodoc", "	* Returns the start point on S1.

	:rtype: BRepBlend_Extremity
") StartPointOnFirst;
		const BRepBlend_Extremity & StartPointOnFirst ();
		%feature("compactdefaultargs") StartPointOnSecond;
		%feature("autodoc", "	* Returns the start point on S2

	:rtype: BRepBlend_Extremity
") StartPointOnSecond;
		const BRepBlend_Extremity & StartPointOnSecond ();
		%feature("compactdefaultargs") EndPointOnFirst;
		%feature("autodoc", "	* Returns the end point on S1.

	:rtype: BRepBlend_Extremity
") EndPointOnFirst;
		const BRepBlend_Extremity & EndPointOnFirst ();
		%feature("compactdefaultargs") EndPointOnSecond;
		%feature("autodoc", "	* Returns the point on S2.

	:rtype: BRepBlend_Extremity
") EndPointOnSecond;
		const BRepBlend_Extremity & EndPointOnSecond ();
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "	* Returns the type of the transition of the line defined on the surface.

	:rtype: IntSurf_TypeTrans
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS ();
};


%extend BRepBlend_Line {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBlend_Line(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBlend_Line::Handle_BRepBlend_Line %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBlend_Line* _get_reference() {
    return (BRepBlend_Line*)$self->Access();
    }
};

%extend Handle_BRepBlend_Line {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBlend_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_PointOnRst;
class BRepBlend_PointOnRst {
	public:
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst ();
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "	* Creates the PointOnRst on the arc A, at parameter Param, with the transition TLine on the walking line, and TArc on the arc A.

	:param A:
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
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "	* Sets the values of a point which is on the arc A, at parameter Param.

	:param A:
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
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	* Returns the arc of restriction containing the vertex.

	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		Handle_Adaptor2d_HCurve2d Arc ();
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "	* Returns the transition of the point on the line on surface.

	:rtype: IntSurf_Transition
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine ();
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "	* Returns the transition of the point on the arc returned by Arc().

	:rtype: IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc ();
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "	* Returns the parameter of the point on the arc returned by the method Arc().

	:rtype: float
") ParameterOnArc;
		Standard_Real ParameterOnArc ();
};


%extend BRepBlend_PointOnRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_RstRstConstRad;
class BRepBlend_RstRstConstRad : public Blend_RstRstFunction {
	public:
		%feature("compactdefaultargs") BRepBlend_RstRstConstRad;
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
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst1;
		const gp_Pnt  PointOnRst1 ();
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst2;
		const gp_Pnt  PointOnRst2 ();
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d  Pnt2dOnRst1 ();
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d  Pnt2dOnRst2 ();
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1 ();
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst1;
		const gp_Vec  TangentOnRst1 ();
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d  Tangent2dOnRst1 ();
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst2;
		const gp_Vec  TangentOnRst2 ();
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d  Tangent2dOnRst2 ();
		%feature("compactdefaultargs") Decroch;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Radius:
	:type Radius: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real Radius,const Standard_Integer Choix);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("compactdefaultargs") CenterCircleRst1Rst2;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetTolerance;
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
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param IC2d:
	:type IC2d: int
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


%extend BRepBlend_RstRstConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_RstRstEvolRad;
class BRepBlend_RstRstEvolRad : public Blend_RstRstFunction {
	public:
		%feature("compactdefaultargs") BRepBlend_RstRstEvolRad;
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
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* Returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst1;
		const gp_Pnt  PointOnRst1 ();
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst2;
		const gp_Pnt  PointOnRst2 ();
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d  Pnt2dOnRst1 ();
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d  Pnt2dOnRst2 ();
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1 ();
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst1;
		const gp_Vec  TangentOnRst1 ();
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d  Tangent2dOnRst1 ();
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst2;
		const gp_Vec  TangentOnRst2 ();
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d  Tangent2dOnRst2 ();
		%feature("compactdefaultargs") Decroch;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("compactdefaultargs") CenterCircleRst1Rst2;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetTolerance;
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
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param IC2d:
	:type IC2d: int
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


%extend BRepBlend_RstRstEvolRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_RstRstLineBuilder;
class BRepBlend_RstRstLineBuilder {
	public:
		%feature("compactdefaultargs") BRepBlend_RstRstLineBuilder;
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
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") PerformFirstSection;
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
		%feature("compactdefaultargs") Complete;
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
		Handle_BRepBlend_Line Line ();
		%feature("compactdefaultargs") Decroch1Start;
		%feature("autodoc", "	:rtype: bool
") Decroch1Start;
		Standard_Boolean Decroch1Start ();
		%feature("compactdefaultargs") Decroch1End;
		%feature("autodoc", "	:rtype: bool
") Decroch1End;
		Standard_Boolean Decroch1End ();
		%feature("compactdefaultargs") Decroch2Start;
		%feature("autodoc", "	:rtype: bool
") Decroch2Start;
		Standard_Boolean Decroch2Start ();
		%feature("compactdefaultargs") Decroch2End;
		%feature("autodoc", "	:rtype: bool
") Decroch2End;
		Standard_Boolean Decroch2End ();
};


%extend BRepBlend_RstRstLineBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SequenceNodeOfSequenceOfLine;
class BRepBlend_SequenceNodeOfSequenceOfLine : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepBlend_SequenceNodeOfSequenceOfLine;
		%feature("autodoc", "	:param I:
	:type I: Handle_BRepBlend_Line &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepBlend_SequenceNodeOfSequenceOfLine;
		 BRepBlend_SequenceNodeOfSequenceOfLine (const Handle_BRepBlend_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Value;
		Handle_BRepBlend_Line Value ();
};


%extend BRepBlend_SequenceNodeOfSequenceOfLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBlend_SequenceNodeOfSequenceOfLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBlend_SequenceNodeOfSequenceOfLine::Handle_BRepBlend_SequenceNodeOfSequenceOfLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBlend_SequenceNodeOfSequenceOfLine* _get_reference() {
    return (BRepBlend_SequenceNodeOfSequenceOfLine*)$self->Access();
    }
};

%extend Handle_BRepBlend_SequenceNodeOfSequenceOfLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBlend_SequenceNodeOfSequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SequenceNodeOfSequenceOfPointOnRst;
class BRepBlend_SequenceNodeOfSequenceOfPointOnRst : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepBlend_SequenceNodeOfSequenceOfPointOnRst;
		%feature("autodoc", "	:param I:
	:type I: BRepBlend_PointOnRst &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepBlend_SequenceNodeOfSequenceOfPointOnRst;
		 BRepBlend_SequenceNodeOfSequenceOfPointOnRst (const BRepBlend_PointOnRst & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepBlend_PointOnRst
") Value;
		BRepBlend_PointOnRst & Value ();
};


%extend BRepBlend_SequenceNodeOfSequenceOfPointOnRst {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst::Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBlend_SequenceNodeOfSequenceOfPointOnRst* _get_reference() {
    return (BRepBlend_SequenceNodeOfSequenceOfPointOnRst*)$self->Access();
    }
};

%extend Handle_BRepBlend_SequenceNodeOfSequenceOfPointOnRst {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBlend_SequenceNodeOfSequenceOfPointOnRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SequenceOfLine;
class BRepBlend_SequenceOfLine : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepBlend_SequenceOfLine;
		%feature("autodoc", "	:rtype: None
") BRepBlend_SequenceOfLine;
		 BRepBlend_SequenceOfLine ();
		%feature("compactdefaultargs") BRepBlend_SequenceOfLine;
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfLine &
	:rtype: None
") BRepBlend_SequenceOfLine;
		 BRepBlend_SequenceOfLine (const BRepBlend_SequenceOfLine & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfLine &
	:rtype: BRepBlend_SequenceOfLine
") Assign;
		const BRepBlend_SequenceOfLine & Assign (const BRepBlend_SequenceOfLine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfLine &
	:rtype: BRepBlend_SequenceOfLine
") operator =;
		const BRepBlend_SequenceOfLine & operator = (const BRepBlend_SequenceOfLine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") Append;
		void Append (const Handle_BRepBlend_Line & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") Append;
		void Append (BRepBlend_SequenceOfLine & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") Prepend;
		void Prepend (const Handle_BRepBlend_Line & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") Prepend;
		void Prepend (BRepBlend_SequenceOfLine & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_BRepBlend_Line & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepBlend_SequenceOfLine & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_BRepBlend_Line &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_BRepBlend_Line & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepBlend_SequenceOfLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepBlend_SequenceOfLine & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") First;
		Handle_BRepBlend_Line First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Last;
		Handle_BRepBlend_Line Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepBlend_SequenceOfLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepBlend_SequenceOfLine & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_BRepBlend_Line
") Value;
		Handle_BRepBlend_Line Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_BRepBlend_Line &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_BRepBlend_Line & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_BRepBlend_Line
") ChangeValue;
		Handle_BRepBlend_Line ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend BRepBlend_SequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SequenceOfPointOnRst;
class BRepBlend_SequenceOfPointOnRst : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepBlend_SequenceOfPointOnRst;
		%feature("autodoc", "	:rtype: None
") BRepBlend_SequenceOfPointOnRst;
		 BRepBlend_SequenceOfPointOnRst ();
		%feature("compactdefaultargs") BRepBlend_SequenceOfPointOnRst;
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") BRepBlend_SequenceOfPointOnRst;
		 BRepBlend_SequenceOfPointOnRst (const BRepBlend_SequenceOfPointOnRst & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfPointOnRst &
	:rtype: BRepBlend_SequenceOfPointOnRst
") Assign;
		const BRepBlend_SequenceOfPointOnRst & Assign (const BRepBlend_SequenceOfPointOnRst & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepBlend_SequenceOfPointOnRst &
	:rtype: BRepBlend_SequenceOfPointOnRst
") operator =;
		const BRepBlend_SequenceOfPointOnRst & operator = (const BRepBlend_SequenceOfPointOnRst & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") Append;
		void Append (const BRepBlend_PointOnRst & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") Append;
		void Append (BRepBlend_SequenceOfPointOnRst & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") Prepend;
		void Prepend (const BRepBlend_PointOnRst & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") Prepend;
		void Prepend (BRepBlend_SequenceOfPointOnRst & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepBlend_PointOnRst & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepBlend_PointOnRst &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepBlend_PointOnRst & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepBlend_PointOnRst
") First;
		const BRepBlend_PointOnRst & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepBlend_PointOnRst
") Last;
		const BRepBlend_PointOnRst & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepBlend_SequenceOfPointOnRst &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepBlend_SequenceOfPointOnRst & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepBlend_PointOnRst
") Value;
		const BRepBlend_PointOnRst & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: BRepBlend_PointOnRst &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepBlend_PointOnRst & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepBlend_PointOnRst
") ChangeValue;
		BRepBlend_PointOnRst & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend BRepBlend_SequenceOfPointOnRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SurfCurvConstRadInv;
class BRepBlend_SurfCurvConstRadInv : public Blend_SurfCurvFuncInv {
	public:
		%feature("compactdefaultargs") BRepBlend_SurfCurvConstRadInv;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Cg:
	:type Cg: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_SurfCurvConstRadInv;
		 BRepBlend_SurfCurvConstRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HCurve & Cg);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param R:
	:type R: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real R,const Standard_Integer Choix);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the restriction on which a solution has to be found.

	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend BRepBlend_SurfCurvConstRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SurfCurvEvolRadInv;
class BRepBlend_SurfCurvEvolRadInv : public Blend_SurfCurvFuncInv {
	public:
		%feature("compactdefaultargs") BRepBlend_SurfCurvEvolRadInv;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the restriction on which a solution has to be found.

	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend BRepBlend_SurfCurvEvolRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SurfPointConstRadInv;
class BRepBlend_SurfPointConstRadInv : public Blend_SurfPointFuncInv {
	public:
		%feature("compactdefaultargs") BRepBlend_SurfPointConstRadInv;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BRepBlend_SurfPointConstRadInv;
		 BRepBlend_SurfPointConstRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param R:
	:type R: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real R,const Standard_Integer Choix);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & P);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend BRepBlend_SurfPointConstRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SurfPointEvolRadInv;
class BRepBlend_SurfPointEvolRadInv : public Blend_SurfPointFuncInv {
	public:
		%feature("compactdefaultargs") BRepBlend_SurfPointEvolRadInv;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Evol:
	:type Evol: Handle_Law_Function &
	:rtype: None
") BRepBlend_SurfPointEvolRadInv;
		 BRepBlend_SurfPointEvolRadInv (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Law_Function & Evol);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & P);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend BRepBlend_SurfPointEvolRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SurfRstConstRad;
class BRepBlend_SurfRstConstRad : public Blend_SurfRstFunction {
	public:
		%feature("compactdefaultargs") BRepBlend_SurfRstConstRad;
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
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param SurfRef:
	:type SurfRef: Handle_Adaptor3d_HSurface &
	:param RstRef:
	:type RstRef: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef,const Handle_Adaptor2d_HCurve2d & RstRef);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst;
		const gp_Pnt  PointOnRst ();
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d  Pnt2dOnS ();
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d  Pnt2dOnRst ();
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst;
		Standard_Real ParameterOnRst ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d  Tangent2dOnS ();
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst;
		const gp_Vec  TangentOnRst ();
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d  Tangent2dOnRst ();
		%feature("compactdefaultargs") Decroch;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Radius:
	:type Radius: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real Radius,const Standard_Integer Choix);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetTolerance;
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
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param IC2d:
	:type IC2d: int
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


%extend BRepBlend_SurfRstConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SurfRstEvolRad;
class BRepBlend_SurfRstEvolRad : public Blend_SurfRstFunction {
	public:
		%feature("compactdefaultargs") BRepBlend_SurfRstEvolRad;
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
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param SurfRef:
	:type SurfRef: Handle_Adaptor3d_HSurface &
	:param RstRef:
	:type RstRef: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & SurfRef,const Handle_Adaptor2d_HCurve2d & RstRef);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Set;
		void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: None
") GetTolerance;
		void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: None
") GetBounds;
		void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnRst;
		const gp_Pnt  PointOnRst ();
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d  Pnt2dOnS ();
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d  Pnt2dOnRst ();
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst;
		Standard_Real ParameterOnRst ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d  Tangent2dOnS ();
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnRst;
		const gp_Vec  TangentOnRst ();
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d  Tangent2dOnRst ();
		%feature("compactdefaultargs") Decroch;
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the type of section generation for the approximations.

	:param TypeSection:
	:type TypeSection: BlendFunc_SectionShape
	:rtype: None
") Set;
		void Set (const BlendFunc_SectionShape TypeSection);
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		Standard_Real GetSectionSize ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") GetMinimalWeight;
		void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetTolerance;
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
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Section;
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
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param IC2d:
	:type IC2d: int
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


%extend BRepBlend_SurfRstEvolRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_SurfRstLineBuilder;
class BRepBlend_SurfRstLineBuilder {
	public:
		%feature("compactdefaultargs") BRepBlend_SurfRstLineBuilder;
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
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") PerformFirstSection;
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
		%feature("compactdefaultargs") Complete;
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
		%feature("compactdefaultargs") ArcToRecadre;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param PrevIndex:
	:type PrevIndex: int
	:param pt2d:
	:type pt2d: gp_Pnt2d
	:param lastpt2d:
	:type lastpt2d: gp_Pnt2d
	:param ponarc:
	:type ponarc: float &
	:rtype: int
") ArcToRecadre;
		Standard_Integer ArcToRecadre (const math_Vector & Sol,const Standard_Integer PrevIndex,gp_Pnt2d & pt2d,gp_Pnt2d & lastpt2d,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
		Handle_BRepBlend_Line Line ();
		%feature("compactdefaultargs") DecrochStart;
		%feature("autodoc", "	:rtype: bool
") DecrochStart;
		Standard_Boolean DecrochStart ();
		%feature("compactdefaultargs") DecrochEnd;
		%feature("autodoc", "	:rtype: bool
") DecrochEnd;
		Standard_Boolean DecrochEnd ();
};


%extend BRepBlend_SurfRstLineBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_Walking;
class BRepBlend_Walking {
	public:
		%feature("compactdefaultargs") BRepBlend_Walking;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:param HGuide:
	:type HGuide: Handle_ChFiDS_HElSpine &
	:rtype: None
") BRepBlend_Walking;
		 BRepBlend_Walking (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_TopolTool & Domain2,const Handle_ChFiDS_HElSpine & HGuide);
		%feature("compactdefaultargs") SetDomainsToRecadre;
		%feature("autodoc", "	:param RecDomain1:
	:type RecDomain1: Handle_Adaptor3d_TopolTool &
	:param RecDomain2:
	:type RecDomain2: Handle_Adaptor3d_TopolTool &
	:rtype: None
") SetDomainsToRecadre;
		void SetDomainsToRecadre (const Handle_Adaptor3d_TopolTool & RecDomain1,const Handle_Adaptor3d_TopolTool & RecDomain2);
		%feature("compactdefaultargs") AddSingularPoint;
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:rtype: None
") AddSingularPoint;
		void AddSingularPoint (const Blend_Point & P);
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") PerformFirstSection;
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
		%feature("compactdefaultargs") PerformFirstSection;
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
		%feature("compactdefaultargs") Continu;
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param FInv:
	:type FInv: Blend_FuncInv &
	:param P:
	:type P: float
	:rtype: bool
") Continu;
		Standard_Boolean Continu (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real P);
		%feature("compactdefaultargs") Continu;
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
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "	:param F:
	:type F: Blend_Function &
	:param FInv:
	:type FInv: Blend_FuncInv &
	:param Pmin:
	:type Pmin: float
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Blend_Function & F,Blend_FuncInv & FInv,const Standard_Real Pmin);
		%feature("compactdefaultargs") ClassificationOnS1;
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") ClassificationOnS1;
		void ClassificationOnS1 (const Standard_Boolean C);
		%feature("compactdefaultargs") ClassificationOnS2;
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") ClassificationOnS2;
		void ClassificationOnS2 (const Standard_Boolean C);
		%feature("compactdefaultargs") Check2d;
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") Check2d;
		void Check2d (const Standard_Boolean C);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param C:
	:type C: bool
	:rtype: None
") Check;
		void Check (const Standard_Boolean C);
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		Standard_Boolean TwistOnS1 ();
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		Standard_Boolean TwistOnS2 ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: Handle_BRepBlend_Line
") Line;
		Handle_BRepBlend_Line Line ();
};


%extend BRepBlend_Walking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_AppFunc;
class BRepBlend_AppFunc : public BRepBlend_AppFuncRoot {
	public:
		%feature("compactdefaultargs") BRepBlend_AppFunc;
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
		%feature("compactdefaultargs") Point;
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
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Vec;
		void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%extend BRepBlend_AppFunc {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBlend_AppFunc(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBlend_AppFunc::Handle_BRepBlend_AppFunc %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBlend_AppFunc* _get_reference() {
    return (BRepBlend_AppFunc*)$self->Access();
    }
};

%extend Handle_BRepBlend_AppFunc {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBlend_AppFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_AppFuncRst;
class BRepBlend_AppFuncRst : public BRepBlend_AppFuncRoot {
	public:
		%feature("compactdefaultargs") BRepBlend_AppFuncRst;
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
		%feature("compactdefaultargs") Point;
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
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Vec;
		void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%extend BRepBlend_AppFuncRst {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBlend_AppFuncRst(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBlend_AppFuncRst::Handle_BRepBlend_AppFuncRst %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBlend_AppFuncRst* _get_reference() {
    return (BRepBlend_AppFuncRst*)$self->Access();
    }
};

%extend Handle_BRepBlend_AppFuncRst {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBlend_AppFuncRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBlend_AppFuncRstRst;
class BRepBlend_AppFuncRstRst : public BRepBlend_AppFuncRoot {
	public:
		%feature("compactdefaultargs") BRepBlend_AppFuncRstRst;
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
		%feature("compactdefaultargs") Point;
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
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "	:param Sol:
	:type Sol: math_Vector &
	:param Pnt:
	:type Pnt: Blend_Point &
	:rtype: None
") Vec;
		void Vec (math_Vector & Sol,const Blend_Point & Pnt);
};


%extend BRepBlend_AppFuncRstRst {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBlend_AppFuncRstRst(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBlend_AppFuncRstRst::Handle_BRepBlend_AppFuncRstRst %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBlend_AppFuncRstRst* _get_reference() {
    return (BRepBlend_AppFuncRstRst*)$self->Access();
    }
};

%extend Handle_BRepBlend_AppFuncRstRst {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBlend_AppFuncRstRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
