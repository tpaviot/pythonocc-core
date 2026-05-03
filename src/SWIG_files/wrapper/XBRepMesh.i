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
%define XBREPMESHDOCSTRING
"XBRepMesh module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_xbrepmesh.html"
%enddef
%module (package="OCC.Core", docstring=XBREPMESHDOCSTRING) XBRepMesh


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
#include<XBRepMesh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepMesh_module.hxx>
#include<TopoDS_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<IMeshTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepMesh.i
%import TopoDS.i

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
%wrap_handle(XBRepMesh_Factory)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************
* class XBRepMesh_Factory *
**************************/
class XBRepMesh_Factory : public BRepMesh_DiscretAlgoFactory {
	public:
		/****** XBRepMesh_Factory::XBRepMesh_Factory ******/
		/****** md5 signature: 2b2dcea85be6991491999b348876490e ******/
		%feature("compactdefaultargs") XBRepMesh_Factory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor. Registers this factory under the name 'XBRepMesh'.
") XBRepMesh_Factory;
		 XBRepMesh_Factory();

		/****** XBRepMesh_Factory::CreateAlgorithm ******/
		/****** md5 signature: e1b970da472d5716fb372949d240fb66 ******/
		%feature("compactdefaultargs") CreateAlgorithm;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: double
theAngDeflection: double

Return
-------
opencascade::handle<BRepMesh_DiscretRoot>

Description
-----------
Creates a new meshing algorithm instance. 
Input parameter: theShape shape to be meshed 
Input parameter: theLinDeflection linear deflection for meshing 
Input parameter: theAngDeflection angular deflection for meshing 
Return: new meshing algorithm instance.
") CreateAlgorithm;
		opencascade::handle<BRepMesh_DiscretRoot> CreateAlgorithm(const TopoDS_Shape & theShape, double theLinDeflection, double theAngDeflection);

};


%make_alias(XBRepMesh_Factory)

%extend XBRepMesh_Factory {
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
