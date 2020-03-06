from typing import NewType, Optional, Tuple

from OCC.Core.XBRepMesh import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.BRepMesh import *


class XBRepMesh:
	@staticmethod
	def Discret(self, theShape: TopoDS_Shape, theDeflection: float, theAngle: float, theAlgo: BRepMesh_DiscretRoot) -> int: ...
