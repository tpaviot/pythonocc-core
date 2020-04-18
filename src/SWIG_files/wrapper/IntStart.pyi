from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *
from OCC.Core.TopAbs import *


class IntStart_SITopolTool(Standard_Transient):
	def Classify(self, P: gp_Pnt2d, Tol: float) -> TopAbs_State: ...

# harray1 classes
# harray2 classes
# hsequence classes

