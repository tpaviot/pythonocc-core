from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Units import *


class UnitsAPI_SystemUnits(IntEnum):
	UnitsAPI_DEFAULT: int = ...
	UnitsAPI_SI: int = ...
	UnitsAPI_MDTV: int = ...
UnitsAPI_DEFAULT = UnitsAPI_SystemUnits.UnitsAPI_DEFAULT
UnitsAPI_SI = UnitsAPI_SystemUnits.UnitsAPI_SI
UnitsAPI_MDTV = UnitsAPI_SystemUnits.UnitsAPI_MDTV

class unitsapi:
	@staticmethod
	def AnyFromLS(aData: float, aUnit: str) -> float: ...
	@staticmethod
	def AnyFromSI(aData: float, aUnit: str) -> float: ...
	@staticmethod
	def AnyToAny(aData: float, aUnit1: str, aUnit2: str) -> float: ...
	@overload
	@staticmethod
	def AnyToLS(aData: float, aUnit: str) -> float: ...
	@overload
	@staticmethod
	def AnyToLS(aData: float, aUnit: str, aDim: Units_Dimensions) -> float: ...
	@overload
	@staticmethod
	def AnyToSI(aData: float, aUnit: str) -> float: ...
	@overload
	@staticmethod
	def AnyToSI(aData: float, aUnit: str, aDim: Units_Dimensions) -> float: ...
	@staticmethod
	def Check(aQuantity: str, aUnit: str) -> bool: ...
	@staticmethod
	def CurrentFromAny(aData: float, aQuantity: str, aUnit: str) -> float: ...
	@staticmethod
	def CurrentFromLS(aData: float, aQuantity: str) -> float: ...
	@staticmethod
	def CurrentFromSI(aData: float, aQuantity: str) -> float: ...
	@staticmethod
	def CurrentToAny(aData: float, aQuantity: str, aUnit: str) -> float: ...
	@staticmethod
	def CurrentToLS(aData: float, aQuantity: str) -> float: ...
	@staticmethod
	def CurrentToSI(aData: float, aQuantity: str) -> float: ...
	@staticmethod
	def CurrentUnit(aQuantity: str) -> str: ...
	@staticmethod
	def DimensionAmountOfSubstance() -> Units_Dimensions: ...
	@staticmethod
	def DimensionElectricCurrent() -> Units_Dimensions: ...
	@staticmethod
	def DimensionLength() -> Units_Dimensions: ...
	@staticmethod
	def DimensionLess() -> Units_Dimensions: ...
	@staticmethod
	def DimensionLuminousIntensity() -> Units_Dimensions: ...
	@staticmethod
	def DimensionMass() -> Units_Dimensions: ...
	@staticmethod
	def DimensionPlaneAngle() -> Units_Dimensions: ...
	@staticmethod
	def DimensionSolidAngle() -> Units_Dimensions: ...
	@staticmethod
	def DimensionThermodynamicTemperature() -> Units_Dimensions: ...
	@staticmethod
	def DimensionTime() -> Units_Dimensions: ...
	@staticmethod
	def Dimensions(aQuantity: str) -> Units_Dimensions: ...
	@staticmethod
	def LSToSI(aData: float, aQuantity: str) -> float: ...
	@staticmethod
	def LocalSystem() -> UnitsAPI_SystemUnits: ...
	@staticmethod
	def Reload() -> None: ...
	@staticmethod
	def SIToLS(aData: float, aQuantity: str) -> float: ...
	@staticmethod
	def Save() -> None: ...
	@staticmethod
	def SetCurrentUnit(aQuantity: str, aUnit: str) -> None: ...
	@staticmethod
	def SetLocalSystem(aSystemUnit: Optional[UnitsAPI_SystemUnits] = UnitsAPI_SI) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

unitsapi_AnyFromLS = unitsapi.AnyFromLS
unitsapi_AnyFromSI = unitsapi.AnyFromSI
unitsapi_AnyToAny = unitsapi.AnyToAny
unitsapi_AnyToLS = unitsapi.AnyToLS
unitsapi_AnyToLS = unitsapi.AnyToLS
unitsapi_AnyToSI = unitsapi.AnyToSI
unitsapi_AnyToSI = unitsapi.AnyToSI
unitsapi_Check = unitsapi.Check
unitsapi_CurrentFromAny = unitsapi.CurrentFromAny
unitsapi_CurrentFromLS = unitsapi.CurrentFromLS
unitsapi_CurrentFromSI = unitsapi.CurrentFromSI
unitsapi_CurrentToAny = unitsapi.CurrentToAny
unitsapi_CurrentToLS = unitsapi.CurrentToLS
unitsapi_CurrentToSI = unitsapi.CurrentToSI
unitsapi_CurrentUnit = unitsapi.CurrentUnit
unitsapi_DimensionAmountOfSubstance = unitsapi.DimensionAmountOfSubstance
unitsapi_DimensionElectricCurrent = unitsapi.DimensionElectricCurrent
unitsapi_DimensionLength = unitsapi.DimensionLength
unitsapi_DimensionLess = unitsapi.DimensionLess
unitsapi_DimensionLuminousIntensity = unitsapi.DimensionLuminousIntensity
unitsapi_DimensionMass = unitsapi.DimensionMass
unitsapi_DimensionPlaneAngle = unitsapi.DimensionPlaneAngle
unitsapi_DimensionSolidAngle = unitsapi.DimensionSolidAngle
unitsapi_DimensionThermodynamicTemperature = unitsapi.DimensionThermodynamicTemperature
unitsapi_DimensionTime = unitsapi.DimensionTime
unitsapi_Dimensions = unitsapi.Dimensions
unitsapi_LSToSI = unitsapi.LSToSI
unitsapi_LocalSystem = unitsapi.LocalSystem
unitsapi_Reload = unitsapi.Reload
unitsapi_SIToLS = unitsapi.SIToLS
unitsapi_Save = unitsapi.Save
unitsapi_SetCurrentUnit = unitsapi.SetCurrentUnit
unitsapi_SetLocalSystem = unitsapi.SetLocalSystem
