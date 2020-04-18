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
%define BLENDFUNCDOCSTRING
"BlendFunc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_blendfunc.html"
%enddef
%module (package="OCC.Core", docstring=BLENDFUNCDOCSTRING) BlendFunc


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
#include<BlendFunc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<Convert_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<Blend_module.hxx>
#include<Law_module.hxx>
#include<math_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import gp.i
%import Convert.i
%import TColStd.i
%import GeomAbs.i
%import Blend.i
%import Law.i
%import math.i
%import TColgp.i
%import Adaptor2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BlendFunc_SectionShape {
	BlendFunc_Rational = 0,
	BlendFunc_QuasiAngular = 1,
	BlendFunc_Polynomial = 2,
	BlendFunc_Linear = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BlendFunc_SectionShape(IntEnum):
	BlendFunc_Rational = 0
	BlendFunc_QuasiAngular = 1
	BlendFunc_Polynomial = 2
	BlendFunc_Linear = 3
BlendFunc_Rational = BlendFunc_SectionShape.BlendFunc_Rational
BlendFunc_QuasiAngular = BlendFunc_SectionShape.BlendFunc_QuasiAngular
BlendFunc_Polynomial = BlendFunc_SectionShape.BlendFunc_Polynomial
BlendFunc_Linear = BlendFunc_SectionShape.BlendFunc_Linear
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class BlendFunc *
******************/
%rename(blendfunc) BlendFunc;
class BlendFunc {
	public:
		/****************** ComputeDNormal ******************/
		%feature("compactdefaultargs") ComputeDNormal;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf: Adaptor3d_HSurface
p2d: gp_Pnt2d
Normal: gp_Vec
DNu: gp_Vec
DNv: gp_Vec

Returns
-------
bool
") ComputeDNormal;
		static Standard_Boolean ComputeDNormal(const opencascade::handle<Adaptor3d_HSurface> & Surf, const gp_Pnt2d & p2d, gp_Vec & Normal, gp_Vec & DNu, gp_Vec & DNv);

		/****************** ComputeNormal ******************/
		%feature("compactdefaultargs") ComputeNormal;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf: Adaptor3d_HSurface
p2d: gp_Pnt2d
Normal: gp_Vec

Returns
-------
bool
") ComputeNormal;
		static Standard_Boolean ComputeNormal(const opencascade::handle<Adaptor3d_HSurface> & Surf, const gp_Pnt2d & p2d, gp_Vec & Normal);

		/****************** GetMinimalWeights ******************/
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "No available documentation.

Parameters
----------
SectShape: BlendFunc_SectionShape
TConv: Convert_ParameterisationType
AngleMin: float
AngleMax: float
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeights;
		static void GetMinimalWeights(const BlendFunc_SectionShape SectShape, const Convert_ParameterisationType TConv, const Standard_Real AngleMin, const Standard_Real AngleMax, TColStd_Array1OfReal & Weigths);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
SectShape: BlendFunc_SectionShape
MaxAng: float
TypeConv: Convert_ParameterisationType

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") GetShape;
		static void GetShape(const BlendFunc_SectionShape SectShape, const Standard_Real MaxAng, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Convert_ParameterisationType & TypeConv);

		/****************** NextShape ******************/
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", "Used to obtain the next level of continuity.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
GeomAbs_Shape
") NextShape;
		static GeomAbs_Shape NextShape(const GeomAbs_Shape S);

};


%extend BlendFunc {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Mults(self):
		pass

	@methodnotwrapped
	def Knots(self):
		pass
	}
};

