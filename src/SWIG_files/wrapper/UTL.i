/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define UTLDOCSTRING
"UTL module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_UTL.html"
%enddef
%module (package="OCC.Core", docstring=UTLDOCSTRING) UTL

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(utl) UTL;
class UTL {
	public:
		%feature("compactdefaultargs") AddToUserInfo;
		%feature("autodoc", "	:param aData:
	:type aData: opencascade::handle<Storage_Data> &
	:param anInfo:
	:type anInfo: TCollection_ExtendedString &
	:rtype: void
") AddToUserInfo;
		static void AddToUserInfo (const opencascade::handle<Storage_Data> & aData,const TCollection_ExtendedString & anInfo);
		%feature("compactdefaultargs") CString;
		%feature("autodoc", "	:param anExtendedString:
	:type anExtendedString: TCollection_ExtendedString &
	:rtype: char *
") CString;
		static const char * CString (const TCollection_ExtendedString & anExtendedString);
		%feature("compactdefaultargs") Disk;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Disk;
		static TCollection_ExtendedString Disk (const OSD_Path & aPath);
		%feature("compactdefaultargs") ExtendedString;
		%feature("autodoc", "	:param anAsciiString:
	:type anAsciiString: TCollection_AsciiString &
	:rtype: TCollection_ExtendedString
") ExtendedString;
		static TCollection_ExtendedString ExtendedString (const TCollection_AsciiString & anAsciiString);
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Extension;
		static TCollection_ExtendedString Extension (const OSD_Path & aPath);
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") Extension;
		static TCollection_ExtendedString Extension (const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") FileIterator;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:param aMask:
	:type aMask: TCollection_ExtendedString &
	:rtype: OSD_FileIterator
") FileIterator;
		static OSD_FileIterator FileIterator (const OSD_Path & aPath,const TCollection_ExtendedString & aMask);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param aResourceManager:
	:type aResourceManager: opencascade::handle<Resource_Manager> &
	:param aResourceName:
	:type aResourceName: TCollection_ExtendedString &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const opencascade::handle<Resource_Manager> & aResourceManager,const TCollection_ExtendedString & aResourceName);
		%feature("compactdefaultargs") GUID;
		%feature("autodoc", "	:param anXString:
	:type anXString: TCollection_ExtendedString &
	:rtype: Standard_GUID
") GUID;
		static Standard_GUID GUID (const TCollection_ExtendedString & anXString);
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "	:param anExtendedString:
	:type anExtendedString: TCollection_ExtendedString &
	:rtype: int
") IntegerValue;
		static Standard_Integer IntegerValue (const TCollection_ExtendedString & anExtendedString);
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: bool
") IsReadOnly;
		static Standard_Boolean IsReadOnly (const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") LocalHost;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") LocalHost;
		static TCollection_ExtendedString LocalHost ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Name;
		static TCollection_ExtendedString Name (const OSD_Path & aPath);
		%feature("compactdefaultargs") OpenFile;
		%feature("autodoc", "	:param aFile:
	:type aFile: Storage_BaseDriver &
	:param aName:
	:type aName: TCollection_ExtendedString &
	:param aMode:
	:type aMode: Storage_OpenMode
	:rtype: Storage_Error
") OpenFile;
		static Storage_Error OpenFile (Storage_BaseDriver & aFile,const TCollection_ExtendedString & aName,const Storage_OpenMode aMode);
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: OSD_Path
") Path;
		static OSD_Path Path (const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") Trek;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Trek;
		static TCollection_ExtendedString Trek (const OSD_Path & aPath);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param aResourceManager:
	:type aResourceManager: opencascade::handle<Resource_Manager> &
	:param aResourceName:
	:type aResourceName: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") Value;
		static TCollection_ExtendedString Value (const opencascade::handle<Resource_Manager> & aResourceManager,const TCollection_ExtendedString & aResourceName);
		%feature("compactdefaultargs") xgetenv;
		%feature("autodoc", "	:param aCString:
	:type aCString: char *
	:rtype: TCollection_ExtendedString
") xgetenv;
		static TCollection_ExtendedString xgetenv (const char * aCString);
};


%extend UTL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
