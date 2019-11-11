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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define STDSELECTDOCSTRING
"StdSelect module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_StdSelect.html"
%enddef
%module (package="OCC.Core", docstring=STDSELECTDOCSTRING) StdSelect

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include StdSelect_headers.i

/* public enums */
enum StdSelect_TypeOfResult {
	StdSelect_TOR_SIMPLE = 0,
	StdSelect_TOR_MULTIPLE = 1,
};

enum StdSelect_SensitivityMode {
	StdSelect_SM_WINDOW = 0,
	StdSelect_SM_VIEW = 1,
};

enum StdSelect_TypeOfFace {
	StdSelect_AnyFace = 0,
	StdSelect_Plane = 1,
	StdSelect_Cylinder = 2,
	StdSelect_Sphere = 3,
	StdSelect_Torus = 4,
	StdSelect_Revol = 5,
	StdSelect_Cone = 6,
};

enum StdSelect_TypeOfEdge {
	StdSelect_AnyEdge = 0,
	StdSelect_Line = 1,
	StdSelect_Circle = 2,
};

enum StdSelect_DisplayMode {
	StdSelect_DM_Wireframe = 0,
	StdSelect_DM_Shading = 1,
	StdSelect_DM_HLR = 2,
};

enum StdSelect_TypeOfSelectionImage {
	StdSelect_TypeOfSelectionImage_NormalizedDepth = 0,
	StdSelect_TypeOfSelectionImage_NormalizedDepthInverted = 1,
	StdSelect_TypeOfSelectionImage_UnnormalizedDepth = 2,
	StdSelect_TypeOfSelectionImage_ColoredDetectedObject = 3,
	StdSelect_TypeOfSelectionImage_ColoredEntity = 4,
	StdSelect_TypeOfSelectionImage_ColoredOwner = 5,
	StdSelect_TypeOfSelectionImage_ColoredSelectionMode = 6,
};

/* end public enums declaration */

/* templates */
%template(StdSelect_IndexedDataMapOfOwnerPrs) NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, opencascade::handle <StdSelect_Prs>, TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, opencascade::handle <StdSelect_Prs>, TColStd_MapTransientHasher> StdSelect_IndexedDataMapOfOwnerPrs;
/* end typedefs declaration */

/* harray1 class */
/* harray2 class */
/* harray2 class */
