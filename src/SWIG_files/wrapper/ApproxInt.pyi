from typing import NewType, Optional, Tuple

from OCC.Core.ApproxInt import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TColgp import *
from OCC.Core.math import *
from OCC.Core.gp import *
from OCC.Core.IntSurf import *


class ApproxInt_KnotTools:
	pass

class ApproxInt_SvSurfaces:
	def Compute(self, Pt: gp_Pnt, Tg: gp_Vec, Tguv1: gp_Vec2d, Tguv2: gp_Vec2d) -> Tuple[bool, float, float, float, float]: ...
	def Pnt(self, u1: float, v1: float, u2: float, v2: float, P: gp_Pnt) -> None: ...
	def SeekPoint(self, u1: float, v1: float, u2: float, v2: float, Point: IntSurf_PntOn2S) -> bool: ...
	def Tangency(self, u1: float, v1: float, u2: float, v2: float, Tg: gp_Vec) -> bool: ...
	def TangencyOnSurf1(self, u1: float, v1: float, u2: float, v2: float, Tg: gp_Vec2d) -> bool: ...
	def TangencyOnSurf2(self, u1: float, v1: float, u2: float, v2: float, Tg: gp_Vec2d) -> bool: ...
