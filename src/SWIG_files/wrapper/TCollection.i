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
%define TCOLLECTIONDOCSTRING
"TCollection module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_tcollection.html"
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
		/****** md5 signature: 59e2427909b2a24f9e2a1a72698151bc ******/
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
		static Standard_Integer NextPrimeForMap(const Standard_Integer I);

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
		/****** md5 signature: 7c1a066ad1f15d1f9e4970d0cc9d6e4a ******/
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
		/****** md5 signature: 135d18ae23acb187a270b5bebb114495 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
message: str

Return
-------
None

Description
-----------
Initializes a AsciiString with a CString.
") TCollection_AsciiString;
		 TCollection_AsciiString(Standard_CString message);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 0b4a61cbc31c5148ac8c8884319000a8 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
message: str
aLen: int

Return
-------
None

Description
-----------
Initializes a AsciiString with a CString.
") TCollection_AsciiString;
		 TCollection_AsciiString(Standard_CString message, const Standard_Integer aLen);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: c76f9a4d7837e8df9d9d777686c286ad ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_Character

Return
-------
None

Description
-----------
Initializes a AsciiString with a single character.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Character aChar);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: ac8ac9c34e424f0a9f52452a771d440e ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
length: int
filler: Standard_Character

Return
-------
None

Description
-----------
Initializes an AsciiString with <length> space allocated. and filled with <filler>. This is useful for buffers.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Integer length, const Standard_Character filler);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 6ea42193d68d64c66ff9595865d41fa2 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
value: int

Return
-------
None

Description
-----------
Initializes an AsciiString with an integer value.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Integer value);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 40bc8a32fcab9e618bc7d2797312c5fb ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
value: float

Return
-------
None

Description
-----------
Initializes an AsciiString with a real value.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Real value);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: d439edb5fae7d01519169243251c80e0 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
None

Description
-----------
Initializes a AsciiString with another AsciiString.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 867cfae82c6e1128bdc8e781dba235d1 ******/
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
Move constructor.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString & theOther);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 3701982dde49508c3c592490ddafa417 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
astring: str
message: Standard_Character

Return
-------
None

Description
-----------
Initializes a AsciiString with copy of another AsciiString concatenated with the message character.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring, const Standard_Character message);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 44c9f121d97b6fb21cd7dad01b6b7a8c ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
astring: str
message: str

Return
-------
None

Description
-----------
Initializes a AsciiString with copy of another AsciiString concatenated with the message string.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring, Standard_CString message);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: bb44c125f566bd0a6db18f2d65d50b07 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
astring: str
message: str

Return
-------
None

Description
-----------
Initializes a AsciiString with copy of another AsciiString concatenated with the message string.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring, TCollection_AsciiString message);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 31b9469f567d9991529cd4b23f00ac83 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
astring: str
replaceNonAscii: Standard_Character (optional, default to 0)

Return
-------
None

Description
-----------
Creation by converting an extended string to an ascii string. If replaceNonAscii is non-null character, it will be used in place of any non-ascii character found in the source string. Otherwise, creates UTF-8 unicode string.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_ExtendedString astring, const Standard_Character replaceNonAscii = 0);

		/****** TCollection_AsciiString::TCollection_AsciiString ******/
		/****** md5 signature: 46a263c7e61324a58d93619d06999b79 ******/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "
Parameters
----------
theStringUtf: Standard_WideChar *

Return
-------
None

Description
-----------
Initialize UTF-8 Unicode string from wide-char string considering it as Unicode string (the size of wide char is a platform-dependent - e.g. on Windows wchar_t is UTF-16). //! This constructor is unavailable if application is built with deprecated msvc option '-Zc:wchar_t-', since OCCT itself is never built with this option.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_WideChar * theStringUtf);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 032704fd5f4807295e4f5499561766ac ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: Standard_Character

Return
-------
None

Description
-----------
Appends <other> to me. This is an unary operator.
") AssignCat;
		void AssignCat(const Standard_Character other);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 82098ca4ee607bf2ba1a3db82e13f9c3 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: int

Return
-------
None

Description
-----------
Appends <other> to me. This is an unary operator.
") AssignCat;
		void AssignCat(const Standard_Integer other);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 1d503770d54fae31f79d0c21698426d6 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: float

Return
-------
None

Description
-----------
Appends <other> to me. This is an unary operator.
") AssignCat;
		void AssignCat(const Standard_Real other);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 9849afa3e69d6647b6944a08249da1bc ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
None

Description
-----------
Appends <other> to me. This is an unary operator. ex: aString += 'Dummy' To catenate more than one CString, you must put a AsciiString before. Example: aString += 'Hello ' + 'Dolly' IS NOT VALID ! But astring += anotherString + 'Hello ' + 'Dolly' is valid.
") AssignCat;
		void AssignCat(Standard_CString other);

		/****** TCollection_AsciiString::AssignCat ******/
		/****** md5 signature: 12a811c23be8ca554c4c1787ef331f49 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
None

Description
-----------
Appends <other> to me. This is an unary operator. Example: aString += anotherString.
") AssignCat;
		void AssignCat(TCollection_AsciiString other);

		/****** TCollection_AsciiString::Capitalize ******/
		/****** md5 signature: dbcb7ca2711d8c69ac14d5c2510a8e32 ******/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts the first character into its corresponding upper-case character and the other characters into lowercase Example: before me = 'hellO ' after me = 'Hello '.
") Capitalize;
		void Capitalize();

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: 720ec12f6f886119f42cb37656023d33 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: Standard_Character

Return
-------
TCollection_AsciiString

Description
-----------
Appends <other> to me. Syntax: aString = aString + 'Dummy' Example: aString contains 'I say ' aString = aString + 'Hello ' + 'Dolly' gives 'I say Hello Dolly' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(const Standard_Character other);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: 2cedbc07ffcc6a63b8c2c336ba864cda ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: int

Return
-------
TCollection_AsciiString

Description
-----------
Appends <other> to me. Syntax: aString = aString + 15; Example: aString contains 'I say ' gives 'I say 15' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(const Standard_Integer other);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: b2f7915688c3403f36496c45b92a99fd ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: float

Return
-------
TCollection_AsciiString

Description
-----------
Appends <other> to me. Syntax: aString = aString + 15.15; Example: aString contains 'I say ' gives 'I say 15.15' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(const Standard_Real other);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: b73eafb48dc022960f3538e3e917ac4d ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
TCollection_AsciiString

