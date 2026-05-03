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
%define GEOMPROJLIBDOCSTRING
"GeomProjLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomprojlib.html"
%enddef
%module (package="OCC.Core", docstring=GEOMPROJLIBDOCSTRING) GeomProjLib


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
#include<GeomProjLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Geom2d.i
%import gp.i

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

/********************
* class GeomProjLib *
********************/
%rename(geomprojlib) GeomProjLib;
class GeomProjLib {
	public:
		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 15b2b7969df81e90b1cbfedc634fd631 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: double
Last: double
S: Geom_Surface
UFirst: double
ULast: double
VFirst: double
VLast: double

Return
-------
Tolerance: double

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface (uses GeomProjLib_ProjectedCurve) The 3dCurve is taken between the parametrization range [First, Last] <Tolerance> is used as input if the projection needs an approximation. In this case, the reached tolerance is set in <Tolerance> as output. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const double First, const double Last, const opencascade::handle<Geom_Surface> & S, const double UFirst, const double ULast, const double VFirst, const double VLast, Standard_Real &OutValue);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: fc532c0df007d1d8508799df98ccf354 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: double
Last: double
S: Geom_Surface

Return
-------
Tolerance: double

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface (uses GeomProjLib_ProjectedCurve) The 3dCurve is taken between the parametrization range [First, Last] <Tolerance> is used as input if the projection needs an approximation. In this case, the reached tolerance is set in <Tolerance> as output. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const double First, const double Last, const opencascade::handle<Geom_Surface> & S, Standard_Real &OutValue);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 12ce5f38d02cc65e903b0ab3ee723600 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: double
Last: double
S: Geom_Surface

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface (uses GeomProjLib_ProjectedCurve) The 3dCurve is taken between the parametrization range [First, Last] If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const double First, const double Last, const opencascade::handle<Geom_Surface> & S);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: e2922f393a23ef1a26996de727da93cd ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface (uses GeomProjLib_ProjectedCurve) If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 19698d34b8364a844c087490b170df18 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface
UDeb: double
UFin: double
VDeb: double
VFin: double

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface (uses GeomProjLib_ProjectedCurve) If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle. can expand a little the bounds of surface.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S, const double UDeb, const double UFin, const double VDeb, const double VFin);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 7d98f1537257402a352e2b17d95b0cf2 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface
UDeb: double
UFin: double
VDeb: double
VFin: double

Return
-------
Tolerance: double

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface (uses GeomProjLib_ProjectedCurve) If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle. can expand a little the bounds of surface.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S, const double UDeb, const double UFin, const double VDeb, const double VFin, Standard_Real &OutValue);

		/****** GeomProjLib::Project ******/
		/****** md5 signature: 6bc2a63694c3bb1ffb84bc5bd6bfc7cc ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Constructs the 3d-curve from the normal projection of the Curve <C> on the surface <S>. WARNING: if the projection has failed, returns a null Handle.
") Project;
		static opencascade::handle<Geom_Curve> Project(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****** GeomProjLib::ProjectOnPlane ******/
		/****** md5 signature: e0407b7ef216f7faaa0e527b5fa3953f ******/
		%feature("compactdefaultargs") ProjectOnPlane;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Plane: Geom_Plane
Dir: gp_Dir
KeepParametrization: bool

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Constructs the 3d-curves from the projection of the curve <Curve> on the plane <Plane> along the direction <Dir>. If <KeepParametrization> is true, the parametrization of the Projected Curve <PC> will be the same as the parametrization of the initial curve <C>. It means: proj(C(u)) = PC(u) for each u. Otherwise, the parametrization may change.
") ProjectOnPlane;
		static opencascade::handle<Geom_Curve> ProjectOnPlane(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Plane> & Plane, const gp_Dir & Dir, const bool KeepParametrization);

};


%extend GeomProjLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geomprojlib_Curve2d(*args):
	return geomprojlib.Curve2d(*args)

@deprecated
def geomprojlib_Curve2d(*args):
	return geomprojlib.Curve2d(*args)

@deprecated
def geomprojlib_Curve2d(*args):
	return geomprojlib.Curve2d(*args)

@deprecated
def geomprojlib_Curve2d(*args):
	return geomprojlib.Curve2d(*args)

@deprecated
def geomprojlib_Curve2d(*args):
	return geomprojlib.Curve2d(*args)

@deprecated
def geomprojlib_Curve2d(*args):
	return geomprojlib.Curve2d(*args)

@deprecated
def geomprojlib_Project(*args):
	return geomprojlib.Project(*args)

@deprecated
def geomprojlib_ProjectOnPlane(*args):
	return geomprojlib.ProjectOnPlane(*args)

}
