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
%define BVHDOCSTRING
"BVH module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bvh.html"
%enddef
%module (package="OCC.Core", docstring=BVHDOCSTRING) BVH


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
#include<BVH_module.hxx>

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

%include "BVH_Box.hxx";
%include "BVH_PrimitiveSet.hxx";
/* public enums */
enum  {
	BVH_Constants_MaxTreeDepth = 32,
	BVH_Constants_LeafNodeSizeSingle = 1,
	BVH_Constants_LeafNodeSizeAverage = 4,
	BVH_Constants_LeafNodeSizeDefault = 5,
	BVH_Constants_LeafNodeSizeSmall = 8,
	BVH_Constants_NbBinsOptimal = 32,
	BVH_Constants_NbBinsBest = 48,
};

/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef BVH_PrimitiveSet <Standard_Real , 3> BVH_PrimitiveSet3d;
typedef std::pair <Standard_Integer , Standard_Integer> BVH_EncodedLink;
typedef BVH::VectorType <Standard_Integer , 2>::Type BVH_Vec2i;
typedef BVH::VectorType <Standard_Integer , 3>::Type BVH_Vec3i;
typedef BVH::VectorType <Standard_Integer , 4>::Type BVH_Vec4i;
typedef BVH::ArrayType <Standard_Integer , 2>::Type BVH_Array2i;
typedef BVH::ArrayType <Standard_Integer , 3>::Type BVH_Array3i;
typedef BVH::ArrayType <Standard_Integer , 4>::Type BVH_Array4i;
typedef BVH::VectorType <Standard_ShortReal , 2>::Type BVH_Vec2f;
typedef BVH::VectorType <Standard_ShortReal , 3>::Type BVH_Vec3f;
typedef BVH::VectorType <Standard_ShortReal , 4>::Type BVH_Vec4f;
typedef BVH::ArrayType <Standard_ShortReal , 2>::Type BVH_Array2f;
typedef BVH::ArrayType <Standard_ShortReal , 3>::Type BVH_Array3f;
typedef BVH::ArrayType <Standard_ShortReal , 4>::Type BVH_Array4f;
typedef BVH::VectorType <Standard_Real , 2>::Type BVH_Vec2d;
typedef BVH::VectorType <Standard_Real , 3>::Type BVH_Vec3d;
typedef BVH::VectorType <Standard_Real , 4>::Type BVH_Vec4d;
typedef BVH::ArrayType <Standard_Real , 2>::Type BVH_Array2d;
typedef BVH::ArrayType <Standard_Real , 3>::Type BVH_Array3d;
typedef BVH::ArrayType <Standard_Real , 4>::Type BVH_Array4d;
typedef BVH::MatrixType <Standard_ShortReal , 4>::Type BVH_Mat4f;
typedef BVH::MatrixType <Standard_Real , 4>::Type BVH_Mat4d;
typedef typename BVH_QueueBuilder <T , N>::BVH_PrimitiveRange Range;
/* end typedefs declaration */

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
