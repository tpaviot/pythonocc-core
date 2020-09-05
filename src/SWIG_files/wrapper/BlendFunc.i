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
		/**** md5 signature: f066a8c4e5ca3896e02a2f4a119a1427 ****/
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
		/**** md5 signature: 3ff79316037356952d52d5773250be00 ****/
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
		/**** md5 signature: 309c1f7f13e6d4dfd26fbb05a6dc9e40 ****/
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
		/**** md5 signature: ca49e9ca7d2f8c164b0ef798b93782a3 ****/
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
		/**** md5 signature: 5efba1f9776f24ad69a107a235287f2c ****/
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
		/**** md5 signature: 5aabfa02d378ab470a30e84ee52a6c7d ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: 9f1c0c6229c95cd8346662c4ae052028 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function (3).

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 28ab91d0183585502101892aac2c5b98 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** ParameterOnC ******************/
		/**** md5 signature: 931c449549243312ddad1092e529a0b4 ****/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****************** Pnt2d ******************/
		/**** md5 signature: c0e2424281e3df0600c85feafc85476b ****/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2d;
		const gp_Pnt2d Pnt2d();

		/****************** PointOnC ******************/
		/**** md5 signature: 6b0ebe8887a8345ce46800bc01420baf ****/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC;
		const gp_Pnt PointOnC();

		/****************** PointOnS ******************/
		/**** md5 signature: d0ce1246a72267935632a60d95848390 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ****/
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
		/**** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: 99fe75aea7947575eb6b646d1797f9da ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: 8b5f8faeab6ac0129ce32e99e844f22e ****/
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
		/**** md5 signature: 0fe985b779a02d58ed5caae77019a3ea ****/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2d;
		const gp_Vec2d Tangent2d();

		/****************** TangentOnC ******************/
		/**** md5 signature: 9c5e999959c217a8456055e42ec88461 ****/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC;
		const gp_Vec TangentOnC();

		/****************** TangentOnS ******************/
		/**** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 6b8b56678cb2aa99e1d038c477c227ac ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: 9f1c0c6229c95cd8346662c4ae052028 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function (3).

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 931c449549243312ddad1092e529a0b4 ****/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****************** Pnt2d ******************/
		/**** md5 signature: c0e2424281e3df0600c85feafc85476b ****/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2d;
		const gp_Pnt2d Pnt2d();

		/****************** PointOnC ******************/
		/**** md5 signature: 6b0ebe8887a8345ce46800bc01420baf ****/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC;
		const gp_Pnt PointOnC();

		/****************** PointOnS ******************/
		/**** md5 signature: d0ce1246a72267935632a60d95848390 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ****/
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
		/**** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: 99fe75aea7947575eb6b646d1797f9da ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: 8b5f8faeab6ac0129ce32e99e844f22e ****/
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
		/**** md5 signature: 0fe985b779a02d58ed5caae77019a3ea ****/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2d;
		const gp_Vec2d Tangent2d();

		/****************** TangentOnC ******************/
		/**** md5 signature: 9c5e999959c217a8456055e42ec88461 ****/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC;
		const gp_Vec TangentOnC();

		/****************** TangentOnS ******************/
		/**** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: c5ccfbb8cb1ce21d9a61d191af697154 ****/
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
		/**** md5 signature: 204816d5dcb99a46213f8c407defdb50 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: 08613591ef85c2aabd1650c70190523f ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: cab230a655fc4e6bce41754b18837678 ****/
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
		/**** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: 3d2665ead473e36c7266c389a87d886a ****/
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
		/**** md5 signature: 13397954dafd053b9875c1007b2501b6 ****/
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
		/**** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: f57294e3963627cbeb43134bc6c1d88a ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** TwistOnS1 ******************/
		/**** md5 signature: bcab8c931932008ff46a37653f1cc038 ****/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		/**** md5 signature: 2e0e0e8d012a93b95309a3593de0d937 ****/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: a38e4ebbfc241372f20d992b33f24c6a ****/
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
		/**** md5 signature: 204816d5dcb99a46213f8c407defdb50 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 9a5329dd41f671f675afb78a1ac44701 ****/
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
		/**** md5 signature: 3d2665ead473e36c7266c389a87d886a ****/
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
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 3542520f3ad949bdbc206ab556cd95b2 ****/
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
		/**** md5 signature: 0c9178d91224ee5e9d339eb0f66536ab ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: 1ac8474fa2de24fef2821831782ec53a ****/
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
		/**** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ****/
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
		/**** md5 signature: cab230a655fc4e6bce41754b18837678 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: 99fe75aea7947575eb6b646d1797f9da ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: 13397954dafd053b9875c1007b2501b6 ****/
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
		/**** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: f57294e3963627cbeb43134bc6c1d88a ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** TwistOnS1 ******************/
		/**** md5 signature: bcab8c931932008ff46a37653f1cc038 ****/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		/**** md5 signature: 2e0e0e8d012a93b95309a3593de0d937 ****/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: ad697509e914e35d04fcf8d89739d319 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 9a5329dd41f671f675afb78a1ac44701 ****/
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
		/**** md5 signature: 941166ee1a941569b8be371b05e6b601 ****/
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
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: d14c0262460f5da83f485c78719fc7f5 ****/
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
		/**** md5 signature: 23a9f18e67908903d4dd5177d48fb2af ****/
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
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
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
		/**** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** NPlan ******************/
		/**** md5 signature: 1752f4f55cfe405bd67775b7f8e77006 ****/
		%feature("compactdefaultargs") NPlan;
		%feature("autodoc", "Returns the normal to cguide at ptgui.

Returns
-------
gp_Vec
") NPlan;
		const gp_Vec NPlan();

		/****************** PointOnGuide ******************/
		/**** md5 signature: e87472d23145a96f1fa3e3141ac7c2dd ****/
		%feature("compactdefaultargs") PointOnGuide;
		%feature("autodoc", "Returns the point of parameter <param> on cguide.

Returns
-------
gp_Pnt
") PointOnGuide;
		const gp_Pnt PointOnGuide();

		/****************** PointOnS ******************/
		/**** md5 signature: 7701a4dd49c389b38b1770bec82a60cd ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** SetDist ******************/
		/**** md5 signature: a0f41880e1eb0af062b3350ce3ca3532 ****/
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
		/**** md5 signature: afbb70d3463dbd3dc51af6c494b8ebef ****/
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
		/**** md5 signature: 277e1459ed99bd7331c01c470b757dad ****/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnS ******************/
		/**** md5 signature: 6a76df7a0ec21039226ae1d5b4797449 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
		/**** md5 signature: 9b176fc9db389ee1339e277c61d4781f ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: 1ac8474fa2de24fef2821831782ec53a ****/
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
		/**** md5 signature: 97c961ad7d056aef4f3b86eb96e2c45f ****/
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
		/**** md5 signature: cab230a655fc4e6bce41754b18837678 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: 13397954dafd053b9875c1007b2501b6 ****/
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
		/**** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: f57294e3963627cbeb43134bc6c1d88a ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** TwistOnS1 ******************/
		/**** md5 signature: bcab8c931932008ff46a37653f1cc038 ****/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		/**** md5 signature: 2e0e0e8d012a93b95309a3593de0d937 ****/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: d98cdf0b742b9880acbeacf9949b9776 ****/
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
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
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
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
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
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 8bb3e469c34889cbf25b4fc4beae02a1 ****/
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
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
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
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: c4b1deeee5b8345f398d1d63ec77fc1b ****/
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
		/**** md5 signature: ee1b691ca844b8dd605892e1ef6591ed ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: 08613591ef85c2aabd1650c70190523f ****/
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
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: ade0965988faf3dc4bb7b4c53f18e212 ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: ee1b691ca844b8dd605892e1ef6591ed ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 7b29e135c5ec01d315383baadb5d2e36 ****/
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
		/**** md5 signature: 0c9178d91224ee5e9d339eb0f66536ab ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: 5c7d510e1dc489ba8fc7ea0c2c8156a3 ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: 3b1a617ddcc473f31a5d805861a150b8 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: 13397954dafd053b9875c1007b2501b6 ****/
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
		/**** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: f57294e3963627cbeb43134bc6c1d88a ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 2578aab4b26b8b46f77abfb6d22abd70 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 9a5329dd41f671f675afb78a1ac44701 ****/
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
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: da51a6a7a08009ec08b575ec302d3494 ****/
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
		/**** md5 signature: 6aef026ef1fcb18a844e723ac935cd4b ****/
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
		/**** md5 signature: 1744e84f6795d21ff935088da038d2e5 ****/
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
		/**** md5 signature: fd791f445ff1b5b7d6ca99e04d3b9805 ****/
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
		/**** md5 signature: 3eb4d39deb7dc480e2249d52a42e392a ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: e496fd995a5894c8dcf67747e2a803cb ****/
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
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: 6c2bb6bd5601aa68b73824c3544b1c1d ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** PointOnS1 ******************/
		/**** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Set ******************/
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 78f9e2c80c7864a7b03452bb77fff0ef ****/
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
		/**** md5 signature: 13397954dafd053b9875c1007b2501b6 ****/
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
		/**** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: f57294e3963627cbeb43134bc6c1d88a ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: 535ab4761994307186594af27339246f ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** PointOnS1 ******************/
		/**** md5 signature: 31ba0cad339bf2eee3eaa6f297b2933d ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 92a9e4c03669ab0b0f57f90257aae861 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** Set ******************/
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 1bdd5799d0a739d4dad4e3ec0319d08f ****/
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
		/**** md5 signature: 13397954dafd053b9875c1007b2501b6 ****/
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
		/**** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: f57294e3963627cbeb43134bc6c1d88a ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: 63f70f99e6a8865b816983676f75b58f ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: ed48a688c0043088f72c032534118aef ****/
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
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: 7784734638904cb3fd3cff05a34f07ed ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: ed3fe23c28d6ac4c0a074084d164d41d ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: f57294e3963627cbeb43134bc6c1d88a ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: b20f2a50fc3bd003b5bb0d17d261f9e7 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 5ee1080b2d5e8e29046ca62a01e3f639 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS2;
		const gp_Vec TangentOnS2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: 2add6271da6f16e56e4b583f12a18aaa ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
