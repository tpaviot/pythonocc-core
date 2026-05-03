/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_resource.html"
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
%ignore NCollection_DataMap<TCollection_AsciiString,TCollection_AsciiString>::Items;
%ignore NCollection_DataMap<TCollection_AsciiString,TCollection_AsciiString>::KeyValues;
%template(Resource_DataMapOfAsciiStringAsciiString) NCollection_DataMap<TCollection_AsciiString,TCollection_AsciiString>;
%ignore NCollection_DataMap<TCollection_AsciiString,TCollection_ExtendedString>::Items;
%ignore NCollection_DataMap<TCollection_AsciiString,TCollection_ExtendedString>::KeyValues;
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
		/****** md5 signature: 5d1c99ed9a83e5244aec9691e97acd15 ******/
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
		bool IsLower(TCollection_AsciiString Left, TCollection_AsciiString Right);

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
		/****** md5 signature: 90ede6bc7c51eae00bd76ec2a26325b2 ******/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "
Parameters
----------
aName: char *
Verbose: bool (optional, default to false)

Return
-------
None

Description
-----------
Create a Resource manager. Attempts to find the two following files: $CSF_`aName`Defaults/aName $CSF_`aName`UserDefaults/aName and load them respectively into a reference and a user resource structure. //! If CSF_ResourceVerbose defined, seeked files will be printed. //! FILE SYNTAX The syntax of a resource file is a sequence of resource lines terminated by newline characters or end of file. The syntax of an individual resource line is:.
") Resource_Manager;
		 Resource_Manager(const char * const aName, const bool Verbose = false);

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
		/****** md5 signature: 5a99a864481ed5c1c8635fa73dd03d2a ******/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "
Parameters
----------
theName: str
theDefaultsDirectory: str
theUserDefaultsDirectory: str
theIsVerbose: bool (optional, default to false)

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
		 Resource_Manager(TCollection_AsciiString theName, TCollection_AsciiString theDefaultsDirectory, TCollection_AsciiString theUserDefaultsDirectory, const bool theIsVerbose = false);

		/****** Resource_Manager::ExtValue ******/
		/****** md5 signature: 1cf9f8324a00f078533bf5a84368f3a7 ******/
		%feature("compactdefaultargs") ExtValue;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *

Return
-------
char16_t *

Description
-----------
Gets the value of an ExtString resource according to its instance and its type.
") ExtValue;
		virtual const char16_t * ExtValue(const char * const aResourceName);

		/****** Resource_Manager::Find ******/
		/****** md5 signature: 751b567440b1f6396b974c3857cbbef8 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
aResource: char *

Return
-------
bool

Description
-----------
returns True if the Resource does exist.
") Find;
		bool Find(const char * const aResource);

		/****** Resource_Manager::Find ******/
		/****** md5 signature: 53ee3de7ebfb2317b295e5d186d9a97f ******/
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
		bool Find(TCollection_AsciiString theResource, TCollection_AsciiString & theValue);

		/****** Resource_Manager::GetMap ******/
		/****** md5 signature: 4c2222c68101ee6b91f36d953c513ad1 ******/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "
Parameters
----------
theRefMap: bool (optional, default to true)

Return
-------
NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString>

