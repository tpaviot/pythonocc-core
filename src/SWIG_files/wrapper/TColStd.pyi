from typing import overload, NewType, Optional, Tuple

from OCC.Core.TColStd import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TCollection import *


class TColStd_HPackedMapOfInteger(Standard_Transient):
	@overload
	def __init__(self, NbBuckets: Optional[int]) -> None: ...
	@overload
	def __init__(self, theOther: TColStd_PackedMapOfInteger) -> None: ...
	def ChangeMap(self) -> TColStd_PackedMapOfInteger: ...
	def Map(self) -> TColStd_PackedMapOfInteger: ...
