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
%define TCOLLECTIONDOCSTRING
"TCollection module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tcollection.html"
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
from OCC.Core.Exception import *
};

/* public enums */
enum TCollection_Side {
	TCollection_Left = 0,
	TCollection_Right = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class TCollection_Side:
	TCollection_Left = 0
	TCollection_Right = 1
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TCollection_HAsciiString)
%wrap_handle(TCollection_HExtendedString)
%wrap_handle(TCollection_MapNode)
%wrap_handle(TCollection_SeqNode)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef TCollection_MapNode * TCollection_MapNodePtr;
typedef TCollection_SeqNode * TCollection_SeqNodePtr;
/* end typedefs declaration */

/********************
* class TCollection *
********************/
%rename(tcollection) TCollection;
class TCollection {
	public:
		/****************** NextPrimeForMap ******************/
		%feature("compactdefaultargs") NextPrimeForMap;
		%feature("autodoc", "Returns a prime number greater than <i> suitable to dimension a map. when <i> becomes great there is a limit on the result (today the limit is around 1 000 000). this is not a limit of the number of items but a limit in the number of buckets. i.e. there will be more collisions in the map.

Parameters
----------
I: int

Returns
-------
int
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
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring to an empty asciistring.

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString();

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring with a cstring.

Parameters
----------
message: char *

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const char * message);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring with a cstring.

Parameters
----------
message: char *
aLen: int

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const char * message, const Standard_Integer aLen);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring with a single character.

Parameters
----------
aChar: Standard_Character

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Character aChar);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes an asciistring with <length> space allocated. and filled with <filler>. this is usefull for buffers.

Parameters
----------
length: int
filler: Standard_Character

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Integer length, const Standard_Character filler);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes an asciistring with an integer value.

Parameters
----------
value: int

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Integer value);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes an asciistring with a real value.

Parameters
----------
value: float

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_Real value);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring with another asciistring.

Parameters
----------
astring: TCollection_AsciiString

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const TCollection_AsciiString & astring);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Move constructor.

Parameters
----------
theOther: TCollection_AsciiString

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(TCollection_AsciiString & theOther);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring with copy of another asciistring concatenated with the message character.

Parameters
----------
astring: TCollection_AsciiString
message: Standard_Character

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const TCollection_AsciiString & astring, const Standard_Character message);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring with copy of another asciistring concatenated with the message string.

Parameters
----------
astring: TCollection_AsciiString
message: char *

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const TCollection_AsciiString & astring, const char * message);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initializes a asciistring with copy of another asciistring concatenated with the message string.

Parameters
----------
astring: TCollection_AsciiString
message: TCollection_AsciiString

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const TCollection_AsciiString & astring, const TCollection_AsciiString & message);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Creation by converting an extended string to an ascii string. if replacenonascii is non-null charecter, it will be used in place of any non-ascii character found in the source string. otherwise, creates utf-8 unicode string.

Parameters
----------
astring: TCollection_ExtendedString
replaceNonAscii: Standard_Character,optional
	default value is 0

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const TCollection_ExtendedString & astring, const Standard_Character replaceNonAscii = 0);

		/****************** TCollection_AsciiString ******************/
		%feature("compactdefaultargs") TCollection_AsciiString;
		%feature("autodoc", "Initialize utf-8 unicode string from wide-char string considering it as unicode string (the size of wide char is a platform-dependent - e.g. on windows wchar_t is utf-16). //! this constructor is unavailable if application is built with deprecated msvc option '-zc:wchar_t-', since occt itself is never built with this option.

Parameters
----------
theStringUtf: Standard_WideChar *

Returns
-------
None
") TCollection_AsciiString;
		 TCollection_AsciiString(const Standard_WideChar * theStringUtf);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me. this is an unary operator.

Parameters
----------
other: Standard_Character

Returns
-------
None
") AssignCat;
		void AssignCat(const Standard_Character other);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me. this is an unary operator.

Parameters
----------
other: int

Returns
-------
None
") AssignCat;
		void AssignCat(const Standard_Integer other);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me. this is an unary operator.

Parameters
----------
other: float

Returns
-------
None
") AssignCat;
		void AssignCat(const Standard_Real other);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me. this is an unary operator. ex: astring += 'dummy' to catenate more than one cstring, you must put a asciistring before. example: astring += 'hello ' + 'dolly' is not valid ! but astring += anotherstring + 'hello ' + 'dolly' is valid.

Parameters
----------
other: char *

Returns
-------
None
") AssignCat;
		void AssignCat(const char * other);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me. this is an unary operator. example: astring += anotherstring.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
None
") AssignCat;
		void AssignCat(const TCollection_AsciiString & other);

		/****************** Capitalize ******************/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Converts the first character into its corresponding upper-case character and the other characters into lowercase example: before me = 'hello ' after me = 'hello '.

Returns
-------
None
") Capitalize;
		void Capitalize();

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Appends <other> to me. syntax: astring = astring + 'dummy' example: astring contains 'i say ' astring = astring + 'hello ' + 'dolly' gives 'i say hello dolly' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.

Parameters
----------
other: Standard_Character

Returns
-------
TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat(const Standard_Character other);

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Appends <other> to me. syntax: astring = astring + 15; example: astring contains 'i say ' gives 'i say 15' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.

Parameters
----------
other: int

Returns
-------
TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat(const Standard_Integer other);

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Appends <other> to me. syntax: astring = astring + 15.15; example: astring contains 'i say ' gives 'i say 15.15' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.

Parameters
----------
other: float

Returns
-------
TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat(const Standard_Real other);

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Appends <other> to me. syntax: astring = astring + 'dummy' example: astring contains 'i say ' astring = astring + 'hello ' + 'dolly' gives 'i say hello dolly' to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.

Parameters
----------
other: char *

Returns
-------
TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat(const char * other);

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Appends <other> to me. example: astring = astring + anotherstring.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat(const TCollection_AsciiString & other);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Modifies this ascii string so that its length becomes equal to width and the new characters are equal to filler. new characters are added both at the beginning and at the end of this string. if width is less than the length of this ascii string, nothing happens. example tcollection_asciistring myalphabet('abcdef'); myalphabet.center(9,' '); assert ( myalphabet == ' abcdef ' );.

Parameters
----------
Width: int
Filler: Standard_Character

Returns
-------
None
") Center;
		void Center(const Standard_Integer Width, const Standard_Character Filler);

		/****************** ChangeAll ******************/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "Substitutes all the characters equal to achar by newchar in the asciistring <self>. the substitution can be case sensitive. if you don't use default case sensitive, no matter wether achar is uppercase or not. example: me = 'histake' -> changeall('h','m',standard_true) gives me = 'mistake'.

Parameters
----------
aChar: Standard_Character
NewChar: Standard_Character
CaseSensitive: bool,optional
	default value is Standard_True

Returns
-------
None
") ChangeAll;
		void ChangeAll(const Standard_Character aChar, const Standard_Character NewChar, const Standard_Boolean CaseSensitive = Standard_True);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all characters contained in <self>. this produces an empty asciistring.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <fromwhere> to <self>. used as operator = example: astring = anothercstring;.

Parameters
----------
fromwhere: char *

Returns
-------
None
") Copy;
		void Copy(const char * fromwhere);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <fromwhere> to <self>. used as operator = example: astring = anotherstring;.

Parameters
----------
fromwhere: TCollection_AsciiString

Returns
-------
None
") Copy;
		void Copy(const TCollection_AsciiString & fromwhere);

		/****************** EndsWith ******************/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "Determines whether the end of this string instance matches the specified string.

Parameters
----------
theEndString: TCollection_AsciiString

Returns
-------
bool
") EndsWith;
		Standard_Boolean EndsWith(const TCollection_AsciiString & theEndString);

		/****************** FirstLocationInSet ******************/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "Returns the index of the first character of <self> that is present in <set>. the search begins to the index fromindex and ends to the the index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 1.

Parameters
----------
Set: TCollection_AsciiString
FromIndex: int
ToIndex: int

Returns
-------
int
") FirstLocationInSet;
		Standard_Integer FirstLocationInSet(const TCollection_AsciiString & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** FirstLocationNotInSet ******************/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "Returns the index of the first character of <self> that is not present in the set <set>. the search begins to the index fromindex and ends to the the index toindex in <self>. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 3.

Parameters
----------
Set: TCollection_AsciiString
FromIndex: int
ToIndex: int

Returns
-------
int
") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet(const TCollection_AsciiString & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given ascii string, in the range [1, theupperbound]. returns the same integer value as the hash function for tcollection_extendedstring @param theasciistring the ascii string which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theAsciiString: TCollection_AsciiString
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const TCollection_AsciiString & theAsciiString, Standard_Integer theUpperBound);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Inserts a character at position <where>. example: astring contains 'hy not ?' astring.insert(1,'w'); gives 'why not ?' astring contains 'wh' astring.insert(3,'y'); gives 'why' astring contains 'way' astring.insert(2,'h'); gives 'why'.

Parameters
----------
where: int
what: Standard_Character

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const Standard_Character what);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Inserts a cstring at position <where>. example: astring contains 'o more' astring.insert(2,'nce'); gives 'once more'.

