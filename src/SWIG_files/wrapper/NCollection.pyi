from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *

NCollection_String = NewType('NCollection_String', NCollection_Utf8String)
#the following typedef cannot be wrapped as is
NCollection_Utf16Iter = NewType('NCollection_Utf16Iter', Any)
#the following typedef cannot be wrapped as is
NCollection_Utf16String = NewType('NCollection_Utf16String', Any)
#the following typedef cannot be wrapped as is
NCollection_Utf32Iter = NewType('NCollection_Utf32Iter', Any)
#the following typedef cannot be wrapped as is
NCollection_Utf32String = NewType('NCollection_Utf32String', Any)
#the following typedef cannot be wrapped as is
NCollection_Utf8Iter = NewType('NCollection_Utf8Iter', Any)
#the following typedef cannot be wrapped as is
NCollection_Utf8String = NewType('NCollection_Utf8String', Any)
#the following typedef cannot be wrapped as is
NCollection_UtfWideIter = NewType('NCollection_UtfWideIter', Any)
#the following typedef cannot be wrapped as is
NCollection_UtfWideString = NewType('NCollection_UtfWideString', Any)
Standard_Size = NewType('Standard_Size', int)

class NCollection_StdAllocator:
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, theAlloc: NCollection_BaseAllocator) -> None: ...
	@overload
	def __init__(self, X: NCollection_StdAllocator) -> None: ...
	def Allocator(self) -> NCollection_BaseAllocator: ...

#classnotwrapped
class NCollection_Array1: ...

#classnotwrapped
class NCollection_AccAllocator: ...

#classnotwrapped
class NCollection_UtfString: ...

#classnotwrapped
class NCollection_Lerp: ...

#classnotwrapped
class NCollection_WinHeapAllocator: ...

#classnotwrapped
class NCollection_Mat4: ...

#classnotwrapped
class NCollection_AlignedAllocator: ...

#classnotwrapped
class NCollection_Map: ...

#classnotwrapped
class NCollection_SeqNode: ...

#classnotwrapped
class NCollection_BaseSequence: ...

#classnotwrapped
class NCollection_LocalArray: ...

#classnotwrapped
class NCollection_Comparator: ...

#classnotwrapped
class NCollection_TListNode: ...

#classnotwrapped
class NCollection_DataMap: ...

#classnotwrapped
class NCollection_ListNode: ...

#classnotwrapped
class NCollection_Vector: ...

#classnotwrapped
class NCollection_DoubleMap: ...

#classnotwrapped
class NCollection_UtfIterator: ...

#classnotwrapped
class NCollection_Vec3: ...

#classnotwrapped
class NCollection_UBTree: ...

#classnotwrapped
class NCollection_EBTree: ...

#classnotwrapped
class NCollection_Vec4: ...

#classnotwrapped
class NCollection_Handle: ...

#classnotwrapped
class NCollection_BaseList: ...

#classnotwrapped
class NCollection_SparseArray: ...

#classnotwrapped
class NCollection_BaseVector: ...

#classnotwrapped
class NCollection_IncAllocator: ...

#classnotwrapped
class NCollection_BaseAllocator: ...

#classnotwrapped
class NCollection_SparseArrayBase: ...

#classnotwrapped
class NCollection_IndexedMap: ...

#classnotwrapped
class NCollection_Vec2: ...

#classnotwrapped
class NCollection_List: ...

#classnotwrapped
class NCollection_TListIterator: ...

#classnotwrapped
class NCollection_BaseMap: ...

#classnotwrapped
class NCollection_Buffer: ...

#classnotwrapped
class NCollection_IndexedDataMap: ...

#classnotwrapped
class NCollection_StdAllocator: ...

#classnotwrapped
class NCollection_UBTreeFiller: ...

#classnotwrapped
class NCollection_DefaultHasher: ...

#classnotwrapped
class NCollection_Sequence: ...

#classnotwrapped
class NCollection_Array2: ...

#classnotwrapped
class NCollection_Shared: ...

#classnotwrapped
class NCollection_HeapAllocator: ...

# harray1 classes
# harray2 classes
# hsequence classes

