from typing import NewType, Optional, Tuple

from OCC.Core.BRepBndLib import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.Bnd import *


class BRepBndLib:
	@staticmethod
	def Add(self, S: TopoDS_Shape, B: Bnd_Box, useTriangulation: Optional[bool]) -> None: ...
	@staticmethod
	def AddClose(self, S: TopoDS_Shape, B: Bnd_Box) -> None: ...
	@staticmethod
	def AddOBB(self, theS: TopoDS_Shape, theOBB: Bnd_OBB, theIsTriangulationUsed: Optional[bool], theIsOptimal: Optional[bool], theIsShapeToleranceUsed: Optional[bool]) -> None: ...
	@staticmethod
	def AddOptimal(self, S: TopoDS_Shape, B: Bnd_Box, useTriangulation: Optional[bool], useShapeTolerance: Optional[bool]) -> None: ...
