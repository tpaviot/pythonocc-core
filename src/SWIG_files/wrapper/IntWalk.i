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
from enum import IntEnum
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

class IntWalk_StatusDeflection(IntEnum):
	IntWalk_PasTropGrand = 0
	IntWalk_StepTooSmall = 1
	IntWalk_PointConfondu = 2
	IntWalk_ArretSurPointPrecedent = 3
	IntWalk_ArretSurPoint = 4
	IntWalk_OK = 5
IntWalk_PasTropGrand = IntWalk_StatusDeflection.IntWalk_PasTropGrand
IntWalk_StepTooSmall = IntWalk_StatusDeflection.IntWalk_StepTooSmall
IntWalk_PointConfondu = IntWalk_StatusDeflection.IntWalk_PointConfondu
IntWalk_ArretSurPointPrecedent = IntWalk_StatusDeflection.IntWalk_ArretSurPointPrecedent
IntWalk_ArretSurPoint = IntWalk_StatusDeflection.IntWalk_ArretSurPoint
IntWalk_OK = IntWalk_StatusDeflection.IntWalk_OK
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
		/**** md5 signature: e10ea1317bec9408353d3e39fa4c84eb ****/
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
		/**** md5 signature: de137e38f3f056bf64cd7e4eab548eaf ****/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface1();

		/****************** AuxillarSurface2 ******************/
		/**** md5 signature: 02af9eff198053eb68634237a25ca989 ****/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface2();

		/****************** ComputeParameters ******************/
		/**** md5 signature: 5686d6c4ca7c470ce5a820727bd25544 ****/
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
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
		/**** md5 signature: 7db1622a0b370b4453af0886bb5f840c ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		/**** md5 signature: bc5dc0d8303d35b67ad8c11b04c94ec5 ****/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		/**** md5 signature: caea60e56e0b7869c8e3533543115136 ****/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		gp_Dir2d DirectionOnS2();

		/****************** IsTangent ******************/
		/**** md5 signature: 9e73991f5144c0e218a14c453bc89c5f ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		/**** md5 signature: aacd847206090cc43a493e5072f97000 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns somme des fi*fi.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
		/**** md5 signature: b95210448193a26bf5c2c55c1f7fca78 ****/
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
		/**** md5 signature: ade0e45c80bb946fd6ef9bc7c2156444 ****/
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
		/**** md5 signature: 1b1852ae04e18b1e3ae0c1ea8c1f6773 ****/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return the intersection point which is enable for changing.

Returns
-------
IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint();

		/****************** Direction ******************/
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the tangent at the intersection line.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** DirectionOnS1 ******************/
		/**** md5 signature: 0ea23aedfa0d65293f06d50c4f4fd61f ****/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the first surface.

Returns
-------
gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d DirectionOnS1();

		/****************** DirectionOnS2 ******************/
		/**** md5 signature: 9fe51e029e5ffcecf563550ef1c567fd ****/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Returns the tangent at the intersection line in the parametric space of the second surface.

Returns
-------
gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d DirectionOnS2();

		/****************** Function ******************/
		/**** md5 signature: 9898950ac008c9766278e0ad6ed48528 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
IntWalk_TheFunctionOfTheInt2S
") Function;
		IntWalk_TheFunctionOfTheInt2S & Function();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true when there is no solution to the problem.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the surfaces are tangent at the intersection point.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** Perform ******************/
		/**** md5 signature: ba19d26576d52e0e2824307d3171f0bf ****/
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
		/**** md5 signature: 01d0aa4ed60a8ef13ed05d29863bed35 ****/
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
		/**** md5 signature: be121892232ab68ab537f33c0dca8dfd ****/
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
