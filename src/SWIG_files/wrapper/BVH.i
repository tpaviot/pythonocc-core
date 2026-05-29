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
%define BVHDOCSTRING
"BVH module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bvh.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BVH_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
using namespace BVH;
%};
%import Standard.i
%import NCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


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

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* templates */
/* end templates declaration */

/* typedefs */
typedef BVH::ArrayType<double, 2>::Type BVH_Array2d;
typedef BVH::ArrayType<float, 2>::Type BVH_Array2f;
typedef BVH::ArrayType<int, 2>::Type BVH_Array2i;
typedef BVH::ArrayType<double, 3>::Type BVH_Array3d;
typedef BVH::ArrayType<float, 3>::Type BVH_Array3f;
typedef BVH::ArrayType<int, 3>::Type BVH_Array3i;
typedef BVH::ArrayType<double, 4>::Type BVH_Array4d;
typedef BVH::ArrayType<float, 4>::Type BVH_Array4f;
typedef BVH::ArrayType<int, 4>::Type BVH_Array4i;
typedef BVH_Builder<double, 3> BVH_Builder3d;
typedef std::pair<unsigned int, int> BVH_EncodedLink;
typedef BVH::MatrixType<double, 4>::Type BVH_Mat4d;
typedef BVH::MatrixType<float, 4>::Type BVH_Mat4f;
typedef BVH_PrimitiveSet<double, 3> BVH_PrimitiveSet3d;
typedef BVH::VectorType<double, 2>::Type BVH_Vec2d;
typedef BVH::VectorType<float, 2>::Type BVH_Vec2f;
typedef BVH::VectorType<int, 2>::Type BVH_Vec2i;
typedef BVH::VectorType<double, 3>::Type BVH_Vec3d;
typedef BVH::VectorType<float, 3>::Type BVH_Vec3f;
typedef BVH::VectorType<int, 3>::Type BVH_Vec3i;
typedef BVH::VectorType<double, 4>::Type BVH_Vec4d;
typedef BVH::VectorType<float, 4>::Type BVH_Vec4f;
typedef BVH::VectorType<int, 4>::Type BVH_Vec4i;
/* end typedefs declaration */

