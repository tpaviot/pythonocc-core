from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.BRepMesh import *


class xbrepmesh:
	@staticmethod
	def Discret(theShape: TopoDS_Shape, theDeflection: float, theAngle: float, theAlgo: BRepMesh_DiscretRoot) -> int: ...

# harray1 classes
# harray2 classes
# hsequence classes

xbrepmesh_Discret = xbrepmesh.Discret
