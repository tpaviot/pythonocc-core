/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_blendfunc.html"
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
#include<GeomAbs_module.hxx>
#include<Blend_module.hxx>
#include<Law_module.hxx>
#include<math_module.hxx>
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
%import GeomAbs.i
%import Blend.i
%import Law.i
%import math.i
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
		/****** md5 signature: d38e8a23e7b3ad7cbf5ae5a552fa234d ******/
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
		static bool ComputeDNormal(const opencascade::handle<Adaptor3d_Surface> & Surf, const gp_Pnt2d & p2d, gp_Vec & Normal, gp_Vec & DNu, gp_Vec & DNv);

		/****** BlendFunc::ComputeNormal ******/
		/****** md5 signature: b1ef7d5a1555e0c922f6e376044411c9 ******/
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
		static bool ComputeNormal(const opencascade::handle<Adaptor3d_Surface> & Surf, const gp_Pnt2d & p2d, gp_Vec & Normal);

		/****** BlendFunc::GetMinimalWeights ******/
		/****** md5 signature: 405baf5bbd8751627145eba155456daf ******/
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "
Parameters
----------
SectShape: BlendFunc_SectionShape
TConv: Convert_ParameterisationType
AngleMin: double
AngleMax: double
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") GetMinimalWeights;
		static void GetMinimalWeights(const BlendFunc_SectionShape SectShape, const Convert_ParameterisationType TConv, const double AngleMin, const double AngleMax, NCollection_Array1<double> & Weigths);

		/****** BlendFunc::GetShape ******/
		/****** md5 signature: 136c16a5c705dfd3b30d42039ef83659 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
SectShape: BlendFunc_SectionShape
MaxAng: double

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
		static void GetShape(const BlendFunc_SectionShape SectShape, const double MaxAng, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Convert_ParameterisationType &OutValue);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_CSCircular::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BlendFunc_CSCircular::GetSection ******/
		/****** md5 signature: ecb123000e18615829a4a5735fccf980 ******/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
W: double
tabP: NCollection_Array1<gp_Pnt>
tabV: NCollection_Array1<gp_Vec>

Return
-------
bool

Description
-----------
No available documentation.
") GetSection;
		bool GetSection(const double Param, const double U, const double V, const double W, NCollection_Array1<gp_Pnt> & tabP, NCollection_Array1<gp_Vec> & tabV);

		/****** BlendFunc_CSCircular::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_CSCircular::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_CSCircular::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_CSCircular::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BlendFunc_CSCircular::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BlendFunc_CSCircular::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_CSCircular::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_CSCircular::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BlendFunc_CSCircular::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BlendFunc_CSCircular::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function (3).
") NbEquations;
		int NbEquations();

		/****** BlendFunc_CSCircular::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_CSCircular::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** BlendFunc_CSCircular::ParameterOnC ******/
		/****** md5 signature: cab779da3800344b5b86527b5baab561 ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnC;
		double ParameterOnC();

		/****** BlendFunc_CSCircular::Pnt2d ******/
		/****** md5 signature: 4a626c525fb82cec30918fc570d8735a ******/
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
		/****** md5 signature: ef615e902b9e7efa78fb803452c814ed ******/
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
		/****** md5 signature: 05d46557ea4c8c09ee7501573b0d89a8 ******/
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
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: 56d60f49e7d3a8efd63b085758759bc0 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
W: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") Section;
		void Section(const double Param, const double U, const double V, const double W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BlendFunc_CSCircular::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BlendFunc_CSCircular::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_CSCircular::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double First, const double Last);

		/****** BlendFunc_CSCircular::Set ******/
		/****** md5 signature: 8831783d575e11656545551bff3e87e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Radius, const int Choix);

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
		/****** md5 signature: 380390c11234491d56b722a297fc7638 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
TgS: gp_Vec
NormS: gp_Vec

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.
") Tangent;
		void Tangent(const double U, const double V, gp_Vec & TgS, gp_Vec & NormS);

		/****** BlendFunc_CSCircular::Tangent2d ******/
		/****** md5 signature: ffc94502902fba7995ab02f1c3c6c6f4 ******/
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
		/****** md5 signature: 995468e6f8f73374f53e87ab1909ec60 ******/
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
		/****** md5 signature: 1d4670085d81923137537d4e87e1327d ******/
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
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_CSCircular::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_CSConstRad::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BlendFunc_CSConstRad::GetSection ******/
		/****** md5 signature: ecb123000e18615829a4a5735fccf980 ******/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
