/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") TCollection

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

%include TCollection_headers.i

/* typedefs */
typedef TCollection_SeqNode * TCollection_SeqNodePtr;
typedef TCollection_MapNode * TCollection_MapNodePtr;
typedef TCollection_AVLBaseNode * TCollection_AVLBaseNodePtr;
/* end typedefs declaration */

/* public enums */
enum TCollection_Side {
	TCollection_Left = 0,
	TCollection_Right = 1,
};

/* end public enums declaration */

%rename(tcollection) TCollection;
class TCollection {
	public:
		%feature("autodoc", "	* Returns a prime number greater than <I> suitable to dimension a Map. When <I> becomes great there is a limit on the result (today the limit is around 1 000 000). This is not a limit of the number of items but a limit in the number of buckets. i.e. there will be more collisions in the map.

	:param I:
	:type I: Standard_Integer
	:rtype: int
") NextPrimeForMap;
		static Standard_Integer NextPrimeForMap (const Standard_Integer I);
};


%feature("shadow") TCollection::~TCollection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_AVLBaseNode;
class TCollection_AVLBaseNode : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param L:
	:type L: TCollection_AVLBaseNodePtr &
	:param R:
	:type R: TCollection_AVLBaseNodePtr &
	:rtype: None
") TCollection_AVLBaseNode;
		 TCollection_AVLBaseNode (const TCollection_AVLBaseNodePtr & L,const TCollection_AVLBaseNodePtr & R);
		%feature("autodoc", "	:param theNode:
	:type theNode: TCollection_AVLBaseNodePtr &
	:param theSide:
	:type theSide: TCollection_Side
	:rtype: None
") SetChild;
		void SetChild (const TCollection_AVLBaseNodePtr & theNode,const TCollection_Side theSide);
		%feature("autodoc", "	:param ANode:
	:type ANode: TCollection_AVLBaseNodePtr &
	:rtype: int
") Height;
		static Standard_Integer Height (const TCollection_AVLBaseNodePtr & ANode);
		%feature("autodoc", "	:param ANode:
	:type ANode: TCollection_AVLBaseNodePtr &
	:rtype: int
") RecursiveExtent;
		static Standard_Integer RecursiveExtent (const TCollection_AVLBaseNodePtr & ANode);
		%feature("autodoc", "	:param ANode:
	:type ANode: TCollection_AVLBaseNodePtr &
	:rtype: int
") RecursiveTotalExtent;
		static Standard_Integer RecursiveTotalExtent (const TCollection_AVLBaseNodePtr & ANode);
		%feature("autodoc", "	:rtype: TCollection_AVLBaseNodePtr
") Right;
		TCollection_AVLBaseNodePtr & Right ();
		%feature("autodoc", "	:rtype: TCollection_AVLBaseNodePtr
") Left;
		TCollection_AVLBaseNodePtr & Left ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetCount() {
                return (Standard_Integer) $self->Count();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetCount(Standard_Integer value ) {
                $self->Count()=value;
                }
            };
            };


%feature("shadow") TCollection_AVLBaseNode::~TCollection_AVLBaseNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_AVLBaseNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TCollection_AVLBaseNode {
	Handle_TCollection_AVLBaseNode GetHandle() {
	return *(Handle_TCollection_AVLBaseNode*) &$self;
	}
};

%nodefaultctor Handle_TCollection_AVLBaseNode;
class Handle_TCollection_AVLBaseNode : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TCollection_AVLBaseNode();
        Handle_TCollection_AVLBaseNode(const Handle_TCollection_AVLBaseNode &aHandle);
        Handle_TCollection_AVLBaseNode(const TCollection_AVLBaseNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TCollection_AVLBaseNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TCollection_AVLBaseNode {
    TCollection_AVLBaseNode* GetObject() {
    return (TCollection_AVLBaseNode*)$self->Access();
    }
};
%feature("shadow") Handle_TCollection_AVLBaseNode::~Handle_TCollection_AVLBaseNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TCollection_AVLBaseNode {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TCollection_Array1Descriptor;
class TCollection_Array1Descriptor {
	public:
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: Standard_Address
") Address;
		Standard_Address Address ();
};


%feature("shadow") TCollection_Array1Descriptor::~TCollection_Array1Descriptor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_Array1Descriptor {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_Array2Descriptor;
class TCollection_Array2Descriptor {
	public:
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: Standard_Address
") Address;
		Standard_Address Address ();
};


%feature("shadow") TCollection_Array2Descriptor::~TCollection_Array2Descriptor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_Array2Descriptor {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_AsciiString;
class TCollection_AsciiString {
	public:
		%feature("autodoc", "	* Initializes a AsciiString to an empty AsciiString.

	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString ();
		%feature("autodoc", "	* Initializes a AsciiString with a CString.

	:param message:
	:type message: char *
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const char * message);
		%feature("autodoc", "	* Initializes a AsciiString with a CString.

	:param message:
	:type message: char *
	:param aLen:
	:type aLen: Standard_Integer
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const char * message,const Standard_Integer aLen);
		%feature("autodoc", "	* Initializes a AsciiString with a single character.

	:param aChar:
	:type aChar: Standard_Character
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Character aChar);
		%feature("autodoc", "	* Initializes an AsciiString with <length> space allocated. and filled with <filler>. This is usefull for buffers.

	:param length:
	:type length: Standard_Integer
	:param filler:
	:type filler: Standard_Character
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Integer length,const Standard_Character filler);
		%feature("autodoc", "	* Initializes an AsciiString with an integer value

	:param value:
	:type value: Standard_Integer
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Integer value);
		%feature("autodoc", "	* Initializes an AsciiString with a real value

	:param value:
	:type value: float
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Real value);
		%feature("autodoc", "	* Initializes a AsciiString with another AsciiString.

	:param astring:
	:type astring: TCollection_AsciiString &
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring);
		%feature("autodoc", "	* Initializes a AsciiString with copy of another AsciiString concatenated with the message character.

	:param astring:
	:type astring: TCollection_AsciiString &
	:param message:
	:type message: Standard_Character
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring,const Standard_Character message);
		%feature("autodoc", "	* Initializes a AsciiString with copy of another AsciiString concatenated with the message string.

	:param astring:
	:type astring: TCollection_AsciiString &
	:param message:
	:type message: char *
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring,const char * message);
		%feature("autodoc", "	* Initializes a AsciiString with copy of another AsciiString concatenated with the message string.

	:param astring:
	:type astring: TCollection_AsciiString &
	:param message:
	:type message: TCollection_AsciiString &
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring,const TCollection_AsciiString & message);
		%feature("autodoc", "	* Creation by converting an extended string to an ascii string. If replaceNonAscii is non-null charecter, it will be used in place of any non-ascii character found in the source string. Otherwise, raises OutOfRange exception if at least one character in the source string is not in the 'Ascii range'.

	:param astring:
	:type astring: TCollection_ExtendedString &
	:param replaceNonAscii: default value is 0
	:type replaceNonAscii: Standard_Character
	:rtype: None
") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_ExtendedString & astring,const Standard_Character replaceNonAscii = 0);
		%feature("autodoc", "	* Appends <other> to me. This is an unary operator.

	:param other:
	:type other: Standard_Character
	:rtype: None
") AssignCat;
		void AssignCat (const Standard_Character other);
		%feature("autodoc", "	:param other:
	:type other: Standard_Character
	:rtype: None
") operator+=;
		void operator += (const Standard_Character other);
		%feature("autodoc", "	* Appends <other> to me. This is an unary operator.

	:param other:
	:type other: Standard_Integer
	:rtype: None
") AssignCat;
		void AssignCat (const Standard_Integer other);
		%feature("autodoc", "	:param other:
	:type other: Standard_Integer
	:rtype: None
") operator+=;
		void operator += (const Standard_Integer other);
		%feature("autodoc", "	* Appends <other> to me. This is an unary operator.

	:param other:
	:type other: float
	:rtype: None
") AssignCat;
		void AssignCat (const Standard_Real other);
		%feature("autodoc", "	:param other:
	:type other: float
	:rtype: None
") operator+=;
		void operator += (const Standard_Real other);
		%feature("autodoc", "	* Appends <other> to me. This is an unary operator. ex: aString += 'Dummy' To catenate more than one CString, you must put a AsciiString before. Example: aString += 'Hello ' + 'Dolly' IS NOT VALID ! But astring += anotherString + 'Hello ' + 'Dolly' is valid.

	:param other:
	:type other: char *
	:rtype: None
") AssignCat;
		void AssignCat (const char * other);
		%feature("autodoc", "	:param other:
	:type other: char *
	:rtype: None
") operator+=;
		void operator += (const char * other);
		%feature("autodoc", "	* Appends <other> to me. This is an unary operator. Example: aString += anotherString

	:param other:
	:type other: TCollection_AsciiString &
	:rtype: None
") AssignCat;
		void AssignCat (const TCollection_AsciiString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_AsciiString &
	:rtype: None
") operator+=;
		void operator += (const TCollection_AsciiString & other);
		%feature("autodoc", "	* Converts the first character into its corresponding upper-case character and the other characters into lowercase Example: before me = 'hellO ' after me = 'Hello '

	:rtype: None
") Capitalize;
		void Capitalize ();
		%feature("autodoc", "	* Appends <other> to me. Syntax: aString = aString + 'Dummy' Example: aString contains 'I say ' aString = aString + 'Hello ' + 'Dolly' gives 'I say Hello Dolly' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.

	:param other:
	:type other: Standard_Character
	:rtype: TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat (const Standard_Character other);
		%feature("autodoc", "	:param other:
	:type other: Standard_Character
	:rtype: TCollection_AsciiString
") operator+;
		TCollection_AsciiString operator + (const Standard_Character other);
		%feature("autodoc", "	* Appends <other> to me. Syntax: aString = aString + 15; Example: aString contains 'I say ' gives 'I say 15' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.

	:param other:
	:type other: Standard_Integer
	:rtype: TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat (const Standard_Integer other);
		%feature("autodoc", "	:param other:
	:type other: Standard_Integer
	:rtype: TCollection_AsciiString
") operator+;
		TCollection_AsciiString operator + (const Standard_Integer other);
		%feature("autodoc", "	* Appends <other> to me. Syntax: aString = aString + 15.15; Example: aString contains 'I say ' gives 'I say 15.15' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.

	:param other:
	:type other: float
	:rtype: TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat (const Standard_Real other);
		%feature("autodoc", "	:param other:
	:type other: float
	:rtype: TCollection_AsciiString
") operator+;
		TCollection_AsciiString operator + (const Standard_Real other);
		%feature("autodoc", "	* Appends <other> to me. Syntax: aString = aString + 'Dummy' Example: aString contains 'I say ' aString = aString + 'Hello ' + 'Dolly' gives 'I say Hello Dolly' To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.

	:param other:
	:type other: char *
	:rtype: TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat (const char * other);
		%feature("autodoc", "	:param other:
	:type other: char *
	:rtype: TCollection_AsciiString
") operator+;
		TCollection_AsciiString operator + (const char * other);
		%feature("autodoc", "	* Appends <other> to me. Example: aString = aString + anotherString

	:param other:
	:type other: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") Cat;
		TCollection_AsciiString Cat (const TCollection_AsciiString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") operator+;
		TCollection_AsciiString operator + (const TCollection_AsciiString & other);
		%feature("autodoc", "	* Modifies this ASCII string so that its length becomes equal to Width and the new characters are equal to Filler. New characters are added both at the beginning and at the end of this string. If Width is less than the length of this ASCII string, nothing happens. Example TCollection_AsciiString myAlphabet('abcdef'); myAlphabet.Center(9,' '); assert ( myAlphabet == ' abcdef ' );

	:param Width:
	:type Width: Standard_Integer
	:param Filler:
	:type Filler: Standard_Character
	:rtype: None
") Center;
		void Center (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "	* Substitutes all the characters equal to aChar by NewChar in the AsciiString <self>. The substitution can be case sensitive. If you don't use default case sensitive, no matter wether aChar is uppercase or not. Example: me = 'Histake' -> ChangeAll('H','M',Standard_True) gives me = 'Mistake'

	:param aChar:
	:type aChar: Standard_Character
	:param NewChar:
	:type NewChar: Standard_Character
	:param CaseSensitive: default value is Standard_True
	:type CaseSensitive: bool
	:rtype: None
") ChangeAll;
		void ChangeAll (const Standard_Character aChar,const Standard_Character NewChar,const Standard_Boolean CaseSensitive = Standard_True);
		%feature("autodoc", "	* Removes all characters contained in <self>. This produces an empty AsciiString.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Copy <fromwhere> to <self>. Used as operator = Example: aString = anotherCString;

	:param fromwhere:
	:type fromwhere: char *
	:rtype: None
") Copy;
		void Copy (const char * fromwhere);
		%feature("autodoc", "	:param fromwhere:
	:type fromwhere: char *
	:rtype: None
") operator=;
		void operator = (const char * fromwhere);
		%feature("autodoc", "	* Copy <fromwhere> to <self>. Used as operator = Example: aString = anotherString;

	:param fromwhere:
	:type fromwhere: TCollection_AsciiString &
	:rtype: None
") Copy;
		void Copy (const TCollection_AsciiString & fromwhere);
		%feature("autodoc", "	:param fromwhere:
	:type fromwhere: TCollection_AsciiString &
	:rtype: None
") operator=;
		void operator = (const TCollection_AsciiString & fromwhere);
		%feature("autodoc", "	* Frees memory allocated by AsciiString.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Returns the index of the first character of <self> that is present in <Set>. The search begins to the index FromIndex and ends to the the index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 1

	:param Set:
	:type Set: TCollection_AsciiString &
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") FirstLocationInSet;
		Standard_Integer FirstLocationInSet (const TCollection_AsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Returns the index of the first character of <self> that is not present in the set <Set>. The search begins to the index FromIndex and ends to the the index ToIndex in <self>. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 3

	:param Set:
	:type Set: TCollection_AsciiString &
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet (const TCollection_AsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Inserts a Character at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_Character
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "	* Inserts a CString at position <where>. Example: aString contains 'O more' aString.Insert(2,'nce'); gives 'Once more'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: char *
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const char * what);
		%feature("autodoc", "	* Inserts a AsciiString at position <where>.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: TCollection_AsciiString &
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const TCollection_AsciiString & what);
		%feature("autodoc", "	* Pushing a string after a specific index in the string <self>. Raises an exception if Index is out of bounds. - less than 0 (InsertAfter), or less than 1 (InsertBefore), or - greater than the number of characters in this ASCII string. Example: before me = 'cde' , Index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'

	:param Index:
	:type Index: Standard_Integer
	:param other:
	:type other: TCollection_AsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TCollection_AsciiString & other);
		%feature("autodoc", "	* Pushing a string before a specific index in the string <self>. Raises an exception if Index is out of bounds. - less than 0 (InsertAfter), or less than 1 (InsertBefore), or - greater than the number of characters in this ASCII string. Example: before me = 'cde' , Index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'

	:param Index:
	:type Index: Standard_Integer
	:param other:
	:type other: TCollection_AsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TCollection_AsciiString & other);
		%feature("autodoc", "	* Returns True if the string <self> contains zero character.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* Returns true if the characters in this ASCII string are identical to the characters in ASCII string other. Note that this method is an alias of operator ==.

	:param other:
	:type other: char *
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const char * other);

        %extend{
            bool __eq_wrapper__(const Standard_CString other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Returns true if the characters in this ASCII string are identical to the characters in ASCII string other. Note that this method is an alias of operator ==.

	:param other:
	:type other: TCollection_AsciiString &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const TCollection_AsciiString & other);

        %extend{
            bool __eq_wrapper__(const TCollection_AsciiString  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Returns true if there are differences between the characters in this ASCII string and ASCII string other. Note that this method is an alias of operator !=

	:param other:
	:type other: char *
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const char * other);

        %extend{
            bool __ne_wrapper__(const Standard_CString other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "	* Returns true if there are differences between the characters in this ASCII string and ASCII string other. Note that this method is an alias of operator !=

	:param other:
	:type other: TCollection_AsciiString &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const TCollection_AsciiString & other);

        %extend{
            bool __ne_wrapper__(const TCollection_AsciiString  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "	* Returns True if <self> is 'ASCII' less than <other>.

	:param other:
	:type other: char *
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const char * other);
		%feature("autodoc", "	:param other:
	:type other: char *
	:rtype: bool
") operator<;
		Standard_Boolean operator < (const char * other);
		%feature("autodoc", "	* Returns True if <self> is 'ASCII' less than <other>.

	:param other:
	:type other: TCollection_AsciiString &
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const TCollection_AsciiString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_AsciiString &
	:rtype: bool
") operator<;
		Standard_Boolean operator < (const TCollection_AsciiString & other);
		%feature("autodoc", "	* Returns True if <self> is 'ASCII' greater than <other>.

	:param other:
	:type other: char *
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const char * other);
		%feature("autodoc", "	:param other:
	:type other: char *
	:rtype: bool
") operator>;
		Standard_Boolean operator > (const char * other);
		%feature("autodoc", "	* Returns True if <self> is 'ASCII' greater than <other>.

	:param other:
	:type other: TCollection_AsciiString &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const TCollection_AsciiString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_AsciiString &
	:rtype: bool
") operator>;
		Standard_Boolean operator > (const TCollection_AsciiString & other);
		%feature("autodoc", "	* Converts a AsciiString containing a numeric expression to an Integer. Example: '215' returns 215.

	:rtype: int
") IntegerValue;
		Standard_Integer IntegerValue ();
		%feature("autodoc", "	* Returns True if the AsciiString contains an integer value. Note: an integer value is considered to be a real value as well.

	:rtype: bool
") IsIntegerValue;
		Standard_Boolean IsIntegerValue ();
		%feature("autodoc", "	* Returns True if the AsciiString contains a real value. Note: an integer value is considered to be a real value as well.

	:rtype: bool
") IsRealValue;
		Standard_Boolean IsRealValue ();
		%feature("autodoc", "	* Returns True if the AsciiString contains only ASCII characters between ' ' and '~'. This means no control character and no extended ASCII code.

	:rtype: bool
") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "	* Removes all space characters in the begining of the string.

	:rtype: None
") LeftAdjust;
		void LeftAdjust ();
		%feature("autodoc", "	* left justify Length becomes equal to Width and the new characters are equal to Filler. If Width < Length nothing happens. Raises an exception if Width is less than zero. Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = 'abcdef '

	:param Width:
	:type Width: Standard_Integer
	:param Filler:
	:type Filler: Standard_Character
	:rtype: None
") LeftJustify;
		void LeftJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "	* Returns number of characters in <self>. This is the same functionality as 'strlen' in C. Example TCollection_AsciiString myAlphabet('abcdef'); assert ( myAlphabet.Length() == 6 ); - 1 is the position of the first character in this string. - The length of this string gives the position of its last character. - Positions less than or equal to zero, or greater than the length of this string are invalid in functions which identify a character of this string by its position.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Returns an index in the string <self> of the first occurence of the string S in the string <self> from the starting index FromIndex to the ending index ToIndex returns zero if failure Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAaAa', S = 'Aa', FromIndex = 1, ToIndex = 7 after me = 'aabAaAa' returns 4

	:param other:
	:type other: TCollection_AsciiString &
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") Location;
		Standard_Integer Location (const TCollection_AsciiString & other,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Returns the index of the nth occurence of the character C in the string <self> from the starting index FromIndex to the ending index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAa', N = 3, C = 'a', FromIndex = 1, ToIndex = 5 after me = 'aabAa' returns 5

	:param N:
	:type N: Standard_Integer
	:param C:
	:type C: Standard_Character
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") Location;
		Standard_Integer Location (const Standard_Integer N,const Standard_Character C,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Converts <self> to its lower-case equivalent. Example TCollection_AsciiString myString('Hello Dolly'); myString.UpperCase(); assert ( myString == 'HELLO DOLLY' ); myString.LowerCase(); assert ( myString == 'hello dolly' );

	:rtype: None
") LowerCase;
		void LowerCase ();
		%feature("autodoc", "	* Inserts the string other at the beginning of this ASCII string. Example TCollection_AsciiString myAlphabet('cde'); TCollection_AsciiString myBegin('ab'); myAlphabet.Prepend(myBegin); assert ( myAlphabet == 'abcde' );

	:param other:
	:type other: TCollection_AsciiString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_AsciiString & other);

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
        		%feature("autodoc", "	* Converts an AsciiString containing a numeric expression. to a Real. Example: ex: '215' returns 215.0. ex: '3.14159267' returns 3.14159267.

	:rtype: float
") RealValue;
		Standard_Real RealValue ();
		%feature("autodoc", "	* Remove all the occurences of the character C in the string. Example: before me = 'HellLLo', C = 'L' , CaseSensitive = True after me = 'Hello'

	:param C:
	:type C: Standard_Character
	:param CaseSensitive:
	:type CaseSensitive: bool
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_Character C,const Standard_Boolean CaseSensitive);
		%feature("autodoc", "	* Removes every <what> characters from <self>.

	:param what:
	:type what: Standard_Character
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_Character what);
		%feature("autodoc", "	* Erases <ahowmany> characters from position <where>, <where> included. Example: aString contains 'Hello' aString.Remove(2,2) erases 2 characters from position 2 This gives 'Hlo'.

	:param where:
	:type where: Standard_Integer
	:param ahowmany: default value is 1
	:type ahowmany: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "	* Removes all space characters at the end of the string.

	:rtype: None
") RightAdjust;
		void RightAdjust ();
		%feature("autodoc", "	* Right justify. Length becomes equal to Width and the new characters are equal to Filler. if Width < Length nothing happens. Raises an exception if Width is less than zero. Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = ' abcdef'

	:param Width:
	:type Width: Standard_Integer
	:param Filler:
	:type Filler: Standard_Character
	:rtype: None
") RightJustify;
		void RightJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "	* Searches a CString in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found. Example: aString contains 'Sample single test' aString.Search('le') returns 5

	:param what:
	:type what: char *
	:rtype: int
") Search;
		Standard_Integer Search (const char * what);
		%feature("autodoc", "	* Searches an AsciiString in <self> from the beginning and returns position of first item <what> matching. It returns -1 if not found.

	:param what:
	:type what: TCollection_AsciiString &
	:rtype: int
") Search;
		Standard_Integer Search (const TCollection_AsciiString & what);
		%feature("autodoc", "	* Searches a CString in a AsciiString from the end and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.SearchFromEnd('le') returns 12

	:param what:
	:type what: char *
	:rtype: int
") SearchFromEnd;
		Standard_Integer SearchFromEnd (const char * what);
		%feature("autodoc", "	* Searches a AsciiString in another AsciiString from the end and returns position of first item <what> matching. It returns -1 if not found.

	:param what:
	:type what: TCollection_AsciiString &
	:rtype: int
") SearchFromEnd;
		Standard_Integer SearchFromEnd (const TCollection_AsciiString & what);
		%feature("autodoc", "	* Replaces one character in the AsciiString at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_Character
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "	* Replaces a part of <self> by a CString. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'abcde' aString.SetValue(4,'1234567') gives <self> = 'abc1234567'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: char *
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const char * what);
		%feature("autodoc", "	* Replaces a part of <self> by another AsciiString.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: TCollection_AsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const TCollection_AsciiString & what);
		%feature("autodoc", "	* Splits a AsciiString into two sub-strings. Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'

	:param where:
	:type where: Standard_Integer
	:rtype: TCollection_AsciiString
") Split;
		TCollection_AsciiString Split (const Standard_Integer where);
		%feature("autodoc", "	* Creation of a sub-string of the string <self>. The sub-string starts to the index Fromindex and ends to the index ToIndex. Raises an exception if ToIndex or FromIndex is out of bounds Example: before me = 'abcdefg', ToIndex=3, FromIndex=6 after me = 'abcdefg' returns 'cdef'

	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: TCollection_AsciiString
") SubString;
		TCollection_AsciiString SubString (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Returns pointer to AsciiString (char *). This is useful for some casual manipulations. Warning: Because this 'char *' is 'const', you can't modify its contents.

	:rtype: char *
") ToCString;
		char * ToCString ();
		%feature("autodoc", "	* Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns empty AsciiString. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed : aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'

	:param separators: default value is '\t'
	:type separators: char *
	:param whichone: default value is 1
	:type whichone: Standard_Integer
	:rtype: TCollection_AsciiString
") Token;
		TCollection_AsciiString Token (const char * separators = '\t',const Standard_Integer whichone = 1);
		%feature("autodoc", "	* Truncates <self> to <ahowmany> characters. Example: me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'

	:param ahowmany:
	:type ahowmany: Standard_Integer
	:rtype: None
") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "	* Converts <self> to its upper-case equivalent.

	:rtype: None
") UpperCase;
		void UpperCase ();
		%feature("autodoc", "	* Length of the string ignoring all spaces (' ') and the control character at the end.

	:rtype: int
") UsefullLength;
		Standard_Integer UsefullLength ();
		%feature("autodoc", "	* Returns character at position <where> in <self>. If <where> is less than zero or greater than the lenght of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'

	:param where:
	:type where: Standard_Integer
	:rtype: Standard_Character
") Value;
		Standard_Character Value (const Standard_Integer where);
		%feature("autodoc", "	* Hash function for AsciiString (returns the same Integer value that the hash function for ExtendedString)

	:param astring:
	:type astring: TCollection_AsciiString &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TCollection_AsciiString & astring,const Standard_Integer Upper);
		%feature("autodoc", "	* Returns True when the two strings are the same. (Just for HashCode for AsciiString)

	:param string1:
	:type string1: TCollection_AsciiString &
	:param string2:
	:type string2: TCollection_AsciiString &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const TCollection_AsciiString & string1,const TCollection_AsciiString & string2);
		%feature("autodoc", "	* Returns True when the two strings are the same. (Just for HashCode for AsciiString)

	:param string1:
	:type string1: TCollection_AsciiString &
	:param string2:
	:type string2: char *
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const TCollection_AsciiString & string1,const char * string2);
};


%feature("shadow") TCollection_AsciiString::~TCollection_AsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_AsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_BaseSequence;
class TCollection_BaseSequence {
	public:
		%feature("autodoc", "	* returns True if the sequence <self> contains no elements.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* Returns the number of element(s) in the sequence. Returns zero if the sequence is empty.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Reverses the order of items on <self>. Example: before me = (A B C) after me = (C B A)

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	* Swaps elements which are located at positions <I> and <J> in <self>. Raises an exception if I or J is out of bound. Example: before me = (A B C), I = 1, J = 3 after me = (C B A)

	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer I,const Standard_Integer J);
};


%feature("shadow") TCollection_BaseSequence::~TCollection_BaseSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_BaseSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_BasicMap;
class TCollection_BasicMap {
	public:
		%feature("autodoc", "	* Returns the number of buckets in <self>.

	:rtype: int
") NbBuckets;
		Standard_Integer NbBuckets ();
		%feature("autodoc", "	* Returns the number of keys already stored in <self>.

	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	* Returns True when the map contains no keys. This is exactly Extent() == 0.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        };


%feature("shadow") TCollection_BasicMap::~TCollection_BasicMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_BasicMap {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_BasicMapIterator;
class TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	* Resets the iterator to the first node.

	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	* Returns true if there is a current entry for this iterator in the map. Use the function Next to set this iterator to the position of the next entry, if it exists.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Sets this iterator to the position of the next entry of the map. Nothing is changed if there is no more entry to explore in the map: this iterator is always positioned on the last entry of the map but the function More returns false.

	:rtype: None
") Next;
		void Next ();
};


%feature("shadow") TCollection_BasicMapIterator::~TCollection_BasicMapIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_BasicMapIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_ExtendedString;
class TCollection_ExtendedString {
	public:
		%feature("autodoc", "	* Initializes a ExtendedString to an empty ExtendedString.

	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString ();
		%feature("autodoc", "	* Creation by converting a CString to an extended string.

	:param astring:
	:type astring: char *
	:param isMultiByte: default value is Standard_False
	:type isMultiByte: bool
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const char * astring,const Standard_Boolean isMultiByte = Standard_False);
		%feature("autodoc", "	* Creation by converting an ExtString to an extended string.

	:param astring:
	:type astring: Standard_ExtString
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_ExtString astring);
		%feature("autodoc", "	* Initializes a AsciiString with a single character.

	:param aChar:
	:type aChar: Standard_Character
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Character aChar);
		%feature("autodoc", "	* Initializes a ExtendedString with a single character.

	:param aChar:
	:type aChar: Standard_ExtCharacter
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_ExtCharacter aChar);
		%feature("autodoc", "	* Initializes a ExtendedString with <length> space allocated. and filled with <filler>.This is useful for buffers.

	:param length:
	:type length: Standard_Integer
	:param filler:
	:type filler: Standard_ExtCharacter
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Integer length,const Standard_ExtCharacter filler);
		%feature("autodoc", "	* Initializes an ExtendedString with an integer value

	:param value:
	:type value: Standard_Integer
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Integer value);
		%feature("autodoc", "	* Initializes an ExtendedString with a real value

	:param value:
	:type value: float
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Real value);
		%feature("autodoc", "	* Initializes a ExtendedString with another ExtendedString.

	:param astring:
	:type astring: TCollection_ExtendedString &
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const TCollection_ExtendedString & astring);
		%feature("autodoc", "	* Creation by converting a normal Ascii string to an extended string.

	:param astring:
	:type astring: TCollection_AsciiString &
	:rtype: None
") TCollection_ExtendedString;
		 TCollection_ExtendedString (const TCollection_AsciiString & astring);
		%feature("autodoc", "	* Appends the other extended string to this extended string. Note that this method is an alias of operator +=. Example: aString += anotherString

	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: None
") AssignCat;
		void AssignCat (const TCollection_ExtendedString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: None
") operator+=;
		void operator += (const TCollection_ExtendedString & other);
		%feature("autodoc", "	* Appends <other> to me.

	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") Cat;
		TCollection_ExtendedString Cat (const TCollection_ExtendedString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") operator+;
		TCollection_ExtendedString operator + (const TCollection_ExtendedString & other);
		%feature("autodoc", "	* Substitutes all the characters equal to aChar by NewChar in the ExtendedString <self>. The substitution can be case sensitive. If you don't use default case sensitive, no matter wether aChar is uppercase or not.

	:param aChar:
	:type aChar: Standard_ExtCharacter
	:param NewChar:
	:type NewChar: Standard_ExtCharacter
	:rtype: None
") ChangeAll;
		void ChangeAll (const Standard_ExtCharacter aChar,const Standard_ExtCharacter NewChar);
		%feature("autodoc", "	* Removes all characters contained in <self>. This produces an empty ExtendedString.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Copy <fromwhere> to <self>. Used as operator =

	:param fromwhere:
	:type fromwhere: TCollection_ExtendedString &
	:rtype: None
") Copy;
		void Copy (const TCollection_ExtendedString & fromwhere);
		%feature("autodoc", "	:param fromwhere:
	:type fromwhere: TCollection_ExtendedString &
	:rtype: None
") operator=;
		void operator = (const TCollection_ExtendedString & fromwhere);
		%feature("autodoc", "	* Frees memory allocated by ExtendedString.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Insert a Character at position <where>.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_ExtCharacter
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "	* Insert a ExtendedString at position <where>.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: TCollection_ExtendedString &
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const TCollection_ExtendedString & what);
		%feature("autodoc", "	* Returns true if the characters in this extended string are identical to the characters in the other extended string. Note that this method is an alias of operator ==

	:param other:
	:type other: Standard_ExtString
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Standard_ExtString other);

        %extend{
            bool __eq_wrapper__(const Standard_ExtString other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Returns true if the characters in this extended string are identical to the characters in the other extended string. Note that this method is an alias of operator ==

	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const TCollection_ExtendedString & other);

        %extend{
            bool __eq_wrapper__(const TCollection_ExtendedString  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Returns true if there are differences between the characters in this extended string and the other extended string. Note that this method is an alias of operator !=.

	:param other:
	:type other: Standard_ExtString
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const Standard_ExtString other);

        %extend{
            bool __ne_wrapper__(const Standard_ExtString other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "	* Returns true if there are differences between the characters in this extended string and the other extended string. Note that this method is an alias of operator !=.

	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const TCollection_ExtendedString & other);

        %extend{
            bool __ne_wrapper__(const TCollection_ExtendedString  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "	* Returns True if <self> is less than <other>.

	:param other:
	:type other: Standard_ExtString
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const Standard_ExtString other);
		%feature("autodoc", "	:param other:
	:type other: Standard_ExtString
	:rtype: bool
") operator<;
		Standard_Boolean operator < (const Standard_ExtString other);
		%feature("autodoc", "	* Returns True if <self> is less than <other>.

	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const TCollection_ExtendedString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: bool
") operator<;
		Standard_Boolean operator < (const TCollection_ExtendedString & other);
		%feature("autodoc", "	* Returns True if <self> is greater than <other>.

	:param other:
	:type other: Standard_ExtString
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const Standard_ExtString other);
		%feature("autodoc", "	:param other:
	:type other: Standard_ExtString
	:rtype: bool
") operator>;
		Standard_Boolean operator > (const Standard_ExtString other);
		%feature("autodoc", "	* Returns True if <self> is greater than <other>.

	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const TCollection_ExtendedString & other);
		%feature("autodoc", "	:param other:
	:type other: TCollection_ExtendedString &
	:rtype: bool
") operator>;
		Standard_Boolean operator > (const TCollection_ExtendedString & other);
		%feature("autodoc", "	* Returns True if the ExtendedString contains only 'Ascii Range' characters .

	:rtype: bool
") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "	* Returns number of characters in <self>. This is the same functionality as 'strlen' in C.

	:rtype: int
") Length;
		Standard_Integer Length ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("autodoc", "	* Removes every <what> characters from <self>.

	:param what:
	:type what: Standard_ExtCharacter
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_ExtCharacter what);
		%feature("autodoc", "	* Erases <ahowmany> characters from position <where>,<where> included.

	:param where:
	:type where: Standard_Integer
	:param ahowmany: default value is 1
	:type ahowmany: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "	* Searches a ExtendedString in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.

	:param what:
	:type what: TCollection_ExtendedString &
	:rtype: int
") Search;
		Standard_Integer Search (const TCollection_ExtendedString & what);
		%feature("autodoc", "	* Searches a ExtendedString in another ExtendedString from the end and returns position of first item <what> matching. it returns -1 if not found.

	:param what:
	:type what: TCollection_ExtendedString &
	:rtype: int
") SearchFromEnd;
		Standard_Integer SearchFromEnd (const TCollection_ExtendedString & what);
		%feature("autodoc", "	* Replaces one character in the ExtendedString at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_ExtCharacter
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "	* Replaces a part of <self> by another ExtendedString see above.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: TCollection_ExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const TCollection_ExtendedString & what);
		%feature("autodoc", "	* Splits this extended string into two sub-strings at position where. - The second sub-string (from position where + 1 of this string to the end) is returned in a new extended string. - this extended string is modified: its last characters are removed, it becomes equal to the first sub-string (from the first character to position where). Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'

	:param where:
	:type where: Standard_Integer
	:rtype: TCollection_ExtendedString
") Split;
		TCollection_ExtendedString Split (const Standard_Integer where);
		%feature("autodoc", "	* Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty AsciiString. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed : aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'

	:param separators:
	:type separators: Standard_ExtString
	:param whichone: default value is 1
	:type whichone: Standard_Integer
	:rtype: TCollection_ExtendedString
") Token;
		TCollection_ExtendedString Token (const Standard_ExtString separators,const Standard_Integer whichone = 1);
		%feature("autodoc", "	* Returns pointer to ExtString

	:rtype: Standard_ExtString
") ToExtString;
		Standard_ExtString ToExtString ();
		%feature("autodoc", "	* Truncates <self> to <ahowmany> characters. Example: me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel' Exceptions Standard_OutOfRange if ahowmany is greater than the length of this string.

	:param ahowmany:
	:type ahowmany: Standard_Integer
	:rtype: None
") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "	* Returns character at position <where> in <self>. If <where> is less than zero or greater than the lenght of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e' Exceptions Standard_OutOfRange if where lies outside the bounds of this extended string.

	:param where:
	:type where: Standard_Integer
	:rtype: Standard_ExtCharacter
") Value;
		Standard_ExtCharacter Value (const Standard_Integer where);
		%feature("autodoc", "	* Returns a hashed value for the extended string astring within the range 1..Upper. Note: if astring is ASCII, the computed value is the same as the value computed with the HashCode function on a TCollection_AsciiString string composed with equivalent ASCII characters

	:param astring:
	:type astring: TCollection_ExtendedString &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TCollection_ExtendedString & astring,const Standard_Integer Upper);
		%feature("autodoc", "	* Returns true if the characters in this extended string are identical to the characters in the other extended string. Note that this method is an alias of operator ==.

	:param string1:
	:type string1: TCollection_ExtendedString &
	:param string2:
	:type string2: TCollection_ExtendedString &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const TCollection_ExtendedString & string1,const TCollection_ExtendedString & string2);
		%feature("autodoc", "	* Converts the internal <mystring> to UTF8 coding and returns length of the out CString. A memory for the <theCString> should be allocated before call!

	:param theCString:
	:type theCString: Standard_PCharacter &
	:rtype: int
") ToUTF8CString;
		Standard_Integer ToUTF8CString (Standard_PCharacter & theCString);
		%feature("autodoc", "	* Returns expected CString length in UTF8 coding. It can be used for memory calculation before converting to CString containing symbols in UTF8 coding.

	:rtype: int
") LengthOfCString;
		Standard_Integer LengthOfCString ();
};


%feature("shadow") TCollection_ExtendedString::~TCollection_ExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_ExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_HAsciiString;
class TCollection_HAsciiString : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Initializes a HAsciiString to an empty AsciiString.

	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString ();
		%feature("autodoc", "	* Initializes a HAsciiString with a CString.

	:param message:
	:type message: char *
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const char * message);
		%feature("autodoc", "	* Initializes a HAsciiString with a single character.

	:param aChar:
	:type aChar: Standard_Character
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Character aChar);
		%feature("autodoc", "	* Initializes a HAsciiString with <length> space allocated. and filled with <filler>.This is useful for buffers.

	:param length:
	:type length: Standard_Integer
	:param filler:
	:type filler: Standard_Character
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Integer length,const Standard_Character filler);
		%feature("autodoc", "	* Initializes a HAsciiString with an integer value

	:param value:
	:type value: Standard_Integer
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Integer value);
		%feature("autodoc", "	* Initializes a HAsciiString with a real value

	:param value:
	:type value: float
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Real value);
		%feature("autodoc", "	* Initializes a HAsciiString with a HAsciiString.

	:param aString:
	:type aString: TCollection_AsciiString &
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const TCollection_AsciiString & aString);
		%feature("autodoc", "	* Initializes a HAsciiString with a HAsciiString.

	:param aString:
	:type aString: Handle_TCollection_HAsciiString &
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Handle_TCollection_HAsciiString & aString);
		%feature("autodoc", "	* Initializes a HAsciiString with a HAsciiString. If replaceNonAscii is non-null charecter, it will be used in place of any non-ascii character found in the source string. Otherwise, raises OutOfRange exception if at least one character in the source string is not in the 'Ascii range'.

	:param aString:
	:type aString: Handle_TCollection_HExtendedString &
	:param replaceNonAscii:
	:type replaceNonAscii: Standard_Character
	:rtype: None
") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Handle_TCollection_HExtendedString & aString,const Standard_Character replaceNonAscii);
		%feature("autodoc", "	* Appends <other> to me.

	:param other:
	:type other: char *
	:rtype: None
") AssignCat;
		void AssignCat (const char * other);
		%feature("autodoc", "	* Appends <other> to me. Example: aString = aString + anotherString

	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: None
") AssignCat;
		void AssignCat (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "	* Converts the first character into its corresponding upper-case character and the other characters into lowercase. Example: before me = 'hellO ' after me = 'Hello '

	:rtype: None
") Capitalize;
		void Capitalize ();
		%feature("autodoc", "	* Creates a new string by concatenation of this ASCII string and the other ASCII string. Example: aString = aString + anotherString aString = aString + 'Dummy' aString contains 'I say ' aString = aString + 'Hello ' + 'Dolly' gives 'I say Hello Dolly' Warning: To catenate more than one CString, you must put a String before. So the following example is WRONG ! aString = 'Hello ' + 'Dolly' THIS IS NOT ALLOWED This rule is applicable to AssignCat (operator +=) too.

	:param other:
	:type other: char *
	:rtype: Handle_TCollection_HAsciiString
") Cat;
		Handle_TCollection_HAsciiString Cat (const char * other);
		%feature("autodoc", "	* Creates a new string by concatenation of this ASCII string and the other ASCII string. Example: aString = aString + anotherString

	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: Handle_TCollection_HAsciiString
") Cat;
		Handle_TCollection_HAsciiString Cat (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "	* Modifies this ASCII string so that its length becomes equal to Width and the new characters are equal to Filler. New characters are added both at the beginning and at the end of this string. If Width is less than the length of this ASCII string, nothing happens. Example Handle_TCollection_HAsciiString myAlphabet = new TCollection_HAsciiString ('abcdef'); myAlphabet->Center(9,' '); assert ( !strcmp( myAlphabet->ToCString(), ' abcdef ') );

	:param Width:
	:type Width: Standard_Integer
	:param Filler:
	:type Filler: Standard_Character
	:rtype: None
") Center;
		void Center (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "	* Replaces all characters equal to aChar by NewChar in this ASCII string. The substitution is case sensitive if CaseSensitive is true (default value). If you do not use the default case sensitive option, it does not matter whether aChar is upper-case or not. Example Handle_TCollection_HAsciiString myMistake = new TCollection_HAsciiString ('Hather'); myMistake->ChangeAll('H','F'); assert ( !strcmp( myMistake->ToCString(), 'Father') );

	:param aChar:
	:type aChar: Standard_Character
	:param NewChar:
	:type NewChar: Standard_Character
	:param CaseSensitive: default value is Standard_True
	:type CaseSensitive: bool
	:rtype: None
") ChangeAll;
		void ChangeAll (const Standard_Character aChar,const Standard_Character NewChar,const Standard_Boolean CaseSensitive = Standard_True);
		%feature("autodoc", "	* Removes all characters contained in <self>. This produces an empty HAsciiString.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Returns the index of the first character of <self> that is present in <Set>. The search begins to the index FromIndex and ends to the the index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 1

	:param Set:
	:type Set: Handle_TCollection_HAsciiString &
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") FirstLocationInSet;
		Standard_Integer FirstLocationInSet (const Handle_TCollection_HAsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Returns the index of the first character of <self> that is not present in the set <Set>. The search begins to the index FromIndex and ends to the the index ToIndex in <self>. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7 after me = 'aabAcAa' returns 3

	:param Set:
	:type Set: Handle_TCollection_HAsciiString &
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet (const Handle_TCollection_HAsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Insert a Character at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_Character
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "	* Insert a HAsciiString at position <where>.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: char *
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const char * what);
		%feature("autodoc", "	* Insert a HAsciiString at position <where>.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Handle_TCollection_HAsciiString &
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "	* Inserts the other ASCII string a after a specific index in the string <self> Example: before me = 'cde' , Index = 0 , other = 'ab' after me = 'abcde' , other = 'ab'

	:param Index:
	:type Index: Standard_Integer
	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "	* Inserts the other ASCII string a before a specific index in the string <self> Raises an exception if Index is out of bounds Example: before me = 'cde' , Index = 1 , other = 'ab' after me = 'abcde' , other = 'ab'

	:param Index:
	:type Index: Standard_Integer
	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "	* Returns True if the string <self> contains zero character

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* Returns True if <self> is 'ASCII' less than <other>.

	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "	* Returns True if <self> is 'ASCII' greater than <other>.

	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "	* Converts a HAsciiString containing a numeric expression to an Integer. Example: '215' returns 215.

	:rtype: int
") IntegerValue;
		Standard_Integer IntegerValue ();
		%feature("autodoc", "	* Returns True if the string contains an integer value.

	:rtype: bool
") IsIntegerValue;
		Standard_Boolean IsIntegerValue ();
		%feature("autodoc", "	* Returns True if the string contains a real value.

	:rtype: bool
") IsRealValue;
		Standard_Boolean IsRealValue ();
		%feature("autodoc", "	* Returns True if the string contains only ASCII characters between ' ' and '~'. This means no control character and no extended ASCII code.

	:rtype: bool
") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "	* Returns True if the string S not contains same characters than the string <self>.

	:param S:
	:type S: Handle_TCollection_HAsciiString &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const Handle_TCollection_HAsciiString & S);
		%feature("autodoc", "	* Returns True if the string S contains same characters than the string <self>.

	:param S:
	:type S: Handle_TCollection_HAsciiString &
	:rtype: bool
") IsSameString;
		Standard_Boolean IsSameString (const Handle_TCollection_HAsciiString & S);
		%feature("autodoc", "	* Returns True if the string S contains same characters than the string <self>.

	:param S:
	:type S: Handle_TCollection_HAsciiString &
	:param CaseSensitive:
	:type CaseSensitive: bool
	:rtype: bool
") IsSameString;
		Standard_Boolean IsSameString (const Handle_TCollection_HAsciiString & S,const Standard_Boolean CaseSensitive);
		%feature("autodoc", "	* Removes all space characters in the begining of the string

	:rtype: None
") LeftAdjust;
		void LeftAdjust ();
		%feature("autodoc", "	* Left justify. Length becomes equal to Width and the new characters are equal to Filler if Width < Length nothing happens Raises an exception if Width is less than zero Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = 'abcdef '

	:param Width:
	:type Width: Standard_Integer
	:param Filler:
	:type Filler: Standard_Character
	:rtype: None
") LeftJustify;
		void LeftJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "	* Returns number of characters in <self>. This is the same functionality as 'strlen' in C.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* returns an index in the string <self> of the first occurence of the string S in the string <self> from the starting index FromIndex to the ending index ToIndex returns zero if failure Raises an exception if FromIndex or ToIndex is out of range. Example: before me = 'aabAaAa', S = 'Aa', FromIndex = 1, ToIndex = 7 after me = 'aabAaAa' returns 4

	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") Location;
		Standard_Integer Location (const Handle_TCollection_HAsciiString & other,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Returns the index of the nth occurence of the character C in the string <self> from the starting index FromIndex to the ending index ToIndex. Returns zero if failure. Raises an exception if FromIndex or ToIndex is out of range Example: before me = 'aabAa', N = 3, C = 'a', FromIndex = 1, ToIndex = 5 after me = 'aabAa' returns 5

	:param N:
	:type N: Standard_Integer
	:param C:
	:type C: Standard_Character
	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: int
") Location;
		Standard_Integer Location (const Standard_Integer N,const Standard_Character C,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Converts <self> to its lower-case equivalent.

	:rtype: None
") LowerCase;
		void LowerCase ();
		%feature("autodoc", "	* Inserts the other string at the begining of the string <self> Example: before me = 'cde' , S = 'ab' after me = 'abcde' , S = 'ab'

	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TCollection_HAsciiString & other);

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("autodoc", "	* Converts a string containing a numeric expression to a Real. Example: '215' returns 215.0. '3.14159267' returns 3.14159267.

	:rtype: float
") RealValue;
		Standard_Real RealValue ();
		%feature("autodoc", "	* Remove all the occurences of the character C in the string Example: before me = 'HellLLo', C = 'L' , CaseSensitive = True after me = 'Hello'

	:param C:
	:type C: Standard_Character
	:param CaseSensitive:
	:type CaseSensitive: bool
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_Character C,const Standard_Boolean CaseSensitive);
		%feature("autodoc", "	* Removes every <what> characters from <self>

	:param what:
	:type what: Standard_Character
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_Character what);
		%feature("autodoc", "	* Erases <ahowmany> characters from position <where>, <where> included. Example: aString contains 'Hello' aString.Erase(2,2) erases 2 characters from position 1 This gives 'Hlo'.

	:param where:
	:type where: Standard_Integer
	:param ahowmany: default value is 1
	:type ahowmany: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "	* Removes all space characters at the end of the string.

	:rtype: None
") RightAdjust;
		void RightAdjust ();
		%feature("autodoc", "	* Right justify. Length becomes equal to Width and the new characters are equal to Filler if Width < Length nothing happens Raises an exception if Width is less than zero Example: before me = 'abcdef' , Width = 9 , Filler = ' ' after me = ' abcdef'

	:param Width:
	:type Width: Standard_Integer
	:param Filler:
	:type Filler: Standard_Character
	:rtype: None
") RightJustify;
		void RightJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "	* Searches a CString in <self> from the beginning and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.Search('le') returns 5

	:param what:
	:type what: char *
	:rtype: int
") Search;
		Standard_Integer Search (const char * what);
		%feature("autodoc", "	* Searches a String in <self> from the beginning and returns position of first item <what> matching. it returns -1 if not found.

	:param what:
	:type what: Handle_TCollection_HAsciiString &
	:rtype: int
") Search;
		Standard_Integer Search (const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "	* Searches a CString in a String from the end and returns position of first item <what> matching. It returns -1 if not found. Example: aString contains 'Sample single test' aString.SearchFromEnd('le') returns 12

	:param what:
	:type what: char *
	:rtype: int
") SearchFromEnd;
		Standard_Integer SearchFromEnd (const char * what);
		%feature("autodoc", "	* Searches a HAsciiString in another HAsciiString from the end and returns position of first item <what> matching. It returns -1 if not found.

	:param what:
	:type what: Handle_TCollection_HAsciiString &
	:rtype: int
") SearchFromEnd;
		Standard_Integer SearchFromEnd (const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "	* Replaces one character in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_Character
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "	* Replaces a part of <self> in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: char *
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const char * what);
		%feature("autodoc", "	* Replaces a part of <self> by another string.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Handle_TCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "	* Splits a HAsciiString into two sub-strings. Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'

	:param where:
	:type where: Standard_Integer
	:rtype: Handle_TCollection_HAsciiString
") Split;
		Handle_TCollection_HAsciiString Split (const Standard_Integer where);
		%feature("autodoc", "	* Creation of a sub-string of the string <self>. The sub-string starts to the index Fromindex and ends to the index ToIndex. Raises an exception if ToIndex or FromIndex is out of bounds Example: before me = 'abcdefg', ToIndex=3, FromIndex=6 after me = 'abcdefg' returns 'cdef'

	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: Handle_TCollection_HAsciiString
") SubString;
		Handle_TCollection_HAsciiString SubString (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "	* Returns pointer to string (char *) This is useful for some casual manipulations Because this 'char *' is 'const', you can't modify its contents.

	:rtype: char *
") ToCString;
		char * ToCString ();
		%feature("autodoc", "	* Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty String. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'

	:param separators: default value is '\t'
	:type separators: char *
	:param whichone: default value is 1
	:type whichone: Standard_Integer
	:rtype: Handle_TCollection_HAsciiString
") Token;
		Handle_TCollection_HAsciiString Token (const char * separators = '\t',const Standard_Integer whichone = 1);
		%feature("autodoc", "	* Truncates <self> to <ahowmany> characters. Example: me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'

	:param ahowmany:
	:type ahowmany: Standard_Integer
	:rtype: None
") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "	* Converts <self> to its upper-case equivalent.

	:rtype: None
") UpperCase;
		void UpperCase ();
		%feature("autodoc", "	* Length of the string ignoring all spaces (' ') and the control character at the end.

	:rtype: int
") UsefullLength;
		Standard_Integer UsefullLength ();
		%feature("autodoc", "	* Returns character at position <where> in <self>. If <where> is less than zero or greater than the lenght of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'

	:param where:
	:type where: Standard_Integer
	:rtype: Standard_Character
") Value;
		Standard_Character Value (const Standard_Integer where);
		%feature("autodoc", "	* Returns the field myString.

	:rtype: TCollection_AsciiString
") String;
		const TCollection_AsciiString & String ();
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ShallowCopy;
		Handle_TCollection_HAsciiString ShallowCopy ();

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        		%feature("autodoc", "	:param other:
	:type other: Handle_TCollection_HAsciiString &
	:rtype: bool
") IsSameState;
		Standard_Boolean IsSameState (const Handle_TCollection_HAsciiString & other);
};


%feature("shadow") TCollection_HAsciiString::~TCollection_HAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_HAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TCollection_HAsciiString {
	Handle_TCollection_HAsciiString GetHandle() {
	return *(Handle_TCollection_HAsciiString*) &$self;
	}
};

%nodefaultctor Handle_TCollection_HAsciiString;
class Handle_TCollection_HAsciiString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TCollection_HAsciiString();
        Handle_TCollection_HAsciiString(const Handle_TCollection_HAsciiString &aHandle);
        Handle_TCollection_HAsciiString(const TCollection_HAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TCollection_HAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TCollection_HAsciiString {
    TCollection_HAsciiString* GetObject() {
    return (TCollection_HAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TCollection_HAsciiString::~Handle_TCollection_HAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TCollection_HAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TCollection_HExtendedString;
class TCollection_HExtendedString : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Initializes a HExtendedString to an empty ExtendedString.

	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString ();
		%feature("autodoc", "	* Initializes a HExtendedString with a CString.

	:param message:
	:type message: char *
	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString (const char * message);
		%feature("autodoc", "	* Initializes a HExtendedString with an ExtString.

	:param message:
	:type message: Standard_ExtString
	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Standard_ExtString message);
		%feature("autodoc", "	* Initializes a HExtendedString with a single character.

	:param aChar:
	:type aChar: Standard_ExtCharacter
	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Standard_ExtCharacter aChar);
		%feature("autodoc", "	* Initializes a HExtendedString with <length> space allocated. and filled with <filler>.This is usefull for buffers.

	:param length:
	:type length: Standard_Integer
	:param filler:
	:type filler: Standard_ExtCharacter
	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Standard_Integer length,const Standard_ExtCharacter filler);
		%feature("autodoc", "	* Initializes a HExtendedString with a HExtendedString.

	:param aString:
	:type aString: TCollection_ExtendedString &
	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString (const TCollection_ExtendedString & aString);
		%feature("autodoc", "	* Initializes a HExtendedString with an HAsciiString.

	:param aString:
	:type aString: Handle_TCollection_HAsciiString &
	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Handle_TCollection_HAsciiString & aString);
		%feature("autodoc", "	* Initializes a HExtendedString with a HExtendedString.

	:param aString:
	:type aString: Handle_TCollection_HExtendedString &
	:rtype: None
") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Handle_TCollection_HExtendedString & aString);
		%feature("autodoc", "	* Appends <other> to me.

	:param other:
	:type other: Handle_TCollection_HExtendedString &
	:rtype: None
") AssignCat;
		void AssignCat (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "	* Returns a string appending <other> to me.

	:param other:
	:type other: Handle_TCollection_HExtendedString &
	:rtype: Handle_TCollection_HExtendedString
") Cat;
		Handle_TCollection_HExtendedString Cat (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "	* Substitutes all the characters equal to aChar by NewChar in the string <self>.

	:param aChar:
	:type aChar: Standard_ExtCharacter
	:param NewChar:
	:type NewChar: Standard_ExtCharacter
	:rtype: None
") ChangeAll;
		void ChangeAll (const Standard_ExtCharacter aChar,const Standard_ExtCharacter NewChar);
		%feature("autodoc", "	* Removes all characters contained in <self>. This produces an empty ExtendedString.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Returns True if the string <self> contains zero character

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* Insert a ExtCharacter at position <where>. Example: aString contains 'hy not ?' aString.Insert(1,'W'); gives 'Why not ?' aString contains 'Wh' aString.Insert(3,'y'); gives 'Why' aString contains 'Way' aString.Insert(2,'h'); gives 'Why'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_ExtCharacter
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "	* Insert a HExtendedString at position <where>.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Handle_TCollection_HExtendedString &
	:rtype: None
") Insert;
		void Insert (const Standard_Integer where,const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "	* Returns True if <self> is less than <other>.

	:param other:
	:type other: Handle_TCollection_HExtendedString &
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "	* Returns True if <self> is greater than <other>.

	:param other:
	:type other: Handle_TCollection_HExtendedString &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "	* Returns True if the string contains only 'Ascii Range' characters

	:rtype: bool
") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "	* Returns number of characters in <self>. This is the same functionality as 'strlen' in C.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Erases <ahowmany> characters from position <where>, <where> included. Example: aString contains 'Hello' aString.Erase(2,2) erases 2 characters from position 1 This gives 'Hlo'.

	:param where:
	:type where: Standard_Integer
	:param ahowmany: default value is 1
	:type ahowmany: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "	* Removes every <what> characters from <self>.

	:param what:
	:type what: Standard_ExtCharacter
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_ExtCharacter what);
		%feature("autodoc", "	* Replaces one character in the string at position <where>. If <where> is less than zero or greater than the length of <self> an exception is raised. Example: aString contains 'Garbake' astring.Replace(6,'g') gives <self> = 'Garbage'

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Standard_ExtCharacter
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "	* Replaces a part of <self> by another string.

	:param where:
	:type where: Standard_Integer
	:param what:
	:type what: Handle_TCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer where,const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "	* Splits a ExtendedString into two sub-strings. Example: aString contains 'abcdefg' aString.Split(3) gives <self> = 'abc' and returns 'defg'

	:param where:
	:type where: Standard_Integer
	:rtype: Handle_TCollection_HExtendedString
") Split;
		Handle_TCollection_HExtendedString Split (const Standard_Integer where);
		%feature("autodoc", "	* Searches a String in <self> from the beginning and returns position of first item <what> matching. It returns -1 if not found.

	:param what:
	:type what: Handle_TCollection_HExtendedString &
	:rtype: int
") Search;
		Standard_Integer Search (const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "	* Searches a ExtendedString in another ExtendedString from the end and returns position of first item <what> matching. It returns -1 if not found.

	:param what:
	:type what: Handle_TCollection_HExtendedString &
	:rtype: int
") SearchFromEnd;
		Standard_Integer SearchFromEnd (const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "	* Returns pointer to ExtString

	:rtype: Standard_ExtString
") ToExtString;
		Standard_ExtString ToExtString ();
		%feature("autodoc", "	* Extracts <whichone> token from <self>. By default, the <separators> is set to space and tabulation. By default, the token extracted is the first one (whichone = 1). <separators> contains all separators you need. If no token indexed by <whichone> is found, it returns an empty String. Example: aString contains 'This is a message' aString.Token() returns 'This' aString.Token(' ',4) returns 'message' aString.Token(' ',2) returns 'is' aString.Token(' ',9) returns '' Other separators than space character and tabulation are allowed aString contains '1234; test:message , value' aString.Token('; :,',4) returns 'value' aString.Token('; :,',2) returns 'test'

	:param separators:
	:type separators: Standard_ExtString
	:param whichone: default value is 1
	:type whichone: Standard_Integer
	:rtype: Handle_TCollection_HExtendedString
") Token;
		Handle_TCollection_HExtendedString Token (const Standard_ExtString separators,const Standard_Integer whichone = 1);
		%feature("autodoc", "	* Truncates <self> to <ahowmany> characters. Example: me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'

	:param ahowmany:
	:type ahowmany: Standard_Integer
	:rtype: None
") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "	* Returns ExtCharacter at position <where> in <self>. If <where> is less than zero or greater than the length of <self>, an exception is raised. Example: aString contains 'Hello' aString.Value(2) returns 'e'

	:param where:
	:type where: Standard_Integer
	:rtype: Standard_ExtCharacter
") Value;
		Standard_ExtCharacter Value (const Standard_Integer where);
		%feature("autodoc", "	* Returns the field myString

	:rtype: TCollection_ExtendedString
") String;
		const TCollection_ExtendedString & String ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("autodoc", "	:rtype: Handle_TCollection_HExtendedString
") ShallowCopy;
		Handle_TCollection_HExtendedString ShallowCopy ();

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        		%feature("autodoc", "	:param other:
	:type other: Handle_TCollection_HExtendedString &
	:rtype: bool
") IsSameState;
		Standard_Boolean IsSameState (const Handle_TCollection_HExtendedString & other);
};


%feature("shadow") TCollection_HExtendedString::~TCollection_HExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_HExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TCollection_HExtendedString {
	Handle_TCollection_HExtendedString GetHandle() {
	return *(Handle_TCollection_HExtendedString*) &$self;
	}
};

%nodefaultctor Handle_TCollection_HExtendedString;
class Handle_TCollection_HExtendedString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TCollection_HExtendedString();
        Handle_TCollection_HExtendedString(const Handle_TCollection_HExtendedString &aHandle);
        Handle_TCollection_HExtendedString(const TCollection_HExtendedString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TCollection_HExtendedString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TCollection_HExtendedString {
    TCollection_HExtendedString* GetObject() {
    return (TCollection_HExtendedString*)$self->Access();
    }
};
%feature("shadow") Handle_TCollection_HExtendedString::~Handle_TCollection_HExtendedString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TCollection_HExtendedString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TCollection_MapNode;
class TCollection_MapNode : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TCollection_MapNode;
		 TCollection_MapNode (const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next;
		TCollection_MapNodePtr & Next ();
};


%feature("shadow") TCollection_MapNode::~TCollection_MapNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_MapNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TCollection_MapNode {
	Handle_TCollection_MapNode GetHandle() {
	return *(Handle_TCollection_MapNode*) &$self;
	}
};

%nodefaultctor Handle_TCollection_MapNode;
class Handle_TCollection_MapNode : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TCollection_MapNode();
        Handle_TCollection_MapNode(const Handle_TCollection_MapNode &aHandle);
        Handle_TCollection_MapNode(const TCollection_MapNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TCollection_MapNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TCollection_MapNode {
    TCollection_MapNode* GetObject() {
    return (TCollection_MapNode*)$self->Access();
    }
};
%feature("shadow") Handle_TCollection_MapNode::~Handle_TCollection_MapNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TCollection_MapNode {
    void _kill_pointed() {
        delete $self;
    }
};

class TCollection_PrivCompareOfInteger {
	public:
		%feature("autodoc", "	:param Left:
	:type Left: Standard_Integer &
	:param Right:
	:type Right: Standard_Integer &
	:rtype: bool
") IsLower;
		virtual Standard_Boolean IsLower (const Standard_Integer & Left,const Standard_Integer & Right);
		%feature("autodoc", "	:param Left:
	:type Left: Standard_Integer &
	:param Right:
	:type Right: Standard_Integer &
	:rtype: bool
") IsGreater;
		virtual Standard_Boolean IsGreater (const Standard_Integer & Left,const Standard_Integer & Right);
		%feature("autodoc", "	:param Left:
	:type Left: Standard_Integer &
	:param Right:
	:type Right: Standard_Integer &
	:rtype: bool
") IsEqual;
		virtual Standard_Boolean IsEqual (const Standard_Integer & Left,const Standard_Integer & Right);
};


%feature("shadow") TCollection_PrivCompareOfInteger::~TCollection_PrivCompareOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_PrivCompareOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
class TCollection_PrivCompareOfReal {
	public:
		%feature("autodoc", "	:param Left:
	:type Left: float &
	:param Right:
	:type Right: float &
	:rtype: bool
") IsLower;
		virtual Standard_Boolean IsLower (const Standard_Real & Left,const Standard_Real & Right);
		%feature("autodoc", "	:param Left:
	:type Left: float &
	:param Right:
	:type Right: float &
	:rtype: bool
") IsGreater;
		virtual Standard_Boolean IsGreater (const Standard_Real & Left,const Standard_Real & Right);
		%feature("autodoc", "	:param Left:
	:type Left: float &
	:param Right:
	:type Right: float &
	:rtype: bool
") IsEqual;
		virtual Standard_Boolean IsEqual (const Standard_Real & Left,const Standard_Real & Right);
};


%feature("shadow") TCollection_PrivCompareOfReal::~TCollection_PrivCompareOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_PrivCompareOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_SeqNode;
class TCollection_SeqNode : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TCollection_SeqNode;
		 TCollection_SeqNode (const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: TCollection_SeqNodePtr
") Next;
		TCollection_SeqNodePtr & Next ();
		%feature("autodoc", "	:rtype: TCollection_SeqNodePtr
") Previous;
		TCollection_SeqNodePtr & Previous ();
};


%feature("shadow") TCollection_SeqNode::~TCollection_SeqNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_SeqNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TCollection_SeqNode {
	Handle_TCollection_SeqNode GetHandle() {
	return *(Handle_TCollection_SeqNode*) &$self;
	}
};

%nodefaultctor Handle_TCollection_SeqNode;
class Handle_TCollection_SeqNode : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TCollection_SeqNode();
        Handle_TCollection_SeqNode(const Handle_TCollection_SeqNode &aHandle);
        Handle_TCollection_SeqNode(const TCollection_SeqNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TCollection_SeqNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TCollection_SeqNode {
    TCollection_SeqNode* GetObject() {
    return (TCollection_SeqNode*)$self->Access();
    }
};
%feature("shadow") Handle_TCollection_SeqNode::~Handle_TCollection_SeqNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TCollection_SeqNode {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TCollection_CompareOfInteger;
class TCollection_CompareOfInteger : public TCollection_PrivCompareOfInteger {
	public:
		%feature("autodoc", "	:rtype: None
") TCollection_CompareOfInteger;
		 TCollection_CompareOfInteger ();
		%feature("autodoc", "	* Returns True if <Left> is lower than <Right>.

	:param Left:
	:type Left: Standard_Integer &
	:param Right:
	:type Right: Standard_Integer &
	:rtype: bool
") IsLower;
		virtual Standard_Boolean IsLower (const Standard_Integer & Left,const Standard_Integer & Right);
		%feature("autodoc", "	* Returns True if <Left> is greater than <Right>.

	:param Left:
	:type Left: Standard_Integer &
	:param Right:
	:type Right: Standard_Integer &
	:rtype: bool
") IsGreater;
		virtual Standard_Boolean IsGreater (const Standard_Integer & Left,const Standard_Integer & Right);
};


%feature("shadow") TCollection_CompareOfInteger::~TCollection_CompareOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_CompareOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TCollection_CompareOfReal;
class TCollection_CompareOfReal : public TCollection_PrivCompareOfReal {
	public:
		%feature("autodoc", "	:rtype: None
") TCollection_CompareOfReal;
		 TCollection_CompareOfReal ();
		%feature("autodoc", "	* Returns True if <Left> is lower than <Right>.

	:param Left:
	:type Left: float &
	:param Right:
	:type Right: float &
	:rtype: bool
") IsLower;
		virtual Standard_Boolean IsLower (const Standard_Real & Left,const Standard_Real & Right);
		%feature("autodoc", "	* Returns True if <Left> is greater than <Right>.

	:param Left:
	:type Left: float &
	:param Right:
	:type Right: float &
	:rtype: bool
") IsGreater;
		virtual Standard_Boolean IsGreater (const Standard_Real & Left,const Standard_Real & Right);
};


%feature("shadow") TCollection_CompareOfReal::~TCollection_CompareOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TCollection_CompareOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