Description
-----------
Returns internal Ref or User map with parameters.
") GetMap;
		NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString> & GetMap(bool theRefMap = true);

		/****** Resource_Manager::GetResourcePath ******/
		/****** md5 signature: 8ec97b0941774f1af532b6ba84db294f ******/
		%feature("compactdefaultargs") GetResourcePath;
		%feature("autodoc", "
Parameters
----------
aPath: str
aName: char *
isUserDefaults: bool

Return
-------
None

Description
-----------
Gets the resource file full path by its name. If corresponding environment variable is not set or file doesn't exist returns empty string.
") GetResourcePath;
		static void GetResourcePath(TCollection_AsciiString & aPath, const char * const aName, const bool isUserDefaults);

		/****** Resource_Manager::Integer ******/
		/****** md5 signature: 584194d9400123264ada4afa76af3f72 ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *

Return
-------
int

Description
-----------
Gets the value of an integer resource according to its instance and its type.
") Integer;
		virtual int Integer(const char * const aResourceName);

		/****** Resource_Manager::IsInitialized ******/
		/****** md5 signature: 01666b35dc0d7af2bf9583d3f531f49b ******/
		%feature("compactdefaultargs") IsInitialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if Resource have been found.
") IsInitialized;
		bool IsInitialized();

		/****** Resource_Manager::Real ******/
		/****** md5 signature: 485c1977420585efc0a814bef9157457 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *

Return
-------
double

Description
-----------
Gets the value of a real resource according to its instance and its type.
") Real;
		virtual double Real(const char * const aResourceName);

		/****** Resource_Manager::Save ******/
		/****** md5 signature: f996f97fb2396128ff775e679d1f393d ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Save the user resource structure in the specified file. Creates the file if it does not exist.
") Save;
		bool Save();

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: e67914e473ef1dea1b7777ffc24df903 ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *
aValue: int

Return
-------
None

Description
-----------
Sets the new value of an integer resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(const char * const aResourceName, const int aValue);

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: 2fd2985326d4dba3a59a1871238d9822 ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *
aValue: double

Return
-------
None

Description
-----------
Sets the new value of a real resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(const char * const aResourceName, const double aValue);

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: adb01a8eb6820dff2b6da6768f8e9cb5 ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *
aValue: char *

Return
-------
None

Description
-----------
Sets the new value of an CString resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(const char * const aResourceName, const char * const aValue);

		/****** Resource_Manager::SetResource ******/
		/****** md5 signature: c304b62ef341ad3812fda92963eed794 ******/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *
aValue: char16_t *

Return
-------
None

Description
-----------
Sets the new value of an ExtString resource. If the resource does not exist, it is created.
") SetResource;
		virtual void SetResource(const char * const aResourceName, const char16_t * const aValue);

		/****** Resource_Manager::Value ******/
		/****** md5 signature: fd3c3ee796f2f1f8e284f0c6b2048c88 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
aResourceName: char *

Return
-------
char *

Description
-----------
Gets the value of a CString resource according to its instance and its type.
") Value;
		virtual const char * Value(const char * const aResourceName);

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
		/****** md5 signature: eb43bf8a781206553406661c057ebf92 ******/
		%feature("compactdefaultargs") ConvertBig5ToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: char *
tostr: str

Return
-------
bool

Description
-----------
Converts non-ASCII CString <fromstr> in Big5 format to Unicode ExtendedString <tostr>.
") ConvertBig5ToUnicode;
		static bool ConvertBig5ToUnicode(const char * const fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertEUCToUnicode ******/
		/****** md5 signature: f088b80a867f96c7b93d95c57c43e58d ******/
		%feature("compactdefaultargs") ConvertEUCToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: char *
tostr: str

Return
-------
None

Description
-----------
Converts non-ASCII CString <fromstr> in EUC format to Unicode ExtendedString <tostr>.
") ConvertEUCToUnicode;
		static void ConvertEUCToUnicode(const char * const fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertFormatToUnicode ******/
		/****** md5 signature: 2f2f55b73b5e1248eff9a863309cc34a ******/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "
Parameters
----------
theFromStr: char *
theToStr: str

Return
-------
None

Description
-----------
Converts the non-ASCII C string (as specified by GetFormat()) to the Unicode string of extended characters.
") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode(const char * const theFromStr, TCollection_ExtendedString & theToStr);

		/****** Resource_Unicode::ConvertFormatToUnicode ******/
		/****** md5 signature: 93d219b8f4444f39d9c255402c21b70f ******/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "
Parameters
----------
theFormat: Resource_FormatType
theFromStr: char *
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
		static void ConvertFormatToUnicode(const Resource_FormatType theFormat, const char * const theFromStr, TCollection_ExtendedString & theToStr);

		/****** Resource_Unicode::ConvertGBKToUnicode ******/
		/****** md5 signature: ff4b19d1fae883ca3c58f7cedec724eb ******/
		%feature("compactdefaultargs") ConvertGBKToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: char *
tostr: str

Return
-------
bool

Description
-----------
Converts non-ASCII CString <fromstr> in GBK format to Unicode ExtendedString <tostr>.
") ConvertGBKToUnicode;
		static bool ConvertGBKToUnicode(const char * const fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertGBToUnicode ******/
		/****** md5 signature: be543e43bbba4087e08b0b8a72fe98bd ******/
		%feature("compactdefaultargs") ConvertGBToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: char *
tostr: str

Return
-------
None

Description
-----------
Converts non-ASCII CString <fromstr> in GB format to Unicode ExtendedString <tostr>.
") ConvertGBToUnicode;
		static void ConvertGBToUnicode(const char * const fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertSJISToUnicode ******/
		/****** md5 signature: e299a80c148610969d8622d62c2a8a3f ******/
		%feature("compactdefaultargs") ConvertSJISToUnicode;
		%feature("autodoc", "
Parameters
----------
fromstr: char *
tostr: str

Return
-------
None

Description
-----------
Converts non-ASCII CString <fromstr> in SJIS format to Unicode ExtendedString <tostr>.
") ConvertSJISToUnicode;
		static void ConvertSJISToUnicode(const char * const fromstr, TCollection_ExtendedString & tostr);

		/****** Resource_Unicode::ConvertUnicodeToANSI ******/
		/****** md5 signature: b8883fc14f176d4333fa1b8c29fae3af ******/
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
		static bool ConvertUnicodeToANSI(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const int maxsize);

		/****** Resource_Unicode::ConvertUnicodeToEUC ******/
		/****** md5 signature: f04835cab34878404c251c1c3b6c21a4 ******/
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
		static bool ConvertUnicodeToEUC(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const int maxsize);

		/****** Resource_Unicode::ConvertUnicodeToFormat ******/
		/****** md5 signature: fd8c2be912705d0d6182a59ff54d93f0 ******/
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
		static bool ConvertUnicodeToFormat(const Resource_FormatType theFormat, TCollection_ExtendedString theFromStr, Standard_PCharacter & theToStr, const int theMaxSize);

		/****** Resource_Unicode::ConvertUnicodeToFormat ******/
		/****** md5 signature: 55d66aa57c53dc4180711caa3b05a9a8 ******/
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
		static bool ConvertUnicodeToFormat(TCollection_ExtendedString theFromStr, Standard_PCharacter & theToStr, const int theMaxSize);

		/****** Resource_Unicode::ConvertUnicodeToGB ******/
		/****** md5 signature: eaa9512b9e24f2b8251a8e82073fa65d ******/
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
		static bool ConvertUnicodeToGB(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const int maxsize);

		/****** Resource_Unicode::ConvertUnicodeToSJIS ******/
		/****** md5 signature: 01a91c1ebccc636797d6d5a4b42eb351 ******/
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
		static bool ConvertUnicodeToSJIS(TCollection_ExtendedString fromstr, Standard_PCharacter & tostr, const int maxsize);

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
