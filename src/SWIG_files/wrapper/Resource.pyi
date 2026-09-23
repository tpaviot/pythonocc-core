from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TCollection import *


class Resource_DataMapOfAsciiStringAsciiString:
    def __init__(self, *args: Any, **kwargs: Any) -> None: ...
    def __getattr__(self, name: str) -> Any: ...

class Resource_DataMapOfAsciiStringExtendedString:
    def __init__(self, *args: Any, **kwargs: Any) -> None: ...
    def __getattr__(self, name: str) -> Any: ...

class Resource_FormatType(IntEnum):
    Resource_FormatType_SJIS = 0
    Resource_FormatType_EUC = 1
    Resource_FormatType_NoConversion = 2
    Resource_FormatType_GB = 3
    Resource_FormatType_UTF8 = 4
    Resource_FormatType_SystemLocale = 5
    Resource_FormatType_CP1250 = 6
    Resource_FormatType_CP1251 = 7
    Resource_FormatType_CP1252 = 8
    Resource_FormatType_CP1253 = 9
    Resource_FormatType_CP1254 = 10
    Resource_FormatType_CP1255 = 11
    Resource_FormatType_CP1256 = 12
    Resource_FormatType_CP1257 = 13
    Resource_FormatType_CP1258 = 14
    Resource_FormatType_iso8859_1 = 15
    Resource_FormatType_iso8859_2 = 16
    Resource_FormatType_iso8859_3 = 17
    Resource_FormatType_iso8859_4 = 18
    Resource_FormatType_iso8859_5 = 19
    Resource_FormatType_iso8859_6 = 20
    Resource_FormatType_iso8859_7 = 21
    Resource_FormatType_iso8859_8 = 22
    Resource_FormatType_iso8859_9 = 23
    Resource_FormatType_CP850 = 24
    Resource_FormatType_GBK = 25
    Resource_FormatType_Big5 = 26
    Resource_FormatType_ANSI = ...
    Resource_SJIS = ...
    Resource_EUC = ...
    Resource_ANSI = ...
    Resource_GB = ...

Resource_FormatType_SJIS = Resource_FormatType.Resource_FormatType_SJIS
Resource_FormatType_EUC = Resource_FormatType.Resource_FormatType_EUC
Resource_FormatType_NoConversion = Resource_FormatType.Resource_FormatType_NoConversion
Resource_FormatType_GB = Resource_FormatType.Resource_FormatType_GB
Resource_FormatType_UTF8 = Resource_FormatType.Resource_FormatType_UTF8
Resource_FormatType_SystemLocale = Resource_FormatType.Resource_FormatType_SystemLocale
Resource_FormatType_CP1250 = Resource_FormatType.Resource_FormatType_CP1250
Resource_FormatType_CP1251 = Resource_FormatType.Resource_FormatType_CP1251
Resource_FormatType_CP1252 = Resource_FormatType.Resource_FormatType_CP1252
Resource_FormatType_CP1253 = Resource_FormatType.Resource_FormatType_CP1253
Resource_FormatType_CP1254 = Resource_FormatType.Resource_FormatType_CP1254
Resource_FormatType_CP1255 = Resource_FormatType.Resource_FormatType_CP1255
Resource_FormatType_CP1256 = Resource_FormatType.Resource_FormatType_CP1256
Resource_FormatType_CP1257 = Resource_FormatType.Resource_FormatType_CP1257
Resource_FormatType_CP1258 = Resource_FormatType.Resource_FormatType_CP1258
Resource_FormatType_iso8859_1 = Resource_FormatType.Resource_FormatType_iso8859_1
Resource_FormatType_iso8859_2 = Resource_FormatType.Resource_FormatType_iso8859_2
Resource_FormatType_iso8859_3 = Resource_FormatType.Resource_FormatType_iso8859_3
Resource_FormatType_iso8859_4 = Resource_FormatType.Resource_FormatType_iso8859_4
Resource_FormatType_iso8859_5 = Resource_FormatType.Resource_FormatType_iso8859_5
Resource_FormatType_iso8859_6 = Resource_FormatType.Resource_FormatType_iso8859_6
Resource_FormatType_iso8859_7 = Resource_FormatType.Resource_FormatType_iso8859_7
Resource_FormatType_iso8859_8 = Resource_FormatType.Resource_FormatType_iso8859_8
Resource_FormatType_iso8859_9 = Resource_FormatType.Resource_FormatType_iso8859_9
Resource_FormatType_CP850 = Resource_FormatType.Resource_FormatType_CP850
Resource_FormatType_GBK = Resource_FormatType.Resource_FormatType_GBK
Resource_FormatType_Big5 = Resource_FormatType.Resource_FormatType_Big5
Resource_FormatType_ANSI = Resource_FormatType.Resource_FormatType_ANSI
Resource_SJIS = Resource_FormatType.Resource_SJIS
Resource_EUC = Resource_FormatType.Resource_EUC
Resource_ANSI = Resource_FormatType.Resource_ANSI
Resource_GB = Resource_FormatType.Resource_GB

