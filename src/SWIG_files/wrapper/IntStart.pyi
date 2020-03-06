from typing import NewType, Optional, Tuple

from OCC.Core.IntStart import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *
from OCC.Core.TopAbs import *


class IntStart_SITopolTool(Standard_Transient):
	def Classify(self, P: gp_Pnt2d, Tol: float) -> TopAbs_State: ...
