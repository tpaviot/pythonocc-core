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
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

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
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
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
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsSolution ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

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
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		virtual const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt2;
		virtual const gp_Pnt Pnt2();

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
		virtual void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 4.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") Blend_Point;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blend_Point;
		 Blend_Point();

		/****************** Blend_Point ******************/
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
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns standard_true if it was not possible to compute the tangent vectors at pointons1 and/or pointons2.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParameterOnC ******************/
		%feature("compactdefaultargs") ParameterOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnC;
		Standard_Real ParameterOnC();

		/****************** ParameterOnC1 ******************/
		%feature("compactdefaultargs") ParameterOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnC1;
		Standard_Real ParameterOnC1();

		/****************** ParameterOnC2 ******************/
		%feature("compactdefaultargs") ParameterOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnC2;
		Standard_Real ParameterOnC2();

		/****************** ParametersOnS ******************/
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
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC;
		const gp_Pnt PointOnC();

		/****************** PointOnC1 ******************/
		%feature("compactdefaultargs") PointOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC1;
		const gp_Pnt PointOnC1();

		/****************** PointOnC2 ******************/
		%feature("compactdefaultargs") PointOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnC2;
		const gp_Pnt PointOnC2();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

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

		/****************** SetParameter ******************/
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
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2d;
		gp_Vec2d Tangent2d();

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnC ******************/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC;
		const gp_Vec TangentOnC();

		/****************** TangentOnC1 ******************/
		%feature("compactdefaultargs") TangentOnC1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC1;
		const gp_Vec TangentOnC1();

		/****************** TangentOnC2 ******************/
		%feature("compactdefaultargs") TangentOnC2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnC2;
		const gp_Vec TangentOnC2();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
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
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons and/or pointonc.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

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
		virtual void Knots(TColStd_Array1OfReal & TKnots);

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
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3 (default value). can be redefined.

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
		virtual Standard_Real ParameterOnC();

		/****************** Pnt1 ******************/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** Pnt2d ******************/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2d;
		virtual const gp_Pnt2d Pnt2d();

		/****************** PointOnC ******************/
		%feature("compactdefaultargs") PointOnC;
		%feature("autodoc", "Returns the point on the curve.

Returns
-------
gp_Pnt
") PointOnC;
		virtual const gp_Pnt PointOnC();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Returns the point on the surface.

Returns
-------
gp_Pnt
") PointOnS;
		virtual const gp_Pnt PointOnS();

		/****************** Section ******************/
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
		%feature("compactdefaultargs") Tangent2d;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2d;
		virtual const gp_Vec2d Tangent2d();

		/****************** TangentOnC ******************/
		%feature("compactdefaultargs") TangentOnC;
		%feature("autodoc", "Returns the tangent vector at pointonc, in 3d space.

Returns
-------
gp_Vec
") TangentOnC;
		virtual const gp_Vec TangentOnC();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnS;
		virtual const gp_Vec TangentOnS();

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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

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
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons1 and/or pointons2.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 4.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Pnt1 ******************/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Returns the point on the first surface, at parameter sol(1),sol(2) (sol is the vector used in the call of issolution.

Returns
-------
gp_Pnt
") PointOnS1;
		virtual const gp_Pnt PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Returns the point on the second surface, at parameter sol(3),sol(4) (sol is the vector used in the call of issolution.

Returns
-------
gp_Pnt
") PointOnS2;
		virtual const gp_Pnt PointOnS2();

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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

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
		virtual void Tangent(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, gp_Vec & TgFirst, gp_Vec & TgLast, gp_Vec & NormFirst, gp_Vec & NormLast);

		/****************** Tangent2dOnS1 ******************/
		%feature("compactdefaultargs") Tangent2dOnS1;
		%feature("autodoc", "Returns the tangent vector at pointons1, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS1;
		virtual const gp_Vec2d Tangent2dOnS1();

		/****************** Tangent2dOnS2 ******************/
		%feature("compactdefaultargs") Tangent2dOnS2;
		%feature("autodoc", "Returns the tangent vector at pointons2, in the parametric space of the second surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS2;
		virtual const gp_Vec2d Tangent2dOnS2();

		/****************** TangentOnS1 ******************/
		%feature("compactdefaultargs") TangentOnS1;
		%feature("autodoc", "Returns the tangent vector at pointons1, in 3d space.

Returns
-------
gp_Vec
") TangentOnS1;
		virtual const gp_Vec TangentOnS1();

		/****************** TangentOnS2 ******************/
		%feature("compactdefaultargs") TangentOnS2;
		%feature("autodoc", "Returns the tangent vector at pointons2, in 3d space.

Returns
-------
gp_Vec
") TangentOnS2;
		virtual const gp_Vec TangentOnS2();

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
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
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
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsSolution ******************/
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
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons and/or pointonrst.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

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
		virtual void Knots(TColStd_Array1OfReal & TKnots);

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
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

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
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2 (default value). can be redefined.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst1;
		virtual Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst2;
		virtual Standard_Real ParameterOnRst2();

		/****************** Pnt1 ******************/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** Pnt2dOnRst1 ******************/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst1;
		virtual const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst2;
		virtual const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "Returns the point on the surface.

Returns
-------
gp_Pnt
") PointOnRst1;
		virtual const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "Returns the point on the curve.

Returns
-------
gp_Pnt
") PointOnRst2;
		virtual const gp_Pnt PointOnRst2();

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
		virtual void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
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
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnRst1;
		virtual const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "Returns the tangent vector at pointonrst, in the parametric space of the second surface.

Returns
-------
gp_Vec2d
") Tangent2dOnRst2;
		virtual const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnRst1;
		virtual const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "Returns the tangent vector at pointonc, in 3d space.

Returns
-------
gp_Vec
") TangentOnRst2;
		virtual const gp_Vec TangentOnRst2();

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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

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
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		virtual Standard_Real GetSectionSize();

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
		virtual void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
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
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsSolution ******************/
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
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true when it is not possible to compute the tangent vectors at pointons and/or pointonrst.

Returns
-------
bool
") IsTangencyPoint;
		virtual Standard_Boolean IsTangencyPoint();

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
		virtual void Knots(TColStd_Array1OfReal & TKnots);

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
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

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
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3 (default value). can be redefined.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst;
		virtual Standard_Real ParameterOnRst();

		/****************** Pnt1 ******************/
		%feature("compactdefaultargs") Pnt1;
		%feature("autodoc", "Returns the point on the first support.

Returns
-------
gp_Pnt
") Pnt1;
		const gp_Pnt Pnt1();

		/****************** Pnt2 ******************/
		%feature("compactdefaultargs") Pnt2;
		%feature("autodoc", "Returns the point on the seconde support.

Returns
-------
gp_Pnt
") Pnt2;
		const gp_Pnt Pnt2();

		/****************** Pnt2dOnRst ******************/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst;
		virtual const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnS;
		virtual const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "Returns the point on the curve.

Returns
-------
gp_Pnt
") PointOnRst;
		virtual const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Returns the point on the surface.

Returns
-------
gp_Pnt
") PointOnS;
		virtual const gp_Pnt PointOnS();

		/****************** Section ******************/
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
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "Returns the tangent vector at pointonrst, in the parametric space of the second surface.

Returns
-------
gp_Vec2d
") Tangent2dOnRst;
		virtual const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in the parametric space of the first surface.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		virtual const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "Returns the tangent vector at pointonc, in 3d space.

Returns
-------
gp_Vec
") TangentOnRst;
		virtual const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Returns the tangent vector at pointons, in 3d space.

Returns
-------
gp_Vec
") TangentOnS;
		virtual const gp_Vec TangentOnS();

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
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

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