Description
-----------
Appends <other> to me. Syntax: aString = aString + 'Dummy' Example: aString contains 'I say ' aString = aString + 'Hello ' + 'Dolly' gives 'I say Hello Dolly' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(Standard_CString other);

		/****** TCollection_AsciiString::Cat ******/
		/****** md5 signature: d1cb84236f8c7dbaf11738768fd665c5 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
TCollection_AsciiString

Description
-----------
Appends <other> to me. Example: aString = aString + anotherString.
") Cat;
		TCollection_AsciiString Cat(TCollection_AsciiString other);

		/****** TCollection_AsciiString::Center ******/
		/****** md5 signature: 2b5029e050de2f7db9db4538a961c189 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: Standard_Character

Return
-------
None

Description
-----------
Modifies this ASCII string so that its length becomes equal to Width and the new characters are equal to Filler. New characters are added both at the beginning and at the end of this string. If Width is less than the length of this ASCII string, nothing happens. Example TCollection_AsciiString myAlphabet('abcdef'); myAlphabet.Center(9,' '); assert ( myAlphabet == ' abcdef ' );.
") Center;
		void Center(const Standard_Integer Width, const Standard_Character Filler);

		/****** TCollection_AsciiString::ChangeAll ******/
		/****** md5 signature: 2a8248c4e2acd40c1b84a1410fcc9575 ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_Character
NewChar: Standard_Character
CaseSensitive: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Substitutes all the characters equal to aChar by NewChar in the AsciiString <self>. The substitution can be case sensitive. If you don't use default case sensitive, no matter whether aChar is uppercase or not. Example: me = 'Histake' -> ChangeAll('H','M',Standard_True) gives me = 'Mistake'.
") ChangeAll;
		void ChangeAll(const Standard_Character aChar, const Standard_Character NewChar, const Standard_Boolean CaseSensitive = Standard_True);

		/****** TCollection_AsciiString::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in <self>. This produces an empty AsciiString.
") Clear;
		void Clear();

		/****** TCollection_AsciiString::Copy ******/
		/****** md5 signature: 076c372aeb5fe373284a21ffc9742cac ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
fromwhere: str

Return
-------
None

Description
-----------
Copy <fromwhere> to <self>. Used as operator = Example: aString = anotherCString;.
") Copy;
		void Copy(Standard_CString fromwhere);

		/****** TCollection_AsciiString::Copy ******/
		/****** md5 signature: f86e884387420e2c343398e6f0d1e0e6 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
fromwhere: str

Return
-------
None

Description
-----------
Copy <fromwhere> to <self>. Used as operator = Example: aString = anotherString;.
") Copy;
		void Copy(TCollection_AsciiString fromwhere);

		/****** TCollection_AsciiString::EndsWith ******/
		/****** md5 signature: 14b6bb9d2f7c65ed6e9fb15a44705817 ******/
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
") EndsWith;
		Standard_Boolean EndsWith(TCollection_AsciiString theEndString);

		/****** TCollection_AsciiString::FirstLocationInSet ******/
		/****** md5 signature: 95e8a699938630e9f642f2b7637f974c ******/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "
Parameters
----------
Set: str
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of <self> that is present in <Set>. The search begins to the index FromIndex and ends to the the index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 1.
") FirstLocationInSet;
		Standard_Integer FirstLocationInSet(TCollection_AsciiString Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_AsciiString::FirstLocationNotInSet ******/
		/****** md5 signature: cd3e9292963c2e9cbccef2a16bba30d8 ******/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "
Parameters
----------
Set: str
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns the index of the first character of <self> that is not present in the set <Set>. The search begins to the index FromIndex and ends to the the index ToIndex in <self>. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 3.
") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet(TCollection_AsciiString Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_AsciiString::HashCode ******/
		/****** md5 signature: 06b666a7ce1ccd2c4e4b4282e54344e0 ******/
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
		/****** md5 signature: 7904375fda1b58849d10a2c96c86615b ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_Character

Return
-------
None

Description
-----------
Inserts a Character at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'.
") Insert;
		void Insert(const Standard_Integer where, const Standard_Character what);

		/****** TCollection_AsciiString::Insert ******/
		/****** md5 signature: 975088e505e1c924bd1ef576e9371efb ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Inserts a CString at position <where>. Example: aString contains 'O more' aString.Insert(2,'nce'); gives 'Once more'.
") Insert;
		void Insert(const Standard_Integer where, Standard_CString what);

		/****** TCollection_AsciiString::Insert ******/
		/****** md5 signature: 594a8d885f4dcbedf56a6f6f1a4b4fb3 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Inserts a AsciiString at position <where>.
") Insert;
		void Insert(const Standard_Integer where, TCollection_AsciiString what);

		/****** TCollection_AsciiString::InsertAfter ******/
		/****** md5 signature: 54235567163d784600660f2242e1209d ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
Index: int
other: str

Return
-------
None

Description
-----------
Pushing a string after a specific index in the string <self>. Raises an exception if Index is out of bounds. - less than 0 (InsertAfter), or less than 1 (InsertBefore), or - greater than the number of characters in this ASCII string. Example: before me = 'cde' , Index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertAfter;
		void InsertAfter(const Standard_Integer Index, TCollection_AsciiString other);

		/****** TCollection_AsciiString::InsertBefore ******/
		/****** md5 signature: 5a9fdac4a173310f1deb7c408e2944be ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
other: str

Return
-------
None

Description
-----------
Pushing a string before a specific index in the string <self>. Raises an exception if Index is out of bounds. - less than 0 (InsertAfter), or less than 1 (InsertBefore), or - greater than the number of characters in this ASCII string. Example: before me = 'cde' , Index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, TCollection_AsciiString other);

		/****** TCollection_AsciiString::IntegerValue ******/
		/****** md5 signature: a75e1a4c2632a55658f0262c4c2f22c2 ******/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Converts a AsciiString containing a numeric expression to an Integer. Example: '215' returns 215.
") IntegerValue;
		Standard_Integer IntegerValue();

		/****** TCollection_AsciiString::IsAscii ******/
		/****** md5 signature: 6f7276b908dd6009ce0fd19db811821c ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the AsciiString contains only ASCII characters between ' ' and '~'. This means no control character and no extended ASCII code.
") IsAscii;
		Standard_Boolean IsAscii();

		/****** TCollection_AsciiString::IsDifferent ******/
		/****** md5 signature: 4b726ecf99ce8463de5be1dcc91c7b28 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns true if there are differences between the characters in this ASCII string and ASCII string other. Note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(Standard_CString other);

		/****** TCollection_AsciiString::IsDifferent ******/
		/****** md5 signature: 468bebc984675a3b3d0a634f51ab1605 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns true if there are differences between the characters in this ASCII string and ASCII string other. Note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(TCollection_AsciiString other);

		/****** TCollection_AsciiString::IsEmpty ******/
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string <self> contains zero character.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: cd22ecfb81d5c0c734149099758d0061 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns true if the characters in this ASCII string are identical to the characters in ASCII string other. Note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(Standard_CString other);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: 193e634776bafa3e4f441e6722a21399 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns true if the characters in this ASCII string are identical to the characters in ASCII string other. Note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(TCollection_AsciiString other);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: 5a9ec37f0ad7ada730b5d2dffb3c24c7 ******/
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
Returns True when the two strings are the same. (Just for HashCode for AsciiString).
") IsEqual;
		static Standard_Boolean IsEqual(TCollection_AsciiString string1, TCollection_AsciiString string2);

		/****** TCollection_AsciiString::IsEqual ******/
		/****** md5 signature: 7c609f6832978b47418a4e8af7502c2f ******/
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
Returns True when the two strings are the same. (Just for HashCode for AsciiString).
") IsEqual;
		static Standard_Boolean IsEqual(TCollection_AsciiString string1, Standard_CString string2);

		/****** TCollection_AsciiString::IsGreater ******/
		/****** md5 signature: d66794d426c77c31bfa16e28bf61d9a1 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns True if <self> is 'ASCII' greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(Standard_CString other);

		/****** TCollection_AsciiString::IsGreater ******/
		/****** md5 signature: c1f84b8c3d802188b31dd64562f94b92 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns True if <self> is 'ASCII' greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(TCollection_AsciiString other);

		/****** TCollection_AsciiString::IsIntegerValue ******/
		/****** md5 signature: 621b664205e9bc7af1bfe940b363e7dc ******/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the AsciiString contains an integer value. Note: an integer value is considered to be a real value as well.
") IsIntegerValue;
		Standard_Boolean IsIntegerValue();

		/****** TCollection_AsciiString::IsLess ******/
		/****** md5 signature: 20e867e0a6038fba535050dcfb211004 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns True if <self> is 'ASCII' less than <other>.
") IsLess;
		Standard_Boolean IsLess(Standard_CString other);

		/****** TCollection_AsciiString::IsLess ******/
		/****** md5 signature: 8f3421d6aef0b4f85432c3254bb3b2b8 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns True if <self> is 'ASCII' less than <other>.
") IsLess;
		Standard_Boolean IsLess(TCollection_AsciiString other);

		/****** TCollection_AsciiString::IsRealValue ******/
		/****** md5 signature: 3455e68cf132006275afbfe41b3e332b ******/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "
Parameters
----------
theToCheckFull: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Returns True if the AsciiString starts with some characters that can be interpreted as integer or real value. 
Input parameter: theToCheckFull when True, checks if entire string defines a real value;  otherwise checks if string starts with a real value Note: an integer value is considered to be a real value as well.
") IsRealValue;
		Standard_Boolean IsRealValue(Standard_Boolean theToCheckFull = Standard_False);

		/****** TCollection_AsciiString::IsSameString ******/
		/****** md5 signature: c1d604c9c70a25aef5035beb6698a7da ******/
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
") IsSameString;
		static Standard_Boolean IsSameString(TCollection_AsciiString theString1, TCollection_AsciiString theString2, const Standard_Boolean theIsCaseSensitive);

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
		/****** md5 signature: f4c95778466eb547829fbab21c8a7823 ******/
		%feature("compactdefaultargs") LeftJustify;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: Standard_Character

Return
-------
None

Description
-----------
left justify Length becomes equal to Width and the new characters are equal to Filler. If Width < Length nothing happens. Raises an exception if Width is less than zero. Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = 'abcdef '.
") LeftJustify;
		void LeftJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****** TCollection_AsciiString::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. This is the same functionality as 'strlen' in C. Example TCollection_AsciiString myAlphabet('abcdef'); assert ( myAlphabet.Length() == 6 ); - 1 is the position of the first character in this string. - The length of this string gives the position of its last character. - Positions less than or equal to zero, or greater than the length of this string are invalid in functions which identify a character of this string by its position.
") Length;
		Standard_Integer Length();

		/****** TCollection_AsciiString::Location ******/
		/****** md5 signature: b7df9b412181c7ea45c2f5f147569013 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
other: str
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns an index in the string <self> of the first occurrence of the string S in the string <self> from the starting index FromIndex to the ending index ToIndex returns zero if failure Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAaAa', S = 'Aa', FromIndex = 1, ToIndex = 7 after me = 'aabAaAa' returns 4.
") Location;
		Standard_Integer Location(TCollection_AsciiString other, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_AsciiString::Location ******/
		/****** md5 signature: 6bebd5959426436339306c497d79377d ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
N: int
C: Standard_Character
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns the index of the nth occurrence of the character C in the string <self> from the starting index FromIndex to the ending index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAa', N = 3, C = 'a', FromIndex = 1, ToIndex = 5 after me = 'aabAa' returns 5.
") Location;
		Standard_Integer Location(const Standard_Integer N, const Standard_Character C, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_AsciiString::LowerCase ******/
		/****** md5 signature: 3a5c616bcb477647273ba31ea4d4dd76 ******/
		%feature("compactdefaultargs") LowerCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts <self> to its lower-case equivalent. Example TCollection_AsciiString myString('Hello Dolly'); myString.UpperCase(); assert ( myString == 'HELLO DOLLY' ); myString.LowerCase(); assert ( myString == 'hello dolly' );.
") LowerCase;
		void LowerCase();

		/****** TCollection_AsciiString::Prepend ******/
		/****** md5 signature: 1a5269fcdee6cb93b42318d718147b72 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
None

Description
-----------
Inserts the string other at the beginning of this ASCII string. Example TCollection_AsciiString myAlphabet('cde'); TCollection_AsciiString myBegin('ab'); myAlphabet.Prepend(myBegin); assert ( myAlphabet == 'abcde' );.
") Prepend;
		void Prepend(TCollection_AsciiString other);

		/****** TCollection_AsciiString::Print ******/
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
Displays <self> on a stream.
") Print;
		void Print(std::ostream &OutValue);

		/****** TCollection_AsciiString::Read ******/
		/****** md5 signature: e0872b647041ae5015cfaa77802dd596 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
astream: str

Return
-------
None

Description
-----------
Read <self> from a stream.
") Read;
		void Read(std::istream & astream);

		/****** TCollection_AsciiString::RealValue ******/
		/****** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Converts an AsciiString containing a numeric expression. to a Real. Example: ex: '215' returns 215.0. ex: '3.14159267' returns 3.14159267.
") RealValue;
		Standard_Real RealValue();

		/****** TCollection_AsciiString::Remove ******/
		/****** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ******/
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
Erases <ahowmany> characters from position <where>, <where> included. Example: aString contains 'Hello' aString.Remove(2,2) erases 2 characters from position 2 This gives 'Hlo'.
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****** TCollection_AsciiString::RemoveAll ******/
		/****** md5 signature: 17e901953b8ffee8fc2a18f2cc4c7ebe ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
C: Standard_Character
CaseSensitive: bool

Return
-------
None

Description
-----------
Remove all the occurrences of the character C in the string. Example: before me = 'HellLLo', C = 'L' , CaseSensitive = True after me = 'Hello'.
") RemoveAll;
		void RemoveAll(const Standard_Character C, const Standard_Boolean CaseSensitive);

		/****** TCollection_AsciiString::RemoveAll ******/
		/****** md5 signature: e42d8d7a2a77ebc16d192f0c2bf85d1b ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
what: Standard_Character

Return
-------
None

Description
-----------
Removes every <what> characters from <self>.
") RemoveAll;
		void RemoveAll(const Standard_Character what);

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
		/****** md5 signature: a19b8ecc125efa5d7ffd1fc7614c4325 ******/
		%feature("compactdefaultargs") RightJustify;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: Standard_Character

Return
-------
None

Description
-----------
Right justify. Length becomes equal to Width and the new characters are equal to Filler. if Width < Length nothing happens. Raises an exception if Width is less than zero. Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = ' abcdef'.
") RightJustify;
		void RightJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****** TCollection_AsciiString::Search ******/
		/****** md5 signature: ac4c7603fbad57da665e9bcec3af7cc7 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches a CString in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found. Example: aString contains 'Sample single test' aString.Search('le') returns 5.
") Search;
		Standard_Integer Search(Standard_CString what);

		/****** TCollection_AsciiString::Search ******/
		/****** md5 signature: 77f3592dabaaab77a5508c4516e7237d ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches an AsciiString in <self> from the beginning and returns position of first item <what> matching. It returns -1 if not found.
") Search;
		Standard_Integer Search(TCollection_AsciiString what);

		/****** TCollection_AsciiString::SearchFromEnd ******/
		/****** md5 signature: 001f750966fbbafd950bf1f5cadf23d9 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches a CString in a AsciiString from the end and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.SearchFromEnd('le') returns 12.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(Standard_CString what);

		/****** TCollection_AsciiString::SearchFromEnd ******/
		/****** md5 signature: 9cad9172f6139d357df95e50cc4809e0 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches a AsciiString in another AsciiString from the end and returns position of first item <what> matching. It returns -1 if not found.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(TCollection_AsciiString what);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: b8dea7704af78fd9353092eed090171d ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_Character

Return
-------
None

Description
-----------
Replaces one character in the AsciiString at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_Character what);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: 17403469ab86c4473d18ce1ccd74cffd ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Replaces a part of <self> by a CString. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'abcde' aString.SetValue(4,'1234567') gives <self> = 'abc1234567'.
") SetValue;
		void SetValue(const Standard_Integer where, Standard_CString what);

		/****** TCollection_AsciiString::SetValue ******/
		/****** md5 signature: e6cb739e16de0638799cbe91a77da04f ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Replaces a part of <self> by another AsciiString.
") SetValue;
		void SetValue(const Standard_Integer where, TCollection_AsciiString what);

		/****** TCollection_AsciiString::Split ******/
		/****** md5 signature: 678d31683435e0d43e651b472354ee3f ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
TCollection_AsciiString

Description
-----------
Splits a AsciiString into two sub-strings. Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		TCollection_AsciiString Split(const Standard_Integer where);

		/****** TCollection_AsciiString::StartsWith ******/
		/****** md5 signature: 7e4c28c090d6d26b1440e13b4e0900c2 ******/
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
") StartsWith;
		Standard_Boolean StartsWith(TCollection_AsciiString theStartString);

		/****** TCollection_AsciiString::SubString ******/
		/****** md5 signature: df1c60951852a984d8317f5b29c25f99 ******/
		%feature("compactdefaultargs") SubString;
		%feature("autodoc", "
Parameters
----------
FromIndex: int
ToIndex: int

Return
-------
TCollection_AsciiString

Description
-----------
Creation of a sub-string of the string <self>. The sub-string starts to the index Fromindex and ends to the index ToIndex. Raises an exception if ToIndex or FromIndex is out of bounds Example: before me = 'abcdefg', ToIndex=3, FromIndex=6 after me = 'abcdefg' returns 'cdef'.
") SubString;
		TCollection_AsciiString SubString(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

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
Exchange the data of two strings (without reallocating memory).
") Swap;
		void Swap(TCollection_AsciiString & theOther);

		/****** TCollection_AsciiString::ToCString ******/
		/****** md5 signature: a0d55961c9252eb810c558f8e4ab10b4 ******/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns pointer to AsciiString (char *). This is useful for some casual manipulations. Warning: Because this 'char *' is 'const', you can't modify its contents.
") ToCString;
		Standard_CString ToCString();

		/****** TCollection_AsciiString::Token ******/
		/****** md5 signature: 5c85538c5fc09bfcc1992f1c8c5c9d18 ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
separators: str (optional, default to '\t')
whichone: int (optional, default to 1)

Return
-------
TCollection_AsciiString

Description
-----------
Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns empty AsciiString. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed: aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'.
") Token;
		TCollection_AsciiString Token(Standard_CString separators = "\t", const Standard_Integer whichone = 1);

		/****** TCollection_AsciiString::Trunc ******/
		/****** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ******/
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
		void Trunc(const Standard_Integer ahowmany);

		/****** TCollection_AsciiString::UpperCase ******/
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

		/****** TCollection_AsciiString::UsefullLength ******/
		/****** md5 signature: 2e944cc63721a567e24c1ac662acad02 ******/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Length of the string ignoring all spaces (' ') and the control character at the end.
") UsefullLength;
		Standard_Integer UsefullLength();

		/****** TCollection_AsciiString::Value ******/
		/****** md5 signature: b790c256d0e62b0d42a4819aca4e63bb ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
Standard_Character

Description
-----------
Returns character at position <where> in <self>. If <where> is less than zero or greater than the length of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'.
") Value;
		Standard_Character Value(const Standard_Integer where);


%extend{
    bool __ne_wrapper__(const Standard_CString other) {
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
		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: d5bb55766727226dfadc22de4706ab2a ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
other: Standard_Character

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const Standard_Character other);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: ce587a3765bf01a8a5fb2cf57f472a22 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
other: int

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const Standard_Integer other);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: 3c8c13ccafb8668627344ec87cd5b479 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
other: float

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(const Standard_Real other);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: 790b5fbf345a3e3b433d884b2db4419b ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(Standard_CString other);

		/****** TCollection_AsciiString::operator + ******/
		/****** md5 signature: d6838314a8c2c0a320cde4fcaee86022 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") operator +;
		TCollection_AsciiString operator +(TCollection_AsciiString other);


%extend{
    void __iadd_wrapper__(const Standard_Character other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const Standard_Integer other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const Standard_Real other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}

%extend{
    void __iadd_wrapper__(const Standard_CString other) {
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
    bool __eq_wrapper__(const Standard_CString other) {
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
};


%extend TCollection_AsciiString {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Move(self):
		pass
	}
};

/***********************************
* class TCollection_ExtendedString *
***********************************/
class TCollection_ExtendedString {
	public:
		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 27102535163506884d25905a079f37f1 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a ExtendedString to an empty ExtendedString.
") TCollection_ExtendedString;
		 TCollection_ExtendedString();

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: bd5a30053ae1dbb206e1f145f51b3c92 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
astring: str
isMultiByte: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creation by converting a CString to an extended string. If <isMultiByte> is true then the string is treated as having UTF-8 coding. If it is not a UTF-8 then <isMultiByte> is ignored and each character is copied to ExtCharacter.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(Standard_CString astring, const Standard_Boolean isMultiByte = Standard_False);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 32794e06c591ca0c74dea31f9c707296 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
astring: Standard_ExtString

Return
-------
None

Description
-----------
Creation by converting an ExtString to an extended string.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_ExtString astring);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 7f6b85e67c819db3a403bc17c88ad949 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
theStringUtf: Standard_WideChar *

Return
-------
None

Description
-----------
Initialize from wide-char string considering it as Unicode string (the size of wide char is a platform-dependent - e.g. on Windows wchar_t is UTF-16). //! This constructor is unavailable if application is built with deprecated msvc option '-Zc:wchar_t-', since OCCT itself is never built with this option.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_WideChar * theStringUtf);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: cc2b0c05298704aee786df35f7261b14 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_Character

Return
-------
None

Description
-----------
Initializes a AsciiString with a single character.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Character aChar);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 68e5cee6b4d106d05772773b1168d89e ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_ExtCharacter

Return
-------
None

Description
-----------
Initializes a ExtendedString with a single character.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_ExtCharacter aChar);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 6c2cc4cdc61a1ef1008d283b6ba53866 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
length: int
filler: Standard_ExtCharacter

Return
-------
None

Description
-----------
Initializes a ExtendedString with <length> space allocated. and filled with <filler>.This is useful for buffers.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Integer length, const Standard_ExtCharacter filler);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 6c0d043a8729c73f242cc59cd1d63afb ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
value: int

