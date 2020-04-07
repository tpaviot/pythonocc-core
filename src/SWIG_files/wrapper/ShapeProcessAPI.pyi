from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.ShapeProcess import *
from OCC.Core.TopTools import *
from OCC.Core.TopoDS import *
from OCC.Core.TopAbs import *


class ShapeProcessAPI_ApplySequence:
	def __init__(self, rscName: str, seqName: Optional[str] = "") -> None: ...
	def ClearMap(self) -> None: ...
	def Context(self) -> ShapeProcess_ShapeContext: ...
	def Map(self) -> TopTools_DataMapOfShapeShape: ...
	def PrepareShape(self, shape: TopoDS_Shape, fillmap: Optional[bool] = False, until: Optional[TopAbs_ShapeEnum] = TopAbs_SHAPE) -> TopoDS_Shape: ...
	def PrintPreparationResult(self) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

