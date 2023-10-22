/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_tcollection.html"
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
		/****************** NextPrimeForMap ******************/
		/**** md5 signature: 0dfc681e40254d86f9cdc0ca18fc6465 ****/
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
Returns a prime number greater than <i> suitable to dimension a map. when <i> becomes great there is a limit on the result (today the limit is around 1 000 000). this is not a limit of the number of items but a limit in the number of buckets. i.e. there will be more collisions in the map.
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
		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 7c1a066ad1f15d1f9e4970d0cc9d6e4a ****/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a asciistring to an empty asciistring.
") TCollection_AsciiString;
		 TCollection_AsciiString();

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 135d18ae23acb187a270b5bebb114495 ****/
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
Initializes a asciistring with a cstring.
") TCollection_AsciiString;
		 TCollection_AsciiString(Standard_CString message);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 0b4a61cbc31c5148ac8c8884319000a8 ****/
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
Initializes a asciistring with a cstring.
") TCollection_AsciiString;
		 TCollection_AsciiString(Standard_CString message, const Standard_Integer aLen);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: c76f9a4d7837e8df9d9d777686c286ad ****/
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
Initializes a asciistring with a single character.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Character aChar);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: ac8ac9c34e424f0a9f52452a771d440e ****/
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
Initializes an asciistring with <length> space allocated. and filled with <filler>. this is useful for buffers.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Integer length, const Standard_Character filler);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 6ea42193d68d64c66ff9595865d41fa2 ****/
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
Initializes an asciistring with an integer value.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Integer value);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 40bc8a32fcab9e618bc7d2797312c5fb ****/
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
Initializes an asciistring with a real value.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Real value);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: d439edb5fae7d01519169243251c80e0 ****/
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
Initializes a asciistring with another asciistring.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 77b3f342a0e7402e7425759425c20ae9 ****/
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

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 3701982dde49508c3c592490ddafa417 ****/
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
Initializes a asciistring with copy of another asciistring concatenated with the message character.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring, const Standard_Character message);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 44c9f121d97b6fb21cd7dad01b6b7a8c ****/
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
Initializes a asciistring with copy of another asciistring concatenated with the message string.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring, Standard_CString message);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: bb44c125f566bd0a6db18f2d65d50b07 ****/
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
Initializes a asciistring with copy of another asciistring concatenated with the message string.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString astring, TCollection_AsciiString message);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 31b9469f567d9991529cd4b23f00ac83 ****/
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
Creation by converting an extended string to an ascii string. if replacenonascii is non-null character, it will be used in place of any non-ascii character found in the source string. otherwise, creates utf-8 unicode string.
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_ExtendedString astring, const Standard_Character replaceNonAscii = 0);

		/****************** TCollection_AsciiString ******************/
		/**** md5 signature: 46a263c7e61324a58d93619d06999b79 ****/
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
Initialize utf-8 unicode string from wide-char string considering it as unicode string (the size of wide char is a platform-dependent - e.g. on windows wchar_t is utf-16). //! this constructor is unavailable if application is built with deprecated msvc option '-zc:wchar_t-', since occt itself is never built with this option.
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_WideChar * theStringUtf);

		/****************** AssignCat ******************/
		/**** md5 signature: 032704fd5f4807295e4f5499561766ac ****/
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
Appends <other> to me. this is an unary operator.
") AssignCat;
		void AssignCat(const Standard_Character other);

		/****************** AssignCat ******************/
		/**** md5 signature: 82098ca4ee607bf2ba1a3db82e13f9c3 ****/
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
Appends <other> to me. this is an unary operator.
") AssignCat;
		void AssignCat(const Standard_Integer other);

		/****************** AssignCat ******************/
		/**** md5 signature: 1d503770d54fae31f79d0c21698426d6 ****/
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
Appends <other> to me. this is an unary operator.
") AssignCat;
		void AssignCat(const Standard_Real other);

		/****************** AssignCat ******************/
		/**** md5 signature: 9849afa3e69d6647b6944a08249da1bc ****/
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
Appends <other> to me. this is an unary operator. ex: astring += 'dummy' to catenate more than one cstring, you must put a asciistring before. example: astring += 'hello ' + 'dolly' is not valid ! but astring += anotherstring + 'hello ' + 'dolly' is valid.
") AssignCat;
		void AssignCat(Standard_CString other);

		/****************** AssignCat ******************/
		/**** md5 signature: 12a811c23be8ca554c4c1787ef331f49 ****/
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
Appends <other> to me. this is an unary operator. example: astring += anotherstring.
") AssignCat;
		void AssignCat(TCollection_AsciiString other);

		/****************** Capitalize ******************/
		/**** md5 signature: dbcb7ca2711d8c69ac14d5c2510a8e32 ****/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts the first character into its corresponding upper-case character and the other characters into lowercase example: before me = 'hello ' after me = 'hello '.
") Capitalize;
		void Capitalize();

		/****************** Cat ******************/
		/**** md5 signature: 720ec12f6f886119f42cb37656023d33 ****/
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
Appends <other> to me. syntax: astring = astring + 'dummy' example: astring contains 'i say ' astring = astring + 'hello ' + 'dolly' gives 'i say hello dolly' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(const Standard_Character other);

		/****************** Cat ******************/
		/**** md5 signature: 2cedbc07ffcc6a63b8c2c336ba864cda ****/
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
Appends <other> to me. syntax: astring = astring + 15; example: astring contains 'i say ' gives 'i say 15' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(const Standard_Integer other);

		/****************** Cat ******************/
		/**** md5 signature: b2f7915688c3403f36496c45b92a99fd ****/
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
Appends <other> to me. syntax: astring = astring + 15.15; example: astring contains 'i say ' gives 'i say 15.15' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(const Standard_Real other);

		/****************** Cat ******************/
		/**** md5 signature: b73eafb48dc022960f3538e3e917ac4d ****/
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
Appends <other> to me. syntax: astring = astring + 'dummy' example: astring contains 'i say ' astring = astring + 'hello ' + 'dolly' gives 'i say hello dolly' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.
") Cat;
		TCollection_AsciiString Cat(Standard_CString other);

		/****************** Cat ******************/
		/**** md5 signature: d1cb84236f8c7dbaf11738768fd665c5 ****/
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
Appends <other> to me. example: astring = astring + anotherstring.
") Cat;
		TCollection_AsciiString Cat(TCollection_AsciiString other);

		/****************** Center ******************/
		/**** md5 signature: 2b5029e050de2f7db9db4538a961c189 ****/
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
Modifies this ascii string so that its length becomes equal to width and the new characters are equal to filler. new characters are added both at the beginning and at the end of this string. if width is less than the length of this ascii string, nothing happens. example tcollection_asciistring myalphabet('abcdef'); myalphabet.center(9,' '); assert ( myalphabet == ' abcdef ' );.
") Center;
		void Center(const Standard_Integer Width, const Standard_Character Filler);

		/****************** ChangeAll ******************/
		/**** md5 signature: 2a8248c4e2acd40c1b84a1410fcc9575 ****/
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
Substitutes all the characters equal to achar by newchar in the asciistring <self>. the substitution can be case sensitive. if you don't use default case sensitive, no matter whether achar is uppercase or not. example: me = 'histake' -> changeall('h','m',standard_true) gives me = 'mistake'.
") ChangeAll;
		void ChangeAll(const Standard_Character aChar, const Standard_Character NewChar, const Standard_Boolean CaseSensitive = Standard_True);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in <self>. this produces an empty asciistring.
