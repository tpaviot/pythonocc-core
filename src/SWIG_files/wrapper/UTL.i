/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_utl.html"
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
%include ../common/EnumTemplates.i
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
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
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
		/**** md5 signature: b3243cfe95ce11e0c4060fd5b3207a9b ****/
		%feature("compactdefaultargs") AddToUserInfo;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
anInfo: str

Returns
-------
None
") AddToUserInfo;
		static void AddToUserInfo(const opencascade::handle<Storage_Data> & aData, TCollection_ExtendedString anInfo);

		/****************** CString ******************/
		/**** md5 signature: 27efc7f42e41e693f1b566c94a6e6b65 ****/
		%feature("compactdefaultargs") CString;
		%feature("autodoc", "No available documentation.

Parameters
----------
anExtendedString: str

Returns
-------
str
") CString;
		static Standard_CString CString(TCollection_ExtendedString anExtendedString);

		/****************** Disk ******************/
		/**** md5 signature: d10b057859f3bb88132a108ce30e1b0f ****/
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
		/**** md5 signature: e0c0330cf05e6129dbdc1f941e163344 ****/
		%feature("compactdefaultargs") ExtendedString;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAsciiString: str

Returns
-------
TCollection_ExtendedString
") ExtendedString;
		static TCollection_ExtendedString ExtendedString(TCollection_AsciiString anAsciiString);

		/****************** Extension ******************/
		/**** md5 signature: 1fdfaa46bc1f63a768ff0970605a74b4 ****/
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
		/**** md5 signature: 2f709b95bf1753f25f34eb90bf2c33b5 ****/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str

Returns
-------
TCollection_ExtendedString
") Extension;
		static TCollection_ExtendedString Extension(TCollection_ExtendedString aFileName);

		/****************** FileIterator ******************/
		/**** md5 signature: 3b8e95af39e7222c79ee3874818359ae ****/
		%feature("compactdefaultargs") FileIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: OSD_Path
aMask: str

Returns
-------
OSD_FileIterator
") FileIterator;
		static OSD_FileIterator FileIterator(const OSD_Path & aPath, TCollection_ExtendedString aMask);

		/****************** Find ******************/
		/**** md5 signature: 7d0c88cfc70710cdf2dc6818263dc184 ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "No available documentation.

Parameters
----------
aResourceManager: Resource_Manager
aResourceName: str

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const opencascade::handle<Resource_Manager> & aResourceManager, TCollection_ExtendedString aResourceName);

		/****************** GUID ******************/
		/**** md5 signature: 76570a611bd03b2da6866c2d772e9fca ****/
		%feature("compactdefaultargs") GUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
anXString: str

Returns
-------
Standard_GUID
") GUID;
		static Standard_GUID GUID(TCollection_ExtendedString anXString);

		/****************** IntegerValue ******************/
		/**** md5 signature: 5a50b43fa4a82a78c3725a39c3dd3b89 ****/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
anExtendedString: str

Returns
-------
int
") IntegerValue;
		static Standard_Integer IntegerValue(TCollection_ExtendedString anExtendedString);

		/****************** IsReadOnly ******************/
		/**** md5 signature: 20a1ebdd29b1efdf19fc6ba48c54072e ****/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str

Returns
-------
bool
") IsReadOnly;
		static Standard_Boolean IsReadOnly(TCollection_ExtendedString aFileName);

		/****************** LocalHost ******************/
		/**** md5 signature: 0263c99711423d618edb93f574dec1d5 ****/
		%feature("compactdefaultargs") LocalHost;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") LocalHost;
		static TCollection_ExtendedString LocalHost();

		/****************** Name ******************/
		/**** md5 signature: dd35459a9c8ed322e5b1e36c5cec63f5 ****/
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
		/**** md5 signature: f956ac608cfd1a111b88dad1825c2fa1 ****/
		%feature("compactdefaultargs") OpenFile;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFile: Storage_BaseDriver
aName: str
aMode: Storage_OpenMode

Returns
-------
Storage_Error
") OpenFile;
		static Storage_Error OpenFile(const opencascade::handle<Storage_BaseDriver> & aFile, TCollection_ExtendedString aName, const Storage_OpenMode aMode);

		/****************** Path ******************/
		/**** md5 signature: 9faecbe5b613cbbbe4a339567e73579e ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str

Returns
-------
OSD_Path
") Path;
		static OSD_Path Path(TCollection_ExtendedString aFileName);

		/****************** Trek ******************/
		/**** md5 signature: 3755ade30d352379a2655437c039728d ****/
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
		/**** md5 signature: 6e0c1bb8a9f3dc81b995448bd593642b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
aResourceManager: Resource_Manager
aResourceName: str

Returns
-------
TCollection_ExtendedString
") Value;
		static TCollection_ExtendedString Value(const opencascade::handle<Resource_Manager> & aResourceManager, TCollection_ExtendedString aResourceName);

		/****************** xgetenv ******************/
		/**** md5 signature: f0cc6b56a545b4756269104c4f87d26e ****/
		%feature("compactdefaultargs") xgetenv;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCString: str

Returns
-------
TCollection_ExtendedString
") xgetenv;
		static TCollection_ExtendedString xgetenv(Standard_CString aCString);

};


%extend UTL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def utl_AddToUserInfo(*args):
	return utl.AddToUserInfo(*args)

@deprecated
def utl_CString(*args):
	return utl.CString(*args)

@deprecated
def utl_Disk(*args):
	return utl.Disk(*args)

@deprecated
def utl_ExtendedString(*args):
	return utl.ExtendedString(*args)

@deprecated
def utl_Extension(*args):
	return utl.Extension(*args)

@deprecated
def utl_Extension(*args):
	return utl.Extension(*args)

@deprecated
def utl_FileIterator(*args):
	return utl.FileIterator(*args)

@deprecated
def utl_Find(*args):
	return utl.Find(*args)

@deprecated
def utl_GUID(*args):
	return utl.GUID(*args)

@deprecated
def utl_IntegerValue(*args):
	return utl.IntegerValue(*args)

@deprecated
def utl_IsReadOnly(*args):
	return utl.IsReadOnly(*args)

@deprecated
def utl_LocalHost(*args):
	return utl.LocalHost(*args)

@deprecated
def utl_Name(*args):
	return utl.Name(*args)

@deprecated
def utl_OpenFile(*args):
	return utl.OpenFile(*args)

@deprecated
def utl_Path(*args):
	return utl.Path(*args)

@deprecated
def utl_Trek(*args):
	return utl.Trek(*args)

@deprecated
def utl_Value(*args):
	return utl.Value(*args)

@deprecated
def utl_xgetenv(*args):
	return utl.xgetenv(*args)

}
