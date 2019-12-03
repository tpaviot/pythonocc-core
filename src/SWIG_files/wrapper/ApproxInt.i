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
%define APPROXINTDOCSTRING
"ApproxInt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_approxint.html"
%enddef
%module (package="OCC.Core", docstring=APPROXINTDOCSTRING) ApproxInt


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
#include<ApproxInt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<math_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import math.i
%import gp.i
%import IntSurf.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class ApproxInt_KnotTools *
****************************/
class ApproxInt_KnotTools {
	public:
		/****************** BuildKnots ******************/
		%feature("compactdefaultargs") BuildKnots;
		%feature("autodoc", "* Main function to build optimal knot sequence. At least one set from (thePntsXYZ, thePntsU1V1, thePntsU2V2) should exist. @param thePntsXYZ - Set of 3d points. @param thePntsU1V1 - Set of 2d points. @param thePntsU2V2 - Set of 2d points. @param thePars - Expected parameters assoiated with set. @param theApproxXYZ - Flag, existence of 3d set. @param theApproxU1V1 - Flag existence of first 2d set. @param theApproxU2V2 - Flag existence of second 2d set. @param theMinNbPnts - Minimal number of points per knot interval. @param theKnots - output knots sequence.
	:param thePntsXYZ:
	:type thePntsXYZ: TColgp_Array1OfPnt
	:param thePntsU1V1:
	:type thePntsU1V1: TColgp_Array1OfPnt2d
	:param thePntsU2V2:
	:type thePntsU2V2: TColgp_Array1OfPnt2d
	:param thePars:
	:type thePars: math_Vector
	:param theApproxXYZ:
	:type theApproxXYZ: bool
	:param theApproxU1V1:
	:type theApproxU1V1: bool
	:param theApproxU2V2:
	:type theApproxU2V2: bool
	:param theMinNbPnts:
	:type theMinNbPnts: int
	:param theKnots:
	:type theKnots: NCollection_Vector<int>
	:rtype: void") BuildKnots;
		static void BuildKnots (const TColgp_Array1OfPnt & thePntsXYZ,const TColgp_Array1OfPnt2d & thePntsU1V1,const TColgp_Array1OfPnt2d & thePntsU2V2,const math_Vector & thePars,const Standard_Boolean theApproxXYZ,const Standard_Boolean theApproxU1V1,const Standard_Boolean theApproxU2V2,const Standard_Integer theMinNbPnts,NCollection_Vector<Standard_Integer> & theKnots);

};


%extend ApproxInt_KnotTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ApproxInt_SvSurfaces *
*****************************/
%nodefaultctor ApproxInt_SvSurfaces;
class ApproxInt_SvSurfaces {
	public:
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* returns True if Tg,Tguv1 Tguv2 can be computed.
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool") Compute;
		virtual Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") Pnt;
		virtual void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);

		/****************** SeekPoint ******************/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "* computes point on curve and parameters on the surfaces
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Point:
	:type Point: IntSurf_PntOn2S
	:rtype: bool") SeekPoint;
		virtual Standard_Boolean SeekPoint (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,IntSurf_PntOn2S & Point);

		/****************** Tangency ******************/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool") Tangency;
		virtual Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);

		/****************** TangencyOnSurf1 ******************/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool") TangencyOnSurf1;
		virtual Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);

		/****************** TangencyOnSurf2 ******************/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", ":param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool") TangencyOnSurf2;
		virtual Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);

};


%extend ApproxInt_SvSurfaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
