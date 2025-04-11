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
%define INTWALKDOCSTRING
"IntWalk module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intwalk.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
		/****** IntWalk_TheFunctionOfTheInt2S::IntWalk_TheFunctionOfTheInt2S ******/
		/****** md5 signature: a6e86400c87c4372f37609d6e136a604 ******/
		%feature("compactdefaultargs") IntWalk_TheFunctionOfTheInt2S;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") IntWalk_TheFunctionOfTheInt2S;
		 IntWalk_TheFunctionOfTheInt2S(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2);

		/****** IntWalk_TheFunctionOfTheInt2S::AuxillarSurface1 ******/
		/****** md5 signature: 2bcc0e8f6b940dfbbbc22a207b96f139 ******/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface1();

		/****** IntWalk_TheFunctionOfTheInt2S::AuxillarSurface2 ******/
		/****** md5 signature: 00eb01b56212c9640d2242fafdf3e920 ******/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface2();

		/****** IntWalk_TheFunctionOfTheInt2S::ComputeParameters ******/
		/****** md5 signature: 5686d6c4ca7c470ce5a820727bd25544 ******/
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", "
Parameters
----------
ChoixIso: IntImp_ConstIsoparametric
Param: TColStd_Array1OfReal
UVap: math_Vector
BornInf: math_Vector
BornSup: math_Vector
Tolerance: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") ComputeParameters;
		void ComputeParameters(const IntImp_ConstIsoparametric ChoixIso, const TColStd_Array1OfReal & Param, math_Vector & UVap, math_Vector & BornInf, math_Vector & BornSup, math_Vector & Tolerance);

		/****** IntWalk_TheFunctionOfTheInt2S::Derivatives ******/
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
No available documentation.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** IntWalk_TheFunctionOfTheInt2S::Direction ******/
		/****** md5 signature: 7db1622a0b370b4453af0886bb5f840c ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** IntWalk_TheFunctionOfTheInt2S::DirectionOnS1 ******/
		/****** md5 signature: bc5dc0d8303d35b67ad8c11b04c94ec5 ******/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") DirectionOnS1;
		gp_Dir2d DirectionOnS1();

		/****** IntWalk_TheFunctionOfTheInt2S::DirectionOnS2 ******/
		/****** md5 signature: caea60e56e0b7869c8e3533543115136 ******/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") DirectionOnS2;
		gp_Dir2d DirectionOnS2();

		/****** IntWalk_TheFunctionOfTheInt2S::IsTangent ******/
		/****** md5 signature: 9e73991f5144c0e218a14c453bc89c5f ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "
Parameters
----------
UVap: math_Vector
Param: TColStd_Array1OfReal

Return
-------
BestChoix: IntImp_ConstIsoparametric

Description
-----------
No available documentation.
") IsTangent;
		Standard_Boolean IsTangent(const math_Vector & UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric &OutValue);

		/****** IntWalk_TheFunctionOfTheInt2S::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** IntWalk_TheFunctionOfTheInt2S::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** IntWalk_TheFunctionOfTheInt2S::Point ******/
		/****** md5 signature: aacd847206090cc43a493e5072f97000 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		gp_Pnt Point();

		/****** IntWalk_TheFunctionOfTheInt2S::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns somme des fi*fi.
") Root;
		Standard_Real Root();

		/****** IntWalk_TheFunctionOfTheInt2S::Value ******/
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
No available documentation.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** IntWalk_TheFunctionOfTheInt2S::Values ******/
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
No available documentation.
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
		/****** IntWalk_TheInt2S::IntWalk_TheInt2S ******/
		/****** md5 signature: 1c4cc577e5086d81834c89e839f0d692 ******/
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolTangency: float

Return
-------
None

Description
-----------
compute the solution point with the close point.
") IntWalk_TheInt2S;
		 IntWalk_TheInt2S(const TColStd_Array1OfReal & Param, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const Standard_Real TolTangency);

		/****** IntWalk_TheInt2S::IntWalk_TheInt2S ******/
		/****** md5 signature: f2356976844250378d7966a9409a843c ******/
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolTangency: float

Return
-------
None

Description
-----------
initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }.
") IntWalk_TheInt2S;
		 IntWalk_TheInt2S(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const Standard_Real TolTangency);

		/****** IntWalk_TheInt2S::ChangePoint ******/
		/****** md5 signature: 1b1852ae04e18b1e3ae0c1ea8c1f6773 ******/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return
-------
IntSurf_PntOn2S

Description
-----------
return the intersection point which is enable for changing.
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint();

		/****** IntWalk_TheInt2S::Direction ******/
		/****** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the tangent at the intersection line.
") Direction;
		const gp_Dir Direction();

		/****** IntWalk_TheInt2S::DirectionOnS1 ******/
		/****** md5 signature: 0ea23aedfa0d65293f06d50c4f4fd61f ******/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the tangent at the intersection line in the parametric space of the first surface.
") DirectionOnS1;
		const gp_Dir2d DirectionOnS1();

		/****** IntWalk_TheInt2S::DirectionOnS2 ******/
		/****** md5 signature: 9fe51e029e5ffcecf563550ef1c567fd ******/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the tangent at the intersection line in the parametric space of the second surface.
") DirectionOnS2;
		const gp_Dir2d DirectionOnS2();

		/****** IntWalk_TheInt2S::Function ******/
		/****** md5 signature: 9898950ac008c9766278e0ad6ed48528 ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
IntWalk_TheFunctionOfTheInt2S

Description
-----------
return the math function which is used to compute the intersection.
") Function;
		IntWalk_TheFunctionOfTheInt2S & Function();

		/****** IntWalk_TheInt2S::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntWalk_TheInt2S::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when there is no solution to the problem.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntWalk_TheInt2S::IsTangent ******/
		/****** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are tangent at the intersection point.
") IsTangent;
		Standard_Boolean IsTangent();

		/****** IntWalk_TheInt2S::Perform ******/
		/****** md5 signature: ba19d26576d52e0e2824307d3171f0bf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot

Return
-------
IntImp_ConstIsoparametric

Description
-----------
returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is calculated).
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld);

		/****** IntWalk_TheInt2S::Perform ******/
		/****** md5 signature: 01d0aa4ed60a8ef13ed05d29863bed35 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: TColStd_Array1OfReal
Rsnld: math_FunctionSetRoot
ChoixIso: IntImp_ConstIsoparametric

Return
-------
IntImp_ConstIsoparametric

Description
-----------
returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is given by ChoixIso).
") Perform;
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal & Param, math_FunctionSetRoot & Rsnld, const IntImp_ConstIsoparametric ChoixIso);

		/****** IntWalk_TheInt2S::Point ******/
		/****** md5 signature: be121892232ab68ab537f33c0dca8dfd ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point.
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
};


%extend IntWalk_WalkingData {
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
