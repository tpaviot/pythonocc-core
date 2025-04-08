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
%define BLENDDOCSTRING
"Blend module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_blend.html"
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
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

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
		/****** md5 signature: cf2ae1edac6b9f39bab29773592817f0 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****** Blend_AppFunction::GetMinimalWeight ******/
		/****** md5 signature: 12015ca7787e9fa6bcf5f820d6632375 ******/
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
		/****** md5 signature: f308791ef8ed681d6654100e81e995bd ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

		/****** Blend_AppFunction::GetShape ******/
		/****** md5 signature: 4c9523caad94a60010e14bbca0ff20fc ******/
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
		/****** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 4 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_AppFunction::GetTolerance ******/
		/****** md5 signature: 715ff82186a1d1cd1f2816a9fc072567 ******/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** Blend_AppFunction::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
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
		/****** md5 signature: e2d546fe827c13e22032dacc2ce90819 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** Blend_AppFunction::IsSolution ******/
		/****** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_AppFunction::Knots ******/
		/****** md5 signature: 12a741eefe4a6b12fefe540137e600a7 ******/
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
		/****** md5 signature: eca3dd33252e6a889c9236a94758c0f8 ******/
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
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_AppFunction::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
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
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Blend_AppFunction::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Blend_AppFunction::Parameter ******/
		/****** md5 signature: e076698f3af75bcd0d5e9b5ebefa203d ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point

Return
-------
float

Description
-----------
Returns the parameter of the point P. Used to impose the parameters in the approximation.
") Parameter;
		Standard_Real Parameter(const Blend_Point & P);

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
		/****** md5 signature: 9817e96f28a752e33f073053bde0ba81 ******/
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
		virtual void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Blend_AppFunction::Section ******/
		/****** md5 signature: e37bbcbd1ce3013637ce65f73847d93d ******/
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
Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_AppFunction::Section ******/
		/****** md5 signature: a53c7695ddb71364b3f1a57ab3437f2c ******/
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
		/****** md5 signature: 45cb2fd4a3176732a1653dca67ba6422 ******/
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

		/****** Blend_AppFunction::Set ******/
		/****** md5 signature: 6ea1b4b1c732128de882a7f7a3bdd939 ******/
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
		virtual void Set(const Standard_Real Param);

		/****** Blend_AppFunction::Set ******/
		/****** md5 signature: 72dca3214392c1598e10f82965feedf7 ******/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

		/****** Blend_AppFunction::Value ******/
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_AppFunction::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

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
		/****** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_CurvPointFuncInv::IsSolution ******/
		/****** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_CurvPointFuncInv::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_CurvPointFuncInv::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		Standard_Integer NbVariables();

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
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_CurvPointFuncInv::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

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
		/****** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 4 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_FuncInv::IsSolution ******/
		/****** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_FuncInv::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_FuncInv::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 4.
") NbVariables;
		Standard_Integer NbVariables();

		/****** Blend_FuncInv::Set ******/
		/****** md5 signature: 3e783af1d10cfe5251f5d68b2e1a28b8 ******/
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
Sets the CurveOnSurface on which a solution has to be found. If <OnFirst> is set to Standard_True, the curve will be on the first surface, otherwise the curve is on the second one.
") Set;
		virtual void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & COnSurf);

		/****** Blend_FuncInv::Value ******/
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_FuncInv::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: bfd92b440e1bbdd329053c69a4608140 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
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
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 0fb76c701b6a53b225023640137583ef ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float

Return
-------
None