Return
-------
None

Description
-----------
Initializes an ExtendedString with an integer value.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Integer value);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 43bfa72a1bf715d78f22a5f919221f12 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
value: float

Return
-------
None

Description
-----------
Initializes an ExtendedString with a real value.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Real value);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 1208eb30d755fd6ea0110b6d3fd2b183 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
None

Description
-----------
Initializes a ExtendedString with another ExtendedString.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_ExtendedString astring);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 696d0585a11ad0b287ebc6ba57bac634 ******/
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
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_ExtendedString & theOther);

		/****** TCollection_ExtendedString::TCollection_ExtendedString ******/
		/****** md5 signature: 65128c52391eef873746fec9d8584835 ******/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "
Parameters
----------
astring: str
isMultiByte: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creation by converting an Ascii string to an extended string. The string is treated as having UTF-8 coding. If it is not a UTF-8 or multi byte then each character is copied to ExtCharacter.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_AsciiString astring, const Standard_Boolean isMultiByte = Standard_True);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: 290473b12be80aeece2f43cf57b4b8c9 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
None

Description
-----------
Appends the other extended string to this extended string. Note that this method is an alias of operator +=. Example: aString += anotherString.
") AssignCat;
		void AssignCat(TCollection_ExtendedString other);

		/****** TCollection_ExtendedString::AssignCat ******/
		/****** md5 signature: af9511f20ca65b8d1031666c6ec91c33 ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
theChar: Standard_Utf16Char

Return
-------
None

Description
-----------
Appends the utf16 char to this extended string.
") AssignCat;
		void AssignCat(const Standard_Utf16Char theChar);

		/****** TCollection_ExtendedString::Cat ******/
		/****** md5 signature: ef439e4a817d99d3aad10416eb41fa81 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
TCollection_ExtendedString

Description
-----------
Appends <other> to me.
") Cat;
		TCollection_ExtendedString Cat(TCollection_ExtendedString other);

		/****** TCollection_ExtendedString::ChangeAll ******/
		/****** md5 signature: 172cbf77fdcbc202d23ddaed833764da ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_ExtCharacter
NewChar: Standard_ExtCharacter

Return
-------
None

Description
-----------
Substitutes all the characters equal to aChar by NewChar in the ExtendedString <self>. The substitution can be case sensitive. If you don't use default case sensitive, no matter whether aChar is uppercase or not.
") ChangeAll;
		void ChangeAll(const Standard_ExtCharacter aChar, const Standard_ExtCharacter NewChar);

		/****** TCollection_ExtendedString::Clear ******/
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

		/****** TCollection_ExtendedString::Copy ******/
		/****** md5 signature: 8773a536f9febb95c2bccfdbe6e610ae ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
fromwhere: str

Return
-------
None

Description
-----------
Copy <fromwhere> to <self>. Used as operator =.
") Copy;
		void Copy(TCollection_ExtendedString fromwhere);

		/****** TCollection_ExtendedString::EndsWith ******/
		/****** md5 signature: 9634325ac41bffcbae04aa4d3f34465a ******/
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
") EndsWith;
		Standard_Boolean EndsWith(TCollection_ExtendedString theEndString);

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
		/****** md5 signature: 0697ac1ff05f55e6371b2412e6df94e9 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_ExtCharacter

Return
-------
None

Description
-----------
Insert a Character at position <where>.
") Insert;
		void Insert(const Standard_Integer where, const Standard_ExtCharacter what);

		/****** TCollection_ExtendedString::Insert ******/
		/****** md5 signature: 18ac3037701ab2ccec185b0b11df82af ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Insert a ExtendedString at position <where>.
") Insert;
		void Insert(const Standard_Integer where, TCollection_ExtendedString what);

		/****** TCollection_ExtendedString::IsAscii ******/
		/****** md5 signature: 6f7276b908dd6009ce0fd19db811821c ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the ExtendedString contains only 'Ascii Range' characters .
") IsAscii;
		Standard_Boolean IsAscii();

		/****** TCollection_ExtendedString::IsDifferent ******/
		/****** md5 signature: 85820fc5baf078b8dcd01fc694db8b77 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
other: Standard_ExtString

Return
-------
bool

Description
-----------
Returns true if there are differences between the characters in this extended string and the other extended string. Note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(const Standard_ExtString other);

		/****** TCollection_ExtendedString::IsDifferent ******/
		/****** md5 signature: 55bde9d27641e44b784f8d27abefd706 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns true if there are differences between the characters in this extended string and the other extended string. Note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(TCollection_ExtendedString other);

		/****** TCollection_ExtendedString::IsEmpty ******/
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this string contains no characters.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TCollection_ExtendedString::IsEqual ******/
		/****** md5 signature: 0948071158d76df9b23db2fee8d75cc1 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
other: Standard_ExtString

Return
-------
bool

Description
-----------
Returns true if the characters in this extended string are identical to the characters in the other extended string. Note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(const Standard_ExtString other);

		/****** TCollection_ExtendedString::IsEqual ******/
		/****** md5 signature: e74fc8048162da7ae830426f88d4674a ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns true if the characters in this extended string are identical to the characters in the other extended string. Note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(TCollection_ExtendedString other);

		/****** TCollection_ExtendedString::IsEqual ******/
		/****** md5 signature: 129ad9f997bed3d3858413785264e2f1 ******/
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
") IsEqual;
		static Standard_Boolean IsEqual(TCollection_ExtendedString theString1, TCollection_ExtendedString theString2);

		/****** TCollection_ExtendedString::IsGreater ******/
		/****** md5 signature: 5cf9ca773a20caca0e06fa958481d2e9 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
other: Standard_ExtString

Return
-------
bool

Description
-----------
Returns True if <self> is greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(const Standard_ExtString other);

		/****** TCollection_ExtendedString::IsGreater ******/
		/****** md5 signature: c99a8ff1d9d77dc4570bd04b0bea2dbd ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns True if <self> is greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(TCollection_ExtendedString other);

		/****** TCollection_ExtendedString::IsLess ******/
		/****** md5 signature: c2cee3699b5b2477e673c526cc7fc7c3 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
other: Standard_ExtString

Return
-------
bool

Description
-----------
Returns True if <self> is less than <other>.
") IsLess;
		Standard_Boolean IsLess(const Standard_ExtString other);

		/****** TCollection_ExtendedString::IsLess ******/
		/****** md5 signature: 491f62fe2776ecedc0b150364f213844 ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
bool

Description
-----------
Returns True if <self> is less than <other>.
") IsLess;
		Standard_Boolean IsLess(TCollection_ExtendedString other);

		/****** TCollection_ExtendedString::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 16-bit code units (might be greater than number of Unicode symbols if string contains surrogate pairs).
") Length;
		Standard_Integer Length();

		/****** TCollection_ExtendedString::LengthOfCString ******/
		/****** md5 signature: 75029f9cff091c3704fc23603e5a8747 ******/
		%feature("compactdefaultargs") LengthOfCString;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns expected CString length in UTF8 coding. It can be used for memory calculation before converting to CString containing symbols in UTF8 coding.