class Resource_LexicalCompare:
    def __init__(self) -> None: ...
    def IsLower(self, Left: str, Right: str) -> bool: ...

class Resource_Manager(Standard_Transient):
    @overload
    def __init__(self, aName: str, Verbose: Optional[bool] = False) -> None: ...
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theName: str, theDefaultsDirectory: str, theUserDefaultsDirectory: str, theIsVerbose: Optional[bool] = False) -> None: ...
    def ExtValue(self, aResourceName: str) -> Any: ...
    @overload
    def Find(self, aResource: str) -> bool: ...
    @overload
    def Find(self, theResource: str, theValue: str) -> bool: ...
    def GetMap(self, theRefMap: Optional[bool] = True) -> Any: ...
    @staticmethod
    def GetResourcePath(aPath: str, aName: str, isUserDefaults: bool) -> None: ...
    def Integer(self, aResourceName: str) -> int: ...
    def IsInitialized(self) -> bool: ...
    def Real(self, aResourceName: str) -> float: ...
    def Save(self) -> bool: ...
    @overload
    def SetResource(self, aResourceName: str, aValue: int) -> None: ...
    @overload
    def SetResource(self, aResourceName: str, aValue: float) -> None: ...
    @overload
    def SetResource(self, aResourceName: str, aValue: str) -> None: ...
    @overload
    def SetResource(self, aResourceName: str, aValue: Any) -> None: ...
    def Value(self, aResourceName: str) -> str: ...

class Resource_Unicode:
    @staticmethod
    def ConvertBig5ToUnicode(fromstr: str, tostr: str) -> bool: ...
    @staticmethod
    def ConvertEUCToUnicode(fromstr: str, tostr: str) -> None: ...
    @overload
    @staticmethod
    def ConvertFormatToUnicode(theFromStr: str, theToStr: str) -> None: ...
    @overload
    @staticmethod
    def ConvertFormatToUnicode(theFormat: Resource_FormatType, theFromStr: str, theToStr: str) -> None: ...
    @staticmethod
    def ConvertGBKToUnicode(fromstr: str, tostr: str) -> bool: ...
    @staticmethod
    def ConvertGBToUnicode(fromstr: str, tostr: str) -> None: ...
    @staticmethod
    def ConvertSJISToUnicode(fromstr: str, tostr: str) -> None: ...
    @staticmethod
    def ConvertUnicodeToANSI(fromstr: str, tostr: Standard_PCharacter, maxsize: int) -> bool: ...
    @staticmethod
    def ConvertUnicodeToEUC(fromstr: str, tostr: Standard_PCharacter, maxsize: int) -> bool: ...
    @overload
    @staticmethod
    def ConvertUnicodeToFormat(theFormat: Resource_FormatType, theFromStr: str, theToStr: Standard_PCharacter, theMaxSize: int) -> bool: ...
    @overload
    @staticmethod
    def ConvertUnicodeToFormat(theFromStr: str, theToStr: Standard_PCharacter, theMaxSize: int) -> bool: ...
    @staticmethod
    def ConvertUnicodeToGB(fromstr: str, tostr: Standard_PCharacter, maxsize: int) -> bool: ...
    @staticmethod
    def ConvertUnicodeToSJIS(fromstr: str, tostr: Standard_PCharacter, maxsize: int) -> bool: ...
    @staticmethod
    def GetFormat() -> Resource_FormatType: ...
    @staticmethod
    def ReadFormat() -> None: ...
    @staticmethod
    def SetFormat(typecode: Resource_FormatType) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

