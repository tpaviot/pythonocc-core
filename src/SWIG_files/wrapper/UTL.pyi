from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Storage import *
from OCC.Core.TCollection import *
from OCC.Core.OSD import *
from OCC.Core.Resource import *


class utl:
	@staticmethod
	def AddToUserInfo(aData: Storage_Data, anInfo: TCollection_ExtendedString) -> None: ...
	@staticmethod
	def CString(anExtendedString: TCollection_ExtendedString) -> str: ...
	@staticmethod
	def Disk(aPath: OSD_Path) -> TCollection_ExtendedString: ...
	@staticmethod
	def ExtendedString(anAsciiString: TCollection_AsciiString) -> TCollection_ExtendedString: ...
	@overload
	@staticmethod
	def Extension(aPath: OSD_Path) -> TCollection_ExtendedString: ...
	@overload
	@staticmethod
	def Extension(aFileName: TCollection_ExtendedString) -> TCollection_ExtendedString: ...
	@staticmethod
	def FileIterator(aPath: OSD_Path, aMask: TCollection_ExtendedString) -> OSD_FileIterator: ...
	@staticmethod
	def Find(aResourceManager: Resource_Manager, aResourceName: TCollection_ExtendedString) -> bool: ...
	@staticmethod
	def GUID(anXString: TCollection_ExtendedString) -> Standard_GUID: ...
	@staticmethod
	def IntegerValue(anExtendedString: TCollection_ExtendedString) -> int: ...
	@staticmethod
	def IsReadOnly(aFileName: TCollection_ExtendedString) -> bool: ...
	@staticmethod
	def LocalHost() -> TCollection_ExtendedString: ...
	@staticmethod
	def Name(aPath: OSD_Path) -> TCollection_ExtendedString: ...
	@staticmethod
	def OpenFile(aFile: Storage_BaseDriver, aName: TCollection_ExtendedString, aMode: Storage_OpenMode) -> Storage_Error: ...
	@staticmethod
	def Path(aFileName: TCollection_ExtendedString) -> OSD_Path: ...
	@staticmethod
	def Trek(aPath: OSD_Path) -> TCollection_ExtendedString: ...
	@staticmethod
	def Value(aResourceManager: Resource_Manager, aResourceName: TCollection_ExtendedString) -> TCollection_ExtendedString: ...
	@staticmethod
	def xgetenv(aCString: str) -> TCollection_ExtendedString: ...

# harray1 classes
# harray2 classes
# hsequence classes

utl_AddToUserInfo = utl.AddToUserInfo
utl_CString = utl.CString
utl_Disk = utl.Disk
utl_ExtendedString = utl.ExtendedString
utl_Extension = utl.Extension
utl_Extension = utl.Extension
utl_FileIterator = utl.FileIterator
utl_Find = utl.Find
utl_GUID = utl.GUID
utl_IntegerValue = utl.IntegerValue
utl_IsReadOnly = utl.IsReadOnly
utl_LocalHost = utl.LocalHost
utl_Name = utl.Name
utl_OpenFile = utl.OpenFile
utl_Path = utl.Path
utl_Trek = utl.Trek
utl_Value = utl.Value
utl_xgetenv = utl.xgetenv
