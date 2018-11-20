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
%define HERMITDOCSTRING
"This is used to reparameterize Rational BSpline
Curves so that we can  concatenate them later to
build C1 Curves It builds and 1D-reparameterizing
function starting from an Hermite interpolation and
adding knots and modifying poles of the 1D BSpline
obtained that way. The goal is to build a(u) so that
if we consider a BSpline curve
N(u)
f(u) = -
D(u)

the function a(u)D(u) has value 1 at the umin and umax
and has 0.0e0 derivative value a umin and umax.
The details of the computation occuring in this package
can be found by reading :
' Etude sur la concatenation de NURBS en vue du
balayage de surfaces' PFE n S85 Ensam Lille"
%enddef
%module (package="OCC.Core", docstring=HERMITDOCSTRING) Hermit

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
%include ../common/OccHandle.i


%include Hermit_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%rename(hermit) Hermit;
class Hermit {
	public:
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "	* returns the correct spline a(u) which will be multiplicated with BS later.

	:param BS:
	:type BS: Handle_Geom_BSplineCurve &
	:param TolPoles: default value is 0.000001
	:type TolPoles: float
	:param TolKnots: default value is 0.000001
	:type TolKnots: float
	:rtype: Handle_Geom2d_BSplineCurve
") Solution;
		static Handle_Geom2d_BSplineCurve Solution (const Handle_Geom_BSplineCurve & BS,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "	* returns the correct spline a(u) which will be multiplicated with BS later.

	:param BS:
	:type BS: Handle_Geom2d_BSplineCurve &
	:param TolPoles: default value is 0.000001
	:type TolPoles: float
	:param TolKnots: default value is 0.000001
	:type TolKnots: float
	:rtype: Handle_Geom2d_BSplineCurve
") Solution;
		static Handle_Geom2d_BSplineCurve Solution (const Handle_Geom2d_BSplineCurve & BS,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
		%feature("compactdefaultargs") Solutionbis;
		%feature("autodoc", "	* returns the knots to insert to a(u) to stay with a constant sign and in the tolerances.

	:param BS:
	:type BS: Handle_Geom_BSplineCurve &
	:param Knotmin:
	:type Knotmin: float &
	:param Knotmax:
	:type Knotmax: float &
	:param TolPoles: default value is 0.000001
	:type TolPoles: float
	:param TolKnots: default value is 0.000001
	:type TolKnots: float
	:rtype: void
") Solutionbis;
		static void Solutionbis (const Handle_Geom_BSplineCurve & BS,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
};


%extend Hermit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
