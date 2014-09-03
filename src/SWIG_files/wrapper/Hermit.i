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
%module (package="OCC") Hermit

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

%include Hermit_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(hermit) Hermit;
%nodefaultctor Hermit;
class Hermit {
	public:
		%feature("autodoc", "Args:
	BS(Handle_Geom_BSplineCurve)
	TolPoles(Standard_Real)=0.000001
	TolKnots(Standard_Real)=0.000001

Returns:
	static Handle_Geom2d_BSplineCurve

//!returns the correct spline a(u) which will  
                be multiplicated with BS later.") Solution;
		static Handle_Geom2d_BSplineCurve Solution (const Handle_Geom_BSplineCurve & BS,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
		%feature("autodoc", "Args:
	BS(Handle_Geom2d_BSplineCurve)
	TolPoles(Standard_Real)=0.000001
	TolKnots(Standard_Real)=0.000001

Returns:
	static Handle_Geom2d_BSplineCurve

//!returns the correct spline a(u) which will  
                be multiplicated with BS later.") Solution;
		static Handle_Geom2d_BSplineCurve Solution (const Handle_Geom2d_BSplineCurve & BS,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
		%feature("autodoc", "Args:
	BS(Handle_Geom_BSplineCurve)
	Knotmin(Standard_Real)
	Knotmax(Standard_Real)
	TolPoles(Standard_Real)=0.000001
	TolKnots(Standard_Real)=0.000001

Returns:
	static void

//!returns the knots to insert to a(u) to  
        stay with a constant sign and in the  
        tolerances.") Solutionbis;
		static void Solutionbis (const Handle_Geom_BSplineCurve & BS,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
};


%feature("shadow") Hermit::~Hermit %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hermit {
	void _kill_pointed() {
		delete $self;
	}
};
