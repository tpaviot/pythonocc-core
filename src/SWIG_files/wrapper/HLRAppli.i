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
%define HLRAPPLIDOCSTRING
"HLRAppli module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_hlrappli.html"
%enddef
%module (package="OCC.Core", docstring=HLRAPPLIDOCSTRING) HLRAppli


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
#include<HLRAppli_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<HLRBRep_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Extrema_module.hxx>
#include<IntSurf_module.hxx>
#include<HLRAlgo_module.hxx>
#include<BRepTopAdaptor_module.hxx>
#include<HLRTopoBRep_module.hxx>
#include<TopLoc_module.hxx>
#include<Contap_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import HLRBRep.i

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

/******************************
* class HLRAppli_ReflectLines *
******************************/
class HLRAppli_ReflectLines {
	public:
		/****************** HLRAppli_ReflectLines ******************/
		/**** md5 signature: c68fdca60efe22186684369fafa6346f ****/
		%feature("compactdefaultargs") HLRAppli_ReflectLines;
		%feature("autodoc", "Constructor.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") HLRAppli_ReflectLines;
		 HLRAppli_ReflectLines(const TopoDS_Shape & aShape);

		/****************** GetCompoundOf3dEdges ******************/
		/**** md5 signature: 56814c9f5f74fb78cdeb6b9ce73f3eda ****/
		%feature("compactdefaultargs") GetCompoundOf3dEdges;
		%feature("autodoc", "Returns resulting compound of lines of specified type and visibility represented by edges in 3d or 2d.

Parameters
----------
type: HLRBRep_TypeOfResultingEdge
visible: bool
In3d: bool

Returns
-------
TopoDS_Shape
") GetCompoundOf3dEdges;
		TopoDS_Shape GetCompoundOf3dEdges(const HLRBRep_TypeOfResultingEdge type, const Standard_Boolean visible, const Standard_Boolean In3d);

		/****************** GetResult ******************/
		/**** md5 signature: 61ceaea87a267f8cb3587a019bfaa140 ****/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Returns resulting compound of reflect lines represented by edges in 3d.

Returns
-------
TopoDS_Shape
") GetResult;
		TopoDS_Shape GetResult();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetAxes ******************/
		/**** md5 signature: 4220cc44329eacefbd57c3d09a70953f ****/
		%feature("compactdefaultargs") SetAxes;
		%feature("autodoc", "Sets the normal to the plane of visualisation, the coordinates of the view point and the coordinates of the vertical direction vector.

Parameters
----------
Nx: float
Ny: float
Nz: float
XAt: float
YAt: float
ZAt: float
XUp: float
YUp: float
ZUp: float

Returns
-------
None
") SetAxes;
		void SetAxes(const Standard_Real Nx, const Standard_Real Ny, const Standard_Real Nz, const Standard_Real XAt, const Standard_Real YAt, const Standard_Real ZAt, const Standard_Real XUp, const Standard_Real YUp, const Standard_Real ZUp);

};


%extend HLRAppli_ReflectLines {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
