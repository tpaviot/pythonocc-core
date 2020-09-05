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
%define RESOURCEDOCSTRING
"Resource module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_resource.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
	Resource_FormatType_ANSI = 2,
	Resource_FormatType_GB = 3,
	Resource_FormatType_UTF8 = 4,
	Resource_FormatType_SystemLocale = 5,
	Resource_SJIS = Resource_FormatType_SJIS,
	Resource_EUC = Resource_FormatType_EUC,
	Resource_ANSI = Resource_FormatType_ANSI,
	Resource_GB = Resource_FormatType_GB,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Resource_FormatType(IntEnum):
	Resource_FormatType_SJIS = 0
	Resource_FormatType_EUC = 1
	Resource_FormatType_ANSI = 2
	Resource_FormatType_GB = 3
	Resource_FormatType_UTF8 = 4
	Resource_FormatType_SystemLocale = 5
	Resource_SJIS = Resource_FormatType_SJIS
	Resource_EUC = Resource_FormatType_EUC
	Resource_ANSI = Resource_FormatType_ANSI
	Resource_GB = Resource_FormatType_GB
Resource_FormatType_SJIS = Resource_FormatType.Resource_FormatType_SJIS
Resource_FormatType_EUC = Resource_FormatType.Resource_FormatType_EUC
Resource_FormatType_ANSI = Resource_FormatType.Resource_FormatType_ANSI
Resource_FormatType_GB = Resource_FormatType.Resource_FormatType_GB
Resource_FormatType_UTF8 = Resource_FormatType.Resource_FormatType_UTF8
Resource_FormatType_SystemLocale = Resource_FormatType.Resource_FormatType_SystemLocale
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
%template(Resource_DataMapOfAsciiStringAsciiString) NCollection_DataMap<TCollection_AsciiString,TCollection_AsciiString,TCollection_AsciiString>;
%template(Resource_DataMapOfAsciiStringExtendedString) NCollection_DataMap<TCollection_AsciiString,TCollection_ExtendedString,TCollection_AsciiString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString, TCollection_AsciiString>::Iterator Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_ExtendedString, TCollection_AsciiString>::Iterator Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString, TCollection_AsciiString> Resource_DataMapOfAsciiStringAsciiString;
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_ExtendedString, TCollection_AsciiString> Resource_DataMapOfAsciiStringExtendedString;
/* end typedefs declaration */

/********************************
* class Resource_LexicalCompare *
********************************/
class Resource_LexicalCompare {
	public:
		/****************** Resource_LexicalCompare ******************/
		/**** md5 signature: 43d39cb1a0a098b9254c491f2ca1c67a ****/
		%feature("compactdefaultargs") Resource_LexicalCompare;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Resource_LexicalCompare;
		 Resource_LexicalCompare();

		/****************** IsLower ******************/
		/**** md5 signature: 18ef6ebb123c53ca5a6b5e0e6e18c888 ****/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "Returns true if <left> is lower than <right>.

Parameters
----------
Left: TCollection_AsciiString
Right: TCollection_AsciiString

Returns
-------
bool
") IsLower;
		Standard_Boolean IsLower(const TCollection_AsciiString & Left, const TCollection_AsciiString & Right);

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
		/****************** Resource_Manager ******************/
		/**** md5 signature: 2c3dc4ee36f9982ef8c27d548accdc18 ****/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "Create a resource manager. attempts to find the two following files: $csf_`aname`defaults/aname $csf_`aname`userdefaults/aname and load them respectively into a reference and a user resource structure. //! if csf_resourceverbose defined, seeked files will be printed. //! file syntax the syntax of a resource file is a sequence of resource lines terminated by newline characters or end of file. the syntax of an individual resource line is:.

Parameters
----------
aName: char *
Verbose: bool,optional
	default value is Standard_False

Returns
-------
None
") Resource_Manager;
		 Resource_Manager(const char * aName, const Standard_Boolean Verbose = Standard_False);

		/****************** Resource_Manager ******************/
		/**** md5 signature: ce1f4090aa08cbeae77bec1df4191dbe ****/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: char *
aDefaultsDirectory: TCollection_AsciiString
anUserDefaultsDirectory: TCollection_AsciiString
Verbose: bool,optional
	default value is Standard_False

Returns
-------
None
") Resource_Manager;
		 Resource_Manager(const char * aName, TCollection_AsciiString & aDefaultsDirectory, TCollection_AsciiString & anUserDefaultsDirectory, const Standard_Boolean Verbose = Standard_False);

