/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Interface

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


%include Interface_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef Standard_Boolean ( * Interface_ValueSatisfies ) ( const Handle_TCollection_HAsciiString & val );
typedef NCollection_Vector <Interface_FileParameter> Interface_VectorOfFileParameter;
/* end typedefs declaration */

/* public enums */
enum Interface_CheckStatus {
	Interface_CheckOK = 0,
	Interface_CheckWarning = 1,
	Interface_CheckFail = 2,
	Interface_CheckAny = 3,
	Interface_CheckMessage = 4,
	Interface_CheckNoFail = 5,
};

enum Interface_DataState {
	Interface_StateOK = 0,
	Interface_LoadWarning = 1,
	Interface_LoadFail = 2,
	Interface_DataWarning = 3,
	Interface_DataFail = 4,
	Interface_StateUnloaded = 5,
	Interface_StateUnknown = 6,
};

enum Interface_ParamType {
	Interface_ParamMisc = 0,
	Interface_ParamInteger = 1,
	Interface_ParamReal = 2,
	Interface_ParamIdent = 3,
	Interface_ParamVoid = 4,
	Interface_ParamText = 5,
	Interface_ParamEnum = 6,
	Interface_ParamLogical = 7,
	Interface_ParamSub = 8,
	Interface_ParamHexa = 9,
	Interface_ParamBinary = 10,
};

/* end public enums declaration */

