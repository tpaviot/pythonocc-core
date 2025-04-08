/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_blendfunc.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
		/****** BlendFunc::ComputeDNormal ******/
		/****** md5 signature: cde71b23cab8a2f1227199266c8cb896 ******/
		%feature("compactdefaultargs") ComputeDNormal;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
p2d: gp_Pnt2d
Normal: gp_Vec
DNu: gp_Vec
DNv: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") ComputeDNormal;
		static Standard_Boolean ComputeDNormal(const opencascade::handle<Adaptor3d_Surface> & Surf, const gp_Pnt2d & p2d, gp_Vec & Normal, gp_Vec & DNu, gp_Vec & DNv);

		/****** BlendFunc::ComputeNormal ******/
		/****** md5 signature: b82124d6f2c9c1dff1a9cca5be99986f ******/
		%feature("compactdefaultargs") ComputeNormal;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
p2d: gp_Pnt2d
Normal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") ComputeNormal;
		static Standard_Boolean ComputeNormal(const opencascade::handle<Adaptor3d_Surface> & Surf, const gp_Pnt2d & p2d, gp_Vec & Normal);

		/****** BlendFunc::GetMinimalWeights ******/
		/****** md5 signature: 309c1f7f13e6d4dfd26fbb05a6dc9e40 ******/
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "
Parameters
----------
SectShape: BlendFunc_SectionShape
TConv: Convert_ParameterisationType
AngleMin: float
AngleMax: float
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GetMinimalWeights;
		static void GetMinimalWeights(const BlendFunc_SectionShape SectShape, const Convert_ParameterisationType TConv, const Standard_Real AngleMin, const Standard_Real AngleMax, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc::GetShape ******/
		/****** md5 signature: ca49e9ca7d2f8c164b0ef798b93782a3 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
SectShape: BlendFunc_SectionShape
MaxAng: float

Return
-------
NbPoles: int
NbKnots: int
Degree: int
TypeConv: Convert_ParameterisationType

Description
-----------
No available documentation.
") GetShape;
		static void GetShape(const BlendFunc_SectionShape SectShape, const Standard_Real MaxAng, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Convert_ParameterisationType &OutValue);

		/****** BlendFunc::NextShape ******/
		/****** md5 signature: 5efba1f9776f24ad69a107a235287f2c ******/
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
GeomAbs_Shape

Description
-----------
Used to obtain the next level of continuity.
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
		/****** BlendFunc_CSCircular::BlendFunc_CSCircular ******/
		/****** md5 signature: d43560f235cf7a01ad5e6452468104a7 ******/
		%feature("compactdefaultargs") BlendFunc_CSCircular;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
CGuide: Adaptor3d_Curve
L: Law_Function

Return
-------
None

Description
-----------
Creates a function for a circular blending between a curve <C> and a surface <S>. The direction of the planes are given by <CGuide>. The position of the plane is determined on the curve <C>. <L> defines the change of parameter between <C> and <CGuide>. So, the planes are defined as described below: t is the current parameter on the guide line. Pguide = C(L(t)); Nguide = CGuide'(t)/||CGuide'(t)||.
") BlendFunc_CSCircular;
		 BlendFunc_CSCircular(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Curve> & CGuide, const opencascade::handle<Law_Function> & L);

		/****** BlendFunc_CSCircular::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_CSCircular::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_CSCircular::GetMinimalWeight ******/
		/****** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_CSCircular::GetSection ******/
		/****** md5 signature: 9f1c0c6229c95cd8346662c4ae052028 ******/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
W: float
tabP: TColgp_Array1OfPnt
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
No available documentation.
") GetSection;
		Standard_Boolean GetSection(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, TColgp_Array1OfPnt & tabP, TColgp_Array1OfVec & tabV);

		/****** BlendFunc_CSCircular::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_CSCircular::GetShape ******/
		/****** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BlendFunc_CSCircular::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_CSCircular::GetTolerance ******/
		/****** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_CSCircular::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BlendFunc_CSCircular::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		Standard_Boolean IsRational();

		/****** BlendFunc_CSCircular::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_CSCircular::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_CSCircular::Knots ******/
		/****** md5 signature: a226854cd9eac08cbe4282feaa46c20d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** BlendFunc_CSCircular::Mults ******/
		/****** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** BlendFunc_CSCircular::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function (3).
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_CSCircular::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_CSCircular::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** BlendFunc_CSCircular::ParameterOnC ******/
		/****** md5 signature: 931c449549243312ddad1092e529a0b4 ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****** BlendFunc_CSCircular::Pnt2d ******/
		/****** md5 signature: c0e2424281e3df0600c85feafc85476b ******/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2d;
		const gp_Pnt2d Pnt2d();

		/****** BlendFunc_CSCircular::PointOnC ******/
		/****** md5 signature: 6b0ebe8887a8345ce46800bc01420baf ******/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnC;
		const gp_Pnt PointOnC();

		/****** BlendFunc_CSCircular::PointOnS ******/
		/****** md5 signature: d0ce1246a72267935632a60d95848390 ******/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS;
		const gp_Pnt PointOnS();

		/****** BlendFunc_CSCircular::Resolution ******/
		/****** md5 signature: 1f885646df74c72ec13d37a113377aaa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: 906e6a4bef3056546e496b945ff8d788 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_CSCircular::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_CSCircular::Set ******/
		/****** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****** BlendFunc_CSCircular::Set ******/
		/****** md5 signature: 99fe75aea7947575eb6b646d1797f9da ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****** BlendFunc_CSCircular::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****** BlendFunc_CSCircular::Tangent ******/
		/****** md5 signature: 8b5f8faeab6ac0129ce32e99e844f22e ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
TgS: gp_Vec
NormS: gp_Vec

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.
") Tangent;
		void Tangent(const Standard_Real U, const Standard_Real V, gp_Vec & TgS, gp_Vec & NormS);

		/****** BlendFunc_CSCircular::Tangent2d ******/
		/****** md5 signature: 0fe985b779a02d58ed5caae77019a3ea ******/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2d;
		const gp_Vec2d Tangent2d();

		/****** BlendFunc_CSCircular::TangentOnC ******/
		/****** md5 signature: 9c5e999959c217a8456055e42ec88461 ******/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnC;
		const gp_Vec TangentOnC();

		/****** BlendFunc_CSCircular::TangentOnS ******/
		/****** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****** BlendFunc_CSCircular::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_CSCircular::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_CSConstRad::BlendFunc_CSConstRad ******/
		/****** md5 signature: 168f276159a046c8f0cdc04c4ef368b0 ******/
		%feature("compactdefaultargs") BlendFunc_CSConstRad;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
CGuide: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_CSConstRad;
		 BlendFunc_CSConstRad(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Curve> & CGuide);

		/****** BlendFunc_CSConstRad::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_CSConstRad::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_CSConstRad::GetMinimalWeight ******/
		/****** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_CSConstRad::GetSection ******/
		/****** md5 signature: 9f1c0c6229c95cd8346662c4ae052028 ******/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
W: float
tabP: TColgp_Array1OfPnt
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
No available documentation.
") GetSection;
		Standard_Boolean GetSection(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, TColgp_Array1OfPnt & tabP, TColgp_Array1OfVec & tabV);

		/****** BlendFunc_CSConstRad::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_CSConstRad::GetShape ******/
		/****** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BlendFunc_CSConstRad::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_CSConstRad::GetTolerance ******/
		/****** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_CSConstRad::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BlendFunc_CSConstRad::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		Standard_Boolean IsRational();

		/****** BlendFunc_CSConstRad::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_CSConstRad::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_CSConstRad::Knots ******/
		/****** md5 signature: a226854cd9eac08cbe4282feaa46c20d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** BlendFunc_CSConstRad::Mults ******/
		/****** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** BlendFunc_CSConstRad::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function (3).
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_CSConstRad::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_CSConstRad::ParameterOnC ******/
		/****** md5 signature: 931c449549243312ddad1092e529a0b4 ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****** BlendFunc_CSConstRad::Pnt2d ******/
		/****** md5 signature: c0e2424281e3df0600c85feafc85476b ******/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2d;
		const gp_Pnt2d Pnt2d();

		/****** BlendFunc_CSConstRad::PointOnC ******/
		/****** md5 signature: 6b0ebe8887a8345ce46800bc01420baf ******/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnC;
		const gp_Pnt PointOnC();

		/****** BlendFunc_CSConstRad::PointOnS ******/
		/****** md5 signature: d0ce1246a72267935632a60d95848390 ******/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS;
		const gp_Pnt PointOnS();

		/****** BlendFunc_CSConstRad::Resolution ******/
		/****** md5 signature: 1f885646df74c72ec13d37a113377aaa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: 906e6a4bef3056546e496b945ff8d788 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_CSConstRad::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_CSConstRad::Set ******/
		/****** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****** BlendFunc_CSConstRad::Set ******/
		/****** md5 signature: 99fe75aea7947575eb6b646d1797f9da ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****** BlendFunc_CSConstRad::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****** BlendFunc_CSConstRad::Tangent ******/
		/****** md5 signature: 8b5f8faeab6ac0129ce32e99e844f22e ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
TgS: gp_Vec
NormS: gp_Vec

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.
") Tangent;
		void Tangent(const Standard_Real U, const Standard_Real V, gp_Vec & TgS, gp_Vec & NormS);

		/****** BlendFunc_CSConstRad::Tangent2d ******/
		/****** md5 signature: 0fe985b779a02d58ed5caae77019a3ea ******/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2d;
		const gp_Vec2d Tangent2d();

		/****** BlendFunc_CSConstRad::TangentOnC ******/
		/****** md5 signature: 9c5e999959c217a8456055e42ec88461 ******/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnC;
		const gp_Vec TangentOnC();

		/****** BlendFunc_CSConstRad::TangentOnS ******/
		/****** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****** BlendFunc_CSConstRad::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_CSConstRad::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ChAsym::BlendFunc_ChAsym ******/
		/****** md5 signature: b229d2c8a2fc1a7aa0dd5e5a3c42e55f ******/
		%feature("compactdefaultargs") BlendFunc_ChAsym;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ChAsym;
		 BlendFunc_ChAsym(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ChAsym::ComputeValues ******/
		/****** md5 signature: 204816d5dcb99a46213f8c407defdb50 ******/
		%feature("compactdefaultargs") ComputeValues;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
DegF: int
DegL: int

Return
-------
bool

Description
-----------
computes the values <F> of the derivatives for the variable <X> between DegF and DegL. Returns True if the computation was done successfully, False otherwise.
") ComputeValues;
		Standard_Boolean ComputeValues(const math_Vector & X, const Standard_Integer DegF, const Standard_Integer DegL);

		/****** BlendFunc_ChAsym::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ChAsym::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_ChAsym::GetMinimalDistance ******/
		/****** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****** BlendFunc_ChAsym::GetMinimalWeight ******/
		/****** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_ChAsym::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_ChAsym::GetShape ******/
		/****** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BlendFunc_ChAsym::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_ChAsym::GetTolerance ******/
		/****** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_ChAsym::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BlendFunc_ChAsym::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		Standard_Boolean IsRational();

		/****** BlendFunc_ChAsym::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ChAsym::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_ChAsym::Knots ******/
		/****** md5 signature: a226854cd9eac08cbe4282feaa46c20d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** BlendFunc_ChAsym::Mults ******/
		/****** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** BlendFunc_ChAsym::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_ChAsym::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_ChAsym::PointOnS1 ******/
		/****** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****** BlendFunc_ChAsym::PointOnS2 ******/
		/****** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****** BlendFunc_ChAsym::Resolution ******/
		/****** md5 signature: 1f885646df74c72ec13d37a113377aaa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: 08613591ef85c2aabd1650c70190523f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Lin

Return
-------
Pdeb: float
Pfin: float

Description
-----------
Utile pour une visu rapide et approximative de la surface.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Lin & C);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: cab230a655fc4e6bce41754b18837678 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** BlendFunc_ChAsym::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_ChAsym::Set ******/
		/****** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****** BlendFunc_ChAsym::Set ******/
		/****** md5 signature: 3d2665ead473e36c7266c389a87d886a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: float
Angle: float
Choix: int

Return
-------
None

Description
-----------
Sets the distances and the angle.
") Set;
		void Set(const Standard_Real Dist1, const Standard_Real Angle, const Standard_Integer Choix);

		/****** BlendFunc_ChAsym::Tangent ******/
		/****** md5 signature: 13397954dafd053b9875c1007b2501b6 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_ChAsym::Tangent2dOnS1 ******/
		/****** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****** BlendFunc_ChAsym::Tangent2dOnS2 ******/
		/****** md5 signature: f57294e3963627cbeb43134bc6c1d88a ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****** BlendFunc_ChAsym::TangentOnS1 ******/
		/****** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** BlendFunc_ChAsym::TangentOnS2 ******/
		/****** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****** BlendFunc_ChAsym::TwistOnS1 ******/
		/****** md5 signature: bcab8c931932008ff46a37653f1cc038 ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****** BlendFunc_ChAsym::TwistOnS2 ******/
		/****** md5 signature: 2e0e0e8d012a93b95309a3593de0d937 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****** BlendFunc_ChAsym::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ChAsym::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ChAsymInv::BlendFunc_ChAsymInv ******/
		/****** md5 signature: 57d9c726e0f3e32ebb79dc260d6ff4e1 ******/
		%feature("compactdefaultargs") BlendFunc_ChAsymInv;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ChAsymInv;
		 BlendFunc_ChAsymInv(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ChAsymInv::ComputeValues ******/
		/****** md5 signature: 204816d5dcb99a46213f8c407defdb50 ******/
		%feature("compactdefaultargs") ComputeValues;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
DegF: int
DegL: int

Return
-------
bool

Description
-----------
computes the values <F> of the derivatives for the variable <X> between DegF and DegL. Returns True if the computation was done successfully, False otherwise.
") ComputeValues;
		Standard_Boolean ComputeValues(const math_Vector & X, const Standard_Integer DegF, const Standard_Integer DegL);

		/****** BlendFunc_ChAsymInv::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ChAsymInv::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_ChAsymInv::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_ChAsymInv::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ChAsymInv::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_ChAsymInv::Set ******/
		/****** md5 signature: 229bdaddea2d80c843d774149f42a9d3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_ChAsymInv::Set ******/
		/****** md5 signature: 3d2665ead473e36c7266c389a87d886a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: float
Angle: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Dist1, const Standard_Real Angle, const Standard_Integer Choix);

		/****** BlendFunc_ChAsymInv::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ChAsymInv::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ConstRad::BlendFunc_ConstRad ******/
		/****** md5 signature: ec463286ed779585c6f6c64e454c4923 ******/
		%feature("compactdefaultargs") BlendFunc_ConstRad;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ConstRad;
		 BlendFunc_ConstRad(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ConstRad::AxeRot ******/
		/****** md5 signature: 0c9178d91224ee5e9d339eb0f66536ab ******/
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "
Parameters
----------
Prm: float

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeRot;
		gp_Ax1 AxeRot(const Standard_Real Prm);

		/****** BlendFunc_ConstRad::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstRad::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_ConstRad::GetMinimalDistance ******/
		/****** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****** BlendFunc_ConstRad::GetMinimalWeight ******/
		/****** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_ConstRad::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_ConstRad::GetShape ******/
		/****** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BlendFunc_ConstRad::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_ConstRad::GetTolerance ******/
		/****** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_ConstRad::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BlendFunc_ConstRad::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		Standard_Boolean IsRational();

		/****** BlendFunc_ConstRad::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ConstRad::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_ConstRad::Knots ******/
		/****** md5 signature: a226854cd9eac08cbe4282feaa46c20d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** BlendFunc_ConstRad::Mults ******/
		/****** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** BlendFunc_ConstRad::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_ConstRad::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_ConstRad::PointOnS1 ******/
		/****** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****** BlendFunc_ConstRad::PointOnS2 ******/
		/****** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****** BlendFunc_ConstRad::Resolution ******/
		/****** md5 signature: 1f885646df74c72ec13d37a113377aaa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: 1ac8474fa2de24fef2821831782ec53a ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
Utile pour une visu rapide et approximative de la surface.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: cab230a655fc4e6bce41754b18837678 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_ConstRad::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_ConstRad::Set ******/
		/****** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****** BlendFunc_ConstRad::Set ******/
		/****** md5 signature: 99fe75aea7947575eb6b646d1797f9da ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: float
Choix: int

Return
-------
None

Description
-----------
Inits the value of radius, and the 'quadrant'.
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****** BlendFunc_ConstRad::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****** BlendFunc_ConstRad::Tangent ******/
		/****** md5 signature: 13397954dafd053b9875c1007b2501b6 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_ConstRad::Tangent2dOnS1 ******/
		/****** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****** BlendFunc_ConstRad::Tangent2dOnS2 ******/
		/****** md5 signature: f57294e3963627cbeb43134bc6c1d88a ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****** BlendFunc_ConstRad::TangentOnS1 ******/
		/****** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** BlendFunc_ConstRad::TangentOnS2 ******/
		/****** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****** BlendFunc_ConstRad::TwistOnS1 ******/
		/****** md5 signature: bcab8c931932008ff46a37653f1cc038 ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****** BlendFunc_ConstRad::TwistOnS2 ******/
		/****** md5 signature: 2e0e0e8d012a93b95309a3593de0d937 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****** BlendFunc_ConstRad::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ConstRad::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ConstRadInv::BlendFunc_ConstRadInv ******/
		/****** md5 signature: c8f32f0129f68758453c9740132fe619 ******/
		%feature("compactdefaultargs") BlendFunc_ConstRadInv;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ConstRadInv;
		 BlendFunc_ConstRadInv(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ConstRadInv::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstRadInv::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_ConstRadInv::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_ConstRadInv::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ConstRadInv::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_ConstRadInv::Set ******/
		/****** md5 signature: 229bdaddea2d80c843d774149f42a9d3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_ConstRadInv::Set ******/
		/****** md5 signature: 941166ee1a941569b8be371b05e6b601 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
R: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real R, const Standard_Integer Choix);

		/****** BlendFunc_ConstRadInv::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ConstRadInv::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_Corde::BlendFunc_Corde ******/
		/****** md5 signature: 09c11190c26094da844f7a5a6a6617c4 ******/
		%feature("compactdefaultargs") BlendFunc_Corde;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
CGuide: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_Corde;
		 BlendFunc_Corde(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & CGuide);

		/****** BlendFunc_Corde::DerFguide ******/
		/****** md5 signature: 23a9f18e67908903d4dd5177d48fb2af ******/
		%feature("compactdefaultargs") DerFguide;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
DerF: gp_Vec2d

Return
-------
None

Description
-----------
Derived of the function compared to the parameter of the guideline.
") DerFguide;
		void DerFguide(const math_Vector & Sol, gp_Vec2d & DerF);

		/****** BlendFunc_Corde::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_Corde::IsSolution ******/
		/****** md5 signature: 0884df902635922234b529dc88a260b5 ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
Returns False if Sol is not solution else returns True and updates the fields tgs and tg2d.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_Corde::IsTangencyPoint ******/
		/****** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_Corde::NPlan ******/
		/****** md5 signature: 1752f4f55cfe405bd67775b7f8e77006 ******/
		%feature("compactdefaultargs") NPlan;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
returns the normal to CGuide at Ptgui.
") NPlan;
		const gp_Vec NPlan();

		/****** BlendFunc_Corde::PointOnGuide ******/
		/****** md5 signature: e87472d23145a96f1fa3e3141ac7c2dd ******/
		%feature("compactdefaultargs") PointOnGuide;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns the point of parameter <Param> on CGuide.
") PointOnGuide;
		const gp_Pnt PointOnGuide();

		/****** BlendFunc_Corde::PointOnS ******/
		/****** md5 signature: 7701a4dd49c389b38b1770bec82a60cd ******/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS;
		const gp_Pnt PointOnS();

		/****** BlendFunc_Corde::SetDist ******/
		/****** md5 signature: a0f41880e1eb0af062b3350ce3ca3532 ******/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "
Parameters
----------
Dist: float

Return
-------
None

Description
-----------
No available documentation.
") SetDist;
		void SetDist(const Standard_Real Dist);

		/****** BlendFunc_Corde::SetParam ******/
		/****** md5 signature: afbb70d3463dbd3dc51af6c494b8ebef ******/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") SetParam;
		void SetParam(const Standard_Real Param);

		/****** BlendFunc_Corde::Tangent2dOnS ******/
		/****** md5 signature: 277e1459ed99bd7331c01c470b757dad ******/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnS, in the parametric space of the first surface.
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****** BlendFunc_Corde::TangentOnS ******/
		/****** md5 signature: 6a76df7a0ec21039226ae1d5b4797449 ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnS, in 3d space.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****** BlendFunc_Corde::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Function for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_EvolRad::BlendFunc_EvolRad ******/
		/****** md5 signature: 0d3aa13d1183ca5db26a2b0aa1b7ba32 ******/
		%feature("compactdefaultargs") BlendFunc_EvolRad;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve
Law: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_EvolRad;
		 BlendFunc_EvolRad(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Law_Function> & Law);

		/****** BlendFunc_EvolRad::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_EvolRad::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_EvolRad::GetMinimalDistance ******/
		/****** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****** BlendFunc_EvolRad::GetMinimalWeight ******/
		/****** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_EvolRad::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_EvolRad::GetShape ******/
		/****** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BlendFunc_EvolRad::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_EvolRad::GetTolerance ******/
		/****** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_EvolRad::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BlendFunc_EvolRad::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		Standard_Boolean IsRational();

		/****** BlendFunc_EvolRad::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_EvolRad::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_EvolRad::Knots ******/
		/****** md5 signature: a226854cd9eac08cbe4282feaa46c20d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** BlendFunc_EvolRad::Mults ******/
		/****** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** BlendFunc_EvolRad::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_EvolRad::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_EvolRad::PointOnS1 ******/
		/****** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****** BlendFunc_EvolRad::PointOnS2 ******/
		/****** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****** BlendFunc_EvolRad::Resolution ******/
		/****** md5 signature: 1f885646df74c72ec13d37a113377aaa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: 1ac8474fa2de24fef2821831782ec53a ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
Method for graphic traces.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: cab230a655fc4e6bce41754b18837678 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_EvolRad::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_EvolRad::Set ******/
		/****** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****** BlendFunc_EvolRad::Set ******/
		/****** md5 signature: d73c9c4058c0955fc8cd59888660f750 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer Choix);

		/****** BlendFunc_EvolRad::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****** BlendFunc_EvolRad::Tangent ******/
		/****** md5 signature: 13397954dafd053b9875c1007b2501b6 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_EvolRad::Tangent2dOnS1 ******/
		/****** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****** BlendFunc_EvolRad::Tangent2dOnS2 ******/
		/****** md5 signature: f57294e3963627cbeb43134bc6c1d88a ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****** BlendFunc_EvolRad::TangentOnS1 ******/
		/****** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** BlendFunc_EvolRad::TangentOnS2 ******/
		/****** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****** BlendFunc_EvolRad::TwistOnS1 ******/
		/****** md5 signature: bcab8c931932008ff46a37653f1cc038 ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****** BlendFunc_EvolRad::TwistOnS2 ******/
		/****** md5 signature: 2e0e0e8d012a93b95309a3593de0d937 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****** BlendFunc_EvolRad::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_EvolRad::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_EvolRadInv::BlendFunc_EvolRadInv ******/
		/****** md5 signature: d0bf0a36455b752e44c89151c15747c3 ******/
		%feature("compactdefaultargs") BlendFunc_EvolRadInv;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve
Law: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_EvolRadInv;
		 BlendFunc_EvolRadInv(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Law_Function> & Law);

		/****** BlendFunc_EvolRadInv::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_EvolRadInv::GetBounds ******/
		/****** md5 signature: 73d101c74e718085b2fc8de28383bce3 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_EvolRadInv::GetTolerance ******/
		/****** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_EvolRadInv::IsSolution ******/
		/****** md5 signature: 0884df902635922234b529dc88a260b5 ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_EvolRadInv::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_EvolRadInv::Set ******/
		/****** md5 signature: cdc53548b1d92196db3a77124e819099 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_EvolRadInv::Set ******/
		/****** md5 signature: d73c9c4058c0955fc8cd59888660f750 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer Choix);

		/****** BlendFunc_EvolRadInv::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_EvolRadInv::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_GenChamfInv::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_GenChamfInv::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_GenChamfInv::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_GenChamfInv::Set ******/
		/****** md5 signature: 4eba17c1fe83cac47590d6f96738fedb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		virtual void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_GenChamfInv::Set ******/
		/****** md5 signature: ee1b691ca844b8dd605892e1ef6591ed ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: float
Dist2: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		virtual void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****** BlendFunc_GenChamfInv::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_GenChamfer::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_GenChamfer::GetMinimalDistance ******/
		/****** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****** BlendFunc_GenChamfer::GetMinimalWeight ******/
		/****** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_GenChamfer::GetShape ******/
		/****** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BlendFunc_GenChamfer::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_GenChamfer::GetTolerance ******/
		/****** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_GenChamfer::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BlendFunc_GenChamfer::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsRational;
		Standard_Boolean IsRational();

		/****** BlendFunc_GenChamfer::Knots ******/
		/****** md5 signature: a226854cd9eac08cbe4282feaa46c20d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** BlendFunc_GenChamfer::Mults ******/
		/****** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** BlendFunc_GenChamfer::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_GenChamfer::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_GenChamfer::Resolution ******/
		/****** md5 signature: 1f885646df74c72ec13d37a113377aaa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: 08613591ef85c2aabd1650c70190523f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
C: gp_Lin

Return
-------
Pdeb: float
Pfin: float

Description
-----------
Obsolete method.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Lin & C);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: 906e6a4bef3056546e496b945ff8d788 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_GenChamfer::Set ******/
		/****** md5 signature: ade0965988faf3dc4bb7b4c53f18e212 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
Sets the value of the parameter along the guide line. This determines the plane in which the solution has to be found.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_GenChamfer::Set ******/
		/****** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****** BlendFunc_GenChamfer::Set ******/
		/****** md5 signature: ee1b691ca844b8dd605892e1ef6591ed ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: float
Dist2: float
Choix: int

Return
-------
None

Description
-----------
Sets the distances and the 'quadrant'.
") Set;
		virtual void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****** BlendFunc_GenChamfer::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_Ruled::BlendFunc_Ruled ******/
		/****** md5 signature: e253035d359b127a63cfdd5fd602f572 ******/
		%feature("compactdefaultargs") BlendFunc_Ruled;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_Ruled;
		 BlendFunc_Ruled(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_Ruled::AxeRot ******/
		/****** md5 signature: 0c9178d91224ee5e9d339eb0f66536ab ******/
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "
Parameters
----------
Prm: float

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeRot;
		gp_Ax1 AxeRot(const Standard_Real Prm);

		/****** BlendFunc_Ruled::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_Ruled::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_Ruled::GetMinimalDistance ******/
		/****** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****** BlendFunc_Ruled::GetMinimalWeight ******/
		/****** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_Ruled::GetSection ******/
		/****** md5 signature: 3b1a617ddcc473f31a5d805861a150b8 ******/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "
Parameters
----------
Param: float
U1: float
V1: float
U2: float
V2: float
tabP: TColgp_Array1OfPnt
tabV: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
No available documentation.
") GetSection;
		Standard_Boolean GetSection(const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, TColgp_Array1OfPnt & tabP, TColgp_Array1OfVec & tabV);

		/****** BlendFunc_Ruled::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_Ruled::GetShape ******/
		/****** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BlendFunc_Ruled::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_Ruled::GetTolerance ******/
		/****** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_Ruled::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BlendFunc_Ruled::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsRational;
		Standard_Boolean IsRational();

		/****** BlendFunc_Ruled::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_Ruled::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_Ruled::Knots ******/
		/****** md5 signature: a226854cd9eac08cbe4282feaa46c20d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** BlendFunc_Ruled::Mults ******/
		/****** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** BlendFunc_Ruled::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_Ruled::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_Ruled::PointOnS1 ******/
		/****** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****** BlendFunc_Ruled::PointOnS2 ******/
		/****** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****** BlendFunc_Ruled::Resolution ******/
		/****** md5 signature: 1f885646df74c72ec13d37a113377aaa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_Ruled::Section ******/
		/****** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** BlendFunc_Ruled::Section ******/
		/****** md5 signature: 906e6a4bef3056546e496b945ff8d788 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** BlendFunc_Ruled::Section ******/
		/****** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** BlendFunc_Ruled::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_Ruled::Set ******/
		/****** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****** BlendFunc_Ruled::Tangent ******/
		/****** md5 signature: 13397954dafd053b9875c1007b2501b6 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_Ruled::Tangent2dOnS1 ******/
		/****** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****** BlendFunc_Ruled::Tangent2dOnS2 ******/
		/****** md5 signature: f57294e3963627cbeb43134bc6c1d88a ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****** BlendFunc_Ruled::TangentOnS1 ******/
		/****** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** BlendFunc_Ruled::TangentOnS2 ******/
		/****** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****** BlendFunc_Ruled::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_Ruled::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_RuledInv::BlendFunc_RuledInv ******/
		/****** md5 signature: f15fc82b59c0b2a87d88c3189053e8a5 ******/
		%feature("compactdefaultargs") BlendFunc_RuledInv;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_RuledInv;
		 BlendFunc_RuledInv(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_RuledInv::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_RuledInv::GetBounds ******/
		/****** md5 signature: 7f39b43072461a3f70a63d3178e97743 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BlendFunc_RuledInv::GetTolerance ******/
		/****** md5 signature: db57a1b1119c0b1280472660909013c2 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** BlendFunc_RuledInv::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_RuledInv::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****** BlendFunc_RuledInv::Set ******/
		/****** md5 signature: 229bdaddea2d80c843d774149f42a9d3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_RuledInv::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_RuledInv::Values ******/
		/****** md5 signature: cb66193525cc0a7235a2cde2a228308b ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_Tensor::BlendFunc_Tensor ******/
		/****** md5 signature: da51a6a7a08009ec08b575ec302d3494 ******/
		%feature("compactdefaultargs") BlendFunc_Tensor;
		%feature("autodoc", "
Parameters
----------
NbRow: int
NbCol: int
NbMat: int

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BlendFunc_Tensor::Init ******/
		/****** md5 signature: 6aef026ef1fcb18a844e723ac935cd4b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
InitialValue: float

Return
-------
None

Description
-----------
Initialize all the elements of a Tensor to InitialValue.
") Init;
		void Init(const Standard_Real InitialValue);

		/****** BlendFunc_Tensor::Multiply ******/
		/****** md5 signature: 1744e84f6795d21ff935088da038d2e5 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Right: math_Vector
Product: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Multiply;
		void Multiply(const math_Vector & Right, math_Matrix & Product);

		/****** BlendFunc_Tensor::Value ******/
		/****** md5 signature: fd791f445ff1b5b7d6ca99e04d3b9805 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Mat: int

Return
-------
float

Description
-----------
accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.
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
		/****** BlendFunc_ChamfInv::BlendFunc_ChamfInv ******/
		/****** md5 signature: 03770f1d2075d29aa171bd8362874cff ******/
		%feature("compactdefaultargs") BlendFunc_ChamfInv;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ChamfInv;
		 BlendFunc_ChamfInv(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ChamfInv::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ChamfInv::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ChamfInv::Set ******/
		/****** md5 signature: e496fd995a5894c8dcf67747e2a803cb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: float
Dist2: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		virtual void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****** BlendFunc_ChamfInv::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_Chamfer::BlendFunc_Chamfer ******/
		/****** md5 signature: 95f7dc1cb02ec7d245aeb0d13e68126f ******/
		%feature("compactdefaultargs") BlendFunc_Chamfer;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
CG: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_Chamfer;
		 BlendFunc_Chamfer(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & CG);

		/****** BlendFunc_Chamfer::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_Chamfer::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_Chamfer::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_Chamfer::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_Chamfer::PointOnS1 ******/
		/****** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****** BlendFunc_Chamfer::PointOnS2 ******/
		/****** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****** BlendFunc_Chamfer::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_Chamfer::Set ******/
		/****** md5 signature: 78f9e2c80c7864a7b03452bb77fff0ef ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: float
Dist2: float
Choix: int

Return
-------
None

Description
-----------
Sets the distances and the 'quadrant'.
") Set;
		void Set(const Standard_Real Dist1, const Standard_Real Dist2, const Standard_Integer Choix);

		/****** BlendFunc_Chamfer::Tangent ******/
		/****** md5 signature: 13397954dafd053b9875c1007b2501b6 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_Chamfer::Tangent2dOnS1 ******/
		/****** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****** BlendFunc_Chamfer::Tangent2dOnS2 ******/
		/****** md5 signature: f57294e3963627cbeb43134bc6c1d88a ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****** BlendFunc_Chamfer::TangentOnS1 ******/
		/****** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** BlendFunc_Chamfer::TangentOnS2 ******/
		/****** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****** BlendFunc_Chamfer::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ConstThroat::BlendFunc_ConstThroat ******/
		/****** md5 signature: cbea5b84841b251171871eebe4d6cd9e ******/
		%feature("compactdefaultargs") BlendFunc_ConstThroat;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ConstThroat;
		 BlendFunc_ConstThroat(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ConstThroat::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroat::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_ConstThroat::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ConstThroat::IsTangencyPoint ******/
		/****** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** BlendFunc_ConstThroat::PointOnS1 ******/
		/****** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****** BlendFunc_ConstThroat::PointOnS2 ******/
		/****** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****** BlendFunc_ConstThroat::Set ******/
		/****** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****** BlendFunc_ConstThroat::Set ******/
		/****** md5 signature: 1bdd5799d0a739d4dad4e3ec0319d08f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
aThroat: float
Standard_Real: 
Choix: int

Return
-------
None

Description
-----------
Sets the throat and the 'quadrant'.
") Set;
		void Set(const Standard_Real aThroat, const Standard_Real, const Standard_Integer Choix);

		/****** BlendFunc_ConstThroat::Tangent ******/
		/****** md5 signature: 13397954dafd053b9875c1007b2501b6 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_ConstThroat::Tangent2dOnS1 ******/
		/****** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****** BlendFunc_ConstThroat::Tangent2dOnS2 ******/
		/****** md5 signature: f57294e3963627cbeb43134bc6c1d88a ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****** BlendFunc_ConstThroat::TangentOnS1 ******/
		/****** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** BlendFunc_ConstThroat::TangentOnS2 ******/
		/****** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****** BlendFunc_ConstThroat::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ConstThroatInv::BlendFunc_ConstThroatInv ******/
		/****** md5 signature: 95409ba97313f153bfd0f5ac1ebb3f61 ******/
		%feature("compactdefaultargs") BlendFunc_ConstThroatInv;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ConstThroatInv;
		 BlendFunc_ConstThroatInv(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ConstThroatInv::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroatInv::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ConstThroatInv::Set ******/
		/****** md5 signature: ed48a688c0043088f72c032534118aef ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theThroat: float
Standard_Real: 
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		virtual void Set(const Standard_Real theThroat, const Standard_Real, const Standard_Integer Choix);

		/****** BlendFunc_ConstThroatInv::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ConstThroatWithPenetration::BlendFunc_ConstThroatWithPenetration ******/
		/****** md5 signature: ea57eb46c007f8b6b82e5faf10c5067c ******/
		%feature("compactdefaultargs") BlendFunc_ConstThroatWithPenetration;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ConstThroatWithPenetration;
		 BlendFunc_ConstThroatWithPenetration(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ConstThroatWithPenetration::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroatWithPenetration::GetSectionSize ******/
		/****** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****** BlendFunc_ConstThroatWithPenetration::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ConstThroatWithPenetration::Tangent2dOnS1 ******/
		/****** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****** BlendFunc_ConstThroatWithPenetration::Tangent2dOnS2 ******/
		/****** md5 signature: f57294e3963627cbeb43134bc6c1d88a ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****** BlendFunc_ConstThroatWithPenetration::TangentOnS1 ******/
		/****** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** BlendFunc_ConstThroatWithPenetration::TangentOnS2 ******/
		/****** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****** BlendFunc_ConstThroatWithPenetration::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
		/****** BlendFunc_ConstThroatWithPenetrationInv::BlendFunc_ConstThroatWithPenetrationInv ******/
		/****** md5 signature: 4f8493ab3f5eb8a9ea5778e7a093e544 ******/
		%feature("compactdefaultargs") BlendFunc_ConstThroatWithPenetrationInv;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BlendFunc_ConstThroatWithPenetrationInv;
		 BlendFunc_ConstThroatWithPenetrationInv(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BlendFunc_ConstThroatWithPenetrationInv::Derivatives ******/
		/****** md5 signature: 940fde1549012c9025c437a16f7d8c18 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroatWithPenetrationInv::IsSolution ******/
		/****** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** BlendFunc_ConstThroatWithPenetrationInv::Value ******/
		/****** md5 signature: 1b689850305d8b13f289849027f0887b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def blendfunc_ComputeDNormal(*args):
	return blendfunc.ComputeDNormal(*args)

@deprecated
def blendfunc_ComputeNormal(*args):
	return blendfunc.ComputeNormal(*args)

@deprecated
def blendfunc_GetMinimalWeights(*args):
	return blendfunc.GetMinimalWeights(*args)

@deprecated
def blendfunc_GetShape(*args):
	return blendfunc.GetShape(*args)

@deprecated
def blendfunc_NextShape(*args):
	return blendfunc.NextShape(*args)

}
