from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.BRepMesh import *
from OCC.Core.TopoDS import *


class XBRepMesh_Factory(BRepMesh_DiscretAlgoFactory):
    def __init__(self) -> None: ...
    def CreateAlgorithm(self, theShape: TopoDS_Shape, theLinDeflection: float, theAngDeflection: float) -> BRepMesh_DiscretRoot: ...

# harray1 classes
# harray2 classes
# hsequence classes

