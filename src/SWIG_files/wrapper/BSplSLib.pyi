from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TColStd import *
from OCC.Core.TColgp import *
from OCC.Core.gp import *


class bsplslib:
	@overload
	@staticmethod
	def BuildCache(U: float, V: float, USpanDomain: float, VSpanDomain: float, UPeriodicFlag: bool, VPeriodicFlag: bool, UDegree: int, VDegree: int, UIndex: int, VIndex: int, UFlatKnots: TColStd_Array1OfReal, VFlatKnots: TColStd_Array1OfReal, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, CachePoles: TColgp_Array2OfPnt, CacheWeights: TColStd_Array2OfReal) -> None: ...
	@overload
	@staticmethod
	def BuildCache(theU: float, theV: float, theUSpanDomain: float, theVSpanDomain: float, theUPeriodic: bool, theVPeriodic: bool, theUDegree: int, theVDegree: int, theUIndex: int, theVIndex: int, theUFlatKnots: TColStd_Array1OfReal, theVFlatKnots: TColStd_Array1OfReal, thePoles: TColgp_Array2OfPnt, theWeights: TColStd_Array2OfReal, theCacheArray: TColStd_Array2OfReal) -> None: ...
	@staticmethod
	def CacheD0(U: float, V: float, UDegree: int, VDegree: int, UCacheParameter: float, VCacheParameter: float, USpanLenght: float, VSpanLength: float, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Point: gp_Pnt) -> None: ...
	@staticmethod
	def CacheD1(U: float, V: float, UDegree: int, VDegree: int, UCacheParameter: float, VCacheParameter: float, USpanLenght: float, VSpanLength: float, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Point: gp_Pnt, VecU: gp_Vec, VecV: gp_Vec) -> None: ...
	@staticmethod
	def CacheD2(U: float, V: float, UDegree: int, VDegree: int, UCacheParameter: float, VCacheParameter: float, USpanLenght: float, VSpanLength: float, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Point: gp_Pnt, VecU: gp_Vec, VecV: gp_Vec, VecUU: gp_Vec, VecUV: gp_Vec, VecVV: gp_Vec) -> None: ...
	@staticmethod
	def CoefsD0(U: float, V: float, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Point: gp_Pnt) -> None: ...
	@staticmethod
	def CoefsD1(U: float, V: float, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Point: gp_Pnt, VecU: gp_Vec, VecV: gp_Vec) -> None: ...
	@staticmethod
	def CoefsD2(U: float, V: float, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Point: gp_Pnt, VecU: gp_Vec, VecV: gp_Vec, VecUU: gp_Vec, VecUV: gp_Vec, VecVV: gp_Vec) -> None: ...
	@staticmethod
	def D0(U: float, V: float, UIndex: int, VIndex: int, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, UDegree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, P: gp_Pnt) -> None: ...
	@staticmethod
	def D1(U: float, V: float, UIndex: int, VIndex: int, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, Degree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, P: gp_Pnt, Vu: gp_Vec, Vv: gp_Vec) -> None: ...
	@staticmethod
	def D2(U: float, V: float, UIndex: int, VIndex: int, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, UDegree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, P: gp_Pnt, Vu: gp_Vec, Vv: gp_Vec, Vuu: gp_Vec, Vvv: gp_Vec, Vuv: gp_Vec) -> None: ...
	@staticmethod
	def D3(U: float, V: float, UIndex: int, VIndex: int, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, UDegree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, P: gp_Pnt, Vu: gp_Vec, Vv: gp_Vec, Vuu: gp_Vec, Vvv: gp_Vec, Vuv: gp_Vec, Vuuu: gp_Vec, Vvvv: gp_Vec, Vuuv: gp_Vec, Vuvv: gp_Vec) -> None: ...
	@staticmethod
	def DN(U: float, V: float, Nu: int, Nv: int, UIndex: int, VIndex: int, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, UDegree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, Vn: gp_Vec) -> None: ...
	@staticmethod
	def FunctionMultiply(Function: BSplSLib_EvaluatorFunction, UBSplineDegree: int, VBSplineDegree: int, UBSplineKnots: TColStd_Array1OfReal, VBSplineKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UFlatKnots: TColStd_Array1OfReal, VFlatKnots: TColStd_Array1OfReal, UNewDegree: int, VNewDegree: int, NewNumerator: TColgp_Array2OfPnt, NewDenominator: TColStd_Array2OfReal) -> int: ...
	@overload
	@staticmethod
	def GetPoles(FP: TColStd_Array1OfReal, Poles: TColgp_Array2OfPnt, UDirection: bool) -> None: ...
	@overload
	@staticmethod
	def GetPoles(FP: TColStd_Array1OfReal, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UDirection: bool) -> None: ...
	@staticmethod
	def HomogeneousD0(U: float, V: float, UIndex: int, VIndex: int, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, UDegree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, P: gp_Pnt) -> float: ...
	@staticmethod
	def HomogeneousD1(U: float, V: float, UIndex: int, VIndex: int, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, UDegree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, N: gp_Pnt, Nu: gp_Vec, Nv: gp_Vec) -> Tuple[float, float, float]: ...
	@staticmethod
	def IncreaseDegree(UDirection: bool, Degree: int, NewDegree: int, Periodic: bool, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, NewPoles: TColgp_Array2OfPnt, NewWeights: TColStd_Array2OfReal, NewKnots: TColStd_Array1OfReal, NewMults: TColStd_Array1OfInteger) -> None: ...
	@staticmethod
	def InsertKnots(UDirection: bool, Degree: int, Periodic: bool, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, AddKnots: TColStd_Array1OfReal, AddMults: TColStd_Array1OfInteger, NewPoles: TColgp_Array2OfPnt, NewWeights: TColStd_Array2OfReal, NewKnots: TColStd_Array1OfReal, NewMults: TColStd_Array1OfInteger, Epsilon: float, Add: Optional[bool] = True) -> None: ...
	@overload
	@staticmethod
	def Interpolate(UDegree: int, VDegree: int, UFlatKnots: TColStd_Array1OfReal, VFlatKnots: TColStd_Array1OfReal, UParameters: TColStd_Array1OfReal, VParameters: TColStd_Array1OfReal, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal) -> int: ...
	@overload
	@staticmethod
	def Interpolate(UDegree: int, VDegree: int, UFlatKnots: TColStd_Array1OfReal, VFlatKnots: TColStd_Array1OfReal, UParameters: TColStd_Array1OfReal, VParameters: TColStd_Array1OfReal, Poles: TColgp_Array2OfPnt) -> int: ...
	@staticmethod
	def IsRational(Weights: TColStd_Array2OfReal, I1: int, I2: int, J1: int, J2: int, Epsilon: Optional[float] = 0.0) -> bool: ...
	@staticmethod
	def Iso(Param: float, IsU: bool, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, Degree: int, Periodic: bool, CPoles: TColgp_Array1OfPnt, CWeights: TColStd_Array1OfReal) -> None: ...
	@staticmethod
	def MovePoint(U: float, V: float, Displ: gp_Vec, UIndex1: int, UIndex2: int, VIndex1: int, VIndex2: int, UDegree: int, VDegree: int, Rational: bool, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UFlatKnots: TColStd_Array1OfReal, VFlatKnots: TColStd_Array1OfReal, NewPoles: TColgp_Array2OfPnt) -> Tuple[int, int, int, int]: ...
	@staticmethod
	def NoWeights() -> TColStd_Array2OfReal: ...
	@overload
	@staticmethod
	def PolesCoefficients(Poles: TColgp_Array2OfPnt, CachePoles: TColgp_Array2OfPnt) -> None: ...
	@overload
	@staticmethod
	def PolesCoefficients(Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, CachePoles: TColgp_Array2OfPnt, CacheWeights: TColStd_Array2OfReal) -> None: ...
	@staticmethod
	def RationalDerivative(UDeg: int, VDeg: int, N: int, M: int, All: Optional[bool] = True) -> Tuple[float, float]: ...
	@staticmethod
	def RemoveKnot(UDirection: bool, Index: int, Mult: int, Degree: int, Periodic: bool, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, NewPoles: TColgp_Array2OfPnt, NewWeights: TColStd_Array2OfReal, NewKnots: TColStd_Array1OfReal, NewMults: TColStd_Array1OfInteger, Tolerance: float) -> bool: ...
	@staticmethod
	def Resolution(Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, UKnots: TColStd_Array1OfReal, VKnots: TColStd_Array1OfReal, UMults: TColStd_Array1OfInteger, VMults: TColStd_Array1OfInteger, UDegree: int, VDegree: int, URat: bool, VRat: bool, UPer: bool, VPer: bool, Tolerance3D: float) -> Tuple[float, float]: ...
	@overload
	@staticmethod
	def Reverse(Poles: TColgp_Array2OfPnt, Last: int, UDirection: bool) -> None: ...
	@overload
	@staticmethod
	def Reverse(Weights: TColStd_Array2OfReal, Last: int, UDirection: bool) -> None: ...
	@overload
	@staticmethod
	def SetPoles(Poles: TColgp_Array2OfPnt, FP: TColStd_Array1OfReal, UDirection: bool) -> None: ...
	@overload
	@staticmethod
	def SetPoles(Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, FP: TColStd_Array1OfReal, UDirection: bool) -> None: ...
	@staticmethod
	def Unperiodize(UDirection: bool, Degree: int, Mults: TColStd_Array1OfInteger, Knots: TColStd_Array1OfReal, Poles: TColgp_Array2OfPnt, Weights: TColStd_Array2OfReal, NewMults: TColStd_Array1OfInteger, NewKnots: TColStd_Array1OfReal, NewPoles: TColgp_Array2OfPnt, NewWeights: TColStd_Array2OfReal) -> None: ...

