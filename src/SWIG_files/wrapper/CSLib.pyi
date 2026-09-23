from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TColgp import *
from OCC.Core.gp import *
from OCC.Core.math import *
from OCC.Core.TColStd import *


class CSLib_DerivativeStatus(IntEnum):
    CSLib_Done = 0
    CSLib_D1uIsNull = 1
    CSLib_D1vIsNull = 2
    CSLib_D1IsNull = 3
    CSLib_D1uD1vRatioIsNull = 4
    CSLib_D1vD1uRatioIsNull = 5
    CSLib_D1uIsParallelD1v = 6

CSLib_Done = CSLib_DerivativeStatus.CSLib_Done
CSLib_D1uIsNull = CSLib_DerivativeStatus.CSLib_D1uIsNull
CSLib_D1vIsNull = CSLib_DerivativeStatus.CSLib_D1vIsNull
CSLib_D1IsNull = CSLib_DerivativeStatus.CSLib_D1IsNull
CSLib_D1uD1vRatioIsNull = CSLib_DerivativeStatus.CSLib_D1uD1vRatioIsNull
CSLib_D1vD1uRatioIsNull = CSLib_DerivativeStatus.CSLib_D1vD1uRatioIsNull
CSLib_D1uIsParallelD1v = CSLib_DerivativeStatus.CSLib_D1uIsParallelD1v

class CSLib_NormalStatus(IntEnum):
    CSLib_Singular = 0
    CSLib_Defined = 1
    CSLib_InfinityOfSolutions = 2
    CSLib_D1NuIsNull = 3
    CSLib_D1NvIsNull = 4
    CSLib_D1NIsNull = 5
    CSLib_D1NuNvRatioIsNull = 6
    CSLib_D1NvNuRatioIsNull = 7
    CSLib_D1NuIsParallelD1Nv = 8

CSLib_Singular = CSLib_NormalStatus.CSLib_Singular
CSLib_Defined = CSLib_NormalStatus.CSLib_Defined
CSLib_InfinityOfSolutions = CSLib_NormalStatus.CSLib_InfinityOfSolutions
CSLib_D1NuIsNull = CSLib_NormalStatus.CSLib_D1NuIsNull
CSLib_D1NvIsNull = CSLib_NormalStatus.CSLib_D1NvIsNull
CSLib_D1NIsNull = CSLib_NormalStatus.CSLib_D1NIsNull
CSLib_D1NuNvRatioIsNull = CSLib_NormalStatus.CSLib_D1NuNvRatioIsNull
CSLib_D1NvNuRatioIsNull = CSLib_NormalStatus.CSLib_D1NvNuRatioIsNull
CSLib_D1NuIsParallelD1Nv = CSLib_NormalStatus.CSLib_D1NuIsParallelD1Nv

class cslib:
    @overload
    @staticmethod
    def DNNUV(theNu: int, theNv: int, theDerSurf: TColgp_Array2OfVec) -> gp_Vec: ...
    @overload
    @staticmethod
    def DNNUV(theNu: int, theNv: int, theDerSurf1: TColgp_Array2OfVec, theDerSurf2: TColgp_Array2OfVec) -> gp_Vec: ...
    @staticmethod
    def DNNormal(theNu: int, theNv: int, theDerNUV: TColgp_Array2OfVec, theIduref: Optional[int] = 0, theIdvref: Optional[int] = 0) -> gp_Vec: ...
    @overload
    @staticmethod
    def Normal(theD1U: gp_Vec, theD1V: gp_Vec, theSinTol: float, theNormal: gp_Dir) -> CSLib_DerivativeStatus: ...
    @overload
    @staticmethod
    def Normal(theD1U: gp_Vec, theD1V: gp_Vec, theD2U: gp_Vec, theD2V: gp_Vec, theD2UV: gp_Vec, theSinTol: float, theNormal: gp_Dir) -> Tuple[bool, CSLib_NormalStatus]: ...
    @overload
    @staticmethod
    def Normal(theD1U: gp_Vec, theD1V: gp_Vec, theMagTol: float, theNormal: gp_Dir) -> CSLib_NormalStatus: ...
    @overload
    @staticmethod
    def Normal(theMaxOrder: int, theDerNUV: TColgp_Array2OfVec, theMagTol: float, theU: float, theV: float, theUmin: float, theUmax: float, theVmin: float, theVmax: float, theNormal: gp_Dir) -> Tuple[CSLib_NormalStatus, int, int]: ...

class CSLib_NormalPolyDef(math_FunctionWithDerivative):
    def __init__(self, theK0: int, theLi: TColStd_Array1OfReal) -> None: ...
    def Derivative(self, theX: float) -> Tuple[bool, float]: ...
    def Value(self, theX: float) -> Tuple[bool, float]: ...
    def Values(self, theX: float) -> Tuple[bool, float, float]: ...

#classnotwrapped
class CSLib_Class2d: ...

# harray1 classes
# harray2 classes
# hsequence classes

