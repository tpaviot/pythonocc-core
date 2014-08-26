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
%module Interface

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

%include Interface_required_python_modules.i
%include Interface_headers.i

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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Interface_Array1OfFileParameter;
		 Interface_Array1OfFileParameter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Interface_FileParameter)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Interface_Array1OfFileParameter;
		 Interface_Array1OfFileParameter (const Interface_FileParameter & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Interface_FileParameter)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Interface_FileParameter & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Interface_Array1OfFileParameter)

Returns:
	Interface_Array1OfFileParameter

No detailed docstring for this function.") Assign;
		const Interface_Array1OfFileParameter & Assign (const Interface_Array1OfFileParameter & Other);
		%feature("autodoc", "Args:
	Other(Interface_Array1OfFileParameter)

Returns:
	Interface_Array1OfFileParameter

No detailed docstring for this function.") operator=;
		const Interface_Array1OfFileParameter & operator = (const Interface_Array1OfFileParameter & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Interface_FileParameter)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Interface_FileParameter & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Interface_FileParameter

No detailed docstring for this function.") Value;
		const Interface_FileParameter & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Interface_FileParameter

No detailed docstring for this function.") ChangeValue;
		Interface_FileParameter & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Interface_Array1OfFileParameter::~Interface_Array1OfFileParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_Array1OfFileParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_Array1OfHAsciiString;
class Interface_Array1OfHAsciiString {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Interface_Array1OfHAsciiString;
		 Interface_Array1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_TCollection_HAsciiString)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Interface_Array1OfHAsciiString;
		 Interface_Array1OfHAsciiString (const Handle_TCollection_HAsciiString & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_TCollection_HAsciiString & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Interface_Array1OfHAsciiString)

Returns:
	Interface_Array1OfHAsciiString

No detailed docstring for this function.") Assign;
		const Interface_Array1OfHAsciiString & Assign (const Interface_Array1OfHAsciiString & Other);
		%feature("autodoc", "Args:
	Other(Interface_Array1OfHAsciiString)

Returns:
	Interface_Array1OfHAsciiString

No detailed docstring for this function.") operator=;
		const Interface_Array1OfHAsciiString & operator = (const Interface_Array1OfHAsciiString & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HAsciiString & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") Value;
		const Handle_TCollection_HAsciiString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") ChangeValue;
		Handle_TCollection_HAsciiString & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Interface_Array1OfHAsciiString::~Interface_Array1OfHAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_Array1OfHAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_BitMap;
class Interface_BitMap {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a empty BitMap") Interface_BitMap;
		 Interface_BitMap ();
		%feature("autodoc", "Args:
	nbitems(Standard_Integer)
	resflags(Standard_Integer)=0

Returns:
	None

Creates a BitMap for <nbitems> items  
          One flag is defined, n0 0  
          <resflags> prepares allocation for <resflags> more flags  
          Flags values start at false") Interface_BitMap;
		 Interface_BitMap (const Standard_Integer nbitems,const Standard_Integer resflags = 0);
		%feature("autodoc", "Args:
	nbitems(Standard_Integer)
	resflags(Standard_Integer)=0

Returns:
	None

Initialize empty bit by <nbitems> items  
          One flag is defined, n0 0  
          <resflags> prepares allocation for <resflags> more flags  
          Flags values start at false") Initialize;
		void Initialize (const Standard_Integer nbitems,const Standard_Integer resflags = 0);
		%feature("autodoc", "Args:
	other(Interface_BitMap)
	copied(Standard_Boolean)=Standard_False

Returns:
	None

Creates a BitMap from another one  
          if <copied> is True, copies data  
          else, data are not copied, only the header object is") Interface_BitMap;
		 Interface_BitMap (const Interface_BitMap & other,const Standard_Boolean copied = Standard_False);
		%feature("autodoc", "Args:
	other(Interface_BitMap)
	copied(Standard_Boolean)=Standard_False

Returns:
	None

Initialize a BitMap from another one") Initialize;
		void Initialize (const Interface_BitMap & other,const Standard_Boolean copied = Standard_False);
		%feature("autodoc", "Args:
	nbitems(Standard_Integer)
	nbwords(Standard_Integer)
	nbflags(Standard_Integer)
	flags(Handle_TColStd_HArray1OfInteger)
	names(Handle_TColStd_HSequenceOfAsciiString)

Returns:
	None

Returns internal values, used for copying  
          Flags values start at false") Internals;
		void Internals (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Handle_TColStd_HArray1OfInteger & flags,Handle_TColStd_HSequenceOfAsciiString & names);
		%feature("autodoc", "Args:
	moreflags(Standard_Integer)

Returns:
	None

Reservates for a count of more flags") Reservate;
		void Reservate (const Standard_Integer moreflags);
		%feature("autodoc", "Args:
	nbitems(Standard_Integer)

Returns:
	None

Sets for a new count of items, which can be either less or  
          greater than the former one  
          For new items, their flags start at false") SetLength;
		void SetLength (const Standard_Integer nbitems);
		%feature("autodoc", "Args:
	name(char *)=

Returns:
	Standard_Integer

Adds a flag, a name can be attached to it  
          Returns its flag number  
          Makes required reservation") AddFlag;
		Standard_Integer AddFlag (const char * name = "");
		%feature("autodoc", "Args:
	more(Standard_Integer)

Returns:
	Standard_Integer

Adds several flags (<more>) with no name  
          Returns the number of last added flag") AddSomeFlags;
		Standard_Integer AddSomeFlags (const Standard_Integer more);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes a flag given its number.  
          Returns True if done, false if num is out of range") RemoveFlag;
		Standard_Boolean RemoveFlag (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	name(char *)

Returns:
	Standard_Boolean

Sets a name for a flag, given its number  
          name can be empty (to erase the name of a flag)  
          Returns True if done, false if : num is out of range, or  
          name non-empty already set to another flag") SetFlagName;
		Standard_Boolean SetFlagName (const Standard_Integer num,const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of flags (flag 0 not included)") NbFlags;
		Standard_Integer NbFlags ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of items (i.e. the length of the bitmap)") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	char *

Returns the name recorded for a flag, or an empty string") FlagName;
		char * FlagName (const Standard_Integer num);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Integer

Returns the number or a flag given its name, or zero") FlagNumber;
		Standard_Integer FlagNumber (const char * name);
		%feature("autodoc", "Args:
	item(Standard_Integer)
	flag(Standard_Integer)=0

Returns:
	Standard_Boolean

Returns the value (true/false) of a flag, from :  
          - the number of the item  
          - the flag number, by default 0") Value;
		Standard_Boolean Value (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("autodoc", "Args:
	item(Standard_Integer)
	val(Standard_Boolean)
	flag(Standard_Integer)=0

Returns:
	None

Sets a new value for a flag") SetValue;
		void SetValue (const Standard_Integer item,const Standard_Boolean val,const Standard_Integer flag = 0);
		%feature("autodoc", "Args:
	item(Standard_Integer)
	flag(Standard_Integer)=0

Returns:
	None

Sets a flag to True") SetTrue;
		void SetTrue (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("autodoc", "Args:
	item(Standard_Integer)
	flag(Standard_Integer)=0

Returns:
	None

Sets a flag to False") SetFalse;
		void SetFalse (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("autodoc", "Args:
	item(Standard_Integer)
	flag(Standard_Integer)=0

Returns:
	Standard_Boolean

Returns the former value for a flag and sets it to True  
          (before : value returned; after : True)") CTrue;
		Standard_Boolean CTrue (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("autodoc", "Args:
	item(Standard_Integer)
	flag(Standard_Integer)=0

Returns:
	Standard_Boolean

Returns the former value for a flag and sets it to False  
          (before : value returned; after : False)") CFalse;
		Standard_Boolean CFalse (const Standard_Integer item,const Standard_Integer flag = 0);
		%feature("autodoc", "Args:
	val(Standard_Boolean)
	flag(Standard_Integer)=0

Returns:
	None

Initialises all the values of Flag Number <flag> to a given  
          value <val>") Init;
		void Init (const Standard_Boolean val,const Standard_Integer flag = 0);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear all field of bit map") Clear;
		void Clear ();
};


%feature("shadow") Interface_BitMap::~Interface_BitMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_BitMap {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_Category;
class Interface_Category {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Category, with no protocol yet") Interface_Category;
		 Interface_Category ();
		%feature("autodoc", "Args:
	proto(Handle_Interface_Protocol)

Returns:
	None

Creates a Category with a given protocol") Interface_Category;
		 Interface_Category (const Handle_Interface_Protocol & proto);
		%feature("autodoc", "Args:
	gtool(Handle_Interface_GTool)

Returns:
	None

Creates a Category with a given GTool") Interface_Category;
		 Interface_Category (const Handle_Interface_GTool & gtool);
		%feature("autodoc", "Args:
	proto(Handle_Interface_Protocol)

Returns:
	None

Sets/Changes Protocol") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	shares(Interface_ShareTool)

Returns:
	Standard_Integer

Determines the Category Number for an entity in its context,  
          by using general service CategoryNumber") CatNum;
		Standard_Integer CatNum (const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the recorded list of category numbers for a Model") ClearNums;
		void ClearNums ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	shares(Interface_ShareTool)

Returns:
	None

Computes the Category Number for each entity and records it,  
          in an array (ent.number -> category number)  
          Hence, it can be queried by the method Num.  
          The Model itself is not recorded, this method is intended to  
          be used in a wider context (which detains also a Graph, etc)") Compute;
		void Compute (const Handle_Interface_InterfaceModel & model,const Interface_ShareTool & shares);
		%feature("autodoc", "Args:
	nument(Standard_Integer)

Returns:
	Standard_Integer

Returns the category number recorded for an entity number  
          Returns 0 if out of range") Num;
		Standard_Integer Num (const Standard_Integer nument);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Integer

Records a new Category defined by its names, produces a number  
          New if not yet recorded") AddCategory;
		static Standard_Integer AddCategory (const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the count of recorded categories") NbCategories;
		static Standard_Integer NbCategories ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	static char *

Returns the name of a category, according to its number") Name;
		static char * Name (const Standard_Integer num);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Integer

Returns the number of a category, according to its name") Number;
		static Standard_Integer Number (const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	static void

Default initialisation  
          (protected against several calls : passes only once)") Init;
		static void Init ();
};


%feature("shadow") Interface_Category::~Interface_Category %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_Category {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_Check;
class Interface_Check : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Allows definition of a Sequence. Used also for Global Check  
          of an InterfaceModel (which stores global messages for file)") Interface_Check;
		 Interface_Check ();
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	None

Defines a Check on an Entity") Interface_Check;
		 Interface_Check (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	amsg(Message_Msg)

Returns:
	None

New name for AddFail (Msg)") SendFail;
		void SendFail (const Message_Msg & amsg);
		%feature("autodoc", "Args:
	amess(Handle_TCollection_HAsciiString)

Returns:
	None

Records a new Fail message") AddFail;
		void AddFail (const Handle_TCollection_HAsciiString & amess);
		%feature("autodoc", "Args:
	amess(Handle_TCollection_HAsciiString)
	orig(Handle_TCollection_HAsciiString)

Returns:
	None

Records a new Fail message under two forms : final,original") AddFail;
		void AddFail (const Handle_TCollection_HAsciiString & amess,const Handle_TCollection_HAsciiString & orig);
		%feature("autodoc", "Args:
	amess(char *)
	orig(char *)=

Returns:
	None

Records a new Fail message given as 'error text' directly  
          If <orig> is given, a distinct original form is recorded  
          else (D), the original form equates <amess>") AddFail;
		void AddFail (const char * amess,const char * orig = "");
		%feature("autodoc", "Args:
	amsg(Message_Msg)

Returns:
	None

Records a new Fail from the definition of a Msg (Original+Value)") AddFail;
		void AddFail (const Message_Msg & amsg);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if Check brings at least one Fail Message") HasFailed;
		Standard_Boolean HasFailed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns count of recorded Fails") NbFails;
		Standard_Integer NbFails ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	final(Standard_Boolean)=Standard_True

Returns:
	Handle_TCollection_HAsciiString

Returns Fail Message as a String  
          Final form by default, Original form if <final> is False") Fail;
		const Handle_TCollection_HAsciiString & Fail (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	final(Standard_Boolean)=Standard_True

Returns:
	char *

Same as above, but returns a CString (to be printed ...)  
          Final form by default, Original form if <final> is False") CFail;
		char * CFail (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	final(Standard_Boolean)=Standard_True

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the list of Fails, for a frontal-engine logic  
          Final forms by default, Original forms if <final> is False  
          Can be empty") Fails;
		Handle_TColStd_HSequenceOfHAsciiString Fails (const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	amsg(Message_Msg)

Returns:
	None

New name for AddWarning") SendWarning;
		void SendWarning (const Message_Msg & amsg);
		%feature("autodoc", "Args:
	amess(Handle_TCollection_HAsciiString)

Returns:
	None

Records a new Warning message") AddWarning;
		void AddWarning (const Handle_TCollection_HAsciiString & amess);
		%feature("autodoc", "Args:
	amess(Handle_TCollection_HAsciiString)
	orig(Handle_TCollection_HAsciiString)

Returns:
	None

Records a new Warning message under two forms : final,original") AddWarning;
		void AddWarning (const Handle_TCollection_HAsciiString & amess,const Handle_TCollection_HAsciiString & orig);
		%feature("autodoc", "Args:
	amess(char *)
	orig(char *)=

Returns:
	None

Records a Warning message given as 'warning message' directly  
          If <orig> is given, a distinct original form is recorded  
          else (D), the original form equates <amess>") AddWarning;
		void AddWarning (const char * amess,const char * orig = "");
		%feature("autodoc", "Args:
	amsg(Message_Msg)

Returns:
	None

Records a new Warning from the definition of a Msg (Original+Value)") AddWarning;
		void AddWarning (const Message_Msg & amsg);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if Check brings at least one Warning Message") HasWarnings;
		Standard_Boolean HasWarnings ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns count of recorded Warning messages") NbWarnings;
		Standard_Integer NbWarnings ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	final(Standard_Boolean)=Standard_True

Returns:
	Handle_TCollection_HAsciiString

Returns Warning message as a String  
          Final form by default, Original form if <final> is False") Warning;
		const Handle_TCollection_HAsciiString & Warning (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	final(Standard_Boolean)=Standard_True

Returns:
	char *

Same as above, but returns a CString (to be printed ...)  
          Final form by default, Original form if <final> is False") CWarning;
		char * CWarning (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	final(Standard_Boolean)=Standard_True

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the list of Warnings, for a frontal-engine logic  
          Final forms by default, Original forms if <final> is False  
          Can be empty") Warnings;
		Handle_TColStd_HSequenceOfHAsciiString Warnings (const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	amsg(Message_Msg)

Returns:
	None

Records an information message  
          This does not change the status of the Check") SendMsg;
		void SendMsg (const Message_Msg & amsg);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of recorded information messages") NbInfoMsgs;
		Standard_Integer NbInfoMsgs ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	final(Standard_Boolean)=Standard_True

Returns:
	Handle_TCollection_HAsciiString

Returns information message as a String") InfoMsg;
		const Handle_TCollection_HAsciiString & InfoMsg (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	final(Standard_Boolean)=Standard_True

Returns:
	char *

Same as above, but returns a CString (to be printed ...)  
          Final form by default, Original form if <final> is False") CInfoMsg;
		char * CInfoMsg (const Standard_Integer num,const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	final(Standard_Boolean)=Standard_True

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the list of Info Msg, for a frontal-engine logic  
          Final forms by default, Original forms if <final> is False  
          Can be empty") InfoMsgs;
		Handle_TColStd_HSequenceOfHAsciiString InfoMsgs (const Standard_Boolean final = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckStatus

Returns the Check Status : OK, Warning or Fail") Status;
		Interface_CheckStatus Status ();
		%feature("autodoc", "Args:
	status(Interface_CheckStatus)

Returns:
	Standard_Boolean

Tells if Check Status complies with a given one  
          (i.e. also status for query)") Complies;
		Standard_Boolean Complies (const Interface_CheckStatus status);
		%feature("autodoc", "Args:
	mess(Handle_TCollection_HAsciiString)
	incl(Standard_Integer)
	status(Interface_CheckStatus)

Returns:
	Standard_Boolean

Tells if a message is brought by a Check, as follows :  
          <incl> = 0 : <mess> exactly matches one of the messages  
          <incl> < 0 : <mess> is contained by one of the messages  
          <incl> > 0 : <mess> contains one of the messages  
          For <status> : for CheckWarning and CheckFail, considers only  
            resp. Warning or Check messages. for CheckAny, considers all  
            other values are ignored (answer will be false)") Complies;
		Standard_Boolean Complies (const Handle_TCollection_HAsciiString & mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Check is devoted to an entity; else, it is  
          global (for InterfaceModel's storing of global error messages)") HasEntity;
		Standard_Boolean HasEntity ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the entity on which the Check has been defined") Entity;
		const Handle_Standard_Transient & Entity ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears a check, in order to receive informations from transfer  
          (Messages and Entity)") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the Fail Messages (for instance to keep only Warnings)") ClearFails;
		void ClearFails ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the Warning Messages (for instance to keep only Fails)") ClearWarnings;
		void ClearWarnings ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the Info Messages") ClearInfoMsgs;
		void ClearInfoMsgs ();
		%feature("autodoc", "Args:
	mess(Handle_TCollection_HAsciiString)
	incl(Standard_Integer)
	status(Interface_CheckStatus)

Returns:
	Standard_Boolean

Removes the messages which comply with <mess>, as follows :  
          <incl> = 0 : <mess> exactly matches one of the messages  
          <incl> < 0 : <mess> is contained by one of the messages  
          <incl> > 0 : <mess> contains one of the messages  
          For <status> : for CheckWarning and CheckFail, considers only  
            resp. Warning or Check messages. for CheckAny, considers all  
            other values are ignored (nothing is done)  
          Returns True if at least one message has been removed, False else") Remove;
		Standard_Boolean Remove (const Handle_TCollection_HAsciiString & mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("autodoc", "Args:
	pref(char *)
	num(Standard_Integer)=0

Returns:
	Standard_Boolean

Mends messages, according <pref> and <num>  
          According to <num>, works on the whole list of Fails if = 0(D)  
            or only one Fail message, given its rank  
          If <pref> is empty, converts Fail(s) to Warning(s)  
          Else, does the conversion but prefixes the new Warning(s) but  
          <pref> followed by a semi-column  
          Some reserved values of <pref> are :  
          'FM' : standard prefix 'Mended' (can be translated)  
          'CF' : clears Fail(s)  
          'CW' : clears Warning(s) : here, <num> refers to Warning list  
          'CA' : clears all messages : here, <num> is ignored") Mend;
		Standard_Boolean Mend (const char * pref,const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	None

Receives an entity result of a Transfer") SetEntity;
		void SetEntity (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	None

same as SetEntity (old form kept for compatibility)  
Warning : Does nothing if Entity field is not yet clear") GetEntity;
		void GetEntity (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	other(Handle_Interface_Check)

Returns:
	None

Copies messages stored in another Check, cumulating  
          Does not regard other's Entity. Used to cumulate messages") GetMessages;
		void GetMessages (const Handle_Interface_Check & other);
		%feature("autodoc", "Args:
	other(Handle_Interface_Check)
	failsonly(Standard_Boolean)

Returns:
	None

Copies messages converted into Warning messages  
          If failsonly is true, only Fails are taken, and converted  
          else, Warnings are taken too. Does not regard Entity  
          Used to keep Fail messages as Warning, after a recovery") GetAsWarning;
		void GetAsWarning (const Handle_Interface_Check & other,const Standard_Boolean failsonly);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)
	level(Standard_Integer)
	final(Standard_Integer)=1

Returns:
	None

Prints the messages of the check to an Messenger  
          <level> = 1 : only fails  
          <level> = 2 : fails and warnings  
          <level> = 3 : all (fails, warnings, info msg)  
          <final> : if positive (D) prints final values of messages  
          if negative, prints originals  
          if null, prints both forms") Print;
		void Print (const Handle_Message_Messenger & S,const Standard_Integer level,const Standard_Integer final = 1);
		%feature("autodoc", "Args:
	level(Standard_Integer)=- 1
	final(Standard_Integer)=1

Returns:
	None

Prints the messages of the check to the default trace file  
          By default, according to the default standard level  
          Else, according level (see method Print)") Trace;
		void Trace (const Standard_Integer level = - 1,const Standard_Integer final = 1);
};


%feature("shadow") Interface_Check::~Interface_Check %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_Check {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_Check {
	Handle_Interface_Check GetHandle() {
	return *(Handle_Interface_Check*) &$self;
	}
};

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
    Interface_Check* GetObject() {
    return (Interface_Check*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_Check::~Handle_Interface_Check %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_Check {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_CheckIterator;
class Interface_CheckIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty CheckIterator") Interface_CheckIterator;
		 Interface_CheckIterator ();
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Creates a CheckIterator with a name (displayed by Print as a  
          title)") Interface_CheckIterator;
		 Interface_CheckIterator (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Sets / Changes the name") SetName;
		void SetName (const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the recorded name (can be empty)") Name;
		char * Name ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	None

Defines a Model, used to locate entities (not required, if it  
          is absent, entities are simply less documented)") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the stored model (can be a null handle)") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the list of checks") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	other(Interface_CheckIterator)

Returns:
	None

Merges another CheckIterator into <self>, i.e. adds each of its  
          Checks. Content of <other> remains unchanged.  
          Takes also the Model but not the Name") Merge;
		void Merge (Interface_CheckIterator & other);
		%feature("autodoc", "Args:
	ach(Handle_Interface_Check)
	num(Standard_Integer)=0

Returns:
	None

Adds a Check to the list to be iterated  
          This Check is Accompanied by Entity Number in the Model  
          (0 for Global Check or Entity unknown in the Model), if 0 and  
          Model is recorded in <self>, it is computed") Add;
		void Add (const Handle_Interface_Check & ach,const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Interface_Check

Returns the Check which was attached to an Entity given its  
          Number in the Model. <num>=0 is for the Global Check.  
          If no Check was recorded for this Number, returns an empty  
          Check.  
 Remark : Works apart from the iteration methods (no interference)") Check;
		const Handle_Interface_Check & Check (const Standard_Integer num);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_Interface_Check

Returns the Check attached to an Entity  
          If no Check was recorded for this Entity, returns an empty  
          Check.  
 Remark : Works apart from the iteration methods (no interference)") Check;
		const Handle_Interface_Check & Check (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Interface_Check

Returns the Check bound to an Entity Number (0 : Global)  
          in order to be consulted or completed on the spot  
          I.e. returns the Check if is already exists, or adds it then  
          returns the new empty Check") CCheck;
		Handle_Interface_Check & CCheck (const Standard_Integer num);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_Interface_Check

Returns the Check bound to an Entity, in order to be consulted  
          or completed on the spot  
          I.e. returns the Check if is already exists, or adds it then  
          returns the new empty Check") CCheck;
		Handle_Interface_Check & CCheck (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	failsonly(Standard_Boolean)

Returns:
	Standard_Boolean

Returns True if : no Fail has been recorded if <failsonly> is  
          True, no Check at all if <failsonly> is False") IsEmpty;
		Standard_Boolean IsEmpty (const Standard_Boolean failsonly);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckStatus

Returns worst status among : OK, Warning, Fail") Status;
		Interface_CheckStatus Status ();
		%feature("autodoc", "Args:
	status(Interface_CheckStatus)

Returns:
	Standard_Boolean

Tells if this check list complies with a given status :  
          OK (i.e. empty),  Warning (at least one Warning, but no Fail),  
          Fail (at least one), Message (not OK), NoFail, Any") Complies;
		Standard_Boolean Complies (const Interface_CheckStatus status);
		%feature("autodoc", "Args:
	status(Interface_CheckStatus)

Returns:
	Interface_CheckIterator

Returns a CheckIterator which contains the checks which comply  
          with a given status  
          Each check is added completely (no split Warning/Fail)") Extract;
		Interface_CheckIterator Extract (const Interface_CheckStatus status);
		%feature("autodoc", "Args:
	mess(char *)
	incl(Standard_Integer)
	status(Interface_CheckStatus)

Returns:
	Interface_CheckIterator

Returns a CheckIterator which contains the check which comply  
          with a message, plus some conditions as follows :  
          <incl> = 0 : <mess> exactly matches one of the messages  
          <incl> < 0 : <mess> is contained by one of the messages  
          <incl> > 0 : <mess> contains one of the messages  
          For <status> : for CheckWarning and CheckFail, considers only  
            resp. Warning or Check messages. for CheckAny, considers all  
            other values are ignored (answer will be false)  
          Each Check which complies is entirely taken") Extract;
		Interface_CheckIterator Extract (const char * mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("autodoc", "Args:
	mess(char *)
	incl(Standard_Integer)
	status(Interface_CheckStatus)

Returns:
	Standard_Boolean

Removes the messages of all Checks, under these conditions :  
          <incl> = 0 : <mess> exactly matches one of the messages  
          <incl> < 0 : <mess> is contained by one of the messages  
          <incl> > 0 : <mess> contains one of the messages  
          For <status> : for CheckWarning and CheckFail, considers only  
            resp. Warning or Check messages. for CheckAny, considers all  
            other values are ignored (nothing is done)  
          Returns True if at least one message has been removed, False else") Remove;
		Standard_Boolean Remove (const char * mess,const Standard_Integer incl,const Interface_CheckStatus status);
		%feature("autodoc", "Args:
	failsonly(Standard_Boolean)
	global(Standard_Boolean)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of entities concerned by a Check  
          Only fails if <failsonly> is True, else all non-empty checks  
          If <global> is true, adds the model for a global check  
          Else, global check is ignored") Checkeds;
		Handle_TColStd_HSequenceOfTransient Checkeds (const Standard_Boolean failsonly,const Standard_Boolean global);
		%feature("autodoc", "Args:
	None
Returns:
	None

Starts Iteration. Thus, it is possible to restart it  
          Remark : an iteration may be done with a const Iterator  
          While its content is modified (through a pointer), this allows  
          to give it as a const argument to a function") Start;
		void Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there are more Checks to get") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets Iteration to next Item") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Check

Returns Check currently Iterated  
          It brings all other informations (status, messages, ...)  
          The Number of the Entity in the Model is given by Number below") Value;
		const Handle_Interface_Check & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns Number of Entity for the Check currently iterated  
          or 0 for GlobalCheck") Number;
		Standard_Integer Number ();
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)
	failsonly(Standard_Boolean)
	final(Standard_Integer)=0

Returns:
	None

Prints the list of Checks with their attached Numbers  
          If <failsonly> is True, prints only Fail messages  
          If <failsonly> is False, prints all messages  
          If <final> = 0 (D), prints also original messages if different  
          If <final> < 0, prints only original messages  
          If <final> > 0, prints only final messages  
          It uses the recorded Model if it is defined  
 Remark : Works apart from the iteration methods (no interference)") Print;
		void Print (const Handle_Message_Messenger & S,const Standard_Boolean failsonly,const Standard_Integer final = 0);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)
	model(Handle_Interface_InterfaceModel)
	failsonly(Standard_Boolean)
	final(Standard_Integer)=0

Returns:
	None

Works as Print without a model, but for entities which have  
          no attached number (Number not positive), tries to compute  
          this Number from <model> and displays 'original' or 'computed'") Print;
		void Print (const Handle_Message_Messenger & S,const Handle_Interface_InterfaceModel & model,const Standard_Boolean failsonly,const Standard_Integer final = 0);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears data of iteration") Destroy;
		void Destroy ();
};


%feature("shadow") Interface_CheckIterator::~Interface_CheckIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_CheckIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_CheckTool;
class Interface_CheckTool {
	public:
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)

Returns:
	None

Creates a CheckTool, by calling the General Service Library  
          and Modules, selected through a Protocol, to work on a Model  
          Moreover, Protocol recognizes Unknown Entities") Interface_CheckTool;
		 Interface_CheckTool (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	None

Creates a CheckTool, by calling the General Service Library  
          and Modules, selected through a Protocol, to work on a Model  
          Protocol and so on are taken from the Model (its GTool)") Interface_CheckTool;
		 Interface_CheckTool (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	graph(Interface_Graph)

Returns:
	None

Creates a CheckTool from a Graph. The Graph contains a Model  
          which designates a Protocol: they are used to create ShareTool") Interface_CheckTool;
		 Interface_CheckTool (const Interface_Graph & graph);
		%feature("autodoc", "Args:
	hgraph(Handle_Interface_HGraph)

Returns:
	None

No detailed docstring for this function.") Interface_CheckTool;
		 Interface_CheckTool (const Handle_Interface_HGraph & hgraph);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	sh(Interface_ShareTool)
	ach(Handle_Interface_Check)

Returns:
	None

Fills as required a Check with the Error and Warning messages  
          produced by Checking a given Entity.  
          For an Erroneous or Corrected Entity : Check build at Analyse  
          time; else, Check computed for Entity (Verify integrity), can  
          use a Graph as required to control context") FillCheck;
		void FillCheck (const Handle_Standard_Transient & ent,const Interface_ShareTool & sh,Handle_Interface_Check & ach);
		%feature("autodoc", "Args:
	ach(Handle_Interface_Check)
	S(Handle_Message_Messenger)

Returns:
	None

Utility method which Prints the content of a Check") Print;
		void Print (const Handle_Interface_Check & ach,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	list(Interface_CheckIterator)
	S(Handle_Message_Messenger)

Returns:
	None

Simply Lists all the Checks and the Content (messages) and the  
          Entity, if there is, of each Check  
          (if all Checks are OK, nothing is Printed)") Print;
		void Print (const Interface_CheckIterator & list,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Interface_Check

Returns the Check associated to an Entity identified by  
          its Number in a Model.") Check;
		Handle_Interface_Check Check (const Standard_Integer num);
		%feature("autodoc", "Args:
	reset(Standard_Boolean)=Standard_False

Returns:
	None

Checks if any Error has been detected (CheckList not empty)  
          Returns normally if none, raises exception if some exists.  
          It reuses the last computations from other checking methods,  
          unless the argument <resest> is given True") CheckSuccess;
		void CheckSuccess (const Standard_Boolean reset = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns list of all 'remarkable' informations, which include :  
          - GlobalCheck, if not empty  
          - Error Checks, for all Errors (Verify + Analyse)  
          - also Corrected Entities  
          - and Unknown Entities : for those, each Unknown Entity is  
            associated to an empty Check (it is neither an Error nor a  
            Correction, but a remarkable information)") CompleteCheckList;
		Interface_CheckIterator CompleteCheckList ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns list of all Errors detected  
          Note that presence of Unknown Entities is not an error  
          Cumulates : GlobalCheck if error +  
            AnalyseCheckList + VerifyCheckList") CheckList;
		Interface_CheckIterator CheckList ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns list of errors dectected at Analyse time (syntactic)  
          (note that GlobalCheck is not in this list)") AnalyseCheckList;
		Interface_CheckIterator AnalyseCheckList ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns list of integrity constraints errors (semantic)  
          (note that GlobalCheck is not in this list)") VerifyCheckList;
		Interface_CheckIterator VerifyCheckList ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns list of Corrections (includes GlobalCheck if corrected)") WarningCheckList;
		Interface_CheckIterator WarningCheckList ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns list of Unknown Entities  
          Note that Error and Erroneous Entities are not considered  
          as Unknown") UnknownEntities;
		Interface_EntityIterator UnknownEntities ();
};


%feature("shadow") Interface_CheckTool::~Interface_CheckTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_CheckTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_CopyControl;
class Interface_CopyControl : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears List of Copy Results. Gets Ready to begin another Copy  
          Process.") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	res(Handle_Standard_Transient)

Returns:
	virtual void

Bind a Result to a Starting Entity identified by its Number") Bind;
		virtual void Bind (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & res);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	res(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Searches for the Result bound to a Startingf Entity identified  
          by its Number.  
          If Found, returns True and fills <res>  
          Else, returns False and nullifies <res>") Search;
		virtual Standard_Boolean Search (const Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
};


%feature("shadow") Interface_CopyControl::~Interface_CopyControl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_CopyControl {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_CopyControl {
	Handle_Interface_CopyControl GetHandle() {
	return *(Handle_Interface_CopyControl*) &$self;
	}
};

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
    Interface_CopyControl* GetObject() {
    return (Interface_CopyControl*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_CopyControl::~Handle_Interface_CopyControl %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_CopyControl {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_CopyTool;
class Interface_CopyTool {
	public:
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	lib(Interface_GeneralLib)

Returns:
	None

Creates a CopyTool adapted to work from a Model. Works  
          with a General Service Library, given as an argument") Interface_CopyTool;
		 Interface_CopyTool (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)

Returns:
	None

Same as above, but Library is defined through a Protocol") Interface_CopyTool;
		 Interface_CopyTool (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	None

Same as above, but works with the Active Protocol") Interface_CopyTool;
		 Interface_CopyTool (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the Model on which the CopyTool works") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	othermap(Handle_Interface_CopyControl)

Returns:
	None

Changes the Map of Result for another one. This allows to work  
          with a more sophisticated Mapping Control than the Standard  
          one which is CopyMap (e.g. TransferProcess from Transfer)") SetControl;
		void SetControl (const Handle_Interface_CopyControl & othermap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_CopyControl

Returns the object used for Control") Control;
		Handle_Interface_CopyControl Control ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears Transfer List. Gets Ready to begin another Transfer") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	entfrom(Handle_Standard_Transient)
	entto(Handle_Standard_Transient)
	mapped(Standard_Boolean)
	errstat(Standard_Boolean)

Returns:
	virtual Standard_Boolean

Creates the CounterPart of an Entity (by ShallowCopy), Binds  
          it, then Copies the content of the former Entity to the other  
          one (same Type), by call to the General Service Library  
          It may command the Copy of Referenced Entities  
          Then, its returns True.  
 
          If <mapped> is True, the Map is used to store the Result  
          Else, the Result is simply produced : it can be used to Copy  
          internal sub-parts of Entities, which are not intended to be  
          shared (Strings, Arrays, etc...)  
          If <errstat> is True, this means that the Entity is recorded  
          in the Model as Erroneous : in this case, the General Service  
          for Deep Copy is not called (this could be dangerous) : hence  
          the Counter-Part is produced but empty, it can be referenced.  
 
          This method does nothing and returns False if the Protocol  
          does not recognize <ent>.  
          It basically makes a Deep Copy without changing the Types.  
          It can be redefined for special uses.") Copy;
		virtual Standard_Boolean Copy (const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto,const Standard_Boolean mapped,const Standard_Boolean errstat);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_Standard_Transient

Transfers one Entity, if not yet bound to a result  
          Remark : For an Entity which is reported in the Starting Model,  
          the ReportEntity will also be copied with its Content if it  
          has one (at least ShallowCopy; Complete Copy if the Protocol  
          recognizes the Content : see method Copy)") Transferred;
		Handle_Standard_Transient Transferred (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	res(Handle_Standard_Transient)

Returns:
	None

Defines a Result for the Transfer of a Starting object.  
          Used by method Transferred (which performs a normal Copy),  
          but can also be called to enforce a result : in the latter  
          case, the enforced result must be compatible with the other  
          Transfers which are performed") Bind;
		void Bind (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & res);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	res(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Search for the result of a Starting Object (i.e. an Entity)  
          Returns True  if a  Result is Bound (and fills 'result')  
          Returns False if no result is Bound") Search;
		Standard_Boolean Search (const Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears LastFlags only. This allows to know what Entities are  
          copied after its call (see method LastCopiedAfter). It can be  
          used when copies are done by increments, which must be  
          distinghished. ClearLastFlags is also called by Clear.") ClearLastFlags;
		void ClearLastFlags ();
		%feature("autodoc", "Args:
	numfrom(Standard_Integer)
	ent(Handle_Standard_Transient)
	res(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns an copied Entity and its Result which were operated  
          after last call to ClearLastFlags. It returns the first  
          'Last Copied Entity' which Number follows <numfrom>, Zero if  
          none. It is used in a loop as follow :  
            Integer num = 0;  
            while ( (num = CopyTool.LastCopiedAfter(num,ent,res)) ) {  
              .. Process Starting <ent> and its Result <res>  
            }") LastCopiedAfter;
		Standard_Integer LastCopiedAfter (const Standard_Integer numfrom,Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

Transfers one Entity and records result into the Transfer List  
          Calls method Transferred") TransferEntity;
		void TransferEntity (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	None

Renews the Implied References. These References do not involve  
          Copying of referenced Entities. For such a Reference, if the  
          Entity which defines it AND the referenced Entity are both  
          copied, then this Reference is renewed. Else it is deleted in  
          the copied Entities.  
          Remark : this concerns only some specific references, such as  
          'back pointers'.") RenewImpliedRefs;
		void RenewImpliedRefs ();
		%feature("autodoc", "Args:
	bmodel(Handle_Interface_InterfaceModel)

Returns:
	None

Fills a Model with the result of the transfer (TransferList)  
          Commands copy of Header too, and calls RenewImpliedRefs") FillModel;
		void FillModel (const Handle_Interface_InterfaceModel & bmodel);
		%feature("autodoc", "Args:
	withreports(Standard_Boolean)=Standard_False

Returns:
	Interface_EntityIterator

Returns the complete list of copied Entities  
          If <withreports> is given True, the entities which were  
          reported in the Starting Model are replaced in the list  
          by the copied ReportEntities") CompleteResult;
		Interface_EntityIterator CompleteResult (const Standard_Boolean withreports = Standard_False);
		%feature("autodoc", "Args:
	withreports(Standard_Boolean)=Standard_False

Returns:
	Interface_EntityIterator

Returns the list of Root copied Entities (those which were  
          asked for copy by the user of CopyTool, not by copying  
          another Entity)") RootResult;
		Interface_EntityIterator RootResult (const Standard_Boolean withreports = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Destroy;
		virtual void Destroy ();
};


%feature("shadow") Interface_CopyTool::~Interface_CopyTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_CopyTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_DataMapIteratorOfDataMapOfTransientInteger;
class Interface_DataMapIteratorOfDataMapOfTransientInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_DataMapIteratorOfDataMapOfTransientInteger;
		 Interface_DataMapIteratorOfDataMapOfTransientInteger ();
		%feature("autodoc", "Args:
	aMap(Interface_DataMapOfTransientInteger)

Returns:
	None

No detailed docstring for this function.") Interface_DataMapIteratorOfDataMapOfTransientInteger;
		 Interface_DataMapIteratorOfDataMapOfTransientInteger (const Interface_DataMapOfTransientInteger & aMap);
		%feature("autodoc", "Args:
	aMap(Interface_DataMapOfTransientInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Interface_DataMapOfTransientInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		const Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") Interface_DataMapIteratorOfDataMapOfTransientInteger::~Interface_DataMapIteratorOfDataMapOfTransientInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_DataMapIteratorOfDataMapOfTransientInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_DataMapNodeOfDataMapOfTransientInteger;
class Interface_DataMapNodeOfDataMapOfTransientInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Interface_DataMapNodeOfDataMapOfTransientInteger;
		 Interface_DataMapNodeOfDataMapOfTransientInteger (const Handle_Standard_Transient & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		Standard_Integer & Value ();
};


%feature("shadow") Interface_DataMapNodeOfDataMapOfTransientInteger::~Interface_DataMapNodeOfDataMapOfTransientInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_DataMapNodeOfDataMapOfTransientInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_DataMapNodeOfDataMapOfTransientInteger {
	Handle_Interface_DataMapNodeOfDataMapOfTransientInteger GetHandle() {
	return *(Handle_Interface_DataMapNodeOfDataMapOfTransientInteger*) &$self;
	}
};

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
    Interface_DataMapNodeOfDataMapOfTransientInteger* GetObject() {
    return (Interface_DataMapNodeOfDataMapOfTransientInteger*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_DataMapNodeOfDataMapOfTransientInteger::~Handle_Interface_DataMapNodeOfDataMapOfTransientInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_DataMapNodeOfDataMapOfTransientInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_DataMapOfTransientInteger;
class Interface_DataMapOfTransientInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Interface_DataMapOfTransientInteger;
		 Interface_DataMapOfTransientInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Interface_DataMapOfTransientInteger)

Returns:
	Interface_DataMapOfTransientInteger

No detailed docstring for this function.") Assign;
		Interface_DataMapOfTransientInteger & Assign (const Interface_DataMapOfTransientInteger & Other);
		%feature("autodoc", "Args:
	Other(Interface_DataMapOfTransientInteger)

Returns:
	Interface_DataMapOfTransientInteger

No detailed docstring for this function.") operator=;
		Interface_DataMapOfTransientInteger & operator = (const Interface_DataMapOfTransientInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Transient & K);
};


%feature("shadow") Interface_DataMapOfTransientInteger::~Interface_DataMapOfTransientInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_DataMapOfTransientInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_EntityCluster;
class Interface_EntityCluster : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty, non-chained, EntityCluster") Interface_EntityCluster;
		 Interface_EntityCluster ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

Creates a non-chained EntityCluster, filled with one Entity") Interface_EntityCluster;
		 Interface_EntityCluster (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ec(Handle_Interface_EntityCluster)

Returns:
	None

Creates an empty EntityCluster, chained with another one  
          (that is, put BEFORE this other one in the list)") Interface_EntityCluster;
		 Interface_EntityCluster (const Handle_Interface_EntityCluster & ec);
		%feature("autodoc", "Args:
	ant(Handle_Standard_Transient)
	ec(Handle_Interface_EntityCluster)

Returns:
	None

Creates an EntityCluster, filled with a first Entity, and  
          chained to another EntityCluster (BEFORE it, as above)") Interface_EntityCluster;
		 Interface_EntityCluster (const Handle_Standard_Transient & ant,const Handle_Interface_EntityCluster & ec);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

Appends an Entity to the Cluster. If it is not full, adds the  
          entity directly inside itself. Else, transmits to its Next  
          and Creates it if it does not yet exist") Append;
		void Append (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Removes an Entity from the Cluster. If it is not found, calls  
          its Next one to do so.  
          Returns True if it becomes itself empty, False else  
          (thus, a Cluster which becomes empty is deleted from the list)") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes an Entity from the Cluster, given its rank. If <num>  
          is greater than NbLocal, calls its Next with (num - NbLocal),  
          Returns True if it becomes itself empty, False else") Remove;
		Standard_Boolean Remove (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns total count of Entities (including Next)") NbEntities;
		Standard_Integer NbEntities ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns the Entity identified by its rank in the list  
          (including Next)") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ent(Handle_Standard_Transient)

Returns:
	None

Changes an Entity given its rank.") SetValue;
		void SetValue (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)

Returns:
	None

Fills an Iterator with designated Entities (includes Next)") FillIterator;
		void FillIterator (Interface_EntityIterator & iter);
};


%feature("shadow") Interface_EntityCluster::~Interface_EntityCluster %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_EntityCluster {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_EntityCluster {
	Handle_Interface_EntityCluster GetHandle() {
	return *(Handle_Interface_EntityCluster*) &$self;
	}
};

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
    Interface_EntityCluster* GetObject() {
    return (Interface_EntityCluster*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_EntityCluster::~Handle_Interface_EntityCluster %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_EntityCluster {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_EntityIterator;
class Interface_EntityIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Defines an empty iterator (see AddList & AddItem)") Interface_EntityIterator;
		 Interface_EntityIterator ();
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

Defines an iterator on a list, directly i.e. without copying it") Interface_EntityIterator;
		 Interface_EntityIterator (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

Gets a list of entities and adds its to the iteration list") AddList;
		void AddList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	None

Adds to the iteration list a defined entity") AddItem;
		void AddItem (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	None

same as AddItem (kept for compatibility)") GetOneItem;
		void GetOneItem (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	atype(Handle_Standard_Type)
	keep(Standard_Boolean)

Returns:
	None

Selects entities with are Kind of a given type,  keep only  
          them (is keep is True) or reject only them (if keep is False)") SelectType;
		void SelectType (const Handle_Standard_Type & atype,const Standard_Boolean keep);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns count of entities which will be iterated on  
          Calls Start if not yet done") NbEntities;
		Standard_Integer NbEntities ();
		%feature("autodoc", "Args:
	type(Handle_Standard_Type)

Returns:
	Standard_Integer

Returns count of entities of a given type (kind of)") NbTyped;
		Standard_Integer NbTyped (const Handle_Standard_Type & type);
		%feature("autodoc", "Args:
	type(Handle_Standard_Type)

Returns:
	Interface_EntityIterator

Returns the list of entities of a given type (kind of)") Typed;
		Interface_EntityIterator Typed (const Handle_Standard_Type & type);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Allows re-iteration (useless for the first iteration)") Start;
		virtual void Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Says if there are other entities (vertices) to iterate  
          the first time, calls Start") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets iteration to the next entity (vertex) to give") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the current Entity iterated, to be used by Interface  
          tools or by GraphTools (where Entity is a Vertex)") Value;
		const Handle_Standard_Transient & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the content of the Iterator, accessed through a Handle  
          to be used by a frontal-engine logic  
          Returns an empty Sequence if the Iterator is empty  
          Calls Start if not yet done") Content;
		Handle_TColStd_HSequenceOfTransient Content ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears data of iteration") Destroy;
		virtual void Destroy ();
};


%feature("shadow") Interface_EntityIterator::~Interface_EntityIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_EntityIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_EntityList;
class Interface_EntityList {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a List as beeing empty") Interface_EntityList;
		 Interface_EntityList ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the List") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

Appends an Entity, that is to the END of the list  
          (keeps order, but works slowerly than Add, see below)") Append;
		void Append (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

Adds an Entity to the list, that is, with NO REGARD about the  
          order (faster than Append if count becomes greater than 10)") Add;
		void Add (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

Removes an Entity from the list, if it is there") Remove;
		void Remove (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Removes an Entity from the list, given its rank") Remove;
		void Remove (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the list is empty") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns count of recorded Entities") NbEntities;
		Standard_Integer NbEntities ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns an Item given its number. Beware about the way the  
          list was filled (see above, Add and Append)") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ent(Handle_Standard_Transient)

Returns:
	None

Returns an Item given its number. Beware about the way the  
          list was filled (see above, Add and Append)") SetValue;
		void SetValue (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)

Returns:
	None

fills an Iterator with the content of the list  
          (normal way to consult a list which has been filled with Add)") FillIterator;
		void FillIterator (Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	atype(Handle_Standard_Type)

Returns:
	Standard_Integer

Returns count of Entities of a given Type (0 : none)") NbTypedEntities;
		Standard_Integer NbTypedEntities (const Handle_Standard_Type & atype);
		%feature("autodoc", "Args:
	atype(Handle_Standard_Type)
	num(Standard_Integer)=0

Returns:
	Handle_Standard_Transient

Returns the Entity which is of a given type.  
          If num = 0 (D), there must be ONE AND ONLY ONE  
          If num > 0, returns the num-th entity of this type") TypedEntity;
		Handle_Standard_Transient TypedEntity (const Handle_Standard_Type & atype,const Standard_Integer num = 0);
};


%feature("shadow") Interface_EntityList::~Interface_EntityList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_EntityList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_FileParameter;
class Interface_FileParameter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_FileParameter;
		 Interface_FileParameter ();
		%feature("autodoc", "Args:
	val(TCollection_AsciiString)
	typ(Interface_ParamType)

Returns:
	None

Fills fields (with Entity Number set to zero)") Init;
		void Init (const TCollection_AsciiString & val,const Interface_ParamType typ);
		%feature("autodoc", "Args:
	val(char *)
	typ(Interface_ParamType)

Returns:
	None

Same as above, but builds the Value from a CString") Init;
		void Init (const char * val,const Interface_ParamType typ);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Same as above, but as a CString (for immediate exploitation)  
was C++ : return const") CValue;
		char * CValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_ParamType

Returns the type of the parameter") ParamType;
		Interface_ParamType ParamType ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Allows to set a reference to an Entity in a numbered list") SetEntityNumber;
		void SetEntityNumber (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns value set by SetEntityNumber") EntityNumber;
		Standard_Integer EntityNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears stored data : frees memory taken for the String Value") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Destructor. Does nothing because Memory is managed by ParamSet") Destroy;
		void Destroy ();
};


%feature("shadow") Interface_FileParameter::~Interface_FileParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_FileParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_FileReaderData;
class Interface_FileReaderData : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the count of registered records  
          That is, value given for Initialization (can be redefined)") NbRecords;
		virtual Standard_Integer NbRecords ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the count of entities. Depending of each norm, records  
          can be Entities or SubParts (SubList in STEP, SubGroup in SET  
          ...). NbEntities counts only Entities, not Subs  
          Used for memory reservation in InterfaceModel  
          Default implementation uses FindNextRecord  
          Can be redefined into a more performant way") NbEntities;
		virtual Standard_Integer NbEntities ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	virtual Standard_Integer

Determines the record number defining an Entity following a  
          given record number. Specific to each sub-class of  
          FileReaderData. Returning zero means no record found") FindNextRecord;
		virtual Standard_Integer FindNextRecord (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

attaches an empty ParamList to a Record") InitParams;
		void InitParams (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	aval(char *)
	atype(Interface_ParamType)
	nument(Standard_Integer)=0

Returns:
	None

Adds a parameter to record no 'num' and fills its fields  
          (EntityNumber is optional)  
 Warning : <aval> is assumed to be memory-managed elsewhere : it is NOT  
          copied. This gives a best speed : strings remain stored in  
          pages of characters") AddParam;
		void AddParam (const Standard_Integer num,const char * aval,const Interface_ParamType atype,const Standard_Integer nument = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	aval(TCollection_AsciiString)
	atype(Interface_ParamType)
	nument(Standard_Integer)=0

Returns:
	None

Same as above, but gets a AsciiString from TCollection  
          Remark that the content of the AsciiString is locally copied  
          (because its content is most often lost after using)") AddParam;
		void AddParam (const Standard_Integer num,const TCollection_AsciiString & aval,const Interface_ParamType atype,const Standard_Integer nument = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	FP(Interface_FileParameter)

Returns:
	None

Same as above, but gets a complete FileParameter  
 Warning : Content of <FP> is NOT copied : its original address and space  
          in memory are assumed to be managed elsewhere (see ParamSet)") AddParam;
		void AddParam (const Standard_Integer num,const Interface_FileParameter & FP);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)
	FP(Interface_FileParameter)

Returns:
	None

Sets a new value for a parameter of a record, given by :  
          num : record number; nump : parameter number in the record") SetParam;
		void SetParam (const Standard_Integer num,const Standard_Integer nump,const Interface_FileParameter & FP);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Integer

Returns count of parameters attached to record 'num'  
          If <num> = 0, returns the total recorded count of parameters") NbParams;
		Standard_Integer NbParams (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Interface_ParamList

Returns the complete ParamList of a record (read only)  
          num = 0 to return the whole param list for the file") Params;
		Handle_Interface_ParamList Params (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)

Returns:
	Interface_FileParameter

Returns parameter 'nump' of record 'num', as a complete  
          FileParameter") Param;
		const Interface_FileParameter & Param (const Standard_Integer num,const Standard_Integer nump);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)

Returns:
	Interface_FileParameter

Same as above, but in order to be modified on place") ChangeParam;
		Interface_FileParameter & ChangeParam (const Standard_Integer num,const Standard_Integer nump);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)

Returns:
	Interface_ParamType

Returns type of parameter 'nump' of record 'num'  Returns literal value of parameter 'nump' of record 'num'  
 was C++ : return const &") ParamType;
		Interface_ParamType ParamType (const Standard_Integer num,const Standard_Integer nump);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)

Returns:
	char *

Same as above, but as a CString  
 was C++ : return const") ParamCValue;
		char * ParamCValue (const Standard_Integer num,const Standard_Integer nump);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if parameter 'nump' of record 'num' is defined  
          (it is not if its type is ParamVoid)") IsParamDefined;
		Standard_Boolean IsParamDefined (const Standard_Integer num,const Standard_Integer nump);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)

Returns:
	Standard_Integer

Returns record number of an entity referenced by a parameter  
          of type Ident; 0 if no EntityNumber has been determined  
          Note that it is used to reference Entities but also Sublists  
          (sublists are not objects, but internal descriptions)") ParamNumber;
		Standard_Integer ParamNumber (const Standard_Integer num,const Standard_Integer nump);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nump(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns the StepEntity referenced by a parameter  
          Error if none") ParamEntity;
		const Handle_Standard_Transient & ParamEntity (const Standard_Integer num,const Standard_Integer nump);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Integer

Returns the absolute rank of the beginning of a record  
          (its lsit is from ParamFirstRank+1 to ParamFirstRank+NbParams)") ParamFirstRank;
		Standard_Integer ParamFirstRank (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns the entity bound to a record, set by SetEntities") BoundEntity;
		const Handle_Standard_Transient & BoundEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ent(Handle_Standard_Transient)

Returns:
	None

Binds an entity to a record") BindEntity;
		void BindEntity (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	val(Standard_Boolean)

Returns:
	None

Sets the status 'Error Load' on, to overside check fails  
          <val> True  : declares unloaded  
          <val> False : declares loaded  
          If not called before loading (see FileReaderTool), check fails  
            give the status  
          IsErrorLoad says if SetErrorLoad has been called by user  
          ResetErrorLoad resets it (called by FileReaderTool)  
          This allows to specify that the currently loaded entity  
          remains unloaded (because of syntactic fail)") SetErrorLoad;
		void SetErrorLoad (const Standard_Boolean val);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the status 'Error Load' has been set (to True  
          or False)") IsErrorLoad;
		Standard_Boolean IsErrorLoad ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the former value of status 'Error Load' then resets it  
          Used to read the status then ensure it is reset") ResetErrorLoad;
		Standard_Boolean ResetErrorLoad ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Destructor (waiting for memory management)") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	str(char *)

Returns:
	static Standard_Real

Same spec.s as standard <atof> but 5 times faster") Fastof;
		static Standard_Real Fastof (const char * str);
};


%feature("shadow") Interface_FileReaderData::~Interface_FileReaderData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_FileReaderData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_FileReaderData {
	Handle_Interface_FileReaderData GetHandle() {
	return *(Handle_Interface_FileReaderData*) &$self;
	}
};

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
    Interface_FileReaderData* GetObject() {
    return (Interface_FileReaderData*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_FileReaderData::~Handle_Interface_FileReaderData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_FileReaderData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_FileReaderTool;
class Interface_FileReaderTool {
	public:
		%feature("autodoc", "Args:
	reader(Handle_Interface_FileReaderData)
	protocol(Handle_Interface_Protocol)

Returns:
	None

Sets Data to a FileReaderData. Works with a Protocol") SetData;
		void SetData (const Handle_Interface_FileReaderData & reader,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

Returns the Protocol given at creation time") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_FileReaderData

Returns the FileReaderData which is used to work") Data;
		Handle_Interface_FileReaderData Data ();
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	None

Stores a Model. Used when the Model has been loaded") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the stored Model") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	messenger(Handle_Message_Messenger)

Returns:
	None

Sets Messenger used for outputting messages") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & messenger);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_Messenger

Returns Messenger used for outputting messages.  
          The returned object is guaranteed to be non-null;  
          default is Message::Messenger().") Messenger;
		Handle_Message_Messenger Messenger ();
		%feature("autodoc", "Args:
	tracelev(Standard_Integer)

Returns:
	None

Sets trace level used for outputting messages  
          - 0: no trace at all  
          - 1: errors  
          - 2: errors and warnings  
          - 3: all messages  
          Default is 1 : Errors traced") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns trace level used for outputting messages.") TraceLevel;
		Standard_Integer TraceLevel ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Fills records with empty entities; once done, each entity can  
          ask the FileReaderTool for any entity referenced through an  
          identifier. Calls Recognize which is specific to each specific  
          type of FileReaderTool") SetEntities;
		void SetEntities ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ach(Handle_Interface_Check)
	ent(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Recognizes a record, given its number. Specific to each  
          Interface; called by SetEntities. It can call the basic method  
          RecognizeByLib.  
          Returns False if recognition has failed, True else.  
          <ach> has not to be filled if simply Recognition has failed :  
          it must record true error messages : RecognizeByLib can  
          generate error messages if NewRead is called  
 
          Note that it works thru a Recognizer (method Evaluate) which  
          has to be memorized before starting") Recognize;
		virtual Standard_Boolean Recognize (const Standard_Integer num,Handle_Interface_Check & ach,Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	glib(Interface_GeneralLib)
	rlib(Interface_ReaderLib)
	ach(Handle_Interface_Check)
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Recognizes a record with the help of Libraries. Can be used  
          to implement the method Recognize.  
          <rlib> is used to find Protocol and CaseNumber to apply  
          <glib> performs the creation (by service NewVoid, or NewRead  
            if NewVoid gave no result)  
          <ach> is a check, which is transmitted to NewRead if it is  
            called, gives a result but which is false  
          <ent> is the result  
          Returns False if recognition has failed, True else") RecognizeByLib;
		Standard_Boolean RecognizeByLib (const Standard_Integer num,Interface_GeneralLib & glib,Interface_ReaderLib & rlib,Handle_Interface_Check & ach,Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Provides an unknown entity, specific to the Interface  
          called by SetEntities when Recognize has failed (Unknown alone)  
          or by LoadModel when an Entity has caused a Fail on reading  
          (to keep at least its literal description)  
          Uses Protocol to do it") UnknownEntity;
		Handle_Standard_Transient UnknownEntity ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Creates an empty Model of the norm. Uses Protocol to do it") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	None

Reads and fills Entities from the FileReaderData set by  
          SetData to an InterfaceModel.  
          It enchains required operations, the specific ones correspond  
          to deferred methods (below) to be defined for each Norm.  
          It manages also error recovery and trace.  
          Remark : it calls SetModel.  
          It Can raise any error which can occur during a load  
          operation, unless Error Handling is set.  
          This method can also be redefined if judged necessary.") LoadModel;
		void LoadModel (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Reads, Fills and Returns one Entity read from a Record of the  
          FileReaderData. This Method manages also case of Fail or  
          Warning, by producing a ReportEntyty plus , for a Fail, a  
          literal Content (as an UnknownEntity). Performs also Trace") LoadedEntity;
		Handle_Standard_Transient LoadedEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	virtual void

Fills model's header; each Interface defines for its Model its  
          own file header; this method fills it from FileReaderTool.+  
          It is called by AnalyseFile from InterfaceModel") BeginRead;
		virtual void BeginRead (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	anent(Handle_Standard_Transient)
	acheck(Handle_Interface_Check)

Returns:
	virtual Standard_Boolean

Fills an Entity, given record no; specific to each Interface,  
          called by AnalyseFile from InterfaceModel (which manages its  
          calling arguments)  
          To work, each Interface can define a method in its proper  
          Transient class, like this (given as an example) :  
          AnalyseRecord (me  : mutable; FR     : in out FileReaderTool;  
                         num : Integer; acheck : in out Check)  
                             returns Boolean;  
          and call it from AnalyseRecord  
 
          Returned Value : True if the entity could be loaded, False  
            else (in case of syntactic fail)") AnalyseRecord;
		virtual Standard_Boolean AnalyseRecord (const Standard_Integer num,const Handle_Standard_Transient & anent,Handle_Interface_Check & acheck);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	virtual void

Ends file reading after reading all the entities  
          default is doing nothing; redefinable as necessary") EndRead;
		virtual void EndRead (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear filelds") Clear;
		void Clear ();
};


%feature("shadow") Interface_FileReaderTool::~Interface_FileReaderTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_FileReaderTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_FloatWriter;
class Interface_FloatWriter {
	public:
		%feature("autodoc", "Args:
	chars(Standard_Integer)=0

Returns:
	None

Creates a FloatWriter ready to work, with default options  -  
          - zero suppress option is set  
          - main format is set to '%E'  
          - secondary format is set to '%f' for values between 0.1 and  
            1000. in absolute values  
          If <chars> is given (and positive), it will produce options  
          to produce this count of characters : '%<chars>f','%<chars>%E'") Interface_FloatWriter;
		 Interface_FloatWriter (const Standard_Integer chars = 0);
		%feature("autodoc", "Args:
	form(char *)
	reset(Standard_Boolean)=Standard_True

Returns:
	None

Sets a specific Format for Sending Reals (main format)  
          (Default from Creation is '%E')  
          If <reset> is given True (default), this call clears effects  
          of former calls to SetFormatForRange and SetZeroSuppress") SetFormat;
		void SetFormat (const char * form,const Standard_Boolean reset = Standard_True);
		%feature("autodoc", "Args:
	form(char *)
	R1(Standard_Real)
	R2(Standard_Real)

Returns:
	None

Sets a secondary Format for Real, to be applied between R1 and  
          R2 (in absolute values). A Call to SetRealForm cancels this  
          secondary form if <reset> is True.  
          (Default from Creation is '%f' between 0.1 and 1000.)  
 Warning : if the condition (0. <= R1 < R2) is not fulfilled, this  
          secondary form is canceled.") SetFormatForRange;
		void SetFormatForRange (const char * form,const Standard_Real R1,const Standard_Real R2);
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets Sending Real Parameters to suppress trailing Zeros and  
          Null Exponant ('E+00'), if <mode> is given True, Resets this  
          mode if <mode> is False (in addition to Real Forms)  
          A call to SetRealFrom resets this mode to False ig <reset> is  
          given True (Default from Creation is True)") SetZeroSuppress;
		void SetZeroSuppress (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	chars(Standard_Integer)=0

Returns:
	None

Sets again options to the defaults given by Create") SetDefaults;
		void SetDefaults (const Standard_Integer chars = 0);
		%feature("autodoc", "Args:
	zerosup(Standard_Boolean)
	range(Standard_Boolean)
	R1(Standard_Real)
	R2(Standard_Real)

Returns:
	None

Returns active options : <zerosup> is the option ZeroSuppress,  
          <range> is True if a range is set, False else  
          R1,R2 give the range (if it is set)") Options;
		void Options (Standard_Boolean & zerosup,Standard_Boolean & range,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the main format  
was C++ : return const") MainFormat;
		char * MainFormat ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the format for range, if set  
          Meaningful only if <range> from Options is True  
was C++ : return const") FormatForRange;
		char * FormatForRange ();
		%feature("autodoc", "Args:
	val(Standard_Real)
	text(char *)

Returns:
	Standard_Integer

Writes a Real value <val> to a string <text> by using the  
          options. Returns the useful Length of produced string.  
          It calls the class method Convert.  
 Warning : <text> is assumed to be wide enough (20-30 is correct)  
          And, even if declared in, its content will be modified") Write;
		Standard_Integer Write (const Standard_Real val,const char * text);
		%feature("autodoc", "Args:
	val(Standard_Real)
	text(char *)
	zerosup(Standard_Boolean)
	Range1(Standard_Real)
	Range2(Standard_Real)
	mainform(char *)
	rangeform(char *)

Returns:
	static Standard_Integer

This class method converts a Real Value to a string, given  
          options given as arguments. It can be called independantly.  
 Warning : even if declared in, content of <text> will be modified") Convert;
		static Standard_Integer Convert (const Standard_Real val,const char * text,const Standard_Boolean zerosup,const Standard_Real Range1,const Standard_Real Range2,const char * mainform,const char * rangeform);
};


%feature("shadow") Interface_FloatWriter::~Interface_FloatWriter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_FloatWriter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_GTool;
class Interface_GTool : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty, not set, GTool") Interface_GTool;
		 Interface_GTool ();
		%feature("autodoc", "Args:
	proto(Handle_Interface_Protocol)
	nbent(Standard_Integer)=0

Returns:
	None

Creates a GTool from a Protocol  
          Optional starting count of entities") Interface_GTool;
		 Interface_GTool (const Handle_Interface_Protocol & proto,const Standard_Integer nbent = 0);
		%feature("autodoc", "Args:
	sign(Handle_Interface_SignType)

Returns:
	None

Sets a new SignType") SetSignType;
		void SetSignType (const Handle_Interface_SignType & sign);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_SignType

Returns the SignType. Can be null") SignType;
		Handle_Interface_SignType SignType ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	char *

Returns the Signature for a Transient Object in a Model  
          It calls SignType to do that  
          If SignType is not defined, return ClassName of <ent>") SignValue;
		char * SignValue (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the Name of the SignType, or 'Class Name'") SignName;
		char * SignName ();
		%feature("autodoc", "Args:
	proto(Handle_Interface_Protocol)
	enforce(Standard_Boolean)=Standard_False

Returns:
	None

Sets a new Protocol  
          if <enforce> is False and the new Protocol equates the old one  
          then nothing is done") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto,const Standard_Boolean enforce = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

Returns the Protocol.  Warning : it can be Null") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_GeneralLib

Returns the GeneralLib itself") Lib;
		Interface_GeneralLib & Lib ();
		%feature("autodoc", "Args:
	nb(Standard_Integer)
	enforce(Standard_Boolean)=Standard_False

Returns:
	None

Reservates maps for a count of entities  
          <enforce> False : minimum count  
          <enforce> True  : clears former reservations  
          Does not clear the maps") Reservate;
		void Reservate (const Standard_Integer nb,const Standard_Boolean enforce = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the maps which record, for each already recorded entity  
          its Module and Case Number") ClearEntities;
		void ClearEntities ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	gmod(Handle_Interface_GeneralModule)
	CN(Standard_Integer)
	enforce(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Selects for an entity, its Module and Case Number  
          It is optimised : once done for each entity, the result is  
          mapped and the GeneralLib is not longer queried  
          <enforce> True overpasses this optimisation") Select;
		Standard_Boolean Select (const Handle_Standard_Transient & ent,Handle_Interface_GeneralModule & gmod,Standard_Integer &OutValue,const Standard_Boolean enforce = Standard_False);
};


%feature("shadow") Interface_GTool::~Interface_GTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_GTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_GTool {
	Handle_Interface_GTool GetHandle() {
	return *(Handle_Interface_GTool*) &$self;
	}
};

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
    Interface_GTool* GetObject() {
    return (Interface_GTool*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_GTool::~Handle_Interface_GTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_GTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_GeneralLib;
class Interface_GeneralLib {
	public:
		%feature("autodoc", "Args:
	amodule(Handle_Interface_GeneralModule)
	aprotocol(Handle_Interface_Protocol)

Returns:
	static void

No detailed docstring for this function.") SetGlobal;
		static void SetGlobal (const Handle_Interface_GeneralModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("autodoc", "Args:
	aprotocol(Handle_Interface_Protocol)

Returns:
	None

No detailed docstring for this function.") Interface_GeneralLib;
		 Interface_GeneralLib (const Handle_Interface_Protocol & aprotocol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_GeneralLib;
		 Interface_GeneralLib ();
		%feature("autodoc", "Args:
	aprotocol(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") AddProtocol;
		void AddProtocol (const Handle_Standard_Transient & aprotocol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetComplete;
		void SetComplete ();
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)
	module(Handle_Interface_GeneralModule)
	CN(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Select;
		Standard_Boolean Select (const Handle_Standard_Transient & obj,Handle_Interface_GeneralModule & module,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Start;
		void Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_GeneralModule

No detailed docstring for this function.") Module;
		const Handle_Interface_GeneralModule & Module ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

No detailed docstring for this function.") Protocol;
		const Handle_Interface_Protocol & Protocol ();
};


%feature("shadow") Interface_GeneralLib::~Interface_GeneralLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_GeneralLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_GeneralModule;
class Interface_GeneralModule : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	iter(Interface_EntityIterator)

Returns:
	virtual void

Specific filling of the list of Entities shared by an Entity  
          <ent>, according a Case Number <CN> (formerly computed by  
          CaseNum), considered in the context of a Model <model>  
          Default calls FillSharedCase (i.e., ignores the model)  
          Can be redefined to use the model for working") FillShared;
		virtual void FillShared (const Handle_Interface_InterfaceModel & model,const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	iter(Interface_EntityIterator)

Returns:
	virtual void

Specific filling of the list of Entities shared by an Entity  
          <ent>, according a Case Number <CN> (formerly computed by  
          CaseNum). Can use the internal utility method Share, below") FillSharedCase;
		virtual void FillSharedCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)
	shared(Handle_Standard_Transient)

Returns:
	None

Adds an Entity to a Shared List (uses GetOneItem on <iter>)") Share;
		void Share (Interface_EntityIterator & iter,const Handle_Standard_Transient & shared);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	iter(Interface_EntityIterator)

Returns:
	virtual void

List the Implied References of <ent> considered in the context  
          of a Model <model> : i.e. the Entities which are Referenced  
          while not considered as Shared (not copied if <ent> is,  
          references not renewed by CopyCase but by ImpliedCase, only  
          if referenced Entities have been Copied too)  
          FillShared + ListImplied give the complete list of References  
          Default calls ListImpliedCase (i.e. ignores the model)  
          Can be redefined to use the model for working") ListImplied;
		virtual void ListImplied (const Handle_Interface_InterfaceModel & model,const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	iter(Interface_EntityIterator)

Returns:
	virtual void

List the Implied References of <ent> (see above)  
          are Referenced while not considered as Shared (not copied if  
          <ent> is, references not renewed by CopyCase but by  
          ImpliedCase, only if referenced Entities have been Copied too)  
          FillSharedCase + ListImpliedCase give the complete list of  
          Referenced Entities  
          The provided default method does nothing (Implied References  
          are specific of a little amount of Entity Classes).") ListImpliedCase;
		virtual void ListImpliedCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	shares(Interface_ShareTool)
	ach(Handle_Interface_Check)

Returns:
	virtual void

Specific Checking of an Entity <ent>  
          Can check context queried through a ShareTool, as required") CheckCase;
		virtual void CheckCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares,Handle_Interface_Check & ach);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Specific answer to the question 'is Copy properly implemented'  
          Remark that it should be in phase with the implementation of  
          NewVoid+CopyCase/NewCopyCase  
          Default returns always False, can be redefined") CanCopy;
		virtual Standard_Boolean CanCopy (const Standard_Integer CN,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	entfrom(Handle_Standard_Transient)
	entto(Handle_Standard_Transient)
	TC(Interface_CopyTool)

Returns:
	virtual Standard_Boolean

Dispatches an entity  
          Returns True if it works by copy, False if it just duplicates  
          the starting Handle  
 
          Dispatching means producing a new entity, image of the  
          starting one, in order to be put into a new Model, this Model  
          being itself the result of a dispatch from an original Model  
 
          According to the cases, dispatch can either  
          * just return <entto> as equating <entfrom>  
            -> the new model designates the starting entity : it is  
            lighter, but the dispatched entity being shared might not be  
            modified for dispatch  
          * copy <entfrom> to <entto>  
            by calling NewVoid+CopyCase (two steps) or NewCopiedCase (1)  
            -> the dispatched entity is a COPY, hence it can be modified  
 
          The provided default just duplicates the handle without  
          copying, then returns False. Can be redefined") Dispatch;
		virtual Standard_Boolean Dispatch (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto,Interface_CopyTool & TC);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	entto(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Creates a new void entity <entto> according to a Case Number  
          This entity remains to be filled, by reading from a file or  
          by copying from another entity of same type (see CopyCase)") NewVoid;
		virtual Standard_Boolean NewVoid (const Standard_Integer CN,Handle_Standard_Transient & entto);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	entfrom(Handle_Standard_Transient)
	entto(Handle_Standard_Transient)
	TC(Interface_CopyTool)

Returns:
	virtual void

Specific Copy ('Deep') from <entfrom> to <entto> (same type)  
          by using a CopyTool which provides its working Map.  
          Use method Transferred from CopyTool to work") CopyCase;
		virtual void CopyCase (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,const Handle_Standard_Transient & entto,Interface_CopyTool & TC);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	entfrom(Handle_Standard_Transient)
	entto(Handle_Standard_Transient)
	TC(Interface_CopyTool)

Returns:
	virtual Standard_Boolean

Specific operator (create+copy) defaulted to do nothing.  
          It can be redefined : When it is not possible to work in two  
          steps (NewVoid then CopyCase). This can occur when there is  
          no default constructor : hence the result <entto> must be  
          created with an effective definition.  
          Remark : if NewCopiedCase is defined, CopyCase has nothing to do  
          Returns True if it has produced something, false else") NewCopiedCase;
		virtual Standard_Boolean NewCopiedCase (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto,Interface_CopyTool & TC);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	entfrom(Handle_Standard_Transient)
	entto(Handle_Standard_Transient)
	TC(Interface_CopyTool)

Returns:
	virtual void

Specific Copying of Implied References  
          A Default is provided which does nothing (must current case !)  
          Already copied references (by CopyFrom) must remain unchanged  
          Use method Search from CopyTool to work") RenewImpliedCase;
		virtual void RenewImpliedCase (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,const Handle_Standard_Transient & entto,const Interface_CopyTool & TC);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	dispatched(Standard_Boolean)

Returns:
	virtual void

Prepares an entity to be deleted. What does it mean :  
          Basically, any class of entity may define its own destructor  
          By default, it does nothing but calling destructors on fields  
          With the Memory Manager, it is useless to call destructor,  
          it is done automatically when the Handle is nullified(cleared)  
          BUT this is ineffective in looping structures (whatever these  
          are 'Implied' references or not).  
 
          THUS : if no loop may appear in definitions, a class which  
          inherits from TShared is correctly managed by automatic way  
          BUT if there can be loops (or simply back pointers), they must  
          be broken, for instance by clearing fields of one of the nodes  
          The default does nothing, to be redefined if a loop can occur  
          (Implied generally requires WhenDelete, but other cases can  
          occur)  
 
 Warning : <dispatched> tells if the entity to be deleted has been  
          produced by Dispatch or not. Hence WhenDelete must be in  
          coherence with Dispatch  
          Dispatch can either copy or not.  
          If it copies the entity, this one should be deleted  
          If it doesnt (i.e. duplicates the handle) nothing to do  
 
          If <dispatch> is False, normal deletion is to be performed") WhenDeleteCase;
		virtual void WhenDeleteCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Standard_Boolean dispatched);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	shares(Interface_ShareTool)

Returns:
	virtual Standard_Integer

Returns a category number which characterizes an entity  
          Category Numbers are managed by the class Category  
          <shares> can be used to evaluate this number in the context  
          Default returns 0 which means 'unspecified'") CategoryNumber;
		virtual Standard_Integer CategoryNumber (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
		%feature("autodoc", "Args:
	CN(Standard_Integer)
	ent(Handle_Standard_Transient)
	shares(Interface_ShareTool)

Returns:
	virtual Handle_TCollection_HAsciiString

Determines if an entity brings a Name (or widerly, if a Name  
          can be attached to it, through the ShareTool  
          By default, returns a Null Handle_nonamecanbeproduced  
          Can be redefined  
 
 Warning : While this string may be edited on the spot, if it is a read  
          field, the returned value must be copied before.") Name;
		virtual Handle_TCollection_HAsciiString Name (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
};


%feature("shadow") Interface_GeneralModule::~Interface_GeneralModule %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_GeneralModule {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_GeneralModule {
	Handle_Interface_GeneralModule GetHandle() {
	return *(Handle_Interface_GeneralModule*) &$self;
	}
};

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
    Interface_GeneralModule* GetObject() {
    return (Interface_GeneralModule*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_GeneralModule::~Handle_Interface_GeneralModule %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_GeneralModule {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_GlobalNodeOfGeneralLib;
class Interface_GlobalNodeOfGeneralLib : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_GlobalNodeOfGeneralLib;
		 Interface_GlobalNodeOfGeneralLib ();
		%feature("autodoc", "Args:
	amodule(Handle_Interface_GeneralModule)
	aprotocol(Handle_Interface_Protocol)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Handle_Interface_GeneralModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_GeneralModule

No detailed docstring for this function.") Module;
		const Handle_Interface_GeneralModule & Module ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

No detailed docstring for this function.") Protocol;
		const Handle_Interface_Protocol & Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_GlobalNodeOfGeneralLib

No detailed docstring for this function.") Next;
		const Handle_Interface_GlobalNodeOfGeneralLib & Next ();
};


%feature("shadow") Interface_GlobalNodeOfGeneralLib::~Interface_GlobalNodeOfGeneralLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_GlobalNodeOfGeneralLib {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_GlobalNodeOfGeneralLib {
	Handle_Interface_GlobalNodeOfGeneralLib GetHandle() {
	return *(Handle_Interface_GlobalNodeOfGeneralLib*) &$self;
	}
};

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
    Interface_GlobalNodeOfGeneralLib* GetObject() {
    return (Interface_GlobalNodeOfGeneralLib*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_GlobalNodeOfGeneralLib::~Handle_Interface_GlobalNodeOfGeneralLib %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_GlobalNodeOfGeneralLib {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_GlobalNodeOfReaderLib;
class Interface_GlobalNodeOfReaderLib : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_GlobalNodeOfReaderLib;
		 Interface_GlobalNodeOfReaderLib ();
		%feature("autodoc", "Args:
	amodule(Handle_Interface_ReaderModule)
	aprotocol(Handle_Interface_Protocol)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Handle_Interface_ReaderModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_ReaderModule

No detailed docstring for this function.") Module;
		const Handle_Interface_ReaderModule & Module ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

No detailed docstring for this function.") Protocol;
		const Handle_Interface_Protocol & Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_GlobalNodeOfReaderLib

No detailed docstring for this function.") Next;
		const Handle_Interface_GlobalNodeOfReaderLib & Next ();
};


%feature("shadow") Interface_GlobalNodeOfReaderLib::~Interface_GlobalNodeOfReaderLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_GlobalNodeOfReaderLib {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_GlobalNodeOfReaderLib {
	Handle_Interface_GlobalNodeOfReaderLib GetHandle() {
	return *(Handle_Interface_GlobalNodeOfReaderLib*) &$self;
	}
};

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
    Interface_GlobalNodeOfReaderLib* GetObject() {
    return (Interface_GlobalNodeOfReaderLib*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_GlobalNodeOfReaderLib::~Handle_Interface_GlobalNodeOfReaderLib %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_GlobalNodeOfReaderLib {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_Graph;
class Interface_Graph {
	public:
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	lib(Interface_GeneralLib)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Creates an empty graph, ready to receive Entities from amodel  
          Note that this way of Creation allows <self> to verify that  
          Entities to work with are contained in <amodel>  
          Basic Shared and Sharing lists are obtained from a General  
          Services Library, given directly as an argument") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Same as above, but the Library is defined through a Protocol") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	gtool(Handle_Interface_GTool)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Same as above, but the Library is defined through a Protocol") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Same a above but works with the Protocol recorded in the Model") Interface_Graph;
		 Interface_Graph (const Handle_Interface_InterfaceModel & amodel,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)
	copied(Standard_Boolean)=Standard_False

Returns:
	None

Creates a Graph from another one, getting all its data  
          Remark that status are copied from <agraph>, but the other  
          lists (sharing/shared) are copied only if <copied> = True") Interface_Graph;
		 Interface_Graph (const Interface_Graph & agraph,const Standard_Boolean copied = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases data, making graph ready to rebegin from void  
          (also resets Shared lists redefinitions)") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases Status (Values and Flags of Presence), making graph  
          ready to rebegin from void. Does not concerns Shared lists") ResetStatus;
		void ResetStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns size (max nb of entities, i.e. Model's nb of entities)") Size;
		Standard_Integer Size ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns size of array of statuses") NbStatuses;
		Standard_Integer NbStatuses ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the Number of the entity in the Map, computed at  
          creation time (Entities loaded from the Model)  
          Returns 0 if <ent> not contained by Model used to create <self>  
          (that is, <ent> is unknown from <self>)") EntityNumber;
		Standard_Integer EntityNumber (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if an Entity is noted as present in the graph  
          (See methods Get... which determine this status)  
          Returns False if <num> is out of range too") IsPresent;
		Standard_Boolean IsPresent (const Standard_Integer num);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Same as above but directly on an Entity <ent> : if it is not  
          contained in the Model, returns False. Else calls  
           IsPresent(num)  with <num> given by EntityNumber") IsPresent;
		Standard_Boolean IsPresent (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns mapped Entity given its no (if it is present)") Entity;
		const Handle_Standard_Transient & Entity (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Integer

Returns Status associated to a numero (only to read it)") Status;
		Standard_Integer Status (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	stat(Standard_Integer)

Returns:
	None

Modifies Status associated to a numero") SetStatus;
		void SetStatus (const Standard_Integer num,const Standard_Integer stat);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Clears Entity and sets Status to 0, for a numero") RemoveItem;
		void RemoveItem (const Standard_Integer num);
		%feature("autodoc", "Args:
	oldstat(Standard_Integer)
	newstat(Standard_Integer)

Returns:
	None

Changes all status which value is oldstat to new value newstat") ChangeStatus;
		void ChangeStatus (const Standard_Integer oldstat,const Standard_Integer newstat);
		%feature("autodoc", "Args:
	stat(Standard_Integer)

Returns:
	None

Removes all items of which status has a given value stat") RemoveStatus;
		void RemoveStatus (const Standard_Integer stat);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_BitMap

Returns the Bit Map in order to read or edit flag values") BitMap;
		const Interface_BitMap & BitMap ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_BitMap

Returns the Bit Map in order to edit it (add new flags)") CBitMap;
		Interface_BitMap & CBitMap ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the Model with which this Graph was created") Model;
		const Handle_Interface_InterfaceModel & Model ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Loads Graph with all Entities contained in the Model") GetFromModel;
		void GetFromModel ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	shared(Standard_Boolean)
	newstat(Standard_Integer)=0

Returns:
	None

Gets an Entity, plus its shared ones (at every level) if  
          'shared' is True. New items are set to status 'newstat'  
          Items already present in graph remain unchanged  
          Of course, redefinitions of Shared lists are taken into  
          account if there are some") GetFromEntity;
		void GetFromEntity (const Handle_Standard_Transient & ent,const Standard_Boolean shared,const Standard_Integer newstat = 0);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	shared(Standard_Boolean)
	newstat(Standard_Integer)
	overlapstat(Standard_Integer)
	cumul(Standard_Boolean)

Returns:
	None

Gets an Entity, plus its shared ones (at every level) if  
          'shared' is True. New items are set to status 'newstat'.  
          Items already present in graph are processed as follows :  
          - if they already have status 'newstat', they remain unchanged  
          - if they have another status, this one is modified :  
            if cumul is True,  to former status + overlapstat (cumul)  
            if cumul is False, to overlapstat (enforce)") GetFromEntity;
		void GetFromEntity (const Handle_Standard_Transient & ent,const Standard_Boolean shared,const Standard_Integer newstat,const Standard_Integer overlapstat,const Standard_Boolean cumul);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)
	newstat(Standard_Integer)

Returns:
	None

Gets Entities given by an EntityIterator. Entities which were  
          not yet present in the graph are mapped with status 'newstat'  
          Entities already present remain unchanged") GetFromIter;
		void GetFromIter (const Interface_EntityIterator & iter,const Standard_Integer newstat);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)
	newstat(Standard_Integer)
	overlapstat(Standard_Integer)
	cumul(Standard_Boolean)

Returns:
	None

Gets Entities given by an EntityIterator and distinguishes  
          those already present in the Graph :  
          - new entities added to the Graph with status 'newstst'  
          - entities already present with status = 'newstat' remain  
            unchanged  
          - entities already present with status different form  
            'newstat' have their status modified :  
            if cumul is True,  to former status + overlapstat (cumul)  
            if cumul is False, to overlapstat (enforce)  
            (Note : works as GetEntity, shared = False, for each entity)") GetFromIter;
		void GetFromIter (const Interface_EntityIterator & iter,const Standard_Integer newstat,const Standard_Integer overlapstat,const Standard_Boolean cumul);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)

Returns:
	None

Gets all present items from another graph") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)
	stat(Standard_Integer)

Returns:
	None

Gets items from another graph which have a specific Status") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph,const Standard_Integer stat);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if <ent> or the list of entities shared by <ent>  
          (not redefined) contains items unknown from this Graph  
          Remark : apart from the status HasShareError, these items  
          are ignored") HasShareErrors;
		Standard_Boolean HasShareErrors (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the sequence of Entities Shared by an Entity") GetShareds;
		Handle_TColStd_HSequenceOfTransient GetShareds (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Interface_EntityIterator

Returns the list of Entities Shared by an Entity, as recorded  
          by the Graph. That is, by default Basic Shared List, else it  
          can be redefined by methods SetShare, SetNoShare ... see below") Shareds;
		Interface_EntityIterator Shareds (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Interface_EntityIterator

Returns the list of Entities which Share an Entity, computed  
          from the Basic or Redefined Shared Lists") Sharings;
		Interface_EntityIterator Sharings (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the sequence of Entities Sharings by an Entity") GetSharings;
		Handle_TColStd_HSequenceOfTransient GetSharings (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	type(Handle_Standard_Type)

Returns:
	Interface_EntityIterator

Returns the list of sharings entities, AT ANY LEVEL, which are  
          kind of a given type. A sharing entity kind of this type  
          ends the exploration of its branch") TypedSharings;
		Interface_EntityIterator TypedSharings (const Handle_Standard_Transient & ent,const Handle_Standard_Type & type);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the Entities which are not Shared (their Sharing List  
          is empty) in the Model") RootEntities;
		Interface_EntityIterator RootEntities ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_TCollection_HAsciiString

Determines the name attached to an entity, by using the  
          general service Name in GeneralModule  
          Returns a null handle if no name could be computed or if  
          the entity is not in the model") Name;
		Handle_TCollection_HAsciiString Name (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfListOfInteger

Returns the Table of Sharing lists. Used to Create  
          another Graph from <self>") SharingTable;
		const Handle_TColStd_HArray1OfListOfInteger & SharingTable ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns mode resposible for computation of statuses;") ModeStat;
		Standard_Boolean ModeStat ();
};


%feature("shadow") Interface_Graph::~Interface_Graph %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_Graph {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_HArray1OfHAsciiString;
class Interface_HArray1OfHAsciiString : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Interface_HArray1OfHAsciiString;
		 Interface_HArray1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") Interface_HArray1OfHAsciiString;
		 Interface_HArray1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up,const Handle_TCollection_HAsciiString & V);
		%feature("autodoc", "Args:
	V(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_TCollection_HAsciiString & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HAsciiString & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") Value;
		const Handle_TCollection_HAsciiString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") ChangeValue;
		Handle_TCollection_HAsciiString & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Array1OfHAsciiString

No detailed docstring for this function.") Array1;
		const Interface_Array1OfHAsciiString & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Array1OfHAsciiString

No detailed docstring for this function.") ChangeArray1;
		Interface_Array1OfHAsciiString & ChangeArray1 ();
};


%feature("shadow") Interface_HArray1OfHAsciiString::~Interface_HArray1OfHAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_HArray1OfHAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_HArray1OfHAsciiString {
	Handle_Interface_HArray1OfHAsciiString GetHandle() {
	return *(Handle_Interface_HArray1OfHAsciiString*) &$self;
	}
};

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
    Interface_HArray1OfHAsciiString* GetObject() {
    return (Interface_HArray1OfHAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_HArray1OfHAsciiString::~Handle_Interface_HArray1OfHAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_HArray1OfHAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_HGraph;
class Interface_HGraph : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	agraph(Interface_Graph)

Returns:
	None

Creates an HGraph directly from a Graph.  
          Remark that the starting Graph is duplicated") Interface_HGraph;
		 Interface_HGraph (const Interface_Graph & agraph);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	lib(Interface_GeneralLib)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Creates an HGraph with a Graph created from <amodel> and <lib>") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Creates an HGraph with a graph itself created from <amodel>  
          and <protocol>") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	gtool(Handle_Interface_GTool)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Creates an HGraph with a graph itself created from <amodel>  
          and <protocol>") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	theModeStats(Standard_Boolean)=Standard_True

Returns:
	None

Same a above, but works with the GTool in the model") Interface_HGraph;
		 Interface_HGraph (const Handle_Interface_InterfaceModel & amodel,const Standard_Boolean theModeStats = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Graph

Returns the Graph contained in <self>, for Read Only Operations  
          Remark that it is returns as 'const &'  
          Getting it in a new variable instead of a reference would be  
          a pitty, because all the graph's content would be duplicated") Graph;
		const Interface_Graph & Graph ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Graph

Same as above, but for Read-Write Operations  
          Then, The Graph will be modified in the HGraph itself") CGraph;
		Interface_Graph & CGraph ();
};


%feature("shadow") Interface_HGraph::~Interface_HGraph %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_HGraph {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_HGraph {
	Handle_Interface_HGraph GetHandle() {
	return *(Handle_Interface_HGraph*) &$self;
	}
};

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
    Interface_HGraph* GetObject() {
    return (Interface_HGraph*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_HGraph::~Handle_Interface_HGraph %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_HGraph {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_HSequenceOfCheck;
class Interface_HSequenceOfCheck : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_HSequenceOfCheck;
		 Interface_HSequenceOfCheck ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Interface_Check & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Interface_HSequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Interface_Check & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Interface_HSequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Interface_Check & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Interface_HSequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Interface_Check & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Interface_HSequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Interface_HSequenceOfCheck & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Interface_HSequenceOfCheck

No detailed docstring for this function.") Split;
		Handle_Interface_HSequenceOfCheck Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Interface_Check & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Interface_Check

No detailed docstring for this function.") Value;
		const Handle_Interface_Check & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Interface_Check

No detailed docstring for this function.") ChangeValue;
		Handle_Interface_Check & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_SequenceOfCheck

No detailed docstring for this function.") Sequence;
		const Interface_SequenceOfCheck & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_SequenceOfCheck

No detailed docstring for this function.") ChangeSequence;
		Interface_SequenceOfCheck & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_HSequenceOfCheck

No detailed docstring for this function.") ShallowCopy;
		Handle_Interface_HSequenceOfCheck ShallowCopy ();
};


%feature("shadow") Interface_HSequenceOfCheck::~Interface_HSequenceOfCheck %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_HSequenceOfCheck {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_HSequenceOfCheck {
	Handle_Interface_HSequenceOfCheck GetHandle() {
	return *(Handle_Interface_HSequenceOfCheck*) &$self;
	}
};

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
    Interface_HSequenceOfCheck* GetObject() {
    return (Interface_HSequenceOfCheck*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_HSequenceOfCheck::~Handle_Interface_HSequenceOfCheck %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_HSequenceOfCheck {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
class Interface_IndexedMapNodeOfIndexedMapOfAsciiString : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TCollection_AsciiString)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
		 Interface_IndexedMapNodeOfIndexedMapOfAsciiString (const TCollection_AsciiString & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key1;
		TCollection_AsciiString & Key1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key2;
		Standard_Integer & Key2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") Interface_IndexedMapNodeOfIndexedMapOfAsciiString::~Interface_IndexedMapNodeOfIndexedMapOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString GetHandle() {
	return *(Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString*) &$self;
	}
};

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
    Interface_IndexedMapNodeOfIndexedMapOfAsciiString* GetObject() {
    return (Interface_IndexedMapNodeOfIndexedMapOfAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString::~Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_IndexedMapOfAsciiString;
class Interface_IndexedMapOfAsciiString : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Interface_IndexedMapOfAsciiString;
		 Interface_IndexedMapOfAsciiString (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Interface_IndexedMapOfAsciiString)

Returns:
	Interface_IndexedMapOfAsciiString

No detailed docstring for this function.") Assign;
		Interface_IndexedMapOfAsciiString & Assign (const Interface_IndexedMapOfAsciiString & Other);
		%feature("autodoc", "Args:
	Other(Interface_IndexedMapOfAsciiString)

Returns:
	Interface_IndexedMapOfAsciiString

No detailed docstring for this function.") operator=;
		Interface_IndexedMapOfAsciiString & operator = (const Interface_IndexedMapOfAsciiString & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") FindKey;
		const TCollection_AsciiString & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TCollection_AsciiString & K);
};


%feature("shadow") Interface_IndexedMapOfAsciiString::~Interface_IndexedMapOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_IndexedMapOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_IntList;
class Interface_IntList {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

//!Creates empty IntList.") Interface_IntList;
		 Interface_IntList ();
		%feature("autodoc", "Args:
	nbe(Standard_Integer)

Returns:
	None

Creates an IntList for <nbe> entities") Interface_IntList;
		 Interface_IntList (const Standard_Integer nbe);
		%feature("autodoc", "Args:
	other(Interface_IntList)
	copied(Standard_Boolean)

Returns:
	None

Creates an IntList from another one.  
          if <copied> is True, copies data  
          else, data are not copied, only the header object is") Interface_IntList;
		 Interface_IntList (const Interface_IntList & other,const Standard_Boolean copied);
		%feature("autodoc", "Args:
	nbe(Standard_Integer)

Returns:
	None

//!Initialize IntList by number of entities.") Initialize;
		void Initialize (const Standard_Integer nbe);
		%feature("autodoc", "Args:
	nbrefs(Standard_Integer)
	ents(Handle_TColStd_HArray1OfInteger)
	refs(Handle_TColStd_HArray1OfInteger)

Returns:
	None

Returns internal values, used for copying") Internals;
		void Internals (Standard_Integer &OutValue,Handle_TColStd_HArray1OfInteger & ents,Handle_TColStd_HArray1OfInteger & refs);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns count of entities to be aknowledged") NbEntities;
		Standard_Integer NbEntities ();
		%feature("autodoc", "Args:
	nbe(Standard_Integer)

Returns:
	None

Changes the count of entities (ignored if decreased)") SetNbEntities;
		void SetNbEntities (const Standard_Integer nbe);
		%feature("autodoc", "Args:
	number(Standard_Integer)

Returns:
	None

Sets an entity number as current (for read and fill)") SetNumber;
		void SetNumber (const Standard_Integer number);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the current entity number") Number;
		Standard_Integer Number ();
		%feature("autodoc", "Args:
	number(Standard_Integer)
	copied(Standard_Boolean)=Standard_False

Returns:
	Interface_IntList

Returns an IntList, identical to <self> but set to a specified  
          entity Number  
          By default, not copied (in order to be read)  
          Specified <copied> to produce another list and edit it") List;
		Interface_IntList List (const Standard_Integer number,const Standard_Boolean copied = Standard_False);
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets current entity list to be redefined or not  
          This is used in a Graph for redefinition list : it can be  
          disable (no redefinition, i.e. list is cleared), or enabled  
          (starts as empty). The original list has not to be 'redefined'") SetRedefined;
		void SetRedefined (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	count(Standard_Integer)

Returns:
	None

Makes a reservation for <count> references to be later  
          attached to the current entity. If required, it increases  
          the size of array used to store refs. Remark that if count is  
          less than two, it does nothing (because immediate storing)") Reservate;
		void Reservate (const Standard_Integer count);
		%feature("autodoc", "Args:
	ref(Standard_Integer)

Returns:
	None

Adds a reference (as an integer value, an entity number) to  
          the current entity number. Zero is ignored") Add;
		void Add (const Standard_Integer ref);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of refs attached to current entity number") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	Standard_Boolean

Returns True if the list for a number (default is taken as  
          current) is 'redefined'  (usefull for empty list)") IsRedefined;
		Standard_Boolean IsRedefined (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Integer

Returns a reference number in the list for current number,  
          according to its rank") Value;
		Standard_Integer Value (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes an item in the list for current number, given its rank  
          Returns True if done, False else") Remove;
		Standard_Boolean Remove (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all data, hence each entity number has an empty list") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	margin(Standard_Integer)=0

Returns:
	None

Resizes lists to exact sizes. For list of refs, a positive  
          margin can be added.") AdjustSize;
		void AdjustSize (const Standard_Integer margin = 0);
};


%feature("shadow") Interface_IntList::~Interface_IntList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_IntList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_IntVal;
class Interface_IntVal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_IntVal;
		 Interface_IntVal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		Standard_Integer Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") CValue;
		Standard_Integer & CValue ();
};


%feature("shadow") Interface_IntVal::~Interface_IntVal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_IntVal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_IntVal {
	Handle_Interface_IntVal GetHandle() {
	return *(Handle_Interface_IntVal*) &$self;
	}
};

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
    Interface_IntVal* GetObject() {
    return (Interface_IntVal*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_IntVal::~Handle_Interface_IntVal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_IntVal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_InterfaceModel;
class Interface_InterfaceModel : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the list of entities (service WhenDelete)") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	proto(Handle_Interface_Protocol)

Returns:
	None

Sets a Protocol for this Model  
          It is also set by a call to AddWithRefs with Protocol  
          It is used for : DumpHeader (as required), ClearEntities ...") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Interface_Protocol

Returns the Protocol which has been set by SetProtocol, or  
          AddWithRefs with Protocol") Protocol;
		virtual Handle_Interface_Protocol Protocol ();
		%feature("autodoc", "Args:
	gtool(Handle_Interface_GTool)

Returns:
	None

Sets a GTool for this model, which already defines a Protocol") SetGTool;
		void SetGTool (const Handle_Interface_GTool & gtool);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_GTool

Returns the GTool, set by SetProtocol or by SetGTool") GTool;
		Handle_Interface_GTool GTool ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Dispatch Status, either for get or set  
          A Model which is produced from Dispatch may share entities  
          with the original (according to the Protocol), hence these  
          non-copied entities should not be deleted") DispatchStatus;
		Standard_Boolean & DispatchStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Erases contained data; used when a Model is copied to others :  
          the new copied ones begin from clear  
          Clear calls specific method ClearHeader (see below)") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears the entities; uses the general service WhenDelete, in  
          addition to the standard Memory Manager; can be redefined") ClearEntities;
		virtual void ClearEntities ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Erases informations about labels, if any : specific to each  
          norm") ClearLabels;
		virtual void ClearLabels ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears Model's header : specific to each norm") ClearHeader;
		virtual void ClearHeader ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns count of contained Entities") NbEntities;
		Standard_Integer NbEntities ();
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if a Model contains an Entity (for a ReportEntity,  
          looks for the ReportEntity itself AND its Concerned Entity)") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the Number of an Entity in the Model if it contains it.  
          Else returns 0. For a ReportEntity, looks at Concerned Entity.   Returns the Directory entry   Number of  an Entity in  
        the  Model if it contains it.   Else returns  0.  For a  
        ReportEntity, looks at Concerned Entity.") Number;
		Standard_Integer Number (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns an Entity identified by its number in the Model  
          Each sub-class of InterfaceModel can define its own method  
          Entity to return its specific class of Entity (e.g. for VDA,  
          VDAModel returns a VDAEntity), working by calling Value  
Remark : For a Reported Entity, (Erroneous, Corrected, Unknown), this  
	        method returns this Reported Entity.  
         See ReportEntity for other questions.") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer num);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the count of DISTINCT types under which an entity may  
          be processed. Defined by the Protocol, which gives default as  
          1 (dynamic Type).") NbTypes;
		Standard_Integer NbTypes (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	num(Standard_Integer)=1

Returns:
	Handle_Standard_Type

Returns a type, given its rank : defined by the Protocol  
          (by default, the first one)") Type;
		Handle_Standard_Type Type (const Handle_Standard_Transient & ent,const Standard_Integer num = 1);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	complete(Standard_Boolean)=Standard_True

Returns:
	char *

Returns the type name of an entity, from the list of types  
          (one or more ...)  
          <complete> True (D) gives the complete type, else packages are  
            removed  
          WARNING : buffered, to be immediately copied or printed") TypeName;
		char * TypeName (const Handle_Standard_Transient & ent,const Standard_Boolean complete = Standard_True);
		%feature("autodoc", "Args:
	typnam(char *)

Returns:
	static char *

From a CDL Type Name, returns the Class part (package dropped)  
          WARNING : buffered, to be immediately copied or printed") ClassName;
		static char * ClassName (const char * typnam);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Interface_DataState

Returns the State of an entity, given its number") EntityState;
		Interface_DataState EntityState (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	semantic(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Returns True if <num> identifies a ReportEntity in the Model  
          Hence, ReportEntity can be called.  
 
          By default, queries main report, if <semantic> is True, it  
          queries report for semantic check  
 
          Remember that a Report Entity can be defined for an Unknown  
          Entity, or a Corrected or Erroneous (at read time) Entity.  
          The ReportEntity is defined before call to method AddEntity.") IsReportEntity;
		Standard_Boolean IsReportEntity (const Standard_Integer num,const Standard_Boolean semantic = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	semantic(Standard_Boolean)=Standard_False

Returns:
	Handle_Interface_ReportEntity

Returns a ReportEntity identified by its number in the Model,  
          or a Null Handle If <num> does not identify a ReportEntity.  
 
          By default, queries main report, if <semantic> is True, it  
          queries report for semantic check") ReportEntity;
		Handle_Interface_ReportEntity ReportEntity (const Standard_Integer num,const Standard_Boolean semantic = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if <num> identifies an Error Entity : in this  
          case, a ReportEntity brings Fail Messages and possibly an  
          'undefined' Content, see IsRedefinedEntity") IsErrorEntity;
		Standard_Boolean IsErrorEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if <num> identifies an Entity which content is  
          redefined through a ReportEntity (i.e. with literal data only)  
          This happens when an entity is syntactically erroneous in the  
          way that its basic content remains empty.  
          For more details (such as content itself), see ReportEntity") IsRedefinedContent;
		Standard_Boolean IsRedefinedContent (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes the ReportEntity attached to Entity <num>. Returns  
          True if done, False if no ReportEntity was attached to <num>.  
 Warning : the caller must assume that this clearing is meaningfull") ClearReportEntity;
		Standard_Boolean ClearReportEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	rep(Handle_Interface_ReportEntity)

Returns:
	Standard_Boolean

Sets or Replaces a ReportEntity for the Entity <num>. Returns  
          True if Report is replaced, False if it has been replaced  
 Warning : the caller must assume that this setting is meaningfull") SetReportEntity;
		Standard_Boolean SetReportEntity (const Standard_Integer num,const Handle_Interface_ReportEntity & rep);
		%feature("autodoc", "Args:
	rep(Handle_Interface_ReportEntity)
	semantic(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Adds a ReportEntity as such. Returns False if the concerned  
          entity is not recorded in the Model  
          Else, adds it into, either the main report list or the  
          list for semantic checks, then returns True") AddReportEntity;
		Standard_Boolean AddReportEntity (const Handle_Interface_ReportEntity & rep,const Standard_Boolean semantic = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if <num> identifies an Unknown Entity : in this  
          case, a ReportEntity with no Check Messages designates it.") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	checks(Interface_CheckIterator)
	clear(Standard_Boolean)=Standard_True

Returns:
	None

Fills the list of semantic checks.  
          This list is computed (by CheckTool). Hence, it can be stored  
          in the model for later queries  
          <clear> True (D) : new list replaces  
          <clear> False    : new list is cumulated") FillSemanticChecks;
		void FillSemanticChecks (const Interface_CheckIterator & checks,const Standard_Boolean clear = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if semantic checks have been filled") HasSemanticChecks;
		Standard_Boolean HasSemanticChecks ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	syntactic(Standard_Boolean)

Returns:
	Handle_Interface_Check

Returns the check attached to an entity, designated by its  
          Number. 0 for global check  
          <semantic> True  : recorded semantic check  
          <semantic> False : recorded syntactic check (see ReportEntity)  
          If no check is recorded for <num>, returns an empty Check") Check;
		const Handle_Interface_Check & Check (const Standard_Integer num,const Standard_Boolean syntactic);
		%feature("autodoc", "Args:
	nbent(Standard_Integer)

Returns:
	virtual void

Does a reservation for the List of Entities (for optimized  
          storage management). If it is not called, storage management  
          can be less efficient. <nbent> is the expected count of  
          Entities to store") Reservate;
		virtual void Reservate (const Standard_Integer nbent);
		%feature("autodoc", "Args:
	anentity(Handle_Standard_Transient)

Returns:
	virtual void

Internal method for adding an Entity. Used by file reading  
          (defined by each Interface) and Transfer tools. It adds the  
          entity required to be added, not its refs : see AddWithRefs.  
          If <anentity> is a ReportEntity, it is added to the list of  
          Reports, its Concerned Entity (Erroneous or Corrected, else  
          Unknown) is added to the list of Entities.  
          That is, the ReportEntity must be created before Adding") AddEntity;
		virtual void AddEntity (const Handle_Standard_Transient & anentity);
		%feature("autodoc", "Args:
	anent(Handle_Standard_Transient)
	proto(Handle_Interface_Protocol)
	level(Standard_Integer)=0
	listall(Standard_Boolean)=Standard_False

Returns:
	None

Adds to the Model, an Entity with all its References, as they  
          are defined by General Services FillShared and ListImplied.  
          Process is recursive (any sub-levels) if <level> = 0 (Default)  
          Else, adds sub-entities until the required sub-level.  
          Especially, if <level> = 1, adds immediate subs and that's all  
 
          If <listall> is False (Default), an entity (<anentity> itself  
          or one of its subs at any level) which is already recorded in  
          the Model is not analysed, only the newly added ones are.  
          If <listall> is True, all items are analysed (this allows to  
          ensure the consistency of an adding made by steps)") AddWithRefs;
		void AddWithRefs (const Handle_Standard_Transient & anent,const Handle_Interface_Protocol & proto,const Standard_Integer level = 0,const Standard_Boolean listall = Standard_False);
		%feature("autodoc", "Args:
	anent(Handle_Standard_Transient)
	level(Standard_Integer)=0
	listall(Standard_Boolean)=Standard_False

Returns:
	None

Same as above, but works with the Protocol of the Model") AddWithRefs;
		void AddWithRefs (const Handle_Standard_Transient & anent,const Standard_Integer level = 0,const Standard_Boolean listall = Standard_False);
		%feature("autodoc", "Args:
	anent(Handle_Standard_Transient)
	lib(Interface_GeneralLib)
	level(Standard_Integer)=0
	listall(Standard_Boolean)=Standard_False

Returns:
	None

Same as above, but works with an already created GeneralLib") AddWithRefs;
		void AddWithRefs (const Handle_Standard_Transient & anent,const Interface_GeneralLib & lib,const Standard_Integer level = 0,const Standard_Boolean listall = Standard_False);
		%feature("autodoc", "Args:
	nument(Standard_Integer)
	anent(Handle_Standard_Transient)

Returns:
	None

Replace Entity with Number=nument on other entity - 'anent'") ReplaceEntity;
		void ReplaceEntity (const Standard_Integer nument,const Handle_Standard_Transient & anent);
		%feature("autodoc", "Args:
	after(Standard_Integer)=0

Returns:
	None

Reverses the Numbers of the Entities, between <after> and the  
          total count of Entities. Thus, the entities :  
          1,2 ... after, after+1 ... nb-1, nb  become numbered as :  
          1,2 ... after, nb, nb-1 ... after+1  
          By default (after = 0) the whole list of Entities is reversed") ReverseOrders;
		void ReverseOrders (const Standard_Integer after = 0);
		%feature("autodoc", "Args:
	oldnum(Standard_Integer)
	newnum(Standard_Integer)
	count(Standard_Integer)=1

Returns:
	None

Changes the Numbers of some Entities : <oldnum> is moved to  
          <newnum>, same for <count> entities. Thus :  
          1,2 ... newnum-1 newnum ... oldnum .. oldnum+count oldnum+count+1 .. gives  
          1,2 ... newnum-1 oldnum .. oldnum+count newnum ... oldnum+count+1  
          (can be seen as a circular permutation)") ChangeOrder;
		void ChangeOrder (const Standard_Integer oldnum,const Standard_Integer newnum,const Standard_Integer count = 1);
		%feature("autodoc", "Args:
	aniter(Interface_EntityIterator)

Returns:
	None

Gets contents from an EntityIterator, prepared by a  
          Transfer tool (e.g TransferCopy). Starts from clear") GetFromTransfer;
		void GetFromTransfer (const Interface_EntityIterator & aniter);
		%feature("autodoc", "Args:
	other(Handle_Interface_InterfaceModel)

Returns:
	virtual void

Gets header (data specific of a defined Interface) from  
          another InterfaceModel; called from TransferCopy") GetFromAnother;
		virtual void GetFromAnother (const Handle_Interface_InterfaceModel & other);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Interface_InterfaceModel

Returns a New Empty Model, same type as <self> (whatever its  
          Type); called to Copy parts a Model into other ones, then  
          followed by a call to GetFromAnother (Header) then filling  
          with specified Entities, themselves copied") NewEmptyModel;
		virtual Handle_Interface_InterfaceModel NewEmptyModel ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	val(Standard_Integer)

Returns:
	Standard_Boolean

Records a category number for an entity number  
          Returns True when done, False if <num> is out of range") SetCategoryNumber;
		Standard_Boolean SetCategoryNumber (const Standard_Integer num,const Standard_Integer val);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Integer

Returns the recorded category number for a given entity number  
          0 if none was defined for this entity") CategoryNumber;
		Standard_Integer CategoryNumber (const Standard_Integer num);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)

Returns:
	None

Allows an EntityIterator to get a list of Entities") FillIterator;
		void FillIterator (Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the list of all Entities, as an Iterator on Entities  
          (the Entities themselves, not the Reports)") Entities;
		Interface_EntityIterator Entities ();
		%feature("autodoc", "Args:
	semantic(Standard_Boolean)=Standard_False

Returns:
	Interface_EntityIterator

Returns the list of all ReportEntities, i.e. data about  
          Entities read with Error or Warning informations  
          (each item has to be casted to Report Entity then it can be  
          queried for Concerned Entity, Content, Check ...)  
          By default, returns the main reports, is <semantic> is True it  
          returns the list for sematic checks") Reports;
		Interface_EntityIterator Reports (const Standard_Boolean semantic = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the list of ReportEntities which redefine data  
          (generally, if concerned entity is 'Error', a literal content  
          is added to it : this is a 'redefined entity'") Redefineds;
		Interface_EntityIterator Redefineds ();
		%feature("autodoc", "Args:
	syntactic(Standard_Boolean)=Standard_True

Returns:
	Handle_Interface_Check

Returns the GlobalCheck, which memorizes messages global to  
          the file (not specific to an Entity), especially Header") GlobalCheck;
		const Handle_Interface_Check & GlobalCheck (const Standard_Boolean syntactic = Standard_True);
		%feature("autodoc", "Args:
	ach(Handle_Interface_Check)

Returns:
	None

Allows to modify GlobalCheck, after getting then completing it  
          Remark : it is SYNTACTIC check. Semantics, see FillChecks") SetGlobalCheck;
		void SetGlobalCheck (const Handle_Interface_Check & ach);
		%feature("autodoc", "Args:
	ach(Handle_Interface_Check)

Returns:
	virtual void

Minimum Semantic Global Check on data in model (header)  
          Can only check basic Data. See also GlobalCheck from Protocol  
          for a check which takes the Graph into account  
          Default does nothing, can be redefined") VerifyCheck;
		virtual void VerifyCheck (Handle_Interface_Check & ach);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)
	level(Standard_Integer)=0

Returns:
	virtual void

Dumps Header in a short, easy to read, form, onto a Stream  
          <level> allows to print more or less parts of the header,  
          if necessary. 0 for basic print") DumpHeader;
		virtual void DumpHeader (const Handle_Message_Messenger & S,const Standard_Integer level = 0);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	s(Handle_Message_Messenger)
	mode(Standard_Integer)=0

Returns:
	None

Prints identification of a given entity in <self>, in order to  
          be printed in a list or phrase  
          <mode> < 0 : prints only its number  
          <mode> = 1 : just calls PrintLabel  
          <mode> = 0 (D) : prints its number plus '/' plus PrintLabel  
          If <ent> == <self>, simply prints 'Global'  
          If <ent> is unknown, prints '??/its type'") Print;
		void Print (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & s,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	S(Handle_Message_Messenger)

Returns:
	virtual void

Prints label specific to each norm, for a given entity.  
          Must only print label itself, in order to be included in a  
          phrase. Can call the result of StringLabel, but not obliged.") PrintLabel;
		virtual void PrintLabel (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	S(Handle_Message_Messenger)

Returns:
	virtual void

Prints label specific to each norm in log format, for  
        a given entity.  
        By default, just calls PrintLabel, can be redefined") PrintToLog;
		virtual void PrintToLog (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	virtual Handle_TCollection_HAsciiString

Returns a string with the label attached to a given entity.  
 Warning : While this string may be edited on the spot, if it is a read  
          field, the returned value must be copied before.") StringLabel;
		virtual Handle_TCollection_HAsciiString StringLabel (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	label(char *)
	lastnum(Standard_Integer)=0
	exact(Standard_Boolean)=Standard_True

Returns:
	virtual Standard_Integer

Searches a label which matches with one entity.  
          Begins from <lastnum>+1 (default:1) and scans the entities  
          until <NbEntities>. For the first which matches <label>,  
          this method returns its Number. Returns 0 if nothing found  
          Can be called recursively (labels are not specified as unique)  
          <exact> : if True (default), exact match is required  
          else, checks the END of entity label  
 
          This method is virtual, hence it can be redefined for a more  
          efficient search (if exact is true).") NextNumberForLabel;
		virtual Standard_Integer NextNumberForLabel (const char * label,const Standard_Integer lastnum = 0,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Boolean

Returns true if a template is attached to a given name") HasTemplate;
		static Standard_Boolean HasTemplate (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Handle_Interface_InterfaceModel

Returns the template model attached to a name, or a Null Handle") Template;
		static Handle_Interface_InterfaceModel Template (const char * name);
		%feature("autodoc", "Args:
	name(char *)
	model(Handle_Interface_InterfaceModel)

Returns:
	static Standard_Boolean

Records a new template model with a name. If the name was  
          already recorded, the corresponding template is replaced by  
          the new one. Then, WARNING : test HasTemplate to avoid  
          surprises") SetTemplate;
		static Standard_Boolean SetTemplate (const char * name,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_TColStd_HSequenceOfHAsciiString

Returns the complete list of names attached to template models") ListTemplates;
		static Handle_TColStd_HSequenceOfHAsciiString ListTemplates ();
};


%feature("shadow") Interface_InterfaceModel::~Interface_InterfaceModel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_InterfaceModel {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_InterfaceModel {
	Handle_Interface_InterfaceModel GetHandle() {
	return *(Handle_Interface_InterfaceModel*) &$self;
	}
};

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
    Interface_InterfaceModel* GetObject() {
    return (Interface_InterfaceModel*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_InterfaceModel::~Handle_Interface_InterfaceModel %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_InterfaceModel {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_LineBuffer;
class Interface_LineBuffer {
	public:
		%feature("autodoc", "Args:
	size(Standard_Integer)=10

Returns:
	None

Creates a LineBuffer with an absolute maximum size  
          (Default value is only to satisfy compiler requirement)") Interface_LineBuffer;
		 Interface_LineBuffer (const Standard_Integer size = 10);
		%feature("autodoc", "Args:
	max(Standard_Integer)

Returns:
	None

Changes Maximum allowed size of Buffer.  
          If <max> is Zero, Maximum size is set to the initial size.") SetMax;
		void SetMax (const Standard_Integer max);
		%feature("autodoc", "Args:
	initial(Standard_Integer)

Returns:
	None

Sets an Initial reservation for Blank characters  
          (this reservation is counted in the size of the current Line)") SetInitial;
		void SetInitial (const Standard_Integer initial);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets a Keep Status at current Length. It means that at next  
          Move, the new line will begin by characters between Keep + 1  
          and current Length") SetKeep;
		void SetKeep ();
		%feature("autodoc", "Args:
	more(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if there is room enough to add <more> characters  
          Else, it is required to Dump the Buffer before refilling it  
          <more> is recorded to manage SetKeep status") CanGet;
		Standard_Boolean CanGet (const Standard_Integer more);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the Content of the LineBuffer  
was C++ : return const") Content;
		char * Content ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Length of the LineBuffer") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears completely the LineBuffer") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Inhibits effect of SetInitial until the next Move (i.e. Keep)  
          Then Prepare will not insert initial blanks, but further ones  
          will. This allows to cancel initial blanks on an internal Split  
          A call to SetInitial has no effect on this until Move") FreezeInitial;
		void FreezeInitial ();
		%feature("autodoc", "Args:
	str(TCollection_AsciiString)

Returns:
	None

Fills a AsciiString <str> with the Content of the Line Buffer,  
          then Clears the LineBuffer") Move;
		void Move (TCollection_AsciiString & str);
		%feature("autodoc", "Args:
	str(Handle_TCollection_HAsciiString)

Returns:
	None

Same as above, but <str> is known through a Handle") Move;
		void Move (const Handle_TCollection_HAsciiString & str);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Same as above, but generates the HAsciiString") Moved;
		Handle_TCollection_HAsciiString Moved ();
		%feature("autodoc", "Args:
	text(char *)

Returns:
	None

Adds a text as a CString. Its Length is evaluated from the  
          text (by C function strlen)") Add;
		void Add (const char * text);
		%feature("autodoc", "Args:
	text(char *)
	lntext(Standard_Integer)

Returns:
	None

Adds a text as a CString. Its length is given as <lntext>") Add;
		void Add (const char * text,const Standard_Integer lntext);
		%feature("autodoc", "Args:
	text(TCollection_AsciiString)

Returns:
	None

Adds a text as a AsciiString from TCollection") Add;
		void Add (const TCollection_AsciiString & text);
		%feature("autodoc", "Args:
	text(Standard_Character)

Returns:
	None

Adds a text made of only ONE Character") Add;
		void Add (const Standard_Character text);
};


%feature("shadow") Interface_LineBuffer::~Interface_LineBuffer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_LineBuffer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_MSG;
class Interface_MSG {
	public:
		%feature("autodoc", "Args:
	key(char *)

Returns:
	None

A MSG is created to write a 'functional code' in conjunction  
          with operator () attached to Value  
          Then, to have a translated message, write in C++ :  
 
          Interface_MSG('...mykey...')  which returns a CString  
          See also some help which follow") Interface_MSG;
		 Interface_MSG (const char * key);
		%feature("autodoc", "Args:
	key(char *)
	i1(Standard_Integer)

Returns:
	None

Translates a message which contains one integer variable  
          It is just a help which avoid the following :  
            char mess[100];  sprintf(mess,Interface_MSG('code'),ival);  
            then  AddFail(mess);  
          replaced by  AddFail (Interface_MSG('code',ival));  
 
          The basic message is intended to be in  C-sprintf  format,  
          with one %d form in it") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Integer i1);
		%feature("autodoc", "Args:
	key(char *)
	i1(Standard_Integer)
	i2(Standard_Integer)

Returns:
	None

Translates a message which contains two integer variables  
          As for one integer, it is just a writing help  
 
          The basic message is intended to be in  C-sprintf  format  
          with two %d forms in it") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Integer i1,const Standard_Integer i2);
		%feature("autodoc", "Args:
	key(char *)
	r1(Standard_Real)
	intervals(Standard_Integer)=- 1

Returns:
	None

Translates a message which contains one real variable  
          <intervals> if set, commands the variable to be rounded to an  
          interval (see below, method Intervals)  
          As for one integer, it is just a writing help  
 
          The basic message is intended to be in  C-sprintf  format  
          with one %f form (or equivalent : %e etc) in it") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Real r1,const Standard_Integer intervals = - 1);
		%feature("autodoc", "Args:
	key(char *)
	str(char *)

Returns:
	None

Translates a message which contains one string variable  
          As for one integer, it is just a writing help  
 
          The basic message is intended to be in  C-sprintf  format  
          with one %s form in it") Interface_MSG;
		 Interface_MSG (const char * key,const char * str);
		%feature("autodoc", "Args:
	key(char *)
	ival(Standard_Integer)
	str(char *)

Returns:
	None

Translates a message which contains one integer and one  
          string variables  
          As for one integer, it is just a writing help  
          Used for instance to say 'Param n0.<ival> i.e. <str> is not..'  
 
          The basic message is intended to be in  C-sprintf  format  
          with one %d then one %s forms in it") Interface_MSG;
		 Interface_MSG (const char * key,const Standard_Integer ival,const char * str);
		%feature("autodoc", "Args:
	None
Returns:
	None

Optimised destructor (applies for additional forms of Create)") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the translated message, in a functional form with  
          operator ()  
was C++ : return const") Value;
		char * Value ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") operatorStandard_CString;
		 operator Standard_CString ();
		%feature("autodoc", "Args:
	S(Standard_IStream)

Returns:
	static Standard_Integer

Reads a list of messages from a stream, returns read count  
          0 means empty file, -1 means error") Read;
		static Standard_Integer Read (Standard_IStream & S);
		%feature("autodoc", "Args:
	file(char *)

Returns:
	static Standard_Integer

Reads a list of messages from a file defined by its name") Read;
		static Standard_Integer Read (const char * file);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	rootkey(char *)=

Returns:
	static Standard_Integer

Writes the list of messages recorded to be translated, to a  
          stream. Writes all the list (Default) or only keys which begin  
          by <rootkey>. Returns the count of written messages") Write;
		static Standard_Integer Write (Standard_OStream & S,const char * rootkey = "");
		%feature("autodoc", "Args:
	mess(char *)

Returns:
	static Standard_Boolean

Returns True if a given message is surely a key  
          (according to the form adopted for keys)  
          (before activating messages, answer is false)") IsKey;
		static Standard_Boolean IsKey (const char * mess);
		%feature("autodoc", "Args:
	key(char *)

Returns:
	static char *

Returns the item recorded for a key.  
          Returns the key itself if :  
          - it is not recorded (then, the trace system is activated)  
          - MSG has been required to be hung on") Translated;
		static char * Translated (const char * key);
		%feature("autodoc", "Args:
	key(char *)
	item(char *)

Returns:
	static void

Fills the dictionary with a couple (key-item)  
          If a key is already recorded, it is possible to :  
          - keep the last definition, and activate the trace system") Record;
		static void Record (const char * key,const char * item);
		%feature("autodoc", "Args:
	toprint(Standard_Boolean)
	torecord(Standard_Boolean)

Returns:
	static void

Sets the trace system to work when activated, as follow :  
          - if <toprint>  is True, print immediately on standard output  
          - if <torecord> is True, record it for further print") SetTrace;
		static void SetTrace (const Standard_Boolean toprint,const Standard_Boolean torecord);
		%feature("autodoc", "Args:
	running(Standard_Boolean)
	raising(Standard_Boolean)

Returns:
	static void

Sets the main modes for MSG :  
          - if <running> is True, translation works normally  
          - if <running> is False, translated item equate keys  
          - if <raising> is True, errors (from Record or Translate)  
            cause MSG to raise an exception  
          - if <raising> is False, MSG runs without exception, then  
            see also Trace Modes above") SetMode;
		static void SetMode (const Standard_Boolean running,const Standard_Boolean raising);
		%feature("autodoc", "Args:
	S(Standard_OStream)

Returns:
	static void

Prints the recorded errors (without title; can be empty, this  
          is the normally expected case)") PrintTrace;
		static void PrintTrace (Standard_OStream & S);
		%feature("autodoc", "Args:
	val(Standard_Real)
	order(Standard_Integer)=3
	upper(Standard_Boolean)=Standard_False

Returns:
	static Standard_Real

Returns an 'intervalled' value from a starting real <val> :  
          i.e. a value which is rounded on an interval limit  
          Interval limits are defined to be in a coarsely 'geometric'  
          progression (two successive intervals are inside a limit ratio)  
 
          <order> gives the count of desired intervals in a range <1-10>  
          <upper> False, returns the first lower interval (D)  
          <upper> True,  returns the first upper interval  
          Values of Intervals according <order> :  
          0,1 : 1 10 100 ...  
          2   : 1 3 10 30 100 ...  
          3(D): 1 2 5 10 20 50 100 ...  
          4   : 1 2 3 6 10 20 30 60 100 ...  
          6   : 1 1.5 2 3 5 7 10 15 20 ...  
          10  : 1 1.2 1.5 2 2.5 3 4 5 6 8 10 12 15 20 25 ...") Intervalled;
		static Standard_Real Intervalled (const Standard_Real val,const Standard_Integer order = 3,const Standard_Boolean upper = Standard_False);
		%feature("autodoc", "Args:
	text(char *)
	yy(Standard_Integer)
	mm(Standard_Integer)
	dd(Standard_Integer)
	hh(Standard_Integer)
	mn(Standard_Integer)
	ss(Standard_Integer)
	format(char *)=

Returns:
	static void

Codes a date as a text, from its numeric value (-> seconds) :  
          YYYY-MM-DD:HH-MN-SS  fixed format, completed by leading zeros  
          Another format can be provided, as follows :  
          C:%d ...   C like format, preceeded by  C:  
          S:...      format to call system (not yet implemented)") TDate;
		static void TDate (const char * text,const Standard_Integer yy,const Standard_Integer mm,const Standard_Integer dd,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const char * format = "");
		%feature("autodoc", "Args:
	text(char *)
	yy(Standard_Integer)
	mm(Standard_Integer)
	dd(Standard_Integer)
	hh(Standard_Integer)
	mn(Standard_Integer)
	ss(Standard_Integer)

Returns:
	static Standard_Boolean

Decodes a date to numeric integer values  
          Returns True if OK, False if text does not fit with required  
          format. Incomplete forms are allowed (for instance, for only  
          YYYY-MM-DD, hour is zero)") NDate;
		static Standard_Boolean NDate (const char * text,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	text1(char *)
	text2(char *)

Returns:
	static Standard_Integer

Returns a value about comparison of two dates  
          0 : equal. <0 text1 anterior. >0 text1 posterior") CDate;
		static Standard_Integer CDate (const char * text1,const char * text2);
		%feature("autodoc", "Args:
	val(Standard_Integer)
	max(Standard_Integer)

Returns:
	static char *

Returns a blank string, of length between 0 and <max>, to fill  
          the printing of a numeric value <val>, i.e. :  
          If val < 10 , max-1 blanks  
          If val between 10 and 99, max-2 blanks  ...   etc...") Blanks;
		static char * Blanks (const Standard_Integer val,const Standard_Integer max);
		%feature("autodoc", "Args:
	val(char *)
	max(Standard_Integer)

Returns:
	static char *

Returns a blank string, to complete a given string <val> up to  
          <max> characters :  
          If strlen(val) is 0, max blanks  
          If strlen(val) is 5, max-5 blanks    etc...") Blanks;
		static char * Blanks (const char * val,const Standard_Integer max);
		%feature("autodoc", "Args:
	count(Standard_Integer)

Returns:
	static char *

Returns a blank string of <count> blanks (mini 0, maxi 76)") Blanks;
		static char * Blanks (const Standard_Integer count);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	val(char *)
	max(Standard_Integer)
	just(Standard_Integer)=- 1

Returns:
	static void

Prints a String on an Output Stream, as follows :  
          Accompagned with blanks, to give up to <max> charis at all,  
          justified according just :  
          -1 (D) : left     0 : center    1 : right  
          Maximum 76 characters") Print;
		static void Print (Standard_OStream & S,const char * val,const Standard_Integer max,const Standard_Integer just = - 1);
};


%feature("shadow") Interface_MSG::~Interface_MSG %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_MSG {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_MapAsciiStringHasher;
class Interface_MapAsciiStringHasher {
	public:
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const TCollection_AsciiString & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(TCollection_AsciiString)
	K2(TCollection_AsciiString)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const TCollection_AsciiString & K1,const TCollection_AsciiString & K2);
};


%feature("shadow") Interface_MapAsciiStringHasher::~Interface_MapAsciiStringHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_MapAsciiStringHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_NodeOfGeneralLib;
class Interface_NodeOfGeneralLib : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_NodeOfGeneralLib;
		 Interface_NodeOfGeneralLib ();
		%feature("autodoc", "Args:
	anode(Handle_Interface_GlobalNodeOfGeneralLib)

Returns:
	None

No detailed docstring for this function.") AddNode;
		void AddNode (const Handle_Interface_GlobalNodeOfGeneralLib & anode);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_GeneralModule

No detailed docstring for this function.") Module;
		const Handle_Interface_GeneralModule & Module ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

No detailed docstring for this function.") Protocol;
		const Handle_Interface_Protocol & Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_NodeOfGeneralLib

No detailed docstring for this function.") Next;
		const Handle_Interface_NodeOfGeneralLib & Next ();
};


%feature("shadow") Interface_NodeOfGeneralLib::~Interface_NodeOfGeneralLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_NodeOfGeneralLib {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_NodeOfGeneralLib {
	Handle_Interface_NodeOfGeneralLib GetHandle() {
	return *(Handle_Interface_NodeOfGeneralLib*) &$self;
	}
};

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
    Interface_NodeOfGeneralLib* GetObject() {
    return (Interface_NodeOfGeneralLib*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_NodeOfGeneralLib::~Handle_Interface_NodeOfGeneralLib %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_NodeOfGeneralLib {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_NodeOfReaderLib;
class Interface_NodeOfReaderLib : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_NodeOfReaderLib;
		 Interface_NodeOfReaderLib ();
		%feature("autodoc", "Args:
	anode(Handle_Interface_GlobalNodeOfReaderLib)

Returns:
	None

No detailed docstring for this function.") AddNode;
		void AddNode (const Handle_Interface_GlobalNodeOfReaderLib & anode);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_ReaderModule

No detailed docstring for this function.") Module;
		const Handle_Interface_ReaderModule & Module ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

No detailed docstring for this function.") Protocol;
		const Handle_Interface_Protocol & Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_NodeOfReaderLib

No detailed docstring for this function.") Next;
		const Handle_Interface_NodeOfReaderLib & Next ();
};


%feature("shadow") Interface_NodeOfReaderLib::~Interface_NodeOfReaderLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_NodeOfReaderLib {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_NodeOfReaderLib {
	Handle_Interface_NodeOfReaderLib GetHandle() {
	return *(Handle_Interface_NodeOfReaderLib*) &$self;
	}
};

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
    Interface_NodeOfReaderLib* GetObject() {
    return (Interface_NodeOfReaderLib*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_NodeOfReaderLib::~Handle_Interface_NodeOfReaderLib %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_NodeOfReaderLib {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_ParamList;
class Interface_ParamList : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	theIncrement(Standard_Integer)=256

Returns:
	None

Creates an vector with size of memmory blok equal to theIncrement") Interface_ParamList;
		 Interface_ParamList (const Standard_Integer theIncrement = 256);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of elements of <self>.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the lower bound.  
Warning") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the upper bound.  
Warning") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Interface_FileParameter)

Returns:
	None

Assigns the value <Value> to the <Index>-th item of this array.") SetValue;
		void SetValue (const Standard_Integer Index,const Interface_FileParameter & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Interface_FileParameter

Return the value of  the  <Index>th element of the  
         array.") Value;
		const Interface_FileParameter & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Interface_FileParameter

return the value  of the <Index>th element  of the  
         array.") ChangeValue;
		Interface_FileParameter & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
};


%feature("shadow") Interface_ParamList::~Interface_ParamList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_ParamList {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_ParamList {
	Handle_Interface_ParamList GetHandle() {
	return *(Handle_Interface_ParamList*) &$self;
	}
};

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
    Interface_ParamList* GetObject() {
    return (Interface_ParamList*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_ParamList::~Handle_Interface_ParamList %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_ParamList {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_ParamSet;
class Interface_ParamSet : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	nres(Standard_Integer)
	nst(Standard_Integer)=1

Returns:
	None

Creates an empty ParamSet, beginning at number 'nst' and of  
          initial reservation 'nres' : the 'nres' first parameters  
          which follow 'ndeb' (included) will be put in an Array  
          (a ParamList). The remainders are set in Next(s) ParamSet(s)") Interface_ParamSet;
		 Interface_ParamSet (const Standard_Integer nres,const Standard_Integer nst = 1);
		%feature("autodoc", "Args:
	val(char *)
	lnval(Standard_Integer)
	typ(Interface_ParamType)
	nument(Standard_Integer)

Returns:
	Standard_Integer

Adds a parameter defined as its Value (CString and length) and  
          Type. Optionnal EntityNumber (for FileReaderData) can be given  
          Allows a better memory management than Appending a  
          complete FileParameter  
          If <lnval> < 0, <val> is assumed to be managed elsewhere : its  
          adress is stored as such. Else, <val> is copied in a locally  
          (quickly) managed Page of Characters  
          Returns new count of recorded Parameters") Append;
		Standard_Integer Append (const char * val,const Standard_Integer lnval,const Interface_ParamType typ,const Standard_Integer nument);
		%feature("autodoc", "Args:
	FP(Interface_FileParameter)

Returns:
	Standard_Integer

Adds a parameter at the end of the ParamSet (transparent  
          about reservation and 'Next')  
          Returns new count of recorded Parameters") Append;
		Standard_Integer Append (const Interface_FileParameter & FP);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the total count of parameters (including nexts)") NbParams;
		Standard_Integer NbParams ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Interface_FileParameter

Returns a parameter identified by its number") Param;
		const Interface_FileParameter & Param (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Interface_FileParameter

Same as above, but in order to be modified on place") ChangeParam;
		Interface_FileParameter & ChangeParam (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	FP(Interface_FileParameter)

Returns:
	None

Changes a parameter identified by its number") SetParam;
		void SetParam (const Standard_Integer num,const Interface_FileParameter & FP);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	nb(Standard_Integer)

Returns:
	Handle_Interface_ParamList

Builds and returns the sub-list correspinding to parameters,  
          from 'num' included, with count 'nb'  
          If <num> and <nb> are zero, returns the whole list") Params;
		Handle_Interface_ParamList Params (const Standard_Integer num,const Standard_Integer nb);
		%feature("autodoc", "Args:
	None
Returns:
	None

Destructor (waiting for transparent memory management)") Destroy;
		void Destroy ();
};


%feature("shadow") Interface_ParamSet::~Interface_ParamSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_ParamSet {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_ParamSet {
	Handle_Interface_ParamSet GetHandle() {
	return *(Handle_Interface_ParamSet*) &$self;
	}
};

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
    Interface_ParamSet* GetObject() {
    return (Interface_ParamSet*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_ParamSet::~Handle_Interface_ParamSet %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_ParamSet {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_Protocol;
class Interface_Protocol : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Interface_Protocol

Returns the Active Protocol, if defined (else, returns a  
          Null Handle, which means 'no defined active protocol')") Active;
		static Handle_Interface_Protocol Active ();
		%feature("autodoc", "Args:
	aprotocol(Handle_Interface_Protocol)

Returns:
	static void

Sets a given Protocol to be the Active one (for the users of  
          Active, see just above). Applies to every sub-type of Protocol") SetActive;
		static void SetActive (const Handle_Interface_Protocol & aprotocol);
		%feature("autodoc", "Args:
	None
Returns:
	static void

Erases the Active Protocol (hence it becomes undefined)") ClearActive;
		static void ClearActive ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns count of Protocol used as Resources (level one)") NbResources;
		virtual Standard_Integer NbResources ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	virtual Handle_Interface_Protocol

Returns a Resource, given its rank (between 1 and NbResources)") Resource;
		virtual Handle_Interface_Protocol Resource (const Standard_Integer num);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)

Returns:
	virtual Standard_Integer

Returns a unique positive CaseNumber for each Recognized  
          Object. By default, recognition is based on Type(1)  
          By default, calls the following one which is deferred.") CaseNumber;
		virtual Standard_Integer CaseNumber (const Handle_Standard_Transient & obj);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Returns True if type of <obj> is that defined from CDL  
          This is the default but it may change according implementation") IsDynamicType;
		virtual Standard_Boolean IsDynamicType (const Handle_Standard_Transient & obj);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)

Returns:
	virtual Standard_Integer

Returns the count of DISTINCT types under which an entity may  
          be processed. Each one is candidate to be recognized by  
          TypeNumber, <obj> is then processed according it  
          By default, returns 1 (the DynamicType)") NbTypes;
		virtual Standard_Integer NbTypes (const Handle_Standard_Transient & obj);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)
	nt(Standard_Integer)=1

Returns:
	Handle_Standard_Type

Returns a type under which <obj> can be recognized and  
          processed, according its rank in its definition list (see  
          NbTypes).  
          By default, returns DynamicType") Type;
		Handle_Standard_Type Type (const Handle_Standard_Transient & obj,const Standard_Integer nt = 1);
		%feature("autodoc", "Args:
	atype(Handle_Standard_Type)

Returns:
	virtual Standard_Integer

Returns a unique positive CaseNumber for each Recognized Type,  
          Returns Zero for '<type> not recognized'") TypeNumber;
		virtual Standard_Integer TypeNumber (const Handle_Standard_Type & atype);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	ach(Handle_Interface_Check)

Returns:
	virtual Standard_Boolean

Evaluates a Global Check for a model (with its Graph)  
          Returns True when done, False if data in model do not apply  
 
          Very specific of each norm, i.e. of each protocol : the  
          uppest level Protocol assumes it, it can call GlobalCheck of  
          its ressources only if it is necessary  
 
          Default does nothing, can be redefined") GlobalCheck;
		virtual Standard_Boolean GlobalCheck (const Interface_Graph & G,Handle_Interface_Check & ach);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Interface_InterfaceModel

Creates an empty Model of the considered Norm") NewModel;
		virtual Handle_Interface_InterfaceModel NewModel ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Returns True if <model> is a Model of the considered Norm") IsSuitableModel;
		virtual Standard_Boolean IsSuitableModel (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Standard_Transient

Creates a new Unknown Entity for the considered Norm") UnknownEntity;
		virtual Handle_Standard_Transient UnknownEntity ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Returns True if <ent> is an Unknown Entity for the Norm, i.e.  
          same Type as them created by method UnknownEntity  
          (for an Entity out of the Norm, answer can be unpredicable)") IsUnknownEntity;
		virtual Standard_Boolean IsUnknownEntity (const Handle_Standard_Transient & ent);
};


%feature("shadow") Interface_Protocol::~Interface_Protocol %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_Protocol {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_Protocol {
	Handle_Interface_Protocol GetHandle() {
	return *(Handle_Interface_Protocol*) &$self;
	}
};

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
    Interface_Protocol* GetObject() {
    return (Interface_Protocol*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_Protocol::~Handle_Interface_Protocol %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_Protocol {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_ReaderLib;
class Interface_ReaderLib {
	public:
		%feature("autodoc", "Args:
	amodule(Handle_Interface_ReaderModule)
	aprotocol(Handle_Interface_Protocol)

Returns:
	static void

No detailed docstring for this function.") SetGlobal;
		static void SetGlobal (const Handle_Interface_ReaderModule & amodule,const Handle_Interface_Protocol & aprotocol);
		%feature("autodoc", "Args:
	aprotocol(Handle_Interface_Protocol)

Returns:
	None

No detailed docstring for this function.") Interface_ReaderLib;
		 Interface_ReaderLib (const Handle_Interface_Protocol & aprotocol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_ReaderLib;
		 Interface_ReaderLib ();
		%feature("autodoc", "Args:
	aprotocol(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") AddProtocol;
		void AddProtocol (const Handle_Standard_Transient & aprotocol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetComplete;
		void SetComplete ();
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)
	module(Handle_Interface_ReaderModule)
	CN(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Select;
		Standard_Boolean Select (const Handle_Standard_Transient & obj,Handle_Interface_ReaderModule & module,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Start;
		void Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_ReaderModule

No detailed docstring for this function.") Module;
		const Handle_Interface_ReaderModule & Module ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

No detailed docstring for this function.") Protocol;
		const Handle_Interface_Protocol & Protocol ();
};


%feature("shadow") Interface_ReaderLib::~Interface_ReaderLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_ReaderLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_ReaderModule;
class Interface_ReaderModule : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	data(Handle_Interface_FileReaderData)
	num(Standard_Integer)

Returns:
	virtual Standard_Integer

Translates the type of record <num> in <data> to a positive  
          Case Number. If Recognition fails, must return 0") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Interface_FileReaderData & data,const Standard_Integer num);
		%feature("autodoc", "Args:
	casenum(Standard_Integer)
	data(Handle_Interface_FileReaderData)
	num(Standard_Integer)
	ach(Handle_Interface_Check)
	ent(Handle_Standard_Transient)

Returns:
	virtual void

Performs the effective loading from <data>, record <num>,  
          to the Entity <ent> formerly created  
          In case of Error or Warning, fills <ach> with messages  
          Remark that the Case Number comes from translating a record") Read;
		virtual void Read (const Standard_Integer casenum,const Handle_Interface_FileReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	casenum(Standard_Integer)
	data(Handle_Interface_FileReaderData)
	num(Standard_Integer)
	ach(Handle_Interface_Check)
	ent(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Specific operator (create+read) defaulted to do nothing.  
          It can be redefined when it is not possible to work in two  
          steps (NewVoid then Read). This occurs when no default  
          constructor is defined : hence the result <ent> must be  
          created with an effective definition from the reader.  
          Remark : if NewRead is defined, Copy has nothing to do.  
 
          Returns True if it has produced something, false else.  
          If nothing was produced, <ach> should be filled : it will be  
          treated as 'Unrecognized case' by reader tool.") NewRead;
		virtual Standard_Boolean NewRead (const Standard_Integer casenum,const Handle_Interface_FileReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,Handle_Standard_Transient & ent);
};


%feature("shadow") Interface_ReaderModule::~Interface_ReaderModule %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_ReaderModule {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_ReaderModule {
	Handle_Interface_ReaderModule GetHandle() {
	return *(Handle_Interface_ReaderModule*) &$self;
	}
};

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
    Interface_ReaderModule* GetObject() {
    return (Interface_ReaderModule*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_ReaderModule::~Handle_Interface_ReaderModule %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_ReaderModule {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_ReportEntity;
class Interface_ReportEntity : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	unknown(Handle_Standard_Transient)

Returns:
	None

Creates a ReportEntity for an Unknown Entity : Check is empty,  
          and Concerned equates Content (i.e. the Unknown Entity)") Interface_ReportEntity;
		 Interface_ReportEntity (const Handle_Standard_Transient & unknown);
		%feature("autodoc", "Args:
	acheck(Handle_Interface_Check)
	concerned(Handle_Standard_Transient)

Returns:
	None

Creates a ReportEntity with its features :  
          - <acheck> is the Check to be memorised  
          - <concerned> is the Entity to which the Check is bound  
          Later, a Content can be set : it is required for an Error") Interface_ReportEntity;
		 Interface_ReportEntity (const Handle_Interface_Check & acheck,const Handle_Standard_Transient & concerned);
		%feature("autodoc", "Args:
	content(Handle_Standard_Transient)

Returns:
	None

Sets a Content : it brings non interpreted data which belong  
          to the Concerned Entity. It can be empty then loaded later.  
          Remark that for an Unknown Entity, Content is set by Create.") SetContent;
		void SetContent (const Handle_Standard_Transient & content);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Check

Returns the stored Check") Check;
		const Handle_Interface_Check & Check ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Check

Returns the stored Check in order to change it") CCheck;
		Handle_Interface_Check & CCheck ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the stored Concerned Entity. It equates the Content  
          in the case of an Unknown Entity") Concerned;
		Handle_Standard_Transient Concerned ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Content is stored (it can equate Concerned)") HasContent;
		Standard_Boolean HasContent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Content is stored AND differs from Concerned  
          (i.e. redefines content) : used when Concerned could not be  
          loaded") HasNewContent;
		Standard_Boolean HasNewContent ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the stored Content, or a Null Handle  
          Remark that it must be an 'Unknown Entity' suitable for  
          the norm of the containing Model") Content;
		Handle_Standard_Transient Content ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True for an Error Entity, i.e. if the Check  
          brings at least one Fail message") IsError;
		Standard_Boolean IsError ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True for an Unknown Entity, i,e. if the Check  
          is empty and Concerned equates Content") IsUnknown;
		Standard_Boolean IsUnknown ();
};


%feature("shadow") Interface_ReportEntity::~Interface_ReportEntity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_ReportEntity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_ReportEntity {
	Handle_Interface_ReportEntity GetHandle() {
	return *(Handle_Interface_ReportEntity*) &$self;
	}
};

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
    Interface_ReportEntity* GetObject() {
    return (Interface_ReportEntity*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_ReportEntity::~Handle_Interface_ReportEntity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_ReportEntity {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_SequenceNodeOfSequenceOfCheck;
class Interface_SequenceNodeOfSequenceOfCheck : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Interface_Check)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Interface_SequenceNodeOfSequenceOfCheck;
		 Interface_SequenceNodeOfSequenceOfCheck (const Handle_Interface_Check & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Check

No detailed docstring for this function.") Value;
		Handle_Interface_Check & Value ();
};


%feature("shadow") Interface_SequenceNodeOfSequenceOfCheck::~Interface_SequenceNodeOfSequenceOfCheck %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_SequenceNodeOfSequenceOfCheck {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_SequenceNodeOfSequenceOfCheck {
	Handle_Interface_SequenceNodeOfSequenceOfCheck GetHandle() {
	return *(Handle_Interface_SequenceNodeOfSequenceOfCheck*) &$self;
	}
};

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
    Interface_SequenceNodeOfSequenceOfCheck* GetObject() {
    return (Interface_SequenceNodeOfSequenceOfCheck*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_SequenceNodeOfSequenceOfCheck::~Handle_Interface_SequenceNodeOfSequenceOfCheck %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_SequenceNodeOfSequenceOfCheck {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_SequenceOfCheck;
class Interface_SequenceOfCheck : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_SequenceOfCheck;
		 Interface_SequenceOfCheck ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Interface_SequenceOfCheck)

Returns:
	Interface_SequenceOfCheck

No detailed docstring for this function.") Assign;
		const Interface_SequenceOfCheck & Assign (const Interface_SequenceOfCheck & Other);
		%feature("autodoc", "Args:
	Other(Interface_SequenceOfCheck)

Returns:
	Interface_SequenceOfCheck

No detailed docstring for this function.") operator=;
		const Interface_SequenceOfCheck & operator = (const Interface_SequenceOfCheck & Other);
		%feature("autodoc", "Args:
	T(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Interface_Check & T);
		%feature("autodoc", "Args:
	S(Interface_SequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Interface_SequenceOfCheck & S);
		%feature("autodoc", "Args:
	T(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Interface_Check & T);
		%feature("autodoc", "Args:
	S(Interface_SequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Interface_SequenceOfCheck & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Interface_Check & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Interface_SequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Interface_SequenceOfCheck & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Interface_Check & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Interface_SequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Interface_SequenceOfCheck & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Check

No detailed docstring for this function.") First;
		const Handle_Interface_Check & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Check

No detailed docstring for this function.") Last;
		const Handle_Interface_Check & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Interface_SequenceOfCheck)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Interface_SequenceOfCheck & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Interface_Check

No detailed docstring for this function.") Value;
		const Handle_Interface_Check & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Interface_Check)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Interface_Check & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Interface_Check

No detailed docstring for this function.") ChangeValue;
		Handle_Interface_Check & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Interface_SequenceOfCheck::~Interface_SequenceOfCheck %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_SequenceOfCheck {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_ShareFlags;
class Interface_ShareFlags {
	public:
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	lib(Interface_GeneralLib)

Returns:
	None

Creates a ShareFlags from a Model and builds required data  
          (flags) by calling the General Service Library given as  
          argument <lib>") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	gtool(Handle_Interface_GTool)

Returns:
	None

Same as above, but GeneralLib is detained by a GTool") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)

Returns:
	None

Same as above, but GeneralLib is defined through a Protocol") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	None

Same as above, but works with the GTool of the Model") Interface_ShareFlags;
		 Interface_ShareFlags (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)

Returns:
	None

Creates a ShareFlags by querying informations from a Graph  
          (remark that Graph also has a method IsShared)") Interface_ShareFlags;
		 Interface_ShareFlags (const Interface_Graph & agraph);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the Model used for the evaluation") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if <ent> is Shared by one or more other  
          Entity(ies) of the Model") IsShared;
		Standard_Boolean IsShared (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the Entities which are not Shared (see their flags)") RootEntities;
		Interface_EntityIterator RootEntities ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of root entities") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "Args:
	num(Standard_Integer)=1

Returns:
	Handle_Standard_Transient

Returns a root entity according its rank in the list of roots  
          By default, it returns the first one") Root;
		Handle_Standard_Transient Root (const Standard_Integer num = 1);
};


%feature("shadow") Interface_ShareFlags::~Interface_ShareFlags %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_ShareFlags {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_ShareTool;
class Interface_ShareTool {
	public:
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	lib(Interface_GeneralLib)

Returns:
	None

Creates a ShareTool from a Model and builds all required data,  
          by calling the General Service Library and Modules  
          (GeneralLib given as an argument)") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	gtool(Handle_Interface_GTool)

Returns:
	None

Same a above, but GeneralLib is detained by a GTool") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_GTool & gtool);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)

Returns:
	None

Same a above, but GeneralLib is defined through a Protocol  
          Protocol is used to build the working library") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	None

Same as above, but works with the GTool of the Model") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)

Returns:
	None

Creates a ShareTool from an already defined Graph  
          Remark that the data of the Graph are copied") Interface_ShareTool;
		 Interface_ShareTool (const Interface_Graph & agraph);
		%feature("autodoc", "Args:
	ahgraph(Handle_Interface_HGraph)

Returns:
	None

Completes the Graph by Adding Implied References. Hence, they  
          are considered as Sharing References in all the other queries") Interface_ShareTool;
		 Interface_ShareTool (const Handle_Interface_HGraph & ahgraph);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the Model used for Creation (directly or for Graph)") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Graph

Returns the data used by the ShareTool to work  
          Can then be used directly (read only)") Graph;
		const Interface_Graph & Graph ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the Entities which are not Shared (their Sharing List  
          is empty) in the Model") RootEntities;
		Interface_EntityIterator RootEntities ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if <ent> is Shared by other Entities in the Model") IsShared;
		Standard_Boolean IsShared (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Interface_EntityIterator

Returns the List of Entities Shared by a given Entity <ent>") Shareds;
		Interface_EntityIterator Shareds (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Interface_EntityIterator

Returns the List of Entities Sharing a given Entity <ent>") Sharings;
		Interface_EntityIterator Sharings (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	atype(Handle_Standard_Type)

Returns:
	Standard_Integer

Returns the count of Sharing Entities of an Entity, which  
          are Kind of a given Type") NbTypedSharings;
		Standard_Integer NbTypedSharings (const Handle_Standard_Transient & ent,const Handle_Standard_Type & atype);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	atype(Handle_Standard_Type)

Returns:
	Handle_Standard_Transient

Returns the Sharing Entity of an Entity, which is Kind of a  
          given Type. Allows to access a Sharing Entity of a given type  
          when there is one and only one (current case)") TypedSharing;
		Handle_Standard_Transient TypedSharing (const Handle_Standard_Transient & ent,const Handle_Standard_Type & atype);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	rootlast(Standard_Boolean)=Standard_True

Returns:
	Interface_EntityIterator

Returns the complete list of entities shared by <ent> at any  
          level, including <ent> itself  
          If <ent> is the Model, considers the concatenation of  
          AllShared for each root  
          If <rootlast> is True (D), the list starts with lower level  
          entities and ends by the root. Else, the root is first and  
          the lower level entities are at end") All;
		Interface_EntityIterator All (const Handle_Standard_Transient & ent,const Standard_Boolean rootlast = Standard_True);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)
	S(Handle_Message_Messenger)

Returns:
	None

Utility method which Prints the content of an iterator  
          (by their Numbers)") Print;
		void Print (const Interface_EntityIterator & iter,const Handle_Message_Messenger & S);
};


%feature("shadow") Interface_ShareTool::~Interface_ShareTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_ShareTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_SignLabel;
class Interface_SignLabel : public MoniTool_SignText {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Interface_SignLabel;
		 Interface_SignLabel ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns 'Entity Label'") Name;
		char * Name ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	context(Handle_Standard_Transient)

Returns:
	TCollection_AsciiString

Considers context as an InterfaceModel and returns the Label  
          computed by it") Text;
		TCollection_AsciiString Text (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & context);
};


%feature("shadow") Interface_SignLabel::~Interface_SignLabel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_SignLabel {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_SignLabel {
	Handle_Interface_SignLabel GetHandle() {
	return *(Handle_Interface_SignLabel*) &$self;
	}
};

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
    Interface_SignLabel* GetObject() {
    return (Interface_SignLabel*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_SignLabel::~Handle_Interface_SignLabel %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_SignLabel {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_SignType;
class Interface_SignType : public MoniTool_SignText {
	public:
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	context(Handle_Standard_Transient)

Returns:
	TCollection_AsciiString

Returns an identification of the Signature (a word), given at  
          initialization time  Specialised to consider context as an InterfaceModel") Text;
		TCollection_AsciiString Text (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & context);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual char *

Returns the Signature for a Transient object. It is specific  
          of each sub-class of Signature. For a Null Handle, it should  
          provide ''  
          It can work with the model which contains the entity") Value;
		virtual char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	typnam(char *)

Returns:
	static char *

From a CDL Type Name, returns the Class part (package dropped)  
          WARNING : buffered, to be immediately copied or printed") ClassName;
		static char * ClassName (const char * typnam);
};


%feature("shadow") Interface_SignType::~Interface_SignType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_SignType {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_SignType {
	Handle_Interface_SignType GetHandle() {
	return *(Handle_Interface_SignType*) &$self;
	}
};

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
    Interface_SignType* GetObject() {
    return (Interface_SignType*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_SignType::~Handle_Interface_SignType %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_SignType {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_TypedValue;
class Interface_TypedValue : public MoniTool_TypedValue {
	public:
		%feature("autodoc", "Args:
	name(char *)
	type(Interface_ParamType)=Interface_ParamText
	init(char *)=

Returns:
	None

Creates a TypedValue, with a name  
 
          type gives the type of the parameter, default is free text  
          Also available : Integer, Real, Enum, Entity (i.e. Object)  
          More precise specifications, titles, can be given to the  
          TypedValue once created  
 
          init gives an initial value. If it is not given, the  
          TypedValue begins as 'not set', its value is empty") Interface_TypedValue;
		 Interface_TypedValue (const char * name,const Interface_ParamType type = Interface_ParamText,const char * init = "");
		%feature("autodoc", "Args:
	None
Returns:
	Interface_ParamType

Returns the type  
          I.E. calls ValueType then makes correspondance between  
            ParamType from Interface (which remains for compatibility  
             reasons) and ValueType from MoniTool") Type;
		Interface_ParamType Type ();
		%feature("autodoc", "Args:
	typ(Interface_ParamType)

Returns:
	static MoniTool_ValueType

Correspondance ParamType from Interface  to  
              ValueType from MoniTool") ParamTypeToValueType;
		static MoniTool_ValueType ParamTypeToValueType (const Interface_ParamType typ);
		%feature("autodoc", "Args:
	typ(MoniTool_ValueType)

Returns:
	static Interface_ParamType

Correspondance ParamType from Interface  to  
              ValueType from MoniTool") ValueTypeToParamType;
		static Interface_ParamType ValueTypeToParamType (const MoniTool_ValueType typ);
};


%feature("shadow") Interface_TypedValue::~Interface_TypedValue %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_TypedValue {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_TypedValue {
	Handle_Interface_TypedValue GetHandle() {
	return *(Handle_Interface_TypedValue*) &$self;
	}
};

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
    Interface_TypedValue* GetObject() {
    return (Interface_TypedValue*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_TypedValue::~Handle_Interface_TypedValue %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_TypedValue {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_UndefinedContent;
class Interface_UndefinedContent : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Defines an empty UndefinedContent") Interface_UndefinedContent;
		 Interface_UndefinedContent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives count of recorded parameters") NbParams;
		Standard_Integer NbParams ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives count of Literal Parameters") NbLiterals;
		Standard_Integer NbLiterals ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ptype(Interface_ParamType)
	ent(Handle_Standard_Transient)
	val(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Returns data of a Parameter : its type, and the entity if it  
          designates en entity ('ent') or its literal value else ('str')  
          Returned value (Boolean) : True if it is an Entity, False else") ParamData;
		Standard_Boolean ParamData (const Standard_Integer num,Interface_ParamType & ptype,Handle_Standard_Transient & ent,Handle_TCollection_HAsciiString & val);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Interface_ParamType

Returns the ParamType of a Param, given its rank  
          Error if num is not between 1 and NbParams") ParamType;
		Interface_ParamType ParamType (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if a Parameter is recorded as an entity  
          Error if num is not between 1 and NbParams") IsParamEntity;
		Standard_Boolean IsParamEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns Entity corresponding to a Param, given its rank") ParamEntity;
		Handle_Standard_Transient ParamEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

Returns litteral value of a Parameter, given its rank") ParamValue;
		Handle_TCollection_HAsciiString ParamValue (const Standard_Integer num);
		%feature("autodoc", "Args:
	nb(Standard_Integer)
	nblit(Standard_Integer)

Returns:
	None

Manages reservation for parameters (internal use)  
          (nb : total count of parameters, nblit : count of literals)") Reservate;
		void Reservate (const Standard_Integer nb,const Standard_Integer nblit);
		%feature("autodoc", "Args:
	ptype(Interface_ParamType)
	val(Handle_TCollection_HAsciiString)

Returns:
	None

Adds a literal Parameter to the list") AddLiteral;
		void AddLiteral (const Interface_ParamType ptype,const Handle_TCollection_HAsciiString & val);
		%feature("autodoc", "Args:
	ptype(Interface_ParamType)
	ent(Handle_Standard_Transient)

Returns:
	None

Adds a Parameter which references an Entity") AddEntity;
		void AddEntity (const Interface_ParamType ptype,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Removes a Parameter given its rank") RemoveParam;
		void RemoveParam (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ptype(Interface_ParamType)
	val(Handle_TCollection_HAsciiString)

Returns:
	None

Sets a new value for the Parameter <num>, to a literal value  
          (if it referenced formerly an Entity, this Entity is removed)") SetLiteral;
		void SetLiteral (const Standard_Integer num,const Interface_ParamType ptype,const Handle_TCollection_HAsciiString & val);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ptype(Interface_ParamType)
	ent(Handle_Standard_Transient)

Returns:
	None

Sets a new value for the Parameter <num>, to reference an  
          Entity. To simply change the Entity, see the variant below") SetEntity;
		void SetEntity (const Standard_Integer num,const Interface_ParamType ptype,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ent(Handle_Standard_Transient)

Returns:
	None

Changes the Entity referenced by the Parameter <num>  
          (with same ParamType)") SetEntity;
		void SetEntity (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityList

Returns globally the list of param entities. Note that it can  
          be used as shared entity list for the UndefinedEntity") EntityList;
		Interface_EntityList EntityList ();
		%feature("autodoc", "Args:
	other(Handle_Interface_UndefinedContent)
	TC(Interface_CopyTool)

Returns:
	None

Copies contents of undefined entities; deigned to be called by  
          GetFromAnother method from Undefined entity of each Interface  
          (the basic operation is the same regardless the norm)") GetFromAnother;
		void GetFromAnother (const Handle_Interface_UndefinedContent & other,Interface_CopyTool & TC);
};


%feature("shadow") Interface_UndefinedContent::~Interface_UndefinedContent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_UndefinedContent {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_UndefinedContent {
	Handle_Interface_UndefinedContent GetHandle() {
	return *(Handle_Interface_UndefinedContent*) &$self;
	}
};

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
    Interface_UndefinedContent* GetObject() {
    return (Interface_UndefinedContent*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_UndefinedContent::~Handle_Interface_UndefinedContent %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_UndefinedContent {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_CopyMap;
class Interface_CopyMap : public Interface_CopyControl {
	public:
		%feature("autodoc", "Args:
	amodel(Handle_Interface_InterfaceModel)

Returns:
	None

Creates a CopyMap adapted to work from a Model") Interface_CopyMap;
		 Interface_CopyMap (const Handle_Interface_InterfaceModel & amodel);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears Transfer List. Gets Ready to begin another Transfer") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the InterfaceModel used at Creation time") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	res(Handle_Standard_Transient)

Returns:
	None

Binds a Starting Entity identified by its Number <num> in the  
          Starting Model, to a Result of Transfer <res>") Bind;
		void Bind (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & res);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	res(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Search for the result of a Starting Object (i.e. an Entity,  
          identified by its Number <num> in the Starting Model)  
          Returns True  if a  Result is Bound (and fills <res>)  
          Returns False if no result is Bound (and nullifies <res>)") Search;
		Standard_Boolean Search (const Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
};


%feature("shadow") Interface_CopyMap::~Interface_CopyMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_CopyMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_CopyMap {
	Handle_Interface_CopyMap GetHandle() {
	return *(Handle_Interface_CopyMap*) &$self;
	}
};

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
    Interface_CopyMap* GetObject() {
    return (Interface_CopyMap*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_CopyMap::~Handle_Interface_CopyMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_CopyMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Interface_GraphContent;
class Interface_GraphContent : public Interface_EntityIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty GraphContent, ready to be filled") Interface_GraphContent;
		 Interface_GraphContent ();
		%feature("autodoc", "Args:
	agraph(Interface_Graph)

Returns:
	None

Creates with all entities designated by a Graph") Interface_GraphContent;
		 Interface_GraphContent (const Interface_Graph & agraph);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)
	stat(Standard_Integer)

Returns:
	None

Creates with entities having specific Status value in a Graph") Interface_GraphContent;
		 Interface_GraphContent (const Interface_Graph & agraph,const Standard_Integer stat);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)
	ent(Handle_Standard_Transient)

Returns:
	None

Creates an Iterator with Shared entities of an entity  
          (equivalente to EntityIterator but with a Graph)") Interface_GraphContent;
		 Interface_GraphContent (const Interface_Graph & agraph,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)

Returns:
	None

Gets all Entities designated by a Graph (once created), adds  
          them to those already recorded") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph);
		%feature("autodoc", "Args:
	agraph(Interface_Graph)
	stat(Standard_Integer)

Returns:
	None

Gets entities from a graph which have a specific Status value  
          (one created), adds them to those already recorded") GetFromGraph;
		void GetFromGraph (const Interface_Graph & agraph,const Standard_Integer stat);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns Result under the exact form of an EntityIterator :  
          Can be used when EntityIterator itself is required (as a  
          returned value for instance), whitout way for a sub-class") Result;
		Interface_EntityIterator Result ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Does the Evaluation before starting the iteration itself  
          (in out)") Begin;
		void Begin ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Evaluates list of Entities to be iterated. Called by Start  
          Default is set to doing nothing : intended to be redefined  
          by each sub-class") Evaluate;
		virtual void Evaluate ();
};


%feature("shadow") Interface_GraphContent::~Interface_GraphContent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_GraphContent {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Interface_Static;
class Interface_Static : public Interface_TypedValue {
	public:
		%feature("autodoc", "Args:
	family(char *)
	name(char *)
	type(Interface_ParamType)=Interface_ParamText
	init(char *)=

Returns:
	None

Creates and records a Static, with a family and a name  
          family can report to a name of ressource or to a system or  
          internal definition. The name must be unique.  
 
          type gives the type of the parameter, default is free text  
          Also available : Integer, Real, Enum, Entity (i.e. Object)  
          More precise specifications, titles, can be given to the  
          Static once created  
 
          init gives an initial value. If it is not given, the Static  
          begin as 'not set', its value is empty") Interface_Static;
		 Interface_Static (const char * family,const char * name,const Interface_ParamType type = Interface_ParamText,const char * init = "");
		%feature("autodoc", "Args:
	family(char *)
	name(char *)
	other(Handle_Interface_Static)

Returns:
	None

Creates a new Static with same definition as another one  
          (value is copied, except for Entity : it remains null)") Interface_Static;
		 Interface_Static (const char * family,const char * name,const Handle_Interface_Static & other);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)

Returns:
	None

Writes the properties of a  
parameter in the diagnostic file. These include:  
- Name  
- Family,  
- Wildcard (if it has one)  
- Current status (empty  string if it was updated or  
  if it is the original one)  
- Value") PrintStatic;
		void PrintStatic (const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the family. It can be : a resource name for applis,  
          an internal name between : $e (environment variables),  
          $l (other, purely local)") Family;
		char * Family ();
		%feature("autodoc", "Args:
	wildcard(Handle_Interface_Static)

Returns:
	None

Sets a 'wild-card' static : its value will be considered  
          if <self> is not properly set. (reset by set a null one)") SetWild;
		void SetWild (const Handle_Interface_Static & wildcard);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Static

Returns the wildcard static, which can be (is most often) null") Wild;
		Handle_Interface_Static Wild ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Records a Static has 'uptodate', i.e. its value has been taken  
          into account by a reinitialisation procedure  
          This flag is reset at each successful SetValue") SetUptodate;
		void SetUptodate ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the status 'uptodate'") UpdatedStatus;
		Standard_Boolean UpdatedStatus ();
		%feature("autodoc", "Args:
	family(char *)
	name(char *)
	type(Interface_ParamType)
	init(char *)=

Returns:
	static Standard_Boolean

Declares a new Static (by calling its constructor)  
          If this name is already taken, does nothing and returns False  
          Else, creates it and returns True  
          For additional definitions, get the Static then edit it") Init;
		static Standard_Boolean Init (const char * family,const char * name,const Interface_ParamType type,const char * init = "");
		%feature("autodoc", "Args:
	family(char *)
	name(char *)
	type(Standard_Character)
	init(char *)=

Returns:
	static Standard_Boolean

As Init with ParamType, but type is given as a character  
          This allows a simpler call  
          Types : 'i' Integer, 'r' Real, 't' Text, 'e' Enum, 'o' Object  
          '=' for same definition as, <init> gives the initial Static  
          Returns False if <type> does not match this list") Init;
		static Standard_Boolean Init (const char * family,const char * name,const Standard_Character type,const char * init = "");
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Handle_Interface_Static

Returns a Static from its name. Null Handle if not present") Static;
		static Handle_Interface_Static Static (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Boolean

Returns True if a Static named <name> is present, False else") IsPresent;
		static Standard_Boolean IsPresent (const char * name);
		%feature("autodoc", "Args:
	name(char *)
	part(char *)

Returns:
	static char *

Returns a part of the definition of a Static, as a CString  
          The part is designated by its name, as a CString  
          If the required value is not a string, it is converted to a  
          CString then returned  
          If <name> is not present, or <part> not defined for <name>,  
          this function returns an empty string  
 
          Allowed parts for CDef :  
            family : the family  
            type  : the type ('integer','real','text','enum')  
            label : the label  
            satis : satisfy function name if any  
            rmin : minimum real value  
            rmax : maximum real value  
            imin : minimum integer value  
            imax : maximum integer value  
            enum nn (nn : value of an integer) : enum value for nn  
            unit : unit definition for a real") CDef;
		static char * CDef (const char * name,const char * part);
		%feature("autodoc", "Args:
	name(char *)
	part(char *)

Returns:
	static Standard_Integer

Returns a part of the definition of a Static, as an Integer  
          The part is designated by its name, as a CString  
          If the required value is not a string, returns zero  
          For a Boolean, 0 for false, 1 for true  
          If <name> is not present, or <part> not defined for <name>,  
          this function returns zero  
 
          Allowed parts for IDef :  
            imin, imax : minimum or maximum integer value  
            estart : starting number for enum  
            ecount : count of enum values (starting from estart)  
            ematch : exact match status  
            eval val : case determined from a string") IDef;
		static Standard_Integer IDef (const char * name,const char * part);
		%feature("autodoc", "Args:
	name(char *)
	proper(Standard_Boolean)=Standard_True

Returns:
	static Standard_Boolean

Returns True if <name> is present AND set  
          <proper> True (D) : considers this item only  
          <proper> False    : if not set and attached to a wild-card,  
            considers this wild-card") IsSet;
		static Standard_Boolean IsSet (const char * name,const Standard_Boolean proper = Standard_True);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static char *

Returns the value of the  
parameter identified by the string name.  
If the specified parameter does not exist, an empty  
string is returned.  
Example  
Interface_Static::CVal('write.step.schema');  
which could return:  
'AP214'") CVal;
		static char * CVal (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Integer

Returns the integer value of  
the translation parameter identified by the string name.  
Returns the value 0 if the parameter does not exist.  
Example  
Interface_Static::IVal('write.step.schema');  
which could return: 3") IVal;
		static Standard_Integer IVal (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Real

Returns the value of a static  
translation parameter identified by the string name.  
Returns the value 0.0 if the parameter does not exist.") RVal;
		static Standard_Real RVal (const char * name);
		%feature("autodoc", "Args:
	name(char *)
	val(char *)

Returns:
	static Standard_Boolean

Modifies the value of the  
parameter identified by name. The modification is specified  
by the string val. false is returned if the parameter does not exist.  
Example  
Interface_Static::SetCVal  
('write.step.schema','AP203')  
This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.") SetCVal;
		static Standard_Boolean SetCVal (const char * name,const char * val);
		%feature("autodoc", "Args:
	name(char *)
	val(Standard_Integer)

Returns:
	static Standard_Boolean

Modifies the value of the  
parameter identified by name. The modification is specified  
by the integer value val. false is returned if the  
parameter does not exist.  
Example  
Interface_Static::SetIVal  
('write.step.schema', 3)  
This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.S") SetIVal;
		static Standard_Boolean SetIVal (const char * name,const Standard_Integer val);
		%feature("autodoc", "Args:
	name(char *)
	val(Standard_Real)

Returns:
	static Standard_Boolean

Modifies the value of a  
translation parameter. false is returned if the  
parameter does not exist. The modification is specified  
by the real number value val.") SetRVal;
		static Standard_Boolean SetRVal (const char * name,const Standard_Real val);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Boolean

Sets a Static to be 'uptodate'  
          Returns False if <name> is not present  
          This status can be used by a reinitialisation procedure to  
          rerun if a value has been changed") Update;
		static Standard_Boolean Update (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Standard_Boolean

Returns the status 'uptodate' from a Static  
          Returns False if <name> is not present") IsUpdated;
		static Standard_Boolean IsUpdated (const char * name);
		%feature("autodoc", "Args:
	mode(Standard_Integer)=0
	criter(char *)=

Returns:
	static Handle_TColStd_HSequenceOfHAsciiString

Returns a list of names of statics :  
          <mode> = 0 (D) : criter is for family  
          <mode> = 1 : criter is regexp on names, takes final items  
            (ignore wild cards)  
          <mode> = 2 : idem but take only wilded, not final items  
          <mode> = 3 : idem, take all items matching criter  
          idem + 100 : takes only non-updated items  
          idem + 200 : takes only updated items  
          criter empty (D) : returns all names  
          else returns names which match the given criter  
          Remark : families beginning by '$' are not listed by criter ''  
          they are listed only by criter '$'  
 
          This allows for instance to set new values after having loaded  
          or reloaded a resource, then to update them as required") Items;
		static Handle_TColStd_HSequenceOfHAsciiString Items (const Standard_Integer mode = 0,const char * criter = "");
		%feature("autodoc", "Args:
	None
Returns:
	static void

Initializes all standard static parameters, which can be used  
          by every function. statics specific of a norm or a function  
          must be defined around it") Standards;
		static void Standards ();
};


%feature("shadow") Interface_Static::~Interface_Static %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Interface_Static {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Interface_Static {
	Handle_Interface_Static GetHandle() {
	return *(Handle_Interface_Static*) &$self;
	}
};

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
    Interface_Static* GetObject() {
    return (Interface_Static*)$self->Access();
    }
};
%feature("shadow") Handle_Interface_Static::~Handle_Interface_Static %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Interface_Static {
    void _kill_pointed() {
        delete $self;
    }
};

