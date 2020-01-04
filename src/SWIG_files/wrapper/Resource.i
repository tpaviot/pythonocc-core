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

/* handles */
%wrap_handle(Resource_Manager)
/* end handles declaration */

/* templates */
%template(Resource_DataMapOfAsciiStringAsciiString) NCollection_DataMap <TCollection_AsciiString , TCollection_AsciiString , TCollection_AsciiString>;
%template(Resource_DataMapOfAsciiStringExtendedString) NCollection_DataMap <TCollection_AsciiString , TCollection_ExtendedString , TCollection_AsciiString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TCollection_AsciiString , TCollection_AsciiString , TCollection_AsciiString> Resource_DataMapOfAsciiStringAsciiString;
typedef NCollection_DataMap <TCollection_AsciiString , TCollection_AsciiString , TCollection_AsciiString>::Iterator Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
typedef NCollection_DataMap <TCollection_AsciiString , TCollection_ExtendedString , TCollection_AsciiString> Resource_DataMapOfAsciiStringExtendedString;
typedef NCollection_DataMap <TCollection_AsciiString , TCollection_ExtendedString , TCollection_AsciiString>::Iterator Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
/* end typedefs declaration */

/********************************
* class Resource_LexicalCompare *
********************************/
class Resource_LexicalCompare {
	public:
		/****************** IsLower ******************/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "* Returns True if <Left> is lower than <Right>.
	:param Left:
	:type Left: TCollection_AsciiString
	:param Right:
	:type Right: TCollection_AsciiString
	:rtype: bool") IsLower;
		Standard_Boolean IsLower (const TCollection_AsciiString & Left,const TCollection_AsciiString & Right);

