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
%define INTERFACEDOCSTRING
"Interface module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_interface.html"
%enddef
%module (package="OCC.Core", docstring=INTERFACEDOCSTRING) Interface


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
#include<Interface_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TColStd.i
%import Message.i
%import MoniTool.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
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

enum Interface_DataState {
	Interface_StateOK = 0,
	Interface_LoadWarning = 1,
	Interface_LoadFail = 2,
	Interface_DataWarning = 3,
	Interface_DataFail = 4,
	Interface_StateUnloaded = 5,
	Interface_StateUnknown = 6,
};

enum Interface_CheckStatus {
	Interface_CheckOK = 0,
	Interface_CheckWarning = 1,
	Interface_CheckFail = 2,
	Interface_CheckAny = 3,
	Interface_CheckMessage = 4,
	Interface_CheckNoFail = 5,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Interface_ParamType:
	Interface_ParamMisc = 0
	Interface_ParamInteger = 1
	Interface_ParamReal = 2
	Interface_ParamIdent = 3
	Interface_ParamVoid = 4
	Interface_ParamText = 5
	Interface_ParamEnum = 6
	Interface_ParamLogical = 7
	Interface_ParamSub = 8
	Interface_ParamHexa = 9
	Interface_ParamBinary = 10

class Interface_DataState:
	Interface_StateOK = 0
	Interface_LoadWarning = 1
	Interface_LoadFail = 2
	Interface_DataWarning = 3
	Interface_DataFail = 4
	Interface_StateUnloaded = 5
	Interface_StateUnknown = 6

class Interface_CheckStatus:
	Interface_CheckOK = 0
	Interface_CheckWarning = 1
	Interface_CheckFail = 2
	Interface_CheckAny = 3
	Interface_CheckMessage = 4
	Interface_CheckNoFail = 5
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Interface_Check)
%wrap_handle(Interface_CopyControl)
%wrap_handle(Interface_EntityCluster)
%wrap_handle(Interface_FileReaderData)
%wrap_handle(Interface_GTool)
%wrap_handle(Interface_GeneralModule)
%wrap_handle(Interface_GlobalNodeOfGeneralLib)
%wrap_handle(Interface_GlobalNodeOfReaderLib)
%wrap_handle(Interface_HGraph)
%wrap_handle(Interface_IntVal)
%wrap_handle(Interface_InterfaceModel)
%wrap_handle(Interface_NodeOfGeneralLib)
%wrap_handle(Interface_NodeOfReaderLib)
%wrap_handle(Interface_ParamList)
%wrap_handle(Interface_ParamSet)
%wrap_handle(Interface_Protocol)
%wrap_handle(Interface_ReaderModule)
%wrap_handle(Interface_ReportEntity)
%wrap_handle(Interface_SignLabel)
%wrap_handle(Interface_SignType)
%wrap_handle(Interface_TypedValue)
%wrap_handle(Interface_UndefinedContent)
%wrap_handle(Interface_CopyMap)
%wrap_handle(Interface_Static)
%wrap_handle(Interface_HArray1OfHAsciiString)
%wrap_handle(Interface_HSequenceOfCheck)
/* end handles declaration */

/* templates */
%template(Interface_Array1OfFileParameter) NCollection_Array1<Interface_FileParameter>;

%extend NCollection_Array1<Interface_FileParameter> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Interface_Array1OfHAsciiString) NCollection_Array1<opencascade::handle<TCollection_HAsciiString>>;

%extend NCollection_Array1<opencascade::handle<TCollection_HAsciiString>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Interface_DataMapOfTransientInteger) NCollection_DataMap<opencascade::handle<Standard_Transient>,Standard_Integer,TColStd_MapTransientHasher>;
%template(Interface_IndexedMapOfAsciiString) NCollection_IndexedMap<TCollection_AsciiString,Interface_MapAsciiStringHasher>;
%template(Interface_SequenceOfCheck) NCollection_Sequence<opencascade::handle<Interface_Check>>;
%template(Interface_VectorOfFileParameter) NCollection_Vector<Interface_FileParameter>;
/* end templates declaration */

/* typedefs */
typedef Standard_Boolean ( * Interface_StaticSatisfies ) ( const opencascade::handle<TCollection_HAsciiString>& val );
typedef NCollection_Array1<Interface_FileParameter> Interface_Array1OfFileParameter;
typedef NCollection_Array1<opencascade::handle<TCollection_HAsciiString>> Interface_Array1OfHAsciiString;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Standard_Integer, TColStd_MapTransientHasher>::Iterator Interface_DataMapIteratorOfDataMapOfTransientInteger;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Standard_Integer, TColStd_MapTransientHasher> Interface_DataMapOfTransientInteger;
typedef NCollection_IndexedMap<TCollection_AsciiString, Interface_MapAsciiStringHasher> Interface_IndexedMapOfAsciiString;
typedef NCollection_Sequence<opencascade::handle<Interface_Check>> Interface_SequenceOfCheck;
typedef NCollection_Vector<Interface_FileParameter> Interface_VectorOfFileParameter;
/* end typedefs declaration */

/*************************
* class Interface_BitMap *
*************************/
class Interface_BitMap {
	public:
		/****************** Interface_BitMap ******************/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "Creates a empty bitmap.

Returns
-------
None
") Interface_BitMap;
		 Interface_BitMap();

		/****************** Interface_BitMap ******************/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "Creates a bitmap for <nbitems> items one flag is defined, n0 0 <resflags> prepares allocation for <resflags> more flags flags values start at false.

Parameters
----------
nbitems: int
resflags: int,optional
	default value is 0

Returns
-------
None
") Interface_BitMap;
		 Interface_BitMap(const Standard_Integer nbitems, const Standard_Integer resflags = 0);

		/****************** Interface_BitMap ******************/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "Creates a bitmap from another one if <copied> is true, copies data else, data are not copied, only the header object is.

Parameters
----------
other: Interface_BitMap
copied: bool,optional
	default value is Standard_False

Returns
-------
None
") Interface_BitMap;
		 Interface_BitMap(const Interface_BitMap & other, const Standard_Boolean copied = Standard_False);