Parameters
----------
where: int
what: char *

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const char * what);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Inserts a asciistring at position <where>.

Parameters
----------
where: int
what: TCollection_AsciiString

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const TCollection_AsciiString & what);

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Pushing a string after a specific index in the string <self>. raises an exception if index is out of bounds. - less than 0 (insertafter), or less than 1 (insertbefore), or - greater than the number of characters in this ascii string. example: before me = 'cde' , index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'.

Parameters
----------
Index: int
other: TCollection_AsciiString

Returns
-------
None
") InsertAfter;
		void InsertAfter(const Standard_Integer Index, const TCollection_AsciiString & other);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Pushing a string before a specific index in the string <self>. raises an exception if index is out of bounds. - less than 0 (insertafter), or less than 1 (insertbefore), or - greater than the number of characters in this ascii string. example: before me = 'cde' , index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'.

Parameters
----------
Index: int
other: TCollection_AsciiString

Returns
-------
None
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, const TCollection_AsciiString & other);

		/****************** IntegerValue ******************/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Converts a asciistring containing a numeric expression to an integer. example: '215' returns 215.

Returns
-------
int
") IntegerValue;
		Standard_Integer IntegerValue();

		/****************** IsAscii ******************/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Returns true if the asciistring contains only ascii characters between ' ' and '~'. this means no control character and no extended ascii code.

Returns
-------
bool
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if there are differences between the characters in this ascii string and ascii string other. note that this method is an alias of operator !=.

Parameters
----------
other: char *

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const char * other);

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if there are differences between the characters in this ascii string and ascii string other. note that this method is an alias of operator !=.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const TCollection_AsciiString & other);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the string <self> contains zero character.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the characters in this ascii string are identical to the characters in ascii string other. note that this method is an alias of operator ==.

Parameters
----------
other: char *

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const char * other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the characters in this ascii string are identical to the characters in ascii string other. note that this method is an alias of operator ==.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const TCollection_AsciiString & other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two strings are the same. (just for hashcode for asciistring).

Parameters
----------
string1: TCollection_AsciiString
string2: TCollection_AsciiString

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TCollection_AsciiString & string1, const TCollection_AsciiString & string2);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two strings are the same. (just for hashcode for asciistring).

Parameters
----------
string1: TCollection_AsciiString
string2: char *

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TCollection_AsciiString & string1, const char * string2);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns true if <self> is 'ascii' greater than <other>.

Parameters
----------
other: char *

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const char * other);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns true if <self> is 'ascii' greater than <other>.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const TCollection_AsciiString & other);

		/****************** IsIntegerValue ******************/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Returns true if the asciistring contains an integer value. note: an integer value is considered to be a real value as well.

Returns
-------
bool
") IsIntegerValue;
		Standard_Boolean IsIntegerValue();

		/****************** IsLess ******************/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "Returns true if <self> is 'ascii' less than <other>.

Parameters
----------
other: char *

Returns
-------
bool
") IsLess;
		Standard_Boolean IsLess(const char * other);

		/****************** IsLess ******************/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "Returns true if <self> is 'ascii' less than <other>.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
bool
") IsLess;
		Standard_Boolean IsLess(const TCollection_AsciiString & other);

		/****************** IsRealValue ******************/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "Returns true if the asciistring contains a real value. note: an integer value is considered to be a real value as well.

Returns
-------
bool
") IsRealValue;
		Standard_Boolean IsRealValue();

		/****************** IsSameString ******************/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "Returns true if the strings contain same characters.

Parameters
----------
theString1: TCollection_AsciiString
theString2: TCollection_AsciiString
theIsCaseSensitive: bool

