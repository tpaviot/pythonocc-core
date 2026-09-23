from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class IntImp_ConstIsoparametric(IntEnum):
    IntImp_UIsoparametricOnCaro1 = 0
    IntImp_VIsoparametricOnCaro1 = 1
    IntImp_UIsoparametricOnCaro2 = 2
    IntImp_VIsoparametricOnCaro2 = 3

IntImp_UIsoparametricOnCaro1 = IntImp_ConstIsoparametric.IntImp_UIsoparametricOnCaro1
IntImp_VIsoparametricOnCaro1 = IntImp_ConstIsoparametric.IntImp_VIsoparametricOnCaro1
IntImp_UIsoparametricOnCaro2 = IntImp_ConstIsoparametric.IntImp_UIsoparametricOnCaro2
IntImp_VIsoparametricOnCaro2 = IntImp_ConstIsoparametric.IntImp_VIsoparametricOnCaro2

# harray1 classes
# harray2 classes
# hsequence classes

