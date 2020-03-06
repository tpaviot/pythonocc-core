from typing import NewType, Optional, Tuple

from OCC.Core.RWObj import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.TCollection import *
from OCC.Core.Graphic3d import *
from OCC.Core.gp import *


class RWObj_SubMeshReason:
	RWObj_SubMeshReason_NewObject: int = ...
	RWObj_SubMeshReason_NewGroup: int = ...
	RWObj_SubMeshReason_NewMaterial: int = ...
	RWObj_SubMeshReason_NewSmoothGroup: int = ...

class RWObj_IShapeReceiver:
	def BindNamedShape(self, theShape: TopoDS_Shape, theName: TCollection_AsciiString, theMaterial: RWObj_Material, theIsRootShape: bool) -> None: ...

class RWObj_Material:
	def __init__(self) -> None: ...

class RWObj_SubMesh:
	pass