Returns
-------
bool
") IsSameString;
		static Standard_Boolean IsSameString(const TCollection_AsciiString & theString1, const TCollection_AsciiString & theString2, const Standard_Boolean theIsCaseSensitive);

		/****************** LeftAdjust ******************/
		%feature("compactdefaultargs") LeftAdjust;
		%feature("autodoc", "Removes all space characters in the begining of the string.

Returns
-------
None
") LeftAdjust;
		void LeftAdjust();

		/****************** LeftJustify ******************/
		%feature("compactdefaultargs") LeftJustify;
		%feature("autodoc", "Left justify length becomes equal to width and the new characters are equal to filler. if width < length nothing happens. raises an exception if width is less than zero. example: before me = 'abcdef' , width = 9 , filler = ' ' after me = 'abcdef '.

Parameters
----------
Width: int
Filler: Standard_Character

Returns
-------
None
") LeftJustify;
		void LeftJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns number of characters in <self>. this is the same functionality as 'strlen' in c. example tcollection_asciistring myalphabet('abcdef'); assert ( myalphabet.length() == 6 ); - 1 is the position of the first character in this string. - the length of this string gives the position of its last character. - positions less than or equal to zero, or greater than the length of this string are invalid in functions which identify a character of this string by its position.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns an index in the string <self> of the first occurence of the string s in the string <self> from the starting index fromindex to the ending index toindex returns zero if failure raises an exception if fromindex or toindex is out of range. example: before me = 'aabaaaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabaaaa' returns 4.

Parameters
----------
other: TCollection_AsciiString
FromIndex: int
ToIndex: int

Returns
-------
int
") Location;
		Standard_Integer Location(const TCollection_AsciiString & other, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the index of the nth occurence of the character c in the string <self> from the starting index fromindex to the ending index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabaa', n = 3, c = 'a', fromindex = 1, toindex = 5 after me = 'aabaa' returns 5.

Parameters
----------
N: int
C: Standard_Character
FromIndex: int
ToIndex: int

Returns
-------
int
") Location;
		Standard_Integer Location(const Standard_Integer N, const Standard_Character C, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** LowerCase ******************/
		%feature("compactdefaultargs") LowerCase;
		%feature("autodoc", "Converts <self> to its lower-case equivalent. example tcollection_asciistring mystring('hello dolly'); mystring.uppercase(); assert ( mystring == 'hello dolly' ); mystring.lowercase(); assert ( mystring == 'hello dolly' );.

Returns
-------
None
") LowerCase;
		void LowerCase();

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "Inserts the string other at the beginning of this ascii string. example tcollection_asciistring myalphabet('cde'); tcollection_asciistring mybegin('ab'); myalphabet.prepend(mybegin); assert ( myalphabet == 'abcde' );.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
None
") Prepend;
		void Prepend(const TCollection_AsciiString & other);


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
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Converts an asciistring containing a numeric expression. to a real. example: ex: '215' returns 215.0. ex: '3.14159267' returns 3.14159267.

Returns
-------
float
") RealValue;
		Standard_Real RealValue();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Erases <ahowmany> characters from position <where>, <where> included. example: astring contains 'hello' astring.remove(2,2) erases 2 characters from position 2 this gives 'hlo'.

Parameters
----------
where: int
ahowmany: int,optional
	default value is 1

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****************** RemoveAll ******************/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Remove all the occurences of the character c in the string. example: before me = 'hellllo', c = 'l' , casesensitive = true after me = 'hello'.

Parameters
----------
C: Standard_Character
CaseSensitive: bool

Returns
-------
None
") RemoveAll;
		void RemoveAll(const Standard_Character C, const Standard_Boolean CaseSensitive);

		/****************** RemoveAll ******************/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Removes every <what> characters from <self>.

Parameters
----------
what: Standard_Character

Returns
-------
None
") RemoveAll;
		void RemoveAll(const Standard_Character what);

		/****************** RightAdjust ******************/
		%feature("compactdefaultargs") RightAdjust;
		%feature("autodoc", "Removes all space characters at the end of the string.

Returns
-------
None
") RightAdjust;
		void RightAdjust();

		/****************** RightJustify ******************/
		%feature("compactdefaultargs") RightJustify;
		%feature("autodoc", "Right justify. length becomes equal to width and the new characters are equal to filler. if width < length nothing happens. raises an exception if width is less than zero. example: before me = 'abcdef' , width = 9 , filler = ' ' after me = ' abcdef'.

Parameters
----------
Width: int
Filler: Standard_Character

Returns
-------
None
") RightJustify;
		void RightJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches a cstring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.search('le') returns 5.

Parameters
----------
what: char *

Returns
-------
int
") Search;
		Standard_Integer Search(const char * what);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches an asciistring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_AsciiString

Returns
-------
int
") Search;
		Standard_Integer Search(const TCollection_AsciiString & what);

		/****************** SearchFromEnd ******************/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "Searches a cstring in a asciistring from the end and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.searchfromend('le') returns 12.

Parameters
----------
what: char *

Returns
-------
int
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const char * what);

		/****************** SearchFromEnd ******************/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "Searches a asciistring in another asciistring from the end and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_AsciiString

Returns
-------
int
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const TCollection_AsciiString & what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces one character in the asciistring at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.

Parameters
----------
where: int
what: Standard_Character

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_Character what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces a part of <self> by a cstring. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'abcde' astring.setvalue(4,'1234567') gives <self> = 'abc1234567'.

Parameters
----------
where: int
what: char *

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const char * what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces a part of <self> by another asciistring.

Parameters
----------
where: int
what: TCollection_AsciiString

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const TCollection_AsciiString & what);

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "Splits a asciistring into two sub-strings. example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.

Parameters
----------
where: int

Returns
-------
TCollection_AsciiString
") Split;
		TCollection_AsciiString Split(const Standard_Integer where);

		/****************** StartsWith ******************/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "Determines whether the beginning of this string instance matches the specified string.

Parameters
----------
theStartString: TCollection_AsciiString

Returns
-------
bool
") StartsWith;
		Standard_Boolean StartsWith(const TCollection_AsciiString & theStartString);

		/****************** SubString ******************/
		%feature("compactdefaultargs") SubString;
		%feature("autodoc", "Creation of a sub-string of the string <self>. the sub-string starts to the index fromindex and ends to the index toindex. raises an exception if toindex or fromindex is out of bounds example: before me = 'abcdefg', toindex=3, fromindex=6 after me = 'abcdefg' returns 'cdef'.

Parameters
----------
FromIndex: int
ToIndex: int

Returns
-------
TCollection_AsciiString
") SubString;
		TCollection_AsciiString SubString(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Exchange the data of two strings (without reallocating memory).

Parameters
----------
theOther: TCollection_AsciiString

Returns
-------
None
") Swap;
		void Swap(TCollection_AsciiString & theOther);

		/****************** ToCString ******************/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Returns pointer to asciistring (char *). this is useful for some casual manipulations. warning: because this 'char *' is 'const', you can't modify its contents.

Returns
-------
char *
") ToCString;
		const char * ToCString();

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns empty asciistring. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed : astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.

Parameters
----------
separators: char *,optional
	default value is '\t'
whichone: int,optional
	default value is 1

Returns
-------
TCollection_AsciiString
") Token;
		TCollection_AsciiString Token(const char * separators = "\t", const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel'.

Parameters
----------
ahowmany: int

Returns
-------
None
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** UpperCase ******************/
		%feature("compactdefaultargs") UpperCase;
		%feature("autodoc", "Converts <self> to its upper-case equivalent.

Returns
-------
None
") UpperCase;
		void UpperCase();

		/****************** UsefullLength ******************/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Length of the string ignoring all spaces (' ') and the control character at the end.

Returns
-------
int
") UsefullLength;
		Standard_Integer UsefullLength();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns character at position <where> in <self>. if <where> is less than zero or greater than the lenght of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e'.

Parameters
----------
where: int

Returns
-------
Standard_Character
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
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: Standard_Character

Returns
-------
TCollection_AsciiString
") operator +;
		TCollection_AsciiString operator +(const Standard_Character other);

		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: int

Returns
-------
TCollection_AsciiString
") operator +;
		TCollection_AsciiString operator +(const Standard_Integer other);

		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: float

Returns
-------
TCollection_AsciiString
") operator +;
		TCollection_AsciiString operator +(const Standard_Real other);

		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: char *

Returns
-------
TCollection_AsciiString
") operator +;
		TCollection_AsciiString operator +(const char * other);

		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: TCollection_AsciiString

Returns
-------
TCollection_AsciiString
") operator +;
		TCollection_AsciiString operator +(const TCollection_AsciiString & other);


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

/*********************************
* class TCollection_BaseSequence *
*********************************/
%nodefaultctor TCollection_BaseSequence;
class TCollection_BaseSequence {
	public:
		/****************** Exchange ******************/
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "Swaps elements which are located at positions <i> and <j> in <self>. raises an exception if i or j is out of bound. example: before me = (a b c), i = 1, j = 3 after me = (c b a).

Parameters
----------
I: int
J: int

Returns
-------
None
") Exchange;
		void Exchange(const Standard_Integer I, const Standard_Integer J);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the sequence <self> contains no elements.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of element(s) in the sequence. returns zero if the sequence is empty.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the order of items on <self>. example: before me = (a b c) after me = (c b a).

Returns
-------
None
") Reverse;
		void Reverse();

};


%extend TCollection_BaseSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TCollection_BasicMap *
*****************************/
%nodefaultctor TCollection_BasicMap;
class TCollection_BasicMap {
	public:
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Returns the number of keys already stored in <self>.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true when the map contains no keys. this is exactly extent() == 0.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NbBuckets ******************/
		%feature("compactdefaultargs") NbBuckets;
		%feature("autodoc", "Returns the number of buckets in <self>.

Returns
-------
int
") NbBuckets;
		Standard_Integer NbBuckets();


        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
};


%extend TCollection_BasicMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TCollection_BasicMapIterator *
*************************************/
%nodefaultctor TCollection_BasicMapIterator;
class TCollection_BasicMapIterator {
	public:
		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current entry for this iterator in the map. use the function next to set this iterator to the position of the next entry, if it exists.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets this iterator to the position of the next entry of the map. nothing is changed if there is no more entry to explore in the map: this iterator is always positioned on the last entry of the map but the function more returns false.

Returns
-------
None
") Next;
		void Next();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Resets the iterator to the first node.

Returns
-------
None
") Reset;
		void Reset();

};


%extend TCollection_BasicMapIterator {
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
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initializes a extendedstring to an empty extendedstring.

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString();

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Creation by converting a cstring to an extended string. if <ismultibyte> is true then the string is treated as having utf-8 coding. if it is not a utf-8 then <ismultibyte> is ignored and each character is copied to extcharacter.

Parameters
----------
astring: char *
isMultiByte: bool,optional
	default value is Standard_False

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const char * astring, const Standard_Boolean isMultiByte = Standard_False);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Creation by converting an extstring to an extended string.

Parameters
----------
astring: Standard_ExtString

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_ExtString astring);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initialize from wide-char string considering it as unicode string (the size of wide char is a platform-dependent - e.g. on windows wchar_t is utf-16). //! this constructor is unavailable if application is built with deprecated msvc option '-zc:wchar_t-', since occt itself is never built with this option.

Parameters
----------
theStringUtf: Standard_WideChar *

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_WideChar * theStringUtf);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initializes a asciistring with a single character.

Parameters
----------
aChar: Standard_Character

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Character aChar);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initializes a extendedstring with a single character.

Parameters
----------
aChar: Standard_ExtCharacter

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_ExtCharacter aChar);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initializes a extendedstring with <length> space allocated. and filled with <filler>.this is useful for buffers.

Parameters
----------
length: int
filler: Standard_ExtCharacter

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Integer length, const Standard_ExtCharacter filler);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initializes an extendedstring with an integer value.

Parameters
----------
value: int

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Integer value);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initializes an extendedstring with a real value.

Parameters
----------
value: float

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const Standard_Real value);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Initializes a extendedstring with another extendedstring.

Parameters
----------
astring: TCollection_ExtendedString

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const TCollection_ExtendedString & astring);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Move constructor.

Parameters
----------
theOther: TCollection_ExtendedString

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(TCollection_ExtendedString & theOther);

		/****************** TCollection_ExtendedString ******************/
		%feature("compactdefaultargs") TCollection_ExtendedString;
		%feature("autodoc", "Creation by converting an ascii string to an extended string. the string is treated as having utf-8 coding. if it is not a utf-8 then each character is copied to extcharacter.

Parameters
----------
astring: TCollection_AsciiString

Returns
-------
None
") TCollection_ExtendedString;
		 TCollection_ExtendedString(const TCollection_AsciiString & astring);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends the other extended string to this extended string. note that this method is an alias of operator +=. example: astring += anotherstring.

Parameters
----------
other: TCollection_ExtendedString

Returns
-------
None
") AssignCat;
		void AssignCat(const TCollection_ExtendedString & other);

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Appends <other> to me.

Parameters
----------
other: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") Cat;
		TCollection_ExtendedString Cat(const TCollection_ExtendedString & other);

		/****************** ChangeAll ******************/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "Substitutes all the characters equal to achar by newchar in the extendedstring <self>. the substitution can be case sensitive. if you don't use default case sensitive, no matter wether achar is uppercase or not.

Parameters
----------
aChar: Standard_ExtCharacter
NewChar: Standard_ExtCharacter

Returns
-------
None
") ChangeAll;
		void ChangeAll(const Standard_ExtCharacter aChar, const Standard_ExtCharacter NewChar);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all characters contained in <self>. this produces an empty extendedstring.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <fromwhere> to <self>. used as operator =.

Parameters
----------
fromwhere: TCollection_ExtendedString

Returns
-------
None
") Copy;
		void Copy(const TCollection_ExtendedString & fromwhere);

		/****************** EndsWith ******************/
		%feature("compactdefaultargs") EndsWith;
		%feature("autodoc", "Determines whether the end of this string instance matches the specified string.

Parameters
----------
theEndString: TCollection_ExtendedString

Returns
-------
bool
") EndsWith;
		Standard_Boolean EndsWith(const TCollection_ExtendedString & theEndString);

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns a hashed value for the extended string within the range 1 .. theupper. note: if string is ascii, the computed value is the same as the value computed with the hashcode function on a tcollection_asciistring string composed with equivalent ascii characters. @param theextendedstring the extended string which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theString: TCollection_ExtendedString
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const TCollection_ExtendedString & theString, const Standard_Integer theUpperBound);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a character at position <where>.

Parameters
----------
where: int
what: Standard_ExtCharacter

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a extendedstring at position <where>.

Parameters
----------
where: int
what: TCollection_ExtendedString

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const TCollection_ExtendedString & what);

		/****************** IsAscii ******************/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Returns true if the extendedstring contains only 'ascii range' characters .

Returns
-------
bool
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if there are differences between the characters in this extended string and the other extended string. note that this method is an alias of operator !=.

Parameters
----------
other: Standard_ExtString

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const Standard_ExtString other);

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if there are differences between the characters in this extended string and the other extended string. note that this method is an alias of operator !=.

Parameters
----------
other: TCollection_ExtendedString

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const TCollection_ExtendedString & other);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if this string contains no characters.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the characters in this extended string are identical to the characters in the other extended string. note that this method is an alias of operator ==.

