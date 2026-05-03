from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Geom import *
from OCC.Core.GeomAbs import *
from OCC.Core.LProp import *
from OCC.Core.Geom2d import *


class geomlprop:
    @overload
    @staticmethod
    def Continuity(C1: Geom_Curve, C2: Geom_Curve, u1: float, u2: float, r1: bool, r2: bool, tl: float, ta: float) -> GeomAbs_Shape: ...
    @overload
    @staticmethod
    def Continuity(C1: Geom_Curve, C2: Geom_Curve, u1: float, u2: float, r1: bool, r2: bool) -> GeomAbs_Shape: ...

class GeomLProp_CurAndInf2d(LProp_CurAndInf):
    def __init__(self) -> None: ...
    def IsDone(self) -> bool: ...
    def Perform(self, C: Geom2d_Curve) -> None: ...
    def PerformCurExt(self, C: Geom2d_Curve) -> None: ...
    def PerformInf(self, C: Geom2d_Curve) -> None: ...

#classnotwrapped
class GeomLProp_CLPropsBase: ...

#classnotwrapped
class GeomLProp_SLPropsBase: ...

# harray1 classes
# harray2 classes
# hsequence classes

