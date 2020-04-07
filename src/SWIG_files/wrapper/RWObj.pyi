from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.TCollection import *
from OCC.Core.Graphic3d import *
from OCC.Core.gp import *


class RWObj_SubMeshReason(IntEnum):
	RWObj_SubMeshReason_NewObject: int = ...
	RWObj_SubMeshReason_NewGroup: int = ...
	RWObj_SubMeshReason_NewMaterial: int = ...
	RWObj_SubMeshReason_NewSmoothGroup: int = ...
RWObj_SubMeshReason_NewObject = RWObj_SubMeshReason.RWObj_SubMeshReason_NewObject
RWObj_SubMeshReason_NewGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewGroup
RWObj_SubMeshReason_NewMaterial = RWObj_SubMeshReason.RWObj_SubMeshReason_NewMaterial
RWObj_SubMeshReason_NewSmoothGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewSmoothGroup

class RWObj_IShapeReceiver:
	def BindNamedShape(self, theShape: TopoDS_Shape, theName: TCollection_AsciiString, theMaterial: RWObj_Material, theIsRootShape: bool) -> None: ...

class RWObj_Material:
	def __init__(self) -> None: ...

class RWObj_SubMesh:
	pass

#classnotwrapped
class RWObj: ...

#classnotwrapped
class RWObj_MtlReader: ...

#classnotwrapped
class RWObj_CafReader: ...

#classnotwrapped
class RWObj_TriangulationReader: ...

#classnotwrapped
class RWObj_Reader: ...

# harray1 classes
# harray2 classes
# hsequence classes

