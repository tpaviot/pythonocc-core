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
%module (package="OCC") Blend

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


%include Blend_headers.i


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
enum Blend_DecrochStatus {
	Blend_NoDecroch = 0,
	Blend_DecrochRst1 = 1,
	Blend_DecrochRst2 = 2,
	Blend_DecrochBoth = 3,
};

enum Blend_Status {
	Blend_StepTooLarge = 0,
	Blend_StepTooSmall = 1,
	Blend_Backward = 2,
	Blend_SamePoints = 3,
	Blend_OnRst1 = 4,
	Blend_OnRst2 = 5,
	Blend_OnRst12 = 6,
	Blend_OK = 7,
};

/* end public enums declaration */

%nodefaultctor Blend_AppFunction;
class Blend_AppFunction : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the parameter along the guide line. This determines the plane in which the solution has to be found.

	:param Param:
	:type Param: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 4 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 4 variables. Returns in the vector SupBound the greatest values allowed for each of the 4 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "	* Returns the point on the first support.

	:rtype: gp_Pnt
") Pnt1;
		virtual const gp_Pnt  Pnt1 ();
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "	* Returns the point on the first support.

	:rtype: gp_Pnt
") Pnt2;
		virtual const gp_Pnt  Pnt2 ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		virtual Standard_Real GetSectionSize ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: void
") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
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
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

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
	:rtype: void
") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
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
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param IC2d:
	:type IC2d: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer IC2d,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of the point P. Used to impose the parameters in the approximation.

	:param P:
	:type P: Blend_Point &
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Blend_Point & P);
};


%extend Blend_AppFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_CurvPointFuncInv;
class Blend_CurvPointFuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: void
") Set;
		virtual void Set (const gp_Pnt & P);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend Blend_CurvPointFuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_FuncInv;
class Blend_FuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 4.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the CurveOnSurface on which a solution has to be found. If <OnFirst> is set to Standard_True, the curve will be on the first surface, otherwise the curve is on the second one.

	:param OnFirst:
	:type OnFirst: bool
	:param COnSurf:
	:type COnSurf: Handle_Adaptor2d_HCurve2d &
	:rtype: void
") Set;
		virtual void Set (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & COnSurf);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 4 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 4 variables. Returns in the vector SupBound the greatest values allowed for each of the 4 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend Blend_FuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_Point;
class Blend_Point {
	public:
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	:rtype: None
") Blend_Point;
		 Blend_Point ();
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on 2 surfaces, with tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param Tg1:
	:type Tg1: gp_Vec
	:param Tg2:
	:type Tg2: gp_Vec
	:param Tg12d:
	:type Tg12d: gp_Vec2d
	:param Tg22d:
	:type Tg22d: gp_Vec2d
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on 2 surfaces, without tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on a surface and a curve, with tangents.

	:param Pts:
	:type Pts: gp_Pnt
	:param Ptc:
	:type Ptc: gp_Pnt
	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Tgs:
	:type Tgs: gp_Vec
	:param Tgc:
	:type Tgc: gp_Vec
	:param Tg2d:
	:type Tg2d: gp_Vec2d
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,const gp_Vec & Tgs,const gp_Vec & Tgc,const gp_Vec2d & Tg2d);
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on a surface and a curve, without tangents.

	:param Pts:
	:type Pts: gp_Pnt
	:param Ptc:
	:type Ptc: gp_Pnt
	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W);
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on a surface and a curve on surface, with tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC:
	:type PC: float
	:param Tg1:
	:type Tg1: gp_Vec
	:param Tg2:
	:type Tg2: gp_Vec
	:param Tg12d:
	:type Tg12d: gp_Vec2d
	:param Tg22d:
	:type Tg22d: gp_Vec2d
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on a surface and a curve on surface, without tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC:
	:type PC: float
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC);
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on two curves on surfaces, with tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC1:
	:type PC1: float
	:param PC2:
	:type PC2: float
	:param Tg1:
	:type Tg1: gp_Vec
	:param Tg2:
	:type Tg2: gp_Vec
	:param Tg12d:
	:type Tg12d: gp_Vec2d
	:param Tg22d:
	:type Tg22d: gp_Vec2d
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "	* Creates a point on two curves on surfaces, with tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC1:
	:type PC1: float
	:param PC2:
	:type PC2: float
	:rtype: None