") Clear;
		void Clear();

		/****************** Copy ******************/
		/**** md5 signature: 076c372aeb5fe373284a21ffc9742cac ****/
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
Copy <fromwhere> to <self>. used as operator = example: astring = anothercstring;.
") Copy;
		void Copy(Standard_CString fromwhere);

		/****************** Copy ******************/
		/**** md5 signature: f86e884387420e2c343398e6f0d1e0e6 ****/
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
Copy <fromwhere> to <self>. used as operator = example: astring = anotherstring;.
") Copy;
		void Copy(TCollection_AsciiString fromwhere);

		/****************** EndsWith ******************/
		/**** md5 signature: 14b6bb9d2f7c65ed6e9fb15a44705817 ****/
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

		/****************** FirstLocationInSet ******************/
		/**** md5 signature: 95e8a699938630e9f642f2b7637f974c ****/
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
Returns the index of the first character of <self> that is present in <set>. the search begins to the index fromindex and ends to the the index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 1.
") FirstLocationInSet;
		Standard_Integer FirstLocationInSet(TCollection_AsciiString Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** FirstLocationNotInSet ******************/
		/**** md5 signature: cd3e9292963c2e9cbccef2a16bba30d8 ****/
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
Returns the index of the first character of <self> that is not present in the set <set>. the search begins to the index fromindex and ends to the the index toindex in <self>. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 3.
") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet(TCollection_AsciiString Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** HashCode ******************/
		/**** md5 signature: e2da36afc8f40403f8d6004d8f435bb2 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "
Parameters
----------
theAsciiString: str
theUpperBound: int

Return
-------
int

Description
-----------
Computes a hash code for the given ascii string, in the range [1, theupperbound]. returns the same integer value as the hash function for tcollection_extendedstring @param theasciistring the ascii string which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within return a computed hash code, in the range [1, theupperbound].
") HashCode;
		static Standard_Integer HashCode(TCollection_AsciiString theAsciiString, Standard_Integer theUpperBound);

		/****************** Insert ******************/
		/**** md5 signature: 7904375fda1b58849d10a2c96c86615b ****/
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
Inserts a character at position <where>. example: astring contains 'hy not ?' astring.insert(1,'w'); gives 'why not ?' astring contains 'wh' astring.insert(3,'y'); gives 'why' astring contains 'way' astring.insert(2,'h'); gives 'why'.
") Insert;
		void Insert(const Standard_Integer where, const Standard_Character what);

		/****************** Insert ******************/
		/**** md5 signature: 975088e505e1c924bd1ef576e9371efb ****/
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
Inserts a cstring at position <where>. example: astring contains 'o more' astring.insert(2,'nce'); gives 'once more'.
") Insert;
		void Insert(const Standard_Integer where, Standard_CString what);

		/****************** Insert ******************/
		/**** md5 signature: 594a8d885f4dcbedf56a6f6f1a4b4fb3 ****/
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
Inserts a asciistring at position <where>.
") Insert;
		void Insert(const Standard_Integer where, TCollection_AsciiString what);

		/****************** InsertAfter ******************/
		/**** md5 signature: 54235567163d784600660f2242e1209d ****/
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
Pushing a string after a specific index in the string <self>. raises an exception if index is out of bounds. - less than 0 (insertafter), or less than 1 (insertbefore), or - greater than the number of characters in this ascii string. example: before me = 'cde' , index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertAfter;
		void InsertAfter(const Standard_Integer Index, TCollection_AsciiString other);

		/****************** InsertBefore ******************/
		/**** md5 signature: 5a9fdac4a173310f1deb7c408e2944be ****/
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
Pushing a string before a specific index in the string <self>. raises an exception if index is out of bounds. - less than 0 (insertafter), or less than 1 (insertbefore), or - greater than the number of characters in this ascii string. example: before me = 'cde' , index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, TCollection_AsciiString other);

		/****************** IntegerValue ******************/
		/**** md5 signature: a75e1a4c2632a55658f0262c4c2f22c2 ****/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Converts a asciistring containing a numeric expression to an integer. example: '215' returns 215.
") IntegerValue;
		Standard_Integer IntegerValue();

		/****************** IsAscii ******************/
		/**** md5 signature: 6f7276b908dd6009ce0fd19db811821c ****/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the asciistring contains only ascii characters between ' ' and '~'. this means no control character and no extended ascii code.
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsDifferent ******************/
		/**** md5 signature: 4b726ecf99ce8463de5be1dcc91c7b28 ****/
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
Returns true if there are differences between the characters in this ascii string and ascii string other. note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(Standard_CString other);

		/****************** IsDifferent ******************/
		/**** md5 signature: 468bebc984675a3b3d0a634f51ab1605 ****/
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
Returns true if there are differences between the characters in this ascii string and ascii string other. note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(TCollection_AsciiString other);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the string <self> contains zero character.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsEqual ******************/
		/**** md5 signature: cd22ecfb81d5c0c734149099758d0061 ****/
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
Returns true if the characters in this ascii string are identical to the characters in ascii string other. note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(Standard_CString other);

		/****************** IsEqual ******************/
		/**** md5 signature: 193e634776bafa3e4f441e6722a21399 ****/
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
Returns true if the characters in this ascii string are identical to the characters in ascii string other. note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(TCollection_AsciiString other);

		/****************** IsEqual ******************/
		/**** md5 signature: 5a9ec37f0ad7ada730b5d2dffb3c24c7 ****/
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
Returns true when the two strings are the same. (just for hashcode for asciistring).
") IsEqual;
		static Standard_Boolean IsEqual(TCollection_AsciiString string1, TCollection_AsciiString string2);

		/****************** IsEqual ******************/
		/**** md5 signature: 7c609f6832978b47418a4e8af7502c2f ****/
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
Returns true when the two strings are the same. (just for hashcode for asciistring).
") IsEqual;
		static Standard_Boolean IsEqual(TCollection_AsciiString string1, Standard_CString string2);

		/****************** IsGreater ******************/
		/**** md5 signature: d66794d426c77c31bfa16e28bf61d9a1 ****/
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
Returns true if <self> is 'ascii' greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(Standard_CString other);

		/****************** IsGreater ******************/
		/**** md5 signature: c1f84b8c3d802188b31dd64562f94b92 ****/
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
Returns true if <self> is 'ascii' greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(TCollection_AsciiString other);

		/****************** IsIntegerValue ******************/
		/**** md5 signature: 621b664205e9bc7af1bfe940b363e7dc ****/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the asciistring contains an integer value. note: an integer value is considered to be a real value as well.
") IsIntegerValue;
		Standard_Boolean IsIntegerValue();

		/****************** IsLess ******************/
		/**** md5 signature: 20e867e0a6038fba535050dcfb211004 ****/
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
Returns true if <self> is 'ascii' less than <other>.
") IsLess;
		Standard_Boolean IsLess(Standard_CString other);

		/****************** IsLess ******************/
		/**** md5 signature: 8f3421d6aef0b4f85432c3254bb3b2b8 ****/
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
Returns true if <self> is 'ascii' less than <other>.
") IsLess;
		Standard_Boolean IsLess(TCollection_AsciiString other);

		/****************** IsRealValue ******************/
		/**** md5 signature: 3455e68cf132006275afbfe41b3e332b ****/
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
Returns true if the asciistring starts with some characters that can be interpreted as integer or real value. @param thetocheckfull [in] when true, checks if entire string defines a real value;  otherwise checks if string starts with a real value note: an integer value is considered to be a real value as well.
") IsRealValue;
		Standard_Boolean IsRealValue(Standard_Boolean theToCheckFull = Standard_False);

		/****************** IsSameString ******************/
		/**** md5 signature: c1d604c9c70a25aef5035beb6698a7da ****/
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
Returns true if the strings contain same characters.
") IsSameString;
		static Standard_Boolean IsSameString(TCollection_AsciiString theString1, TCollection_AsciiString theString2, const Standard_Boolean theIsCaseSensitive);

		/****************** LeftAdjust ******************/
		/**** md5 signature: 2d194519f25a34b81a2aaed2f3fcf7eb ****/
		%feature("compactdefaultargs") LeftAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters in the beginning of the string.
