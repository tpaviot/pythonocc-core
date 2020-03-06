from typing import NewType, Optional, Tuple

from OCC.Core.ShapeAlgo import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.ShapeFix import *


class ShapeAlgo:
	@staticmethod
	def AlgoContainer(self) -> ShapeAlgo_AlgoContainer: ...
	@staticmethod
	def Init(self) -> None: ...
	@staticmethod
	def SetAlgoContainer(self, aContainer: ShapeAlgo_AlgoContainer) -> None: ...

class ShapeAlgo_ToolContainer(Standard_Transient):
	def __init__(self) -> None: ...
	def EdgeProjAux(self) -> ShapeFix_EdgeProjAux: ...
	def FixShape(self) -> ShapeFix_Shape: ...
