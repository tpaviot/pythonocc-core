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
%define HERMITDOCSTRING
"Hermit module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_hermit.html"
%enddef
%module (package="OCC.Core", docstring=HERMITDOCSTRING) Hermit


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
#include<Hermit_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Geom2d.i

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

/***************
* class Hermit *
***************/
%rename(hermit) Hermit;
class Hermit {
	public:
		/****************** Solution ******************/
		/**** md5 signature: 09f17358299a55b10621c9b761fd7966 ****/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "Returns the correct spline a(u) which will be multiplicated with bs later.

Parameters
----------
BS: Geom_BSplineCurve
TolPoles: float,optional
	default value is 0.000001
TolKnots: float,optional
	default value is 0.000001

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Solution;
		static opencascade::handle<Geom2d_BSplineCurve> Solution(const opencascade::handle<Geom_BSplineCurve> & BS, const Standard_Real TolPoles = 0.000001, const Standard_Real TolKnots = 0.000001);

		/****************** Solution ******************/
		/**** md5 signature: 49129ffe8056f7bced41bcc0d1d841e1 ****/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "Returns the correct spline a(u) which will be multiplicated with bs later.

Parameters
----------
BS: Geom2d_BSplineCurve
TolPoles: float,optional
	default value is 0.000001
TolKnots: float,optional
	default value is 0.000001

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Solution;
		static opencascade::handle<Geom2d_BSplineCurve> Solution(const opencascade::handle<Geom2d_BSplineCurve> & BS, const Standard_Real TolPoles = 0.000001, const Standard_Real TolKnots = 0.000001);

		/****************** Solutionbis ******************/
		/**** md5 signature: 3bce282eb0b1307dc53349f35dd12afa ****/
		%feature("compactdefaultargs") Solutionbis;
		%feature("autodoc", "Returns the knots to insert to a(u) to stay with a constant sign and in the tolerances.

Parameters
----------
BS: Geom_BSplineCurve
TolPoles: float,optional
	default value is 0.000001
TolKnots: float,optional
	default value is 0.000001

Returns
-------
Knotmin: float
Knotmax: float
") Solutionbis;
		static void Solutionbis(const opencascade::handle<Geom_BSplineCurve> & BS, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real TolPoles = 0.000001, const Standard_Real TolKnots = 0.000001);

};


%extend Hermit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