") LeftAdjust;
		void LeftAdjust();

		/****************** LeftJustify ******************/
		/**** md5 signature: f4c95778466eb547829fbab21c8a7823 ****/
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
Left justify length becomes equal to width and the new characters are equal to filler. if width < length nothing happens. raises an exception if width is less than zero. example: before me = 'abcdef' , width = 9 , filler = ' ' after me = 'abcdef '.
") LeftJustify;
		void LeftJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. this is the same functionality as 'strlen' in c. example tcollection_asciistring myalphabet('abcdef'); assert ( myalphabet.length() == 6 ); - 1 is the position of the first character in this string. - the length of this string gives the position of its last character. - positions less than or equal to zero, or greater than the length of this string are invalid in functions which identify a character of this string by its position.
") Length;
		Standard_Integer Length();

		/****************** Location ******************/
		/**** md5 signature: b7df9b412181c7ea45c2f5f147569013 ****/
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
Returns an index in the string <self> of the first occurrence of the string s in the string <self> from the starting index fromindex to the ending index toindex returns zero if failure raises an exception if fromindex or toindex is out of range. example: before me = 'aabaaaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabaaaa' returns 4.
") Location;
		Standard_Integer Location(TCollection_AsciiString other, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Location ******************/
		/**** md5 signature: 6bebd5959426436339306c497d79377d ****/
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
Returns the index of the nth occurrence of the character c in the string <self> from the starting index fromindex to the ending index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabaa', n = 3, c = 'a', fromindex = 1, toindex = 5 after me = 'aabaa' returns 5.
") Location;
		Standard_Integer Location(const Standard_Integer N, const Standard_Character C, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** LowerCase ******************/
		/**** md5 signature: 3a5c616bcb477647273ba31ea4d4dd76 ****/
		%feature("compactdefaultargs") LowerCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts <self> to its lower-case equivalent. example tcollection_asciistring mystring('hello dolly'); mystring.uppercase(); assert ( mystring == 'hello dolly' ); mystring.lowercase(); assert ( mystring == 'hello dolly' );.
") LowerCase;
		void LowerCase();

		/****************** Prepend ******************/
		/**** md5 signature: 1a5269fcdee6cb93b42318d718147b72 ****/
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
Inserts the string other at the beginning of this ascii string. example tcollection_asciistring myalphabet('cde'); tcollection_asciistring mybegin('ab'); myalphabet.prepend(mybegin); assert ( myalphabet == 'abcde' );.
") Prepend;
		void Prepend(TCollection_AsciiString other);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };

            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };
		/****************** RealValue ******************/
		/**** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ****/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Converts an asciistring containing a numeric expression. to a real. example: ex: '215' returns 215.0. ex: '3.14159267' returns 3.14159267.
") RealValue;
		Standard_Real RealValue();

		/****************** Remove ******************/
		/**** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ****/
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
Erases <ahowmany> characters from position <where>, <where> included. example: astring contains 'hello' astring.remove(2,2) erases 2 characters from position 2 this gives 'hlo'.
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****************** RemoveAll ******************/
		/**** md5 signature: 17e901953b8ffee8fc2a18f2cc4c7ebe ****/
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
Remove all the occurrences of the character c in the string. example: before me = 'hellllo', c = 'l' , casesensitive = true after me = 'hello'.
") RemoveAll;
		void RemoveAll(const Standard_Character C, const Standard_Boolean CaseSensitive);

		/****************** RemoveAll ******************/
		/**** md5 signature: e42d8d7a2a77ebc16d192f0c2bf85d1b ****/
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

		/****************** RightAdjust ******************/
		/**** md5 signature: 4ad2bf7860ba51d9ab208488c573dee8 ****/
		%feature("compactdefaultargs") RightAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters at the end of the string.
") RightAdjust;
		void RightAdjust();

		/****************** RightJustify ******************/
		/**** md5 signature: a19b8ecc125efa5d7ffd1fc7614c4325 ****/
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
Right justify. length becomes equal to width and the new characters are equal to filler. if width < length nothing happens. raises an exception if width is less than zero. example: before me = 'abcdef' , width = 9 , filler = ' ' after me = ' abcdef'.
") RightJustify;
		void RightJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Search ******************/
		/**** md5 signature: ac4c7603fbad57da665e9bcec3af7cc7 ****/
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
Searches a cstring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.search('le') returns 5.
") Search;
		Standard_Integer Search(Standard_CString what);

		/****************** Search ******************/
		/**** md5 signature: 77f3592dabaaab77a5508c4516e7237d ****/
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
Searches an asciistring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.
") Search;
		Standard_Integer Search(TCollection_AsciiString what);

		/****************** SearchFromEnd ******************/
		/**** md5 signature: 001f750966fbbafd950bf1f5cadf23d9 ****/
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
Searches a cstring in a asciistring from the end and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.searchfromend('le') returns 12.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(Standard_CString what);

		/****************** SearchFromEnd ******************/
		/**** md5 signature: 9cad9172f6139d357df95e50cc4809e0 ****/
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
Searches a asciistring in another asciistring from the end and returns position of first item <what> matching. it returns -1 if not found.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(TCollection_AsciiString what);

		/****************** SetValue ******************/
		/**** md5 signature: b8dea7704af78fd9353092eed090171d ****/
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
Replaces one character in the asciistring at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_Character what);

		/****************** SetValue ******************/
		/**** md5 signature: 17403469ab86c4473d18ce1ccd74cffd ****/
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
Replaces a part of <self> by a cstring. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'abcde' astring.setvalue(4,'1234567') gives <self> = 'abc1234567'.
") SetValue;
		void SetValue(const Standard_Integer where, Standard_CString what);

		/****************** SetValue ******************/
		/**** md5 signature: e6cb739e16de0638799cbe91a77da04f ****/
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
Replaces a part of <self> by another asciistring.
") SetValue;
		void SetValue(const Standard_Integer where, TCollection_AsciiString what);

		/****************** Split ******************/
		/**** md5 signature: 678d31683435e0d43e651b472354ee3f ****/
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
Splits a asciistring into two sub-strings. example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		TCollection_AsciiString Split(const Standard_Integer where);

		/****************** StartsWith ******************/
		/**** md5 signature: 7e4c28c090d6d26b1440e13b4e0900c2 ****/
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

		/****************** SubString ******************/
		/**** md5 signature: df1c60951852a984d8317f5b29c25f99 ****/
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
Creation of a sub-string of the string <self>. the sub-string starts to the index fromindex and ends to the index toindex. raises an exception if toindex or fromindex is out of bounds example: before me = 'abcdefg', toindex=3, fromindex=6 after me = 'abcdefg' returns 'cdef'.
") SubString;
		TCollection_AsciiString SubString(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Swap ******************/
		/**** md5 signature: e92a9a780cb33042e23ff904bd0b1f47 ****/
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

		/****************** ToCString ******************/
		/**** md5 signature: a0d55961c9252eb810c558f8e4ab10b4 ****/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns pointer to asciistring (char *). this is useful for some casual manipulations. warning: because this 'char *' is 'const', you can't modify its contents.
") ToCString;
		Standard_CString ToCString();

		/****************** Token ******************/
		/**** md5 signature: 5c85538c5fc09bfcc1992f1c8c5c9d18 ****/
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
Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns empty asciistring. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed: astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.
") Token;
		TCollection_AsciiString Token(Standard_CString separators = "\t", const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		/**** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ****/
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
Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel'.
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** UpperCase ******************/
		/**** md5 signature: 3f9f21fd1f92b5d0ecce6f762f7738a1 ****/
		%feature("compactdefaultargs") UpperCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts <self> to its upper-case equivalent.
") UpperCase;
		void UpperCase();

		/****************** UsefullLength ******************/
		/**** md5 signature: 2e944cc63721a567e24c1ac662acad02 ****/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Length of the string ignoring all spaces (' ') and the control character at the end.
") UsefullLength;
		Standard_Integer UsefullLength();

		/****************** Value ******************/
		/**** md5 signature: b790c256d0e62b0d42a4819aca4e63bb ****/
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
Returns character at position <where> in <self>. if <where> is less than zero or greater than the length of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e'.
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
		/****************** operator + ******************/
		/**** md5 signature: d5bb55766727226dfadc22de4706ab2a ****/
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

		/****************** operator + ******************/
		/**** md5 signature: ce587a3765bf01a8a5fb2cf57f472a22 ****/
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

		/****************** operator + ******************/
		/**** md5 signature: 3c8c13ccafb8668627344ec87cd5b479 ****/
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

		/****************** operator + ******************/
		/**** md5 signature: 790b5fbf345a3e3b433d884b2db4419b ****/
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

		/****************** operator + ******************/
		/**** md5 signature: d6838314a8c2c0a320cde4fcaee86022 ****/
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
	}
};

