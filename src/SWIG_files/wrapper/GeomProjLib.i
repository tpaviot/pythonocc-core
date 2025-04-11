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
		/****** md5 signature: 623659a558b10587135187bd163c99ea ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: float
Last: float
S: Geom_Surface
UFirst: float
ULast: float
VFirst: float
VLast: float

Return
-------
Tolerance: float

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ) The 3dCurve is taken between the parametrization range [First, Last] <Tolerance> is used as input if the projection needs an approximation. In this case, the reached tolerance is set in <Tolerance> as output. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const Standard_Real First, const Standard_Real Last, const opencascade::handle<Geom_Surface> & S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast, Standard_Real &OutValue);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 16445a6ccd20cb82384bac47f959e21e ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: float
Last: float
S: Geom_Surface

Return
-------
Tolerance: float

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ) The 3dCurve is taken between the parametrization range [First, Last] <Tolerance> is used as input if the projection needs an approximation. In this case, the reached tolerance is set in <Tolerance> as output. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const Standard_Real First, const Standard_Real Last, const opencascade::handle<Geom_Surface> & S, Standard_Real &OutValue);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 778b5e374ce3577a9c2c331162cd49e7 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: float
Last: float
S: Geom_Surface

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ) The 3dCurve is taken between the parametrization range [First, Last] If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const Standard_Real First, const Standard_Real Last, const opencascade::handle<Geom_Surface> & S);

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
gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ). If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 6b78aae098ed555c42d1ed97a8778340 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface
UDeb: float
UFin: float
VDeb: float
VFin: float

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ). If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle. can expand a little the bounds of surface.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S, const Standard_Real UDeb, const Standard_Real UFin, const Standard_Real VDeb, const Standard_Real VFin);

		/****** GeomProjLib::Curve2d ******/
		/****** md5 signature: 3b75a4d608950f79c7ba3f66720b604f ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
S: Geom_Surface
UDeb: float
UFin: float
VDeb: float
VFin: float

Return
-------
Tolerance: float

Description
-----------
gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ). If the projection needs an approximation, Precision::PApproximation() is used. WARNING: if the projection has failed, this method returns a null Handle. can expand a little the bounds of surface.
") Curve2d;
		static opencascade::handle<Geom2d_Curve> Curve2d(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S, const Standard_Real UDeb, const Standard_Real UFin, const Standard_Real VDeb, const Standard_Real VFin, Standard_Real &OutValue);

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
		/****** md5 signature: cbb13e670d730f1fffc13379697518e5 ******/
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
		static opencascade::handle<Geom_Curve> ProjectOnPlane(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Plane> & Plane, const gp_Dir & Dir, const Standard_Boolean KeepParametrization);

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
