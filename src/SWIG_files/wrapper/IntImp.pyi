from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *


class IntImp_ConstIsoparametric(IntEnum):
	IntImp_UIsoparametricOnCaro1: int = ...
	IntImp_VIsoparametricOnCaro1: int = ...
	IntImp_UIsoparametricOnCaro2: int = ...
	IntImp_VIsoparametricOnCaro2: int = ...
IntImp_UIsoparametricOnCaro1 = IntImp_ConstIsoparametric.IntImp_UIsoparametricOnCaro1
IntImp_VIsoparametricOnCaro1 = IntImp_ConstIsoparametric.IntImp_VIsoparametricOnCaro1
IntImp_UIsoparametricOnCaro2 = IntImp_ConstIsoparametric.IntImp_UIsoparametricOnCaro2
IntImp_VIsoparametricOnCaro2 = IntImp_ConstIsoparametric.IntImp_VIsoparametricOnCaro2

# harray1 classes
# harray2 classes
# hsequence classes