Parameters
----------
other: Standard_ExtString

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Standard_ExtString other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the characters in this extended string are identical to the characters in the other extended string. note that this method is an alias of operator ==.

Parameters
----------
other: TCollection_ExtendedString

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const TCollection_ExtendedString & other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the characters in this extended string are identical to the characters in the other extended string. note that this method is an alias of operator ==.

Parameters
----------
theString1: TCollection_ExtendedString
theString2: TCollection_ExtendedString

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TCollection_ExtendedString & theString1, const TCollection_ExtendedString & theString2);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns true if <self> is greater than <other>.

Parameters
----------
other: Standard_ExtString

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const Standard_ExtString other);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns true if <self> is greater than <other>.

Parameters
----------
other: TCollection_ExtendedString

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const TCollection_ExtendedString & other);

		/****************** IsLess ******************/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "Returns true if <self> is less than <other>.

Parameters
----------
other: Standard_ExtString

Returns
-------
bool
") IsLess;
		Standard_Boolean IsLess(const Standard_ExtString other);

		/****************** IsLess ******************/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "Returns true if <self> is less than <other>.

Parameters
----------
other: TCollection_ExtendedString

Returns
-------
bool
") IsLess;
		Standard_Boolean IsLess(const TCollection_ExtendedString & other);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of 16-bit code units (might be greater than number of unicode symbols if string contains surrogate pairs).

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** LengthOfCString ******************/
		%feature("compactdefaultargs") LengthOfCString;
		%feature("autodoc", "Returns expected cstring length in utf8 coding. it can be used for memory calculation before converting to cstring containing symbols in utf8 coding.

Returns
-------
int
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Erases <ahowmany> characters from position <where>,<where> included.

Parameters
----------
where: int
ahowmany: int,optional
	default value is 1

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****************** RemoveAll ******************/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Removes every <what> characters from <self>.

Parameters
----------
what: Standard_ExtCharacter

Returns
-------
None
") RemoveAll;
		void RemoveAll(const Standard_ExtCharacter what);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches a extendedstring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_ExtendedString

Returns
-------
int
") Search;
		Standard_Integer Search(const TCollection_ExtendedString & what);

		/****************** SearchFromEnd ******************/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "Searches a extendedstring in another extendedstring from the end and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_ExtendedString

Returns
-------
int
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const TCollection_ExtendedString & what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces one character in the extendedstring at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised.

Parameters
----------
where: int
what: Standard_ExtCharacter

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces a part of <self> by another extendedstring see above.

Parameters
----------
where: int
what: TCollection_ExtendedString

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const TCollection_ExtendedString & what);

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "Splits this extended string into two sub-strings at position where. - the second sub-string (from position where + 1 of this string to the end) is returned in a new extended string. - this extended string is modified: its last characters are removed, it becomes equal to the first sub-string (from the first character to position where). example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.

