from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *
from OCC.Core.TopAbs import *


class TopCnx_EdgeFaceTransition:
	def __init__(self) -> None: ...
	def AddInterference(self, Tole: float, Tang: gp_Dir, Norm: gp_Dir, Curv: float, Or: TopAbs_Orientation, Tr: TopAbs_Orientation, BTr: TopAbs_Orientation) -> None: ...
	def BoundaryTransition(self) -> TopAbs_Orientation: ...
	@overload
	def Reset(self, Tgt: gp_Dir, Norm: gp_Dir, Curv: float) -> None: ...
	@overload
	def Reset(self, Tgt: gp_Dir) -> None: ...
	def Transition(self) -> TopAbs_Orientation: ...

# harray1 classes
# harray2 classes
# hsequence classes

