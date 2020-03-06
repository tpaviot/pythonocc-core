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
%define UTLDOCSTRING
"UTL module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_utl.html"
%enddef
%module (package="OCC.Core", docstring=UTLDOCSTRING) UTL


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
#include<UTL_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Storage_module.hxx>
#include<TCollection_module.hxx>
#include<OSD_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Storage.i
%import TCollection.i
%import OSD.i
%import Resource.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************
* class UTL *
************/
%rename(utl) UTL;
class UTL {
	public:
		/****************** AddToUserInfo ******************/
		%feature("compactdefaultargs") AddToUserInfo;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
anInfo: TCollection_ExtendedString

Returns
-------
None
") AddToUserInfo;
		static void AddToUserInfo(const opencascade::handle<Storage_Data> & aData, const TCollection_ExtendedString & anInfo);

		/****************** CString ******************/
		%feature("compactdefaultargs") CString;
		%feature("autodoc", "No available documentation.

Parameters
----------
anExtendedString: TCollection_ExtendedString

Returns
-------
char *
") CString;
		static const char * CString(const TCollection_ExtendedString & anExtendedString);

		/****************** Disk ******************/
		%feature("compactdefaultargs") Disk;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: OSD_Path

Returns
-------
TCollection_ExtendedString
") Disk;
		static TCollection_ExtendedString Disk(const OSD_Path & aPath);

		/****************** ExtendedString ******************/
		%feature("compactdefaultargs") ExtendedString;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAsciiString: TCollection_AsciiString

Returns
-------
TCollection_ExtendedString
") ExtendedString;
		static TCollection_ExtendedString ExtendedString(const TCollection_AsciiString & anAsciiString);

		/****************** Extension ******************/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: OSD_Path

Returns
-------
TCollection_ExtendedString
") Extension;
		static TCollection_ExtendedString Extension(const OSD_Path & aPath);

		/****************** Extension ******************/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") Extension;
		static TCollection_ExtendedString Extension(const TCollection_ExtendedString & aFileName);

		/****************** FileIterator ******************/
		%feature("compactdefaultargs") FileIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: OSD_Path
aMask: TCollection_ExtendedString

Returns
-------
OSD_FileIterator
") FileIterator;
		static OSD_FileIterator FileIterator(const OSD_Path & aPath, const TCollection_ExtendedString & aMask);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "No available documentation.

Parameters
----------
aResourceManager: Resource_Manager
aResourceName: TCollection_ExtendedString

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const opencascade::handle<Resource_Manager> & aResourceManager, const TCollection_ExtendedString & aResourceName);

		/****************** GUID ******************/
		%feature("compactdefaultargs") GUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
anXString: TCollection_ExtendedString

Returns
-------
Standard_GUID
") GUID;
		static Standard_GUID GUID(const TCollection_ExtendedString & anXString);

		/****************** IntegerValue ******************/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
anExtendedString: TCollection_ExtendedString

Returns
-------
int
") IntegerValue;
		static Standard_Integer IntegerValue(const TCollection_ExtendedString & anExtendedString);

		/****************** IsReadOnly ******************/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString

Returns
-------
bool
") IsReadOnly;
		static Standard_Boolean IsReadOnly(const TCollection_ExtendedString & aFileName);

		/****************** LocalHost ******************/
		%feature("compactdefaultargs") LocalHost;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") LocalHost;
		static TCollection_ExtendedString LocalHost();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: OSD_Path

Returns
-------
TCollection_ExtendedString
") Name;
		static TCollection_ExtendedString Name(const OSD_Path & aPath);

		/****************** OpenFile ******************/
		%feature("compactdefaultargs") OpenFile;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFile: Storage_BaseDriver
aName: TCollection_ExtendedString
aMode: Storage_OpenMode

Returns
-------
Storage_Error
") OpenFile;
		static Storage_Error OpenFile(Storage_BaseDriver & aFile, const TCollection_ExtendedString & aName, const Storage_OpenMode aMode);

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString

Returns
-------
OSD_Path
") Path;
		static OSD_Path Path(const TCollection_ExtendedString & aFileName);

		/****************** Trek ******************/
		%feature("compactdefaultargs") Trek;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: OSD_Path

Returns
-------
TCollection_ExtendedString
") Trek;
		static TCollection_ExtendedString Trek(const OSD_Path & aPath);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
aResourceManager: Resource_Manager
aResourceName: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") Value;
		static TCollection_ExtendedString Value(const opencascade::handle<Resource_Manager> & aResourceManager, const TCollection_ExtendedString & aResourceName);

		/****************** xgetenv ******************/
		%feature("compactdefaultargs") xgetenv;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCString: char *

Returns
-------
TCollection_ExtendedString
") xgetenv;
		static TCollection_ExtendedString xgetenv(const char * aCString);

};


%extend UTL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