/**************
* class Array *
**************/
/******************
* class ArrayType *
******************/
/*************************
* class BVH_AxisSelector *
*************************/
/******************************
* class BVH_AxisSelector<T,2> *
******************************/
/********************
* class BVH_BaseBox *
********************/
/*********************************
* class BVH_BaseBox<T,3,BVH_Box> *
*********************************/
/*************************
* class BVH_BaseTraverse *
*************************/
/****************
* class BVH_Bin *
****************/
/***********************
* class BVH_BinaryTree *
***********************/
/***********************
* class BVH_BuildQueue *
***********************/
/************************
* class BVH_BuildThread *
************************/
/**********************
* class BVH_BuildTool *
**********************/
/*****************************
* class BVH_BuilderTransient *
*****************************/
/**************************
* class BVH_DistanceField *
**************************/
/****************************
* class BVH_ObjectTransient *
****************************/
/***********************
* class BVH_Properties *
***********************/
/*********************
* class BVH_QuadTree *
*********************/
/****************
* class BVH_Ray *
****************/
/****************
* class BVH_Set *
****************/
/*******************
* class BVH_Sorter *
*******************/
/******************
* class BVH_Tools *
******************/
/*****************
* class BVH_Tree *
*****************/
/******************************
* class BVH_TreeBaseTransient *
******************************/
/**********************
* class BitComparator *
**********************/
/*********************
* class BitPredicate *
*********************/
/******************
* class BoundData *
******************/
/******************
* class BoxMinMax *
******************/
/*******************
* class CenterAxis *
*******************/
/*****************
* class MatrixOp *
*****************/
/**********************
* class MatrixOp<T,4> *
**********************/
/*******************
* class MatrixType *
*******************/
/************************
* class MatrixType<T,4> *
************************/
/********************
* class RadixSorter *
********************/
/**************************
* class SurfaceCalculator *
**************************/
/*******************
* class UnitVector *
*******************/
/************************
* class UnitVector<T,2> *
************************/
/************************
* class UnitVector<T,3> *
************************/
/************************
* class UnitVector<T,4> *
************************/
/************************
* class UpdateBoundTask *
************************/
/****************
* class VecComp *
****************/
/*********************
* class VecComp<T,2> *
*********************/
/*********************
* class VecComp<T,3> *
*********************/
/*********************
* class VecComp<T,4> *
*********************/
/*******************
* class VectorType *
*******************/
/************************
* class VectorType<T,1> *
************************/
/************************
* class VectorType<T,2> *
************************/
/************************
* class VectorType<T,3> *
************************/
/************************
* class VectorType<T,4> *
************************/
/**************************
* class BVH_BinnedBuilder *
**************************/
/****************
* class BVH_Box *
****************/
/*******************
* class BVH_BoxSet *
*******************/
/********************
* class BVH_Builder *
********************/
/*********************
* class BVH_Distance *
*********************/
/*********************
* class BVH_Geometry *
*********************/
/**************************
* class BVH_IndexedBoxSet *
**************************/
/**************************
* class BVH_LinearBuilder *
**************************/
/*******************
* class BVH_Object *
*******************/
/**********************
* class BVH_ObjectSet *
**********************/
/*************************
* class BVH_PairDistance *
*************************/
/*************************
* class BVH_PairTraverse *
*************************/
/*************************
* class BVH_PrimitiveSet *
*************************/
/*************************
* class BVH_QueueBuilder *
*************************/
/************************
* class BVH_QuickSorter *
************************/
/************************
* class BVH_RadixSorter *
************************/
/*********************************
* class BVH_SpatialMedianBuilder *
*********************************/
/******************************
* class BVH_SweepPlaneBuilder *
******************************/
/**********************
* class BVH_Transform *
**********************/
/*********************
* class BVH_Traverse *
*********************/
/*************************************
* class BVH_Tree<T,N,BVH_BinaryTree> *
*************************************/
/***********************************
* class BVH_Tree<T,N,BVH_QuadTree> *
***********************************/
/*********************
* class BVH_TreeBase *
*********************/
/**************************
* class BVH_Triangulation *
**************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BVH_Tree:
	pass

@classnotwrapped
class BVH_Bin:
	pass

@classnotwrapped
class BVH_BinnedBuilder:
	pass

@classnotwrapped
class BVH_AxisSelector:
	pass

@classnotwrapped
class BVH_BaseBox:
	pass

@classnotwrapped
class BVH_Box:
	pass

@classnotwrapped
class CenterAxis:
	pass

@classnotwrapped
class SurfaceCalculator:
	pass

@classnotwrapped
class BoxMinMax:
	pass

@classnotwrapped
class BVH_BoxSet:
	pass

@classnotwrapped
class BVH_BuildQueue:
	pass

@classnotwrapped
class BVH_BuildTool:
	pass

@classnotwrapped
class BVH_BuildThread:
	pass

@classnotwrapped
class BVH_BuilderTransient:
	pass

@classnotwrapped
class BVH_Builder:
	pass

@classnotwrapped
class BVH_Distance:
	pass

@classnotwrapped
class BVH_DistanceField:
	pass

@classnotwrapped
class BVH_Geometry:
	pass

@classnotwrapped
class BVH_IndexedBoxSet:
	pass

@classnotwrapped
class BVH_LinearBuilder:
	pass

@classnotwrapped
class BoundData:
	pass

@classnotwrapped
class UpdateBoundTask:
	pass

@classnotwrapped
class BVH_ObjectTransient:
	pass

@classnotwrapped
class BVH_Object:
	pass

@classnotwrapped
class BVH_ObjectSet:
	pass

@classnotwrapped
class BVH_PairDistance:
	pass

@classnotwrapped
class BVH_PrimitiveSet:
	pass

@classnotwrapped
class BVH_Properties:
	pass

@classnotwrapped
class BVH_Transform:
	pass

@classnotwrapped
class MatrixOp:
	pass

@classnotwrapped
class UnitVector:
	pass

@classnotwrapped
class BVH_QueueBuilder:
	pass

@classnotwrapped
class BVH_QuickSorter:
	pass

@classnotwrapped
class BVH_RadixSorter:
	pass

@classnotwrapped
class BitPredicate:
	pass

@classnotwrapped
class BitComparator:
	pass

@classnotwrapped
class RadixSorter:
	pass

@classnotwrapped
class BVH_Ray:
	pass

@classnotwrapped
class BVH_Set:
	pass

@classnotwrapped
class BVH_Sorter:
	pass

@classnotwrapped
class BVH_SpatialMedianBuilder:
	pass

@classnotwrapped
class BVH_SweepPlaneBuilder:
	pass

@classnotwrapped
class BVH_Tools:
	pass

@classnotwrapped
class BVH_BaseTraverse:
	pass

@classnotwrapped
class BVH_Traverse:
	pass

@classnotwrapped
class BVH_PairTraverse:
	pass

@classnotwrapped
class BVH_TreeBaseTransient:
	pass

@classnotwrapped
class BVH_TreeBase:
	pass

@classnotwrapped
class BVH_QuadTree:
	pass

@classnotwrapped
class BVH_BinaryTree:
	pass

@classnotwrapped
class BVH_Triangulation:
	pass

@classnotwrapped
class VectorType:
	pass

@classnotwrapped
class MatrixType:
	pass

@classnotwrapped
class ArrayType:
	pass

@classnotwrapped
class VecComp:
	pass

@classnotwrapped
class Array:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
		/****** ::EncodeMortonCode ******/
		/****** md5 signature: 8aac796e0900d08d8101bd9930b3d865 ******/
		%feature("compactdefaultargs") EncodeMortonCode;
		%feature("autodoc", "
Parameters
----------
theVoxelX: unsigned int
theVoxelY: unsigned int
theVoxelZ: unsigned int

Return
-------
unsigned int

Description
-----------
Encodes 10-bit voxel coordinates into 30-bit Morton code using LUT. 
Parameter theVoxelX X coordinate (0-1023) 
Parameter theVoxelY Y coordinate (0-1023) 
Parameter theVoxelZ Z coordinate (0-1023) 
Return: 30-bit Morton code with interleaved bits.
") EncodeMortonCode;
		unsigned int EncodeMortonCode(unsigned int theVoxelX, unsigned int theVoxelY, unsigned int theVoxelZ);

