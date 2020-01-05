/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
		/****************** AuxillarSurface1 ******************/
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") AuxillarSurface1;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface1 ();

		/****************** AuxillarSurface2 ******************/
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") AuxillarSurface2;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface2 ();

		/****************** ComputeParameters ******************/
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", ":param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param UVap:
	:type UVap: math_Vector
	:param BornInf:
	:type BornInf: math_Vector
	:param BornSup:
	:type BornSup: math_Vector
	:param Tolerance:
	:type Tolerance: math_Vector
	:rtype: None") ComputeParameters;
		void ComputeParameters (const IntImp_ConstIsoparametric ChoixIso,const TColStd_Array1OfReal & Param,math_Vector & UVap,math_Vector & BornInf,math_Vector & BornSup,math_Vector & Tolerance);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		gp_Dir Direction ();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", ":rtype: gp_Dir2d") DirectionOnS1;
		gp_Dir2d DirectionOnS1 ();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", ":rtype: gp_Dir2d") DirectionOnS2;
		gp_Dir2d DirectionOnS2 ();

		/****************** IntWalk_TheFunctionOfTheInt2S ******************/
		%feature("compactdefaultargs") IntWalk_TheFunctionOfTheInt2S;
		%feature("autodoc", ":param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:rtype: None") IntWalk_TheFunctionOfTheInt2S;
		 IntWalk_TheFunctionOfTheInt2S (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2);

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", ":param UVap:
	:type UVap: math_Vector
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param BestChoix:
	:type BestChoix: IntImp_ConstIsoparametric
	:rtype: bool") IsTangent;
		Standard_Boolean IsTangent (const math_Vector & UVap,TColStd_Array1OfReal & Param,IntImp_ConstIsoparametric & BestChoix);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", ":rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", ":rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt") Point;
		gp_Pnt Point ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* returns somme des fi*fi
	:rtype: float") Root;
		Standard_Real Root ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

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
		/****************** ChangePoint ******************/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "* return the intersection point which is enable for changing.
	:rtype: IntSurf_PntOn2S") ChangePoint;
		IntSurf_PntOn2S & ChangePoint ();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the tangent at the intersection line.
	:rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** DirectionOnS1 ******************/
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "* Returns the tangent at the intersection line in the parametric space of the first surface.
	:rtype: gp_Dir2d") DirectionOnS1;
		const gp_Dir2d  DirectionOnS1 ();

		/****************** DirectionOnS2 ******************/
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "* Returns the tangent at the intersection line in the parametric space of the second surface.
	:rtype: gp_Dir2d") DirectionOnS2;
		const gp_Dir2d  DirectionOnS2 ();

		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "* return the math function which is used to compute the intersection
	:rtype: IntWalk_TheFunctionOfTheInt2S") Function;
		IntWalk_TheFunctionOfTheInt2S & Function ();

		/****************** IntWalk_TheInt2S ******************/
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "* compute the solution point with the close point
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param TolTangency:
	:type TolTangency: float
	:rtype: None") IntWalk_TheInt2S;
		 IntWalk_TheInt2S (const TColStd_Array1OfReal & Param,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const Standard_Real TolTangency);

		/****************** IntWalk_TheInt2S ******************/
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "* initialize the parameters to compute the solution point it 's possible to write to optimize: IntImp_Int2S inter(S1,S2,Func,TolTangency); math_FunctionSetRoot rsnld(inter.Function()); while ...{ Param(1)=... Param(2)=... param(3)=... inter.Perform(Param,rsnld); }
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param TolTangency:
	:type TolTangency: float
	:rtype: None") IntWalk_TheInt2S;
		 IntWalk_TheInt2S (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const Standard_Real TolTangency);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the creation completed without failure.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns True when there is no solution to the problem.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "* Returns True if the surfaces are tangent at the intersection point.
	:rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is calculated)
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot
	:rtype: IntImp_ConstIsoparametric") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* returns the best constant isoparametric to find the next intersection's point +stores the solution point (the solution point is found with the close point to intersect the isoparametric with the other patch; the choice of the isoparametic is given by ChoixIso)
	:param Param:
	:type Param: TColStd_Array1OfReal
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:rtype: IntImp_ConstIsoparametric") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld,const IntImp_ConstIsoparametric ChoixIso);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point.
	:rtype: IntSurf_PntOn2S") Point;
		const IntSurf_PntOn2S & Point ();

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
