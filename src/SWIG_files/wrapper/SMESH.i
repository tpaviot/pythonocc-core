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
%define SMESHDOCSTRING
"SMESH module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_smesh.html"
%enddef
%module (package="OCC.Core", docstring=SMESHDOCSTRING) SMESH


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
#include<SMESH_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<gp_module.hxx>
#include<TopExp_module.hxx>
#include<TColStd_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<TCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<AIS_module.hxx>
#include<Aspect_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
#include<V3d_module.hxx>
#include<Select3D_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
#include<SelectBasics_module.hxx>
#include<Visual3d_module.hxx>
#include<Prs3d_module.hxx>
#include<Quantity_module.hxx>
#include<TColQuantity_module.hxx>
#include<TopLoc_module.hxx>
#include<Bnd_module.hxx>
#include<SelectMgr_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
