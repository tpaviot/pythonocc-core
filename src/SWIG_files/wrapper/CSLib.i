/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") CSLib

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include CSLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum CSLib_DerivativeStatus {
	CSLib_Done = 0,
	CSLib_D1uIsNull = 1,
	CSLib_D1vIsNull = 2,
	CSLib_D1IsNull = 3,
	CSLib_D1uD1vRatioIsNull = 4,
	CSLib_D1vD1uRatioIsNull = 5,
	CSLib_D1uIsParallelD1v = 6,
};

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

/* end public enums declaration */

%rename(cslib) CSLib;
%nodefaultctor CSLib;
class CSLib {
	public:
		%feature("autodoc", "Args:
	D1U(gp_Vec)
	D1V(gp_Vec)
	SinTol(Standard_Real)
	Status(CSLib_DerivativeStatus)
	Normal(gp_Dir)

Returns:
	static void

The following functions computes the normal to a surface  
inherits FunctionWithDerivative from math  
 
 Computes the normal direction of a surface as the cross product  
 between D1U and D1V.  
 If D1U has null length or D1V has null length or D1U and D1V are  
 parallel the normal is undefined.  
 To check that D1U and D1V are colinear the sinus of the angle  
 between D1U and D1V is computed and compared with SinTol.  
 The normal is computed if Status == Done else the Status gives the  
 reason why the computation has failed.") Normal;
		static void Normal (const gp_Vec & D1U,const gp_Vec & D1V,const Standard_Real SinTol,CSLib_DerivativeStatus & Status,gp_Dir & Normal);
		%feature("autodoc", "Args:
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	SinTol(Standard_Real)
	Done(Standard_Boolean)
	Status(CSLib_NormalStatus)
	Normal(gp_Dir)

Returns:
	static void

If there is a singularity on the surface  the previous method  
 cannot compute the local normal.  
 This method computes an approched normal direction of a surface.  
 It does a limited development and needs the second derivatives  
 on the surface as input data.  
 It computes the normal as follow :  
 N(u, v) = D1U ^ D1V  
 N(u0+du,v0+dv) = N0 + DN/du(u0,v0) * du + DN/dv(u0,v0) * dv + Eps  
 with Eps->0 so we can have the equivalence N ~ dN/du + dN/dv.  
 DNu = ||DN/du|| and DNv = ||DN/dv||  
 
 . if DNu IsNull (DNu <= Resolution from gp) the answer Done = True  
   the normal direction is given by DN/dv  
 . if DNv IsNull (DNv <= Resolution from gp) the answer Done = True  
   the normal direction is given by DN/du  
 . if the two directions DN/du and DN/dv are parallel Done = True  
   the normal direction is given either by DN/du or DN/dv.  
   To check that the two directions are colinear the sinus of the  
   angle between these directions is computed and compared with  
   SinTol.  
 . if DNu/DNv or DNv/DNu is lower or equal than Real Epsilon  
   Done = False, the normal is undefined  
 . if DNu IsNull and DNv is Null Done = False, there is an  
   indetermination and we should do a limited developpement at  
   order 2 (it means that we cannot omit Eps).  
 . if DNu Is not Null and DNv Is not Null Done = False, there are  
   an infinity of normals at the considered point on the surface.") Normal;
		static void Normal (const gp_Vec & D1U,const gp_Vec & D1V,const gp_Vec & D2U,const gp_Vec & D2V,const gp_Vec & D2UV,const Standard_Real SinTol,Standard_Boolean & Done,CSLib_NormalStatus & Status,gp_Dir & Normal);
		%feature("autodoc", "Args:
	D1U(gp_Vec)
	D1V(gp_Vec)
	MagTol(Standard_Real)
	Status(CSLib_NormalStatus)
	Normal(gp_Dir)

Returns:
	static void

Computes the normal direction of a surface as the cross product  
 between D1U and D1V.") Normal;
		static void Normal (const gp_Vec & D1U,const gp_Vec & D1V,const Standard_Real MagTol,CSLib_NormalStatus & Status,gp_Dir & Normal);
		%feature("autodoc", "Args:
	MaxOrder(Standard_Integer)
	DerNUV(TColgp_Array2OfVec)
	MagTol(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	Umin(Standard_Real)
	Umax(Standard_Real)
	Vmin(Standard_Real)
	Vmax(Standard_Real)
	Status(CSLib_NormalStatus)
	Normal(gp_Dir)
	OrderU(Standard_Integer)
	OrderV(Standard_Integer)

Returns:
	static void

find the first  order k0  of deriviative of NUV  
 where: foreach order < k0  all the derivatives of NUV  are  
 null all the derivatives of NUV corresponding to the order  
 k0 are collinear and have the same sens.  
 In this case, normal at U,V is unique.") Normal;
		static void Normal (const Standard_Integer MaxOrder,const TColgp_Array2OfVec & DerNUV,const Standard_Real MagTol,const Standard_Real U,const Standard_Real V,const Standard_Real Umin,const Standard_Real Umax,const Standard_Real Vmin,const Standard_Real Vmax,CSLib_NormalStatus & Status,gp_Dir & Normal,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Nu(Standard_Integer)
	Nv(Standard_Integer)
	DerSurf(TColgp_Array2OfVec)

Returns:
	static gp_Vec

-- Computes the derivative  of order Nu in the --  
        direction U and Nv in the direction V of the not --  
        normalized  normal vector at  the point  P(U,V) The  
        array DerSurf contain the derivative (i,j) of the surface  
        for i=0,Nu+1 ; j=0,Nv+1") DNNUV;
		static gp_Vec DNNUV (const Standard_Integer Nu,const Standard_Integer Nv,const TColgp_Array2OfVec & DerSurf);
		%feature("autodoc", "Args:
	Nu(Standard_Integer)
	Nv(Standard_Integer)
	DerSurf1(TColgp_Array2OfVec)
	DerSurf2(TColgp_Array2OfVec)

Returns:
	static gp_Vec

Computes the derivatives of order Nu in the direction Nu  
          and Nv in the direction Nv of the not normalized vector  
          N(u,v) = dS1/du * dS2/dv (cases where we use an osculating surface)  
          DerSurf1 are the derivatives of S1") DNNUV;
		static gp_Vec DNNUV (const Standard_Integer Nu,const Standard_Integer Nv,const TColgp_Array2OfVec & DerSurf1,const TColgp_Array2OfVec & DerSurf2);
		%feature("autodoc", "Args:
	Nu(Standard_Integer)
	Nv(Standard_Integer)
	DerNUV(TColgp_Array2OfVec)
	Iduref(Standard_Integer)=0
	Idvref(Standard_Integer)=0

Returns:
	static gp_Vec

-- Computes the derivative  of order Nu in the --  
        direction   U and  Nv in the  direction  V  of the  
        normalized normal vector  at the point P(U,V) array  
        DerNUV contain the  derivative  (i+Iduref,j+Idvref)  
        of D1U ^ D1V for i=0,Nu  ; j=0,Nv Iduref and Idvref  
        correspond to a derivative  of D1U ^ D1V  which can  
        be used to compute the normalized normal vector.  
        In the regular cases , Iduref=Idvref=0.") DNNormal;
		static gp_Vec DNNormal (const Standard_Integer Nu,const Standard_Integer Nv,const TColgp_Array2OfVec & DerNUV,const Standard_Integer Iduref = 0,const Standard_Integer Idvref = 0);
};


%feature("shadow") CSLib::~CSLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend CSLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor CSLib_Class2d;
class CSLib_Class2d {
	public:
		%feature("autodoc", "Args:
	TP(TColgp_Array1OfPnt2d)
	aTolu(Standard_Real)
	aTolv(Standard_Real)
	umin(Standard_Real)
	vmin(Standard_Real)
	umax(Standard_Real)
	vmax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") CSLib_Class2d;
		 CSLib_Class2d (const TColgp_Array1OfPnt2d & TP,const Standard_Real aTolu,const Standard_Real aTolv,const Standard_Real umin,const Standard_Real vmin,const Standard_Real umax,const Standard_Real vmax);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Integer

No detailed docstring for this function.") SiDans;
		Standard_Integer SiDans (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") SiDans_OnMode;
		Standard_Integer SiDans_OnMode (const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") InternalSiDans;
		Standard_Integer InternalSiDans (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") InternalSiDansOuOn;
		Standard_Integer InternalSiDansOuOn (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	Other(CSLib_Class2d)

Returns:
	CSLib_Class2d

No detailed docstring for this function.") Copy;
		const CSLib_Class2d & Copy (const CSLib_Class2d & Other);
		%feature("autodoc", "Args:
	Other(CSLib_Class2d)

Returns:
	CSLib_Class2d

No detailed docstring for this function.") operator=;
		const CSLib_Class2d & operator = (const CSLib_Class2d & Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") CSLib_Class2d::~CSLib_Class2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend CSLib_Class2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor CSLib_NormalPolyDef;
class CSLib_NormalPolyDef : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	k0(Standard_Integer)
	li(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") CSLib_NormalPolyDef;
		 CSLib_NormalPolyDef (const Standard_Integer k0,const TColStd_Array1OfReal & li);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

computes the value <F>of the function for the variable <X>.  
         Returns True if the calculation were successfully done,  
         False otherwise.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

computes the derivative <D> of the function  
         for the variable <X>.  
          Returns True if the calculation were successfully done,  
          False otherwise.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

computes the value <F> and the derivative <D> of the  
         function for the variable <X>.  
         Returns True if the calculation were successfully done,  
         False otherwise.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") CSLib_NormalPolyDef::~CSLib_NormalPolyDef %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend CSLib_NormalPolyDef {
	void _kill_pointed() {
		delete $self;
	}
};
