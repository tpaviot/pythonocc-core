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
%define CSLIBDOCSTRING
"CSLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_cslib.html"
%enddef
%module (package="OCC.Core", docstring=CSLIBDOCSTRING) CSLib


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
#include<CSLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<math_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import gp.i
%import math.i
%import TColStd.i
/* public enums */
enum CSLib_NormalStatus {
	CSLib_Singular = 0,
	CSLib_Defined = 1,
	CSLib_InfinityOfSolutions = 2,
	CSLib_D1NuIsNull = 3,
	CSLib_D1NvIsNull = 4,
	CSLib_D1NIsNull = 5,
	CSLib_D1NuNvRatioIsNull = 6,
	CSLib_D1NvNuRatioIsNull = 7,
	CSLib_D1NuIsParallelD1Nv = 8,
};

enum CSLib_DerivativeStatus {
	CSLib_Done = 0,
	CSLib_D1uIsNull = 1,
	CSLib_D1vIsNull = 2,
	CSLib_D1IsNull = 3,
	CSLib_D1uD1vRatioIsNull = 4,
	CSLib_D1vD1uRatioIsNull = 5,
	CSLib_D1uIsParallelD1v = 6,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class CSLib *
**************/
%rename(cslib) CSLib;
class CSLib {
	public:
		/****************** DNNUV ******************/
		%feature("compactdefaultargs") DNNUV;
		%feature("autodoc", "* -- Computes the derivative of order Nu in the -- direction U and Nv in the direction V of the not -- normalized normal vector at the point P(U,V) The array DerSurf contain the derivative (i,j) of the surface for i=0,Nu+1 ; j=0,Nv+1
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:param DerSurf:
	:type DerSurf: TColgp_Array2OfVec
	:rtype: gp_Vec") DNNUV;
		static gp_Vec DNNUV (const Standard_Integer Nu,const Standard_Integer Nv,const TColgp_Array2OfVec & DerSurf);

		/****************** DNNUV ******************/
		%feature("compactdefaultargs") DNNUV;
		%feature("autodoc", "* Computes the derivatives of order Nu in the direction Nu and Nv in the direction Nv of the not normalized vector N(u,v) = dS1/du * dS2/dv (cases where we use an osculating surface) DerSurf1 are the derivatives of S1
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:param DerSurf1:
	:type DerSurf1: TColgp_Array2OfVec
	:param DerSurf2:
	:type DerSurf2: TColgp_Array2OfVec
	:rtype: gp_Vec") DNNUV;
		static gp_Vec DNNUV (const Standard_Integer Nu,const Standard_Integer Nv,const TColgp_Array2OfVec & DerSurf1,const TColgp_Array2OfVec & DerSurf2);

		/****************** DNNormal ******************/
		%feature("compactdefaultargs") DNNormal;
		%feature("autodoc", "* -- Computes the derivative of order Nu in the -- direction U and Nv in the direction V of the normalized normal vector at the point P(U,V) array DerNUV contain the derivative (i+Iduref,j+Idvref) of D1U ^ D1V for i=0,Nu ; j=0,Nv Iduref and Idvref correspond to a derivative of D1U ^ D1V which can be used to compute the normalized normal vector. In the regular cases , Iduref=Idvref=0.
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:param DerNUV:
	:type DerNUV: TColgp_Array2OfVec
	:param Iduref: default value is 0
	:type Iduref: int
	:param Idvref: default value is 0
	:type Idvref: int
	:rtype: gp_Vec") DNNormal;
		static gp_Vec DNNormal (const Standard_Integer Nu,const Standard_Integer Nv,const TColgp_Array2OfVec & DerNUV,const Standard_Integer Iduref = 0,const Standard_Integer Idvref = 0);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* The following functions computes the normal to a surface inherits FunctionWithDerivative from math //! Computes the normal direction of a surface as the cross product between D1U and D1V. If D1U has null length or D1V has null length or D1U and D1V are parallel the normal is undefined. To check that D1U and D1V are colinear the sinus of the angle between D1U and D1V is computed and compared with SinTol. The normal is computed if theStatus == Done else the theStatus gives the reason why the computation has failed.
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param SinTol:
	:type SinTol: float
	:param theStatus:
	:type theStatus: CSLib_DerivativeStatus
	:param Normal:
	:type Normal: gp_Dir
	:rtype: void") Normal;
		static void Normal (const gp_Vec & D1U,const gp_Vec & D1V,const Standard_Real SinTol,CSLib_DerivativeStatus & theStatus,gp_Dir & Normal);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* If there is a singularity on the surface the previous method cannot compute the local normal. This method computes an approched normal direction of a surface. It does a limited development and needs the second derivatives on the surface as input data. It computes the normal as follow : N(u, v) = D1U ^ D1V N(u0+du,v0+dv) = N0 + DN/du(u0,v0) * du + DN/dv(u0,v0) * dv + Eps with Eps->0 so we can have the equivalence N ~ dN/du + dN/dv. DNu = ||DN/du|| and DNv = ||DN/dv|| //! . if DNu IsNull (DNu <= Resolution from gp) the answer Done = True the normal direction is given by DN/dv . if DNv IsNull (DNv <= Resolution from gp) the answer Done = True the normal direction is given by DN/du . if the two directions DN/du and DN/dv are parallel Done = True the normal direction is given either by DN/du or DN/dv. To check that the two directions are colinear the sinus of the angle between these directions is computed and compared with SinTol. . if DNu/DNv or DNv/DNu is lower or equal than Real Epsilon Done = False, the normal is undefined . if DNu IsNull and DNv is Null Done = False, there is an indetermination and we should do a limited developpement at order 2 (it means that we cannot omit Eps). . if DNu Is not Null and DNv Is not Null Done = False, there are an infinity of normals at the considered point on the surface.
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param SinTol:
	:type SinTol: float
	:param Done:
	:type Done: bool
	:param theStatus:
	:type theStatus: CSLib_NormalStatus
	:param Normal:
	:type Normal: gp_Dir
	:rtype: void") Normal;
		static void Normal (const gp_Vec & D1U,const gp_Vec & D1V,const gp_Vec & D2U,const gp_Vec & D2V,const gp_Vec & D2UV,const Standard_Real SinTol,Standard_Boolean &OutValue,CSLib_NormalStatus & theStatus,gp_Dir & Normal);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Computes the normal direction of a surface as the cross product between D1U and D1V.
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param MagTol:
	:type MagTol: float
	:param theStatus:
	:type theStatus: CSLib_NormalStatus
	:param Normal:
	:type Normal: gp_Dir
	:rtype: void") Normal;
		static void Normal (const gp_Vec & D1U,const gp_Vec & D1V,const Standard_Real MagTol,CSLib_NormalStatus & theStatus,gp_Dir & Normal);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* find the first order k0 of deriviative of NUV where: foreach order < k0 all the derivatives of NUV are null all the derivatives of NUV corresponding to the order k0 are collinear and have the same sens. In this case, normal at U,V is unique.
	:param MaxOrder:
	:type MaxOrder: int
	:param DerNUV:
	:type DerNUV: TColgp_Array2OfVec
	:param MagTol:
	:type MagTol: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:param theStatus:
	:type theStatus: CSLib_NormalStatus
	:param Normal:
	:type Normal: gp_Dir
	:param OrderU:
	:type OrderU: int
	:param OrderV:
	:type OrderV: int
	:rtype: void") Normal;
		static void Normal (const Standard_Integer MaxOrder,const TColgp_Array2OfVec & DerNUV,const Standard_Real MagTol,const Standard_Real U,const Standard_Real V,const Standard_Real Umin,const Standard_Real Umax,const Standard_Real Vmin,const Standard_Real Vmax,CSLib_NormalStatus & theStatus,gp_Dir & Normal,Standard_Integer &OutValue,Standard_Integer &OutValue);

};


%extend CSLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class CSLib_Class2d *
**********************/
class CSLib_Class2d {
	public:
		/****************** CSLib_Class2d ******************/
		%feature("compactdefaultargs") CSLib_Class2d;
		%feature("autodoc", "* Constructs the 2D-polygon. thePnts2d is the set of the vertices (closed polygon will always be created inside of this constructor; consequently, there is no point in repeating first and last point in thePnts2d). theTolu and theTolv are tolerances. theUmin, theVmin, theUmax, theVmax are UV-bounds of the polygon.
	:param thePnts2d:
	:type thePnts2d: TColgp_Array1OfPnt2d
	:param theTolU:
	:type theTolU: float
	:param theTolV:
	:type theTolV: float
	:param theUMin:
	:type theUMin: float
	:param theVMin:
	:type theVMin: float
	:param theUMax:
	:type theUMax: float
	:param theVMax:
	:type theVMax: float
	:rtype: None") CSLib_Class2d;
		 CSLib_Class2d (const TColgp_Array1OfPnt2d & thePnts2d,const Standard_Real theTolU,const Standard_Real theTolV,const Standard_Real theUMin,const Standard_Real theVMin,const Standard_Real theUMax,const Standard_Real theVMax);

		/****************** CSLib_Class2d ******************/
		%feature("compactdefaultargs") CSLib_Class2d;
		%feature("autodoc", "* Constructs the 2D-polygon. thePnts2d is the set of the vertices (closed polygon will always be created inside of this constructor; consequently, there is no point in repeating first and last point in thePnts2d). theTolu and theTolv are tolerances. theUmin, theVmin, theUmax, theVmax are UV-bounds of the polygon.
	:param thePnts2d:
	:type thePnts2d: TColgp_SequenceOfPnt2d
	:param theTolU:
	:type theTolU: float
	:param theTolV:
	:type theTolV: float
	:param theUMin:
	:type theUMin: float
	:param theVMin:
	:type theVMin: float
	:param theUMax:
	:type theUMax: float
	:param theVMax:
	:type theVMax: float
	:rtype: None") CSLib_Class2d;
		 CSLib_Class2d (const TColgp_SequenceOfPnt2d & thePnts2d,const Standard_Real theTolU,const Standard_Real theTolV,const Standard_Real theUMin,const Standard_Real theVMin,const Standard_Real theUMax,const Standard_Real theVMax);

		/****************** InternalSiDans ******************/
		%feature("compactdefaultargs") InternalSiDans;
		%feature("autodoc", ":param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: int") InternalSiDans;
		Standard_Integer InternalSiDans (const Standard_Real X,const Standard_Real Y);

		/****************** InternalSiDansOuOn ******************/
		%feature("compactdefaultargs") InternalSiDansOuOn;
		%feature("autodoc", ":param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: int") InternalSiDansOuOn;
		Standard_Integer InternalSiDansOuOn (const Standard_Real X,const Standard_Real Y);

		/****************** SiDans ******************/
		%feature("compactdefaultargs") SiDans;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: int") SiDans;
		Standard_Integer SiDans (const gp_Pnt2d & P);

		/****************** SiDans_OnMode ******************/
		%feature("compactdefaultargs") SiDans_OnMode;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: int") SiDans_OnMode;
		Standard_Integer SiDans_OnMode (const gp_Pnt2d & P,const Standard_Real Tol);

};


%extend CSLib_Class2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class CSLib_NormalPolyDef *
****************************/
class CSLib_NormalPolyDef : public math_FunctionWithDerivative {
	public:
		/****************** CSLib_NormalPolyDef ******************/
		%feature("compactdefaultargs") CSLib_NormalPolyDef;
		%feature("autodoc", ":param k0:
	:type k0: int
	:param li:
	:type li: TColStd_Array1OfReal
	:rtype: None") CSLib_NormalPolyDef;
		 CSLib_NormalPolyDef (const Standard_Integer k0,const TColStd_Array1OfReal & li);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend CSLib_NormalPolyDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
