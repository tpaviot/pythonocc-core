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
%module GeomProjLib

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

%include GeomProjLib_required_python_modules.i
%include GeomProjLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomprojlib) GeomProjLib;
%nodefaultctor GeomProjLib;
class GeomProjLib {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	S(Handle_Geom_Surface)
	UFirst(Standard_Real)
	ULast(Standard_Real)
	VFirst(Standard_Real)
	VLast(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	static Handle_Geom2d_Curve

gives  the 2d-curve   of  a 3d-curve  lying on   a  
         surface (  uses GeomProjLib_ProjectedCurve   )  
         The 3dCurve is taken between the parametrization  
         range [First, Last]  
         <Tolerance> is used as input if the projection needs  
         an approximation. In this case, the reached  
         tolerance is set in <Tolerance> as output.  
         WARNING :  if   the projection has  failed,   this  
         method returns a null Handle.") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last,const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	S(Handle_Geom_Surface)
	Tolerance(Standard_Real)

Returns:
	static Handle_Geom2d_Curve

gives  the 2d-curve   of  a 3d-curve  lying on   a  
         surface (  uses GeomProjLib_ProjectedCurve   )  
         The 3dCurve is taken between the parametrization  
         range [First, Last]  
         <Tolerance> is used as input if the projection needs  
         an approximation. In this case, the reached  
         tolerance is set in <Tolerance> as output.  
         WARNING :  if   the projection has  failed,   this  
         method returns a null Handle.") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last,const Handle_Geom_Surface & S,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	S(Handle_Geom_Surface)

Returns:
	static Handle_Geom2d_Curve

gives  the 2d-curve   of  a 3d-curve  lying on   a  
         surface (  uses GeomProjLib_ProjectedCurve   )  
         The 3dCurve is taken between the parametrization  
         range [First, Last]  
         If the projection needs an approximation,  
         Precision::PApproximation() is used.  
         WARNING :  if   the projection has  failed,   this  
         method returns a null Handle.") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	S(Handle_Geom_Surface)

Returns:
	static Handle_Geom2d_Curve

gives  the  2d-curve  of  a  3d-curve lying   on a  
         surface   ( uses   GeomProjLib_ProjectedCurve ).  
         If the projection needs an approximation,  
         Precision::PApproximation() is used.  
         WARNING  :  if the   projection has  failed,  this  
         method returns a null Handle.") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	S(Handle_Geom_Surface)
	UDeb(Standard_Real)
	UFin(Standard_Real)
	VDeb(Standard_Real)
	VFin(Standard_Real)

Returns:
	static Handle_Geom2d_Curve

gives  the  2d-curve  of  a  3d-curve lying   on a  
         surface   ( uses   GeomProjLib_ProjectedCurve ).  
         If the projection needs an approximation,  
         Precision::PApproximation() is used.  
         WARNING  :  if the   projection has  failed,  this  
         method returns a null Handle.  
         can expand a little the bounds of surface") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S,const Standard_Real UDeb,const Standard_Real UFin,const Standard_Real VDeb,const Standard_Real VFin);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	S(Handle_Geom_Surface)
	UDeb(Standard_Real)
	UFin(Standard_Real)
	VDeb(Standard_Real)
	VFin(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	static Handle_Geom2d_Curve

gives  the  2d-curve  of  a  3d-curve lying   on a  
         surface   ( uses   GeomProjLib_ProjectedCurve ).  
         If the projection needs an approximation,  
         Precision::PApproximation() is used.  
         WARNING  :  if the   projection has  failed,  this  
         method returns a null Handle.  
         can expand a little the bounds of surface") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S,const Standard_Real UDeb,const Standard_Real UFin,const Standard_Real VDeb,const Standard_Real VFin,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	S(Handle_Geom_Surface)

Returns:
	static Handle_Geom_Curve

Constructs   the  3d-curve  from the normal  
         projection  of the  Curve <C> on  the surface <S>.  
         WARNING : if the  projection has failes returns  a  
         null Handle.") Project;
		static Handle_Geom_Curve Project (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	Plane(Handle_Geom_Plane)
	Dir(gp_Dir)
	KeepParametrization(Standard_Boolean)

Returns:
	static Handle_Geom_Curve

Constructs  the 3d-curves from the projection  
         of the  curve  <Curve> on the  plane <Plane> along  
         the direction <Dir>.  
         If <KeepParametrization> is true, the parametrization  
         of the Projected Curve <PC> will be  the same as  the  
         parametrization of the initial curve <C>.  
         It meens: proj(C(u)) = PC(u) for each u.  
         Otherwize, the parametrization may change.") ProjectOnPlane;
		static Handle_Geom_Curve ProjectOnPlane (const Handle_Geom_Curve & Curve,const Handle_Geom_Plane & Plane,const gp_Dir & Dir,const Standard_Boolean KeepParametrization);
};


%feature("shadow") GeomProjLib::~GeomProjLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomProjLib {
	void _kill_pointed() {
		delete $self;
	}
};
