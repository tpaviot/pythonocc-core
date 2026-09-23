from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class UnitsMethods_LengthUnit(IntEnum):
    UnitsMethods_LengthUnit_Undefined = 0
    UnitsMethods_LengthUnit_Inch = 1
    UnitsMethods_LengthUnit_Millimeter = 2
    UnitsMethods_LengthUnit_Foot = 4
    UnitsMethods_LengthUnit_Mile = 5
    UnitsMethods_LengthUnit_Meter = 6
    UnitsMethods_LengthUnit_Kilometer = 7
    UnitsMethods_LengthUnit_Mil = 8
    UnitsMethods_LengthUnit_Micron = 9
    UnitsMethods_LengthUnit_Centimeter = 10
    UnitsMethods_LengthUnit_Microinch = 11

UnitsMethods_LengthUnit_Undefined = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Undefined
UnitsMethods_LengthUnit_Inch = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Inch
UnitsMethods_LengthUnit_Millimeter = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Millimeter
UnitsMethods_LengthUnit_Foot = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Foot
UnitsMethods_LengthUnit_Mile = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Mile
UnitsMethods_LengthUnit_Meter = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Meter
UnitsMethods_LengthUnit_Kilometer = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Kilometer
UnitsMethods_LengthUnit_Mil = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Mil
UnitsMethods_LengthUnit_Micron = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Micron
UnitsMethods_LengthUnit_Centimeter = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Centimeter
UnitsMethods_LengthUnit_Microinch = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Microinch

class unitsmethods:
    @overload
    @staticmethod
    def DumpLengthUnit(theScaleFactor: float, theBaseUnit: Optional[UnitsMethods_LengthUnit] = UnitsMethods_LengthUnit_Millimeter) -> str: ...
    @overload
    @staticmethod
    def DumpLengthUnit(theUnit: UnitsMethods_LengthUnit) -> str: ...
    @staticmethod
    def GetCasCadeLengthUnit(theBaseUnit: Optional[UnitsMethods_LengthUnit] = UnitsMethods_LengthUnit_Millimeter) -> float: ...
    @staticmethod
    def GetLengthFactorValue(theUnit: int) -> float: ...
    @staticmethod
    def GetLengthUnitByFactorValue(theFactorValue: float, theBaseUnit: Optional[UnitsMethods_LengthUnit] = UnitsMethods_LengthUnit_Millimeter) -> UnitsMethods_LengthUnit: ...
    @staticmethod
    def GetLengthUnitScale(theFromUnit: UnitsMethods_LengthUnit, theToUnit: UnitsMethods_LengthUnit) -> float: ...
    @staticmethod
    def LengthUnitFromString(theStr: str, theCaseSensitive: bool) -> UnitsMethods_LengthUnit: ...
    @overload
    @staticmethod
    def SetCasCadeLengthUnit(theUnitValue: float, theBaseUnit: Optional[UnitsMethods_LengthUnit] = UnitsMethods_LengthUnit_Millimeter) -> None: ...
    @overload
    @staticmethod
    def SetCasCadeLengthUnit(theUnit: int) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

