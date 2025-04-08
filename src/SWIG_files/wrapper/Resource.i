/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define RESOURCEDOCSTRING
"Resource module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_resource.html"
%enddef
%module (package="OCC.Core", docstring=RESOURCEDOCSTRING) Resource


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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Resource_module.hxx>

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
enum Resource_FormatType {
	Resource_FormatType_SJIS = 0,
	Resource_FormatType_EUC = 1,
	Resource_FormatType_NoConversion = 2,
	Resource_FormatType_GB = 3,
	Resource_FormatType_UTF8 = 4,
	Resource_FormatType_SystemLocale = 5,
	Resource_FormatType_CP1250 = 6,
	Resource_FormatType_CP1251 = 7,
	Resource_FormatType_CP1252 = 8,
	Resource_FormatType_CP1253 = 9,
	Resource_FormatType_CP1254 = 10,
	Resource_FormatType_CP1255 = 11,
	Resource_FormatType_CP1256 = 12,
	Resource_FormatType_CP1257 = 13,
	Resource_FormatType_CP1258 = 14,
	Resource_FormatType_iso8859_1 = 15,
	Resource_FormatType_iso8859_2 = 16,
	Resource_FormatType_iso8859_3 = 17,
	Resource_FormatType_iso8859_4 = 18,
	Resource_FormatType_iso8859_5 = 19,
	Resource_FormatType_iso8859_6 = 20,
	Resource_FormatType_iso8859_7 = 21,
	Resource_FormatType_iso8859_8 = 22,
	Resource_FormatType_iso8859_9 = 23,
	Resource_FormatType_CP850 = 24,
	Resource_FormatType_GBK = 25,
	Resource_FormatType_Big5 = 26,
	Resource_FormatType_ANSI = Resource_FormatType_NoConversion,
	Resource_SJIS = Resource_FormatType_SJIS,
	Resource_EUC = Resource_FormatType_EUC,
	Resource_ANSI = Resource_FormatType_ANSI,
	Resource_GB = Resource_FormatType_GB,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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
	Resource_FormatType_ANSI = Resource_FormatType_NoConversion
	Resource_SJIS = Resource_FormatType_SJIS
	Resource_EUC = Resource_FormatType_EUC
	Resource_ANSI = Resource_FormatType_ANSI
	Resource_GB = Resource_FormatType_GB
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
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Resource_Manager)
/* end handles declaration */

/* templates */
%template(Resource_DataMapOfAsciiStringAsciiString) NCollection_DataMap<TCollection_AsciiString,TCollection_AsciiString>;
%template(Resource_DataMapOfAsciiStringExtendedString) NCollection_DataMap<TCollection_AsciiString,TCollection_ExtendedString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString>::Iterator Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_ExtendedString>::Iterator Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString> Resource_DataMapOfAsciiStringAsciiString;
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_ExtendedString> Resource_DataMapOfAsciiStringExtendedString;
/* end typedefs declaration */

/********************************
* class Resource_LexicalCompare *
********************************/
class Resource_LexicalCompare {
	public:
		/****** Resource_LexicalCompare::Resource_LexicalCompare ******/
		/****** md5 signature: 43d39cb1a0a098b9254c491f2ca1c67a ******/
		%feature("compactdefaultargs") Resource_LexicalCompare;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Resource_LexicalCompare;
		 Resource_LexicalCompare();

		/****** Resource_LexicalCompare::IsLower ******/
		/****** md5 signature: 18ef6ebb123c53ca5a6b5e0e6e18c888 ******/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "
Parameters
----------
Left: str
Right: str

Return
-------
bool

Description
-----------
Returns True if <Left> is lower than <Right>.
") IsLower;
		Standard_Boolean IsLower(TCollection_AsciiString Left, TCollection_AsciiString Right);

};