/***********************************
* class TCollection_ExtendedString *
***********************************/
class TCollection_ExtendedString {
	public:
		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 27102535163506884d25905a079f37f1 ****/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a extendedstring to an empty extendedstring.
") TCollection_ExtendedString;
		 TCollection_ExtendedString();

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: bd5a30053ae1dbb206e1f145f51b3c92 ****/
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
Creation by converting a cstring to an extended string. if <ismultibyte> is true then the string is treated as having utf-8 coding. if it is not a utf-8 then <ismultibyte> is ignored and each character is copied to extcharacter.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(Standard_CString astring, const Standard_Boolean isMultiByte = Standard_False);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 32794e06c591ca0c74dea31f9c707296 ****/
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
Creation by converting an extstring to an extended string.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_ExtString astring);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 7f6b85e67c819db3a403bc17c88ad949 ****/
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
Initialize from wide-char string considering it as unicode string (the size of wide char is a platform-dependent - e.g. on windows wchar_t is utf-16). //! this constructor is unavailable if application is built with deprecated msvc option '-zc:wchar_t-', since occt itself is never built with this option.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_WideChar * theStringUtf);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: cc2b0c05298704aee786df35f7261b14 ****/
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
Initializes a asciistring with a single character.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Character aChar);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 68e5cee6b4d106d05772773b1168d89e ****/
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
Initializes a extendedstring with a single character.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_ExtCharacter aChar);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 6c2cc4cdc61a1ef1008d283b6ba53866 ****/
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
Initializes a extendedstring with <length> space allocated. and filled with <filler>.this is useful for buffers.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Integer length, const Standard_ExtCharacter filler);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 6c0d043a8729c73f242cc59cd1d63afb ****/
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
Initializes an extendedstring with an integer value.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Integer value);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 43bfa72a1bf715d78f22a5f919221f12 ****/
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
Initializes an extendedstring with a real value.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Real value);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 1208eb30d755fd6ea0110b6d3fd2b183 ****/
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
Initializes a extendedstring with another extendedstring.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_ExtendedString astring);

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 48db9560fec5e00cc0d2840716162fbf ****/
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

		/****************** TCollection_ExtendedString ******************/
		/**** md5 signature: 65128c52391eef873746fec9d8584835 ****/
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
Creation by converting an ascii string to an extended string. the string is treated as having utf-8 coding. if it is not a utf-8 or multi byte then each character is copied to extcharacter.
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_AsciiString astring, const Standard_Boolean isMultiByte = Standard_True);

		/****************** AssignCat ******************/
		/**** md5 signature: 290473b12be80aeece2f43cf57b4b8c9 ****/
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
Appends the other extended string to this extended string. note that this method is an alias of operator +=. example: astring += anotherstring.
") AssignCat;
		void AssignCat(TCollection_ExtendedString other);

		/****************** AssignCat ******************/
		/**** md5 signature: af9511f20ca65b8d1031666c6ec91c33 ****/
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

		/****************** Cat ******************/
		/**** md5 signature: ef439e4a817d99d3aad10416eb41fa81 ****/
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

		/****************** ChangeAll ******************/
		/**** md5 signature: 172cbf77fdcbc202d23ddaed833764da ****/
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
Substitutes all the characters equal to achar by newchar in the extendedstring <self>. the substitution can be case sensitive. if you don't use default case sensitive, no matter whether achar is uppercase or not.
") ChangeAll;
		void ChangeAll(const Standard_ExtCharacter aChar, const Standard_ExtCharacter NewChar);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in <self>. this produces an empty extendedstring.
