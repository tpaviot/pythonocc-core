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
%define IMAGEDOCSTRING
"Image module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_image.html"
%enddef
%module (package="OCC.Core", docstring=IMAGEDOCSTRING) Image


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
#include<Image_module.hxx>

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
enum Image_Format {
	Image_Format_UNKNOWN = 0,
	Image_Format_Gray = 1,
	Image_Format_Alpha = 2,
	Image_Format_RGB = 3,
	Image_Format_BGR = 4,
	Image_Format_RGB32 = 5,
	Image_Format_BGR32 = 6,
	Image_Format_RGBA = 7,
	Image_Format_BGRA = 8,
	Image_Format_GrayF = 9,
	Image_Format_AlphaF = 10,
	Image_Format_RGBF = 11,
	Image_Format_BGRF = 12,
	Image_Format_RGBAF = 13,
	Image_Format_BGRAF = 14,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Image_Format(IntEnum):
	Image_Format_UNKNOWN = 0
	Image_Format_Gray = 1
	Image_Format_Alpha = 2
	Image_Format_RGB = 3
	Image_Format_BGR = 4
	Image_Format_RGB32 = 5
	Image_Format_BGR32 = 6
	Image_Format_RGBA = 7
	Image_Format_BGRA = 8
	Image_Format_GrayF = 9
	Image_Format_AlphaF = 10
	Image_Format_RGBF = 11
	Image_Format_BGRF = 12
	Image_Format_RGBAF = 13
	Image_Format_BGRAF = 14
Image_Format_UNKNOWN = Image_Format.Image_Format_UNKNOWN
Image_Format_Gray = Image_Format.Image_Format_Gray
Image_Format_Alpha = Image_Format.Image_Format_Alpha
Image_Format_RGB = Image_Format.Image_Format_RGB
Image_Format_BGR = Image_Format.Image_Format_BGR
Image_Format_RGB32 = Image_Format.Image_Format_RGB32
Image_Format_BGR32 = Image_Format.Image_Format_BGR32
Image_Format_RGBA = Image_Format.Image_Format_RGBA
Image_Format_BGRA = Image_Format.Image_Format_BGRA
Image_Format_GrayF = Image_Format.Image_Format_GrayF
Image_Format_AlphaF = Image_Format.Image_Format_AlphaF
Image_Format_RGBF = Image_Format.Image_Format_RGBF
Image_Format_BGRF = Image_Format.Image_Format_BGRF
Image_Format_RGBAF = Image_Format.Image_Format_RGBAF
Image_Format_BGRAF = Image_Format.Image_Format_BGRAF
};
/* end python proxy for enums */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class Image_ColorBGR *
***********************/
/*************************
* class Image_ColorBGR32 *
*************************/
/************************
* class Image_ColorBGRA *
************************/
/*************************
* class Image_ColorBGRAF *
*************************/
/************************
* class Image_ColorBGRF *
************************/
/***********************
* class Image_ColorRGB *
***********************/
/*************************
* class Image_ColorRGB32 *
*************************/
/************************
* class Image_ColorRGBA *
************************/
/*************************
* class Image_ColorRGBAF *
*************************/
/************************
* class Image_ColorRGBF *
************************/
/*******************
* class Image_Diff *
*******************/
/*********************
* class Image_PixMap *
*********************/
/*************************
* class Image_PixMapData *
*************************/
/**********************
* class Image_Texture *
**********************/
/**************************
* class Image_VideoParams *
**************************/
/****************************
* class Image_VideoRecorder *
****************************/
/**************************
* class Image_AlienPixMap *
**************************/
/******************************
* class Image_PixMapTypedData *
******************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Image_ColorRGB:
	pass

@classnotwrapped
class Image_ColorRGB32:
	pass

@classnotwrapped
class Image_ColorRGBA:
	pass

@classnotwrapped
class Image_ColorBGR:
	pass

@classnotwrapped
class Image_ColorBGR32:
	pass

@classnotwrapped
class Image_ColorBGRA:
	pass

@classnotwrapped
class Image_ColorRGBF:
	pass

@classnotwrapped
class Image_ColorBGRF:
	pass

@classnotwrapped
class Image_ColorRGBAF:
	pass

@classnotwrapped
class Image_ColorBGRAF:
	pass

@classnotwrapped
class Image_VideoParams:
	pass

@classnotwrapped
class Image_VideoRecorder:
	pass

@classnotwrapped
class Image_PixMapData:
	pass

@classnotwrapped
class Image_PixMapTypedData:
	pass

@classnotwrapped
class Image_PixMap:
	pass

@classnotwrapped
class Image_Texture:
	pass

@classnotwrapped
class Image_AlienPixMap:
	pass

@classnotwrapped
class Image_Diff:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
