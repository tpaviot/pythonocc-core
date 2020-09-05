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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* templates */
/* end templates declaration */

/* typedefs */
typedef BVH::ArrayType<Standard_Real, 2>::Type BVH_Array2d;
typedef BVH::ArrayType<Standard_ShortReal, 2>::Type BVH_Array2f;
typedef BVH::ArrayType<Standard_Integer, 2>::Type BVH_Array2i;
typedef BVH::ArrayType<Standard_Real, 3>::Type BVH_Array3d;
typedef BVH::ArrayType<Standard_ShortReal, 3>::Type BVH_Array3f;
typedef BVH::ArrayType<Standard_Integer, 3>::Type BVH_Array3i;
typedef BVH::ArrayType<Standard_Real, 4>::Type BVH_Array4d;
typedef BVH::ArrayType<Standard_ShortReal, 4>::Type BVH_Array4f;
typedef BVH::ArrayType<Standard_Integer, 4>::Type BVH_Array4i;
typedef std::pair<Standard_Integer, Standard_Integer> BVH_EncodedLink;
typedef BVH::MatrixType<Standard_Real, 4>::Type BVH_Mat4d;
typedef BVH::MatrixType<Standard_ShortReal, 4>::Type BVH_Mat4f;
typedef BVH_PrimitiveSet<Standard_Real, 3> BVH_PrimitiveSet3d;
typedef BVH::VectorType<Standard_Real, 2>::Type BVH_Vec2d;
typedef BVH::VectorType<Standard_ShortReal, 2>::Type BVH_Vec2f;
typedef BVH::VectorType<Standard_Integer, 2>::Type BVH_Vec2i;
typedef BVH::VectorType<Standard_Real, 3>::Type BVH_Vec3d;
typedef BVH::VectorType<Standard_ShortReal, 3>::Type BVH_Vec3f;
typedef BVH::VectorType<Standard_Integer, 3>::Type BVH_Vec3i;
typedef BVH::VectorType<Standard_Real, 4>::Type BVH_Vec4d;
typedef BVH::VectorType<Standard_ShortReal, 4>::Type BVH_Vec4f;
typedef BVH::VectorType<Standard_Integer, 4>::Type BVH_Vec4i;
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
class BVH_AxisSelector<T,2> {
	public:
typedef typename BVH ::VectorType<T , 2>::Type BVH_VecNt;
		/****************** MainAxis ******************/
		/**** md5 signature: 3eeb73485373349ee6e5770c410c7405 ****/
		%feature("compactdefaultargs") MainAxis;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSize: BVH_VecNt

Returns
-------
int
") MainAxis;
		static Standard_Integer MainAxis(const BVH_VecNt & theSize);

};


