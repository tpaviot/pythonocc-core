/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") OSD

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include OSD_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef Standard_Address ( * OSD_ThreadFunction ) ( Standard_Address data );
typedef pthread_t OSD_PThread;
/* end typedefs declaration */

/* public enums */
enum OSD_FromWhere {
	OSD_FromBeginning = 0,
	OSD_FromHere = 1,
	OSD_FromEnd = 2,
};

enum OSD_KindFile {
	OSD_FILE = 0,
	OSD_DIRECTORY = 1,
	OSD_LINK = 2,
	OSD_SOCKET = 3,
	OSD_UNKNOWN = 4,
};

enum OSD_LoadMode {
	OSD_RTLD_LAZY = 0,
	OSD_RTLD_NOW = 1,
};

enum OSD_LockType {
	OSD_NoLock = 0,
	OSD_ReadLock = 1,
	OSD_WriteLock = 2,
	OSD_ExclusiveLock = 3,
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

enum OSD_OpenMode {
	OSD_ReadOnly = 0,
	OSD_WriteOnly = 1,
	OSD_ReadWrite = 2,
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
	OSD_WPrinter = 14,
	OSD_WEnvironmentIterator = 15,
};

/* end public enums declaration */

