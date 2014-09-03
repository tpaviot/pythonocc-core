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
%include ../common/StandardDefines.i
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
%nodefaultctor TCollection;
class TCollection {
	public:
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	static Standard_Integer

Returns a  prime number greater than  <I> suitable  
to dimension a Map.  When  <I> becomes great there  
is  a  limit on  the  result (today  the  limit is  
around 1 000 000). This is not a limit of the number of  
items but a limit in the number  of buckets.  i.e.  
there will be more collisions  in  the map.") NextPrimeForMap;
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
		%feature("autodoc", "Args:
	L(TCollection_AVLBaseNodePtr)
	R(TCollection_AVLBaseNodePtr)

Returns:
	None

No detailed docstring for this function.") TCollection_AVLBaseNode;
		 TCollection_AVLBaseNode (const TCollection_AVLBaseNodePtr & L,const TCollection_AVLBaseNodePtr & R);
		%feature("autodoc", "Args:
	theNode(TCollection_AVLBaseNodePtr)
	theSide(TCollection_Side)

Returns:
	None

No detailed docstring for this function.") SetChild;
		void SetChild (const TCollection_AVLBaseNodePtr & theNode,const TCollection_Side theSide);
		%feature("autodoc", "Args:
	ANode(TCollection_AVLBaseNodePtr)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Height;
		static Standard_Integer Height (const TCollection_AVLBaseNodePtr & ANode);
		%feature("autodoc", "Args:
	ANode(TCollection_AVLBaseNodePtr)

Returns:
	static Standard_Integer

No detailed docstring for this function.") RecursiveExtent;
		static Standard_Integer RecursiveExtent (const TCollection_AVLBaseNodePtr & ANode);
		%feature("autodoc", "Args:
	ANode(TCollection_AVLBaseNodePtr)

Returns:
	static Standard_Integer

No detailed docstring for this function.") RecursiveTotalExtent;
		static Standard_Integer RecursiveTotalExtent (const TCollection_AVLBaseNodePtr & ANode);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AVLBaseNodePtr

No detailed docstring for this function.") Right;
		TCollection_AVLBaseNodePtr & Right ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AVLBaseNodePtr

No detailed docstring for this function.") Left;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Address;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Address;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes a AsciiString to an empty AsciiString.") TCollection_AsciiString;
		 TCollection_AsciiString ();
		%feature("autodoc", "Args:
	message(char *)

Returns:
	None

Initializes a AsciiString with a CString.") TCollection_AsciiString;
		 TCollection_AsciiString (const char * message);
		%feature("autodoc", "Args:
	message(char *)
	aLen(Standard_Integer)

Returns:
	None

Initializes a AsciiString with a CString.") TCollection_AsciiString;
		 TCollection_AsciiString (const char * message,const Standard_Integer aLen);
		%feature("autodoc", "Args:
	aChar(Standard_Character)

Returns:
	None

Initializes a AsciiString with a single character.") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Character aChar);
		%feature("autodoc", "Args:
	length(Standard_Integer)
	filler(Standard_Character)

Returns:
	None

Initializes an AsciiString with <length> space allocated.  
and filled with <filler>. This is usefull for buffers.") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Integer length,const Standard_Character filler);
		%feature("autodoc", "Args:
	value(Standard_Integer)

Returns:
	None

Initializes an AsciiString with an integer value") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Integer value);
		%feature("autodoc", "Args:
	value(Standard_Real)

Returns:
	None

Initializes an AsciiString with a real value") TCollection_AsciiString;
		 TCollection_AsciiString (const Standard_Real value);
		%feature("autodoc", "Args:
	astring(TCollection_AsciiString)

Returns:
	None

Initializes a AsciiString with another AsciiString.") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring);
		%feature("autodoc", "Args:
	astring(TCollection_AsciiString)
	message(Standard_Character)

Returns:
	None

Initializes a AsciiString with copy of another AsciiString  
         concatenated with the message character.") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring,const Standard_Character message);
		%feature("autodoc", "Args:
	astring(TCollection_AsciiString)
	message(char *)

Returns:
	None

Initializes a AsciiString with copy of another AsciiString  
         concatenated with the message string.") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring,const char * message);
		%feature("autodoc", "Args:
	astring(TCollection_AsciiString)
	message(TCollection_AsciiString)

Returns:
	None

Initializes a AsciiString with copy of another AsciiString  
         concatenated with the message string.") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_AsciiString & astring,const TCollection_AsciiString & message);
		%feature("autodoc", "Args:
	astring(TCollection_ExtendedString)
	replaceNonAscii(Standard_Character)=0

Returns:
	None

Creation by converting an extended string to an ascii string.  
         If replaceNonAscii is non-null charecter, it will be used  
         in place of any non-ascii character found in the source string.  
         Otherwise, raises OutOfRange exception if at least one character  
         in the source string is not in the 'Ascii range'.") TCollection_AsciiString;
		 TCollection_AsciiString (const TCollection_ExtendedString & astring,const Standard_Character replaceNonAscii = 0);
		%feature("autodoc", "Args:
	other(Standard_Character)

Returns:
	None

Appends <other>  to me. This is an unary operator.") AssignCat;
		void AssignCat (const Standard_Character other);
		%feature("autodoc", "Args:
	other(Standard_Character)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const Standard_Character other);
		%feature("autodoc", "Args:
	other(Standard_Integer)

Returns:
	None

Appends <other>  to me. This is an unary operator.") AssignCat;
		void AssignCat (const Standard_Integer other);
		%feature("autodoc", "Args:
	other(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const Standard_Integer other);
		%feature("autodoc", "Args:
	other(Standard_Real)

Returns:
	None

Appends <other>  to me. This is an unary operator.") AssignCat;
		void AssignCat (const Standard_Real other);
		%feature("autodoc", "Args:
	other(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const Standard_Real other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	None

Appends <other>  to me. This is an unary operator.  
ex: aString += 'Dummy'  
To catenate more than one CString, you must put a  
AsciiString before.  
 Example: aString += 'Hello ' + 'Dolly'  IS NOT VALID !  
But astring += anotherString + 'Hello ' + 'Dolly' is valid.") AssignCat;
		void AssignCat (const char * other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const char * other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	None

Appends <other> to me. This is an unary operator.  
 Example: aString += anotherString") AssignCat;
		void AssignCat (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	None
Returns:
	None

Converts the first character into its corresponding  
upper-case character and the other characters into lowercase  
 Example: before  
  me = 'hellO '  
after  
  me = 'Hello '") Capitalize;
		void Capitalize ();
		%feature("autodoc", "Args:
	other(Standard_Character)

Returns:
	TCollection_AsciiString

Appends <other>  to me.  
Syntax:  
aString = aString + 'Dummy'  
 Example: aString contains 'I say '  
aString = aString + 'Hello ' + 'Dolly'  
gives 'I say Hello Dolly'  
To catenate more than one CString, you must put a String before.  
So the following example is WRONG !  
     aString = 'Hello ' + 'Dolly'  THIS IS NOT ALLOWED  
This rule is applicable to AssignCat (operator +=) too.") Cat;
		TCollection_AsciiString Cat (const Standard_Character other);
		%feature("autodoc", "Args:
	other(Standard_Character)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") operator+;
		TCollection_AsciiString operator + (const Standard_Character other);
		%feature("autodoc", "Args:
	other(Standard_Integer)

Returns:
	TCollection_AsciiString

Appends <other>  to me.  
Syntax:  
aString = aString + 15;  
 Example: aString contains 'I say '  
gives 'I say 15'  
To catenate more than one CString, you must put a String before.  
So the following example is WRONG !  
     aString = 'Hello ' + 'Dolly'  THIS IS NOT ALLOWED  
This rule is applicable to AssignCat (operator +=) too.") Cat;
		TCollection_AsciiString Cat (const Standard_Integer other);
		%feature("autodoc", "Args:
	other(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") operator+;
		TCollection_AsciiString operator + (const Standard_Integer other);
		%feature("autodoc", "Args:
	other(Standard_Real)

Returns:
	TCollection_AsciiString

Appends <other>  to me.  
Syntax:  
aString = aString + 15.15;  
 Example: aString contains 'I say '  
gives 'I say 15.15'  
To catenate more than one CString, you must put a String before.  
So the following example is WRONG !  
     aString = 'Hello ' + 'Dolly'  THIS IS NOT ALLOWED  
This rule is applicable to AssignCat (operator +=) too.") Cat;
		TCollection_AsciiString Cat (const Standard_Real other);
		%feature("autodoc", "Args:
	other(Standard_Real)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") operator+;
		TCollection_AsciiString operator + (const Standard_Real other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	TCollection_AsciiString

Appends <other>  to me.  
Syntax:  
aString = aString + 'Dummy'  
 Example: aString contains 'I say '  
aString = aString + 'Hello ' + 'Dolly'  
gives 'I say Hello Dolly'  
To catenate more than one CString, you must put a String before.  
So the following example is WRONG !  
     aString = 'Hello ' + 'Dolly'  THIS IS NOT ALLOWED  
This rule is applicable to AssignCat (operator +=) too.") Cat;
		TCollection_AsciiString Cat (const char * other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") operator+;
		TCollection_AsciiString operator + (const char * other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	TCollection_AsciiString

Appends <other> to me.  
 Example: aString = aString + anotherString") Cat;
		TCollection_AsciiString Cat (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") operator+;
		TCollection_AsciiString operator + (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Filler(Standard_Character)

Returns:
	None

Modifies this ASCII string so that its length  
becomes equal to Width and the new characters  
are equal to Filler. New characters are added  
both at the beginning and at the end of this string.  
If Width is less than the length of this ASCII string, nothing happens.  
Example  
TCollection_AsciiString  
myAlphabet('abcdef');  
myAlphabet.Center(9,' ');  
assert ( myAlphabet == '  
abcdef ' );") Center;
		void Center (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "Args:
	aChar(Standard_Character)
	NewChar(Standard_Character)
	CaseSensitive(Standard_Boolean)=Standard_True

Returns:
	None

Substitutes all the characters equal to aChar by NewChar  
in the AsciiString <self>.  
The substitution can be case sensitive.  
If you don't use default case sensitive, no matter wether aChar  
is uppercase or not.  
 Example: me = 'Histake' -> ChangeAll('H','M',Standard_True)  
gives me = 'Mistake'") ChangeAll;
		void ChangeAll (const Standard_Character aChar,const Standard_Character NewChar,const Standard_Boolean CaseSensitive = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all characters contained in <self>.  
This produces an empty AsciiString.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	fromwhere(char *)

Returns:
	None

Copy <fromwhere> to <self>.  
Used as operator =  
 Example: aString = anotherCString;") Copy;
		void Copy (const char * fromwhere);
		%feature("autodoc", "Args:
	fromwhere(char *)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const char * fromwhere);
		%feature("autodoc", "Args:
	fromwhere(TCollection_AsciiString)

Returns:
	None

Copy <fromwhere> to <self>.  
Used as operator =  
 Example: aString = anotherString;") Copy;
		void Copy (const TCollection_AsciiString & fromwhere);
		%feature("autodoc", "Args:
	fromwhere(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TCollection_AsciiString & fromwhere);
		%feature("autodoc", "Args:
	None
Returns:
	None

Frees memory allocated by AsciiString.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Set(TCollection_AsciiString)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of the first character of <self> that is  
present in <Set>.  
The search begins to the index FromIndex and ends to the  
the index ToIndex.  
Returns zero if failure.  
Raises an exception if FromIndex or ToIndex is out of range.  
 Example: before  
  me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7  
after  
  me = 'aabAcAa'  
returns  
  1") FirstLocationInSet;
		Standard_Integer FirstLocationInSet (const TCollection_AsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	Set(TCollection_AsciiString)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of the first character of <self>  
that is not present in the set <Set>.  
The search begins to the index FromIndex and ends to the  
the index ToIndex in <self>.  
Returns zero if failure.  
Raises an exception if FromIndex or ToIndex is out of range.  
 Example: before  
  me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7  
after  
  me = 'aabAcAa'  
returns  
  3") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet (const TCollection_AsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_Character)

Returns:
	None

Inserts a Character at position <where>.  
 Example:  
   aString contains 'hy not ?'  
   aString.Insert(1,'W'); gives 'Why not ?'  
   aString contains 'Wh'  
   aString.Insert(3,'y'); gives 'Why'  
   aString contains 'Way'  
   aString.Insert(2,'h'); gives 'Why'") Insert;
		void Insert (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(char *)

Returns:
	None

Inserts a CString at position <where>.  
 Example:  
   aString contains 'O more'  
   aString.Insert(2,'nce');  gives 'Once more'") Insert;
		void Insert (const Standard_Integer where,const char * what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(TCollection_AsciiString)

Returns:
	None

Inserts a AsciiString at position <where>.") Insert;
		void Insert (const Standard_Integer where,const TCollection_AsciiString & what);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	other(TCollection_AsciiString)

Returns:
	None

Pushing a string after a specific index in the string <self>.  
Raises an exception if Index is out of bounds.  
-   less than 0 (InsertAfter), or less than 1 (InsertBefore), or  
-   greater than the number of characters in this ASCII string.  
 Example:  
before  
  me = 'cde' , Index = 0 , other = 'ab'  
after  
  me = 'abcde' , other = 'ab'") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	other(TCollection_AsciiString)

Returns:
	None

Pushing a string before a specific index in the string <self>.  
Raises an exception if Index is out of bounds.  
-   less than 0 (InsertAfter), or less than 1 (InsertBefore), or  
-   greater than the number of characters in this ASCII string.  
 Example:  
before  
  me = 'cde' , Index = 1 , other = 'ab'  
after  
  me = 'abcde' , other = 'ab'") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the string <self> contains zero character.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

Returns true if the characters in this ASCII string  
are identical to the characters in ASCII string other.  
Note that this method is an alias of operator ==.") IsEqual;
		Standard_Boolean IsEqual (const char * other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const char * other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

Returns true if the characters in this ASCII string  
are identical to the characters in ASCII string other.  
Note that this method is an alias of operator ==.") IsEqual;
		Standard_Boolean IsEqual (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

Returns true if there are differences between the  
characters in this ASCII string and ASCII string other.  
Note that this method is an alias of operator !=") IsDifferent;
		Standard_Boolean IsDifferent (const char * other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator!=;
		Standard_Boolean operator != (const char * other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

Returns true if there are differences between the  
characters in this ASCII string and ASCII string other.  
Note that this method is an alias of operator !=") IsDifferent;
		Standard_Boolean IsDifferent (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator!=;
		Standard_Boolean operator != (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

Returns TRUE if <self> is 'ASCII' less than <other>.") IsLess;
		Standard_Boolean IsLess (const char * other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator<;
		Standard_Boolean operator < (const char * other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is 'ASCII' less than <other>.") IsLess;
		Standard_Boolean IsLess (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator<;
		Standard_Boolean operator < (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

Returns TRUE if <self> is 'ASCII' greater than <other>.") IsGreater;
		Standard_Boolean IsGreater (const char * other);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator>;
		Standard_Boolean operator > (const char * other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is 'ASCII' greater than <other>.") IsGreater;
		Standard_Boolean IsGreater (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator>;
		Standard_Boolean operator > (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Converts a AsciiString containing a numeric expression to  
an Integer.  
 Example: '215' returns 215.") IntegerValue;
		Standard_Integer IntegerValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the AsciiString contains an integer value.  
Note: an integer value is considered to be a real value as well.") IsIntegerValue;
		Standard_Boolean IsIntegerValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the AsciiString contains a real value.  
 Note: an integer value is considered to be a real value as well.") IsRealValue;
		Standard_Boolean IsRealValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the AsciiString contains only ASCII characters  
between ' ' and '~'.  
This means no control character and no extended ASCII code.") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all space characters in the begining of the string.") LeftAdjust;
		void LeftAdjust ();
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Filler(Standard_Character)

Returns:
	None

left justify  
Length becomes equal to Width and the new characters are  
equal to Filler.  
If Width < Length nothing happens.  
Raises an exception if Width is less than zero.  
 Example:  
before  
  me = 'abcdef' , Width = 9 , Filler = ' '  
after  
  me = 'abcdef   '") LeftJustify;
		void LeftJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of characters in <self>.  
This is the same functionality as 'strlen' in C.  
Example  
 TCollection_AsciiString myAlphabet('abcdef');  
assert ( myAlphabet.Length() == 6 );  
-   1 is the position of the first character in this string.  
-   The length of this string gives the position of its last character.  
-   Positions less than or equal to zero, or  
  greater than the length of this string are  
  invalid in functions which identify a character  
  of this string by its position.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns an index in the string <self> of the first occurence  
of the string S in the string <self> from the starting index  
FromIndex to the ending index ToIndex  
returns zero if failure  
Raises an exception if FromIndex or ToIndex is out of range.  
 Example:  
before  
  me = 'aabAaAa', S = 'Aa', FromIndex = 1, ToIndex = 7  
after  
  me = 'aabAaAa'  
returns  
  4") Location;
		Standard_Integer Location (const TCollection_AsciiString & other,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	C(Standard_Character)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of the nth occurence of the character C  
in the string <self> from the starting index FromIndex to the  
ending index ToIndex.  
Returns zero if failure.  
Raises an exception if FromIndex or ToIndex is out of range.  
 Example:  
before  
  me = 'aabAa', N = 3, C = 'a', FromIndex = 1, ToIndex = 5  
after  
  me = 'aabAa'  
returns  
  5") Location;
		Standard_Integer Location (const Standard_Integer N,const Standard_Character C,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

Converts <self> to its lower-case equivalent.  
Example  
TCollection_AsciiString myString('Hello Dolly');  
myString.UpperCase();  
assert ( myString == 'HELLO DOLLY' );  
myString.LowerCase();  
assert ( myString == 'hello dolly' );") LowerCase;
		void LowerCase ();
		%feature("autodoc", "Args:
	other(TCollection_AsciiString)

Returns:
	None

Inserts the string other at the beginning of this ASCII string.  
Example  
TCollection_AsciiString myAlphabet('cde');  
TCollection_AsciiString myBegin('ab');  
myAlphabet.Prepend(myBegin);  
assert ( myAlphabet == 'abcde' );") Prepend;
		void Prepend (const TCollection_AsciiString & other);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Displays <self> on a stream.") Print;
		void Print (Standard_OStream & astream);
		%feature("autodoc", "Args:
	astream(Standard_IStream)

Returns:
	None

Read <self> from a stream.") Read;
		void Read (Standard_IStream & astream);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Converts an AsciiString containing a numeric expression.  
to a Real.  
 Example: ex: '215' returns 215.0.  
ex: '3.14159267' returns 3.14159267.") RealValue;
		Standard_Real RealValue ();
		%feature("autodoc", "Args:
	C(Standard_Character)
	CaseSensitive(Standard_Boolean)

Returns:
	None

Remove all the occurences of the character C in the string.  
 Example:  
before  
  me = 'HellLLo', C = 'L' , CaseSensitive = True  
after  
  me = 'Hello'") RemoveAll;
		void RemoveAll (const Standard_Character C,const Standard_Boolean CaseSensitive);
		%feature("autodoc", "Args:
	what(Standard_Character)

Returns:
	None

Removes every <what> characters from <self>.") RemoveAll;
		void RemoveAll (const Standard_Character what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	ahowmany(Standard_Integer)=1

Returns:
	None

Erases <ahowmany> characters from position <where>,  
<where> included.  
 Example:  
  aString contains 'Hello'  
  aString.Remove(2,2) erases 2 characters from position 2  
This gives 'Hlo'.") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all space characters at the end of the string.") RightAdjust;
		void RightAdjust ();
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Filler(Standard_Character)

Returns:
	None

Right justify.  
Length becomes equal to Width and the new characters are  
equal to Filler.  
if Width < Length nothing happens.  
Raises an exception if Width is less than zero.  
 Example:  
before  
  me = 'abcdef' , Width = 9 , Filler = ' '  
after  
  me = '   abcdef'") RightJustify;
		void RightJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "Args:
	what(char *)

Returns:
	Standard_Integer

Searches a CString in <self> from the beginning  
and returns position of first item <what> matching.  
it returns -1 if not found.  
 Example:  
 aString contains 'Sample single test'  
 aString.Search('le') returns 5") Search;
		Standard_Integer Search (const char * what);
		%feature("autodoc", "Args:
	what(TCollection_AsciiString)

Returns:
	Standard_Integer

Searches an AsciiString in <self> from the beginning  
and returns position of first item <what> matching.  
It returns -1 if not found.") Search;
		Standard_Integer Search (const TCollection_AsciiString & what);
		%feature("autodoc", "Args:
	what(char *)

Returns:
	Standard_Integer

Searches a CString in a AsciiString from the end  
and returns position of first item <what> matching.  
It returns -1 if not found.  
 Example:  
 aString contains 'Sample single test'  
 aString.SearchFromEnd('le') returns 12") SearchFromEnd;
		Standard_Integer SearchFromEnd (const char * what);
		%feature("autodoc", "Args:
	what(TCollection_AsciiString)

Returns:
	Standard_Integer

Searches a AsciiString in another AsciiString from the end  
and returns position of first item <what> matching.  
It returns -1 if not found.") SearchFromEnd;
		Standard_Integer SearchFromEnd (const TCollection_AsciiString & what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_Character)

Returns:
	None

Replaces one character in the AsciiString at position <where>.  
If <where> is less than zero or greater than the length of <self>  
an exception is raised.  
 Example:  
aString contains 'Garbake'  
astring.Replace(6,'g')  gives <self> = 'Garbage'") SetValue;
		void SetValue (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(char *)

Returns:
	None

Replaces a part of <self> by a CString.  
If <where> is less than zero or greater than the length of <self>  
an exception is raised.  
 Example:  
 aString contains 'abcde'  
 aString.SetValue(4,'1234567') gives <self> = 'abc1234567'") SetValue;
		void SetValue (const Standard_Integer where,const char * what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(TCollection_AsciiString)

Returns:
	None

Replaces a part of <self> by another AsciiString.") SetValue;
		void SetValue (const Standard_Integer where,const TCollection_AsciiString & what);
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	TCollection_AsciiString

Splits a AsciiString into two sub-strings.  
 Example:  
aString contains 'abcdefg'  
aString.Split(3) gives <self> = 'abc' and returns 'defg'") Split;
		TCollection_AsciiString Split (const Standard_Integer where);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	TCollection_AsciiString

Creation of a sub-string of the string <self>.  
The sub-string starts to the index Fromindex and ends  
to the index ToIndex.  
Raises an exception if ToIndex or FromIndex is out of bounds  
 Example:  
before  
  me = 'abcdefg', ToIndex=3, FromIndex=6  
after  
  me = 'abcdefg'  
returns  
  'cdef'") SubString;
		TCollection_AsciiString SubString (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns pointer to AsciiString (char *).  
This is useful for some casual manipulations.  
 Warning: Because this 'char *' is 'const', you can't modify its contents.") ToCString;
		char * ToCString ();
		%feature("autodoc", "Args:
	separators(char *)= \t
	whichone(Standard_Integer)=1

Returns:
	TCollection_AsciiString

Extracts <whichone> token from <self>.  
By default, the <separators> is set to space and tabulation.  
By default, the token extracted is the first one (whichone = 1).  
<separators> contains all separators you need.  
If no token indexed by <whichone> is found, it returns empty AsciiString.  
 Example:  
   aString contains 'This is a     message'  
   aString.Token()  returns 'This'  
   aString.Token(' ',4) returns 'message'  
   aString.Token(' ',2) returns 'is'  
   aString.Token(' ',9) returns ''  
Other separators than space character and tabulation are allowed :  
   aString contains '1234; test:message   , value'  
   aString.Token('; :,',4) returns 'value'  
   aString.Token('; :,',2) returns 'test'") Token;
		TCollection_AsciiString Token (const char * separators = " \t",const Standard_Integer whichone = 1);
		%feature("autodoc", "Args:
	ahowmany(Standard_Integer)

Returns:
	None

Truncates <self> to <ahowmany> characters.  
 Example:  me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "Args:
	None
Returns:
	None

Converts <self> to its upper-case equivalent.") UpperCase;
		void UpperCase ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Length of the string ignoring all spaces (' ') and the  
control character at the end.") UsefullLength;
		Standard_Integer UsefullLength ();
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	Standard_Character

Returns character at position <where> in <self>.  
If <where> is less than zero or greater than the lenght of <self>,  
an exception is raised.  
 Example:  
   aString contains 'Hello'  
   aString.Value(2) returns 'e'") Value;
		Standard_Character Value (const Standard_Integer where);
		%feature("autodoc", "Args:
	astring(TCollection_AsciiString)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

Hash function for AsciiString  
 (returns the same Integer value that the hash function for ExtendedString)") HashCode;
		static Standard_Integer HashCode (const TCollection_AsciiString & astring,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	string1(TCollection_AsciiString)
	string2(TCollection_AsciiString)

Returns:
	static Standard_Boolean

Returns True  when the two  strings are the same.  
         (Just for HashCode for AsciiString)") IsEqual;
		static Standard_Boolean IsEqual (const TCollection_AsciiString & string1,const TCollection_AsciiString & string2);
		%feature("autodoc", "Args:
	string1(TCollection_AsciiString)
	string2(char *)

Returns:
	static Standard_Boolean

Returns True  when the two  strings are the same.  
         (Just for HashCode for AsciiString)") IsEqual;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if the sequence <self> contains no elements.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns  the  number  of element(s) in the  
sequence.  Returns zero if the sequence is empty.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the order of items on <self>.  
 Example:  
before  
  me = (A B C)  
after  
  me = (C B A)") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	None

Swaps  elements  which    are  located  at  
positions <I> and <J> in <self>.  
Raises an exception if I or J is out of bound.  
 Example:  
before  
  me = (A B C), I = 1, J = 3  
after  
  me = (C B A)") Exchange;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of buckets in <self>.") NbBuckets;
		Standard_Integer NbBuckets ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of keys already stored in <self>.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True when the map  contains no keys.  
This is exactly Extent() == 0.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	S(Standard_OStream)

Returns:
	None

Prints  on <S> usefull  statistics  about  the map  
<self>.  It  can be used  to test the quality of the hashcoding.") Statistics;
		void Statistics (Standard_OStream & S);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets the iterator to the first node.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a current entry for this iterator in the map.  
Use the function Next to set this iterator to the position of  
the next entry, if it exists.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets this iterator to the position of the next entry of the map.  
Nothing is changed if there is no more entry to explore in  
the map: this iterator is always positioned on the last entry  
of the map but the function More returns false.") Next;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes a ExtendedString to an empty ExtendedString.") TCollection_ExtendedString;
		 TCollection_ExtendedString ();
		%feature("autodoc", "Args:
	astring(char *)
	isMultiByte(Standard_Boolean)=Standard_False

Returns:
	None

Creation by converting a CString to an extended string.") TCollection_ExtendedString;
		 TCollection_ExtendedString (const char * astring,const Standard_Boolean isMultiByte = Standard_False);
		%feature("autodoc", "Args:
	astring(Standard_ExtString)

Returns:
	None

Creation by converting an ExtString to an extended string.") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_ExtString astring);
		%feature("autodoc", "Args:
	aChar(Standard_Character)

Returns:
	None

Initializes a AsciiString with a single character.") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Character aChar);
		%feature("autodoc", "Args:
	aChar(Standard_ExtCharacter)

Returns:
	None

Initializes a ExtendedString with a single character.") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_ExtCharacter aChar);
		%feature("autodoc", "Args:
	length(Standard_Integer)
	filler(Standard_ExtCharacter)

Returns:
	None

Initializes a ExtendedString with <length> space allocated.  
and filled with <filler>.This is useful for buffers.") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Integer length,const Standard_ExtCharacter filler);
		%feature("autodoc", "Args:
	value(Standard_Integer)

Returns:
	None

Initializes an ExtendedString with an integer value") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Integer value);
		%feature("autodoc", "Args:
	value(Standard_Real)

Returns:
	None

Initializes an ExtendedString with a real value") TCollection_ExtendedString;
		 TCollection_ExtendedString (const Standard_Real value);
		%feature("autodoc", "Args:
	astring(TCollection_ExtendedString)

Returns:
	None

Initializes a ExtendedString with another ExtendedString.") TCollection_ExtendedString;
		 TCollection_ExtendedString (const TCollection_ExtendedString & astring);
		%feature("autodoc", "Args:
	astring(TCollection_AsciiString)

Returns:
	None

Creation by converting a normal Ascii string to an extended string.") TCollection_ExtendedString;
		 TCollection_ExtendedString (const TCollection_AsciiString & astring);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	None

Appends the other extended string to this extended string.  
Note that this method is an alias of operator +=.  
Example: aString += anotherString") AssignCat;
		void AssignCat (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	TCollection_ExtendedString

Appends <other> to me.") Cat;
		TCollection_ExtendedString Cat (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") operator+;
		TCollection_ExtendedString operator + (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	aChar(Standard_ExtCharacter)
	NewChar(Standard_ExtCharacter)

Returns:
	None

Substitutes all the characters equal to aChar by NewChar  
in the ExtendedString <self>.  
The substitution can be case sensitive.  
If you don't use default case sensitive, no matter wether aChar  
is uppercase or not.") ChangeAll;
		void ChangeAll (const Standard_ExtCharacter aChar,const Standard_ExtCharacter NewChar);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all characters contained in <self>.  
This produces an empty ExtendedString.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	fromwhere(TCollection_ExtendedString)

Returns:
	None

Copy <fromwhere> to <self>.  
Used as operator =") Copy;
		void Copy (const TCollection_ExtendedString & fromwhere);
		%feature("autodoc", "Args:
	fromwhere(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TCollection_ExtendedString & fromwhere);
		%feature("autodoc", "Args:
	None
Returns:
	None

Frees memory allocated by ExtendedString.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_ExtCharacter)

Returns:
	None

Insert a Character at position <where>.") Insert;
		void Insert (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(TCollection_ExtendedString)

Returns:
	None

Insert a ExtendedString at position <where>.") Insert;
		void Insert (const Standard_Integer where,const TCollection_ExtendedString & what);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

Returns true if the characters in this extended  
string are identical to the characters in the other extended string.  
Note that this method is an alias of operator ==") IsEqual;
		Standard_Boolean IsEqual (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

Returns true if the characters in this extended  
string are identical to the characters in the other extended string.  
Note that this method is an alias of operator ==") IsEqual;
		Standard_Boolean IsEqual (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

Returns true if there are differences between the  
characters in this extended string and the other extended string.  
Note that this method is an alias of operator !=.") IsDifferent;
		Standard_Boolean IsDifferent (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator!=;
		Standard_Boolean operator != (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

Returns true if there are differences between the  
characters in this extended string and the other extended string.  
Note that this method is an alias of operator !=.") IsDifferent;
		Standard_Boolean IsDifferent (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator!=;
		Standard_Boolean operator != (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is less than <other>.") IsLess;
		Standard_Boolean IsLess (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator<;
		Standard_Boolean operator < (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is less than <other>.") IsLess;
		Standard_Boolean IsLess (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator<;
		Standard_Boolean operator < (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is greater than <other>.") IsGreater;
		Standard_Boolean IsGreater (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(Standard_ExtString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator>;
		Standard_Boolean operator > (const Standard_ExtString other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is greater than <other>.") IsGreater;
		Standard_Boolean IsGreater (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	other(TCollection_ExtendedString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator>;
		Standard_Boolean operator > (const TCollection_ExtendedString & other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the ExtendedString contains only  
'Ascii Range' characters .") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of characters in <self>.  
This is the same functionality as 'strlen' in C.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Displays <self> .") Print;
		void Print (Standard_OStream & astream);
		%feature("autodoc", "Args:
	what(Standard_ExtCharacter)

Returns:
	None

Removes every <what> characters from <self>.") RemoveAll;
		void RemoveAll (const Standard_ExtCharacter what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	ahowmany(Standard_Integer)=1

Returns:
	None

Erases <ahowmany> characters from position <where>,<where> included.") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "Args:
	what(TCollection_ExtendedString)

Returns:
	Standard_Integer

Searches a ExtendedString in <self> from the beginning  
and returns position of first item <what> matching.  
it returns -1 if not found.") Search;
		Standard_Integer Search (const TCollection_ExtendedString & what);
		%feature("autodoc", "Args:
	what(TCollection_ExtendedString)

Returns:
	Standard_Integer

Searches a ExtendedString in another ExtendedString from the  
end and returns position of first item <what> matching.  
it returns -1 if not found.") SearchFromEnd;
		Standard_Integer SearchFromEnd (const TCollection_ExtendedString & what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_ExtCharacter)

Returns:
	None

Replaces one character in the ExtendedString at position <where>.  
If <where> is less than zero or greater than the length of <self>  
an exception is raised.") SetValue;
		void SetValue (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(TCollection_ExtendedString)

Returns:
	None

Replaces a part of <self> by another ExtendedString see above.") SetValue;
		void SetValue (const Standard_Integer where,const TCollection_ExtendedString & what);
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	TCollection_ExtendedString

Splits this extended string into two sub-strings at position where.  
-   The second sub-string (from position  
  where + 1 of this string to the end) is  
  returned in a new extended string.  
-   this extended string is modified: its last  
  characters are removed, it becomes equal to  
  the first sub-string (from the first character to position where).  
Example:  
  aString contains 'abcdefg'  
  aString.Split(3) gives <self> = 'abc' and returns 'defg'") Split;
		TCollection_ExtendedString Split (const Standard_Integer where);
		%feature("autodoc", "Args:
	separators(Standard_ExtString)
	whichone(Standard_Integer)=1

Returns:
	TCollection_ExtendedString

Extracts <whichone> token from <self>.  
By default, the <separators> is set to space and tabulation.  
By default, the token extracted is the first one (whichone = 1).  
<separators> contains all separators you need.  
If no token indexed by <whichone> is found, it returns an empty AsciiString.  
Example:  
   aString contains 'This is a     message'  
   aString.Token()  returns 'This'  
   aString.Token(' ',4) returns 'message'  
   aString.Token(' ',2) returns 'is'  
   aString.Token(' ',9) returns ''  
Other separators than space character and tabulation are allowed :  
   aString contains '1234; test:message   , value'  
   aString.Token('; :,',4) returns 'value'  
   aString.Token('; :,',2) returns 'test'") Token;
		TCollection_ExtendedString Token (const Standard_ExtString separators,const Standard_Integer whichone = 1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ExtString

Returns pointer to ExtString") ToExtString;
		Standard_ExtString ToExtString ();
		%feature("autodoc", "Args:
	ahowmany(Standard_Integer)

Returns:
	None

Truncates <self> to <ahowmany> characters.  
Example:  me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'  
  Exceptions  
Standard_OutOfRange if ahowmany is greater  
than the length of this string.") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	Standard_ExtCharacter

Returns character at position <where> in <self>.  
If <where> is less than zero or greater than the lenght of  
<self>, an exception is raised.  
Example:  
  aString contains 'Hello'  
  aString.Value(2) returns 'e'  
Exceptions  
Standard_OutOfRange if where lies outside  
the bounds of this extended string.") Value;
		Standard_ExtCharacter Value (const Standard_Integer where);
		%feature("autodoc", "Args:
	astring(TCollection_ExtendedString)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

Returns a hashed value for the extended string  
astring within the range 1..Upper.  
Note: if astring is ASCII, the computed value is  
the same as the value computed with the HashCode function on a  
TCollection_AsciiString string composed with equivalent ASCII characters") HashCode;
		static Standard_Integer HashCode (const TCollection_ExtendedString & astring,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	string1(TCollection_ExtendedString)
	string2(TCollection_ExtendedString)

Returns:
	static Standard_Boolean

Returns true if the characters in this extended  
string are identical to the characters in the other extended string.  
Note that this method is an alias of operator ==.") IsEqual;
		static Standard_Boolean IsEqual (const TCollection_ExtendedString & string1,const TCollection_ExtendedString & string2);
		%feature("autodoc", "Args:
	theCString(Standard_PCharacter)

Returns:
	Standard_Integer

Converts the internal <mystring> to UTF8 coding and  
         returns length of the out CString. A memory for the  
         <theCString> should be allocated before call!") ToUTF8CString;
		Standard_Integer ToUTF8CString (Standard_PCharacter & theCString);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns expected CString length in UTF8 coding.  
         It can be used for  memory  calculation  before converting  
         to CString containing symbols in UTF8 coding.") LengthOfCString;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes a HAsciiString to an empty AsciiString.") TCollection_HAsciiString;
		 TCollection_HAsciiString ();
		%feature("autodoc", "Args:
	message(char *)

Returns:
	None

Initializes a HAsciiString with a CString.") TCollection_HAsciiString;
		 TCollection_HAsciiString (const char * message);
		%feature("autodoc", "Args:
	aChar(Standard_Character)

Returns:
	None

Initializes a HAsciiString with a single character.") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Character aChar);
		%feature("autodoc", "Args:
	length(Standard_Integer)
	filler(Standard_Character)

Returns:
	None

Initializes a HAsciiString with <length> space allocated.  
and filled with <filler>.This is useful for buffers.") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Integer length,const Standard_Character filler);
		%feature("autodoc", "Args:
	value(Standard_Integer)

Returns:
	None

Initializes a HAsciiString with an integer value") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Integer value);
		%feature("autodoc", "Args:
	value(Standard_Real)

Returns:
	None

Initializes a HAsciiString with a real value") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Standard_Real value);
		%feature("autodoc", "Args:
	aString(TCollection_AsciiString)

Returns:
	None

Initializes a HAsciiString with a HAsciiString.") TCollection_HAsciiString;
		 TCollection_HAsciiString (const TCollection_AsciiString & aString);
		%feature("autodoc", "Args:
	aString(Handle_TCollection_HAsciiString)

Returns:
	None

Initializes a HAsciiString with a HAsciiString.") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Handle_TCollection_HAsciiString & aString);
		%feature("autodoc", "Args:
	aString(Handle_TCollection_HExtendedString)
	replaceNonAscii(Standard_Character)

Returns:
	None

Initializes a HAsciiString with a HAsciiString.  
         If replaceNonAscii is non-null charecter, it will be used  
         in place of any non-ascii character found in the source string.  
         Otherwise, raises OutOfRange exception if at least one character  
         in the source string is not in the 'Ascii range'.") TCollection_HAsciiString;
		 TCollection_HAsciiString (const Handle_TCollection_HExtendedString & aString,const Standard_Character replaceNonAscii);
		%feature("autodoc", "Args:
	other(char *)

Returns:
	None

Appends <other>  to me.") AssignCat;
		void AssignCat (const char * other);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HAsciiString)

Returns:
	None

Appends <other>  to me.  
 Example:  aString = aString + anotherString") AssignCat;
		void AssignCat (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "Args:
	None
Returns:
	None

Converts the first character into its corresponding  
upper-case character and the other characters into lowercase.  
 Example:  
before  
  me = 'hellO '  
after  
  me = 'Hello '") Capitalize;
		void Capitalize ();
		%feature("autodoc", "Args:
	other(char *)

Returns:
	Handle_TCollection_HAsciiString

Creates a new string by concatenation of this  
ASCII string and the other ASCII string.  
 Example:  
   aString = aString + anotherString  
   aString = aString + 'Dummy'  
   aString contains 'I say '  
   aString = aString + 'Hello ' + 'Dolly'  
gives 'I say Hello Dolly'  
 Warning: To catenate more than one CString, you must put a String before.  
So the following example is WRONG !  
     aString = 'Hello ' + 'Dolly'  THIS IS NOT ALLOWED  
This rule is applicable to AssignCat (operator +=) too.") Cat;
		Handle_TCollection_HAsciiString Cat (const char * other);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HAsciiString)

Returns:
	Handle_TCollection_HAsciiString

Creates a new string by concatenation of this  
ASCII string and the other ASCII string.  
 Example:  aString = aString + anotherString") Cat;
		Handle_TCollection_HAsciiString Cat (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Filler(Standard_Character)

Returns:
	None

Modifies this ASCII string so that its length  
becomes equal to Width and the new characters  
are equal to Filler. New characters are added  
both at the beginning and at the end of this string.  
If Width is less than the length of this ASCII string, nothing happens.  
Example  
Handle_TCollection_HAsciiString  
myAlphabet  
   = new  
TCollection_HAsciiString  
('abcdef');  
myAlphabet->Center(9,' ');  
assert ( !strcmp(  
myAlphabet->ToCString(),  
       ' abcdef ') );") Center;
		void Center (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "Args:
	aChar(Standard_Character)
	NewChar(Standard_Character)
	CaseSensitive(Standard_Boolean)=Standard_True

Returns:
	None

Replaces all characters equal to aChar by  
NewChar in this ASCII string. The substitution is  
case sensitive if CaseSensitive is true (default value).  
If you do not use the default case sensitive  
option, it does not matter whether aChar is upper-case or not.  
Example  
Handle_TCollection_HAsciiString  
myMistake = new  
TCollection_HAsciiString  
('Hather');  
myMistake->ChangeAll('H','F');  
assert ( !strcmp(  
myMistake->ToCString(),  
'Father') );") ChangeAll;
		void ChangeAll (const Standard_Character aChar,const Standard_Character NewChar,const Standard_Boolean CaseSensitive = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all characters contained in <self>.  
This produces an empty HAsciiString.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Set(Handle_TCollection_HAsciiString)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of the first character of <self> that is  
present in <Set>.  
The search begins to the index FromIndex and ends to the  
the index ToIndex.  
Returns zero if failure.  
Raises an exception if FromIndex or ToIndex is out of range  
 Example:  
before  
  me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7  
after  
  me = 'aabAcAa'  
returns  
  1") FirstLocationInSet;
		Standard_Integer FirstLocationInSet (const Handle_TCollection_HAsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	Set(Handle_TCollection_HAsciiString)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of the first character of <self>  
that is not present in the set <Set>.  
The search begins to the index FromIndex and ends to the  
the index ToIndex in <self>.  
Returns zero if failure.  
Raises an exception if FromIndex or ToIndex is out of range.  
 Example:  
before  
  me = 'aabAcAa', S = 'Aa', FromIndex = 1, Toindex = 7  
after  
  me = 'aabAcAa'  
returns  
  3") FirstLocationNotInSet;
		Standard_Integer FirstLocationNotInSet (const Handle_TCollection_HAsciiString & Set,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_Character)

Returns:
	None

Insert a Character at position <where>.  
 Example:  
   aString contains 'hy not ?'  
   aString.Insert(1,'W'); gives 'Why not ?'  
   aString contains 'Wh'  
   aString.Insert(3,'y'); gives 'Why'  
   aString contains 'Way'  
   aString.Insert(2,'h'); gives 'Why'") Insert;
		void Insert (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(char *)

Returns:
	None

Insert a HAsciiString at position <where>.") Insert;
		void Insert (const Standard_Integer where,const char * what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Handle_TCollection_HAsciiString)

Returns:
	None

Insert a HAsciiString at position <where>.") Insert;
		void Insert (const Standard_Integer where,const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	other(Handle_TCollection_HAsciiString)

Returns:
	None

Inserts the other ASCII string a after a specific index in the string <self>  
 Example:  
before  
  me = 'cde' , Index = 0 , other = 'ab'  
after  
  me = 'abcde' , other = 'ab'") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	other(Handle_TCollection_HAsciiString)

Returns:
	None

Inserts the other ASCII string a before a specific index in the string <self>  
Raises an exception if Index is out of bounds  
 Example:  
before  
  me = 'cde' , Index = 1 , other = 'ab'  
after  
  me = 'abcde' , other = 'ab'") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the string <self> contains zero character") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	other(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is 'ASCII' less than <other>.") IsLess;
		Standard_Boolean IsLess (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is 'ASCII' greater than <other>.") IsGreater;
		Standard_Boolean IsGreater (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Converts a HAsciiString containing a numeric expression to  
an Integer.  
 Example: '215' returns 215.") IntegerValue;
		Standard_Integer IntegerValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the string contains an integer value.") IsIntegerValue;
		Standard_Boolean IsIntegerValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the string contains a real value.") IsRealValue;
		Standard_Boolean IsRealValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the string contains only ASCII characters  
between ' ' and '~'.  
This means no control character and no extended ASCII code.") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "Args:
	S(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Returns True if the string S not contains same characters than  
the string <self>.") IsDifferent;
		Standard_Boolean IsDifferent (const Handle_TCollection_HAsciiString & S);
		%feature("autodoc", "Args:
	S(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Returns True if the string S contains same characters than the  
string <self>.") IsSameString;
		Standard_Boolean IsSameString (const Handle_TCollection_HAsciiString & S);
		%feature("autodoc", "Args:
	S(Handle_TCollection_HAsciiString)
	CaseSensitive(Standard_Boolean)

Returns:
	Standard_Boolean

Returns True if the string S contains same characters than the  
string <self>.") IsSameString;
		Standard_Boolean IsSameString (const Handle_TCollection_HAsciiString & S,const Standard_Boolean CaseSensitive);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all space characters in the begining of the string") LeftAdjust;
		void LeftAdjust ();
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Filler(Standard_Character)

Returns:
	None

Left justify.  
Length becomes equal to Width and the new characters are  
equal to Filler  
if Width < Length nothing happens  
Raises an exception if Width is less than zero  
 Example:  
before  
  me = 'abcdef' , Width = 9 , Filler = ' '  
after  
  me = 'abcdef   '") LeftJustify;
		void LeftJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of characters in <self>.  
This is the same functionality as 'strlen' in C.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	other(Handle_TCollection_HAsciiString)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

returns an index in the string <self> of the first occurence  
of the string S in the string <self> from the starting index  
FromIndex to the ending index ToIndex  
returns zero if failure  
Raises an exception if FromIndex or ToIndex is out of range.  
 Example:  
before  
  me = 'aabAaAa', S = 'Aa', FromIndex = 1, ToIndex = 7  
after  
  me = 'aabAaAa'  
returns  
  4") Location;
		Standard_Integer Location (const Handle_TCollection_HAsciiString & other,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	C(Standard_Character)
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of the nth occurence of the character C  
in the string <self> from the starting index FromIndex to the  
ending index ToIndex.  
Returns zero if failure.  
Raises an exception if FromIndex or ToIndex is out of range  
 Example:  
before  
  me = 'aabAa', N = 3, C = 'a', FromIndex = 1, ToIndex = 5  
after  
  me = 'aabAa'  
returns 5") Location;
		Standard_Integer Location (const Standard_Integer N,const Standard_Character C,const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

Converts <self> to its lower-case equivalent.") LowerCase;
		void LowerCase ();
		%feature("autodoc", "Args:
	other(Handle_TCollection_HAsciiString)

Returns:
	None

Inserts the other string at the begining of the string <self>  
 Example:  
before  
  me = 'cde' , S = 'ab'  
after  
  me = 'abcde' , S = 'ab'") Prepend;
		void Prepend (const Handle_TCollection_HAsciiString & other);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Prints this string on the stream <astream>.") Print;
		void Print (Standard_OStream & astream);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Converts a string containing a numeric expression to a Real.  
 Example:  
 '215' returns 215.0.  
 '3.14159267' returns 3.14159267.") RealValue;
		Standard_Real RealValue ();
		%feature("autodoc", "Args:
	C(Standard_Character)
	CaseSensitive(Standard_Boolean)

Returns:
	None

Remove all the occurences of the character C in the string  
 Example:  
before  
  me = 'HellLLo', C = 'L' , CaseSensitive = True  
after  
  me = 'Hello'") RemoveAll;
		void RemoveAll (const Standard_Character C,const Standard_Boolean CaseSensitive);
		%feature("autodoc", "Args:
	what(Standard_Character)

Returns:
	None

Removes every <what> characters from <self>") RemoveAll;
		void RemoveAll (const Standard_Character what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	ahowmany(Standard_Integer)=1

Returns:
	None

Erases <ahowmany> characters from position <where>,  
<where> included.  
 Example:  
   aString contains 'Hello'  
   aString.Erase(2,2) erases 2 characters from position 1  
This gives 'Hlo'.") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all space characters at the end of the string.") RightAdjust;
		void RightAdjust ();
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Filler(Standard_Character)

Returns:
	None

Right justify.  
Length becomes equal to Width and the new characters are  
equal to Filler  
if Width < Length nothing happens  
Raises an exception if Width is less than zero  
 Example:  
before  
  me = 'abcdef' , Width = 9 , Filler = ' '  
after  
  me = '   abcdef'") RightJustify;
		void RightJustify (const Standard_Integer Width,const Standard_Character Filler);
		%feature("autodoc", "Args:
	what(char *)

Returns:
	Standard_Integer

Searches a CString in <self> from the beginning  
and returns position of first item <what> matching.  
It returns -1 if not found.  
 Example:  
  aString contains 'Sample single test'  
  aString.Search('le') returns 5") Search;
		Standard_Integer Search (const char * what);
		%feature("autodoc", "Args:
	what(Handle_TCollection_HAsciiString)

Returns:
	Standard_Integer

Searches a String in <self> from the beginning  
and returns position of first item <what> matching.  
it returns -1 if not found.") Search;
		Standard_Integer Search (const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "Args:
	what(char *)

Returns:
	Standard_Integer

Searches a CString in a String from the end  
and returns position of first item <what> matching.  
It returns -1 if not found.  
 Example:  
aString contains 'Sample single test'  
aString.SearchFromEnd('le') returns 12") SearchFromEnd;
		Standard_Integer SearchFromEnd (const char * what);
		%feature("autodoc", "Args:
	what(Handle_TCollection_HAsciiString)

Returns:
	Standard_Integer

Searches a HAsciiString in another HAsciiString from the end  
and returns position of first item <what> matching.  
It returns -1 if not found.") SearchFromEnd;
		Standard_Integer SearchFromEnd (const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_Character)

Returns:
	None

Replaces one character in the string at position <where>.  
If <where> is less than zero or greater than the length of <self>  
an exception is raised.  
 Example:  
 aString contains 'Garbake'  
 astring.Replace(6,'g')  gives <self> = 'Garbage'") SetValue;
		void SetValue (const Standard_Integer where,const Standard_Character what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(char *)

Returns:
	None

Replaces a part of <self> in the string at position <where>.  
If <where> is less than zero or greater than the length of <self>  
an exception is raised.  
 Example:  
 aString contains 'Garbake'  
 astring.Replace(6,'g')  gives <self> = 'Garbage'") SetValue;
		void SetValue (const Standard_Integer where,const char * what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Handle_TCollection_HAsciiString)

Returns:
	None

Replaces a part of <self> by another string.") SetValue;
		void SetValue (const Standard_Integer where,const Handle_TCollection_HAsciiString & what);
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

Splits a HAsciiString into two sub-strings.  
 Example:  
 aString contains 'abcdefg'  
 aString.Split(3) gives <self> = 'abc' and returns 'defg'") Split;
		Handle_TCollection_HAsciiString Split (const Standard_Integer where);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

Creation of a sub-string of the string <self>.  
The sub-string starts to the index Fromindex and ends  
to the index ToIndex.  
Raises an exception if ToIndex or FromIndex is out of  
bounds  
 Example:  
before  
  me = 'abcdefg', ToIndex=3, FromIndex=6  
after  
  me = 'abcdefg'  
returns  
  'cdef'") SubString;
		Handle_TCollection_HAsciiString SubString (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns pointer to string (char *)  
This is useful for some casual manipulations  
Because this 'char *' is 'const', you can't modify its contents.") ToCString;
		char * ToCString ();
		%feature("autodoc", "Args:
	separators(char *)= \t
	whichone(Standard_Integer)=1

Returns:
	Handle_TCollection_HAsciiString

Extracts <whichone> token from <self>.  
By default, the <separators> is set to space and tabulation.  
By default, the token extracted is the first one (whichone = 1).  
<separators> contains all separators you need.  
If no token indexed by <whichone> is found, it returns an empty String.  
 Example:  
   aString contains 'This is a     message'  
   aString.Token()  returns 'This'  
   aString.Token(' ',4) returns 'message'  
   aString.Token(' ',2) returns 'is'  
   aString.Token(' ',9) returns ''  
Other separators than space character and tabulation are allowed  
   aString contains '1234; test:message   , value'  
   aString.Token('; :,',4) returns 'value'  
   aString.Token('; :,',2) returns 'test'") Token;
		Handle_TCollection_HAsciiString Token (const char * separators = " \t",const Standard_Integer whichone = 1);
		%feature("autodoc", "Args:
	ahowmany(Standard_Integer)

Returns:
	None

Truncates <self> to <ahowmany> characters.  
 Example:  me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "Args:
	None
Returns:
	None

Converts <self> to its upper-case equivalent.") UpperCase;
		void UpperCase ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Length of the string ignoring all spaces (' ') and the  
control character at the end.") UsefullLength;
		Standard_Integer UsefullLength ();
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	Standard_Character

Returns character at position <where> in <self>.  
If <where> is less than zero or greater than the lenght of  
<self>, an exception is raised.  
 Example:  
  aString contains 'Hello'  
  aString.Value(2) returns 'e'") Value;
		Standard_Character Value (const Standard_Integer where);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the field myString.") String;
		const TCollection_AsciiString & String ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") ShallowCopy;
		Handle_TCollection_HAsciiString ShallowCopy ();
		%feature("autodoc", "Args:
	s(Standard_OStream)

Returns:
	None

No detailed docstring for this function.") ShallowDump;
		void ShallowDump (Standard_OStream & s);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSameState;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes a HExtendedString to an empty ExtendedString.") TCollection_HExtendedString;
		 TCollection_HExtendedString ();
		%feature("autodoc", "Args:
	message(char *)

Returns:
	None

Initializes a HExtendedString with a CString.") TCollection_HExtendedString;
		 TCollection_HExtendedString (const char * message);
		%feature("autodoc", "Args:
	message(Standard_ExtString)

Returns:
	None

Initializes a HExtendedString with an ExtString.") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Standard_ExtString message);
		%feature("autodoc", "Args:
	aChar(Standard_ExtCharacter)

Returns:
	None

Initializes a HExtendedString with a single character.") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Standard_ExtCharacter aChar);
		%feature("autodoc", "Args:
	length(Standard_Integer)
	filler(Standard_ExtCharacter)

Returns:
	None

Initializes a HExtendedString with <length> space allocated.  
and filled with <filler>.This is usefull for buffers.") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Standard_Integer length,const Standard_ExtCharacter filler);
		%feature("autodoc", "Args:
	aString(TCollection_ExtendedString)

Returns:
	None

Initializes a HExtendedString with a HExtendedString.") TCollection_HExtendedString;
		 TCollection_HExtendedString (const TCollection_ExtendedString & aString);
		%feature("autodoc", "Args:
	aString(Handle_TCollection_HAsciiString)

Returns:
	None

Initializes a HExtendedString with an HAsciiString.") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Handle_TCollection_HAsciiString & aString);
		%feature("autodoc", "Args:
	aString(Handle_TCollection_HExtendedString)

Returns:
	None

Initializes a HExtendedString with a HExtendedString.") TCollection_HExtendedString;
		 TCollection_HExtendedString (const Handle_TCollection_HExtendedString & aString);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HExtendedString)

Returns:
	None

Appends <other>  to me.") AssignCat;
		void AssignCat (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HExtendedString)

Returns:
	Handle_TCollection_HExtendedString

Returns a string appending <other>  to me.") Cat;
		Handle_TCollection_HExtendedString Cat (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "Args:
	aChar(Standard_ExtCharacter)
	NewChar(Standard_ExtCharacter)

Returns:
	None

Substitutes all the characters equal to aChar by NewChar  
in the string <self>.") ChangeAll;
		void ChangeAll (const Standard_ExtCharacter aChar,const Standard_ExtCharacter NewChar);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all characters contained in <self>.  
This produces an empty ExtendedString.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the string <self> contains zero character") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_ExtCharacter)

Returns:
	None

Insert a ExtCharacter at position <where>.  
Example:  
   aString contains 'hy not ?'  
   aString.Insert(1,'W'); gives 'Why not ?'  
   aString contains 'Wh'  
   aString.Insert(3,'y'); gives 'Why'  
   aString contains 'Way'  
   aString.Insert(2,'h'); gives 'Why'") Insert;
		void Insert (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Handle_TCollection_HExtendedString)

Returns:
	None

Insert a HExtendedString at position <where>.") Insert;
		void Insert (const Standard_Integer where,const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HExtendedString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is less than <other>.") IsLess;
		Standard_Boolean IsLess (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HExtendedString)

Returns:
	Standard_Boolean

Returns TRUE if <self> is greater than <other>.") IsGreater;
		Standard_Boolean IsGreater (const Handle_TCollection_HExtendedString & other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the string contains only 'Ascii Range'  characters") IsAscii;
		Standard_Boolean IsAscii ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of characters in <self>.  
This is the same functionality as 'strlen' in C.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	where(Standard_Integer)
	ahowmany(Standard_Integer)=1

Returns:
	None

Erases <ahowmany> characters from position <where>,  
<where> included.  
Example:  
  aString contains 'Hello'  
  aString.Erase(2,2) erases 2 characters from position 1  
  This gives 'Hlo'.") Remove;
		void Remove (const Standard_Integer where,const Standard_Integer ahowmany = 1);
		%feature("autodoc", "Args:
	what(Standard_ExtCharacter)

Returns:
	None

Removes every <what> characters from <self>.") RemoveAll;
		void RemoveAll (const Standard_ExtCharacter what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Standard_ExtCharacter)

Returns:
	None

Replaces one character in the string at position <where>.  
If <where> is less than zero or greater than the length of <self>  
an exception is raised.  
Example:  
  aString contains 'Garbake'  
  astring.Replace(6,'g')  gives <self> = 'Garbage'") SetValue;
		void SetValue (const Standard_Integer where,const Standard_ExtCharacter what);
		%feature("autodoc", "Args:
	where(Standard_Integer)
	what(Handle_TCollection_HExtendedString)

Returns:
	None

Replaces a part of <self> by another string.") SetValue;
		void SetValue (const Standard_Integer where,const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	Handle_TCollection_HExtendedString

Splits a ExtendedString into two sub-strings.  
Example:  
  aString contains 'abcdefg'  
  aString.Split(3) gives <self> = 'abc' and returns 'defg'") Split;
		Handle_TCollection_HExtendedString Split (const Standard_Integer where);
		%feature("autodoc", "Args:
	what(Handle_TCollection_HExtendedString)

Returns:
	Standard_Integer

Searches a String in <self> from the beginning  
and returns position of first item <what> matching.  
It returns -1 if not found.") Search;
		Standard_Integer Search (const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "Args:
	what(Handle_TCollection_HExtendedString)

Returns:
	Standard_Integer

Searches a ExtendedString in another ExtendedString from the end  
and returns position of first item <what> matching.  
It returns -1 if not found.") SearchFromEnd;
		Standard_Integer SearchFromEnd (const Handle_TCollection_HExtendedString & what);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ExtString

Returns pointer to ExtString") ToExtString;
		Standard_ExtString ToExtString ();
		%feature("autodoc", "Args:
	separators(Standard_ExtString)
	whichone(Standard_Integer)=1

Returns:
	Handle_TCollection_HExtendedString

Extracts <whichone> token from <self>.  
By default, the <separators> is set to space and tabulation.  
By default, the token extracted is the first one (whichone = 1).  
<separators> contains all separators you need.  
If no token indexed by <whichone> is found, it returns an empty String.  
Example:  
   aString contains 'This is a     message'  
   aString.Token()  returns 'This'  
   aString.Token(' ',4) returns 'message'  
   aString.Token(' ',2) returns 'is'  
   aString.Token(' ',9) returns ''  
Other separators than space character and tabulation are allowed  
   aString contains '1234; test:message   , value'  
   aString.Token('; :,',4) returns 'value'  
   aString.Token('; :,',2) returns 'test'") Token;
		Handle_TCollection_HExtendedString Token (const Standard_ExtString separators,const Standard_Integer whichone = 1);
		%feature("autodoc", "Args:
	ahowmany(Standard_Integer)

Returns:
	None

Truncates <self> to <ahowmany> characters.  
Example:  me = 'Hello Dolly' -> Trunc(3) -> me = 'Hel'") Trunc;
		void Trunc (const Standard_Integer ahowmany);
		%feature("autodoc", "Args:
	where(Standard_Integer)

Returns:
	Standard_ExtCharacter

Returns ExtCharacter at position <where> in <self>.  
If <where> is less than zero or greater than the length of  
<self>, an exception is raised.  
Example:  
  aString contains 'Hello'  
  aString.Value(2) returns 'e'") Value;
		Standard_ExtCharacter Value (const Standard_Integer where);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

Returns the field myString") String;
		const TCollection_ExtendedString & String ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Displays <self> .") Print;
		void Print (Standard_OStream & astream);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") ShallowCopy;
		Handle_TCollection_HExtendedString ShallowCopy ();
		%feature("autodoc", "Args:
	s(Standard_OStream)

Returns:
	None

No detailed docstring for this function.") ShallowDump;
		void ShallowDump (Standard_OStream & s);
		%feature("autodoc", "Args:
	other(Handle_TCollection_HExtendedString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSameState;
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
		%feature("autodoc", "Args:
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TCollection_MapNode;
		 TCollection_MapNode (const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next;
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

%nodefaultctor TCollection_PrivCompareOfInteger;
class TCollection_PrivCompareOfInteger {
	public:
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsLower;
		virtual Standard_Boolean IsLower (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsGreater;
		virtual Standard_Boolean IsGreater (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsEqual;
		virtual Standard_Boolean IsEqual (Standard_Integer &OutValue,Standard_Integer &OutValue);
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
%nodefaultctor TCollection_PrivCompareOfReal;
class TCollection_PrivCompareOfReal {
	public:
		%feature("autodoc", "Args:
	Left(Standard_Real)
	Right(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsLower;
		virtual Standard_Boolean IsLower (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Left(Standard_Real)
	Right(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsGreater;
		virtual Standard_Boolean IsGreater (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Left(Standard_Real)
	Right(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsEqual;
		virtual Standard_Boolean IsEqual (Standard_Real &OutValue,Standard_Real &OutValue);
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
		%feature("autodoc", "Args:
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TCollection_SeqNode;
		 TCollection_SeqNode (const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_SeqNodePtr

No detailed docstring for this function.") Next;
		TCollection_SeqNodePtr & Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_SeqNodePtr

No detailed docstring for this function.") Previous;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TCollection_CompareOfInteger;
		 TCollection_CompareOfInteger ();
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True if <Left> is lower than <Right>.") IsLower;
		virtual Standard_Boolean IsLower (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True if <Left> is greater than <Right>.") IsGreater;
		virtual Standard_Boolean IsGreater (Standard_Integer &OutValue,Standard_Integer &OutValue);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TCollection_CompareOfReal;
		 TCollection_CompareOfReal ();
		%feature("autodoc", "Args:
	Left(Standard_Real)
	Right(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns True if <Left> is lower than <Right>.") IsLower;
		virtual Standard_Boolean IsLower (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Left(Standard_Real)
	Right(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns True if <Left> is greater than <Right>.") IsGreater;
		virtual Standard_Boolean IsGreater (Standard_Real &OutValue,Standard_Real &OutValue);
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
