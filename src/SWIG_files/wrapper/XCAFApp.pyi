from typing import NewType, Optional, Tuple

from OCC.Core.XCAFApp import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *


class XCAFApp_Application(TDocStd_Application):
	@staticmethod
	def GetApplication(self) -> XCAFApp_Application: ...
	def InitDocument(self, aDoc: TDocStd_Document) -> None: ...
	def ResourcesName(self) -> str: ...
