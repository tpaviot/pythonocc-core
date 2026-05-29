/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define TCOLLECTIONDOCSTRING
"TCollection module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tcollection.html"
%enddef
%module (package="OCC.Core", docstring=TCOLLECTIONDOCSTRING) TCollection


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
#include<TCollection_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

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
%wrap_handle(TCollection_HAsciiString)
%wrap_handle(TCollection_HExtendedString)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class TCollection *
********************/
%rename(tcollection) TCollection;
class TCollection {
	public:
		/****** TCollection::NextPrimeForMap ******/
		/****** md5 signature: e4c33333733e70512734dbbf435c4e16 ******/
		%feature("compactdefaultargs") NextPrimeForMap;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
Returns a prime number greater than <I> suitable to dimension a Map. When <I> becomes great there is a limit on the result (today the limit is around 1 000 000). This is not a limit of the number of items but a limit in the number of buckets. i.e. there will be more collisions in the map.
") NextPrimeForMap;
		static int NextPrimeForMap(const int I);

};


%extend TCollection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TCollection_AsciiString *
********************************/
class TCollection_AsciiString {
	public:
		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 405af19b99483e9d500eff1bc4ccc280 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a AsciiString to an empty AsciiString.
") TCollection_AsciiString;
		 TCollection_AsciiString();

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: b6bfebcaefd22ccd0bd6af25a85911e3 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
None

Description
-----------
Initializes a AsciiString with a string_view. 
Input parameter: theStringView the string view to initialize from.
") TCollection_AsciiString;
		 TCollection_AsciiString(const std::string_view & theStringView);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: b8454bc6e59eafb91c331e3f4dedf4dc ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theMessage: char *

Return
-------
None

Description
-----------
Initializes a AsciiString with a CString (null-terminated). 
Input parameter: theMessage the C string to initialize from.
") TCollection_AsciiString;
		 TCollection_AsciiString(const char * const theMessage);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: d88599412a26ce00ef0fd800da2db4ab ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theMessage: char *
theLength: int

Return
-------
None

Description
-----------
Initializes a AsciiString with a CString and explicit length. 
Input parameter: theMessage the C string to initialize from 
Input parameter: theLength the length of the string.
") TCollection_AsciiString;
		 TCollection_AsciiString(const char * const theMessage, const int theLength);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 252989d2b41cc2b549e93d8c9cb68461 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theChar: char

Return
-------
None

Description
-----------
Initializes a AsciiString with a single character. 
Input parameter: theChar the character to initialize from.
") TCollection_AsciiString;
		 TCollection_AsciiString(const char theChar);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: cac4bace6e1dde2d1f1233ee32083c7b ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theLength: int
theFiller: char

Return
-------
None

Description
-----------
Initializes an AsciiString with specified length space allocated and filled with filler character. This is useful for buffers. 
Input parameter: theLength the length to allocate 
Input parameter: theFiller the character to fill with.
") TCollection_AsciiString;
		 TCollection_AsciiString(const int theLength, const char theFiller);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 0b6315692a7046e7a79cb4e14e4ba2be ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
None

Description
-----------
Initializes an AsciiString with an integer value 
Input parameter: theValue the integer value to convert to string.
") TCollection_AsciiString;
		 TCollection_AsciiString(const int theValue);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 21c01563a32a80e5d5f990c75f10dd54 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Initializes an AsciiString with a real value 
Input parameter: theValue the real value to convert to string.
") TCollection_AsciiString;
		 TCollection_AsciiString(const double theValue);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 977f8fcd13faaeaa6f983ca20d335562 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theString: str

Return
-------
None

Description
-----------
Initializes a AsciiString with another AsciiString. 
Input parameter: theString the string to copy from.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString theString);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 3e22a024fd107594315ba9efb4b707ba ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Move constructor 
Input parameter: theOther the string to move from.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString & theOther);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: aa42191e80a3760a6a7fbfe7f9dbec4b ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theString: str
theChar: char

Return
-------
None

Description
-----------
Initializes a AsciiString with copy of another AsciiString concatenated with the message character. 
Input parameter: theString the string to copy 
Input parameter: theChar the character to append.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString theString, const char theChar);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 4798816f00049e0859dc4f260d3c6597 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theString: str
theMessage: char *

Return
-------
None

Description
-----------
Initializes a AsciiString with copy of another AsciiString concatenated with the message string. 
Input parameter: theString the string to copy 
Input parameter: theMessage the C string to append.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString theString, const char * const theMessage);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: d1907b81f9d7a48da56df31376a72225 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theString: str
theOtherString: str

Return
-------
None

Description
-----------
Initializes a AsciiString with copy of another AsciiString concatenated with the message string. 
Input parameter: theString the string to copy 
Input parameter: theOtherString the string to append.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString theString, TCollection_AsciiString theOtherString);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 6c539895b41e84000f528ebb228d4f58 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theExtendedString: str
theReplaceNonAscii: char (optional, default to 0)

Return
-------
None

Description
-----------
Creation by converting an extended string to an ascii string. If replaceNonAscii is non-null character, it will be used in place of any non-ascii character found in the source string. Otherwise, creates UTF-8 unicode string. 
Input parameter: theExtendedString the extended string to convert 
Input parameter: theReplaceNonAscii replacement character for non-ASCII characters.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_ExtendedString theExtendedString, const char theReplaceNonAscii = 0);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: a2dfb4adc0c8fee21e3dc453451a9a5e ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theStringUtf: wchar_t *

Return
-------
None

Description
-----------
Initialize UTF-8 Unicode string from wide-char string considering it as Unicode string (the size of wide char is a platform-dependent - e.g. on Windows wchar_t is UTF-16). //! This constructor is unavailable if application is built with deprecated msvc option '-Zc:wchar_t-', since OCCT itself is never built with this option. 
Input parameter: theStringUtf the wide character string to convert.
") TCollection_AsciiString;
		 TCollection_AsciiString(const wchar_t * theStringUtf);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 6038777edcd2aeff5d78cfd65d976daa ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: char

Return
-------
None

Description
-----------
Appends other character to this string. This is an unary operator. 
Input parameter: theOther the character to append.
") AssignCat;
		void AssignCat(const char theOther);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: aa3dc93fe40b6761b3ea25e123fedda6 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: int

Return
-------
None

Description
-----------
Appends other integer to this string. This is an unary operator. 
Input parameter: theOther the integer to append.
") AssignCat;
		void AssignCat(const int theOther);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 4125e0c8a9ac885e9d7f1aaead37b655 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: double

Return
-------
None

Description
-----------
Appends other real number to this string. This is an unary operator. 
Input parameter: theOther the real number to append.
") AssignCat;
		void AssignCat(const double theOther);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 5db0250a5db9130afb173c89d19d405c ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: str
theReplaceNonAscii: char (optional, default to 0)

Return
-------
None

Description
-----------
Appends an extended string to this ASCII string. If theReplaceNonAscii is non-null character, it will be used in place of any non-ASCII character found in the source string. Otherwise, appends UTF-8 representation of the source string. 
Input parameter: theOther the extended string to append 
Input parameter: theReplaceNonAscii replacement character for non-ASCII characters.
") AssignCat;
		void AssignCat(TCollection_ExtendedString theOther, const char theReplaceNonAscii = 0);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: a3b77ccc07c7b349ad67985e52871299 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theStringUtf: wchar_t *

Return
-------
None

Description
-----------
Appends wide-char string converted to UTF-8 representation. 
Input parameter: theStringUtf the wide character string to append.
") AssignCat;
		void AssignCat(const wchar_t * theStringUtf);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: b56240b8aa635c86d0878f58d8b8cbb9 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theString: char *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Appends string (pointer and length) to this ASCII string. This is the primary implementation that all other AssignCat overloads redirect to. 
Input parameter: theString pointer to the string to append 
Input parameter: theLength length of the string to append.
") AssignCat;
		void AssignCat(const char * const theString, const int theLength);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 7bdee1684c0a09764c0d9665201a2600 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Appends other string to this string. This is an unary operator. //! Example: ```cpp TCollection_AsciiString aString('Hello'); TCollection_AsciiString anotherString(' World'); aString += anotherString; // Result: aString == 'Hello World' ``` 