		/****************** AddFlag ******************/
		%feature("compactdefaultargs") AddFlag;
		%feature("autodoc", "Adds a flag, a name can be attached to it returns its flag number makes required reservation.

Parameters
----------
name: char *,optional
	default value is ""

Returns
-------
int
") AddFlag;
		Standard_Integer AddFlag(const char * name = "");

		/****************** AddSomeFlags ******************/
		%feature("compactdefaultargs") AddSomeFlags;
		%feature("autodoc", "Adds several flags (<more>) with no name returns the number of last added flag.

Parameters
----------
more: int

Returns
-------
int
") AddSomeFlags;
		Standard_Integer AddSomeFlags(const Standard_Integer more);

		/****************** CFalse ******************/
		%feature("compactdefaultargs") CFalse;
		%feature("autodoc", "Returns the former value for a flag and sets it to false (before : value returned; after : false).

Parameters
----------
item: int
flag: int,optional
	default value is 0

Returns
-------
bool
") CFalse;
		Standard_Boolean CFalse(const Standard_Integer item, const Standard_Integer flag = 0);

		/****************** CTrue ******************/
		%feature("compactdefaultargs") CTrue;
		%feature("autodoc", "Returns the former value for a flag and sets it to true (before : value returned; after : true).

Parameters
----------
item: int
flag: int,optional
	default value is 0

Returns
-------
bool
") CTrue;
		Standard_Boolean CTrue(const Standard_Integer item, const Standard_Integer flag = 0);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear all field of bit map.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FlagName ******************/
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "Returns the name recorded for a flag, or an empty string.

Parameters
----------
num: int

Returns
-------
char *
") FlagName;
		const char * FlagName(const Standard_Integer num);

		/****************** FlagNumber ******************/
		%feature("compactdefaultargs") FlagNumber;
		%feature("autodoc", "Returns the number or a flag given its name, or zero.

Parameters
----------
name: char *

Returns
-------
int
") FlagNumber;
		Standard_Integer FlagNumber(const char * name);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialises all the values of flag number <flag> to a given value <val>.

Parameters
----------
val: bool
flag: int,optional
	default value is 0

Returns
-------
None
") Init;
		void Init(const Standard_Boolean val, const Standard_Integer flag = 0);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize empty bit by <nbitems> items one flag is defined, n0 0 <resflags> prepares allocation for <resflags> more flags flags values start at false.

Parameters
----------
nbitems: int
resflags: int,optional
	default value is 0

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer nbitems, const Standard_Integer resflags = 0);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize a bitmap from another one.

Parameters
----------
other: Interface_BitMap
copied: bool,optional
	default value is Standard_False

Returns
-------
None
") Initialize;
		void Initialize(const Interface_BitMap & other, const Standard_Boolean copied = Standard_False);

		/****************** Internals ******************/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "Returns internal values, used for copying flags values start at false.

Parameters
----------
flags: TColStd_HArray1OfInteger
names: TColStd_HSequenceOfAsciiString

Returns
-------
nbitems: int
nbwords: int
nbflags: int
") Internals;
		void Internals(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfInteger> & flags, opencascade::handle<TColStd_HSequenceOfAsciiString> & names);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the count of items (i.e. the length of the bitmap).

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** NbFlags ******************/
		%feature("compactdefaultargs") NbFlags;
		%feature("autodoc", "Returns the count of flags (flag 0 not included).

Returns
-------
int
") NbFlags;
		Standard_Integer NbFlags();

		/****************** RemoveFlag ******************/
		%feature("compactdefaultargs") RemoveFlag;
		%feature("autodoc", "Removes a flag given its number. returns true if done, false if num is out of range.

Parameters
----------
num: int

Returns
-------
bool
") RemoveFlag;
		Standard_Boolean RemoveFlag(const Standard_Integer num);

		/****************** Reservate ******************/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "Reservates for a count of more flags.

Parameters
----------
moreflags: int

Returns
-------
None
") Reservate;
		void Reservate(const Standard_Integer moreflags);

		/****************** SetFalse ******************/
		%feature("compactdefaultargs") SetFalse;
		%feature("autodoc", "Sets a flag to false.

Parameters
----------
item: int
flag: int,optional
	default value is 0

Returns
-------
None
") SetFalse;
		void SetFalse(const Standard_Integer item, const Standard_Integer flag = 0);

		/****************** SetFlagName ******************/
		%feature("compactdefaultargs") SetFlagName;
		%feature("autodoc", "Sets a name for a flag, given its number name can be empty (to erase the name of a flag) returns true if done, false if : num is out of range, or name non-empty already set to another flag.

Parameters
----------
num: int
name: char *

Returns
-------
bool
") SetFlagName;
		Standard_Boolean SetFlagName(const Standard_Integer num, const char * name);

		/****************** SetLength ******************/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "Sets for a new count of items, which can be either less or greater than the former one for new items, their flags start at false.

Parameters
----------
nbitems: int

Returns
-------
None
") SetLength;
		void SetLength(const Standard_Integer nbitems);

		/****************** SetTrue ******************/
		%feature("compactdefaultargs") SetTrue;
		%feature("autodoc", "Sets a flag to true.

Parameters
----------
item: int
flag: int,optional
	default value is 0

Returns
-------
None
") SetTrue;
		void SetTrue(const Standard_Integer item, const Standard_Integer flag = 0);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets a new value for a flag.

Parameters
----------
item: int
val: bool
flag: int,optional
	default value is 0

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer item, const Standard_Boolean val, const Standard_Integer flag = 0);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (true/false) of a flag, from : - the number of the item - the flag number, by default 0.

Parameters
----------
item: int
flag: int,optional
	default value is 0

Returns
-------
bool
") Value;
		Standard_Boolean Value(const Standard_Integer item, const Standard_Integer flag = 0);

};


%extend Interface_BitMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Interface_Category *
***************************/
class Interface_Category {
	public:
		/****************** Interface_Category ******************/
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "Creates a category, with no protocol yet.

Returns
-------
None
") Interface_Category;
		 Interface_Category();

		/****************** Interface_Category ******************/
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "Creates a category with a given protocol.

Parameters
----------
theProtocol: Interface_Protocol

Returns
-------
None
") Interface_Category;
		 Interface_Category(const opencascade::handle<Interface_Protocol> & theProtocol);

		/****************** Interface_Category ******************/
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "Creates a category with a given gtool.

Parameters
----------
theGTool: Interface_GTool

Returns
-------
None
") Interface_Category;
		 Interface_Category(const opencascade::handle<Interface_GTool> & theGTool);

		/****************** AddCategory ******************/
		%feature("compactdefaultargs") AddCategory;
		%feature("autodoc", "Records a new category defined by its names, produces a number new if not yet recorded.

Parameters
----------
theName: char *

Returns
-------
int
") AddCategory;
		static Standard_Integer AddCategory(const char * theName);

		/****************** CatNum ******************/
		%feature("compactdefaultargs") CatNum;
		%feature("autodoc", "Determines the category number for an entity in its context, by using general service categorynumber.

Parameters
----------
theEnt: Standard_Transient
theShares: Interface_ShareTool

Returns
-------
int
") CatNum;
		Standard_Integer CatNum(const opencascade::handle<Standard_Transient> & theEnt, const Interface_ShareTool & theShares);

		/****************** ClearNums ******************/
		%feature("compactdefaultargs") ClearNums;
		%feature("autodoc", "Clears the recorded list of category numbers for a model.

Returns
-------
None
") ClearNums;
		void ClearNums();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the category number for each entity and records it, in an array (ent.number -> category number) hence, it can be queried by the method num. the model itself is not recorded, this method is intended to be used in a wider context (which detains also a graph, etc).

Parameters
----------
theModel: Interface_InterfaceModel
theShares: Interface_ShareTool

Returns
-------
None
") Compute;
		void Compute(const opencascade::handle<Interface_InterfaceModel> & theModel, const Interface_ShareTool & theShares);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Default initialisation (protected against several calls : passes only once).

Returns
-------
None
") Init;
		static void Init();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of a category, according to its number.

Parameters
----------
theNum: int

Returns
-------
char *
") Name;
		static const char * Name(const Standard_Integer theNum);

		/****************** NbCategories ******************/
		%feature("compactdefaultargs") NbCategories;
		%feature("autodoc", "Returns the count of recorded categories.

Returns
-------
int
") NbCategories;
		static Standard_Integer NbCategories();

		/****************** Num ******************/
		%feature("compactdefaultargs") Num;
		%feature("autodoc", "Returns the category number recorded for an entity number returns 0 if out of range.

Parameters
----------
theNumEnt: int

Returns
-------
int
") Num;
		Standard_Integer Num(const Standard_Integer theNumEnt);

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns the number of a category, according to its name.

Parameters
----------
theName: char *

Returns
-------
int
") Number;
		static Standard_Integer Number(const char * theName);

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "Sets/changes protocol.

Parameters
----------
theProtocol: Interface_Protocol

Returns
-------
None
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & theProtocol);

};


%extend Interface_Category {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Interface_Check *
************************/
class Interface_Check : public Standard_Transient {
	public:
		/****************** Interface_Check ******************/
		%feature("compactdefaultargs") Interface_Check;
		%feature("autodoc", "Allows definition of a sequence. used also for global check of an interfacemodel (which stores global messages for file).

Returns
-------
None
") Interface_Check;
		 Interface_Check();

		/****************** Interface_Check ******************/
		%feature("compactdefaultargs") Interface_Check;
		%feature("autodoc", "Defines a check on an entity.

Parameters
----------
anentity: Standard_Transient

Returns
-------
None
") Interface_Check;
		 Interface_Check(const opencascade::handle<Standard_Transient> & anentity);

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Records a new fail message.

Parameters
----------
amess: TCollection_HAsciiString

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<TCollection_HAsciiString> & amess);

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Records a new fail message under two forms : final,original.

Parameters
----------
amess: TCollection_HAsciiString
orig: TCollection_HAsciiString

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<TCollection_HAsciiString> & amess, const opencascade::handle<TCollection_HAsciiString> & orig);

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Records a new fail message given as 'error text' directly if <orig> is given, a distinct original form is recorded else (d), the original form equates <amess>.

Parameters
----------
amess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddFail;
		void AddFail(const char * amess, const char * orig = "");

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Records a new fail from the definition of a msg (original+value).

Parameters
----------
amsg: Message_Msg

Returns
-------
None
") AddFail;
		void AddFail(const Message_Msg & amsg);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Records a new warning message.

Parameters
----------
amess: TCollection_HAsciiString

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<TCollection_HAsciiString> & amess);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Records a new warning message under two forms : final,original.

Parameters
----------
amess: TCollection_HAsciiString
orig: TCollection_HAsciiString

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<TCollection_HAsciiString> & amess, const opencascade::handle<TCollection_HAsciiString> & orig);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Records a warning message given as 'warning message' directly if <orig> is given, a distinct original form is recorded else (d), the original form equates <amess>.

Parameters
----------
amess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddWarning;
		void AddWarning(const char * amess, const char * orig = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Records a new warning from the definition of a msg (original+value).

Parameters
----------
amsg: Message_Msg

Returns
-------
None
") AddWarning;
		void AddWarning(const Message_Msg & amsg);

		/****************** CFail ******************/
		%feature("compactdefaultargs") CFail;
		%feature("autodoc", "Same as above, but returns a cstring (to be printed ...) final form by default, original form if <final> is false.

Parameters
----------
num: int
final: bool,optional
	default value is Standard_True

Returns
-------
char *
") CFail;
		const char * CFail(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****************** CInfoMsg ******************/
		%feature("compactdefaultargs") CInfoMsg;
		%feature("autodoc", "Same as above, but returns a cstring (to be printed ...) final form by default, original form if <final> is false.

Parameters
----------
num: int
final: bool,optional
	default value is Standard_True

Returns
-------
char *
") CInfoMsg;
		const char * CInfoMsg(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****************** CWarning ******************/
		%feature("compactdefaultargs") CWarning;
		%feature("autodoc", "Same as above, but returns a cstring (to be printed ...) final form by default, original form if <final> is false.

Parameters
----------
num: int
final: bool,optional
	default value is Standard_True

Returns
-------
char *
") CWarning;
		const char * CWarning(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears a check, in order to receive informations from transfer (messages and entity).

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClearFails ******************/
		%feature("compactdefaultargs") ClearFails;
		%feature("autodoc", "Clears the fail messages (for instance to keep only warnings).

Returns
-------
None
") ClearFails;
		void ClearFails();

		/****************** ClearInfoMsgs ******************/
		%feature("compactdefaultargs") ClearInfoMsgs;
		%feature("autodoc", "Clears the info messages.

Returns
-------
None
") ClearInfoMsgs;
		void ClearInfoMsgs();

		/****************** ClearWarnings ******************/
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "Clears the warning messages (for instance to keep only fails).

Returns
-------
None
") ClearWarnings;
		void ClearWarnings();

		/****************** Complies ******************/
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "Tells if check status complies with a given one (i.e. also status for query).

Parameters
----------
status: Interface_CheckStatus

Returns
-------
bool
") Complies;
		Standard_Boolean Complies(const Interface_CheckStatus status);

		/****************** Complies ******************/
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "Tells if a message is brought by a check, as follows : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages for <status> : for checkwarning and checkfail, considers only resp. warning or check messages. for checkany, considers all other values are ignored (answer will be false).

Parameters
----------
mess: TCollection_HAsciiString
incl: int
status: Interface_CheckStatus

Returns
-------
bool
") Complies;
		Standard_Boolean Complies(const opencascade::handle<TCollection_HAsciiString> & mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns the entity on which the check has been defined.

Returns
-------
opencascade::handle<Standard_Transient>
") Entity;
		const opencascade::handle<Standard_Transient> & Entity();

		/****************** Fail ******************/
		%feature("compactdefaultargs") Fail;
		%feature("autodoc", "Returns fail message as a string final form by default, original form if <final> is false.

Parameters
----------
num: int
final: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Fail;
		const opencascade::handle<TCollection_HAsciiString> & Fail(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****************** Fails ******************/
		%feature("compactdefaultargs") Fails;
		%feature("autodoc", "Returns the list of fails, for a frontal-engine logic final forms by default, original forms if <final> is false can be empty.

Parameters
----------
final: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") Fails;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> Fails(const Standard_Boolean final = Standard_True);

		/****************** GetAsWarning ******************/
		%feature("compactdefaultargs") GetAsWarning;
		%feature("autodoc", "Copies messages converted into warning messages if failsonly is true, only fails are taken, and converted else, warnings are taken too. does not regard entity used to keep fail messages as warning, after a recovery.

Parameters
----------
other: Interface_Check
failsonly: bool

Returns
-------
None
") GetAsWarning;
		void GetAsWarning(const opencascade::handle<Interface_Check> & other, const Standard_Boolean failsonly);

		/****************** GetEntity ******************/
		%feature("compactdefaultargs") GetEntity;
		%feature("autodoc", "Same as setentity (old form kept for compatibility) warning : does nothing if entity field is not yet clear.

Parameters
----------
anentity: Standard_Transient

Returns
-------
None
") GetEntity;
		void GetEntity(const opencascade::handle<Standard_Transient> & anentity);

		/****************** GetMessages ******************/
		%feature("compactdefaultargs") GetMessages;
		%feature("autodoc", "Copies messages stored in another check, cumulating does not regard other's entity. used to cumulate messages.

Parameters
----------
other: Interface_Check

Returns
-------
None
") GetMessages;
		void GetMessages(const opencascade::handle<Interface_Check> & other);

		/****************** HasEntity ******************/
		%feature("compactdefaultargs") HasEntity;
		%feature("autodoc", "Returns true if a check is devoted to an entity; else, it is global (for interfacemodel's storing of global error messages).

Returns
-------
bool
") HasEntity;
		Standard_Boolean HasEntity();

		/****************** HasFailed ******************/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Returns true if check brings at least one fail message.

Returns
-------
bool
") HasFailed;
		Standard_Boolean HasFailed();

		/****************** HasWarnings ******************/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Returns true if check brings at least one warning message.

Returns
-------
bool
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****************** InfoMsg ******************/
		%feature("compactdefaultargs") InfoMsg;
		%feature("autodoc", "Returns information message as a string.

Parameters
----------
num: int
final: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") InfoMsg;
		const opencascade::handle<TCollection_HAsciiString> & InfoMsg(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****************** InfoMsgs ******************/
		%feature("compactdefaultargs") InfoMsgs;
		%feature("autodoc", "Returns the list of info msg, for a frontal-engine logic final forms by default, original forms if <final> is false can be empty.

Parameters
----------
final: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") InfoMsgs;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> InfoMsgs(const Standard_Boolean final = Standard_True);

		/****************** Mend ******************/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "Mends messages, according <pref> and <num> according to <num>, works on the whole list of fails if = 0(d) or only one fail message, given its rank if <pref> is empty, converts fail(s) to warning(s) else, does the conversion but prefixes the new warning(s) but <pref> followed by a semi-column some reserved values of <pref> are : 'fm' : standard prefix 'mended' (can be translated) 'cf' : clears fail(s) 'cw' : clears warning(s) : here, <num> refers to warning list 'ca' : clears all messages : here, <num> is ignored.

Parameters
----------
pref: char *
num: int,optional
	default value is 0

Returns
-------
bool
") Mend;
		Standard_Boolean Mend(const char * pref, const Standard_Integer num = 0);

		/****************** NbFails ******************/
		%feature("compactdefaultargs") NbFails;
		%feature("autodoc", "Returns count of recorded fails.

Returns
-------
int
") NbFails;
		Standard_Integer NbFails();

		/****************** NbInfoMsgs ******************/
		%feature("compactdefaultargs") NbInfoMsgs;
		%feature("autodoc", "Returns the count of recorded information messages.

Returns
-------
int
") NbInfoMsgs;
		Standard_Integer NbInfoMsgs();

		/****************** NbWarnings ******************/
		%feature("compactdefaultargs") NbWarnings;
		%feature("autodoc", "Returns count of recorded warning messages.

Returns
-------
int
") NbWarnings;
		Standard_Integer NbWarnings();

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Prints the messages of the check to an messenger <level> = 1 : only fails <level> = 2 : fails and warnings <level> = 3 : all (fails, warnings, info msg) <final> : if positive (d) prints final values of messages if negative, prints originals if null, prints both forms.

Parameters
----------
S: Message_Messenger
level: int
final: int,optional
	default value is 1

Returns
-------
None
") Print;
		void Print(const opencascade::handle<Message_Messenger> & S, const Standard_Integer level, const Standard_Integer final = 1);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the messages which comply with <mess>, as follows : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages for <status> : for checkwarning and checkfail, considers only resp. warning or check messages. for checkany, considers all other values are ignored (nothing is done) returns true if at least one message has been removed, false else.

Parameters
----------
mess: TCollection_HAsciiString
incl: int
status: Interface_CheckStatus

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const opencascade::handle<TCollection_HAsciiString> & mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "New name for addfail (msg).

Parameters
----------
amsg: Message_Msg

Returns
-------
None
") SendFail;
		void SendFail(const Message_Msg & amsg);

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "Records an information message this does not change the status of the check.

Parameters
----------
amsg: Message_Msg

Returns
-------
None
") SendMsg;
		void SendMsg(const Message_Msg & amsg);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "New name for addwarning.

Parameters
----------
amsg: Message_Msg

Returns
-------
None
") SendWarning;
		void SendWarning(const Message_Msg & amsg);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "Receives an entity result of a transfer.

Parameters
----------
anentity: Standard_Transient

Returns
-------
None
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & anentity);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the check status : ok, warning or fail.

Returns
-------
Interface_CheckStatus
") Status;
		Interface_CheckStatus Status();

		/****************** Trace ******************/
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "Prints the messages of the check to the default trace file by default, according to the default standard level else, according level (see method print).

Parameters
----------
level: int,optional
	default value is -1
final: int,optional
	default value is 1

Returns
-------
None
") Trace;
		void Trace(const Standard_Integer level = -1, const Standard_Integer final = 1);

		/****************** Warning ******************/
		%feature("compactdefaultargs") Warning;
		%feature("autodoc", "Returns warning message as a string final form by default, original form if <final> is false.

Parameters
----------
num: int
final: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Warning;
		const opencascade::handle<TCollection_HAsciiString> & Warning(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****************** Warnings ******************/
		%feature("compactdefaultargs") Warnings;
		%feature("autodoc", "Returns the list of warnings, for a frontal-engine logic final forms by default, original forms if <final> is false can be empty.

Parameters
----------
final: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") Warnings;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> Warnings(const Standard_Boolean final = Standard_True);

};


%make_alias(Interface_Check)

%extend Interface_Check {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Interface_CheckIterator *
********************************/
class Interface_CheckIterator {
	public:
		/****************** Interface_CheckIterator ******************/
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "Creates an empty checkiterator.

Returns
-------
None
") Interface_CheckIterator;
		 Interface_CheckIterator();

		/****************** Interface_CheckIterator ******************/
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "Creates a checkiterator with a name (displayed by print as a title).

Parameters
----------
name: char *

Returns
-------
None
") Interface_CheckIterator;
		 Interface_CheckIterator(const char * name);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a check to the list to be iterated this check is accompanied by entity number in the model (0 for global check or entity unknown in the model), if 0 and model is recorded in <self>, it is computed.

Parameters
----------
ach: Interface_Check
num: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Interface_Check> & ach, const Standard_Integer num = 0);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns the check bound to an entity number (0 : global) in order to be consulted or completed on the spot i.e. returns the check if is already exists, or adds it then returns the new empty check.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> & CCheck(const Standard_Integer num);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns the check bound to an entity, in order to be consulted or completed on the spot i.e. returns the check if is already exists, or adds it then returns the new empty check.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> & CCheck(const opencascade::handle<Standard_Transient> & ent);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check which was attached to an entity given its number in the model. <num>=0 is for the global check. if no check was recorded for this number, returns an empty check. remark : works apart from the iteration methods (no interference).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> & Check(const Standard_Integer num);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check attached to an entity if no check was recorded for this entity, returns an empty check. remark : works apart from the iteration methods (no interference).

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> & Check(const opencascade::handle<Standard_Transient> & ent);

		/****************** Checkeds ******************/
		%feature("compactdefaultargs") Checkeds;
		%feature("autodoc", "Returns the list of entities concerned by a check only fails if <failsonly> is true, else all non-empty checks if <global> is true, adds the model for a global check else, global check is ignored.

Parameters
----------
failsonly: bool
global: bool

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Checkeds;
		opencascade::handle<TColStd_HSequenceOfTransient> Checkeds(const Standard_Boolean failsonly, const Standard_Boolean global);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of checks.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Complies ******************/
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "Tells if this check list complies with a given status : ok (i.e. empty), warning (at least one warning, but no fail), fail (at least one), message (not ok), nofail, any.

Parameters
----------
status: Interface_CheckStatus

Returns
-------
bool
") Complies;
		Standard_Boolean Complies(const Interface_CheckStatus status);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Clears data of iteration.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Extract ******************/
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "Returns a checkiterator which contains the checks which comply with a given status each check is added completely (no split warning/fail).

Parameters
----------
status: Interface_CheckStatus

Returns
-------
Interface_CheckIterator
") Extract;
		Interface_CheckIterator Extract(const Interface_CheckStatus status);

		/****************** Extract ******************/
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "Returns a checkiterator which contains the check which comply with a message, plus some conditions as follows : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages for <status> : for checkwarning and checkfail, considers only resp. warning or check messages. for checkany, considers all other values are ignored (answer will be false) each check which complies is entirely taken.

Parameters
----------
mess: char *
incl: int
status: Interface_CheckStatus

Returns
-------
Interface_CheckIterator
") Extract;
		Interface_CheckIterator Extract(const char * mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if : no fail has been recorded if <failsonly> is true, no check at all if <failsonly> is false.

Parameters
----------
failsonly: bool

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty(const Standard_Boolean failsonly);

		/****************** Merge ******************/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Merges another checkiterator into <self>, i.e. adds each of its checks. content of <other> remains unchanged. takes also the model but not the name.

Parameters
----------
other: Interface_CheckIterator

Returns
-------
None
") Merge;
		void Merge(Interface_CheckIterator & other);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the stored model (can be a null handle).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more checks to get.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the recorded name (can be empty).

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets iteration to next item.

Returns
-------
None
") Next;
		void Next();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns number of entity for the check currently iterated or 0 for globalcheck.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Prints the list of checks with their attached numbers if <failsonly> is true, prints only fail messages if <failsonly> is false, prints all messages if <final> = 0 (d), prints also original messages if different if <final> < 0, prints only original messages if <final> > 0, prints only final messages it uses the recorded model if it is defined remark : works apart from the iteration methods (no interference).

Parameters
----------
S: Message_Messenger
failsonly: bool
final: int,optional
	default value is 0

Returns
-------
None
") Print;
		void Print(const opencascade::handle<Message_Messenger> & S, const Standard_Boolean failsonly, const Standard_Integer final = 0);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Works as print without a model, but for entities which have no attached number (number not positive), tries to compute this number from <model> and displays 'original' or 'computed'.

Parameters
----------
S: Message_Messenger
model: Interface_InterfaceModel
failsonly: bool
final: int,optional
	default value is 0

Returns
-------
None
") Print;
		void Print(const opencascade::handle<Message_Messenger> & S, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Boolean failsonly, const Standard_Integer final = 0);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the messages of all checks, under these conditions : <incl> = 0 : <mess> exactly matches one of the messages <incl> < 0 : <mess> is contained by one of the messages <incl> > 0 : <mess> contains one of the messages for <status> : for checkwarning and checkfail, considers only resp. warning or check messages. for checkany, considers all other values are ignored (nothing is done) returns true if at least one message has been removed, false else.

Parameters
----------
mess: char *
incl: int
status: Interface_CheckStatus

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const char * mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Defines a model, used to locate entities (not required, if it is absent, entities are simply less documented).

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets / changes the name.

Parameters
----------
name: char *

Returns
-------
None
") SetName;
		void SetName(const char * name);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts iteration. thus, it is possible to restart it remark : an iteration may be done with a const iterator while its content is modified (through a pointer), this allows to give it as a const argument to a function.

Returns
-------
None
") Start;
		void Start();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns worst status among : ok, warning, fail.

Returns
-------
Interface_CheckStatus
") Status;
		Interface_CheckStatus Status();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns check currently iterated it brings all other informations (status, messages, ...) the number of the entity in the model is given by number below.

Returns
-------
opencascade::handle<Interface_Check>
") Value;
		const opencascade::handle<Interface_Check> & Value();

};


%extend Interface_CheckIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Interface_CheckTool *
****************************/
class Interface_CheckTool {
	public:
		/****************** Interface_CheckTool ******************/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "Creates a checktool, by calling the general service library and modules, selected through a protocol, to work on a model moreover, protocol recognizes unknown entities.

Parameters
----------
model: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
None
") Interface_CheckTool;
		 Interface_CheckTool(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Interface_CheckTool ******************/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "Creates a checktool, by calling the general service library and modules, selected through a protocol, to work on a model protocol and so on are taken from the model (its gtool).

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") Interface_CheckTool;
		 Interface_CheckTool(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Interface_CheckTool ******************/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "Creates a checktool from a graph. the graph contains a model which designates a protocol: they are used to create sharetool.

Parameters
----------
graph: Interface_Graph

Returns
-------
None
") Interface_CheckTool;
		 Interface_CheckTool(const Interface_Graph & graph);

		/****************** Interface_CheckTool ******************/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
hgraph: Interface_HGraph

Returns
-------
None
") Interface_CheckTool;
		 Interface_CheckTool(const opencascade::handle<Interface_HGraph> & hgraph);

		/****************** AnalyseCheckList ******************/
		%feature("compactdefaultargs") AnalyseCheckList;
		%feature("autodoc", "Returns list of errors dectected at analyse time (syntactic) (note that globalcheck is not in this list).

Returns
-------
Interface_CheckIterator
") AnalyseCheckList;
		Interface_CheckIterator AnalyseCheckList();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check associated to an entity identified by its number in a model.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		opencascade::handle<Interface_Check> Check(const Standard_Integer num);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns list of all errors detected note that presence of unknown entities is not an error cumulates : globalcheck if error + analysechecklist + verifychecklist.

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** CheckSuccess ******************/
		%feature("compactdefaultargs") CheckSuccess;
		%feature("autodoc", "Checks if any error has been detected (checklist not empty) returns normally if none, raises exception if some exists. it reuses the last computations from other checking methods, unless the argument <resest> is given true.

Parameters
----------
reset: bool,optional
	default value is Standard_False

Returns
-------
None
") CheckSuccess;
		void CheckSuccess(const Standard_Boolean reset = Standard_False);

		/****************** CompleteCheckList ******************/
		%feature("compactdefaultargs") CompleteCheckList;
		%feature("autodoc", "Returns list of all 'remarkable' informations, which include : - globalcheck, if not empty - error checks, for all errors (verify + analyse) - also corrected entities - and unknown entities : for those, each unknown entity is associated to an empty check (it is neither an error nor a correction, but a remarkable information).

Returns
-------
Interface_CheckIterator
") CompleteCheckList;
		Interface_CheckIterator CompleteCheckList();

		/****************** FillCheck ******************/
		%feature("compactdefaultargs") FillCheck;
		%feature("autodoc", "Fills as required a check with the error and warning messages produced by checking a given entity. for an erroneous or corrected entity : check build at analyse time; else, check computed for entity (verify integrity), can use a graph as required to control context.

Parameters
----------
ent: Standard_Transient
sh: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") FillCheck;
		void FillCheck(const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & sh, opencascade::handle<Interface_Check> & ach);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Utility method which prints the content of a check.

Parameters
----------
ach: Interface_Check
S: Message_Messenger

Returns
-------
None
") Print;
		void Print(const opencascade::handle<Interface_Check> & ach, const opencascade::handle<Message_Messenger> & S);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Simply lists all the checks and the content (messages) and the entity, if there is, of each check (if all checks are ok, nothing is printed).

Parameters
----------
list: Interface_CheckIterator
S: Message_Messenger

Returns
-------
None
") Print;
		void Print(const Interface_CheckIterator & list, const opencascade::handle<Message_Messenger> & S);

		/****************** UnknownEntities ******************/
		%feature("compactdefaultargs") UnknownEntities;
		%feature("autodoc", "Returns list of unknown entities note that error and erroneous entities are not considered as unknown.

Returns
-------
Interface_EntityIterator
") UnknownEntities;
		Interface_EntityIterator UnknownEntities();

		/****************** VerifyCheckList ******************/
		%feature("compactdefaultargs") VerifyCheckList;
		%feature("autodoc", "Returns list of integrity constraints errors (semantic) (note that globalcheck is not in this list).

Returns
-------
Interface_CheckIterator
") VerifyCheckList;
		Interface_CheckIterator VerifyCheckList();

		/****************** WarningCheckList ******************/
		%feature("compactdefaultargs") WarningCheckList;
		%feature("autodoc", "Returns list of corrections (includes globalcheck if corrected).

Returns
-------
Interface_CheckIterator
") WarningCheckList;
		Interface_CheckIterator WarningCheckList();

};


%extend Interface_CheckTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Interface_CopyControl *
******************************/
%nodefaultctor Interface_CopyControl;
class Interface_CopyControl : public Standard_Transient {
	public:
		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Bind a result to a starting entity identified by its number.

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
None
") Bind;
		virtual void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears list of copy results. gets ready to begin another copy process.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches for the result bound to a startingf entity identified by its number. if found, returns true and fills <res> else, returns false and nullifies <res>.

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
bool
") Search;
		virtual Standard_Boolean Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

};


%make_alias(Interface_CopyControl)

%extend Interface_CopyControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Interface_CopyTool *
***************************/
class Interface_CopyTool {
	public:
		/****************** Interface_CopyTool ******************/
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "Creates a copytool adapted to work from a model. works with a general service library, given as an argument.

Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Returns
-------
None
") Interface_CopyTool;
		 Interface_CopyTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****************** Interface_CopyTool ******************/
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "Same as above, but library is defined through a protocol.

Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
None
") Interface_CopyTool;
		 Interface_CopyTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Interface_CopyTool ******************/
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "Same as above, but works with the active protocol.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") Interface_CopyTool;
		 Interface_CopyTool(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Defines a result for the transfer of a starting object. used by method transferred (which performs a normal copy), but can also be called to enforce a result : in the latter case, the enforced result must be compatible with the other transfers which are performed.

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
None
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears transfer list. gets ready to begin another transfer.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClearLastFlags ******************/
		%feature("compactdefaultargs") ClearLastFlags;
		%feature("autodoc", "Clears lastflags only. this allows to know what entities are copied after its call (see method lastcopiedafter). it can be used when copies are done by increments, which must be distinghished. clearlastflags is also called by clear.

Returns
-------
None
") ClearLastFlags;
		void ClearLastFlags();

		/****************** CompleteResult ******************/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "Returns the complete list of copied entities if <withreports> is given true, the entities which were reported in the starting model are replaced in the list by the copied reportentities.

Parameters
----------
withreports: bool,optional
	default value is Standard_False

Returns
-------
Interface_EntityIterator
") CompleteResult;
		Interface_EntityIterator CompleteResult(const Standard_Boolean withreports = Standard_False);

		/****************** Control ******************/
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "Returns the object used for control.

Returns
-------
opencascade::handle<Interface_CopyControl>
") Control;
		opencascade::handle<Interface_CopyControl> Control();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates the counterpart of an entity (by shallowcopy), binds it, then copies the content of the former entity to the other one (same type), by call to the general service library it may command the copy of referenced entities then, its returns true. //! if <mapped> is true, the map is used to store the result else, the result is simply produced : it can be used to copy internal sub-parts of entities, which are not intended to be shared (strings, arrays, etc...) if <errstat> is true, this means that the entity is recorded in the model as erroneous : in this case, the general service for deep copy is not called (this could be dangerous) : hence the counter-part is produced but empty, it can be referenced. //! this method does nothing and returns false if the protocol does not recognize <ent>. it basically makes a deep copy without changing the types. it can be redefined for special uses.

Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient
mapped: bool
errstat: bool

Returns
-------
bool
") Copy;
		virtual Standard_Boolean Copy(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, const Standard_Boolean mapped, const Standard_Boolean errstat);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "Fills a model with the result of the transfer (transferlist) commands copy of header too, and calls renewimpliedrefs.

Parameters
----------
bmodel: Interface_InterfaceModel

Returns
-------
None
") FillModel;
		void FillModel(const opencascade::handle<Interface_InterfaceModel> & bmodel);

		/****************** LastCopiedAfter ******************/
		%feature("compactdefaultargs") LastCopiedAfter;
		%feature("autodoc", "Returns an copied entity and its result which were operated after last call to clearlastflags. it returns the first 'last copied entity' which number follows <numfrom>, zero if none. it is used in a loop as follow : integer num = 0; while ( (num = copytool.lastcopiedafter(num,ent,res)) ) { .. process starting <ent> and its result <res> }.

Parameters
----------
numfrom: int
ent: Standard_Transient
res: Standard_Transient

Returns
-------
int
") LastCopiedAfter;
		Standard_Integer LastCopiedAfter(const Standard_Integer numfrom, opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model on which the copytool works.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** RenewImpliedRefs ******************/
		%feature("compactdefaultargs") RenewImpliedRefs;
		%feature("autodoc", "Renews the implied references. these references do not involve copying of referenced entities. for such a reference, if the entity which defines it and the referenced entity are both copied, then this reference is renewed. else it is deleted in the copied entities. remark : this concerns only some specific references, such as 'back pointers'.

Returns
-------
None
") RenewImpliedRefs;
		void RenewImpliedRefs();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of root copied entities (those which were asked for copy by the user of copytool, not by copying another entity).

Parameters
----------
withreports: bool,optional
	default value is Standard_False

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Standard_Boolean withreports = Standard_False);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Search for the result of a starting object (i.e. an entity) returns true if a result is bound (and fills 'result') returns false if no result is bound.

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
bool
") Search;
		Standard_Boolean Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

		/****************** SetControl ******************/
		%feature("compactdefaultargs") SetControl;
		%feature("autodoc", "Changes the map of result for another one. this allows to work with a more sophisticated mapping control than the standard one which is copymap (e.g. transferprocess from transfer).

Parameters
----------
othermap: Interface_CopyControl

Returns
-------
None
") SetControl;
		void SetControl(const opencascade::handle<Interface_CopyControl> & othermap);

		/****************** TransferEntity ******************/
		%feature("compactdefaultargs") TransferEntity;
		%feature("autodoc", "Transfers one entity and records result into the transfer list calls method transferred.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") TransferEntity;
		void TransferEntity(const opencascade::handle<Standard_Transient> & ent);

		/****************** Transferred ******************/
		%feature("compactdefaultargs") Transferred;
		%feature("autodoc", "Transfers one entity, if not yet bound to a result remark : for an entity which is reported in the starting model, the reportentity will also be copied with its content if it has one (at least shallowcopy; complete copy if the protocol recognizes the content : see method copy).

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<Standard_Transient>
") Transferred;
		opencascade::handle<Standard_Transient> Transferred(const opencascade::handle<Standard_Transient> & ent);

};


%extend Interface_CopyTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Interface_EntityCluster *
********************************/
class Interface_EntityCluster : public Standard_Transient {
	public:
		/****************** Interface_EntityCluster ******************/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "Creates an empty, non-chained, entitycluster.

Returns
-------
None
") Interface_EntityCluster;
		 Interface_EntityCluster();

		/****************** Interface_EntityCluster ******************/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "Creates a non-chained entitycluster, filled with one entity.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") Interface_EntityCluster;
		 Interface_EntityCluster(const opencascade::handle<Standard_Transient> & ent);

		/****************** Interface_EntityCluster ******************/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "Creates an empty entitycluster, chained with another one (that is, put before this other one in the list).

Parameters
----------
ec: Interface_EntityCluster

Returns
-------
None
") Interface_EntityCluster;
		 Interface_EntityCluster(const opencascade::handle<Interface_EntityCluster> & ec);

		/****************** Interface_EntityCluster ******************/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "Creates an entitycluster, filled with a first entity, and chained to another entitycluster (before it, as above).

Parameters
----------
ant: Standard_Transient
ec: Interface_EntityCluster

Returns
-------
None
") Interface_EntityCluster;
		 Interface_EntityCluster(const opencascade::handle<Standard_Transient> & ant, const opencascade::handle<Interface_EntityCluster> & ec);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends an entity to the cluster. if it is not full, adds the entity directly inside itself. else, transmits to its next and creates it if it does not yet exist.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") Append;
		void Append(const opencascade::handle<Standard_Transient> & ent);

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Fills an iterator with designated entities (includes next).

Parameters
----------
iter: Interface_EntityIterator

Returns
-------
None
") FillIterator;
		void FillIterator(Interface_EntityIterator & iter);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns total count of entities (including next).

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an entity from the cluster. if it is not found, calls its next one to do so. returns true if it becomes itself empty, false else (thus, a cluster which becomes empty is deleted from the list).

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const opencascade::handle<Standard_Transient> & ent);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an entity from the cluster, given its rank. if <num> is greater than nblocal, calls its next with (num - nblocal), returns true if it becomes itself empty, false else.

Parameters
----------
num: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer num);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Changes an entity given its rank.

Parameters
----------
num: int
ent: Standard_Transient

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the entity identified by its rank in the list (including next).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		const opencascade::handle<Standard_Transient> & Value(const Standard_Integer num);

};


%make_alias(Interface_EntityCluster)

%extend Interface_EntityCluster {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Interface_EntityIterator *
*********************************/
class Interface_EntityIterator {
	public:
		/****************** Interface_EntityIterator ******************/
		%feature("compactdefaultargs") Interface_EntityIterator;
		%feature("autodoc", "Defines an empty iterator (see addlist & additem).

Returns
-------
None
") Interface_EntityIterator;
		 Interface_EntityIterator();

		/****************** Interface_EntityIterator ******************/
		%feature("compactdefaultargs") Interface_EntityIterator;
		%feature("autodoc", "Defines an iterator on a list, directly i.e. without copying it.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
None
") Interface_EntityIterator;
		 Interface_EntityIterator(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "Adds to the iteration list a defined entity.

Parameters
----------
anentity: Standard_Transient

Returns
-------
None
") AddItem;
		void AddItem(const opencascade::handle<Standard_Transient> & anentity);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "Gets a list of entities and adds its to the iteration list.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
None
") AddList;
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Content ******************/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Returns the content of the iterator, accessed through a handle to be used by a frontal-engine logic returns an empty sequence if the iterator is empty calls start if not yet done.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Content;
		opencascade::handle<TColStd_HSequenceOfTransient> Content();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Clears data of iteration.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** GetOneItem ******************/
		%feature("compactdefaultargs") GetOneItem;
		%feature("autodoc", "Same as additem (kept for compatibility).

Parameters
----------
anentity: Standard_Transient

Returns
-------
None
") GetOneItem;
		void GetOneItem(const opencascade::handle<Standard_Transient> & anentity);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Says if there are other entities (vertices) to iterate the first time, calls start.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of entities which will be iterated on calls start if not yet done.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbTyped ******************/
		%feature("compactdefaultargs") NbTyped;
		%feature("autodoc", "Returns count of entities of a given type (kind of).

Parameters
----------
type: Standard_Type

Returns
-------
int
") NbTyped;
		Standard_Integer NbTyped(const opencascade::handle<Standard_Type> & type);

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets iteration to the next entity (vertex) to give.

Returns
-------
None
") Next;
		void Next();

		/****************** SelectType ******************/
		%feature("compactdefaultargs") SelectType;
		%feature("autodoc", "Selects entities with are kind of a given type, keep only them (is keep is true) or reject only them (if keep is false).

Parameters
----------
atype: Standard_Type
keep: bool

Returns
-------
None
") SelectType;
		void SelectType(const opencascade::handle<Standard_Type> & atype, const Standard_Boolean keep);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Allows re-iteration (useless for the first iteration).

Returns
-------
None
") Start;
		virtual void Start();

		/****************** Typed ******************/
		%feature("compactdefaultargs") Typed;
		%feature("autodoc", "Returns the list of entities of a given type (kind of).

Parameters
----------
type: Standard_Type

Returns
-------
Interface_EntityIterator
") Typed;
		Interface_EntityIterator Typed(const opencascade::handle<Standard_Type> & type);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current entity iterated, to be used by interface tools.

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		const opencascade::handle<Standard_Transient> & Value();

};


%extend Interface_EntityIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Interface_EntityList *
*****************************/
class Interface_EntityList {
	public:
		/****************** Interface_EntityList ******************/
		%feature("compactdefaultargs") Interface_EntityList;
		%feature("autodoc", "Creates a list as beeing empty.

Returns
-------
None
") Interface_EntityList;
		 Interface_EntityList();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an entity to the list, that is, with no regard about the order (faster than append if count becomes greater than 10).

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Standard_Transient> & ent);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends an entity, that is to the end of the list (keeps order, but works slowerly than add, see below).

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") Append;
		void Append(const opencascade::handle<Standard_Transient> & ent);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Fills an iterator with the content of the list (normal way to consult a list which has been filled with add).

Parameters
----------
iter: Interface_EntityIterator

Returns
-------
None
") FillIterator;
		void FillIterator(Interface_EntityIterator & iter);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the list is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of recorded entities.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbTypedEntities ******************/
		%feature("compactdefaultargs") NbTypedEntities;
		%feature("autodoc", "Returns count of entities of a given type (0 : none).

Parameters
----------
atype: Standard_Type

Returns
-------
int
") NbTypedEntities;
		Standard_Integer NbTypedEntities(const opencascade::handle<Standard_Type> & atype);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an entity from the list, if it is there.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<Standard_Transient> & ent);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an entity from the list, given its rank.

Parameters
----------
num: int

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer num);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Returns an item given its number. beware about the way the list was filled (see above, add and append).

Parameters
----------
num: int
ent: Standard_Transient

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****************** TypedEntity ******************/
		%feature("compactdefaultargs") TypedEntity;
		%feature("autodoc", "Returns the entity which is of a given type. if num = 0 (d), there must be one and only one if num > 0, returns the num-th entity of this type.

Parameters
----------
atype: Standard_Type
num: int,optional
	default value is 0

Returns
-------
opencascade::handle<Standard_Transient>
") TypedEntity;
		opencascade::handle<Standard_Transient> TypedEntity(const opencascade::handle<Standard_Type> & atype, const Standard_Integer num = 0);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns an item given its number. beware about the way the list was filled (see above, add and append).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		const opencascade::handle<Standard_Transient> & Value(const Standard_Integer num);

};


%extend Interface_EntityList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Interface_FileParameter *
********************************/
class Interface_FileParameter {
	public:
		/****************** Interface_FileParameter ******************/
		%feature("compactdefaultargs") Interface_FileParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Interface_FileParameter;
		 Interface_FileParameter();

		/****************** CValue ******************/
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "Same as above, but as a cstring (for immediate exploitation) was c++ : return const.

Returns
-------
char *
") CValue;
		const char * CValue();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears stored data : frees memory taken for the string value.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor. does nothing because memory is managed by paramset.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** EntityNumber ******************/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Returns value set by setentitynumber.

Returns
-------
int
") EntityNumber;
		Standard_Integer EntityNumber();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Fills fields (with entity number set to zero).

Parameters
----------
val: TCollection_AsciiString
typ: Interface_ParamType

Returns
-------
None
") Init;
		void Init(const TCollection_AsciiString & val, const Interface_ParamType typ);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Same as above, but builds the value from a cstring.

Parameters
----------
val: char *
typ: Interface_ParamType

Returns
-------
None
") Init;
		void Init(const char * val, const Interface_ParamType typ);

		/****************** ParamType ******************/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Returns the type of the parameter.

Returns
-------
Interface_ParamType
") ParamType;
		Interface_ParamType ParamType();

		/****************** SetEntityNumber ******************/
		%feature("compactdefaultargs") SetEntityNumber;
		%feature("autodoc", "Allows to set a reference to an entity in a numbered list.

Parameters
----------
num: int

Returns
-------
None
") SetEntityNumber;
		void SetEntityNumber(const Standard_Integer num);

};


%extend Interface_FileParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Interface_FileReaderData *
*********************************/
%nodefaultctor Interface_FileReaderData;
class Interface_FileReaderData : public Standard_Transient {
	public:
		/****************** AddParam ******************/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "Adds a parameter to record no 'num' and fills its fields (entitynumber is optional) warning : <aval> is assumed to be memory-managed elsewhere : it is not copied. this gives a best speed : strings remain stored in pages of characters.

Parameters
----------
num: int
aval: char *
atype: Interface_ParamType
nument: int,optional
	default value is 0

Returns
-------
None
") AddParam;
		void AddParam(const Standard_Integer num, const char * aval, const Interface_ParamType atype, const Standard_Integer nument = 0);

		/****************** AddParam ******************/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "Same as above, but gets a asciistring from tcollection remark that the content of the asciistring is locally copied (because its content is most often lost after using).

Parameters
----------
num: int
aval: TCollection_AsciiString
atype: Interface_ParamType
nument: int,optional
	default value is 0

Returns
-------
None
") AddParam;
		void AddParam(const Standard_Integer num, const TCollection_AsciiString & aval, const Interface_ParamType atype, const Standard_Integer nument = 0);

		/****************** AddParam ******************/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "Same as above, but gets a complete fileparameter warning : content of <fp> is not copied : its original address and space in memory are assumed to be managed elsewhere (see paramset).

Parameters
----------
num: int
FP: Interface_FileParameter

Returns
-------
None
") AddParam;
		void AddParam(const Standard_Integer num, const Interface_FileParameter & FP);

		/****************** BindEntity ******************/
		%feature("compactdefaultargs") BindEntity;
		%feature("autodoc", "Binds an entity to a record.

Parameters
----------
num: int
ent: Standard_Transient

Returns
-------
None
") BindEntity;
		void BindEntity(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****************** BoundEntity ******************/
		%feature("compactdefaultargs") BoundEntity;
		%feature("autodoc", "Returns the entity bound to a record, set by setentities.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") BoundEntity;
		const opencascade::handle<Standard_Transient> & BoundEntity(const Standard_Integer num);

		/****************** ChangeParam ******************/
		%feature("compactdefaultargs") ChangeParam;
		%feature("autodoc", "Same as above, but in order to be modified on place.

Parameters
----------
num: int
nump: int

Returns
-------
Interface_FileParameter
") ChangeParam;
		Interface_FileParameter & ChangeParam(const Standard_Integer num, const Standard_Integer nump);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor (waiting for memory management).

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Fastof ******************/
		%feature("compactdefaultargs") Fastof;
		%feature("autodoc", "Same spec.s as standard <atof> but 5 times faster.

Parameters
----------
str: char *

Returns
-------
float
") Fastof;
		static Standard_Real Fastof(const char * str);

		/****************** FindNextRecord ******************/
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "Determines the record number defining an entity following a given record number. specific to each sub-class of filereaderdata. returning zero means no record found.

Parameters
----------
num: int

Returns
-------
int
") FindNextRecord;
		virtual Standard_Integer FindNextRecord(const Standard_Integer num);

		/****************** InitParams ******************/
		%feature("compactdefaultargs") InitParams;
		%feature("autodoc", "Attaches an empty paramlist to a record.

Parameters
----------
num: int

Returns
-------
None
") InitParams;
		void InitParams(const Standard_Integer num);

		/****************** IsErrorLoad ******************/
		%feature("compactdefaultargs") IsErrorLoad;
		%feature("autodoc", "Returns true if the status 'error load' has been set (to true or false).

Returns
-------
bool
") IsErrorLoad;
		Standard_Boolean IsErrorLoad();

		/****************** IsParamDefined ******************/
		%feature("compactdefaultargs") IsParamDefined;
		%feature("autodoc", "Returns true if parameter 'nump' of record 'num' is defined (it is not if its type is paramvoid).

Parameters
----------
num: int
nump: int

Returns
-------
bool
") IsParamDefined;
		Standard_Boolean IsParamDefined(const Standard_Integer num, const Standard_Integer nump);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns the count of entities. depending of each norm, records can be entities or subparts (sublist in step, subgroup in set ...). nbentities counts only entities, not subs used for memory reservation in interfacemodel default implementation uses findnextrecord can be redefined into a more performant way.

Returns
-------
int
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****************** NbParams ******************/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Returns count of parameters attached to record 'num' if <num> = 0, returns the total recorded count of parameters.

Parameters
----------
num: int

Returns
-------
int
") NbParams;
		Standard_Integer NbParams(const Standard_Integer num);

		/****************** NbRecords ******************/
		%feature("compactdefaultargs") NbRecords;
		%feature("autodoc", "Returns the count of registered records that is, value given for initialization (can be redefined).

Returns
-------
int
") NbRecords;
		virtual Standard_Integer NbRecords();

		/****************** Param ******************/
		%feature("compactdefaultargs") Param;
		%feature("autodoc", "Returns parameter 'nump' of record 'num', as a complete fileparameter.

Parameters
----------
num: int
nump: int

Returns
-------
Interface_FileParameter
") Param;
		const Interface_FileParameter & Param(const Standard_Integer num, const Standard_Integer nump);

		/****************** ParamCValue ******************/
		%feature("compactdefaultargs") ParamCValue;
		%feature("autodoc", "Same as above, but as a cstring was c++ : return const.

Parameters
----------
num: int
nump: int

Returns
-------
char *
") ParamCValue;
		const char * ParamCValue(const Standard_Integer num, const Standard_Integer nump);

		/****************** ParamEntity ******************/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "Returns the stepentity referenced by a parameter error if none.

Parameters
----------
num: int
nump: int

Returns
-------
opencascade::handle<Standard_Transient>
") ParamEntity;
		const opencascade::handle<Standard_Transient> & ParamEntity(const Standard_Integer num, const Standard_Integer nump);

		/****************** ParamFirstRank ******************/
		%feature("compactdefaultargs") ParamFirstRank;
		%feature("autodoc", "Returns the absolute rank of the beginning of a record (its lsit is from paramfirstrank+1 to paramfirstrank+nbparams).

Parameters
----------
num: int

Returns
-------
int
") ParamFirstRank;
		Standard_Integer ParamFirstRank(const Standard_Integer num);

		/****************** ParamNumber ******************/
		%feature("compactdefaultargs") ParamNumber;
		%feature("autodoc", "Returns record number of an entity referenced by a parameter of type ident; 0 if no entitynumber has been determined note that it is used to reference entities but also sublists (sublists are not objects, but internal descriptions).

Parameters
----------
num: int
nump: int

Returns
-------
int
") ParamNumber;
		Standard_Integer ParamNumber(const Standard_Integer num, const Standard_Integer nump);

		/****************** ParamType ******************/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Returns type of parameter 'nump' of record 'num' returns literal value of parameter 'nump' of record 'num' was c++ : return const &.

Parameters
----------
num: int
nump: int

Returns
-------
Interface_ParamType
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num, const Standard_Integer nump);

		/****************** Params ******************/
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "Returns the complete paramlist of a record (read only) num = 0 to return the whole param list for the file.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_ParamList>
") Params;
		opencascade::handle<Interface_ParamList> Params(const Standard_Integer num);

		/****************** ResetErrorLoad ******************/
		%feature("compactdefaultargs") ResetErrorLoad;
		%feature("autodoc", "Returns the former value of status 'error load' then resets it used to read the status then ensure it is reset.

Returns
-------
bool
") ResetErrorLoad;
		Standard_Boolean ResetErrorLoad();

		/****************** SetErrorLoad ******************/
		%feature("compactdefaultargs") SetErrorLoad;
		%feature("autodoc", "Sets the status 'error load' on, to overside check fails <val> true : declares unloaded <val> false : declares loaded if not called before loading (see filereadertool), check fails give the status iserrorload says if seterrorload has been called by user reseterrorload resets it (called by filereadertool) this allows to specify that the currently loaded entity remains unloaded (because of syntactic fail).

Parameters
----------
val: bool

Returns
-------
None
") SetErrorLoad;
		void SetErrorLoad(const Standard_Boolean val);

		/****************** SetParam ******************/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "Sets a new value for a parameter of a record, given by : num : record number; nump : parameter number in the record.

Parameters
----------
num: int
nump: int
FP: Interface_FileParameter

Returns
-------
None
") SetParam;
		void SetParam(const Standard_Integer num, const Standard_Integer nump, const Interface_FileParameter & FP);

};


%make_alias(Interface_FileReaderData)

%extend Interface_FileReaderData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Interface_FileReaderTool *
*********************************/
%nodefaultctor Interface_FileReaderTool;
class Interface_FileReaderTool {
	public:
		/****************** AnalyseRecord ******************/
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "Fills an entity, given record no; specific to each interface, called by analysefile from interfacemodel (which manages its calling arguments) to work, each interface can define a method in its proper transient class, like this (given as an example) : analyserecord (me : mutable; fr : in out filereadertool; num : integer; acheck : in out check) returns boolean; and call it from analyserecord //! returned value : true if the entity could be loaded, false else (in case of syntactic fail).

Parameters
----------
num: int
anent: Standard_Transient
acheck: Interface_Check

Returns
-------
bool
") AnalyseRecord;
		virtual Standard_Boolean AnalyseRecord(const Standard_Integer num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

		/****************** BeginRead ******************/
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "Fills model's header; each interface defines for its model its own file header; this method fills it from filereadertool.+ it is called by analysefile from interfacemodel.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") BeginRead;
		virtual void BeginRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear filelds.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the filereaderdata which is used to work.

Returns
-------
opencascade::handle<Interface_FileReaderData>
") Data;
		opencascade::handle<Interface_FileReaderData> Data();

		/****************** EndRead ******************/
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "Ends file reading after reading all the entities default is doing nothing; redefinable as necessary.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") EndRead;
		virtual void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** ErrorHandle ******************/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Returns errorhandle flag.

Returns
-------
bool
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****************** LoadModel ******************/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "Reads and fills entities from the filereaderdata set by setdata to an interfacemodel. it enchains required operations, the specific ones correspond to deferred methods (below) to be defined for each norm. it manages also error recovery and trace. remark : it calls setmodel. it can raise any error which can occur during a load operation, unless error handling is set. this method can also be redefined if judged necessary.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") LoadModel;
		void LoadModel(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** LoadedEntity ******************/
		%feature("compactdefaultargs") LoadedEntity;
		%feature("autodoc", "Reads, fills and returns one entity read from a record of the filereaderdata. this method manages also case of fail or warning, by producing a reportentyty plus , for a fail, a literal content (as an unknownentity). performs also trace.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") LoadedEntity;
		opencascade::handle<Standard_Transient> LoadedEntity(const Standard_Integer num);

		/****************** Messenger ******************/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Returns messenger used for outputting messages. the returned object is guaranteed to be non-null; default is message::messenger().

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the stored model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates an empty model of the norm. uses protocol to do it.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol given at creation time.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Recognizes a record, given its number. specific to each interface; called by setentities. it can call the basic method recognizebylib. returns false if recognition has failed, true else. <ach> has not to be filled if simply recognition has failed : it must record true error messages : recognizebylib can generate error messages if newread is called //! note that it works thru a recognizer (method evaluate) which has to be memorized before starting.

Parameters
----------
num: int
ach: Interface_Check
ent: Standard_Transient

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const Standard_Integer num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****************** RecognizeByLib ******************/
		%feature("compactdefaultargs") RecognizeByLib;
		%feature("autodoc", "Recognizes a record with the help of libraries. can be used to implement the method recognize. <rlib> is used to find protocol and casenumber to apply <glib> performs the creation (by service newvoid, or newread if newvoid gave no result) <ach> is a check, which is transmitted to newread if it is called, gives a result but which is false <ent> is the result returns false if recognition has failed, true else.

Parameters
----------
num: int
glib: Interface_GeneralLib
rlib: Interface_ReaderLib
ach: Interface_Check
ent: Standard_Transient

Returns
-------
bool
") RecognizeByLib;
		Standard_Boolean RecognizeByLib(const Standard_Integer num, Interface_GeneralLib & glib, Interface_ReaderLib & rlib, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****************** SetData ******************/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "Sets data to a filereaderdata. works with a protocol.

Parameters
----------
reader: Interface_FileReaderData
protocol: Interface_Protocol

Returns
-------
None
") SetData;
		void SetData(const opencascade::handle<Interface_FileReaderData> & reader, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SetEntities ******************/
		%feature("compactdefaultargs") SetEntities;
		%feature("autodoc", "Fills records with empty entities; once done, each entity can ask the filereadertool for any entity referenced through an identifier. calls recognize which is specific to each specific type of filereadertool.

Returns
-------
None
") SetEntities;
		void SetEntities();

		/****************** SetErrorHandle ******************/
		%feature("compactdefaultargs") SetErrorHandle;
		%feature("autodoc", "Allows controlling whether exception raisings are handled if err is false, they are not (hence, dbx can take control) if err is true, they are, and they are traced (by putting on messenger entity's number and file record num) default given at model's creation time is true.

Parameters
----------
err: bool

Returns
-------
None
") SetErrorHandle;
		void SetErrorHandle(const Standard_Boolean err);

		/****************** SetMessenger ******************/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "Sets messenger used for outputting messages.

Parameters
----------
messenger: Message_Messenger

Returns
-------
None
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & messenger);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Stores a model. used when the model has been loaded.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** SetTraceLevel ******************/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages default is 1 : errors traced.

Parameters
----------
tracelev: int

Returns
-------
None
") SetTraceLevel;
		void SetTraceLevel(const Standard_Integer tracelev);

		/****************** TraceLevel ******************/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Returns trace level used for outputting messages.

Returns
-------
int
") TraceLevel;
		Standard_Integer TraceLevel();

		/****************** UnknownEntity ******************/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Provides an unknown entity, specific to the interface called by setentities when recognize has failed (unknown alone) or by loadmodel when an entity has caused a fail on reading (to keep at least its literal description) uses protocol to do it.

Returns
-------
opencascade::handle<Standard_Transient>
") UnknownEntity;
		opencascade::handle<Standard_Transient> UnknownEntity();

};


%extend Interface_FileReaderTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Interface_FloatWriter *
******************************/
class Interface_FloatWriter {
	public:
		/****************** Interface_FloatWriter ******************/
		%feature("compactdefaultargs") Interface_FloatWriter;
		%feature("autodoc", "Creates a floatwriter ready to work, with default options - - zero suppress option is set - main format is set to '%e' - secondary format is set to '%f' for values between 0.1 and 1000. in absolute values if <chars> is given (and positive), it will produce options to produce this count of characters : '%<chars>f','%<chars>%e'.

Parameters
----------
chars: int,optional
	default value is 0

Returns
-------
None
") Interface_FloatWriter;
		 Interface_FloatWriter(const Standard_Integer chars = 0);

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "This class method converts a real value to a string, given options given as arguments. it can be called independantly. warning : even if declared in, content of <text> will be modified.

Parameters
----------
val: float
text: char *
zerosup: bool
Range1: float
Range2: float
mainform: char *
rangeform: char *

Returns
-------
int
") Convert;
		static Standard_Integer Convert(const Standard_Real val, const char * text, const Standard_Boolean zerosup, const Standard_Real Range1, const Standard_Real Range2, const char * mainform, const char * rangeform);

		/****************** FormatForRange ******************/
		%feature("compactdefaultargs") FormatForRange;
		%feature("autodoc", "Returns the format for range, if set meaningful only if <range> from options is true was c++ : return const.

Returns
-------
char *
") FormatForRange;
		const char * FormatForRange();

		/****************** MainFormat ******************/
		%feature("compactdefaultargs") MainFormat;
		%feature("autodoc", "Returns the main format was c++ : return const.

Returns
-------
char *
") MainFormat;
		const char * MainFormat();

		/****************** Options ******************/
		%feature("compactdefaultargs") Options;
		%feature("autodoc", "Returns active options : <zerosup> is the option zerosuppress, <range> is true if a range is set, false else r1,r2 give the range (if it is set).

Parameters
----------

Returns
-------
zerosup: bool
range: bool
R1: float
R2: float
") Options;
		void Options(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetDefaults ******************/
		%feature("compactdefaultargs") SetDefaults;
		%feature("autodoc", "Sets again options to the defaults given by create.

Parameters
----------
chars: int,optional
	default value is 0

Returns
-------
None
") SetDefaults;
		void SetDefaults(const Standard_Integer chars = 0);

		/****************** SetFormat ******************/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "Sets a specific format for sending reals (main format) (default from creation is '%e') if <reset> is given true (default), this call clears effects of former calls to setformatforrange and setzerosuppress.

Parameters
----------
form: char *
reset: bool,optional
	default value is Standard_True

Returns
-------
None
") SetFormat;
		void SetFormat(const char * form, const Standard_Boolean reset = Standard_True);

		/****************** SetFormatForRange ******************/
		%feature("compactdefaultargs") SetFormatForRange;
		%feature("autodoc", "Sets a secondary format for real, to be applied between r1 and r2 (in absolute values). a call to setrealform cancels this secondary form if <reset> is true. (default from creation is '%f' between 0.1 and 1000.) warning : if the condition (0. <= r1 < r2) is not fulfilled, this secondary form is canceled.

Parameters
----------
form: char *
R1: float
R2: float

Returns
-------
None
") SetFormatForRange;
		void SetFormatForRange(const char * form, const Standard_Real R1, const Standard_Real R2);

		/****************** SetZeroSuppress ******************/
		%feature("compactdefaultargs") SetZeroSuppress;
		%feature("autodoc", "Sets sending real parameters to suppress trailing zeros and null exponant ('e+00'), if <mode> is given true, resets this mode if <mode> is false (in addition to real forms) a call to setrealfrom resets this mode to false ig <reset> is given true (default from creation is true).

Parameters
----------
mode: bool

Returns
-------
None
") SetZeroSuppress;
		void SetZeroSuppress(const Standard_Boolean mode);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a real value <val> to a string <text> by using the options. returns the useful length of produced string. it calls the class method convert. warning : <text> is assumed to be wide enough (20-30 is correct) and, even if declared in, its content will be modified.

Parameters
----------
val: float
text: char *

Returns
-------
int
") Write;
		Standard_Integer Write(const Standard_Real val, const char * text);

};


%extend Interface_FloatWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Interface_GTool *
************************/
class Interface_GTool : public Standard_Transient {
	public:
		/****************** Interface_GTool ******************/
		%feature("compactdefaultargs") Interface_GTool;
		%feature("autodoc", "Creates an empty, not set, gtool.

Returns
-------
None
") Interface_GTool;
		 Interface_GTool();

		/****************** Interface_GTool ******************/
		%feature("compactdefaultargs") Interface_GTool;
		%feature("autodoc", "Creates a gtool from a protocol optional starting count of entities.

Parameters
----------
proto: Interface_Protocol
nbent: int,optional
	default value is 0

Returns
-------
None
") Interface_GTool;
		 Interface_GTool(const opencascade::handle<Interface_Protocol> & proto, const Standard_Integer nbent = 0);

		/****************** ClearEntities ******************/
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "Clears the maps which record, for each already recorded entity its module and case number.

Returns
-------
None
") ClearEntities;
		void ClearEntities();

		/****************** Lib ******************/
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "Returns the generallib itself.

Returns
-------
Interface_GeneralLib
") Lib;
		Interface_GeneralLib & Lib();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol. warning : it can be null.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****************** Reservate ******************/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "Reservates maps for a count of entities <enforce> false : minimum count <enforce> true : clears former reservations does not clear the maps.

Parameters
----------
nb: int
enforce: bool,optional
	default value is Standard_False

Returns
-------
None
") Reservate;
		void Reservate(const Standard_Integer nb, const Standard_Boolean enforce = Standard_False);

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects for an entity, its module and case number it is optimised : once done for each entity, the result is mapped and the generallib is not longer queried <enforce> true overpasses this optimisation.

Parameters
----------
ent: Standard_Transient
gmod: Interface_GeneralModule
enforce: bool,optional
	default value is Standard_False

Returns
-------
CN: int
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Interface_GeneralModule> & gmod, Standard_Integer &OutValue, const Standard_Boolean enforce = Standard_False);

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "Sets a new protocol if <enforce> is false and the new protocol equates the old one then nothing is done.

Parameters
----------
proto: Interface_Protocol
enforce: bool,optional
	default value is Standard_False

Returns
-------
None
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & proto, const Standard_Boolean enforce = Standard_False);

		/****************** SetSignType ******************/
		%feature("compactdefaultargs") SetSignType;
		%feature("autodoc", "Sets a new signtype.

Parameters
----------
sign: Interface_SignType

Returns
-------
None
") SetSignType;
		void SetSignType(const opencascade::handle<Interface_SignType> & sign);

		/****************** SignName ******************/
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "Returns the name of the signtype, or 'class name'.

Returns
-------
char *
") SignName;
		const char * SignName();

		/****************** SignType ******************/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "Returns the signtype. can be null.

Returns
-------
opencascade::handle<Interface_SignType>
") SignType;
		opencascade::handle<Interface_SignType> SignType();

		/****************** SignValue ******************/
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "Returns the signature for a transient object in a model it calls signtype to do that if signtype is not defined, return classname of <ent>.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
char *
") SignValue;
		const char * SignValue(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(Interface_GTool)

%extend Interface_GTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Interface_GeneralLib *
*****************************/
class Interface_GeneralLib {
	public:
		/****************** Interface_GeneralLib ******************/
		%feature("compactdefaultargs") Interface_GeneralLib;
		%feature("autodoc", "Creates a library which complies with a protocol, that is : same class (criterium isinstance) this creation gets the modules from the global set, those which are bound to the given protocol and its resources.

Parameters
----------
aprotocol: Interface_Protocol

Returns
-------
None
") Interface_GeneralLib;
		 Interface_GeneralLib(const opencascade::handle<Interface_Protocol> & aprotocol);

		/****************** Interface_GeneralLib ******************/
		%feature("compactdefaultargs") Interface_GeneralLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") Interface_GeneralLib;
		 Interface_GeneralLib();

		/****************** AddProtocol ******************/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "Adds a couple (module-protocol) to the library, given the class of a protocol. takes resources into account. (if <aprotocol> is not of type theprotocol, it is not added).

Parameters
----------
aprotocol: Standard_Transient

Returns
-------
None
") AddProtocol;
		void AddProtocol(const opencascade::handle<Standard_Transient> & aprotocol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<Interface_GeneralModule>
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects a module from the library, given an object. returns true if select has succeeded, false else. also returns (as arguments) the selected module and the case number determined by the associated protocol. if select has failed, <module> is null handle and cn is zero. (select can work on any criterium, such as object dynamictype).

Parameters
----------
obj: Standard_Transient
module: Interface_GeneralModule

Returns
-------
CN: int
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<Interface_GeneralModule> & module, Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "Adds a couple (module-protocol) into the global definition set for this class of library.

Parameters
----------
amodule: Interface_GeneralModule
aprotocol: Interface_Protocol

Returns
-------
None
") SetGlobal;
		static void SetGlobal(const opencascade::handle<Interface_GeneralModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts iteration on the modules (sets it on the first one).

Returns
-------
None
") Start;
		void Start();

};


%extend Interface_GeneralLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Interface_GeneralModule *
********************************/
%nodefaultctor Interface_GeneralModule;
class Interface_GeneralModule : public Standard_Transient {
	public:
		/****************** CanCopy ******************/
		%feature("compactdefaultargs") CanCopy;
		%feature("autodoc", "Specific answer to the question 'is copy properly implemented' remark that it should be in phase with the implementation of newvoid+copycase/newcopycase default returns always false, can be redefined.

Parameters
----------
CN: int
ent: Standard_Transient

Returns
-------
bool
") CanCopy;
		virtual Standard_Boolean CanCopy(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent);

		/****************** CategoryNumber ******************/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity category numbers are managed by the class category <shares> can be used to evaluate this number in the context default returns 0 which means 'unspecified'.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****************** CheckCase ******************/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "Specific checking of an entity <ent> can check context queried through a sharetool, as required.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") CheckCase;
		virtual void CheckCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "Specific copy ('deep') from <entfrom> to <entto> (same type) by using a copytool which provides its working map. use method transferred from copytool to work.

Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
None
") CopyCase;
		virtual void CopyCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "Dispatches an entity returns true if it works by copy, false if it just duplicates the starting handle //! dispatching means producing a new entity, image of the starting one, in order to be put into a new model, this model being itself the result of a dispatch from an original model //! according to the cases, dispatch can either * just return <entto> as equating <entfrom> -> the new model designates the starting entity : it is lighter, but the dispatched entity being shared might not be modified for dispatch * copy <entfrom> to <entto> by calling newvoid+copycase (two steps) or newcopiedcase (1) -> the dispatched entity is a copy, hence it can be modified //! the provided default just duplicates the handle without copying, then returns false. can be redefined.

Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
bool
") Dispatch;
		virtual Standard_Boolean Dispatch(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****************** FillShared ******************/
		%feature("compactdefaultargs") FillShared;
		%feature("autodoc", "Specific filling of the list of entities shared by an entity <ent>, according a case number <cn> (formerly computed by casenum), considered in the context of a model <model> default calls fillsharedcase (i.e., ignores the model) can be redefined to use the model for working.

Parameters
----------
model: Interface_InterfaceModel
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") FillShared;
		virtual void FillShared(const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** FillSharedCase ******************/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "Specific filling of the list of entities shared by an entity <ent>, according a case number <cn> (formerly computed by casenum). can use the internal utility method share, below.

Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") FillSharedCase;
		virtual void FillSharedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** ListImplied ******************/
		%feature("compactdefaultargs") ListImplied;
		%feature("autodoc", "List the implied references of <ent> considered in the context of a model <model> : i.e. the entities which are referenced while not considered as shared (not copied if <ent> is, references not renewed by copycase but by impliedcase, only if referenced entities have been copied too) fillshared + listimplied give the complete list of references default calls listimpliedcase (i.e. ignores the model) can be redefined to use the model for working.

Parameters
----------
model: Interface_InterfaceModel
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") ListImplied;
		virtual void ListImplied(const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** ListImpliedCase ******************/
		%feature("compactdefaultargs") ListImpliedCase;
		%feature("autodoc", "List the implied references of <ent> (see above) are referenced while not considered as shared (not copied if <ent> is, references not renewed by copycase but by impliedcase, only if referenced entities have been copied too) fillsharedcase + listimpliedcase give the complete list of referenced entities the provided default method does nothing (implied references are specific of a little amount of entity classes).

Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") ListImpliedCase;
		virtual void ListImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Determines if an entity brings a name (or widerly, if a name can be attached to it, through the sharetool by default, returns a null handle (no name can be produced) can be redefined //! warning : while this string may be edited on the spot, if it is a read field, the returned value must be copied before.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		virtual opencascade::handle<TCollection_HAsciiString> Name(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****************** NewCopiedCase ******************/
		%feature("compactdefaultargs") NewCopiedCase;
		%feature("autodoc", "Specific operator (create+copy) defaulted to do nothing. it can be redefined : when it is not possible to work in two steps (newvoid then copycase). this can occur when there is no default constructor : hence the result <entto> must be created with an effective definition. remark : if newcopiedcase is defined, copycase has nothing to do returns true if it has produced something, false else.

Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
bool
") NewCopiedCase;
		virtual Standard_Boolean NewCopiedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****************** NewVoid ******************/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "Creates a new void entity <entto> according to a case number this entity remains to be filled, by reading from a file or by copying from another entity of same type (see copycase).

Parameters
----------
CN: int
entto: Standard_Transient

Returns
-------
bool
") NewVoid;
		virtual Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****************** RenewImpliedCase ******************/
		%feature("compactdefaultargs") RenewImpliedCase;
		%feature("autodoc", "Specific copying of implied references a default is provided which does nothing (must current case !) already copied references (by copyfrom) must remain unchanged use method search from copytool to work.

Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
None
") RenewImpliedCase;
		virtual void RenewImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, const Interface_CopyTool & TC);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Adds an entity to a shared list (uses getoneitem on <iter>).

Parameters
----------
iter: Interface_EntityIterator
shared: Standard_Transient

Returns
-------
None
") Share;
		void Share(Interface_EntityIterator & iter, const opencascade::handle<Standard_Transient> & shared);

		/****************** WhenDeleteCase ******************/
		%feature("compactdefaultargs") WhenDeleteCase;
		%feature("autodoc", "Prepares an entity to be deleted. what does it mean : basically, any class of entity may define its own destructor by default, it does nothing but calling destructors on fields with the memory manager, it is useless to call destructor, it is done automatically when the handle is nullified(cleared) but this is ineffective in looping structures (whatever these are 'implied' references or not). //! thus : if no loop may appear in definitions, a class which inherits from tshared is correctly managed by automatic way but if there can be loops (or simply back pointers), they must be broken, for instance by clearing fields of one of the nodes the default does nothing, to be redefined if a loop can occur (implied generally requires whendelete, but other cases can occur) //! warning : <dispatched> tells if the entity to be deleted has been produced by dispatch or not. hence whendelete must be in coherence with dispatch dispatch can either copy or not. if it copies the entity, this one should be deleted if it doesnt (i.e. duplicates the handle) nothing to do //! if <dispatch> is false, normal deletion is to be performed.

Parameters
----------
CN: int
ent: Standard_Transient
dispatched: bool

Returns
-------
None
") WhenDeleteCase;
		virtual void WhenDeleteCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean dispatched);

};


%make_alias(Interface_GeneralModule)

%extend Interface_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Interface_GlobalNodeOfGeneralLib *
*****************************************/
class Interface_GlobalNodeOfGeneralLib : public Standard_Transient {
	public:
		/****************** Interface_GlobalNodeOfGeneralLib ******************/
		%feature("compactdefaultargs") Interface_GlobalNodeOfGeneralLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") Interface_GlobalNodeOfGeneralLib;
		 Interface_GlobalNodeOfGeneralLib();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a module bound with a protocol to the list : does nothing if already in the list, that is, same type (exact match) and same state (that is, isequal is not required) once added, stores its attached protocol in correspondance.

Parameters
----------
amodule: Interface_GeneralModule
aprotocol: Interface_Protocol

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Interface_GeneralModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<Interface_GeneralModule>
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_GlobalNodeOfGeneralLib>
") Next;
		const opencascade::handle<Interface_GlobalNodeOfGeneralLib> & Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the attached protocol stored in a given globalnode.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

};


%make_alias(Interface_GlobalNodeOfGeneralLib)

%extend Interface_GlobalNodeOfGeneralLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class Interface_GlobalNodeOfReaderLib *
****************************************/
class Interface_GlobalNodeOfReaderLib : public Standard_Transient {
	public:
		/****************** Interface_GlobalNodeOfReaderLib ******************/
		%feature("compactdefaultargs") Interface_GlobalNodeOfReaderLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") Interface_GlobalNodeOfReaderLib;
		 Interface_GlobalNodeOfReaderLib();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a module bound with a protocol to the list : does nothing if already in the list, that is, same type (exact match) and same state (that is, isequal is not required) once added, stores its attached protocol in correspondance.

Parameters
----------
amodule: Interface_ReaderModule
aprotocol: Interface_Protocol

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Interface_ReaderModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<Interface_ReaderModule>
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_GlobalNodeOfReaderLib>
") Next;
		const opencascade::handle<Interface_GlobalNodeOfReaderLib> & Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the attached protocol stored in a given globalnode.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

};


%make_alias(Interface_GlobalNodeOfReaderLib)

%extend Interface_GlobalNodeOfReaderLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Interface_Graph *
************************/
class Interface_Graph {
	public:
		/****************** Interface_Graph ******************/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "Creates an empty graph, ready to receive entities from amodel note that this way of creation allows <self> to verify that entities to work with are contained in <amodel> basic shared and sharing lists are obtained from a general services library, given directly as an argument.

Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib, const Standard_Boolean theModeStats = Standard_True);

		/****************** Interface_Graph ******************/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "Same as above, but the library is defined through a protocol.

Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol, const Standard_Boolean theModeStats = Standard_True);

		/****************** Interface_Graph ******************/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "Same as above, but the library is defined through a protocol.

Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool, const Standard_Boolean theModeStats = Standard_True);

		/****************** Interface_Graph ******************/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "Same a above but works with the protocol recorded in the model.

Parameters
----------
amodel: Interface_InterfaceModel
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Standard_Boolean theModeStats = Standard_True);

		/****************** Interface_Graph ******************/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "Creates a graph from another one, getting all its data remark that status are copied from <agraph>, but the other lists (sharing/shared) are copied only if <copied> = true.

Parameters
----------
agraph: Interface_Graph
copied: bool,optional
	default value is Standard_False

Returns
-------
None
") Interface_Graph;
		 Interface_Graph(const Interface_Graph & agraph, const Standard_Boolean copied = Standard_False);

		/****************** BitMap ******************/
		%feature("compactdefaultargs") BitMap;
		%feature("autodoc", "Returns the bit map in order to read or edit flag values.

Returns
-------
Interface_BitMap
") BitMap;
		const Interface_BitMap & BitMap();

		/****************** CBitMap ******************/
		%feature("compactdefaultargs") CBitMap;
		%feature("autodoc", "Returns the bit map in order to edit it (add new flags).

Returns
-------
Interface_BitMap
") CBitMap;
		Interface_BitMap & CBitMap();

		/****************** ChangeStatus ******************/
		%feature("compactdefaultargs") ChangeStatus;
		%feature("autodoc", "Changes all status which value is oldstat to new value newstat.

Parameters
----------
oldstat: int
newstat: int

Returns
-------
None
") ChangeStatus;
		void ChangeStatus(const Standard_Integer oldstat, const Standard_Integer newstat);

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns mapped entity given its no (if it is present).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Entity;
		const opencascade::handle<Standard_Transient> & Entity(const Standard_Integer num);

		/****************** EntityNumber ******************/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Returns the number of the entity in the map, computed at creation time (entities loaded from the model) returns 0 if <ent> not contained by model used to create <self> (that is, <ent> is unknown from <self>).

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") EntityNumber;
		Standard_Integer EntityNumber(const opencascade::handle<Standard_Transient> & ent);

		/****************** GetFromEntity ******************/
		%feature("compactdefaultargs") GetFromEntity;
		%feature("autodoc", "Gets an entity, plus its shared ones (at every level) if 'shared' is true. new items are set to status 'newstat' items already present in graph remain unchanged of course, redefinitions of shared lists are taken into account if there are some.

Parameters
----------
ent: Standard_Transient
shared: bool
newstat: int,optional
	default value is 0

Returns
-------
None
") GetFromEntity;
		void GetFromEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean shared, const Standard_Integer newstat = 0);

		/****************** GetFromEntity ******************/
		%feature("compactdefaultargs") GetFromEntity;
		%feature("autodoc", "Gets an entity, plus its shared ones (at every level) if 'shared' is true. new items are set to status 'newstat'. items already present in graph are processed as follows : - if they already have status 'newstat', they remain unchanged - if they have another status, this one is modified : if cumul is true, to former status + overlapstat (cumul) if cumul is false, to overlapstat (enforce).

Parameters
----------
ent: Standard_Transient
shared: bool
newstat: int
overlapstat: int
cumul: bool

Returns
-------
None
") GetFromEntity;
		void GetFromEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean shared, const Standard_Integer newstat, const Standard_Integer overlapstat, const Standard_Boolean cumul);

		/****************** GetFromGraph ******************/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "Gets all present items from another graph.

Parameters
----------
agraph: Interface_Graph

Returns
-------
None
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph);

		/****************** GetFromGraph ******************/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "Gets items from another graph which have a specific status.

Parameters
----------
agraph: Interface_Graph
stat: int

Returns
-------
None
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph, const Standard_Integer stat);

		/****************** GetFromIter ******************/
		%feature("compactdefaultargs") GetFromIter;
		%feature("autodoc", "Gets entities given by an entityiterator. entities which were not yet present in the graph are mapped with status 'newstat' entities already present remain unchanged.

Parameters
----------
iter: Interface_EntityIterator
newstat: int

Returns
-------
None
") GetFromIter;
		void GetFromIter(const Interface_EntityIterator & iter, const Standard_Integer newstat);

		/****************** GetFromIter ******************/
		%feature("compactdefaultargs") GetFromIter;
		%feature("autodoc", "Gets entities given by an entityiterator and distinguishes those already present in the graph : - new entities added to the graph with status 'newstst' - entities already present with status = 'newstat' remain unchanged - entities already present with status different form 'newstat' have their status modified : if cumul is true, to former status + overlapstat (cumul) if cumul is false, to overlapstat (enforce) (note : works as getentity, shared = false, for each entity).

Parameters
----------
iter: Interface_EntityIterator
newstat: int
overlapstat: int
cumul: bool

Returns
-------
None
") GetFromIter;
		void GetFromIter(const Interface_EntityIterator & iter, const Standard_Integer newstat, const Standard_Integer overlapstat, const Standard_Boolean cumul);

		/****************** GetFromModel ******************/
		%feature("compactdefaultargs") GetFromModel;
		%feature("autodoc", "Loads graph with all entities contained in the model.

Returns
-------
None
") GetFromModel;
		void GetFromModel();

		/****************** GetShareds ******************/
		%feature("compactdefaultargs") GetShareds;
		%feature("autodoc", "Returns the sequence of entities shared by an entity.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GetShareds;
		opencascade::handle<TColStd_HSequenceOfTransient> GetShareds(const opencascade::handle<Standard_Transient> & ent);

		/****************** GetSharings ******************/
		%feature("compactdefaultargs") GetSharings;
		%feature("autodoc", "Returns the sequence of entities sharings by an entity.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GetSharings;
		opencascade::handle<TColStd_HSequenceOfTransient> GetSharings(const opencascade::handle<Standard_Transient> & ent);

		/****************** HasShareErrors ******************/
		%feature("compactdefaultargs") HasShareErrors;
		%feature("autodoc", "Returns true if <ent> or the list of entities shared by <ent> (not redefined) contains items unknown from this graph remark : apart from the status hasshareerror, these items are ignored.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") HasShareErrors;
		Standard_Boolean HasShareErrors(const opencascade::handle<Standard_Transient> & ent);

		/****************** IsPresent ******************/
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "Returns true if an entity is noted as present in the graph (see methods get... which determine this status) returns false if <num> is out of range too.

Parameters
----------
num: int

Returns
-------
bool
") IsPresent;
		Standard_Boolean IsPresent(const Standard_Integer num);

		/****************** IsPresent ******************/
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "Same as above but directly on an entity <ent> : if it is not contained in the model, returns false. else calls ispresent(num) with <num> given by entitynumber.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsPresent;
		Standard_Boolean IsPresent(const opencascade::handle<Standard_Transient> & ent);

		/****************** ModeStat ******************/
		%feature("compactdefaultargs") ModeStat;
		%feature("autodoc", "Returns mode resposible for computation of statuses;.

Returns
-------
bool
") ModeStat;
		Standard_Boolean ModeStat();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model with which this graph was created.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Determines the name attached to an entity, by using the general service name in generalmodule returns a null handle if no name could be computed or if the entity is not in the model.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name(const opencascade::handle<Standard_Transient> & ent);

		/****************** NbStatuses ******************/
		%feature("compactdefaultargs") NbStatuses;
		%feature("autodoc", "Returns size of array of statuses.

Returns
-------
int
") NbStatuses;
		Standard_Integer NbStatuses();

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "Clears entity and sets status to 0, for a numero.

Parameters
----------
num: int

Returns
-------
None
") RemoveItem;
		void RemoveItem(const Standard_Integer num);

		/****************** RemoveStatus ******************/
		%feature("compactdefaultargs") RemoveStatus;
		%feature("autodoc", "Removes all items of which status has a given value stat.

Parameters
----------
stat: int

Returns
-------
None
") RemoveStatus;
		void RemoveStatus(const Standard_Integer stat);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Erases data, making graph ready to rebegin from void (also resets shared lists redefinitions).

Returns
-------
None
") Reset;
		void Reset();

		/****************** ResetStatus ******************/
		%feature("compactdefaultargs") ResetStatus;
		%feature("autodoc", "Erases status (values and flags of presence), making graph ready to rebegin from void. does not concerns shared lists.

Returns
-------
None
") ResetStatus;
		void ResetStatus();

		/****************** RootEntities ******************/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Returns the entities which are not shared (their sharing list is empty) in the model.

Returns
-------
Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities();

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Modifies status associated to a numero.

Parameters
----------
num: int
stat: int

Returns
-------
None
") SetStatus;
		void SetStatus(const Standard_Integer num, const Standard_Integer stat);

		/****************** Shareds ******************/
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "Returns the list of entities shared by an entity, as recorded by the graph. that is, by default basic shared list, else it can be redefined by methods setshare, setnoshare ... see below.

Parameters
----------
ent: Standard_Transient

Returns
-------
Interface_EntityIterator
") Shareds;
		Interface_EntityIterator Shareds(const opencascade::handle<Standard_Transient> & ent);

		/****************** SharingTable ******************/
		%feature("compactdefaultargs") SharingTable;
		%feature("autodoc", "Returns the table of sharing lists. used to create another graph from <self>.

Returns
-------
opencascade::handle<TColStd_HArray1OfListOfInteger>
") SharingTable;
		const opencascade::handle<TColStd_HArray1OfListOfInteger> & SharingTable();

		/****************** Sharings ******************/
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "Returns the list of entities which share an entity, computed from the basic or redefined shared lists.

Parameters
----------
ent: Standard_Transient

Returns
-------
Interface_EntityIterator
") Sharings;
		Interface_EntityIterator Sharings(const opencascade::handle<Standard_Transient> & ent);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns size (max nb of entities, i.e. model's nb of entities).

Returns
-------
int
") Size;
		Standard_Integer Size();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns status associated to a numero (only to read it).

Parameters
----------
num: int

Returns
-------
int
") Status;
		Standard_Integer Status(const Standard_Integer num);

		/****************** TypedSharings ******************/
		%feature("compactdefaultargs") TypedSharings;
		%feature("autodoc", "Returns the list of sharings entities, at any level, which are kind of a given type. a sharing entity kind of this type ends the exploration of its branch.

Parameters
----------
ent: Standard_Transient
type: Standard_Type

Returns
-------
Interface_EntityIterator
") TypedSharings;
		Interface_EntityIterator TypedSharings(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Type> & type);

};


%extend Interface_Graph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Interface_HGraph *
*************************/
class Interface_HGraph : public Standard_Transient {
	public:
		/****************** Interface_HGraph ******************/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "Creates an hgraph directly from a graph. remark that the starting graph is duplicated.

Parameters
----------
agraph: Interface_Graph

Returns
-------
None
") Interface_HGraph;
		 Interface_HGraph(const Interface_Graph & agraph);

		/****************** Interface_HGraph ******************/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "Creates an hgraph with a graph created from <amodel> and <lib>.

Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib, const Standard_Boolean theModeStats = Standard_True);

		/****************** Interface_HGraph ******************/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "Creates an hgraph with a graph itself created from <amodel> and <protocol>.

Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol, const Standard_Boolean theModeStats = Standard_True);

		/****************** Interface_HGraph ******************/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "Creates an hgraph with a graph itself created from <amodel> and <protocol>.

Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool, const Standard_Boolean theModeStats = Standard_True);

		/****************** Interface_HGraph ******************/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "Same a above, but works with the gtool in the model.

Parameters
----------
amodel: Interface_InterfaceModel
theModeStats: bool,optional
	default value is Standard_True

Returns
-------
None
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Standard_Boolean theModeStats = Standard_True);

		/****************** CGraph ******************/
		%feature("compactdefaultargs") CGraph;
		%feature("autodoc", "Same as above, but for read-write operations then, the graph will be modified in the hgraph itself.

Returns
-------
Interface_Graph
") CGraph;
		Interface_Graph & CGraph();

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns the graph contained in <self>, for read only operations remark that it is returns as 'const &' getting it in a new variable instead of a reference would be a pitty, because all the graph's content would be duplicated.

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

};


%make_alias(Interface_HGraph)

%extend Interface_HGraph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Interface_IntList *
**************************/
class Interface_IntList {
	public:
		/****************** Interface_IntList ******************/
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "Creates empty intlist.

Returns
-------
None
") Interface_IntList;
		 Interface_IntList();

		/****************** Interface_IntList ******************/
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "Creates an intlist for <nbe> entities.

Parameters
----------
nbe: int

Returns
-------
None
") Interface_IntList;
		 Interface_IntList(const Standard_Integer nbe);

		/****************** Interface_IntList ******************/
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "Creates an intlist from another one. if <copied> is true, copies data else, data are not copied, only the header object is.

Parameters
----------
other: Interface_IntList
copied: bool

Returns
-------
None
") Interface_IntList;
		 Interface_IntList(const Interface_IntList & other, const Standard_Boolean copied);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a reference (as an integer value, an entity number) to the current entity number. zero is ignored.

Parameters
----------
ref: int

Returns
-------
None
") Add;
		void Add(const Standard_Integer ref);

		/****************** AdjustSize ******************/
		%feature("compactdefaultargs") AdjustSize;
		%feature("autodoc", "Resizes lists to exact sizes. for list of refs, a positive margin can be added.

Parameters
----------
margin: int,optional
	default value is 0

Returns
-------
None
") AdjustSize;
		void AdjustSize(const Standard_Integer margin = 0);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all data, hence each entity number has an empty list.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize intlist by number of entities.

Parameters
----------
nbe: int

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer nbe);

		/****************** Internals ******************/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "Returns internal values, used for copying.

Parameters
----------
ents: TColStd_HArray1OfInteger
refs: TColStd_HArray1OfInteger

Returns
-------
nbrefs: int
") Internals;
		void Internals(Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfInteger> & ents, opencascade::handle<TColStd_HArray1OfInteger> & refs);

		/****************** IsRedefined ******************/
		%feature("compactdefaultargs") IsRedefined;
		%feature("autodoc", "Returns true if the list for a number (default is taken as current) is 'redefined' (usefull for empty list).

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
bool
") IsRedefined;
		Standard_Boolean IsRedefined(const Standard_Integer num = 0);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the count of refs attached to current entity number.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Returns an intlist, identical to <self> but set to a specified entity number by default, not copied (in order to be read) specified <copied> to produce another list and edit it.

Parameters
----------
number: int
copied: bool,optional
	default value is Standard_False

Returns
-------
Interface_IntList
") List;
		Interface_IntList List(const Standard_Integer number, const Standard_Boolean copied = Standard_False);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of entities to be aknowledged.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns the current entity number.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an item in the list for current number, given its rank returns true if done, false else.

Parameters
----------
num: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer num);

		/****************** Reservate ******************/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "Makes a reservation for <count> references to be later attached to the current entity. if required, it increases the size of array used to store refs. remark that if count is less than two, it does nothing (because immediate storing).

Parameters
----------
count: int

Returns
-------
None
") Reservate;
		void Reservate(const Standard_Integer count);

		/****************** SetNbEntities ******************/
		%feature("compactdefaultargs") SetNbEntities;
		%feature("autodoc", "Changes the count of entities (ignored if decreased).

Parameters
----------
nbe: int

Returns
-------
None
") SetNbEntities;
		void SetNbEntities(const Standard_Integer nbe);

		/****************** SetNumber ******************/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "Sets an entity number as current (for read and fill).

Parameters
----------
number: int

Returns
-------
None
") SetNumber;
		void SetNumber(const Standard_Integer number);

		/****************** SetRedefined ******************/
		%feature("compactdefaultargs") SetRedefined;
		%feature("autodoc", "Sets current entity list to be redefined or not this is used in a graph for redefinition list : it can be disable (no redefinition, i.e. list is cleared), or enabled (starts as empty). the original list has not to be 'redefined'.

Parameters
----------
mode: bool

Returns
-------
None
") SetRedefined;
		void SetRedefined(const Standard_Boolean mode);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns a reference number in the list for current number, according to its rank.

Parameters
----------
num: int

Returns
-------
int
") Value;
		Standard_Integer Value(const Standard_Integer num);

};


%extend Interface_IntList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Interface_IntVal *
*************************/
class Interface_IntVal : public Standard_Transient {
	public:
		/****************** Interface_IntVal ******************/
		%feature("compactdefaultargs") Interface_IntVal;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Interface_IntVal;
		 Interface_IntVal();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetCValue() {
            return (Standard_Integer) $self->CValue();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCValue(Standard_Integer value) {
            $self->CValue()=value;
            }
        };
		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Value;
		Standard_Integer Value();

};


%make_alias(Interface_IntVal)

%extend Interface_IntVal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Interface_InterfaceModel *
*********************************/
%nodefaultctor Interface_InterfaceModel;
class Interface_InterfaceModel : public Standard_Transient {
	public:
		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "Internal method for adding an entity. used by file reading (defined by each interface) and transfer tools. it adds the entity required to be added, not its refs : see addwithrefs. if <anentity> is a reportentity, it is added to the list of reports, its concerned entity (erroneous or corrected, else unknown) is added to the list of entities. that is, the reportentity must be created before adding.

Parameters
----------
anentity: Standard_Transient

Returns
-------
None
") AddEntity;
		virtual void AddEntity(const opencascade::handle<Standard_Transient> & anentity);

		/****************** AddReportEntity ******************/
		%feature("compactdefaultargs") AddReportEntity;
		%feature("autodoc", "Adds a reportentity as such. returns false if the concerned entity is not recorded in the model else, adds it into, either the main report list or the list for semantic checks, then returns true.

Parameters
----------
rep: Interface_ReportEntity
semantic: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddReportEntity;
		Standard_Boolean AddReportEntity(const opencascade::handle<Interface_ReportEntity> & rep, const Standard_Boolean semantic = Standard_False);

		/****************** AddWithRefs ******************/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "Adds to the model, an entity with all its references, as they are defined by general services fillshared and listimplied. process is recursive (any sub-levels) if <level> = 0 (default) else, adds sub-entities until the required sub-level. especially, if <level> = 1, adds immediate subs and that's all //! if <listall> is false (default), an entity (<anentity> itself or one of its subs at any level) which is already recorded in the model is not analysed, only the newly added ones are. if <listall> is true, all items are analysed (this allows to ensure the consistency of an adding made by steps).

Parameters
----------
anent: Standard_Transient
proto: Interface_Protocol
level: int,optional
	default value is 0
listall: bool,optional
	default value is Standard_False

Returns
-------
None
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const opencascade::handle<Interface_Protocol> & proto, const Standard_Integer level = 0, const Standard_Boolean listall = Standard_False);

		/****************** AddWithRefs ******************/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "Same as above, but works with the protocol of the model.

Parameters
----------
anent: Standard_Transient
level: int,optional
	default value is 0
listall: bool,optional
	default value is Standard_False

Returns
-------
None
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const Standard_Integer level = 0, const Standard_Boolean listall = Standard_False);

		/****************** AddWithRefs ******************/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "Same as above, but works with an already created generallib.

Parameters
----------
anent: Standard_Transient
lib: Interface_GeneralLib
level: int,optional
	default value is 0
listall: bool,optional
	default value is Standard_False

Returns
-------
None
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const Interface_GeneralLib & lib, const Standard_Integer level = 0, const Standard_Boolean listall = Standard_False);

		/****************** CategoryNumber ******************/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns the recorded category number for a given entity number 0 if none was defined for this entity.

Parameters
----------
num: int

Returns
-------
int
") CategoryNumber;
		Standard_Integer CategoryNumber(const Standard_Integer num);

		/****************** ChangeOrder ******************/
		%feature("compactdefaultargs") ChangeOrder;
		%feature("autodoc", "Changes the numbers of some entities : <oldnum> is moved to <newnum>, same for <count> entities. thus : 1,2 ... newnum-1 newnum ... oldnum .. oldnum+count oldnum+count+1 .. gives 1,2 ... newnum-1 oldnum .. oldnum+count newnum ... oldnum+count+1 (can be seen as a circular permutation).

Parameters
----------
oldnum: int
newnum: int
count: int,optional
	default value is 1

Returns
-------
None
") ChangeOrder;
		void ChangeOrder(const Standard_Integer oldnum, const Standard_Integer newnum, const Standard_Integer count = 1);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check attached to an entity, designated by its number. 0 for global check <semantic> true : recorded semantic check <semantic> false : recorded syntactic check (see reportentity) if no check is recorded for <num>, returns an empty check.

Parameters
----------
num: int
syntactic: bool

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> & Check(const Standard_Integer num, const Standard_Boolean syntactic);

		/****************** ClassName ******************/
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "From a cdl type name, returns the class part (package dropped) warning : buffered, to be immediately copied or printed.

Parameters
----------
typnam: char *

Returns
-------
char *
") ClassName;
		static const char * ClassName(const char * typnam);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Erases contained data; used when a model is copied to others : the new copied ones begin from clear clear calls specific method clearheader (see below).

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClearEntities ******************/
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "Clears the entities; uses the general service whendelete, in addition to the standard memory manager; can be redefined.

Returns
-------
None
") ClearEntities;
		virtual void ClearEntities();

		/****************** ClearHeader ******************/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Clears model's header : specific to each norm.

Returns
-------
None
") ClearHeader;
		virtual void ClearHeader();

		/****************** ClearLabels ******************/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Erases informations about labels, if any : specific to each norm.

Returns
-------
None
") ClearLabels;
		virtual void ClearLabels();

		/****************** ClearReportEntity ******************/
		%feature("compactdefaultargs") ClearReportEntity;
		%feature("autodoc", "Removes the reportentity attached to entity <num>. returns true if done, false if no reportentity was attached to <num>. warning : the caller must assume that this clearing is meaningfull.

Parameters
----------
num: int

Returns
-------
bool
") ClearReportEntity;
		Standard_Boolean ClearReportEntity(const Standard_Integer num);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if a model contains an entity (for a reportentity, looks for the reportentity itself and its concerned entity).

Parameters
----------
anentity: Standard_Transient

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Standard_Transient> & anentity);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Clears the list of entities (service whendelete).

Returns
-------
None
") Destroy;
		void Destroy();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetDispatchStatus() {
            return (Standard_Boolean) $self->DispatchStatus();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetDispatchStatus(Standard_Boolean value) {
            $self->DispatchStatus()=value;
            }
        };
		/****************** DumpHeader ******************/
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "Dumps header in a short, easy to read, form, onto a stream <level> allows to print more or less parts of the header, if necessary. 0 for basic print.

Parameters
----------
S: Message_Messenger
level: int,optional
	default value is 0

Returns
-------
None
") DumpHeader;
		virtual void DumpHeader(const opencascade::handle<Message_Messenger> & S, const Standard_Integer level = 0);

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Returns the list of all entities, as an iterator on entities (the entities themselves, not the reports).

Returns
-------
Interface_EntityIterator
") Entities;
		Interface_EntityIterator Entities();

		/****************** EntityState ******************/
		%feature("compactdefaultargs") EntityState;
		%feature("autodoc", "Returns the state of an entity, given its number.

Parameters
----------
num: int

Returns
-------
Interface_DataState
") EntityState;
		Interface_DataState EntityState(const Standard_Integer num);

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Allows an entityiterator to get a list of entities.

Parameters
----------
iter: Interface_EntityIterator

Returns
-------
None
") FillIterator;
		void FillIterator(Interface_EntityIterator & iter);

		/****************** FillSemanticChecks ******************/
		%feature("compactdefaultargs") FillSemanticChecks;
		%feature("autodoc", "Fills the list of semantic checks. this list is computed (by checktool). hence, it can be stored in the model for later queries <clear> true (d) : new list replaces <clear> false : new list is cumulated.

Parameters
----------
checks: Interface_CheckIterator
clear: bool,optional
	default value is Standard_True

Returns
-------
None
") FillSemanticChecks;
		void FillSemanticChecks(const Interface_CheckIterator & checks, const Standard_Boolean clear = Standard_True);

		/****************** GTool ******************/
		%feature("compactdefaultargs") GTool;
		%feature("autodoc", "Returns the gtool, set by setprotocol or by setgtool.

Returns
-------
opencascade::handle<Interface_GTool>
") GTool;
		opencascade::handle<Interface_GTool> GTool();

		/****************** GetFromAnother ******************/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "Gets header (data specific of a defined interface) from another interfacemodel; called from transfercopy.

Parameters
----------
other: Interface_InterfaceModel

Returns
-------
None
") GetFromAnother;
		virtual void GetFromAnother(const opencascade::handle<Interface_InterfaceModel> & other);

		/****************** GetFromTransfer ******************/
		%feature("compactdefaultargs") GetFromTransfer;
		%feature("autodoc", "Gets contents from an entityiterator, prepared by a transfer tool (e.g transfercopy). starts from clear.

Parameters
----------
aniter: Interface_EntityIterator

Returns
-------
None
") GetFromTransfer;
		void GetFromTransfer(const Interface_EntityIterator & aniter);

		/****************** GlobalCheck ******************/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Returns the globalcheck, which memorizes messages global to the file (not specific to an entity), especially header.

Parameters
----------
syntactic: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Interface_Check>
") GlobalCheck;
		const opencascade::handle<Interface_Check> & GlobalCheck(const Standard_Boolean syntactic = Standard_True);

		/****************** HasSemanticChecks ******************/
		%feature("compactdefaultargs") HasSemanticChecks;
		%feature("autodoc", "Returns true if semantic checks have been filled.

Returns
-------
bool
") HasSemanticChecks;
		Standard_Boolean HasSemanticChecks();

		/****************** HasTemplate ******************/
		%feature("compactdefaultargs") HasTemplate;
		%feature("autodoc", "Returns true if a template is attached to a given name.

Parameters
----------
name: char *

Returns
-------
bool
") HasTemplate;
		static Standard_Boolean HasTemplate(const char * name);

		/****************** IsErrorEntity ******************/
		%feature("compactdefaultargs") IsErrorEntity;
		%feature("autodoc", "Returns true if <num> identifies an error entity : in this case, a reportentity brings fail messages and possibly an 'undefined' content, see isredefinedentity.

Parameters
----------
num: int

Returns
-------
bool
") IsErrorEntity;
		Standard_Boolean IsErrorEntity(const Standard_Integer num);

		/****************** IsRedefinedContent ******************/
		%feature("compactdefaultargs") IsRedefinedContent;
		%feature("autodoc", "Returns true if <num> identifies an entity which content is redefined through a reportentity (i.e. with literal data only) this happens when an entity is syntactically erroneous in the way that its basic content remains empty. for more details (such as content itself), see reportentity.

Parameters
----------
num: int

Returns
-------
bool
") IsRedefinedContent;
		Standard_Boolean IsRedefinedContent(const Standard_Integer num);

		/****************** IsReportEntity ******************/
		%feature("compactdefaultargs") IsReportEntity;
		%feature("autodoc", "Returns true if <num> identifies a reportentity in the model hence, reportentity can be called. //! by default, queries main report, if <semantic> is true, it queries report for semantic check //! remember that a report entity can be defined for an unknown entity, or a corrected or erroneous (at read time) entity. the reportentity is defined before call to method addentity.

Parameters
----------
num: int
semantic: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsReportEntity;
		Standard_Boolean IsReportEntity(const Standard_Integer num, const Standard_Boolean semantic = Standard_False);

		/****************** IsUnknownEntity ******************/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "Returns true if <num> identifies an unknown entity : in this case, a reportentity with no check messages designates it.

Parameters
----------
num: int

Returns
-------
bool
") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity(const Standard_Integer num);

		/****************** ListTemplates ******************/
		%feature("compactdefaultargs") ListTemplates;
		%feature("autodoc", "Returns the complete list of names attached to template models.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") ListTemplates;
		static opencascade::handle<TColStd_HSequenceOfHAsciiString> ListTemplates();

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of contained entities.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbTypes ******************/
		%feature("compactdefaultargs") NbTypes;
		%feature("autodoc", "Returns the count of distinct types under which an entity may be processed. defined by the protocol, which gives default as 1 (dynamic type).

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") NbTypes;
		Standard_Integer NbTypes(const opencascade::handle<Standard_Transient> & ent);

		/****************** NewEmptyModel ******************/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Returns a new empty model, same type as <self> (whatever its type); called to copy parts a model into other ones, then followed by a call to getfromanother (header) then filling with specified entities, themselves copied.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewEmptyModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****************** NextNumberForLabel ******************/
		%feature("compactdefaultargs") NextNumberForLabel;
		%feature("autodoc", "Searches a label which matches with one entity. begins from <lastnum>+1 (default:1) and scans the entities until <nbentities>. for the first which matches <label>, this method returns its number. returns 0 if nothing found can be called recursively (labels are not specified as unique) <exact> : if true (default), exact match is required else, checks the end of entity label //! this method is virtual, hence it can be redefined for a more efficient search (if exact is true).

Parameters
----------
label: char *
lastnum: int,optional
	default value is 0
exact: bool,optional
	default value is Standard_True

Returns
-------
int
") NextNumberForLabel;
		virtual Standard_Integer NextNumberForLabel(const char * label, const Standard_Integer lastnum = 0, const Standard_Boolean exact = Standard_True);

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns the number of an entity in the model if it contains it. else returns 0. for a reportentity, looks at concerned entity. returns the directory entry number of an entity in the model if it contains it. else returns 0. for a reportentity, looks at concerned entity.

Parameters
----------
anentity: Standard_Transient

Returns
-------
int
") Number;
		Standard_Integer Number(const opencascade::handle<Standard_Transient> & anentity);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Prints identification of a given entity in <self>, in order to be printed in a list or phrase <mode> < 0 : prints only its number <mode> = 1 : just calls printlabel <mode> = 0 (d) : prints its number plus '/' plus printlabel if <ent> == <self>, simply prints 'global' if <ent> is unknown, prints '/its type'.

Parameters
----------
ent: Standard_Transient
s: Message_Messenger
mode: int,optional
	default value is 0

Returns
-------
None
") Print;
		void Print(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & s, const Standard_Integer mode = 0);

		/****************** PrintLabel ******************/
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "Prints label specific to each norm, for a given entity. must only print label itself, in order to be included in a phrase. can call the result of stringlabel, but not obliged.

Parameters
----------
ent: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintLabel;
		virtual void PrintLabel(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** PrintToLog ******************/
		%feature("compactdefaultargs") PrintToLog;
		%feature("autodoc", "Prints label specific to each norm in log format, for a given entity. by default, just calls printlabel, can be redefined.

Parameters
----------
ent: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintToLog;
		virtual void PrintToLog(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol which has been set by setprotocol, or addwithrefs with protocol.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		virtual opencascade::handle<Interface_Protocol> Protocol();

		/****************** Redefineds ******************/
		%feature("compactdefaultargs") Redefineds;
		%feature("autodoc", "Returns the list of reportentities which redefine data (generally, if concerned entity is 'error', a literal content is added to it : this is a 'redefined entity'.

Returns
-------
Interface_EntityIterator
") Redefineds;
		Interface_EntityIterator Redefineds();

		/****************** ReplaceEntity ******************/
		%feature("compactdefaultargs") ReplaceEntity;
		%feature("autodoc", "Replace entity with number=nument on other entity - 'anent'.

Parameters
----------
nument: int
anent: Standard_Transient

Returns
-------
None
") ReplaceEntity;
		void ReplaceEntity(const Standard_Integer nument, const opencascade::handle<Standard_Transient> & anent);

		/****************** ReportEntity ******************/
		%feature("compactdefaultargs") ReportEntity;
		%feature("autodoc", "Returns a reportentity identified by its number in the model, or a null handle if <num> does not identify a reportentity. //! by default, queries main report, if <semantic> is true, it queries report for semantic check.

Parameters
----------
num: int
semantic: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<Interface_ReportEntity>
") ReportEntity;
		opencascade::handle<Interface_ReportEntity> ReportEntity(const Standard_Integer num, const Standard_Boolean semantic = Standard_False);

		/****************** Reports ******************/
		%feature("compactdefaultargs") Reports;
		%feature("autodoc", "Returns the list of all reportentities, i.e. data about entities read with error or warning informations (each item has to be casted to report entity then it can be queried for concerned entity, content, check ...) by default, returns the main reports, is <semantic> is true it returns the list for sematic checks.

Parameters
----------
semantic: bool,optional
	default value is Standard_False

Returns
-------
Interface_EntityIterator
") Reports;
		Interface_EntityIterator Reports(const Standard_Boolean semantic = Standard_False);

		/****************** Reservate ******************/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "Does a reservation for the list of entities (for optimized storage management). if it is not called, storage management can be less efficient. <nbent> is the expected count of entities to store.

Parameters
----------
nbent: int

Returns
-------
None
") Reservate;
		virtual void Reservate(const Standard_Integer nbent);

		/****************** ReverseOrders ******************/
		%feature("compactdefaultargs") ReverseOrders;
		%feature("autodoc", "Reverses the numbers of the entities, between <after> and the total count of entities. thus, the entities : 1,2 ... after, after+1 ... nb-1, nb become numbered as : 1,2 ... after, nb, nb-1 ... after+1 by default (after = 0) the whole list of entities is reversed.

Parameters
----------
after: int,optional
	default value is 0

Returns
-------
None
") ReverseOrders;
		void ReverseOrders(const Standard_Integer after = 0);

		/****************** SetCategoryNumber ******************/
		%feature("compactdefaultargs") SetCategoryNumber;
		%feature("autodoc", "Records a category number for an entity number returns true when done, false if <num> is out of range.

Parameters
----------
num: int
val: int

Returns
-------
bool
") SetCategoryNumber;
		Standard_Boolean SetCategoryNumber(const Standard_Integer num, const Standard_Integer val);

		/****************** SetGTool ******************/
		%feature("compactdefaultargs") SetGTool;
		%feature("autodoc", "Sets a gtool for this model, which already defines a protocol.

Parameters
----------
gtool: Interface_GTool

Returns
-------
None
") SetGTool;
		void SetGTool(const opencascade::handle<Interface_GTool> & gtool);

		/****************** SetGlobalCheck ******************/
		%feature("compactdefaultargs") SetGlobalCheck;
		%feature("autodoc", "Allows to modify globalcheck, after getting then completing it remark : it is syntactic check. semantics, see fillchecks.

Parameters
----------
ach: Interface_Check

Returns
-------
None
") SetGlobalCheck;
		void SetGlobalCheck(const opencascade::handle<Interface_Check> & ach);

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "Sets a protocol for this model it is also set by a call to addwithrefs with protocol it is used for : dumpheader (as required), clearentities ...

Parameters
----------
proto: Interface_Protocol

Returns
-------
None
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & proto);

		/****************** SetReportEntity ******************/
		%feature("compactdefaultargs") SetReportEntity;
		%feature("autodoc", "Sets or replaces a reportentity for the entity <num>. returns true if report is replaced, false if it has been replaced warning : the caller must assume that this setting is meaningfull.

Parameters
----------
num: int
rep: Interface_ReportEntity

Returns
-------
bool
") SetReportEntity;
		Standard_Boolean SetReportEntity(const Standard_Integer num, const opencascade::handle<Interface_ReportEntity> & rep);

		/****************** SetTemplate ******************/
		%feature("compactdefaultargs") SetTemplate;
		%feature("autodoc", "Records a new template model with a name. if the name was already recorded, the corresponding template is replaced by the new one. then, warning : test hastemplate to avoid surprises.

Parameters
----------
name: char *
model: Interface_InterfaceModel

Returns
-------
bool
") SetTemplate;
		static Standard_Boolean SetTemplate(const char * name, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** StringLabel ******************/
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "Returns a string with the label attached to a given entity. warning : while this string may be edited on the spot, if it is a read field, the returned value must be copied before.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StringLabel;
		virtual opencascade::handle<TCollection_HAsciiString> StringLabel(const opencascade::handle<Standard_Transient> & ent);

		/****************** Template ******************/
		%feature("compactdefaultargs") Template;
		%feature("autodoc", "Returns the template model attached to a name, or a null handle.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Template;
		static opencascade::handle<Interface_InterfaceModel> Template(const char * name);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns a type, given its rank : defined by the protocol (by default, the first one).

Parameters
----------
ent: Standard_Transient
num: int,optional
	default value is 1

Returns
-------
opencascade::handle<Standard_Type>
") Type;
		opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer num = 1);

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns the type name of an entity, from the list of types (one or more ...) <complete> true (d) gives the complete type, else packages are removed warning : buffered, to be immediately copied or printed.

Parameters
----------
ent: Standard_Transient
complete: bool,optional
	default value is Standard_True

Returns
-------
char *
") TypeName;
		const char * TypeName(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean complete = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns an entity identified by its number in the model each sub-class of interfacemodel can define its own method entity to return its specific class of entity (e.g. for vda, vdamodel returns a vdaentity), working by calling value remark : for a reported entity, (erroneous, corrected, unknown), this method returns this reported entity. see reportentity for other questions.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		const opencascade::handle<Standard_Transient> & Value(const Standard_Integer num);

		/****************** VerifyCheck ******************/
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "Minimum semantic global check on data in model (header) can only check basic data. see also globalcheck from protocol for a check which takes the graph into account default does nothing, can be redefined.

Parameters
----------
ach: Interface_Check

Returns
-------
None
") VerifyCheck;
		virtual void VerifyCheck(opencascade::handle<Interface_Check> & ach);

};


%make_alias(Interface_InterfaceModel)

%extend Interface_InterfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Interface_LineBuffer *
*****************************/
class Interface_LineBuffer {
	public:
		/****************** Interface_LineBuffer ******************/
		%feature("compactdefaultargs") Interface_LineBuffer;
		%feature("autodoc", "Creates a linebuffer with an absolute maximum size (default value is only to satisfy compiler requirement).

Parameters
----------
size: int,optional
	default value is 10

Returns
-------
None
") Interface_LineBuffer;
		 Interface_LineBuffer(const Standard_Integer size = 10);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a text as a cstring. its length is evaluated from the text (by c function strlen).

Parameters
----------
text: char *

Returns
-------
None
") Add;
		void Add(const char * text);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a text as a cstring. its length is given as <lntext>.

Parameters
----------
text: char *
lntext: int

Returns
-------
None
") Add;
		void Add(const char * text, const Standard_Integer lntext);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a text as a asciistring from tcollection.

Parameters
----------
text: TCollection_AsciiString

Returns
-------
None
") Add;
		void Add(const TCollection_AsciiString & text);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a text made of only one character.

Parameters
----------
text: Standard_Character

Returns
-------
None
") Add;
		void Add(const Standard_Character text);

		/****************** CanGet ******************/
		%feature("compactdefaultargs") CanGet;
		%feature("autodoc", "Returns true if there is room enough to add <more> characters else, it is required to dump the buffer before refilling it <more> is recorded to manage setkeep status.

Parameters
----------
more: int

Returns
-------
bool
") CanGet;
		Standard_Boolean CanGet(const Standard_Integer more);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears completely the linebuffer.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Content ******************/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Returns the content of the linebuffer.

Returns
-------
char *
") Content;
		const char * Content();

		/****************** FreezeInitial ******************/
		%feature("compactdefaultargs") FreezeInitial;
		%feature("autodoc", "Inhibits effect of setinitial until the next move (i.e. keep) then prepare will not insert initial blanks, but further ones will. this allows to cancel initial blanks on an internal split a call to setinitial has no effect on this until move.

Returns
-------
None
") FreezeInitial;
		void FreezeInitial();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the linebuffer.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Fills a asciistring <str> with the content of the line buffer, then clears the linebuffer.

Parameters
----------
str: TCollection_AsciiString

Returns
-------
None
") Move;
		void Move(TCollection_AsciiString & str);

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Same as above, but <str> is known through a handle.

Parameters
----------
str: TCollection_HAsciiString

Returns
-------
None
") Move;
		void Move(const opencascade::handle<TCollection_HAsciiString> & str);

		/****************** Moved ******************/
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "Same as above, but generates the hasciistring.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Moved;
		opencascade::handle<TCollection_HAsciiString> Moved();

		/****************** SetInitial ******************/
		%feature("compactdefaultargs") SetInitial;
		%feature("autodoc", "Sets an initial reservation for blank characters (this reservation is counted in the size of the current line).

Parameters
----------
initial: int

Returns
-------
None
") SetInitial;
		void SetInitial(const Standard_Integer initial);

		/****************** SetKeep ******************/
		%feature("compactdefaultargs") SetKeep;
		%feature("autodoc", "Sets a keep status at current length. it means that at next move, the new line will begin by characters between keep + 1 and current length.

Returns
-------
None
") SetKeep;
		void SetKeep();

		/****************** SetMax ******************/
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "Changes maximum allowed size of buffer. if <max> is zero, maximum size is set to the initial size.

Parameters
----------
max: int

Returns
-------
None
") SetMax;
		void SetMax(const Standard_Integer max);

};


%extend Interface_LineBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Interface_MSG *
**********************/
class Interface_MSG {
	public:
		/****************** Interface_MSG ******************/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "A msg is created to write a 'functional code' in conjunction with operator () attached to value then, to have a translated message, write in c++ : //! interface_msg('...mykey...') which returns a cstring see also some help which follow.

Parameters
----------
key: char *

Returns
-------
None
") Interface_MSG;
		 Interface_MSG(const char * key);

		/****************** Interface_MSG ******************/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "Translates a message which contains one integer variable it is just a help which avoid the following : char mess[100]; sprintf(mess,interface_msg('code'),ival); then addfail(mess); replaced by addfail (interface_msg('code',ival)); //! the basic message is intended to be in c-sprintf format, with one %d form in it.

Parameters
----------
key: char *
i1: int

Returns
-------
None
") Interface_MSG;
		 Interface_MSG(const char * key, const Standard_Integer i1);

		/****************** Interface_MSG ******************/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "Translates a message which contains two integer variables as for one integer, it is just a writing help //! the basic message is intended to be in c-sprintf format with two %d forms in it.

Parameters
----------
key: char *
i1: int
i2: int

Returns
-------
None
") Interface_MSG;
		 Interface_MSG(const char * key, const Standard_Integer i1, const Standard_Integer i2);

		/****************** Interface_MSG ******************/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "Translates a message which contains one real variable <intervals> if set, commands the variable to be rounded to an interval (see below, method intervals) as for one integer, it is just a writing help //! the basic message is intended to be in c-sprintf format with one %f form (or equivalent : %e etc) in it.

Parameters
----------
key: char *
r1: float
intervals: int,optional
	default value is -1

Returns
-------
None
") Interface_MSG;
		 Interface_MSG(const char * key, const Standard_Real r1, const Standard_Integer intervals = -1);

		/****************** Interface_MSG ******************/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "Translates a message which contains one string variable as for one integer, it is just a writing help //! the basic message is intended to be in c-sprintf format with one %s form in it.

Parameters
----------
key: char *
str: char *

Returns
-------
None
") Interface_MSG;
		 Interface_MSG(const char * key, const char * str);

		/****************** Interface_MSG ******************/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "Translates a message which contains one integer and one string variables as for one integer, it is just a writing help used for instance to say 'param n0.<ival> i.e. <str> is not..' //! the basic message is intended to be in c-sprintf format with one %d then one %s forms in it.

Parameters
----------
key: char *
ival: int
str: char *

Returns
-------
None
") Interface_MSG;
		 Interface_MSG(const char * key, const Standard_Integer ival, const char * str);

		/****************** Blanks ******************/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "Returns a blank string, of length between 0 and <max>, to fill the printing of a numeric value <val>, i.e. : if val < 10 , max-1 blanks if val between 10 and 99, max-2 blanks ... etc...

Parameters
----------
val: int
max: int

Returns
-------
char *
") Blanks;
		static const char * Blanks(const Standard_Integer val, const Standard_Integer max);

		/****************** Blanks ******************/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "Returns a blank string, to complete a given string <val> up to <max> characters : if strlen(val) is 0, max blanks if strlen(val) is 5, max-5 blanks etc...

Parameters
----------
val: char *
max: int

Returns
-------
char *
") Blanks;
		static const char * Blanks(const char * val, const Standard_Integer max);

		/****************** Blanks ******************/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "Returns a blank string of <count> blanks (mini 0, maxi 76).

Parameters
----------
count: int

Returns
-------
char *
") Blanks;
		static const char * Blanks(const Standard_Integer count);

		/****************** CDate ******************/
		%feature("compactdefaultargs") CDate;
		%feature("autodoc", "Returns a value about comparison of two dates 0 : equal. <0 text1 anterior. >0 text1 posterior.

Parameters
----------
text1: char *
text2: char *

Returns
-------
int
") CDate;
		static Standard_Integer CDate(const char * text1, const char * text2);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Optimised destructor (applies for additional forms of create).

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Intervalled ******************/
		%feature("compactdefaultargs") Intervalled;
		%feature("autodoc", "Returns an 'intervalled' value from a starting real <val> : i.e. a value which is rounded on an interval limit interval limits are defined to be in a coarsely 'geometric' progression (two successive intervals are inside a limit ratio) //! <order> gives the count of desired intervals in a range <1-10> <upper> false, returns the first lower interval (d) <upper> true, returns the first upper interval values of intervals according <order> : 0,1 : 1 10 100 ... 2 : 1 3 10 30 100 ... 3(d): 1 2 5 10 20 50 100 ... 4 : 1 2 3 6 10 20 30 60 100 ... 6 : 1 1.5 2 3 5 7 10 15 20 ... 10 : 1 1.2 1.5 2 2.5 3 4 5 6 8 10 12 15 20 25 ...

Parameters
----------
val: float
order: int,optional
	default value is 3
upper: bool,optional
	default value is Standard_False

Returns
-------
float
") Intervalled;
		static Standard_Real Intervalled(const Standard_Real val, const Standard_Integer order = 3, const Standard_Boolean upper = Standard_False);

		/****************** IsKey ******************/
		%feature("compactdefaultargs") IsKey;
		%feature("autodoc", "Returns true if a given message is surely a key (according to the form adopted for keys) (before activating messages, answer is false).

Parameters
----------
mess: char *

Returns
-------
bool
") IsKey;
		static Standard_Boolean IsKey(const char * mess);

		/****************** NDate ******************/
		%feature("compactdefaultargs") NDate;
		%feature("autodoc", "Decodes a date to numeric integer values returns true if ok, false if text does not fit with required format. incomplete forms are allowed (for instance, for only yyyy-mm-dd, hour is zero).

Parameters
----------
text: char *

Returns
-------
yy: int
mm: int
dd: int
hh: int
mn: int
ss: int
") NDate;
		static Standard_Boolean NDate(const char * text, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);


        %feature("autodoc", "1");
        %extend{
            std::string PrintTraceToString() {
            std::stringstream s;
            self->PrintTrace(s);
            return s.str();}
        };

            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };
		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a list of messages from a file defined by its name.

Parameters
----------
file: char *

Returns
-------
int
") Read;
		static Standard_Integer Read(const char * file);

		/****************** Record ******************/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "Fills the dictionary with a couple (key-item) if a key is already recorded, it is possible to : - keep the last definition, and activate the trace system.

Parameters
----------
key: char *
item: char *

Returns
-------
None
") Record;
		static void Record(const char * key, const char * item);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets the main modes for msg : - if <running> is true, translation works normally - if <running> is false, translated item equate keys - if <raising> is true, errors (from record or translate) cause msg to raise an exception - if <raising> is false, msg runs without exception, then see also trace modes above.

Parameters
----------
running: bool
raising: bool

Returns
-------
None
") SetMode;
		static void SetMode(const Standard_Boolean running, const Standard_Boolean raising);

		/****************** SetTrace ******************/
		%feature("compactdefaultargs") SetTrace;
		%feature("autodoc", "Sets the trace system to work when activated, as follow : - if <toprint> is true, print immediately on standard output - if <torecord> is true, record it for further print.

Parameters
----------
toprint: bool
torecord: bool

Returns
-------
None
") SetTrace;
		static void SetTrace(const Standard_Boolean toprint, const Standard_Boolean torecord);

		/****************** TDate ******************/
		%feature("compactdefaultargs") TDate;
		%feature("autodoc", "Codes a date as a text, from its numeric value (-> seconds) : yyyy-mm-dd:hh-mn-ss fixed format, completed by leading zeros another format can be provided, as follows : c:%d ... c like format, preceeded by c: s:... format to call system (not yet implemented).

Parameters
----------
text: char *
yy: int
mm: int
dd: int
hh: int
mn: int
ss: int
format: char *,optional
	default value is ""

Returns
-------
None
") TDate;
		static void TDate(const char * text, const Standard_Integer yy, const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const char * format = "");

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Returns the item recorded for a key. returns the key itself if : - it is not recorded (then, the trace system is activated) - msg has been required to be hung on.

Parameters
----------
key: char *

Returns
-------
char *
") Translated;
		static const char * Translated(const char * key);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the translated message, in a functional form with operator () was c++ : return const.

Returns
-------
char *
") Value;
		const char * Value();

};


%extend Interface_MSG {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Interface_MapAsciiStringHasher *
***************************************/
class Interface_MapAsciiStringHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given ascii string, in the range [1, theupperbound] @param theasciistring the ascii string which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theAsciiString: TCollection_AsciiString
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const TCollection_AsciiString & theAsciiString, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
K1: TCollection_AsciiString
K2: TCollection_AsciiString

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TCollection_AsciiString & K1, const TCollection_AsciiString & K2);

};


%extend Interface_MapAsciiStringHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Interface_NodeOfGeneralLib *
***********************************/
class Interface_NodeOfGeneralLib : public Standard_Transient {
	public:
		/****************** Interface_NodeOfGeneralLib ******************/
		%feature("compactdefaultargs") Interface_NodeOfGeneralLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") Interface_NodeOfGeneralLib;
		 Interface_NodeOfGeneralLib();

		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "Adds a couple (module,protocol), that is, stores it into itself if not yet done, else creates a next node to do it.

Parameters
----------
anode: Interface_GlobalNodeOfGeneralLib

Returns
-------
None
") AddNode;
		void AddNode(const opencascade::handle<Interface_GlobalNodeOfGeneralLib> & anode);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<Interface_GeneralModule>
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_NodeOfGeneralLib>
") Next;
		const opencascade::handle<Interface_NodeOfGeneralLib> & Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol designated by a precise node.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

};


%make_alias(Interface_NodeOfGeneralLib)

%extend Interface_NodeOfGeneralLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Interface_NodeOfReaderLib *
**********************************/
class Interface_NodeOfReaderLib : public Standard_Transient {
	public:
		/****************** Interface_NodeOfReaderLib ******************/
		%feature("compactdefaultargs") Interface_NodeOfReaderLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") Interface_NodeOfReaderLib;
		 Interface_NodeOfReaderLib();

		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "Adds a couple (module,protocol), that is, stores it into itself if not yet done, else creates a next node to do it.

Parameters
----------
anode: Interface_GlobalNodeOfReaderLib

Returns
-------
None
") AddNode;
		void AddNode(const opencascade::handle<Interface_GlobalNodeOfReaderLib> & anode);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<Interface_ReaderModule>
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_NodeOfReaderLib>
") Next;
		const opencascade::handle<Interface_NodeOfReaderLib> & Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol designated by a precise node.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

};


%make_alias(Interface_NodeOfReaderLib)

%extend Interface_NodeOfReaderLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Interface_ParamList *
****************************/
class Interface_ParamList : public Standard_Transient {
	public:
		/****************** Interface_ParamList ******************/
		%feature("compactdefaultargs") Interface_ParamList;
		%feature("autodoc", "Creates an vector with size of memmory blok equal to theincrement.

Parameters
----------
theIncrement: int,optional
	default value is 256

Returns
-------
None
") Interface_ParamList;
		 Interface_ParamList(const Standard_Integer theIncrement = 256);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Return the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
Interface_FileParameter
") ChangeValue;
		Interface_FileParameter & ChangeValue(const Standard_Integer Index);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements of <self>.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower bound. warning.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Assigns the value <value> to the <index>-th item of this array.

Parameters
----------
Index: int
Value: Interface_FileParameter

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, const Interface_FileParameter & Value);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper bound. warning.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
Interface_FileParameter
") Value;
		const Interface_FileParameter & Value(const Standard_Integer Index);

};


%make_alias(Interface_ParamList)

%extend Interface_ParamList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Interface_ParamSet *
***************************/
class Interface_ParamSet : public Standard_Transient {
	public:
		/****************** Interface_ParamSet ******************/
		%feature("compactdefaultargs") Interface_ParamSet;
		%feature("autodoc", "Creates an empty paramset, beginning at number 'nst' and of initial reservation 'nres' : the 'nres' first parameters which follow 'ndeb' (included) will be put in an array (a paramlist). the remainders are set in next(s) paramset(s).

Parameters
----------
nres: int
nst: int,optional
	default value is 1

Returns
-------
None
") Interface_ParamSet;
		 Interface_ParamSet(const Standard_Integer nres, const Standard_Integer nst = 1);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Adds a parameter defined as its value (cstring and length) and type. optionnal entitynumber (for filereaderdata) can be given allows a better memory management than appending a complete fileparameter if <lnval> < 0, <val> is assumed to be managed elsewhere : its adress is stored as such. else, <val> is copied in a locally (quickly) managed page of characters returns new count of recorded parameters.

Parameters
----------
val: char *
lnval: int
typ: Interface_ParamType
nument: int

Returns
-------
int
") Append;
		Standard_Integer Append(const char * val, const Standard_Integer lnval, const Interface_ParamType typ, const Standard_Integer nument);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Adds a parameter at the end of the paramset (transparent about reservation and 'next') returns new count of recorded parameters.

Parameters
----------
FP: Interface_FileParameter

Returns
-------
int
") Append;
		Standard_Integer Append(const Interface_FileParameter & FP);

		/****************** ChangeParam ******************/
		%feature("compactdefaultargs") ChangeParam;
		%feature("autodoc", "Same as above, but in order to be modified on place.

Parameters
----------
num: int

Returns
-------
Interface_FileParameter
") ChangeParam;
		Interface_FileParameter & ChangeParam(const Standard_Integer num);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor (waiting for transparent memory management).

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** NbParams ******************/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Returns the total count of parameters (including nexts).

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** Param ******************/
		%feature("compactdefaultargs") Param;
		%feature("autodoc", "Returns a parameter identified by its number.

Parameters
----------
num: int

Returns
-------
Interface_FileParameter
") Param;
		const Interface_FileParameter & Param(const Standard_Integer num);

		/****************** Params ******************/
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "Builds and returns the sub-list correspinding to parameters, from 'num' included, with count 'nb' if <num> and <nb> are zero, returns the whole list.

Parameters
----------
num: int
nb: int

Returns
-------
opencascade::handle<Interface_ParamList>
") Params;
		opencascade::handle<Interface_ParamList> Params(const Standard_Integer num, const Standard_Integer nb);

		/****************** SetParam ******************/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "Changes a parameter identified by its number.

Parameters
----------
num: int
FP: Interface_FileParameter

Returns
-------
None
") SetParam;
		void SetParam(const Standard_Integer num, const Interface_FileParameter & FP);

};


%make_alias(Interface_ParamSet)

%extend Interface_ParamSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Interface_Protocol *
***************************/
%nodefaultctor Interface_Protocol;
class Interface_Protocol : public Standard_Transient {
	public:
		/****************** Active ******************/
		%feature("compactdefaultargs") Active;
		%feature("autodoc", "Returns the active protocol, if defined (else, returns a null handle, which means 'no defined active protocol').

Returns
-------
opencascade::handle<Interface_Protocol>
") Active;
		static opencascade::handle<Interface_Protocol> Active();

		/****************** CaseNumber ******************/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "Returns a unique positive casenumber for each recognized object. by default, recognition is based on type(1) by default, calls the following one which is deferred.

Parameters
----------
obj: Standard_Transient

Returns
-------
int
") CaseNumber;
		virtual Standard_Integer CaseNumber(const opencascade::handle<Standard_Transient> & obj);

		/****************** ClearActive ******************/
		%feature("compactdefaultargs") ClearActive;
		%feature("autodoc", "Erases the active protocol (hence it becomes undefined).

Returns
-------
None
") ClearActive;
		static void ClearActive();

		/****************** GlobalCheck ******************/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Evaluates a global check for a model (with its graph) returns true when done, false if data in model do not apply //! very specific of each norm, i.e. of each protocol : the uppest level protocol assumes it, it can call globalcheck of its ressources only if it is necessary //! default does nothing, can be redefined.

Parameters
----------
G: Interface_Graph
ach: Interface_Check

Returns
-------
bool
") GlobalCheck;
		virtual Standard_Boolean GlobalCheck(const Interface_Graph & G, opencascade::handle<Interface_Check> & ach);

		/****************** IsDynamicType ******************/
		%feature("compactdefaultargs") IsDynamicType;
		%feature("autodoc", "Returns true if type of <obj> is that defined from cdl this is the default but it may change according implementation.

Parameters
----------
obj: Standard_Transient

Returns
-------
bool
") IsDynamicType;
		virtual Standard_Boolean IsDynamicType(const opencascade::handle<Standard_Transient> & obj);

		/****************** IsSuitableModel ******************/
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "Returns true if <model> is a model of the considered norm.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
bool
") IsSuitableModel;
		virtual Standard_Boolean IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** IsUnknownEntity ******************/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "Returns true if <ent> is an unknown entity for the norm, i.e. same type as them created by method unknownentity (for an entity out of the norm, answer can be unpredicable).

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsUnknownEntity;
		virtual Standard_Boolean IsUnknownEntity(const opencascade::handle<Standard_Transient> & ent);

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Returns count of protocol used as resources (level one).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** NbTypes ******************/
		%feature("compactdefaultargs") NbTypes;
		%feature("autodoc", "Returns the count of distinct types under which an entity may be processed. each one is candidate to be recognized by typenumber, <obj> is then processed according it by default, returns 1 (the dynamictype).

Parameters
----------
obj: Standard_Transient

Returns
-------
int
") NbTypes;
		virtual Standard_Integer NbTypes(const opencascade::handle<Standard_Transient> & obj);

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates an empty model of the considered norm.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given its rank (between 1 and nbresources).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** SetActive ******************/
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "Sets a given protocol to be the active one (for the users of active, see just above). applies to every sub-type of protocol.

Parameters
----------
aprotocol: Interface_Protocol

Returns
-------
None
") SetActive;
		static void SetActive(const opencascade::handle<Interface_Protocol> & aprotocol);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns a type under which <obj> can be recognized and processed, according its rank in its definition list (see nbtypes). by default, returns dynamictype.

Parameters
----------
obj: Standard_Transient
nt: int,optional
	default value is 1

Returns
-------
opencascade::handle<Standard_Type>
") Type;
		opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & obj, const Standard_Integer nt = 1);

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a unique positive casenumber for each recognized type, returns zero for '<type> not recognized'.

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****************** UnknownEntity ******************/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Creates a new unknown entity for the considered norm.

Returns
-------
opencascade::handle<Standard_Transient>
") UnknownEntity;
		virtual opencascade::handle<Standard_Transient> UnknownEntity();

};


%make_alias(Interface_Protocol)

%extend Interface_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Interface_ReaderLib *
****************************/
class Interface_ReaderLib {
	public:
		/****************** Interface_ReaderLib ******************/
		%feature("compactdefaultargs") Interface_ReaderLib;
		%feature("autodoc", "Creates a library which complies with a protocol, that is : same class (criterium isinstance) this creation gets the modules from the global set, those which are bound to the given protocol and its resources.

Parameters
----------
aprotocol: Interface_Protocol

Returns
-------
None
") Interface_ReaderLib;
		 Interface_ReaderLib(const opencascade::handle<Interface_Protocol> & aprotocol);

		/****************** Interface_ReaderLib ******************/
		%feature("compactdefaultargs") Interface_ReaderLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") Interface_ReaderLib;
		 Interface_ReaderLib();

		/****************** AddProtocol ******************/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "Adds a couple (module-protocol) to the library, given the class of a protocol. takes resources into account. (if <aprotocol> is not of type theprotocol, it is not added).

Parameters
----------
aprotocol: Standard_Transient

Returns
-------
None
") AddProtocol;
		void AddProtocol(const opencascade::handle<Standard_Transient> & aprotocol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<Interface_ReaderModule>
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects a module from the library, given an object. returns true if select has succeeded, false else. also returns (as arguments) the selected module and the case number determined by the associated protocol. if select has failed, <module> is null handle and cn is zero. (select can work on any criterium, such as object dynamictype).

Parameters
----------
obj: Standard_Transient
module: Interface_ReaderModule

Returns
-------
CN: int
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<Interface_ReaderModule> & module, Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "Adds a couple (module-protocol) into the global definition set for this class of library.

Parameters
----------
amodule: Interface_ReaderModule
aprotocol: Interface_Protocol

Returns
-------
None
") SetGlobal;
		static void SetGlobal(const opencascade::handle<Interface_ReaderModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts iteration on the modules (sets it on the first one).

Returns
-------
None
") Start;
		void Start();

};


%extend Interface_ReaderLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Interface_ReaderModule *
*******************************/
%nodefaultctor Interface_ReaderModule;
class Interface_ReaderModule : public Standard_Transient {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Translates the type of record <num> in <data> to a positive case number. if recognition fails, must return 0.

Parameters
----------
data: Interface_FileReaderData
num: int

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num);

		/****************** NewRead ******************/
		%feature("compactdefaultargs") NewRead;
		%feature("autodoc", "Specific operator (create+read) defaulted to do nothing. it can be redefined when it is not possible to work in two steps (newvoid then read). this occurs when no default constructor is defined : hence the result <ent> must be created with an effective definition from the reader. remark : if newread is defined, copy has nothing to do. //! returns true if it has produced something, false else. if nothing was produced, <ach> should be filled : it will be treated as 'unrecognized case' by reader tool.

Parameters
----------
casenum: int
data: Interface_FileReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Returns
-------
bool
") NewRead;
		virtual Standard_Boolean NewRead(const Standard_Integer casenum, const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Performs the effective loading from <data>, record <num>, to the entity <ent> formerly created in case of error or warning, fills <ach> with messages remark that the case number comes from translating a record.

Parameters
----------
casenum: int
data: Interface_FileReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Returns
-------
None
") Read;
		virtual void Read(const Standard_Integer casenum, const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

};


%make_alias(Interface_ReaderModule)

%extend Interface_ReaderModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Interface_ReportEntity *
*******************************/
class Interface_ReportEntity : public Standard_Transient {
	public:
		/****************** Interface_ReportEntity ******************/
		%feature("compactdefaultargs") Interface_ReportEntity;
		%feature("autodoc", "Creates a reportentity for an unknown entity : check is empty, and concerned equates content (i.e. the unknown entity).

Parameters
----------
unknown: Standard_Transient

Returns
-------
None
") Interface_ReportEntity;
		 Interface_ReportEntity(const opencascade::handle<Standard_Transient> & unknown);

		/****************** Interface_ReportEntity ******************/
		%feature("compactdefaultargs") Interface_ReportEntity;
		%feature("autodoc", "Creates a reportentity with its features : - <acheck> is the check to be memorised - <concerned> is the entity to which the check is bound later, a content can be set : it is required for an error.

Parameters
----------
acheck: Interface_Check
concerned: Standard_Transient

Returns
-------
None
") Interface_ReportEntity;
		 Interface_ReportEntity(const opencascade::handle<Interface_Check> & acheck, const opencascade::handle<Standard_Transient> & concerned);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns the stored check in order to change it.

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> & CCheck();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the stored check.

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> & Check();

		/****************** Concerned ******************/
		%feature("compactdefaultargs") Concerned;
		%feature("autodoc", "Returns the stored concerned entity. it equates the content in the case of an unknown entity.

Returns
-------
opencascade::handle<Standard_Transient>
") Concerned;
		opencascade::handle<Standard_Transient> Concerned();

		/****************** Content ******************/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Returns the stored content, or a null handle remark that it must be an 'unknown entity' suitable for the norm of the containing model.

Returns
-------
opencascade::handle<Standard_Transient>
") Content;
		opencascade::handle<Standard_Transient> Content();

		/****************** HasContent ******************/
		%feature("compactdefaultargs") HasContent;
		%feature("autodoc", "Returns true if a content is stored (it can equate concerned).

Returns
-------
bool
") HasContent;
		Standard_Boolean HasContent();

		/****************** HasNewContent ******************/
		%feature("compactdefaultargs") HasNewContent;
		%feature("autodoc", "Returns true if a content is stored and differs from concerned (i.e. redefines content) : used when concerned could not be loaded.

Returns
-------
bool
") HasNewContent;
		Standard_Boolean HasNewContent();

		/****************** IsError ******************/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Returns true for an error entity, i.e. if the check brings at least one fail message.

Returns
-------
bool
") IsError;
		Standard_Boolean IsError();

		/****************** IsUnknown ******************/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Returns true for an unknown entity, i,e. if the check is empty and concerned equates content.

Returns
-------
bool
") IsUnknown;
		Standard_Boolean IsUnknown();

		/****************** SetContent ******************/
		%feature("compactdefaultargs") SetContent;
		%feature("autodoc", "Sets a content : it brings non interpreted data which belong to the concerned entity. it can be empty then loaded later. remark that for an unknown entity, content is set by create.

Parameters
----------
content: Standard_Transient

Returns
-------
None
") SetContent;
		void SetContent(const opencascade::handle<Standard_Transient> & content);

};


%make_alias(Interface_ReportEntity)

%extend Interface_ReportEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Interface_STAT *
***********************/
class Interface_STAT {
	public:
		/****************** Interface_STAT ******************/
		%feature("compactdefaultargs") Interface_STAT;
		%feature("autodoc", "Creates a stat form. at start, one default phase is defined, with one default step. then, it suffises to start with a count of items (and cycles if several) then record items, to have a queryable report.

Parameters
----------
title: char *,optional
	default value is ""

Returns
-------
None
") Interface_STAT;
		 Interface_STAT(const char * title = "");

		/****************** Interface_STAT ******************/
		%feature("compactdefaultargs") Interface_STAT;
		%feature("autodoc", "Used when starting.

Parameters
----------
other: Interface_STAT

Returns
-------
None
") Interface_STAT;
		 Interface_STAT(const Interface_STAT & other);

		/****************** AddPhase ******************/
		%feature("compactdefaultargs") AddPhase;
		%feature("autodoc", "Adds a new phase to the description. the first one after create replaces the default unique one.

Parameters
----------
weight: float
name: char *,optional
	default value is ""

Returns
-------
None
") AddPhase;
		void AddPhase(const Standard_Real weight, const char * name = "");

		/****************** AddStep ******************/
		%feature("compactdefaultargs") AddStep;
		%feature("autodoc", "Adds a new step for the last added phase, the default unique one if no addphase has already been added warning : addstep before the first addphase are cancelled.

Parameters
----------
weight: float,optional
	default value is 1

Returns
-------
None
") AddStep;
		void AddStep(const Standard_Real weight = 1);

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns global description (cumulated weights of all phases, count of phases,1 for default, and title).

Parameters
----------
title: char *

Returns
-------
nbphases: int
total: float
") Description;
		void Description(Standard_Integer &OutValue, Standard_Real &OutValue, const char * & title);

		/****************** End ******************/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "Commands to declare the process ended (hence, advancement is forced to 100 %).

Returns
-------
None
") End;
		static void End();

		/****************** Internals ******************/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "Returns fields in once, without copying them, used for copy when starting.

Parameters
----------
tit: TCollection_HAsciiString
phn: TColStd_HSequenceOfAsciiString
phw: TColStd_HSequenceOfReal
phdeb: TColStd_HSequenceOfInteger
phfin: TColStd_HSequenceOfInteger
stw: TColStd_HSequenceOfReal

Returns
-------
total: float
") Internals;
		void Internals(opencascade::handle<TCollection_HAsciiString> & tit, Standard_Real &OutValue, opencascade::handle<TColStd_HSequenceOfAsciiString> & phn, opencascade::handle<TColStd_HSequenceOfReal> & phw, opencascade::handle<TColStd_HSequenceOfInteger> & phdeb, opencascade::handle<TColStd_HSequenceOfInteger> & phfin, opencascade::handle<TColStd_HSequenceOfReal> & stw);

		/****************** NextCycle ******************/
		%feature("compactdefaultargs") NextCycle;
		%feature("autodoc", "Commands to resume the preceeding cycle and start a new one, with a count of items ignored if count of cycles is already passed then, first step is started (or default one) nextitem can be called for the first step, or nextstep to pass to the next one.

Parameters
----------
items: int

Returns
-------
None
") NextCycle;
		static void NextCycle(const Standard_Integer items);

		/****************** NextItem ******************/
		%feature("compactdefaultargs") NextItem;
		%feature("autodoc", "Commands to add an item in the current step of the current cycle of the current phase by default, one item per call, can be overpassed ignored if count of items of this cycle is already passed.

Parameters
----------
nbitems: int,optional
	default value is 1

Returns
-------
None
") NextItem;
		static void NextItem(const Standard_Integer nbitems = 1);

		/****************** NextPhase ******************/
		%feature("compactdefaultargs") NextPhase;
		%feature("autodoc", "Commands to resume the preceeding phase and start a new one <items> and <cycles> as for start, but for this new phase ignored if count of phases is already passed if <cycles> is more than one, the first cycle must then be started by nextcycle (nextstep/nextitem are ignored). if it is one, nextitem/nextstep can then be called.

Parameters
----------
items: int
cycles: int,optional
	default value is 1

Returns
-------
None
") NextPhase;
		static void NextPhase(const Standard_Integer items, const Standard_Integer cycles = 1);

		/****************** NextStep ******************/
		%feature("compactdefaultargs") NextStep;
		%feature("autodoc", "Commands to resume the preceeding step of the cycle ignored if count of steps is already passed nextitem can be called for this step, nextstep passes to next.

Returns
-------
None
") NextStep;
		static void NextStep();

		/****************** Percent ******************/
		%feature("compactdefaultargs") Percent;
		%feature("autodoc", "Returns the advancement as a percentage : <phase> true : inside the current phase <phase> false (d) : relative to the whole process.

Parameters
----------
phase: bool,optional
	default value is Standard_False

Returns
-------
int
") Percent;
		static Standard_Integer Percent(const Standard_Boolean phase = Standard_False);

		/****************** Phase ******************/
		%feature("compactdefaultargs") Phase;
		%feature("autodoc", "Returns description of a phase, given its rank (n0 for first step, count of steps, default gives one; weight, name).

Parameters
----------
num: int
name: char *

Returns
-------
n0step: int
nbstep: int
weight: float
") Phase;
		void Phase(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, const char * & name);

		/****************** SetPhase ******************/
		%feature("compactdefaultargs") SetPhase;
		%feature("autodoc", "Changes the parameters of the phase to start to be used before first counting (i.e. just after nextphase) can be used by an operator which has to reajust counts on run.

Parameters
----------
items: int
cycles: int,optional
	default value is 1

Returns
-------
None
") SetPhase;
		static void SetPhase(const Standard_Integer items, const Standard_Integer cycles = 1);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts a stat on its first phase (or its default one) <items> gives the total count of items, <cycles> the count of cycles if <cycles> is more than one, the first cycle must then be started by nextcycle (nextstep/nextitem are ignored). if it is one, nextitem/nextstep can then be called.

Parameters
----------
items: int
cycles: int,optional
	default value is 1

Returns
-------
None
") Start;
		void Start(const Standard_Integer items, const Standard_Integer cycles = 1);

		/****************** StartCount ******************/
		%feature("compactdefaultargs") StartCount;
		%feature("autodoc", "Starts a default stat, with no phase, no step, ready to just count items. <items> gives the total count of items hence, nextitem is available to directly count.

Parameters
----------
items: int
title: char *,optional
	default value is ""

Returns
-------
None
") StartCount;
		static void StartCount(const Standard_Integer items, const char * title = "");

		/****************** Step ******************/
		%feature("compactdefaultargs") Step;
		%feature("autodoc", "Returns weight of a step, related to the cumul given for the phase. <num> is given by <n0step> + i, i between 1 and <nbsteps> (default gives n0step < 0 then weight is one).

Parameters
----------
num: int

Returns
-------
float
") Step;
		Standard_Real Step(const Standard_Integer num);

		/****************** Where ******************/
		%feature("compactdefaultargs") Where;
		%feature("autodoc", "Returns an identification of the stat : <phase> true (d) : the name of the current phase <phase> false : the title of the current stat.

Parameters
----------
phase: bool,optional
	default value is Standard_True

Returns
-------
char *
") Where;
		static const char * Where(const Standard_Boolean phase = Standard_True);

};


%extend Interface_STAT {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Interface_ShareFlags *
*****************************/
class Interface_ShareFlags {
	public:
		/****************** Interface_ShareFlags ******************/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "Creates a shareflags from a model and builds required data (flags) by calling the general service library given as argument <lib>.

Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Returns
-------
None
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****************** Interface_ShareFlags ******************/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "Same as above, but generallib is detained by a gtool.

Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool

Returns
-------
None
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool);

		/****************** Interface_ShareFlags ******************/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "Same as above, but generallib is defined through a protocol.

Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
None
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Interface_ShareFlags ******************/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "Same as above, but works with the gtool of the model.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Interface_ShareFlags ******************/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "Creates a shareflags by querying informations from a graph (remark that graph also has a method isshared).

Parameters
----------
agraph: Interface_Graph

Returns
-------
None
") Interface_ShareFlags;
		 Interface_ShareFlags(const Interface_Graph & agraph);

		/****************** IsShared ******************/
		%feature("compactdefaultargs") IsShared;
		%feature("autodoc", "Returns true if <ent> is shared by one or more other entity(ies) of the model.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsShared;
		Standard_Boolean IsShared(const opencascade::handle<Standard_Transient> & ent);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model used for the evaluation.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Returns the count of root entities.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns a root entity according its rank in the list of roots by default, it returns the first one.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
opencascade::handle<Standard_Transient>
") Root;
		opencascade::handle<Standard_Transient> Root(const Standard_Integer num = 1);

		/****************** RootEntities ******************/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Returns the entities which are not shared (see their flags).

Returns
-------
Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities();

};


%extend Interface_ShareFlags {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Interface_ShareTool *
****************************/
class Interface_ShareTool {
	public:
		/****************** Interface_ShareTool ******************/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "Creates a sharetool from a model and builds all required data, by calling the general service library and modules (generallib given as an argument).

Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Returns
-------
None
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****************** Interface_ShareTool ******************/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "Same a above, but generallib is detained by a gtool.

Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool

Returns
-------
None
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool);

		/****************** Interface_ShareTool ******************/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "Same a above, but generallib is defined through a protocol protocol is used to build the working library.

Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
None
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Interface_ShareTool ******************/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "Same as above, but works with the gtool of the model.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Interface_ShareTool ******************/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "Creates a sharetool from an already defined graph remark that the data of the graph are copied.

Parameters
----------
agraph: Interface_Graph

Returns
-------
None
") Interface_ShareTool;
		 Interface_ShareTool(const Interface_Graph & agraph);

		/****************** Interface_ShareTool ******************/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "Completes the graph by adding implied references. hence, they are considered as sharing references in all the other queries.

Parameters
----------
ahgraph: Interface_HGraph

Returns
-------
None
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_HGraph> & ahgraph);

		/****************** All ******************/
		%feature("compactdefaultargs") All;
		%feature("autodoc", "Returns the complete list of entities shared by <ent> at any level, including <ent> itself if <ent> is the model, considers the concatenation of allshared for each root if <rootlast> is true (d), the list starts with lower level entities and ends by the root. else, the root is first and the lower level entities are at end.

Parameters
----------
ent: Standard_Transient
rootlast: bool,optional
	default value is Standard_True

Returns
-------
Interface_EntityIterator
") All;
		Interface_EntityIterator All(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean rootlast = Standard_True);

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns the data used by the sharetool to work can then be used directly (read only).

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

		/****************** IsShared ******************/
		%feature("compactdefaultargs") IsShared;
		%feature("autodoc", "Returns true if <ent> is shared by other entities in the model.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsShared;
		Standard_Boolean IsShared(const opencascade::handle<Standard_Transient> & ent);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model used for creation (directly or for graph).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbTypedSharings ******************/
		%feature("compactdefaultargs") NbTypedSharings;
		%feature("autodoc", "Returns the count of sharing entities of an entity, which are kind of a given type.

Parameters
----------
ent: Standard_Transient
atype: Standard_Type

Returns
-------
int
") NbTypedSharings;
		Standard_Integer NbTypedSharings(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Type> & atype);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Utility method which prints the content of an iterator (by their numbers).

Parameters
----------
iter: Interface_EntityIterator
S: Message_Messenger

Returns
-------
None
") Print;
		void Print(const Interface_EntityIterator & iter, const opencascade::handle<Message_Messenger> & S);

		/****************** RootEntities ******************/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Returns the entities which are not shared (their sharing list is empty) in the model.

Returns
-------
Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities();

		/****************** Shareds ******************/
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "Returns the list of entities shared by a given entity <ent>.

Parameters
----------
ent: Standard_Transient

Returns
-------
Interface_EntityIterator
") Shareds;
		Interface_EntityIterator Shareds(const opencascade::handle<Standard_Transient> & ent);

		/****************** Sharings ******************/
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "Returns the list of entities sharing a given entity <ent>.

Parameters
----------
ent: Standard_Transient

Returns
-------
Interface_EntityIterator
") Sharings;
		Interface_EntityIterator Sharings(const opencascade::handle<Standard_Transient> & ent);

		/****************** TypedSharing ******************/
		%feature("compactdefaultargs") TypedSharing;
		%feature("autodoc", "Returns the sharing entity of an entity, which is kind of a given type. allows to access a sharing entity of a given type when there is one and only one (current case).

Parameters
----------
ent: Standard_Transient
atype: Standard_Type

Returns
-------
opencascade::handle<Standard_Transient>
") TypedSharing;
		opencascade::handle<Standard_Transient> TypedSharing(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Type> & atype);

};


%extend Interface_ShareTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Interface_SignLabel *
****************************/
class Interface_SignLabel : public MoniTool_SignText {
	public:
		/****************** Interface_SignLabel ******************/
		%feature("compactdefaultargs") Interface_SignLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Interface_SignLabel;
		 Interface_SignLabel();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns 'entity label'.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Considers context as an interfacemodel and returns the label computed by it.

Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Returns
-------
TCollection_AsciiString
") Text;
		TCollection_AsciiString Text(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & context);

};


%make_alias(Interface_SignLabel)

%extend Interface_SignLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Interface_SignType *
***************************/
%nodefaultctor Interface_SignType;
class Interface_SignType : public MoniTool_SignText {
	public:
		/****************** ClassName ******************/
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "From a cdl type name, returns the class part (package dropped) warning : buffered, to be immediately copied or printed.

Parameters
----------
typnam: char *

Returns
-------
char *
") ClassName;
		static const char * ClassName(const char * typnam);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns an identification of the signature (a word), given at initialization time specialised to consider context as an interfacemodel.

Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Returns
-------
TCollection_AsciiString
") Text;
		TCollection_AsciiString Text(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & context);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the signature for a transient object. it is specific of each sub-class of signature. for a null handle, it should provide '' it can work with the model which contains the entity.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
char *
") Value;
		virtual const char * Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(Interface_SignType)

%extend Interface_SignType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Interface_TypedValue *
*****************************/
class Interface_TypedValue : public MoniTool_TypedValue {
	public:
		/****************** Interface_TypedValue ******************/
		%feature("compactdefaultargs") Interface_TypedValue;
		%feature("autodoc", "Creates a typedvalue, with a name //! type gives the type of the parameter, default is free text also available : integer, real, enum, entity (i.e. object) more precise specifications, titles, can be given to the typedvalue once created //! init gives an initial value. if it is not given, the typedvalue begins as 'not set', its value is empty.

Parameters
----------
name: char *
type: Interface_ParamType,optional
	default value is Interface_ParamText
init: char *,optional
	default value is ""

Returns
-------
None
") Interface_TypedValue;
		 Interface_TypedValue(const char * name, const Interface_ParamType type = Interface_ParamText, const char * init = "");

		/****************** ParamTypeToValueType ******************/
		%feature("compactdefaultargs") ParamTypeToValueType;
		%feature("autodoc", "Correspondance paramtype from interface to valuetype from monitool.

Parameters
----------
typ: Interface_ParamType

Returns
-------
MoniTool_ValueType
") ParamTypeToValueType;
		static MoniTool_ValueType ParamTypeToValueType(const Interface_ParamType typ);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type i.e. calls valuetype then makes correspondance between paramtype from interface (which remains for compatibility reasons) and valuetype from monitool.

Returns
-------
Interface_ParamType
") Type;
		Interface_ParamType Type();

		/****************** ValueTypeToParamType ******************/
		%feature("compactdefaultargs") ValueTypeToParamType;
		%feature("autodoc", "Correspondance paramtype from interface to valuetype from monitool.

Parameters
----------
typ: MoniTool_ValueType

Returns
-------
Interface_ParamType
") ValueTypeToParamType;
		static Interface_ParamType ValueTypeToParamType(const MoniTool_ValueType typ);

};


%make_alias(Interface_TypedValue)

%extend Interface_TypedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Interface_UndefinedContent *
***********************************/
class Interface_UndefinedContent : public Standard_Transient {
	public:
		/****************** Interface_UndefinedContent ******************/
		%feature("compactdefaultargs") Interface_UndefinedContent;
		%feature("autodoc", "Defines an empty undefinedcontent.

Returns
-------
None
") Interface_UndefinedContent;
		 Interface_UndefinedContent();

		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "Adds a parameter which references an entity.

Parameters
----------
ptype: Interface_ParamType
ent: Standard_Transient

Returns
-------
None
") AddEntity;
		void AddEntity(const Interface_ParamType ptype, const opencascade::handle<Standard_Transient> & ent);

		/****************** AddLiteral ******************/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "Adds a literal parameter to the list.

Parameters
----------
ptype: Interface_ParamType
val: TCollection_HAsciiString

Returns
-------
None
") AddLiteral;
		void AddLiteral(const Interface_ParamType ptype, const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** EntityList ******************/
		%feature("compactdefaultargs") EntityList;
		%feature("autodoc", "Returns globally the list of param entities. note that it can be used as shared entity list for the undefinedentity.

Returns
-------
Interface_EntityList
") EntityList;
		Interface_EntityList EntityList();

		/****************** GetFromAnother ******************/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "Copies contents of undefined entities; deigned to be called by getfromanother method from undefined entity of each interface (the basic operation is the same regardless the norm).

Parameters
----------
other: Interface_UndefinedContent
TC: Interface_CopyTool

Returns
-------
None
") GetFromAnother;
		void GetFromAnother(const opencascade::handle<Interface_UndefinedContent> & other, Interface_CopyTool & TC);

		/****************** IsParamEntity ******************/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "Returns true if a parameter is recorded as an entity error if num is not between 1 and nbparams.

Parameters
----------
num: int

Returns
-------
bool
") IsParamEntity;
		Standard_Boolean IsParamEntity(const Standard_Integer num);

		/****************** NbLiterals ******************/
		%feature("compactdefaultargs") NbLiterals;
		%feature("autodoc", "Gives count of literal parameters.

Returns
-------
int
") NbLiterals;
		Standard_Integer NbLiterals();

		/****************** NbParams ******************/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Gives count of recorded parameters.

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** ParamData ******************/
		%feature("compactdefaultargs") ParamData;
		%feature("autodoc", "Returns data of a parameter : its type, and the entity if it designates en entity ('ent') or its literal value else ('str') returned value (boolean) : true if it is an entity, false else.

Parameters
----------
num: int
ptype: Interface_ParamType
ent: Standard_Transient
val: TCollection_HAsciiString

Returns
-------
bool
") ParamData;
		Standard_Boolean ParamData(const Standard_Integer num, Interface_ParamType & ptype, opencascade::handle<Standard_Transient> & ent, opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ParamEntity ******************/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "Returns entity corresponding to a param, given its rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") ParamEntity;
		opencascade::handle<Standard_Transient> ParamEntity(const Standard_Integer num);

		/****************** ParamType ******************/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Returns the paramtype of a param, given its rank error if num is not between 1 and nbparams.

Parameters
----------
num: int

Returns
-------
Interface_ParamType
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num);

		/****************** ParamValue ******************/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "Returns litteral value of a parameter, given its rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ParamValue;
		opencascade::handle<TCollection_HAsciiString> ParamValue(const Standard_Integer num);

		/****************** RemoveParam ******************/
		%feature("compactdefaultargs") RemoveParam;
		%feature("autodoc", "Removes a parameter given its rank.

Parameters
----------
num: int

Returns
-------
None
") RemoveParam;
		void RemoveParam(const Standard_Integer num);

		/****************** Reservate ******************/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "Manages reservation for parameters (internal use) (nb : total count of parameters, nblit : count of literals).

Parameters
----------
nb: int
nblit: int

Returns
-------
None
") Reservate;
		void Reservate(const Standard_Integer nb, const Standard_Integer nblit);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "Sets a new value for the parameter <num>, to reference an entity. to simply change the entity, see the variant below.

Parameters
----------
num: int
ptype: Interface_ParamType
ent: Standard_Transient

Returns
-------
None
") SetEntity;
		void SetEntity(const Standard_Integer num, const Interface_ParamType ptype, const opencascade::handle<Standard_Transient> & ent);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "Changes the entity referenced by the parameter <num> (with same paramtype).

Parameters
----------
num: int
ent: Standard_Transient

Returns
-------
None
") SetEntity;
		void SetEntity(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****************** SetLiteral ******************/
		%feature("compactdefaultargs") SetLiteral;
		%feature("autodoc", "Sets a new value for the parameter <num>, to a literal value (if it referenced formerly an entity, this entity is removed).

Parameters
----------
num: int
ptype: Interface_ParamType
val: TCollection_HAsciiString

Returns
-------
None
") SetLiteral;
		void SetLiteral(const Standard_Integer num, const Interface_ParamType ptype, const opencascade::handle<TCollection_HAsciiString> & val);

};


%make_alias(Interface_UndefinedContent)

%extend Interface_UndefinedContent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Interface_CopyMap *
**************************/
class Interface_CopyMap : public Interface_CopyControl {
	public:
		/****************** Interface_CopyMap ******************/
		%feature("compactdefaultargs") Interface_CopyMap;
		%feature("autodoc", "Creates a copymap adapted to work from a model.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") Interface_CopyMap;
		 Interface_CopyMap(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Binds a starting entity identified by its number <num> in the starting model, to a result of transfer <res>.

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
None
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears transfer list. gets ready to begin another transfer.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the interfacemodel used at creation time.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Search for the result of a starting object (i.e. an entity, identified by its number <num> in the starting model) returns true if a result is bound (and fills <res>) returns false if no result is bound (and nullifies <res>).

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
bool
") Search;
		Standard_Boolean Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

};


%make_alias(Interface_CopyMap)

%extend Interface_CopyMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Interface_GraphContent *
*******************************/
class Interface_GraphContent : public Interface_EntityIterator {
	public:
		/****************** Interface_GraphContent ******************/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "Creates an empty graphcontent, ready to be filled.

Returns
-------
None
") Interface_GraphContent;
		 Interface_GraphContent();

		/****************** Interface_GraphContent ******************/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "Creates with all entities designated by a graph.

Parameters
----------
agraph: Interface_Graph

Returns
-------
None
") Interface_GraphContent;
		 Interface_GraphContent(const Interface_Graph & agraph);

		/****************** Interface_GraphContent ******************/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "Creates with entities having specific status value in a graph.

Parameters
----------
agraph: Interface_Graph
stat: int

Returns
-------
None
") Interface_GraphContent;
		 Interface_GraphContent(const Interface_Graph & agraph, const Standard_Integer stat);

		/****************** Interface_GraphContent ******************/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "Creates an iterator with shared entities of an entity (equivalente to entityiterator but with a graph).

Parameters
----------
agraph: Interface_Graph
ent: Standard_Transient

Returns
-------
None
") Interface_GraphContent;
		 Interface_GraphContent(const Interface_Graph & agraph, const opencascade::handle<Standard_Transient> & ent);

		/****************** Begin ******************/
		%feature("compactdefaultargs") Begin;
		%feature("autodoc", "Does the evaluation before starting the iteration itself (in out).

Returns
-------
None
") Begin;
		void Begin();

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Evaluates list of entities to be iterated. called by start default is set to doing nothing : intended to be redefined by each sub-class.

Returns
-------
None
") Evaluate;
		virtual void Evaluate();

		/****************** GetFromGraph ******************/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "Gets all entities designated by a graph (once created), adds them to those already recorded.

Parameters
----------
agraph: Interface_Graph

Returns
-------
None
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph);

		/****************** GetFromGraph ******************/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "Gets entities from a graph which have a specific status value (one created), adds them to those already recorded.

Parameters
----------
agraph: Interface_Graph
stat: int

Returns
-------
None
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph, const Standard_Integer stat);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns result under the exact form of an entityiterator : can be used when entityiterator itself is required (as a returned value for instance), whitout way for a sub-class.

Returns
-------
Interface_EntityIterator
") Result;
		Interface_EntityIterator Result();

};


%extend Interface_GraphContent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Interface_Static *
*************************/
class Interface_Static : public Interface_TypedValue {
	public:
		/****************** Interface_Static ******************/
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "Creates and records a static, with a family and a name family can report to a name of ressource or to a system or internal definition. the name must be unique. //! type gives the type of the parameter, default is free text also available : integer, real, enum, entity (i.e. object) more precise specifications, titles, can be given to the static once created //! init gives an initial value. if it is not given, the static begin as 'not set', its value is empty.

Parameters
----------
family: char *
name: char *
type: Interface_ParamType,optional
	default value is Interface_ParamText
init: char *,optional
	default value is ""

Returns
-------
None
") Interface_Static;
		 Interface_Static(const char * family, const char * name, const Interface_ParamType type = Interface_ParamText, const char * init = "");

		/****************** Interface_Static ******************/
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "Creates a new static with same definition as another one (value is copied, except for entity : it remains null).

Parameters
----------
family: char *
name: char *
other: Interface_Static

Returns
-------
None
") Interface_Static;
		 Interface_Static(const char * family, const char * name, const opencascade::handle<Interface_Static> & other);

		/****************** CDef ******************/
		%feature("compactdefaultargs") CDef;
		%feature("autodoc", "Returns a part of the definition of a static, as a cstring the part is designated by its name, as a cstring if the required value is not a string, it is converted to a cstring then returned if <name> is not present, or <part> not defined for <name>, this function returns an empty string //! allowed parts for cdef : family : the family type : the type ('integer','real','text','enum') label : the label satis : satisfy function name if any rmin : minimum real value rmax : maximum real value imin : minimum integer value imax : maximum integer value enum nn (nn : value of an integer) : enum value for nn unit : unit definition for a real.

Parameters
----------
name: char *
part: char *

Returns
-------
char *
") CDef;
		static const char * CDef(const char * name, const char * part);

		/****************** CVal ******************/
		%feature("compactdefaultargs") CVal;
		%feature("autodoc", "Returns the value of the parameter identified by the string name. if the specified parameter does not exist, an empty string is returned. example interface_static::cval('write.step.schema'); which could return: 'ap214'.

Parameters
----------
name: char *

Returns
-------
char *
") CVal;
		static const char * CVal(const char * name);

		/****************** Family ******************/
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "Returns the family. it can be : a resource name for applis, an internal name between : $e (environment variables), $l (other, purely local).

Returns
-------
char *
") Family;
		const char * Family();

		/****************** IDef ******************/
		%feature("compactdefaultargs") IDef;
		%feature("autodoc", "Returns a part of the definition of a static, as an integer the part is designated by its name, as a cstring if the required value is not a string, returns zero for a boolean, 0 for false, 1 for true if <name> is not present, or <part> not defined for <name>, this function returns zero //! allowed parts for idef : imin, imax : minimum or maximum integer value estart : starting number for enum ecount : count of enum values (starting from estart) ematch : exact match status eval val : case determined from a string.

Parameters
----------
name: char *
part: char *

Returns
-------
int
") IDef;
		static Standard_Integer IDef(const char * name, const char * part);

		/****************** IVal ******************/
		%feature("compactdefaultargs") IVal;
		%feature("autodoc", "Returns the integer value of the translation parameter identified by the string name. returns the value 0 if the parameter does not exist. example interface_static::ival('write.step.schema'); which could return: 3.

Parameters
----------
name: char *

Returns
-------
int
") IVal;
		static Standard_Integer IVal(const char * name);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Declares a new static (by calling its constructor) if this name is already taken, does nothing and returns false else, creates it and returns true for additional definitions, get the static then edit it.

Parameters
----------
family: char *
name: char *
type: Interface_ParamType
init: char *,optional
	default value is ""

Returns
-------
bool
") Init;
		static Standard_Boolean Init(const char * family, const char * name, const Interface_ParamType type, const char * init = "");

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "As init with paramtype, but type is given as a character this allows a simpler call types : 'i' integer, 'r' real, 't' text, 'e' enum, 'o' object '=' for same definition as, <init> gives the initial static returns false if <type> does not match this list.

Parameters
----------
family: char *
name: char *
type: Standard_Character
init: char *,optional
	default value is ""

Returns
-------
bool
") Init;
		static Standard_Boolean Init(const char * family, const char * name, const Standard_Character type, const char * init = "");

		/****************** IsPresent ******************/
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "Returns true if a static named <name> is present, false else.

Parameters
----------
name: char *

Returns
-------
bool
") IsPresent;
		static Standard_Boolean IsPresent(const char * name);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if <name> is present and set <proper> true (d) : considers this item only <proper> false : if not set and attached to a wild-card, considers this wild-card.

Parameters
----------
name: char *
proper: bool,optional
	default value is Standard_True

Returns
-------
bool
") IsSet;
		static Standard_Boolean IsSet(const char * name, const Standard_Boolean proper = Standard_True);

		/****************** IsUpdated ******************/
		%feature("compactdefaultargs") IsUpdated;
		%feature("autodoc", "Returns the status 'uptodate' from a static returns false if <name> is not present.

Parameters
----------
name: char *

Returns
-------
bool
") IsUpdated;
		static Standard_Boolean IsUpdated(const char * name);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns a list of names of statics : <mode> = 0 (d) : criter is for family <mode> = 1 : criter is regexp on names, takes final items (ignore wild cards) <mode> = 2 : idem but take only wilded, not final items <mode> = 3 : idem, take all items matching criter idem + 100 : takes only non-updated items idem + 200 : takes only updated items criter empty (d) : returns all names else returns names which match the given criter remark : families beginning by '$' are not listed by criter '' they are listed only by criter '$' //! this allows for instance to set new values after having loaded or reloaded a resource, then to update them as required.

Parameters
----------
mode: int,optional
	default value is 0
criter: char *,optional
	default value is ""

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") Items;
		static opencascade::handle<TColStd_HSequenceOfHAsciiString> Items(const Standard_Integer mode = 0, const char * criter = "");

		/****************** PrintStatic ******************/
		%feature("compactdefaultargs") PrintStatic;
		%feature("autodoc", "Writes the properties of a parameter in the diagnostic file. these include: - name - family, - wildcard (if it has one) - current status (empty string if it was updated or if it is the original one) - value.

Parameters
----------
S: Message_Messenger

Returns
-------
None
") PrintStatic;
		void PrintStatic(const opencascade::handle<Message_Messenger> & S);

		/****************** RVal ******************/
		%feature("compactdefaultargs") RVal;
		%feature("autodoc", "Returns the value of a static translation parameter identified by the string name. returns the value 0.0 if the parameter does not exist.

Parameters
----------
name: char *

Returns
-------
float
") RVal;
		static Standard_Real RVal(const char * name);

		/****************** SetCVal ******************/
		%feature("compactdefaultargs") SetCVal;
		%feature("autodoc", "Modifies the value of the parameter identified by name. the modification is specified by the string val. false is returned if the parameter does not exist. example interface_static::setcval ('write.step.schema','ap203') this syntax specifies a switch from the default step 214 mode to step 203 mode.

Parameters
----------
name: char *
val: char *

Returns
-------
bool
") SetCVal;
		static Standard_Boolean SetCVal(const char * name, const char * val);

		/****************** SetIVal ******************/
		%feature("compactdefaultargs") SetIVal;
		%feature("autodoc", "Modifies the value of the parameter identified by name. the modification is specified by the integer value val. false is returned if the parameter does not exist. example interface_static::setival ('write.step.schema', 3) this syntax specifies a switch from the default step 214 mode to step 203 mode.s.

Parameters
----------
name: char *
val: int

Returns
-------
bool
") SetIVal;
		static Standard_Boolean SetIVal(const char * name, const Standard_Integer val);

		/****************** SetRVal ******************/
		%feature("compactdefaultargs") SetRVal;
		%feature("autodoc", "Modifies the value of a translation parameter. false is returned if the parameter does not exist. the modification is specified by the real number value val.

Parameters
----------
name: char *
val: float

Returns
-------
bool
") SetRVal;
		static Standard_Boolean SetRVal(const char * name, const Standard_Real val);

		/****************** SetUptodate ******************/
		%feature("compactdefaultargs") SetUptodate;
		%feature("autodoc", "Records a static has 'uptodate', i.e. its value has been taken into account by a reinitialisation procedure this flag is reset at each successful setvalue.

Returns
-------
None
") SetUptodate;
		void SetUptodate();

		/****************** SetWild ******************/
		%feature("compactdefaultargs") SetWild;
		%feature("autodoc", "Sets a 'wild-card' static : its value will be considered if <self> is not properly set. (reset by set a null one).

Parameters
----------
wildcard: Interface_Static

Returns
-------
None
") SetWild;
		void SetWild(const opencascade::handle<Interface_Static> & wildcard);

		/****************** Standards ******************/
		%feature("compactdefaultargs") Standards;
		%feature("autodoc", "Initializes all standard static parameters, which can be used by every function. statics specific of a norm or a function must be defined around it.

Returns
-------
None
") Standards;
		static void Standards();

		/****************** Static ******************/
		%feature("compactdefaultargs") Static;
		%feature("autodoc", "Returns a static from its name. null handle if not present.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Interface_Static>
") Static;
		static opencascade::handle<Interface_Static> Static(const char * name);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Sets a static to be 'uptodate' returns false if <name> is not present this status can be used by a reinitialisation procedure to rerun if a value has been changed.

Parameters
----------
name: char *

Returns
-------
bool
") Update;
		static Standard_Boolean Update(const char * name);

		/****************** UpdatedStatus ******************/
		%feature("compactdefaultargs") UpdatedStatus;
		%feature("autodoc", "Returns the status 'uptodate'.

Returns
-------
bool
") UpdatedStatus;
		Standard_Boolean UpdatedStatus();

		/****************** Wild ******************/
		%feature("compactdefaultargs") Wild;
		%feature("autodoc", "Returns the wildcard static, which can be (is most often) null.

Returns
-------
opencascade::handle<Interface_Static>
") Wild;
		opencascade::handle<Interface_Static> Wild();

};


%make_alias(Interface_Static)

%extend Interface_Static {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class Interface_HArray1OfHAsciiString : public  Interface_Array1OfHAsciiString, public Standard_Transient {
  public:
    Interface_HArray1OfHAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper);
    Interface_HArray1OfHAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper, const  Interface_Array1OfHAsciiString::value_type& theValue);
    Interface_HArray1OfHAsciiString(const  Interface_Array1OfHAsciiString& theOther);
    const  Interface_Array1OfHAsciiString& Array1();
     Interface_Array1OfHAsciiString& ChangeArray1();
};
%make_alias(Interface_HArray1OfHAsciiString)


/* harray2 classes */
/* hsequence classes */
class Interface_HSequenceOfCheck : public  Interface_SequenceOfCheck, public Standard_Transient {
  public:
    Interface_HSequenceOfCheck();
    Interface_HSequenceOfCheck(const  Interface_SequenceOfCheck& theOther);
    const  Interface_SequenceOfCheck& Sequence();
    void Append (const  Interface_SequenceOfCheck::value_type& theItem);
    void Append ( Interface_SequenceOfCheck& theSequence);
     Interface_SequenceOfCheck& ChangeSequence();
};
%make_alias(Interface_HSequenceOfCheck)


