from typing import NewType, Optional, Tuple

from OCC.Core.RWStl import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.OSD import *
from OCC.Core.Message import *
from OCC.Core.Poly import *


class RWStl:
	@staticmethod
	def ReadAscii(self, thePath: OSD_Path, theProgInd: Optional[Message_ProgressIndicator]) -> Poly_Triangulation: ...
	@staticmethod
	def ReadBinary(self, thePath: OSD_Path, theProgInd: Optional[Message_ProgressIndicator]) -> Poly_Triangulation: ...
	@staticmethod
	def ReadFile(self, theFile: OSD_Path, aProgInd: Optional[Message_ProgressIndicator]) -> Poly_Triangulation: ...
	@staticmethod
	def ReadFile(self, theFile: str, aProgInd: Optional[Message_ProgressIndicator]) -> Poly_Triangulation: ...
	@staticmethod
	def WriteAscii(self, theMesh: Poly_Triangulation, thePath: OSD_Path, theProgInd: Optional[Message_ProgressIndicator]) -> bool: ...
	@staticmethod
	def WriteBinary(self, theMesh: Poly_Triangulation, thePath: OSD_Path, theProgInd: Optional[Message_ProgressIndicator]) -> bool: ...
