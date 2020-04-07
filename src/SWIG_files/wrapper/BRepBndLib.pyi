from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.Bnd import *


class brepbndlib:
	@staticmethod
	def Add(S: TopoDS_Shape, B: Bnd_Box, useTriangulation: Optional[bool] = True) -> None: ...
	@staticmethod
	def AddClose(S: TopoDS_Shape, B: Bnd_Box) -> None: ...
	@staticmethod
	def AddOBB(theS: TopoDS_Shape, theOBB: Bnd_OBB, theIsTriangulationUsed: Optional[bool] = True, theIsOptimal: Optional[bool] = False, theIsShapeToleranceUsed: Optional[bool] = True) -> None: ...
	@staticmethod
	def AddOptimal(S: TopoDS_Shape, B: Bnd_Box, useTriangulation: Optional[bool] = True, useShapeTolerance: Optional[bool] = False) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

brepbndlib_Add = brepbndlib.Add
brepbndlib_AddClose = brepbndlib.AddClose
brepbndlib_AddOBB = brepbndlib.AddOBB
brepbndlib_AddOptimal = brepbndlib.AddOptimal