Input parameter: theOther the string to append.
") AssignCat;
		void AssignCat(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 80b71520450bfbbb5f3197f651af621a ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
None

Description
-----------
Appends C string to this ASCII string. 
Input parameter: theCString the C string to append.
") AssignCat;
		void AssignCat(const char * const theCString);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 2fd0dda76783761ae9ff6e07fbbc44e4 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
None

Description
-----------
Appends string view to this ASCII string. This is an unary operator. 
Input parameter: theStringView the string view to append.
") AssignCat;
		void AssignCat(const std::string_view & theStringView);

		/****** TCollection_AsciiString::Capitalize ******/
		/****** md5 signature: dbcb7ca2711d8c69ac14d5c2510a8e32 ******/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts the first character into its corresponding upper-case character and the other characters into lowercase //! Example: ```cpp TCollection_AsciiString aString('hellO '); aString.Capitalize(); // Result: aString == 'Hello ' ```.
") Capitalize;
		void Capitalize();

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: 78e0b538e1ea7ddc19ec4031942d0c71 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theString: char *
theLength: int

Return
-------
TCollection_AsciiString

Description
-----------
Core implementation: Appends string (pointer and length) to this ASCII string and returns a new string. This is the primary implementation that all other Cat overloads redirect to. 
Input parameter: theString pointer to the string to append 
Input parameter: theLength length of the string to append 
Return: new string with the string appended.
") Cat;
		TCollection_AsciiString Cat(const char * const theString, const int theLength);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: 0ac6673259f996852fe0406b689cf27e ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: char

Return
-------
TCollection_AsciiString

Description
-----------
Appends other character to this string. //! Example: ```cpp TCollection_AsciiString aString('I say '); TCollection_AsciiString aResult = aString + '!'; // Result: aResult == 'I say !' //! // To catenate more, you must put a String before. // 'Hello ' + 'Dolly' // THIS IS NOT ALLOWED // This rule is applicable to AssignCat (operator +=) too. ``` 
Input parameter: theOther the character to append 
Return: new string with character appended.
") Cat;
		TCollection_AsciiString Cat(const char theOther);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: ead1e639370332df71796b898a5729f9 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: int

Return
-------
TCollection_AsciiString

Description
-----------
Appends other integer to this string. //! Example: ```cpp TCollection_AsciiString aString('I say '); TCollection_AsciiString aResult = aString + 15; // Result: aResult == 'I say 15' ``` 
Input parameter: theOther the integer to append 
Return: new string with integer appended.
") Cat;
		TCollection_AsciiString Cat(const int theOther);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: ef3d230a216525193a00c77e4c8e1d65 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: double

Return
-------
TCollection_AsciiString

Description
-----------
Appends other real number to this string. //! Example: ```cpp TCollection_AsciiString aString('I say '); TCollection_AsciiString aResult = aString + 15.15; // Result: aResult == 'I say 15.15' ``` 
Input parameter: theOther the real number to append 
Return: new string with real number appended.
") Cat;
		TCollection_AsciiString Cat(const double theOther);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: 8674c08e5869f5aa0dba7141d33c8873 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: str
theReplaceNonAscii: char (optional, default to 0)

Return
-------
TCollection_AsciiString

Description
-----------
Appends extended string to this string. If theReplaceNonAscii is non-null character, it will be used in place of any non-ASCII character found in the source string. Otherwise, concatenates UTF-8 representation of the source string. 
Input parameter: theOther the extended string to append 
Input parameter: theReplaceNonAscii replacement character for non-ASCII characters 
Return: new string with extended string appended.
") Cat;
		TCollection_AsciiString Cat(TCollection_ExtendedString theOther, const char theReplaceNonAscii = 0);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: a9168d087f89d05e5b6aae34dece420c ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theStringUtf: wchar_t *

Return
-------
TCollection_AsciiString

Description
-----------
Appends wide-char string converted to UTF-8 representation. 
Input parameter: theStringUtf the wide character string to append 
Return: new string with wide-char string appended.
") Cat;
		TCollection_AsciiString Cat(const wchar_t * theStringUtf);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: fae8644ac8c1f034f20a5dc3d2a25c9a ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
TCollection_AsciiString

Description
-----------
Appends other string to this string. //! Example: ```cpp TCollection_AsciiString aString('Hello'); TCollection_AsciiString anotherString(' World'); TCollection_AsciiString aResult = aString + anotherString; // Result: aResult == 'Hello World' ``` 
Input parameter: theOther the string to append 
Return: new string with other string appended.
") Cat;
		TCollection_AsciiString Cat(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: 0563587529dbc22d5534c01784d12e49 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
TCollection_AsciiString

Description
-----------
Appends C string to this ASCII string. 
Input parameter: theCString the C string to append 
Return: new string with C string appended.
") Cat;
		TCollection_AsciiString Cat(const char * const theCString);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: c79f0dfde7f59cb783f4b1d68186eb63 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
TCollection_AsciiString

Description
-----------
Appends string view to this ASCII string. 
Input parameter: theStringView the string view to append 
Return: new string with string view appended.
") Cat;
		TCollection_AsciiString Cat(const std::string_view & theStringView);

		/****** TCollection_AsciiString::Center ******/
		/****** md5 signature: d6a6785d3bb4a692c8bd4304f1abe72d ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theFiller: char

Return
-------
None

Description
-----------
Modifies this ASCII string so that its length becomes equal to Width and the new characters are equal to Filler. New characters are added both at the beginning and at the end of this string. If Width is less than the length of this ASCII string, nothing happens. //! Example: ```cpp TCollection_AsciiString anAlphabet('abcdef'); anAlphabet.Center(9, ' '); // Result: anAlphabet == ' abcdef ' ``` 
Input parameter: theWidth the desired width 
Input parameter: theFiller the character to fill with.
") Center;
		void Center(const int theWidth, const char theFiller);

		/****** TCollection_AsciiString::ChangeAll ******/
		/****** md5 signature: 1e25df225ec6601f7d1df72b6c75f0ae ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
theChar: char
theNewChar: char
theCaseSensitive: bool (optional, default to true)

Return
-------
None

Description
-----------
Substitutes all the characters equal to aChar by NewChar in this AsciiString. The substitution can be case sensitive. If you don't use default case sensitive, no matter whether aChar is uppercase or not. //! Example: ```cpp TCollection_AsciiString aString('Histake'); aString.ChangeAll('H', 'M', true); // Result: aString == 'Mistake' ``` 
Input parameter: theChar the character to replace 
Input parameter: theNewChar the replacement character 
Input parameter: theCaseSensitive flag indicating case sensitivity.
") ChangeAll;
		void ChangeAll(const char theChar, const char theNewChar, const bool theCaseSensitive = true);

		/****** TCollection_AsciiString::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in this string. This produces an empty AsciiString.
") Clear;
		void Clear();

		/****** TCollection_AsciiString::Copy ******/
		/****** md5 signature: 42059067a480abb78b08c1f4f686f89f ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theString: char *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Copy string (pointer and length) to this ASCII string. This is the primary implementation that all other Copy overloads redirect to. Used as operator = 
Input parameter: theString pointer to the string to copy from 
Input parameter: theLength length of the string to copy.
") Copy;
		void Copy(const char * const theString, const int theLength);

		/****** TCollection_AsciiString::Copy ******/
		/****** md5 signature: d9fdc44759aa619599ceb6b794ddbacc ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
None

Description
-----------
Copy C string to this ASCII string. Used as operator = 
Input parameter: theCString the C string to copy from.
") Copy;
		void Copy(const char * const theCString);

		/****** TCollection_AsciiString::Copy ******/
		/****** md5 signature: 89773a9296a1ec34e854196685e9da2d ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
None

Description
-----------
Copy string view to this ASCII string. Used as operator = 
Input parameter: theStringView the string view to copy from.
") Copy;
		void Copy(const std::string_view & theStringView);

		/****** TCollection_AsciiString::Copy ******/
		/****** md5 signature: dc57d16303f93b9a8f259f73772c2ec0 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theFromWhere: str

Return
-------
None

Description
-----------
Copy fromwhere to this string. Used as operator = //! Example: ```cpp TCollection_AsciiString aString; TCollection_AsciiString anotherString('Hello World'); aString = anotherString; // operator= // Result: aString == 'Hello World' ```.
") Copy;
		void Copy(TCollection_AsciiString theFromWhere);

		/****** TCollection_AsciiString::EmptyString ******/
		/****** md5 signature: febdc8cc856cf1e92b00b97dce72af0d ******/
		%feature("compactdefaultargs") EmptyString;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a const reference to a single shared empty string instance. This method provides access to a static empty string to avoid creating temporary empty strings. Use this method instead of constructing empty strings when you need a const reference. //! Example: ```cpp const TCollection_AsciiString& anEmptyStr = TCollection_AsciiString::EmptyString(); // Use anEmptyStr instead of TCollection_AsciiString() ``` 
Return: const reference to static empty string.
") EmptyString;
		static const TCollection_AsciiString & EmptyString();

		/****** TCollection_AsciiString::EndsWith ******/
		/****** md5 signature: adc76e997bd9efd362f2fc86355ec6fd ******/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "
Parameters
----------
theEndString: char *
theEndLength: int

Return
-------
bool

Description
-----------
Core implementation: Determines whether the end of this string instance matches the specified string (pointer and length). 
Input parameter: theEndString pointer to the string to check for at the end 
Input parameter: theEndLength length of the string to check for 
Return: true if this string ends with theEndString.
") EndsWith;
		bool EndsWith(const char * const theEndString, const int theEndLength);

		/****** TCollection_AsciiString::EndsWith ******/
		/****** md5 signature: 4a33c65a3c8b7c03256ce80f62c25579 ******/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "
Parameters
----------
theEndString: str

Return
-------
bool

Description
-----------
Determines whether the end of this string instance matches the specified string. 
Input parameter: theEndString the string to check for at the end 
Return: true if this string ends with theEndString.
") EndsWith;
		bool EndsWith(TCollection_AsciiString theEndString);

		/****** TCollection_AsciiString::EndsWith ******/
		/****** md5 signature: 698215d800edf11bb8d8f7438616283f ******/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "
Parameters
----------
theEndString: std::string_view

Return
-------
bool

Description
-----------
Determines whether the end of this string instance matches the specified string_view. 
Input parameter: theEndString the string view to check for at the end 
Return: true if this string ends with theEndString.
") EndsWith;
		bool EndsWith(const std::string_view & theEndString);

		/****** TCollection_AsciiString::FirstLocationInSet ******/
		/****** md5 signature: 4f1662a08128f82fe7aa5689646c7200 ******/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "
Parameters
----------
theSet: char *
theSetLength: int
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Core implementation: Returns the index of the first character of this string that is present in the given character set (pointer and length). The search begins at index FromIndex and ends at index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. 
Input parameter: theSet pointer to the set of characters to search for 
Input parameter: theSetLength length of the set 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of first character found in set, or 0 if not found.
") FirstLocationInSet;
		int FirstLocationInSet(const char * const theSet, const int theSetLength, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::FirstLocationInSet ******/
		/****** md5 signature: d745e4bbdf208214d6077a3a8aa96857 ******/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "
Parameters
----------
theSet: str
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of this string that is present in Set. The search begins to the index FromIndex and ends to the the index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. //! Example: ```cpp TCollection_AsciiString aString('aabAcAa'); TCollection_AsciiString aSet('Aa'); int anIndex = aString.FirstLocationInSet(aSet, 1, 7); // Result: anIndex == 1 ``` 
Input parameter: theSet the set of characters to search for 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of first character found in set, or 0 if not found.
") FirstLocationInSet;
		int FirstLocationInSet(TCollection_AsciiString theSet, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::FirstLocationInSet ******/
		/****** md5 signature: 6237e7ee6a8a7fe19dec1983c3d16149 ******/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "
Parameters
----------
theSet: std::string_view
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of this string that is present in string_view. 
Input parameter: theSet the string view of characters to search for 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of first character found in set, or 0 if not found.
") FirstLocationInSet;
		int FirstLocationInSet(const std::string_view & theSet, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::FirstLocationNotInSet ******/
		/****** md5 signature: 705b6f55b5f43e668afb12c2b10417ac ******/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "
Parameters
----------
theSet: char *
theSetLength: int
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Core implementation: Returns the index of the first character of this string that is not present in the given character set (pointer and length). The search begins at index FromIndex and ends at index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. 
Input parameter: theSet pointer to the set of characters to check against 
Input parameter: theSetLength length of the set 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of first character not in set, or 0 if not found.
") FirstLocationNotInSet;
		int FirstLocationNotInSet(const char * const theSet, const int theSetLength, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::FirstLocationNotInSet ******/
		/****** md5 signature: 4a79f175936a4b4773ddeb5569c3176a ******/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "
Parameters
----------
theSet: str
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of this string that is not present in the set Set. The search begins to the index FromIndex and ends to the the index ToIndex in this string. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. //! Example: ```cpp TCollection_AsciiString aString('aabAcAa'); TCollection_AsciiString aSet('Aa'); int anIndex = aString.FirstLocationNotInSet(aSet, 1, 7); // Result: anIndex == 3 ``` 
Input parameter: theSet the set of characters to check against 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of first character not in set, or 0 if not found.
") FirstLocationNotInSet;
		int FirstLocationNotInSet(TCollection_AsciiString theSet, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::FirstLocationNotInSet ******/
		/****** md5 signature: c9a4c1ee60f37383d831ff5427a541e6 ******/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "
Parameters
----------
theSet: std::string_view
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of this string that is not present in string_view. 
Input parameter: theSet the string view of characters to check against 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of first character not in set, or 0 if not found.
") FirstLocationNotInSet;
		int FirstLocationNotInSet(const std::string_view & theSet, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::HashCode ******/
		/****** md5 signature: 948f5d6dd43a9ead50b7a5464d6758cd ******/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Computes a hash code for the given ASCII string Returns the same integer value as the hash function for TCollection_ExtendedString 
Return: a computed hash code.
") HashCode;
		size_t HashCode();

		/****** TCollection_AsciiString::Insert ******/
		/****** md5 signature: 809a86a6638bae2597cd3e82685b2db2 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char

Return
-------
None

Description
-----------
Inserts a Character at position where. //! Example: ```cpp TCollection_AsciiString aString('hy not ?'); aString.Insert(1, 'W'); // Result: aString == 'Why not ?' //! TCollection_AsciiString bString('Wh'); bString.Insert(3, 'y'); // Result: bString == 'Why' ``` 
Input parameter: theWhere the position to insert at 
Input parameter: theWhat the character to insert.
") Insert;
		void Insert(const int theWhere, const char theWhat);

		/****** TCollection_AsciiString::Insert ******/
		/****** md5 signature: e97e252ce6f1a7b21bed4747d08fe5e7 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theString: char *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Inserts a string (pointer and length) at position theWhere. This is the primary implementation that all other Insert overloads redirect to. 
Input parameter: theWhere position to insert at 
Input parameter: theString pointer to the string to insert 
Input parameter: theLength length of the string to insert.
") Insert;
		void Insert(const int theWhere, const char * const theString, const int theLength);

		/****** TCollection_AsciiString::Insert ******/
		/****** md5 signature: 5361d008100e94b315d1ded6e70b52b2 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: str

Return
-------
None

Description
-----------
Inserts a AsciiString at position where. 
Input parameter: theWhere the position to insert at 
Input parameter: theWhat the ASCII string to insert.
") Insert;
		void Insert(const int theWhere, TCollection_AsciiString theWhat);

		/****** TCollection_AsciiString::Insert ******/
		/****** md5 signature: f1cbe354242527597a81d7edf5b00c85 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theCString: char *

Return
-------
None

Description
-----------
Inserts a C string at position theWhere. 
Input parameter: theWhere position to insert at 
Input parameter: theCString the C string to insert.
") Insert;
		void Insert(const int theWhere, const char * const theCString);

		/****** TCollection_AsciiString::Insert ******/
		/****** md5 signature: 51dff48cd21c7379c47d5c236906a043 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theStringView: std::string_view

Return
-------
None

Description
-----------
Inserts a string_view at position theWhere. 
Input parameter: theWhere position to insert at 
Input parameter: theStringView the string view to insert.
") Insert;
		void Insert(const int theWhere, const std::string_view & theStringView);

		/****** TCollection_AsciiString::InsertAfter ******/
		/****** md5 signature: 6eb32d033d5a802ded5ceada7410bacd ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theString: char *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Inserts string (pointer and length) after a specific index in this string. This is the primary implementation that all other InsertAfter overloads redirect to. Raises an exception if index is out of bounds (less than 0 or greater than the length). 
Input parameter: theIndex the index to insert after 
Input parameter: theString pointer to the string to insert 
Input parameter: theLength length of the string to insert.
") InsertAfter;
		void InsertAfter(const int theIndex, const char * const theString, const int theLength);

		/****** TCollection_AsciiString::InsertAfter ******/
		/****** md5 signature: 6c5691762e3921080431e4d463f935e5 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theOther: str

Return
-------
None

Description
-----------
Inserts an ASCII string after a specific index in this string. Raises an exception if index is out of bounds. 
Input parameter: theIndex the index to insert after 
Input parameter: theOther the string to insert.
") InsertAfter;
		void InsertAfter(const int theIndex, TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::InsertAfter ******/
		/****** md5 signature: df77ce8976996772b5ec682409292eec ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theCString: char *

Return
-------
None

Description
-----------
Inserts a C string after a specific index in this string. Raises an exception if index is out of bounds. 
Input parameter: theIndex the index to insert after 
Input parameter: theCString the C string to insert.
") InsertAfter;
		void InsertAfter(const int theIndex, const char * const theCString);

		/****** TCollection_AsciiString::InsertAfter ******/
		/****** md5 signature: 4b79e108f094980d1b9b5059d56dbea5 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theStringView: std::string_view

Return
-------
None

Description
-----------
Inserts a string_view after a specific index in this string. Raises an exception if index is out of bounds. 
Input parameter: theIndex the index to insert after 
Input parameter: theStringView the string view to insert.
") InsertAfter;
		void InsertAfter(const int theIndex, const std::string_view & theStringView);

		/****** TCollection_AsciiString::InsertBefore ******/
		/****** md5 signature: 7b30c095655b982a1380ffb8ae95e798 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theString: char *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Inserts string (pointer and length) before a specific index in this string. This is the primary implementation that all other InsertBefore overloads redirect to. Raises an exception if index is out of bounds (less than 1 or greater than the length). 
Input parameter: theIndex the index to insert before 
Input parameter: theString pointer to the string to insert 
Input parameter: theLength length of the string to insert.
") InsertBefore;
		void InsertBefore(const int theIndex, const char * const theString, const int theLength);

		/****** TCollection_AsciiString::InsertBefore ******/
		/****** md5 signature: 05d4d188bda2578787a9d5d94e67237e ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theOther: str

Return
-------
None

Description
-----------
Inserts an ASCII string before a specific index in this string. Raises an exception if index is out of bounds. 
Input parameter: theIndex the index to insert before 
Input parameter: theOther the string to insert.
") InsertBefore;
		void InsertBefore(const int theIndex, TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::InsertBefore ******/
		/****** md5 signature: 5eae938df2e35b0b11eb73a87c91d973 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theCString: char *

Return
-------
None

Description
-----------
Inserts a C string before a specific index in this string. Raises an exception if index is out of bounds. 
Input parameter: theIndex the index to insert before 
Input parameter: theCString the C string to insert.
") InsertBefore;
		void InsertBefore(const int theIndex, const char * const theCString);

		/****** TCollection_AsciiString::InsertBefore ******/
		/****** md5 signature: f955ba887f9ae4813e165ae42973de41 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theStringView: std::string_view

Return
-------
None

Description
-----------
Inserts a string_view before a specific index in this string. Raises an exception if index is out of bounds. 
Input parameter: theIndex the index to insert before 
Input parameter: theStringView the string view to insert.
") InsertBefore;
		void InsertBefore(const int theIndex, const std::string_view & theStringView);

		/****** TCollection_AsciiString::IntegerValue ******/
		/****** md5 signature: a21ed5e6498eb5350afa935263aed2ac ******/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Converts a AsciiString containing a numeric expression to an Integer. //! Example: ```cpp TCollection_AsciiString aString('215'); int anInt = aString.IntegerValue(); // Result: anInt == 215 ``` 
Return: the integer value of the string.
") IntegerValue;
		int IntegerValue();

		/****** TCollection_AsciiString::IsAscii ******/
		/****** md5 signature: 0c35a1a20ae1b86ba412a9de8d1dc696 ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the AsciiString contains only ASCII characters between ' ' and '~'. This means no control character and no extended ASCII code. 
Return: true if string contains only ASCII characters.
") IsAscii;
		bool IsAscii();

		/****** TCollection_AsciiString::IsDifferent ******/
		/****** md5 signature: b797a1c35cc8d7b4935083611acaef16 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns true if there are differences between the characters in this ASCII string and ASCII string other. Note that this method is an alias of operator != 
Input parameter: theOther the ASCII string to compare with 
Return: true if strings are different, false otherwise.
") IsDifferent;
		bool IsDifferent(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::IsDifferent ******/
		/****** md5 signature: 13b465be13a2e2a68ef656cc73e6925f ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theString: char *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns true if there are differences between this ASCII string and the string (pointer and length). This is the primary implementation that string_view and CString overloads redirect to. 
Input parameter: theString pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if strings are different, false otherwise.
") IsDifferent;
		bool IsDifferent(const char * const theString, const int theLength);

		/****** TCollection_AsciiString::IsDifferent ******/
		/****** md5 signature: f1c2c6925733dadc9eb05459998ee609 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
bool

Description
-----------
Returns true if there are differences between this ASCII string and C string. 
Input parameter: theCString the C string to compare with 
Return: true if strings are different, false otherwise.
") IsDifferent;
		bool IsDifferent(const char * const theCString);

		/****** TCollection_AsciiString::IsDifferent ******/
		/****** md5 signature: 51b489cd29dc78ee3fe804f803d2ca4e ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
bool

Description
-----------
Returns true if there are differences between the characters in this ASCII string and string_view. 
Input parameter: theStringView the string view to compare with 
Return: true if strings are different, false otherwise.
") IsDifferent;
		bool IsDifferent(const std::string_view & theStringView);

		/****** TCollection_AsciiString::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this string contains zero character.
") IsEmpty;
		bool IsEmpty();

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: cae0dfe6194751f2107df76074dc708b ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns true if the characters in this ASCII string are identical to the characters in ASCII string other. Note that this method is an alias of operator ==. 
Input parameter: theOther the ASCII string to compare with 
Return: true if strings are equal, false otherwise.
") IsEqual;
		bool IsEqual(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: bb3965e96711a9f9787261b1f919baf4 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theString: char *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns true if the characters in this ASCII string are identical to the string (pointer and length). This is the primary implementation that string_view and CString overloads redirect to. 
Input parameter: theString pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if strings are equal, false otherwise.
") IsEqual;
		bool IsEqual(const char * const theString, const int theLength);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: cb5ab92e4dbe822a46fa7a3601821abf ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
bool

Description
-----------
Returns true if the characters in this ASCII string are identical to the C string. 
Input parameter: theCString the C string to compare with 
Return: true if strings are equal, false otherwise.
") IsEqual;
		bool IsEqual(const char * const theCString);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: 306a5af7947c8b188ceff716c6a0ce19 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
bool

Description
-----------
Returns true if the characters in this ASCII string are identical to the characters in string_view. 
Input parameter: theStringView the string view to compare with 
Return: true if strings are equal, false otherwise.
") IsEqual;
		bool IsEqual(const std::string_view & theStringView);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: df1be914290ab20e6dec58d6c8c8d224 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
string1: str
string2: str

Return
-------
bool

Description
-----------
Returns True when the two strings are the same. (Just for HashCode for AsciiString) 
Input parameter: string1 first string to compare 
Input parameter: string2 second string to compare 
Return: true if strings are equal.
") IsEqual;
		static bool IsEqual(TCollection_AsciiString string1, TCollection_AsciiString string2);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: 1ca4c0c3178903975abe521313895035 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theString1: str
theStringView: std::string_view

Return
-------
bool

Description
-----------
Returns True when the ASCII string and string_view are the same. (Just for HashCode for AsciiString) 
Input parameter: theString1 first string to compare 
Input parameter: theStringView second string view to compare 
Return: true if strings are equal.
") IsEqual;
		static bool IsEqual(TCollection_AsciiString theString1, const std::string_view & theStringView);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: c841dce08c9fb3bfb6b9eaa6e499bda2 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view
theString2: str

Return
-------
bool

Description
-----------
Returns True when the string_view and ASCII string are the same. (Just for HashCode for AsciiString) 
Input parameter: theStringView first string view to compare 
Input parameter: theString2 second string to compare 
Return: true if strings are equal.
") IsEqual;
		static bool IsEqual(const std::string_view & theStringView, TCollection_AsciiString theString2);

		/****** TCollection_AsciiString::IsGreater ******/
		/****** md5 signature: c053f3d2a81e36d175f3e0a716348ecd ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
theString: char *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns True if this string is lexicographically greater than the string (pointer and length). This is the primary implementation that all other IsGreater overloads redirect to. 
Input parameter: theString pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if this string is lexicographically greater than the given string.
") IsGreater;
		bool IsGreater(const char * const theString, const int theLength);

		/****** TCollection_AsciiString::IsGreater ******/
		/****** md5 signature: 4173b009a4a42fec404a02ea443344cb ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns True if this string is 'ASCII' greater than other. 
Input parameter: theOther the ASCII string to compare with 
Return: true if this string is lexicographically greater than other.
") IsGreater;
		bool IsGreater(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::IsGreater ******/
		/****** md5 signature: 987cffea02340c47e24b7cf0ddcb7b4a ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
bool

Description
-----------
Returns True if this string is lexicographically greater than C string. 
Input parameter: theCString the C string to compare with 
Return: true if this string is lexicographically greater than C string.
") IsGreater;
		bool IsGreater(const char * const theCString);

		/****** TCollection_AsciiString::IsGreater ******/
		/****** md5 signature: 98134ebe646513d1bc6158d63b2860fe ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
bool

Description
-----------
Returns True if this ASCII string is lexicographically greater than theStringView. 
Input parameter: theStringView the string view to compare with 
Return: true if this string is lexicographically greater than theStringView.
") IsGreater;
		bool IsGreater(const std::string_view & theStringView);

		/****** TCollection_AsciiString::IsIntegerValue ******/
		/****** md5 signature: a1e19343fc88858f9baa401fda45e974 ******/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the AsciiString contains an integer value. Note: an integer value is considered to be a real value as well. 
Return: true if string represents an integer value.
") IsIntegerValue;
		bool IsIntegerValue();

		/****** TCollection_AsciiString::IsLess ******/
		/****** md5 signature: 09d07eabd71e9e9fa338c65579ce6f2d ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theString: char *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns True if this string is lexicographically less than the string (pointer and length). This is the primary implementation that all other IsLess overloads redirect to. 
Input parameter: theString pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if this string is lexicographically less than the given string.
") IsLess;
		bool IsLess(const char * const theString, const int theLength);

		/****** TCollection_AsciiString::IsLess ******/
		/****** md5 signature: 6498c7cc5c6246dabfdd6634a2621502 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns True if this string is 'ASCII' less than other. 
Input parameter: theOther the ASCII string to compare with 
Return: true if this string is lexicographically less than other.
") IsLess;
		bool IsLess(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::IsLess ******/
		/****** md5 signature: 658e8ca63bdcaeb18c3e0439f2e64002 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
bool

Description
-----------
Returns True if this string is lexicographically less than C string. 
Input parameter: theCString the C string to compare with 
Return: true if this string is lexicographically less than C string.
") IsLess;
		bool IsLess(const char * const theCString);

		/****** TCollection_AsciiString::IsLess ******/
		/****** md5 signature: 1d98b99673bac2b79d2ab153877ba24b ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
bool

Description
-----------
Returns True if this ASCII string is lexicographically less than theStringView. 
Input parameter: theStringView the string view to compare with 
Return: true if this string is lexicographically less than theStringView.
") IsLess;
		bool IsLess(const std::string_view & theStringView);

		/****** TCollection_AsciiString::IsRealValue ******/
		/****** md5 signature: 509fb2f97609f1e80d99ddf0fd15bd9b ******/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "
Parameters
----------
theToCheckFull: bool (optional, default to false)

Return
-------
bool

Description
-----------
Returns True if the AsciiString starts with some characters that can be interpreted as integer or real value. 
Input parameter: theToCheckFull when True, checks if entire string defines a real value;  otherwise checks if string starts with a real value Note: an integer value is considered to be a real value as well. 
Return: true if string represents a real value.
") IsRealValue;
		bool IsRealValue(bool theToCheckFull = false);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 7e18b1995dfd004412c5e1a50144eb58 ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theString1: char *
theLength1: int
theString2: char *
theLength2: int
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Core implementation: Returns True if the two strings (pointer and length) contain same characters. This is the primary implementation that all other IsSameString overloads redirect to. 
Input parameter: theString1 pointer to first string to compare 
Input parameter: theLength1 length of first string 
Input parameter: theString2 pointer to second string to compare 
Input parameter: theLength2 length of second string 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(const char * const theString1, const int theLength1, const char * const theString2, const int theLength2, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 4f8c49a34299645fd3f362c7e5631f1e ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theString1: str
theString2: str
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the strings contain same characters. 
Input parameter: theString1 first string to compare 
Input parameter: theString2 second string to compare 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(TCollection_AsciiString theString1, TCollection_AsciiString theString2, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 2be91b29cbc1749549a5a57a09f5b8ac ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theString1: str
theCString: char *
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the string and C string contain same characters. 
Input parameter: theString1 first string to compare 
Input parameter: theCString second C string to compare 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(TCollection_AsciiString theString1, const char * const theCString, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 2b0812903bb85d1ae3394d099c0f79f0 ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theCString: char *
theString2: str
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the C string and string contain same characters. 
Input parameter: theCString first C string to compare 
Input parameter: theString2 second string to compare 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(const char * const theCString, TCollection_AsciiString theString2, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 03888769b9531743ae86fbfd5965ca75 ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theString1: str
theStringView: std::string_view
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the string and string_view contain same characters. 
Input parameter: theString1 first string to compare 
Input parameter: theStringView second string view to compare 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(TCollection_AsciiString theString1, const std::string_view & theStringView, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 0921c822fd03cd8ae916ff81e393d7d4 ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view
theString2: str
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the string_view and string contain same characters. 
Input parameter: theStringView first string view to compare 
Input parameter: theString2 second string to compare 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(const std::string_view & theStringView, TCollection_AsciiString theString2, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 4be62086b9a4c94bfb20bc6b7bc3cf79 ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theCString1: char *
theCString2: char *
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the two C strings contain same characters. 
Input parameter: theCString1 first C string to compare 
Input parameter: theCString2 second C string to compare 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(const char * const theCString1, const char * const theCString2, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: 932ba31589dce4ef7d523b72deaadbb8 ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theStringView1: std::string_view
theStringView2: std::string_view
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the two string_views contain same characters. 
Input parameter: theStringView1 first string view to compare 
Input parameter: theStringView2 second string view to compare 
Input parameter: theIsCaseSensitive flag indicating case sensitivity 
Return: true if strings contain same characters.
") IsSameString;
		static bool IsSameString(const std::string_view & theStringView1, const std::string_view & theStringView2, const bool theIsCaseSensitive);

		/****** TCollection_AsciiString::LeftAdjust ******/
		/****** md5 signature: 2d194519f25a34b81a2aaed2f3fcf7eb ******/
		%feature("compactdefaultargs") LeftAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters in the beginning of the string.
") LeftAdjust;
		void LeftAdjust();

		/****** TCollection_AsciiString::LeftJustify ******/
		/****** md5 signature: 26fb3fa17240515f644b225cee8e18b8 ******/
		%feature("compactdefaultargs") LeftJustify;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theFiller: char

Return
-------
None

Description
-----------
left justify Length becomes equal to Width and the new characters are equal to Filler. If Width < Length nothing happens. Raises an exception if Width is less than zero. //! Example: ```cpp TCollection_AsciiString aString('abcdef'); aString.LeftJustify(9, ' '); // Result: aString == 'abcdef ' ``` 
Input parameter: theWidth the desired width 
Input parameter: theFiller the character to fill with.
") LeftJustify;
		void LeftJustify(const int theWidth, const char theFiller);

		/****** TCollection_AsciiString::Length ******/
		/****** md5 signature: 2c79344820631bbc981db4659a632b7a ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in this string. This is the same functionality as 'strlen' in C. //! Example: ```cpp TCollection_AsciiString anAlphabet('abcdef'); int aLength = anAlphabet.Length(); // Result: aLength == 6 ``` - 1 is the position of the first character in this string. - The length of this string gives the position of its last character. - Positions less than or equal to zero, or greater than the length of this string are invalid in functions which identify a character of this string by its position. 
Return: the number of characters in the string.
") Length;
		int Length();

		/****** TCollection_AsciiString::Location ******/
		/****** md5 signature: e6b976a9e6f2ca32cdd4125a6a79a5fc ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
theOther: str
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns an index in this string of the first occurrence of the string S in this string from the starting index FromIndex to the ending index ToIndex returns zero if failure Raises an exception if FromIndex or ToIndex is out of range. //! Example: ```cpp TCollection_AsciiString aString('aabAaAa'); TCollection_AsciiString aSearchString('Aa'); int anIndex = aString.Location(aSearchString, 1, 7); // Result: anIndex == 4 ``` 
Input parameter: theOther the string to search for 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of first occurrence, or 0 if not found.
") Location;
		int Location(TCollection_AsciiString theOther, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::Location ******/
		/****** md5 signature: 7038e5a506205e4105debb35a533f3b9 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
theN: int
theC: char
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns the index of the nth occurrence of the character C in this string from the starting index FromIndex to the ending index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. //! Example: ```cpp TCollection_AsciiString aString('aabAa'); int anIndex = aString.Location(3, 'a', 1, 5); // Result: anIndex == 5 ``` 
Input parameter: theN the occurrence number to find 
Input parameter: theC the character to search for 
Input parameter: theFromIndex the starting index for search 
Input parameter: theToIndex the ending index for search 
Return: the index of the nth occurrence, or 0 if not found.
") Location;
		int Location(const int theN, const char theC, const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::LowerCase ******/
		/****** md5 signature: 3a5c616bcb477647273ba31ea4d4dd76 ******/
		%feature("compactdefaultargs") LowerCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts this string to its lower-case equivalent. //! Example: ```cpp TCollection_AsciiString aString('Hello Dolly'); aString.UpperCase(); // Result: aString == 'HELLO DOLLY' aString.LowerCase(); // Result: aString == 'hello dolly' ```.
") LowerCase;
		void LowerCase();

		/****** TCollection_AsciiString::Prepend ******/
		/****** md5 signature: ae8221fad67fb14c58d563d1349020a8 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Inserts the string other at the beginning of this ASCII string. //! Example: ```cpp TCollection_AsciiString anAlphabet('cde'); TCollection_AsciiString aBegin('ab'); anAlphabet.Prepend(aBegin); // Result: anAlphabet == 'abcde' ``` 
Input parameter: theOther the string to prepend.
") Prepend;
		void Prepend(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::Print ******/
		/****** md5 signature: 938e58a4c905f64555b1dcca06400750 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
Displays this string on a stream. 
Input parameter: theStream the output stream.
") Print;
		void Print(std::ostream &OutValue);

		/****** TCollection_AsciiString::Read ******/
		/****** md5 signature: a462d172074ded72e02b034b8d1fbfa7 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStream: str

Return
-------
None

Description
-----------
Read this string from a stream. 
Input parameter: theStream the input stream.
") Read;
		void Read(std::istream & theStream);

		/****** TCollection_AsciiString::RealValue ******/
		/****** md5 signature: c2cf21cf42a875e7427474a09b5db0a4 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Converts an AsciiString containing a numeric expression to a Real. //! Example: ```cpp TCollection_AsciiString aString1('215'); double aReal1 = aString1.RealValue(); // Result: aReal1 == 215.0 //! TCollection_AsciiString aString2('3.14159267'); double aReal2 = aString2.RealValue(); // Result: aReal2 == 3.14159267 ``` 
Return: the real value of the string.
") RealValue;
		double RealValue();

		/****** TCollection_AsciiString::Remove ******/
		/****** md5 signature: df1e7717c36a9e978044895e08416709 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theHowMany: int (optional, default to 1)

Return
-------
None

Description
-----------
Erases ahowmany characters from position where, where included. //! Example: ```cpp TCollection_AsciiString aString('Hello'); aString.Remove(2, 2); // erases 2 characters from position 2 // Result: aString == 'Hlo' ``` 
Input parameter: theWhere the position to start erasing from 
Input parameter: theHowMany the number of characters to erase.
") Remove;
		void Remove(const int theWhere, const int theHowMany = 1);

		/****** TCollection_AsciiString::RemoveAll ******/
		/****** md5 signature: 949388081a5bfb24e122cbc7aff887e9 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
theC: char
theCaseSensitive: bool

Return
-------
None

Description
-----------
Remove all the occurrences of the character C in the string. //! Example: ```cpp TCollection_AsciiString aString('HellLLo'); aString.RemoveAll('L', true); // Result: aString == 'Hello' ``` 
Input parameter: theC the character to remove 
Input parameter: theCaseSensitive flag indicating case sensitivity.
") RemoveAll;
		void RemoveAll(const char theC, const bool theCaseSensitive);

		/****** TCollection_AsciiString::RemoveAll ******/
		/****** md5 signature: d6c3be361f84166b0469df202d2bbf84 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
theWhat: char

Return
-------
None

Description
-----------
Removes every what characters from this string. 
Input parameter: theWhat the character to remove.
") RemoveAll;
		void RemoveAll(const char theWhat);

		/****** TCollection_AsciiString::RightAdjust ******/
		/****** md5 signature: 4ad2bf7860ba51d9ab208488c573dee8 ******/
		%feature("compactdefaultargs") RightAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters at the end of the string.
") RightAdjust;
		void RightAdjust();

		/****** TCollection_AsciiString::RightJustify ******/
		/****** md5 signature: b29340a397880838d35a71f83a555d92 ******/
		%feature("compactdefaultargs") RightJustify;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theFiller: char

Return
-------
None

Description
-----------
Right justify. Length becomes equal to Width and the new characters are equal to Filler. if Width < Length nothing happens. Raises an exception if Width is less than zero. //! Example: ```cpp TCollection_AsciiString aString('abcdef'); aString.RightJustify(9, ' '); // Result: aString == ' abcdef' ``` 
Input parameter: theWidth the desired width 
Input parameter: theFiller the character to fill with.
") RightJustify;
		void RightJustify(const int theWidth, const char theFiller);

		/****** TCollection_AsciiString::Search ******/
		/****** md5 signature: 5aea615f522cd90d2b0aeba829375f11 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
theWhat: char *
theWhatLength: int

Return
-------
int

Description
-----------
Core implementation: Searches a string (pointer and length) in this string from the beginning and returns position of first item matching. It returns -1 if not found. 
Input parameter: theWhat pointer to the string to search for 
Input parameter: theWhatLength length of the string to search for 
Return: the position of first match, or -1 if not found.
") Search;
		int Search(const char * const theWhat, const int theWhatLength);

		/****** TCollection_AsciiString::Search ******/
		/****** md5 signature: 15794e0d5e1f6b40b599eb0d7654040a ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
theWhat: str

Return
-------
int

Description
-----------
Searches an AsciiString in this string from the beginning and returns position of first item what matching. It returns -1 if not found. 
Input parameter: theWhat the ASCII string to search for 
Return: the position of first match, or -1 if not found.
") Search;
		int Search(TCollection_AsciiString theWhat);

		/****** TCollection_AsciiString::Search ******/
		/****** md5 signature: c477b8c97454abf1ac2573968a13e612 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
int

Description
-----------
Searches a C string in this string from the beginning. 
Input parameter: theCString the C string to search for 
Return: the position of first match, or -1 if not found.
") Search;
		int Search(const char * const theCString);

		/****** TCollection_AsciiString::Search ******/
		/****** md5 signature: c8e33e06053efbf1bc525188a244c96b ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
theWhat: std::string_view

Return
-------
int

Description
-----------
Searches a string_view in this string from the beginning and returns position of first item matching. It returns -1 if not found. 
Input parameter: theWhat the string view to search for 
Return: the position of first match, or -1 if not found.
") Search;
		int Search(const std::string_view & theWhat);

		/****** TCollection_AsciiString::SearchFromEnd ******/
		/****** md5 signature: 65f8d62ff639fd9779c138ffe9667082 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
theWhat: char *
theWhatLength: int

Return
-------
int

Description
-----------
Core implementation: Searches a string (pointer and length) in this string from the end and returns position of first item matching. It returns -1 if not found. 
Input parameter: theWhat pointer to the string to search for 
Input parameter: theWhatLength length of the string to search for 
Return: the position of first match from end, or -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(const char * const theWhat, const int theWhatLength);

		/****** TCollection_AsciiString::SearchFromEnd ******/
		/****** md5 signature: d23b9ba3a3490b5e199639ca624fdf7d ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
theWhat: str

Return
-------
int

Description
-----------
Searches a AsciiString in another AsciiString from the end and returns position of first item what matching. It returns -1 if not found. 
Input parameter: theWhat the ASCII string to search for 
Return: the position of first match from end, or -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(TCollection_AsciiString theWhat);

		/****** TCollection_AsciiString::SearchFromEnd ******/
		/****** md5 signature: 85c615fb4475ad8bc8f60a8a0e517d1d ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
int

Description
-----------
Searches a C string in this string from the end. 
Input parameter: theCString the C string to search for 
Return: the position of first match from end, or -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(const char * const theCString);

		/****** TCollection_AsciiString::SearchFromEnd ******/
		/****** md5 signature: 3b4302e60216c1c33a53545075f3def8 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
theWhat: std::string_view

Return
-------
int

Description
-----------
Searches a string_view in this string from the end and returns position of first item matching. It returns -1 if not found. 
Input parameter: theWhat the string view to search for 
Return: the position of first match from end, or -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(const std::string_view & theWhat);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: 75a309820341da475d5f8d49c5dabe55 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char

Return
-------
None

Description
-----------
Replaces one character in the AsciiString at position where. If where is less than zero or greater than the length of this string an exception is raised. //! Example: ```cpp TCollection_AsciiString aString('Garbake'); aString.SetValue(6, 'g'); // Result: aString == 'Garbage' ``` 
Input parameter: theWhere the position to replace at 
Input parameter: theWhat the character to replace with.
") SetValue;
		void SetValue(const int theWhere, const char theWhat);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: 47d64b35e2b95f7d366147984f0118bd ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theString: char *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Replaces a part of this string with a string (pointer and length). This is the primary implementation that all other SetValue string overloads redirect to. 
Input parameter: theWhere position to start replacement 
Input parameter: theString pointer to the string to replace with 
Input parameter: theLength length of the string to replace with.
") SetValue;
		void SetValue(const int theWhere, const char * const theString, const int theLength);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: 53deb80fd0007225d263543dcdf8f545 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: str

Return
-------
None

Description
-----------
Replaces a part of this string by another AsciiString. 
Input parameter: theWhere the position to start replacement 
Input parameter: theWhat the ASCII string to replace with.
") SetValue;
		void SetValue(const int theWhere, TCollection_AsciiString theWhat);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: 860c18b3eac39c472675c0a17f2fb48e ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theCString: char *

Return
-------
None

Description
-----------
Replaces a part of this ASCII string with a C string. 
Input parameter: theWhere position to start replacement 
Input parameter: theCString the C string to replace with.
") SetValue;
		void SetValue(const int theWhere, const char * const theCString);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: fbb409bb0ae85fe29499cea064e97201 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theStringView: std::string_view

Return
-------
None

Description
-----------
Replaces a part of this ASCII string with a string_view. 
Input parameter: theWhere position to start replacement 
Input parameter: theStringView the string view to replace with.
") SetValue;
		void SetValue(const int theWhere, const std::string_view & theStringView);

		/****** TCollection_AsciiString::Split ******/
		/****** md5 signature: 2e0d398766889b256df489c9409c0e71 ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
theWhere: int

Return
-------
TCollection_AsciiString

Description
-----------
Splits a AsciiString into two sub-strings. //! Example: ```cpp TCollection_AsciiString aString('abcdefg'); TCollection_AsciiString aSecondPart = aString.Split(3); // Result: aString == 'abc' and aSecondPart == 'defg' ``` 
Input parameter: theWhere the position to split at 
Return: the second part of the split string.
") Split;
		TCollection_AsciiString Split(const int theWhere);

		/****** TCollection_AsciiString::StartsWith ******/
		/****** md5 signature: 07809328a653f30c60c371dab8a4b7f5 ******/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "
Parameters
----------
theStartString: char *
theStartLength: int

Return
-------
bool

Description
-----------
Core implementation: Determines whether the beginning of this string instance matches the specified string (pointer and length). 
Input parameter: theStartString pointer to the string to check for at the beginning 
Input parameter: theStartLength length of the string to check for 
Return: true if this string starts with theStartString.
") StartsWith;
		bool StartsWith(const char * const theStartString, const int theStartLength);

		/****** TCollection_AsciiString::StartsWith ******/
		/****** md5 signature: 000f04e08820dc211169414c11b92e09 ******/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "
Parameters
----------
theStartString: str

Return
-------
bool

Description
-----------
Determines whether the beginning of this string instance matches the specified string. 
Input parameter: theStartString the string to check for at the beginning 
Return: true if this string starts with theStartString.
") StartsWith;
		bool StartsWith(TCollection_AsciiString theStartString);

		/****** TCollection_AsciiString::StartsWith ******/
		/****** md5 signature: c250a03cd0194dbd3c6f9918dd7aa9d3 ******/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
bool

Description
-----------
Determines whether the beginning of this string matches the specified C string. 
Input parameter: theCString the C string to check for at the beginning 
Return: true if this string starts with theCString.
") StartsWith;
		bool StartsWith(const char * const theCString);

		/****** TCollection_AsciiString::StartsWith ******/
		/****** md5 signature: 5e6199b2ffa12ec75fd52145fef80374 ******/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "
Parameters
----------
theStartString: std::string_view

Return
-------
bool

Description
-----------
Determines whether the beginning of this string instance matches the specified string_view. 
Input parameter: theStartString the string view to check for at the beginning 
Return: true if this string starts with theStartString.
") StartsWith;
		bool StartsWith(const std::string_view & theStartString);

		/****** TCollection_AsciiString::SubString ******/
		/****** md5 signature: cfb33c1b012fa1739ddb65c1b89653e8 ******/
		%feature("compactdefaultargs") SubString;
		%feature("autodoc", "
Parameters
----------
theFromIndex: int
theToIndex: int

Return
-------
TCollection_AsciiString

Description
-----------
Creation of a sub-string of this string. The sub-string starts to the index Fromindex and ends to the index ToIndex. Raises an exception if ToIndex or FromIndex is out of bounds //! Example: ```cpp TCollection_AsciiString aString('abcdefg'); TCollection_AsciiString aSubString = aString.SubString(3, 6); // Result: aSubString == 'cdef' ``` 
Input parameter: theFromIndex the starting index 
Input parameter: theToIndex the ending index 
Return: the substring from FromIndex to ToIndex.
") SubString;
		TCollection_AsciiString SubString(const int theFromIndex, const int theToIndex);

		/****** TCollection_AsciiString::Swap ******/
		/****** md5 signature: e92a9a780cb33042e23ff904bd0b1f47 ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Exchange the data of two strings (without reallocating memory). @param[in,out] theOther the string to exchange data with.
") Swap;
		void Swap(TCollection_AsciiString & theOther);

		/****** TCollection_AsciiString::ToCString ******/
		/****** md5 signature: aa7fb829783e884feeffe80131a91701 ******/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns pointer to AsciiString (char *). This is useful for some casual manipulations. Warning: Because this 'char *' is 'const', you can't modify its contents. 
Return: the C string representation.
") ToCString;
		const char * ToCString();

		/****** TCollection_AsciiString::Token ******/
		/****** md5 signature: 600757aaf2dab92487b27da385af4387 ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
theSeparators: char * (optional, default to '\t')
theWhichOne: int (optional, default to 1)

Return
-------
TCollection_AsciiString

Description
-----------
Extracts whichone token from this string. By default, the separators is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). separators contains all separators you need. If no token indexed by whichone is found, it returns empty AsciiString. //! Example: ```cpp TCollection_AsciiString aString('This is a message'); TCollection_AsciiString aToken1 = aString.Token(); // Result: aToken1 == 'This' //! TCollection_AsciiString aToken2 = aString.Token(' ', 4); // Result: aToken2 == 'message' //! TCollection_AsciiString aToken3 = aString.Token(' ', 2); // Result: aToken3 == 'is' //! TCollection_AsciiString aToken4 = aString.Token(' ', 9); // Result: aToken4 == '' //! TCollection_AsciiString bString('1234; test:message , value'); TCollection_AsciiString bToken1 = bString.Token('; :,', 4); // Result: bToken1 == 'value' //! TCollection_AsciiString bToken2 = bString.Token('; :,', 2); // Result: bToken2 == 'test' ``` 
Input parameter: theSeparators the separator characters 
Input parameter: theWhichOne the token number to extract.
") Token;
		TCollection_AsciiString Token(const char * const theSeparators = "\t", const int theWhichOne = 1);

		/****** TCollection_AsciiString::Trunc ******/
		/****** md5 signature: a583f042a02b01322bd8ec3468feac00 ******/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "
Parameters
----------
theHowMany: int

Return
-------
None

Description
-----------
Truncates this string to ahowmany characters. //! Example: ```cpp TCollection_AsciiString aString('Hello Dolly'); aString.Trunc(3); // Result: aString == 'Hel' ``` 
Input parameter: theHowMany the number of characters to keep.
") Trunc;
		void Trunc(const int theHowMany);

		/****** TCollection_AsciiString::UpperCase ******/
		/****** md5 signature: 3f9f21fd1f92b5d0ecce6f762f7738a1 ******/
		%feature("compactdefaultargs") UpperCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts this string to its upper-case equivalent.
") UpperCase;
		void UpperCase();

		/****** TCollection_AsciiString::UsefullLength ******/
		/****** md5 signature: 5b817f745c042c76cd9cff64bad6e7bc ******/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Length of the string ignoring all spaces (' ') and the control character at the end. 
Return: the useful length of the string.
") UsefullLength;
		int UsefullLength();

		/****** TCollection_AsciiString::Value ******/
		/****** md5 signature: 32f362a4acaaea5e8bad00df797e90b7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theWhere: int

Return
-------
char

Description
-----------
Returns character at position where in this string. If where is less than zero or greater than the length of this string, an exception is raised. //! Example: ```cpp TCollection_AsciiString aString('Hello'); char aChar = aString.Value(2); // Result: aChar == 'e' ``` 
Input parameter: theWhere the position to get character from 
Return: the character at the specified position.
") Value;
		char Value(const int theWhere);


%extend{
    bool __ne_wrapper__(const TCollection_AsciiString other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const char * const other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const std::string_view other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: 8152065f1cafbe8bac2c666d8b325a35 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: char

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const char theOther);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: 45e6e4a9bd7c87875fc5ff8bef04e54b ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: int

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const int theOther);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: ae06c4764f04aea4e294203ac13dd51e ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: double

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const double theOther);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: 0006f0e2aa46b3248292b7af1d031b35 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(TCollection_ExtendedString theOther);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: f5f0289a3938c975ab7664fab2bb1583 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theStringUtf: wchar_t *

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const wchar_t * theStringUtf);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: a2c84790f89f4e422374f650ff3ea347 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(TCollection_AsciiString theOther);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: 81318a19800923a3f92dc784d3ffc443 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theCString: char *

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const char * const theCString);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: fc9fdf260175d03aba1e76a10920f3b7 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theStringView: std::string_view

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const std::string_view & theStringView);


%extend{
    void __iadd_wrapper__(const char other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const int other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const double other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const TCollection_ExtendedString other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const wchar_t * other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const TCollection_AsciiString other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const char * const other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const std::string_view other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    bool __eq_wrapper__(const TCollection_AsciiString other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const char * const other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const std::string_view other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend TCollection_AsciiString {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Move(self):
		pass

	@methodnotwrapped
	def string_view(self):
		pass
	}
};

/***********************************
* class TCollection_ExtendedString *
***********************************/
class TCollection_ExtendedString {
	public:
		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: a2d9104268639ca8c0a7ad85874dcc21 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes an ExtendedString to an empty ExtendedString.
") TCollection_ExtendedString;
		 TCollection_ExtendedString();

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: e4a3d4a4ee2558c0672ffa582b7a83db ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theString: char *
theIsMultiByte: bool (optional, default to false)

Return
-------
None

Description
-----------
Creation by converting a CString to an extended string. If theIsMultiByte is true then the string is treated as having UTF-8 coding. If it is not a UTF-8 then theIsMultiByte is ignored and each character is copied to ExtCharacter. 
Input parameter: theString the C string to convert 
Input parameter: theIsMultiByte flag indicating UTF-8 coding.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const char * const theString, const bool theIsMultiByte = false);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 4bcbdec6086ddcdb31472f4a14feb3fb ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theString: char16_t *

Return
-------
None

Description
-----------
Creation by converting an ExtString (char16_t*) to an extended string. 
Input parameter: theString the char16_t string to copy.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const char16_t * const theString);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 027e22fd0d1b69656034d93cab54f586 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theStringUtf: wchar_t *

Return
-------
None

Description
-----------
Initialize from wide-char string considering it as Unicode string (the size of wide char is a platform-dependent - e.g. on Windows wchar_t is UTF-16). //! This constructor is unavailable if application is built with deprecated msvc option '-Zc:wchar_t-', since OCCT itself is never built with this option. 
Input parameter: theStringUtf the wide character string to convert.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const wchar_t * theStringUtf);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 7a46f56ef1fd7272d5e34d8177044aaa ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theChar: char

Return
-------
None

Description
-----------
Initializes an ExtendedString with a single ASCII character. 
Input parameter: theChar the ASCII character to initialize from.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const char theChar);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: f6146ef879bf55f7c484e3d7a3c6d863 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theChar: char16_t

Return
-------
None

Description
-----------
Initializes an ExtendedString with a single extended character. 
Input parameter: theChar the extended character to initialize from.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const char16_t theChar);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: c7107340f1bfa63e6c639c229967600e ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theLength: int
theFiller: char16_t

Return
-------
None

Description
-----------
Initializes an ExtendedString with specified length space allocated and filled with filler character. This is useful for buffers. 
Input parameter: theLength the length to allocate 
Input parameter: theFiller the character to fill with.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const int theLength, const char16_t theFiller);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 4129dfd5330bb1f16b989f12f8dfbfd2 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
None

Description
-----------
Initializes an ExtendedString with an integer value. 
Input parameter: theValue the integer value to convert to string.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const int theValue);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 6cf4ed655c49a4beeabf2f4c145cab84 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Initializes an ExtendedString with a real value. 
Input parameter: theValue the real value to convert to string.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const double theValue);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 2116a19d0b985ef3411b51a8b945cbda ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theString: str

Return
-------
None

Description
-----------
Initializes an ExtendedString with another ExtendedString. 
Input parameter: theString the string to copy from.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_ExtendedString theString);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: ecb973a76105c4b8c94850eed0ded0e5 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Move constructor. 
Input parameter: theOther the string to move from.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_ExtendedString & theOther);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 386cf1235877e7fbd22588ce9c4818e7 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theString: str
theIsMultiByte: bool (optional, default to true)

Return
-------
None

Description
-----------
Creation by converting an AsciiString to an extended string. The string is treated as having UTF-8 coding. If it is not a UTF-8 or multi byte then each character is copied to ExtCharacter. 
Input parameter: theString the ASCII string to convert 
Input parameter: theIsMultiByte flag indicating UTF-8 coding.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_AsciiString theString, const bool theIsMultiByte = true);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 1b772ab9596147dc20130204cb2ca085 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theString: char16_t *
theLength: int

Return
-------
None

Description
-----------
Initializes an ExtendedString with a char16_t string and explicit length. 
Input parameter: theString the char16_t string to initialize from 
Input parameter: theLength the length of the string.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const char16_t * const theString, const int theLength);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: e72e19fb497ab7c85bcc889d7fff8360 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theStringView: std::u16string_view

Return
-------
None

Description
-----------
Initializes an ExtendedString from a std::u16string_view. 
Input parameter: theStringView the string view to copy.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const std::u16string_view & theStringView);

		/****** TCollection_ExtendedString::u16string_view ******/
		/****** md5 signature: 2c5272a7bc3d3e18c7d49843bb69015c ******/
		%feature("compactdefaultargs") u16string_view;
		%feature("autodoc", "Return
-------
None

Description
-----------
Conversion to std::u16string_view. 
Return: a non-owning view of the string data.
") u16string_view;
		 u16string_view();

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: b9d98745e1e15a47e6df172035fe0ac3 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Appends the other extended string to this extended string. Note that this method is an alias of operator +=. //! Example: ```cpp TCollection_ExtendedString aString(u'Hello'); TCollection_ExtendedString anotherString(u' World'); aString += anotherString; // Result: aString == u'Hello World' ``` 
Input parameter: theOther the string to append.
") AssignCat;
		void AssignCat(TCollection_ExtendedString theOther);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: aa3dc93fe40b6761b3ea25e123fedda6 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: int

Return
-------
None

Description
-----------
Appends the integer value to this extended string. 
Input parameter: theOther the integer to append.
") AssignCat;
		void AssignCat(const int theOther);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: ea7711c4dc54d31d70f1982c6af975e2 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theChar: char

Return
-------
None

Description
-----------
Appends the ASCII character to this extended string. 
Input parameter: theChar the character to append.
") AssignCat;
		void AssignCat(const char theChar);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: 4125e0c8a9ac885e9d7f1aaead37b655 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theOther: double

Return
-------
None

Description
-----------
Appends the real value to this extended string. 
Input parameter: theOther the real value to append.
") AssignCat;
		void AssignCat(const double theOther);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: c6b448626da4bb346d8c6dab2a325510 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theChar: char16_t

Return
-------
None

Description
-----------
Appends the utf16 char to this extended string. 
Input parameter: theChar the character to append.
") AssignCat;
		void AssignCat(const char16_t theChar);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: 240b105edd6fb59963b00a609f9d507f ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theString: char16_t *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Appends char16_t string (pointer and length) to this extended string. This is the primary implementation that all other AssignCat overloads redirect to. 
Input parameter: theString pointer to the string to append 
Input parameter: theLength length of the string to append.
") AssignCat;
		void AssignCat(const char16_t * const theString, const int theLength);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: 29293a82ce1ffebb71d964df5ce6fe8f ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theString: char16_t *

Return
-------
None

Description
-----------
Appends the char16_t string to this extended string. 
Input parameter: theString the string to append.
") AssignCat;
		void AssignCat(const char16_t * const theString);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: 3ae91af5f946507f47e4d780b4740003 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theStringView: std::u16string_view

Return
-------
None

Description
-----------
Appends the std::u16string_view to this extended string. 
Input parameter: theStringView the string view to append.
") AssignCat;
		void AssignCat(const std::u16string_view & theStringView);

		/****** TCollection_ExtendedString::Capitalize ******/
		/****** md5 signature: dbcb7ca2711d8c69ac14d5c2510a8e32 ******/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts the first character into its corresponding upper-case character and the other characters into lowercase. @note Only ASCII characters (a-z, A-Z) are affected by case conversion.
") Capitalize;
		void Capitalize();

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: 17441bfd953551a0cceb17a544bbc06f ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *
theLength: int

Return
-------
TCollection_ExtendedString

Description
-----------
Core implementation: Concatenates char16_t string (pointer and length) and returns a new string. 
Input parameter: theOther pointer to the string to append 
Input parameter: theLength length of the string to append 
Return: new string with theOther appended.
") Cat;
		TCollection_ExtendedString Cat(const char16_t * const theOther, const int theLength);

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: c42251950b549b3d930256e8ddaad1ba ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *

Return
-------
TCollection_ExtendedString

Description
-----------
Concatenates char16_t string and returns a new string. 
Input parameter: theOther the null-terminated string to append 
Return: new string with theOther appended.
") Cat;
		TCollection_ExtendedString Cat(const char16_t * const theOther);

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: adae40940e6f5ea8c741ee58a97566b2 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: int

Return
-------
TCollection_ExtendedString

Description
-----------
Appends the integer value to this string and returns a new string. 
Input parameter: theOther the integer to append 
Return: new string with integer appended.
") Cat;
		TCollection_ExtendedString Cat(const int theOther);

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: 3980c8aff38e15f40b27adc94788a4cd ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: double

Return
-------
TCollection_ExtendedString

Description
-----------
Appends the real value to this string and returns a new string. 
Input parameter: theOther the real value to append 
Return: new string with real value appended.
") Cat;
		TCollection_ExtendedString Cat(const double theOther);

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: b9b7bbcaf247f587a09b3935a7cdd5c2 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theChar: char

Return
-------
TCollection_ExtendedString

Description
-----------
Appends a single ASCII character to this string and returns a new string. 
Input parameter: theChar the ASCII character to append.
") Cat;
		TCollection_ExtendedString Cat(const char theChar);

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: 85d15af499bbb05ae54fde7f3c99ce56 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theChar: char16_t

Return
-------
TCollection_ExtendedString

Description
-----------
Appends a single extended (char16_t) character to this string and returns a new string. 
Input parameter: theChar the extended character to append.
") Cat;
		TCollection_ExtendedString Cat(const char16_t theChar);

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: bebf41860453b802d5a88b5ade28e618 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
TCollection_ExtendedString

Description
-----------
Appends the other extended string to this string and returns a new string. //! Example: ```cpp TCollection_ExtendedString aString(u'Hello'); TCollection_ExtendedString anotherString(u' World'); TCollection_ExtendedString aResult = aString + anotherString; // Result: aResult == u'Hello World' ``` 
Input parameter: theOther the string to append 
Return: new string with theOther appended.
") Cat;
		TCollection_ExtendedString Cat(TCollection_ExtendedString theOther);

		/****** TCollection_ExtendedString::Center ******/
		/****** md5 signature: 2599f3b94f87ca1f00ed24511f1529e9 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theFiller: char16_t

Return
-------
None

Description
-----------
Modifies this string so that its length becomes equal to theWidth and the new characters are equal to theFiller. New characters are added both at the beginning and at the end of this string. If theWidth is less than the length of this string, nothing happens. 
Input parameter: theWidth the desired width of the string 
Input parameter: theFiller the character to fill with.
") Center;
		void Center(const int theWidth, const char16_t theFiller);

		/****** TCollection_ExtendedString::ChangeAll ******/
		/****** md5 signature: 6f43bc597043ddca25d5800cfaeb510d ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
theChar: char16_t
theNewChar: char16_t

Return
-------
None

Description
-----------
Substitutes all the characters equal to theChar by theNewChar in this ExtendedString. The substitution can be case sensitive. If you don't use default case sensitive, no matter whether theChar is uppercase or not. //! Example: ```cpp TCollection_ExtendedString aString(u'Histake'); aString.ChangeAll(u'H', u'M'); // Result: aString == u'Mistake' ``` 
Input parameter: theChar the character to replace 
Input parameter: theNewChar the replacement character.
") ChangeAll;
		void ChangeAll(const char16_t theChar, const char16_t theNewChar);

		/****** TCollection_ExtendedString::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in this string. This produces an empty ExtendedString.
") Clear;
		void Clear();

		/****** TCollection_ExtendedString::Copy ******/
		/****** md5 signature: 14eab0327a5745769619af5ac94f9621 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theString: char16_t *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Copy from a char16_t pointer with explicit length. 
Input parameter: theString pointer to the string to copy 
Input parameter: theLength length of the string to copy.
") Copy;
		void Copy(const char16_t * const theString, const int theLength);

		/****** TCollection_ExtendedString::Copy ******/
		/****** md5 signature: 15b28500ec5129bf687feddbec3670ce ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theString: char16_t *

Return
-------
None

Description
-----------
Copy from a char16_t pointer. 
Input parameter: theString the null-terminated string to copy.
") Copy;
		void Copy(const char16_t * const theString);

		/****** TCollection_ExtendedString::Copy ******/
		/****** md5 signature: 984d2ee99960a9ef0c7a1bef7533ddc4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theFromWhere: str

Return
-------
None

Description
-----------
Copy theFromWhere to this string. Used as operator = //! Example: ```cpp TCollection_ExtendedString aString; TCollection_ExtendedString anotherString(u'Hello World'); aString = anotherString; // operator= // Result: aString == u'Hello World' ``` 
Input parameter: theFromWhere the string to copy from.
") Copy;
		void Copy(TCollection_ExtendedString theFromWhere);

		/****** TCollection_ExtendedString::EmptyString ******/
		/****** md5 signature: beb9cecb59c3335abb51ace703c9af23 ******/
		%feature("compactdefaultargs") EmptyString;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns a const reference to a single shared empty string instance. This method provides access to a static empty string to avoid creating temporary empty strings. Use this method instead of constructing empty strings when you need a const reference. //! Example: ```cpp const TCollection_ExtendedString& anEmptyStr = TCollection_ExtendedString::EmptyString(); // Use anEmptyStr instead of TCollection_ExtendedString() ``` 
Return: const reference to static empty string.
") EmptyString;
		static const TCollection_ExtendedString & EmptyString();

		/****** TCollection_ExtendedString::EndsWith ******/
		/****** md5 signature: 4282e981120e959fad31e3ae914a2558 ******/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "
Parameters
----------
theEndString: char16_t *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Determines whether this string ends with theEndString. 
Input parameter: theEndString pointer to the string to check for 
Input parameter: theLength length of the string to check for 
Return: true if this string ends with theEndString.
") EndsWith;
		bool EndsWith(const char16_t * const theEndString, const int theLength);

		/****** TCollection_ExtendedString::EndsWith ******/
		/****** md5 signature: 2956817c50ce93d54a78bd31f4e14f08 ******/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "
Parameters
----------
theEndString: char16_t *

Return
-------
bool

Description
-----------
Determines whether this string ends with theEndString. 
Input parameter: theEndString the null-terminated string to check for 
Return: true if this string ends with theEndString.
") EndsWith;
		bool EndsWith(const char16_t * const theEndString);

		/****** TCollection_ExtendedString::EndsWith ******/
		/****** md5 signature: cc86e16f8875f69aca57c037bcbcc042 ******/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "
Parameters
----------
theEndString: str

Return
-------
bool

Description
-----------
Determines whether the end of this string instance matches the specified string. 
Input parameter: theEndString the string to check for at the end 
Return: true if this string ends with theEndString.
") EndsWith;
		bool EndsWith(TCollection_ExtendedString theEndString);

		/****** TCollection_ExtendedString::FirstLocationInSet ******/
		/****** md5 signature: 4db5b529a359d959b9317f3d403fdead ******/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "
Parameters
----------
theSet: str
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of this string that is present in theSet. The search begins at index theFromIndex and ends at index theToIndex. Returns zero if failure. 
Input parameter: theSet the set of characters to search for 
Input parameter: theFromIndex the starting index for search (1-based) 
Input parameter: theToIndex the ending index for search (1-based) 
Return: the index of first character found in set, or 0 if not found.
") FirstLocationInSet;
		int FirstLocationInSet(TCollection_ExtendedString theSet, const int theFromIndex, const int theToIndex);

		/****** TCollection_ExtendedString::FirstLocationNotInSet ******/
		/****** md5 signature: 0f7503c1bdc4eb50df49a43338c31287 ******/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "
Parameters
----------
theSet: str
theFromIndex: int
theToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of this string that is NOT present in theSet. The search begins at index theFromIndex and ends at index theToIndex. Returns zero if failure. 
Input parameter: theSet the set of characters to check against 
Input parameter: theFromIndex the starting index for search (1-based) 
Input parameter: theToIndex the ending index for search (1-based) 
Return: the index of first character not in set, or 0 if not found.
") FirstLocationNotInSet;
		int FirstLocationNotInSet(TCollection_ExtendedString theSet, const int theFromIndex, const int theToIndex);

		/****** TCollection_ExtendedString::HashCode ******/
		/****** md5 signature: 9c314e4c582b8527413f7ff4f2563524 ******/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns a hashed value for the extended string. Note: if string is ASCII, the computed value is the same as the value computed with the HashCode function on a TCollection_AsciiString string composed with equivalent ASCII characters. 
Return: a computed hash code.
") HashCode;
		size_t HashCode();

		/****** TCollection_ExtendedString::Insert ******/
		/****** md5 signature: da85a5563a878fe8405891d552ece9b7 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char16_t

Return
-------
None

Description
-----------
Insert a Character at position theWhere. //! Example: ```cpp TCollection_ExtendedString aString(u'hy not ?'); aString.Insert(1, u'W'); // Result: aString == u'Why not ?' ``` 
Input parameter: theWhere the position to insert at (1-based) 
Input parameter: theWhat the character to insert.
") Insert;
		void Insert(const int theWhere, const char16_t theWhat);

		/****** TCollection_ExtendedString::Insert ******/
		/****** md5 signature: 2fb83d2d884fbc9b563504504a3f16b0 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char16_t *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Insert a char16_t string (pointer and length) at position theWhere. 
Input parameter: theWhere the position to insert at (1-based) 
Input parameter: theWhat pointer to the string to insert 
Input parameter: theLength length of the string to insert.
") Insert;
		void Insert(const int theWhere, const char16_t * const theWhat, const int theLength);

		/****** TCollection_ExtendedString::Insert ******/
		/****** md5 signature: 780e8277f3bbfa1462c6ec872b66f5e7 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char16_t *

Return
-------
None

Description
-----------
Insert a char16_t string at position theWhere. 
Input parameter: theWhere the position to insert at (1-based) 
Input parameter: theWhat the null-terminated string to insert.
") Insert;
		void Insert(const int theWhere, const char16_t * const theWhat);

		/****** TCollection_ExtendedString::Insert ******/
		/****** md5 signature: 44a5cf17311a66140101283b5521c7ba ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: str

Return
-------
None

Description
-----------
Insert an ExtendedString at position theWhere. 
Input parameter: theWhere the position to insert at (1-based) 
Input parameter: theWhat the string to insert.
") Insert;
		void Insert(const int theWhere, TCollection_ExtendedString theWhat);

		/****** TCollection_ExtendedString::IntegerValue ******/
		/****** md5 signature: a21ed5e6498eb5350afa935263aed2ac ******/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Converts this extended string containing a numeric expression to an Integer. 
Return: the integer value.
") IntegerValue;
		int IntegerValue();

		/****** TCollection_ExtendedString::IsAscii ******/
		/****** md5 signature: 0c35a1a20ae1b86ba412a9de8d1dc696 ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the ExtendedString contains only 'Ascii Range' characters. 
Return: true if string contains only ASCII characters.
") IsAscii;
		bool IsAscii();

		/****** TCollection_ExtendedString::IsDifferent ******/
		/****** md5 signature: 098b5dc846b735570da326e7e3decce9 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns true if this string differs from theOther (pointer and length). 
Input parameter: theOther pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if strings are different, false otherwise.
") IsDifferent;
		bool IsDifferent(const char16_t * const theOther, const int theLength);

		/****** TCollection_ExtendedString::IsDifferent ******/
		/****** md5 signature: d4c91a5f573588114bd62f836bdddff5 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *

Return
-------
bool

Description
-----------
Returns true if this string differs from theOther null-terminated string. Note that this method is an alias of operator !=. 
Input parameter: theOther the char16_t string to compare with 
Return: true if strings are different, false otherwise.
") IsDifferent;
		bool IsDifferent(const char16_t * const theOther);

		/****** TCollection_ExtendedString::IsDifferent ******/
		/****** md5 signature: 18025d825b01f58f95a731ef26c878b1 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns true if there are differences between the characters in this extended string and theOther extended string. Note that this method is an alias of operator !=. 
Input parameter: theOther the extended string to compare with 
Return: true if strings are different, false otherwise.
") IsDifferent;
		bool IsDifferent(TCollection_ExtendedString theOther);

		/****** TCollection_ExtendedString::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this string contains no characters.
") IsEmpty;
		bool IsEmpty();

		/****** TCollection_ExtendedString::IsEqual ******/
		/****** md5 signature: d0813663c54dd4ab9d58096a4164d112 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns true if this string equals theOther (pointer and length). 
Input parameter: theOther pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if strings are equal, false otherwise.
") IsEqual;
		bool IsEqual(const char16_t * const theOther, const int theLength);

		/****** TCollection_ExtendedString::IsEqual ******/
		/****** md5 signature: b63ded92fc6cc0a41ef15533cdd0888f ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *

Return
-------
bool

Description
-----------
Returns true if this string equals theOther null-terminated string. Note that this method is an alias of operator ==. 
Input parameter: theOther the char16_t string to compare with 
Return: true if strings are equal, false otherwise.
") IsEqual;
		bool IsEqual(const char16_t * const theOther);

		/****** TCollection_ExtendedString::IsEqual ******/
		/****** md5 signature: 338239de5b9f1c712c21a1f3a310b53d ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns true if the characters in this extended string are identical to the characters in theOther extended string. Note that this method is an alias of operator ==. 
Input parameter: theOther the extended string to compare with 
Return: true if strings are equal, false otherwise.
") IsEqual;
		bool IsEqual(TCollection_ExtendedString theOther);

		/****** TCollection_ExtendedString::IsEqual ******/
		/****** md5 signature: eb61a3003935215340abfe15f1d05e7d ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theString1: str
theString2: str

Return
-------
bool

Description
-----------
Returns true if the characters in this extended string are identical to the characters in the other extended string. Note that this method is an alias of operator ==. 
Input parameter: theString1 first string to compare 
Input parameter: theString2 second string to compare 
Return: true if strings are equal.
") IsEqual;
		static bool IsEqual(TCollection_ExtendedString theString1, TCollection_ExtendedString theString2);

		/****** TCollection_ExtendedString::IsGreater ******/
		/****** md5 signature: 0792dbac47c3cb228ecaacf5aed78411 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns True if this string is lexicographically greater than theOther. 
Input parameter: theOther pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if this string is greater than theOther.
") IsGreater;
		bool IsGreater(const char16_t * const theOther, const int theLength);

		/****** TCollection_ExtendedString::IsGreater ******/
		/****** md5 signature: eaaa66d50ef891c2707f0a6816a05c4f ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *

Return
-------
bool

Description
-----------
Returns True if this string is lexicographically greater than theOther. 
Input parameter: theOther the char16_t string to compare with 
Return: true if this string is greater than theOther.
") IsGreater;
		bool IsGreater(const char16_t * const theOther);

		/****** TCollection_ExtendedString::IsGreater ******/
		/****** md5 signature: 6791c879a1914b4856963ec479d4d794 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns True if this string is lexicographically greater than theOther. 
Input parameter: theOther the extended string to compare with 
Return: true if this string is greater than theOther.
") IsGreater;
		bool IsGreater(TCollection_ExtendedString theOther);

		/****** TCollection_ExtendedString::IsIntegerValue ******/
		/****** md5 signature: a1e19343fc88858f9baa401fda45e974 ******/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this extended string contains an integer value. 
Return: true if string represents an integer value.
") IsIntegerValue;
		bool IsIntegerValue();

		/****** TCollection_ExtendedString::IsLess ******/
		/****** md5 signature: 142ecde1a13d0b02b8e0db9b8855b3c0 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Returns True if this string is lexicographically less than theOther. 
Input parameter: theOther pointer to the string to compare with 
Input parameter: theLength length of the string to compare with 
Return: true if this string is less than theOther.
") IsLess;
		bool IsLess(const char16_t * const theOther, const int theLength);

		/****** TCollection_ExtendedString::IsLess ******/
		/****** md5 signature: c5eb63a9b3379466b33afb93d8cc077e ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *

Return
-------
bool

Description
-----------
Returns True if this string is lexicographically less than theOther. 
Input parameter: theOther the char16_t string to compare with 
Return: true if this string is less than theOther.
") IsLess;
		bool IsLess(const char16_t * const theOther);

		/****** TCollection_ExtendedString::IsLess ******/
		/****** md5 signature: 837d5a9d93dc7d2013585970e087c9bf ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns True if this string is lexicographically less than theOther. 
Input parameter: theOther the extended string to compare with 
Return: true if this string is less than theOther.
") IsLess;
		bool IsLess(TCollection_ExtendedString theOther);

		/****** TCollection_ExtendedString::IsRealValue ******/
		/****** md5 signature: 509fb2f97609f1e80d99ddf0fd15bd9b ******/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "
Parameters
----------
theToCheckFull: bool (optional, default to false)

Return
-------
bool

Description
-----------
Returns True if this extended string starts with characters that can be interpreted as a real value. 
Input parameter: theToCheckFull when True, checks if entire string defines a real value;  otherwise checks if string starts with a real value 
Return: true if string represents a real value.
") IsRealValue;
		bool IsRealValue(bool theToCheckFull = false);

		/****** TCollection_ExtendedString::IsSameString ******/
		/****** md5 signature: bb5c19969d81e5721ae5df16b2aa6a9a ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
theOther: str
theIsCaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the strings contain same characters. 
Input parameter: theOther the string to compare with 
Input parameter: theIsCaseSensitive flag indicating case sensitivity @note When case-insensitive, only ASCII characters (a-z, A-Z) are affected. 
Return: true if strings contain same characters.
") IsSameString;
		bool IsSameString(TCollection_ExtendedString theOther, const bool theIsCaseSensitive);

		/****** TCollection_ExtendedString::LeftAdjust ******/
		/****** md5 signature: 2d194519f25a34b81a2aaed2f3fcf7eb ******/
		%feature("compactdefaultargs") LeftAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters in the beginning of the string.
") LeftAdjust;
		void LeftAdjust();

		/****** TCollection_ExtendedString::LeftJustify ******/
		/****** md5 signature: a90a3fcea3a05959cf9d970dd83ef93d ******/
		%feature("compactdefaultargs") LeftJustify;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theFiller: char16_t

Return
-------
None

Description
-----------
Left justify. Length becomes equal to theWidth and the new characters are equal to theFiller. If theWidth < Length nothing happens. 
Input parameter: theWidth the desired width of the string 
Input parameter: theFiller the character to fill with.
") LeftJustify;
		void LeftJustify(const int theWidth, const char16_t theFiller);

		/****** TCollection_ExtendedString::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 16-bit code units (might be greater than number of Unicode symbols if string contains surrogate pairs). 
Return: the number of 16-bit code units.
") Length;
		int Length();

		/****** TCollection_ExtendedString::LengthOfCString ******/
		/****** md5 signature: 5677c5b80b7c0a71ac833e2b929798a6 ******/
		%feature("compactdefaultargs") LengthOfCString;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns expected CString length in UTF8 coding (like strlen, without null terminator). It can be used for memory calculation before converting to CString containing symbols in UTF8 coding. For external allocation, use: char* buf = new char[str.LengthOfCString() + 1]; 
Return: expected UTF-8 string length.
") LengthOfCString;
		int LengthOfCString();

		/****** TCollection_ExtendedString::Prepend ******/
		/****** md5 signature: bbbbbe7e51b7e9b97a2cbfdfac770299 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Inserts char16_t string (pointer and length) at the beginning. 
Input parameter: theOther pointer to the string to prepend 
Input parameter: theLength length of the string to prepend.
") Prepend;
		void Prepend(const char16_t * const theOther, const int theLength);

		/****** TCollection_ExtendedString::Prepend ******/
		/****** md5 signature: b6a0b9857e3442e0ac4b12059692011f ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *

Return
-------
None

Description
-----------
Inserts a null-terminated char16_t string at the beginning. 
Input parameter: theOther the null-terminated string to prepend.
") Prepend;
		void Prepend(const char16_t * const theOther);

		/****** TCollection_ExtendedString::Prepend ******/
		/****** md5 signature: db9860fcdbe8fc0415e2915f0e9fcd42 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Inserts the other extended string at the beginning of this string. 
Input parameter: theOther the string to prepend.
") Prepend;
		void Prepend(TCollection_ExtendedString theOther);

		/****** TCollection_ExtendedString::Print ******/
		/****** md5 signature: 938e58a4c905f64555b1dcca06400750 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
Displays this string on a stream. 
Input parameter: theStream the output stream.
") Print;
		void Print(std::ostream &OutValue);

		/****** TCollection_ExtendedString::RealValue ******/
		/****** md5 signature: c2cf21cf42a875e7427474a09b5db0a4 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Converts this extended string containing a numeric expression to a Real. 
Return: the real value.
") RealValue;
		double RealValue();

		/****** TCollection_ExtendedString::Remove ******/
		/****** md5 signature: df1e7717c36a9e978044895e08416709 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theHowMany: int (optional, default to 1)

Return
-------
None

Description
-----------
Erases theHowMany characters from position theWhere, theWhere included. //! Example: ```cpp TCollection_ExtendedString aString(u'Hello'); aString.Remove(2, 2); // erases 2 characters from position 2 // Result: aString == u'Hlo' ``` 
Input parameter: theWhere the position to start erasing from (1-based) 
Input parameter: theHowMany the number of characters to erase.
") Remove;
		void Remove(const int theWhere, const int theHowMany = 1);

		/****** TCollection_ExtendedString::RemoveAll ******/
		/****** md5 signature: b596607b2aa105ba007e048be077c437 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
theWhat: char16_t

Return
-------
None

Description
-----------
Removes every theWhat characters from this string. 
Input parameter: theWhat the character to remove.
") RemoveAll;
		void RemoveAll(const char16_t theWhat);

		/****** TCollection_ExtendedString::RightAdjust ******/
		/****** md5 signature: 4ad2bf7860ba51d9ab208488c573dee8 ******/
		%feature("compactdefaultargs") RightAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters at the end of the string.
") RightAdjust;
		void RightAdjust();

		/****** TCollection_ExtendedString::RightJustify ******/
		/****** md5 signature: ca05d39acf5e86b332591c377b71955d ******/
		%feature("compactdefaultargs") RightJustify;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theFiller: char16_t

Return
-------
None

Description
-----------
Right justify. Length becomes equal to theWidth and the new characters are equal to theFiller. If theWidth < Length nothing happens. 
Input parameter: theWidth the desired width of the string 
Input parameter: theFiller the character to fill with.
") RightJustify;
		void RightJustify(const int theWidth, const char16_t theFiller);

		/****** TCollection_ExtendedString::Search ******/
		/****** md5 signature: 673b09446327912271c56e065c9ddc9d ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
theWhat: char16_t *
theLength: int

Return
-------
int

Description
-----------
Core implementation: Searches for theWhat (pointer and length) from the beginning. 
Input parameter: theWhat pointer to the string to search for 
Input parameter: theLength length of the string to search for 
Return: the position of first match (1-based), or -1 if not found.
") Search;
		int Search(const char16_t * const theWhat, const int theLength);

		/****** TCollection_ExtendedString::Search ******/
		/****** md5 signature: 4a0715aae6d6413a4504b252f827536b ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
theWhat: char16_t *

Return
-------
int

Description
-----------
Searches for theWhat null-terminated string from the beginning. 
Input parameter: theWhat the null-terminated string to search for 
Return: the position of first match (1-based), or -1 if not found.
") Search;
		int Search(const char16_t * const theWhat);

		/****** TCollection_ExtendedString::Search ******/
		/****** md5 signature: bcc97a237b820e9f39ba021ac6fdf045 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
theWhat: str

Return
-------
int

Description
-----------
Searches an ExtendedString in this string from the beginning and returns position of first item theWhat matching. It returns -1 if not found. 
Input parameter: theWhat the string to search for 
Return: the position of first match (1-based), or -1 if not found.
") Search;
		int Search(TCollection_ExtendedString theWhat);

		/****** TCollection_ExtendedString::SearchFromEnd ******/
		/****** md5 signature: 7fc2e6334ad0d13c3ee1e50ac7ee9b72 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
theWhat: char16_t *
theLength: int

Return
-------
int

Description
-----------
Core implementation: Searches for theWhat (pointer and length) from the end. 
Input parameter: theWhat pointer to the string to search for 
Input parameter: theLength length of the string to search for 
Return: the position of first match from end (1-based), or -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(const char16_t * const theWhat, const int theLength);

		/****** TCollection_ExtendedString::SearchFromEnd ******/
		/****** md5 signature: 218491f0f73e98e22e0f83e71848cc8f ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
theWhat: char16_t *

Return
-------
int

Description
-----------
Searches for theWhat null-terminated string from the end. 
Input parameter: theWhat the null-terminated string to search for 
Return: the position of first match from end (1-based), or -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(const char16_t * const theWhat);

		/****** TCollection_ExtendedString::SearchFromEnd ******/
		/****** md5 signature: a208b86858196fad84b24a3ef9933b57 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
theWhat: str

Return
-------
int

Description
-----------
Searches an ExtendedString in this string from the end and returns position of first item theWhat matching. It returns -1 if not found. 
Input parameter: theWhat the string to search for 
Return: the position of first match from end (1-based), or -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(TCollection_ExtendedString theWhat);

		/****** TCollection_ExtendedString::SetValue ******/
		/****** md5 signature: 74153916c19199b6dec69cedacf4e1b6 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char16_t

Return
-------
None

Description
-----------
Replaces one character in the ExtendedString at position theWhere. If theWhere is less than zero or greater than the length of this string an exception is raised. //! Example: ```cpp TCollection_ExtendedString aString(u'Garbake'); aString.SetValue(6, u'g'); // Result: aString == u'Garbage' ``` 
Input parameter: theWhere the position to replace at (1-based) 
Input parameter: theWhat the character to replace with.
") SetValue;
		void SetValue(const int theWhere, const char16_t theWhat);

		/****** TCollection_ExtendedString::SetValue ******/
		/****** md5 signature: b5fab25d43de96821e0bc08097fa62e7 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char16_t *
theLength: int

Return
-------
None

Description
-----------
Core implementation: Replaces a part of this string by char16_t string (pointer and length). 
Input parameter: theWhere the position to start replacement (1-based) 
Input parameter: theWhat pointer to the string to replace with 
Input parameter: theLength length of the string to replace with.
") SetValue;
		void SetValue(const int theWhere, const char16_t * const theWhat, const int theLength);

		/****** TCollection_ExtendedString::SetValue ******/
		/****** md5 signature: 81855ff5ec81fa14b6d439af5242a87e ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: char16_t *

Return
-------
None

Description
-----------
Replaces a part of this string by a null-terminated char16_t string. 
Input parameter: theWhere the position to start replacement (1-based) 
Input parameter: theWhat the null-terminated string to replace with.
") SetValue;
		void SetValue(const int theWhere, const char16_t * const theWhat);

		/****** TCollection_ExtendedString::SetValue ******/
		/****** md5 signature: b9ebf067966b58e1c1413cbe10e80090 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theWhere: int
theWhat: str

Return
-------
None

Description
-----------
Replaces a part of this string by another ExtendedString. 
Input parameter: theWhere the position to start replacement (1-based) 
Input parameter: theWhat the string to replace with.
") SetValue;
		void SetValue(const int theWhere, TCollection_ExtendedString theWhat);

		/****** TCollection_ExtendedString::Split ******/
		/****** md5 signature: 537ad3a9e7166303f27a7915bb0ff10f ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
theWhere: int

Return
-------
TCollection_ExtendedString

Description
-----------
Splits this extended string into two sub-strings at position theWhere. - The second sub-string (from position theWhere + 1 of this string to the end) is returned in a new extended string. - This extended string is modified: its last characters are removed, it becomes equal to the first sub-string (from the first character to position theWhere). //! Example: ```cpp TCollection_ExtendedString aString(u'abcdefg'); TCollection_ExtendedString aSecondPart = aString.Split(3); // Result: aString == u'abc' and aSecondPart == u'defg' ``` 
Input parameter: theWhere the position to split at (0-based) 
Return: the second part of the split string.
") Split;
		TCollection_ExtendedString Split(const int theWhere);

		/****** TCollection_ExtendedString::StartsWith ******/
		/****** md5 signature: 7ef94f30975a61c75896ff80d18af15d ******/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "
Parameters
----------
theStartString: char16_t *
theLength: int

Return
-------
bool

Description
-----------
Core implementation: Determines whether this string starts with theStartString. 
Input parameter: theStartString pointer to the string to check for 
Input parameter: theLength length of the string to check for 
Return: true if this string starts with theStartString.
") StartsWith;
		bool StartsWith(const char16_t * const theStartString, const int theLength);

		/****** TCollection_ExtendedString::StartsWith ******/
		/****** md5 signature: d3eb71cbf8c6fc07dba7de6acedae5f8 ******/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "
Parameters
----------
theStartString: char16_t *

Return
-------
bool

Description
-----------
Determines whether this string starts with theStartString. 
Input parameter: theStartString the null-terminated string to check for 
Return: true if this string starts with theStartString.
") StartsWith;
		bool StartsWith(const char16_t * const theStartString);

		/****** TCollection_ExtendedString::StartsWith ******/
		/****** md5 signature: 72d4fc0c9201ac5cba67f18770ff8584 ******/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "
Parameters
----------
theStartString: str

Return
-------
bool

Description
-----------
Determines whether the beginning of this string instance matches the specified string. 
Input parameter: theStartString the string to check for at the beginning 
Return: true if this string starts with theStartString.
") StartsWith;
		bool StartsWith(TCollection_ExtendedString theStartString);

		/****** TCollection_ExtendedString::SubString ******/
		/****** md5 signature: fbd33455e7969f2e8172e7065d1f46cf ******/
		%feature("compactdefaultargs") SubString;
		%feature("autodoc", "
Parameters
----------
theFromIndex: int
theToIndex: int

Return
-------
TCollection_ExtendedString

Description
-----------
Copies characters from this string starting from index theFromIndex to the index theToIndex (inclusive). Raises an exception if theToIndex or theFromIndex is out of bounds. //! Example: ```cpp TCollection_ExtendedString aString(u'abcdefg'); TCollection_ExtendedString aSubString = aString.SubString(3, 6); // Result: aSubString == u'cdef' ``` 
Input parameter: theFromIndex the starting index (1-based) 
Input parameter: theToIndex the ending index (1-based, inclusive) 
Return: the substring from theFromIndex to theToIndex.
") SubString;
		TCollection_ExtendedString SubString(const int theFromIndex, const int theToIndex);

		/****** TCollection_ExtendedString::Swap ******/
		/****** md5 signature: 64355d86a311821e9f828b1de3bbea86 ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
None

Description
-----------
Exchange the data of two strings (without reallocating memory). @param[in,out] theOther the string to exchange data with.
") Swap;
		void Swap(TCollection_ExtendedString & theOther);

		/****** TCollection_ExtendedString::ToExtString ******/
		/****** md5 signature: dea88946ba2f286795d88eea98b4ccf5 ******/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Return
-------
char16_t *

Description
-----------
Returns pointer to ExtString (char16_t*). 
Return: the char16_t string representation.
") ToExtString;
		const char16_t * ToExtString();

		/****** TCollection_ExtendedString::ToUTF8CString ******/
		/****** md5 signature: 18ac7ee3acb86c0f079968c619af3995 ******/
		%feature("compactdefaultargs") ToUTF8CString;
		%feature("autodoc", "
Parameters
----------
theCString: Standard_PCharacter

Return
-------
int

Description
-----------
Converts the internal myString to UTF8 coding and returns length of the out CString. A memory for the theCString should be allocated before call! @param[in,out] theCString pointer to the output buffer 
Return: length of the UTF-8 string.
") ToUTF8CString;
		int ToUTF8CString(Standard_PCharacter & theCString);

		/****** TCollection_ExtendedString::Token ******/
		/****** md5 signature: 8a988f21514ea82445f801730f63fcbd ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
theSeparators: char16_t *
theWhichOne: int (optional, default to 1)

Return
-------
TCollection_ExtendedString

Description
-----------
Extracts theWhichOne token from this string. By default, the theSeparators is set to space and tabulation. By default, the token extracted is the first one (theWhichOne = 1). theSeparators contains all separators you need. If no token indexed by theWhichOne is found, it returns an empty ExtendedString. //! Example: ```cpp TCollection_ExtendedString aString(u'This is a message'); TCollection_ExtendedString aToken1 = aString.Token(); // Result: aToken1 == u'This' //! TCollection_ExtendedString aToken2 = aString.Token(u' ', 4); // Result: aToken2 == u'message' //! TCollection_ExtendedString aToken3 = aString.Token(u' ', 2); // Result: aToken3 == u'is' //! TCollection_ExtendedString aToken4 = aString.Token(u' ', 9); // Result: aToken4 == u'' //! TCollection_ExtendedString bString(u'1234; test:message , value'); TCollection_ExtendedString bToken1 = bString.Token(u'; :,', 4); // Result: bToken1 == u'value' ``` 
Input parameter: theSeparators the separator characters 
Input parameter: theWhichOne the token number to extract (1-based) 
Return: the extracted token.
") Token;
		TCollection_ExtendedString Token(const char16_t * const theSeparators, const int theWhichOne = 1);

		/****** TCollection_ExtendedString::Trunc ******/
		/****** md5 signature: a583f042a02b01322bd8ec3468feac00 ******/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "
Parameters
----------
theHowMany: int

Return
-------
None

Description
-----------
Truncates this string to theHowMany characters. //! Example: ```cpp TCollection_ExtendedString aString(u'Hello Dolly'); aString.Trunc(3); // Result: aString == u'Hel' ``` 
Input parameter: theHowMany the number of characters to keep.
") Trunc;
		void Trunc(const int theHowMany);

		/****** TCollection_ExtendedString::Value ******/
		/****** md5 signature: 26aef72aaf1c75403315049507d14bf0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theWhere: int

Return
-------
char16_t

Description
-----------
Returns character at position theWhere in this string. If theWhere is less than zero or greater than the length of this string, an exception is raised. //! Example: ```cpp TCollection_ExtendedString aString(u'Hello'); char16_t aChar = aString.Value(2); // Result: aChar == u'e' ``` 
Input parameter: theWhere the position to get character from (1-based) 
Return: the character at the specified position.
") Value;
		char16_t Value(const int theWhere);


%extend{
    bool __ne_wrapper__(const char16_t * const other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const TCollection_ExtendedString other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** TCollection_ExtendedString::operator + ******/
		/****** md5 signature: 82677184f2f59779c9841377af9759f4 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: char16_t *

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") operator +;
		TCollection_ExtendedString operator +(const char16_t * const theOther);

		/****** TCollection_ExtendedString::operator + ******/
		/****** md5 signature: 18c566e919449d08f08a6bbd0f96f17d ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: int

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") operator +;
		TCollection_ExtendedString operator +(const int theOther);

		/****** TCollection_ExtendedString::operator + ******/
		/****** md5 signature: 3394540b978f5658fc90c05f2ba292b1 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: double

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") operator +;
		TCollection_ExtendedString operator +(const double theOther);

		/****** TCollection_ExtendedString::operator + ******/
		/****** md5 signature: f6d4439d11a9526d7570f2810f85d32f ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theChar: char

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") operator +;
		TCollection_ExtendedString operator +(const char theChar);

		/****** TCollection_ExtendedString::operator + ******/
		/****** md5 signature: 1b0b1cf5bfadb5f91308b98399955755 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theChar: char16_t

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") operator +;
		TCollection_ExtendedString operator +(const char16_t theChar);

		/****** TCollection_ExtendedString::operator + ******/
		/****** md5 signature: d009cc9619390ee380a84ee17dde4bf9 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") operator +;
		TCollection_ExtendedString operator +(TCollection_ExtendedString theOther);


%extend{
    void __iadd_wrapper__(const TCollection_ExtendedString other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const int other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const char other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const double other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const char16_t * const other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const std::u16string_view other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    bool __eq_wrapper__(const char16_t * const other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const TCollection_ExtendedString other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend TCollection_ExtendedString {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ToWideString(self):
		pass

	@methodnotwrapped
	def Move(self):
		pass
	}
};

/*********************************
* class TCollection_HAsciiString *
*********************************/
class TCollection_HAsciiString : public Standard_Transient {
	public:
		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 1078a0d0e3b700abf3d93bf0c910aa95 ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a HAsciiString to an empty AsciiString.
") TCollection_HAsciiString;
		 TCollection_HAsciiString();

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: e9cda0f5e28ed7313ab8a2aa3e5977fa ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
message: char *

Return
-------
None

Description
-----------
Initializes a HAsciiString with a CString.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const char * const message);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: c064cc3c6c669cb9538b26c856b589a2 ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
aChar: char

Return
-------
None

Description
-----------
Initializes a HAsciiString with a single character.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const char aChar);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 3ab3a96a39772dc267b50ad20a07c0cc ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
length: int
filler: char

Return
-------
None

Description
-----------
Initializes a HAsciiString with <length> space allocated. and filled with <filler>.This is useful for buffers.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const int length, const char filler);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: d94c55ab43c556fbe75eb78affbccfad ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
value: int

Return
-------
None

Description
-----------
Initializes a HAsciiString with an integer value.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const int value);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 069f7fb9ab0a1197b0747f80306b7525 ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
value: double

Return
-------
None

Description
-----------
Initializes a HAsciiString with a real value.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const double value);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 4c34b45baf33ce6936cb87edb50c3fad ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
aString: str

Return
-------
None

Description
-----------
Initializes a HAsciiString with a AsciiString.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(TCollection_AsciiString aString);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: e40da8f0650af2c2ce01fec510892658 ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
theString: str

Return
-------
None

Description
-----------
Initializes a HAsciiString with a AsciiString.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(TCollection_AsciiString & theString);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 84b0260612dd7af944e9b7fbb8cd5693 ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
aString: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initializes a HAsciiString with a HAsciiString.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const opencascade::handle<TCollection_HAsciiString> & aString);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 56c63499e5214e6d85bea1e86dd2b5ab ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
aString: TCollection_HExtendedString
replaceNonAscii: char

Return
-------
None

Description
-----------
Initializes a HAsciiString with a HExtendedString. If replaceNonAscii is non-null character, it will be used in place of any non-ascii character found in the source string. Otherwise, creates UTF-8 unicode string.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const opencascade::handle<TCollection_HExtendedString> & aString, const char replaceNonAscii);

		/****** TCollection_HAsciiString::AssignCat ******/
		/****** md5 signature: 6a3ca333dcf3afeefe4a0593b05e7488 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: char *

Return
-------
None

Description
-----------
Appends <other> to me.
") AssignCat;
		void AssignCat(const char * const other);

		/****** TCollection_HAsciiString::AssignCat ******/
		/****** md5 signature: 9a1804a3730fe6c158f51e3b1a62e311 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HAsciiString

Return
-------
None

Description
-----------
Appends <other> to me. Example: aString = aString + anotherString.
") AssignCat;
		void AssignCat(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::Capitalize ******/
		/****** md5 signature: dbcb7ca2711d8c69ac14d5c2510a8e32 ******/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts the first character into its corresponding upper-case character and the other characters into lowercase. Example: before me = 'hellO ' after me = 'Hello '.
") Capitalize;
		void Capitalize();

		/****** TCollection_HAsciiString::Cat ******/
		/****** md5 signature: c6077a4b5757e3147286aeffdd24251e ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: char *

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Creates a new string by concatenation of this ASCII string and the other ASCII string. Example: aString = aString + anotherString aString = aString + 'Dummy' aString contains 'I say ' aString = aString + 'Hello ' + 'Dolly' gives 'I say Hello Dolly' Warning: To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.
") Cat;
		opencascade::handle<TCollection_HAsciiString> Cat(const char * const other);

		/****** TCollection_HAsciiString::Cat ******/
		/****** md5 signature: dd2183ed02563b08fc5f255cea059ce5 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HAsciiString

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Creates a new string by concatenation of this ASCII string and the other ASCII string. Example: aString = aString + anotherString.
") Cat;
		opencascade::handle<TCollection_HAsciiString> Cat(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::Center ******/
		/****** md5 signature: 34f7a7b0c8a9c4ce6b8bf5627d28492a ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: char

Return
-------
None

Description
-----------
Modifies this ASCII string so that its length becomes equal to Width and the new characters are equal to Filler. New characters are added both at the beginning and at the end of this string. If Width is less than the length of this ASCII string, nothing happens. Example opencascade::handle<TCollection_HAsciiString> myAlphabet = new TCollection_HAsciiString ('abcdef'); myAlphabet->Center(9,' '); assert ( !strcmp( myAlphabet->ToCString(), ' abcdef ') );.
") Center;
		void Center(const int Width, const char Filler);

		/****** TCollection_HAsciiString::ChangeAll ******/
		/****** md5 signature: 0bbf954c08a729f2c741a09800a2f9e4 ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
aChar: char
NewChar: char
CaseSensitive: bool (optional, default to true)

Return
-------
None

Description
-----------
Replaces all characters equal to aChar by NewChar in this ASCII string. The substitution is case sensitive if CaseSensitive is true (default value). If you do not use the default case sensitive option, it does not matter whether aChar is upper-case or not. Example opencascade::handle<TCollection_HAsciiString> myMistake = new TCollection_HAsciiString ('Hather'); myMistake->ChangeAll('H','F'); assert ( !strcmp( myMistake->ToCString(), 'Father') );.
") ChangeAll;
		void ChangeAll(const char aChar, const char NewChar, const bool CaseSensitive = true);

		/****** TCollection_HAsciiString::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in <self>. This produces an empty HAsciiString.
") Clear;
		void Clear();

		/****** TCollection_HAsciiString::FirstLocationInSet ******/
		/****** md5 signature: 735e840819669297f976aa20faa0f78e ******/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "
Parameters
----------
Set: TCollection_HAsciiString
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of <self> that is present in <Set>. The search begins to the index FromIndex and ends to the the index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 1.
") FirstLocationInSet;
		int FirstLocationInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const int FromIndex, const int ToIndex);

		/****** TCollection_HAsciiString::FirstLocationNotInSet ******/
		/****** md5 signature: 3815feaa1a9b721051432474279e7eed ******/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "
