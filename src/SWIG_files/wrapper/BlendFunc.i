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
%module (package="OCC") BlendFunc

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


%include BlendFunc_headers.i


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
enum BlendFunc_SectionShape {
	BlendFunc_Rational = 0,
	BlendFunc_QuasiAngular = 1,
	BlendFunc_Polynomial = 2,
	BlendFunc_Linear = 3,
};

/* end public enums declaration */

%rename(blendfunc) BlendFunc;
class BlendFunc {
	public:
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param SectShape:
	:type SectShape: BlendFunc_SectionShape
	:param MaxAng:
	:type MaxAng: float
	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param TypeConv:
	:type TypeConv: Convert_ParameterisationType &
	:rtype: void
") GetShape;
		static void GetShape (const BlendFunc_SectionShape SectShape,const Standard_Real MaxAng,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Convert_ParameterisationType & TypeConv);
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "	:param SectShape:
	:type SectShape: BlendFunc_SectionShape
	:param TConv:
	:type TConv: Convert_ParameterisationType
	:param AngleMin:
	:type AngleMin: float
	:param AngleMax:
	:type AngleMax: float
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeights;
		static void GetMinimalWeights (const BlendFunc_SectionShape SectShape,const Convert_ParameterisationType TConv,const Standard_Real AngleMin,const Standard_Real AngleMax,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", "	* Used to obtain the next level of continuity.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: GeomAbs_Shape
") NextShape;
		static GeomAbs_Shape NextShape (const GeomAbs_Shape S);
		%feature("compactdefaultargs") ComputeNormal;
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param p2d:
	:type p2d: gp_Pnt2d
	:param Normal:
	:type Normal: gp_Vec
	:rtype: bool
") ComputeNormal;
		static Standard_Boolean ComputeNormal (const Handle_Adaptor3d_HSurface & Surf,const gp_Pnt2d & p2d,gp_Vec & Normal);
		%feature("compactdefaultargs") ComputeDNormal;
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param p2d:
	:type p2d: gp_Pnt2d
	:param Normal:
	:type Normal: gp_Vec
	:param DNu:
	:type DNu: gp_Vec
	:param DNv:
	:type DNv: gp_Vec
	:rtype: bool
") ComputeDNormal;
		static Standard_Boolean ComputeDNormal (const Handle_Adaptor3d_HSurface & Surf,const gp_Pnt2d & p2d,gp_Vec & Normal,gp_Vec & DNu,gp_Vec & DNv);
};


%extend BlendFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_CSCircular;
class BlendFunc_CSCircular : public Blend_CSFunction {
	public:
		%feature("compactdefaultargs") BlendFunc_CSCircular;
		%feature("autodoc", "	* Creates a function for a circular blending between a curve <C> and a surface <S>. The direction of the planes are given by <CGuide>. The position of the plane is determined on the curve <C>. <L> defines the change of parameter between <C> and <CGuide>. So, the planes are defined as described below : t is the current parameter on the guide line. Pguide = C(L(t)); Nguide = CGuide'(t)/||CGuide'(t)||

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param CGuide:
	:type CGuide: Handle_Adaptor3d_HCurve &
	:param L:
	:type L: Handle_Law_Function &
	:rtype: None
") BlendFunc_CSCircular;
		 BlendFunc_CSCircular (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HCurve & CGuide,const Handle_Law_Function & L);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function (3).

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
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param First:
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
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnC;
		const gp_Pnt  PointOnC ();
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2d;
		const gp_Pnt2d  Pnt2d ();
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnC;
		Standard_Real ParameterOnC ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2d;
		const gp_Vec2d  Tangent2d ();
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnC;
		const gp_Vec  TangentOnC ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param TgS:
	:type TgS: gp_Vec
	:param NormS:
	:type NormS: gp_Vec
	:rtype: None
") Tangent;
		void Tangent (const Standard_Real U,const Standard_Real V,gp_Vec & TgS,gp_Vec & NormS);
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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") GetSection;
		Standard_Boolean GetSection (const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,TColgp_Array1OfPnt & tabP,TColgp_Array1OfVec & tabV);
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
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard

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


%extend BlendFunc_CSCircular {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_CSConstRad;
class BlendFunc_CSConstRad : public Blend_CSFunction {
	public:
		%feature("compactdefaultargs") BlendFunc_CSConstRad;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param CGuide:
	:type CGuide: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_CSConstRad;
		 BlendFunc_CSConstRad (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HCurve & CGuide);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function (3).

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
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param First:
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
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnC;
		const gp_Pnt  PointOnC ();
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2d;
		const gp_Pnt2d  Pnt2d ();
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnC;
		Standard_Real ParameterOnC ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2d;
		const gp_Vec2d  Tangent2d ();
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnC;
		const gp_Vec  TangentOnC ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param TgS:
	:type TgS: gp_Vec
	:param NormS:
	:type NormS: gp_Vec
	:rtype: None
") Tangent;
		void Tangent (const Standard_Real U,const Standard_Real V,gp_Vec & TgS,gp_Vec & NormS);
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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") GetSection;
		Standard_Boolean GetSection (const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,TColgp_Array1OfPnt & tabP,TColgp_Array1OfVec & tabV);
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
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard

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


%extend BlendFunc_CSConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_ChAsym;
class BlendFunc_ChAsym : public Blend_Function {
	public:
		%feature("compactdefaultargs") BlendFunc_ChAsym;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_ChAsym;
		 BlendFunc_ChAsym (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param First:
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
		Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") ComputeValues;
		%feature("autodoc", "	* computes the values <F> of the derivatives for the variable <X> between DegF and DegL. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param DegF:
	:type DegF: int
	:param DegL:
	:type DegL: int
	:rtype: bool
") ComputeValues;
		Standard_Boolean ComputeValues (const math_Vector & X,const Standard_Integer DegF,const Standard_Integer DegL);
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
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS1;
		const gp_Pnt  PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS2;
		const gp_Pnt  PointOnS2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS1;
		const gp_Vec  TangentOnS1 ();
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d  Tangent2dOnS1 ();
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS2;
		const gp_Vec  TangentOnS2 ();
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d  Tangent2dOnS2 ();
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1 ();
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2 ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param TgFirst:
	:type TgFirst: gp_Vec
	:param TgLast:
	:type TgLast: gp_Vec
	:param NormFirst:
	:type NormFirst: gp_Vec
	:param NormLast:
	:type NormLast: gp_Vec
	:rtype: None
") Tangent;
		void Tangent (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,gp_Vec & TgFirst,gp_Vec & TgLast,gp_Vec & NormFirst,gp_Vec & NormLast);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Utile pour une visu rapide et approximative de la surface.

	:param Param:
	:type Param: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Lin
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,Standard_Real &OutValue,Standard_Real &OutValue,gp_Lin & C);
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
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section

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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the distances and the angle.

	:param Dist1:
	:type Dist1: float
	:param Angle:
	:type Angle: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real Dist1,const Standard_Real Angle,const Standard_Integer Choix);
};


%extend BlendFunc_ChAsym {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_ChAsymInv;
class BlendFunc_ChAsymInv : public Blend_FuncInv {
	public:
		%feature("compactdefaultargs") BlendFunc_ChAsymInv;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_ChAsymInv;
		 BlendFunc_ChAsymInv (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param OnFirst:
	:type OnFirst: bool
	:param COnSurf:
	:type COnSurf: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & COnSurf);
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") ComputeValues;
		%feature("autodoc", "	* computes the values <F> of the derivatives for the variable <X> between DegF and DegL. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param DegF:
	:type DegF: int
	:param DegL:
	:type DegL: int
	:rtype: bool
") ComputeValues;
		Standard_Boolean ComputeValues (const math_Vector & X,const Standard_Integer DegF,const Standard_Integer DegL);
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
		%feature("autodoc", "	:param Dist1:
	:type Dist1: float
	:param Angle:
	:type Angle: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real Dist1,const Standard_Real Angle,const Standard_Integer Choix);
};


%extend BlendFunc_ChAsymInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_ChamfInv;
class BlendFunc_ChamfInv : public Blend_FuncInv {
	public:
		%feature("compactdefaultargs") BlendFunc_ChamfInv;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_ChamfInv;
		 BlendFunc_ChamfInv (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param OnFirst:
	:type OnFirst: bool
	:param COnSurf:
	:type COnSurf: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & COnSurf);
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
		%feature("autodoc", "	:param Dist1:
	:type Dist1: float
	:param Dist2:
	:type Dist2: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real Dist1,const Standard_Real Dist2,const Standard_Integer Choix);
};


%extend BlendFunc_ChamfInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_Chamfer;
class BlendFunc_Chamfer : public Blend_Function {
	public:
		%feature("compactdefaultargs") BlendFunc_Chamfer;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param CG:
	:type CG: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_Chamfer;
		 BlendFunc_Chamfer (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & CG);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param First:
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
		Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS1;
		const gp_Pnt  PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS2;
		const gp_Pnt  PointOnS2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS1;
		const gp_Vec  TangentOnS1 ();
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d  Tangent2dOnS1 ();
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS2;
		const gp_Vec  TangentOnS2 ();
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d  Tangent2dOnS2 ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param TgFirst:
	:type TgFirst: gp_Vec
	:param TgLast:
	:type TgLast: gp_Vec
	:param NormFirst:
	:type NormFirst: gp_Vec
	:param NormLast:
	:type NormLast: gp_Vec
	:rtype: None
") Tangent;
		void Tangent (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,gp_Vec & TgFirst,gp_Vec & TgLast,gp_Vec & NormFirst,gp_Vec & NormLast);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the distances and the 'quadrant'.

	:param Dist1:
	:type Dist1: float
	:param Dist2:
	:type Dist2: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real Dist1,const Standard_Real Dist2,const Standard_Integer Choix);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns False

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
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard

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
		%feature("autodoc", "	* Obsolete method

	:param Param:
	:type Param: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Lin
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,Standard_Real &OutValue,Standard_Real &OutValue,gp_Lin & C);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section

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


%extend BlendFunc_Chamfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_ConstRad;
class BlendFunc_ConstRad : public Blend_Function {
	public:
		%feature("compactdefaultargs") BlendFunc_ConstRad;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_ConstRad;
		 BlendFunc_ConstRad (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param First:
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
		Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS1;
		const gp_Pnt  PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS2;
		const gp_Pnt  PointOnS2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS1;
		const gp_Vec  TangentOnS1 ();
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d  Tangent2dOnS1 ();
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS2;
		const gp_Vec  TangentOnS2 ();
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d  Tangent2dOnS2 ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param TgFirst:
	:type TgFirst: gp_Vec
	:param TgLast:
	:type TgLast: gp_Vec
	:param NormFirst:
	:type NormFirst: gp_Vec
	:param NormLast:
	:type NormLast: gp_Vec
	:rtype: None
") Tangent;
		void Tangent (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,gp_Vec & TgFirst,gp_Vec & TgLast,gp_Vec & NormFirst,gp_Vec & NormLast);
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1 ();
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2 ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Inits the value of radius, and the 'quadrant'.

	:param Radius:
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
		%feature("autodoc", "	* Utile pour une visu rapide et approximative de la surface.

	:param Param:
	:type Param: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Circ
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
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
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
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
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "	:param Prm:
	:type Prm: float
	:rtype: gp_Ax1
") AxeRot;
		gp_Ax1 AxeRot (const Standard_Real Prm);
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


%extend BlendFunc_ConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_ConstRadInv;
class BlendFunc_ConstRadInv : public Blend_FuncInv {
	public:
		%feature("compactdefaultargs") BlendFunc_ConstRadInv;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_ConstRadInv;
		 BlendFunc_ConstRadInv (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param OnFirst:
	:type OnFirst: bool
	:param COnSurf:
	:type COnSurf: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & COnSurf);
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
		%feature("autodoc", "	:param R:
	:type R: float
	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Real R,const Standard_Integer Choix);
};


%extend BlendFunc_ConstRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_Corde;
class BlendFunc_Corde {
	public:
		%feature("compactdefaultargs") BlendFunc_Corde;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param CGuide:
	:type CGuide: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_Corde;
		 BlendFunc_Corde (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & CGuide);
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") SetParam;
		void SetParam (const Standard_Real Param);
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "	:param Dist:
	:type Dist: float
	:rtype: None
") SetDist;
		void SetDist (const Standard_Real Dist);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Function for the variable <X>. Returns True if the computation was done successfully, False otherwise.

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
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnGuide;
		%feature("autodoc", "	* returns the point of parameter <Param> on CGuide

	:rtype: gp_Pnt
") PointOnGuide;
		const gp_Pnt  PointOnGuide ();
		%feature("compactdefaultargs") NPlan;
		%feature("autodoc", "	* returns the normal to CGuide at Ptgui.

	:rtype: gp_Vec
") NPlan;
		const gp_Vec  NPlan ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	* Returns True when it is not possible to compute the tangent vectors at PointOnS.

	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in 3d space.

	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in the parametric space of the first surface.

	:rtype: gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d  Tangent2dOnS ();
		%feature("compactdefaultargs") DerFguide;
		%feature("autodoc", "	* Derived of the function compared to the parameter of the guideline

	:param Sol:
	:type Sol: math_Vector &
	:param DerF:
	:type DerF: gp_Vec2d
	:rtype: None
") DerFguide;
		void DerFguide (const math_Vector & Sol,gp_Vec2d & DerF);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns False if Sol is not solution else returns True and updates the fields tgs and tg2d

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend BlendFunc_Corde {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_EvolRad;
class BlendFunc_EvolRad : public Blend_Function {
	public:
		%feature("compactdefaultargs") BlendFunc_EvolRad;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Law:
	:type Law: Handle_Law_Function &
	:rtype: None
") BlendFunc_EvolRad;
		 BlendFunc_EvolRad (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C,const Handle_Law_Function & Law);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param First:
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
		Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS1;
		const gp_Pnt  PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS2;
		const gp_Pnt  PointOnS2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS1;
		const gp_Vec  TangentOnS1 ();
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d  Tangent2dOnS1 ();
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS2;
		const gp_Vec  TangentOnS2 ();
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d  Tangent2dOnS2 ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param TgFirst:
	:type TgFirst: gp_Vec
	:param TgLast:
	:type TgLast: gp_Vec
	:param NormFirst:
	:type NormFirst: gp_Vec
	:param NormLast:
	:type NormLast: gp_Vec
	:rtype: None
") Tangent;
		void Tangent (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,gp_Vec & TgFirst,gp_Vec & TgLast,gp_Vec & NormFirst,gp_Vec & NormLast);
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1 ();
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2 ();
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
		%feature("autodoc", "	* Method for graphic traces

	:param Param:
	:type Param: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:param C:
	:type C: gp_Circ
	:rtype: None
") Section;
		void Section (const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,Standard_Real &OutValue,Standard_Real &OutValue,gp_Circ & C);
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
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
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
		virtual Standard_Boolean Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
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


%extend BlendFunc_EvolRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_EvolRadInv;
class BlendFunc_EvolRadInv : public Blend_FuncInv {
	public:
		%feature("compactdefaultargs") BlendFunc_EvolRadInv;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Law:
	:type Law: Handle_Law_Function &
	:rtype: None
") BlendFunc_EvolRadInv;
		 BlendFunc_EvolRadInv (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C,const Handle_Law_Function & Law);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param OnFirst:
	:type OnFirst: bool
	:param COnSurf:
	:type COnSurf: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & COnSurf);
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
		%feature("autodoc", "	:param Choix:
	:type Choix: int
	:rtype: None
") Set;
		void Set (const Standard_Integer Choix);
};


%extend BlendFunc_EvolRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_Ruled;
class BlendFunc_Ruled : public Blend_Function {
	public:
		%feature("compactdefaultargs") BlendFunc_Ruled;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_Ruled;
		 BlendFunc_Ruled (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") Set;
		void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param First:
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
		Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS1;
		const gp_Pnt  PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS2;
		const gp_Pnt  PointOnS2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS1;
		const gp_Vec  TangentOnS1 ();
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d  Tangent2dOnS1 ();
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS2;
		const gp_Vec  TangentOnS2 ();
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d  Tangent2dOnS2 ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param TgFirst:
	:type TgFirst: gp_Vec
	:param TgLast:
	:type TgLast: gp_Vec
	:param NormFirst:
	:type NormFirst: gp_Vec
	:param NormLast:
	:type NormLast: gp_Vec
	:rtype: None
") Tangent;
		void Tangent (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,gp_Vec & TgFirst,gp_Vec & TgLast,gp_Vec & NormFirst,gp_Vec & NormLast);
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") GetSection;
		Standard_Boolean GetSection (const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,TColgp_Array1OfPnt & tabP,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns False

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
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard

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
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "	:param Prm:
	:type Prm: float
	:rtype: gp_Ax1
") AxeRot;
		gp_Ax1 AxeRot (const Standard_Real Prm);
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


%extend BlendFunc_Ruled {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_RuledInv;
class BlendFunc_RuledInv : public Blend_FuncInv {
	public:
		%feature("compactdefaultargs") BlendFunc_RuledInv;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") BlendFunc_RuledInv;
		 BlendFunc_RuledInv (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param OnFirst:
	:type OnFirst: bool
	:param COnSurf:
	:type COnSurf: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & COnSurf);
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

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
};


%extend BlendFunc_RuledInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BlendFunc_Tensor;
class BlendFunc_Tensor {
	public:
		%feature("compactdefaultargs") BlendFunc_Tensor;
		%feature("autodoc", "	:param NbRow:
	:type NbRow: int
	:param NbCol:
	:type NbCol: int
	:param NbMat:
	:type NbMat: int
	:rtype: None
") BlendFunc_Tensor;
		 BlendFunc_Tensor (const Standard_Integer NbRow,const Standard_Integer NbCol,const Standard_Integer NbMat);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all the elements of a Tensor to InitialValue.

	:param InitialValue:
	:type InitialValue: float
	:rtype: None
") Init;
		void Init (const Standard_Real InitialValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Mat:
	:type Mat: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Mat:
	:type Mat: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	:param Right:
	:type Right: math_Vector &
	:param Product:
	:type Product: math_Matrix &
	:rtype: None
") Multiply;
		void Multiply (const math_Vector & Right,math_Matrix & Product);
};


%extend BlendFunc_Tensor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
