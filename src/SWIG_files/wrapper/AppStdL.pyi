from typing import NewType, Optional, Tuple

from OCC.Core.AppStdL import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *


class AppStdL_Application(TDocStd_Application):
	def ResourcesName(self) -> str: ...
