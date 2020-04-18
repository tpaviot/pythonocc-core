from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.IntRes2d import *
from OCC.Core.gp import *


class intimppargen:
	@staticmethod
	def DeterminePosition(Pos1: IntRes2d_Position, Dom1: IntRes2d_Domain, P1: gp_Pnt2d, Tol: float) -> None: ...
	@overload
	@staticmethod
	def DetermineTransition(Pos1: IntRes2d_Position, Tan1: gp_Vec2d, Norm1: gp_Vec2d, Trans1: IntRes2d_Transition, Pos2: IntRes2d_Position, Tan2: gp_Vec2d, Norm2: gp_Vec2d, Trans2: IntRes2d_Transition, Tol: float) -> None: ...
	@overload
	@staticmethod
	def DetermineTransition(Pos1: IntRes2d_Position, Tan1: gp_Vec2d, Trans1: IntRes2d_Transition, Pos2: IntRes2d_Position, Tan2: gp_Vec2d, Trans2: IntRes2d_Transition, Tol: float) -> bool: ...
	@staticmethod
	def NormalizeOnDomain(Dom1: IntRes2d_Domain) -> Tuple[float, float]: ...

#classnotwrapped
class IntImpParGen_ImpTool: ...

# harray1 classes
# harray2 classes
# hsequence classes

intimppargen_DeterminePosition = intimppargen.DeterminePosition
intimppargen_DetermineTransition = intimppargen.DetermineTransition
intimppargen_DetermineTransition = intimppargen.DetermineTransition
intimppargen_NormalizeOnDomain = intimppargen.NormalizeOnDomain
