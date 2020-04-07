from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.HLRBRep import *


class HLRAppli_ReflectLines:
	def __init__(self, aShape: TopoDS_Shape) -> None: ...
	def GetCompoundOf3dEdges(self, type: HLRBRep_TypeOfResultingEdge, visible: bool, In3d: bool) -> TopoDS_Shape: ...
	def GetResult(self) -> TopoDS_Shape: ...
	def Perform(self) -> None: ...
	def SetAxes(self, Nx: float, Ny: float, Nz: float, XAt: float, YAt: float, ZAt: float, XUp: float, YUp: float, ZUp: float) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