Parameters
----------
Set: TCollection_HAsciiString
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of <self> that is not present in the set <Set>. The search begins to the index FromIndex and ends to the the index ToIndex in <self>. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 3.
") FirstLocationNotInSet;
		int FirstLocationNotInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const int FromIndex, const int ToIndex);

		/****** TCollection_HAsciiString::Insert ******/
		/****** md5 signature: 250ed35cd8f085892f89ca51a206cd1b ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: char

Return
-------
None

Description
-----------
Insert a Character at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'.
") Insert;
		void Insert(const int where, const char what);

		/****** TCollection_HAsciiString::Insert ******/
		/****** md5 signature: 3fbf40bb1fc5957ea35aa4e8f4985b71 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: char *

Return
-------
None

Description
-----------
Insert a HAsciiString at position <where>.
") Insert;
		void Insert(const int where, const char * const what);

		/****** TCollection_HAsciiString::Insert ******/
		/****** md5 signature: d93e62c0e1ce7152a1e20e8d98f5c8ee ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: TCollection_HAsciiString

Return
-------
None

Description
-----------
Insert a HAsciiString at position <where>.
") Insert;
		void Insert(const int where, const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::InsertAfter ******/
		/****** md5 signature: 6ceb872f8debe9572e57002a9357ec68 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
Index: int
other: TCollection_HAsciiString

Return
-------
None

Description
-----------
Inserts the other ASCII string a after a specific index in the string <self> Example: before me = 'cde' , Index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertAfter;
		void InsertAfter(const int Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::InsertBefore ******/
		/****** md5 signature: bcce5fcff132b776b8d7ff2b128f6097 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
other: TCollection_HAsciiString

Return
-------
None

Description
-----------
Inserts the other ASCII string a before a specific index in the string <self> Raises an exception if Index is out of bounds Example: before me = 'cde' , Index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertBefore;
		void InsertBefore(const int Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IntegerValue ******/
		/****** md5 signature: a21ed5e6498eb5350afa935263aed2ac ******/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Converts a HAsciiString containing a numeric expression to an Integer. Example: '215' returns 215.
