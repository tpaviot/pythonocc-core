from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class precision:
	@staticmethod
	def Angular() -> float: ...
	@staticmethod
	def Approximation() -> float: ...
	@staticmethod
	def Confusion() -> float: ...
	@staticmethod
	def Infinite() -> float: ...
	@staticmethod
	def Intersection() -> float: ...
	@staticmethod
	def IsInfinite(R: float) -> bool: ...
	@staticmethod
	def IsNegativeInfinite(R: float) -> bool: ...
	@staticmethod
	def IsPositiveInfinite(R: float) -> bool: ...
	@overload
	@staticmethod
	def PApproximation(T: float) -> float: ...
	@overload
	@staticmethod
	def PApproximation() -> float: ...
	@overload
	@staticmethod
	def PConfusion(T: float) -> float: ...
	@overload
	@staticmethod
	def PConfusion() -> float: ...
	@overload
	@staticmethod
	def PIntersection(T: float) -> float: ...
	@overload
	@staticmethod
	def PIntersection() -> float: ...
	@overload
	@staticmethod
	def Parametric(P: float, T: float) -> float: ...
	@overload
	@staticmethod
	def Parametric(P: float) -> float: ...
	@staticmethod
	def SquareConfusion() -> float: ...
	@staticmethod
	def SquarePConfusion() -> float: ...

# harray1 classes
# harray2 classes
# hsequence classes

precision_Angular = precision.Angular
precision_Approximation = precision.Approximation
precision_Confusion = precision.Confusion
precision_Infinite = precision.Infinite
precision_Intersection = precision.Intersection
precision_IsInfinite = precision.IsInfinite
precision_IsNegativeInfinite = precision.IsNegativeInfinite
precision_IsPositiveInfinite = precision.IsPositiveInfinite
precision_PApproximation = precision.PApproximation
precision_PApproximation = precision.PApproximation
precision_PConfusion = precision.PConfusion
precision_PConfusion = precision.PConfusion
precision_PIntersection = precision.PIntersection
precision_PIntersection = precision.PIntersection
precision_Parametric = precision.Parametric
precision_Parametric = precision.Parametric
precision_SquareConfusion = precision.SquareConfusion
precision_SquarePConfusion = precision.SquarePConfusion
