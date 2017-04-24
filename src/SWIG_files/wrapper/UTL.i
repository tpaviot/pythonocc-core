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
%module (package="OCC") UTL

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


%include UTL_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(utl) UTL;
class UTL {
	public:
		%feature("compactdefaultargs") xgetenv;
		%feature("autodoc", "	:param aCString:
	:type aCString: char *
	:rtype: TCollection_ExtendedString
") xgetenv;
		static TCollection_ExtendedString xgetenv (const char * aCString);
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
		%feature("compactdefaultargs") AddToUserInfo;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param anInfo:
	:type anInfo: TCollection_ExtendedString &
	:rtype: void
") AddToUserInfo;
		static void AddToUserInfo (const Handle_Storage_Data & aData,const TCollection_ExtendedString & anInfo);
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: OSD_Path
") Path;
		static OSD_Path Path (const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") Disk;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Disk;
		static TCollection_ExtendedString Disk (const OSD_Path & aPath);
		%feature("compactdefaultargs") Trek;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Trek;
		static TCollection_ExtendedString Trek (const OSD_Path & aPath);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Name;
		static TCollection_ExtendedString Name (const OSD_Path & aPath);
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:rtype: TCollection_ExtendedString
") Extension;
		static TCollection_ExtendedString Extension (const OSD_Path & aPath);
		%feature("compactdefaultargs") FileIterator;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:param aMask:
	:type aMask: TCollection_ExtendedString &
	:rtype: OSD_FileIterator
") FileIterator;
		static OSD_FileIterator FileIterator (const OSD_Path & aPath,const TCollection_ExtendedString & aMask);
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") Extension;
		static TCollection_ExtendedString Extension (const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") LocalHost;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") LocalHost;
		static TCollection_ExtendedString LocalHost ();
		%feature("compactdefaultargs") ExtendedString;
		%feature("autodoc", "	:param anAsciiString:
	:type anAsciiString: TCollection_AsciiString &
	:rtype: TCollection_ExtendedString
") ExtendedString;
		static TCollection_ExtendedString ExtendedString (const TCollection_AsciiString & anAsciiString);
		%feature("compactdefaultargs") GUID;
		%feature("autodoc", "	:param anXString:
	:type anXString: TCollection_ExtendedString &
	:rtype: Standard_GUID
") GUID;
		static Standard_GUID GUID (const TCollection_ExtendedString & anXString);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param aResourceManager:
	:type aResourceManager: Handle_Resource_Manager &
	:param aResourceName:
	:type aResourceName: TCollection_ExtendedString &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const Handle_Resource_Manager & aResourceManager,const TCollection_ExtendedString & aResourceName);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param aResourceManager:
	:type aResourceManager: Handle_Resource_Manager &
	:param aResourceName:
	:type aResourceName: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") Value;
		static TCollection_ExtendedString Value (const Handle_Resource_Manager & aResourceManager,const TCollection_ExtendedString & aResourceName);
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "	:param anExtendedString:
	:type anExtendedString: TCollection_ExtendedString &
	:rtype: int
") IntegerValue;
		static Standard_Integer IntegerValue (const TCollection_ExtendedString & anExtendedString);
		%feature("compactdefaultargs") CString;
		%feature("autodoc", "	:param anExtendedString:
	:type anExtendedString: TCollection_ExtendedString &
	:rtype: char *
") CString;
		static const char * CString (const TCollection_ExtendedString & anExtendedString);
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: bool
") IsReadOnly;
		static Standard_Boolean IsReadOnly (const TCollection_ExtendedString & aFileName);
};


%extend UTL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