") Clear;
		void Clear();

		/****************** Copy ******************/
		/**** md5 signature: 8773a536f9febb95c2bccfdbe6e610ae ****/
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
Copy <fromwhere> to <self>. used as operator =.
") Copy;
		void Copy(TCollection_ExtendedString fromwhere);

		/****************** EndsWith ******************/
		/**** md5 signature: 9634325ac41bffcbae04aa4d3f34465a ****/
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

		/****************** HashCode ******************/
		/**** md5 signature: a6589c5513a379021f17112f206c8ccb ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "
Parameters
----------
theString: str
theUpperBound: int

Return
-------
int

Description
-----------
Returns a hashed value for the extended string within the range 1 .. theupper. note: if string is ascii, the computed value is the same as the value computed with the hashcode function on a tcollection_asciistring string composed with equivalent ascii characters. @param thestring the extended string which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within return a computed hash code, in the range [1, theupperbound].
") HashCode;
		static Standard_Integer HashCode(TCollection_ExtendedString theString, const Standard_Integer theUpperBound);

		/****************** Insert ******************/
		/**** md5 signature: 0697ac1ff05f55e6371b2412e6df94e9 ****/
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
Insert a character at position <where>.
") Insert;
		void Insert(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** Insert ******************/
		/**** md5 signature: 18ac3037701ab2ccec185b0b11df82af ****/
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
Insert a extendedstring at position <where>.
") Insert;
		void Insert(const Standard_Integer where, TCollection_ExtendedString what);

		/****************** IsAscii ******************/
		/**** md5 signature: 6f7276b908dd6009ce0fd19db811821c ****/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the extendedstring contains only 'ascii range' characters .
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsDifferent ******************/
		/**** md5 signature: 85820fc5baf078b8dcd01fc694db8b77 ****/
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
Returns true if there are differences between the characters in this extended string and the other extended string. note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(const Standard_ExtString other);

		/****************** IsDifferent ******************/
		/**** md5 signature: 55bde9d27641e44b784f8d27abefd706 ****/
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
Returns true if there are differences between the characters in this extended string and the other extended string. note that this method is an alias of operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(TCollection_ExtendedString other);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this string contains no characters.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsEqual ******************/
		/**** md5 signature: 0948071158d76df9b23db2fee8d75cc1 ****/
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
Returns true if the characters in this extended string are identical to the characters in the other extended string. note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(const Standard_ExtString other);

		/****************** IsEqual ******************/
		/**** md5 signature: e74fc8048162da7ae830426f88d4674a ****/
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
Returns true if the characters in this extended string are identical to the characters in the other extended string. note that this method is an alias of operator ==.
") IsEqual;
		Standard_Boolean IsEqual(TCollection_ExtendedString other);

		/****************** IsEqual ******************/
		/**** md5 signature: 129ad9f997bed3d3858413785264e2f1 ****/
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
Returns true if the characters in this extended string are identical to the characters in the other extended string. note that this method is an alias of operator ==.
") IsEqual;
		static Standard_Boolean IsEqual(TCollection_ExtendedString theString1, TCollection_ExtendedString theString2);

		/****************** IsGreater ******************/
		/**** md5 signature: 5cf9ca773a20caca0e06fa958481d2e9 ****/
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
Returns true if <self> is greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(const Standard_ExtString other);

		/****************** IsGreater ******************/
		/**** md5 signature: c99a8ff1d9d77dc4570bd04b0bea2dbd ****/
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
Returns true if <self> is greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(TCollection_ExtendedString other);

		/****************** IsLess ******************/
		/**** md5 signature: c2cee3699b5b2477e673c526cc7fc7c3 ****/
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
Returns true if <self> is less than <other>.
") IsLess;
		Standard_Boolean IsLess(const Standard_ExtString other);

		/****************** IsLess ******************/
		/**** md5 signature: 491f62fe2776ecedc0b150364f213844 ****/
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
Returns true if <self> is less than <other>.
") IsLess;
		Standard_Boolean IsLess(TCollection_ExtendedString other);

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 16-bit code units (might be greater than number of unicode symbols if string contains surrogate pairs).
") Length;
		Standard_Integer Length();

		/****************** LengthOfCString ******************/
		/**** md5 signature: 75029f9cff091c3704fc23603e5a8747 ****/
		%feature("compactdefaultargs") LengthOfCString;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns expected cstring length in utf8 coding. it can be used for memory calculation before converting to cstring containing symbols in utf8 coding.
") LengthOfCString;
		Standard_Integer LengthOfCString();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Remove ******************/
		/**** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ****/
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

		/****************** RemoveAll ******************/
		/**** md5 signature: 5cc33317c91574b4016e3809c2016af5 ****/
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

		/****************** Search ******************/
		/**** md5 signature: d150c7899dddb9851aae66427055ccb1 ****/
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
Searches a extendedstring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.
") Search;
		Standard_Integer Search(TCollection_ExtendedString what);

		/****************** SearchFromEnd ******************/
		/**** md5 signature: b2afedfb1f65543f0e0888d888f00218 ****/
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
Searches a extendedstring in another extendedstring from the end and returns position of first item <what> matching. it returns -1 if not found.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(TCollection_ExtendedString what);

		/****************** SetValue ******************/
		/**** md5 signature: 294924c31fc292e1cf9eb136f9d9d649 ****/
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
Replaces one character in the extendedstring at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** SetValue ******************/
		/**** md5 signature: c23c311484c9786eb0014421a03f2613 ****/
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
Replaces a part of <self> by another extendedstring see above.
") SetValue;
		void SetValue(const Standard_Integer where, TCollection_ExtendedString what);

		/****************** Split ******************/
		/**** md5 signature: 8268b04610407501d58f674f1e5d1fef ****/
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
Splits this extended string into two sub-strings at position where. - the second sub-string (from position where + 1 of this string to the end) is returned in a new extended string. - this extended string is modified: its last characters are removed, it becomes equal to the first sub-string (from the first character to position where). example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		TCollection_ExtendedString Split(const Standard_Integer where);

		/****************** StartsWith ******************/
		/**** md5 signature: 88523a02c5928156555a2a31a298bd45 ****/
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

		/****************** Swap ******************/
		/**** md5 signature: 64355d86a311821e9f828b1de3bbea86 ****/
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

		/****************** ToExtString ******************/
		/**** md5 signature: 3e9c425364178122dc4b3879f484e9f4 ****/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
Returns pointer to extstring.
") ToExtString;
		Standard_ExtString ToExtString();

		/****************** ToUTF8CString ******************/
		/**** md5 signature: 0eb66f1d867ef44952405f1e528bf885 ****/
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
Converts the internal <mystring> to utf8 coding and returns length of the out cstring. a memory for the <thecstring> should be allocated before call!.
") ToUTF8CString;
		Standard_Integer ToUTF8CString(Standard_PCharacter & theCString);

		/****************** Token ******************/
		/**** md5 signature: d07bb65947d1f126db0ef4323c24fe8d ****/
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
Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns an empty asciistring. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed: astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.
") Token;
		TCollection_ExtendedString Token(const Standard_ExtString separators, const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		/**** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ****/
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
Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel' exceptions standard_outofrange if ahowmany is greater than the length of this string.
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** Value ******************/
		/**** md5 signature: 84bd4561d49bb9835b6ef809ad6dbc29 ****/
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
Returns character at position <where> in <self>. if <where> is less than zero or greater than the length of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e' exceptions standard_outofrange if where lies outside the bounds of this extended string.
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
		/****************** operator + ******************/
		/**** md5 signature: bc40c1386a156b1db27b30eaa95a0f95 ****/
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
	}
};

