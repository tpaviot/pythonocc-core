from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class TopAbs_Orientation(IntEnum):
	TopAbs_FORWARD: int = ...
	TopAbs_REVERSED: int = ...
	TopAbs_INTERNAL: int = ...
	TopAbs_EXTERNAL: int = ...
TopAbs_FORWARD = TopAbs_Orientation.TopAbs_FORWARD
TopAbs_REVERSED = TopAbs_Orientation.TopAbs_REVERSED
TopAbs_INTERNAL = TopAbs_Orientation.TopAbs_INTERNAL
TopAbs_EXTERNAL = TopAbs_Orientation.TopAbs_EXTERNAL

class TopAbs_ShapeEnum(IntEnum):
	TopAbs_COMPOUND: int = ...
	TopAbs_COMPSOLID: int = ...
	TopAbs_SOLID: int = ...
	TopAbs_SHELL: int = ...
	TopAbs_FACE: int = ...
	TopAbs_WIRE: int = ...
	TopAbs_EDGE: int = ...
	TopAbs_VERTEX: int = ...
	TopAbs_SHAPE: int = ...
TopAbs_COMPOUND = TopAbs_ShapeEnum.TopAbs_COMPOUND
TopAbs_COMPSOLID = TopAbs_ShapeEnum.TopAbs_COMPSOLID
TopAbs_SOLID = TopAbs_ShapeEnum.TopAbs_SOLID
TopAbs_SHELL = TopAbs_ShapeEnum.TopAbs_SHELL
TopAbs_FACE = TopAbs_ShapeEnum.TopAbs_FACE
TopAbs_WIRE = TopAbs_ShapeEnum.TopAbs_WIRE
TopAbs_EDGE = TopAbs_ShapeEnum.TopAbs_EDGE
TopAbs_VERTEX = TopAbs_ShapeEnum.TopAbs_VERTEX
TopAbs_SHAPE = TopAbs_ShapeEnum.TopAbs_SHAPE

class TopAbs_State(IntEnum):
	TopAbs_IN: int = ...
	TopAbs_OUT: int = ...
	TopAbs_ON: int = ...
	TopAbs_UNKNOWN: int = ...
TopAbs_IN = TopAbs_State.TopAbs_IN
TopAbs_OUT = TopAbs_State.TopAbs_OUT
TopAbs_ON = TopAbs_State.TopAbs_ON
TopAbs_UNKNOWN = TopAbs_State.TopAbs_UNKNOWN

class topabs:
	@staticmethod
	def Complement(Or: TopAbs_Orientation) -> TopAbs_Orientation: ...
	@staticmethod
	def Compose(Or1: TopAbs_Orientation, Or2: TopAbs_Orientation) -> TopAbs_Orientation: ...
	@staticmethod
	def Reverse(Or: TopAbs_Orientation) -> TopAbs_Orientation: ...
	@overload
	@staticmethod
	def ShapeOrientationFromString(theOrientationString: str) -> TopAbs_Orientation: ...
	@overload
	@staticmethod
	def ShapeOrientationFromString(theOrientationString: str, theOrientation: TopAbs_Orientation) -> bool: ...
	@staticmethod
	def ShapeOrientationToString(theOrientation: TopAbs_Orientation) -> str: ...
	@overload
	@staticmethod
	def ShapeTypeFromString(theTypeString: str) -> TopAbs_ShapeEnum: ...
	@overload
	@staticmethod
	def ShapeTypeFromString(theTypeString: str, theType: TopAbs_ShapeEnum) -> bool: ...
	@staticmethod
	def ShapeTypeToString(theType: TopAbs_ShapeEnum) -> str: ...

# harray1 classes
# harray2 classes
# hsequence classes

topabs_Complement = topabs.Complement
topabs_Compose = topabs.Compose
topabs_Print = topabs.Print
topabs_Print = topabs.Print
topabs_Print = topabs.Print
topabs_Reverse = topabs.Reverse
topabs_ShapeOrientationFromString = topabs.ShapeOrientationFromString
topabs_ShapeOrientationFromString = topabs.ShapeOrientationFromString
topabs_ShapeOrientationToString = topabs.ShapeOrientationToString
topabs_ShapeTypeFromString = topabs.ShapeTypeFromString
topabs_ShapeTypeFromString = topabs.ShapeTypeFromString
topabs_ShapeTypeToString = topabs.ShapeTypeToString
