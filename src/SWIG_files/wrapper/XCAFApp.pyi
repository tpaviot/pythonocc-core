from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *


class XCAFApp_Application(TDocStd_Application):
	@staticmethod
	def GetApplication() -> XCAFApp_Application: ...
	def InitDocument(self, aDoc: TDocStd_Document) -> None: ...
	def ResourcesName(self) -> str: ...

# harray1 classes
# harray2 classes
# hsequence classes

XCAFApp_Application_GetApplication = XCAFApp_Application.GetApplication