		/****************** Resource_LexicalCompare ******************/
		%feature("compactdefaultargs") Resource_LexicalCompare;
		%feature("autodoc", ":rtype: None") Resource_LexicalCompare;
		 Resource_LexicalCompare ();

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
		/****************** ExtValue ******************/
		%feature("compactdefaultargs") ExtValue;
		%feature("autodoc", "* Gets the value of an ExtString resource according to its instance and its type.
	:param aResourceName:
	:type aResourceName: char *
	:rtype: Standard_ExtString") ExtValue;
		virtual Standard_ExtString ExtValue (const char * aResourceName);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "* returns True if the Resource does exist.
	:param aResource:
	:type aResource: char *
	:rtype: bool") Find;
		Standard_Boolean Find (const char * aResource);

		/****************** GetResourcePath ******************/
		%feature("compactdefaultargs") GetResourcePath;
		%feature("autodoc", "* Gets the resource file full path by its name. If corresponding environment variable is not set or file doesn't exist returns empty string.
	:param aPath:
	:type aPath: TCollection_AsciiString
	:param aName:
	:type aName: char *
	:param isUserDefaults:
	:type isUserDefaults: bool
	:rtype: void") GetResourcePath;
		static void GetResourcePath (TCollection_AsciiString & aPath,const char * aName,const Standard_Boolean isUserDefaults);

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "* Gets the value of an integer resource according to its instance and its type.
	:param aResourceName:
	:type aResourceName: char *
	:rtype: int") Integer;
		virtual Standard_Integer Integer (const char * aResourceName);

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "* Gets the value of a real resource according to its instance and its type.
	:param aResourceName:
	:type aResourceName: char *
	:rtype: float") Real;
		virtual Standard_Real Real (const char * aResourceName);

		/****************** Resource_Manager ******************/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "* Create a Resource manager. Attempts to find the two following files: $CSF_`aName`Defaults/aName $CSF_`aName`UserDefaults/aName and load them respectively into a reference and a user resource structure. //! If CSF_ResourceVerbose defined, seeked files will be printed. //! FILE SYNTAX The syntax of a resource file is a sequence of resource lines terminated by newline characters or end of file. The syntax of an individual resource line is:
	:param aName:
	:type aName: char *
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None") Resource_Manager;
		 Resource_Manager (const char * aName,const Standard_Boolean Verbose = Standard_False);

		/****************** Resource_Manager ******************/
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", ":param aName:
	:type aName: char *
	:param aDefaultsDirectory:
	:type aDefaultsDirectory: TCollection_AsciiString
	:param anUserDefaultsDirectory:
	:type anUserDefaultsDirectory: TCollection_AsciiString
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None") Resource_Manager;
		 Resource_Manager (const char * aName,TCollection_AsciiString & aDefaultsDirectory,TCollection_AsciiString & anUserDefaultsDirectory,const Standard_Boolean Verbose = Standard_False);

		/****************** Save ******************/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "* Save the user resource structure in the specified file. Creates the file if it does not exist.
	:rtype: bool") Save;
		Standard_Boolean Save ();

		/****************** SetResource ******************/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "* Sets the new value of an integer resource. If the resource does not exist, it is created.
	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: int
	:rtype: void") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_Integer aValue);

		/****************** SetResource ******************/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "* Sets the new value of a real resource. If the resource does not exist, it is created.
	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: float
	:rtype: void") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_Real aValue);

		/****************** SetResource ******************/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "* Sets the new value of an CString resource. If the resource does not exist, it is created.
	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: char *
	:rtype: void") SetResource;
		virtual void SetResource (const char * aResourceName,const char * aValue);

		/****************** SetResource ******************/
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "* Sets the new value of an ExtString resource. If the resource does not exist, it is created.
	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: Standard_ExtString
	:rtype: void") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_ExtString aValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Gets the value of a CString resource according to its instance and its type.
	:param aResourceName:
	:type aResourceName: char *
	:rtype: char *") Value;
		virtual const char * Value (const char * aResourceName);

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
		%feature("autodoc", "* Converts non-ASCII CString <fromstr> in ANSI format to Unicode ExtendedString <tostr>.
	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString
	:rtype: void") ConvertANSIToUnicode;
		static void ConvertANSIToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);

		/****************** ConvertBig5ToUnicode ******************/
		%feature("compactdefaultargs") ConvertBig5ToUnicode;
		%feature("autodoc", "* Converts non-ASCII CString <fromstr> in Big5 format to Unicode ExtendedString <tostr>.
	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString
	:rtype: bool") ConvertBig5ToUnicode;
		static Standard_Boolean ConvertBig5ToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);

		/****************** ConvertEUCToUnicode ******************/
		%feature("compactdefaultargs") ConvertEUCToUnicode;
		%feature("autodoc", "* Converts non-ASCII CString <fromstr> in EUC format to Unicode ExtendedString <tostr>.
	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString
	:rtype: void") ConvertEUCToUnicode;
		static void ConvertEUCToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);

		/****************** ConvertFormatToUnicode ******************/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "* Converts the non-ASCII C string (as specified by GetFormat()) to the Unicode string of extended characters.
	:param theFromStr:
	:type theFromStr: char *
	:param theToStr:
	:type theToStr: TCollection_ExtendedString
	:rtype: None") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode (const char * theFromStr,TCollection_ExtendedString & theToStr);

		/****************** ConvertFormatToUnicode ******************/
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "* Converts the non-ASCII C string in specified format to the Unicode string of extended characters. @param theFormat [in] source encoding @param theFromStr [in] text to convert @param theToStr [out] destination string
	:param theFormat:
	:type theFormat: Resource_FormatType
	:param theFromStr:
	:type theFromStr: char *
	:param theToStr:
	:type theToStr: TCollection_ExtendedString
	:rtype: void") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode (const Resource_FormatType theFormat,const char * theFromStr,TCollection_ExtendedString & theToStr);

		/****************** ConvertGBKToUnicode ******************/
		%feature("compactdefaultargs") ConvertGBKToUnicode;
		%feature("autodoc", "* Converts non-ASCII CString <fromstr> in GBK format to Unicode ExtendedString <tostr>.
	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString
	:rtype: bool") ConvertGBKToUnicode;
		static Standard_Boolean ConvertGBKToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);

		/****************** ConvertGBToUnicode ******************/
		%feature("compactdefaultargs") ConvertGBToUnicode;
		%feature("autodoc", "* Converts non-ASCII CString <fromstr> in GB format to Unicode ExtendedString <tostr>.
	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString
	:rtype: void") ConvertGBToUnicode;
		static void ConvertGBToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);

		/****************** ConvertSJISToUnicode ******************/
		%feature("compactdefaultargs") ConvertSJISToUnicode;
		%feature("autodoc", "* Converts non-ASCII CString <fromstr> in SJIS format to Unicode ExtendedString <tostr>.
	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString
	:rtype: void") ConvertSJISToUnicode;
		static void ConvertSJISToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);

		/****************** ConvertUnicodeToANSI ******************/
		%feature("compactdefaultargs") ConvertUnicodeToANSI;
		%feature("autodoc", "* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in ANSI format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
	:param fromstr:
	:type fromstr: TCollection_ExtendedString
	:param tostr:
	:type tostr: Standard_PCharacter
	:param maxsize:
	:type maxsize: int
	:rtype: bool") ConvertUnicodeToANSI;
		static Standard_Boolean ConvertUnicodeToANSI (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);

		/****************** ConvertUnicodeToEUC ******************/
		%feature("compactdefaultargs") ConvertUnicodeToEUC;
		%feature("autodoc", "* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in EUC format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
	:param fromstr:
	:type fromstr: TCollection_ExtendedString
	:param tostr:
	:type tostr: Standard_PCharacter
	:param maxsize:
	:type maxsize: int
	:rtype: bool") ConvertUnicodeToEUC;
		static Standard_Boolean ConvertUnicodeToEUC (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);

		/****************** ConvertUnicodeToFormat ******************/
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "* Converts the Unicode string of extended characters to the non-ASCII string according to specified format. You need more than twice the length of the source string to complete the conversion. The function returns true if conversion is complete, i.e. the maximum number of characters is not reached before the end of conversion. @param theFormat [in] destination encoding @param theFromStr [in] text to convert @param theToStr [out] destination buffer @param theMaxSize [in] destination buffer length
	:param theFormat:
	:type theFormat: Resource_FormatType
	:param theFromStr:
	:type theFromStr: TCollection_ExtendedString
	:param theToStr:
	:type theToStr: Standard_PCharacter
	:param theMaxSize:
	:type theMaxSize: int
	:rtype: bool") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat (const Resource_FormatType theFormat,const TCollection_ExtendedString & theFromStr,Standard_PCharacter & theToStr,const Standard_Integer theMaxSize);

		/****************** ConvertUnicodeToFormat ******************/
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "* Converts the Unicode string of extended characters to the non-ASCII string according to the format returned by the function GetFormat. @param theFromStr [in] text to convert @param theToStr [out] destination buffer @param theMaxSize [in] destination buffer length
	:param theFromStr:
	:type theFromStr: TCollection_ExtendedString
	:param theToStr:
	:type theToStr: Standard_PCharacter
	:param theMaxSize:
	:type theMaxSize: int
	:rtype: bool") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat (const TCollection_ExtendedString & theFromStr,Standard_PCharacter & theToStr,const Standard_Integer theMaxSize);

		/****************** ConvertUnicodeToGB ******************/
		%feature("compactdefaultargs") ConvertUnicodeToGB;
		%feature("autodoc", "* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in GB format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
	:param fromstr:
	:type fromstr: TCollection_ExtendedString
	:param tostr:
	:type tostr: Standard_PCharacter
	:param maxsize:
	:type maxsize: int
	:rtype: bool") ConvertUnicodeToGB;
		static Standard_Boolean ConvertUnicodeToGB (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);

		/****************** ConvertUnicodeToSJIS ******************/
		%feature("compactdefaultargs") ConvertUnicodeToSJIS;
		%feature("autodoc", "* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in SJIS format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.
	:param fromstr:
	:type fromstr: TCollection_ExtendedString
	:param tostr:
	:type tostr: Standard_PCharacter
	:param maxsize:
	:type maxsize: int
	:rtype: bool") ConvertUnicodeToSJIS;
		static Standard_Boolean ConvertUnicodeToSJIS (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);

		/****************** GetFormat ******************/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "* Returns the current conversion format (either ANSI, EUC, GB or SJIS). The current converting format must be defined in advance with the SetFormat function.
	:rtype: Resource_FormatType") GetFormat;
		static Resource_FormatType GetFormat ();

		/****************** ReadFormat ******************/
		%feature("compactdefaultargs") ReadFormat;
		%feature("autodoc", "* Reads converting format from resource 'FormatType' in Resource Manager 'CharSet'
	:rtype: void") ReadFormat;
		static void ReadFormat ();

		/****************** SetFormat ******************/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "* Defines the current conversion format as typecode. This conversion format will then be used by the functions ConvertFormatToUnicode and ConvertUnicodeToFormat to convert the strings.
	:param typecode:
	:type typecode: Resource_FormatType
	:rtype: void") SetFormat;
		static void SetFormat (const Resource_FormatType typecode);

};


%extend Resource_Unicode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