W: double
tabP: NCollection_Array1<gp_Pnt>
tabV: NCollection_Array1<gp_Vec>

Return
-------
bool

Description
-----------
No available documentation.
") GetSection;
		bool GetSection(const double Param, const double U, const double V, const double W, NCollection_Array1<gp_Pnt> & tabP, NCollection_Array1<gp_Vec> & tabV);

		/****** BlendFunc_CSConstRad::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_CSConstRad::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_CSConstRad::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_CSConstRad::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BlendFunc_CSConstRad::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BlendFunc_CSConstRad::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_CSConstRad::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_CSConstRad::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BlendFunc_CSConstRad::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BlendFunc_CSConstRad::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function (3).
") NbEquations;
		int NbEquations();

		/****** BlendFunc_CSConstRad::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_CSConstRad::ParameterOnC ******/
		/****** md5 signature: cab779da3800344b5b86527b5baab561 ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnC;
		double ParameterOnC();

		/****** BlendFunc_CSConstRad::Pnt2d ******/
		/****** md5 signature: 4a626c525fb82cec30918fc570d8735a ******/
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
		/****** md5 signature: ef615e902b9e7efa78fb803452c814ed ******/
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
		/****** md5 signature: 05d46557ea4c8c09ee7501573b0d89a8 ******/
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
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: 56d60f49e7d3a8efd63b085758759bc0 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
W: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") Section;
		void Section(const double Param, const double U, const double V, const double W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BlendFunc_CSConstRad::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BlendFunc_CSConstRad::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_CSConstRad::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double First, const double Last);

		/****** BlendFunc_CSConstRad::Set ******/
		/****** md5 signature: 8831783d575e11656545551bff3e87e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Radius, const int Choix);

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
		/****** md5 signature: 380390c11234491d56b722a297fc7638 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
TgS: gp_Vec
NormS: gp_Vec

Return
-------
None

Description
-----------
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surface) at these points.
") Tangent;
		void Tangent(const double U, const double V, gp_Vec & TgS, gp_Vec & NormS);

		/****** BlendFunc_CSConstRad::Tangent2d ******/
		/****** md5 signature: ffc94502902fba7995ab02f1c3c6c6f4 ******/
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
		/****** md5 signature: 995468e6f8f73374f53e87ab1909ec60 ******/
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
		/****** md5 signature: 1d4670085d81923137537d4e87e1327d ******/
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
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_CSConstRad::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 772eeb7ae03a67deeffeeac2e0f624aa ******/
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
		bool ComputeValues(const math_Vector & X, const int DegF, const int DegL);

		/****** BlendFunc_ChAsym::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ChAsym::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BlendFunc_ChAsym::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BlendFunc_ChAsym::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_ChAsym::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_ChAsym::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_ChAsym::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BlendFunc_ChAsym::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BlendFunc_ChAsym::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ChAsym::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_ChAsym::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BlendFunc_ChAsym::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BlendFunc_ChAsym::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_ChAsym::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_ChAsym::PointOnS1 ******/
		/****** md5 signature: 85a19fcd5714c28d554b6716303c2525 ******/
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
		/****** md5 signature: b56a4871149b4a3af287f086f8a4b9a9 ******/
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
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: 0efaf2fb62b9926da8c190b6bfc39d89 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U1: double
V1: double
U2: double
V2: double
C: gp_Lin

Return
-------
Pdeb: double
Pfin: double

