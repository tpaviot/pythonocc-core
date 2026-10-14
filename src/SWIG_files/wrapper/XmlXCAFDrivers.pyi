from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *
from OCC.Core.XmlDrivers import *
from OCC.Core.Message import *
from OCC.Core.XmlMDF import *
from OCC.Core.TCollection import *


class xmlxcafdrivers:
    @staticmethod
    def DefineFormat(theApp: TDocStd_Application) -> None: ...
    @staticmethod
    def Factory(aGUID: Standard_GUID) -> Standard_Transient: ...

class XmlXCAFDrivers_DocumentRetrievalDriver(XmlDrivers_DocumentRetrievalDriver):
    def __init__(self) -> None: ...
    def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
    @overload
    @staticmethod
    def DownCast(t: Standard_Transient) -> XmlXCAFDrivers_DocumentRetrievalDriver: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

class XmlXCAFDrivers_DocumentStorageDriver(XmlDrivers_DocumentStorageDriver):
    def __init__(self, theCopyright: str | TCollection_ExtendedString) -> None: ...
    def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
    @overload
    @staticmethod
    def DownCast(t: Standard_Transient) -> XmlXCAFDrivers_DocumentStorageDriver: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

