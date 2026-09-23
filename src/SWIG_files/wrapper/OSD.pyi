from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *

# the following typedef cannot be wrapped as is
OSD_IOStreamBuffer = NewType("OSD_IOStreamBuffer", Any)
# the following typedef cannot be wrapped as is
OSD_IStreamBuffer = NewType("OSD_IStreamBuffer", Any)
# the following typedef cannot be wrapped as is
OSD_OStreamBuffer = NewType("OSD_OStreamBuffer", Any)
OSD_PThread = NewType("OSD_PThread", pthread_t)

class OSD_FromWhere(IntEnum):
    OSD_FromBeginning = 0
    OSD_FromHere = 1
    OSD_FromEnd = 2

OSD_FromBeginning = OSD_FromWhere.OSD_FromBeginning
OSD_FromHere = OSD_FromWhere.OSD_FromHere
OSD_FromEnd = OSD_FromWhere.OSD_FromEnd

class OSD_KindFile(IntEnum):
    OSD_FILE = 0
    OSD_DIRECTORY = 1
    OSD_LINK = 2
    OSD_SOCKET = 3
    OSD_UNKNOWN = 4

OSD_FILE = OSD_KindFile.OSD_FILE
OSD_DIRECTORY = OSD_KindFile.OSD_DIRECTORY
OSD_LINK = OSD_KindFile.OSD_LINK
OSD_SOCKET = OSD_KindFile.OSD_SOCKET
OSD_UNKNOWN = OSD_KindFile.OSD_UNKNOWN

class OSD_LoadMode(IntEnum):
    OSD_RTLD_LAZY = 0
    OSD_RTLD_NOW = 1

OSD_RTLD_LAZY = OSD_LoadMode.OSD_RTLD_LAZY
OSD_RTLD_NOW = OSD_LoadMode.OSD_RTLD_NOW

class OSD_LockType(IntEnum):
    OSD_NoLock = 0
    OSD_ReadLock = 1
    OSD_WriteLock = 2
    OSD_ExclusiveLock = 3

OSD_NoLock = OSD_LockType.OSD_NoLock
OSD_ReadLock = OSD_LockType.OSD_ReadLock
OSD_WriteLock = OSD_LockType.OSD_WriteLock
OSD_ExclusiveLock = OSD_LockType.OSD_ExclusiveLock

class OSD_OEMType(IntEnum):
    OSD_Unavailable = 0
    OSD_SUN = 1
    OSD_DEC = 2
    OSD_SGI = 3
    OSD_NEC = 4
    OSD_MAC = 5
    OSD_PC = 6
    OSD_HP = 7
    OSD_IBM = 8
    OSD_VAX = 9
    OSD_LIN = 10
    OSD_AIX = 11

OSD_Unavailable = OSD_OEMType.OSD_Unavailable
OSD_SUN = OSD_OEMType.OSD_SUN
OSD_DEC = OSD_OEMType.OSD_DEC
OSD_SGI = OSD_OEMType.OSD_SGI
OSD_NEC = OSD_OEMType.OSD_NEC
OSD_MAC = OSD_OEMType.OSD_MAC
OSD_PC = OSD_OEMType.OSD_PC
OSD_HP = OSD_OEMType.OSD_HP
OSD_IBM = OSD_OEMType.OSD_IBM
OSD_VAX = OSD_OEMType.OSD_VAX
OSD_LIN = OSD_OEMType.OSD_LIN
OSD_AIX = OSD_OEMType.OSD_AIX

class OSD_OpenMode(IntEnum):
    OSD_ReadOnly = 0
    OSD_WriteOnly = 1
    OSD_ReadWrite = 2

OSD_ReadOnly = OSD_OpenMode.OSD_ReadOnly
OSD_WriteOnly = OSD_OpenMode.OSD_WriteOnly
OSD_ReadWrite = OSD_OpenMode.OSD_ReadWrite

class OSD_SignalMode(IntEnum):
    OSD_SignalMode_AsIs = 0
    OSD_SignalMode_Set = 1
    OSD_SignalMode_SetUnhandled = 2
    OSD_SignalMode_Unset = 3

OSD_SignalMode_AsIs = OSD_SignalMode.OSD_SignalMode_AsIs
OSD_SignalMode_Set = OSD_SignalMode.OSD_SignalMode_Set
OSD_SignalMode_SetUnhandled = OSD_SignalMode.OSD_SignalMode_SetUnhandled
OSD_SignalMode_Unset = OSD_SignalMode.OSD_SignalMode_Unset

class OSD_SingleProtection(IntEnum):
    OSD_None = 0
    OSD_R = 1
    OSD_W = 2
    OSD_RW = 3
    OSD_X = 4
    OSD_RX = 5
    OSD_WX = 6
    OSD_RWX = 7
    OSD_D = 8
    OSD_RD = 9
    OSD_WD = 10
    OSD_RWD = 11
    OSD_XD = 12
    OSD_RXD = 13
    OSD_WXD = 14
    OSD_RWXD = 15

OSD_None = OSD_SingleProtection.OSD_None
OSD_R = OSD_SingleProtection.OSD_R
OSD_W = OSD_SingleProtection.OSD_W
OSD_RW = OSD_SingleProtection.OSD_RW
OSD_X = OSD_SingleProtection.OSD_X
OSD_RX = OSD_SingleProtection.OSD_RX
OSD_WX = OSD_SingleProtection.OSD_WX
OSD_RWX = OSD_SingleProtection.OSD_RWX
OSD_D = OSD_SingleProtection.OSD_D
OSD_RD = OSD_SingleProtection.OSD_RD
OSD_WD = OSD_SingleProtection.OSD_WD
OSD_RWD = OSD_SingleProtection.OSD_RWD
OSD_XD = OSD_SingleProtection.OSD_XD
OSD_RXD = OSD_SingleProtection.OSD_RXD
OSD_WXD = OSD_SingleProtection.OSD_WXD
OSD_RWXD = OSD_SingleProtection.OSD_RWXD

