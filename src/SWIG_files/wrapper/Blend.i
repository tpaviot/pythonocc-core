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
%define BLENDDOCSTRING
"Blend module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_blend.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

enum Blend_DecrochStatus {
	Blend_NoDecroch = 0,
	Blend_DecrochRst1 = 1,
	Blend_DecrochRst2 = 2,
	Blend_DecrochBoth = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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

class Blend_DecrochStatus(IntEnum):
	Blend_NoDecroch = 0
	Blend_DecrochRst1 = 1
	Blend_DecrochRst2 = 2
	Blend_DecrochBoth = 3
Blend_NoDecroch = Blend_DecrochStatus.Blend_NoDecroch
Blend_DecrochRst1 = Blend_DecrochStatus.Blend_DecrochRst1
Blend_DecrochRst2 = Blend_DecrochStatus.Blend_DecrochRst2
Blend_DecrochBoth = Blend_DecrochStatus.Blend_DecrochBoth
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
		/****************** Derivatives ******************/
		/**** md5 signature: 91510de453ada53b30c3a8ed85022935 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: ea9a426b36925ee5ee90867e063c6523 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 4 variables. returns in the vector supbound the greatest values allowed for each of the 4 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: cf2ae1edac6b9f39bab29773592817f0 ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: 12015ca7787e9fa6bcf5f820d6632375 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		/**** md5 signature: f308791ef8ed681d6654100e81e995bd ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 4c9523caad94a60010e14bbca0ff20fc ****/
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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 4 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: 715ff82186a1d1cd1f2816a9fc072567 ****/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
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
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: e2d546fe827c13e22032dacc2ce90819 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space. the computation is made at the current value of the parameter on the guide line.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** Knots ******************/
		/**** md5 signature: 12a741eefe4a6b12fefe540137e600a7 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: eca3dd33252e6a889c9236a94758c0f8 ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		/**** md5 signature: 9592108ebf305562827d51d05d64eecc ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Parameter ******************/
		/**** md5 signature: e076698f3af75bcd0d5e9b5ebefa203d ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the point p. used to impose the parameters in the approximation.

Parameters
----------
P: Blend_Point

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Blend_Point & P);

		/****************** Pnt1 ******************/
		/**** md5 signature: bb9bfa59c92a2029f6434d5fcd5fa96c ****/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		virtual const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		/**** md5 signature: dfef6173347bf841f782a073bb54623f ****/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt2;
		virtual const gp_Pnt Pnt2();

		/****************** Resolution ******************/
		/**** md5 signature: 9817e96f28a752e33f073053bde0ba81 ****/
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
		virtual void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		/**** md5 signature: e37bbcbd1ce3013637ce65f73847d93d ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

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
		/**** md5 signature: a53c7695ddb71364b3f1a57ab3437f2c ****/
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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
		/**** md5 signature: 45cb2fd4a3176732a1653dca67ba6422 ****/
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

