from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *
from OCC.Core.gp import *


class geomprojlib:
	@overload
	@staticmethod
	def Curve2d(C: Geom_Curve, First: float, Last: float, S: Geom_Surface, UFirst: float, ULast: float, VFirst: float, VLast: float) -> Tuple[Geom2d_Curve, float]: ...
	@overload
	@staticmethod
	def Curve2d(C: Geom_Curve, First: float, Last: float, S: Geom_Surface) -> Tuple[Geom2d_Curve, float]: ...
	@overload
	@staticmethod
	def Curve2d(C: Geom_Curve, First: float, Last: float, S: Geom_Surface) -> Geom2d_Curve: ...
	@overload
	@staticmethod
	def Curve2d(C: Geom_Curve, S: Geom_Surface) -> Geom2d_Curve: ...
	@overload
	@staticmethod
	def Curve2d(C: Geom_Curve, S: Geom_Surface, UDeb: float, UFin: float, VDeb: float, VFin: float) -> Geom2d_Curve: ...
	@overload
	@staticmethod
	def Curve2d(C: Geom_Curve, S: Geom_Surface, UDeb: float, UFin: float, VDeb: float, VFin: float) -> Tuple[Geom2d_Curve, float]: ...
	@staticmethod
	def Project(C: Geom_Curve, S: Geom_Surface) -> Geom_Curve: ...
	@staticmethod
	def ProjectOnPlane(Curve: Geom_Curve, Plane: Geom_Plane, Dir: gp_Dir, KeepParametrization: bool) -> Geom_Curve: ...

# harray1 classes
# harray2 classes
# hsequence classes

geomprojlib_Curve2d = geomprojlib.Curve2d
geomprojlib_Curve2d = geomprojlib.Curve2d
geomprojlib_Curve2d = geomprojlib.Curve2d
geomprojlib_Curve2d = geomprojlib.Curve2d
geomprojlib_Curve2d = geomprojlib.Curve2d
geomprojlib_Curve2d = geomprojlib.Curve2d
geomprojlib_Project = geomprojlib.Project
geomprojlib_ProjectOnPlane = geomprojlib.ProjectOnPlane