/*********************************
* class TCollection_HAsciiString *
*********************************/
class TCollection_HAsciiString : public Standard_Transient {
	public:
		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 1078a0d0e3b700abf3d93bf0c910aa95 ****/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a hasciistring to an empty asciistring.
") TCollection_HAsciiString;
		 TCollection_HAsciiString();

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 5c051822068be398edd1f9fc8c62076b ****/
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
Initializes a hasciistring with a cstring.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(Standard_CString message);

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 42a7090e4a24c83fdcfa907627bbb5ed ****/
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
Initializes a hasciistring with a single character.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Character aChar);

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 419f459f843ebb6ff828fa694e5714af ****/
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
Initializes a hasciistring with <length> space allocated. and filled with <filler>.this is useful for buffers.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Integer length, const Standard_Character filler);

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 046267dac0cd24016563517459b0dfe1 ****/
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
Initializes a hasciistring with an integer value.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Integer value);

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 71aa4ea7cf1fef0bd71cbeb603b0d4ea ****/
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
Initializes a hasciistring with a real value.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Real value);

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 4c34b45baf33ce6936cb87edb50c3fad ****/
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
Initializes a hasciistring with a asciistring.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(TCollection_AsciiString aString);

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 84b0260612dd7af944e9b7fbb8cd5693 ****/
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
Initializes a hasciistring with a hasciistring.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const opencascade::handle<TCollection_HAsciiString> & aString);

		/****************** TCollection_HAsciiString ******************/
		/**** md5 signature: 2d2c9cf505fe6268a2d3ca5bb9f0df5c ****/
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
Initializes a hasciistring with a hextendedstring. if replacenonascii is non-null character, it will be used in place of any non-ascii character found in the source string. otherwise, creates utf-8 unicode string.
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const opencascade::handle<TCollection_HExtendedString> & aString, const Standard_Character replaceNonAscii);

		/****************** AssignCat ******************/
		/**** md5 signature: 9849afa3e69d6647b6944a08249da1bc ****/
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

		/****************** AssignCat ******************/
		/**** md5 signature: 9a1804a3730fe6c158f51e3b1a62e311 ****/
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
Appends <other> to me. example: astring = astring + anotherstring.
") AssignCat;
		void AssignCat(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** Capitalize ******************/
		/**** md5 signature: dbcb7ca2711d8c69ac14d5c2510a8e32 ****/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts the first character into its corresponding upper-case character and the other characters into lowercase. example: before me = 'hello ' after me = 'hello '.
") Capitalize;
		void Capitalize();

		/****************** Cat ******************/
		/**** md5 signature: 1a32e5ecba107c7d2923cf6aeb77d8e7 ****/
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
Creates a new string by concatenation of this ascii string and the other ascii string. example: astring = astring + anotherstring astring = astring + 'dummy' astring contains 'i say ' astring = astring + 'hello ' + 'dolly' gives 'i say hello dolly' warning: to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.
") Cat;
		opencascade::handle<TCollection_HAsciiString> Cat(Standard_CString other);

		/****************** Cat ******************/
		/**** md5 signature: dd2183ed02563b08fc5f255cea059ce5 ****/
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
Creates a new string by concatenation of this ascii string and the other ascii string. example: astring = astring + anotherstring.
") Cat;
		opencascade::handle<TCollection_HAsciiString> Cat(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** Center ******************/
		/**** md5 signature: 2b5029e050de2f7db9db4538a961c189 ****/
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
Modifies this ascii string so that its length becomes equal to width and the new characters are equal to filler. new characters are added both at the beginning and at the end of this string. if width is less than the length of this ascii string, nothing happens. example opencascade::handle<tcollection_hasciistring> myalphabet = new tcollection_hasciistring ('abcdef'); myalphabet->center(9,' '); assert ( !strcmp( myalphabet->tocstring(), ' abcdef ') );.
") Center;
		void Center(const Standard_Integer Width, const Standard_Character Filler);

		/****************** ChangeAll ******************/
		/**** md5 signature: 2a8248c4e2acd40c1b84a1410fcc9575 ****/
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
Replaces all characters equal to achar by newchar in this ascii string. the substitution is case sensitive if casesensitive is true (default value). if you do not use the default case sensitive option, it does not matter whether achar is upper-case or not. example opencascade::handle<tcollection_hasciistring> mymistake = new tcollection_hasciistring ('hather'); mymistake->changeall('h','f'); assert ( !strcmp( mymistake->tocstring(), 'father') );.
") ChangeAll;
		void ChangeAll(const Standard_Character aChar, const Standard_Character NewChar, const Standard_Boolean CaseSensitive = Standard_True);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in <self>. this produces an empty hasciistring.
") Clear;
		void Clear();

		/****************** FirstLocationInSet ******************/
		/**** md5 signature: c02512a97e6b5263176ba2ccfa8ed105 ****/
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
Returns the index of the first character of <self> that is present in <set>. the search begins to the index fromindex and ends to the the index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 1.
") FirstLocationInSet;
		Standard_Integer FirstLocationInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** FirstLocationNotInSet ******************/
		/**** md5 signature: 1d236c8f681402c58697cd92d97cec88 ****/
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
Returns the index of the first character of <self> that is not present in the set <set>. the search begins to the index fromindex and ends to the the index toindex in <self>. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 3.
") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Insert ******************/
		/**** md5 signature: 7904375fda1b58849d10a2c96c86615b ****/
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
Insert a character at position <where>. example: astring contains 'hy not ?' astring.insert(1,'w'); gives 'why not ?' astring contains 'wh' astring.insert(3,'y'); gives 'why' astring contains 'way' astring.insert(2,'h'); gives 'why'.
") Insert;
		void Insert(const Standard_Integer where, const Standard_Character what);

		/****************** Insert ******************/
		/**** md5 signature: 975088e505e1c924bd1ef576e9371efb ****/
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
Insert a hasciistring at position <where>.
") Insert;
		void Insert(const Standard_Integer where, Standard_CString what);

		/****************** Insert ******************/
		/**** md5 signature: 00bce82236f786524084c18458d05a52 ****/
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
Insert a hasciistring at position <where>.
") Insert;
		void Insert(const Standard_Integer where, const opencascade::handle<TCollection_HAsciiString> & what);

		/****************** InsertAfter ******************/
		/**** md5 signature: aea8d1d7782af5dc2ffad7d3e4877597 ****/
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
Inserts the other ascii string a after a specific index in the string <self> example: before me = 'cde' , index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertAfter;
		void InsertAfter(const Standard_Integer Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** InsertBefore ******************/
		/**** md5 signature: 0f11aa0b72d04726b6caba4ebdae9573 ****/
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
Inserts the other ascii string a before a specific index in the string <self> raises an exception if index is out of bounds example: before me = 'cde' , index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'.
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** IntegerValue ******************/
		/**** md5 signature: a75e1a4c2632a55658f0262c4c2f22c2 ****/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Converts a hasciistring containing a numeric expression to an integer. example: '215' returns 215.
") IntegerValue;
		Standard_Integer IntegerValue();

		/****************** IsAscii ******************/
		/**** md5 signature: 6f7276b908dd6009ce0fd19db811821c ****/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the string contains only ascii characters between ' ' and '~'. this means no control character and no extended ascii code.
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsDifferent ******************/
		/**** md5 signature: bdd599f7df06fe89322d4df55fc97f48 ****/
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
Returns true if the string s not contains same characters than the string <self>.
") IsDifferent;
		Standard_Boolean IsDifferent(const opencascade::handle<TCollection_HAsciiString> & S);

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the string <self> contains zero character.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsGreater ******************/
		/**** md5 signature: c802c1ef92d5d1701deb1b2bb76c0333 ****/
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
Returns true if <self> is 'ascii' greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** IsIntegerValue ******************/
		/**** md5 signature: 621b664205e9bc7af1bfe940b363e7dc ****/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the string contains an integer value.
") IsIntegerValue;
		Standard_Boolean IsIntegerValue();

		/****************** IsLess ******************/
		/**** md5 signature: a0f0427c44af86d5d93e5b00594e059f ****/
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
Returns true if <self> is 'ascii' less than <other>.
") IsLess;
		Standard_Boolean IsLess(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** IsRealValue ******************/
		/**** md5 signature: 37730896bf853986942d4303fcf722e6 ****/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the string contains a real value.
") IsRealValue;
		Standard_Boolean IsRealValue();

		/****************** IsSameState ******************/
		/**** md5 signature: 8d2d9199bf4b65dbd08ac3a28565efa2 ****/
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

		/****************** IsSameString ******************/
		/**** md5 signature: 31e0f4aa2fde5b3568bba91f4d19c228 ****/
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
Returns true if the string s contains same characters than the string <self>.
") IsSameString;
		Standard_Boolean IsSameString(const opencascade::handle<TCollection_HAsciiString> & S);

		/****************** IsSameString ******************/
		/**** md5 signature: cde47ee814606ec044bae1596146a012 ****/
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
Returns true if the string s contains same characters than the string <self>.
") IsSameString;
		Standard_Boolean IsSameString(const opencascade::handle<TCollection_HAsciiString> & S, const Standard_Boolean CaseSensitive);

		/****************** LeftAdjust ******************/
		/**** md5 signature: 2d194519f25a34b81a2aaed2f3fcf7eb ****/
		%feature("compactdefaultargs") LeftAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters in the beginning of the string.
") LeftAdjust;
		void LeftAdjust();

		/****************** LeftJustify ******************/
		/**** md5 signature: f4c95778466eb547829fbab21c8a7823 ****/
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
Left justify. length becomes equal to width and the new characters are equal to filler if width < length nothing happens raises an exception if width is less than zero example: before me = 'abcdef' , width = 9 , filler = ' ' after me = 'abcdef '.
") LeftJustify;
		void LeftJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. this is the same functionality as 'strlen' in c.
") Length;
		Standard_Integer Length();

		/****************** Location ******************/
		/**** md5 signature: 557d6cdb6bdb38582292298f38e087e8 ****/
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
Returns an index in the string <self> of the first occurrence of the string s in the string <self> from the starting index fromindex to the ending index toindex returns zero if failure raises an exception if fromindex or toindex is out of range. example: before me = 'aabaaaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabaaaa' returns 4.
") Location;
		Standard_Integer Location(const opencascade::handle<TCollection_HAsciiString> & other, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Location ******************/
		/**** md5 signature: 6bebd5959426436339306c497d79377d ****/
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
Returns the index of the nth occurrence of the character c in the string <self> from the starting index fromindex to the ending index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range example: before me = 'aabaa', n = 3, c = 'a', fromindex = 1, toindex = 5 after me = 'aabaa' returns 5.
") Location;
		Standard_Integer Location(const Standard_Integer N, const Standard_Character C, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** LowerCase ******************/
		/**** md5 signature: 3a5c616bcb477647273ba31ea4d4dd76 ****/
		%feature("compactdefaultargs") LowerCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts <self> to its lower-case equivalent.
") LowerCase;
		void LowerCase();

		/****************** Prepend ******************/
		/**** md5 signature: 71edcb8a4aaf67dd7f8a4065c9e6ab32 ****/
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
Inserts the other string at the beginning of the string <self> example: before me = 'cde' , s = 'ab' after me = 'abcde' , s = 'ab'.
") Prepend;
		void Prepend(const opencascade::handle<TCollection_HAsciiString> & other);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** RealValue ******************/
		/**** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ****/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Converts a string containing a numeric expression to a real. example: '215' returns 215.0. '3.14159267' returns 3.14159267.
") RealValue;
		Standard_Real RealValue();

		/****************** Remove ******************/
		/**** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ****/
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
Erases <ahowmany> characters from position <where>, <where> included. example: astring contains 'hello' astring.erase(2,2) erases 2 characters from position 1 this gives 'hlo'.
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****************** RemoveAll ******************/
		/**** md5 signature: 17e901953b8ffee8fc2a18f2cc4c7ebe ****/
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
Remove all the occurrences of the character c in the string example: before me = 'hellllo', c = 'l' , casesensitive = true after me = 'hello'.
") RemoveAll;
		void RemoveAll(const Standard_Character C, const Standard_Boolean CaseSensitive);

		/****************** RemoveAll ******************/
		/**** md5 signature: e42d8d7a2a77ebc16d192f0c2bf85d1b ****/
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

		/****************** RightAdjust ******************/
		/**** md5 signature: 4ad2bf7860ba51d9ab208488c573dee8 ****/
		%feature("compactdefaultargs") RightAdjust;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all space characters at the end of the string.
") RightAdjust;
		void RightAdjust();

		/****************** RightJustify ******************/
		/**** md5 signature: a19b8ecc125efa5d7ffd1fc7614c4325 ****/
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
Right justify. length becomes equal to width and the new characters are equal to filler if width < length nothing happens raises an exception if width is less than zero example: before me = 'abcdef' , width = 9 , filler = ' ' after me = ' abcdef'.
") RightJustify;
		void RightJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Search ******************/
		/**** md5 signature: ac4c7603fbad57da665e9bcec3af7cc7 ****/
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
Searches a cstring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.search('le') returns 5.
") Search;
		Standard_Integer Search(Standard_CString what);

		/****************** Search ******************/
		/**** md5 signature: b859c53f977f80fe95a3c9f5dd92d975 ****/
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
Searches a string in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.
") Search;
		Standard_Integer Search(const opencascade::handle<TCollection_HAsciiString> & what);

		/****************** SearchFromEnd ******************/
		/**** md5 signature: 001f750966fbbafd950bf1f5cadf23d9 ****/
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
Searches a cstring in a string from the end and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.searchfromend('le') returns 12.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(Standard_CString what);

		/****************** SearchFromEnd ******************/
		/**** md5 signature: 26ef5632859c306517edacf175ffeb25 ****/
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
Searches a hasciistring in another hasciistring from the end and returns position of first item <what> matching. it returns -1 if not found.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const opencascade::handle<TCollection_HAsciiString> & what);

		/****************** SetValue ******************/
		/**** md5 signature: b8dea7704af78fd9353092eed090171d ****/
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
Replaces one character in the string at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_Character what);

		/****************** SetValue ******************/
		/**** md5 signature: 17403469ab86c4473d18ce1ccd74cffd ****/
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
Replaces a part of <self> in the string at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, Standard_CString what);

		/****************** SetValue ******************/
		/**** md5 signature: 93f546312ca5b5eebe8fa91a70ccccf5 ****/
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

		/****************** Split ******************/
		/**** md5 signature: 246f2100beead6e322fa3e01d01f3249 ****/
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
Splits a hasciistring into two sub-strings. example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		opencascade::handle<TCollection_HAsciiString> Split(const Standard_Integer where);

		/****************** String ******************/
		/**** md5 signature: 3d3a11f081a90fcd0e6ea30e33b34432 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the field mystring.
") String;
		const TCollection_AsciiString & String();

		/****************** SubString ******************/
		/**** md5 signature: dfea99c46584cf4a3f0555ff87ebb4c5 ****/
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
Creation of a sub-string of the string <self>. the sub-string starts to the index fromindex and ends to the index toindex. raises an exception if toindex or fromindex is out of bounds example: before me = 'abcdefg', toindex=3, fromindex=6 after me = 'abcdefg' returns 'cdef'.
") SubString;
		opencascade::handle<TCollection_HAsciiString> SubString(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** ToCString ******************/
		/**** md5 signature: a0d55961c9252eb810c558f8e4ab10b4 ****/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns pointer to string (char *) this is useful for some casual manipulations because this 'char *' is 'const', you can't modify its contents.
") ToCString;
		Standard_CString ToCString();

		/****************** Token ******************/
		/**** md5 signature: 550b5c901eb3be27661f560e4facc9c6 ****/
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
Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns an empty string. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.
") Token;
		opencascade::handle<TCollection_HAsciiString> Token(Standard_CString separators = "\t", const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		/**** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ****/
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
Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel'.
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** UpperCase ******************/
		/**** md5 signature: 3f9f21fd1f92b5d0ecce6f762f7738a1 ****/
		%feature("compactdefaultargs") UpperCase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts <self> to its upper-case equivalent.
") UpperCase;
		void UpperCase();

		/****************** UsefullLength ******************/
		/**** md5 signature: 2e944cc63721a567e24c1ac662acad02 ****/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Length of the string ignoring all spaces (' ') and the control character at the end.
") UsefullLength;
		Standard_Integer UsefullLength();

		/****************** Value ******************/
		/**** md5 signature: b790c256d0e62b0d42a4819aca4e63bb ****/
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
Returns character at position <where> in <self>. if <where> is less than zero or greater than the length of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e'.
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
		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: aa1cd4e7de4b4288f611cd133e7fcb84 ****/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a hextendedstring to an empty extendedstring.
") TCollection_HExtendedString;
		 TCollection_HExtendedString();

		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: 8228eca5bb51d9cd2f9683d75a3a9574 ****/
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
Initializes a hextendedstring with a cstring.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(Standard_CString message);

		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: de855a681a7f55677c0fc072b8c7b2cb ****/
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
Initializes a hextendedstring with an extstring.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_ExtString message);

		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: acdb106688ab40fd7e0ba67b1d61076e ****/
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
Initializes a hextendedstring with a single character.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_ExtCharacter aChar);

		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: 2296e03682630049aa1941ff334aa49d ****/
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
Initializes a hextendedstring with <length> space allocated. and filled with <filler>. this is useful for buffers.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_Integer length, const Standard_ExtCharacter filler);

		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: da8ba001c8df8c7dbb818c52dbf8e2c7 ****/
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
Initializes a hextendedstring with a hextendedstring.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(TCollection_ExtendedString aString);

		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: af4627abe66bf228b7e542a0d52004e1 ****/
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
Initializes a hextendedstring with an hasciistring.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const opencascade::handle<TCollection_HAsciiString> & aString);

		/****************** TCollection_HExtendedString ******************/
		/**** md5 signature: 0d71b66bd8b2c8d5cad87ba3ee0bc564 ****/
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
Initializes a hextendedstring with a hextendedstring.
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const opencascade::handle<TCollection_HExtendedString> & aString);

		/****************** AssignCat ******************/
		/**** md5 signature: 5637c8b94e0cc150f0bd192ceda3312f ****/
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

		/****************** Cat ******************/
		/**** md5 signature: 05ff8d0d693749110edd373b865203e0 ****/
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

		/****************** ChangeAll ******************/
		/**** md5 signature: 172cbf77fdcbc202d23ddaed833764da ****/
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
Substitutes all the characters equal to achar by newchar in the string <self>.
") ChangeAll;
		void ChangeAll(const Standard_ExtCharacter aChar, const Standard_ExtCharacter NewChar);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all characters contained in <self>. this produces an empty extendedstring.