") Blend_Point;
		 Blend_Point (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for a point on 2 surfaces, with tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param Tg1:
	:type Tg1: gp_Vec
	:param Tg2:
	:type Tg2: gp_Vec
	:param Tg12d:
	:type Tg12d: gp_Vec2d
	:param Tg22d:
	:type Tg22d: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for a point on 2 surfaces, without tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for a point on a surface and a curve, with tangents.

	:param Pts:
	:type Pts: gp_Pnt
	:param Ptc:
	:type Ptc: gp_Pnt
	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Tgs:
	:type Tgs: gp_Vec
	:param Tgc:
	:type Tgc: gp_Vec
	:param Tg2d:
	:type Tg2d: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W,const gp_Vec & Tgs,const gp_Vec & Tgc,const gp_Vec2d & Tg2d);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for a point on a surface and a curve, without tangents.

	:param Pts:
	:type Pts: gp_Pnt
	:param Ptc:
	:type Ptc: gp_Pnt
	:param Param:
	:type Param: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pts,const gp_Pnt & Ptc,const Standard_Real Param,const Standard_Real U,const Standard_Real V,const Standard_Real W);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Creates a point on a surface and a curve on surface, with tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC:
	:type PC: float
	:param Tg1:
	:type Tg1: gp_Vec
	:param Tg2:
	:type Tg2: gp_Vec
	:param Tg12d:
	:type Tg12d: gp_Vec2d
	:param Tg22d:
	:type Tg22d: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Creates a point on a surface and a curve on surface, without tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC:
	:type PC: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Creates a point on two curves on surfaces, with tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC1:
	:type PC1: float
	:param PC2:
	:type PC2: float
	:param Tg1:
	:type Tg1: gp_Vec
	:param Tg2:
	:type Tg2: gp_Vec
	:param Tg12d:
	:type Tg12d: gp_Vec2d
	:param Tg22d:
	:type Tg22d: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2,const gp_Vec & Tg1,const gp_Vec & Tg2,const gp_Vec2d & Tg12d,const gp_Vec2d & Tg22d);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Creates a point on two curves on surfaces, without tangents.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
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
	:param PC1:
	:type PC1: float
	:param PC2:
	:type PC2: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real PC1,const Standard_Real PC2);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Creates a point on two curves.

	:param Pt1:
	:type Pt1: gp_Pnt
	:param Pt2:
	:type Pt2: gp_Pnt
	:param Param:
	:type Param: float
	:param PC1:
	:type PC1: float
	:param PC2:
	:type PC2: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt1,const gp_Pnt & Pt2,const Standard_Real Param,const Standard_Real PC1,const Standard_Real PC2);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	* Changes parameter on existing point

	:param Param:
	:type Param: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real Param);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	* Returns Standard_True if it was not possible to compute the tangent vectors at PointOnS1 and/or PointOnS2.

	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS1;
		const gp_Pnt  PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS2;
		const gp_Pnt  PointOnS2 ();
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS1;
		const gp_Vec  TangentOnS1 ();
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS2;
		const gp_Vec  TangentOnS2 ();
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS1;
		gp_Vec2d Tangent2dOnS1 ();
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2dOnS2;
		gp_Vec2d Tangent2dOnS2 ();
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnS;
		const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnC;
		const gp_Pnt  PointOnC ();
		%feature("compactdefaultargs") ParametersOnS;
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParametersOnS;
		void ParametersOnS (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "	:rtype: float
") ParameterOnC;
		Standard_Real ParameterOnC ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnS;
		const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnC;
		const gp_Vec  TangentOnC ();
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Tangent2d;
		gp_Vec2d Tangent2d ();
		%feature("compactdefaultargs") PointOnC1;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnC1;
		const gp_Pnt  PointOnC1 ();
		%feature("compactdefaultargs") PointOnC2;
		%feature("autodoc", "	:rtype: gp_Pnt
") PointOnC2;
		const gp_Pnt  PointOnC2 ();
		%feature("compactdefaultargs") ParameterOnC1;
		%feature("autodoc", "	:rtype: float
") ParameterOnC1;
		Standard_Real ParameterOnC1 ();
		%feature("compactdefaultargs") ParameterOnC2;
		%feature("autodoc", "	:rtype: float
") ParameterOnC2;
		Standard_Real ParameterOnC2 ();
		%feature("compactdefaultargs") TangentOnC1;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnC1;
		const gp_Vec  TangentOnC1 ();
		%feature("compactdefaultargs") TangentOnC2;
		%feature("autodoc", "	:rtype: gp_Vec
") TangentOnC2;
		const gp_Vec  TangentOnC2 ();
};


%extend Blend_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_SequenceNodeOfSequenceOfPoint;
class Blend_SequenceNodeOfSequenceOfPoint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Blend_SequenceNodeOfSequenceOfPoint;
		%feature("autodoc", "	:param I:
	:type I: Blend_Point &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Blend_SequenceNodeOfSequenceOfPoint;
		 Blend_SequenceNodeOfSequenceOfPoint (const Blend_Point & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Blend_Point
") Value;
		Blend_Point & Value ();
};


%extend Blend_SequenceNodeOfSequenceOfPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Blend_SequenceNodeOfSequenceOfPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Blend_SequenceNodeOfSequenceOfPoint::Handle_Blend_SequenceNodeOfSequenceOfPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Blend_SequenceNodeOfSequenceOfPoint;
class Handle_Blend_SequenceNodeOfSequenceOfPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Blend_SequenceNodeOfSequenceOfPoint();
        Handle_Blend_SequenceNodeOfSequenceOfPoint(const Handle_Blend_SequenceNodeOfSequenceOfPoint &aHandle);
        Handle_Blend_SequenceNodeOfSequenceOfPoint(const Blend_SequenceNodeOfSequenceOfPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Blend_SequenceNodeOfSequenceOfPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Blend_SequenceNodeOfSequenceOfPoint {
    Blend_SequenceNodeOfSequenceOfPoint* _get_reference() {
    return (Blend_SequenceNodeOfSequenceOfPoint*)$self->Access();
    }
};

%extend Handle_Blend_SequenceNodeOfSequenceOfPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Blend_SequenceNodeOfSequenceOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_SequenceOfPoint;
class Blend_SequenceOfPoint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Blend_SequenceOfPoint;
		%feature("autodoc", "	:rtype: None
") Blend_SequenceOfPoint;
		 Blend_SequenceOfPoint ();
		%feature("compactdefaultargs") Blend_SequenceOfPoint;
		%feature("autodoc", "	:param Other:
	:type Other: Blend_SequenceOfPoint &
	:rtype: None
") Blend_SequenceOfPoint;
		 Blend_SequenceOfPoint (const Blend_SequenceOfPoint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Blend_SequenceOfPoint &
	:rtype: Blend_SequenceOfPoint
") Assign;
		const Blend_SequenceOfPoint & Assign (const Blend_SequenceOfPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Blend_SequenceOfPoint &
	:rtype: Blend_SequenceOfPoint
") operator =;
		const Blend_SequenceOfPoint & operator = (const Blend_SequenceOfPoint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Blend_Point &
	:rtype: None
") Append;
		void Append (const Blend_Point & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Blend_SequenceOfPoint &
	:rtype: None
") Append;
		void Append (Blend_SequenceOfPoint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Blend_Point &
	:rtype: None
") Prepend;
		void Prepend (const Blend_Point & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Blend_SequenceOfPoint &
	:rtype: None
") Prepend;
		void Prepend (Blend_SequenceOfPoint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Blend_Point &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Blend_Point & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Blend_SequenceOfPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Blend_SequenceOfPoint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Blend_Point &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Blend_Point & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Blend_SequenceOfPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Blend_SequenceOfPoint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Blend_Point
") First;
		const Blend_Point & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Blend_Point
") Last;
		const Blend_Point & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Blend_SequenceOfPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Blend_SequenceOfPoint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Blend_Point
") Value;
		const Blend_Point & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Blend_Point &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Blend_Point & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Blend_Point
") ChangeValue;
		Blend_Point & ChangeValue (const Standard_Integer Index);
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


%extend Blend_SequenceOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_SurfCurvFuncInv;
class Blend_SurfCurvFuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param Rst:
	:type Rst: Handle_Adaptor2d_HCurve2d &
	:rtype: void
") Set;
		virtual void Set (const Handle_Adaptor2d_HCurve2d & Rst);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend Blend_SurfCurvFuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_SurfPointFuncInv;
class Blend_SurfPointFuncInv : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 3.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the Point on which a solution has to be found.

	:param P:
	:type P: gp_Pnt
	:rtype: void
") Set;
		virtual void Set (const gp_Pnt & P);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
};


%extend Blend_SurfPointFuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_CSFunction;
class Blend_CSFunction : public Blend_AppFunction {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 3 (default value). Can be redefined.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the parameter along the guide line. This determines the plane in which the solution has to be found.

	:param Param:
	:type Param: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "	* Returns the point on the first support.

	:rtype: gp_Pnt
") Pnt1;
		const gp_Pnt  Pnt1 ();
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "	* Returns the point on the seconde support.

	:rtype: gp_Pnt
") Pnt2;
		const gp_Pnt  Pnt2 ();
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	* Returns the point on the surface.

	:rtype: gp_Pnt
") PointOnS;
		virtual const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "	* Returns the point on the curve.

	:rtype: gp_Pnt
") PointOnC;
		virtual const gp_Pnt  PointOnC ();
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2d;
		virtual const gp_Pnt2d  Pnt2d ();
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnC;
		virtual Standard_Real ParameterOnC ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	* Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnC.

	:rtype: bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in 3d space.

	:rtype: gp_Vec
") TangentOnS;
		virtual const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in the parametric space of the first surface.

	:rtype: gp_Vec2d
") Tangent2d;
		virtual const gp_Vec2d  Tangent2d ();
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "	* Returns the tangent vector at PointOnC, in 3d space.

	:rtype: gp_Vec
") TangentOnC;
		virtual const gp_Vec  TangentOnC ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	* Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param TgS:
	:type TgS: gp_Vec
	:param NormS:
	:type NormS: gp_Vec
	:rtype: void
") Tangent;
		virtual void Tangent (const Standard_Real U,const Standard_Real V,gp_Vec & TgS,gp_Vec & NormS);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: void
") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
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
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

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
	:rtype: void
") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
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
};


%extend Blend_CSFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_Function;
class Blend_Function : public Blend_AppFunction {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 4.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the parameter along the guide line. This determines the plane in which the solution has to be found.

	:param Param:
	:type Param: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each of the 4 variables; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each of the 4 variables. Returns in the vector SupBound the greatest values allowed for each of the 4 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "	* Returns the point on the first support.

	:rtype: gp_Pnt
") Pnt1;
		const gp_Pnt  Pnt1 ();
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "	* Returns the point on the seconde support.

	:rtype: gp_Pnt
") Pnt2;
		const gp_Pnt  Pnt2 ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	* Returns the point on the first surface, at parameter Sol(1),Sol(2) (Sol is the vector used in the call of IsSolution.

	:rtype: gp_Pnt
") PointOnS1;
		virtual const gp_Pnt  PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	* Returns the point on the second surface, at parameter Sol(3),Sol(4) (Sol is the vector used in the call of IsSolution.

	:rtype: gp_Pnt
") PointOnS2;
		virtual const gp_Pnt  PointOnS2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	* Returns True when it is not possible to compute the tangent vectors at PointOnS1 and/or PointOnS2.

	:rtype: bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS1, in 3d space.

	:rtype: gp_Vec
") TangentOnS1;
		virtual const gp_Vec  TangentOnS1 ();
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS1, in the parametric space of the first surface.

	:rtype: gp_Vec2d
") Tangent2dOnS1;
		virtual const gp_Vec2d  Tangent2dOnS1 ();
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS2, in 3d space.

	:rtype: gp_Vec
") TangentOnS2;
		virtual const gp_Vec  TangentOnS2 ();
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS2, in the parametric space of the second surface.

	:rtype: gp_Vec2d
") Tangent2dOnS2;
		virtual const gp_Vec2d  Tangent2dOnS2 ();
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
	:rtype: void
") Tangent;
		virtual void Tangent (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,gp_Vec & TgFirst,gp_Vec & TgLast,gp_Vec & NormFirst,gp_Vec & NormLast);
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1 ();
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2 ();
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: void
") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
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
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

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
	:rtype: void
") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False

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
};


%extend Blend_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_RstRstFunction;
class Blend_RstRstFunction : public Blend_AppFunction {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 2 (default value). Can be redefined.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the parameter along the guide line. This determines the plane in which the solution has to be found.

	:param Param:
	:type Param: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each variable; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "	* Returns the point on the first support.

	:rtype: gp_Pnt
") Pnt1;
		const gp_Pnt  Pnt1 ();
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "	* Returns the point on the seconde support.

	:rtype: gp_Pnt
") Pnt2;
		const gp_Pnt  Pnt2 ();
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "	* Returns the point on the surface.

	:rtype: gp_Pnt
") PointOnRst1;
		virtual const gp_Pnt  PointOnRst1 ();
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "	* Returns the point on the curve.

	:rtype: gp_Pnt
") PointOnRst2;
		virtual const gp_Pnt  PointOnRst2 ();
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst1;
		virtual const gp_Pnt2d  Pnt2dOnRst1 ();
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst2;
		virtual const gp_Pnt2d  Pnt2dOnRst2 ();
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst1;
		virtual Standard_Real ParameterOnRst1 ();
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst2;
		virtual Standard_Real ParameterOnRst2 ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	* Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnRst.

	:rtype: bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in 3d space.

	:rtype: gp_Vec
") TangentOnRst1;
		virtual const gp_Vec  TangentOnRst1 ();
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in the parametric space of the first surface.

	:rtype: gp_Vec2d
") Tangent2dOnRst1;
		virtual const gp_Vec2d  Tangent2dOnRst1 ();
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "	* Returns the tangent vector at PointOnC, in 3d space.

	:rtype: gp_Vec
") TangentOnRst2;
		virtual const gp_Vec  TangentOnRst2 ();
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "	* Returns the tangent vector at PointOnRst, in the parametric space of the second surface.

	:rtype: gp_Vec2d
") Tangent2dOnRst2;
		virtual const gp_Vec2d  Tangent2dOnRst2 ();
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "	* Enables to implement a criterion of decrochage specific to the function. Warning: Can be called without previous call of issolution but the values calculated can be senseless.

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
		virtual Blend_DecrochStatus Decroch (const math_Vector & Sol,gp_Vec & NRst1,gp_Vec & TgRst1,gp_Vec & NRst2,gp_Vec & TgRst2);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		virtual Standard_Real GetSectionSize ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
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
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: void
") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
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
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

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
};


%extend Blend_RstRstFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Blend_SurfRstFunction;
class Blend_SurfRstFunction : public Blend_AppFunction {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns 3 (default value). Can be redefined.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the parameter along the guide line. This determines the plane in which the solution has to be found.

	:param Param:
	:type Param: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real Param);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns in the vector Tolerance the parametric tolerance for each variable; Tol is the tolerance used in 3d space.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (math_Vector & Tolerance,const Standard_Real Tol);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in the vector InfBound the lowest values allowed for each variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.

	:param InfBound:
	:type InfBound: math_Vector &
	:param SupBound:
	:type SupBound: math_Vector &
	:rtype: void
") GetBounds;
		virtual void GetBounds (math_Vector & InfBound,math_Vector & SupBound);
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "	* Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.

	:param Sol:
	:type Sol: math_Vector &
	:param Tol:
	:type Tol: float
	:rtype: bool
") IsSolution;
		virtual Standard_Boolean IsSolution (const math_Vector & Sol,const Standard_Real Tol);
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "	* Returns the minimal Distance beetween two extremitys of calculed sections.

	:rtype: float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance ();
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "	* Returns the point on the first support.

	:rtype: gp_Pnt
") Pnt1;
		const gp_Pnt  Pnt1 ();
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "	* Returns the point on the seconde support.

	:rtype: gp_Pnt
") Pnt2;
		const gp_Pnt  Pnt2 ();
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "	* Returns the point on the surface.

	:rtype: gp_Pnt
") PointOnS;
		virtual const gp_Pnt  PointOnS ();
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "	* Returns the point on the curve.

	:rtype: gp_Pnt
") PointOnRst;
		virtual const gp_Pnt  PointOnRst ();
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the surface.

	:rtype: gp_Pnt2d
") Pnt2dOnS;
		virtual const gp_Pnt2d  Pnt2dOnS ();
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "	* Returns U,V coordinates of the point on the curve on surface.

	:rtype: gp_Pnt2d
") Pnt2dOnRst;
		virtual const gp_Pnt2d  Pnt2dOnRst ();
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "	* Returns parameter of the point on the curve.

	:rtype: float
") ParameterOnRst;
		virtual Standard_Real ParameterOnRst ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	* Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnRst.

	:rtype: bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in 3d space.

	:rtype: gp_Vec
") TangentOnS;
		virtual const gp_Vec  TangentOnS ();
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "	* Returns the tangent vector at PointOnS, in the parametric space of the first surface.

	:rtype: gp_Vec2d
") Tangent2dOnS;
		virtual const gp_Vec2d  Tangent2dOnS ();
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "	* Returns the tangent vector at PointOnC, in 3d space.

	:rtype: gp_Vec
") TangentOnRst;
		virtual const gp_Vec  TangentOnRst ();
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "	* Returns the tangent vector at PointOnRst, in the parametric space of the second surface.

	:rtype: gp_Vec2d
") Tangent2dOnRst;
		virtual const gp_Vec2d  Tangent2dOnRst ();
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "	* Enables implementation of a criterion of decrochage specific to the function.

	:param Sol:
	:type Sol: math_Vector &
	:param NS:
	:type NS: gp_Vec
	:param TgS:
	:type TgS: gp_Vec
	:rtype: bool
") Decroch;
		virtual Standard_Boolean Decroch (const math_Vector & Sol,gp_Vec & NS,gp_Vec & TgS);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "	* Returns the length of the maximum section

	:rtype: float
") GetSectionSize;
		virtual Standard_Real GetSectionSize ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
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
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: void
") GetShape;
		virtual void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
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
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,math_Vector & Tol3d,math_Vector & Tol1D);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

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
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param P:
	:type P: Blend_Point &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") Section;
		virtual void Section (const Blend_Point & P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
};


%extend Blend_SurfRstFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
