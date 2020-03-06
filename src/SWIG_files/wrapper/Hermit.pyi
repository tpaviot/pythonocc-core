from typing import NewType, Optional, Tuple

from OCC.Core.Hermit import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *


class Hermit:
	@staticmethod
	def Solution(self, BS: Geom_BSplineCurve, TolPoles: Optional[float], TolKnots: Optional[float]) -> Geom2d_BSplineCurve: ...
	@staticmethod
	def Solution(self, BS: Geom2d_BSplineCurve, TolPoles: Optional[float], TolKnots: Optional[float]) -> Geom2d_BSplineCurve: ...
	@staticmethod
	def Solutionbis(self, BS: Geom_BSplineCurve, TolPoles: Optional[float], TolKnots: Optional[float]) -> Tuple[float, float]: ...
