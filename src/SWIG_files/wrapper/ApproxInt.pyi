from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.math import *
from OCC.Core.TColStd import *
from OCC.Core.TColgp import *
from OCC.Core.IntPatch import *
from OCC.Core.Approx import *
from OCC.Core.gp import *
from OCC.Core.IntSurf import *


class ApproxInt_KnotTools:
    @staticmethod
    def DefineParType(theWL: IntPatch_WLine, theFpar: int, theLpar: int, theApproxXYZ: bool, theApproxU1V1: bool, theApproxU2V2: bool) -> Approx_ParametrizationType: ...

class ApproxInt_SvSurfaces:
    def Compute(self, Pt: gp_Pnt, Tg: gp_Vec, Tguv1: gp_Vec2d, Tguv2: gp_Vec2d) -> Tuple[bool, float, float, float, float]: ...
    def GetUseSolver(self) -> bool: ...
    def Pnt(self, u1: float, v1: float, u2: float, v2: float, P: gp_Pnt) -> None: ...
    def SeekPoint(self, u1: float, v1: float, u2: float, v2: float, Point: IntSurf_PntOn2S) -> bool: ...
    def SetUseSolver(self, theUseSol: bool) -> None: ...
    def Tangency(self, u1: float, v1: float, u2: float, v2: float, Tg: gp_Vec) -> bool: ...
    def TangencyOnSurf1(self, u1: float, v1: float, u2: float, v2: float, Tg: gp_Vec2d) -> bool: ...
    def TangencyOnSurf2(self, u1: float, v1: float, u2: float, v2: float, Tg: gp_Vec2d) -> bool: ...

# harray1 classes
# harray2 classes
# hsequence classes

