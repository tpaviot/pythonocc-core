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
%define INTWALKDOCSTRING
"IntWalk module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intwalk.html"
%enddef
%module (package="OCC.Core", docstring=INTWALKDOCSTRING) IntWalk


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
#include<IntWalk_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<Adaptor3d_module.hxx>
#include<IntImp_module.hxx>
#include<TColStd_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<IntSurf_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import Adaptor3d.i
%import IntImp.i
%import TColStd.i
%import gp.i
%import IntSurf.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum IntWalk_StatusDeflection {
	IntWalk_PasTropGrand = 0,
	IntWalk_StepTooSmall = 1,
	IntWalk_PointConfondu = 2,
	IntWalk_ArretSurPointPrecedent = 3,
	IntWalk_ArretSurPoint = 4,
	IntWalk_OK = 5,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IntWalk_StatusDeflection:
	IntWalk_PasTropGrand = 0
	IntWalk_StepTooSmall = 1
	IntWalk_PointConfondu = 2
	IntWalk_ArretSurPointPrecedent = 3
	IntWalk_ArretSurPoint = 4
	IntWalk_OK = 5
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************************
* class IntWalk_TheFunctionOfTheInt2S *
**************************************/
class IntWalk_TheFunctionOfTheInt2S : public math_FunctionSetWithDerivatives {
	public:
		/****************** IntWalk_TheFunctionOfTheInt2S ******************/
		%feature("compactdefaultargs") IntWalk_TheFunctionOfTheInt2S;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface

Returns
-------
None
") IntWalk_TheFunctionOfTheInt2S;
		 IntWalk_TheFunctionOfTheInt2S(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2);

		/****************** AuxillarSurface1 ******************/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface1();

		/****************** AuxillarSurface2 ******************/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface2();

		/****************** ComputeParameters ******************/
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
ChoixIso: IntImp_ConstIsoparametric
Param: TColStd_Array1OfReal
UVap: math_Vector
BornInf: math_Vector
BornSup: math_Vector
Tolerance: math_Vector

Returns
-------
None
") ComputeParameters;
		void ComputeParameters(const IntImp_ConstIsoparametric ChoixIso, const TColStd_Array1OfReal & Param, math_Vector & UVap, math_Vector & BornInf, math_Vector & BornSup, math_Vector & Tolerance);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		gp_Dir2d DirectionOnS2();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
UVap: math_Vector
Param: TColStd_Array1OfReal
BestChoix: IntImp_ConstIsoparametric

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent(const math_Vector & UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric & BestChoix);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns somme des fi*fi.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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


%extend IntWalk_TheFunctionOfTheInt2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IntWalk_TheInt2S *
*************************/
class IntWalk_TheInt2S {
	public:
		/****************** IntWalk_TheInt2S ******************/
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "Compute the solution point with the close point.

Parameters
----------
Param: TColStd_Array1OfReal
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
TolTangency: float

Returns
-------
None
") IntWalk_TheInt2S;
		 IntWalk_TheInt2S(const TColStd_Array1OfReal & Param, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Real TolTangency);

		/****************** IntWalk_TheInt2S ******************/
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "Initialize the parameters to compute the solution point it 's possible to write to optimize: intimp_int2s inter(s1,s2,func,toltangency); math_functionsetroot rsnld(inter.function()); while ...{ param(1)=... param(2)=... param(3)=... inter.perform(param,rsnld); }.

Parameters
----------
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
TolTangency: float

Returns
-------
None
") IntWalk_TheInt2S;
		 IntWalk_TheInt2S(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Real TolTangency);

		/****************** ChangePoint ******************/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return the intersection point which is enable for changing.

Returns
-------
IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the tangent at the intersection line.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the first surface.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the second surface.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d DirectionOnS2();

		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
IntWalk_TheFunctionOfTheInt2S
") Function;
		IntWalk_TheFunctionOfTheInt2S & Function();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true when there is no solution to the problem.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the surfaces are tangent at the intersection point.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is calculated).

Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot

Returns
-------
IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is given by choixiso).

Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot
ChoixIso: IntImp_ConstIsoparametric

Returns
-------
IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld, const IntImp_ConstIsoparametric ChoixIso);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point.

Returns
-------
IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point();

};


%extend IntWalk_TheInt2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntWalk_WalkingData *
****************************/
class IntWalk_WalkingData {
	public:
		float ustart;
		float vstart;
		int etat;
};


%extend IntWalk_WalkingData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
