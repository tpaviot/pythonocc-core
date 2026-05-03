/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define NCOLLECTIONDOCSTRING
"NCollection module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_ncollection.html"
%enddef
%module (package="OCC.Core", docstring=NCOLLECTIONDOCSTRING) NCollection


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
#include<NCollection_module.hxx>

//Dependencies
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


%include "Standard_Macro.hxx";
%include "Standard_DefineAlloc.hxx";
%include "NCollection_DefineAlloc.hxx";
%include "NCollection_Array1.hxx";
%include "NCollection_Array2.hxx";
%include "NCollection_BaseList.hxx";
%include "NCollection_BaseMap.hxx";
%include "NCollection_BasePointerVector.hxx";
%include "NCollection_Map.hxx";
%include "NCollection_List.hxx";
%include "NCollection_Sequence.hxx";
%include "NCollection_DataMap.hxx";
%include "NCollection_IndexedMap.hxx";
%include "NCollection_IndexedDataMap.hxx";
%include "NCollection_DoubleMap.hxx";
// occt-800: HArray1/HArray2/HSequence are now plain template classes
// (the DEFINE_HARRAY1 / DEFINE_HSEQUENCE macros were removed). Declare
// SWIG-visible templates inheriting only from Standard_Transient so that
// %wrap_handle / %make_alias keep working without dragging the
// NCollection_Array1<T> base (which would force T to be a complete type
// in every translation unit that references the template instantiation).
template <typename TheItemType>
class NCollection_HArray1 : public Standard_Transient
{
public:
  NCollection_HArray1();
  NCollection_HArray1(const int theLower, const int theUpper);
  NCollection_HArray1(const int theLower, const int theUpper, const TheItemType& theValue);
  int Lower() const;
  int Upper() const;
  int Length() const;
  int Size() const;
  bool IsEmpty() const;
  void SetValue(const int theIndex, const TheItemType& theItem);
  const TheItemType& Value(const int theIndex) const;
  TheItemType& ChangeValue(const int theIndex);
  const TheItemType& First() const;
  const TheItemType& Last() const;
  void Init(const TheItemType& theValue);
};

template <typename TheItemType>
class NCollection_HArray2 : public Standard_Transient
{
public:
  NCollection_HArray2(const int theRowLower, const int theRowUpper,
                      const int theColLower, const int theColUpper);
  NCollection_HArray2(const int theRowLower, const int theRowUpper,
                      const int theColLower, const int theColUpper,
                      const TheItemType& theValue);
  int LowerRow() const;
  int UpperRow() const;
  int LowerCol() const;
  int UpperCol() const;
  int NbRows() const;
  int NbColumns() const;
  void SetValue(const int theRow, const int theCol, const TheItemType& theItem);
  const TheItemType& Value(const int theRow, const int theCol) const;
  TheItemType& ChangeValue(const int theRow, const int theCol);
  void Init(const TheItemType& theValue);
};

template <typename TheItemType>
class NCollection_HSequence : public Standard_Transient
{
public:
  NCollection_HSequence();
  int Size() const;
  int Length() const;
  bool IsEmpty() const;
  void Clear();
  void Append(const TheItemType& theItem);
  void Prepend(const TheItemType& theItem);
  void Reverse();
  const TheItemType& First() const;
  const TheItemType& Last() const;
  const TheItemType& Value(const int theIndex) const;
  void SetValue(const int theIndex, const TheItemType& theItem);
  void Remove(const int theIndex);
};
%include "NCollection_DefineAlloc.hxx";
%include "NCollection_UBTree.hxx";
%include "NCollection_UBTreeFiller.hxx";
%include "NCollection_Lerp.hxx";
%include "NCollection_Vector.hxx";
%include "NCollection_Vec2.hxx";
%include "NCollection_Vec3.hxx";
%include "NCollection_Vec4.hxx";
%include "NCollection_Mat4.hxx";
%include "NCollection_TListIterator.hxx";
%include "NCollection_UtfString.hxx";
%include "NCollection_UtfIterator.hxx";
%include "NCollection_SparseArray.hxx";

%ignore NCollection_List::First();
%ignore NCollection_List::Last();
%ignore NCollection_TListIterator::Value();

%ignore NCollection_Array2::Value();
%ignore NCollection_Array2::ChangeValue();
%ignore NCollection_Array2::operator();
/* public enums */
enum NCollection_CellFilter_Action {
	CellFilter_Keep = 0,
	CellFilter_Purge = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class NCollection_CellFilter_Action(IntEnum):
	CellFilter_Keep = 0
	CellFilter_Purge = 1
CellFilter_Keep = NCollection_CellFilter_Action.CellFilter_Keep
CellFilter_Purge = NCollection_CellFilter_Action.CellFilter_Purge
};
/* end python proxy for enums */

/* templates */
%template(NCollection_String) NCollection_UtfString<char>;
/* end templates declaration */

