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

class Resource_FormatType:
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
		%feature("compactdefaultargs") Resource_LexicalCompare;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Resource_LexicalCompare;
		 Resource_LexicalCompare();

		/****************** IsLower ******************/
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
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Save the user resource structure in the specified file. creates the file if it does not exist.

Returns
-------
bool
") Save;
		Standard_Boolean Save();

		/****************** SetResource ******************/
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
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Returns the current conversion format (either ansi, euc, gb or sjis). the current converting format must be defined in advance with the setformat function.

Returns
-------
Resource_FormatType
") GetFormat;
		static Resource_FormatType GetFormat();

		/****************** ReadFormat ******************/
		%feature("compactdefaultargs") ReadFormat;
		%feature("autodoc", "Reads converting format from resource 'formattype' in resource manager 'charset'.

Returns
-------
None
") ReadFormat;
		static void ReadFormat();

		/****************** SetFormat ******************/
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