class OSD_SysType(IntEnum):
    OSD_Unknown = 0
    OSD_Default = 1
    OSD_UnixBSD = 2
    OSD_UnixSystemV = 3
    OSD_VMS = 4
    OSD_OS2 = 5
    OSD_OSF = 6
    OSD_MacOs = 7
    OSD_Taligent = 8
    OSD_WindowsNT = 9
    OSD_LinuxREDHAT = 10
    OSD_Aix = 11

OSD_Unknown = OSD_SysType.OSD_Unknown
OSD_Default = OSD_SysType.OSD_Default
OSD_UnixBSD = OSD_SysType.OSD_UnixBSD
OSD_UnixSystemV = OSD_SysType.OSD_UnixSystemV
OSD_VMS = OSD_SysType.OSD_VMS
OSD_OS2 = OSD_SysType.OSD_OS2
OSD_OSF = OSD_SysType.OSD_OSF
OSD_MacOs = OSD_SysType.OSD_MacOs
OSD_Taligent = OSD_SysType.OSD_Taligent
OSD_WindowsNT = OSD_SysType.OSD_WindowsNT
OSD_LinuxREDHAT = OSD_SysType.OSD_LinuxREDHAT
OSD_Aix = OSD_SysType.OSD_Aix

class OSD_WhoAmI(IntEnum):
    OSD_WDirectory = 0
    OSD_WDirectoryIterator = 1
    OSD_WEnvironment = 2
    OSD_WFile = 3
    OSD_WFileNode = 4
    OSD_WFileIterator = 5
    OSD_WPath = 6
    OSD_WProcess = 7
    OSD_WProtection = 8
    OSD_WHost = 9
    OSD_WDisk = 10
    OSD_WChronometer = 11
    OSD_WTimer = 12
    OSD_WPackage = 13
    OSD_WEnvironmentIterator = 14

OSD_WDirectory = OSD_WhoAmI.OSD_WDirectory
OSD_WDirectoryIterator = OSD_WhoAmI.OSD_WDirectoryIterator
OSD_WEnvironment = OSD_WhoAmI.OSD_WEnvironment
OSD_WFile = OSD_WhoAmI.OSD_WFile
OSD_WFileNode = OSD_WhoAmI.OSD_WFileNode
OSD_WFileIterator = OSD_WhoAmI.OSD_WFileIterator
OSD_WPath = OSD_WhoAmI.OSD_WPath
OSD_WProcess = OSD_WhoAmI.OSD_WProcess
OSD_WProtection = OSD_WhoAmI.OSD_WProtection
OSD_WHost = OSD_WhoAmI.OSD_WHost
OSD_WDisk = OSD_WhoAmI.OSD_WDisk
OSD_WChronometer = OSD_WhoAmI.OSD_WChronometer
OSD_WTimer = OSD_WhoAmI.OSD_WTimer
OSD_WPackage = OSD_WhoAmI.OSD_WPackage
OSD_WEnvironmentIterator = OSD_WhoAmI.OSD_WEnvironmentIterator

class OSD_Parallel:
    @staticmethod
    def NbLogicalProcessors() -> int: ...
    @staticmethod
    def SetUseOcctThreads(theToUseOcct: bool) -> None: ...
    @staticmethod
    def ToUseOcctThreads() -> bool: ...

class OSD_ThreadPool(Standard_Transient):
    def __init__(self, theNbThreads: Optional[int] = -1) -> None: ...
    @staticmethod
    def DefaultPool(theNbThreads: Optional[int] = -1) -> OSD_ThreadPool: ...
    def HasThreads(self) -> bool: ...
    def Init(self, theNbThreads: int) -> None: ...
    def IsInUse(self) -> bool: ...
    def LowerThreadIndex(self) -> int: ...
    def NbDefaultThreadsToLaunch(self) -> int: ...
    def NbThreads(self) -> int: ...
    def SetNbDefaultThreadsToLaunch(self, theNbThreads: int) -> None: ...
    def UpperThreadIndex(self) -> int: ...

#classnotwrapped
class OSD: ...

#classnotwrapped
class OSD_CachedFileSystem: ...

#classnotwrapped
class OSD_Chronometer: ...

#classnotwrapped
class OSD_Directory: ...

#classnotwrapped
class OSD_DirectoryIterator: ...

#classnotwrapped
class OSD_Disk: ...

#classnotwrapped
class OSD_Environment: ...

#classnotwrapped
class OSD_Error: ...

#classnotwrapped
class OSD_File: ...

#classnotwrapped
class OSD_FileIterator: ...

#classnotwrapped
class OSD_FileNode: ...

#classnotwrapped
class OSD_FileSystem: ...

#classnotwrapped
class OSD_FileSystemSelector: ...

#classnotwrapped
class OSD_Host: ...

#classnotwrapped
class OSD_LocalFileSystem: ...

#classnotwrapped
class OSD_MemInfo: ...

#classnotwrapped
class OSD_Path: ...

#classnotwrapped
class OSD_PerfMeter: ...

#classnotwrapped
class OSD_Process: ...

#classnotwrapped
class OSD_Protection: ...

#classnotwrapped
class OSD_SharedLibrary: ...

#classnotwrapped
class OSD_StreamBuffer: ...

#classnotwrapped
class OSD_Thread: ...

#classnotwrapped
class OSD_Timer: ...

# harray1 classes
# harray2 classes
# hsequence classes

