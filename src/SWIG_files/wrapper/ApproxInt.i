/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") ApproxInt

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include ApproxInt_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor ApproxInt_SvSurfaces;
class ApproxInt_SvSurfaces {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* returns True if Tg,Tguv1 Tguv2 can be computed.

	:param u1:
	:type u1: float &
	:param v1:
	:type v1: float &
	:param u2:
	:type u2: float &
	:param v2:
	:type v2: float &
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool
") Compute;
		virtual Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") Pnt;
		virtual void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool
") Tangency;
		virtual Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf1;
		virtual Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf2;
		virtual Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%extend ApproxInt_SvSurfaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
