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
%define FSDDOCSTRING
"FSD module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_fsd.html"
%enddef
%module (package="OCC.Core", docstring=FSDDOCSTRING) FSD


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
#include<FSD_module.hxx>

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
typedef FILE * FSD_BStream;
typedef std::fstream FSD_FStream;
/* end typedefs declaration */

/**************************
* class FSD_Base64Decoder *
**************************/
/***********************
* class FSD_BinaryFile *
***********************/
/*****************
* class FSD_File *
*****************/
/***********************
* class FSD_FileHeader *
***********************/
/********************
* class FSD_CmpFile *
********************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class FSD_Base64Decoder:
	pass

@classnotwrapped
class FSD_File:
	pass

@classnotwrapped
class FSD_BinaryFile:
	pass

@classnotwrapped
class FSD_CmpFile:
	pass

@classnotwrapped
class FSD_FileHeader:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
