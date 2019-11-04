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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define HERMITDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=HERMITDOCSTRING) Hermit

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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

/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(hermit) Hermit;
class Hermit {
	public:
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "	* returns the correct spline a(u) which will be multiplicated with BS later.

	:param BS:
	:type BS: opencascade::handle<Geom_BSplineCurve> &
	:param TolPoles: default value is 0.000001
	:type TolPoles: float
	:param TolKnots: default value is 0.000001
	:type TolKnots: float
	:rtype: opencascade::handle<Geom2d_BSplineCurve>
") Solution;
		static opencascade::handle<Geom2d_BSplineCurve> Solution (const opencascade::handle<Geom_BSplineCurve> & BS,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "	* returns the correct spline a(u) which will be multiplicated with BS later.

	:param BS:
	:type BS: opencascade::handle<Geom2d_BSplineCurve> &
	:param TolPoles: default value is 0.000001
	:type TolPoles: float
	:param TolKnots: default value is 0.000001
	:type TolKnots: float
	:rtype: opencascade::handle<Geom2d_BSplineCurve>
") Solution;
		static opencascade::handle<Geom2d_BSplineCurve> Solution (const opencascade::handle<Geom2d_BSplineCurve> & BS,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
		%feature("compactdefaultargs") Solutionbis;
		%feature("autodoc", "	* returns the knots to insert to a(u) to stay with a constant sign and in the tolerances.

	:param BS:
	:type BS: opencascade::handle<Geom_BSplineCurve> &
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
		static void Solutionbis (const opencascade::handle<Geom_BSplineCurve> & BS,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real TolPoles = 0.000001,const Standard_Real TolKnots = 0.000001);
};


%extend Hermit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
