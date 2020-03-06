from typing import NewType, Optional, Tuple

from OCC.Core.GeomProjLib import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *
from OCC.Core.gp import *


class GeomProjLib:
	@staticmethod
	def Curve2d(self, C: Geom_Curve, First: float, Last: float, S: Geom_Surface, UFirst: float, ULast: float, VFirst: float, VLast: float) -> Tuple[Geom2d_Curve, float]: ...
	@staticmethod
	def Curve2d(self, C: Geom_Curve, First: float, Last: float, S: Geom_Surface) -> Tuple[Geom2d_Curve, float]: ...
	@staticmethod
	def Curve2d(self, C: Geom_Curve, First: float, Last: float, S: Geom_Surface) -> Geom2d_Curve: ...
	@staticmethod
	def Curve2d(self, C: Geom_Curve, S: Geom_Surface) -> Geom2d_Curve: ...
	@staticmethod
	def Curve2d(self, C: Geom_Curve, S: Geom_Surface, UDeb: float, UFin: float, VDeb: float, VFin: float) -> Geom2d_Curve: ...
	@staticmethod
	def Curve2d(self, C: Geom_Curve, S: Geom_Surface, UDeb: float, UFin: float, VDeb: float, VFin: float) -> Tuple[Geom2d_Curve, float]: ...
	@staticmethod
	def Project(self, C: Geom_Curve, S: Geom_Surface) -> Geom_Curve: ...
	@staticmethod
	def ProjectOnPlane(self, Curve: Geom_Curve, Plane: Geom_Plane, Dir: gp_Dir, KeepParametrization: bool) -> Geom_Curve: ...
