from typing import NewType, Optional, Tuple

from OCC.Core.AppStd import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *


class AppStd_Application(TDocStd_Application):
	def ResourcesName(self) -> str: ...