class BSplSLib_Cache(Standard_Transient):
	def __init__(self, theDegreeU: int, thePeriodicU: bool, theFlatKnotsU: TColStd_Array1OfReal, theDegreeV: int, thePeriodicV: bool, theFlatKnotsV: TColStd_Array1OfReal, theWeights: Optional[TColStd_Array2OfReal] = None) -> None: ...
	def BuildCache(self, theParameterU: float, theParameterV: float, theFlatKnotsU: TColStd_Array1OfReal, theFlatKnotsV: TColStd_Array1OfReal, thePoles: TColgp_Array2OfPnt, theWeights: Optional[TColStd_Array2OfReal] = None) -> None: ...
	def D0(self, theU: float, theV: float, thePoint: gp_Pnt) -> None: ...
	def D1(self, theU: float, theV: float, thePoint: gp_Pnt, theTangentU: gp_Vec, theTangentV: gp_Vec) -> None: ...
	def D2(self, theU: float, theV: float, thePoint: gp_Pnt, theTangentU: gp_Vec, theTangentV: gp_Vec, theCurvatureU: gp_Vec, theCurvatureV: gp_Vec, theCurvatureUV: gp_Vec) -> None: ...
	def IsCacheValid(self, theParameterU: float, theParameterV: float) -> bool: ...