/*****************************
* class BlendFunc_CSCircular *
*****************************/
class BlendFunc_CSCircular : public Blend_CSFunction {
	public:
		/****************** BlendFunc_CSCircular ******************/
		%feature("compactdefaultargs") BlendFunc_CSCircular;
		%feature("autodoc", "Creates a function for a circular blending between a curve <c> and a surface <s>. the direction of the planes are given by <cguide>. the position of the plane is determined on the curve <c>. <l> defines the change of parameter between <c> and <cguide>. so, the planes are defined as described below : t is the current parameter on the guide line. pguide = c(l(t)); nguide = cguide'(t)/||cguide'(t)||.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
CGuide: Adaptor3d_HCurve
L: Law_Function

Returns
-------
None
") BlendFunc_CSCircular;
		 BlendFunc_CSCircular(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HCurve> & CGuide, const opencascade::handle<Law_Function> & L);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSection ******************/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
W: float
tabP: TColgp_Array1OfPnt
tabV: TColgp_Array1OfVec

Returns
-------
bool
") GetSection;
		Standard_Boolean GetSection(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, TColgp_Array1OfPnt & tabP, TColgp_Array1OfVec & tabV);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals() raises outofrange from standard.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function (3).

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** ParameterOnC ******************/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****************** Pnt2d ******************/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2d;
		const gp_Pnt2d Pnt2d();

		/****************** PointOnC ******************/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC;
		const gp_Pnt PointOnC();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Radius: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.

Parameters
----------
U: float
V: float
TgS: gp_Vec
NormS: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U, const Standard_Real V, gp_Vec & TgS, gp_Vec & NormS);

		/****************** Tangent2d ******************/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2d;
		const gp_Vec2d Tangent2d();