") LengthOfCString;
		Standard_Integer LengthOfCString();

		/****** TCollection_ExtendedString::Print ******/
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
Displays <self> .
") Print;
		void Print(std::ostream &OutValue);

		/****** TCollection_ExtendedString::Remove ******/
		/****** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ******/
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
Erases <ahowmany> characters from position <where>,<where> included.
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****** TCollection_ExtendedString::RemoveAll ******/
		/****** md5 signature: 5cc33317c91574b4016e3809c2016af5 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
what: Standard_ExtCharacter

Return
-------
None

Description
-----------
Removes every <what> characters from <self>.
") RemoveAll;
		void RemoveAll(const Standard_ExtCharacter what);

		/****** TCollection_ExtendedString::Search ******/
		/****** md5 signature: d150c7899dddb9851aae66427055ccb1 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches a ExtendedString in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.
") Search;
		Standard_Integer Search(TCollection_ExtendedString what);

		/****** TCollection_ExtendedString::SearchFromEnd ******/
		/****** md5 signature: b2afedfb1f65543f0e0888d888f00218 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches a ExtendedString in another ExtendedString from the end and returns position of first item <what> matching. it returns -1 if not found.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(TCollection_ExtendedString what);

		/****** TCollection_ExtendedString::SetValue ******/
		/****** md5 signature: 294924c31fc292e1cf9eb136f9d9d649 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_ExtCharacter

Return
-------
None

Description
-----------
Replaces one character in the ExtendedString at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_ExtCharacter what);

		/****** TCollection_ExtendedString::SetValue ******/
		/****** md5 signature: c23c311484c9786eb0014421a03f2613 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Replaces a part of <self> by another ExtendedString see above.
") SetValue;
		void SetValue(const Standard_Integer where, TCollection_ExtendedString what);

		/****** TCollection_ExtendedString::Split ******/
		/****** md5 signature: 8268b04610407501d58f674f1e5d1fef ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
TCollection_ExtendedString

Description
-----------
Splits this extended string into two sub-strings at position where. - The second sub-string (from position where + 1 of this string to the end) is returned in a new extended string. - this extended string is modified: its last characters are removed, it becomes equal to the first sub-string (from the first character to position where). Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		TCollection_ExtendedString Split(const Standard_Integer where);

		/****** TCollection_ExtendedString::StartsWith ******/
		/****** md5 signature: 88523a02c5928156555a2a31a298bd45 ******/
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
") StartsWith;
		Standard_Boolean StartsWith(TCollection_ExtendedString theStartString);

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
Exchange the data of two strings (without reallocating memory).
") Swap;
		void Swap(TCollection_ExtendedString & theOther);

		/****** TCollection_ExtendedString::ToExtString ******/
		/****** md5 signature: 3e9c425364178122dc4b3879f484e9f4 ******/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