#classnotwrapped
class BSplSLib_EvaluatorFunction: ...

# harray1 classes
# harray2 classes
# hsequence classes

bsplslib_BuildCache = bsplslib.BuildCache
bsplslib_BuildCache = bsplslib.BuildCache
bsplslib_CacheD0 = bsplslib.CacheD0
bsplslib_CacheD1 = bsplslib.CacheD1
bsplslib_CacheD2 = bsplslib.CacheD2
bsplslib_CoefsD0 = bsplslib.CoefsD0
bsplslib_CoefsD1 = bsplslib.CoefsD1
bsplslib_CoefsD2 = bsplslib.CoefsD2
bsplslib_D0 = bsplslib.D0
bsplslib_D1 = bsplslib.D1
bsplslib_D2 = bsplslib.D2
bsplslib_D3 = bsplslib.D3
bsplslib_DN = bsplslib.DN
bsplslib_FunctionMultiply = bsplslib.FunctionMultiply
bsplslib_GetPoles = bsplslib.GetPoles
bsplslib_GetPoles = bsplslib.GetPoles
bsplslib_HomogeneousD0 = bsplslib.HomogeneousD0
bsplslib_HomogeneousD1 = bsplslib.HomogeneousD1
bsplslib_IncreaseDegree = bsplslib.IncreaseDegree
bsplslib_InsertKnots = bsplslib.InsertKnots
bsplslib_Interpolate = bsplslib.Interpolate
bsplslib_Interpolate = bsplslib.Interpolate
bsplslib_IsRational = bsplslib.IsRational
bsplslib_Iso = bsplslib.Iso
bsplslib_MovePoint = bsplslib.MovePoint
bsplslib_NoWeights = bsplslib.NoWeights
bsplslib_PolesCoefficients = bsplslib.PolesCoefficients
bsplslib_PolesCoefficients = bsplslib.PolesCoefficients
bsplslib_RationalDerivative = bsplslib.RationalDerivative
bsplslib_RemoveKnot = bsplslib.RemoveKnot
bsplslib_Resolution = bsplslib.Resolution
bsplslib_Reverse = bsplslib.Reverse
bsplslib_Reverse = bsplslib.Reverse
bsplslib_SetPoles = bsplslib.SetPoles
bsplslib_SetPoles = bsplslib.SetPoles
bsplslib_Unperiodize = bsplslib.Unperiodize