%extend Resource_LexicalCompare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Resource_Manager *
*************************/
class Resource_Manager : public Standard_Transient {
	public:
		/****** Resource_Manager::Resource_Manager ******/
		/****** md5 signature: 2c3dc4ee36f9982ef8c27d548accdc18 ******/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "
Parameters
----------
aName: str
Verbose: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Create a Resource manager. Attempts to find the two following files: $CSF_`aName`Defaults/aName $CSF_`aName`UserDefaults/aName and load them respectively into a reference and a user resource structure. //! If CSF_ResourceVerbose defined, seeked files will be printed. //! FILE SYNTAX The syntax of a resource file is a sequence of resource lines terminated by newline characters or end of file. The syntax of an individual resource line is:.
") Resource_Manager;
		 Resource_Manager(Standard_CString aName, const Standard_Boolean Verbose = Standard_False);

		/****** Resource_Manager::Resource_Manager ******/
		/****** md5 signature: 94a9bf1e751906a5d5dd7b470590375c ******/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create an empty Resource manager.
") Resource_Manager;
		 Resource_Manager();

		/****** Resource_Manager::Resource_Manager ******/
		/****** md5 signature: 1f6d540d565637ee2761b199541d8d4f ******/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "
Parameters
----------
theName: str
theDefaultsDirectory: str
theUserDefaultsDirectory: str
theIsVerbose: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Create a Resource manager. 
Input parameter: theName description file name 
Input parameter: theDefaultsDirectory default folder for looking description file 
Input parameter: theUserDefaultsDirectory user folder for looking description file 
Input parameter: theIsVerbose print verbose messages.
") Resource_Manager;
		 Resource_Manager(TCollection_AsciiString theName, TCollection_AsciiString theDefaultsDirectory, TCollection_AsciiString theUserDefaultsDirectory, const Standard_Boolean theIsVerbose = Standard_False);