Returns pointer to ExtString.
") ToExtString;
		Standard_ExtString ToExtString();

		/****** TCollection_ExtendedString::ToUTF8CString ******/
		/****** md5 signature: 0eb66f1d867ef44952405f1e528bf885 ******/
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
Converts the internal <mystring> to UTF8 coding and returns length of the out CString. A memory for the <theCString> should be allocated before call!.
") ToUTF8CString;
		Standard_Integer ToUTF8CString(Standard_PCharacter & theCString);

		/****** TCollection_ExtendedString::Token ******/
		/****** md5 signature: d07bb65947d1f126db0ef4323c24fe8d ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
separators: Standard_ExtString
whichone: int (optional, default to 1)

Return
-------
TCollection_ExtendedString

Description
-----------
Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty AsciiString. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed: aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'.
") Token;
		TCollection_ExtendedString Token(const Standard_ExtString separators, const Standard_Integer whichone = 1);

		/****** TCollection_ExtendedString::Trunc ******/
		/****** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ******/
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
Truncates <self> to <ahowmany> characters. Example: me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel' Exceptions Standard_OutOfRange if ahowmany is greater than the length of this string.
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****** TCollection_ExtendedString::Value ******/
		/****** md5 signature: 84bd4561d49bb9835b6ef809ad6dbc29 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
Standard_ExtCharacter

Description
-----------
Returns character at position <where> in <self>. If <where> is less than zero or greater than the length of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e' Exceptions Standard_OutOfRange if where lies outside the bounds of this extended string.
") Value;
		Standard_ExtCharacter Value(const Standard_Integer where);


%extend{
    bool __ne_wrapper__(const Standard_ExtString other) {
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
		/****** md5 signature: bc40c1386a156b1db27b30eaa95a0f95 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") operator +;
		TCollection_ExtendedString operator +(TCollection_ExtendedString other);


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
    bool __eq_wrapper__(const Standard_ExtString other) {
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
		/****** md5 signature: 5c051822068be398edd1f9fc8c62076b ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
message: str

Return
-------
None

Description
-----------
Initializes a HAsciiString with a CString.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(Standard_CString message);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 42a7090e4a24c83fdcfa907627bbb5ed ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_Character

Return
-------
None

Description
-----------
Initializes a HAsciiString with a single character.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Character aChar);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 419f459f843ebb6ff828fa694e5714af ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
length: int
filler: Standard_Character

Return
-------
None

Description
-----------
Initializes a HAsciiString with <length> space allocated. and filled with <filler>.This is useful for buffers.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Integer length, const Standard_Character filler);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 046267dac0cd24016563517459b0dfe1 ******/
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
		 TCollection_HAsciiString(const Standard_Integer value);

		/****** TCollection_HAsciiString::TCollection_HAsciiString ******/
		/****** md5 signature: 71aa4ea7cf1fef0bd71cbeb603b0d4ea ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
value: float

Return
-------
None

Description
-----------
Initializes a HAsciiString with a real value.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Real value);

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
		/****** md5 signature: 2d2c9cf505fe6268a2d3ca5bb9f0df5c ******/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "
Parameters
----------
aString: TCollection_HExtendedString
replaceNonAscii: Standard_Character

Return
-------
None

Description
-----------
Initializes a HAsciiString with a HExtendedString. If replaceNonAscii is non-null character, it will be used in place of any non-ascii character found in the source string. Otherwise, creates UTF-8 unicode string.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const opencascade::handle<TCollection_HExtendedString> & aString, const Standard_Character replaceNonAscii);

		/****** TCollection_HAsciiString::AssignCat ******/
		/****** md5 signature: 9849afa3e69d6647b6944a08249da1bc ******/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
None

Description
-----------
Appends <other> to me.
") AssignCat;
		void AssignCat(Standard_CString other);

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
		/****** md5 signature: 1a32e5ecba107c7d2923cf6aeb77d8e7 ******/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "
Parameters
----------
other: str

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Creates a new string by concatenation of this ASCII string and the other ASCII string. Example: aString = aString + anotherString aString = aString + 'Dummy' aString contains 'I say ' aString = aString + 'Hello ' + 'Dolly' gives 'I say Hello Dolly' Warning: To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.
") Cat;
		opencascade::handle<TCollection_HAsciiString> Cat(Standard_CString other);

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
		/****** md5 signature: 2b5029e050de2f7db9db4538a961c189 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: Standard_Character

Return
-------
None

Description
-----------
Modifies this ASCII string so that its length becomes equal to Width and the new characters are equal to Filler. New characters are added both at the beginning and at the end of this string. If Width is less than the length of this ASCII string, nothing happens. Example opencascade::handle<TCollection_HAsciiString> myAlphabet = new TCollection_HAsciiString ('abcdef'); myAlphabet->Center(9,' '); assert ( !strcmp( myAlphabet->ToCString(), ' abcdef ') );.
") Center;
		void Center(const Standard_Integer Width, const Standard_Character Filler);

		/****** TCollection_HAsciiString::ChangeAll ******/
		/****** md5 signature: 2a8248c4e2acd40c1b84a1410fcc9575 ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_Character
NewChar: Standard_Character
CaseSensitive: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Replaces all characters equal to aChar by NewChar in this ASCII string. The substitution is case sensitive if CaseSensitive is true (default value). If you do not use the default case sensitive option, it does not matter whether aChar is upper-case or not. Example opencascade::handle<TCollection_HAsciiString> myMistake = new TCollection_HAsciiString ('Hather'); myMistake->ChangeAll('H','F'); assert ( !strcmp( myMistake->ToCString(), 'Father') );.
") ChangeAll;
		void ChangeAll(const Standard_Character aChar, const Standard_Character NewChar, const Standard_Boolean CaseSensitive = Standard_True);

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
		/****** md5 signature: c02512a97e6b5263176ba2ccfa8ed105 ******/
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
		Standard_Integer FirstLocationInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_HAsciiString::FirstLocationNotInSet ******/
		/****** md5 signature: 1d236c8f681402c58697cd92d97cec88 ******/
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
		Standard_Integer FirstLocationNotInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_HAsciiString::Insert ******/
		/****** md5 signature: 7904375fda1b58849d10a2c96c86615b ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_Character

Return
-------
None

Description
-----------
Insert a Character at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'.
") Insert;
		void Insert(const Standard_Integer where, const Standard_Character what);

		/****** TCollection_HAsciiString::Insert ******/
		/****** md5 signature: 975088e505e1c924bd1ef576e9371efb ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Insert a HAsciiString at position <where>.
") Insert;
		void Insert(const Standard_Integer where, Standard_CString what);

		/****** TCollection_HAsciiString::Insert ******/
		/****** md5 signature: 00bce82236f786524084c18458d05a52 ******/
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
		void Insert(const Standard_Integer where, const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::InsertAfter ******/
		/****** md5 signature: aea8d1d7782af5dc2ffad7d3e4877597 ******/
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
		void InsertAfter(const Standard_Integer Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::InsertBefore ******/
		/****** md5 signature: 0f11aa0b72d04726b6caba4ebdae9573 ******/
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
		void InsertBefore(const Standard_Integer Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IntegerValue ******/
		/****** md5 signature: a75e1a4c2632a55658f0262c4c2f22c2 ******/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Converts a HAsciiString containing a numeric expression to an Integer. Example: '215' returns 215.
") IntegerValue;
		Standard_Integer IntegerValue();

		/****** TCollection_HAsciiString::IsAscii ******/
		/****** md5 signature: 6f7276b908dd6009ce0fd19db811821c ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains only ASCII characters between ' ' and '~'. This means no control character and no extended ASCII code.
") IsAscii;
		Standard_Boolean IsAscii();

		/****** TCollection_HAsciiString::IsDifferent ******/
		/****** md5 signature: bdd599f7df06fe89322d4df55fc97f48 ******/
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
		Standard_Boolean IsDifferent(const opencascade::handle<TCollection_HAsciiString> & S);

		/****** TCollection_HAsciiString::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string <self> contains zero character.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TCollection_HAsciiString::IsGreater ******/
		/****** md5 signature: c802c1ef92d5d1701deb1b2bb76c0333 ******/
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
		Standard_Boolean IsGreater(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IsIntegerValue ******/
		/****** md5 signature: 621b664205e9bc7af1bfe940b363e7dc ******/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains an integer value.
") IsIntegerValue;
		Standard_Boolean IsIntegerValue();

		/****** TCollection_HAsciiString::IsLess ******/
		/****** md5 signature: a0f0427c44af86d5d93e5b00594e059f ******/
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
		Standard_Boolean IsLess(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IsRealValue ******/
		/****** md5 signature: 37730896bf853986942d4303fcf722e6 ******/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains a real value.
") IsRealValue;
		Standard_Boolean IsRealValue();

		/****** TCollection_HAsciiString::IsSameState ******/
		/****** md5 signature: 8d2d9199bf4b65dbd08ac3a28565efa2 ******/
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
		Standard_Boolean IsSameState(const opencascade::handle<TCollection_HAsciiString> & other);

		/****** TCollection_HAsciiString::IsSameString ******/
		/****** md5 signature: 31e0f4aa2fde5b3568bba91f4d19c228 ******/
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
		Standard_Boolean IsSameString(const opencascade::handle<TCollection_HAsciiString> & S);

		/****** TCollection_HAsciiString::IsSameString ******/
		/****** md5 signature: cde47ee814606ec044bae1596146a012 ******/
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
		Standard_Boolean IsSameString(const opencascade::handle<TCollection_HAsciiString> & S, const Standard_Boolean CaseSensitive);

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
		/****** md5 signature: f4c95778466eb547829fbab21c8a7823 ******/
		%feature("compactdefaultargs") LeftJustify;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: Standard_Character

Return
-------
None

Description
-----------
Left justify. Length becomes equal to Width and the new characters are equal to Filler if Width < Length nothing happens Raises an exception if Width is less than zero Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = 'abcdef '.
") LeftJustify;
		void LeftJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****** TCollection_HAsciiString::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. This is the same functionality as 'strlen' in C.
") Length;
		Standard_Integer Length();

		/****** TCollection_HAsciiString::Location ******/
		/****** md5 signature: 557d6cdb6bdb38582292298f38e087e8 ******/
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
		Standard_Integer Location(const opencascade::handle<TCollection_HAsciiString> & other, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_HAsciiString::Location ******/
		/****** md5 signature: 6bebd5959426436339306c497d79377d ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
N: int
C: Standard_Character
FromIndex: int
ToIndex: int

Return
-------
int

Description
-----------
Returns the index of the nth occurrence of the character C in the string <self> from the starting index FromIndex to the ending index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range Example: before me = 'aabAa', N = 3, C = 'a', FromIndex = 1, ToIndex = 5 after me = 'aabAa' returns 5.
") Location;
		Standard_Integer Location(const Standard_Integer N, const Standard_Character C, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

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
		/****** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Converts a string containing a numeric expression to a Real. Example: '215' returns 215.0. '3.14159267' returns 3.14159267.
") RealValue;
		Standard_Real RealValue();

		/****** TCollection_HAsciiString::Remove ******/
		/****** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ******/
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
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****** TCollection_HAsciiString::RemoveAll ******/
		/****** md5 signature: 17e901953b8ffee8fc2a18f2cc4c7ebe ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
C: Standard_Character
CaseSensitive: bool

Return
-------
None

Description
-----------
Remove all the occurrences of the character C in the string Example: before me = 'HellLLo', C = 'L' , CaseSensitive = True after me = 'Hello'.
") RemoveAll;
		void RemoveAll(const Standard_Character C, const Standard_Boolean CaseSensitive);

		/****** TCollection_HAsciiString::RemoveAll ******/
		/****** md5 signature: e42d8d7a2a77ebc16d192f0c2bf85d1b ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
what: Standard_Character

Return
-------
None

Description
-----------
Removes every <what> characters from <self>.
") RemoveAll;
		void RemoveAll(const Standard_Character what);

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
		/****** md5 signature: a19b8ecc125efa5d7ffd1fc7614c4325 ******/
		%feature("compactdefaultargs") RightJustify;
		%feature("autodoc", "
Parameters
----------
Width: int
Filler: Standard_Character

Return
-------
None

Description
-----------
Right justify. Length becomes equal to Width and the new characters are equal to Filler if Width < Length nothing happens Raises an exception if Width is less than zero Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = ' abcdef'.
") RightJustify;
		void RightJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****** TCollection_HAsciiString::Search ******/
		/****** md5 signature: ac4c7603fbad57da665e9bcec3af7cc7 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches a CString in <self> from the beginning and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.Search('le') returns 5.
") Search;
		Standard_Integer Search(Standard_CString what);

		/****** TCollection_HAsciiString::Search ******/
		/****** md5 signature: b859c53f977f80fe95a3c9f5dd92d975 ******/
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
		Standard_Integer Search(const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::SearchFromEnd ******/
		/****** md5 signature: 001f750966fbbafd950bf1f5cadf23d9 ******/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "
Parameters
----------
what: str

Return
-------
int

Description
-----------
Searches a CString in a String from the end and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.SearchFromEnd('le') returns 12.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(Standard_CString what);

		/****** TCollection_HAsciiString::SearchFromEnd ******/
		/****** md5 signature: 26ef5632859c306517edacf175ffeb25 ******/
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
		Standard_Integer SearchFromEnd(const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::SetValue ******/
		/****** md5 signature: b8dea7704af78fd9353092eed090171d ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_Character

Return
-------
None

Description
-----------
Replaces one character in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_Character what);

		/****** TCollection_HAsciiString::SetValue ******/
		/****** md5 signature: 17403469ab86c4473d18ce1ccd74cffd ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: str

Return
-------
None

Description
-----------
Replaces a part of <self> in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, Standard_CString what);

		/****** TCollection_HAsciiString::SetValue ******/
		/****** md5 signature: 93f546312ca5b5eebe8fa91a70ccccf5 ******/
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
		void SetValue(const Standard_Integer where, const opencascade::handle<TCollection_HAsciiString> & what);

		/****** TCollection_HAsciiString::Split ******/
		/****** md5 signature: 246f2100beead6e322fa3e01d01f3249 ******/
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
		opencascade::handle<TCollection_HAsciiString> Split(const Standard_Integer where);

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
		/****** md5 signature: dfea99c46584cf4a3f0555ff87ebb4c5 ******/
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
		opencascade::handle<TCollection_HAsciiString> SubString(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****** TCollection_HAsciiString::ToCString ******/
		/****** md5 signature: a0d55961c9252eb810c558f8e4ab10b4 ******/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns pointer to string (char *) This is useful for some casual manipulations Because this 'char *' is 'const', you can't modify its contents.
") ToCString;
		Standard_CString ToCString();

		/****** TCollection_HAsciiString::Token ******/
		/****** md5 signature: 550b5c901eb3be27661f560e4facc9c6 ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
separators: str (optional, default to '\t')
whichone: int (optional, default to 1)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty String. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'.
") Token;
		opencascade::handle<TCollection_HAsciiString> Token(Standard_CString separators = "\t", const Standard_Integer whichone = 1);

		/****** TCollection_HAsciiString::Trunc ******/
		/****** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ******/
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
		void Trunc(const Standard_Integer ahowmany);

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
		/****** md5 signature: 2e944cc63721a567e24c1ac662acad02 ******/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Length of the string ignoring all spaces (' ') and the control character at the end.
") UsefullLength;
		Standard_Integer UsefullLength();

		/****** TCollection_HAsciiString::Value ******/
		/****** md5 signature: b790c256d0e62b0d42a4819aca4e63bb ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
Standard_Character

Description
-----------
Returns character at position <where> in <self>. If <where> is less than zero or greater than the length of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'.
") Value;
		Standard_Character Value(const Standard_Integer where);

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
		/****** md5 signature: 8228eca5bb51d9cd2f9683d75a3a9574 ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
message: str

Return
-------
None

Description
-----------
Initializes a HExtendedString with a CString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(Standard_CString message);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: de855a681a7f55677c0fc072b8c7b2cb ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
message: Standard_ExtString

Return
-------
None

Description
-----------
Initializes a HExtendedString with an ExtString.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_ExtString message);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: acdb106688ab40fd7e0ba67b1d61076e ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_ExtCharacter

Return
-------
None

Description
-----------
Initializes a HExtendedString with a single character.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_ExtCharacter aChar);

		/****** TCollection_HExtendedString::TCollection_HExtendedString ******/
		/****** md5 signature: 2296e03682630049aa1941ff334aa49d ******/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "
Parameters
----------
length: int
filler: Standard_ExtCharacter

Return
-------
None

Description
-----------
Initializes a HExtendedString with <length> space allocated. and filled with <filler>. This is useful for buffers.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_Integer length, const Standard_ExtCharacter filler);

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
		/****** md5 signature: 172cbf77fdcbc202d23ddaed833764da ******/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "
Parameters
----------
aChar: Standard_ExtCharacter
NewChar: Standard_ExtCharacter

Return
-------
None

Description
-----------
Substitutes all the characters equal to aChar by NewChar in the string <self>.
") ChangeAll;
		void ChangeAll(const Standard_ExtCharacter aChar, const Standard_ExtCharacter NewChar);

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
		/****** md5 signature: 0697ac1ff05f55e6371b2412e6df94e9 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_ExtCharacter

Return
-------
None

Description
-----------
Insert a ExtCharacter at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'.
") Insert;
		void Insert(const Standard_Integer where, const Standard_ExtCharacter what);

		/****** TCollection_HExtendedString::Insert ******/
		/****** md5 signature: e5e5bb8552e3c2a75f6cd9e142c25e50 ******/
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
		void Insert(const Standard_Integer where, const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::IsAscii ******/
		/****** md5 signature: 6f7276b908dd6009ce0fd19db811821c ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string contains only 'Ascii Range' characters.
") IsAscii;
		Standard_Boolean IsAscii();

		/****** TCollection_HExtendedString::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the string <self> contains zero character.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TCollection_HExtendedString::IsGreater ******/
		/****** md5 signature: cc3e8af8c1c5a7017ee1ebce259a4360 ******/
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
		Standard_Boolean IsGreater(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::IsLess ******/
		/****** md5 signature: bd54ace886c9b9310105f354ea4429cb ******/
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
		Standard_Boolean IsLess(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::IsSameState ******/
		/****** md5 signature: 307ce673960649f0ee8c22eeed19ce9a ******/
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
		Standard_Boolean IsSameState(const opencascade::handle<TCollection_HExtendedString> & other);

		/****** TCollection_HExtendedString::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. This is the same functionality as 'strlen' in C.
") Length;
		Standard_Integer Length();

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
Displays <self> .
") Print;
		void Print(std::ostream &OutValue);

		/****** TCollection_HExtendedString::Remove ******/
		/****** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ******/
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
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****** TCollection_HExtendedString::RemoveAll ******/
		/****** md5 signature: 5cc33317c91574b4016e3809c2016af5 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
what: Standard_ExtCharacter

Return
-------
None

Description
-----------
Removes every <what> characters from <self>.
") RemoveAll;
		void RemoveAll(const Standard_ExtCharacter what);

		/****** TCollection_HExtendedString::Search ******/
		/****** md5 signature: 6d6eaf0de6de28075a3fdc30b6617dc1 ******/
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
		Standard_Integer Search(const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::SearchFromEnd ******/
		/****** md5 signature: 380fc28610d0074f694a37d7a03affdf ******/
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
		Standard_Integer SearchFromEnd(const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::SetValue ******/
		/****** md5 signature: 294924c31fc292e1cf9eb136f9d9d649 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
where: int
what: Standard_ExtCharacter

Return
-------
None

Description
-----------
Replaces one character in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_ExtCharacter what);

		/****** TCollection_HExtendedString::SetValue ******/
		/****** md5 signature: 122ca5e6bbf641bb81f1e42c9e12f7ba ******/
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
		void SetValue(const Standard_Integer where, const opencascade::handle<TCollection_HExtendedString> & what);

		/****** TCollection_HExtendedString::Split ******/
		/****** md5 signature: af66277d70b09ff10c6a90612af2be25 ******/
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
		opencascade::handle<TCollection_HExtendedString> Split(const Standard_Integer where);

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
		/****** md5 signature: 0e6e2c1294a386d82229f4b675a40150 ******/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
Returns pointer to ExtString.
") ToExtString;
		Standard_ExtString ToExtString();

		/****** TCollection_HExtendedString::Token ******/
		/****** md5 signature: 0e847f59efee1d1840c0206a334f3d1e ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "
Parameters
----------
separators: Standard_ExtString
whichone: int (optional, default to 1)

Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty String. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'.
") Token;
		opencascade::handle<TCollection_HExtendedString> Token(const Standard_ExtString separators, const Standard_Integer whichone = 1);

		/****** TCollection_HExtendedString::Trunc ******/
		/****** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ******/
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
		void Trunc(const Standard_Integer ahowmany);

		/****** TCollection_HExtendedString::Value ******/
		/****** md5 signature: 84bd4561d49bb9835b6ef809ad6dbc29 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
where: int

Return
-------
Standard_ExtCharacter

Description
-----------
Returns ExtCharacter at position <where> in <self>. If <where> is less than zero or greater than the length of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'.
") Value;
		Standard_ExtCharacter Value(const Standard_Integer where);

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
def TCollection_AsciiString_IsEqual(*args):
	return TCollection_AsciiString.IsEqual(*args)

@deprecated
def TCollection_AsciiString_IsEqual(*args):
	return TCollection_AsciiString.IsEqual(*args)

@deprecated
def TCollection_AsciiString_IsSameString(*args):
	return TCollection_AsciiString.IsSameString(*args)

@deprecated
def TCollection_ExtendedString_IsEqual(*args):
	return TCollection_ExtendedString.IsEqual(*args)

}
