/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define OSDDOCSTRING
"OSD module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_osd.html"
%enddef
%module (package="OCC.Core", docstring=OSDDOCSTRING) OSD


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<OSD_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum OSD_LockType {
	OSD_NoLock = 0,
	OSD_ReadLock = 1,
	OSD_WriteLock = 2,
	OSD_ExclusiveLock = 3,
};

enum OSD_LoadMode {
	OSD_RTLD_LAZY = 0,
	OSD_RTLD_NOW = 1,
};

enum OSD_OpenMode {
	OSD_ReadOnly = 0,
	OSD_WriteOnly = 1,
	OSD_ReadWrite = 2,
};

enum OSD_OEMType {
	OSD_Unavailable = 0,
	OSD_SUN = 1,
	OSD_DEC = 2,
	OSD_SGI = 3,
	OSD_NEC = 4,
	OSD_MAC = 5,
	OSD_PC = 6,
	OSD_HP = 7,
	OSD_IBM = 8,
	OSD_VAX = 9,
	OSD_LIN = 10,
	OSD_AIX = 11,
};

enum OSD_WhoAmI {
	OSD_WDirectory = 0,
	OSD_WDirectoryIterator = 1,
	OSD_WEnvironment = 2,
	OSD_WFile = 3,
	OSD_WFileNode = 4,
	OSD_WFileIterator = 5,
	OSD_WPath = 6,
	OSD_WProcess = 7,
	OSD_WProtection = 8,
	OSD_WHost = 9,
	OSD_WDisk = 10,
	OSD_WChronometer = 11,
	OSD_WTimer = 12,
	OSD_WPackage = 13,
	OSD_WEnvironmentIterator = 14,
};

enum OSD_SysType {
	OSD_Unknown = 0,
	OSD_Default = 1,
	OSD_UnixBSD = 2,
	OSD_UnixSystemV = 3,
	OSD_VMS = 4,
	OSD_OS2 = 5,
	OSD_OSF = 6,
	OSD_MacOs = 7,
	OSD_Taligent = 8,
	OSD_WindowsNT = 9,
	OSD_LinuxREDHAT = 10,
	OSD_Aix = 11,
};

enum OSD_KindFile {
	OSD_FILE = 0,
	OSD_DIRECTORY = 1,
	OSD_LINK = 2,
	OSD_SOCKET = 3,
	OSD_UNKNOWN = 4,
};

enum OSD_SignalMode {
	OSD_SignalMode_AsIs = 0,
	OSD_SignalMode_Set = 1,
	OSD_SignalMode_SetUnhandled = 2,
	OSD_SignalMode_Unset = 3,
};

enum OSD_FromWhere {
	OSD_FromBeginning = 0,
	OSD_FromHere = 1,
	OSD_FromEnd = 2,
};

