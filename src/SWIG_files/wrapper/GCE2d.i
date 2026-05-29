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
%define GCE2DDOCSTRING
"GCE2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gce2d.html"
%enddef
%module (package="OCC.Core", docstring=GCE2DDOCSTRING) GCE2d


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
#include<GCE2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GC_module.hxx>
#include<GC_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GC.i

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
typedef GC_MakeArcOfCircle2d GCE2d_MakeArcOfCircle;
typedef GC_MakeArcOfEllipse2d GCE2d_MakeArcOfEllipse;
typedef GC_MakeArcOfHyperbola2d GCE2d_MakeArcOfHyperbola;
typedef GC_MakeArcOfParabola2d GCE2d_MakeArcOfParabola;
typedef GC_MakeCircle2d GCE2d_MakeCircle;
typedef GC_MakeEllipse2d GCE2d_MakeEllipse;
typedef GC_MakeHyperbola2d GCE2d_MakeHyperbola;
typedef GC_MakeLine2d GCE2d_MakeLine;
typedef GC_MakeMirror2d GCE2d_MakeMirror;
typedef GC_MakeParabola2d GCE2d_MakeParabola;
typedef GC_MakeRotation2d GCE2d_MakeRotation;
typedef GC_MakeScale2d GCE2d_MakeScale;
typedef GC_MakeSegment2d GCE2d_MakeSegment;
typedef GC_MakeTranslation2d GCE2d_MakeTranslation;
typedef GC_Root GCE2d_Root;
/* end typedefs declaration */

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
GCE2d_MakeArcOfCircle=OCC.Core.GC.GC_MakeArcOfCircle2d
GCE2d_MakeArcOfEllipse=OCC.Core.GC.GC_MakeArcOfEllipse2d
GCE2d_MakeArcOfHyperbola=OCC.Core.GC.GC_MakeArcOfHyperbola2d
GCE2d_MakeArcOfParabola=OCC.Core.GC.GC_MakeArcOfParabola2d
GCE2d_MakeCircle=OCC.Core.GC.GC_MakeCircle2d
GCE2d_MakeEllipse=OCC.Core.GC.GC_MakeEllipse2d
GCE2d_MakeHyperbola=OCC.Core.GC.GC_MakeHyperbola2d
GCE2d_MakeLine=OCC.Core.GC.GC_MakeLine2d
GCE2d_MakeMirror=OCC.Core.GC.GC_MakeMirror2d
GCE2d_MakeParabola=OCC.Core.GC.GC_MakeParabola2d
GCE2d_MakeRotation=OCC.Core.GC.GC_MakeRotation2d
GCE2d_MakeScale=OCC.Core.GC.GC_MakeScale2d
GCE2d_MakeSegment=OCC.Core.GC.GC_MakeSegment2d
GCE2d_MakeTranslation=OCC.Core.GC.GC_MakeTranslation2d
GCE2d_Root=OCC.Core.GC.GC_Root
}
