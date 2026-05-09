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
%define BLENDDOCSTRING
"Blend module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_blend.html"
%enddef
%module (package="OCC.Core", docstring=BLENDDOCSTRING) Blend


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
#include<Blend_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import TColStd.i
%import GeomAbs.i
%import gp.i
%import TColgp.i
%import Adaptor2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proxy classes for enums */
%pythoncode {

class Blend_DecrochStatus(IntEnum):
	Blend_NoDecroch = 0
	Blend_DecrochRst1 = 1
	Blend_DecrochRst2 = 2
	Blend_DecrochBoth = 3
Blend_NoDecroch = Blend_DecrochStatus.Blend_NoDecroch
Blend_DecrochRst1 = Blend_DecrochStatus.Blend_DecrochRst1
Blend_DecrochRst2 = Blend_DecrochStatus.Blend_DecrochRst2
Blend_DecrochBoth = Blend_DecrochStatus.Blend_DecrochBoth

class Blend_Status(IntEnum):
	Blend_StepTooLarge = 0
	Blend_StepTooSmall = 1
	Blend_Backward = 2
	Blend_SamePoints = 3
	Blend_OnRst1 = 4
	Blend_OnRst2 = 5
	Blend_OnRst12 = 6
	Blend_OK = 7
Blend_StepTooLarge = Blend_Status.Blend_StepTooLarge
Blend_StepTooSmall = Blend_Status.Blend_StepTooSmall
Blend_Backward = Blend_Status.Blend_Backward
Blend_SamePoints = Blend_Status.Blend_SamePoints
Blend_OnRst1 = Blend_Status.Blend_OnRst1
Blend_OnRst2 = Blend_Status.Blend_OnRst2
Blend_OnRst12 = Blend_Status.Blend_OnRst12
Blend_OK = Blend_Status.Blend_OK
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(Blend_SequenceOfPoint) NCollection_Sequence<Blend_Point>;

%extend NCollection_Sequence<Blend_Point> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<Blend_Point> Blend_SequenceOfPoint;
/* end typedefs declaration */

/**************************
* class Blend_AppFunction *
**************************/
%nodefaultctor Blend_AppFunction;
class Blend_AppFunction : public math_FunctionSetWithDerivatives {
	public:
		/****** Blend_AppFunction::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_AppFunction::GetBounds ******/
		/****** md5 signature: ea9a426b36925ee5ee90867e063c6523 ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 4 variables. Returns in the vector SupBound the greatest values allowed for each of the 4 variables.
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_AppFunction::GetMinimalDistance ******/
		/****** md5 signature: ebbb493dcbf57ec0472eacd6f9cf6508 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		virtual double GetMinimalDistance();

		/****** Blend_AppFunction::GetMinimalWeight ******/
		/****** md5 signature: 2852c0dedb46e7153a7b07d3027dc3a4 ******/
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
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** Blend_AppFunction::GetSectionSize ******/
		/****** md5 signature: 677872637e562926e77aba5e3ef9d7af ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		virtual double GetSectionSize();

		/****** Blend_AppFunction::GetShape ******/
		/****** md5 signature: ad8377cd4a846706fc5fa89a29c40bf6 ******/
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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Blend_AppFunction::GetTolerance ******/
		/****** md5 signature: bb7a4fe70830aa0469f77f495a0ca843 ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 4 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_AppFunction::GetTolerance ******/
		/****** md5 signature: d82ee7075d69e4837a3d0adf4866e45d ******/
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
		virtual void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** Blend_AppFunction::Intervals ******/
		/****** md5 signature: 3d6a840a7f0f4eea65b38aa9a495c6b6 ******/
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
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Blend_AppFunction::IsRational ******/
		/****** md5 signature: de83bb68c1e76368c633eba18c70426f ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		virtual bool IsRational();

		/****** Blend_AppFunction::IsSolution ******/
		/****** md5 signature: 6b52078cb4b1a6b2446ebbb8f3dd7d12 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		virtual bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_AppFunction::Knots ******/
		/****** md5 signature: 0f7f326dba0bc1baf3569898e40f95a4 ******/
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
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** Blend_AppFunction::Mults ******/
		/****** md5 signature: eb1dbd28dfc48fe87f4f41c82553fb2e ******/
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
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** Blend_AppFunction::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_AppFunction::NbIntervals ******/
		/****** md5 signature: 9ac7bc3c23f26b850f256bf654af74c8 ******/
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
		virtual int NbIntervals(const GeomAbs_Shape S);

		/****** Blend_AppFunction::NbVariables ******/
		/****** md5 signature: cf9943f4a9947ddd2191834b3e7214eb ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** Blend_AppFunction::Parameter ******/
		/****** md5 signature: 9541ff054f8d7cd43b226ff077c06f41 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point

Return
-------
double

Description
-----------
Returns the parameter of the point P. Used to impose the parameters in the approximation.
") Parameter;
		double Parameter(const Blend_Point & P);

		/****** Blend_AppFunction::Pnt1 ******/
		/****** md5 signature: bb9bfa59c92a2029f6434d5fcd5fa96c ******/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the first support.
") Pnt1;
		virtual const gp_Pnt Pnt1();

		/****** Blend_AppFunction::Pnt2 ******/
		/****** md5 signature: dfef6173347bf841f782a073bb54623f ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the first support.
") Pnt2;
		virtual const gp_Pnt Pnt2();

		/****** Blend_AppFunction::Resolution ******/
		/****** md5 signature: 991820137fe757cf6c5e4714dfd8c21f ******/
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
		virtual void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Blend_AppFunction::Section ******/
		/****** md5 signature: 3aa3487b15a000f7e022edae36452623 ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		virtual bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_AppFunction::Section ******/
		/****** md5 signature: 019ff1568220092b99f1dc68e113d0f7 ******/
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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** Blend_AppFunction::Section ******/
		/****** md5 signature: 8f9815b34cd5494fd4f1c84d17d3bdf4 ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		virtual bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** Blend_AppFunction::Set ******/
		/****** md5 signature: f4885d976c68569f125d2d988748d1ec ******/
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
		virtual void Set(const double Param);

		/****** Blend_AppFunction::Set ******/
		/****** md5 signature: 7f90545f297759a2a45a3a6dfa6da106 ******/
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
		virtual void Set(const double First, const double Last);

		/****** Blend_AppFunction::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_AppFunction::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_AppFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Blend_CurvPointFuncInv *
*******************************/
%nodefaultctor Blend_CurvPointFuncInv;
class Blend_CurvPointFuncInv : public math_FunctionSetWithDerivatives {
	public:
		/****** Blend_CurvPointFuncInv::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_CurvPointFuncInv::GetBounds ******/
		/****** md5 signature: ea9a426b36925ee5ee90867e063c6523 ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_CurvPointFuncInv::GetTolerance ******/
		/****** md5 signature: bb7a4fe70830aa0469f77f495a0ca843 ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_CurvPointFuncInv::IsSolution ******/
		/****** md5 signature: 6b52078cb4b1a6b2446ebbb8f3dd7d12 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_CurvPointFuncInv::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_CurvPointFuncInv::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		int NbVariables();

		/****** Blend_CurvPointFuncInv::Set ******/
		/****** md5 signature: 4a9881a4a80757c31b5543d94b3ea3d9 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Set the Point on which a solution has to be found.
") Set;
		virtual void Set(const gp_Pnt & P);

		/****** Blend_CurvPointFuncInv::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_CurvPointFuncInv::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_CurvPointFuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Blend_FuncInv *
**********************/
%nodefaultctor Blend_FuncInv;
class Blend_FuncInv : public math_FunctionSetWithDerivatives {
	public:
		/****** Blend_FuncInv::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_FuncInv::GetBounds ******/
		/****** md5 signature: ea9a426b36925ee5ee90867e063c6523 ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 4 variables. Returns in the vector SupBound the greatest values allowed for each of the 4 variables.
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_FuncInv::GetTolerance ******/
		/****** md5 signature: bb7a4fe70830aa0469f77f495a0ca843 ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 4 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_FuncInv::IsSolution ******/
		/****** md5 signature: 6b52078cb4b1a6b2446ebbb8f3dd7d12 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_FuncInv::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_FuncInv::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 4.
") NbVariables;
		int NbVariables();

		/****** Blend_FuncInv::Set ******/
		/****** md5 signature: c673c0bdeaa8b57226b29723ad16d04f ******/
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
Sets the CurveOnSurface on which a solution has to be found. If <OnFirst> is set to true, the curve will be on the first surface, otherwise the curve is on the second one.
") Set;
		virtual void Set(const bool OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** Blend_FuncInv::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_FuncInv::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_FuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Blend_Point *
********************/
class Blend_Point {
	public:
		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: a7dc6a3a5883092f5a0ad44324b7501d ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Blend_Point;
		 Blend_Point();

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: a2a8932556ea788802a112531def1333 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
Tg1: gp_Vec
Tg2: gp_Vec
Tg12d: gp_Vec2d
Tg22d: gp_Vec2d

Return
-------
None

Description
-----------
Creates a point on 2 surfaces, with tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 182cf5b274423a926b0a6882a1c8256e ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double

Return
-------
None

Description
-----------
Creates a point on 2 surfaces, without tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 17439492da0cf70641a105f79fc92b02 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: double
U: double
V: double
W: double
Tgs: gp_Vec
Tgc: gp_Vec
Tg2d: gp_Vec2d

Return
-------
None

Description
-----------
Creates a point on a surface and a curve, with tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pts, const gp_Pnt & Ptc, const double Param, const double U, const double V, const double W, const gp_Vec & Tgs, const gp_Vec & Tgc, const gp_Vec2d & Tg2d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 603f83587c7c341f6278c44a28d62ee6 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: double
U: double
V: double
W: double

Return
-------
None

Description
-----------
Creates a point on a surface and a curve, without tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pts, const gp_Pnt & Ptc, const double Param, const double U, const double V, const double W);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 5609c27c6956c0f77d60175e313b1970 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC: double
Tg1: gp_Vec
Tg2: gp_Vec
Tg12d: gp_Vec2d
Tg22d: gp_Vec2d

Return
-------
None

Description
-----------
Creates a point on a surface and a curve on surface, with tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: d411c904484a994c0d68ce345f4ce319 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC: double

Return
-------
None

Description
-----------
Creates a point on a surface and a curve on surface, without tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 7f27f47334280de2088b6008c519cd31 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC1: double
PC2: double
Tg1: gp_Vec
Tg2: gp_Vec
Tg12d: gp_Vec2d
Tg22d: gp_Vec2d

Return
-------
None

Description
-----------
Creates a point on two curves on surfaces, with tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC1, const double PC2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 71d164fb25cdbecf7af3c45b717be4a7 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC1: double
PC2: double

Return
-------
None

Description
-----------
Creates a point on two curves on surfaces, with tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC1, const double PC2);

		/****** Blend_Point::IsTangencyPoint ******/
		/****** md5 signature: 5fdbbb5c5371416b1705c6e1255262ea ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if it was not possible to compute the tangent vectors at PointOnS1 and/or PointOnS2.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** Blend_Point::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** Blend_Point::ParameterOnC ******/
		/****** md5 signature: 4989f330b1f7c47272b345f44d907380 ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnC;
		double ParameterOnC();

		/****** Blend_Point::ParameterOnC1 ******/
		/****** md5 signature: 4a0a357fcd64d44bbf37e0cbcfbf7416 ******/
		%feature("compactdefaultargs") ParameterOnC1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnC1;
		double ParameterOnC1();

		/****** Blend_Point::ParameterOnC2 ******/
		/****** md5 signature: d1124d93a9ce4c4873a13ece88c216f2 ******/
		%feature("compactdefaultargs") ParameterOnC2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnC2;
		double ParameterOnC2();

		/****** Blend_Point::ParametersOnS ******/
		/****** md5 signature: 2fab56daf9ddf5d837924c5f5fd02069 ******/
		%feature("compactdefaultargs") ParametersOnS;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") ParametersOnS;
		void ParametersOnS(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Blend_Point::ParametersOnS1 ******/
		/****** md5 signature: ca8b9f0009d4647404b8f801ce949117 ******/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Blend_Point::ParametersOnS2 ******/
		/****** md5 signature: 04661ec8b042d0e60596adcc3e08bd99 ******/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Blend_Point::PointOnC ******/
		/****** md5 signature: 86876235494ef8da7ca49324811ac0e0 ******/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnC;
		const gp_Pnt PointOnC();

		/****** Blend_Point::PointOnC1 ******/
		/****** md5 signature: c2e08b2848fd3090c35b3eade37ef0ff ******/
		%feature("compactdefaultargs") PointOnC1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnC1;
		const gp_Pnt PointOnC1();

		/****** Blend_Point::PointOnC2 ******/
		/****** md5 signature: 1a44b9d6f084b6ebd1d95746e937f2c5 ******/
		%feature("compactdefaultargs") PointOnC2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnC2;
		const gp_Pnt PointOnC2();

		/****** Blend_Point::PointOnS ******/
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

		/****** Blend_Point::PointOnS1 ******/
		/****** md5 signature: d0887da6b7c195fe6f26541a1fe42cb2 ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****** Blend_Point::PointOnS2 ******/
		/****** md5 signature: 75828b1eec68cc5ffaaaa49216ae261a ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****** Blend_Point::SetParameter ******/
		/****** md5 signature: 0f95a348489d7d61925025ebfc2018ad ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
Changes parameter on existing point.
") SetParameter;
		void SetParameter(const double Param);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: cee22492e9ea35179c62a6aa8bf74661 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
Tg1: gp_Vec
Tg2: gp_Vec
Tg12d: gp_Vec2d
Tg22d: gp_Vec2d

Return
-------
None

Description
-----------
Set the values for a point on 2 surfaces, with tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 8b6c3bf424e66d4cf554c7f5f16e131a ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double

Return
-------
None

Description
-----------
Set the values for a point on 2 surfaces, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 92754e9ae810d8dd1eaa13eaafb7f1ec ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: double
U: double
V: double
W: double
Tgs: gp_Vec
Tgc: gp_Vec
Tg2d: gp_Vec2d

Return
-------
None

Description
-----------
Set the values for a point on a surface and a curve, with tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pts, const gp_Pnt & Ptc, const double Param, const double U, const double V, const double W, const gp_Vec & Tgs, const gp_Vec & Tgc, const gp_Vec2d & Tg2d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 1254fc30ef321213af1988362509cd74 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: double
U: double
V: double
W: double

Return
-------
None

Description
-----------
Set the values for a point on a surface and a curve, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pts, const gp_Pnt & Ptc, const double Param, const double U, const double V, const double W);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: d0e8bb76d620eac55ce8b1a02fb99439 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC: double
Tg1: gp_Vec
Tg2: gp_Vec
Tg12d: gp_Vec2d
Tg22d: gp_Vec2d

Return
-------
None

Description
-----------
Creates a point on a surface and a curve on surface, with tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: ed88f153fc99d243b220f056f06028e2 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC: double

Return
-------
None

Description
-----------
Creates a point on a surface and a curve on surface, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 703016c7b49da9b8774e477804452f21 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC1: double
PC2: double
Tg1: gp_Vec
Tg2: gp_Vec
Tg12d: gp_Vec2d
Tg22d: gp_Vec2d

Return
-------
None

Description
-----------
Creates a point on two curves on surfaces, with tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC1, const double PC2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: b7f5b95c24f493493c04fd2ec412dc98 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
U1: double
V1: double
U2: double
V2: double
PC1: double
PC2: double

Return
-------
None

Description
-----------
Creates a point on two curves on surfaces, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double U1, const double V1, const double U2, const double V2, const double PC1, const double PC2);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 08cbd0ea6ebf0b67d872a521af2707e1 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: double
PC1: double
PC2: double

Return
-------
None

Description
-----------
Creates a point on two curves.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const double Param, const double PC1, const double PC2);

		/****** Blend_Point::Tangent2d ******/
		/****** md5 signature: 45c4e6751bb86fa909ea384a33007ff3 ******/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2d;
		gp_Vec2d Tangent2d();

		/****** Blend_Point::Tangent2dOnS1 ******/
		/****** md5 signature: 1272a269793969dd1430e2756ce7faa2 ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS1;
		gp_Vec2d Tangent2dOnS1();

		/****** Blend_Point::Tangent2dOnS2 ******/
		/****** md5 signature: 4dfd24a1437d0c42574ef4b6ea11a58e ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS2;
		gp_Vec2d Tangent2dOnS2();

		/****** Blend_Point::TangentOnC ******/
		/****** md5 signature: b61d65d6519e567760e4657923cd2fc7 ******/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnC;
		const gp_Vec TangentOnC();

		/****** Blend_Point::TangentOnC1 ******/
		/****** md5 signature: f6d4e0b928aa813efbc0e69a661fbd6b ******/
		%feature("compactdefaultargs") TangentOnC1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnC1;
		const gp_Vec TangentOnC1();

		/****** Blend_Point::TangentOnC2 ******/
		/****** md5 signature: 1a02192f5a7755535661f3b54d08dad0 ******/
		%feature("compactdefaultargs") TangentOnC2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnC2;
		const gp_Vec TangentOnC2();

		/****** Blend_Point::TangentOnS ******/
		/****** md5 signature: 6a76df7a0ec21039226ae1d5b4797449 ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****** Blend_Point::TangentOnS1 ******/
		/****** md5 signature: 5f25bebb313d4cf43ba40f8884ebd1d5 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****** Blend_Point::TangentOnS2 ******/
		/****** md5 signature: 669f5d85c695d94605c7169a969c3d0f ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS2;
		const gp_Vec TangentOnS2();

};


%extend Blend_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Blend_SurfCurvFuncInv *
******************************/
%nodefaultctor Blend_SurfCurvFuncInv;
class Blend_SurfCurvFuncInv : public math_FunctionSetWithDerivatives {
	public:
		/****** Blend_SurfCurvFuncInv::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_SurfCurvFuncInv::GetBounds ******/
		/****** md5 signature: ea9a426b36925ee5ee90867e063c6523 ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_SurfCurvFuncInv::GetTolerance ******/
		/****** md5 signature: bb7a4fe70830aa0469f77f495a0ca843 ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_SurfCurvFuncInv::IsSolution ******/
		/****** md5 signature: 6b52078cb4b1a6b2446ebbb8f3dd7d12 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_SurfCurvFuncInv::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_SurfCurvFuncInv::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		int NbVariables();

		/****** Blend_SurfCurvFuncInv::Set ******/
		/****** md5 signature: 0289f8e5f7cd6af48b5eae57db73f4e7 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Rst: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Set the Point on which a solution has to be found.
") Set;
		virtual void Set(const opencascade::handle<Adaptor2d_Curve2d> & Rst);

		/****** Blend_SurfCurvFuncInv::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_SurfCurvFuncInv::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_SurfCurvFuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Blend_SurfPointFuncInv *
*******************************/
%nodefaultctor Blend_SurfPointFuncInv;
class Blend_SurfPointFuncInv : public math_FunctionSetWithDerivatives {
	public:
		/****** Blend_SurfPointFuncInv::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_SurfPointFuncInv::GetBounds ******/
		/****** md5 signature: ea9a426b36925ee5ee90867e063c6523 ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_SurfPointFuncInv::GetTolerance ******/
		/****** md5 signature: bb7a4fe70830aa0469f77f495a0ca843 ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_SurfPointFuncInv::IsSolution ******/
		/****** md5 signature: 6b52078cb4b1a6b2446ebbb8f3dd7d12 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_SurfPointFuncInv::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_SurfPointFuncInv::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		int NbVariables();

		/****** Blend_SurfPointFuncInv::Set ******/
		/****** md5 signature: 4a9881a4a80757c31b5543d94b3ea3d9 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Set the Point on which a solution has to be found.
") Set;
		virtual void Set(const gp_Pnt & P);

		/****** Blend_SurfPointFuncInv::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_SurfPointFuncInv::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_SurfPointFuncInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Blend_CSFunction *
*************************/
%nodefaultctor Blend_CSFunction;
class Blend_CSFunction : public Blend_AppFunction {
	public:
		/****** Blend_CSFunction::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_CSFunction::GetBounds ******/
		/****** md5 signature: efa381282ad6f2a03984ca5e8eaebe32 ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_CSFunction::GetMinimalDistance ******/
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

		/****** Blend_CSFunction::GetShape ******/
		/****** md5 signature: e3e726431f6edda039f9ba7cac20835c ******/
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

		/****** Blend_CSFunction::GetTolerance ******/
		/****** md5 signature: 8e8e1f4c677d5e412299c97f9f3244a6 ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_CSFunction::GetTolerance ******/
		/****** md5 signature: dcd551889c1e21971985dd9656d20a84 ******/
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

		/****** Blend_CSFunction::IsSolution ******/
		/****** md5 signature: e35fc7aa0a7aaf8fe2c6800fcec49ef9 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_CSFunction::IsTangencyPoint ******/
		/****** md5 signature: a3f4b511f783cb34d7586dc64b296ff0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnC.
") IsTangencyPoint;
		virtual bool IsTangencyPoint();

		/****** Blend_CSFunction::Knots ******/
		/****** md5 signature: f17e19fea275664a4a28caa540efa5a4 ******/
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

		/****** Blend_CSFunction::Mults ******/
		/****** md5 signature: 306398f4528952fd49cccd292a2184eb ******/
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

		/****** Blend_CSFunction::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_CSFunction::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3 (default value). Can be redefined.
") NbVariables;
		int NbVariables();

		/****** Blend_CSFunction::ParameterOnC ******/
		/****** md5 signature: 3259d9c8afe9f9723261055d0efd26af ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnC;
		virtual double ParameterOnC();

		/****** Blend_CSFunction::Pnt1 ******/
		/****** md5 signature: 99a0bed330efeb8a87df29a93e04987b ******/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the first support.
") Pnt1;
		const gp_Pnt Pnt1();

		/****** Blend_CSFunction::Pnt2 ******/
		/****** md5 signature: 4a99fe30597b1c5d93e90e4dae49e4a3 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the second support.
") Pnt2;
		const gp_Pnt Pnt2();

		/****** Blend_CSFunction::Pnt2d ******/
		/****** md5 signature: 98c5a7fd07fdcda4e5dba3da570105de ******/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2d;
		virtual const gp_Pnt2d Pnt2d();

		/****** Blend_CSFunction::PointOnC ******/
		/****** md5 signature: 72d1e1aab7382a71b140bd978aafe6e6 ******/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the curve.
") PointOnC;
		virtual const gp_Pnt PointOnC();

		/****** Blend_CSFunction::PointOnS ******/
		/****** md5 signature: 013821b07617cbc53368c5db469ac944 ******/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the surface.
") PointOnS;
		virtual const gp_Pnt PointOnS();

		/****** Blend_CSFunction::Section ******/
		/****** md5 signature: 33a8cfb42ac6452bd188d4c4353d85df ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_CSFunction::Section ******/
		/****** md5 signature: 68184ba9a64f26e039ad419187119f1f ******/
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

		/****** Blend_CSFunction::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** Blend_CSFunction::Set ******/
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

		/****** Blend_CSFunction::Set ******/
		/****** md5 signature: 59afb5da34d9148051e78787413c1775 ******/
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

		/****** Blend_CSFunction::Tangent ******/
		/****** md5 signature: 34171601202ad21ea9d1ddf367a5bec7 ******/
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
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		virtual void Tangent(const double U, const double V, gp_Vec & TgS, gp_Vec & NormS);

		/****** Blend_CSFunction::Tangent2d ******/
		/****** md5 signature: c48013a45ce6ec3d80c1c72ade10ff86 ******/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnS, in the parametric space of the first surface.
") Tangent2d;
		virtual const gp_Vec2d Tangent2d();

		/****** Blend_CSFunction::TangentOnC ******/
		/****** md5 signature: 58e664a9ca5473e0441364716f57cf5c ******/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnC, in 3d space.
") TangentOnC;
		virtual const gp_Vec TangentOnC();

		/****** Blend_CSFunction::TangentOnS ******/
		/****** md5 signature: bbacad8d903559279b1b81084b808831 ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnS, in 3d space.
") TangentOnS;
		virtual const gp_Vec TangentOnS();

		/****** Blend_CSFunction::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_CSFunction::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_CSFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Blend_Function *
***********************/
%nodefaultctor Blend_Function;
class Blend_Function : public Blend_AppFunction {
	public:
		/****** Blend_Function::IsTangencyPoint ******/
		/****** md5 signature: a3f4b511f783cb34d7586dc64b296ff0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS1 and/or PointOnS2.
") IsTangencyPoint;
		virtual bool IsTangencyPoint();

		/****** Blend_Function::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 4.
") NbVariables;
		int NbVariables();

		/****** Blend_Function::Pnt1 ******/
		/****** md5 signature: 99a0bed330efeb8a87df29a93e04987b ******/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the first support.
") Pnt1;
		const gp_Pnt Pnt1();

		/****** Blend_Function::Pnt2 ******/
		/****** md5 signature: 4a99fe30597b1c5d93e90e4dae49e4a3 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the second support.
") Pnt2;
		const gp_Pnt Pnt2();

		/****** Blend_Function::PointOnS1 ******/
		/****** md5 signature: e58403c65e5edf32a9edbcf0e168fab8 ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the first surface, at parameter Sol(1),Sol(2) (Sol is the vector used in the call of IsSolution.
") PointOnS1;
		virtual const gp_Pnt PointOnS1();

		/****** Blend_Function::PointOnS2 ******/
		/****** md5 signature: 90f3bce294e1c981e6cda4d330349d11 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the second surface, at parameter Sol(3),Sol(4) (Sol is the vector used in the call of IsSolution.
") PointOnS2;
		virtual const gp_Pnt PointOnS2();

		/****** Blend_Function::Section ******/
		/****** md5 signature: 68184ba9a64f26e039ad419187119f1f ******/
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

		/****** Blend_Function::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** Blend_Function::Tangent ******/
		/****** md5 signature: ae0c504384ab0b1d43a7e7a570644acb ******/
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
		virtual void Tangent(const double U1, const double V1, const double U2, const double V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****** Blend_Function::Tangent2dOnS1 ******/
		/****** md5 signature: 2a59119466b3a4cdf5aa70fac0d4673e ******/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnS1, in the parametric space of the first surface.
") Tangent2dOnS1;
		virtual const gp_Vec2d Tangent2dOnS1();

		/****** Blend_Function::Tangent2dOnS2 ******/
		/****** md5 signature: 7cba5607584f29ebc7287a1682ba057b ******/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnS2, in the parametric space of the second surface.
") Tangent2dOnS2;
		virtual const gp_Vec2d Tangent2dOnS2();

		/****** Blend_Function::TangentOnS1 ******/
		/****** md5 signature: ace4d9e311e56c4a9713d23ae479ef04 ******/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnS1, in 3d space.
") TangentOnS1;
		virtual const gp_Vec TangentOnS1();

		/****** Blend_Function::TangentOnS2 ******/
		/****** md5 signature: 42dd8da874c679c750083aa2087aaab2 ******/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnS2, in 3d space.
") TangentOnS2;
		virtual const gp_Vec TangentOnS2();

		/****** Blend_Function::TwistOnS1 ******/
		/****** md5 signature: 3c3a776a7264b0b2f6a81507bd512eea ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		virtual bool TwistOnS1();

		/****** Blend_Function::TwistOnS2 ******/
		/****** md5 signature: ad503a59b0be91845d1c2dd6dbb473db ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		virtual bool TwistOnS2();

};


%extend Blend_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Blend_RstRstFunction *
*****************************/
%nodefaultctor Blend_RstRstFunction;
class Blend_RstRstFunction : public Blend_AppFunction {
	public:
		/****** Blend_RstRstFunction::Decroch ******/
		/****** md5 signature: da370598160a8d3edc9c9ec6cd6bbc5c ******/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
NRst1: gp_Vec
TgRst1: gp_Vec
NRst2: gp_Vec
TgRst2: gp_Vec

Return
-------
Blend_DecrochStatus

Description
-----------
Enables to implement a criterion of decrochage specific to the function. Warning: Can be called without previous call of IsSolution but the values calculated can be senseless.
") Decroch;
		virtual Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

		/****** Blend_RstRstFunction::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_RstRstFunction::GetBounds ******/
		/****** md5 signature: efa381282ad6f2a03984ca5e8eaebe32 ******/
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
Returns in the vector InfBound the lowest values allowed for each variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_RstRstFunction::GetMinimalDistance ******/
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

		/****** Blend_RstRstFunction::GetMinimalWeight ******/
		/****** md5 signature: 39c6e952c6478ebdd296a981c891d52e ******/
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

		/****** Blend_RstRstFunction::GetSectionSize ******/
		/****** md5 signature: 4fbcde8dfa1bd06d0897759d3157a8df ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** Blend_RstRstFunction::GetShape ******/
		/****** md5 signature: e3e726431f6edda039f9ba7cac20835c ******/
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

		/****** Blend_RstRstFunction::GetTolerance ******/
		/****** md5 signature: 8e8e1f4c677d5e412299c97f9f3244a6 ******/
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
Returns in the vector Tolerance the parametric tolerance for each variable; Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_RstRstFunction::GetTolerance ******/
		/****** md5 signature: dcd551889c1e21971985dd9656d20a84 ******/
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

		/****** Blend_RstRstFunction::Intervals ******/
		/****** md5 signature: 668f0e675229aba7bea4b3f34d7e7f08 ******/
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

		/****** Blend_RstRstFunction::IsRational ******/
		/****** md5 signature: aef9d2c35d1d8c217c75bd444cd4549d ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** Blend_RstRstFunction::IsSolution ******/
		/****** md5 signature: e35fc7aa0a7aaf8fe2c6800fcec49ef9 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_RstRstFunction::IsTangencyPoint ******/
		/****** md5 signature: a3f4b511f783cb34d7586dc64b296ff0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnRst.
") IsTangencyPoint;
		virtual bool IsTangencyPoint();

		/****** Blend_RstRstFunction::Knots ******/
		/****** md5 signature: f17e19fea275664a4a28caa540efa5a4 ******/
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

		/****** Blend_RstRstFunction::Mults ******/
		/****** md5 signature: 306398f4528952fd49cccd292a2184eb ******/
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

		/****** Blend_RstRstFunction::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_RstRstFunction::NbIntervals ******/
		/****** md5 signature: b50e67e454b5da55c56d17b1921878aa ******/
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

		/****** Blend_RstRstFunction::NbVariables ******/
		/****** md5 signature: cf9943f4a9947ddd2191834b3e7214eb ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2 (default value). Can be redefined.
") NbVariables;
		int NbVariables();

		/****** Blend_RstRstFunction::ParameterOnRst1 ******/
		/****** md5 signature: 5c52d82fb9bf114a1a48a2e50e4ea244 ******/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst1;
		virtual double ParameterOnRst1();

		/****** Blend_RstRstFunction::ParameterOnRst2 ******/
		/****** md5 signature: 642838d6b82e7ed4cbe8dfaf3ba11761 ******/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst2;
		virtual double ParameterOnRst2();

		/****** Blend_RstRstFunction::Pnt1 ******/
		/****** md5 signature: 99a0bed330efeb8a87df29a93e04987b ******/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the first support.
") Pnt1;
		const gp_Pnt Pnt1();

		/****** Blend_RstRstFunction::Pnt2 ******/
		/****** md5 signature: 4a99fe30597b1c5d93e90e4dae49e4a3 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the second support.
") Pnt2;
		const gp_Pnt Pnt2();

		/****** Blend_RstRstFunction::Pnt2dOnRst1 ******/
		/****** md5 signature: e3f75dcfdb45ec34883bee818cbdd115 ******/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2dOnRst1;
		virtual const gp_Pnt2d Pnt2dOnRst1();

		/****** Blend_RstRstFunction::Pnt2dOnRst2 ******/
		/****** md5 signature: 26bff8e780bdddbf622a247cc3db85be ******/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the curve on surface.
") Pnt2dOnRst2;
		virtual const gp_Pnt2d Pnt2dOnRst2();

		/****** Blend_RstRstFunction::PointOnRst1 ******/
		/****** md5 signature: d1ad11354f30bfbe23a20a972f215958 ******/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the surface.
") PointOnRst1;
		virtual const gp_Pnt PointOnRst1();

		/****** Blend_RstRstFunction::PointOnRst2 ******/
		/****** md5 signature: bfbfaf7046c1d39ce1f0f458886fcd59 ******/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the curve.
") PointOnRst2;
		virtual const gp_Pnt PointOnRst2();

		/****** Blend_RstRstFunction::Section ******/
		/****** md5 signature: 68184ba9a64f26e039ad419187119f1f ******/
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

		/****** Blend_RstRstFunction::Section ******/
		/****** md5 signature: 33a8cfb42ac6452bd188d4c4353d85df ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_RstRstFunction::Section ******/
		/****** md5 signature: 6a29a7594409b40a1332b0e973c783e0 ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** Blend_RstRstFunction::Set ******/
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

		/****** Blend_RstRstFunction::Set ******/
		/****** md5 signature: 59afb5da34d9148051e78787413c1775 ******/
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

		/****** Blend_RstRstFunction::Tangent2dOnRst1 ******/
		/****** md5 signature: fcbf5456f50de851d444c4d79888de5d ******/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnS, in the parametric space of the first surface.
") Tangent2dOnRst1;
		virtual const gp_Vec2d Tangent2dOnRst1();

		/****** Blend_RstRstFunction::Tangent2dOnRst2 ******/
		/****** md5 signature: 48d9d4a9667de60f2ac5b84d62425cff ******/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnRst, in the parametric space of the second surface.
") Tangent2dOnRst2;
		virtual const gp_Vec2d Tangent2dOnRst2();

		/****** Blend_RstRstFunction::TangentOnRst1 ******/
		/****** md5 signature: 674e1a1cb641654717601d87e8a6a7af ******/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnS, in 3d space.
") TangentOnRst1;
		virtual const gp_Vec TangentOnRst1();

		/****** Blend_RstRstFunction::TangentOnRst2 ******/
		/****** md5 signature: 76af1c3787229190aa13d77740ee1d23 ******/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnC, in 3d space.
") TangentOnRst2;
		virtual const gp_Vec TangentOnRst2();

		/****** Blend_RstRstFunction::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_RstRstFunction::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_RstRstFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Blend_SurfRstFunction *
******************************/
%nodefaultctor Blend_SurfRstFunction;
class Blend_SurfRstFunction : public Blend_AppFunction {
	public:
		/****** Blend_SurfRstFunction::Decroch ******/
		/****** md5 signature: 82c9bf096fdd161e7a5b1221910eef0e ******/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
NS: gp_Vec
TgS: gp_Vec

Return
-------
bool

Description
-----------
Enables implementation of a criterion of decrochage specific to the function.
") Decroch;
		virtual bool Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

		/****** Blend_SurfRstFunction::Derivatives ******/
		/****** md5 signature: 13ff4ee446984bce7637ee2d89b557ea ******/
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

		/****** Blend_SurfRstFunction::GetBounds ******/
		/****** md5 signature: efa381282ad6f2a03984ca5e8eaebe32 ******/
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
Returns in the vector InfBound the lowest values allowed for each variable. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_SurfRstFunction::GetMinimalDistance ******/
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

		/****** Blend_SurfRstFunction::GetMinimalWeight ******/
		/****** md5 signature: 39c6e952c6478ebdd296a981c891d52e ******/
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

		/****** Blend_SurfRstFunction::GetSectionSize ******/
		/****** md5 signature: 4fbcde8dfa1bd06d0897759d3157a8df ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** Blend_SurfRstFunction::GetShape ******/
		/****** md5 signature: e3e726431f6edda039f9ba7cac20835c ******/
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

		/****** Blend_SurfRstFunction::GetTolerance ******/
		/****** md5 signature: 8e8e1f4c677d5e412299c97f9f3244a6 ******/
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
Returns in the vector Tolerance the parametric tolerance for each variable. Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** Blend_SurfRstFunction::GetTolerance ******/
		/****** md5 signature: dcd551889c1e21971985dd9656d20a84 ******/
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

		/****** Blend_SurfRstFunction::Intervals ******/
		/****** md5 signature: 668f0e675229aba7bea4b3f34d7e7f08 ******/
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

		/****** Blend_SurfRstFunction::IsRational ******/
		/****** md5 signature: aef9d2c35d1d8c217c75bd444cd4549d ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** Blend_SurfRstFunction::IsSolution ******/
		/****** md5 signature: e35fc7aa0a7aaf8fe2c6800fcec49ef9 ******/
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
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** Blend_SurfRstFunction::IsTangencyPoint ******/
		/****** md5 signature: a3f4b511f783cb34d7586dc64b296ff0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnRst.
") IsTangencyPoint;
		virtual bool IsTangencyPoint();

		/****** Blend_SurfRstFunction::Knots ******/
		/****** md5 signature: f17e19fea275664a4a28caa540efa5a4 ******/
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

		/****** Blend_SurfRstFunction::Mults ******/
		/****** md5 signature: 306398f4528952fd49cccd292a2184eb ******/
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

		/****** Blend_SurfRstFunction::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Blend_SurfRstFunction::NbIntervals ******/
		/****** md5 signature: b50e67e454b5da55c56d17b1921878aa ******/
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

		/****** Blend_SurfRstFunction::NbVariables ******/
		/****** md5 signature: cf9943f4a9947ddd2191834b3e7214eb ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3 (default value). Can be redefined.
") NbVariables;
		int NbVariables();

		/****** Blend_SurfRstFunction::ParameterOnRst ******/
		/****** md5 signature: a8f1caab1f4e59b6822f3ac6512324a4 ******/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst;
		virtual double ParameterOnRst();

		/****** Blend_SurfRstFunction::Pnt1 ******/
		/****** md5 signature: 99a0bed330efeb8a87df29a93e04987b ******/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the first support.
") Pnt1;
		const gp_Pnt Pnt1();

		/****** Blend_SurfRstFunction::Pnt2 ******/
		/****** md5 signature: 4a99fe30597b1c5d93e90e4dae49e4a3 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the second support.
") Pnt2;
		const gp_Pnt Pnt2();

		/****** Blend_SurfRstFunction::Pnt2dOnRst ******/
		/****** md5 signature: ebf44037fb3bdbcaa4184774d2037618 ******/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the curve on surface.
") Pnt2dOnRst;
		virtual const gp_Pnt2d Pnt2dOnRst();

		/****** Blend_SurfRstFunction::Pnt2dOnS ******/
		/****** md5 signature: d615c6281ea9f9161996abd4b9a9fb73 ******/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2dOnS;
		virtual const gp_Pnt2d Pnt2dOnS();

		/****** Blend_SurfRstFunction::PointOnRst ******/
		/****** md5 signature: 9656ef3947b8f1b09af430ee1d1f4d1d ******/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the curve.
") PointOnRst;
		virtual const gp_Pnt PointOnRst();

		/****** Blend_SurfRstFunction::PointOnS ******/
		/****** md5 signature: 013821b07617cbc53368c5db469ac944 ******/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the surface.
") PointOnS;
		virtual const gp_Pnt PointOnS();

		/****** Blend_SurfRstFunction::Section ******/
		/****** md5 signature: 33a8cfb42ac6452bd188d4c4353d85df ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_SurfRstFunction::Section ******/
		/****** md5 signature: 6a29a7594409b40a1332b0e973c783e0 ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** Blend_SurfRstFunction::Section ******/
		/****** md5 signature: 68184ba9a64f26e039ad419187119f1f ******/
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

		/****** Blend_SurfRstFunction::Set ******/
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

		/****** Blend_SurfRstFunction::Set ******/
		/****** md5 signature: 59afb5da34d9148051e78787413c1775 ******/
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

		/****** Blend_SurfRstFunction::Tangent2dOnRst ******/
		/****** md5 signature: e1bcaec74b4767508501bf2f7c1cdb3d ******/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnRst, in the parametric space of the second surface.
") Tangent2dOnRst;
		virtual const gp_Vec2d Tangent2dOnRst();

		/****** Blend_SurfRstFunction::Tangent2dOnS ******/
		/****** md5 signature: 7f46fc020c51a66db9c76684922235f0 ******/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent vector at PointOnS, in the parametric space of the first surface.
") Tangent2dOnS;
		virtual const gp_Vec2d Tangent2dOnS();

		/****** Blend_SurfRstFunction::TangentOnRst ******/
		/****** md5 signature: 2df1ce073324d55483e131fc0c914949 ******/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnC, in 3d space.
") TangentOnRst;
		virtual const gp_Vec TangentOnRst();

		/****** Blend_SurfRstFunction::TangentOnS ******/
		/****** md5 signature: bbacad8d903559279b1b81084b808831 ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent vector at PointOnS, in 3d space.
") TangentOnS;
		virtual const gp_Vec TangentOnS();

		/****** Blend_SurfRstFunction::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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

		/****** Blend_SurfRstFunction::Values ******/
		/****** md5 signature: 92f98f222882d2faca79589cc6decec1 ******/
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


%extend Blend_SurfRstFunction {
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
