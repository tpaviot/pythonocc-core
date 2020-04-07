from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *


class elclib:
	@staticmethod
	def AdjustPeriodic(UFirst: float, ULast: float, Precision: float) -> Tuple[float, float]: ...
	@overload
	@staticmethod
	def CircleD1(U: float, Pos: gp_Ax2, Radius: float, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def CircleD1(U: float, Pos: gp_Ax22d, Radius: float, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def CircleD2(U: float, Pos: gp_Ax2, Radius: float, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def CircleD2(U: float, Pos: gp_Ax22d, Radius: float, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def CircleD3(U: float, Pos: gp_Ax2, Radius: float, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec, V3: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def CircleD3(U: float, Pos: gp_Ax22d, Radius: float, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d, V3: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def CircleDN(U: float, Pos: gp_Ax2, Radius: float, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def CircleDN(U: float, Pos: gp_Ax22d, Radius: float, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def CircleParameter(Pos: gp_Ax2, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def CircleParameter(Pos: gp_Ax22d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def CircleValue(U: float, Pos: gp_Ax2, Radius: float) -> gp_Pnt: ...
	@overload
	@staticmethod
	def CircleValue(U: float, Pos: gp_Ax22d, Radius: float) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def D1(U: float, L: gp_Lin, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, C: gp_Circ, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, E: gp_Elips, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, H: gp_Hypr, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, Prb: gp_Parab, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, L: gp_Lin2d, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, C: gp_Circ2d, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, E: gp_Elips2d, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, H: gp_Hypr2d, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D1(U: float, Prb: gp_Parab2d, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, C: gp_Circ, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, E: gp_Elips, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, H: gp_Hypr, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, Prb: gp_Parab, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, C: gp_Circ2d, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, E: gp_Elips2d, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, H: gp_Hypr2d, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D2(U: float, Prb: gp_Parab2d, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D3(U: float, C: gp_Circ, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec, V3: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D3(U: float, E: gp_Elips, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec, V3: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D3(U: float, H: gp_Hypr, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec, V3: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def D3(U: float, C: gp_Circ2d, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d, V3: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D3(U: float, E: gp_Elips2d, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d, V3: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def D3(U: float, H: gp_Hypr2d, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d, V3: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def DN(U: float, L: gp_Lin, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def DN(U: float, C: gp_Circ, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def DN(U: float, E: gp_Elips, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def DN(U: float, H: gp_Hypr, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def DN(U: float, Prb: gp_Parab, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def DN(U: float, L: gp_Lin2d, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def DN(U: float, C: gp_Circ2d, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def DN(U: float, E: gp_Elips2d, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def DN(U: float, H: gp_Hypr2d, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def DN(U: float, Prb: gp_Parab2d, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def EllipseD1(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def EllipseD1(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def EllipseD2(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def EllipseD2(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def EllipseD3(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec, V3: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def EllipseD3(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d, V3: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def EllipseDN(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def EllipseDN(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def EllipseParameter(Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def EllipseParameter(Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def EllipseValue(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float) -> gp_Pnt: ...
	@overload
	@staticmethod
	def EllipseValue(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def HyperbolaD1(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def HyperbolaD1(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def HyperbolaD2(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def HyperbolaD2(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def HyperbolaD3(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec, V3: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def HyperbolaD3(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d, V3: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def HyperbolaDN(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def HyperbolaDN(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def HyperbolaParameter(Pos: gp_Ax2, MajorRadius: float, MinorRadius: float, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def HyperbolaParameter(Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def HyperbolaValue(U: float, Pos: gp_Ax2, MajorRadius: float, MinorRadius: float) -> gp_Pnt: ...
	@overload
	@staticmethod
	def HyperbolaValue(U: float, Pos: gp_Ax22d, MajorRadius: float, MinorRadius: float) -> gp_Pnt2d: ...
	@staticmethod
	def InPeriod(U: float, UFirst: float, ULast: float) -> float: ...
	@overload
	@staticmethod
	def LineD1(U: float, Pos: gp_Ax1, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def LineD1(U: float, Pos: gp_Ax2d, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def LineDN(U: float, Pos: gp_Ax1, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def LineDN(U: float, Pos: gp_Ax2d, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def LineParameter(Pos: gp_Ax1, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def LineParameter(Pos: gp_Ax2d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def LineValue(U: float, Pos: gp_Ax1) -> gp_Pnt: ...
	@overload
	@staticmethod
	def LineValue(U: float, Pos: gp_Ax2d) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def ParabolaD1(U: float, Pos: gp_Ax2, Focal: float, P: gp_Pnt, V1: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def ParabolaD1(U: float, Pos: gp_Ax22d, Focal: float, P: gp_Pnt2d, V1: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def ParabolaD2(U: float, Pos: gp_Ax2, Focal: float, P: gp_Pnt, V1: gp_Vec, V2: gp_Vec) -> None: ...
	@overload
	@staticmethod
	def ParabolaD2(U: float, Pos: gp_Ax22d, Focal: float, P: gp_Pnt2d, V1: gp_Vec2d, V2: gp_Vec2d) -> None: ...
	@overload
	@staticmethod
	def ParabolaDN(U: float, Pos: gp_Ax2, Focal: float, N: int) -> gp_Vec: ...
	@overload
	@staticmethod
	def ParabolaDN(U: float, Pos: gp_Ax22d, Focal: float, N: int) -> gp_Vec2d: ...
	@overload
	@staticmethod
	def ParabolaParameter(Pos: gp_Ax2, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def ParabolaParameter(Pos: gp_Ax22d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def ParabolaValue(U: float, Pos: gp_Ax2, Focal: float) -> gp_Pnt: ...
	@overload
	@staticmethod
	def ParabolaValue(U: float, Pos: gp_Ax22d, Focal: float) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def Parameter(L: gp_Lin, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def Parameter(L: gp_Lin2d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def Parameter(C: gp_Circ, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def Parameter(C: gp_Circ2d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def Parameter(E: gp_Elips, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def Parameter(E: gp_Elips2d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def Parameter(H: gp_Hypr, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def Parameter(H: gp_Hypr2d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def Parameter(Prb: gp_Parab, P: gp_Pnt) -> float: ...
	@overload
	@staticmethod
	def Parameter(Prb: gp_Parab2d, P: gp_Pnt2d) -> float: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, P: gp_Pnt2d) -> gp_Pnt: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, V: gp_Vec2d) -> gp_Vec: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, V: gp_Dir2d) -> gp_Dir: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, A: gp_Ax2d) -> gp_Ax1: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, A: gp_Ax22d) -> gp_Ax2: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, L: gp_Lin2d) -> gp_Lin: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, C: gp_Circ2d) -> gp_Circ: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, E: gp_Elips2d) -> gp_Elips: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, H: gp_Hypr2d) -> gp_Hypr: ...
	@overload
	@staticmethod
	def To3d(Pos: gp_Ax2, Prb: gp_Parab2d) -> gp_Parab: ...
	@overload
	@staticmethod
	def Value(U: float, L: gp_Lin) -> gp_Pnt: ...
	@overload
	@staticmethod
	def Value(U: float, C: gp_Circ) -> gp_Pnt: ...
	@overload
	@staticmethod
	def Value(U: float, E: gp_Elips) -> gp_Pnt: ...
	@overload
	@staticmethod
	def Value(U: float, H: gp_Hypr) -> gp_Pnt: ...
	@overload
	@staticmethod
	def Value(U: float, Prb: gp_Parab) -> gp_Pnt: ...
	@overload
	@staticmethod
	def Value(U: float, L: gp_Lin2d) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def Value(U: float, C: gp_Circ2d) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def Value(U: float, E: gp_Elips2d) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def Value(U: float, H: gp_Hypr2d) -> gp_Pnt2d: ...
	@overload
	@staticmethod
	def Value(U: float, Prb: gp_Parab2d) -> gp_Pnt2d: ...

# harray1 classes
# harray2 classes
# hsequence classes

elclib_AdjustPeriodic = elclib.AdjustPeriodic
elclib_CircleD1 = elclib.CircleD1
elclib_CircleD1 = elclib.CircleD1
elclib_CircleD2 = elclib.CircleD2
elclib_CircleD2 = elclib.CircleD2
elclib_CircleD3 = elclib.CircleD3
elclib_CircleD3 = elclib.CircleD3
elclib_CircleDN = elclib.CircleDN
elclib_CircleDN = elclib.CircleDN
elclib_CircleParameter = elclib.CircleParameter
elclib_CircleParameter = elclib.CircleParameter
elclib_CircleValue = elclib.CircleValue
elclib_CircleValue = elclib.CircleValue
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D1 = elclib.D1
elclib_D2 = elclib.D2
elclib_D2 = elclib.D2
elclib_D2 = elclib.D2
elclib_D2 = elclib.D2
elclib_D2 = elclib.D2
elclib_D2 = elclib.D2
elclib_D2 = elclib.D2
elclib_D2 = elclib.D2
elclib_D3 = elclib.D3
elclib_D3 = elclib.D3
elclib_D3 = elclib.D3
elclib_D3 = elclib.D3
elclib_D3 = elclib.D3
elclib_D3 = elclib.D3
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_DN = elclib.DN
elclib_EllipseD1 = elclib.EllipseD1
elclib_EllipseD1 = elclib.EllipseD1
elclib_EllipseD2 = elclib.EllipseD2
elclib_EllipseD2 = elclib.EllipseD2
elclib_EllipseD3 = elclib.EllipseD3
elclib_EllipseD3 = elclib.EllipseD3
elclib_EllipseDN = elclib.EllipseDN
elclib_EllipseDN = elclib.EllipseDN
elclib_EllipseParameter = elclib.EllipseParameter
elclib_EllipseParameter = elclib.EllipseParameter
elclib_EllipseValue = elclib.EllipseValue
elclib_EllipseValue = elclib.EllipseValue
elclib_HyperbolaD1 = elclib.HyperbolaD1
elclib_HyperbolaD1 = elclib.HyperbolaD1
elclib_HyperbolaD2 = elclib.HyperbolaD2
elclib_HyperbolaD2 = elclib.HyperbolaD2
elclib_HyperbolaD3 = elclib.HyperbolaD3
elclib_HyperbolaD3 = elclib.HyperbolaD3
elclib_HyperbolaDN = elclib.HyperbolaDN
elclib_HyperbolaDN = elclib.HyperbolaDN
elclib_HyperbolaParameter = elclib.HyperbolaParameter
elclib_HyperbolaParameter = elclib.HyperbolaParameter
elclib_HyperbolaValue = elclib.HyperbolaValue
elclib_HyperbolaValue = elclib.HyperbolaValue
elclib_InPeriod = elclib.InPeriod
elclib_LineD1 = elclib.LineD1
elclib_LineD1 = elclib.LineD1
elclib_LineDN = elclib.LineDN
elclib_LineDN = elclib.LineDN
elclib_LineParameter = elclib.LineParameter
elclib_LineParameter = elclib.LineParameter
elclib_LineValue = elclib.LineValue
elclib_LineValue = elclib.LineValue
elclib_ParabolaD1 = elclib.ParabolaD1
elclib_ParabolaD1 = elclib.ParabolaD1
elclib_ParabolaD2 = elclib.ParabolaD2
elclib_ParabolaD2 = elclib.ParabolaD2
elclib_ParabolaDN = elclib.ParabolaDN
elclib_ParabolaDN = elclib.ParabolaDN
elclib_ParabolaParameter = elclib.ParabolaParameter
elclib_ParabolaParameter = elclib.ParabolaParameter
elclib_ParabolaValue = elclib.ParabolaValue
elclib_ParabolaValue = elclib.ParabolaValue
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_Parameter = elclib.Parameter
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_To3d = elclib.To3d
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
elclib_Value = elclib.Value
