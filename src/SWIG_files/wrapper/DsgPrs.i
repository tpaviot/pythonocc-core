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
%define DSGPRSDOCSTRING
"DsgPrs module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_dsgprs.html"
%enddef
%module (package="OCC.Core", docstring=DSGPRSDOCSTRING) DsgPrs


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
#include<DsgPrs_module.hxx>

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
enum DsgPrs_ArrowSide {
	DsgPrs_AS_NONE = 0,
	DsgPrs_AS_FIRSTAR = 1,
	DsgPrs_AS_LASTAR = 2,
	DsgPrs_AS_BOTHAR = 3,
	DsgPrs_AS_FIRSTPT = 4,
	DsgPrs_AS_LASTPT = 5,
	DsgPrs_AS_BOTHPT = 6,
	DsgPrs_AS_FIRSTAR_LASTPT = 7,
	DsgPrs_AS_FIRSTPT_LASTAR = 8,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class DsgPrs_ArrowSide(IntEnum):
	DsgPrs_AS_NONE = 0
	DsgPrs_AS_FIRSTAR = 1
	DsgPrs_AS_LASTAR = 2
	DsgPrs_AS_BOTHAR = 3
	DsgPrs_AS_FIRSTPT = 4
	DsgPrs_AS_LASTPT = 5
	DsgPrs_AS_BOTHPT = 6
	DsgPrs_AS_FIRSTAR_LASTPT = 7
	DsgPrs_AS_FIRSTPT_LASTAR = 8
DsgPrs_AS_NONE = DsgPrs_ArrowSide.DsgPrs_AS_NONE
DsgPrs_AS_FIRSTAR = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTAR
DsgPrs_AS_LASTAR = DsgPrs_ArrowSide.DsgPrs_AS_LASTAR
DsgPrs_AS_BOTHAR = DsgPrs_ArrowSide.DsgPrs_AS_BOTHAR
DsgPrs_AS_FIRSTPT = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTPT
DsgPrs_AS_LASTPT = DsgPrs_ArrowSide.DsgPrs_AS_LASTPT
DsgPrs_AS_BOTHPT = DsgPrs_ArrowSide.DsgPrs_AS_BOTHPT
DsgPrs_AS_FIRSTAR_LASTPT = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTAR_LASTPT
DsgPrs_AS_FIRSTPT_LASTAR = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTPT_LASTAR
};
/* end python proxy for enums */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class DsgPrs *
***************/
/*********************************
* class DsgPrs_AnglePresentation *
*********************************/
/***********************************
* class DsgPrs_Chamf2dPresentation *
***********************************/
/**************************************
* class DsgPrs_ConcentricPresentation *
**************************************/
/************************
* class DsgPrs_DatumPrs *
************************/
/************************************
* class DsgPrs_DiameterPresentation *
************************************/
/*****************************************
* class DsgPrs_EllipseRadiusPresentation *
*****************************************/
/*****************************************
* class DsgPrs_EqualDistancePresentation *
*****************************************/
/***************************************
* class DsgPrs_EqualRadiusPresentation *
***************************************/
/****************************************
* class DsgPrs_FilletRadiusPresentation *
****************************************/
/*******************************
* class DsgPrs_FixPresentation *
*******************************/
/***********************************
* class DsgPrs_IdenticPresentation *
***********************************/
/**********************************
* class DsgPrs_LengthPresentation *
**********************************/
/************************************
* class DsgPrs_MidPointPresentation *
************************************/
/**********************************
* class DsgPrs_OffsetPresentation *
**********************************/
/*********************************
* class DsgPrs_ParalPresentation *
*********************************/
/**********************************
* class DsgPrs_PerpenPresentation *
**********************************/
/**********************************
* class DsgPrs_RadiusPresentation *
**********************************/
/***************************************
* class DsgPrs_ShadedPlanePresentation *
***************************************/
/************************************
* class DsgPrs_ShapeDirPresentation *
************************************/
/********************************
* class DsgPrs_SymbPresentation *
********************************/
/*************************************
* class DsgPrs_SymmetricPresentation *
*************************************/
/***********************************
* class DsgPrs_TangentPresentation *
***********************************/
/***********************************
* class DsgPrs_XYZAxisPresentation *
***********************************/
/************************************
* class DsgPrs_XYZPlanePresentation *
************************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class DsgPrs_EllipseRadiusPresentation:
	pass

@classnotwrapped
class DsgPrs_XYZPlanePresentation:
	pass

@classnotwrapped
class DsgPrs_ConcentricPresentation:
	pass

@classnotwrapped
class DsgPrs_AnglePresentation:
	pass

@classnotwrapped
class DsgPrs_ShadedPlanePresentation:
	pass

@classnotwrapped
class DsgPrs_RadiusPresentation:
	pass

@classnotwrapped
class DsgPrs_TangentPresentation:
	pass

@classnotwrapped
class DsgPrs_SymbPresentation:
	pass

@classnotwrapped
class DsgPrs_FilletRadiusPresentation:
	pass

@classnotwrapped
class DsgPrs_SymmetricPresentation:
	pass

@classnotwrapped
class DsgPrs_ShapeDirPresentation:
	pass

@classnotwrapped
class DsgPrs_FixPresentation:
	pass

@classnotwrapped
class DsgPrs_IdenticPresentation:
	pass

@classnotwrapped
class DsgPrs_MidPointPresentation:
	pass

@classnotwrapped
class DsgPrs_EqualRadiusPresentation:
	pass

@classnotwrapped
class DsgPrs_LengthPresentation:
	pass

@classnotwrapped
class DsgPrs_EqualDistancePresentation:
	pass

@classnotwrapped
class DsgPrs_DatumPrs:
	pass

@classnotwrapped
class DsgPrs_DiameterPresentation:
	pass

@classnotwrapped
class DsgPrs_ParalPresentation:
	pass

@classnotwrapped
class DsgPrs_OffsetPresentation:
	pass

@classnotwrapped
class DsgPrs_XYZAxisPresentation:
	pass

@classnotwrapped
class DsgPrs_Chamf2dPresentation:
	pass

@classnotwrapped
class DsgPrs_PerpenPresentation:
	pass

@classnotwrapped
class DsgPrs:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
