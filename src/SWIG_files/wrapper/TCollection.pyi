from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class tcollection:
    @staticmethod
    def NextPrimeForMap(I: int) -> int: ...

class TCollection_AsciiString:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, message: str) -> None: ...
    @overload
    def __init__(self, message: str, aLen: int) -> None: ...
    @overload
    def __init__(self, aChar: str) -> None: ...
    @overload
    def __init__(self, length: int, filler: str) -> None: ...
    @overload
    def __init__(self, value: int) -> None: ...
    @overload
    def __init__(self, value: float) -> None: ...
    @overload
    def __init__(self, astring: TCollection_AsciiString) -> None: ...
    @overload
    def __init__(self, astring: TCollection_AsciiString, message: str) -> None: ...
    @overload
    def __init__(self, astring: TCollection_AsciiString, message: str) -> None: ...
    @overload
    def __init__(self, astring: TCollection_AsciiString, message: TCollection_AsciiString) -> None: ...
    @overload
    def __init__(self, astring: TCollection_ExtendedString, replaceNonAscii: Optional[str] = 0) -> None: ...
    @overload
    def __init__(self, theStringUtf: Standard_WideChar) -> None: ...
    @overload
    def AssignCat(self, other: str) -> None: ...
    @overload
    def AssignCat(self, other: int) -> None: ...
    @overload
    def AssignCat(self, other: float) -> None: ...
    @overload
    def AssignCat(self, other: str) -> None: ...
    @overload
    def AssignCat(self, other: TCollection_AsciiString) -> None: ...
    def Capitalize(self) -> None: ...
    @overload
    def Cat(self, other: str) -> TCollection_AsciiString: ...
    @overload
    def Cat(self, other: int) -> TCollection_AsciiString: ...
    @overload
    def Cat(self, other: float) -> TCollection_AsciiString: ...
    @overload
    def Cat(self, other: str) -> TCollection_AsciiString: ...
    @overload
    def Cat(self, other: TCollection_AsciiString) -> TCollection_AsciiString: ...
    def Center(self, Width: int, Filler: str) -> None: ...
    def ChangeAll(self, aChar: str, NewChar: str, CaseSensitive: Optional[bool] = True) -> None: ...
    def Clear(self) -> None: ...
    @overload
    def Copy(self, fromwhere: str) -> None: ...
    @overload
    def Copy(self, fromwhere: TCollection_AsciiString) -> None: ...
    def EndsWith(self, theEndString: TCollection_AsciiString) -> bool: ...
    def FirstLocationInSet(self, Set: TCollection_AsciiString, FromIndex: int, ToIndex: int) -> int: ...
    def FirstLocationNotInSet(self, Set: TCollection_AsciiString, FromIndex: int, ToIndex: int) -> int: ...
    @staticmethod
    def HashCode(theAsciiString: TCollection_AsciiString, theUpperBound: int) -> int: ...
    @overload
    def Insert(self, where: int, what: str) -> None: ...
    @overload
    def Insert(self, where: int, what: str) -> None: ...
    @overload
    def Insert(self, where: int, what: TCollection_AsciiString) -> None: ...
    def InsertAfter(self, Index: int, other: TCollection_AsciiString) -> None: ...
    def InsertBefore(self, Index: int, other: TCollection_AsciiString) -> None: ...
    def IntegerValue(self) -> int: ...
    def IsAscii(self) -> bool: ...
    @overload
    def IsDifferent(self, other: str) -> bool: ...
    @overload
    def IsDifferent(self, other: TCollection_AsciiString) -> bool: ...
    def IsEmpty(self) -> bool: ...
    @overload
    def IsEqual(self, other: str) -> bool: ...
    @overload
    def IsEqual(self, other: TCollection_AsciiString) -> bool: ...
    @overload
    @staticmethod
    def IsEqual(string1: TCollection_AsciiString, string2: TCollection_AsciiString) -> bool: ...
    @overload
    @staticmethod
    def IsEqual(string1: TCollection_AsciiString, string2: str) -> bool: ...
    @overload
    def IsGreater(self, other: str) -> bool: ...
    @overload
    def IsGreater(self, other: TCollection_AsciiString) -> bool: ...
    def IsIntegerValue(self) -> bool: ...
    @overload
    def IsLess(self, other: str) -> bool: ...
    @overload
    def IsLess(self, other: TCollection_AsciiString) -> bool: ...
    def IsRealValue(self, theToCheckFull: Optional[bool] = False) -> bool: ...
    @staticmethod
    def IsSameString(theString1: TCollection_AsciiString, theString2: TCollection_AsciiString, theIsCaseSensitive: bool) -> bool: ...
    def LeftAdjust(self) -> None: ...
    def LeftJustify(self, Width: int, Filler: str) -> None: ...
    def Length(self) -> int: ...
    @overload
    def Location(self, other: TCollection_AsciiString, FromIndex: int, ToIndex: int) -> int: ...
    @overload
    def Location(self, N: int, C: str, FromIndex: int, ToIndex: int) -> int: ...
    def LowerCase(self) -> None: ...
    def Prepend(self, other: TCollection_AsciiString) -> None: ...
    def RealValue(self) -> float: ...
    def Remove(self, where: int, ahowmany: Optional[int] = 1) -> None: ...
    @overload
    def RemoveAll(self, C: str, CaseSensitive: bool) -> None: ...
    @overload
    def RemoveAll(self, what: str) -> None: ...
    def RightAdjust(self) -> None: ...
    def RightJustify(self, Width: int, Filler: str) -> None: ...
    @overload
    def Search(self, what: str) -> int: ...
    @overload
    def Search(self, what: TCollection_AsciiString) -> int: ...
    @overload
    def SearchFromEnd(self, what: str) -> int: ...
    @overload
    def SearchFromEnd(self, what: TCollection_AsciiString) -> int: ...
    @overload
    def SetValue(self, where: int, what: str) -> None: ...
    @overload
    def SetValue(self, where: int, what: str) -> None: ...
    @overload
    def SetValue(self, where: int, what: TCollection_AsciiString) -> None: ...
    def Split(self, where: int) -> TCollection_AsciiString: ...
    def StartsWith(self, theStartString: TCollection_AsciiString) -> bool: ...
    def SubString(self, FromIndex: int, ToIndex: int) -> TCollection_AsciiString: ...
    def Swap(self, theOther: TCollection_AsciiString) -> None: ...
    def ToCString(self) -> str: ...
    def Token(self, separators: Optional[str] = "\t", whichone: Optional[int] = 1) -> TCollection_AsciiString: ...
    def Trunc(self, ahowmany: int) -> None: ...
    def UpperCase(self) -> None: ...
    def UsefullLength(self) -> int: ...
    def Value(self, where: int) -> str: ...

