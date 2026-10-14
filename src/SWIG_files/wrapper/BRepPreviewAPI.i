/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPPREVIEWAPIDOCSTRING
"BRepPreviewAPI module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_breppreviewapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPPREVIEWAPIDOCSTRING) BRepPreviewAPI


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
#include<BRepPreviewAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepPrimAPI_module.hxx>
#include<Message_module.hxx>
#include<BRep_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<BRepTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Poly_module.hxx>
#include<TopoDS_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
#include<OSD_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepPrimAPI.i
%import Message.i

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

/*******************************
* class BRepPreviewAPI_MakeBox *
*******************************/
class BRepPreviewAPI_MakeBox : public BRepPrimAPI_MakeBox {
	public:
		/****** BRepPreviewAPI_MakeBox::BRepPreviewAPI_MakeBox ******/
		/****** md5 signature: b8e688568ec86e5335c99fae5a86b857 ******/
		%feature("compactdefaultargs") BRepPreviewAPI_MakeBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepPreviewAPI_MakeBox;
		 BRepPreviewAPI_MakeBox();

		/****** BRepPreviewAPI_MakeBox::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Creates a preview depending on point values.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BRepPreviewAPI_MakeBox {
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