		/****************** Set ******************/
		/**** md5 signature: 6ea1b4b1c732128de882a7f7a3bdd939 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the parameter along the guide line. this determines the plane in which the solution has to be found.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: 72dca3214392c1598e10f82965feedf7 ****/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Value ******************/
		/**** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ****/
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
		/****************** Derivatives ******************/
		/**** md5 signature: 91510de453ada53b30c3a8ed85022935 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: ea9a426b36925ee5ee90867e063c6523 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
		/**** md5 signature: 4a9881a4a80757c31b5543d94b3ea3d9 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the point on which a solution has to be found.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Set;
		virtual void Set(const gp_Pnt & P);

		/****************** Value ******************/
		/**** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ****/
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
		/****************** Derivatives ******************/
		/**** md5 signature: 91510de453ada53b30c3a8ed85022935 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: ea9a426b36925ee5ee90867e063c6523 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 4 variables. returns in the vector supbound the greatest values allowed for each of the 4 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 4 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 4.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
		/**** md5 signature: 7983af2dd9b59527838f86afe955ad02 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the curveonsurface on which a solution has to be found. if <onfirst> is set to standard_true, the curve will be on the first surface, otherwise the curve is on the second one.

Parameters
----------
OnFirst: bool
COnSurf: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		virtual void Set(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & COnSurf);

		/****************** Value ******************/
		/**** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ****/
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
		/****************** Blend_Point ******************/
		/**** md5 signature: a7dc6a3a5883092f5a0ad44324b7501d ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blend_Point;
		 Blend_Point();

		/****************** Blend_Point ******************/
		/**** md5 signature: bfd92b440e1bbdd329053c69a4608140 ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on 2 surfaces, with tangents.

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

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****************** Blend_Point ******************/
		/**** md5 signature: 0fb76c701b6a53b225023640137583ef ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on 2 surfaces, without tangents.

Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** Blend_Point ******************/
		/**** md5 signature: 7601a289d490e51aebd651c222437121 ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on a surface and a curve, with tangents.

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

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, const gp_Vec & Tgs, const gp_Vec & Tgc, const gp_Vec2d & Tg2d);

		/****************** Blend_Point ******************/
		/**** md5 signature: 03f8ef157b71345a764df7379c28b348 ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on a surface and a curve, without tangents.

Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: float
U: float
V: float
W: float

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W);

		/****************** Blend_Point ******************/
		/**** md5 signature: aeb9c99a45a2b2f0e7c0a322d8eb1ec8 ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on a surface and a curve on surface, with tangents.

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

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****************** Blend_Point ******************/
		/**** md5 signature: 3ae3cb9415d4ffaa99cf099b121c1a74 ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on a surface and a curve on surface, without tangents.

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

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC);

		/****************** Blend_Point ******************/
		/**** md5 signature: 412dcf133da7d04dc340c64f4a96b385 ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on two curves on surfaces, with tangents.

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

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****************** Blend_Point ******************/
		/**** md5 signature: 681c03baf2a5e55e7f0e7ea3fad4a3a7 ****/
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "Creates a point on two curves on surfaces, with tangents.

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

Returns
-------
None
") Blend_Point;
		 Blend_Point(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns standard_true if it was not possible to compute the tangent vectors at pointons1 and/or pointons2.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParameterOnC ******************/
		/**** md5 signature: ec9af703468ce0fd8ed5aa736ef095ff ****/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****************** ParameterOnC1 ******************/
		/**** md5 signature: 9841a291b54b176d5fffb2beae83c142 ****/
		%feature("compactdefaultargs") ParameterOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnC1;
		Standard_Real ParameterOnC1();

		/****************** ParameterOnC2 ******************/
		/**** md5 signature: 3edd96ad6a6089fd8c0830a29f8b8dec ****/
		%feature("compactdefaultargs") ParameterOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnC2;
		Standard_Real ParameterOnC2();

		/****************** ParametersOnS ******************/
		/**** md5 signature: b7e9d5b50df021c8af5af493baffd0b4 ****/
		%feature("compactdefaultargs") ParametersOnS;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParametersOnS;
		void ParametersOnS(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		/**** md5 signature: 65a097ef44a5cf9a58ab746f2da6c181 ****/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		/**** md5 signature: 77976f8d675bab277c77e4c02c68ee8f ****/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PointOnC ******************/
		/**** md5 signature: 86876235494ef8da7ca49324811ac0e0 ****/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC;
		const gp_Pnt PointOnC();

		/****************** PointOnC1 ******************/
		/**** md5 signature: c2e08b2848fd3090c35b3eade37ef0ff ****/
		%feature("compactdefaultargs") PointOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC1;
		const gp_Pnt PointOnC1();

		/****************** PointOnC2 ******************/
		/**** md5 signature: 1a44b9d6f084b6ebd1d95746e937f2c5 ****/
		%feature("compactdefaultargs") PointOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC2;
		const gp_Pnt PointOnC2();

		/****************** PointOnS ******************/
		/**** md5 signature: 7701a4dd49c389b38b1770bec82a60cd ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** PointOnS1 ******************/
		/**** md5 signature: d0887da6b7c195fe6f26541a1fe42cb2 ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS1;
		const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 75828b1eec68cc5ffaaaa49216ae261a ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS2;
		const gp_Pnt PointOnS2();

		/****************** SetParameter ******************/
		/**** md5 signature: 26222f3f8c770197bec88d8e30e2baa3 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Changes parameter on existing point.

Parameters
----------
Param: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real Param);

		/****************** SetValue ******************/
		/**** md5 signature: 234a6a1e07e1c1d8d9bffffb81b4d76f ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for a point on 2 surfaces, with tangents.

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

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****************** SetValue ******************/
		/**** md5 signature: 873da2d681b7c23b1554d86bc11bc682 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for a point on 2 surfaces, without tangents.

Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
U1: float
V1: float
U2: float
V2: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** SetValue ******************/
		/**** md5 signature: 41c56f1035ba568b921511edcae6b145 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for a point on a surface and a curve, with tangents.

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

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, const gp_Vec & Tgs, const gp_Vec & Tgc, const gp_Vec2d & Tg2d);

		/****************** SetValue ******************/
		/**** md5 signature: 3df8f22482d57a6d0df3c49499af12d4 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for a point on a surface and a curve, without tangents.

Parameters
----------
Pts: gp_Pnt
Ptc: gp_Pnt
Param: float
U: float
V: float
W: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pts, const gp_Pnt & Ptc, const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W);

		/****************** SetValue ******************/
		/**** md5 signature: 79243c566947946429fbf9d45a4a270a ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Creates a point on a surface and a curve on surface, with tangents.

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

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****************** SetValue ******************/
		/**** md5 signature: fcfa5044db6ab2c8ff1ff3e7611086db ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Creates a point on a surface and a curve on surface, without tangents.

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

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC);

		/****************** SetValue ******************/
		/**** md5 signature: ca436d03badc3f9852ac9491c1653d76 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Creates a point on two curves on surfaces, with tangents.

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

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2, const gp_Vec & Tg1, const gp_Vec & Tg2, const gp_Vec2d & Tg12d, const gp_Vec2d & Tg22d);

		/****************** SetValue ******************/
		/**** md5 signature: b71555f540c1f3ef7c5e6745a1bfa800 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Creates a point on two curves on surfaces, without tangents.

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

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real PC1, const Standard_Real PC2);

		/****************** SetValue ******************/
		/**** md5 signature: 49eafa49e2fecfee4281cb0ffd3f18b2 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Creates a point on two curves.

Parameters
----------
Pt1: gp_Pnt
Pt2: gp_Pnt
Param: float
PC1: float
PC2: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt1, const gp_Pnt & Pt2, const Standard_Real Param, const Standard_Real PC1, const Standard_Real PC2);

		/****************** Tangent2d ******************/
		/**** md5 signature: 45c4e6751bb86fa909ea384a33007ff3 ****/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2d;
		gp_Vec2d Tangent2d();

		/****************** Tangent2dOnS1 ******************/
		/**** md5 signature: 1272a269793969dd1430e2756ce7faa2 ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: 4dfd24a1437d0c42574ef4b6ea11a58e ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnC ******************/
		/**** md5 signature: b61d65d6519e567760e4657923cd2fc7 ****/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC;
		const gp_Vec TangentOnC();

		/****************** TangentOnC1 ******************/
		/**** md5 signature: f6d4e0b928aa813efbc0e69a661fbd6b ****/
		%feature("compactdefaultargs") TangentOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC1;
		const gp_Vec TangentOnC1();

		/****************** TangentOnC2 ******************/
		/**** md5 signature: 1a02192f5a7755535661f3b54d08dad0 ****/
		%feature("compactdefaultargs") TangentOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC2;
		const gp_Vec TangentOnC2();

		/****************** TangentOnS ******************/
		/**** md5 signature: 6a76df7a0ec21039226ae1d5b4797449 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: 5f25bebb313d4cf43ba40f8884ebd1d5 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS1;
		const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 669f5d85c695d94605c7169a969c3d0f ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
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
		/****************** Derivatives ******************/
		/**** md5 signature: 91510de453ada53b30c3a8ed85022935 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: ea9a426b36925ee5ee90867e063c6523 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
		/**** md5 signature: 58aa4b5323f8e6dfedff407fa70a0778 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the point on which a solution has to be found.

Parameters
----------
Rst: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		virtual void Set(const opencascade::handle<Adaptor2d_HCurve2d> & Rst);

		/****************** Value ******************/
		/**** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ****/
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
		/****************** Derivatives ******************/
		/**** md5 signature: 91510de453ada53b30c3a8ed85022935 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: ea9a426b36925ee5ee90867e063c6523 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
		/**** md5 signature: 4a9881a4a80757c31b5543d94b3ea3d9 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the point on which a solution has to be found.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Set;
		virtual void Set(const gp_Pnt & P);

		/****************** Value ******************/
		/**** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ****/
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
		/****************** Derivatives ******************/
		/**** md5 signature: c60b01ffce645ba10de0d0dd29e52621 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: a9cc8ec57e6a0e9552f8363868e13158 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetShape ******************/
		/**** md5 signature: d75b859b3c85b25da6eb170dbb54b253 ****/
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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: af65e9b58b7bf33236f13175c966b116 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: b003f4e25a542d1d51f0aa55a3ba3736 ****/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** IsSolution ******************/
		/**** md5 signature: c4d9b6173080bbe41930f57f761b358a ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space. the computation is made at the current value of the parameter on the guide line.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons and/or pointonc.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: 7217dc04d97a88d879fb10243ef0ff84 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: d5aaf85aa69579f8450d264b586aa0c5 ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: 4d84b2deb010fe97e393013aa23555cb ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: 28ab91d0183585502101892aac2c5b98 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3 (default value). can be redefined.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** ParameterOnC ******************/
		/**** md5 signature: 3ee25b1771c48c373d531895fa2c2541 ****/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnC;
		virtual Standard_Real ParameterOnC();

		/****************** Pnt1 ******************/
		/**** md5 signature: 4f470306a8227b896b7c05eb38438d0f ****/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		/**** md5 signature: 529484ef7f205d7eb6acc8c69fc3a526 ****/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** Pnt2d ******************/
		/**** md5 signature: 98c5a7fd07fdcda4e5dba3da570105de ****/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2d;
		virtual const gp_Pnt2d Pnt2d();

		/****************** PointOnC ******************/
		/**** md5 signature: 72d1e1aab7382a71b140bd978aafe6e6 ****/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "Returns the point on the curve.

Returns
-------
gp_Pnt
") PointOnC;
		virtual const gp_Pnt PointOnC();

		/****************** PointOnS ******************/
		/**** md5 signature: 013821b07617cbc53368c5db469ac944 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Returns the point on the surface.

Returns
-------
gp_Pnt
") PointOnS;
		virtual const gp_Pnt PointOnS();

		/****************** Section ******************/
		/**** md5 signature: d17c7b4e4429cd6da9985ae3038cac7b ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

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
		/**** md5 signature: 9531086ca076494a0288f5c16aeced84 ****/
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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

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

		/****************** Set ******************/
		/**** md5 signature: 286270fbc9c8fb757614552f83022989 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the parameter along the guide line. this determines the plane in which the solution has to be found.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: b826ab2c56e152ee3d20beec43f6886a ****/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Tangent ******************/
		/**** md5 signature: 8100f17d5878c22baefba9bff6f0bbfc ****/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Returns the tangent vector at the section, at the beginning and the end of the section, and returns the normal (of the surfaces) at these points.

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
		virtual void Tangent(const Standard_Real U, const Standard_Real V, gp_Vec & TgS, gp_Vec & NormS);

		/****************** Tangent2d ******************/
		/**** md5 signature: c48013a45ce6ec3d80c1c72ade10ff86 ****/
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2d;
		virtual const gp_Vec2d Tangent2d();

		/****************** TangentOnC ******************/
		/**** md5 signature: 58e664a9ca5473e0441364716f57cf5c ****/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "Returns the tangent vector at pointonc, in 3d space.

Returns
-------
gp_Vec
") TangentOnC;
		virtual const gp_Vec TangentOnC();

		/****************** TangentOnS ******************/
		/**** md5 signature: bbacad8d903559279b1b81084b808831 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnS;
		virtual const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: b0387de9cd1734a40485d48cedef6a76 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: d556c7ffdb173f46002b6da3b467da1a ****/
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
		/****************** IsTangencyPoint ******************/
		/**** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons1 and/or pointons2.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 4.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Pnt1 ******************/
		/**** md5 signature: 4f470306a8227b896b7c05eb38438d0f ****/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		/**** md5 signature: 529484ef7f205d7eb6acc8c69fc3a526 ****/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** PointOnS1 ******************/
		/**** md5 signature: e58403c65e5edf32a9edbcf0e168fab8 ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Returns the point on the first surface, at parameter sol(1),sol(2) (sol is the vector used in the call of issolution.

Returns
-------
gp_Pnt
") PointOnS1;
		virtual const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 90f3bce294e1c981e6cda4d330349d11 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Returns the point on the second surface, at parameter sol(3),sol(4) (sol is the vector used in the call of issolution.

Returns
-------
gp_Pnt
") PointOnS2;
		virtual const gp_Pnt PointOnS2();

		/****************** Section ******************/
		/**** md5 signature: 9531086ca076494a0288f5c16aeced84 ****/
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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

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

		/****************** Tangent ******************/
		/**** md5 signature: 3252786305dce127fe04fa1e2579538c ****/
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
		virtual void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		/**** md5 signature: 2a59119466b3a4cdf5aa70fac0d4673e ****/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Returns the tangent vector at pointons1, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		virtual const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		/**** md5 signature: 7cba5607584f29ebc7287a1682ba057b ****/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Returns the tangent vector at pointons2, in the parametric space of the second surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		virtual const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		/**** md5 signature: ace4d9e311e56c4a9713d23ae479ef04 ****/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Returns the tangent vector at pointons1, in 3d space.

Returns
-------
gp_Vec
") TangentOnS1;
		virtual const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		/**** md5 signature: 42dd8da874c679c750083aa2087aaab2 ****/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Returns the tangent vector at pointons2, in 3d space.

Returns
-------
gp_Vec
") TangentOnS2;
		virtual const gp_Vec TangentOnS2();

		/****************** TwistOnS1 ******************/
		/**** md5 signature: dd9947ed547cb2cee949777b51c7c043 ****/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		virtual Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		/**** md5 signature: c424e63584af9a9bd189a3ad5a9cbe61 ****/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		/****************** Decroch ******************/
		/**** md5 signature: da370598160a8d3edc9c9ec6cd6bbc5c ****/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "Enables to implement a criterion of decrochage specific to the function. warning: can be called without previous call of issolution but the values calculated can be senseless.

Parameters
----------
Sol: math_Vector
NRst1: gp_Vec
TgRst1: gp_Vec
NRst2: gp_Vec
TgRst2: gp_Vec

Returns
-------
Blend_DecrochStatus
") Decroch;
		virtual Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

		/****************** Derivatives ******************/
		/**** md5 signature: 91510de453ada53b30c3a8ed85022935 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: ea9a426b36925ee5ee90867e063c6523 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: e8742e6ed5aa58b10280098f76f7ab1d ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: 12015ca7787e9fa6bcf5f820d6632375 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		/**** md5 signature: f308791ef8ed681d6654100e81e995bd ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 4c9523caad94a60010e14bbca0ff20fc ****/
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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each variable; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: 715ff82186a1d1cd1f2816a9fc072567 ****/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
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
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: e2d546fe827c13e22032dacc2ce90819 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space. the computation is made at the current value of the parameter on the guide line.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons and/or pointonrst.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: 12a741eefe4a6b12fefe540137e600a7 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: eca3dd33252e6a889c9236a94758c0f8 ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		/**** md5 signature: 9592108ebf305562827d51d05d64eecc ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2 (default value). can be redefined.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		/**** md5 signature: 2f829c76c7ed73562a7b20be5bc1f135 ****/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst1;
		virtual Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		/**** md5 signature: aa35bf5f29a385f78897174a6367f771 ****/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst2;
		virtual Standard_Real ParameterOnRst2();

		/****************** Pnt1 ******************/
		/**** md5 signature: 0b50824c44f989dc0d6554d01a09841f ****/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		/**** md5 signature: 7674a11484a480e596351a7b8fae52d6 ****/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** Pnt2dOnRst1 ******************/
		/**** md5 signature: e3f75dcfdb45ec34883bee818cbdd115 ****/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst1;
		virtual const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		/**** md5 signature: 26bff8e780bdddbf622a247cc3db85be ****/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst2;
		virtual const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		/**** md5 signature: d1ad11354f30bfbe23a20a972f215958 ****/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "Returns the point on the surface.

Returns
-------
gp_Pnt
") PointOnRst1;
		virtual const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		/**** md5 signature: bfbfaf7046c1d39ce1f0f458886fcd59 ****/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "Returns the point on the curve.

Returns
-------
gp_Pnt
") PointOnRst2;
		virtual const gp_Pnt PointOnRst2();

		/****************** Section ******************/
		/**** md5 signature: a53c7695ddb71364b3f1a57ab3437f2c ****/
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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
		/**** md5 signature: e37bbcbd1ce3013637ce65f73847d93d ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

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
		/**** md5 signature: 45cb2fd4a3176732a1653dca67ba6422 ****/
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

		/****************** Set ******************/
		/**** md5 signature: 6ea1b4b1c732128de882a7f7a3bdd939 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the parameter along the guide line. this determines the plane in which the solution has to be found.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: 72dca3214392c1598e10f82965feedf7 ****/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Tangent2dOnRst1 ******************/
		/**** md5 signature: fcbf5456f50de851d444c4d79888de5d ****/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnRst1;
		virtual const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		/**** md5 signature: 48d9d4a9667de60f2ac5b84d62425cff ****/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "Returns the tangent vector at pointonrst, in the parametric space of the second surface.

Returns
-------
gp_Vec2d
") Tangent2dOnRst2;
		virtual const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		/**** md5 signature: 674e1a1cb641654717601d87e8a6a7af ****/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnRst1;
		virtual const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		/**** md5 signature: 76af1c3787229190aa13d77740ee1d23 ****/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "Returns the tangent vector at pointonc, in 3d space.

Returns
-------
gp_Vec
") TangentOnRst2;
		virtual const gp_Vec TangentOnRst2();

		/****************** Value ******************/
		/**** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ****/
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
		/****************** Decroch ******************/
		/**** md5 signature: 7284c9bdbe5588f3acf463f1becb02e1 ****/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "Enables implementation of a criterion of decrochage specific to the function.

Parameters
----------
Sol: math_Vector
NS: gp_Vec
TgS: gp_Vec

Returns
-------
bool
") Decroch;
		virtual Standard_Boolean Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

		/****************** Derivatives ******************/
		/**** md5 signature: 91510de453ada53b30c3a8ed85022935 ****/
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
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: ea9a426b36925ee5ee90867e063c6523 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		virtual void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: e8742e6ed5aa58b10280098f76f7ab1d ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: 12015ca7787e9fa6bcf5f820d6632375 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		/**** md5 signature: f308791ef8ed681d6654100e81e995bd ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 4c9523caad94a60010e14bbca0ff20fc ****/
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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: 9c8b08d1f0aa3ef3a04b7834c06e849d ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each variable; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: 715ff82186a1d1cd1f2816a9fc072567 ****/
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
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
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
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: e2d546fe827c13e22032dacc2ce90819 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 65e978e7c1aeb4e253d805ec1412cadd ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space. the computation is made at the current value of the parameter on the guide line.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		virtual Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: bc14917d31fcf3cabe33ced86387ccb2 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons and/or pointonrst.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: 12a741eefe4a6b12fefe540137e600a7 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: eca3dd33252e6a889c9236a94758c0f8 ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		/**** md5 signature: 9592108ebf305562827d51d05d64eecc ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3 (default value). can be redefined.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		/**** md5 signature: 01de2ff204e04e0ac9b34e5cb34bbb87 ****/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst;
		virtual Standard_Real ParameterOnRst();

		/****************** Pnt1 ******************/
		/**** md5 signature: 0b50824c44f989dc0d6554d01a09841f ****/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		/**** md5 signature: 7674a11484a480e596351a7b8fae52d6 ****/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** Pnt2dOnRst ******************/
		/**** md5 signature: ebf44037fb3bdbcaa4184774d2037618 ****/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst;
		virtual const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		/**** md5 signature: d615c6281ea9f9161996abd4b9a9fb73 ****/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnS;
		virtual const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		/**** md5 signature: 9656ef3947b8f1b09af430ee1d1f4d1d ****/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "Returns the point on the curve.

Returns
-------
gp_Pnt
") PointOnRst;
		virtual const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		/**** md5 signature: 013821b07617cbc53368c5db469ac944 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Returns the point on the surface.

Returns
-------
gp_Pnt
") PointOnS;
		virtual const gp_Pnt PointOnS();

		/****************** Section ******************/
		/**** md5 signature: e37bbcbd1ce3013637ce65f73847d93d ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

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
		/**** md5 signature: 45cb2fd4a3176732a1653dca67ba6422 ****/
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
		/**** md5 signature: a53c7695ddb71364b3f1a57ab3437f2c ****/
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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		/**** md5 signature: 6ea1b4b1c732128de882a7f7a3bdd939 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the parameter along the guide line. this determines the plane in which the solution has to be found.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: 72dca3214392c1598e10f82965feedf7 ****/
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
		virtual void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Tangent2dOnRst ******************/
		/**** md5 signature: e1bcaec74b4767508501bf2f7c1cdb3d ****/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "Returns the tangent vector at pointonrst, in the parametric space of the second surface.

Returns
-------
gp_Vec2d
") Tangent2dOnRst;
		virtual const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		/**** md5 signature: 7f46fc020c51a66db9c76684922235f0 ****/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		virtual const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		/**** md5 signature: 2df1ce073324d55483e131fc0c914949 ****/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "Returns the tangent vector at pointonc, in 3d space.

Returns
-------
gp_Vec
") TangentOnRst;
		virtual const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		/**** md5 signature: bbacad8d903559279b1b81084b808831 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnS;
		virtual const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ****/
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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ****/
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