/* typedefs */
typedef NCollection_UtfString<char> NCollection_String;
/* end typedefs declaration */

/********************
* class KeyIndexRef *
********************/
/*************************
* class KeyValueIndexRef *
*************************/
/********************
* class KeyValueRef *
********************/
/*********************************
* class NCollection_AliasedArray *
*********************************/
/******************************
* class NCollection_Allocator *
******************************/
/***************************
* class NCollection_Array1 *
***************************/
/**********************************
* class NCollection_BaseAllocator *
**********************************/
/*****************************
* class NCollection_BaseList *
*****************************/
/****************************
* class NCollection_BaseMap *
****************************/
/**************************************
* class NCollection_BasePointerVector *
**************************************/
/*********************************
* class NCollection_BaseSequence *
*********************************/
/***************************
* class NCollection_Buffer *
***************************/
/*******************************
* class NCollection_CellFilter *
*******************************/
/**********************************
* class NCollection_DefaultHasher *
**********************************/
/*********************************
* class NCollection_DynamicArray *
*********************************/
/********************************
* class NCollection_FlatDataMap *
********************************/
/****************************
* class NCollection_FlatMap *
****************************/
/***************************
* class NCollection_Handle *
***************************/
/************************************
* class NCollection_IndexedIterator *
************************************/
/*****************************
* class NCollection_Iterator *
*****************************/
/***************************
* class NCollection_KDTree *
***************************/
/*************************
* class NCollection_Lerp *
*************************/
/*****************************
* class NCollection_ListNode *
*****************************/
/*******************************
* class NCollection_LocalArray *
*******************************/
/*************************
* class NCollection_Mat3 *
*************************/
/*************************
* class NCollection_Mat4 *
*************************/
/*********************************
* class NCollection_OccAllocator *
*********************************/
/******************************
* class NCollection_PackedMap *
******************************/
/****************************
* class NCollection_SeqNode *
****************************/
/************************************
* class NCollection_SparseArrayBase *
************************************/
/********************************
* class NCollection_StlIterator *
********************************/
/***************************
* class NCollection_UBTree *
***************************/
/*********************************
* class NCollection_UBTreeFiller *
*********************************/
/********************************
* class NCollection_UtfIterator *
********************************/
/******************************
* class NCollection_UtfString *
******************************/
/*************************
* class NCollection_Vec2 *
*************************/
/*************************
* class NCollection_Vec3 *
*************************/
/*************************
* class NCollection_Vec4 *
*************************/
/*************
* class View *
*************/
/************************************************************************
* class tuple_element<0,NCollection_ItemsView::KeyIndexRef<TheKeyType>> *
************************************************************************/
/**************************************************************************************************
* class tuple_element<0,NCollection_ItemsView::KeyValueIndexRef<TheKeyType,TheValueType,IsConst>> *
**************************************************************************************************/
/*********************************************************************************************
* class tuple_element<0,NCollection_ItemsView::KeyValueRef<TheKeyType,TheValueType,IsConst>> *
*********************************************************************************************/
/************************************************************************
* class tuple_element<1,NCollection_ItemsView::KeyIndexRef<TheKeyType>> *
************************************************************************/
/**************************************************************************************************
* class tuple_element<1,NCollection_ItemsView::KeyValueIndexRef<TheKeyType,TheValueType,IsConst>> *
**************************************************************************************************/
/*********************************************************************************************
* class tuple_element<1,NCollection_ItemsView::KeyValueRef<TheKeyType,TheValueType,IsConst>> *
*********************************************************************************************/
/**************************************************************************************************
* class tuple_element<2,NCollection_ItemsView::KeyValueIndexRef<TheKeyType,TheValueType,IsConst>> *
**************************************************************************************************/
/*******************************************************************
* class tuple_size<NCollection_ItemsView::KeyIndexRef<TheKeyType>> *
*******************************************************************/
/*********************************************************************************************
* class tuple_size<NCollection_ItemsView::KeyValueIndexRef<TheKeyType,TheValueType,IsConst>> *
*********************************************************************************************/
/****************************************************************************************
* class tuple_size<NCollection_ItemsView::KeyValueRef<TheKeyType,TheValueType,IsConst>> *
****************************************************************************************/
/*****************
* class Iterator *
*****************/
/*********************************
* class NCollection_AccAllocator *
*********************************/
/*************************************
* class NCollection_AlignedAllocator *
*************************************/
/***************************
* class NCollection_Array2 *
***************************/
/****************************
* class NCollection_DataMap *
****************************/
/******************************
* class NCollection_DoubleMap *
******************************/
/***************************
* class NCollection_EBTree *
***************************/
/****************************
* class NCollection_HArray1 *
****************************/
/****************************
* class NCollection_HArray2 *
****************************/
/******************************
* class NCollection_HSequence *
******************************/
/**********************************
* class NCollection_HeapAllocator *
**********************************/
/*********************************
* class NCollection_IncAllocator *
*********************************/
/***********************************
* class NCollection_IndexedDataMap *
***********************************/
/*******************************
* class NCollection_IndexedMap *
*******************************/
/*************************
* class NCollection_List *
*************************/
/************************
* class NCollection_Map *
************************/
/***********************************
* class NCollection_OrderedDataMap *
***********************************/
/*******************************
* class NCollection_OrderedMap *
*******************************/
/*****************************
* class NCollection_Sequence *
*****************************/
/***************************
* class NCollection_Shared *
***************************/
/********************************
* class NCollection_SparseArray *
********************************/
/**********************************
* class NCollection_TListIterator *
**********************************/
/******************************
* class NCollection_TListNode *
******************************/
/*************************************
* class NCollection_WinHeapAllocator *
*************************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class NCollection_AccAllocator:
	pass

@classnotwrapped
class NCollection_AliasedArray:
	pass

@classnotwrapped
class NCollection_AlignedAllocator:
	pass

@classnotwrapped
class NCollection_Allocator:
	pass

@classnotwrapped
class NCollection_Array1:
	pass

@classnotwrapped
class NCollection_Array2:
	pass

@classnotwrapped
class NCollection_BaseAllocator:
	pass

@classnotwrapped
class NCollection_BaseList:
	pass

@classnotwrapped
class NCollection_BaseMap:
	pass

@classnotwrapped
class NCollection_BasePointerVector:
	pass

@classnotwrapped
class NCollection_SeqNode:
	pass

@classnotwrapped
class NCollection_BaseSequence:
	pass

@classnotwrapped
class NCollection_Buffer:
	pass

@classnotwrapped
class NCollection_CellFilter:
	pass

@classnotwrapped
class NCollection_DataMap:
	pass

@classnotwrapped
class NCollection_DefaultHasher:
	pass

@classnotwrapped
class NCollection_DoubleMap:
	pass

@classnotwrapped
class NCollection_DynamicArray:
	pass

@classnotwrapped
class NCollection_EBTree:
	pass

@classnotwrapped
class NCollection_FlatDataMap:
	pass

@classnotwrapped
class NCollection_FlatMap:
	pass

@classnotwrapped
class NCollection_HArray1:
	pass

@classnotwrapped
class NCollection_HArray2:
	pass

@classnotwrapped
class NCollection_HSequence:
	pass

@classnotwrapped
class NCollection_Handle:
	pass

@classnotwrapped
class NCollection_HeapAllocator:
	pass

@classnotwrapped
class NCollection_IncAllocator:
	pass

@classnotwrapped
class NCollection_IndexedDataMap:
	pass

@classnotwrapped
class NCollection_IndexedIterator:
	pass

@classnotwrapped
class NCollection_IndexedMap:
	pass

@classnotwrapped
class KeyValueRef:
	pass

@classnotwrapped
class KeyValueIndexRef:
	pass

@classnotwrapped
class KeyIndexRef:
	pass

@classnotwrapped
class Iterator:
	pass

@classnotwrapped
class View:
	pass

@classnotwrapped
class tuple_size:
	pass

@classnotwrapped
class tuple_element:
	pass

@classnotwrapped
class NCollection_Iterator:
	pass

@classnotwrapped
class NCollection_KDTree:
	pass

@classnotwrapped
class NCollection_Lerp:
	pass

@classnotwrapped
class NCollection_List:
	pass

@classnotwrapped
class NCollection_ListNode:
	pass

@classnotwrapped
class NCollection_LocalArray:
	pass

@classnotwrapped
class NCollection_Map:
	pass

@classnotwrapped
class NCollection_Mat3:
	pass

@classnotwrapped
class NCollection_Mat4:
	pass

@classnotwrapped
class NCollection_OccAllocator:
	pass

@classnotwrapped
class NCollection_OrderedDataMap:
	pass

@classnotwrapped
class NCollection_OrderedMap:
	pass

@classnotwrapped
class NCollection_PackedMap:
	pass

@classnotwrapped
class NCollection_Sequence:
	pass

@classnotwrapped
class NCollection_Shared:
	pass

@classnotwrapped
class NCollection_SparseArray:
	pass

@classnotwrapped
class NCollection_SparseArrayBase:
	pass

@classnotwrapped
class NCollection_StlIterator:
	pass

@classnotwrapped
class NCollection_TListIterator:
	pass

@classnotwrapped
class NCollection_TListNode:
	pass

@classnotwrapped
class NCollection_UBTree:
	pass

@classnotwrapped
class NCollection_UBTreeFiller:
	pass

@classnotwrapped
class NCollection_UtfIterator:
	pass

@classnotwrapped
class NCollection_UtfString:
	pass

@classnotwrapped
class NCollection_Vec2:
	pass

@classnotwrapped
class NCollection_Vec3:
	pass

@classnotwrapped
class NCollection_Vec4:
	pass

@classnotwrapped
class NCollection_WinHeapAllocator:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