Description
-----------
Creates a point on 2 surfaces, without tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 7601a289d490e51aebd651c222437121 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: float
U: float
V: float
W: float
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
		 Blend_Point(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, const gp_Vec & Tgs, const gp_Vec & Tgc, const gp_Vec2d & Tg2d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 03f8ef157b71345a764df7379c28b348 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: float
U: float
V: float
W: float

Return
-------
None

Description
-----------
Creates a point on a surface and a curve, without tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: aeb9c99a45a2b2f0e7c0a322d8eb1ec8 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC: float
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
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 3ae3cb9415d4ffaa99cf099b121c1a74 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC: float

Return
-------
None

Description
-----------
Creates a point on a surface and a curve on surface, without tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 412dcf133da7d04dc340c64f4a96b385 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC1: float
PC2: float
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
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::Blend_Point ******/
		/****** md5 signature: 681c03baf2a5e55e7f0e7ea3fad4a3a7 ******/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC1: float
PC2: float

Return
-------
None

Description
-----------
Creates a point on two curves on surfaces, with tangents.
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2);

		/****** Blend_Point::IsTangencyPoint ******/
		/****** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if it was not possible to compute the tangent vectors at PointOnS1 and/or PointOnS2.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** Blend_Point::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****** Blend_Point::ParameterOnC ******/
		/****** md5 signature: ec9af703468ce0fd8ed5aa736ef095ff ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****** Blend_Point::ParameterOnC1 ******/
		/****** md5 signature: 9841a291b54b176d5fffb2beae83c142 ******/
		%feature("compactdefaultargs") ParameterOnC1;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnC1;
		Standard_Real ParameterOnC1();

		/****** Blend_Point::ParameterOnC2 ******/
		/****** md5 signature: 3edd96ad6a6089fd8c0830a29f8b8dec ******/
		%feature("compactdefaultargs") ParameterOnC2;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnC2;
		Standard_Real ParameterOnC2();

		/****** Blend_Point::ParametersOnS ******/
		/****** md5 signature: b7e9d5b50df021c8af5af493baffd0b4 ******/
		%feature("compactdefaultargs") ParametersOnS;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") ParametersOnS;
		void ParametersOnS(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Blend_Point::ParametersOnS1 ******/
		/****** md5 signature: 65a097ef44a5cf9a58ab746f2da6c181 ******/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Blend_Point::ParametersOnS2 ******/
		/****** md5 signature: 77976f8d675bab277c77e4c02c68ee8f ******/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

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
		/****** md5 signature: 26222f3f8c770197bec88d8e30e2baa3 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
Changes parameter on existing point.
") SetParameter;
		void SetParameter(const Standard_Real Param);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 234a6a1e07e1c1d8d9bffffb81b4d76f ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
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
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 873da2d681b7c23b1554d86bc11bc682 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float

Return
-------
None

Description
-----------
Set the values for a point on 2 surfaces, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 41c56f1035ba568b921511edcae6b145 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: float
U: float
V: float
W: float
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
		void SetValue(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, const gp_Vec & Tgs, const gp_Vec & Tgc, const gp_Vec2d & Tg2d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 3df8f22482d57a6d0df3c49499af12d4 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: float
U: float
V: float
W: float

Return
-------
None

Description
-----------
Set the values for a point on a surface and a curve, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 79243c566947946429fbf9d45a4a270a ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC: float
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
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: fcfa5044db6ab2c8ff1ff3e7611086db ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC: float

Return
-------
None

Description
-----------
Creates a point on a surface and a curve on surface, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: ca436d03badc3f9852ac9491c1653d76 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC1: float
PC2: float
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
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: b71555f540c1f3ef7c5e6745a1bfa800 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float
PC1: float
PC2: float

Return
-------
None

Description
-----------
Creates a point on two curves on surfaces, without tangents.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2);

		/****** Blend_Point::SetValue ******/
		/****** md5 signature: 49eafa49e2fecfee4281cb0ffd3f18b2 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
PC1: float
PC2: float

Return
-------
None

Description
-----------
Creates a point on two curves.
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real PC1, const Standard_Real PC2);

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
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

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
		/****** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_SurfCurvFuncInv::IsSolution ******/
		/****** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_SurfCurvFuncInv::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_SurfCurvFuncInv::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		Standard_Integer NbVariables();

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
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_SurfCurvFuncInv::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

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
		/****** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_SurfPointFuncInv::IsSolution ******/
		/****** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_SurfPointFuncInv::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_SurfPointFuncInv::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		Standard_Integer NbVariables();

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
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_SurfPointFuncInv::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: c60b01ffce645ba10de0d0dd29e52621 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** Blend_CSFunction::GetBounds ******/
		/****** md5 signature: a9cc8ec57e6a0e9552f8363868e13158 ******/
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

		/****** Blend_CSFunction::GetMinimalDistance ******/
		/****** md5 signature: b7112b2680da59932f7cc20412f85fda ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****** Blend_CSFunction::GetShape ******/
		/****** md5 signature: d75b859b3c85b25da6eb170dbb54b253 ******/
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

		/****** Blend_CSFunction::GetTolerance ******/
		/****** md5 signature: af65e9b58b7bf33236f13175c966b116 ******/
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
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_CSFunction::GetTolerance ******/
		/****** md5 signature: b003f4e25a542d1d51f0aa55a3ba3736 ******/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** Blend_CSFunction::IsSolution ******/
		/****** md5 signature: c4d9b6173080bbe41930f57f761b358a ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_CSFunction::IsTangencyPoint ******/
		/****** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnC.
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****** Blend_CSFunction::Knots ******/
		/****** md5 signature: 7217dc04d97a88d879fb10243ef0ff84 ******/
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

		/****** Blend_CSFunction::Mults ******/
		/****** md5 signature: d5aaf85aa69579f8450d264b586aa0c5 ******/
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

		/****** Blend_CSFunction::NbEquations ******/
		/****** md5 signature: 4d84b2deb010fe97e393013aa23555cb ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_CSFunction::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3 (default value). Can be redefined.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Blend_CSFunction::ParameterOnC ******/
		/****** md5 signature: 3ee25b1771c48c373d531895fa2c2541 ******/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnC;
		virtual Standard_Real ParameterOnC();

		/****** Blend_CSFunction::Pnt1 ******/
		/****** md5 signature: 4f470306a8227b896b7c05eb38438d0f ******/
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
		/****** md5 signature: 529484ef7f205d7eb6acc8c69fc3a526 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the seconde support.
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
		/****** md5 signature: d17c7b4e4429cd6da9985ae3038cac7b ******/
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
Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_CSFunction::Section ******/
		/****** md5 signature: 9531086ca076494a0288f5c16aeced84 ******/
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

		/****** Blend_CSFunction::Section ******/
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

		/****** Blend_CSFunction::Set ******/
		/****** md5 signature: 286270fbc9c8fb757614552f83022989 ******/
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
		virtual void Set(const Standard_Real Param);

		/****** Blend_CSFunction::Set ******/
		/****** md5 signature: b826ab2c56e152ee3d20beec43f6886a ******/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

		/****** Blend_CSFunction::Tangent ******/
		/****** md5 signature: 8100f17d5878c22baefba9bff6f0bbfc ******/
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
Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.
") Tangent;
		virtual void Tangent(const Standard_Real U, const Standard_Real V, gp_Vec & TgS, gp_Vec & NormS);

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
		/****** md5 signature: b0387de9cd1734a40485d48cedef6a76 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_CSFunction::Values ******/
		/****** md5 signature: d556c7ffdb173f46002b6da3b467da1a ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS1 and/or PointOnS2.
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****** Blend_Function::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 4.
") NbVariables;
		Standard_Integer NbVariables();

		/****** Blend_Function::Pnt1 ******/
		/****** md5 signature: 4f470306a8227b896b7c05eb38438d0f ******/
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
		/****** md5 signature: 529484ef7f205d7eb6acc8c69fc3a526 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the seconde support.
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
		/****** md5 signature: 9531086ca076494a0288f5c16aeced84 ******/
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

		/****** Blend_Function::Section ******/
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

		/****** Blend_Function::Tangent ******/
		/****** md5 signature: 3252786305dce127fe04fa1e2579538c ******/
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
		virtual void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

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
		/****** md5 signature: dd9947ed547cb2cee949777b51c7c043 ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****** Blend_Function::TwistOnS2 ******/
		/****** md5 signature: c424e63584af9a9bd189a3ad5a9cbe61 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		virtual Standard_Boolean TwistOnS2();

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
Enables to implement a criterion of decrochage specific to the function. Warning: Can be called without previous call of issolution but the values calculated can be senseless.
") Decroch;
		virtual Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

		/****** Blend_RstRstFunction::Derivatives ******/
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** Blend_RstRstFunction::GetBounds ******/
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
Returns in the vector InfBound the lowest values allowed for each variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_RstRstFunction::GetMinimalDistance ******/
		/****** md5 signature: e8742e6ed5aa58b10280098f76f7ab1d ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****** Blend_RstRstFunction::GetMinimalWeight ******/
		/****** md5 signature: 12015ca7787e9fa6bcf5f820d6632375 ******/
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

		/****** Blend_RstRstFunction::GetSectionSize ******/
		/****** md5 signature: f308791ef8ed681d6654100e81e995bd ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

		/****** Blend_RstRstFunction::GetShape ******/
		/****** md5 signature: 4c9523caad94a60010e14bbca0ff20fc ******/
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

		/****** Blend_RstRstFunction::GetTolerance ******/
		/****** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ******/
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
Returns in the vector Tolerance the parametric tolerance for each variable; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_RstRstFunction::GetTolerance ******/
		/****** md5 signature: 715ff82186a1d1cd1f2816a9fc072567 ******/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** Blend_RstRstFunction::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
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
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Blend_RstRstFunction::IsRational ******/
		/****** md5 signature: e2d546fe827c13e22032dacc2ce90819 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** Blend_RstRstFunction::IsSolution ******/
		/****** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_RstRstFunction::IsTangencyPoint ******/
		/****** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnRst.
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****** Blend_RstRstFunction::Knots ******/
		/****** md5 signature: 12a741eefe4a6b12fefe540137e600a7 ******/
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

		/****** Blend_RstRstFunction::Mults ******/
		/****** md5 signature: eca3dd33252e6a889c9236a94758c0f8 ******/
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

		/****** Blend_RstRstFunction::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_RstRstFunction::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
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
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Blend_RstRstFunction::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2 (default value). Can be redefined.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Blend_RstRstFunction::ParameterOnRst1 ******/
		/****** md5 signature: 2f829c76c7ed73562a7b20be5bc1f135 ******/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst1;
		virtual Standard_Real ParameterOnRst1();

		/****** Blend_RstRstFunction::ParameterOnRst2 ******/
		/****** md5 signature: aa35bf5f29a385f78897174a6367f771 ******/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst2;
		virtual Standard_Real ParameterOnRst2();

		/****** Blend_RstRstFunction::Pnt1 ******/
		/****** md5 signature: 0b50824c44f989dc0d6554d01a09841f ******/
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
		/****** md5 signature: 7674a11484a480e596351a7b8fae52d6 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the seconde support.
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
		/****** md5 signature: a53c7695ddb71364b3f1a57ab3437f2c ******/
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

		/****** Blend_RstRstFunction::Section ******/
		/****** md5 signature: e37bbcbd1ce3013637ce65f73847d93d ******/
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
Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_RstRstFunction::Section ******/
		/****** md5 signature: 45cb2fd4a3176732a1653dca67ba6422 ******/
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

		/****** Blend_RstRstFunction::Set ******/
		/****** md5 signature: 6ea1b4b1c732128de882a7f7a3bdd939 ******/
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
		virtual void Set(const Standard_Real Param);

		/****** Blend_RstRstFunction::Set ******/
		/****** md5 signature: 72dca3214392c1598e10f82965feedf7 ******/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

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
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_RstRstFunction::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 7284c9bdbe5588f3acf463f1becb02e1 ******/
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
		virtual Standard_Boolean Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

		/****** Blend_SurfRstFunction::Derivatives ******/
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** Blend_SurfRstFunction::GetBounds ******/
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
Returns in the vector InfBound the lowest values allowed for each variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** Blend_SurfRstFunction::GetMinimalDistance ******/
		/****** md5 signature: e8742e6ed5aa58b10280098f76f7ab1d ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****** Blend_SurfRstFunction::GetMinimalWeight ******/
		/****** md5 signature: 12015ca7787e9fa6bcf5f820d6632375 ******/
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

		/****** Blend_SurfRstFunction::GetSectionSize ******/
		/****** md5 signature: f308791ef8ed681d6654100e81e995bd ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

		/****** Blend_SurfRstFunction::GetShape ******/
		/****** md5 signature: 4c9523caad94a60010e14bbca0ff20fc ******/
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

		/****** Blend_SurfRstFunction::GetTolerance ******/
		/****** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ******/
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
Returns in the vector Tolerance the parametric tolerance for each variable; Tol is the tolerance used in 3d space.
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****** Blend_SurfRstFunction::GetTolerance ******/
		/****** md5 signature: 715ff82186a1d1cd1f2816a9fc072567 ******/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** Blend_SurfRstFunction::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
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
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Blend_SurfRstFunction::IsRational ******/
		/****** md5 signature: e2d546fe827c13e22032dacc2ce90819 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** Blend_SurfRstFunction::IsSolution ******/
		/****** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ******/
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
Returns Standard_True if Sol is a zero of the function. Tol is the tolerance used in 3d space. The computation is made at the current value of the parameter on the guide line.
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****** Blend_SurfRstFunction::IsTangencyPoint ******/
		/****** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when it is not possible to compute the tangent vectors at PointOnS and/or PointOnRst.
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****** Blend_SurfRstFunction::Knots ******/
		/****** md5 signature: 12a741eefe4a6b12fefe540137e600a7 ******/
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

		/****** Blend_SurfRstFunction::Mults ******/
		/****** md5 signature: eca3dd33252e6a889c9236a94758c0f8 ******/
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

		/****** Blend_SurfRstFunction::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Blend_SurfRstFunction::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
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
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Blend_SurfRstFunction::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3 (default value). Can be redefined.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Blend_SurfRstFunction::ParameterOnRst ******/
		/****** md5 signature: 01de2ff204e04e0ac9b34e5cb34bbb87 ******/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst;
		virtual Standard_Real ParameterOnRst();

		/****** Blend_SurfRstFunction::Pnt1 ******/
		/****** md5 signature: 0b50824c44f989dc0d6554d01a09841f ******/
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
		/****** md5 signature: 7674a11484a480e596351a7b8fae52d6 ******/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the seconde support.
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
		/****** md5 signature: e37bbcbd1ce3013637ce65f73847d93d ******/
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
Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.
") Section;
		virtual Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Blend_SurfRstFunction::Section ******/
		/****** md5 signature: 45cb2fd4a3176732a1653dca67ba6422 ******/
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

		/****** Blend_SurfRstFunction::Section ******/
		/****** md5 signature: a53c7695ddb71364b3f1a57ab3437f2c ******/
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

		/****** Blend_SurfRstFunction::Set ******/
		/****** md5 signature: 6ea1b4b1c732128de882a7f7a3bdd939 ******/
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
		virtual void Set(const Standard_Real Param);

		/****** Blend_SurfRstFunction::Set ******/
		/****** md5 signature: 72dca3214392c1598e10f82965feedf7 ******/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

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
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Blend_SurfRstFunction::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
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
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