Parameters
----------
where: int

Returns
-------
TCollection_ExtendedString
") Split;
		TCollection_ExtendedString Split(const Standard_Integer where);

		/****************** StartsWith ******************/
		%feature("compactdefaultargs") StartsWith;
		%feature("autodoc", "Determines whether the beginning of this string instance matches the specified string.

Parameters
----------
theStartString: TCollection_ExtendedString

Returns
-------
bool
") StartsWith;
		Standard_Boolean StartsWith(const TCollection_ExtendedString & theStartString);

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Exchange the data of two strings (without reallocating memory).

Parameters
----------
theOther: TCollection_ExtendedString

Returns
-------
None
") Swap;
		void Swap(TCollection_ExtendedString & theOther);

		/****************** ToExtString ******************/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Returns pointer to extstring.

Returns
-------
Standard_ExtString
") ToExtString;
		Standard_ExtString ToExtString();

		/****************** ToUTF8CString ******************/
		%feature("compactdefaultargs") ToUTF8CString;
		%feature("autodoc", "Converts the internal <mystring> to utf8 coding and returns length of the out cstring. a memory for the <thecstring> should be allocated before call!.

Parameters
----------
theCString: Standard_PCharacter

Returns
-------
int
") ToUTF8CString;
		Standard_Integer ToUTF8CString(Standard_PCharacter & theCString);

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns an empty asciistring. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed : astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.

Parameters
----------
separators: Standard_ExtString
whichone: int,optional
	default value is 1

Returns
-------
TCollection_ExtendedString
") Token;
		TCollection_ExtendedString Token(const Standard_ExtString separators, const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel' exceptions standard_outofrange if ahowmany is greater than the length of this string.

Parameters
----------
ahowmany: int

Returns
-------
None
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns character at position <where> in <self>. if <where> is less than zero or greater than the lenght of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e' exceptions standard_outofrange if where lies outside the bounds of this extended string.

Parameters
----------
where: int

Returns
-------
Standard_ExtCharacter
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
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") operator +;
		TCollection_ExtendedString operator +(const TCollection_ExtendedString & other);


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
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring to an empty asciistring.

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString();

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with a cstring.

Parameters
----------
message: char *

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const char * message);

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with a single character.

Parameters
----------
aChar: Standard_Character

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Character aChar);

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with <length> space allocated. and filled with <filler>.this is useful for buffers.

Parameters
----------
length: int
filler: Standard_Character

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Integer length, const Standard_Character filler);

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with an integer value.

Parameters
----------
value: int

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Integer value);

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with a real value.

Parameters
----------
value: float

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const Standard_Real value);

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with a hasciistring.

Parameters
----------
aString: TCollection_AsciiString

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const TCollection_AsciiString & aString);

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with a hasciistring.

