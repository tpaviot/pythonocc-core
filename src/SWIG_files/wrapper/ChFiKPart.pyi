from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Adaptor2d import *
from OCC.Core.TopOpeBRepDS import *
from OCC.Core.ChFiDS import *
from OCC.Core.Adaptor3d import *
from OCC.Core.TopAbs import *
from OCC.Core.gp import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *
from OCC.Core.GeomAdaptor import *


class ChFiKPart_ComputeData:
	@staticmethod
	def Compute(DStr: TopOpeBRepDS_DataStructure, Data: ChFiDS_SurfData, S1: Adaptor3d_HSurface, S2: Adaptor3d_HSurface, Or1: TopAbs_Orientation, Or2: TopAbs_Orientation, Sp: ChFiDS_Spine, Iedge: int) -> bool: ...
	@overload
	@staticmethod
	def ComputeCorner(DStr: TopOpeBRepDS_DataStructure, Data: ChFiDS_SurfData, S1: Adaptor3d_HSurface, S2: Adaptor3d_HSurface, OrFace1: TopAbs_Orientation, OrFace2: TopAbs_Orientation, Or1: TopAbs_Orientation, Or2: TopAbs_Orientation, minRad: float, majRad: float, P1S1: gp_Pnt2d, P2S1: gp_Pnt2d, P1S2: gp_Pnt2d, P2S2: gp_Pnt2d) -> bool: ...
	@overload
	@staticmethod
	def ComputeCorner(DStr: TopOpeBRepDS_DataStructure, Data: ChFiDS_SurfData, S1: Adaptor3d_HSurface, S2: Adaptor3d_HSurface, OrFace1: TopAbs_Orientation, OrFace2: TopAbs_Orientation, Or1: TopAbs_Orientation, Or2: TopAbs_Orientation, Rad: float, PS1: gp_Pnt2d, P1S2: gp_Pnt2d, P2S2: gp_Pnt2d) -> bool: ...
	@overload
	@staticmethod
	def ComputeCorner(DStr: TopOpeBRepDS_DataStructure, Data: ChFiDS_SurfData, S: Adaptor3d_HSurface, S1: Adaptor3d_HSurface, S2: Adaptor3d_HSurface, OfS: TopAbs_Orientation, OS: TopAbs_Orientation, OS1: TopAbs_Orientation, OS2: TopAbs_Orientation, Radius: float) -> bool: ...

# harray1 classes
# harray2 classes
# hsequence classes

ChFiKPart_ComputeData_Compute = ChFiKPart_ComputeData.Compute
ChFiKPart_ComputeData_ComputeCorner = ChFiKPart_ComputeData.ComputeCorner
ChFiKPart_ComputeData_ComputeCorner = ChFiKPart_ComputeData.ComputeCorner
ChFiKPart_ComputeData_ComputeCorner = ChFiKPart_ComputeData.ComputeCorner
