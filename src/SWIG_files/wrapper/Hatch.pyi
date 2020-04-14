from typing import overload, NewType, Optional, Tuple

from OCC.Core.Hatch import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *


class Hatch_LineForm:
	Hatch_XLINE: int = ...
	Hatch_YLINE: int = ...
	Hatch_ANYLINE: int = ...

class Hatch_Hatcher:
	def __init__(self, Tol: float, Oriented: Optional[bool]) -> None: ...
	def AddLine(self, L: gp_Lin2d, T: Optional[Hatch_LineForm]) -> None: ...
	def AddLine(self, D: gp_Dir2d, Dist: float) -> None: ...
	def AddXLine(self, X: float) -> None: ...
	def AddYLine(self, Y: float) -> None: ...
	def Coordinate(self, I: int) -> float: ...
	def End(self, I: int, J: int) -> float: ...
	def EndIndex(self, I: int, J: int) -> Tuple[int, float]: ...
	def IsXLine(self, I: int) -> bool: ...
	def IsYLine(self, I: int) -> bool: ...
	def Line(self, I: int) -> gp_Lin2d: ...
	def LineForm(self, I: int) -> Hatch_LineForm: ...
	def NbIntervals(self) -> int: ...
	def NbIntervals(self, I: int) -> int: ...
	def NbLines(self) -> int: ...
	def Start(self, I: int, J: int) -> float: ...
	def StartIndex(self, I: int, J: int) -> Tuple[int, float]: ...
	def Tolerance(self, Tol: float) -> None: ...
	def Tolerance(self) -> float: ...
	def Trim(self, L: gp_Lin2d, Index: Optional[int]) -> None: ...
	def Trim(self, L: gp_Lin2d, Start: float, End: float, Index: Optional[int]) -> None: ...
	def Trim(self, P1: gp_Pnt2d, P2: gp_Pnt2d, Index: Optional[int]) -> None: ...

class Hatch_Line:
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, L: gp_Lin2d, T: Hatch_LineForm) -> None: ...
	def AddIntersection(self, Par1: float, Start: bool, Index: int, Par2: float, theToler: float) -> None: ...

class Hatch_Parameter:
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, Par1: float, Start: bool, Index: Optional[int], Par2: Optional[float]) -> None: ...