%nodefaultctor Interface_Array1OfFileParameter;
class Interface_Array1OfFileParameter {
	public:
		%feature("compactdefaultargs") Interface_Array1OfFileParameter;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Interface_Array1OfFileParameter;
		 Interface_Array1OfFileParameter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Interface_Array1OfFileParameter;
		%feature("autodoc", "	:param Item:
	:type Item: Interface_FileParameter &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Interface_Array1OfFileParameter;
		 Interface_Array1OfFileParameter (const Interface_FileParameter & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Interface_FileParameter &
	:rtype: None
") Init;
		void Init (const Interface_FileParameter & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_Array1OfFileParameter &
	:rtype: Interface_Array1OfFileParameter
") Assign;
		const Interface_Array1OfFileParameter & Assign (const Interface_Array1OfFileParameter & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_Array1OfFileParameter &
	:rtype: Interface_Array1OfFileParameter
") operator =;
		const Interface_Array1OfFileParameter & operator = (const Interface_Array1OfFileParameter & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Interface_FileParameter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Interface_FileParameter & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Interface_FileParameter
") Value;
		const Interface_FileParameter & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Interface_FileParameter
") ChangeValue;
		Interface_FileParameter & ChangeValue (const Standard_Integer Index);
};


%extend Interface_Array1OfFileParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_Array1OfHAsciiString;
class Interface_Array1OfHAsciiString {
	public:
		%feature("compactdefaultargs") Interface_Array1OfHAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Interface_Array1OfHAsciiString;
		 Interface_Array1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Interface_Array1OfHAsciiString;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_TCollection_HAsciiString &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Interface_Array1OfHAsciiString;
		 Interface_Array1OfHAsciiString (const Handle_TCollection_HAsciiString & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_Array1OfHAsciiString &
	:rtype: Interface_Array1OfHAsciiString
") Assign;
		const Interface_Array1OfHAsciiString & Assign (const Interface_Array1OfHAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_Array1OfHAsciiString &
	:rtype: Interface_Array1OfHAsciiString
") operator =;
		const Interface_Array1OfHAsciiString & operator = (const Interface_Array1OfHAsciiString & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_TCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HAsciiString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HAsciiString
") Value;
		Handle_TCollection_HAsciiString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HAsciiString
") ChangeValue;
		Handle_TCollection_HAsciiString ChangeValue (const Standard_Integer Index);
};


%extend Interface_Array1OfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_BitMap;
class Interface_BitMap {
	public:
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "	* Creates a empty BitMap

	:rtype: None
") Interface_BitMap;
		 Interface_BitMap ();
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "	* Creates a BitMap for <nbitems> items One flag is defined, n0 0 <resflags> prepares allocation for <resflags> more flags Flags values start at false

	:param nbitems:
	:type nbitems: int
	:param resflags: default value is 0
	:type resflags: int
	:rtype: None
") Interface_BitMap;
		 Interface_BitMap (const Standard_Integer nbitems,const Standard_Integer resflags = 0);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize empty bit by <nbitems> items One flag is defined, n0 0 <resflags> prepares allocation for <resflags> more flags Flags values start at false

	:param nbitems:
	:type nbitems: int
	:param resflags: default value is 0
	:type resflags: int
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer nbitems,const Standard_Integer resflags = 0);
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "	* Creates a BitMap from another one if <copied> is True, copies data else, data are not copied, only the header object is

	:param other:
	:type other: Interface_BitMap &
	:param copied: default value is Standard_False
	:type copied: bool
	:rtype: None
") Interface_BitMap;
		 Interface_BitMap (const Interface_BitMap & other,const Standard_Boolean copied = Standard_False);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize a BitMap from another one

	:param other:
	:type other: Interface_BitMap &
	:param copied: default value is Standard_False
	:type copied: bool
	:rtype: None
") Initialize;
		void Initialize (const Interface_BitMap & other,const Standard_Boolean copied = Standard_False);
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "	* Returns internal values, used for copying Flags values start at false

	:param nbitems:
	:type nbitems: int &
	:param nbwords:
	:type nbwords: int &
	:param nbflags:
	:type nbflags: int &
	:param flags:
	:type flags: Handle_TColStd_HArray1OfInteger &
	:param names:
	:type names: Handle_TColStd_HSequenceOfAsciiString &
	:rtype: None
") Internals;
		void Internals (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Handle_TColStd_HArray1OfInteger & flags,Handle_TColStd_HSequenceOfAsciiString & names);
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "	* Reservates for a count of more flags

	:param moreflags:
	:type moreflags: int
	:rtype: None
") Reservate;
		void Reservate (const Standard_Integer moreflags);
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	* Sets for a new count of items, which can be either less or greater than the former one For new items, their flags start at false

	:param nbitems:
	:type nbitems: int
	:rtype: None
") SetLength;
		void SetLength (const Standard_Integer nbitems);
		%feature("compactdefaultargs") AddFlag;
		%feature("autodoc", "	* Adds a flag, a name can be attached to it Returns its flag number Makes required reservation

	:param name: default value is ""
	:type name: char *
	:rtype: int
") AddFlag;
		Standard_Integer AddFlag (const char * name = "");
		%feature("compactdefaultargs") AddSomeFlags;
		%feature("autodoc", "	* Adds several flags (<more>) with no name Returns the number of last added flag

	:param more:
	:type more: int
	:rtype: int
") AddSomeFlags;
		Standard_Integer AddSomeFlags (const Standard_Integer more);
		%feature("compactdefaultargs") RemoveFlag;
		%feature("autodoc", "	* Removes a flag given its number. Returns True if done, false if num is out of range

	:param num:
	:type num: int
	:rtype: bool
") RemoveFlag;
		Standard_Boolean RemoveFlag (const Standard_Integer num);
		%feature("compactdefaultargs") SetFlagName;
		%feature("autodoc", "	* Sets a name for a flag, given its number name can be empty (to erase the name of a flag) Returns True if done, false if : num is out of range, or name non-empty already set to another flag

	:param num:
	:type num: int
	:param name:
	:type name: char *
	:rtype: bool
") SetFlagName;
		Standard_Boolean SetFlagName (const Standard_Integer num,const char * name);
		%feature("compactdefaultargs") NbFlags;
		%feature("autodoc", "	* Returns the count of flags (flag 0 not included)

	:rtype: int
") NbFlags;
		Standard_Integer NbFlags ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the count of items (i.e. the length of the bitmap)

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "	* Returns the name recorded for a flag, or an empty string

	:param num:
	:type num: int
	:rtype: char *
") FlagName;
		const char * FlagName (const Standard_Integer num);
		%feature("compactdefaultargs") FlagNumber;
		%feature("autodoc", "	* Returns the number or a flag given its name, or zero

	:param name:
	:type name: char *
	:rtype: int
") FlagNumber;
		Standard_Integer FlagNumber (const char * name);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value (true/false) of a flag, from : - the number of the item - the flag number, by default 0

	:param item:
	:type item: int
	:param flag: default value is 0
	:type flag: int
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets a new value for a flag

	:param item:
	:type item: int
	:param val:
	:type val: bool
	:param flag: default value is 0
	:type flag: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer item,const Standard_Boolean val,const Standard_Integer flag = 0);
		%feature("compactdefaultargs") SetTrue;
		%feature("autodoc", "	* Sets a flag to True

	:param item:
	:type item: int
	:param flag: default value is 0
	:type flag: int
	:rtype: None
") SetTrue;
		void SetTrue (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("compactdefaultargs") SetFalse;
		%feature("autodoc", "	* Sets a flag to False

	:param item:
	:type item: int
	:param flag: default value is 0
	:type flag: int
	:rtype: None
") SetFalse;
		void SetFalse (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("compactdefaultargs") CTrue;
		%feature("autodoc", "	* Returns the former value for a flag and sets it to True (before : value returned; after : True)

	:param item:
	:type item: int
	:param flag: default value is 0
	:type flag: int
	:rtype: bool
") CTrue;
		Standard_Boolean CTrue (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("compactdefaultargs") CFalse;
		%feature("autodoc", "	* Returns the former value for a flag and sets it to False (before : value returned; after : False)

	:param item:
	:type item: int
	:param flag: default value is 0
	:type flag: int
	:rtype: bool
") CFalse;
		Standard_Boolean CFalse (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialises all the values of Flag Number <flag> to a given value <val>

	:param val:
	:type val: bool
	:param flag: default value is 0
	:type flag: int
	:rtype: None
") Init;
		void Init (const Standard_Boolean val,const Standard_Integer flag = 0);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear all field of bit map

	:rtype: None
") Clear;
		void Clear ();
};


%extend Interface_BitMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_Category;
class Interface_Category {
	public:
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "	* Creates a Category, with no protocol yet

	:rtype: None
") Interface_Category;
		 Interface_Category ();
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "	* Creates a Category with a given protocol

	:param proto:
	:type proto: Handle_Interface_Protocol &
	:rtype: None
") Interface_Category;
		 Interface_Category (const Handle_Interface_Protocol & proto);
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "	* Creates a Category with a given GTool

	:param gtool:
	:type gtool: Handle_Interface_GTool &
	:rtype: None
") Interface_Category;
		 Interface_Category (const Handle_Interface_GTool & gtool);
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "	* Sets/Changes Protocol

	:param proto:
	:type proto: Handle_Interface_Protocol &
	:rtype: None
") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto);
		%feature("compactdefaultargs") CatNum;
		%feature("autodoc", "	* Determines the Category Number for an entity in its context, by using general service CategoryNumber

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shares:
	:type shares: Interface_ShareTool &
	:rtype: int
") CatNum;
		Standard_Integer CatNum (const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
		%feature("compactdefaultargs") ClearNums;
		%feature("autodoc", "	* Clears the recorded list of category numbers for a Model

	:rtype: None
") ClearNums;
		void ClearNums ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the Category Number for each entity and records it, in an array (ent.number -> category number) Hence, it can be queried by the method Num. The Model itself is not recorded, this method is intended to be used in a wider context (which detains also a Graph, etc)

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param shares:
	:type shares: Interface_ShareTool &
	:rtype: None
") Compute;
		void Compute (const Handle_Interface_InterfaceModel & model,const Interface_ShareTool & shares);
		%feature("compactdefaultargs") Num;
		%feature("autodoc", "	* Returns the category number recorded for an entity number Returns 0 if out of range

	:param nument:
	:type nument: int
	:rtype: int
") Num;
		Standard_Integer Num (const Standard_Integer nument);
		%feature("compactdefaultargs") AddCategory;
		%feature("autodoc", "	* Records a new Category defined by its names, produces a number New if not yet recorded

	:param name:
	:type name: char *
	:rtype: int
") AddCategory;
		static Standard_Integer AddCategory (const char * name);
		%feature("compactdefaultargs") NbCategories;
		%feature("autodoc", "	* Returns the count of recorded categories

	:rtype: int
") NbCategories;
		static Standard_Integer NbCategories ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of a category, according to its number

	:param num:
	:type num: int
	:rtype: char *
") Name;
		static const char * Name (const Standard_Integer num);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* Returns the number of a category, according to its name

	:param name:
	:type name: char *
	:rtype: int
") Number;
		static Standard_Integer Number (const char * name);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Default initialisation (protected against several calls : passes only once)

	:rtype: void
") Init;
		static void Init ();
};


%extend Interface_Category {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_Check;
class Interface_Check : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_Check;
		%feature("autodoc", "	* Allows definition of a Sequence. Used also for Global Check of an InterfaceModel (which stores global messages for file)

	:rtype: None
") Interface_Check;
		 Interface_Check ();
		%feature("compactdefaultargs") Interface_Check;
		%feature("autodoc", "	* Defines a Check on an Entity

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: None
") Interface_Check;
		 Interface_Check (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "	* New name for AddFail (Msg)

	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendFail;
		void SendFail (const Message_Msg & amsg);
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	* Records a new Fail message

	:param amess:
	:type amess: Handle_TCollection_HAsciiString &
	:rtype: None
") AddFail;
		void AddFail (const Handle_TCollection_HAsciiString & amess);
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	* Records a new Fail message under two forms : final,original

	:param amess:
	:type amess: Handle_TCollection_HAsciiString &
	:param orig:
	:type orig: Handle_TCollection_HAsciiString &
	:rtype: None
") AddFail;
		void AddFail (const Handle_TCollection_HAsciiString & amess,const Handle_TCollection_HAsciiString & orig);
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	* Records a new Fail message given as 'error text' directly If <orig> is given, a distinct original form is recorded else (D), the original form equates <amess>

	:param amess:
	:type amess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddFail;
		void AddFail (const char * amess,const char * orig = "");
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	* Records a new Fail from the definition of a Msg (Original+Value)

	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") AddFail;
		void AddFail (const Message_Msg & amsg);
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "	* Returns True if Check brings at least one Fail Message

	:rtype: bool
") HasFailed;
		Standard_Boolean HasFailed ();
		%feature("compactdefaultargs") NbFails;
		%feature("autodoc", "	* Returns count of recorded Fails

	:rtype: int
") NbFails;
		Standard_Integer NbFails ();
		%feature("compactdefaultargs") Fail;
		%feature("autodoc", "	* Returns Fail Message as a String Final form by default, Original form if <final> is False

	:param num:
	:type num: int
	:param final: default value is Standard_True
	:type final: bool
	:rtype: Handle_TCollection_HAsciiString
") Fail;
		Handle_TCollection_HAsciiString Fail (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") CFail;
		%feature("autodoc", "	* Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False

	:param num:
	:type num: int
	:param final: default value is Standard_True
	:type final: bool
	:rtype: char *
") CFail;
		const char * CFail (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") Fails;
		%feature("autodoc", "	* Returns the list of Fails, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty

	:param final: default value is Standard_True
	:type final: bool
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") Fails;
		Handle_TColStd_HSequenceOfHAsciiString Fails (const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "	* New name for AddWarning

	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendWarning;
		void SendWarning (const Message_Msg & amsg);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Records a new Warning message

	:param amess:
	:type amess: Handle_TCollection_HAsciiString &
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_TCollection_HAsciiString & amess);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Records a new Warning message under two forms : final,original

	:param amess:
	:type amess: Handle_TCollection_HAsciiString &
	:param orig:
	:type orig: Handle_TCollection_HAsciiString &
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_TCollection_HAsciiString & amess,const Handle_TCollection_HAsciiString & orig);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Records a Warning message given as 'warning message' directly If <orig> is given, a distinct original form is recorded else (D), the original form equates <amess>

	:param amess:
	:type amess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddWarning;
		void AddWarning (const char * amess,const char * orig = "");
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Records a new Warning from the definition of a Msg (Original+Value)

	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") AddWarning;
		void AddWarning (const Message_Msg & amsg);
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "	* Returns True if Check brings at least one Warning Message

	:rtype: bool
") HasWarnings;
		Standard_Boolean HasWarnings ();
		%feature("compactdefaultargs") NbWarnings;
		%feature("autodoc", "	* Returns count of recorded Warning messages

	:rtype: int
") NbWarnings;
		Standard_Integer NbWarnings ();
		%feature("compactdefaultargs") Warning;
		%feature("autodoc", "	* Returns Warning message as a String Final form by default, Original form if <final> is False

	:param num:
	:type num: int
	:param final: default value is Standard_True
	:type final: bool
	:rtype: Handle_TCollection_HAsciiString
") Warning;
		Handle_TCollection_HAsciiString Warning (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") CWarning;
		%feature("autodoc", "	* Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False

	:param num:
	:type num: int
	:param final: default value is Standard_True
	:type final: bool
	:rtype: char *
") CWarning;
		const char * CWarning (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") Warnings;
		%feature("autodoc", "	* Returns the list of Warnings, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty

	:param final: default value is Standard_True
	:type final: bool
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") Warnings;
		Handle_TColStd_HSequenceOfHAsciiString Warnings (const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "	* Records an information message This does not change the status of the Check

	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendMsg;
		void SendMsg (const Message_Msg & amsg);
		%feature("compactdefaultargs") NbInfoMsgs;
		%feature("autodoc", "	* Returns the count of recorded information messages

	:rtype: int
") NbInfoMsgs;
		Standard_Integer NbInfoMsgs ();
		%feature("compactdefaultargs") InfoMsg;
		%feature("autodoc", "	* Returns information message as a String

	:param num:
	:type num: int
	:param final: default value is Standard_True
	:type final: bool
	:rtype: Handle_TCollection_HAsciiString
") InfoMsg;
		Handle_TCollection_HAsciiString InfoMsg (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") CInfoMsg;
		%feature("autodoc", "	* Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False

	:param num:
	:type num: int
	:param final: default value is Standard_True
	:type final: bool
	:rtype: char *
") CInfoMsg;
		const char * CInfoMsg (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") InfoMsgs;
		%feature("autodoc", "	* Returns the list of Info Msg, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty

	:param final: default value is Standard_True
	:type final: bool
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") InfoMsgs;
		Handle_TColStd_HSequenceOfHAsciiString InfoMsgs (const Standard_Boolean final = Standard_True);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the Check Status : OK, Warning or Fail

	:rtype: Interface_CheckStatus
") Status;
		Interface_CheckStatus Status ();
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "	* Tells if Check Status complies with a given one (i.e. also status for query)

	:param status:
	:type status: Interface_CheckStatus
	:rtype: bool
") Complies;
		Standard_Boolean Complies (const Interface_CheckStatus status);
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "	* Tells if a message is brought by a Check, as follows : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages For <status> : for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (answer will be false)

	:param mess:
	:type mess: Handle_TCollection_HAsciiString &
	:param incl:
	:type incl: int
	:param status:
	:type status: Interface_CheckStatus
	:rtype: bool
") Complies;
		Standard_Boolean Complies (const Handle_TCollection_HAsciiString & mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("compactdefaultargs") HasEntity;
		%feature("autodoc", "	* Returns True if a Check is devoted to an entity; else, it is global (for InterfaceModel's storing of global error messages)

	:rtype: bool
") HasEntity;
		Standard_Boolean HasEntity ();
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "	* Returns the entity on which the Check has been defined

	:rtype: Handle_Standard_Transient
") Entity;
		Handle_Standard_Transient Entity ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears a check, in order to receive informations from transfer (Messages and Entity)

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ClearFails;
		%feature("autodoc", "	* Clears the Fail Messages (for instance to keep only Warnings)

	:rtype: None
") ClearFails;
		void ClearFails ();
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "	* Clears the Warning Messages (for instance to keep only Fails)

	:rtype: None
") ClearWarnings;
		void ClearWarnings ();
		%feature("compactdefaultargs") ClearInfoMsgs;
		%feature("autodoc", "	* Clears the Info Messages

	:rtype: None
") ClearInfoMsgs;
		void ClearInfoMsgs ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the messages which comply with <mess>, as follows : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages For <status> : for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (nothing is done) Returns True if at least one message has been removed, False else

	:param mess:
	:type mess: Handle_TCollection_HAsciiString &
	:param incl:
	:type incl: int
	:param status:
	:type status: Interface_CheckStatus
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_TCollection_HAsciiString & mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "	* Mends messages, according <pref> and <num> According to <num>, works on the whole list of Fails if = 0(D) or only one Fail message, given its rank If <pref> is empty, converts Fail(s) to Warning(s) Else, does the conversion but prefixes the new Warning(s) but <pref> followed by a semi-column Some reserved values of <pref> are : 'FM' : standard prefix 'Mended' (can be translated) 'CF' : clears Fail(s) 'CW' : clears Warning(s) : here, <num> refers to Warning list 'CA' : clears all messages : here, <num> is ignored

	:param pref:
	:type pref: char *
	:param num: default value is 0
	:type num: int
	:rtype: bool
") Mend;
		Standard_Boolean Mend (const char * pref,const Standard_Integer num = 0);
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "	* Receives an entity result of a Transfer

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: None
") SetEntity;
		void SetEntity (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") GetEntity;
		%feature("autodoc", "	* same as SetEntity (old form kept for compatibility) Warning : Does nothing if Entity field is not yet clear

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: None
") GetEntity;
		void GetEntity (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") GetMessages;
		%feature("autodoc", "	* Copies messages stored in another Check, cumulating Does not regard other's Entity. Used to cumulate messages

	:param other:
	:type other: Handle_Interface_Check &
	:rtype: None
") GetMessages;
		void GetMessages (const Handle_Interface_Check & other);
		%feature("compactdefaultargs") GetAsWarning;
		%feature("autodoc", "	* Copies messages converted into Warning messages If failsonly is true, only Fails are taken, and converted else, Warnings are taken too. Does not regard Entity Used to keep Fail messages as Warning, after a recovery

	:param other:
	:type other: Handle_Interface_Check &
	:param failsonly:
	:type failsonly: bool
	:rtype: None
") GetAsWarning;
		void GetAsWarning (const Handle_Interface_Check & other,const Standard_Boolean failsonly);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the messages of the check to an Messenger <level> = 1 : only fails <level> = 2 : fails and warnings <level> = 3 : all (fails, warnings, info msg) <final> : if positive (D) prints final values of messages if negative, prints originals if null, prints both forms

	:param S:
	:type S: Handle_Message_Messenger &
	:param level:
	:type level: int
	:param final: default value is 1
	:type final: int
	:rtype: None
") Print;
		void Print (const Handle_Message_Messenger & S,const Standard_Integer level,const Standard_Integer final = 1);
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "	* Prints the messages of the check to the default trace file By default, according to the default standard level Else, according level (see method Print)

	:param level: default value is -1
	:type level: int
	:param final: default value is 1
	:type final: int
	:rtype: None
") Trace;
		void Trace (const Standard_Integer level = -1,const Standard_Integer final = 1);
};


%extend Interface_Check {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_Check(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_Check::Handle_Interface_Check %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_Check;
class Handle_Interface_Check : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_Check();
        Handle_Interface_Check(const Handle_Interface_Check &aHandle);
        Handle_Interface_Check(const Interface_Check *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_Check DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_Check {
    Interface_Check* _get_reference() {
    return (Interface_Check*)$self->Access();
    }
};

%extend Handle_Interface_Check {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_Check {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_CheckIterator;
class Interface_CheckIterator {
	public:
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "	* Creates an empty CheckIterator

	:rtype: None
") Interface_CheckIterator;
		 Interface_CheckIterator ();
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "	* Creates a CheckIterator with a name (displayed by Print as a title)

	:param name:
	:type name: char *
	:rtype: None
") Interface_CheckIterator;
		 Interface_CheckIterator (const char * name);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets / Changes the name

	:param name:
	:type name: char *
	:rtype: None
") SetName;
		void SetName (const char * name);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the recorded name (can be empty)

	:rtype: char *
") Name;
		const char * Name ();
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Defines a Model, used to locate entities (not required, if it is absent, entities are simply less documented)

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the stored model (can be a null handle)

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the list of checks

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "	* Merges another CheckIterator into <self>, i.e. adds each of its Checks. Content of <other> remains unchanged. Takes also the Model but not the Name

	:param other:
	:type other: Interface_CheckIterator &
	:rtype: None
") Merge;
		void Merge (Interface_CheckIterator & other);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a Check to the list to be iterated This Check is Accompanied by Entity Number in the Model (0 for Global Check or Entity unknown in the Model), if 0 and Model is recorded in <self>, it is computed

	:param ach:
	:type ach: Handle_Interface_Check &
	:param num: default value is 0
	:type num: int
	:rtype: None
") Add;
		void Add (const Handle_Interface_Check & ach,const Standard_Integer num = 0);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns the Check which was attached to an Entity given its Number in the Model. <num>=0 is for the Global Check. If no Check was recorded for this Number, returns an empty Check. Remark : Works apart from the iteration methods (no interference)

	:param num:
	:type num: int
	:rtype: Handle_Interface_Check
") Check;
		Handle_Interface_Check Check (const Standard_Integer num);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns the Check attached to an Entity If no Check was recorded for this Entity, returns an empty Check. Remark : Works apart from the iteration methods (no interference)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_Interface_Check
") Check;
		Handle_Interface_Check Check (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns the Check bound to an Entity Number (0 : Global) in order to be consulted or completed on the spot I.e. returns the Check if is already exists, or adds it then returns the new empty Check

	:param num:
	:type num: int
	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck (const Standard_Integer num);
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns the Check bound to an Entity, in order to be consulted or completed on the spot I.e. returns the Check if is already exists, or adds it then returns the new empty Check

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True if : no Fail has been recorded if <failsonly> is True, no Check at all if <failsonly> is False

	:param failsonly:
	:type failsonly: bool
	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty (const Standard_Boolean failsonly);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns worst status among : OK, Warning, Fail

	:rtype: Interface_CheckStatus
") Status;
		Interface_CheckStatus Status ();
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "	* Tells if this check list complies with a given status : OK (i.e. empty), Warning (at least one Warning, but no Fail), Fail (at least one), Message (not OK), NoFail, Any

	:param status:
	:type status: Interface_CheckStatus
	:rtype: bool
") Complies;
		Standard_Boolean Complies (const Interface_CheckStatus status);
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "	* Returns a CheckIterator which contains the checks which comply with a given status Each check is added completely (no split Warning/Fail)

	:param status:
	:type status: Interface_CheckStatus
	:rtype: Interface_CheckIterator
") Extract;
		Interface_CheckIterator Extract (const Interface_CheckStatus status);
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "	* Returns a CheckIterator which contains the check which comply with a message, plus some conditions as follows : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages For <status> : for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (answer will be false) Each Check which complies is entirely taken

	:param mess:
	:type mess: char *
	:param incl:
	:type incl: int
	:param status:
	:type status: Interface_CheckStatus
	:rtype: Interface_CheckIterator
") Extract;
		Interface_CheckIterator Extract (const char * mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the messages of all Checks, under these conditions : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages For <status> : for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (nothing is done) Returns True if at least one message has been removed, False else

	:param mess:
	:type mess: char *
	:param incl:
	:type incl: int
	:param status:
	:type status: Interface_CheckStatus
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const char * mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("compactdefaultargs") Checkeds;
		%feature("autodoc", "	* Returns the list of entities concerned by a Check Only fails if <failsonly> is True, else all non-empty checks If <global> is true, adds the model for a global check Else, global check is ignored

	:param failsonly:
	:type failsonly: bool
	:param global:
	:type global: bool
	:rtype: Handle_TColStd_HSequenceOfTransient
") Checkeds;
		Handle_TColStd_HSequenceOfTransient Checkeds (const Standard_Boolean failsonly,const Standard_Boolean global);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Starts Iteration. Thus, it is possible to restart it Remark : an iteration may be done with a const Iterator While its content is modified (through a pointer), this allows to give it as a const argument to a function

	:rtype: None
") Start;
		void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there are more Checks to get

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Sets Iteration to next Item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns Check currently Iterated It brings all other informations (status, messages, ...) The Number of the Entity in the Model is given by Number below

	:rtype: Handle_Interface_Check
") Value;
		Handle_Interface_Check Value ();
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* Returns Number of Entity for the Check currently iterated or 0 for GlobalCheck

	:rtype: int
") Number;
		Standard_Integer Number ();
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the list of Checks with their attached Numbers If <failsonly> is True, prints only Fail messages If <failsonly> is False, prints all messages If <final> = 0 (D), prints also original messages if different If <final> < 0, prints only original messages If <final> > 0, prints only final messages It uses the recorded Model if it is defined Remark : Works apart from the iteration methods (no interference)

	:param S:
	:type S: Handle_Message_Messenger &
	:param failsonly:
	:type failsonly: bool
	:param final: default value is 0
	:type final: int
	:rtype: None
") Print;
		void Print (const Handle_Message_Messenger & S,const Standard_Boolean failsonly,const Standard_Integer final = 0);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Works as Print without a model, but for entities which have no attached number (Number not positive), tries to compute this Number from <model> and displays 'original' or 'computed'

	:param S:
	:type S: Handle_Message_Messenger &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param failsonly:
	:type failsonly: bool
	:param final: default value is 0
	:type final: int
	:rtype: None
") Print;
		void Print (const Handle_Message_Messenger & S,const Handle_Interface_InterfaceModel & model,const Standard_Boolean failsonly,const Standard_Integer final = 0);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Clears data of iteration

	:rtype: None
") Destroy;
		void Destroy ();
};


%extend Interface_CheckIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_CheckTool;
class Interface_CheckTool {
	public:
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "	* Creates a CheckTool, by calling the General Service Library and Modules, selected through a Protocol, to work on a Model Moreover, Protocol recognizes Unknown Entities

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") Interface_CheckTool;
		 Interface_CheckTool (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "	* Creates a CheckTool, by calling the General Service Library and Modules, selected through a Protocol, to work on a Model Protocol and so on are taken from the Model (its GTool)

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") Interface_CheckTool;
		 Interface_CheckTool (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "	* Creates a CheckTool from a Graph. The Graph contains a Model which designates a Protocol: they are used to create ShareTool

	:param graph:
	:type graph: Interface_Graph &
	:rtype: None
") Interface_CheckTool;
		 Interface_CheckTool (const Interface_Graph & graph);
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "	:param hgraph:
	:type hgraph: Handle_Interface_HGraph &
	:rtype: None
") Interface_CheckTool;
		 Interface_CheckTool (const Handle_Interface_HGraph & hgraph);
		%feature("compactdefaultargs") FillCheck;
		%feature("autodoc", "	* Fills as required a Check with the Error and Warning messages produced by Checking a given Entity. For an Erroneous or Corrected Entity : Check build at Analyse time; else, Check computed for Entity (Verify integrity), can use a Graph as required to control context

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param sh:
	:type sh: Interface_ShareTool &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: None
") FillCheck;
		void FillCheck (const Handle_Standard_Transient & ent,const Interface_ShareTool & sh,Handle_Interface_Check & ach);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Utility method which Prints the content of a Check

	:param ach:
	:type ach: Handle_Interface_Check &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") Print;
		void Print (const Handle_Interface_Check & ach,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Simply Lists all the Checks and the Content (messages) and the Entity, if there is, of each Check (if all Checks are OK, nothing is Printed)

	:param list:
	:type list: Interface_CheckIterator &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") Print;
		void Print (const Interface_CheckIterator & list,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns the Check associated to an Entity identified by its Number in a Model.

	:param num:
	:type num: int
	:rtype: Handle_Interface_Check
") Check;
		Handle_Interface_Check Check (const Standard_Integer num);
		%feature("compactdefaultargs") CheckSuccess;
		%feature("autodoc", "	* Checks if any Error has been detected (CheckList not empty) Returns normally if none, raises exception if some exists. It reuses the last computations from other checking methods, unless the argument <resest> is given True

	:param reset: default value is Standard_False
	:type reset: bool
	:rtype: None
") CheckSuccess;
		void CheckSuccess (const Standard_Boolean reset = Standard_False);
		%feature("compactdefaultargs") CompleteCheckList;
		%feature("autodoc", "	* Returns list of all 'remarkable' informations, which include : - GlobalCheck, if not empty - Error Checks, for all Errors (Verify + Analyse) - also Corrected Entities - and Unknown Entities : for those, each Unknown Entity is associated to an empty Check (it is neither an Error nor a Correction, but a remarkable information)

	:rtype: Interface_CheckIterator
") CompleteCheckList;
		Interface_CheckIterator CompleteCheckList ();
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	* Returns list of all Errors detected Note that presence of Unknown Entities is not an error Cumulates : GlobalCheck if error + AnalyseCheckList + VerifyCheckList

	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList ();
		%feature("compactdefaultargs") AnalyseCheckList;
		%feature("autodoc", "	* Returns list of errors dectected at Analyse time (syntactic) (note that GlobalCheck is not in this list)

	:rtype: Interface_CheckIterator
") AnalyseCheckList;
		Interface_CheckIterator AnalyseCheckList ();
		%feature("compactdefaultargs") VerifyCheckList;
		%feature("autodoc", "	* Returns list of integrity constraints errors (semantic) (note that GlobalCheck is not in this list)

	:rtype: Interface_CheckIterator
") VerifyCheckList;
		Interface_CheckIterator VerifyCheckList ();
		%feature("compactdefaultargs") WarningCheckList;
		%feature("autodoc", "	* Returns list of Corrections (includes GlobalCheck if corrected)

	:rtype: Interface_CheckIterator
") WarningCheckList;
		Interface_CheckIterator WarningCheckList ();
		%feature("compactdefaultargs") UnknownEntities;
		%feature("autodoc", "	* Returns list of Unknown Entities Note that Error and Erroneous Entities are not considered as Unknown

	:rtype: Interface_EntityIterator
") UnknownEntities;
		Interface_EntityIterator UnknownEntities ();
};


%extend Interface_CheckTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_CopyControl;
class Interface_CopyControl : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears List of Copy Results. Gets Ready to begin another Copy Process.

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Bind a Result to a Starting Entity identified by its Number

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: void
") Bind;
		virtual void Bind (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "	* Searches for the Result bound to a Startingf Entity identified by its Number. If Found, returns True and fills <res> Else, returns False and nullifies <res>

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: bool
") Search;
		virtual Standard_Boolean Search (const Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
};


%extend Interface_CopyControl {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_CopyControl(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_CopyControl::Handle_Interface_CopyControl %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_CopyControl;
class Handle_Interface_CopyControl : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_CopyControl();
        Handle_Interface_CopyControl(const Handle_Interface_CopyControl &aHandle);
        Handle_Interface_CopyControl(const Interface_CopyControl *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_CopyControl DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_CopyControl {
    Interface_CopyControl* _get_reference() {
    return (Interface_CopyControl*)$self->Access();
    }
};

%extend Handle_Interface_CopyControl {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_CopyControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_CopyTool;
class Interface_CopyTool {
	public:
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "	* Creates a CopyTool adapted to work from a Model. Works with a General Service Library, given as an argument

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param lib:
	:type lib: Interface_GeneralLib &
	:rtype: None
") Interface_CopyTool;
		 Interface_CopyTool (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "	* Same as above, but Library is defined through a Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") Interface_CopyTool;
		 Interface_CopyTool (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "	* Same as above, but works with the Active Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Interface_CopyTool;
		 Interface_CopyTool (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model on which the CopyTool works

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") SetControl;
		%feature("autodoc", "	* Changes the Map of Result for another one. This allows to work with a more sophisticated Mapping Control than the Standard one which is CopyMap (e.g. TransferProcess from Transfer)

	:param othermap:
	:type othermap: Handle_Interface_CopyControl &
	:rtype: None
") SetControl;
		void SetControl (const Handle_Interface_CopyControl & othermap);
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "	* Returns the object used for Control

	:rtype: Handle_Interface_CopyControl
") Control;
		Handle_Interface_CopyControl Control ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears Transfer List. Gets Ready to begin another Transfer

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Creates the CounterPart of an Entity (by ShallowCopy), Binds it, then Copies the content of the former Entity to the other one (same Type), by call to the General Service Library It may command the Copy of Referenced Entities Then, its returns True. //! If <mapped> is True, the Map is used to store the Result Else, the Result is simply produced : it can be used to Copy internal sub-parts of Entities, which are not intended to be shared (Strings, Arrays, etc...) If <errstat> is True, this means that the Entity is recorded in the Model as Erroneous : in this case, the General Service for Deep Copy is not called (this could be dangerous) : hence the Counter-Part is produced but empty, it can be referenced. //! This method does nothing and returns False if the Protocol does not recognize <ent>. It basically makes a Deep Copy without changing the Types. It can be redefined for special uses.

	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:param mapped:
	:type mapped: bool
	:param errstat:
	:type errstat: bool
	:rtype: bool
") Copy;
		virtual Standard_Boolean Copy (const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto,const Standard_Boolean mapped,const Standard_Boolean errstat);
		%feature("compactdefaultargs") Transferred;
		%feature("autodoc", "	* Transfers one Entity, if not yet bound to a result Remark : For an Entity which is reported in the Starting Model, the ReportEntity will also be copied with its Content if it has one (at least ShallowCopy; Complete Copy if the Protocol recognizes the Content : see method Copy)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") Transferred;
		Handle_Standard_Transient Transferred (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Defines a Result for the Transfer of a Starting object. Used by method Transferred (which performs a normal Copy), but can also be called to enforce a result : in the latter case, the enforced result must be compatible with the other Transfers which are performed

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") Bind;
		void Bind (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "	* Search for the result of a Starting Object (i.e. an Entity) Returns True if a Result is Bound (and fills 'result') Returns False if no result is Bound

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: bool
") Search;
		Standard_Boolean Search (const Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
		%feature("compactdefaultargs") ClearLastFlags;
		%feature("autodoc", "	* Clears LastFlags only. This allows to know what Entities are copied after its call (see method LastCopiedAfter). It can be used when copies are done by increments, which must be distinghished. ClearLastFlags is also called by Clear.

	:rtype: None
") ClearLastFlags;
		void ClearLastFlags ();
		%feature("compactdefaultargs") LastCopiedAfter;
		%feature("autodoc", "	* Returns an copied Entity and its Result which were operated after last call to ClearLastFlags. It returns the first 'Last Copied Entity' which Number follows <numfrom>, Zero if none. It is used in a loop as follow : Integer num = 0; while ( (num = CopyTool.LastCopiedAfter(num,ent,res)) ) { .. Process Starting <ent> and its Result <res> }

	:param numfrom:
	:type numfrom: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: int
") LastCopiedAfter;
		Standard_Integer LastCopiedAfter (const Standard_Integer numfrom,Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
		%feature("compactdefaultargs") TransferEntity;
		%feature("autodoc", "	* Transfers one Entity and records result into the Transfer List Calls method Transferred

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") TransferEntity;
		void TransferEntity (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") RenewImpliedRefs;
		%feature("autodoc", "	* Renews the Implied References. These References do not involve Copying of referenced Entities. For such a Reference, if the Entity which defines it AND the referenced Entity are both copied, then this Reference is renewed. Else it is deleted in the copied Entities. Remark : this concerns only some specific references, such as 'back pointers'.

	:rtype: None
") RenewImpliedRefs;
		void RenewImpliedRefs ();
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "	* Fills a Model with the result of the transfer (TransferList) Commands copy of Header too, and calls RenewImpliedRefs

	:param bmodel:
	:type bmodel: Handle_Interface_InterfaceModel &
	:rtype: None
") FillModel;
		void FillModel (const Handle_Interface_InterfaceModel & bmodel);
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "	* Returns the complete list of copied Entities If <withreports> is given True, the entities which were reported in the Starting Model are replaced in the list by the copied ReportEntities

	:param withreports: default value is Standard_False
	:type withreports: bool
	:rtype: Interface_EntityIterator
") CompleteResult;
		Interface_EntityIterator CompleteResult (const Standard_Boolean withreports = Standard_False);
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of Root copied Entities (those which were asked for copy by the user of CopyTool, not by copying another Entity)

	:param withreports: default value is Standard_False
	:type withreports: bool
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Standard_Boolean withreports = Standard_False);
};


%extend Interface_CopyTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_DataMapIteratorOfDataMapOfTransientInteger;
class Interface_DataMapIteratorOfDataMapOfTransientInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Interface_DataMapIteratorOfDataMapOfTransientInteger;
		%feature("autodoc", "	:rtype: None
") Interface_DataMapIteratorOfDataMapOfTransientInteger;
		 Interface_DataMapIteratorOfDataMapOfTransientInteger ();
		%feature("compactdefaultargs") Interface_DataMapIteratorOfDataMapOfTransientInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: Interface_DataMapOfTransientInteger &
	:rtype: None
") Interface_DataMapIteratorOfDataMapOfTransientInteger;
		 Interface_DataMapIteratorOfDataMapOfTransientInteger (const Interface_DataMapOfTransientInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Interface_DataMapOfTransientInteger &
	:rtype: None
") Initialize;
		void Initialize (const Interface_DataMapOfTransientInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%extend Interface_DataMapIteratorOfDataMapOfTransientInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_DataMapNodeOfDataMapOfTransientInteger;
class Interface_DataMapNodeOfDataMapOfTransientInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Interface_DataMapNodeOfDataMapOfTransientInteger;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Interface_DataMapNodeOfDataMapOfTransientInteger;
		 Interface_DataMapNodeOfDataMapOfTransientInteger (const Handle_Standard_Transient & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%extend Interface_DataMapNodeOfDataMapOfTransientInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_DataMapNodeOfDataMapOfTransientInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_DataMapNodeOfDataMapOfTransientInteger::Handle_Interface_DataMapNodeOfDataMapOfTransientInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_DataMapNodeOfDataMapOfTransientInteger;
class Handle_Interface_DataMapNodeOfDataMapOfTransientInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Interface_DataMapNodeOfDataMapOfTransientInteger();
        Handle_Interface_DataMapNodeOfDataMapOfTransientInteger(const Handle_Interface_DataMapNodeOfDataMapOfTransientInteger &aHandle);
        Handle_Interface_DataMapNodeOfDataMapOfTransientInteger(const Interface_DataMapNodeOfDataMapOfTransientInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_DataMapNodeOfDataMapOfTransientInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_DataMapNodeOfDataMapOfTransientInteger {
    Interface_DataMapNodeOfDataMapOfTransientInteger* _get_reference() {
    return (Interface_DataMapNodeOfDataMapOfTransientInteger*)$self->Access();
    }
};

%extend Handle_Interface_DataMapNodeOfDataMapOfTransientInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_DataMapNodeOfDataMapOfTransientInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_DataMapOfTransientInteger;
class Interface_DataMapOfTransientInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Interface_DataMapOfTransientInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Interface_DataMapOfTransientInteger;
		 Interface_DataMapOfTransientInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_DataMapOfTransientInteger &
	:rtype: Interface_DataMapOfTransientInteger
") Assign;
		Interface_DataMapOfTransientInteger & Assign (const Interface_DataMapOfTransientInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_DataMapOfTransientInteger &
	:rtype: Interface_DataMapOfTransientInteger
") operator =;
		Interface_DataMapOfTransientInteger & operator = (const Interface_DataMapOfTransientInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: int
") Find;
		const Standard_Integer & Find (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Transient & K);
};


%extend Interface_DataMapOfTransientInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_EntityCluster;
class Interface_EntityCluster : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "	* Creates an empty, non-chained, EntityCluster

	:rtype: None
") Interface_EntityCluster;
		 Interface_EntityCluster ();
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "	* Creates a non-chained EntityCluster, filled with one Entity

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") Interface_EntityCluster;
		 Interface_EntityCluster (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "	* Creates an empty EntityCluster, chained with another one (that is, put BEFORE this other one in the list)

	:param ec:
	:type ec: Handle_Interface_EntityCluster &
	:rtype: None
") Interface_EntityCluster;
		 Interface_EntityCluster (const Handle_Interface_EntityCluster & ec);
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "	* Creates an EntityCluster, filled with a first Entity, and chained to another EntityCluster (BEFORE it, as above)

	:param ant:
	:type ant: Handle_Standard_Transient &
	:param ec:
	:type ec: Handle_Interface_EntityCluster &
	:rtype: None
") Interface_EntityCluster;
		 Interface_EntityCluster (const Handle_Standard_Transient & ant,const Handle_Interface_EntityCluster & ec);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Appends an Entity to the Cluster. If it is not full, adds the entity directly inside itself. Else, transmits to its Next and Creates it if it does not yet exist

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an Entity from the Cluster. If it is not found, calls its Next one to do so. Returns True if it becomes itself empty, False else (thus, a Cluster which becomes empty is deleted from the list)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an Entity from the Cluster, given its rank. If <num> is greater than NbLocal, calls its Next with (num - NbLocal), Returns True if it becomes itself empty, False else

	:param num:
	:type num: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer num);
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns total count of Entities (including Next)

	:rtype: int
") NbEntities;
		Standard_Integer NbEntities ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Entity identified by its rank in the list (including Next)

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer num);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Changes an Entity given its rank.

	:param num:
	:type num: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* Fills an Iterator with designated Entities (includes Next)

	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") FillIterator;
		void FillIterator (Interface_EntityIterator & iter);
};


%extend Interface_EntityCluster {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_EntityCluster(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_EntityCluster::Handle_Interface_EntityCluster %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_EntityCluster;
class Handle_Interface_EntityCluster : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_EntityCluster();
        Handle_Interface_EntityCluster(const Handle_Interface_EntityCluster &aHandle);
        Handle_Interface_EntityCluster(const Interface_EntityCluster *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_EntityCluster DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_EntityCluster {
    Interface_EntityCluster* _get_reference() {
    return (Interface_EntityCluster*)$self->Access();
    }
};

%extend Handle_Interface_EntityCluster {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_EntityCluster {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_EntityIterator;
class Interface_EntityIterator {
	public:
		%feature("compactdefaultargs") Interface_EntityIterator;
		%feature("autodoc", "	* Defines an empty iterator (see AddList & AddItem)

	:rtype: None
") Interface_EntityIterator;
		 Interface_EntityIterator ();
		%feature("compactdefaultargs") Interface_EntityIterator;
		%feature("autodoc", "	* Defines an iterator on a list, directly i.e. without copying it

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") Interface_EntityIterator;
		 Interface_EntityIterator (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "	* Gets a list of entities and adds its to the iteration list

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") AddList;
		void AddList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "	* Adds to the iteration list a defined entity

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: None
") AddItem;
		void AddItem (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") GetOneItem;
		%feature("autodoc", "	* same as AddItem (kept for compatibility)

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: None
") GetOneItem;
		void GetOneItem (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") SelectType;
		%feature("autodoc", "	* Selects entities with are Kind of a given type, keep only them (is keep is True) or reject only them (if keep is False)

	:param atype:
	:type atype: Handle_Standard_Type &
	:param keep:
	:type keep: bool
	:rtype: None
") SelectType;
		void SelectType (const Handle_Standard_Type & atype,const Standard_Boolean keep);
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns count of entities which will be iterated on Calls Start if not yet done

	:rtype: int
") NbEntities;
		Standard_Integer NbEntities ();
		%feature("compactdefaultargs") NbTyped;
		%feature("autodoc", "	* Returns count of entities of a given type (kind of)

	:param type:
	:type type: Handle_Standard_Type &
	:rtype: int
") NbTyped;
		Standard_Integer NbTyped (const Handle_Standard_Type & type);
		%feature("compactdefaultargs") Typed;
		%feature("autodoc", "	* Returns the list of entities of a given type (kind of)

	:param type:
	:type type: Handle_Standard_Type &
	:rtype: Interface_EntityIterator
") Typed;
		Interface_EntityIterator Typed (const Handle_Standard_Type & type);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Allows re-iteration (useless for the first iteration)

	:rtype: void
") Start;
		virtual void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Says if there are other entities (vertices) to iterate the first time, calls Start

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Sets iteration to the next entity (vertex) to give

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current Entity iterated, to be used by Interface tools

	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "	* Returns the content of the Iterator, accessed through a Handle to be used by a frontal-engine logic Returns an empty Sequence if the Iterator is empty Calls Start if not yet done

	:rtype: Handle_TColStd_HSequenceOfTransient
") Content;
		Handle_TColStd_HSequenceOfTransient Content ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Clears data of iteration

	:rtype: void
") Destroy;
		virtual void Destroy ();
};


%extend Interface_EntityIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_EntityList;
class Interface_EntityList {
	public:
		%feature("compactdefaultargs") Interface_EntityList;
		%feature("autodoc", "	* Creates a List as beeing empty

	:rtype: None
") Interface_EntityList;
		 Interface_EntityList ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the List

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Appends an Entity, that is to the END of the list (keeps order, but works slowerly than Add, see below)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds an Entity to the list, that is, with NO REGARD about the order (faster than Append if count becomes greater than 10)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") Add;
		void Add (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an Entity from the list, if it is there

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") Remove;
		void Remove (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an Entity from the list, given its rank

	:param num:
	:type num: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer num);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True if the list is empty

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns count of recorded Entities

	:rtype: int
") NbEntities;
		Standard_Integer NbEntities ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns an Item given its number. Beware about the way the list was filled (see above, Add and Append)

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer num);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Returns an Item given its number. Beware about the way the list was filled (see above, Add and Append)

	:param num:
	:type num: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* fills an Iterator with the content of the list (normal way to consult a list which has been filled with Add)

	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") FillIterator;
		void FillIterator (Interface_EntityIterator & iter);
		%feature("compactdefaultargs") NbTypedEntities;
		%feature("autodoc", "	* Returns count of Entities of a given Type (0 : none)

	:param atype:
	:type atype: Handle_Standard_Type &
	:rtype: int
") NbTypedEntities;
		Standard_Integer NbTypedEntities (const Handle_Standard_Type & atype);
		%feature("compactdefaultargs") TypedEntity;
		%feature("autodoc", "	* Returns the Entity which is of a given type. If num = 0 (D), there must be ONE AND ONLY ONE If num > 0, returns the num-th entity of this type

	:param atype:
	:type atype: Handle_Standard_Type &
	:param num: default value is 0
	:type num: int
	:rtype: Handle_Standard_Transient
") TypedEntity;
		Handle_Standard_Transient TypedEntity (const Handle_Standard_Type & atype,const Standard_Integer num = 0);
};


%extend Interface_EntityList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_FileParameter;
class Interface_FileParameter {
	public:
		%feature("compactdefaultargs") Interface_FileParameter;
		%feature("autodoc", "	:rtype: None
") Interface_FileParameter;
		 Interface_FileParameter ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Fills fields (with Entity Number set to zero)

	:param val:
	:type val: TCollection_AsciiString &
	:param typ:
	:type typ: Interface_ParamType
	:rtype: None
") Init;
		void Init (const TCollection_AsciiString & val,const Interface_ParamType typ);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Same as above, but builds the Value from a CString

	:param val:
	:type val: char *
	:param typ:
	:type typ: Interface_ParamType
	:rtype: None
") Init;
		void Init (const char * val,const Interface_ParamType typ);
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "	* Same as above, but as a CString (for immediate exploitation) was C++ : return const

	:rtype: char *
") CValue;
		const char * CValue ();
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "	* Returns the type of the parameter

	:rtype: Interface_ParamType
") ParamType;
		Interface_ParamType ParamType ();
		%feature("compactdefaultargs") SetEntityNumber;
		%feature("autodoc", "	* Allows to set a reference to an Entity in a numbered list

	:param num:
	:type num: int
	:rtype: None
") SetEntityNumber;
		void SetEntityNumber (const Standard_Integer num);
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "	* Returns value set by SetEntityNumber

	:rtype: int
") EntityNumber;
		Standard_Integer EntityNumber ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears stored data : frees memory taken for the String Value

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Destructor. Does nothing because Memory is managed by ParamSet

	:rtype: None
") Destroy;
		void Destroy ();
};


%extend Interface_FileParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_FileReaderData;
class Interface_FileReaderData : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") NbRecords;
		%feature("autodoc", "	* Returns the count of registered records That is, value given for Initialization (can be redefined)

	:rtype: int
") NbRecords;
		virtual Standard_Integer NbRecords ();
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns the count of entities. Depending of each norm, records can be Entities or SubParts (SubList in STEP, SubGroup in SET ...). NbEntities counts only Entities, not Subs Used for memory reservation in InterfaceModel Default implementation uses FindNextRecord Can be redefined into a more performant way

	:rtype: int
") NbEntities;
		virtual Standard_Integer NbEntities ();
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "	* Determines the record number defining an Entity following a given record number. Specific to each sub-class of FileReaderData. Returning zero means no record found

	:param num:
	:type num: int
	:rtype: int
") FindNextRecord;
		virtual Standard_Integer FindNextRecord (const Standard_Integer num);
		%feature("compactdefaultargs") InitParams;
		%feature("autodoc", "	* attaches an empty ParamList to a Record

	:param num:
	:type num: int
	:rtype: None
") InitParams;
		void InitParams (const Standard_Integer num);
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "	* Adds a parameter to record no 'num' and fills its fields (EntityNumber is optional) Warning : <aval> is assumed to be memory-managed elsewhere : it is NOT copied. This gives a best speed : strings remain stored in pages of characters

	:param num:
	:type num: int
	:param aval:
	:type aval: char *
	:param atype:
	:type atype: Interface_ParamType
	:param nument: default value is 0
	:type nument: int
	:rtype: None
") AddParam;
		void AddParam (const Standard_Integer num,const char * aval,const Interface_ParamType atype,const Standard_Integer nument = 0);
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "	* Same as above, but gets a AsciiString from TCollection Remark that the content of the AsciiString is locally copied (because its content is most often lost after using)

	:param num:
	:type num: int
	:param aval:
	:type aval: TCollection_AsciiString &
	:param atype:
	:type atype: Interface_ParamType
	:param nument: default value is 0
	:type nument: int
	:rtype: None
") AddParam;
		void AddParam (const Standard_Integer num,const TCollection_AsciiString & aval,const Interface_ParamType atype,const Standard_Integer nument = 0);
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "	* Same as above, but gets a complete FileParameter Warning : Content of <FP> is NOT copied : its original address and space in memory are assumed to be managed elsewhere (see ParamSet)

	:param num:
	:type num: int
	:param FP:
	:type FP: Interface_FileParameter &
	:rtype: None
") AddParam;
		void AddParam (const Standard_Integer num,const Interface_FileParameter & FP);
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "	* Sets a new value for a parameter of a record, given by : num : record number; nump : parameter number in the record

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param FP:
	:type FP: Interface_FileParameter &
	:rtype: None
") SetParam;
		void SetParam (const Standard_Integer num,const Standard_Integer nump,const Interface_FileParameter & FP);
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "	* Returns count of parameters attached to record 'num' If <num> = 0, returns the total recorded count of parameters

	:param num:
	:type num: int
	:rtype: int
") NbParams;
		Standard_Integer NbParams (const Standard_Integer num);
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "	* Returns the complete ParamList of a record (read only) num = 0 to return the whole param list for the file

	:param num:
	:type num: int
	:rtype: Handle_Interface_ParamList
") Params;
		Handle_Interface_ParamList Params (const Standard_Integer num);
		%feature("compactdefaultargs") Param;
		%feature("autodoc", "	* Returns parameter 'nump' of record 'num', as a complete FileParameter

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:rtype: Interface_FileParameter
") Param;
		const Interface_FileParameter & Param (const Standard_Integer num,const Standard_Integer nump);
		%feature("compactdefaultargs") ChangeParam;
		%feature("autodoc", "	* Same as above, but in order to be modified on place

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:rtype: Interface_FileParameter
") ChangeParam;
		Interface_FileParameter & ChangeParam (const Standard_Integer num,const Standard_Integer nump);
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "	* Returns type of parameter 'nump' of record 'num' Returns literal value of parameter 'nump' of record 'num' was C++ : return const &

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:rtype: Interface_ParamType
") ParamType;
		Interface_ParamType ParamType (const Standard_Integer num,const Standard_Integer nump);
		%feature("compactdefaultargs") ParamCValue;
		%feature("autodoc", "	* Same as above, but as a CString was C++ : return const

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:rtype: char *
") ParamCValue;
		const char * ParamCValue (const Standard_Integer num,const Standard_Integer nump);
		%feature("compactdefaultargs") IsParamDefined;
		%feature("autodoc", "	* Returns True if parameter 'nump' of record 'num' is defined (it is not if its type is ParamVoid)

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:rtype: bool
") IsParamDefined;
		Standard_Boolean IsParamDefined (const Standard_Integer num,const Standard_Integer nump);
		%feature("compactdefaultargs") ParamNumber;
		%feature("autodoc", "	* Returns record number of an entity referenced by a parameter of type Ident; 0 if no EntityNumber has been determined Note that it is used to reference Entities but also Sublists (sublists are not objects, but internal descriptions)

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:rtype: int
") ParamNumber;
		Standard_Integer ParamNumber (const Standard_Integer num,const Standard_Integer nump);
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "	* Returns the StepEntity referenced by a parameter Error if none

	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:rtype: Handle_Standard_Transient
") ParamEntity;
		Handle_Standard_Transient ParamEntity (const Standard_Integer num,const Standard_Integer nump);
		%feature("compactdefaultargs") ParamFirstRank;
		%feature("autodoc", "	* Returns the absolute rank of the beginning of a record (its lsit is from ParamFirstRank+1 to ParamFirstRank+NbParams)

	:param num:
	:type num: int
	:rtype: int
") ParamFirstRank;
		Standard_Integer ParamFirstRank (const Standard_Integer num);
		%feature("compactdefaultargs") BoundEntity;
		%feature("autodoc", "	* Returns the entity bound to a record, set by SetEntities

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") BoundEntity;
		Handle_Standard_Transient BoundEntity (const Standard_Integer num);
		%feature("compactdefaultargs") BindEntity;
		%feature("autodoc", "	* Binds an entity to a record

	:param num:
	:type num: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") BindEntity;
		void BindEntity (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SetErrorLoad;
		%feature("autodoc", "	* Sets the status 'Error Load' on, to overside check fails <val> True : declares unloaded <val> False : declares loaded If not called before loading (see FileReaderTool), check fails give the status IsErrorLoad says if SetErrorLoad has been called by user ResetErrorLoad resets it (called by FileReaderTool) This allows to specify that the currently loaded entity remains unloaded (because of syntactic fail)

	:param val:
	:type val: bool
	:rtype: None
") SetErrorLoad;
		void SetErrorLoad (const Standard_Boolean val);
		%feature("compactdefaultargs") IsErrorLoad;
		%feature("autodoc", "	* Returns True if the status 'Error Load' has been set (to True or False)

	:rtype: bool
") IsErrorLoad;
		Standard_Boolean IsErrorLoad ();
		%feature("compactdefaultargs") ResetErrorLoad;
		%feature("autodoc", "	* Returns the former value of status 'Error Load' then resets it Used to read the status then ensure it is reset

	:rtype: bool
") ResetErrorLoad;
		Standard_Boolean ResetErrorLoad ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Destructor (waiting for memory management)

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Fastof;
		%feature("autodoc", "	* Same spec.s as standard <atof> but 5 times faster

	:param str:
	:type str: char *
	:rtype: float
") Fastof;
		static Standard_Real Fastof (const char * str);
};


%extend Interface_FileReaderData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_FileReaderData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_FileReaderData::Handle_Interface_FileReaderData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_FileReaderData;
class Handle_Interface_FileReaderData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_FileReaderData();
        Handle_Interface_FileReaderData(const Handle_Interface_FileReaderData &aHandle);
        Handle_Interface_FileReaderData(const Interface_FileReaderData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_FileReaderData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_FileReaderData {
    Interface_FileReaderData* _get_reference() {
    return (Interface_FileReaderData*)$self->Access();
    }
};

%extend Handle_Interface_FileReaderData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_FileReaderData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_FileReaderTool;
class Interface_FileReaderTool {
	public:
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	* Sets Data to a FileReaderData. Works with a Protocol

	:param reader:
	:type reader: Handle_Interface_FileReaderData &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") SetData;
		void SetData (const Handle_Interface_FileReaderData & reader,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the Protocol given at creation time

	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "	* Returns the FileReaderData which is used to work

	:rtype: Handle_Interface_FileReaderData
") Data;
		Handle_Interface_FileReaderData Data ();
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Stores a Model. Used when the Model has been loaded

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the stored Model

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "	* Sets Messenger used for outputting messages

	:param messenger:
	:type messenger: Handle_Message_Messenger &
	:rtype: None
") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & messenger);
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "	* Returns Messenger used for outputting messages. The returned object is guaranteed to be non-null; default is Message::Messenger().

	:rtype: Handle_Message_Messenger
") Messenger;
		Handle_Message_Messenger Messenger ();
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "	* Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages Default is 1 : Errors traced

	:param tracelev:
	:type tracelev: int
	:rtype: None
") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "	* Returns trace level used for outputting messages.

	:rtype: int
") TraceLevel;
		Standard_Integer TraceLevel ();
		%feature("compactdefaultargs") SetEntities;
		%feature("autodoc", "	* Fills records with empty entities; once done, each entity can ask the FileReaderTool for any entity referenced through an identifier. Calls Recognize which is specific to each specific type of FileReaderTool

	:rtype: None
") SetEntities;
		void SetEntities ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	* Recognizes a record, given its number. Specific to each Interface; called by SetEntities. It can call the basic method RecognizeByLib. Returns False if recognition has failed, True else. <ach> has not to be filled if simply Recognition has failed : it must record true error messages : RecognizeByLib can generate error messages if NewRead is called //! Note that it works thru a Recognizer (method Evaluate) which has to be memorized before starting

	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize (const Standard_Integer num,Handle_Interface_Check & ach,Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") RecognizeByLib;
		%feature("autodoc", "	* Recognizes a record with the help of Libraries. Can be used to implement the method Recognize. <rlib> is used to find Protocol and CaseNumber to apply <glib> performs the creation (by service NewVoid, or NewRead if NewVoid gave no result) <ach> is a check, which is transmitted to NewRead if it is called, gives a result but which is false <ent> is the result Returns False if recognition has failed, True else

	:param num:
	:type num: int
	:param glib:
	:type glib: Interface_GeneralLib &
	:param rlib:
	:type rlib: Interface_ReaderLib &
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") RecognizeByLib;
		Standard_Boolean RecognizeByLib (const Standard_Integer num,Interface_GeneralLib & glib,Interface_ReaderLib & rlib,Handle_Interface_Check & ach,Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "	* Provides an unknown entity, specific to the Interface called by SetEntities when Recognize has failed (Unknown alone) or by LoadModel when an Entity has caused a Fail on reading (to keep at least its literal description) Uses Protocol to do it

	:rtype: Handle_Standard_Transient
") UnknownEntity;
		Handle_Standard_Transient UnknownEntity ();
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "	* Creates an empty Model of the norm. Uses Protocol to do it

	:rtype: Handle_Interface_InterfaceModel
") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "	* Reads and fills Entities from the FileReaderData set by SetData to an InterfaceModel. It enchains required operations, the specific ones correspond to deferred methods (below) to be defined for each Norm. It manages also error recovery and trace. Remark : it calls SetModel. It Can raise any error which can occur during a load operation, unless Error Handling is set. This method can also be redefined if judged necessary.

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") LoadModel;
		void LoadModel (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") LoadedEntity;
		%feature("autodoc", "	* Reads, Fills and Returns one Entity read from a Record of the FileReaderData. This Method manages also case of Fail or Warning, by producing a ReportEntyty plus , for a Fail, a literal Content (as an UnknownEntity). Performs also Trace

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") LoadedEntity;
		Handle_Standard_Transient LoadedEntity (const Standard_Integer num);
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "	* Fills model's header; each Interface defines for its Model its own file header; this method fills it from FileReaderTool.+ It is called by AnalyseFile from InterfaceModel

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: void
") BeginRead;
		virtual void BeginRead (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "	* Fills an Entity, given record no; specific to each Interface, called by AnalyseFile from InterfaceModel (which manages its calling arguments) To work, each Interface can define a method in its proper Transient class, like this (given as an example) : AnalyseRecord (me : mutable; FR : in out FileReaderTool; num : Integer; acheck : in out Check) returns Boolean; and call it from AnalyseRecord //! Returned Value : True if the entity could be loaded, False else (in case of syntactic fail)

	:param num:
	:type num: int
	:param anent:
	:type anent: Handle_Standard_Transient &
	:param acheck:
	:type acheck: Handle_Interface_Check &
	:rtype: bool
") AnalyseRecord;
		virtual Standard_Boolean AnalyseRecord (const Standard_Integer num,const Handle_Standard_Transient & anent,Handle_Interface_Check & acheck);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "	* Ends file reading after reading all the entities default is doing nothing; redefinable as necessary

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: void
") EndRead;
		virtual void EndRead (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear filelds

	:rtype: None
") Clear;
		void Clear ();
};


%extend Interface_FileReaderTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_FloatWriter;
class Interface_FloatWriter {
	public:
		%feature("compactdefaultargs") Interface_FloatWriter;
		%feature("autodoc", "	* Creates a FloatWriter ready to work, with default options - - zero suppress option is set - main format is set to '%E' - secondary format is set to '%f' for values between 0.1 and 1000. in absolute values If <chars> is given (and positive), it will produce options to produce this count of characters : '%<chars>f','%<chars>%E'

	:param chars: default value is 0
	:type chars: int
	:rtype: None
") Interface_FloatWriter;
		 Interface_FloatWriter (const Standard_Integer chars = 0);
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	* Sets a specific Format for Sending Reals (main format) (Default from Creation is '%E') If <reset> is given True (default), this call clears effects of former calls to SetFormatForRange and SetZeroSuppress

	:param form:
	:type form: char *
	:param reset: default value is Standard_True
	:type reset: bool
	:rtype: None
") SetFormat;
		void SetFormat (const char * form,const Standard_Boolean reset = Standard_True);
		%feature("compactdefaultargs") SetFormatForRange;
		%feature("autodoc", "	* Sets a secondary Format for Real, to be applied between R1 and R2 (in absolute values). A Call to SetRealForm cancels this secondary form if <reset> is True. (Default from Creation is '%f' between 0.1 and 1000.) Warning : if the condition (0. <= R1 < R2) is not fulfilled, this secondary form is canceled.

	:param form:
	:type form: char *
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:rtype: None
") SetFormatForRange;
		void SetFormatForRange (const char * form,const Standard_Real R1,const Standard_Real R2);
		%feature("compactdefaultargs") SetZeroSuppress;
		%feature("autodoc", "	* Sets Sending Real Parameters to suppress trailing Zeros and Null Exponant ('E+00'), if <mode> is given True, Resets this mode if <mode> is False (in addition to Real Forms) A call to SetRealFrom resets this mode to False ig <reset> is given True (Default from Creation is True)

	:param mode:
	:type mode: bool
	:rtype: None
") SetZeroSuppress;
		void SetZeroSuppress (const Standard_Boolean mode);
		%feature("compactdefaultargs") SetDefaults;
		%feature("autodoc", "	* Sets again options to the defaults given by Create

	:param chars: default value is 0
	:type chars: int
	:rtype: None
") SetDefaults;
		void SetDefaults (const Standard_Integer chars = 0);
		%feature("compactdefaultargs") Options;
		%feature("autodoc", "	* Returns active options : <zerosup> is the option ZeroSuppress, <range> is True if a range is set, False else R1,R2 give the range (if it is set)

	:param zerosup:
	:type zerosup: bool
	:param range:
	:type range: bool
	:param R1:
	:type R1: float &
	:param R2:
	:type R2: float &
	:rtype: None
") Options;
		void Options (Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") MainFormat;
		%feature("autodoc", "	* Returns the main format was C++ : return const

	:rtype: char *
") MainFormat;
		const char * MainFormat ();
		%feature("compactdefaultargs") FormatForRange;
		%feature("autodoc", "	* Returns the format for range, if set Meaningful only if <range> from Options is True was C++ : return const

	:rtype: char *
") FormatForRange;
		const char * FormatForRange ();
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes a Real value <val> to a string <text> by using the options. Returns the useful Length of produced string. It calls the class method Convert. Warning : <text> is assumed to be wide enough (20-30 is correct) And, even if declared in, its content will be modified

	:param val:
	:type val: float
	:param text:
	:type text: char *
	:rtype: int
") Write;
		Standard_Integer Write (const Standard_Real val,const char * text);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* This class method converts a Real Value to a string, given options given as arguments. It can be called independantly. Warning : even if declared in, content of <text> will be modified

	:param val:
	:type val: float
	:param text:
	:type text: char *
	:param zerosup:
	:type zerosup: bool
	:param Range1:
	:type Range1: float
	:param Range2:
	:type Range2: float
	:param mainform:
	:type mainform: char *
	:param rangeform:
	:type rangeform: char *
	:rtype: int
") Convert;
		static Standard_Integer Convert (const Standard_Real val,const char * text,const Standard_Boolean zerosup,const Standard_Real Range1,const Standard_Real Range2,const char * mainform,const char * rangeform);
};


%extend Interface_FloatWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_GTool;
class Interface_GTool : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_GTool;
		%feature("autodoc", "	* Creates an empty, not set, GTool

	:rtype: None
") Interface_GTool;
		 Interface_GTool ();
		%feature("compactdefaultargs") Interface_GTool;
		%feature("autodoc", "	* Creates a GTool from a Protocol Optional starting count of entities

	:param proto:
	:type proto: Handle_Interface_Protocol &
	:param nbent: default value is 0
	:type nbent: int
	:rtype: None
") Interface_GTool;
		 Interface_GTool (const Handle_Interface_Protocol & proto,const Standard_Integer nbent = 0);
		%feature("compactdefaultargs") SetSignType;
		%feature("autodoc", "	* Sets a new SignType

	:param sign:
	:type sign: Handle_Interface_SignType &
	:rtype: None
") SetSignType;
		void SetSignType (const Handle_Interface_SignType & sign);
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "	* Returns the SignType. Can be null

	:rtype: Handle_Interface_SignType
") SignType;
		Handle_Interface_SignType SignType ();
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "	* Returns the Signature for a Transient Object in a Model It calls SignType to do that If SignType is not defined, return ClassName of <ent>

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") SignValue;
		const char * SignValue (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "	* Returns the Name of the SignType, or 'Class Name'

	:rtype: char *
") SignName;
		const char * SignName ();
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "	* Sets a new Protocol if <enforce> is False and the new Protocol equates the old one then nothing is done

	:param proto:
	:type proto: Handle_Interface_Protocol &
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: None
") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto,const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the Protocol. Warning : it can be Null

	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "	* Returns the GeneralLib itself

	:rtype: Interface_GeneralLib
") Lib;
		Interface_GeneralLib & Lib ();
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "	* Reservates maps for a count of entities <enforce> False : minimum count <enforce> True : clears former reservations Does not clear the maps

	:param nb:
	:type nb: int
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: None
") Reservate;
		void Reservate (const Standard_Integer nb,const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "	* Clears the maps which record, for each already recorded entity its Module and Case Number

	:rtype: None
") ClearEntities;
		void ClearEntities ();
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Selects for an entity, its Module and Case Number It is optimised : once done for each entity, the result is mapped and the GeneralLib is not longer queried <enforce> True overpasses this optimisation

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param gmod:
	:type gmod: Handle_Interface_GeneralModule &
	:param CN:
	:type CN: int &
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool
") Select;
		Standard_Boolean Select (const Handle_Standard_Transient & ent,Handle_Interface_GeneralModule & gmod,Standard_Integer &OutValue,const Standard_Boolean enforce = Standard_False);
};


%extend Interface_GTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_GTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_GTool::Handle_Interface_GTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_GTool;
class Handle_Interface_GTool : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_GTool();
        Handle_Interface_GTool(const Handle_Interface_GTool &aHandle);
        Handle_Interface_GTool(const Interface_GTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_GTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GTool {
    Interface_GTool* _get_reference() {
    return (Interface_GTool*)$self->Access();
    }
};

%extend Handle_Interface_GTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_GTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Interface_GeneralLib {
	public:
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "	:param amodule:
	:type amodule: Handle_Interface_GeneralModule &
	:param aprotocol:
	:type aprotocol: Handle_Interface_Protocol &
	:rtype: void
") SetGlobal;
		static void SetGlobal (const Handle_Interface_GeneralModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("compactdefaultargs") Interface_GeneralLib;
		%feature("autodoc", "	:param aprotocol:
	:type aprotocol: Handle_Interface_Protocol &
	:rtype: None
") Interface_GeneralLib;
		 Interface_GeneralLib (const Handle_Interface_Protocol & aprotocol);
		%feature("compactdefaultargs") Interface_GeneralLib;
		%feature("autodoc", "	:rtype: None
") Interface_GeneralLib;
		 Interface_GeneralLib ();
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "	:param aprotocol:
	:type aprotocol: Handle_Standard_Transient &
	:rtype: None
") AddProtocol;
		void AddProtocol (const Handle_Standard_Transient & aprotocol);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "	:rtype: None
") SetComplete;
		void SetComplete ();
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	:param obj:
	:type obj: Handle_Standard_Transient &
	:param module:
	:type module: Handle_Interface_GeneralModule &
	:param CN:
	:type CN: int &
	:rtype: bool
") Select;
		Standard_Boolean Select (const Handle_Standard_Transient & obj,Handle_Interface_GeneralModule & module,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	:rtype: None
") Start;
		void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "	:rtype: Handle_Interface_GeneralModule
") Module;
		Handle_Interface_GeneralModule Module ();
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
};


%extend Interface_GeneralLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_GeneralModule;
class Interface_GeneralModule : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") FillShared;
		%feature("autodoc", "	* Specific filling of the list of Entities shared by an Entity <ent>, according a Case Number <CN> (formerly computed by CaseNum), considered in the context of a Model <model> Default calls FillSharedCase (i.e., ignores the model) Can be redefined to use the model for working

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: void
") FillShared;
		virtual void FillShared (const Handle_Interface_InterfaceModel & model,const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "	* Specific filling of the list of Entities shared by an Entity <ent>, according a Case Number <CN> (formerly computed by CaseNum). Can use the internal utility method Share, below

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: void
") FillSharedCase;
		virtual void FillSharedCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Adds an Entity to a Shared List (uses GetOneItem on <iter>)

	:param iter:
	:type iter: Interface_EntityIterator &
	:param shared:
	:type shared: Handle_Standard_Transient &
	:rtype: None
") Share;
		void Share (Interface_EntityIterator & iter,const Handle_Standard_Transient & shared);
		%feature("compactdefaultargs") ListImplied;
		%feature("autodoc", "	* List the Implied References of <ent> considered in the context of a Model <model> : i.e. the Entities which are Referenced while not considered as Shared (not copied if <ent> is, references not renewed by CopyCase but by ImpliedCase, only if referenced Entities have been Copied too) FillShared + ListImplied give the complete list of References Default calls ListImpliedCase (i.e. ignores the model) Can be redefined to use the model for working

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: void
") ListImplied;
		virtual void ListImplied (const Handle_Interface_InterfaceModel & model,const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") ListImpliedCase;
		%feature("autodoc", "	* List the Implied References of <ent> (see above) are Referenced while not considered as Shared (not copied if <ent> is, references not renewed by CopyCase but by ImpliedCase, only if referenced Entities have been Copied too) FillSharedCase + ListImpliedCase give the complete list of Referenced Entities The provided default method does nothing (Implied References are specific of a little amount of Entity Classes).

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: void
") ListImpliedCase;
		virtual void ListImpliedCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "	* Specific Checking of an Entity <ent> Can check context queried through a ShareTool, as required

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: void
") CheckCase;
		virtual void CheckCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares,Handle_Interface_Check & ach);
		%feature("compactdefaultargs") CanCopy;
		%feature("autodoc", "	* Specific answer to the question 'is Copy properly implemented' Remark that it should be in phase with the implementation of NewVoid+CopyCase/NewCopyCase Default returns always False, can be redefined

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") CanCopy;
		virtual Standard_Boolean CanCopy (const Standard_Integer CN,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "	* Dispatches an entity Returns True if it works by copy, False if it just duplicates the starting Handle //! Dispatching means producing a new entity, image of the starting one, in order to be put into a new Model, this Model being itself the result of a dispatch from an original Model //! According to the cases, dispatch can either * just return <entto> as equating <entfrom> -> the new model designates the starting entity : it is lighter, but the dispatched entity being shared might not be modified for dispatch * copy <entfrom> to <entto> by calling NewVoid+CopyCase (two steps) or NewCopiedCase (1) -> the dispatched entity is a COPY, hence it can be modified //! The provided default just duplicates the handle without copying, then returns False. Can be redefined

	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: bool
") Dispatch;
		virtual Standard_Boolean Dispatch (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto,Interface_CopyTool & TC);
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "	* Creates a new void entity <entto> according to a Case Number This entity remains to be filled, by reading from a file or by copying from another entity of same type (see CopyCase)

	:param CN:
	:type CN: int
	:param entto:
	:type entto: Handle_Standard_Transient &
	:rtype: bool
") NewVoid;
		virtual Standard_Boolean NewVoid (const Standard_Integer CN,Handle_Standard_Transient & entto);
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "	* Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. Use method Transferred from CopyTool to work

	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: void
") CopyCase;
		virtual void CopyCase (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,const Handle_Standard_Transient & entto,Interface_CopyTool & TC);
		%feature("compactdefaultargs") NewCopiedCase;
		%feature("autodoc", "	* Specific operator (create+copy) defaulted to do nothing. It can be redefined : When it is not possible to work in two steps (NewVoid then CopyCase). This can occur when there is no default constructor : hence the result <entto> must be created with an effective definition. Remark : if NewCopiedCase is defined, CopyCase has nothing to do Returns True if it has produced something, false else

	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: bool
") NewCopiedCase;
		virtual Standard_Boolean NewCopiedCase (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto,Interface_CopyTool & TC);
		%feature("compactdefaultargs") RenewImpliedCase;
		%feature("autodoc", "	* Specific Copying of Implied References A Default is provided which does nothing (must current case !) Already copied references (by CopyFrom) must remain unchanged Use method Search from CopyTool to work

	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: void
") RenewImpliedCase;
		virtual void RenewImpliedCase (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,const Handle_Standard_Transient & entto,const Interface_CopyTool & TC);
		%feature("compactdefaultargs") WhenDeleteCase;
		%feature("autodoc", "	* Prepares an entity to be deleted. What does it mean : Basically, any class of entity may define its own destructor By default, it does nothing but calling destructors on fields With the Memory Manager, it is useless to call destructor, it is done automatically when the Handle is nullified(cleared) BUT this is ineffective in looping structures (whatever these are 'Implied' references or not). //! THUS : if no loop may appear in definitions, a class which inherits from TShared is correctly managed by automatic way BUT if there can be loops (or simply back pointers), they must be broken, for instance by clearing fields of one of the nodes The default does nothing, to be redefined if a loop can occur (Implied generally requires WhenDelete, but other cases can occur) //! Warning : <dispatched> tells if the entity to be deleted has been produced by Dispatch or not. Hence WhenDelete must be in coherence with Dispatch Dispatch can either copy or not. If it copies the entity, this one should be deleted If it doesnt (i.e. duplicates the handle) nothing to do //! If <dispatch> is False, normal deletion is to be performed

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param dispatched:
	:type dispatched: bool
	:rtype: void
") WhenDeleteCase;
		virtual void WhenDeleteCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Standard_Boolean dispatched);
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "	* Returns a category number which characterizes an entity Category Numbers are managed by the class Category <shares> can be used to evaluate this number in the context Default returns 0 which means 'unspecified'

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shares:
	:type shares: Interface_ShareTool &
	:rtype: int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Determines if an entity brings a Name (or widerly, if a Name can be attached to it, through the ShareTool By default, returns a Null Handle_nonamecanbeproduced Can be redefined //! Warning : While this string may be edited on the spot, if it is a read field, the returned value must be copied before.

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shares:
	:type shares: Interface_ShareTool &
	:rtype: Handle_TCollection_HAsciiString
") Name;
		virtual Handle_TCollection_HAsciiString Name (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
};


%extend Interface_GeneralModule {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_GeneralModule(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_GeneralModule::Handle_Interface_GeneralModule %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_GeneralModule;
class Handle_Interface_GeneralModule : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_GeneralModule();
        Handle_Interface_GeneralModule(const Handle_Interface_GeneralModule &aHandle);
        Handle_Interface_GeneralModule(const Interface_GeneralModule *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_GeneralModule DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GeneralModule {
    Interface_GeneralModule* _get_reference() {
    return (Interface_GeneralModule*)$self->Access();
    }
};

%extend Handle_Interface_GeneralModule {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_GlobalNodeOfGeneralLib;
class Interface_GlobalNodeOfGeneralLib : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Interface_GlobalNodeOfGeneralLib;
		%feature("autodoc", "	:rtype: None
") Interface_GlobalNodeOfGeneralLib;
		 Interface_GlobalNodeOfGeneralLib ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param amodule:
	:type amodule: Handle_Interface_GeneralModule &
	:param aprotocol:
	:type aprotocol: Handle_Interface_Protocol &
	:rtype: None
") Add;
		void Add (const Handle_Interface_GeneralModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "	:rtype: Handle_Interface_GeneralModule
") Module;
		Handle_Interface_GeneralModule Module ();
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Interface_GlobalNodeOfGeneralLib
") Next;
		Handle_Interface_GlobalNodeOfGeneralLib Next ();
};


%extend Interface_GlobalNodeOfGeneralLib {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_GlobalNodeOfGeneralLib(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_GlobalNodeOfGeneralLib::Handle_Interface_GlobalNodeOfGeneralLib %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_GlobalNodeOfGeneralLib;
class Handle_Interface_GlobalNodeOfGeneralLib : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Interface_GlobalNodeOfGeneralLib();
        Handle_Interface_GlobalNodeOfGeneralLib(const Handle_Interface_GlobalNodeOfGeneralLib &aHandle);
        Handle_Interface_GlobalNodeOfGeneralLib(const Interface_GlobalNodeOfGeneralLib *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_GlobalNodeOfGeneralLib DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GlobalNodeOfGeneralLib {
    Interface_GlobalNodeOfGeneralLib* _get_reference() {
    return (Interface_GlobalNodeOfGeneralLib*)$self->Access();
    }
};

%extend Handle_Interface_GlobalNodeOfGeneralLib {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_GlobalNodeOfGeneralLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_GlobalNodeOfReaderLib;
class Interface_GlobalNodeOfReaderLib : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Interface_GlobalNodeOfReaderLib;
		%feature("autodoc", "	:rtype: None
") Interface_GlobalNodeOfReaderLib;
		 Interface_GlobalNodeOfReaderLib ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param amodule:
	:type amodule: Handle_Interface_ReaderModule &
	:param aprotocol:
	:type aprotocol: Handle_Interface_Protocol &
	:rtype: None
") Add;
		void Add (const Handle_Interface_ReaderModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "	:rtype: Handle_Interface_ReaderModule
") Module;
		Handle_Interface_ReaderModule Module ();
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Interface_GlobalNodeOfReaderLib
") Next;
		Handle_Interface_GlobalNodeOfReaderLib Next ();
};


%extend Interface_GlobalNodeOfReaderLib {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_GlobalNodeOfReaderLib(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_GlobalNodeOfReaderLib::Handle_Interface_GlobalNodeOfReaderLib %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_GlobalNodeOfReaderLib;
class Handle_Interface_GlobalNodeOfReaderLib : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Interface_GlobalNodeOfReaderLib();
        Handle_Interface_GlobalNodeOfReaderLib(const Handle_Interface_GlobalNodeOfReaderLib &aHandle);
        Handle_Interface_GlobalNodeOfReaderLib(const Interface_GlobalNodeOfReaderLib *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_GlobalNodeOfReaderLib DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GlobalNodeOfReaderLib {
    Interface_GlobalNodeOfReaderLib* _get_reference() {
    return (Interface_GlobalNodeOfReaderLib*)$self->Access();
    }
};

%extend Handle_Interface_GlobalNodeOfReaderLib {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_GlobalNodeOfReaderLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_Graph;
class Interface_Graph {
	public:
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "	* Creates an empty graph, ready to receive Entities from amodel Note that this way of Creation allows <self> to verify that Entities to work with are contained in <amodel> Basic Shared and Sharing lists are obtained from a General Services Library, given directly as an argument

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param lib:
	:type lib: Interface_GeneralLib &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "	* Same as above, but the Library is defined through a Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "	* Same as above, but the Library is defined through a Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param gtool:
	:type gtool: Handle_Interface_GTool &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "	* Same a above but works with the Protocol recorded in the Model

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "	* Creates a Graph from another one, getting all its data Remark that status are copied from <agraph>, but the other lists (sharing/shared) are copied only if <copied> = True

	:param agraph:
	:type agraph: Interface_Graph &
	:param copied: default value is Standard_False
	:type copied: bool
	:rtype: None
") Interface_Graph;
		 Interface_Graph (const Interface_Graph & agraph,const Standard_Boolean copied = Standard_False);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Erases data, making graph ready to rebegin from void (also resets Shared lists redefinitions)

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") ResetStatus;
		%feature("autodoc", "	* Erases Status (Values and Flags of Presence), making graph ready to rebegin from void. Does not concerns Shared lists

	:rtype: None
") ResetStatus;
		void ResetStatus ();
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns size (max nb of entities, i.e. Model's nb of entities)

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("compactdefaultargs") NbStatuses;
		%feature("autodoc", "	* Returns size of array of statuses

	:rtype: int
") NbStatuses;
		Standard_Integer NbStatuses ();
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "	* Returns the Number of the entity in the Map, computed at creation time (Entities loaded from the Model) Returns 0 if <ent> not contained by Model used to create <self> (that is, <ent> is unknown from <self>)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") EntityNumber;
		Standard_Integer EntityNumber (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "	* Returns True if an Entity is noted as present in the graph (See methods Get... which determine this status) Returns False if <num> is out of range too

	:param num:
	:type num: int
	:rtype: bool
") IsPresent;
		Standard_Boolean IsPresent (const Standard_Integer num);
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "	* Same as above but directly on an Entity <ent> : if it is not contained in the Model, returns False. Else calls IsPresent(num) with <num> given by EntityNumber

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsPresent;
		Standard_Boolean IsPresent (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "	* Returns mapped Entity given its no (if it is present)

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Entity;
		Handle_Standard_Transient Entity (const Standard_Integer num);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns Status associated to a numero (only to read it)

	:param num:
	:type num: int
	:rtype: int
") Status;
		Standard_Integer Status (const Standard_Integer num);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Modifies Status associated to a numero

	:param num:
	:type num: int
	:param stat:
	:type stat: int
	:rtype: None
") SetStatus;
		void SetStatus (const Standard_Integer num,const Standard_Integer stat);
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "	* Clears Entity and sets Status to 0, for a numero

	:param num:
	:type num: int
	:rtype: None
") RemoveItem;
		void RemoveItem (const Standard_Integer num);
		%feature("compactdefaultargs") ChangeStatus;
		%feature("autodoc", "	* Changes all status which value is oldstat to new value newstat

	:param oldstat:
	:type oldstat: int
	:param newstat:
	:type newstat: int
	:rtype: None
") ChangeStatus;
		void ChangeStatus (const Standard_Integer oldstat,const Standard_Integer newstat);
		%feature("compactdefaultargs") RemoveStatus;
		%feature("autodoc", "	* Removes all items of which status has a given value stat

	:param stat:
	:type stat: int
	:rtype: None
") RemoveStatus;
		void RemoveStatus (const Standard_Integer stat);
		%feature("compactdefaultargs") BitMap;
		%feature("autodoc", "	* Returns the Bit Map in order to read or edit flag values

	:rtype: Interface_BitMap
") BitMap;
		const Interface_BitMap & BitMap ();
		%feature("compactdefaultargs") CBitMap;
		%feature("autodoc", "	* Returns the Bit Map in order to edit it (add new flags)

	:rtype: Interface_BitMap
") CBitMap;
		Interface_BitMap & CBitMap ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model with which this Graph was created

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") GetFromModel;
		%feature("autodoc", "	* Loads Graph with all Entities contained in the Model

	:rtype: None
") GetFromModel;
		void GetFromModel ();
		%feature("compactdefaultargs") GetFromEntity;
		%feature("autodoc", "	* Gets an Entity, plus its shared ones (at every level) if 'shared' is True. New items are set to status 'newstat' Items already present in graph remain unchanged Of course, redefinitions of Shared lists are taken into account if there are some

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shared:
	:type shared: bool
	:param newstat: default value is 0
	:type newstat: int
	:rtype: None
") GetFromEntity;
		void GetFromEntity (const Handle_Standard_Transient & ent,const Standard_Boolean shared,const Standard_Integer newstat = 0);
		%feature("compactdefaultargs") GetFromEntity;
		%feature("autodoc", "	* Gets an Entity, plus its shared ones (at every level) if 'shared' is True. New items are set to status 'newstat'. Items already present in graph are processed as follows : - if they already have status 'newstat', they remain unchanged - if they have another status, this one is modified : if cumul is True, to former status + overlapstat (cumul) if cumul is False, to overlapstat (enforce)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shared:
	:type shared: bool
	:param newstat:
	:type newstat: int
	:param overlapstat:
	:type overlapstat: int
	:param cumul:
	:type cumul: bool
	:rtype: None
") GetFromEntity;
		void GetFromEntity (const Handle_Standard_Transient & ent,const Standard_Boolean shared,const Standard_Integer newstat,const Standard_Integer overlapstat,const Standard_Boolean cumul);
		%feature("compactdefaultargs") GetFromIter;
		%feature("autodoc", "	* Gets Entities given by an EntityIterator. Entities which were not yet present in the graph are mapped with status 'newstat' Entities already present remain unchanged

	:param iter:
	:type iter: Interface_EntityIterator &
	:param newstat:
	:type newstat: int
	:rtype: None
") GetFromIter;
		void GetFromIter (const Interface_EntityIterator & iter,const Standard_Integer newstat);
		%feature("compactdefaultargs") GetFromIter;
		%feature("autodoc", "	* Gets Entities given by an EntityIterator and distinguishes those already present in the Graph : - new entities added to the Graph with status 'newstst' - entities already present with status = 'newstat' remain unchanged - entities already present with status different form 'newstat' have their status modified : if cumul is True, to former status + overlapstat (cumul) if cumul is False, to overlapstat (enforce) (Note : works as GetEntity, shared = False, for each entity)

	:param iter:
	:type iter: Interface_EntityIterator &
	:param newstat:
	:type newstat: int
	:param overlapstat:
	:type overlapstat: int
	:param cumul:
	:type cumul: bool
	:rtype: None
") GetFromIter;
		void GetFromIter (const Interface_EntityIterator & iter,const Standard_Integer newstat,const Standard_Integer overlapstat,const Standard_Boolean cumul);
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "	* Gets all present items from another graph

	:param agraph:
	:type agraph: Interface_Graph &
	:rtype: None
") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph);
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "	* Gets items from another graph which have a specific Status

	:param agraph:
	:type agraph: Interface_Graph &
	:param stat:
	:type stat: int
	:rtype: None
") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph,const Standard_Integer stat);
		%feature("compactdefaultargs") HasShareErrors;
		%feature("autodoc", "	* Returns True if <ent> or the list of entities shared by <ent> (not redefined) contains items unknown from this Graph Remark : apart from the status HasShareError, these items are ignored

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") HasShareErrors;
		Standard_Boolean HasShareErrors (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") GetShareds;
		%feature("autodoc", "	* Returns the sequence of Entities Shared by an Entity

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") GetShareds;
		Handle_TColStd_HSequenceOfTransient GetShareds (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "	* Returns the list of Entities Shared by an Entity, as recorded by the Graph. That is, by default Basic Shared List, else it can be redefined by methods SetShare, SetNoShare ... see below

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Interface_EntityIterator
") Shareds;
		Interface_EntityIterator Shareds (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "	* Returns the list of Entities which Share an Entity, computed from the Basic or Redefined Shared Lists

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Interface_EntityIterator
") Sharings;
		Interface_EntityIterator Sharings (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") GetSharings;
		%feature("autodoc", "	* Returns the sequence of Entities Sharings by an Entity

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") GetSharings;
		Handle_TColStd_HSequenceOfTransient GetSharings (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") TypedSharings;
		%feature("autodoc", "	* Returns the list of sharings entities, AT ANY LEVEL, which are kind of a given type. A sharing entity kind of this type ends the exploration of its branch

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param type:
	:type type: Handle_Standard_Type &
	:rtype: Interface_EntityIterator
") TypedSharings;
		Interface_EntityIterator TypedSharings (const Handle_Standard_Transient & ent,const Handle_Standard_Type & type);
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "	* Returns the Entities which are not Shared (their Sharing List is empty) in the Model

	:rtype: Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Determines the name attached to an entity, by using the general service Name in GeneralModule Returns a null handle if no name could be computed or if the entity is not in the model

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SharingTable;
		%feature("autodoc", "	* Returns the Table of Sharing lists. Used to Create another Graph from <self>

	:rtype: Handle_TColStd_HArray1OfListOfInteger
") SharingTable;
		Handle_TColStd_HArray1OfListOfInteger SharingTable ();
		%feature("compactdefaultargs") ModeStat;
		%feature("autodoc", "	* Returns mode resposible for computation of statuses;

	:rtype: bool
") ModeStat;
		Standard_Boolean ModeStat ();
};


%extend Interface_Graph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_HArray1OfHAsciiString;
class Interface_HArray1OfHAsciiString : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_HArray1OfHAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Interface_HArray1OfHAsciiString;
		 Interface_HArray1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Interface_HArray1OfHAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_TCollection_HAsciiString &
	:rtype: None
") Interface_HArray1OfHAsciiString;
		 Interface_HArray1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up,const Handle_TCollection_HAsciiString & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_TCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HAsciiString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HAsciiString
") Value;
		Handle_TCollection_HAsciiString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HAsciiString
") ChangeValue;
		Handle_TCollection_HAsciiString ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Interface_Array1OfHAsciiString
") Array1;
		const Interface_Array1OfHAsciiString & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Interface_Array1OfHAsciiString
") ChangeArray1;
		Interface_Array1OfHAsciiString & ChangeArray1 ();
};


%extend Interface_HArray1OfHAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_HArray1OfHAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_HArray1OfHAsciiString::Handle_Interface_HArray1OfHAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_HArray1OfHAsciiString;
class Handle_Interface_HArray1OfHAsciiString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_HArray1OfHAsciiString();
        Handle_Interface_HArray1OfHAsciiString(const Handle_Interface_HArray1OfHAsciiString &aHandle);
        Handle_Interface_HArray1OfHAsciiString(const Interface_HArray1OfHAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_HArray1OfHAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_HArray1OfHAsciiString {
    Interface_HArray1OfHAsciiString* _get_reference() {
    return (Interface_HArray1OfHAsciiString*)$self->Access();
    }
};

%extend Handle_Interface_HArray1OfHAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_HArray1OfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_HGraph;
class Interface_HGraph : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "	* Creates an HGraph directly from a Graph. Remark that the starting Graph is duplicated

	:param agraph:
	:type agraph: Interface_Graph &
	:rtype: None
") Interface_HGraph;
		 Interface_HGraph (const Interface_Graph & agraph);
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "	* Creates an HGraph with a Graph created from <amodel> and <lib>

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param lib:
	:type lib: Interface_GeneralLib &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "	* Creates an HGraph with a graph itself created from <amodel> and <protocol>

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "	* Creates an HGraph with a graph itself created from <amodel> and <protocol>

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param gtool:
	:type gtool: Handle_Interface_GTool &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "	* Same a above, but works with the GTool in the model

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param theModeStats: default value is Standard_True
	:type theModeStats: bool
	:rtype: None
") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Standard_Boolean theModeStats = Standard_True);
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	* Returns the Graph contained in <self>, for Read Only Operations Remark that it is returns as 'const &' Getting it in a new variable instead of a reference would be a pitty, because all the graph's content would be duplicated

	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph ();
		%feature("compactdefaultargs") CGraph;
		%feature("autodoc", "	* Same as above, but for Read-Write Operations Then, The Graph will be modified in the HGraph itself

	:rtype: Interface_Graph
") CGraph;
		Interface_Graph & CGraph ();
};


%extend Interface_HGraph {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_HGraph(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_HGraph::Handle_Interface_HGraph %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_HGraph;
class Handle_Interface_HGraph : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_HGraph();
        Handle_Interface_HGraph(const Handle_Interface_HGraph &aHandle);
        Handle_Interface_HGraph(const Interface_HGraph *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_HGraph DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_HGraph {
    Interface_HGraph* _get_reference() {
    return (Interface_HGraph*)$self->Access();
    }
};

%extend Handle_Interface_HGraph {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_HGraph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_HSequenceOfCheck;
class Interface_HSequenceOfCheck : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_HSequenceOfCheck;
		%feature("autodoc", "	:rtype: None
") Interface_HSequenceOfCheck;
		 Interface_HSequenceOfCheck ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Interface_Check &
	:rtype: None
") Append;
		void Append (const Handle_Interface_Check & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Interface_HSequenceOfCheck &
	:rtype: None
") Append;
		void Append (const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Interface_Check &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Interface_Check & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Interface_HSequenceOfCheck &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Interface_Check &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Interface_Check & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Interface_HSequenceOfCheck &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Interface_Check &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Interface_Check & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Interface_HSequenceOfCheck &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Interface_HSequenceOfCheck
") Split;
		Handle_Interface_HSequenceOfCheck Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Interface_Check &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Interface_Check & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Interface_Check
") Value;
		Handle_Interface_Check Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Interface_Check
") ChangeValue;
		Handle_Interface_Check ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Interface_SequenceOfCheck
") Sequence;
		const Interface_SequenceOfCheck & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Interface_SequenceOfCheck
") ChangeSequence;
		Interface_SequenceOfCheck & ChangeSequence ();
};


%extend Interface_HSequenceOfCheck {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_HSequenceOfCheck(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_HSequenceOfCheck::Handle_Interface_HSequenceOfCheck %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_HSequenceOfCheck;
class Handle_Interface_HSequenceOfCheck : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_HSequenceOfCheck();
        Handle_Interface_HSequenceOfCheck(const Handle_Interface_HSequenceOfCheck &aHandle);
        Handle_Interface_HSequenceOfCheck(const Interface_HSequenceOfCheck *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_HSequenceOfCheck DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_HSequenceOfCheck {
    Interface_HSequenceOfCheck* _get_reference() {
    return (Interface_HSequenceOfCheck*)$self->Access();
    }
};

%extend Handle_Interface_HSequenceOfCheck {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_HSequenceOfCheck {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
class Interface_IndexedMapNodeOfIndexedMapOfAsciiString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
		%feature("autodoc", "	:param K1:
	:type K1: TCollection_AsciiString &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
		 Interface_IndexedMapNodeOfIndexedMapOfAsciiString (const TCollection_AsciiString & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key1;
		TCollection_AsciiString & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString::Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
class Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString();
        Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString(const Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString &aHandle);
        Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString(const Interface_IndexedMapNodeOfIndexedMapOfAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
    Interface_IndexedMapNodeOfIndexedMapOfAsciiString* _get_reference() {
    return (Interface_IndexedMapNodeOfIndexedMapOfAsciiString*)$self->Access();
    }
};

%extend Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_IndexedMapOfAsciiString;
class Interface_IndexedMapOfAsciiString : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Interface_IndexedMapOfAsciiString;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Interface_IndexedMapOfAsciiString;
		 Interface_IndexedMapOfAsciiString (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Interface_IndexedMapOfAsciiString;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_IndexedMapOfAsciiString &
	:rtype: None
") Interface_IndexedMapOfAsciiString;
		 Interface_IndexedMapOfAsciiString (const Interface_IndexedMapOfAsciiString & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_IndexedMapOfAsciiString &
	:rtype: Interface_IndexedMapOfAsciiString
") Assign;
		Interface_IndexedMapOfAsciiString & Assign (const Interface_IndexedMapOfAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_IndexedMapOfAsciiString &
	:rtype: Interface_IndexedMapOfAsciiString
") operator =;
		Interface_IndexedMapOfAsciiString & operator = (const Interface_IndexedMapOfAsciiString & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: int
") Add;
		Standard_Integer Add (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TCollection_AsciiString &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TCollection_AsciiString & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TCollection_AsciiString
") FindKey;
		const TCollection_AsciiString & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TCollection_AsciiString & K);
};


%extend Interface_IndexedMapOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_IntList;
class Interface_IntList {
	public:
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "	* Creates empty IntList.

	:rtype: None
") Interface_IntList;
		 Interface_IntList ();
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "	* Creates an IntList for <nbe> entities

	:param nbe:
	:type nbe: int
	:rtype: None
") Interface_IntList;
		 Interface_IntList (const Standard_Integer nbe);
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "	* Creates an IntList from another one. if <copied> is True, copies data else, data are not copied, only the header object is

	:param other:
	:type other: Interface_IntList &
	:param copied:
	:type copied: bool
	:rtype: None
") Interface_IntList;
		 Interface_IntList (const Interface_IntList & other,const Standard_Boolean copied);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize IntList by number of entities.

	:param nbe:
	:type nbe: int
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer nbe);
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "	* Returns internal values, used for copying

	:param nbrefs:
	:type nbrefs: int &
	:param ents:
	:type ents: Handle_TColStd_HArray1OfInteger &
	:param refs:
	:type refs: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") Internals;
		void Internals (Standard_Integer &OutValue,Handle_TColStd_HArray1OfInteger & ents,Handle_TColStd_HArray1OfInteger & refs);
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns count of entities to be aknowledged

	:rtype: int
") NbEntities;
		Standard_Integer NbEntities ();
		%feature("compactdefaultargs") SetNbEntities;
		%feature("autodoc", "	* Changes the count of entities (ignored if decreased)

	:param nbe:
	:type nbe: int
	:rtype: None
") SetNbEntities;
		void SetNbEntities (const Standard_Integer nbe);
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "	* Sets an entity number as current (for read and fill)

	:param number:
	:type number: int
	:rtype: None
") SetNumber;
		void SetNumber (const Standard_Integer number);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* Returns the current entity number

	:rtype: int
") Number;
		Standard_Integer Number ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	* Returns an IntList, identical to <self> but set to a specified entity Number By default, not copied (in order to be read) Specified <copied> to produce another list and edit it

	:param number:
	:type number: int
	:param copied: default value is Standard_False
	:type copied: bool
	:rtype: Interface_IntList
") List;
		Interface_IntList List (const Standard_Integer number,const Standard_Boolean copied = Standard_False);
		%feature("compactdefaultargs") SetRedefined;
		%feature("autodoc", "	* Sets current entity list to be redefined or not This is used in a Graph for redefinition list : it can be disable (no redefinition, i.e. list is cleared), or enabled (starts as empty). The original list has not to be 'redefined'

	:param mode:
	:type mode: bool
	:rtype: None
") SetRedefined;
		void SetRedefined (const Standard_Boolean mode);
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "	* Makes a reservation for <count> references to be later attached to the current entity. If required, it increases the size of array used to store refs. Remark that if count is less than two, it does nothing (because immediate storing)

	:param count:
	:type count: int
	:rtype: None
") Reservate;
		void Reservate (const Standard_Integer count);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a reference (as an integer value, an entity number) to the current entity number. Zero is ignored

	:param ref:
	:type ref: int
	:rtype: None
") Add;
		void Add (const Standard_Integer ref);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the count of refs attached to current entity number

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") IsRedefined;
		%feature("autodoc", "	* Returns True if the list for a number (default is taken as current) is 'redefined' (usefull for empty list)

	:param num: default value is 0
	:type num: int
	:rtype: bool
") IsRedefined;
		Standard_Boolean IsRedefined (const Standard_Integer num = 0);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns a reference number in the list for current number, according to its rank

	:param num:
	:type num: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer num);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an item in the list for current number, given its rank Returns True if done, False else

	:param num:
	:type num: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer num);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears all data, hence each entity number has an empty list

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") AdjustSize;
		%feature("autodoc", "	* Resizes lists to exact sizes. For list of refs, a positive margin can be added.

	:param margin: default value is 0
	:type margin: int
	:rtype: None
") AdjustSize;
		void AdjustSize (const Standard_Integer margin = 0);
};


%extend Interface_IntList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_IntVal;
class Interface_IntVal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_IntVal;
		%feature("autodoc", "	:rtype: None
") Interface_IntVal;
		 Interface_IntVal ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		Standard_Integer Value ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetCValue() {
                return (Standard_Integer) $self->CValue();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetCValue(Standard_Integer value ) {
                $self->CValue()=value;
                }
            };
            };


%extend Interface_IntVal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_IntVal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_IntVal::Handle_Interface_IntVal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_IntVal;
class Handle_Interface_IntVal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_IntVal();
        Handle_Interface_IntVal(const Handle_Interface_IntVal &aHandle);
        Handle_Interface_IntVal(const Interface_IntVal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_IntVal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_IntVal {
    Interface_IntVal* _get_reference() {
    return (Interface_IntVal*)$self->Access();
    }
};

%extend Handle_Interface_IntVal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_IntVal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_InterfaceModel;
class Interface_InterfaceModel : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Clears the list of entities (service WhenDelete)

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "	* Sets a Protocol for this Model It is also set by a call to AddWithRefs with Protocol It is used for : DumpHeader (as required), ClearEntities ...

	:param proto:
	:type proto: Handle_Interface_Protocol &
	:rtype: None
") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto);
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the Protocol which has been set by SetProtocol, or AddWithRefs with Protocol

	:rtype: Handle_Interface_Protocol
") Protocol;
		virtual Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") SetGTool;
		%feature("autodoc", "	* Sets a GTool for this model, which already defines a Protocol

	:param gtool:
	:type gtool: Handle_Interface_GTool &
	:rtype: None
") SetGTool;
		void SetGTool (const Handle_Interface_GTool & gtool);
		%feature("compactdefaultargs") GTool;
		%feature("autodoc", "	* Returns the GTool, set by SetProtocol or by SetGTool

	:rtype: Handle_Interface_GTool
") GTool;
		Handle_Interface_GTool GTool ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetDispatchStatus() {
                return (Standard_Boolean) $self->DispatchStatus();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetDispatchStatus(Standard_Boolean value ) {
                $self->DispatchStatus()=value;
                }
            };
            		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Erases contained data; used when a Model is copied to others : the new copied ones begin from clear Clear calls specific method ClearHeader (see below)

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "	* Clears the entities; uses the general service WhenDelete, in addition to the standard Memory Manager; can be redefined

	:rtype: void
") ClearEntities;
		virtual void ClearEntities ();
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "	* Erases informations about labels, if any : specific to each norm

	:rtype: void
") ClearLabels;
		virtual void ClearLabels ();
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "	* Clears Model's header : specific to each norm

	:rtype: void
") ClearHeader;
		virtual void ClearHeader ();
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns count of contained Entities

	:rtype: int
") NbEntities;
		Standard_Integer NbEntities ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns True if a Model contains an Entity (for a ReportEntity, looks for the ReportEntity itself AND its Concerned Entity)

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* Returns the Number of an Entity in the Model if it contains it. Else returns 0. For a ReportEntity, looks at Concerned Entity. Returns the Directory entry Number of an Entity in the Model if it contains it. Else returns 0. For a ReportEntity, looks at Concerned Entity.

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: int
") Number;
		Standard_Integer Number (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns an Entity identified by its number in the Model Each sub-class of InterfaceModel can define its own method Entity to return its specific class of Entity (e.g. for VDA, VDAModel returns a VDAEntity), working by calling Value Remark : For a Reported Entity, (Erroneous, Corrected, Unknown), this method returns this Reported Entity. See ReportEntity for other questions.

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer num);
		%feature("compactdefaultargs") NbTypes;
		%feature("autodoc", "	* Returns the count of DISTINCT types under which an entity may be processed. Defined by the Protocol, which gives default as 1 (dynamic Type).

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") NbTypes;
		Standard_Integer NbTypes (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns a type, given its rank : defined by the Protocol (by default, the first one)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param num: default value is 1
	:type num: int
	:rtype: Handle_Standard_Type
") Type;
		Handle_Standard_Type Type (const Handle_Standard_Transient & ent,const Standard_Integer num = 1);
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "	* Returns the type name of an entity, from the list of types (one or more ...) <complete> True (D) gives the complete type, else packages are removed WARNING : buffered, to be immediately copied or printed

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param complete: default value is Standard_True
	:type complete: bool
	:rtype: char *
") TypeName;
		const char * TypeName (const Handle_Standard_Transient & ent,const Standard_Boolean complete = Standard_True);
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "	* From a CDL Type Name, returns the Class part (package dropped) WARNING : buffered, to be immediately copied or printed

	:param typnam:
	:type typnam: char *
	:rtype: char *
") ClassName;
		static const char * ClassName (const char * typnam);
		%feature("compactdefaultargs") EntityState;
		%feature("autodoc", "	* Returns the State of an entity, given its number

	:param num:
	:type num: int
	:rtype: Interface_DataState
") EntityState;
		Interface_DataState EntityState (const Standard_Integer num);
		%feature("compactdefaultargs") IsReportEntity;
		%feature("autodoc", "	* Returns True if <num> identifies a ReportEntity in the Model Hence, ReportEntity can be called. //! By default, queries main report, if <semantic> is True, it queries report for semantic check //! Remember that a Report Entity can be defined for an Unknown Entity, or a Corrected or Erroneous (at read time) Entity. The ReportEntity is defined before call to method AddEntity.

	:param num:
	:type num: int
	:param semantic: default value is Standard_False
	:type semantic: bool
	:rtype: bool
") IsReportEntity;
		Standard_Boolean IsReportEntity (const Standard_Integer num,const Standard_Boolean semantic = Standard_False);
		%feature("compactdefaultargs") ReportEntity;
		%feature("autodoc", "	* Returns a ReportEntity identified by its number in the Model, or a Null Handle If <num> does not identify a ReportEntity. //! By default, queries main report, if <semantic> is True, it queries report for semantic check

	:param num:
	:type num: int
	:param semantic: default value is Standard_False
	:type semantic: bool
	:rtype: Handle_Interface_ReportEntity
") ReportEntity;
		Handle_Interface_ReportEntity ReportEntity (const Standard_Integer num,const Standard_Boolean semantic = Standard_False);
		%feature("compactdefaultargs") IsErrorEntity;
		%feature("autodoc", "	* Returns True if <num> identifies an Error Entity : in this case, a ReportEntity brings Fail Messages and possibly an 'undefined' Content, see IsRedefinedEntity

	:param num:
	:type num: int
	:rtype: bool
") IsErrorEntity;
		Standard_Boolean IsErrorEntity (const Standard_Integer num);
		%feature("compactdefaultargs") IsRedefinedContent;
		%feature("autodoc", "	* Returns True if <num> identifies an Entity which content is redefined through a ReportEntity (i.e. with literal data only) This happens when an entity is syntactically erroneous in the way that its basic content remains empty. For more details (such as content itself), see ReportEntity

	:param num:
	:type num: int
	:rtype: bool
") IsRedefinedContent;
		Standard_Boolean IsRedefinedContent (const Standard_Integer num);
		%feature("compactdefaultargs") ClearReportEntity;
		%feature("autodoc", "	* Removes the ReportEntity attached to Entity <num>. Returns True if done, False if no ReportEntity was attached to <num>. Warning : the caller must assume that this clearing is meaningfull

	:param num:
	:type num: int
	:rtype: bool
") ClearReportEntity;
		Standard_Boolean ClearReportEntity (const Standard_Integer num);
		%feature("compactdefaultargs") SetReportEntity;
		%feature("autodoc", "	* Sets or Replaces a ReportEntity for the Entity <num>. Returns True if Report is replaced, False if it has been replaced Warning : the caller must assume that this setting is meaningfull

	:param num:
	:type num: int
	:param rep:
	:type rep: Handle_Interface_ReportEntity &
	:rtype: bool
") SetReportEntity;
		Standard_Boolean SetReportEntity (const Standard_Integer num,const Handle_Interface_ReportEntity & rep);
		%feature("compactdefaultargs") AddReportEntity;
		%feature("autodoc", "	* Adds a ReportEntity as such. Returns False if the concerned entity is not recorded in the Model Else, adds it into, either the main report list or the list for semantic checks, then returns True

	:param rep:
	:type rep: Handle_Interface_ReportEntity &
	:param semantic: default value is Standard_False
	:type semantic: bool
	:rtype: bool
") AddReportEntity;
		Standard_Boolean AddReportEntity (const Handle_Interface_ReportEntity & rep,const Standard_Boolean semantic = Standard_False);
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "	* Returns True if <num> identifies an Unknown Entity : in this case, a ReportEntity with no Check Messages designates it.

	:param num:
	:type num: int
	:rtype: bool
") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity (const Standard_Integer num);
		%feature("compactdefaultargs") FillSemanticChecks;
		%feature("autodoc", "	* Fills the list of semantic checks. This list is computed (by CheckTool). Hence, it can be stored in the model for later queries <clear> True (D) : new list replaces <clear> False : new list is cumulated

	:param checks:
	:type checks: Interface_CheckIterator &
	:param clear: default value is Standard_True
	:type clear: bool
	:rtype: None
") FillSemanticChecks;
		void FillSemanticChecks (const Interface_CheckIterator & checks,const Standard_Boolean clear = Standard_True);
		%feature("compactdefaultargs") HasSemanticChecks;
		%feature("autodoc", "	* Returns True if semantic checks have been filled

	:rtype: bool
") HasSemanticChecks;
		Standard_Boolean HasSemanticChecks ();
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns the check attached to an entity, designated by its Number. 0 for global check <semantic> True : recorded semantic check <semantic> False : recorded syntactic check (see ReportEntity) If no check is recorded for <num>, returns an empty Check

	:param num:
	:type num: int
	:param syntactic:
	:type syntactic: bool
	:rtype: Handle_Interface_Check
") Check;
		Handle_Interface_Check Check (const Standard_Integer num,const Standard_Boolean syntactic);
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "	* Does a reservation for the List of Entities (for optimized storage management). If it is not called, storage management can be less efficient. <nbent> is the expected count of Entities to store

	:param nbent:
	:type nbent: int
	:rtype: void
") Reservate;
		virtual void Reservate (const Standard_Integer nbent);
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "	* Internal method for adding an Entity. Used by file reading (defined by each Interface) and Transfer tools. It adds the entity required to be added, not its refs : see AddWithRefs. If <anentity> is a ReportEntity, it is added to the list of Reports, its Concerned Entity (Erroneous or Corrected, else Unknown) is added to the list of Entities. That is, the ReportEntity must be created before Adding

	:param anentity:
	:type anentity: Handle_Standard_Transient &
	:rtype: void
") AddEntity;
		virtual void AddEntity (const Handle_Standard_Transient & anentity);
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "	* Adds to the Model, an Entity with all its References, as they are defined by General Services FillShared and ListImplied. Process is recursive (any sub-levels) if <level> = 0 (Default) Else, adds sub-entities until the required sub-level. Especially, if <level> = 1, adds immediate subs and that's all //! If <listall> is False (Default), an entity (<anentity> itself or one of its subs at any level) which is already recorded in the Model is not analysed, only the newly added ones are. If <listall> is True, all items are analysed (this allows to ensure the consistency of an adding made by steps)

	:param anent:
	:type anent: Handle_Standard_Transient &
	:param proto:
	:type proto: Handle_Interface_Protocol &
	:param level: default value is 0
	:type level: int
	:param listall: default value is Standard_False
	:type listall: bool
	:rtype: None
") AddWithRefs;
		void AddWithRefs (const Handle_Standard_Transient & anent,const Handle_Interface_Protocol & proto,const Standard_Integer level = 0,const Standard_Boolean listall = Standard_False);
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "	* Same as above, but works with the Protocol of the Model

	:param anent:
	:type anent: Handle_Standard_Transient &
	:param level: default value is 0
	:type level: int
	:param listall: default value is Standard_False
	:type listall: bool
	:rtype: None
") AddWithRefs;
		void AddWithRefs (const Handle_Standard_Transient & anent,const Standard_Integer level = 0,const Standard_Boolean listall = Standard_False);
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "	* Same as above, but works with an already created GeneralLib

	:param anent:
	:type anent: Handle_Standard_Transient &
	:param lib:
	:type lib: Interface_GeneralLib &
	:param level: default value is 0
	:type level: int
	:param listall: default value is Standard_False
	:type listall: bool
	:rtype: None
") AddWithRefs;
		void AddWithRefs (const Handle_Standard_Transient & anent,const Interface_GeneralLib & lib,const Standard_Integer level = 0,const Standard_Boolean listall = Standard_False);
		%feature("compactdefaultargs") ReplaceEntity;
		%feature("autodoc", "	* Replace Entity with Number=nument on other entity - 'anent'

	:param nument:
	:type nument: int
	:param anent:
	:type anent: Handle_Standard_Transient &
	:rtype: None
") ReplaceEntity;
		void ReplaceEntity (const Standard_Integer nument,const Handle_Standard_Transient & anent);
		%feature("compactdefaultargs") ReverseOrders;
		%feature("autodoc", "	* Reverses the Numbers of the Entities, between <after> and the total count of Entities. Thus, the entities : 1,2 ... after, after+1 ... nb-1, nb become numbered as : 1,2 ... after, nb, nb-1 ... after+1 By default (after = 0) the whole list of Entities is reversed

	:param after: default value is 0
	:type after: int
	:rtype: None
") ReverseOrders;
		void ReverseOrders (const Standard_Integer after = 0);
		%feature("compactdefaultargs") ChangeOrder;
		%feature("autodoc", "	* Changes the Numbers of some Entities : <oldnum> is moved to <newnum>, same for <count> entities. Thus : 1,2 ... newnum-1 newnum ... oldnum .. oldnum+count oldnum+count+1 .. gives 1,2 ... newnum-1 oldnum .. oldnum+count newnum ... oldnum+count+1 (can be seen as a circular permutation)

	:param oldnum:
	:type oldnum: int
	:param newnum:
	:type newnum: int
	:param count: default value is 1
	:type count: int
	:rtype: None
") ChangeOrder;
		void ChangeOrder (const Standard_Integer oldnum,const Standard_Integer newnum,const Standard_Integer count = 1);
		%feature("compactdefaultargs") GetFromTransfer;
		%feature("autodoc", "	* Gets contents from an EntityIterator, prepared by a Transfer tool (e.g TransferCopy). Starts from clear

	:param aniter:
	:type aniter: Interface_EntityIterator &
	:rtype: None
") GetFromTransfer;
		void GetFromTransfer (const Interface_EntityIterator & aniter);
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "	* Gets header (data specific of a defined Interface) from another InterfaceModel; called from TransferCopy

	:param other:
	:type other: Handle_Interface_InterfaceModel &
	:rtype: void
") GetFromAnother;
		virtual void GetFromAnother (const Handle_Interface_InterfaceModel & other);
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "	* Returns a New Empty Model, same type as <self> (whatever its Type); called to Copy parts a Model into other ones, then followed by a call to GetFromAnother (Header) then filling with specified Entities, themselves copied

	:rtype: Handle_Interface_InterfaceModel
") NewEmptyModel;
		virtual Handle_Interface_InterfaceModel NewEmptyModel ();
		%feature("compactdefaultargs") SetCategoryNumber;
		%feature("autodoc", "	* Records a category number for an entity number Returns True when done, False if <num> is out of range

	:param num:
	:type num: int
	:param val:
	:type val: int
	:rtype: bool
") SetCategoryNumber;
		Standard_Boolean SetCategoryNumber (const Standard_Integer num,const Standard_Integer val);
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "	* Returns the recorded category number for a given entity number 0 if none was defined for this entity

	:param num:
	:type num: int
	:rtype: int
") CategoryNumber;
		Standard_Integer CategoryNumber (const Standard_Integer num);
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* Allows an EntityIterator to get a list of Entities

	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") FillIterator;
		void FillIterator (Interface_EntityIterator & iter);
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "	* Returns the list of all Entities, as an Iterator on Entities (the Entities themselves, not the Reports)

	:rtype: Interface_EntityIterator
") Entities;
		Interface_EntityIterator Entities ();
		%feature("compactdefaultargs") Reports;
		%feature("autodoc", "	* Returns the list of all ReportEntities, i.e. data about Entities read with Error or Warning informations (each item has to be casted to Report Entity then it can be queried for Concerned Entity, Content, Check ...) By default, returns the main reports, is <semantic> is True it returns the list for sematic checks

	:param semantic: default value is Standard_False
	:type semantic: bool
	:rtype: Interface_EntityIterator
") Reports;
		Interface_EntityIterator Reports (const Standard_Boolean semantic = Standard_False);
		%feature("compactdefaultargs") Redefineds;
		%feature("autodoc", "	* Returns the list of ReportEntities which redefine data (generally, if concerned entity is 'Error', a literal content is added to it : this is a 'redefined entity'

	:rtype: Interface_EntityIterator
") Redefineds;
		Interface_EntityIterator Redefineds ();
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "	* Returns the GlobalCheck, which memorizes messages global to the file (not specific to an Entity), especially Header

	:param syntactic: default value is Standard_True
	:type syntactic: bool
	:rtype: Handle_Interface_Check
") GlobalCheck;
		Handle_Interface_Check GlobalCheck (const Standard_Boolean syntactic = Standard_True);
		%feature("compactdefaultargs") SetGlobalCheck;
		%feature("autodoc", "	* Allows to modify GlobalCheck, after getting then completing it Remark : it is SYNTACTIC check. Semantics, see FillChecks

	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: None
") SetGlobalCheck;
		void SetGlobalCheck (const Handle_Interface_Check & ach);
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "	* Minimum Semantic Global Check on data in model (header) Can only check basic Data. See also GlobalCheck from Protocol for a check which takes the Graph into account Default does nothing, can be redefined

	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: void
") VerifyCheck;
		virtual void VerifyCheck (Handle_Interface_Check & ach);
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "	* Dumps Header in a short, easy to read, form, onto a Stream <level> allows to print more or less parts of the header, if necessary. 0 for basic print

	:param S:
	:type S: Handle_Message_Messenger &
	:param level: default value is 0
	:type level: int
	:rtype: void
") DumpHeader;
		virtual void DumpHeader (const Handle_Message_Messenger & S,const Standard_Integer level = 0);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints identification of a given entity in <self>, in order to be printed in a list or phrase <mode> < 0 : prints only its number <mode> = 1 : just calls PrintLabel <mode> = 0 (D) : prints its number plus '/' plus PrintLabel If <ent> == <self>, simply prints 'Global' If <ent> is unknown, prints '/its type'

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param s:
	:type s: Handle_Message_Messenger &
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") Print;
		void Print (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & s,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "	* Prints label specific to each norm, for a given entity. Must only print label itself, in order to be included in a phrase. Can call the result of StringLabel, but not obliged.

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintLabel;
		virtual void PrintLabel (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") PrintToLog;
		%feature("autodoc", "	* Prints label specific to each norm in log format, for a given entity. By default, just calls PrintLabel, can be redefined

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintToLog;
		virtual void PrintToLog (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "	* Returns a string with the label attached to a given entity. Warning : While this string may be edited on the spot, if it is a read field, the returned value must be copied before.

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TCollection_HAsciiString
") StringLabel;
		virtual Handle_TCollection_HAsciiString StringLabel (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NextNumberForLabel;
		%feature("autodoc", "	* Searches a label which matches with one entity. Begins from <lastnum>+1 (default:1) and scans the entities until <NbEntities>. For the first which matches <label>, this method returns its Number. Returns 0 if nothing found Can be called recursively (labels are not specified as unique) <exact> : if True (default), exact match is required else, checks the END of entity label //! This method is virtual, hence it can be redefined for a more efficient search (if exact is true).

	:param label:
	:type label: char *
	:param lastnum: default value is 0
	:type lastnum: int
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: int
") NextNumberForLabel;
		virtual Standard_Integer NextNumberForLabel (const char * label,const Standard_Integer lastnum = 0,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") HasTemplate;
		%feature("autodoc", "	* Returns true if a template is attached to a given name

	:param name:
	:type name: char *
	:rtype: bool
") HasTemplate;
		static Standard_Boolean HasTemplate (const char * name);
		%feature("compactdefaultargs") Template;
		%feature("autodoc", "	* Returns the template model attached to a name, or a Null Handle

	:param name:
	:type name: char *
	:rtype: Handle_Interface_InterfaceModel
") Template;
		static Handle_Interface_InterfaceModel Template (const char * name);
		%feature("compactdefaultargs") SetTemplate;
		%feature("autodoc", "	* Records a new template model with a name. If the name was already recorded, the corresponding template is replaced by the new one. Then, WARNING : test HasTemplate to avoid surprises

	:param name:
	:type name: char *
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") SetTemplate;
		static Standard_Boolean SetTemplate (const char * name,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ListTemplates;
		%feature("autodoc", "	* Returns the complete list of names attached to template models

	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") ListTemplates;
		static Handle_TColStd_HSequenceOfHAsciiString ListTemplates ();
};


%extend Interface_InterfaceModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_InterfaceModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_InterfaceModel::Handle_Interface_InterfaceModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_InterfaceModel;
class Handle_Interface_InterfaceModel : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_InterfaceModel();
        Handle_Interface_InterfaceModel(const Handle_Interface_InterfaceModel &aHandle);
        Handle_Interface_InterfaceModel(const Interface_InterfaceModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_InterfaceModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_InterfaceModel {
    Interface_InterfaceModel* _get_reference() {
    return (Interface_InterfaceModel*)$self->Access();
    }
};

%extend Handle_Interface_InterfaceModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_InterfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_LineBuffer;
class Interface_LineBuffer {
	public:
		%feature("compactdefaultargs") Interface_LineBuffer;
		%feature("autodoc", "	* Creates a LineBuffer with an absolute maximum size (Default value is only to satisfy compiler requirement)

	:param size: default value is 10
	:type size: int
	:rtype: None
") Interface_LineBuffer;
		 Interface_LineBuffer (const Standard_Integer size = 10);
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "	* Changes Maximum allowed size of Buffer. If <max> is Zero, Maximum size is set to the initial size.

	:param max:
	:type max: int
	:rtype: None
") SetMax;
		void SetMax (const Standard_Integer max);
		%feature("compactdefaultargs") SetInitial;
		%feature("autodoc", "	* Sets an Initial reservation for Blank characters (this reservation is counted in the size of the current Line)

	:param initial:
	:type initial: int
	:rtype: None
") SetInitial;
		void SetInitial (const Standard_Integer initial);
		%feature("compactdefaultargs") SetKeep;
		%feature("autodoc", "	* Sets a Keep Status at current Length. It means that at next Move, the new line will begin by characters between Keep + 1 and current Length

	:rtype: None
") SetKeep;
		void SetKeep ();
		%feature("compactdefaultargs") CanGet;
		%feature("autodoc", "	* Returns True if there is room enough to add <more> characters Else, it is required to Dump the Buffer before refilling it <more> is recorded to manage SetKeep status

	:param more:
	:type more: int
	:rtype: bool
") CanGet;
		Standard_Boolean CanGet (const Standard_Integer more);
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "	* Returns the Content of the LineBuffer was C++ : return const

	:rtype: char *
") Content;
		const char * Content ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the Length of the LineBuffer

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears completely the LineBuffer

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") FreezeInitial;
		%feature("autodoc", "	* Inhibits effect of SetInitial until the next Move (i.e. Keep) Then Prepare will not insert initial blanks, but further ones will. This allows to cancel initial blanks on an internal Split A call to SetInitial has no effect on this until Move

	:rtype: None
") FreezeInitial;
		void FreezeInitial ();
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Fills a AsciiString <str> with the Content of the Line Buffer, then Clears the LineBuffer

	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Move;
		void Move (TCollection_AsciiString & str);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Same as above, but <str> is known through a Handle

	:param str:
	:type str: Handle_TCollection_HAsciiString &
	:rtype: None
") Move;
		void Move (const Handle_TCollection_HAsciiString & str);
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "	* Same as above, but generates the HAsciiString

	:rtype: Handle_TCollection_HAsciiString
") Moved;
		Handle_TCollection_HAsciiString Moved ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a text as a CString. Its Length is evaluated from the text (by C function strlen)

	:param text:
	:type text: char *
	:rtype: None
") Add;
		void Add (const char * text);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a text as a CString. Its length is given as <lntext>

	:param text:
	:type text: char *
	:param lntext:
	:type lntext: int
	:rtype: None
") Add;
		void Add (const char * text,const Standard_Integer lntext);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a text as a AsciiString from TCollection

	:param text:
	:type text: TCollection_AsciiString &
	:rtype: None
") Add;
		void Add (const TCollection_AsciiString & text);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a text made of only ONE Character

	:param text:
	:type text: Standard_Character
	:rtype: None
") Add;
		void Add (const Standard_Character text);
};


%extend Interface_LineBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_MSG;
class Interface_MSG {
	public:
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "	* A MSG is created to write a 'functional code' in conjunction with operator () attached to Value Then, to have a translated message, write in C++ : //! Interface_MSG('...mykey...') which returns a CString See also some help which follow

	:param key:
	:type key: char *
	:rtype: None
") Interface_MSG;
		 Interface_MSG (const char * key);
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "	* Translates a message which contains one integer variable It is just a help which avoid the following : char mess[100]; sprintf(mess,Interface_MSG('code'),ival); then AddFail(mess); replaced by AddFail (Interface_MSG('code',ival)); //! The basic message is intended to be in C-sprintf format, with one %d form in it

	:param key:
	:type key: char *
	:param i1:
	:type i1: int
	:rtype: None
") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Integer i1);
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "	* Translates a message which contains two integer variables As for one integer, it is just a writing help //! The basic message is intended to be in C-sprintf format with two %d forms in it

	:param key:
	:type key: char *
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:rtype: None
") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Integer i1,const Standard_Integer i2);
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "	* Translates a message which contains one real variable <intervals> if set, commands the variable to be rounded to an interval (see below, method Intervals) As for one integer, it is just a writing help //! The basic message is intended to be in C-sprintf format with one %f form (or equivalent : %e etc) in it

	:param key:
	:type key: char *
	:param r1:
	:type r1: float
	:param intervals: default value is -1
	:type intervals: int
	:rtype: None
") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Real r1,const Standard_Integer intervals = -1);
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "	* Translates a message which contains one string variable As for one integer, it is just a writing help //! The basic message is intended to be in C-sprintf format with one %s form in it

	:param key:
	:type key: char *
	:param str:
	:type str: char *
	:rtype: None
") Interface_MSG;
		 Interface_MSG (const char * key,const char * str);
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "	* Translates a message which contains one integer and one string variables As for one integer, it is just a writing help Used for instance to say 'Param n0.<ival> i.e. <str> is not..' //! The basic message is intended to be in C-sprintf format with one %d then one %s forms in it

	:param key:
	:type key: char *
	:param ival:
	:type ival: int
	:param str:
	:type str: char *
	:rtype: None
") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Integer ival,const char * str);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Optimised destructor (applies for additional forms of Create)

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the translated message, in a functional form with operator () was C++ : return const

	:rtype: char *
") Value;
		const char * Value ();
		%feature("compactdefaultargs") operator Standard_CString;
		%feature("autodoc", "	:rtype: None
") operator Standard_CString;
		 operator Standard_CString ();

        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Reads a list of messages from a file defined by its name

	:param file:
	:type file: char *
	:rtype: int
") Read;
		static Standard_Integer Read (const char * file);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the list of messages recorded to be translated, to a stream. Writes all the list (Default) or only keys which begin by <rootkey>. Returns the count of written messages

	:param S:
	:type S: Standard_OStream &
	:param rootkey: default value is ""
	:type rootkey: char *
	:rtype: int
") Write;
		static Standard_Integer Write (Standard_OStream & S,const char * rootkey = "");
		%feature("compactdefaultargs") IsKey;
		%feature("autodoc", "	* Returns True if a given message is surely a key (according to the form adopted for keys) (before activating messages, answer is false)

	:param mess:
	:type mess: char *
	:rtype: bool
") IsKey;
		static Standard_Boolean IsKey (const char * mess);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Returns the item recorded for a key. Returns the key itself if : - it is not recorded (then, the trace system is activated) - MSG has been required to be hung on

	:param key:
	:type key: char *
	:rtype: char *
") Translated;
		static const char * Translated (const char * key);
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "	* Fills the dictionary with a couple (key-item) If a key is already recorded, it is possible to : - keep the last definition, and activate the trace system

	:param key:
	:type key: char *
	:param item:
	:type item: char *
	:rtype: void
") Record;
		static void Record (const char * key,const char * item);
		%feature("compactdefaultargs") SetTrace;
		%feature("autodoc", "	* Sets the trace system to work when activated, as follow : - if <toprint> is True, print immediately on standard output - if <torecord> is True, record it for further print

	:param toprint:
	:type toprint: bool
	:param torecord:
	:type torecord: bool
	:rtype: void
") SetTrace;
		static void SetTrace (const Standard_Boolean toprint,const Standard_Boolean torecord);
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	* Sets the main modes for MSG : - if <running> is True, translation works normally - if <running> is False, translated item equate keys - if <raising> is True, errors (from Record or Translate) cause MSG to raise an exception - if <raising> is False, MSG runs without exception, then see also Trace Modes above

	:param running:
	:type running: bool
	:param raising:
	:type raising: bool
	:rtype: void
") SetMode;
		static void SetMode (const Standard_Boolean running,const Standard_Boolean raising);

        %feature("autodoc", "1");
        %extend{
            std::string PrintTraceToString() {
            std::stringstream s;
            self->PrintTrace(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Intervalled;
		%feature("autodoc", "	* Returns an 'intervalled' value from a starting real <val> : i.e. a value which is rounded on an interval limit Interval limits are defined to be in a coarsely 'geometric' progression (two successive intervals are inside a limit ratio) //! <order> gives the count of desired intervals in a range <1-10> <upper> False, returns the first lower interval (D) <upper> True, returns the first upper interval Values of Intervals according <order> : 0,1 : 1 10 100 ... 2 : 1 3 10 30 100 ... 3(D): 1 2 5 10 20 50 100 ... 4 : 1 2 3 6 10 20 30 60 100 ... 6 : 1 1.5 2 3 5 7 10 15 20 ... 10 : 1 1.2 1.5 2 2.5 3 4 5 6 8 10 12 15 20 25 ...

	:param val:
	:type val: float
	:param order: default value is 3
	:type order: int
	:param upper: default value is Standard_False
	:type upper: bool
	:rtype: float
") Intervalled;
		static Standard_Real Intervalled (const Standard_Real val,const Standard_Integer order = 3,const Standard_Boolean upper = Standard_False);
		%feature("compactdefaultargs") TDate;
		%feature("autodoc", "	* Codes a date as a text, from its numeric value (-> seconds) : YYYY-MM-DD:HH-MN-SS fixed format, completed by leading zeros Another format can be provided, as follows : C:%d ... C like format, preceeded by C: S:... format to call system (not yet implemented)

	:param text:
	:type text: char *
	:param yy:
	:type yy: int
	:param mm:
	:type mm: int
	:param dd:
	:type dd: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:param format: default value is ""
	:type format: char *
	:rtype: void
") TDate;
		static void TDate (const char * text,const Standard_Integer yy,const Standard_Integer mm,const Standard_Integer dd,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const char * format = "");
		%feature("compactdefaultargs") NDate;
		%feature("autodoc", "	* Decodes a date to numeric integer values Returns True if OK, False if text does not fit with required format. Incomplete forms are allowed (for instance, for only YYYY-MM-DD, hour is zero)

	:param text:
	:type text: char *
	:param yy:
	:type yy: int &
	:param mm:
	:type mm: int &
	:param dd:
	:type dd: int &
	:param hh:
	:type hh: int &
	:param mn:
	:type mn: int &
	:param ss:
	:type ss: int &
	:rtype: bool
") NDate;
		static Standard_Boolean NDate (const char * text,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") CDate;
		%feature("autodoc", "	* Returns a value about comparison of two dates 0 : equal. <0 text1 anterior. >0 text1 posterior

	:param text1:
	:type text1: char *
	:param text2:
	:type text2: char *
	:rtype: int
") CDate;
		static Standard_Integer CDate (const char * text1,const char * text2);
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "	* Returns a blank string, of length between 0 and <max>, to fill the printing of a numeric value <val>, i.e. : If val < 10 , max-1 blanks If val between 10 and 99, max-2 blanks ... etc...

	:param val:
	:type val: int
	:param max:
	:type max: int
	:rtype: char *
") Blanks;
		static const char * Blanks (const Standard_Integer val,const Standard_Integer max);
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "	* Returns a blank string, to complete a given string <val> up to <max> characters : If strlen(val) is 0, max blanks If strlen(val) is 5, max-5 blanks etc...

	:param val:
	:type val: char *
	:param max:
	:type max: int
	:rtype: char *
") Blanks;
		static const char * Blanks (const char * val,const Standard_Integer max);
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "	* Returns a blank string of <count> blanks (mini 0, maxi 76)

	:param count:
	:type count: int
	:rtype: char *
") Blanks;
		static const char * Blanks (const Standard_Integer count);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints a String on an Output Stream, as follows : Accompagned with blanks, to give up to <max> charis at all, justified according just : -1 (D) : left 0 : center 1 : right Maximum 76 characters

	:param S:
	:type S: Standard_OStream &
	:param val:
	:type val: char *
	:param max:
	:type max: int
	:param just: default value is -1
	:type just: int
	:rtype: void
") Print;
		static void Print (Standard_OStream & S,const char * val,const Standard_Integer max,const Standard_Integer just = -1);
};


%extend Interface_MSG {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Interface_MapAsciiStringHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TCollection_AsciiString & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: TCollection_AsciiString &
	:param K2:
	:type K2: TCollection_AsciiString &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const TCollection_AsciiString & K1,const TCollection_AsciiString & K2);
};


%extend Interface_MapAsciiStringHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_NodeOfGeneralLib;
class Interface_NodeOfGeneralLib : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_NodeOfGeneralLib;
		%feature("autodoc", "	:rtype: None
") Interface_NodeOfGeneralLib;
		 Interface_NodeOfGeneralLib ();
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	:param anode:
	:type anode: Handle_Interface_GlobalNodeOfGeneralLib &
	:rtype: None
") AddNode;
		void AddNode (const Handle_Interface_GlobalNodeOfGeneralLib & anode);
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "	:rtype: Handle_Interface_GeneralModule
") Module;
		Handle_Interface_GeneralModule Module ();
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Interface_NodeOfGeneralLib
") Next;
		Handle_Interface_NodeOfGeneralLib Next ();
};


%extend Interface_NodeOfGeneralLib {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_NodeOfGeneralLib(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_NodeOfGeneralLib::Handle_Interface_NodeOfGeneralLib %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_NodeOfGeneralLib;
class Handle_Interface_NodeOfGeneralLib : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_NodeOfGeneralLib();
        Handle_Interface_NodeOfGeneralLib(const Handle_Interface_NodeOfGeneralLib &aHandle);
        Handle_Interface_NodeOfGeneralLib(const Interface_NodeOfGeneralLib *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_NodeOfGeneralLib DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_NodeOfGeneralLib {
    Interface_NodeOfGeneralLib* _get_reference() {
    return (Interface_NodeOfGeneralLib*)$self->Access();
    }
};

%extend Handle_Interface_NodeOfGeneralLib {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_NodeOfGeneralLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_NodeOfReaderLib;
class Interface_NodeOfReaderLib : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_NodeOfReaderLib;
		%feature("autodoc", "	:rtype: None
") Interface_NodeOfReaderLib;
		 Interface_NodeOfReaderLib ();
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	:param anode:
	:type anode: Handle_Interface_GlobalNodeOfReaderLib &
	:rtype: None
") AddNode;
		void AddNode (const Handle_Interface_GlobalNodeOfReaderLib & anode);
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "	:rtype: Handle_Interface_ReaderModule
") Module;
		Handle_Interface_ReaderModule Module ();
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Interface_NodeOfReaderLib
") Next;
		Handle_Interface_NodeOfReaderLib Next ();
};


%extend Interface_NodeOfReaderLib {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_NodeOfReaderLib(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_NodeOfReaderLib::Handle_Interface_NodeOfReaderLib %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_NodeOfReaderLib;
class Handle_Interface_NodeOfReaderLib : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_NodeOfReaderLib();
        Handle_Interface_NodeOfReaderLib(const Handle_Interface_NodeOfReaderLib &aHandle);
        Handle_Interface_NodeOfReaderLib(const Interface_NodeOfReaderLib *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_NodeOfReaderLib DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_NodeOfReaderLib {
    Interface_NodeOfReaderLib* _get_reference() {
    return (Interface_NodeOfReaderLib*)$self->Access();
    }
};

%extend Handle_Interface_NodeOfReaderLib {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_NodeOfReaderLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_ParamList;
class Interface_ParamList : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_ParamList;
		%feature("autodoc", "	* Creates an vector with size of memmory blok equal to theIncrement

	:param theIncrement: default value is 256
	:type theIncrement: int
	:rtype: None
") Interface_ParamList;
		 Interface_ParamList (const Standard_Integer theIncrement = 256);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements of <self>.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower bound. Warning

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper bound. Warning

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Assigns the value <Value> to the <Index>-th item of this array.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: Interface_FileParameter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Interface_FileParameter & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: Interface_FileParameter
") Value;
		const Interface_FileParameter & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* return the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: Interface_FileParameter
") ChangeValue;
		Interface_FileParameter & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%extend Interface_ParamList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_ParamList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_ParamList::Handle_Interface_ParamList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_ParamList;
class Handle_Interface_ParamList : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_ParamList();
        Handle_Interface_ParamList(const Handle_Interface_ParamList &aHandle);
        Handle_Interface_ParamList(const Interface_ParamList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_ParamList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ParamList {
    Interface_ParamList* _get_reference() {
    return (Interface_ParamList*)$self->Access();
    }
};

%extend Handle_Interface_ParamList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_ParamList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_ParamSet;
class Interface_ParamSet : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_ParamSet;
		%feature("autodoc", "	* Creates an empty ParamSet, beginning at number 'nst' and of initial reservation 'nres' : the 'nres' first parameters which follow 'ndeb' (included) will be put in an Array (a ParamList). The remainders are set in Next(s) ParamSet(s)

	:param nres:
	:type nres: int
	:param nst: default value is 1
	:type nst: int
	:rtype: None
") Interface_ParamSet;
		 Interface_ParamSet (const Standard_Integer nres,const Standard_Integer nst = 1);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Adds a parameter defined as its Value (CString and length) and Type. Optionnal EntityNumber (for FileReaderData) can be given Allows a better memory management than Appending a complete FileParameter If <lnval> < 0, <val> is assumed to be managed elsewhere : its adress is stored as such. Else, <val> is copied in a locally (quickly) managed Page of Characters Returns new count of recorded Parameters

	:param val:
	:type val: char *
	:param lnval:
	:type lnval: int
	:param typ:
	:type typ: Interface_ParamType
	:param nument:
	:type nument: int
	:rtype: int
") Append;
		Standard_Integer Append (const char * val,const Standard_Integer lnval,const Interface_ParamType typ,const Standard_Integer nument);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Adds a parameter at the end of the ParamSet (transparent about reservation and 'Next') Returns new count of recorded Parameters

	:param FP:
	:type FP: Interface_FileParameter &
	:rtype: int
") Append;
		Standard_Integer Append (const Interface_FileParameter & FP);
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "	* Returns the total count of parameters (including nexts)

	:rtype: int
") NbParams;
		Standard_Integer NbParams ();
		%feature("compactdefaultargs") Param;
		%feature("autodoc", "	* Returns a parameter identified by its number

	:param num:
	:type num: int
	:rtype: Interface_FileParameter
") Param;
		const Interface_FileParameter & Param (const Standard_Integer num);
		%feature("compactdefaultargs") ChangeParam;
		%feature("autodoc", "	* Same as above, but in order to be modified on place

	:param num:
	:type num: int
	:rtype: Interface_FileParameter
") ChangeParam;
		Interface_FileParameter & ChangeParam (const Standard_Integer num);
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "	* Changes a parameter identified by its number

	:param num:
	:type num: int
	:param FP:
	:type FP: Interface_FileParameter &
	:rtype: None
") SetParam;
		void SetParam (const Standard_Integer num,const Interface_FileParameter & FP);
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "	* Builds and returns the sub-list correspinding to parameters, from 'num' included, with count 'nb' If <num> and <nb> are zero, returns the whole list

	:param num:
	:type num: int
	:param nb:
	:type nb: int
	:rtype: Handle_Interface_ParamList
") Params;
		Handle_Interface_ParamList Params (const Standard_Integer num,const Standard_Integer nb);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Destructor (waiting for transparent memory management)

	:rtype: None
") Destroy;
		void Destroy ();
};


%extend Interface_ParamSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_ParamSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_ParamSet::Handle_Interface_ParamSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_ParamSet;
class Handle_Interface_ParamSet : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_ParamSet();
        Handle_Interface_ParamSet(const Handle_Interface_ParamSet &aHandle);
        Handle_Interface_ParamSet(const Interface_ParamSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_ParamSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ParamSet {
    Interface_ParamSet* _get_reference() {
    return (Interface_ParamSet*)$self->Access();
    }
};

%extend Handle_Interface_ParamSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_ParamSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_Protocol;
class Interface_Protocol : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Active;
		%feature("autodoc", "	* Returns the Active Protocol, if defined (else, returns a Null Handle, which means 'no defined active protocol')

	:rtype: Handle_Interface_Protocol
") Active;
		static Handle_Interface_Protocol Active ();
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "	* Sets a given Protocol to be the Active one (for the users of Active, see just above). Applies to every sub-type of Protocol

	:param aprotocol:
	:type aprotocol: Handle_Interface_Protocol &
	:rtype: void
") SetActive;
		static void SetActive (const Handle_Interface_Protocol & aprotocol);
		%feature("compactdefaultargs") ClearActive;
		%feature("autodoc", "	* Erases the Active Protocol (hence it becomes undefined)

	:rtype: void
") ClearActive;
		static void ClearActive ();
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "	* Returns count of Protocol used as Resources (level one)

	:rtype: int
") NbResources;
		virtual Standard_Integer NbResources ();
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "	* Returns a Resource, given its rank (between 1 and NbResources)

	:param num:
	:type num: int
	:rtype: Handle_Interface_Protocol
") Resource;
		virtual Handle_Interface_Protocol Resource (const Standard_Integer num);
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "	* Returns a unique positive CaseNumber for each Recognized Object. By default, recognition is based on Type(1) By default, calls the following one which is deferred.

	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: int
") CaseNumber;
		virtual Standard_Integer CaseNumber (const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") IsDynamicType;
		%feature("autodoc", "	* Returns True if type of <obj> is that defined from CDL This is the default but it may change according implementation

	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: bool
") IsDynamicType;
		virtual Standard_Boolean IsDynamicType (const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") NbTypes;
		%feature("autodoc", "	* Returns the count of DISTINCT types under which an entity may be processed. Each one is candidate to be recognized by TypeNumber, <obj> is then processed according it By default, returns 1 (the DynamicType)

	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: int
") NbTypes;
		virtual Standard_Integer NbTypes (const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns a type under which <obj> can be recognized and processed, according its rank in its definition list (see NbTypes). By default, returns DynamicType

	:param obj:
	:type obj: Handle_Standard_Transient &
	:param nt: default value is 1
	:type nt: int
	:rtype: Handle_Standard_Type
") Type;
		Handle_Standard_Type Type (const Handle_Standard_Transient & obj,const Standard_Integer nt = 1);
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "	* Returns a unique positive CaseNumber for each Recognized Type, Returns Zero for '<type> not recognized'

	:param atype:
	:type atype: Handle_Standard_Type &
	:rtype: int
") TypeNumber;
		virtual Standard_Integer TypeNumber (const Handle_Standard_Type & atype);
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "	* Evaluates a Global Check for a model (with its Graph) Returns True when done, False if data in model do not apply //! Very specific of each norm, i.e. of each protocol : the uppest level Protocol assumes it, it can call GlobalCheck of its ressources only if it is necessary //! Default does nothing, can be redefined

	:param G:
	:type G: Interface_Graph &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: bool
") GlobalCheck;
		virtual Standard_Boolean GlobalCheck (const Interface_Graph & G,Handle_Interface_Check & ach);
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "	* Creates an empty Model of the considered Norm

	:rtype: Handle_Interface_InterfaceModel
") NewModel;
		virtual Handle_Interface_InterfaceModel NewModel ();
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "	* Returns True if <model> is a Model of the considered Norm

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") IsSuitableModel;
		virtual Standard_Boolean IsSuitableModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "	* Creates a new Unknown Entity for the considered Norm

	:rtype: Handle_Standard_Transient
") UnknownEntity;
		virtual Handle_Standard_Transient UnknownEntity ();
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "	* Returns True if <ent> is an Unknown Entity for the Norm, i.e. same Type as them created by method UnknownEntity (for an Entity out of the Norm, answer can be unpredicable)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsUnknownEntity;
		virtual Standard_Boolean IsUnknownEntity (const Handle_Standard_Transient & ent);
};


%extend Interface_Protocol {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_Protocol(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_Protocol::Handle_Interface_Protocol %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_Protocol;
class Handle_Interface_Protocol : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_Protocol();
        Handle_Interface_Protocol(const Handle_Interface_Protocol &aHandle);
        Handle_Interface_Protocol(const Interface_Protocol *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_Protocol DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_Protocol {
    Interface_Protocol* _get_reference() {
    return (Interface_Protocol*)$self->Access();
    }
};

%extend Handle_Interface_Protocol {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Interface_ReaderLib {
	public:
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "	:param amodule:
	:type amodule: Handle_Interface_ReaderModule &
	:param aprotocol:
	:type aprotocol: Handle_Interface_Protocol &
	:rtype: void
") SetGlobal;
		static void SetGlobal (const Handle_Interface_ReaderModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("compactdefaultargs") Interface_ReaderLib;
		%feature("autodoc", "	:param aprotocol:
	:type aprotocol: Handle_Interface_Protocol &
	:rtype: None
") Interface_ReaderLib;
		 Interface_ReaderLib (const Handle_Interface_Protocol & aprotocol);
		%feature("compactdefaultargs") Interface_ReaderLib;
		%feature("autodoc", "	:rtype: None
") Interface_ReaderLib;
		 Interface_ReaderLib ();
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "	:param aprotocol:
	:type aprotocol: Handle_Standard_Transient &
	:rtype: None
") AddProtocol;
		void AddProtocol (const Handle_Standard_Transient & aprotocol);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "	:rtype: None
") SetComplete;
		void SetComplete ();
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	:param obj:
	:type obj: Handle_Standard_Transient &
	:param module:
	:type module: Handle_Interface_ReaderModule &
	:param CN:
	:type CN: int &
	:rtype: bool
") Select;
		Standard_Boolean Select (const Handle_Standard_Transient & obj,Handle_Interface_ReaderModule & module,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	:rtype: None
") Start;
		void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "	:rtype: Handle_Interface_ReaderModule
") Module;
		Handle_Interface_ReaderModule Module ();
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
};


%extend Interface_ReaderLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_ReaderModule;
class Interface_ReaderModule : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Translates the type of record <num> in <data> to a positive Case Number. If Recognition fails, must return 0

	:param data:
	:type data: Handle_Interface_FileReaderData &
	:param num:
	:type num: int
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Interface_FileReaderData & data,const Standard_Integer num);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Performs the effective loading from <data>, record <num>, to the Entity <ent> formerly created In case of Error or Warning, fills <ach> with messages Remark that the Case Number comes from translating a record

	:param casenum:
	:type casenum: int
	:param data:
	:type data: Handle_Interface_FileReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: void
") Read;
		virtual void Read (const Standard_Integer casenum,const Handle_Interface_FileReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NewRead;
		%feature("autodoc", "	* Specific operator (create+read) defaulted to do nothing. It can be redefined when it is not possible to work in two steps (NewVoid then Read). This occurs when no default constructor is defined : hence the result <ent> must be created with an effective definition from the reader. Remark : if NewRead is defined, Copy has nothing to do. //! Returns True if it has produced something, false else. If nothing was produced, <ach> should be filled : it will be treated as 'Unrecognized case' by reader tool.

	:param casenum:
	:type casenum: int
	:param data:
	:type data: Handle_Interface_FileReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") NewRead;
		virtual Standard_Boolean NewRead (const Standard_Integer casenum,const Handle_Interface_FileReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,Handle_Standard_Transient & ent);
};


%extend Interface_ReaderModule {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_ReaderModule(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_ReaderModule::Handle_Interface_ReaderModule %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_ReaderModule;
class Handle_Interface_ReaderModule : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_ReaderModule();
        Handle_Interface_ReaderModule(const Handle_Interface_ReaderModule &aHandle);
        Handle_Interface_ReaderModule(const Interface_ReaderModule *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_ReaderModule DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ReaderModule {
    Interface_ReaderModule* _get_reference() {
    return (Interface_ReaderModule*)$self->Access();
    }
};

%extend Handle_Interface_ReaderModule {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_ReaderModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_ReportEntity;
class Interface_ReportEntity : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_ReportEntity;
		%feature("autodoc", "	* Creates a ReportEntity for an Unknown Entity : Check is empty, and Concerned equates Content (i.e. the Unknown Entity)

	:param unknown:
	:type unknown: Handle_Standard_Transient &
	:rtype: None
") Interface_ReportEntity;
		 Interface_ReportEntity (const Handle_Standard_Transient & unknown);
		%feature("compactdefaultargs") Interface_ReportEntity;
		%feature("autodoc", "	* Creates a ReportEntity with its features : - <acheck> is the Check to be memorised - <concerned> is the Entity to which the Check is bound Later, a Content can be set : it is required for an Error

	:param acheck:
	:type acheck: Handle_Interface_Check &
	:param concerned:
	:type concerned: Handle_Standard_Transient &
	:rtype: None
") Interface_ReportEntity;
		 Interface_ReportEntity (const Handle_Interface_Check & acheck,const Handle_Standard_Transient & concerned);
		%feature("compactdefaultargs") SetContent;
		%feature("autodoc", "	* Sets a Content : it brings non interpreted data which belong to the Concerned Entity. It can be empty then loaded later. Remark that for an Unknown Entity, Content is set by Create.

	:param content:
	:type content: Handle_Standard_Transient &
	:rtype: None
") SetContent;
		void SetContent (const Handle_Standard_Transient & content);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns the stored Check

	:rtype: Handle_Interface_Check
") Check;
		Handle_Interface_Check Check ();
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns the stored Check in order to change it

	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck ();
		%feature("compactdefaultargs") Concerned;
		%feature("autodoc", "	* Returns the stored Concerned Entity. It equates the Content in the case of an Unknown Entity

	:rtype: Handle_Standard_Transient
") Concerned;
		Handle_Standard_Transient Concerned ();
		%feature("compactdefaultargs") HasContent;
		%feature("autodoc", "	* Returns True if a Content is stored (it can equate Concerned)

	:rtype: bool
") HasContent;
		Standard_Boolean HasContent ();
		%feature("compactdefaultargs") HasNewContent;
		%feature("autodoc", "	* Returns True if a Content is stored AND differs from Concerned (i.e. redefines content) : used when Concerned could not be loaded

	:rtype: bool
") HasNewContent;
		Standard_Boolean HasNewContent ();
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "	* Returns the stored Content, or a Null Handle Remark that it must be an 'Unknown Entity' suitable for the norm of the containing Model

	:rtype: Handle_Standard_Transient
") Content;
		Handle_Standard_Transient Content ();
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "	* Returns True for an Error Entity, i.e. if the Check brings at least one Fail message

	:rtype: bool
") IsError;
		Standard_Boolean IsError ();
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "	* Returns True for an Unknown Entity, i,e. if the Check is empty and Concerned equates Content

	:rtype: bool
") IsUnknown;
		Standard_Boolean IsUnknown ();
};


%extend Interface_ReportEntity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_ReportEntity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_ReportEntity::Handle_Interface_ReportEntity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_ReportEntity;
class Handle_Interface_ReportEntity : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_ReportEntity();
        Handle_Interface_ReportEntity(const Handle_Interface_ReportEntity &aHandle);
        Handle_Interface_ReportEntity(const Interface_ReportEntity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_ReportEntity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ReportEntity {
    Interface_ReportEntity* _get_reference() {
    return (Interface_ReportEntity*)$self->Access();
    }
};

%extend Handle_Interface_ReportEntity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_ReportEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_SequenceNodeOfSequenceOfCheck;
class Interface_SequenceNodeOfSequenceOfCheck : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Interface_SequenceNodeOfSequenceOfCheck;
		%feature("autodoc", "	:param I:
	:type I: Handle_Interface_Check &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Interface_SequenceNodeOfSequenceOfCheck;
		 Interface_SequenceNodeOfSequenceOfCheck (const Handle_Interface_Check & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Interface_Check
") Value;
		Handle_Interface_Check Value ();
};


%extend Interface_SequenceNodeOfSequenceOfCheck {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_SequenceNodeOfSequenceOfCheck(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_SequenceNodeOfSequenceOfCheck::Handle_Interface_SequenceNodeOfSequenceOfCheck %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_SequenceNodeOfSequenceOfCheck;
class Handle_Interface_SequenceNodeOfSequenceOfCheck : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Interface_SequenceNodeOfSequenceOfCheck();
        Handle_Interface_SequenceNodeOfSequenceOfCheck(const Handle_Interface_SequenceNodeOfSequenceOfCheck &aHandle);
        Handle_Interface_SequenceNodeOfSequenceOfCheck(const Interface_SequenceNodeOfSequenceOfCheck *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_SequenceNodeOfSequenceOfCheck DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_SequenceNodeOfSequenceOfCheck {
    Interface_SequenceNodeOfSequenceOfCheck* _get_reference() {
    return (Interface_SequenceNodeOfSequenceOfCheck*)$self->Access();
    }
};

%extend Handle_Interface_SequenceNodeOfSequenceOfCheck {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_SequenceNodeOfSequenceOfCheck {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_SequenceOfCheck;
class Interface_SequenceOfCheck : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Interface_SequenceOfCheck;
		%feature("autodoc", "	:rtype: None
") Interface_SequenceOfCheck;
		 Interface_SequenceOfCheck ();
		%feature("compactdefaultargs") Interface_SequenceOfCheck;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_SequenceOfCheck &
	:rtype: None
") Interface_SequenceOfCheck;
		 Interface_SequenceOfCheck (const Interface_SequenceOfCheck & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_SequenceOfCheck &
	:rtype: Interface_SequenceOfCheck
") Assign;
		const Interface_SequenceOfCheck & Assign (const Interface_SequenceOfCheck & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Interface_SequenceOfCheck &
	:rtype: Interface_SequenceOfCheck
") operator =;
		const Interface_SequenceOfCheck & operator = (const Interface_SequenceOfCheck & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Interface_Check &
	:rtype: None
") Append;
		void Append (const Handle_Interface_Check & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Interface_SequenceOfCheck &
	:rtype: None
") Append;
		void Append (Interface_SequenceOfCheck & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Interface_Check &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Interface_Check & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Interface_SequenceOfCheck &
	:rtype: None
") Prepend;
		void Prepend (Interface_SequenceOfCheck & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Interface_Check &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Interface_Check & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Interface_SequenceOfCheck &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Interface_SequenceOfCheck & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Interface_Check &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Interface_Check & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Interface_SequenceOfCheck &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Interface_SequenceOfCheck & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Interface_Check
") First;
		Handle_Interface_Check First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Interface_Check
") Last;
		Handle_Interface_Check Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Interface_SequenceOfCheck &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Interface_SequenceOfCheck & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Interface_Check
") Value;
		Handle_Interface_Check Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Interface_Check &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Interface_Check & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Interface_Check
") ChangeValue;
		Handle_Interface_Check ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Interface_SequenceOfCheck {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_ShareFlags;
class Interface_ShareFlags {
	public:
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "	* Creates a ShareFlags from a Model and builds required data (flags) by calling the General Service Library given as argument <lib>

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param lib:
	:type lib: Interface_GeneralLib &
	:rtype: None
") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "	* Same as above, but GeneralLib is detained by a GTool

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param gtool:
	:type gtool: Handle_Interface_GTool &
	:rtype: None
") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool);
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "	* Same as above, but GeneralLib is defined through a Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "	* Same as above, but works with the GTool of the Model

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "	* Creates a ShareFlags by querying informations from a Graph (remark that Graph also has a method IsShared)

	:param agraph:
	:type agraph: Interface_Graph &
	:rtype: None
") Interface_ShareFlags;
		 Interface_ShareFlags (const Interface_Graph & agraph);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model used for the evaluation

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") IsShared;
		%feature("autodoc", "	* Returns True if <ent> is Shared by one or more other Entity(ies) of the Model

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsShared;
		Standard_Boolean IsShared (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "	* Returns the Entities which are not Shared (see their flags)

	:rtype: Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities ();
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "	* Returns the count of root entities

	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns a root entity according its rank in the list of roots By default, it returns the first one

	:param num: default value is 1
	:type num: int
	:rtype: Handle_Standard_Transient
") Root;
		Handle_Standard_Transient Root (const Standard_Integer num = 1);
};


%extend Interface_ShareFlags {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_ShareTool;
class Interface_ShareTool {
	public:
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "	* Creates a ShareTool from a Model and builds all required data, by calling the General Service Library and Modules (GeneralLib given as an argument)

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param lib:
	:type lib: Interface_GeneralLib &
	:rtype: None
") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "	* Same a above, but GeneralLib is detained by a GTool

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param gtool:
	:type gtool: Handle_Interface_GTool &
	:rtype: None
") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool);
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "	* Same a above, but GeneralLib is defined through a Protocol Protocol is used to build the working library

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "	* Same as above, but works with the GTool of the Model

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "	* Creates a ShareTool from an already defined Graph Remark that the data of the Graph are copied

	:param agraph:
	:type agraph: Interface_Graph &
	:rtype: None
") Interface_ShareTool;
		 Interface_ShareTool (const Interface_Graph & agraph);
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "	* Completes the Graph by Adding Implied References. Hence, they are considered as Sharing References in all the other queries

	:param ahgraph:
	:type ahgraph: Handle_Interface_HGraph &
	:rtype: None
") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_HGraph & ahgraph);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model used for Creation (directly or for Graph)

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	* Returns the data used by the ShareTool to work Can then be used directly (read only)

	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph ();
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "	* Returns the Entities which are not Shared (their Sharing List is empty) in the Model

	:rtype: Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities ();
		%feature("compactdefaultargs") IsShared;
		%feature("autodoc", "	* Returns True if <ent> is Shared by other Entities in the Model

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsShared;
		Standard_Boolean IsShared (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "	* Returns the List of Entities Shared by a given Entity <ent>

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Interface_EntityIterator
") Shareds;
		Interface_EntityIterator Shareds (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "	* Returns the List of Entities Sharing a given Entity <ent>

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Interface_EntityIterator
") Sharings;
		Interface_EntityIterator Sharings (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NbTypedSharings;
		%feature("autodoc", "	* Returns the count of Sharing Entities of an Entity, which are Kind of a given Type

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param atype:
	:type atype: Handle_Standard_Type &
	:rtype: int
") NbTypedSharings;
		Standard_Integer NbTypedSharings (const Handle_Standard_Transient & ent,const Handle_Standard_Type & atype);
		%feature("compactdefaultargs") TypedSharing;
		%feature("autodoc", "	* Returns the Sharing Entity of an Entity, which is Kind of a given Type. Allows to access a Sharing Entity of a given type when there is one and only one (current case)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param atype:
	:type atype: Handle_Standard_Type &
	:rtype: Handle_Standard_Transient
") TypedSharing;
		Handle_Standard_Transient TypedSharing (const Handle_Standard_Transient & ent,const Handle_Standard_Type & atype);
		%feature("compactdefaultargs") All;
		%feature("autodoc", "	* Returns the complete list of entities shared by <ent> at any level, including <ent> itself If <ent> is the Model, considers the concatenation of AllShared for each root If <rootlast> is True (D), the list starts with lower level entities and ends by the root. Else, the root is first and the lower level entities are at end

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param rootlast: default value is Standard_True
	:type rootlast: bool
	:rtype: Interface_EntityIterator
") All;
		Interface_EntityIterator All (const Handle_Standard_Transient & ent,const Standard_Boolean rootlast = Standard_True);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Utility method which Prints the content of an iterator (by their Numbers)

	:param iter:
	:type iter: Interface_EntityIterator &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") Print;
		void Print (const Interface_EntityIterator & iter,const Handle_Message_Messenger & S);
};


%extend Interface_ShareTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_SignLabel;
class Interface_SignLabel : public MoniTool_SignText {
	public:
		%feature("compactdefaultargs") Interface_SignLabel;
		%feature("autodoc", "	:rtype: None
") Interface_SignLabel;
		 Interface_SignLabel ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns 'Entity Label'

	:rtype: char *
") Name;
		const char * Name ();
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Considers context as an InterfaceModel and returns the Label computed by it

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param context:
	:type context: Handle_Standard_Transient &
	:rtype: TCollection_AsciiString
") Text;
		TCollection_AsciiString Text (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & context);
};


%extend Interface_SignLabel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_SignLabel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_SignLabel::Handle_Interface_SignLabel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_SignLabel;
class Handle_Interface_SignLabel : public Handle_MoniTool_SignText {

    public:
        // constructors
        Handle_Interface_SignLabel();
        Handle_Interface_SignLabel(const Handle_Interface_SignLabel &aHandle);
        Handle_Interface_SignLabel(const Interface_SignLabel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_SignLabel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_SignLabel {
    Interface_SignLabel* _get_reference() {
    return (Interface_SignLabel*)$self->Access();
    }
};

%extend Handle_Interface_SignLabel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_SignLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_SignType;
class Interface_SignType : public MoniTool_SignText {
	public:
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Returns an identification of the Signature (a word), given at initialization time Specialised to consider context as an InterfaceModel

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param context:
	:type context: Handle_Standard_Transient &
	:rtype: TCollection_AsciiString
") Text;
		TCollection_AsciiString Text (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & context);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Signature for a Transient object. It is specific of each sub-class of Signature. For a Null Handle, it should provide '' It can work with the model which contains the entity

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") Value;
		virtual const char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "	* From a CDL Type Name, returns the Class part (package dropped) WARNING : buffered, to be immediately copied or printed

	:param typnam:
	:type typnam: char *
	:rtype: char *
") ClassName;
		static const char * ClassName (const char * typnam);
};


%extend Interface_SignType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_SignType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_SignType::Handle_Interface_SignType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_SignType;
class Handle_Interface_SignType : public Handle_MoniTool_SignText {

    public:
        // constructors
        Handle_Interface_SignType();
        Handle_Interface_SignType(const Handle_Interface_SignType &aHandle);
        Handle_Interface_SignType(const Interface_SignType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_SignType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_SignType {
    Interface_SignType* _get_reference() {
    return (Interface_SignType*)$self->Access();
    }
};

%extend Handle_Interface_SignType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_SignType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_TypedValue;
class Interface_TypedValue : public MoniTool_TypedValue {
	public:
		%feature("compactdefaultargs") Interface_TypedValue;
		%feature("autodoc", "	* Creates a TypedValue, with a name //! type gives the type of the parameter, default is free text Also available : Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the TypedValue once created //! init gives an initial value. If it is not given, the TypedValue begins as 'not set', its value is empty

	:param name:
	:type name: char *
	:param type: default value is Interface_ParamText
	:type type: Interface_ParamType
	:param init: default value is ""
	:type init: char *
	:rtype: None
") Interface_TypedValue;
		 Interface_TypedValue (const char * name,const Interface_ParamType type = Interface_ParamText,const char * init = "");
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type I.E. calls ValueType then makes correspondance between ParamType from Interface (which remains for compatibility reasons) and ValueType from MoniTool

	:rtype: Interface_ParamType
") Type;
		Interface_ParamType Type ();
		%feature("compactdefaultargs") ParamTypeToValueType;
		%feature("autodoc", "	* Correspondance ParamType from Interface to ValueType from MoniTool

	:param typ:
	:type typ: Interface_ParamType
	:rtype: MoniTool_ValueType
") ParamTypeToValueType;
		static MoniTool_ValueType ParamTypeToValueType (const Interface_ParamType typ);
		%feature("compactdefaultargs") ValueTypeToParamType;
		%feature("autodoc", "	* Correspondance ParamType from Interface to ValueType from MoniTool

	:param typ:
	:type typ: MoniTool_ValueType
	:rtype: Interface_ParamType
") ValueTypeToParamType;
		static Interface_ParamType ValueTypeToParamType (const MoniTool_ValueType typ);
};


%extend Interface_TypedValue {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_TypedValue(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_TypedValue::Handle_Interface_TypedValue %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_TypedValue;
class Handle_Interface_TypedValue : public Handle_MoniTool_TypedValue {

    public:
        // constructors
        Handle_Interface_TypedValue();
        Handle_Interface_TypedValue(const Handle_Interface_TypedValue &aHandle);
        Handle_Interface_TypedValue(const Interface_TypedValue *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_TypedValue DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_TypedValue {
    Interface_TypedValue* _get_reference() {
    return (Interface_TypedValue*)$self->Access();
    }
};

%extend Handle_Interface_TypedValue {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_TypedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_UndefinedContent;
class Interface_UndefinedContent : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Interface_UndefinedContent;
		%feature("autodoc", "	* Defines an empty UndefinedContent

	:rtype: None
") Interface_UndefinedContent;
		 Interface_UndefinedContent ();
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "	* Gives count of recorded parameters

	:rtype: int
") NbParams;
		Standard_Integer NbParams ();
		%feature("compactdefaultargs") NbLiterals;
		%feature("autodoc", "	* Gives count of Literal Parameters

	:rtype: int
") NbLiterals;
		Standard_Integer NbLiterals ();
		%feature("compactdefaultargs") ParamData;
		%feature("autodoc", "	* Returns data of a Parameter : its type, and the entity if it designates en entity ('ent') or its literal value else ('str') Returned value (Boolean) : True if it is an Entity, False else

	:param num:
	:type num: int
	:param ptype:
	:type ptype: Interface_ParamType &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param val:
	:type val: Handle_TCollection_HAsciiString &
	:rtype: bool
") ParamData;
		Standard_Boolean ParamData (const Standard_Integer num,Interface_ParamType & ptype,Handle_Standard_Transient & ent,Handle_TCollection_HAsciiString & val);
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "	* Returns the ParamType of a Param, given its rank Error if num is not between 1 and NbParams

	:param num:
	:type num: int
	:rtype: Interface_ParamType
") ParamType;
		Interface_ParamType ParamType (const Standard_Integer num);
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "	* Returns True if a Parameter is recorded as an entity Error if num is not between 1 and NbParams

	:param num:
	:type num: int
	:rtype: bool
") IsParamEntity;
		Standard_Boolean IsParamEntity (const Standard_Integer num);
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "	* Returns Entity corresponding to a Param, given its rank

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") ParamEntity;
		Handle_Standard_Transient ParamEntity (const Standard_Integer num);
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "	* Returns litteral value of a Parameter, given its rank

	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") ParamValue;
		Handle_TCollection_HAsciiString ParamValue (const Standard_Integer num);
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "	* Manages reservation for parameters (internal use) (nb : total count of parameters, nblit : count of literals)

	:param nb:
	:type nb: int
	:param nblit:
	:type nblit: int
	:rtype: None
") Reservate;
		void Reservate (const Standard_Integer nb,const Standard_Integer nblit);
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "	* Adds a literal Parameter to the list

	:param ptype:
	:type ptype: Interface_ParamType
	:param val:
	:type val: Handle_TCollection_HAsciiString &
	:rtype: None
") AddLiteral;
		void AddLiteral (const Interface_ParamType ptype,const Handle_TCollection_HAsciiString & val);
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "	* Adds a Parameter which references an Entity

	:param ptype:
	:type ptype: Interface_ParamType
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") AddEntity;
		void AddEntity (const Interface_ParamType ptype,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") RemoveParam;
		%feature("autodoc", "	* Removes a Parameter given its rank

	:param num:
	:type num: int
	:rtype: None
") RemoveParam;
		void RemoveParam (const Standard_Integer num);
		%feature("compactdefaultargs") SetLiteral;
		%feature("autodoc", "	* Sets a new value for the Parameter <num>, to a literal value (if it referenced formerly an Entity, this Entity is removed)

	:param num:
	:type num: int
	:param ptype:
	:type ptype: Interface_ParamType
	:param val:
	:type val: Handle_TCollection_HAsciiString &
	:rtype: None
") SetLiteral;
		void SetLiteral (const Standard_Integer num,const Interface_ParamType ptype,const Handle_TCollection_HAsciiString & val);
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "	* Sets a new value for the Parameter <num>, to reference an Entity. To simply change the Entity, see the variant below

	:param num:
	:type num: int
	:param ptype:
	:type ptype: Interface_ParamType
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") SetEntity;
		void SetEntity (const Standard_Integer num,const Interface_ParamType ptype,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "	* Changes the Entity referenced by the Parameter <num> (with same ParamType)

	:param num:
	:type num: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") SetEntity;
		void SetEntity (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") EntityList;
		%feature("autodoc", "	* Returns globally the list of param entities. Note that it can be used as shared entity list for the UndefinedEntity

	:rtype: Interface_EntityList
") EntityList;
		Interface_EntityList EntityList ();
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "	* Copies contents of undefined entities; deigned to be called by GetFromAnother method from Undefined entity of each Interface (the basic operation is the same regardless the norm)

	:param other:
	:type other: Handle_Interface_UndefinedContent &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: None
") GetFromAnother;
		void GetFromAnother (const Handle_Interface_UndefinedContent & other,Interface_CopyTool & TC);
};


%extend Interface_UndefinedContent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_UndefinedContent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_UndefinedContent::Handle_Interface_UndefinedContent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_UndefinedContent;
class Handle_Interface_UndefinedContent : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Interface_UndefinedContent();
        Handle_Interface_UndefinedContent(const Handle_Interface_UndefinedContent &aHandle);
        Handle_Interface_UndefinedContent(const Interface_UndefinedContent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_UndefinedContent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_UndefinedContent {
    Interface_UndefinedContent* _get_reference() {
    return (Interface_UndefinedContent*)$self->Access();
    }
};

%extend Handle_Interface_UndefinedContent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_UndefinedContent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_CopyMap;
class Interface_CopyMap : public Interface_CopyControl {
	public:
		%feature("compactdefaultargs") Interface_CopyMap;
		%feature("autodoc", "	* Creates a CopyMap adapted to work from a Model

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Interface_CopyMap;
		 Interface_CopyMap (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears Transfer List. Gets Ready to begin another Transfer

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the InterfaceModel used at Creation time

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Binds a Starting Entity identified by its Number <num> in the Starting Model, to a Result of Transfer <res>

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") Bind;
		void Bind (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "	* Search for the result of a Starting Object (i.e. an Entity, identified by its Number <num> in the Starting Model) Returns True if a Result is Bound (and fills <res>) Returns False if no result is Bound (and nullifies <res>)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: bool
") Search;
		Standard_Boolean Search (const Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
};


%extend Interface_CopyMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_CopyMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_CopyMap::Handle_Interface_CopyMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_CopyMap;
class Handle_Interface_CopyMap : public Handle_Interface_CopyControl {

    public:
        // constructors
        Handle_Interface_CopyMap();
        Handle_Interface_CopyMap(const Handle_Interface_CopyMap &aHandle);
        Handle_Interface_CopyMap(const Interface_CopyMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_CopyMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_CopyMap {
    Interface_CopyMap* _get_reference() {
    return (Interface_CopyMap*)$self->Access();
    }
};

%extend Handle_Interface_CopyMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_CopyMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_GraphContent;
class Interface_GraphContent : public Interface_EntityIterator {
	public:
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "	* Creates an empty GraphContent, ready to be filled

	:rtype: None
") Interface_GraphContent;
		 Interface_GraphContent ();
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "	* Creates with all entities designated by a Graph

	:param agraph:
	:type agraph: Interface_Graph &
	:rtype: None
") Interface_GraphContent;
		 Interface_GraphContent (const Interface_Graph & agraph);
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "	* Creates with entities having specific Status value in a Graph

	:param agraph:
	:type agraph: Interface_Graph &
	:param stat:
	:type stat: int
	:rtype: None
") Interface_GraphContent;
		 Interface_GraphContent (const Interface_Graph & agraph,const Standard_Integer stat);
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "	* Creates an Iterator with Shared entities of an entity (equivalente to EntityIterator but with a Graph)

	:param agraph:
	:type agraph: Interface_Graph &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") Interface_GraphContent;
		 Interface_GraphContent (const Interface_Graph & agraph,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "	* Gets all Entities designated by a Graph (once created), adds them to those already recorded

	:param agraph:
	:type agraph: Interface_Graph &
	:rtype: None
") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph);
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "	* Gets entities from a graph which have a specific Status value (one created), adds them to those already recorded

	:param agraph:
	:type agraph: Interface_Graph &
	:param stat:
	:type stat: int
	:rtype: None
") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph,const Standard_Integer stat);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns Result under the exact form of an EntityIterator : Can be used when EntityIterator itself is required (as a returned value for instance), whitout way for a sub-class

	:rtype: Interface_EntityIterator
") Result;
		Interface_EntityIterator Result ();
		%feature("compactdefaultargs") Begin;
		%feature("autodoc", "	* Does the Evaluation before starting the iteration itself (in out)

	:rtype: None
") Begin;
		void Begin ();
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Evaluates list of Entities to be iterated. Called by Start Default is set to doing nothing : intended to be redefined by each sub-class

	:rtype: void
") Evaluate;
		virtual void Evaluate ();
};


%extend Interface_GraphContent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Interface_Static;
class Interface_Static : public Interface_TypedValue {
	public:
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "	* Creates and records a Static, with a family and a name family can report to a name of ressource or to a system or internal definition. The name must be unique. //! type gives the type of the parameter, default is free text Also available : Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the Static once created //! init gives an initial value. If it is not given, the Static begin as 'not set', its value is empty

	:param family:
	:type family: char *
	:param name:
	:type name: char *
	:param type: default value is Interface_ParamText
	:type type: Interface_ParamType
	:param init: default value is ""
	:type init: char *
	:rtype: None
") Interface_Static;
		 Interface_Static (const char * family,const char * name,const Interface_ParamType type = Interface_ParamText,const char * init = "");
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "	* Creates a new Static with same definition as another one (value is copied, except for Entity : it remains null)

	:param family:
	:type family: char *
	:param name:
	:type name: char *
	:param other:
	:type other: Handle_Interface_Static &
	:rtype: None
") Interface_Static;
		 Interface_Static (const char * family,const char * name,const Handle_Interface_Static & other);
		%feature("compactdefaultargs") PrintStatic;
		%feature("autodoc", "	* Writes the properties of a parameter in the diagnostic file. These include: - Name - Family, - Wildcard (if it has one) - Current status (empty string if it was updated or if it is the original one) - Value

	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") PrintStatic;
		void PrintStatic (const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "	* Returns the family. It can be : a resource name for applis, an internal name between : $e (environment variables), $l (other, purely local)

	:rtype: char *
") Family;
		const char * Family ();
		%feature("compactdefaultargs") SetWild;
		%feature("autodoc", "	* Sets a 'wild-card' static : its value will be considered if <self> is not properly set. (reset by set a null one)

	:param wildcard:
	:type wildcard: Handle_Interface_Static &
	:rtype: None
") SetWild;
		void SetWild (const Handle_Interface_Static & wildcard);
		%feature("compactdefaultargs") Wild;
		%feature("autodoc", "	* Returns the wildcard static, which can be (is most often) null

	:rtype: Handle_Interface_Static
") Wild;
		Handle_Interface_Static Wild ();
		%feature("compactdefaultargs") SetUptodate;
		%feature("autodoc", "	* Records a Static has 'uptodate', i.e. its value has been taken into account by a reinitialisation procedure This flag is reset at each successful SetValue

	:rtype: None
") SetUptodate;
		void SetUptodate ();
		%feature("compactdefaultargs") UpdatedStatus;
		%feature("autodoc", "	* Returns the status 'uptodate'

	:rtype: bool
") UpdatedStatus;
		Standard_Boolean UpdatedStatus ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Declares a new Static (by calling its constructor) If this name is already taken, does nothing and returns False Else, creates it and returns True For additional definitions, get the Static then edit it

	:param family:
	:type family: char *
	:param name:
	:type name: char *
	:param type:
	:type type: Interface_ParamType
	:param init: default value is ""
	:type init: char *
	:rtype: bool
") Init;
		static Standard_Boolean Init (const char * family,const char * name,const Interface_ParamType type,const char * init = "");
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* As Init with ParamType, but type is given as a character This allows a simpler call Types : 'i' Integer, 'r' Real, 't' Text, 'e' Enum, 'o' Object '=' for same definition as, <init> gives the initial Static Returns False if <type> does not match this list

	:param family:
	:type family: char *
	:param name:
	:type name: char *
	:param type:
	:type type: Standard_Character
	:param init: default value is ""
	:type init: char *
	:rtype: bool
") Init;
		static Standard_Boolean Init (const char * family,const char * name,const Standard_Character type,const char * init = "");
		%feature("compactdefaultargs") Static;
		%feature("autodoc", "	* Returns a Static from its name. Null Handle if not present

	:param name:
	:type name: char *
	:rtype: Handle_Interface_Static
") Static;
		static Handle_Interface_Static Static (const char * name);
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "	* Returns True if a Static named <name> is present, False else

	:param name:
	:type name: char *
	:rtype: bool
") IsPresent;
		static Standard_Boolean IsPresent (const char * name);
		%feature("compactdefaultargs") CDef;
		%feature("autodoc", "	* Returns a part of the definition of a Static, as a CString The part is designated by its name, as a CString If the required value is not a string, it is converted to a CString then returned If <name> is not present, or <part> not defined for <name>, this function returns an empty string //! Allowed parts for CDef : family : the family type : the type ('integer','real','text','enum') label : the label satis : satisfy function name if any rmin : minimum real value rmax : maximum real value imin : minimum integer value imax : maximum integer value enum nn (nn : value of an integer) : enum value for nn unit : unit definition for a real

	:param name:
	:type name: char *
	:param part:
	:type part: char *
	:rtype: char *
") CDef;
		static const char * CDef (const char * name,const char * part);
		%feature("compactdefaultargs") IDef;
		%feature("autodoc", "	* Returns a part of the definition of a Static, as an Integer The part is designated by its name, as a CString If the required value is not a string, returns zero For a Boolean, 0 for false, 1 for true If <name> is not present, or <part> not defined for <name>, this function returns zero //! Allowed parts for IDef : imin, imax : minimum or maximum integer value estart : starting number for enum ecount : count of enum values (starting from estart) ematch : exact match status eval val : case determined from a string

	:param name:
	:type name: char *
	:param part:
	:type part: char *
	:rtype: int
") IDef;
		static Standard_Integer IDef (const char * name,const char * part);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns True if <name> is present AND set <proper> True (D) : considers this item only <proper> False : if not set and attached to a wild-card, considers this wild-card

	:param name:
	:type name: char *
	:param proper: default value is Standard_True
	:type proper: bool
	:rtype: bool
") IsSet;
		static Standard_Boolean IsSet (const char * name,const Standard_Boolean proper = Standard_True);
		%feature("compactdefaultargs") CVal;
		%feature("autodoc", "	* Returns the value of the parameter identified by the string name. If the specified parameter does not exist, an empty string is returned. Example Interface_Static::CVal('write.step.schema'); which could return: 'AP214'

	:param name:
	:type name: char *
	:rtype: char *
") CVal;
		static const char * CVal (const char * name);
		%feature("compactdefaultargs") IVal;
		%feature("autodoc", "	* Returns the integer value of the translation parameter identified by the string name. Returns the value 0 if the parameter does not exist. Example Interface_Static::IVal('write.step.schema'); which could return: 3

	:param name:
	:type name: char *
	:rtype: int
") IVal;
		static Standard_Integer IVal (const char * name);
		%feature("compactdefaultargs") RVal;
		%feature("autodoc", "	* Returns the value of a static translation parameter identified by the string name. Returns the value 0.0 if the parameter does not exist.

	:param name:
	:type name: char *
	:rtype: float
") RVal;
		static Standard_Real RVal (const char * name);
		%feature("compactdefaultargs") SetCVal;
		%feature("autodoc", "	* Modifies the value of the parameter identified by name. The modification is specified by the string val. false is returned if the parameter does not exist. Example Interface_Static::SetCVal ('write.step.schema','AP203') This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.

	:param name:
	:type name: char *
	:param val:
	:type val: char *
	:rtype: bool
") SetCVal;
		static Standard_Boolean SetCVal (const char * name,const char * val);
		%feature("compactdefaultargs") SetIVal;
		%feature("autodoc", "	* Modifies the value of the parameter identified by name. The modification is specified by the integer value val. false is returned if the parameter does not exist. Example Interface_Static::SetIVal ('write.step.schema', 3) This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.S

	:param name:
	:type name: char *
	:param val:
	:type val: int
	:rtype: bool
") SetIVal;
		static Standard_Boolean SetIVal (const char * name,const Standard_Integer val);
		%feature("compactdefaultargs") SetRVal;
		%feature("autodoc", "	* Modifies the value of a translation parameter. false is returned if the parameter does not exist. The modification is specified by the real number value val.

	:param name:
	:type name: char *
	:param val:
	:type val: float
	:rtype: bool
") SetRVal;
		static Standard_Boolean SetRVal (const char * name,const Standard_Real val);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Sets a Static to be 'uptodate' Returns False if <name> is not present This status can be used by a reinitialisation procedure to rerun if a value has been changed

	:param name:
	:type name: char *
	:rtype: bool
") Update;
		static Standard_Boolean Update (const char * name);
		%feature("compactdefaultargs") IsUpdated;
		%feature("autodoc", "	* Returns the status 'uptodate' from a Static Returns False if <name> is not present

	:param name:
	:type name: char *
	:rtype: bool
") IsUpdated;
		static Standard_Boolean IsUpdated (const char * name);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns a list of names of statics : <mode> = 0 (D) : criter is for family <mode> = 1 : criter is regexp on names, takes final items (ignore wild cards) <mode> = 2 : idem but take only wilded, not final items <mode> = 3 : idem, take all items matching criter idem + 100 : takes only non-updated items idem + 200 : takes only updated items criter empty (D) : returns all names else returns names which match the given criter Remark : families beginning by '$' are not listed by criter '' they are listed only by criter '$' //! This allows for instance to set new values after having loaded or reloaded a resource, then to update them as required

	:param mode: default value is 0
	:type mode: int
	:param criter: default value is ""
	:type criter: char *
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") Items;
		static Handle_TColStd_HSequenceOfHAsciiString Items (const Standard_Integer mode = 0,const char * criter = "");
		%feature("compactdefaultargs") Standards;
		%feature("autodoc", "	* Initializes all standard static parameters, which can be used by every function. statics specific of a norm or a function must be defined around it

	:rtype: void
") Standards;
		static void Standards ();
};


%extend Interface_Static {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Interface_Static(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Interface_Static::Handle_Interface_Static %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Interface_Static;
class Handle_Interface_Static : public Handle_Interface_TypedValue {

    public:
        // constructors
        Handle_Interface_Static();
        Handle_Interface_Static(const Handle_Interface_Static &aHandle);
        Handle_Interface_Static(const Interface_Static *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Interface_Static DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_Static {
    Interface_Static* _get_reference() {
    return (Interface_Static*)$self->Access();
    }
};

%extend Handle_Interface_Static {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Interface_Static {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
