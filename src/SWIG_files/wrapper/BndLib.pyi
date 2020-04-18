from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *
from OCC.Core.Bnd import *
from OCC.Core.Adaptor2d import *
from OCC.Core.Geom2d import *
from OCC.Core.Adaptor3d import *


class bndlib:
	@overload
	@staticmethod
	def Add(L: gp_Lin, P1: float, P2: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(L: gp_Lin2d, P1: float, P2: float, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Circ, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Circ, P1: float, P2: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Circ2d, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Circ2d, P1: float, P2: float, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Elips, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Elips, P1: float, P2: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Elips2d, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(C: gp_Elips2d, P1: float, P2: float, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(P: gp_Parab, P1: float, P2: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(P: gp_Parab2d, P1: float, P2: float, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(H: gp_Hypr, P1: float, P2: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(H: gp_Hypr2d, P1: float, P2: float, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(S: gp_Cylinder, UMin: float, UMax: float, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(S: gp_Cylinder, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(S: gp_Cone, UMin: float, UMax: float, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(S: gp_Cone, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(S: gp_Sphere, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(S: gp_Sphere, UMin: float, UMax: float, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(P: gp_Torus, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(P: gp_Torus, UMin: float, UMax: float, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...

class BndLib_Add2dCurve:
	@overload
	@staticmethod
	def Add(C: Adaptor2d_Curve2d, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(C: Adaptor2d_Curve2d, U1: float, U2: float, Tol: float, B: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(C: Geom2d_Curve, Tol: float, Box: Bnd_Box2d) -> None: ...
	@overload
	@staticmethod
	def Add(C: Geom2d_Curve, U1: float, U2: float, Tol: float, B: Bnd_Box2d) -> None: ...
	@staticmethod
	def AddOptimal(C: Geom2d_Curve, U1: float, U2: float, Tol: float, B: Bnd_Box2d) -> None: ...

class BndLib_Add3dCurve:
	@overload
	@staticmethod
	def Add(C: Adaptor3d_Curve, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(C: Adaptor3d_Curve, U1: float, U2: float, Tol: float, B: Bnd_Box) -> None: ...
	@staticmethod
	def AddGenCurv(C: Adaptor3d_Curve, UMin: float, UMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def AddOptimal(C: Adaptor3d_Curve, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def AddOptimal(C: Adaptor3d_Curve, U1: float, U2: float, Tol: float, B: Bnd_Box) -> None: ...

class BndLib_AddSurface:
	@overload
	@staticmethod
	def Add(S: Adaptor3d_Surface, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def Add(S: Adaptor3d_Surface, UMin: float, UMax: float, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@staticmethod
	def AddGenSurf(S: Adaptor3d_Surface, UMin: float, UMax: float, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def AddOptimal(S: Adaptor3d_Surface, Tol: float, B: Bnd_Box) -> None: ...
	@overload
	@staticmethod
	def AddOptimal(S: Adaptor3d_Surface, UMin: float, UMax: float, VMin: float, VMax: float, Tol: float, B: Bnd_Box) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
bndlib_Add = bndlib.Add
BndLib_Add2dCurve_Add = BndLib_Add2dCurve.Add
BndLib_Add2dCurve_Add = BndLib_Add2dCurve.Add
BndLib_Add2dCurve_Add = BndLib_Add2dCurve.Add
BndLib_Add2dCurve_Add = BndLib_Add2dCurve.Add
BndLib_Add2dCurve_AddOptimal = BndLib_Add2dCurve.AddOptimal
BndLib_Add3dCurve_Add = BndLib_Add3dCurve.Add
BndLib_Add3dCurve_Add = BndLib_Add3dCurve.Add
BndLib_Add3dCurve_AddGenCurv = BndLib_Add3dCurve.AddGenCurv
BndLib_Add3dCurve_AddOptimal = BndLib_Add3dCurve.AddOptimal
BndLib_Add3dCurve_AddOptimal = BndLib_Add3dCurve.AddOptimal
BndLib_AddSurface_Add = BndLib_AddSurface.Add
BndLib_AddSurface_Add = BndLib_AddSurface.Add
BndLib_AddSurface_AddGenSurf = BndLib_AddSurface.AddGenSurf
BndLib_AddSurface_AddOptimal = BndLib_AddSurface.AddOptimal
BndLib_AddSurface_AddOptimal = BndLib_AddSurface.AddOptimal