		/****************** TangentOnC ******************/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC;
		const gp_Vec TangentOnC();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_CSCircular {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BlendFunc_CSConstRad *
*****************************/
class BlendFunc_CSConstRad : public Blend_CSFunction {
	public:
		/****************** BlendFunc_CSConstRad ******************/
		%feature("compactdefaultargs") BlendFunc_CSConstRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
CGuide: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_CSConstRad;
		 BlendFunc_CSConstRad(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HCurve> & CGuide);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSection ******************/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
W: float
tabP: TColgp_Array1OfPnt
tabV: TColgp_Array1OfVec

Returns
-------
bool
") GetSection;
		Standard_Boolean GetSection(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, TColgp_Array1OfPnt & tabP, TColgp_Array1OfVec & tabV);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals() raises outofrange from standard.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function (3).

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** ParameterOnC ******************/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****************** Pnt2d ******************/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2d;
		const gp_Pnt2d Pnt2d();

		/****************** PointOnC ******************/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC;
		const gp_Pnt PointOnC();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Radius: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.

Parameters
----------
U: float
V: float
TgS: gp_Vec
NormS: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U, const Standard_Real V, gp_Vec & TgS, gp_Vec & NormS);

		/****************** Tangent2d ******************/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2d;
		const gp_Vec2d Tangent2d();

		/****************** TangentOnC ******************/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC;
		const gp_Vec TangentOnC();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_CSConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BlendFunc_ChAsym *
*************************/
class BlendFunc_ChAsym : public Blend_Function {
	public:
		/****************** BlendFunc_ChAsym ******************/
		%feature("compactdefaultargs") BlendFunc_ChAsym;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ChAsym;
		 BlendFunc_ChAsym(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** ComputeValues ******************/
		%feature("compactdefaultargs") ComputeValues;
		%feature("autodoc", "Computes the values <f> of the derivatives for the variable <x> between degf and degl. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
DegF: int
DegL: int

Returns
-------
bool
") ComputeValues;
		Standard_Boolean ComputeValues(const math_Vector & X, const Standard_Integer DegF, const Standard_Integer DegL);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Utile pour une visu rapide et approximative de la surface.

Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Lin

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Lin & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the distances and the angle.

Parameters
----------
Dist1: float
Angle: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Dist1, const Standard_Real Angle, const Standard_Integer Choix);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

Parameters
----------
U1: float
V1: float
U2: float
V2: float
TgFirst: gp_Vec
TgLast: gp_Vec
NormFirst: gp_Vec
NormLast: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_ChAsym {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BlendFunc_ChAsymInv *
****************************/
class BlendFunc_ChAsymInv : public Blend_FuncInv {
	public:
		/****************** BlendFunc_ChAsymInv ******************/
		%feature("compactdefaultargs") BlendFunc_ChAsymInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ChAsymInv;
		 BlendFunc_ChAsymInv(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** ComputeValues ******************/
		%feature("compactdefaultargs") ComputeValues;
		%feature("autodoc", "Computes the values <f> of the derivatives for the variable <x> between degf and degl. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
DegF: int
DegL: int

Returns
-------
bool
") ComputeValues;
		Standard_Boolean ComputeValues(const math_Vector & X, const Standard_Integer DegF, const Standard_Integer DegL);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & COnSurf);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dist1: float
Angle: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Dist1, const Standard_Real Angle, const Standard_Integer Choix);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_ChAsymInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BlendFunc_ConstRad *
***************************/
class BlendFunc_ConstRad : public Blend_Function {
	public:
		/****************** BlendFunc_ConstRad ******************/
		%feature("compactdefaultargs") BlendFunc_ConstRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ConstRad;
		 BlendFunc_ConstRad(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** AxeRot ******************/
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "No available documentation.

Parameters
----------
Prm: float

Returns
-------
gp_Ax1
") AxeRot;
		gp_Ax1 AxeRot(const Standard_Real Prm);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Utile pour une visu rapide et approximative de la surface.

Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Inits the value of radius, and the 'quadrant'.

Parameters
----------
Radius: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

Parameters
----------
U1: float
V1: float
U2: float
V2: float
TgFirst: gp_Vec
TgLast: gp_Vec
NormFirst: gp_Vec
NormLast: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_ConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BlendFunc_ConstRadInv *
******************************/
class BlendFunc_ConstRadInv : public Blend_FuncInv {
	public:
		/****************** BlendFunc_ConstRadInv ******************/
		%feature("compactdefaultargs") BlendFunc_ConstRadInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ConstRadInv;
		 BlendFunc_ConstRadInv(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & COnSurf);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
R: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real R, const Standard_Integer Choix);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_ConstRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BlendFunc_Corde *
************************/
class BlendFunc_Corde {
	public:
		/****************** BlendFunc_Corde ******************/
		%feature("compactdefaultargs") BlendFunc_Corde;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
CGuide: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_Corde;
		 BlendFunc_Corde(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & CGuide);

		/****************** DerFguide ******************/
		%feature("compactdefaultargs") DerFguide;
		%feature("autodoc", "Derived of the function compared to the parameter of the guideline.

Parameters
----------
Sol: math_Vector
DerF: gp_Vec2d

Returns
-------
None
") DerFguide;
		void DerFguide(const math_Vector & Sol, gp_Vec2d & DerF);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns false if sol is not solution else returns true and updates the fields tgs and tg2d.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** NPlan ******************/
		%feature("compactdefaultargs") NPlan;
		%feature("autodoc", "Returns the normal to cguide at ptgui.

Returns
-------
gp_Vec
") NPlan;
		const gp_Vec NPlan();

		/****************** PointOnGuide ******************/
		%feature("compactdefaultargs") PointOnGuide;
		%feature("autodoc", "Returns the point of parameter <param> on cguide.

Returns
-------
gp_Pnt
") PointOnGuide;
		const gp_Pnt PointOnGuide();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** SetDist ******************/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dist: float

Returns
-------
None
") SetDist;
		void SetDist(const Standard_Real Dist);

		/****************** SetParam ******************/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") SetParam;
		void SetParam(const Standard_Real Param);

		/****************** Tangent2dOnS ******************/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the function for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend BlendFunc_Corde {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BlendFunc_EvolRad *
**************************/
class BlendFunc_EvolRad : public Blend_Function {
	public:
		/****************** BlendFunc_EvolRad ******************/
		%feature("compactdefaultargs") BlendFunc_EvolRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve
Law: Law_Function

Returns
-------
None
") BlendFunc_EvolRad;
		 BlendFunc_EvolRad(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Law_Function> & Law);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Method for graphic traces.

Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

Parameters
----------
U1: float
V1: float
U2: float
V2: float
TgFirst: gp_Vec
TgLast: gp_Vec
NormFirst: gp_Vec
NormLast: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_EvolRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BlendFunc_EvolRadInv *
*****************************/
class BlendFunc_EvolRadInv : public Blend_FuncInv {
	public:
		/****************** BlendFunc_EvolRadInv ******************/
		%feature("compactdefaultargs") BlendFunc_EvolRadInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve
Law: Law_Function

Returns
-------
None
") BlendFunc_EvolRadInv;
		 BlendFunc_EvolRadInv(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Law_Function> & Law);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & COnSurf);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_EvolRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BlendFunc_GenChamfInv *
******************************/
%nodefaultctor BlendFunc_GenChamfInv;
class BlendFunc_GenChamfInv : public Blend_FuncInv {
	public:
		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		virtual void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & COnSurf);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dist1: float
Dist2: float
Choix: int

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_GenChamfInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BlendFunc_GenChamfer *
*****************************/
%nodefaultctor BlendFunc_GenChamfer;
class BlendFunc_GenChamfer : public Blend_Function {
	public:
		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals() raises outofrange from standard.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Obsolete method.

Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Lin

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Lin & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the parameter along the guide line. this determines the plane in which the solution has to be found.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the distances and the 'quadrant'.

Parameters
----------
Dist1: float
Dist2: float
Choix: int

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_GenChamfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BlendFunc_Ruled *
************************/
class BlendFunc_Ruled : public Blend_Function {
	public:
		/****************** BlendFunc_Ruled ******************/
		%feature("compactdefaultargs") BlendFunc_Ruled;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_Ruled;
		 BlendFunc_Ruled(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** AxeRot ******************/
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "No available documentation.

Parameters
----------
Prm: float

Returns
-------
gp_Ax1
") AxeRot;
		gp_Ax1 AxeRot(const Standard_Real Prm);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSection ******************/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
tabP: TColgp_Array1OfPnt
tabV: TColgp_Array1OfVec

Returns
-------
bool
") GetSection;
		Standard_Boolean GetSection(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, TColgp_Array1OfPnt & tabP, TColgp_Array1OfVec & tabV);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals() raises outofrange from standard.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

Parameters
----------
U1: float
V1: float
U2: float
V2: float
TgFirst: gp_Vec
TgLast: gp_Vec
NormFirst: gp_Vec
NormLast: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_Ruled {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BlendFunc_RuledInv *
***************************/
class BlendFunc_RuledInv : public Blend_FuncInv {
	public:
		/****************** BlendFunc_RuledInv ******************/
		%feature("compactdefaultargs") BlendFunc_RuledInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_RuledInv;
		 BlendFunc_RuledInv(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & COnSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend BlendFunc_RuledInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BlendFunc_Tensor *
*************************/
class BlendFunc_Tensor {
	public:
		/****************** BlendFunc_Tensor ******************/
		%feature("compactdefaultargs") BlendFunc_Tensor;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbRow: int
NbCol: int
NbMat: int

Returns
-------
None
") BlendFunc_Tensor;
		 BlendFunc_Tensor(const Standard_Integer NbRow, const Standard_Integer NbCol, const Standard_Integer NbMat);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat) {
            return (Standard_Real) $self->ChangeValue(Row,Col,Mat);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat,Standard_Real value) {
            $self->ChangeValue(Row,Col,Mat)=value;
            }
        };
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all the elements of a tensor to initialvalue.

Parameters
----------
InitialValue: float

Returns
-------
None
") Init;
		void Init(const Standard_Real InitialValue);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "No available documentation.

Parameters
----------
Right: math_Vector
Product: math_Matrix

Returns
-------
None
") Multiply;
		void Multiply(const math_Vector & Right, math_Matrix & Product);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Accesses (in read or write mode) the value of index <row>, <col> and <mat> of a tensor. an exception is raised if <row>, <col> or <mat> are not in the correct range.

Parameters
----------
Row: int
Col: int
Mat: int

Returns
-------
float
") Value;
		const Standard_Real & Value(const Standard_Integer Row, const Standard_Integer Col, const Standard_Integer Mat);

};


%extend BlendFunc_Tensor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BlendFunc_ChamfInv *
***************************/
class BlendFunc_ChamfInv : public BlendFunc_GenChamfInv {
	public:
		/****************** BlendFunc_ChamfInv ******************/
		%feature("compactdefaultargs") BlendFunc_ChamfInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ChamfInv;
		 BlendFunc_ChamfInv(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dist1: float
Dist2: float
Choix: int

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend BlendFunc_ChamfInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BlendFunc_Chamfer *
**************************/
class BlendFunc_Chamfer : public BlendFunc_GenChamfer {
	public:
		/****************** BlendFunc_Chamfer ******************/
		%feature("compactdefaultargs") BlendFunc_Chamfer;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
CG: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_Chamfer;
		 BlendFunc_Chamfer(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & CG);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the distances and the 'quadrant'.

Parameters
----------
Dist1: float
Dist2: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

Parameters
----------
U1: float
V1: float
U2: float
V2: float
TgFirst: gp_Vec
TgLast: gp_Vec
NormFirst: gp_Vec
NormLast: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend BlendFunc_Chamfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BlendFunc_ConstThroat *
******************************/
class BlendFunc_ConstThroat : public BlendFunc_GenChamfer {
	public:
		/****************** BlendFunc_ConstThroat ******************/
		%feature("compactdefaultargs") BlendFunc_ConstThroat;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ConstThroat;
		 BlendFunc_ConstThroat(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the throat and the 'quadrant'.

Parameters
----------
aThroat: float
Standard_Real: 
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real aThroat, const Standard_Real, const Standard_Integer Choix);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

Parameters
----------
U1: float
V1: float
U2: float
V2: float
TgFirst: gp_Vec
TgLast: gp_Vec
NormFirst: gp_Vec
NormLast: gp_Vec

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend BlendFunc_ConstThroat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BlendFunc_ConstThroatInv *
*********************************/
class BlendFunc_ConstThroatInv : public BlendFunc_GenChamfInv {
	public:
		/****************** BlendFunc_ConstThroatInv ******************/
		%feature("compactdefaultargs") BlendFunc_ConstThroatInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ConstThroatInv;
		 BlendFunc_ConstThroatInv(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
theThroat: float
Standard_Real: 
Choix: int

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real theThroat, const Standard_Real, const Standard_Integer Choix);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend BlendFunc_ConstThroatInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class BlendFunc_ConstThroatWithPenetration *
*********************************************/
class BlendFunc_ConstThroatWithPenetration : public BlendFunc_ConstThroat {
	public:
		/****************** BlendFunc_ConstThroatWithPenetration ******************/
		%feature("compactdefaultargs") BlendFunc_ConstThroatWithPenetration;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ConstThroatWithPenetration;
		 BlendFunc_ConstThroatWithPenetration(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend BlendFunc_ConstThroatWithPenetration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class BlendFunc_ConstThroatWithPenetrationInv *
************************************************/
class BlendFunc_ConstThroatWithPenetrationInv : public BlendFunc_ConstThroatInv {
	public:
		/****************** BlendFunc_ConstThroatWithPenetrationInv ******************/
		%feature("compactdefaultargs") BlendFunc_ConstThroatWithPenetrationInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BlendFunc_ConstThroatWithPenetrationInv;
		 BlendFunc_ConstThroatWithPenetrationInv(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend BlendFunc_ConstThroatWithPenetrationInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
