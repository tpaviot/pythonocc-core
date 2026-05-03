from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *


class bsplslib:
    @staticmethod
    def NoWeights() -> False: ...
    @staticmethod
    def UnitWeights(theNbUPoles: int, theNbVPoles: int) -> False: ...

class BSplSLib_Cache(Standard_Transient):
    def D0Local(self, theLocalU: float, theLocalV: float, thePoint: gp_Pnt) -> None: ...
    def D1Local(self, theLocalU: float, theLocalV: float, thePoint: gp_Pnt, theTangentU: gp_Vec, theTangentV: gp_Vec) -> None: ...
    def D2Local(self, theLocalU: float, theLocalV: float, thePoint: gp_Pnt, theTangentU: gp_Vec, theTangentV: gp_Vec, theCurvatureU: gp_Vec, theCurvatureV: gp_Vec, theCurvatureUV: gp_Vec) -> None: ...
    def IsCacheValid(self, theParameterU: float, theParameterV: float) -> bool: ...

class BSplSLib_EvaluatorFunction:
    pass

# harray1 classes
# harray2 classes
# hsequence classes