") IntegerValue;
		int IntegerValue();

		/****** TCollection_HAsciiString::IsAscii ******/
		/****** md5 signature: 0c35a1a20ae1b86ba412a9de8d1dc696 ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains only ASCII characters between ' ' and '~'. This means no control character and no extended ASCII code.
") IsAscii;
		bool IsAscii();

		/****** TCollection_HAsciiString::IsDifferent ******/
		/****** md5 signature: c4769e8fe7de2ca4d08862bb03b00e16 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
S: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Returns True if the string S not contains same characters than the string <self>.
") IsDifferent;
		bool IsDifferent(const opencascade::handle<TCollection_HAsciiString> & S);

		/****** TCollection_HAsciiString::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string <self> contains zero character.
") IsEmpty;
		bool IsEmpty();

		/****** TCollection_HAsciiString::IsGreater ******/
		/****** md5 signature: add275bc8f5ea8fd23920e28349e315f ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Returns True if <self> is 'ASCII' greater than <other>.
") IsGreater;
		bool IsGreater(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IsIntegerValue ******/
		/****** md5 signature: a1e19343fc88858f9baa401fda45e974 ******/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains an integer value.
") IsIntegerValue;
		bool IsIntegerValue();

		/****** TCollection_HAsciiString::IsLess ******/
		/****** md5 signature: d44c74582b44702cce851d385202317d ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Returns True if <self> is 'ASCII' less than <other>.
") IsLess;
		bool IsLess(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IsRealValue ******/
		/****** md5 signature: 8856cdc936c47c65570b6b0c37a68882 ******/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains a real value.
