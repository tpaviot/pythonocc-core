from typing import NewType, Optional, Tuple

from OCC.Core.IntImpParGen import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.IntRes2d import *
from OCC.Core.gp import *


class IntImpParGen:
	@staticmethod
	def DeterminePosition(self, Pos1: IntRes2d_Position, Dom1: IntRes2d_Domain, P1: gp_Pnt2d, Tol: float) -> None: ...
	@staticmethod
	def DetermineTransition(self, Pos1: IntRes2d_Position, Tan1: gp_Vec2d, Norm1: gp_Vec2d, Trans1: IntRes2d_Transition, Pos2: IntRes2d_Position, Tan2: gp_Vec2d, Norm2: gp_Vec2d, Trans2: IntRes2d_Transition, Tol: float) -> None: ...
	@staticmethod
	def DetermineTransition(self, Pos1: IntRes2d_Position, Tan1: gp_Vec2d, Trans1: IntRes2d_Transition, Pos2: IntRes2d_Position, Tan2: gp_Vec2d, Trans2: IntRes2d_Transition, Tol: float) -> bool: ...
	@staticmethod
	def NormalizeOnDomain(self, Dom1: IntRes2d_Domain) -> Tuple[float, float]: ...
