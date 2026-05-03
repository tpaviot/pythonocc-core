/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOMLPROPDOCSTRING
"GeomLProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomlprop.html"
%enddef
%module (package="OCC.Core", docstring=GEOMLPROPDOCSTRING) GeomLProp


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<GeomLProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<LProp_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import GeomAbs.i
%import LProp.i
%import Geom2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class DirectAccess *
*********************/
/******************
* class GeomLProp *
******************/
%rename(geomlprop) GeomLProp;
class GeomLProp {
	public:
		/****** GeomLProp::Continuity ******/
		/****** md5 signature: 5c79eb6c793322b0a2934dfa85d1c2fb ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
u1: double
u2: double
r1: bool
r2: bool
tl: double
ta: double

Return
-------
GeomAbs_Shape

Description
-----------
Computes the regularity at the junction between C1 and C2. The booleans r1 and r2 are true if the curves must be taken reversed. The point u1 on C1 and the point u2 on C2 must be confused. tl and ta are the linear and angular tolerance used two compare the derivative.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const double u1, const double u2, const bool r1, const bool r2, const double tl, const double ta);

		/****** GeomLProp::Continuity ******/
		/****** md5 signature: 41b097b26427f46a13874679e26f1b9d ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
u1: double
u2: double
r1: bool
r2: bool

Return
-------
GeomAbs_Shape

Description
-----------
The same as preceding but using the standard tolerances from package Precision.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const double u1, const double u2, const bool r1, const bool r2);

};


%extend GeomLProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomLProp_CLPropsBase *
******************************/
/******************************
* class GeomLProp_CurAndInf2d *
******************************/
class GeomLProp_CurAndInf2d : public LProp_CurAndInf {
	public:
		/****** GeomLProp_CurAndInf2d::GeomLProp_CurAndInf2d ******/
		/****** md5 signature: 8d518a5efd76ae1d3c989fe352e9758b ******/
		%feature("compactdefaultargs") GeomLProp_CurAndInf2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the framework. Note: The curve on which the local properties are computed is defined using one of the following functions: Perform, PerformCurExt or PerformInf.
") GeomLProp_CurAndInf2d;
		 GeomLProp_CurAndInf2d();

		/****** GeomLProp_CurAndInf2d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the solutions are found.
") IsDone;
		bool IsDone();

		/****** GeomLProp_CurAndInf2d::Perform ******/
		/****** md5 signature: 73c4da745f6865598366f5736e497c1a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
For the curve C, Computes both the inflection points and the maximum and minimum curvatures.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & C);

		/****** GeomLProp_CurAndInf2d::PerformCurExt ******/
		/****** md5 signature: 0581e10445ee1f46584d14d92dfd7071 ******/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
For the curve C, Computes the locals extremas of curvature.
") PerformCurExt;
		void PerformCurExt(const opencascade::handle<Geom2d_Curve> & C);

		/****** GeomLProp_CurAndInf2d::PerformInf ******/
		/****** md5 signature: eed298f24ef1721b5df8387520329d0e ******/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
For the curve C, Computes the inflections. After computation, the following functions can be used: - IsDone to check if the computation was successful - NbPoints to obtain the number of computed particular points - Parameter to obtain the parameter on the curve for each particular point - Type to check if the point is an inflection point or an extremum of curvature of the curve C. Warning These functions can be used to analyze a series of curves, however it is necessary to clear the table of results between each computation.
") PerformInf;
		void PerformInf(const opencascade::handle<Geom2d_Curve> & C);

};


%extend GeomLProp_CurAndInf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomLProp_SLPropsBase *
******************************/
/*******************
* class ToolAccess *
*******************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class GeomLProp_CLPropsBase:
	pass

@classnotwrapped
class GeomLProp_SLPropsBase:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geomlprop_Continuity(*args):
	return geomlprop.Continuity(*args)

@deprecated
def geomlprop_Continuity(*args):
	return geomlprop.Continuity(*args)

}
