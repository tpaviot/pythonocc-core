/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%define INTERFACEGRAPHICDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=INTERFACEGRAPHICDOCSTRING) InterfaceGraphic

#pragma SWIG nowarn=504,325,503

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


%include InterfaceGraphic_headers.i

/* typedefs */
typedef int Tint;
typedef TEL_TEXTURE_COORD * tel_texture_coord;
typedef TEL_POFFSET_PARAM * tel_poffset_param;
typedef unsigned short Techar;
typedef float CALL_DEF_MATRIX4X4 [ 4 ][4];
typedef TEL_COLOUR * tel_colour;
typedef signed char Tchar;
typedef TEL_TRANSFORM_PERSISTENCE * tel_transform_persistence;
typedef TEL_POINT * tel_point;
typedef float Tfloat;
typedef unsigned int Tuint;
typedef double Tdouble;
typedef char Tbool;
/* end typedefs declaration */

/* public enums */
enum TelCullMode {
	TelCullUndefined = - 1,
	TelCullNone = 0,
	TelCullFront = 1,
	TelCullBack = 2,
};

/* end public enums declaration */