		/****************** ExtValue ******************/
		/**** md5 signature: eacb0ae55d7f76df617e14be66e1f1b0 ****/
		%feature("compactdefaultargs") ExtValue;
		%feature("autodoc", "Gets the value of an extstring resource according to its instance and its type.

Parameters
----------
aResourceName: char *

Returns
-------
Standard_ExtString
") ExtValue;
		virtual Standard_ExtString ExtValue(const char * aResourceName);

		/****************** Find ******************/
		/**** md5 signature: ad646ce41630b595ea3f002fe0683f59 ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Returns true if the resource does exist.

Parameters
----------
aResource: char *

Returns
-------
bool
") Find;
		Standard_Boolean Find(const char * aResource);

		/****************** GetResourcePath ******************/
		/**** md5 signature: e37f4ebfe1a5c28a696f168d5c81f4e2 ****/
		%feature("compactdefaultargs") GetResourcePath;
		%feature("autodoc", "Gets the resource file full path by its name. if corresponding environment variable is not set or file doesn't exist returns empty string.

Parameters
----------
aPath: TCollection_AsciiString
aName: char *
isUserDefaults: bool

Returns
-------
None
") GetResourcePath;
		static void GetResourcePath(TCollection_AsciiString & aPath, const char * aName, const Standard_Boolean isUserDefaults);

		/****************** Integer ******************/
		/**** md5 signature: 459f06c743be8fcf9fa4e5326394951e ****/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Gets the value of an integer resource according to its instance and its type.

Parameters
----------
aResourceName: char *

Returns
-------
int
") Integer;
		virtual Standard_Integer Integer(const char * aResourceName);

		/****************** Real ******************/
		/**** md5 signature: b6af1db9d303b345bf398c6e044f1093 ****/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Gets the value of a real resource according to its instance and its type.

Parameters
----------
aResourceName: char *

Returns
-------
float
") Real;
		virtual Standard_Real Real(const char * aResourceName);

		/****************** Save ******************/
		/**** md5 signature: c46b0608963cc711253d0dc474525a23 ****/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Save the user resource structure in the specified file. creates the file if it does not exist.

Returns
-------
bool
") Save;
		Standard_Boolean Save();

		/****************** SetResource ******************/
		/**** md5 signature: 5cee39e81388e9738fbd5ea60762445e ****/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "Sets the new value of an integer resource. if the resource does not exist, it is created.

Parameters
----------
aResourceName: char *
aValue: int

Returns
-------
None
") SetResource;
		virtual void SetResource(const char * aResourceName, const Standard_Integer aValue);

		/****************** SetResource ******************/
		/**** md5 signature: 5adf64f7de0821b4e2982633edbf9ea2 ****/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "Sets the new value of a real resource. if the resource does not exist, it is created.

Parameters
----------
aResourceName: char *
aValue: float

Returns
-------
None
") SetResource;
		virtual void SetResource(const char * aResourceName, const Standard_Real aValue);

		/****************** SetResource ******************/
		/**** md5 signature: 8beffa88923a65f02524a44eab47c796 ****/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "Sets the new value of an cstring resource. if the resource does not exist, it is created.

Parameters
----------
aResourceName: char *
aValue: char *

Returns
-------
None
") SetResource;
		virtual void SetResource(const char * aResourceName, const char * aValue);

		/****************** SetResource ******************/
		/**** md5 signature: c3adf5010bcf4e1022068e87a43da2c6 ****/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "Sets the new value of an extstring resource. if the resource does not exist, it is created.

Parameters
----------
aResourceName: char *
aValue: Standard_ExtString

Returns
-------
None
") SetResource;
		virtual void SetResource(const char * aResourceName, const Standard_ExtString aValue);

		/****************** Value ******************/
		/**** md5 signature: 704eea869ed3ea373c063217f10964ef ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Gets the value of a cstring resource according to its instance and its type.

Parameters
----------
aResourceName: char *

Returns
-------
char *
") Value;
		virtual const char * Value(const char * aResourceName);

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
		/****************** ConvertANSIToUnicode ******************/
		/**** md5 signature: a675612657f24ea22357a1767c5ea883 ****/
		%feature("compactdefaultargs") ConvertANSIToUnicode;
		%feature("autodoc", "Converts non-ascii cstring <fromstr> in ansi format to unicode extendedstring <tostr>.

Parameters
----------
fromstr: char *
tostr: TCollection_ExtendedString

Returns
-------
None
") ConvertANSIToUnicode;
		static void ConvertANSIToUnicode(const char * fromstr, TCollection_ExtendedString & tostr);

		/****************** ConvertBig5ToUnicode ******************/
		/**** md5 signature: 4168524e0213960fd803d4807ed33f90 ****/
		%feature("compactdefaultargs") ConvertBig5ToUnicode;
		%feature("autodoc", "Converts non-ascii cstring <fromstr> in big5 format to unicode extendedstring <tostr>.

Parameters
----------
fromstr: char *
tostr: TCollection_ExtendedString

Returns
-------
bool
") ConvertBig5ToUnicode;
		static Standard_Boolean ConvertBig5ToUnicode(const char * fromstr, TCollection_ExtendedString & tostr);

		/****************** ConvertEUCToUnicode ******************/
		/**** md5 signature: a47f65202dbb4ad94609e631aefd3e71 ****/
		%feature("compactdefaultargs") ConvertEUCToUnicode;
		%feature("autodoc", "Converts non-ascii cstring <fromstr> in euc format to unicode extendedstring <tostr>.

Parameters
----------
fromstr: char *
tostr: TCollection_ExtendedString

Returns
-------
None
") ConvertEUCToUnicode;
		static void ConvertEUCToUnicode(const char * fromstr, TCollection_ExtendedString & tostr);

		/****************** ConvertFormatToUnicode ******************/
		/**** md5 signature: 092af2a29361b36b8f1d60b684d8e660 ****/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "Converts the non-ascii c string (as specified by getformat()) to the unicode string of extended characters.

Parameters
----------
theFromStr: char *
theToStr: TCollection_ExtendedString

Returns
-------
None
") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode(const char * theFromStr, TCollection_ExtendedString & theToStr);

		/****************** ConvertFormatToUnicode ******************/
		/**** md5 signature: 1a39a61476a07a6c419d95aa2f936c87 ****/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "Converts the non-ascii c string in specified format to the unicode string of extended characters. @param theformat [in] source encoding @param thefromstr [in] text to convert @param thetostr [out] destination string.

Parameters
----------
theFormat: Resource_FormatType
theFromStr: char *
theToStr: TCollection_ExtendedString

Returns
-------
None
") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode(const Resource_FormatType theFormat, const char * theFromStr, TCollection_ExtendedString & theToStr);

		/****************** ConvertGBKToUnicode ******************/
		/**** md5 signature: 55ed525176f6d874f96d41764a2499d6 ****/
		%feature("compactdefaultargs") ConvertGBKToUnicode;
		%feature("autodoc", "Converts non-ascii cstring <fromstr> in gbk format to unicode extendedstring <tostr>.

Parameters
----------
fromstr: char *
tostr: TCollection_ExtendedString

Returns
-------
bool
") ConvertGBKToUnicode;
		static Standard_Boolean ConvertGBKToUnicode(const char * fromstr, TCollection_ExtendedString & tostr);

		/****************** ConvertGBToUnicode ******************/
		/**** md5 signature: a22cad6ea4c1a1e6cd398d067edaa57c ****/
		%feature("compactdefaultargs") ConvertGBToUnicode;
		%feature("autodoc", "Converts non-ascii cstring <fromstr> in gb format to unicode extendedstring <tostr>.

Parameters
----------
fromstr: char *
tostr: TCollection_ExtendedString

Returns
-------
None
") ConvertGBToUnicode;
		static void ConvertGBToUnicode(const char * fromstr, TCollection_ExtendedString & tostr);

		/****************** ConvertSJISToUnicode ******************/
		/**** md5 signature: 3e6f135c27c0b105b7e7e224b4376205 ****/
		%feature("compactdefaultargs") ConvertSJISToUnicode;
		%feature("autodoc", "Converts non-ascii cstring <fromstr> in sjis format to unicode extendedstring <tostr>.

Parameters
----------
fromstr: char *
tostr: TCollection_ExtendedString

Returns
-------
None
") ConvertSJISToUnicode;
		static void ConvertSJISToUnicode(const char * fromstr, TCollection_ExtendedString & tostr);

		/****************** ConvertUnicodeToANSI ******************/
		/**** md5 signature: becd4b24e1324dac8a09502a0f3b35e3 ****/
		%feature("compactdefaultargs") ConvertUnicodeToANSI;
		%feature("autodoc", "Converts unicode extendedstring <fromstr> to non-ascii cstring <tostr> in ansi format, limited to <maxsize> characters. to translate the whole <fromstr>, use more than twice the length of <fromstr>. returns true if <maxsize> has not been reached before end of conversion.

Parameters
----------
fromstr: TCollection_ExtendedString
tostr: Standard_PCharacter
maxsize: int

Returns
-------
bool
") ConvertUnicodeToANSI;
		static Standard_Boolean ConvertUnicodeToANSI(const TCollection_ExtendedString & fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****************** ConvertUnicodeToEUC ******************/
		/**** md5 signature: 3de0636677422237545faabc4b82044a ****/
		%feature("compactdefaultargs") ConvertUnicodeToEUC;
		%feature("autodoc", "Converts unicode extendedstring <fromstr> to non-ascii cstring <tostr> in euc format, limited to <maxsize> characters. to translate the whole <fromstr>, use more than twice the length of <fromstr>. returns true if <maxsize> has not been reached before end of conversion.

Parameters
----------
fromstr: TCollection_ExtendedString
tostr: Standard_PCharacter
maxsize: int

Returns
-------
bool
") ConvertUnicodeToEUC;
		static Standard_Boolean ConvertUnicodeToEUC(const TCollection_ExtendedString & fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****************** ConvertUnicodeToFormat ******************/
		/**** md5 signature: 8743e70c9c2a155ce180b78c36c04a71 ****/
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "Converts the unicode string of extended characters to the non-ascii string according to specified format. you need more than twice the length of the source string to complete the conversion. the function returns true if conversion is complete, i.e. the maximum number of characters is not reached before the end of conversion. @param theformat [in] destination encoding @param thefromstr [in] text to convert @param thetostr [out] destination buffer @param themaxsize [in] destination buffer length.

Parameters
----------
theFormat: Resource_FormatType
theFromStr: TCollection_ExtendedString
theToStr: Standard_PCharacter
theMaxSize: int

Returns
-------
bool
") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat(const Resource_FormatType theFormat, const TCollection_ExtendedString & theFromStr, Standard_PCharacter & theToStr, const Standard_Integer theMaxSize);

		/****************** ConvertUnicodeToFormat ******************/
		/**** md5 signature: 3a0226ee9a6304b9f55b4674dccd26dc ****/
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "Converts the unicode string of extended characters to the non-ascii string according to the format returned by the function getformat. @param thefromstr [in] text to convert @param thetostr [out] destination buffer @param themaxsize [in] destination buffer length.

Parameters
----------
theFromStr: TCollection_ExtendedString
theToStr: Standard_PCharacter
theMaxSize: int

Returns
-------
bool
") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat(const TCollection_ExtendedString & theFromStr, Standard_PCharacter & theToStr, const Standard_Integer theMaxSize);

		/****************** ConvertUnicodeToGB ******************/
		/**** md5 signature: e92423028aa69f039e50fc871d72daf2 ****/
		%feature("compactdefaultargs") ConvertUnicodeToGB;
		%feature("autodoc", "Converts unicode extendedstring <fromstr> to non-ascii cstring <tostr> in gb format, limited to <maxsize> characters. to translate the whole <fromstr>, use more than twice the length of <fromstr>. returns true if <maxsize> has not been reached before end of conversion.

Parameters
----------
fromstr: TCollection_ExtendedString
tostr: Standard_PCharacter
maxsize: int

Returns
-------
bool
") ConvertUnicodeToGB;
		static Standard_Boolean ConvertUnicodeToGB(const TCollection_ExtendedString & fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****************** ConvertUnicodeToSJIS ******************/
		/**** md5 signature: 405eb61d326bd40b62e69514a5638a62 ****/
		%feature("compactdefaultargs") ConvertUnicodeToSJIS;
		%feature("autodoc", "Converts unicode extendedstring <fromstr> to non-ascii cstring <tostr> in sjis format, limited to <maxsize> characters. to translate the whole <fromstr>, use more than twice the length of <fromstr>. returns true if <maxsize> has not been reached before end of conversion.

Parameters
----------
fromstr: TCollection_ExtendedString
tostr: Standard_PCharacter
maxsize: int

Returns
-------
bool
") ConvertUnicodeToSJIS;
		static Standard_Boolean ConvertUnicodeToSJIS(const TCollection_ExtendedString & fromstr, Standard_PCharacter & tostr, const Standard_Integer maxsize);

		/****************** GetFormat ******************/
		/**** md5 signature: b7f0b16e429d16aced2ecaaf3804dc38 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Returns the current conversion format (either ansi, euc, gb or sjis). the current converting format must be defined in advance with the setformat function.

Returns
-------
Resource_FormatType
") GetFormat;
		static Resource_FormatType GetFormat();

		/****************** ReadFormat ******************/
		/**** md5 signature: 9707c87226e3d6fd6486b6673c5e6357 ****/
		%feature("compactdefaultargs") ReadFormat;
		%feature("autodoc", "Reads converting format from resource 'formattype' in resource manager 'charset'.

Returns
-------
None
") ReadFormat;
		static void ReadFormat();

		/****************** SetFormat ******************/
		/**** md5 signature: 2724b939d7616dbac969aeef0cc09e56 ****/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "Defines the current conversion format as typecode. this conversion format will then be used by the functions convertformattounicode and convertunicodetoformat to convert the strings.

Parameters
----------
typecode: Resource_FormatType

Returns
-------
None
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