class TCollection_ExtendedString:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, astring: str, isMultiByte: Optional[bool] = False) -> None: ...
    @overload
    def __init__(self, astring: Standard_ExtString) -> None: ...
    @overload
    def __init__(self, theStringUtf: Standard_WideChar) -> None: ...
    @overload
    def __init__(self, aChar: str) -> None: ...
    @overload
    def __init__(self, aChar: Standard_ExtCharacter) -> None: ...
    @overload
    def __init__(self, length: int, filler: Standard_ExtCharacter) -> None: ...
    @overload
    def __init__(self, value: int) -> None: ...
    @overload
    def __init__(self, value: float) -> None: ...
    @overload
    def __init__(self, astring: TCollection_ExtendedString) -> None: ...
    @overload
    def __init__(self, astring: TCollection_AsciiString, isMultiByte: Optional[bool] = True) -> None: ...
    @overload
    def AssignCat(self, other: TCollection_ExtendedString) -> None: ...
    @overload
    def AssignCat(self, theChar: Standard_Utf16Char) -> None: ...
    def Cat(self, other: TCollection_ExtendedString) -> TCollection_ExtendedString: ...
    def ChangeAll(self, aChar: Standard_ExtCharacter, NewChar: Standard_ExtCharacter) -> None: ...
    def Clear(self) -> None: ...
    def Copy(self, fromwhere: TCollection_ExtendedString) -> None: ...
    def EndsWith(self, theEndString: TCollection_ExtendedString) -> bool: ...
    @staticmethod
    def HashCode(theString: TCollection_ExtendedString, theUpperBound: int) -> int: ...
    @overload
    def Insert(self, where: int, what: Standard_ExtCharacter) -> None: ...
    @overload
    def Insert(self, where: int, what: TCollection_ExtendedString) -> None: ...
    def IsAscii(self) -> bool: ...
    @overload
    def IsDifferent(self, other: Standard_ExtString) -> bool: ...
    @overload
    def IsDifferent(self, other: TCollection_ExtendedString) -> bool: ...
    def IsEmpty(self) -> bool: ...
    @overload
    def IsEqual(self, other: Standard_ExtString) -> bool: ...
    @overload
    def IsEqual(self, other: TCollection_ExtendedString) -> bool: ...
    @overload
    @staticmethod
    def IsEqual(theString1: TCollection_ExtendedString, theString2: TCollection_ExtendedString) -> bool: ...
    @overload
    def IsGreater(self, other: Standard_ExtString) -> bool: ...
    @overload
    def IsGreater(self, other: TCollection_ExtendedString) -> bool: ...
    @overload
    def IsLess(self, other: Standard_ExtString) -> bool: ...
    @overload
    def IsLess(self, other: TCollection_ExtendedString) -> bool: ...
    def Length(self) -> int: ...
    def LengthOfCString(self) -> int: ...
    def Remove(self, where: int, ahowmany: Optional[int] = 1) -> None: ...
    def RemoveAll(self, what: Standard_ExtCharacter) -> None: ...
    def Search(self, what: TCollection_ExtendedString) -> int: ...
    def SearchFromEnd(self, what: TCollection_ExtendedString) -> int: ...
    @overload
    def SetValue(self, where: int, what: Standard_ExtCharacter) -> None: ...
    @overload
    def SetValue(self, where: int, what: TCollection_ExtendedString) -> None: ...
    def Split(self, where: int) -> TCollection_ExtendedString: ...
    def StartsWith(self, theStartString: TCollection_ExtendedString) -> bool: ...
    def Swap(self, theOther: TCollection_ExtendedString) -> None: ...
    def ToExtString(self) -> Standard_ExtString: ...
    def ToUTF8CString(self, theCString: Standard_PCharacter) -> int: ...
    def Token(self, separators: Standard_ExtString, whichone: Optional[int] = 1) -> TCollection_ExtendedString: ...
    def Trunc(self, ahowmany: int) -> None: ...
    def Value(self, where: int) -> Standard_ExtCharacter: ...

