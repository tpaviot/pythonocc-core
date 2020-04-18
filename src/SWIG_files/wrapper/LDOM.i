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
%define LDOMDOCSTRING
"LDOM module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_ldom.html"
%enddef
%module (package="OCC.Core", docstring=LDOMDOCSTRING) LDOM


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
#include<LDOM_module.hxx>

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

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class LDOM_BasicNode *
***********************/
/***************************
* class LDOM_CharReference *
***************************/
/**********************
* class LDOM_Document *
**********************/
/**************************
* class LDOM_DocumentType *
**************************/
/********************************
* class LDOM_LDOMImplementation *
********************************/
/************************
* class LDOM_MemManager *
************************/
/******************
* class LDOM_Node *
******************/
/**********************
* class LDOM_NodeList *
**********************/
/**********************
* class LDOM_OSStream *
**********************/
/*********************
* class LDOM_SBuffer *
*********************/
/***********************
* class LDOM_XmlReader *
***********************/
/***********************
* class LDOM_XmlWriter *
***********************/
/******************
* class LDOM_Attr *
******************/
/****************************
* class LDOM_BasicAttribute *
****************************/
/**************************
* class LDOM_BasicElement *
**************************/
/***********************
* class LDOM_BasicText *
***********************/
/***************************
* class LDOM_CharacterData *
***************************/
/*********************
* class LDOM_Element *
*********************/
/*********************
* class LDOM_Comment *
*********************/
/******************
* class LDOM_Text *
******************/
/**************************
* class LDOM_CDATASection *
**************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class LDOM_LDOMImplementation:
	pass

@classnotwrapped
class LDOM_CharacterData:
	pass

@classnotwrapped
class LDOM_CDATASection:
	pass

@classnotwrapped
class LDOM_Node:
	pass

@classnotwrapped
class LDOM_Element:
	pass

@classnotwrapped
class LDOM_Text:
	pass

@classnotwrapped
class LDOM_NodeList:
	pass

@classnotwrapped
class LDOM_SBuffer:
	pass

@classnotwrapped
class LDOM_OSStream:
	pass

@classnotwrapped
class LDOM_CharReference:
	pass

@classnotwrapped
class LDOM_XmlWriter:
	pass

@classnotwrapped
class LDOM_BasicElement:
	pass

@classnotwrapped
class LDOM_Comment:
	pass

@classnotwrapped
class LDOM_BasicAttribute:
	pass

@classnotwrapped
class LDOM_BasicText:
	pass

@classnotwrapped
class LDOM_Document:
	pass

@classnotwrapped
class LDOM_Attr:
	pass

@classnotwrapped
class LDOM_DocumentType:
	pass

@classnotwrapped
class LDOM_XmlReader:
	pass

@classnotwrapped
class LDOM_BasicNode:
	pass

@classnotwrapped
class LDOM_MemManager:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
