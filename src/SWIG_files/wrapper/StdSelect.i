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
%define STDSELECTDOCSTRING
"The StdSelect package provides the following services
-  the definition of selection modes for topological shapes
-  the definition of several concrete filtertandard
Selection2d.ap classes
-  2D and 3D viewer selectors.
Note that each new Interactive Object must have all
its selection modes defined.
Standard Classes is useful to build
3D Selectable Objects, and to process
3D Selections:

- Implementation of View Selector for dynamic selection
in Views from V3d.

- Implementation of Tool class to decompose 3D BRep Objects
into sensitive Primitives for every desired mode of selection
(selection of vertex,edges,wires,faces,...)

- Implementation of dedicated Sensitives Entities:
Text for 2D Views (linked to Specific 2D projectors.)"
%enddef
%module (package="OCC.Core", docstring=STDSELECTDOCSTRING) StdSelect

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


%include StdSelect_headers.i

/* typedefs */
/* end typedefs declaration */

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

/* end public enums declaration */