") Clear;
		void Clear();

		/****************** Insert ******************/
		/**** md5 signature: 0697ac1ff05f55e6371b2412e6df94e9 ****/
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
Insert a extcharacter at position <where>. example: astring contains 'hy not ?' astring.insert(1,'w'); gives 'why not ?' astring contains 'wh' astring.insert(3,'y'); gives 'why' astring contains 'way' astring.insert(2,'h'); gives 'why'.
") Insert;
		void Insert(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** Insert ******************/
		/**** md5 signature: e5e5bb8552e3c2a75f6cd9e142c25e50 ****/
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
Insert a hextendedstring at position <where>.
") Insert;
		void Insert(const Standard_Integer where, const opencascade::handle<TCollection_HExtendedString> & what);

		/****************** IsAscii ******************/
		/**** md5 signature: 6f7276b908dd6009ce0fd19db811821c ****/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the string contains only 'ascii range' characters.
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the string <self> contains zero character.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsGreater ******************/
		/**** md5 signature: cc3e8af8c1c5a7017ee1ebce259a4360 ****/
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
Returns true if <self> is greater than <other>.
") IsGreater;
		Standard_Boolean IsGreater(const opencascade::handle<TCollection_HExtendedString> & other);

		/****************** IsLess ******************/
		/**** md5 signature: bd54ace886c9b9310105f354ea4429cb ****/
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
Returns true if <self> is less than <other>.
") IsLess;
		Standard_Boolean IsLess(const opencascade::handle<TCollection_HExtendedString> & other);

		/****************** IsSameState ******************/
		/**** md5 signature: 307ce673960649f0ee8c22eeed19ce9a ****/
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

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of characters in <self>. this is the same functionality as 'strlen' in c.
") Length;
		Standard_Integer Length();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Remove ******************/
		/**** md5 signature: f18035a636fe6904f989e7a0f0dd31b8 ****/
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
Erases <ahowmany> characters from position <where>, <where> included. example: astring contains 'hello' astring.erase(2,2) erases 2 characters from position 1 this gives 'hlo'.
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****************** RemoveAll ******************/
		/**** md5 signature: 5cc33317c91574b4016e3809c2016af5 ****/
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

		/****************** Search ******************/
		/**** md5 signature: 6d6eaf0de6de28075a3fdc30b6617dc1 ****/
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
Searches a string in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.
") Search;
		Standard_Integer Search(const opencascade::handle<TCollection_HExtendedString> & what);

		/****************** SearchFromEnd ******************/
		/**** md5 signature: 380fc28610d0074f694a37d7a03affdf ****/
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
Searches a extendedstring in another extendedstring from the end and returns position of first item <what> matching. it returns -1 if not found.
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const opencascade::handle<TCollection_HExtendedString> & what);

		/****************** SetValue ******************/
		/**** md5 signature: 294924c31fc292e1cf9eb136f9d9d649 ****/
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
Replaces one character in the string at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** SetValue ******************/
		/**** md5 signature: 122ca5e6bbf641bb81f1e42c9e12f7ba ****/
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

		/****************** Split ******************/
		/**** md5 signature: af66277d70b09ff10c6a90612af2be25 ****/
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
Splits a extendedstring into two sub-strings. example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.
") Split;
		opencascade::handle<TCollection_HExtendedString> Split(const Standard_Integer where);

		/****************** String ******************/
		/**** md5 signature: 6292e02513881910490f8602aa6e4a72 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the field mystring.
") String;
		const TCollection_ExtendedString & String();

		/****************** ToExtString ******************/
		/**** md5 signature: 0e6e2c1294a386d82229f4b675a40150 ****/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