enum OSD_SingleProtection {
	OSD_None = 0,
	OSD_R = 1,
	OSD_W = 2,
	OSD_RW = 3,
	OSD_X = 4,
	OSD_RX = 5,
	OSD_WX = 6,
	OSD_RWX = 7,
	OSD_D = 8,
	OSD_RD = 9,
	OSD_WD = 10,
	OSD_RWD = 11,
	OSD_XD = 12,
	OSD_RXD = 13,
	OSD_WXD = 14,
	OSD_RWXD = 15,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class OSD_LockType(IntEnum):
	OSD_NoLock = 0
	OSD_ReadLock = 1
	OSD_WriteLock = 2
	OSD_ExclusiveLock = 3
OSD_NoLock = OSD_LockType.OSD_NoLock
OSD_ReadLock = OSD_LockType.OSD_ReadLock
OSD_WriteLock = OSD_LockType.OSD_WriteLock
OSD_ExclusiveLock = OSD_LockType.OSD_ExclusiveLock

class OSD_LoadMode(IntEnum):
	OSD_RTLD_LAZY = 0
	OSD_RTLD_NOW = 1
OSD_RTLD_LAZY = OSD_LoadMode.OSD_RTLD_LAZY
OSD_RTLD_NOW = OSD_LoadMode.OSD_RTLD_NOW

class OSD_OpenMode(IntEnum):
	OSD_ReadOnly = 0
	OSD_WriteOnly = 1
	OSD_ReadWrite = 2
OSD_ReadOnly = OSD_OpenMode.OSD_ReadOnly
OSD_WriteOnly = OSD_OpenMode.OSD_WriteOnly
OSD_ReadWrite = OSD_OpenMode.OSD_ReadWrite

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

class OSD_SignalMode(IntEnum):
	OSD_SignalMode_AsIs = 0
	OSD_SignalMode_Set = 1
	OSD_SignalMode_SetUnhandled = 2
	OSD_SignalMode_Unset = 3
OSD_SignalMode_AsIs = OSD_SignalMode.OSD_SignalMode_AsIs
OSD_SignalMode_Set = OSD_SignalMode.OSD_SignalMode_Set
OSD_SignalMode_SetUnhandled = OSD_SignalMode.OSD_SignalMode_SetUnhandled
OSD_SignalMode_Unset = OSD_SignalMode.OSD_SignalMode_Unset

class OSD_FromWhere(IntEnum):
	OSD_FromBeginning = 0
	OSD_FromHere = 1
	OSD_FromEnd = 2
OSD_FromBeginning = OSD_FromWhere.OSD_FromBeginning
OSD_FromHere = OSD_FromWhere.OSD_FromHere
OSD_FromEnd = OSD_FromWhere.OSD_FromEnd

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
};
/* end python proxy for enums */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Standard_Address ( * OSD_ThreadFunction ) ( Standard_Address data );
typedef pthread_t OSD_PThread;
/* end typedefs declaration */

/************
* class OSD *
************/
/************************
* class OSD_Chronometer *
************************/
/******************************
* class OSD_DirectoryIterator *
******************************/
/*****************
* class OSD_Disk *
*****************/
/************************
* class OSD_Environment *
************************/
/******************
* class OSD_Error *
******************/
/*************************
* class OSD_FileIterator *
*************************/
/*********************
* class OSD_FileNode *
*********************/
/*****************
* class OSD_Host *
*****************/
/***********************
* class OSD_MAllocHook *
***********************/
/********************
* class OSD_MemInfo *
********************/
/*********************
* class OSD_Parallel *
*********************/
/*****************
* class OSD_Path *
*****************/
/**********************
* class OSD_PerfMeter *
**********************/
/********************
* class OSD_Process *
********************/
/***********************
* class OSD_Protection *
***********************/
/**************************
* class OSD_SharedLibrary *
**************************/
/*******************
* class OSD_Thread *
*******************/
/***********************
* class OSD_ThreadPool *
***********************/
/**********************
* class OSD_Directory *
**********************/
/*****************
* class OSD_File *
*****************/
/******************
* class OSD_Timer *
******************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class OSD_Timer:
	pass

@classnotwrapped
class OSD_PerfMeter:
	pass

@classnotwrapped
class OSD_Disk:
	pass

@classnotwrapped
class OSD_Protection:
	pass

@classnotwrapped
class OSD_MemInfo:
	pass

@classnotwrapped
class OSD_DirectoryIterator:
	pass

@classnotwrapped
class OSD_Chronometer:
	pass

@classnotwrapped
class OSD_ThreadPool:
	pass

@classnotwrapped
class OSD_SharedLibrary:
	pass

@classnotwrapped
class OSD_Error:
	pass

@classnotwrapped
class OSD_Host:
	pass

@classnotwrapped
class OSD_Parallel:
	pass

@classnotwrapped
class OSD_Directory:
	pass

@classnotwrapped
class OSD_Path:
	pass

@classnotwrapped
class OSD_Process:
	pass

@classnotwrapped
class OSD_MAllocHook:
	pass

@classnotwrapped
class OSD_FileNode:
	pass

@classnotwrapped
class OSD_File:
	pass

@classnotwrapped
class OSD_FileIterator:
	pass

@classnotwrapped
class OSD_Thread:
	pass

@classnotwrapped
class OSD_Environment:
	pass

@classnotwrapped
class OSD:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
