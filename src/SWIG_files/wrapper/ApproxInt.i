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
#include<Message_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

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
		/**** md5 signature: 49c65485e14fc730360039ad6109a047 ****/
		%feature("compactdefaultargs") BuildKnots;
		%feature("autodoc", "Main function to build optimal knot sequence. at least one set from (thepntsxyz, thepntsu1v1, thepntsu2v2) should exist. @param thepntsxyz - set of 3d points. @param thepntsu1v1 - set of 2d points. @param thepntsu2v2 - set of 2d points. @param thepars - expected parameters assoiated with set. @param theapproxxyz - flag, existence of 3d set. @param theapproxu1v1 - flag existence of first 2d set. @param theapproxu2v2 - flag existence of second 2d set. @param theminnbpnts - minimal number of points per knot interval. @param theknots - output knots sequence.

Parameters
----------
thePntsXYZ: TColgp_Array1OfPnt
thePntsU1V1: TColgp_Array1OfPnt2d
thePntsU2V2: TColgp_Array1OfPnt2d
thePars: math_Vector
theApproxXYZ: bool
theApproxU1V1: bool
theApproxU2V2: bool
theMinNbPnts: int
theKnots: NCollection_Vector<int>

Returns
-------
None
") BuildKnots;
		static void BuildKnots(const TColgp_Array1OfPnt & thePntsXYZ, const TColgp_Array1OfPnt2d & thePntsU1V1, const TColgp_Array1OfPnt2d & thePntsU2V2, const math_Vector & thePars, const Standard_Boolean theApproxXYZ, const Standard_Boolean theApproxU1V1, const Standard_Boolean theApproxU2V2, const Standard_Integer theMinNbPnts, NCollection_Vector<Standard_Integer> & theKnots);

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
		/**** md5 signature: 9bdd8cb0fe1ff936e14f942b7906c8f7 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns true if tg,tguv1 tguv2 can be computed.

Parameters
----------
Pt: gp_Pnt
Tg: gp_Vec
Tguv1: gp_Vec2d
Tguv2: gp_Vec2d

Returns
-------
u1: float
v1: float
u2: float
v2: float
") Compute;
		virtual Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****************** Pnt ******************/
		/**** md5 signature: 16f6732cc231fab7357ba8adcca3b24d ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
P: gp_Pnt

Returns
-------
None
") Pnt;
		virtual void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);

		/****************** SeekPoint ******************/
		/**** md5 signature: 8aa752ba1a03beb45a63885928b32852 ****/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "Computes point on curve and parameters on the surfaces.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Point: IntSurf_PntOn2S

Returns
-------
bool
") SeekPoint;
		virtual Standard_Boolean SeekPoint(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, IntSurf_PntOn2S & Point);

		/****************** Tangency ******************/
		/**** md5 signature: 2d07e542429be7042ab790c78def5d62 ****/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec

Returns
-------
bool
") Tangency;
		virtual Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);

		/****************** TangencyOnSurf1 ******************/
		/**** md5 signature: ee7bf3b7674ea843f917140a18295d41 ****/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Returns
-------
bool
") TangencyOnSurf1;
		virtual Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

		/****************** TangencyOnSurf2 ******************/
		/**** md5 signature: f01fe4b58e226a7dd00bc8969effe750 ****/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "No available documentation.

Parameters
----------
u1: float
v1: float
u2: float
v2: float
Tg: gp_Vec2d

Returns
-------
bool
") TangencyOnSurf2;
		virtual Standard_Boolean TangencyOnSurf2(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);

};


%extend ApproxInt_SvSurfaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