Parameters
----------
aString: TCollection_HAsciiString

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const opencascade::handle<TCollection_HAsciiString> & aString);

		/****************** TCollection_HAsciiString ******************/
		%feature("compactdefaultargs") TCollection_HAsciiString;
		%feature("autodoc", "Initializes a hasciistring with a hasciistring. if replacenonascii is non-null charecter, it will be used in place of any non-ascii character found in the source string. otherwise, raises outofrange exception if at least one character in the source string is not in the 'ascii range'.

Parameters
----------
aString: TCollection_HExtendedString
replaceNonAscii: Standard_Character

Returns
-------
None
") TCollection_HAsciiString;
		 TCollection_HAsciiString(const opencascade::handle<TCollection_HExtendedString> & aString, const Standard_Character replaceNonAscii);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me.

Parameters
----------
other: char *

Returns
-------
None
") AssignCat;
		void AssignCat(const char * other);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me. example: astring = astring + anotherstring.

Parameters
----------
other: TCollection_HAsciiString

Returns
-------
None
") AssignCat;
		void AssignCat(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** Capitalize ******************/
		%feature("compactdefaultargs") Capitalize;
		%feature("autodoc", "Converts the first character into its corresponding upper-case character and the other characters into lowercase. example: before me = 'hello ' after me = 'hello '.

Returns
-------
None
") Capitalize;
		void Capitalize();

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Creates a new string by concatenation of this ascii string and the other ascii string. example: astring = astring + anotherstring astring = astring + 'dummy' astring contains 'i say ' astring = astring + 'hello ' + 'dolly' gives 'i say hello dolly' warning: to catenate more than one cstring, you must put a string before. so the following example is wrong ! astring = 'hello ' + 'dolly' this is not allowed this rule is applicable to assigncat (operator +=) too.

Parameters
----------
other: char *

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Cat;
		opencascade::handle<TCollection_HAsciiString> Cat(const char * other);

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Creates a new string by concatenation of this ascii string and the other ascii string. example: astring = astring + anotherstring.

Parameters
----------
other: TCollection_HAsciiString

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Cat;
		opencascade::handle<TCollection_HAsciiString> Cat(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Modifies this ascii string so that its length becomes equal to width and the new characters are equal to filler. new characters are added both at the beginning and at the end of this string. if width is less than the length of this ascii string, nothing happens. example opencascade::handle<tcollection_hasciistring> myalphabet = new tcollection_hasciistring ('abcdef'); myalphabet->center(9,' '); assert ( !strcmp( myalphabet->tocstring(), ' abcdef ') );.

Parameters
----------
Width: int
Filler: Standard_Character

Returns
-------
None
") Center;
		void Center(const Standard_Integer Width, const Standard_Character Filler);

		/****************** ChangeAll ******************/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "Replaces all characters equal to achar by newchar in this ascii string. the substitution is case sensitive if casesensitive is true (default value). if you do not use the default case sensitive option, it does not matter whether achar is upper-case or not. example opencascade::handle<tcollection_hasciistring> mymistake = new tcollection_hasciistring ('hather'); mymistake->changeall('h','f'); assert ( !strcmp( mymistake->tocstring(), 'father') );.

Parameters
----------
aChar: Standard_Character
NewChar: Standard_Character
CaseSensitive: bool,optional
	default value is Standard_True

Returns
-------
None
") ChangeAll;
		void ChangeAll(const Standard_Character aChar, const Standard_Character NewChar, const Standard_Boolean CaseSensitive = Standard_True);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all characters contained in <self>. this produces an empty hasciistring.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FirstLocationInSet ******************/
		%feature("compactdefaultargs") FirstLocationInSet;
		%feature("autodoc", "Returns the index of the first character of <self> that is present in <set>. the search begins to the index fromindex and ends to the the index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 1.

Parameters
----------
Set: TCollection_HAsciiString
FromIndex: int
ToIndex: int

Returns
-------
int
") FirstLocationInSet;
		Standard_Integer FirstLocationInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** FirstLocationNotInSet ******************/
		%feature("compactdefaultargs") FirstLocationNotInSet;
		%feature("autodoc", "Returns the index of the first character of <self> that is not present in the set <set>. the search begins to the index fromindex and ends to the the index toindex in <self>. returns zero if failure. raises an exception if fromindex or toindex is out of range. example: before me = 'aabacaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabacaa' returns 3.

Parameters
----------
Set: TCollection_HAsciiString
FromIndex: int
ToIndex: int

Returns
-------
int
") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet(const opencascade::handle<TCollection_HAsciiString> & Set, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a character at position <where>. example: astring contains 'hy not ?' astring.insert(1,'w'); gives 'why not ?' astring contains 'wh' astring.insert(3,'y'); gives 'why' astring contains 'way' astring.insert(2,'h'); gives 'why'.

Parameters
----------
where: int
what: Standard_Character

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const Standard_Character what);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a hasciistring at position <where>.

Parameters
----------
where: int
what: char *

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const char * what);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a hasciistring at position <where>.

Parameters
----------
where: int
what: TCollection_HAsciiString

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const opencascade::handle<TCollection_HAsciiString> & what);

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the other ascii string a after a specific index in the string <self> example: before me = 'cde' , index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'.

Parameters
----------
Index: int
other: TCollection_HAsciiString

Returns
-------
None
") InsertAfter;
		void InsertAfter(const Standard_Integer Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the other ascii string a before a specific index in the string <self> raises an exception if index is out of bounds example: before me = 'cde' , index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'.

Parameters
----------
Index: int
other: TCollection_HAsciiString

Returns
-------
None
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** IntegerValue ******************/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Converts a hasciistring containing a numeric expression to an integer. example: '215' returns 215.

Returns
-------
int
") IntegerValue;
		Standard_Integer IntegerValue();

		/****************** IsAscii ******************/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Returns true if the string contains only ascii characters between ' ' and '~'. this means no control character and no extended ascii code.

Returns
-------
bool
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if the string s not contains same characters than the string <self>.

Parameters
----------
S: TCollection_HAsciiString

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const opencascade::handle<TCollection_HAsciiString> & S);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the string <self> contains zero character.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns true if <self> is 'ascii' greater than <other>.

Parameters
----------
other: TCollection_HAsciiString

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** IsIntegerValue ******************/
		%feature("compactdefaultargs") IsIntegerValue;
		%feature("autodoc", "Returns true if the string contains an integer value.

Returns
-------
bool
") IsIntegerValue;
		Standard_Boolean IsIntegerValue();

		/****************** IsLess ******************/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "Returns true if <self> is 'ascii' less than <other>.

Parameters
----------
other: TCollection_HAsciiString

Returns
-------
bool
") IsLess;
		Standard_Boolean IsLess(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** IsRealValue ******************/
		%feature("compactdefaultargs") IsRealValue;
		%feature("autodoc", "Returns true if the string contains a real value.

Returns
-------
bool
") IsRealValue;
		Standard_Boolean IsRealValue();

		/****************** IsSameState ******************/
		%feature("compactdefaultargs") IsSameState;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: TCollection_HAsciiString

Returns
-------
bool
") IsSameState;
		Standard_Boolean IsSameState(const opencascade::handle<TCollection_HAsciiString> & other);

		/****************** IsSameString ******************/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "Returns true if the string s contains same characters than the string <self>.

Parameters
----------
S: TCollection_HAsciiString

Returns
-------
bool
") IsSameString;
		Standard_Boolean IsSameString(const opencascade::handle<TCollection_HAsciiString> & S);

		/****************** IsSameString ******************/
		%feature("compactdefaultargs") IsSameString;
		%feature("autodoc", "Returns true if the string s contains same characters than the string <self>.

Parameters
----------
S: TCollection_HAsciiString
CaseSensitive: bool

Returns
-------
bool
") IsSameString;
		Standard_Boolean IsSameString(const opencascade::handle<TCollection_HAsciiString> & S, const Standard_Boolean CaseSensitive);

		/****************** LeftAdjust ******************/
		%feature("compactdefaultargs") LeftAdjust;
		%feature("autodoc", "Removes all space characters in the begining of the string.

Returns
-------
None
") LeftAdjust;
		void LeftAdjust();

		/****************** LeftJustify ******************/
		%feature("compactdefaultargs") LeftJustify;
		%feature("autodoc", "Left justify. length becomes equal to width and the new characters are equal to filler if width < length nothing happens raises an exception if width is less than zero example: before me = 'abcdef' , width = 9 , filler = ' ' after me = 'abcdef '.

Parameters
----------
Width: int
Filler: Standard_Character

Returns
-------
None
") LeftJustify;
		void LeftJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns number of characters in <self>. this is the same functionality as 'strlen' in c.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns an index in the string <self> of the first occurence of the string s in the string <self> from the starting index fromindex to the ending index toindex returns zero if failure raises an exception if fromindex or toindex is out of range. example: before me = 'aabaaaa', s = 'aa', fromindex = 1, toindex = 7 after me = 'aabaaaa' returns 4.

Parameters
----------
other: TCollection_HAsciiString
FromIndex: int
ToIndex: int

Returns
-------
int
") Location;
		Standard_Integer Location(const opencascade::handle<TCollection_HAsciiString> & other, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the index of the nth occurence of the character c in the string <self> from the starting index fromindex to the ending index toindex. returns zero if failure. raises an exception if fromindex or toindex is out of range example: before me = 'aabaa', n = 3, c = 'a', fromindex = 1, toindex = 5 after me = 'aabaa' returns 5.

Parameters
----------
N: int
C: Standard_Character
FromIndex: int
ToIndex: int

Returns
-------
int
") Location;
		Standard_Integer Location(const Standard_Integer N, const Standard_Character C, const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** LowerCase ******************/
		%feature("compactdefaultargs") LowerCase;
		%feature("autodoc", "Converts <self> to its lower-case equivalent.

Returns
-------
None
") LowerCase;
		void LowerCase();

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "Inserts the other string at the begining of the string <self> example: before me = 'cde' , s = 'ab' after me = 'abcde' , s = 'ab'.

Parameters
----------
other: TCollection_HAsciiString

Returns
-------
None
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
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Converts a string containing a numeric expression to a real. example: '215' returns 215.0. '3.14159267' returns 3.14159267.

Returns
-------
float
") RealValue;
		Standard_Real RealValue();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Erases <ahowmany> characters from position <where>, <where> included. example: astring contains 'hello' astring.erase(2,2) erases 2 characters from position 1 this gives 'hlo'.

Parameters
----------
where: int
ahowmany: int,optional
	default value is 1

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****************** RemoveAll ******************/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Remove all the occurences of the character c in the string example: before me = 'hellllo', c = 'l' , casesensitive = true after me = 'hello'.

Parameters
----------
C: Standard_Character
CaseSensitive: bool

Returns
-------
None
") RemoveAll;
		void RemoveAll(const Standard_Character C, const Standard_Boolean CaseSensitive);

		/****************** RemoveAll ******************/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Removes every <what> characters from <self>.

Parameters
----------
what: Standard_Character

Returns
-------
None
") RemoveAll;
		void RemoveAll(const Standard_Character what);

		/****************** RightAdjust ******************/
		%feature("compactdefaultargs") RightAdjust;
		%feature("autodoc", "Removes all space characters at the end of the string.

Returns
-------
None
") RightAdjust;
		void RightAdjust();

		/****************** RightJustify ******************/
		%feature("compactdefaultargs") RightJustify;
		%feature("autodoc", "Right justify. length becomes equal to width and the new characters are equal to filler if width < length nothing happens raises an exception if width is less than zero example: before me = 'abcdef' , width = 9 , filler = ' ' after me = ' abcdef'.

Parameters
----------
Width: int
Filler: Standard_Character

Returns
-------
None
") RightJustify;
		void RightJustify(const Standard_Integer Width, const Standard_Character Filler);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches a cstring in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.search('le') returns 5.

Parameters
----------
what: char *

Returns
-------
int
") Search;
		Standard_Integer Search(const char * what);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches a string in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_HAsciiString

Returns
-------
int
") Search;
		Standard_Integer Search(const opencascade::handle<TCollection_HAsciiString> & what);

		/****************** SearchFromEnd ******************/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "Searches a cstring in a string from the end and returns position of first item <what> matching. it returns -1 if not found. example: astring contains 'sample single test' astring.searchfromend('le') returns 12.

Parameters
----------
what: char *

Returns
-------
int
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const char * what);

		/****************** SearchFromEnd ******************/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "Searches a hasciistring in another hasciistring from the end and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_HAsciiString

Returns
-------
int
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const opencascade::handle<TCollection_HAsciiString> & what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces one character in the string at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.

Parameters
----------
where: int
what: Standard_Character

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_Character what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces a part of <self> in the string at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.

Parameters
----------
where: int
what: char *

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const char * what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces a part of <self> by another string.

Parameters
----------
where: int
what: TCollection_HAsciiString

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const opencascade::handle<TCollection_HAsciiString> & what);

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "Splits a hasciistring into two sub-strings. example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.

Parameters
----------
where: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Split;
		opencascade::handle<TCollection_HAsciiString> Split(const Standard_Integer where);

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns the field mystring.

Returns
-------
TCollection_AsciiString
") String;
		const TCollection_AsciiString & String();

		/****************** SubString ******************/
		%feature("compactdefaultargs") SubString;
		%feature("autodoc", "Creation of a sub-string of the string <self>. the sub-string starts to the index fromindex and ends to the index toindex. raises an exception if toindex or fromindex is out of bounds example: before me = 'abcdefg', toindex=3, fromindex=6 after me = 'abcdefg' returns 'cdef'.

Parameters
----------
FromIndex: int
ToIndex: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SubString;
		opencascade::handle<TCollection_HAsciiString> SubString(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** ToCString ******************/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Returns pointer to string (char *) this is useful for some casual manipulations because this 'char *' is 'const', you can't modify its contents.

Returns
-------
char *
") ToCString;
		const char * ToCString();

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns an empty string. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.

Parameters
----------
separators: char *,optional
	default value is '\t'
whichone: int,optional
	default value is 1

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Token;
		opencascade::handle<TCollection_HAsciiString> Token(const char * separators = "\t", const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel'.

Parameters
----------
ahowmany: int

Returns
-------
None
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** UpperCase ******************/
		%feature("compactdefaultargs") UpperCase;
		%feature("autodoc", "Converts <self> to its upper-case equivalent.

Returns
-------
None
") UpperCase;
		void UpperCase();

		/****************** UsefullLength ******************/
		%feature("compactdefaultargs") UsefullLength;
		%feature("autodoc", "Length of the string ignoring all spaces (' ') and the control character at the end.

Returns
-------
int
") UsefullLength;
		Standard_Integer UsefullLength();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns character at position <where> in <self>. if <where> is less than zero or greater than the lenght of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e'.

Parameters
----------
where: int

Returns
-------
Standard_Character
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
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring to an empty extendedstring.

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString();

		/****************** TCollection_HExtendedString ******************/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring with a cstring.

Parameters
----------
message: char *

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const char * message);

		/****************** TCollection_HExtendedString ******************/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring with an extstring.

Parameters
----------
message: Standard_ExtString

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_ExtString message);

		/****************** TCollection_HExtendedString ******************/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring with a single character.

Parameters
----------
aChar: Standard_ExtCharacter

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_ExtCharacter aChar);

		/****************** TCollection_HExtendedString ******************/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring with <length> space allocated. and filled with <filler>.this is usefull for buffers.

Parameters
----------
length: int
filler: Standard_ExtCharacter

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const Standard_Integer length, const Standard_ExtCharacter filler);

		/****************** TCollection_HExtendedString ******************/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring with a hextendedstring.

Parameters
----------
aString: TCollection_ExtendedString

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const TCollection_ExtendedString & aString);

		/****************** TCollection_HExtendedString ******************/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring with an hasciistring.

Parameters
----------
aString: TCollection_HAsciiString

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const opencascade::handle<TCollection_HAsciiString> & aString);

		/****************** TCollection_HExtendedString ******************/
		%feature("compactdefaultargs") TCollection_HExtendedString;
		%feature("autodoc", "Initializes a hextendedstring with a hextendedstring.

Parameters
----------
aString: TCollection_HExtendedString

Returns
-------
None
") TCollection_HExtendedString;
		 TCollection_HExtendedString(const opencascade::handle<TCollection_HExtendedString> & aString);

		/****************** AssignCat ******************/
		%feature("compactdefaultargs") AssignCat;
		%feature("autodoc", "Appends <other> to me.

Parameters
----------
other: TCollection_HExtendedString

Returns
-------
None
") AssignCat;
		void AssignCat(const opencascade::handle<TCollection_HExtendedString> & other);

		/****************** Cat ******************/
		%feature("compactdefaultargs") Cat;
		%feature("autodoc", "Returns a string appending <other> to me.

Parameters
----------
other: TCollection_HExtendedString

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") Cat;
		opencascade::handle<TCollection_HExtendedString> Cat(const opencascade::handle<TCollection_HExtendedString> & other);

		/****************** ChangeAll ******************/
		%feature("compactdefaultargs") ChangeAll;
		%feature("autodoc", "Substitutes all the characters equal to achar by newchar in the string <self>.

Parameters
----------
aChar: Standard_ExtCharacter
NewChar: Standard_ExtCharacter

Returns
-------
None
") ChangeAll;
		void ChangeAll(const Standard_ExtCharacter aChar, const Standard_ExtCharacter NewChar);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all characters contained in <self>. this produces an empty extendedstring.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a extcharacter at position <where>. example: astring contains 'hy not ?' astring.insert(1,'w'); gives 'why not ?' astring contains 'wh' astring.insert(3,'y'); gives 'why' astring contains 'way' astring.insert(2,'h'); gives 'why'.

Parameters
----------
where: int
what: Standard_ExtCharacter

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a hextendedstring at position <where>.

Parameters
----------
where: int
what: TCollection_HExtendedString

Returns
-------
None
") Insert;
		void Insert(const Standard_Integer where, const opencascade::handle<TCollection_HExtendedString> & what);

		/****************** IsAscii ******************/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "Returns true if the string contains only 'ascii range' characters.

Returns
-------
bool
") IsAscii;
		Standard_Boolean IsAscii();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the string <self> contains zero character.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns true if <self> is greater than <other>.

Parameters
----------
other: TCollection_HExtendedString

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const opencascade::handle<TCollection_HExtendedString> & other);

		/****************** IsLess ******************/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "Returns true if <self> is less than <other>.

Parameters
----------
other: TCollection_HExtendedString

Returns
-------
bool
") IsLess;
		Standard_Boolean IsLess(const opencascade::handle<TCollection_HExtendedString> & other);

		/****************** IsSameState ******************/
		%feature("compactdefaultargs") IsSameState;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: TCollection_HExtendedString

Returns
-------
bool
") IsSameState;
		Standard_Boolean IsSameState(const opencascade::handle<TCollection_HExtendedString> & other);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns number of characters in <self>. this is the same functionality as 'strlen' in c.

Returns
-------
int
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Erases <ahowmany> characters from position <where>, <where> included. example: astring contains 'hello' astring.erase(2,2) erases 2 characters from position 1 this gives 'hlo'.

Parameters
----------
where: int
ahowmany: int,optional
	default value is 1

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer where, const Standard_Integer ahowmany = 1);

		/****************** RemoveAll ******************/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Removes every <what> characters from <self>.

Parameters
----------
what: Standard_ExtCharacter

Returns
-------
None
") RemoveAll;
		void RemoveAll(const Standard_ExtCharacter what);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches a string in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_HExtendedString

Returns
-------
int
") Search;
		Standard_Integer Search(const opencascade::handle<TCollection_HExtendedString> & what);

		/****************** SearchFromEnd ******************/
		%feature("compactdefaultargs") SearchFromEnd;
		%feature("autodoc", "Searches a extendedstring in another extendedstring from the end and returns position of first item <what> matching. it returns -1 if not found.

Parameters
----------
what: TCollection_HExtendedString

Returns
-------
int
") SearchFromEnd;
		Standard_Integer SearchFromEnd(const opencascade::handle<TCollection_HExtendedString> & what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces one character in the string at position <where>. if <where> is less than zero or greater than the length of <self> an exception is raised. example: astring contains 'garbake' astring.replace(6,'g') gives <self> = 'garbage'.

Parameters
----------
where: int
what: Standard_ExtCharacter

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const Standard_ExtCharacter what);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces a part of <self> by another string.

Parameters
----------
where: int
what: TCollection_HExtendedString

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer where, const opencascade::handle<TCollection_HExtendedString> & what);

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "Splits a extendedstring into two sub-strings. example: astring contains 'abcdefg' astring.split(3) gives <self> = 'abc' and returns 'defg'.

Parameters
----------
where: int

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") Split;
		opencascade::handle<TCollection_HExtendedString> Split(const Standard_Integer where);

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns the field mystring.

Returns
-------
TCollection_ExtendedString
") String;
		const TCollection_ExtendedString & String();

		/****************** ToExtString ******************/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Returns pointer to extstring.

Returns
-------
Standard_ExtString
") ToExtString;
		Standard_ExtString ToExtString();

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Extracts <whichone> token from <self>. by default, the <separators> is set to space and tabulation. by default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. if no token indexed by <whichone> is found, it returns an empty string. example: astring contains 'this is a message' astring.token() returns 'this' astring.token(' ',4) returns 'message' astring.token(' ',2) returns 'is' astring.token(' ',9) returns '' other separators than space character and tabulation are allowed astring contains '1234; test:message , value' astring.token('; :,',4) returns 'value' astring.token('; :,',2) returns 'test'.

Parameters
----------
separators: Standard_ExtString
whichone: int,optional
	default value is 1

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") Token;
		opencascade::handle<TCollection_HExtendedString> Token(const Standard_ExtString separators, const Standard_Integer whichone = 1);

		/****************** Trunc ******************/
		%feature("compactdefaultargs") Trunc;
		%feature("autodoc", "Truncates <self> to <ahowmany> characters. example: me = 'hello dolly' -> trunc(3) -> me = 'hel'.

Parameters
----------
ahowmany: int

Returns
-------
None
") Trunc;
		void Trunc(const Standard_Integer ahowmany);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns extcharacter at position <where> in <self>. if <where> is less than zero or greater than the length of <self>, an exception is raised. example: astring contains 'hello' astring.value(2) returns 'e'.

Parameters
----------
where: int

Returns
-------
Standard_ExtCharacter
") Value;
		Standard_ExtCharacter Value(const Standard_Integer where);

};


%make_alias(TCollection_HExtendedString)

%extend TCollection_HExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TCollection_MapNode *
****************************/
class TCollection_MapNode : public Standard_Transient {
	public:
		/****************** TCollection_MapNode ******************/
		%feature("compactdefaultargs") TCollection_MapNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
n: TCollection_MapNodePtr

Returns
-------
None
") TCollection_MapNode;
		 TCollection_MapNode(const TCollection_MapNodePtr & n);

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_MapNodePtr
") Next;
		TCollection_MapNodePtr & Next();

};


%make_alias(TCollection_MapNode)

%extend TCollection_MapNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TCollection_SeqNode *
****************************/
class TCollection_SeqNode : public Standard_Transient {
	public:
		/****************** TCollection_SeqNode ******************/
		%feature("compactdefaultargs") TCollection_SeqNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
n: TCollection_SeqNodePtr
p: TCollection_SeqNodePtr

Returns
-------
None
") TCollection_SeqNode;
		 TCollection_SeqNode(const TCollection_SeqNodePtr & n, const TCollection_SeqNodePtr & p);

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_SeqNodePtr
") Next;
		TCollection_SeqNodePtr & Next();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_SeqNodePtr
") Previous;
		TCollection_SeqNodePtr & Previous();

};


%make_alias(TCollection_SeqNode)

%extend TCollection_SeqNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