Returns pointer to extstring.
") ToExtString;
		Standard_ExtString ToExtString();

		/****************** Token ******************/
		/**** md5 signature: 0e847f59efee1d1840c0206a334f3d1e ****/
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
Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns an empty string. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.
") Token;
		opencascade::handle<TCollection_HExtendedString> Token(const Standard_ExtString separators, const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		/**** md5 signature: 7302e52dab6a6849b10a3ed0dd6dc62f ****/
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
Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel'.
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** Value ******************/
		/**** md5 signature: 84bd4561d49bb9835b6ef809ad6dbc29 ****/
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
Returns extcharacter at position <where> in <self>. if <where> is less than zero or greater than the length of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e'.
") Value;
		Standard_ExtCharacter Value(const Standard_Integer where);

};


%make_alias(TCollection_HExtendedString)

%extend TCollection_HExtendedString {
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
def tcollection_NextPrimeForMap(*args):
	return tcollection.NextPrimeForMap(*args)

@deprecated
def TCollection_AsciiString_HashCode(*args):
	return TCollection_AsciiString.HashCode(*args)

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
def TCollection_ExtendedString_HashCode(*args):
	return TCollection_ExtendedString.HashCode(*args)

@deprecated
def TCollection_ExtendedString_IsEqual(*args):
	return TCollection_ExtendedString.IsEqual(*args)

}