") IsRealValue;
		bool IsRealValue();

		/****** TCollection_HAsciiString::IsSameState ******/
		/****** md5 signature: 98ea852cd326e38b1f70a2bfbbd10060 ******/
		%feature("compactdefaultargs") IsSameState;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HAsciiString

Return
-------
bool

Description
-----------
No available documentation.
") IsSameState;
		bool IsSameState(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IsSameString ******/
		/****** md5 signature: eef9e5758f71445da76df5c182a520ec ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
S: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Returns True if the string S contains same characters than the string <self>.
") IsSameString;
		bool IsSameString(const opencascade::handle<TCollection_HAsciiString> & S);

		/****** TCollection_HAsciiString::IsSameString ******/
		/****** md5 signature: ed41549d9ebee2a8f92eb4f53996cc29 ******/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "
Parameters
----------
S: TCollection_HAsciiString
CaseSensitive: bool

Return
-------
bool

Description
-----------
Returns True if the string S contains same characters than the string <self>.
") IsSameString;
		bool IsSameString(const opencascade::handle<TCollection_HAsciiString> & S, const bool CaseSensitive);

		/****** TCollection_HAsciiString::LeftAdjust ******/
		/****** md5 signature: 2d194519f25a34b81a2aaed2f3fcf7eb ******/
		%feature("compactdefaultargs") LeftAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters in the beginning of the string.
") LeftAdjust;
		void LeftAdjust();

		/****** TCollection_HAsciiString::LeftJustify ******/
		/****** md5 signature: 0bc478e9e245e601f66e5c1c34d73b9d ******/
		%feature("compactdefaultargs") LeftJustify;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: char

Return
-------
None

Description
-----------
Left justify. Length becomes equal to Width and the new characters are equal to Filler if Width < Length nothing happens Raises an exception if Width is less than zero Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = 'abcdef '.
") LeftJustify;
		void LeftJustify(const int Width, const char Filler);

		/****** TCollection_HAsciiString::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. This is the same functionality as 'strlen' in C.
") Length;
		int Length();

		/****** TCollection_HAsciiString::Location ******/
		/****** md5 signature: 4ed77361da0450e33e5b8b8f484ada05 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HAsciiString
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
returns an index in the string <self> of the first occurrence of the string S in the string <self> from the starting index FromIndex to the ending index ToIndex returns zero if failure Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAaAa', S = 'Aa', FromIndex = 1, ToIndex = 7 after me = 'aabAaAa' returns 4.
") Location;
		int Location(const opencascade::handle<TCollection_HAsciiString> & other, const int FromIndex, const int ToIndex);

		/****** TCollection_HAsciiString::Location ******/
		/****** md5 signature: 5f1c4842a80f201fe22dca52be3ded6b ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
N: int
C: char
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns the index of the nth occurrence of the character C in the string <self> from the starting index FromIndex to the ending index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range Example: before me = 'aabAa', N = 3, C = 'a', FromIndex = 1, ToIndex = 5 after me = 'aabAa' returns 5.
") Location;
		int Location(const int N, const char C, const int FromIndex, const int ToIndex);

		/****** TCollection_HAsciiString::LowerCase ******/
		/****** md5 signature: 3a5c616bcb477647273ba31ea4d4dd76 ******/
		%feature("compactdefaultargs") LowerCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts <self> to its lower-case equivalent.
") LowerCase;
		void LowerCase();

		/****** TCollection_HAsciiString::Prepend ******/
		/****** md5 signature: 71edcb8a4aaf67dd7f8a4065c9e6ab32 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HAsciiString

Return
-------
None

Description
-----------
Inserts the other string at the beginning of the string <self> Example: before me = 'cde' , S = 'ab' after me = 'abcde' , S = 'ab'.
") Prepend;
		void Prepend(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::Print ******/
		/****** md5 signature: 0edf3bdce48a694eb17a295e551bde0f ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
astream: Standard_OStream

Description
-----------
Prints this string on the stream <astream>.
") Print;
		void Print(std::ostream &OutValue);

		/****** TCollection_HAsciiString::RealValue ******/
		/****** md5 signature: c2cf21cf42a875e7427474a09b5db0a4 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Converts a string containing a numeric expression to a Real. Example: '215' returns 215.0. '3.14159267' returns 3.14159267.
") RealValue;
		double RealValue();

		/****** TCollection_HAsciiString::Remove ******/
		/****** md5 signature: 2582b68b0121e33b5e319f9593ee0a47 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
where: int
ahowmany: int (optional, default to 1)

Return
-------
None

Description
-----------
Erases <ahowmany> characters from position <where>, <where> included. Example: aString contains 'Hello' aString.Erase(2,2) erases 2 characters from position 1 This gives 'Hlo'.
") Remove;
		void Remove(const int where, const int ahowmany = 1);

		/****** TCollection_HAsciiString::RemoveAll ******/
		/****** md5 signature: 249dba7155b4a2a728ae183c45aeed48 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
C: char
CaseSensitive: bool

Return
-------
None

Description
-----------
Remove all the occurrences of the character C in the string Example: before me = 'HellLLo', C = 'L' , CaseSensitive = True after me = 'Hello'.
") RemoveAll;
		void RemoveAll(const char C, const bool CaseSensitive);

		/****** TCollection_HAsciiString::RemoveAll ******/
		/****** md5 signature: 282fde2c8a5942d44c5e083e8affc936 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
what: char

Return
-------
None

Description
-----------
Removes every <what> characters from <self>.
") RemoveAll;
		void RemoveAll(const char what);

		/****** TCollection_HAsciiString::RightAdjust ******/
		/****** md5 signature: 4ad2bf7860ba51d9ab208488c573dee8 ******/
		%feature("compactdefaultargs") RightAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters at the end of the string.
") RightAdjust;
		void RightAdjust();

		/****** TCollection_HAsciiString::RightJustify ******/
		/****** md5 signature: 4dff12590ee05098cbf89756306e152c ******/
		%feature("compactdefaultargs") RightJustify;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: char

Return
-------
None

Description
-----------
Right justify. Length becomes equal to Width and the new characters are equal to Filler if Width < Length nothing happens Raises an exception if Width is less than zero Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = ' abcdef'.
") RightJustify;
		void RightJustify(const int Width, const char Filler);

		/****** TCollection_HAsciiString::Search ******/
		/****** md5 signature: 344923080557adbcb7b84ff0bd759df6 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
what: char *

Return
-------
int

Description
-----------
Searches a CString in <self> from the beginning and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.Search('le') returns 5.
") Search;
		int Search(const char * const what);

		/****** TCollection_HAsciiString::Search ******/
		/****** md5 signature: f7402d39f8479855f8bf0a02e2161a70 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
what: TCollection_HAsciiString

Return
-------
int

Description
-----------
Searches a String in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.
") Search;
		int Search(const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::SearchFromEnd ******/
		/****** md5 signature: 401270f064456b5edbfb06c15366e605 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
what: char *

Return
-------
int

Description
-----------
Searches a CString in a String from the end and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.SearchFromEnd('le') returns 12.
") SearchFromEnd;
		int SearchFromEnd(const char * const what);

		/****** TCollection_HAsciiString::SearchFromEnd ******/
		/****** md5 signature: ed523871ee6e1c6bf57a1d0ffdf0bd69 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
what: TCollection_HAsciiString

Return
-------
int

Description
-----------
Searches a HAsciiString in another HAsciiString from the end and returns position of first item <what> matching. It returns -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::SetValue ******/
		/****** md5 signature: 13082edf60023d622db76557a57261e7 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: char

Return
-------
None

Description
-----------
Replaces one character in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'.
") SetValue;
		void SetValue(const int where, const char what);

		/****** TCollection_HAsciiString::SetValue ******/
		/****** md5 signature: a60eeec848d3bf376bbdc51a88951aa3 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: char *

Return
-------
None

Description
-----------
Replaces a part of <self> in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'.
") SetValue;
		void SetValue(const int where, const char * const what);

		/****** TCollection_HAsciiString::SetValue ******/
		/****** md5 signature: aadb48924da79b9d471923797aea9b12 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: TCollection_HAsciiString

Return
-------
None

Description
-----------
Replaces a part of <self> by another string.
") SetValue;
		void SetValue(const int where, const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::Split ******/
		/****** md5 signature: 5596bac8c22b63a7fc9165b4ff4053ae ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Splits a HAsciiString into two sub-strings. Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		opencascade::handle<TCollection_HAsciiString> Split(const int where);

		/****** TCollection_HAsciiString::String ******/
		/****** md5 signature: 3d3a11f081a90fcd0e6ea30e33b34432 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the field myString.
") String;
		const TCollection_AsciiString & String();

		/****** TCollection_HAsciiString::SubString ******/
		/****** md5 signature: 0cfaf7053f2678ae8a8cc465eac573a6 ******/
		%feature("compactdefaultargs") SubString;
		%feature("autodoc", "
Parameters
----------
FromIndex: int
ToIndex: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Creation of a sub-string of the string <self>. The sub-string starts to the index Fromindex and ends to the index ToIndex. Raises an exception if ToIndex or FromIndex is out of bounds Example: before me = 'abcdefg', ToIndex=3, FromIndex=6 after me = 'abcdefg' returns 'cdef'.
") SubString;
		opencascade::handle<TCollection_HAsciiString> SubString(const int FromIndex, const int ToIndex);

		/****** TCollection_HAsciiString::ToCString ******/
		/****** md5 signature: ca1b02e9a430434f53322d0f8d55ed6d ******/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns pointer to string (char *) This is useful for some casual manipulations Because this 'char *' is 'const', you can't modify its contents.
") ToCString;
		const char * ToCString();

		/****** TCollection_HAsciiString::Token ******/
		/****** md5 signature: 439cd400c67f298e456fcb11430ed434 ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
separators: char * (optional, default to '\t')
whichone: int (optional, default to 1)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty String. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'.
") Token;
		opencascade::handle<TCollection_HAsciiString> Token(const char * const separators = "\t", const int whichone = 1);

		/****** TCollection_HAsciiString::Trunc ******/
		/****** md5 signature: 65ffeae48b18226417717f33f4e3bf68 ******/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "
Parameters
----------
ahowmany: int

Return
-------
None

Description
-----------
Truncates <self> to <ahowmany> characters. Example: me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'.
") Trunc;
		void Trunc(const int ahowmany);

		/****** TCollection_HAsciiString::UpperCase ******/
		/****** md5 signature: 3f9f21fd1f92b5d0ecce6f762f7738a1 ******/
		%feature("compactdefaultargs") UpperCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts <self> to its upper-case equivalent.
") UpperCase;
		void UpperCase();

		/****** TCollection_HAsciiString::UsefullLength ******/
		/****** md5 signature: 5b817f745c042c76cd9cff64bad6e7bc ******/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Length of the string ignoring all spaces (' ') and the control character at the end.
") UsefullLength;
		int UsefullLength();

		/****** TCollection_HAsciiString::Value ******/
		/****** md5 signature: 476be0199a0da59e27794a0eee392362 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
char

Description
-----------
Returns character at position <where> in <self>. If <where> is less than zero or greater than the length of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'.
") Value;
		char Value(const int where);

};


%make_alias(TCollection_HAsciiString)

%extend TCollection_HAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TCollection_HExtendedString *
************************************/
class TCollection_HExtendedString : public Standard_Transient {
	public:
		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: aa1cd4e7de4b4288f611cd133e7fcb84 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a HExtendedString to an empty ExtendedString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString();

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: cb6c0c62144e902334aa7200bf23d165 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
message: char *

Return
-------
None

Description
-----------
Initializes a HExtendedString with a CString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const char * const message);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: 3c2d489fc61a7eaeb99d378d26fbfbfd ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
message: char16_t *

Return
-------
None

Description
-----------
Initializes a HExtendedString with an ExtString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const char16_t * const message);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: 76d4f4d48a75cffb6ed6ec4bd8bb45a1 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
aChar: char16_t

Return
-------
None

Description
-----------
Initializes a HExtendedString with a single character.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const char16_t aChar);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: f61162fa2940681671ad14904f0a8535 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
length: int
filler: char16_t

