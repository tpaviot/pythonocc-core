from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *

#the following typedef cannot be wrapped as is
BVH_Array2d = NewType('BVH_Array2d', Any)
#the following typedef cannot be wrapped as is
BVH_Array2f = NewType('BVH_Array2f', Any)
#the following typedef cannot be wrapped as is
BVH_Array2i = NewType('BVH_Array2i', Any)
#the following typedef cannot be wrapped as is
BVH_Array3d = NewType('BVH_Array3d', Any)
#the following typedef cannot be wrapped as is
BVH_Array3f = NewType('BVH_Array3f', Any)
#the following typedef cannot be wrapped as is
BVH_Array3i = NewType('BVH_Array3i', Any)
#the following typedef cannot be wrapped as is
BVH_Array4d = NewType('BVH_Array4d', Any)
#the following typedef cannot be wrapped as is
BVH_Array4f = NewType('BVH_Array4f', Any)
#the following typedef cannot be wrapped as is
BVH_Array4i = NewType('BVH_Array4i', Any)
#the following typedef cannot be wrapped as is
BVH_EncodedLink = NewType('BVH_EncodedLink', Any)
#the following typedef cannot be wrapped as is
BVH_Mat4d = NewType('BVH_Mat4d', Any)
#the following typedef cannot be wrapped as is
BVH_Mat4f = NewType('BVH_Mat4f', Any)
#the following typedef cannot be wrapped as is
BVH_PrimitiveSet3d = NewType('BVH_PrimitiveSet3d', Any)
#the following typedef cannot be wrapped as is
BVH_Vec2d = NewType('BVH_Vec2d', Any)
#the following typedef cannot be wrapped as is
BVH_Vec2f = NewType('BVH_Vec2f', Any)
#the following typedef cannot be wrapped as is
BVH_Vec2i = NewType('BVH_Vec2i', Any)
#the following typedef cannot be wrapped as is
BVH_Vec3d = NewType('BVH_Vec3d', Any)
#the following typedef cannot be wrapped as is
BVH_Vec3f = NewType('BVH_Vec3f', Any)
#the following typedef cannot be wrapped as is
BVH_Vec3i = NewType('BVH_Vec3i', Any)
#the following typedef cannot be wrapped as is
BVH_Vec4d = NewType('BVH_Vec4d', Any)
#the following typedef cannot be wrapped as is
BVH_Vec4f = NewType('BVH_Vec4f', Any)
#the following typedef cannot be wrapped as is
BVH_Vec4i = NewType('BVH_Vec4i', Any)

class BVH_AxisSelector:
	@staticmethod
	def MainAxis(theSize: BVH_VecNt) -> int: ...

class BVH_Tree():
	def __init__(self) -> None: ...
	@overload
	def AddInnerNode(self, theMinPoint: BVH_VecNt, theMaxPoint: BVH_VecNt, theLftChild: int, theRghChild: int) -> False: ...
	@overload
	def AddInnerNode(self, theLftChild: int, theRghChild: int) -> False: ...
	@overload
	def AddLeafNode(self, theMinPoint: BVH_VecNt, theMaxPoint: BVH_VecNt, theBegElem: int, theEndElem: int) -> False: ...
	@overload
	def AddLeafNode(self, theBegElem: int, theEndElem: int) -> False: ...
	def Clear(self) -> None: ...
	def CollapseToQuadTree(self) -> False: ...
	def EstimateSAH(self) -> False: ...
	def Reserve(self, theNbNodes: int) -> None: ...
	def SetInner(self, theNodeIndex: int) -> None: ...
	def SetOuter(self, theNodeIndex: int) -> None: ...

class BVH_Tree():
	def __init__(self) -> None: ...

#classnotwrapped
class BVH_Tools: ...

#classnotwrapped
class BVH_BuildTool: ...

#classnotwrapped
class BVH_BuildThread: ...

#classnotwrapped
class BVH_Sorter: ...

#classnotwrapped
class BVH_ObjectSet: ...

#classnotwrapped
class BVH_Box: ...

#classnotwrapped
class CenterAxis: ...

#classnotwrapped
class SurfaceCalculator: ...

#classnotwrapped
class BoxMinMax: ...

#classnotwrapped
class BVH_Distance: ...

#classnotwrapped
class BVH_ObjectTransient: ...

#classnotwrapped
class BVH_Object: ...

#classnotwrapped
class BVH_QuickSorter: ...

#classnotwrapped
class BVH_Set: ...

#classnotwrapped
class BVH_SpatialMedianBuilder: ...

#classnotwrapped
class BVH_Tree: ...

#classnotwrapped
class BVH_PrimitiveSet: ...

#classnotwrapped
class BVH_BuildQueue: ...

#classnotwrapped
class BVH_BuilderTransient: ...

#classnotwrapped
class BVH_Builder: ...

#classnotwrapped
class BVH_Properties: ...

#classnotwrapped
class BVH_Transform: ...

#classnotwrapped
class MatrixOp: ...

#classnotwrapped
class UnitVector: ...

#classnotwrapped
class BVH_RadixSorter: ...

#classnotwrapped
class BitPredicate: ...

#classnotwrapped
class BitComparator: ...

#classnotwrapped
class RadixSorter: ...

#classnotwrapped
class VectorType: ...

#classnotwrapped
class MatrixType: ...

#classnotwrapped
class ArrayType: ...

#classnotwrapped
class VecComp: ...

#classnotwrapped
class Array: ...

#classnotwrapped
class BVH_Triangulation: ...

#classnotwrapped
class BVH_PairDistance: ...

#classnotwrapped
class BVH_TreeBaseTransient: ...

#classnotwrapped
class BVH_TreeBase: ...

#classnotwrapped
class BVH_QuadTree: ...

#classnotwrapped
class BVH_BinaryTree: ...

#classnotwrapped
class BVH_SweepPlaneBuilder: ...

#classnotwrapped
class BVH_BaseTraverse: ...

#classnotwrapped
class BVH_Traverse: ...

#classnotwrapped
class BVH_PairTraverse: ...

#classnotwrapped
class BVH_BoxSet: ...

#classnotwrapped
class BVH_Geometry: ...

#classnotwrapped
class BVH_QueueBuilder: ...

#classnotwrapped
class BVH_DistanceField: ...

#classnotwrapped
class BVH_LinearBuilder: ...

#classnotwrapped
class BoundData: ...

#classnotwrapped
class UpdateBoundTask: ...

#classnotwrapped
class BVH_Bin: ...

#classnotwrapped
class BVH_BinnedBuilder: ...

#classnotwrapped
class BVH_AxisSelector: ...

# harray1 classes
# harray2 classes
# hsequence classes