%extend BVH_AxisSelector<T,2> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BVH_BaseTraverse *
*************************/
/****************
* class BVH_Bin *
****************/
/***********************
* class BVH_BinaryTree *
***********************/
/****************
* class BVH_Box *
****************/
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
/***********************
* class BoxMinMax<T,2> *
***********************/
/*******************
* class CenterAxis *
*******************/
/************************
* class CenterAxis<T,2> *
************************/
/************************
* class CenterAxis<T,3> *
************************/
/************************
* class CenterAxis<T,4> *
************************/
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
/*******************************
* class SurfaceCalculator<T,2> *
*******************************/
/*******************************
* class SurfaceCalculator<T,3> *
*******************************/
/*******************************
* class SurfaceCalculator<T,4> *
*******************************/
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
class BVH_Tree<T,N,BVH_BinaryTree> : public BVH_TreeBase<T,N> {
	public:
typedef typename BVH_TreeBase<T , N>::BVH_VecNt BVH_VecNt;
		/****************** BVH_Tree ******************/
		/**** md5 signature: 2d74225b1905a21a5e97d806c3b50923 ****/
		%feature("compactdefaultargs") BVH_Tree;
		%feature("autodoc", "Creates new empty bvh tree.

Returns
-------
None
") BVH_Tree;
		 BVH_Tree();

		/****************** AddInnerNode ******************/
		/**** md5 signature: f58328730bdea31b9795074762e2ff33 ****/
		%feature("compactdefaultargs") AddInnerNode;
		%feature("autodoc", "Adds new inner node to the bvh.

Parameters
----------
theMinPoint: BVH_VecNt
theMaxPoint: BVH_VecNt
theLftChild: int
theRghChild: int

Returns
-------
int
") AddInnerNode;
		int AddInnerNode(const BVH_VecNt & theMinPoint, const BVH_VecNt & theMaxPoint, const int theLftChild, const int theRghChild);

		/****************** AddInnerNode ******************/
		/**** md5 signature: 5f6cb26dae5b038c2e68cab73611154e ****/
		%feature("compactdefaultargs") AddInnerNode;
		%feature("autodoc", "Adds new inner node to the bvh.

Parameters
----------
theAABB: BVH_Box<T, N>
theLftChild: int
theRghChild: int

Returns
-------
int
") AddInnerNode;
		int AddInnerNode(const BVH_Box<T, N> & theAABB, const int theLftChild, const int theRghChild);

		/****************** AddInnerNode ******************/
		/**** md5 signature: 7349e9c4c6e6de36606d9ec9f409a423 ****/
		%feature("compactdefaultargs") AddInnerNode;
		%feature("autodoc", "Adds new inner node to the bvh with uninitialized bounds.

Parameters
----------
theLftChild: int
theRghChild: int

Returns
-------
int
") AddInnerNode;
		int AddInnerNode(const int theLftChild, const int theRghChild);

		/****************** AddLeafNode ******************/
		/**** md5 signature: 0cd89637e7eea803e0a24110ae682988 ****/
		%feature("compactdefaultargs") AddLeafNode;
		%feature("autodoc", "Adds new leaf node to the bvh.

Parameters
----------
theMinPoint: BVH_VecNt
theMaxPoint: BVH_VecNt
theBegElem: int
theEndElem: int

Returns
-------
int
") AddLeafNode;
		int AddLeafNode(const BVH_VecNt & theMinPoint, const BVH_VecNt & theMaxPoint, const int theBegElem, const int theEndElem);

		/****************** AddLeafNode ******************/
		/**** md5 signature: 5fe9f2fb528719ca7bfb42a304e784f8 ****/
		%feature("compactdefaultargs") AddLeafNode;
		%feature("autodoc", "Adds new leaf node to the bvh.

Parameters
----------
theAABB: BVH_Box<T, N>
theBegElem: int
theEndElem: int

Returns
-------
int
") AddLeafNode;
		int AddLeafNode(const BVH_Box<T, N> & theAABB, const int theBegElem, const int theEndElem);

		/****************** AddLeafNode ******************/
		/**** md5 signature: 0b15c5077d62fd3e3e631a06cb249fdb ****/
		%feature("compactdefaultargs") AddLeafNode;
		%feature("autodoc", "Adds new leaf node to the bvh with uninitialized bounds.

Parameters
----------
theBegElem: int
theEndElem: int

Returns
-------
int
") AddLeafNode;
		int AddLeafNode(const int theBegElem, const int theEndElem);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all nodes from the tree.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CollapseToQuadTree ******************/
		/**** md5 signature: 26af2d95ff6621c0dd1347a8eddea988 ****/
		%feature("compactdefaultargs") CollapseToQuadTree;
		%feature("autodoc", "Collapses the tree into qbvh an returns it. as a result, each 2-nd level of current tree is kept and the rest are discarded.

Returns
-------
BVH_Tree<T, N, BVH_QuadTree> *
") CollapseToQuadTree;
		BVH_Tree<T, N, BVH_QuadTree> * CollapseToQuadTree();

		/****************** EstimateSAH ******************/
		/**** md5 signature: 3b150e7f34a26485a48f784b21aaf6ef ****/
		%feature("compactdefaultargs") EstimateSAH;
		%feature("autodoc", "Returns value of sah (surface area heuristic). allows to compare the quality of bvh trees constructed for the same sets of geometric objects with different methods.

Returns
-------
T
") EstimateSAH;
		T EstimateSAH();

		/****************** Reserve ******************/
		/**** md5 signature: 19d96c51c8d28b94e8cf4c818e3f894e ****/
		%feature("compactdefaultargs") Reserve;
		%feature("autodoc", "Reserves internal bvh storage, so that it can contain the given number of bvh nodes.

Parameters
----------
theNbNodes: int

Returns
-------
None
") Reserve;
		void Reserve(const int theNbNodes);

		/****************** SetInner ******************/
		/**** md5 signature: e211f149b4289ac87e5ce7758471a95a ****/
		%feature("compactdefaultargs") SetInner;
		%feature("autodoc", "Sets node type to 'inner'.

Parameters
----------
theNodeIndex: int

Returns
-------
None
") SetInner;
		void SetInner(const int theNodeIndex);

		/****************** SetOuter ******************/
		/**** md5 signature: 17ac31f632333f17c9c7c88deadd549f ****/
		%feature("compactdefaultargs") SetOuter;
		%feature("autodoc", "Sets node type to 'outer'.

Parameters
----------
theNodeIndex: int

Returns
-------
None
") SetOuter;
		void SetOuter(const int theNodeIndex);

};


%extend BVH_Tree<T,N,BVH_BinaryTree> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BVH_Tree<T,N,BVH_QuadTree> *
***********************************/
class BVH_Tree<T,N,BVH_QuadTree> : public BVH_TreeBase<T,N> {
	public:
		/****************** BVH_Tree ******************/
		/**** md5 signature: 2d74225b1905a21a5e97d806c3b50923 ****/
		%feature("compactdefaultargs") BVH_Tree;
		%feature("autodoc", "Creates new empty bvh tree.

Returns
-------
None
") BVH_Tree;
		 BVH_Tree();

};


%extend BVH_Tree<T,N,BVH_QuadTree> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BVH_TreeBase *
*********************/
/**************************
* class BVH_Triangulation *
**************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BVH_Tools:
	pass

@classnotwrapped
class BVH_BuildTool:
	pass

@classnotwrapped
class BVH_BuildThread:
	pass

@classnotwrapped
class BVH_Sorter:
	pass

@classnotwrapped
class BVH_ObjectSet:
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
class BVH_Distance:
	pass

@classnotwrapped
class BVH_ObjectTransient:
	pass

@classnotwrapped
class BVH_Object:
	pass

@classnotwrapped
class BVH_QuickSorter:
	pass

@classnotwrapped
class BVH_Set:
	pass

@classnotwrapped
class BVH_SpatialMedianBuilder:
	pass

@classnotwrapped
class BVH_Tree:
	pass

@classnotwrapped
class BVH_PrimitiveSet:
	pass

@classnotwrapped
class BVH_BuildQueue:
	pass

@classnotwrapped
class BVH_BuilderTransient:
	pass

@classnotwrapped
class BVH_Builder:
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

@classnotwrapped
class BVH_Triangulation:
	pass

@classnotwrapped
class BVH_PairDistance:
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
class BVH_SweepPlaneBuilder:
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
class BVH_BoxSet:
	pass

@classnotwrapped
class BVH_Geometry:
	pass

@classnotwrapped
class BVH_QueueBuilder:
	pass

@classnotwrapped
class BVH_DistanceField:
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
class BVH_Bin:
	pass

@classnotwrapped
class BVH_BinnedBuilder:
	pass

@classnotwrapped
class BVH_AxisSelector:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