Return
-------
None

Description
-----------
Initializes a HExtendedString with <length> space allocated. and filled with <filler>. This is useful for buffers.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const int length, const char16_t filler);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: da8ba001c8df8c7dbb818c52dbf8e2c7 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
aString: str

Return
-------
None

Description
-----------
Initializes a HExtendedString with a ExtendedString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(TCollection_ExtendedString aString);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: ab1073128cdb22935e69377eec67a8cb ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
theString: str

Return
-------
None

Description
-----------
Initializes a HExtendedString with a ExtendedString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(TCollection_ExtendedString & theString);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: af4627abe66bf228b7e542a0d52004e1 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
aString: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initializes a HExtendedString with an HAsciiString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const opencascade::handle<TCollection_HAsciiString> & aString);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: 0d71b66bd8b2c8d5cad87ba3ee0bc564 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
aString: TCollection_HExtendedString

Return
-------
None

Description
-----------
Initializes a HExtendedString with a HExtendedString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const opencascade::handle<TCollection_HExtendedString> & aString);

		/****** TCollection_HExtendedString::AssignCat ******/
		/****** md5 signature: 5637c8b94e0cc150f0bd192ceda3312f ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HExtendedString

Return
-------
None

Description
-----------
Appends <other> to me.
") AssignCat;
		void AssignCat(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::Cat ******/
		/****** md5 signature: 05ff8d0d693749110edd373b865203e0 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HExtendedString

Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns a string appending <other> to me.
") Cat;
		opencascade::handle<TCollection_HExtendedString> Cat(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::ChangeAll ******/
		/****** md5 signature: ff9e3166775d8bdb8d7b4c26d936c5a9 ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
aChar: char16_t
NewChar: char16_t

Return
-------
None

Description
-----------
Substitutes all the characters equal to aChar by NewChar in the string <self>.
") ChangeAll;
		void ChangeAll(const char16_t aChar, const char16_t NewChar);

		/****** TCollection_HExtendedString::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in <self>. This produces an empty ExtendedString.
") Clear;
		void Clear();

		/****** TCollection_HExtendedString::Insert ******/
		/****** md5 signature: fccd9dbfa1104c98b5f304aa547dc188 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: char16_t

Return
-------
None

Description
-----------
Insert a ExtCharacter at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'.
") Insert;
		void Insert(const int where, const char16_t what);

		/****** TCollection_HExtendedString::Insert ******/
		/****** md5 signature: 79721919880e5ce62e4b07ab4be09c38 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: TCollection_HExtendedString

Return
-------
None

Description
-----------
Insert a HExtendedString at position <where>.
") Insert;
		void Insert(const int where, const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::IsAscii ******/
		/****** md5 signature: 0c35a1a20ae1b86ba412a9de8d1dc696 ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains only 'Ascii Range' characters.
") IsAscii;
		bool IsAscii();

		/****** TCollection_HExtendedString::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string <self> contains zero character.
") IsEmpty;
		bool IsEmpty();

		/****** TCollection_HExtendedString::IsGreater ******/
		/****** md5 signature: dfcd4805503af2d42d607ee967e14bfb ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HExtendedString

Return
-------
bool

Description
-----------
Returns True if <self> is greater than <other>.
") IsGreater;
		bool IsGreater(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::IsLess ******/
		/****** md5 signature: 127ba6e462230a0b59738cbea31bbeb2 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HExtendedString

Return
-------
bool

Description
-----------
Returns True if <self> is less than <other>.
") IsLess;
		bool IsLess(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::IsSameState ******/
		/****** md5 signature: 3f57e730a2fac2229269e82bb4225886 ******/
		%feature("compactdefaultargs") IsSameState;
		%feature("autodoc", "
Parameters
----------
other: TCollection_HExtendedString

Return
-------
bool

Description
-----------
No available documentation.
") IsSameState;
		bool IsSameState(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. This is the same functionality as 'strlen' in C.
") Length;
		int Length();

		/****** TCollection_HExtendedString::Print ******/
		/****** md5 signature: 0edf3bdce48a694eb17a295e551bde0f ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
astream: Standard_OStream

Description
-----------
Displays <self>.
") Print;
		void Print(std::ostream &OutValue);

		/****** TCollection_HExtendedString::Remove ******/
		/****** md5 signature: 2582b68b0121e33b5e319f9593ee0a47 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
where: int
ahowmany: int (optional, default to 1)

Return
-------
None

Description
-----------
Erases <ahowmany> characters from position <where>, <where> included. Example: aString contains 'Hello' aString.Erase(2,2) erases 2 characters from position 1 This gives 'Hlo'.
") Remove;
		void Remove(const int where, const int ahowmany = 1);

		/****** TCollection_HExtendedString::RemoveAll ******/
		/****** md5 signature: d010ca000725755d00e86ddc93dd84d2 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
what: char16_t

Return
-------
None

Description
-----------
Removes every <what> characters from <self>.
") RemoveAll;
		void RemoveAll(const char16_t what);

		/****** TCollection_HExtendedString::Search ******/
		/****** md5 signature: 86dbfa061fbc7d77f043b50c8f7eb3fe ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
what: TCollection_HExtendedString

Return
-------
int

Description
-----------
Searches a String in <self> from the beginning and returns position of first item <what> matching. It returns -1 if not found.
") Search;
		int Search(const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::SearchFromEnd ******/
		/****** md5 signature: b8527bea8bcdc22fe921e1628b7ef9c3 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
what: TCollection_HExtendedString

Return
-------
int

Description
-----------
Searches a ExtendedString in another ExtendedString from the end and returns position of first item <what> matching. It returns -1 if not found.
") SearchFromEnd;
		int SearchFromEnd(const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::SetValue ******/
		/****** md5 signature: 9a601720eaf544d744d4bd9397e95c21 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: char16_t

Return
-------
None

Description
-----------
Replaces one character in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'.
") SetValue;
		void SetValue(const int where, const char16_t what);

		/****** TCollection_HExtendedString::SetValue ******/
		/****** md5 signature: 1b8cb0a11b33741784b84ec03e68a98b ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: TCollection_HExtendedString

Return
-------
None

Description
-----------
Replaces a part of <self> by another string.
") SetValue;
		void SetValue(const int where, const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::Split ******/
		/****** md5 signature: 21c888371fe1ce2dc71a9b0458109487 ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Splits a ExtendedString into two sub-strings. Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		opencascade::handle<TCollection_HExtendedString> Split(const int where);

		/****** TCollection_HExtendedString::String ******/
		/****** md5 signature: 6292e02513881910490f8602aa6e4a72 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the field myString.
") String;
		const TCollection_ExtendedString & String();

		/****** TCollection_HExtendedString::ToExtString ******/
		/****** md5 signature: a7e266db6795f9de95e2053ebdb5e433 ******/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Return
-------
char16_t *

Description
-----------
Returns pointer to ExtString.
") ToExtString;
		const char16_t * ToExtString();

		/****** TCollection_HExtendedString::Token ******/
		/****** md5 signature: d725b5001b3b9312b68275bea634d84e ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
separators: char16_t *
whichone: int (optional, default to 1)

Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty String. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'.
") Token;
		opencascade::handle<TCollection_HExtendedString> Token(const char16_t * const separators, const int whichone = 1);

		/****** TCollection_HExtendedString::Trunc ******/
		/****** md5 signature: 65ffeae48b18226417717f33f4e3bf68 ******/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "
Parameters
----------
ahowmany: int

Return
-------
None

Description
-----------
Truncates <self> to <ahowmany> characters. Example: me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'.
") Trunc;
		void Trunc(const int ahowmany);

		/****** TCollection_HExtendedString::Value ******/
		/****** md5 signature: 25c49350b0093568f4b5c14bd7f88233 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
char16_t

Description
-----------
Returns ExtCharacter at position <where> in <self>. If <where> is less than zero or greater than the length of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'.
") Value;
		char16_t Value(const int where);

};


%make_alias(TCollection_HExtendedString)

%extend TCollection_HExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************************
* class equal_to<opencascade::handle<TCollection_HExtendedString>> *
*******************************************************************/
/*****************************************
* class hash<TCollection_ExtendedString> *
*****************************************/
/***************************************************************
* class hash<opencascade::handle<TCollection_HExtendedString>> *
***************************************************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def tcollection_NextPrimeForMap(*args):
	return tcollection.NextPrimeForMap(*args)

@deprecated
def TCollection_AsciiString_EmptyString(*args):
	return TCollection_AsciiString.EmptyString(*args)

@deprecated
def TCollection_AsciiString_IsEqual(*args):
	return TCollection_AsciiString.IsEqual(*args)

@deprecated
def TCollection_AsciiString_IsEqual(*args):
	return TCollection_AsciiString.IsEqual(*args)

@deprecated
def TCollection_AsciiString_IsEqual(*args):
	return TCollection_AsciiString.IsEqual(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_ExtendedString_EmptyString(*args):
	return TCollection_ExtendedString.EmptyString(*args)

@deprecated
def TCollection_ExtendedString_IsEqual(*args):
	return TCollection_ExtendedString.IsEqual(*args)

}