class TCollection_HAsciiString(Standard_Transient):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, message: str) -> None: ...
    @overload
    def __init__(self, aChar: str) -> None: ...
    @overload
    def __init__(self, length: int, filler: str) -> None: ...
    @overload
    def __init__(self, value: int) -> None: ...
    @overload
    def __init__(self, value: float) -> None: ...
    @overload
    def __init__(self, aString: TCollection_AsciiString) -> None: ...
    @overload
    def __init__(self, aString: TCollection_HAsciiString) -> None: ...
    @overload
    def __init__(self, aString: TCollection_HExtendedString, replaceNonAscii: str) -> None: ...
    @overload
    def AssignCat(self, other: str) -> None: ...
    @overload
    def AssignCat(self, other: TCollection_HAsciiString) -> None: ...
    def Capitalize(self) -> None: ...
    @overload
    def Cat(self, other: str) -> TCollection_HAsciiString: ...
    @overload
    def Cat(self, other: TCollection_HAsciiString) -> TCollection_HAsciiString: ...
    def Center(self, Width: int, Filler: str) -> None: ...
    def ChangeAll(self, aChar: str, NewChar: str, CaseSensitive: Optional[bool] = True) -> None: ...
    def Clear(self) -> None: ...
    def FirstLocationInSet(self, Set: TCollection_HAsciiString, FromIndex: int, ToIndex: int) -> int: ...
    def FirstLocationNotInSet(self, Set: TCollection_HAsciiString, FromIndex: int, ToIndex: int) -> int: ...
    @overload
    def Insert(self, where: int, what: str) -> None: ...
    @overload
    def Insert(self, where: int, what: str) -> None: ...
    @overload
    def Insert(self, where: int, what: TCollection_HAsciiString) -> None: ...
    def InsertAfter(self, Index: int, other: TCollection_HAsciiString) -> None: ...
    def InsertBefore(self, Index: int, other: TCollection_HAsciiString) -> None: ...
    def IntegerValue(self) -> int: ...
    def IsAscii(self) -> bool: ...
    def IsDifferent(self, S: TCollection_HAsciiString) -> bool: ...
    def IsEmpty(self) -> bool: ...
    def IsGreater(self, other: TCollection_HAsciiString) -> bool: ...
    def IsIntegerValue(self) -> bool: ...
    def IsLess(self, other: TCollection_HAsciiString) -> bool: ...
    def IsRealValue(self) -> bool: ...
    def IsSameState(self, other: TCollection_HAsciiString) -> bool: ...
    @overload
    def IsSameString(self, S: TCollection_HAsciiString) -> bool: ...
    @overload
    def IsSameString(self, S: TCollection_HAsciiString, CaseSensitive: bool) -> bool: ...
    def LeftAdjust(self) -> None: ...
    def LeftJustify(self, Width: int, Filler: str) -> None: ...
    def Length(self) -> int: ...
    @overload
    def Location(self, other: TCollection_HAsciiString, FromIndex: int, ToIndex: int) -> int: ...
    @overload
    def Location(self, N: int, C: str, FromIndex: int, ToIndex: int) -> int: ...
    def LowerCase(self) -> None: ...
    def Prepend(self, other: TCollection_HAsciiString) -> None: ...
    def RealValue(self) -> float: ...
    def Remove(self, where: int, ahowmany: Optional[int] = 1) -> None: ...
    @overload
    def RemoveAll(self, C: str, CaseSensitive: bool) -> None: ...
    @overload
    def RemoveAll(self, what: str) -> None: ...
    def RightAdjust(self) -> None: ...
    def RightJustify(self, Width: int, Filler: str) -> None: ...
    @overload
    def Search(self, what: str) -> int: ...
    @overload
    def Search(self, what: TCollection_HAsciiString) -> int: ...
    @overload
    def SearchFromEnd(self, what: str) -> int: ...
    @overload
    def SearchFromEnd(self, what: TCollection_HAsciiString) -> int: ...
    @overload
    def SetValue(self, where: int, what: str) -> None: ...
    @overload
    def SetValue(self, where: int, what: str) -> None: ...
    @overload
    def SetValue(self, where: int, what: TCollection_HAsciiString) -> None: ...
    def Split(self, where: int) -> TCollection_HAsciiString: ...
    def String(self) -> TCollection_AsciiString: ...
    def SubString(self, FromIndex: int, ToIndex: int) -> TCollection_HAsciiString: ...
    def ToCString(self) -> str: ...
    def Token(self, separators: Optional[str] = "\t", whichone: Optional[int] = 1) -> TCollection_HAsciiString: ...
    def Trunc(self, ahowmany: int) -> None: ...
    def UpperCase(self) -> None: ...
    def UsefullLength(self) -> int: ...
    def Value(self, where: int) -> str: ...

