from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *


class hermit:
	@overload
	@staticmethod
	def Solution(BS: Geom_BSplineCurve, TolPoles: Optional[float] = 0.000001, TolKnots: Optional[float] = 0.000001) -> Geom2d_BSplineCurve: ...
	@overload
	@staticmethod
	def Solution(BS: Geom2d_BSplineCurve, TolPoles: Optional[float] = 0.000001, TolKnots: Optional[float] = 0.000001) -> Geom2d_BSplineCurve: ...
	@staticmethod
	def Solutionbis(BS: Geom_BSplineCurve, TolPoles: Optional[float] = 0.000001, TolKnots: Optional[float] = 0.000001) -> Tuple[float, float]: ...

# harray1 classes
# harray2 classes
# hsequence classes

hermit_Solution = hermit.Solution
hermit_Solution = hermit.Solution
hermit_Solutionbis = hermit.Solutionbis
