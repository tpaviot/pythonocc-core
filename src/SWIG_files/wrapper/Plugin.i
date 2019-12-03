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
%define PLUGINDOCSTRING
"Plugin module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_plugin.html"
%enddef
%module (package="OCC.Core", docstring=PLUGINDOCSTRING) Plugin


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
#include<Plugin_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
/* public enums */
/* end public enums declaration */

/* templates */
%template(Plugin_MapOfFunctions) NCollection_DataMap <TCollection_AsciiString , OSD_Function , TCollection_AsciiString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TCollection_AsciiString , OSD_Function , TCollection_AsciiString> Plugin_MapOfFunctions;
typedef NCollection_DataMap <TCollection_AsciiString , OSD_Function , TCollection_AsciiString>::Iterator Plugin_DataMapIteratorOfMapOfFunctions;
/* end typedefs declaration */

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