		/****** Resource_Manager::ExtValue ******/
		/****** md5 signature: eacb0ae55d7f76df617e14be66e1f1b0 ******/
		%feature("compactdefaultargs") ExtValue;
		%feature("autodoc", "
Parameters
----------
aResourceName: str

Return
-------
Standard_ExtString

Description
-----------
Gets the value of an ExtString resource according to its instance and its type.
") ExtValue;
		virtual Standard_ExtString ExtValue(Standard_CString aResourceName);

		/****** Resource_Manager::Find ******/
		/****** md5 signature: ad646ce41630b595ea3f002fe0683f59 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
aResource: str

Return
-------
bool

Description
-----------
returns True if the Resource does exist.
") Find;
		Standard_Boolean Find(Standard_CString aResource);

		/****** Resource_Manager::Find ******/
		/****** md5 signature: 294981535cdceb04223d5675a243c4c7 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
theResource: str
theValue: str

Return
-------
bool

Description
-----------
returns True if the Resource does exist.
") Find;
		Standard_Boolean Find(TCollection_AsciiString theResource, TCollection_AsciiString & theValue);

		/****** Resource_Manager::GetMap ******/
		/****** md5 signature: 0a184cd99b151391a734472d41136b3b ******/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "
Parameters
----------
theRefMap: bool (optional, default to Standard_True)

Return
-------
Resource_DataMapOfAsciiStringAsciiString

Description
-----------
Returns internal Ref or User map with parameters.
") GetMap;
		Resource_DataMapOfAsciiStringAsciiString & GetMap(Standard_Boolean theRefMap = Standard_True);

		/****** Resource_Manager::GetResourcePath ******/
		/****** md5 signature: e37f4ebfe1a5c28a696f168d5c81f4e2 ******/
		%feature("compactdefaultargs") GetResourcePath;
		%feature("autodoc", "
Parameters
----------
aPath: str
aName: str
isUserDefaults: bool

Return
-------
None

Description
-----------
Gets the resource file full path by its name. If corresponding environment variable is not set or file doesn't exist returns empty string.
") GetResourcePath;
		static void GetResourcePath(TCollection_AsciiString & aPath, Standard_CString aName, const Standard_Boolean isUserDefaults);

		/****** Resource_Manager::Integer ******/
		/****** md5 signature: 459f06c743be8fcf9fa4e5326394951e ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "
Parameters
----------
aResourceName: str

Return
-------
int

Description
-----------
Gets the value of an integer resource according to its instance and its type.
") Integer;
		virtual Standard_Integer Integer(Standard_CString aResourceName);

		/****** Resource_Manager::IsInitialized ******/
		/****** md5 signature: 5dd1a91f52c88ae79187c35d4cdaba30 ******/
		%feature("compactdefaultargs") IsInitialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if Resource have been found.
") IsInitialized;
		Standard_Boolean IsInitialized();

		/****** Resource_Manager::Real ******/
		/****** md5 signature: b6af1db9d303b345bf398c6e044f1093 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "
Parameters
----------
aResourceName: str

Return
-------
float

Description
-----------
Gets the value of a real resource according to its instance and its type.
") Real;
		virtual Standard_Real Real(Standard_CString aResourceName);

		/****** Resource_Manager::Save ******/
		/****** md5 signature: c46b0608963cc711253d0dc474525a23 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Save the user resource structure in the specified file. Creates the file if it does not exist.
") Save;
		Standard_Boolean Save();

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: 5cee39e81388e9738fbd5ea60762445e ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: str
aValue: int

Return
-------
None

Description
-----------
Sets the new value of an integer resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(Standard_CString aResourceName, const Standard_Integer aValue);

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: 5adf64f7de0821b4e2982633edbf9ea2 ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: str
aValue: float

Return
-------
None

Description
-----------
Sets the new value of a real resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(Standard_CString aResourceName, const Standard_Real aValue);

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: 8beffa88923a65f02524a44eab47c796 ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: str
aValue: str

Return
-------
None

Description
-----------
Sets the new value of an CString resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(Standard_CString aResourceName, Standard_CString aValue);

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: c3adf5010bcf4e1022068e87a43da2c6 ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: str
aValue: Standard_ExtString

Return
-------
None

Description
-----------
Sets the new value of an ExtString resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(Standard_CString aResourceName, const Standard_ExtString aValue);

		/****** Resource_Manager::Value ******/
		/****** md5 signature: 704eea869ed3ea373c063217f10964ef ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
aResourceName: str

Return
-------
str

Description
-----------
Gets the value of a CString resource according to its instance and its type.
") Value;
		virtual Standard_CString Value(Standard_CString aResourceName);

};


%make_alias(Resource_Manager)

%extend Resource_Manager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Resource_Unicode *
*************************/
class Resource_Unicode {
	public:
		/****** Resource_Unicode::ConvertBig5ToUnicode ******/
		/****** md5 signature: 4168524e0213960fd803d4807ed33f90 ******/
		%feature("compactdefaultargs") ConvertBig5ToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: str

Return
-------
bool

Description
-----------
Converts non-ASCII CString <fromstr> in Big5 format to Unicode ExtendedString <tostr>.
") ConvertBig5ToUnicode;
		static Standard_Boolean ConvertBig5ToUnicode(Standard_CString fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertEUCToUnicode ******/
		/****** md5 signature: a47f65202dbb4ad94609e631aefd3e71 ******/
		%feature("compactdefaultargs") ConvertEUCToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: str

Return
-------
None

Description
-----------
Converts non-ASCII CString <fromstr> in EUC format to Unicode ExtendedString <tostr>.
") ConvertEUCToUnicode;
		static void ConvertEUCToUnicode(Standard_CString fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertFormatToUnicode ******/
		/****** md5 signature: 092af2a29361b36b8f1d60b684d8e660 ******/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "
Parameters
----------
theFromStr: str
theToStr: str

Return
-------
None

Description
-----------
Converts the non-ASCII C string (as specified by GetFormat()) to the Unicode string of extended characters.
") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode(Standard_CString theFromStr, TCollection_ExtendedString & theToStr);

		/****** Resource_Unicode::ConvertFormatToUnicode ******/
		/****** md5 signature: 1a39a61476a07a6c419d95aa2f936c87 ******/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "
Parameters
----------
theFormat: Resource_FormatType
theFromStr: str
theToStr: str

Return
-------
None

Description
-----------
Converts the non-ASCII C string in specified format to the Unicode string of extended characters. 
Input parameter: theFormat source encoding 
Input parameter: theFromStr text to convert @param[out] theToStr destination string.
") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode(const Resource_FormatType theFormat, Standard_CString theFromStr, TCollection_ExtendedString & theToStr);

		/****** Resource_Unicode::ConvertGBKToUnicode ******/
		/****** md5 signature: 55ed525176f6d874f96d41764a2499d6 ******/
		%feature("compactdefaultargs") ConvertGBKToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: str

Return
-------
bool

Description
-----------
Converts non-ASCII CString <fromstr> in GBK format to Unicode ExtendedString <tostr>.
") ConvertGBKToUnicode;
		static Standard_Boolean ConvertGBKToUnicode(Standard_CString fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertGBToUnicode ******/
		/****** md5 signature: a22cad6ea4c1a1e6cd398d067edaa57c ******/
		%feature("compactdefaultargs") ConvertGBToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: str

Return
-------
None

Description
-----------
Converts non-ASCII CString <fromstr> in GB format to Unicode ExtendedString <tostr>.
") ConvertGBToUnicode;
		static void ConvertGBToUnicode(Standard_CString fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertSJISToUnicode ******/
		/****** md5 signature: 3e6f135c27c0b105b7e7e224b4376205 ******/
		%feature("compactdefaultargs") ConvertSJISToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: str

Return
-------
None

Description
-----------
Converts non-ASCII CString <fromstr> in SJIS format to Unicode ExtendedString <tostr>.
") ConvertSJISToUnicode;
		static void ConvertSJISToUnicode(Standard_CString fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertUnicodeToANSI ******/
		/****** md5 signature: becd4b24e1324dac8a09502a0f3b35e3 ******/
		%feature("compactdefaultargs") ConvertUnicodeToANSI;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: Standard_PCharacter
maxsize: int

Return
-------
bool

Description
-----------
Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in ANSI format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
") ConvertUnicodeToANSI;
		static Standard_Boolean ConvertUnicodeToANSI(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****** Resource_Unicode::ConvertUnicodeToEUC ******/
		/****** md5 signature: 3de0636677422237545faabc4b82044a ******/
		%feature("compactdefaultargs") ConvertUnicodeToEUC;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: Standard_PCharacter
maxsize: int

Return
-------
bool

Description
-----------
Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in EUC format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
") ConvertUnicodeToEUC;
		static Standard_Boolean ConvertUnicodeToEUC(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****** Resource_Unicode::ConvertUnicodeToFormat ******/
		/****** md5 signature: 8743e70c9c2a155ce180b78c36c04a71 ******/
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "
Parameters
----------
theFormat: Resource_FormatType
theFromStr: str
theToStr: Standard_PCharacter
theMaxSize: int

Return
-------
bool

Description
-----------
Converts the Unicode string of extended characters to the non-ASCII string according to specified format. You need more than twice the length of the source string to complete the conversion. The function returns true if conversion is complete, i.e. the maximum number of characters is not reached before the end of conversion. 
Input parameter: theFormat destination encoding 
Input parameter: theFromStr text to convert @param[out] theToStr destination buffer 
Input parameter: theMaxSize destination buffer length.
") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat(const Resource_FormatType theFormat, TCollection_ExtendedString theFromStr, Standard_PCharacter & theToStr, const Standard_Integer theMaxSize);

		/****** Resource_Unicode::ConvertUnicodeToFormat ******/
		/****** md5 signature: 3a0226ee9a6304b9f55b4674dccd26dc ******/
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "
Parameters
----------
theFromStr: str
theToStr: Standard_PCharacter
theMaxSize: int

Return
-------
bool

Description
-----------
Converts the Unicode string of extended characters to the non-ASCII string according to the format returned by the function GetFormat. 
Input parameter: theFromStr text to convert @param[out] theToStr destination buffer 
Input parameter: theMaxSize destination buffer length.
") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat(TCollection_ExtendedString theFromStr, Standard_PCharacter & theToStr, const Standard_Integer theMaxSize);

		/****** Resource_Unicode::ConvertUnicodeToGB ******/
		/****** md5 signature: e92423028aa69f039e50fc871d72daf2 ******/
		%feature("compactdefaultargs") ConvertUnicodeToGB;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: Standard_PCharacter
maxsize: int

Return
-------
bool

Description
-----------
Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in GB format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
") ConvertUnicodeToGB;
		static Standard_Boolean ConvertUnicodeToGB(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****** Resource_Unicode::ConvertUnicodeToSJIS ******/
		/****** md5 signature: 405eb61d326bd40b62e69514a5638a62 ******/
		%feature("compactdefaultargs") ConvertUnicodeToSJIS;
		%feature("autodoc", "
Parameters
----------
fromstr: str
tostr: Standard_PCharacter
maxsize: int

Return
-------
bool

Description
-----------
Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in SJIS format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
") ConvertUnicodeToSJIS;
		static Standard_Boolean ConvertUnicodeToSJIS(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****** Resource_Unicode::GetFormat ******/
		/****** md5 signature: b7f0b16e429d16aced2ecaaf3804dc38 ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
Resource_FormatType

Description
-----------
Returns the current conversion format (either ANSI, EUC, GB or SJIS). The current converting format must be defined in advance with the SetFormat function.
") GetFormat;
		static Resource_FormatType GetFormat();

		/****** Resource_Unicode::ReadFormat ******/
		/****** md5 signature: 9707c87226e3d6fd6486b6673c5e6357 ******/
		%feature("compactdefaultargs") ReadFormat;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reads converting format from resource 'FormatType' in Resource Manager 'CharSet'.
") ReadFormat;
		static void ReadFormat();

		/****** Resource_Unicode::SetFormat ******/
		/****** md5 signature: 2724b939d7616dbac969aeef0cc09e56 ******/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "
Parameters
----------
typecode: Resource_FormatType

Return
-------
None

Description
-----------
Defines the current conversion format as typecode. This conversion format will then be used by the functions ConvertFormatToUnicode and ConvertUnicodeToFormat to convert the strings.
") SetFormat;
		static void SetFormat(const Resource_FormatType typecode);

};


%extend Resource_Unicode {
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
def Resource_Manager_GetResourcePath(*args):
	return Resource_Manager.GetResourcePath(*args)

@deprecated
def Resource_Unicode_ConvertBig5ToUnicode(*args):
	return Resource_Unicode.ConvertBig5ToUnicode(*args)

@deprecated
def Resource_Unicode_ConvertEUCToUnicode(*args):
	return Resource_Unicode.ConvertEUCToUnicode(*args)

@deprecated
def Resource_Unicode_ConvertFormatToUnicode(*args):
	return Resource_Unicode.ConvertFormatToUnicode(*args)

@deprecated
def Resource_Unicode_ConvertFormatToUnicode(*args):
	return Resource_Unicode.ConvertFormatToUnicode(*args)

@deprecated
def Resource_Unicode_ConvertGBKToUnicode(*args):
	return Resource_Unicode.ConvertGBKToUnicode(*args)

@deprecated
def Resource_Unicode_ConvertGBToUnicode(*args):
	return Resource_Unicode.ConvertGBToUnicode(*args)

@deprecated
def Resource_Unicode_ConvertSJISToUnicode(*args):
	return Resource_Unicode.ConvertSJISToUnicode(*args)

@deprecated
def Resource_Unicode_ConvertUnicodeToANSI(*args):
	return Resource_Unicode.ConvertUnicodeToANSI(*args)

@deprecated
def Resource_Unicode_ConvertUnicodeToEUC(*args):
	return Resource_Unicode.ConvertUnicodeToEUC(*args)

@deprecated
def Resource_Unicode_ConvertUnicodeToFormat(*args):
	return Resource_Unicode.ConvertUnicodeToFormat(*args)

@deprecated
def Resource_Unicode_ConvertUnicodeToFormat(*args):
	return Resource_Unicode.ConvertUnicodeToFormat(*args)

@deprecated
def Resource_Unicode_ConvertUnicodeToGB(*args):
	return Resource_Unicode.ConvertUnicodeToGB(*args)

@deprecated
def Resource_Unicode_ConvertUnicodeToSJIS(*args):
	return Resource_Unicode.ConvertUnicodeToSJIS(*args)

@deprecated
def Resource_Unicode_GetFormat(*args):
	return Resource_Unicode.GetFormat(*args)

@deprecated
def Resource_Unicode_ReadFormat(*args):
	return Resource_Unicode.ReadFormat(*args)

@deprecated
def Resource_Unicode_SetFormat(*args):
	return Resource_Unicode.SetFormat(*args)

}
