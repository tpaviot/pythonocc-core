from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class TopAbs_Orientation(IntEnum):
    TopAbs_FORWARD = 0
    TopAbs_REVERSED = 1
    TopAbs_INTERNAL = 2
    TopAbs_EXTERNAL = 3

TopAbs_FORWARD = TopAbs_Orientation.TopAbs_FORWARD
TopAbs_REVERSED = TopAbs_Orientation.TopAbs_REVERSED
TopAbs_INTERNAL = TopAbs_Orientation.TopAbs_INTERNAL
TopAbs_EXTERNAL = TopAbs_Orientation.TopAbs_EXTERNAL

class TopAbs_ShapeEnum(IntEnum):
    TopAbs_COMPOUND = 0
    TopAbs_COMPSOLID = 1
    TopAbs_SOLID = 2
    TopAbs_SHELL = 3
    TopAbs_FACE = 4
    TopAbs_WIRE = 5
    TopAbs_EDGE = 6
    TopAbs_VERTEX = 7
    TopAbs_SHAPE = 8

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
    TopAbs_IN = 0
    TopAbs_OUT = 1
    TopAbs_ON = 2
    TopAbs_UNKNOWN = 3

TopAbs_IN = TopAbs_State.TopAbs_IN
TopAbs_OUT = TopAbs_State.TopAbs_OUT
TopAbs_ON = TopAbs_State.TopAbs_ON
TopAbs_UNKNOWN = TopAbs_State.TopAbs_UNKNOWN

class topabs:
    @staticmethod
    def Complement(Or: TopAbs_Orientation) -> TopAbs_Orientation: ...
    @staticmethod
    def Compose(Or1: TopAbs_Orientation, Or2: TopAbs_Orientation) -> TopAbs_Orientation: ...
    @overload
    @staticmethod
    def Print(theShapeType: TopAbs_ShapeEnum) -> Tuple[Standard_OStream, str]: ...
    @overload
    @staticmethod
    def Print(theOrientation: TopAbs_Orientation) -> Tuple[Standard_OStream, str]: ...
    @overload
    @staticmethod
    def Print(St: TopAbs_State) -> Tuple[Standard_OStream, str]: ...
    @staticmethod
    def Reverse(Or: TopAbs_Orientation) -> TopAbs_Orientation: ...
    @overload
    @staticmethod
    def ShapeOrientationFromString(theOrientationString: str) -> TopAbs_Orientation: ...
    @overload
    @staticmethod
    def ShapeOrientationFromString(theOrientationString: str) -> Tuple[bool, TopAbs_Orientation]: ...
    @staticmethod
    def ShapeOrientationToString(theOrientation: TopAbs_Orientation) -> str: ...
    @overload
    @staticmethod
    def ShapeTypeFromString(theTypeString: str) -> TopAbs_ShapeEnum: ...
    @overload
    @staticmethod
    def ShapeTypeFromString(theTypeString: str) -> Tuple[bool, TopAbs_ShapeEnum]: ...
    @staticmethod
    def ShapeTypeToString(theType: TopAbs_ShapeEnum) -> str: ...

# harray1 classes
# harray2 classes
# hsequence classes