class TCollection_HExtendedString(Standard_Transient):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, message: str) -> None: ...
    @overload
    def __init__(self, message: Standard_ExtString) -> None: ...
    @overload
    def __init__(self, aChar: Standard_ExtCharacter) -> None: ...
    @overload
    def __init__(self, length: int, filler: Standard_ExtCharacter) -> None: ...
    @overload
    def __init__(self, aString: TCollection_ExtendedString) -> None: ...
    @overload
    def __init__(self, aString: TCollection_HAsciiString) -> None: ...
    @overload
    def __init__(self, aString: TCollection_HExtendedString) -> None: ...
    def AssignCat(self, other: TCollection_HExtendedString) -> None: ...
    def Cat(self, other: TCollection_HExtendedString) -> TCollection_HExtendedString: ...
    def ChangeAll(self, aChar: Standard_ExtCharacter, NewChar: Standard_ExtCharacter) -> None: ...
    def Clear(self) -> None: ...
    @overload
    def Insert(self, where: int, what: Standard_ExtCharacter) -> None: ...
    @overload
    def Insert(self, where: int, what: TCollection_HExtendedString) -> None: ...
    def IsAscii(self) -> bool: ...
    def IsEmpty(self) -> bool: ...
    def IsGreater(self, other: TCollection_HExtendedString) -> bool: ...
    def IsLess(self, other: TCollection_HExtendedString) -> bool: ...
    def IsSameState(self, other: TCollection_HExtendedString) -> bool: ...
    def Length(self) -> int: ...
    def Remove(self, where: int, ahowmany: Optional[int] = 1) -> None: ...
    def RemoveAll(self, what: Standard_ExtCharacter) -> None: ...
    def Search(self, what: TCollection_HExtendedString) -> int: ...
    def SearchFromEnd(self, what: TCollection_HExtendedString) -> int: ...
    @overload
    def SetValue(self, where: int, what: Standard_ExtCharacter) -> None: ...
    @overload
    def SetValue(self, where: int, what: TCollection_HExtendedString) -> None: ...
    def Split(self, where: int) -> TCollection_HExtendedString: ...
    def String(self) -> TCollection_ExtendedString: ...
    def ToExtString(self) -> Standard_ExtString: ...
    def Token(self, separators: Standard_ExtString, whichone: Optional[int] = 1) -> TCollection_HExtendedString: ...
    def Trunc(self, ahowmany: int) -> None: ...
    def Value(self, where: int) -> Standard_ExtCharacter: ...

# harray1 classes
# harray2 classes
# hsequence classes

tcollection_NextPrimeForMap = tcollection.NextPrimeForMap
TCollection_AsciiString_HashCode = TCollection_AsciiString.HashCode
TCollection_AsciiString_IsEqual = TCollection_AsciiString.IsEqual
TCollection_AsciiString_IsEqual = TCollection_AsciiString.IsEqual
TCollection_AsciiString_IsSameString = TCollection_AsciiString.IsSameString
TCollection_ExtendedString_HashCode = TCollection_ExtendedString.HashCode
TCollection_ExtendedString_IsEqual = TCollection_ExtendedString.IsEqual
