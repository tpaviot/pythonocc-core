from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.BRepAdaptor import *
from OCC.Core.GeomAbs import *
from OCC.Core.gp import *


class breplprop:
    @overload
    @staticmethod
    def Continuity(C1: BRepAdaptor_Curve, C2: BRepAdaptor_Curve, u1: float, u2: float, tl: float, ta: float) -> GeomAbs_Shape: ...
    @overload
    @staticmethod
    def Continuity(C1: BRepAdaptor_Curve, C2: BRepAdaptor_Curve, u1: float, u2: float) -> GeomAbs_Shape: ...

class BRepLProp_SurfaceTool:
    @staticmethod
    def Continuity(S: BRepAdaptor_Surface) -> int: ...
    @staticmethod
    def D1(S: BRepAdaptor_Surface, U: float, V: float, P: gp_Pnt, D1U: gp_Vec, D1V: gp_Vec) -> None: ...
    @staticmethod
    def D2(S: BRepAdaptor_Surface, U: float, V: float, P: gp_Pnt, D1U: gp_Vec, D1V: gp_Vec, D2U: gp_Vec, D2V: gp_Vec, DUV: gp_Vec) -> None: ...
    @staticmethod
    def DN(S: BRepAdaptor_Surface, U: float, V: float, IU: int, IV: int) -> gp_Vec: ...
    @staticmethod
    def Value(S: BRepAdaptor_Surface, U: float, V: float, P: gp_Pnt) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

