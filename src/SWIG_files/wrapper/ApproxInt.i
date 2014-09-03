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
%module (package="OCC") ApproxInt

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

%include ApproxInt_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor ApproxInt_SvSurfaces;
class ApproxInt_SvSurfaces {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Pt(gp_Pnt)
	Tg(gp_Vec)
	Tguv1(gp_Vec2d)
	Tguv2(gp_Vec2d)

Returns:
	virtual Standard_Boolean

returns True if Tg,Tguv1 Tguv2 can be computed.") Compute;
		virtual Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

No detailed docstring for this function.") Pnt;
		virtual void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Tangency;
		virtual Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec2d)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") TangencyOnSurf1;
		virtual Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("autodoc", "Args:
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	Tg(gp_Vec2d)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") TangencyOnSurf2;
		virtual Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%feature("shadow") ApproxInt_SvSurfaces::~ApproxInt_SvSurfaces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ApproxInt_SvSurfaces {
	void _kill_pointed() {
		delete $self;
	}
};