Description
-----------
Utile pour une visu rapide et approximative de la surface.
") Section;
		void Section(const double Param, const double U1, const double V1, const double U2, const double V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Lin & C);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BlendFunc_ChAsym::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BlendFunc_ChAsym::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_ChAsym::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double First, const double Last);

		/****** BlendFunc_ChAsym::Set ******/
		/****** md5 signature: e251f20e2a79222aee57818d2e64c56f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: double
Angle: double
Choix: int

Return
-------
None

Description
-----------
Sets the distances and the angle.
") Set;
		void Set(const double Dist1, const double Angle, const int Choix);

		/****** BlendFunc_ChAsym::Tangent ******/
		/****** md5 signature: 1694a7df974cf92a2b7d6377d84a1135 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U1: double
V1: double
U2: double
V2: double
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
		void Tangent(const double U1, const double V1, const double U2, const double V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_ChAsym::Tangent2dOnS1 ******/
		/****** md5 signature: f32ffbba871f6986806707d997ae30e7 ******/
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
		/****** md5 signature: 3da79e5df354c6a3f4d59400c8cf718b ******/
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
		/****** md5 signature: d0cbf634bc950b3b94d38e5b1bb090f6 ******/
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
		/****** md5 signature: e9cc8cf708023a979a3ed8c6a4d54f7a ******/
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
		/****** md5 signature: 1a9309429d040cb3839cc4bc6b56902e ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		bool TwistOnS1();

		/****** BlendFunc_ChAsym::TwistOnS2 ******/
		/****** md5 signature: 166e100e1908837d982aa5913b84ae72 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		bool TwistOnS2();

		/****** BlendFunc_ChAsym::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ChAsym::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 772eeb7ae03a67deeffeeac2e0f624aa ******/
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
		bool ComputeValues(const math_Vector & X, const int DegF, const int DegL);

		/****** BlendFunc_ChAsymInv::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ChAsymInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_ChAsymInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ChAsymInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_ChAsymInv::Set ******/
		/****** md5 signature: a877ad691641f9c9a269a30304df5b44 ******/
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
		void Set(const bool OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_ChAsymInv::Set ******/
		/****** md5 signature: e251f20e2a79222aee57818d2e64c56f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: double
Angle: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Dist1, const double Angle, const int Choix);

		/****** BlendFunc_ChAsymInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ChAsymInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 28e3deead731d98192f0824fd70c54da ******/
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "
Parameters
----------
Prm: double

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeRot;
		gp_Ax1 AxeRot(const double Prm);

		/****** BlendFunc_ConstRad::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstRad::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BlendFunc_ConstRad::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BlendFunc_ConstRad::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_ConstRad::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_ConstRad::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_ConstRad::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BlendFunc_ConstRad::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BlendFunc_ConstRad::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ConstRad::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_ConstRad::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BlendFunc_ConstRad::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BlendFunc_ConstRad::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_ConstRad::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_ConstRad::PointOnS1 ******/
		/****** md5 signature: 85a19fcd5714c28d554b6716303c2525 ******/
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
		/****** md5 signature: b56a4871149b4a3af287f086f8a4b9a9 ******/
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
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: 1cf47773b4fb03566dbdcaf1750c1c20 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U1: double
V1: double
U2: double
V2: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
Useful for a quick and approximate visualization of the surface area.
") Section;
		void Section(const double Param, const double U1, const double V1, const double U2, const double V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BlendFunc_ConstRad::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BlendFunc_ConstRad::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_ConstRad::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double First, const double Last);

		/****** BlendFunc_ConstRad::Set ******/
		/****** md5 signature: 8831783d575e11656545551bff3e87e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: double
Choix: int

Return
-------
None

Description
-----------
Inits the value of radius, and the 'quadrant'.
") Set;
		void Set(const double Radius, const int Choix);

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
		/****** md5 signature: 1694a7df974cf92a2b7d6377d84a1135 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U1: double
V1: double
U2: double
V2: double
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
		void Tangent(const double U1, const double V1, const double U2, const double V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_ConstRad::Tangent2dOnS1 ******/
		/****** md5 signature: f32ffbba871f6986806707d997ae30e7 ******/
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
		/****** md5 signature: 3da79e5df354c6a3f4d59400c8cf718b ******/
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
		/****** md5 signature: d0cbf634bc950b3b94d38e5b1bb090f6 ******/
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
		/****** md5 signature: e9cc8cf708023a979a3ed8c6a4d54f7a ******/
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
		/****** md5 signature: 1a9309429d040cb3839cc4bc6b56902e ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		bool TwistOnS1();

		/****** BlendFunc_ConstRad::TwistOnS2 ******/
		/****** md5 signature: 166e100e1908837d982aa5913b84ae72 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		bool TwistOnS2();

		/****** BlendFunc_ConstRad::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ConstRad::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstRadInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_ConstRadInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ConstRadInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_ConstRadInv::Set ******/
		/****** md5 signature: a877ad691641f9c9a269a30304df5b44 ******/
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
		void Set(const bool OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_ConstRadInv::Set ******/
		/****** md5 signature: f34c5931b25cd1eff5ce4bd1b1986eb2 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
R: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double R, const int Choix);

		/****** BlendFunc_ConstRadInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_ConstRadInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 1636562b598a31dbe89beeca5c9779a5 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_Corde::IsSolution ******/
		/****** md5 signature: aac2a27f6d770685de1c7bad830ced7c ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
Returns False if Sol is not solution else returns True and updates the fields tgs and tg2d.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_Corde::IsTangencyPoint ******/
		/****** md5 signature: 5fdbbb5c5371416b1705c6e1255262ea ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS.
") IsTangencyPoint;
		bool IsTangencyPoint();

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
		/****** md5 signature: 5a1755396102748e1132f016ded5f050 ******/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "
Parameters
----------
Dist: double

Return
-------
None

Description
-----------
No available documentation.
") SetDist;
		void SetDist(const double Dist);

		/****** BlendFunc_Corde::SetParam ******/
		/****** md5 signature: 2e61f0f29a1739cbff95be98be3ed082 ******/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") SetParam;
		void SetParam(const double Param);

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
		/****** md5 signature: cef98c0fa114586647ce033c63c24dc8 ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_EvolRad::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BlendFunc_EvolRad::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BlendFunc_EvolRad::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_EvolRad::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_EvolRad::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_EvolRad::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BlendFunc_EvolRad::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BlendFunc_EvolRad::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_EvolRad::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_EvolRad::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BlendFunc_EvolRad::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BlendFunc_EvolRad::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_EvolRad::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_EvolRad::PointOnS1 ******/
		/****** md5 signature: 85a19fcd5714c28d554b6716303c2525 ******/
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
		/****** md5 signature: b56a4871149b4a3af287f086f8a4b9a9 ******/
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
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: 1cf47773b4fb03566dbdcaf1750c1c20 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U1: double
V1: double
U2: double
V2: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
Method for graphic traces.
") Section;
		void Section(const double Param, const double U1, const double V1, const double U2, const double V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BlendFunc_EvolRad::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BlendFunc_EvolRad::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_EvolRad::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double First, const double Last);

		/****** BlendFunc_EvolRad::Set ******/
		/****** md5 signature: d75662a126e12003d686ba0ef57f21dc ******/
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
		void Set(const int Choix);

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
		/****** md5 signature: 1694a7df974cf92a2b7d6377d84a1135 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U1: double
V1: double
U2: double
V2: double
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
		void Tangent(const double U1, const double V1, const double U2, const double V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_EvolRad::Tangent2dOnS1 ******/
		/****** md5 signature: f32ffbba871f6986806707d997ae30e7 ******/
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
		/****** md5 signature: 3da79e5df354c6a3f4d59400c8cf718b ******/
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
		/****** md5 signature: d0cbf634bc950b3b94d38e5b1bb090f6 ******/
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
		/****** md5 signature: e9cc8cf708023a979a3ed8c6a4d54f7a ******/
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
		/****** md5 signature: 1a9309429d040cb3839cc4bc6b56902e ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		bool TwistOnS1();

		/****** BlendFunc_EvolRad::TwistOnS2 ******/
		/****** md5 signature: 166e100e1908837d982aa5913b84ae72 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		bool TwistOnS2();

		/****** BlendFunc_EvolRad::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_EvolRad::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_EvolRadInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_EvolRadInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_EvolRadInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_EvolRadInv::Set ******/
		/****** md5 signature: a877ad691641f9c9a269a30304df5b44 ******/
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
		void Set(const bool OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_EvolRadInv::Set ******/
		/****** md5 signature: d75662a126e12003d686ba0ef57f21dc ******/
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
		void Set(const int Choix);

		/****** BlendFunc_EvolRadInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_EvolRadInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_GenChamfInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_GenChamfInv::Set ******/
		/****** md5 signature: a877ad691641f9c9a269a30304df5b44 ******/
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
		void Set(const bool OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_GenChamfInv::Set ******/
		/****** md5 signature: a7a1ac1c4db88411dea3a05bcc8dab97 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: double
Dist2: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		virtual void Set(const double Dist1, const double Dist2, const int Choix);

		/****** BlendFunc_GenChamfInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BlendFunc_GenChamfer::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BlendFunc_GenChamfer::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_GenChamfer::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_GenChamfer::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BlendFunc_GenChamfer::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsRational;
		bool IsRational();

		/****** BlendFunc_GenChamfer::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BlendFunc_GenChamfer::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BlendFunc_GenChamfer::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_GenChamfer::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_GenChamfer::Resolution ******/
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: 0efaf2fb62b9926da8c190b6bfc39d89 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U1: double
V1: double
U2: double
V2: double
C: gp_Lin

Return
-------
Pdeb: double
Pfin: double

Description
-----------
Obsolete method.
") Section;
		void Section(const double Param, const double U1, const double V1, const double U2, const double V2, Standard_Real &OutValue, Standard_Real &OutValue, gp_Lin & C);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BlendFunc_GenChamfer::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BlendFunc_GenChamfer::Set ******/
		/****** md5 signature: 75de96e3dd3d14d6332679576ea5961c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
Sets the value of the parameter along the guide line. This determines the plane in which the solution has to be found.
") Set;
		void Set(const double Param);

		/****** BlendFunc_GenChamfer::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.
") Set;
		void Set(const double First, const double Last);

		/****** BlendFunc_GenChamfer::Set ******/
		/****** md5 signature: a7a1ac1c4db88411dea3a05bcc8dab97 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: double
Dist2: double
Choix: int

Return
-------
None

Description
-----------
Sets the distances and the 'quadrant'.
") Set;
		virtual void Set(const double Dist1, const double Dist2, const int Choix);

		/****** BlendFunc_GenChamfer::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 28e3deead731d98192f0824fd70c54da ******/
		%feature("compactdefaultargs") AxeRot;
		%feature("autodoc", "
Parameters
----------
Prm: double

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeRot;
		gp_Ax1 AxeRot(const double Prm);

		/****** BlendFunc_Ruled::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_Ruled::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BlendFunc_Ruled::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BlendFunc_Ruled::GetSection ******/
		/****** md5 signature: d2ecd0f0f674e1c1453f67b7fb995475 ******/
		%feature("compactdefaultargs") GetSection;
		%feature("autodoc", "
Parameters
----------
Param: double
U1: double
V1: double
U2: double
V2: double
tabP: NCollection_Array1<gp_Pnt>
tabV: NCollection_Array1<gp_Vec>

Return
-------
bool

Description
-----------
No available documentation.
") GetSection;
		bool GetSection(const double Param, const double U1, const double V1, const double U2, const double V2, NCollection_Array1<gp_Pnt> & tabP, NCollection_Array1<gp_Vec> & tabV);

		/****** BlendFunc_Ruled::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_Ruled::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_Ruled::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BlendFunc_Ruled::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals() raises OutOfRange from Standard.
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BlendFunc_Ruled::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsRational;
		bool IsRational();

		/****** BlendFunc_Ruled::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_Ruled::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_Ruled::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BlendFunc_Ruled::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BlendFunc_Ruled::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_Ruled::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BlendFunc_Ruled::PointOnS1 ******/
		/****** md5 signature: 85a19fcd5714c28d554b6716303c2525 ******/
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
		/****** md5 signature: b56a4871149b4a3af287f086f8a4b9a9 ******/
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
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BlendFunc_Ruled::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BlendFunc_Ruled::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BlendFunc_Ruled::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BlendFunc_Ruled::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_Ruled::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double First, const double Last);

		/****** BlendFunc_Ruled::Tangent ******/
		/****** md5 signature: 1694a7df974cf92a2b7d6377d84a1135 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U1: double
V1: double
U2: double
V2: double
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
		void Tangent(const double U1, const double V1, const double U2, const double V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_Ruled::Tangent2dOnS1 ******/
		/****** md5 signature: f32ffbba871f6986806707d997ae30e7 ******/
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
		/****** md5 signature: 3da79e5df354c6a3f4d59400c8cf718b ******/
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
		/****** md5 signature: d0cbf634bc950b3b94d38e5b1bb090f6 ******/
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
		/****** md5 signature: e9cc8cf708023a979a3ed8c6a4d54f7a ******/
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
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_Ruled::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_RuledInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BlendFunc_RuledInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_RuledInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** BlendFunc_RuledInv::Set ******/
		/****** md5 signature: a877ad691641f9c9a269a30304df5b44 ******/
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
		void Set(const bool OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** BlendFunc_RuledInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BlendFunc_RuledInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 270eee41e5da13f01a68dfda4a29e35c ******/
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
		 BlendFunc_Tensor(const int NbRow, const int NbCol, const int NbMat);

		/****** BlendFunc_Tensor::ChangeValue ******/
		/****** md5 signature: a892e08ed648d7d98a4c18d4814b8986 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Mat: int

Return
-------
double

Description
-----------
accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.
") ChangeValue;
		double & ChangeValue(const int Row, const int Col, const int Mat);

		/****** BlendFunc_Tensor::Init ******/
		/****** md5 signature: 988f2473f383681993e100174f1983b4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
InitialValue: double

Return
-------
None

Description
-----------
Initialize all the elements of a Tensor to InitialValue.
") Init;
		void Init(const double InitialValue);

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
		/****** md5 signature: 9e81a4f5a1626fcc9ad2ac4ea10fad19 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Mat: int

Return
-------
double

Description
-----------
accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.
") Value;
		const double & Value(const int Row, const int Col, const int Mat);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ChamfInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ChamfInv::Set ******/
		/****** md5 signature: 44f5252836224faa26ced1e3c4456b90 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: double
Dist2: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Dist1, const double Dist2, const int Choix);

		/****** BlendFunc_ChamfInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_Chamfer::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_Chamfer::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_Chamfer::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_Chamfer::PointOnS1 ******/
		/****** md5 signature: 85a19fcd5714c28d554b6716303c2525 ******/
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
		/****** md5 signature: b56a4871149b4a3af287f086f8a4b9a9 ******/
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
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_Chamfer::Set ******/
		/****** md5 signature: 44f5252836224faa26ced1e3c4456b90 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dist1: double
Dist2: double
Choix: int

Return
-------
None

Description
-----------
Sets the distances and the 'quadrant'.
") Set;
		void Set(const double Dist1, const double Dist2, const int Choix);

		/****** BlendFunc_Chamfer::Tangent ******/
		/****** md5 signature: 1694a7df974cf92a2b7d6377d84a1135 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U1: double
V1: double
U2: double
V2: double
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
		void Tangent(const double U1, const double V1, const double U2, const double V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_Chamfer::Tangent2dOnS1 ******/
		/****** md5 signature: f32ffbba871f6986806707d997ae30e7 ******/
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
		/****** md5 signature: 3da79e5df354c6a3f4d59400c8cf718b ******/
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
		/****** md5 signature: d0cbf634bc950b3b94d38e5b1bb090f6 ******/
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
		/****** md5 signature: e9cc8cf708023a979a3ed8c6a4d54f7a ******/
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
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroat::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_ConstThroat::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ConstThroat::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BlendFunc_ConstThroat::PointOnS1 ******/
		/****** md5 signature: 85a19fcd5714c28d554b6716303c2525 ******/
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
		/****** md5 signature: b56a4871149b4a3af287f086f8a4b9a9 ******/
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
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BlendFunc_ConstThroat::Set ******/
		/****** md5 signature: b1fbd7a81400edc796234caf1d912753 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
aThroat: double
: double
Choix: int

Return
-------
None

Description
-----------
Sets the throat and the 'quadrant'.
") Set;
		void Set(const double aThroat, const double , const int Choix);

		/****** BlendFunc_ConstThroat::Tangent ******/
		/****** md5 signature: 1694a7df974cf92a2b7d6377d84a1135 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
U1: double
V1: double
U2: double
V2: double
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
		void Tangent(const double U1, const double V1, const double U2, const double V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** BlendFunc_ConstThroat::Tangent2dOnS1 ******/
		/****** md5 signature: f32ffbba871f6986806707d997ae30e7 ******/
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
		/****** md5 signature: 3da79e5df354c6a3f4d59400c8cf718b ******/
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
		/****** md5 signature: d0cbf634bc950b3b94d38e5b1bb090f6 ******/
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
		/****** md5 signature: e9cc8cf708023a979a3ed8c6a4d54f7a ******/
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
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroatInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ConstThroatInv::Set ******/
		/****** md5 signature: 7ca329aab2ce916e18fbdda8ba60ff4b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theThroat: double
: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double theThroat, const double , const int Choix);

		/****** BlendFunc_ConstThroatInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroatWithPenetration::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BlendFunc_ConstThroatWithPenetration::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ConstThroatWithPenetration::Tangent2dOnS1 ******/
		/****** md5 signature: f32ffbba871f6986806707d997ae30e7 ******/
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
		/****** md5 signature: 3da79e5df354c6a3f4d59400c8cf718b ******/
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
		/****** md5 signature: d0cbf634bc950b3b94d38e5b1bb090f6 ******/
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
		/****** md5 signature: e9cc8cf708023a979a3ed8c6a4d54f7a ******/
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
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BlendFunc_ConstThroatWithPenetrationInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BlendFunc_ConstThroatWithPenetrationInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

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
