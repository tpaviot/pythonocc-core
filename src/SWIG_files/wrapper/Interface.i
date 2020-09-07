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
from enum import IntEnum
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

class Interface_ParamType(IntEnum):
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
Interface_ParamMisc = Interface_ParamType.Interface_ParamMisc
Interface_ParamInteger = Interface_ParamType.Interface_ParamInteger
Interface_ParamReal = Interface_ParamType.Interface_ParamReal
Interface_ParamIdent = Interface_ParamType.Interface_ParamIdent
Interface_ParamVoid = Interface_ParamType.Interface_ParamVoid
Interface_ParamText = Interface_ParamType.Interface_ParamText
Interface_ParamEnum = Interface_ParamType.Interface_ParamEnum
Interface_ParamLogical = Interface_ParamType.Interface_ParamLogical
Interface_ParamSub = Interface_ParamType.Interface_ParamSub
Interface_ParamHexa = Interface_ParamType.Interface_ParamHexa
Interface_ParamBinary = Interface_ParamType.Interface_ParamBinary

class Interface_DataState(IntEnum):
	Interface_StateOK = 0
	Interface_LoadWarning = 1
	Interface_LoadFail = 2
	Interface_DataWarning = 3
	Interface_DataFail = 4
	Interface_StateUnloaded = 5
	Interface_StateUnknown = 6
Interface_StateOK = Interface_DataState.Interface_StateOK
Interface_LoadWarning = Interface_DataState.Interface_LoadWarning
Interface_LoadFail = Interface_DataState.Interface_LoadFail
Interface_DataWarning = Interface_DataState.Interface_DataWarning
Interface_DataFail = Interface_DataState.Interface_DataFail
Interface_StateUnloaded = Interface_DataState.Interface_StateUnloaded
Interface_StateUnknown = Interface_DataState.Interface_StateUnknown

class Interface_CheckStatus(IntEnum):
	Interface_CheckOK = 0
	Interface_CheckWarning = 1
	Interface_CheckFail = 2
	Interface_CheckAny = 3
	Interface_CheckMessage = 4
	Interface_CheckNoFail = 5
Interface_CheckOK = Interface_CheckStatus.Interface_CheckOK
Interface_CheckWarning = Interface_CheckStatus.Interface_CheckWarning
Interface_CheckFail = Interface_CheckStatus.Interface_CheckFail
Interface_CheckAny = Interface_CheckStatus.Interface_CheckAny
Interface_CheckMessage = Interface_CheckStatus.Interface_CheckMessage
Interface_CheckNoFail = Interface_CheckStatus.Interface_CheckNoFail
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

%extend NCollection_Sequence<opencascade::handle<Interface_Check>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: db569c1187338b8b4d403ec388a0f626 ****/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "Creates a empty bitmap.

Returns
-------
None
") Interface_BitMap;
		 Interface_BitMap();

		/****************** Interface_BitMap ******************/
		/**** md5 signature: 962bea8ef2bbf44e9f6d708deb599079 ****/
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
		/**** md5 signature: 969939d4e3440c110cf2bc7d3c420793 ****/
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
		/**** md5 signature: 19d04033b263e56b9a42c22690f3c1e2 ****/
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
		/**** md5 signature: 847e94177a4401a5471f0ce8809a2518 ****/
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
		/**** md5 signature: f737c3c281669deb5997674e8b92e10c ****/
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
		/**** md5 signature: 71ec9b397601f115038302f533af5415 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear all field of bit map.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FlagName ******************/
		/**** md5 signature: 37218c965ffaaa4420e6c83f3497e2e4 ****/
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
		/**** md5 signature: dfbf758026c5cedb65e5965d13b268be ****/
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
		/**** md5 signature: 4873c90a7d9b0873090a22d6fde2925e ****/
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
		/**** md5 signature: 2726d6fdc01da6c8dd49a7b16ec44631 ****/
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
		/**** md5 signature: 076577a8f47a7fa021348180ef2d87cc ****/
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
		/**** md5 signature: dbe69c4e903a7c78d7f33ccc46f395c1 ****/
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
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the count of items (i.e. the length of the bitmap).

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** NbFlags ******************/
		/**** md5 signature: 57c8ed141584427f546add7793d296d7 ****/
		%feature("compactdefaultargs") NbFlags;
		%feature("autodoc", "Returns the count of flags (flag 0 not included).

Returns
-------
int
") NbFlags;
		Standard_Integer NbFlags();

		/****************** RemoveFlag ******************/
		/**** md5 signature: 39c5f622dd041834d59347d40f6b1005 ****/
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
		/**** md5 signature: 959e159d3bb93437bea1686165cf9478 ****/
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
		/**** md5 signature: 5f1673cee0277c1086c4194336d9a66e ****/
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
		/**** md5 signature: 19b1ab796cecaa9a8005cbbfa7d56f0b ****/
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
		/**** md5 signature: 7fa593eecff52e65f7a52831a8cc6baf ****/
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
		/**** md5 signature: f8c0dc76542f6761e10acb7317a315be ****/
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
		/**** md5 signature: 1c326ec9bbb4d3af44ace82642a4e699 ****/
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
		/**** md5 signature: b99e23510d657e7d6539e0a7d8252a01 ****/
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
		/**** md5 signature: efb3fe3148b618457c9b09c50b924bec ****/
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "Creates a category, with no protocol yet.

Returns
-------
None
") Interface_Category;
		 Interface_Category();

		/****************** Interface_Category ******************/
		/**** md5 signature: 78e71b948bfa660059997bf6cc10c1c7 ****/
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
		/**** md5 signature: ba7276b213b743915ca4fe4fc5707d99 ****/
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
		/**** md5 signature: a27890a05fa847cd11e98959beb93723 ****/
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
		/**** md5 signature: 3e07cbf7623ae6de435ab6d784f7ef87 ****/
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
		/**** md5 signature: 00bfeb1c200ec3206c2a9b63ac3cb30b ****/
		%feature("compactdefaultargs") ClearNums;
		%feature("autodoc", "Clears the recorded list of category numbers for a model.

Returns
-------
None
") ClearNums;
		void ClearNums();

		/****************** Compute ******************/
		/**** md5 signature: 2330764963d309efcab791418279b57a ****/
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
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Default initialisation (protected against several calls : passes only once).

Returns
-------
None
") Init;
		static void Init();

		/****************** Name ******************/
		/**** md5 signature: 90b2dbf508375c5337d5df4595e90cec ****/
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
		/**** md5 signature: 15ca00fe4737c8bde1c54290a257c1ec ****/
		%feature("compactdefaultargs") NbCategories;
		%feature("autodoc", "Returns the count of recorded categories.

Returns
-------
int
") NbCategories;
		static Standard_Integer NbCategories();

		/****************** Num ******************/
		/**** md5 signature: d2a0fda3a2229bf8d99e97222156a256 ****/
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
		/**** md5 signature: fbe1daf3ab8187f5e5ecd5017d9938f3 ****/
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
		/**** md5 signature: 037fff6bcbc07de18c1688974b3bee5c ****/
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
		/**** md5 signature: 7f90a0235cc0c2fbe51830893d2b11de ****/
		%feature("compactdefaultargs") Interface_Check;
		%feature("autodoc", "Allows definition of a sequence. used also for global check of an interfacemodel (which stores global messages for file).

Returns
-------
None
") Interface_Check;
		 Interface_Check();

		/****************** Interface_Check ******************/
		/**** md5 signature: 430409a4cca19f08ea37d04913f5ac29 ****/
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
		/**** md5 signature: f9be97b778e94cadf07344b48c88b2ec ****/
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
		/**** md5 signature: 8be0c4574a6a147568ae3462cbf85ae3 ****/
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
		/**** md5 signature: f605f13d55ac347cc1a224f7bb297f1f ****/
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
		/**** md5 signature: 475a01b010b4e2f284e66a83730c9014 ****/
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
		/**** md5 signature: 9ec76aca562eb8e28b5411eba37ffcb8 ****/
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
		/**** md5 signature: 77fe09ed073b8c6e96e8621c7d0459c8 ****/
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
		/**** md5 signature: d0551ee8497c3fe957e762088a968913 ****/
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
		/**** md5 signature: 00bb7fdd767eee55c100662f590ee316 ****/
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
		/**** md5 signature: 76917aed443f5ffeff440c8f1fa8f5dc ****/
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
		/**** md5 signature: cf6d3b7d4e368c59afdf8bee8c06f62f ****/
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
		/**** md5 signature: 808de3f2d1afa1bd13afa58f447ddf7e ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears a check, in order to receive informations from transfer (messages and entity).

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClearFails ******************/
		/**** md5 signature: 2ad879b4d2e37bf4698c253c8b35971a ****/
		%feature("compactdefaultargs") ClearFails;
		%feature("autodoc", "Clears the fail messages (for instance to keep only warnings).

Returns
-------
None
") ClearFails;
		void ClearFails();

		/****************** ClearInfoMsgs ******************/
		/**** md5 signature: 34c3c2a0c22ab10df12a5dd59859cab0 ****/
		%feature("compactdefaultargs") ClearInfoMsgs;
		%feature("autodoc", "Clears the info messages.

Returns
-------
None
") ClearInfoMsgs;
		void ClearInfoMsgs();

		/****************** ClearWarnings ******************/
		/**** md5 signature: 21ba9936fe5384f574f7b3e976f914eb ****/
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "Clears the warning messages (for instance to keep only fails).

Returns
-------
None
") ClearWarnings;
		void ClearWarnings();

		/****************** Complies ******************/
		/**** md5 signature: bd47c5c42d431ecc7dae0adf51b14f93 ****/
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
		/**** md5 signature: a0c202208e05c6908f6f28441a6077da ****/
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
		/**** md5 signature: fef0e331cb625aad1f4e0bc4e9d437d6 ****/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns the entity on which the check has been defined.

Returns
-------
opencascade::handle<Standard_Transient>
") Entity;
		const opencascade::handle<Standard_Transient> & Entity();

		/****************** Fail ******************/
		/**** md5 signature: 33f2fd9aaa3595fbdec444a4f9c1d29c ****/
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
		/**** md5 signature: 21c724cd0264efcfa01b1a66ff968891 ****/
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
		/**** md5 signature: 45e1d9a7e61c5beb11f12bc052896e68 ****/
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
		/**** md5 signature: 6c9b69baffd432a259c6cbae6828d8d2 ****/
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
		/**** md5 signature: ade88a62763cbaa286e34927e67ec97d ****/
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
		/**** md5 signature: da207550990fa73aecc203a0676ca926 ****/
		%feature("compactdefaultargs") HasEntity;
		%feature("autodoc", "Returns true if a check is devoted to an entity; else, it is global (for interfacemodel's storing of global error messages).

Returns
-------
bool
") HasEntity;
		Standard_Boolean HasEntity();

		/****************** HasFailed ******************/
		/**** md5 signature: 231f6cf476d6eb671060105fc565fef7 ****/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Returns true if check brings at least one fail message.

Returns
-------
bool
") HasFailed;
		Standard_Boolean HasFailed();

		/****************** HasWarnings ******************/
		/**** md5 signature: 62eec0bc4f8c89e1937e6ebe5c890272 ****/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Returns true if check brings at least one warning message.

Returns
-------
bool
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****************** InfoMsg ******************/
		/**** md5 signature: b59326ec723b9d632798269a90b5c27c ****/
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
		/**** md5 signature: e2eed28c1b84021b5a9b4883813984d8 ****/
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
		/**** md5 signature: 5b7eeed5c29bcfb2d1e36c54d12a46af ****/
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
		/**** md5 signature: 950d340013c289e6e9c9d027f2051ade ****/
		%feature("compactdefaultargs") NbFails;
		%feature("autodoc", "Returns count of recorded fails.

Returns
-------
int
") NbFails;
		Standard_Integer NbFails();

		/****************** NbInfoMsgs ******************/
		/**** md5 signature: cb3779319716b130c2d191208e46fc78 ****/
		%feature("compactdefaultargs") NbInfoMsgs;
		%feature("autodoc", "Returns the count of recorded information messages.

Returns
-------
int
") NbInfoMsgs;
		Standard_Integer NbInfoMsgs();

		/****************** NbWarnings ******************/
		/**** md5 signature: 8e87d048d54d06f512ddb6e0bbb2f55a ****/
		%feature("compactdefaultargs") NbWarnings;
		%feature("autodoc", "Returns count of recorded warning messages.

Returns
-------
int
") NbWarnings;
		Standard_Integer NbWarnings();

		/****************** Print ******************/
		/**** md5 signature: 8db175be305f9fd3502b4144c50ea3d5 ****/
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
		/**** md5 signature: fbc96bff34dc8f4089235a7befff9769 ****/
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
		/**** md5 signature: 1eab4e53649e1a16e12a6f58bd826f30 ****/
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
		/**** md5 signature: f751f85c3590977261d17744924ccb9f ****/
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
		/**** md5 signature: 7a784110763f5a191de87e4b30b0324e ****/
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
		/**** md5 signature: 4831d2207818bfa2888384573ff378ca ****/
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
		/**** md5 signature: a1aa35ee9c0826471c319adbfef1a3ec ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the check status : ok, warning or fail.

Returns
-------
Interface_CheckStatus
") Status;
		Interface_CheckStatus Status();

		/****************** Trace ******************/
		/**** md5 signature: cf02ca3158b0207f14d520f0a8d5c02b ****/
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
		/**** md5 signature: 8a10938d450687ebc48c00aa49f83e4b ****/
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
		/**** md5 signature: d581bddbb927ec43e862233c97e84719 ****/
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
		/**** md5 signature: b5e866bc02592812e8fd52bfe221f952 ****/
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "Creates an empty checkiterator.

Returns
-------
None
") Interface_CheckIterator;
		 Interface_CheckIterator();

		/****************** Interface_CheckIterator ******************/
		/**** md5 signature: 9a5a658844504095beb82bc8fd617c2c ****/
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
		/**** md5 signature: 4a6b3c1f769b0854805edff2f650eff6 ****/
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
		/**** md5 signature: c28c01886a4208269253e2208277edbf ****/
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
		/**** md5 signature: afbcceb69ef295e5e0a74341809ed4a8 ****/
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
		/**** md5 signature: 96c2f23202b10afafa9169d8cdd86ad2 ****/
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
		/**** md5 signature: 51be1e644fb07f435d639ea2c6b1e086 ****/
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
		/**** md5 signature: 6af14138eebf6a903d15085a084f054e ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of checks.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Complies ******************/
		/**** md5 signature: bd47c5c42d431ecc7dae0adf51b14f93 ****/
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
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Clears data of iteration.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Extract ******************/
		/**** md5 signature: 4e27e823b8768c522445cdc0e4043cfa ****/
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
		/**** md5 signature: 2db622a09a39a7b3c216db6d134bd273 ****/
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
		/**** md5 signature: 803613576dcec3f9a8d605a071deb357 ****/
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
		/**** md5 signature: baac633c3fc83575a5e2da46ece8b525 ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the stored model (can be a null handle).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more checks to get.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Name ******************/
		/**** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the recorded name (can be empty).

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Next ******************/
		/**** md5 signature: db8382462e33c960ba2eedf02613f499 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets iteration to next item.

Returns
-------
None
") Next;
		void Next();

		/****************** Number ******************/
		/**** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ****/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns number of entity for the check currently iterated or 0 for globalcheck.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** Print ******************/
		/**** md5 signature: 3cf2b42a331db194c0b69a57fac893c2 ****/
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
		/**** md5 signature: 304088c4f34ee8e419f2fd7a5ace51b4 ****/
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
		/**** md5 signature: 81170abf4e017303192fc5e4bf72fea9 ****/
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
		/**** md5 signature: 70328a97cec44e457500ce3b002efc49 ****/
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
		/**** md5 signature: 208d3e507b11ad1eb22d3afd35f96209 ****/
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
		/**** md5 signature: c626be121588f79e9e18cc24cc705050 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts iteration. thus, it is possible to restart it remark : an iteration may be done with a const iterator while its content is modified (through a pointer), this allows to give it as a const argument to a function.

Returns
-------
None
") Start;
		void Start();

		/****************** Status ******************/
		/**** md5 signature: a1aa35ee9c0826471c319adbfef1a3ec ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns worst status among : ok, warning, fail.

Returns
-------
Interface_CheckStatus
") Status;
		Interface_CheckStatus Status();

		/****************** Value ******************/
		/**** md5 signature: f4d2f44a410b3e3cf64e685769098635 ****/
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
		/**** md5 signature: 5ab8272955d617e24b07e8494b0c2533 ****/
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
		/**** md5 signature: b514ba2dd5b625afdc2b750255b2df75 ****/
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
		/**** md5 signature: 753f9154813699d83f4038bf6b8c04d0 ****/
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
		/**** md5 signature: 59802d0acbc68e3993d49b35e5ec0eeb ****/
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
		/**** md5 signature: b1a8bd4983e0bb079b0cb8d99027dfab ****/
		%feature("compactdefaultargs") AnalyseCheckList;
		%feature("autodoc", "Returns list of errors dectected at analyse time (syntactic) (note that globalcheck is not in this list).

Returns
-------
Interface_CheckIterator
") AnalyseCheckList;
		Interface_CheckIterator AnalyseCheckList();

		/****************** Check ******************/
		/**** md5 signature: af76360fee7801f23a6d8aa9bab38117 ****/
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
		/**** md5 signature: a0f363eff6cccdc4c389615b84796fd3 ****/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns list of all errors detected note that presence of unknown entities is not an error cumulates : globalcheck if error + analysechecklist + verifychecklist.

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** CheckSuccess ******************/
		/**** md5 signature: 831d2a1e101dcafb9604bb86498b17d9 ****/
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
		/**** md5 signature: dd892cfac1922aa0f3c0767a3cb97241 ****/
		%feature("compactdefaultargs") CompleteCheckList;
		%feature("autodoc", "Returns list of all 'remarkable' informations, which include : - globalcheck, if not empty - error checks, for all errors (verify + analyse) - also corrected entities - and unknown entities : for those, each unknown entity is associated to an empty check (it is neither an error nor a correction, but a remarkable information).

Returns
-------
Interface_CheckIterator
") CompleteCheckList;
		Interface_CheckIterator CompleteCheckList();

		/****************** FillCheck ******************/
		/**** md5 signature: 96faa5770c5b0e45661900a72f015d22 ****/
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
		/**** md5 signature: 7013edffb795d32d634ba2402e12f0c4 ****/
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
		/**** md5 signature: 186f8db0b93d3be855f7d1c756e7930a ****/
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
		/**** md5 signature: bd331908c549b04b25469271a771e03d ****/
		%feature("compactdefaultargs") UnknownEntities;
		%feature("autodoc", "Returns list of unknown entities note that error and erroneous entities are not considered as unknown.

Returns
-------
Interface_EntityIterator
") UnknownEntities;
		Interface_EntityIterator UnknownEntities();

		/****************** VerifyCheckList ******************/
		/**** md5 signature: 4dcbd6c0a58f6c164d0fa0dc3b33638d ****/
		%feature("compactdefaultargs") VerifyCheckList;
		%feature("autodoc", "Returns list of integrity constraints errors (semantic) (note that globalcheck is not in this list).

Returns
-------
Interface_CheckIterator
") VerifyCheckList;
		Interface_CheckIterator VerifyCheckList();

		/****************** WarningCheckList ******************/
		/**** md5 signature: 2443d0ebe4f00c6ed5a384c81a4f663b ****/
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
		/**** md5 signature: 198684707fd621b3a8201773431c09ef ****/
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
		/**** md5 signature: d67699716a1d70f3f12e5a2b1d81e2d9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears list of copy results. gets ready to begin another copy process.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** Search ******************/
		/**** md5 signature: be4105f70addedede9c47b4c043c8dfb ****/
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
		/**** md5 signature: 2ffe2dfad4989a2f525d6a72fa611c8c ****/
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
		/**** md5 signature: 476f3608a5b01ab0028273c541d9d50b ****/
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
		/**** md5 signature: 6e5408215b76b084ba5f396e61b79c78 ****/
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
		/**** md5 signature: f07152d868147881642168cd837b3600 ****/
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
		/**** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears transfer list. gets ready to begin another transfer.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClearLastFlags ******************/
		/**** md5 signature: 468b0c960533d5923d24b4dd930d9acf ****/
		%feature("compactdefaultargs") ClearLastFlags;
		%feature("autodoc", "Clears lastflags only. this allows to know what entities are copied after its call (see method lastcopiedafter). it can be used when copies are done by increments, which must be distinghished. clearlastflags is also called by clear.

Returns
-------
None
") ClearLastFlags;
		void ClearLastFlags();

		/****************** CompleteResult ******************/
		/**** md5 signature: ea9b74b309317519b06757d93262c0cc ****/
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
		/**** md5 signature: 2b9c8e9c0d77e4d7c78d407ba1dab327 ****/
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "Returns the object used for control.

Returns
-------
opencascade::handle<Interface_CopyControl>
") Control;
		opencascade::handle<Interface_CopyControl> Control();

		/****************** Copy ******************/
		/**** md5 signature: 32447fdc65ef06ca5213043fab887ec0 ****/
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
		/**** md5 signature: ce66908e7c19c6a4a9db70933c852f31 ****/
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
		/**** md5 signature: aad84202daf9f6c736716707bc1e4a41 ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model on which the copytool works.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** RenewImpliedRefs ******************/
		/**** md5 signature: 40b882fa61fc4daed48f8bb89f5d7134 ****/
		%feature("compactdefaultargs") RenewImpliedRefs;
		%feature("autodoc", "Renews the implied references. these references do not involve copying of referenced entities. for such a reference, if the entity which defines it and the referenced entity are both copied, then this reference is renewed. else it is deleted in the copied entities. remark : this concerns only some specific references, such as 'back pointers'.

Returns
-------
None
") RenewImpliedRefs;
		void RenewImpliedRefs();

		/****************** RootResult ******************/
		/**** md5 signature: 6ce16052973bb08c300e2dc2ed1bab8e ****/
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
		/**** md5 signature: 96f59d0b51cfcc113410b586ef3795ea ****/
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
		/**** md5 signature: 64e426bc76ca2f83a12255dffec8e1b1 ****/
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
		/**** md5 signature: aca492321a7b9c62fac89c749bbea9fb ****/
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
		/**** md5 signature: 0fd56aa6288b9056a0f09f28c8c6abe6 ****/
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
		/**** md5 signature: 6a48e9387c8e9f341264b3e1eab6c7e9 ****/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "Creates an empty, non-chained, entitycluster.

Returns
-------
None
") Interface_EntityCluster;
		 Interface_EntityCluster();

		/****************** Interface_EntityCluster ******************/
		/**** md5 signature: 334cdf9a9e23d80260833d407825d25f ****/
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
		/**** md5 signature: a40c745c34f2ee9441c8cc983c64cb3e ****/
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
		/**** md5 signature: 7c75335c8a0977377938d37cc9bddfc9 ****/
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
		/**** md5 signature: 48722434508b90c52582bcdb47c3a1c8 ****/
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
		/**** md5 signature: e32e298c5181f5a878a91b9da55bfb78 ****/
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
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns total count of entities (including next).

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** Remove ******************/
		/**** md5 signature: 15abc7881be881e58d0907223e239cc2 ****/
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
		/**** md5 signature: 37f5a5cdb681cc08ea6f88bf3c6c2dca ****/
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
		/**** md5 signature: b9b839d4cab4434a1fde39fb5e695825 ****/
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
		/**** md5 signature: a291325b4e5caa2a5ab946934090ec8b ****/
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
		/**** md5 signature: 685665124dd234df3a83f75507ec3d1b ****/
		%feature("compactdefaultargs") Interface_EntityIterator;
		%feature("autodoc", "Defines an empty iterator (see addlist & additem).

Returns
-------
None
") Interface_EntityIterator;
		 Interface_EntityIterator();

		/****************** Interface_EntityIterator ******************/
		/**** md5 signature: d1f133a9b3912cf24f8d9444ce7616b8 ****/
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
		/**** md5 signature: 3f10cb57683e1144e46e0f94e8de6fea ****/
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
		/**** md5 signature: aa5a44f7eb178e7bc497b41c38a65aad ****/
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
		/**** md5 signature: 7b256486d5a1be7418a47021add2e3df ****/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Returns the content of the iterator, accessed through a handle to be used by a frontal-engine logic returns an empty sequence if the iterator is empty calls start if not yet done.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Content;
		opencascade::handle<TColStd_HSequenceOfTransient> Content();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Clears data of iteration.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** GetOneItem ******************/
		/**** md5 signature: 1b4381c0765863bea2533a714d734ccd ****/
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
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Says if there are other entities (vertices) to iterate the first time, calls start.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of entities which will be iterated on calls start if not yet done.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbTyped ******************/
		/**** md5 signature: 999a48c8c6ac9f22884970d7325b38c7 ****/
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
		/**** md5 signature: db8382462e33c960ba2eedf02613f499 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets iteration to the next entity (vertex) to give.

Returns
-------
None
") Next;
		void Next();

		/****************** SelectType ******************/
		/**** md5 signature: 1c0dfe46bcf42d7b3d927e5df31e1e68 ****/
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
		/**** md5 signature: dde3966b7a16919fa06cc08ef880a579 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Allows re-iteration (useless for the first iteration).

Returns
-------
None
") Start;
		virtual void Start();

		/****************** Typed ******************/
		/**** md5 signature: 89394515bc1f2d9fa11805dfbe59ac72 ****/
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
		/**** md5 signature: b1443f8da90189a74241bf586c57fc63 ****/
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
		/**** md5 signature: 627b17e512379a9e8b95fe4155041e80 ****/
		%feature("compactdefaultargs") Interface_EntityList;
		%feature("autodoc", "Creates a list as beeing empty.

Returns
-------
None
") Interface_EntityList;
		 Interface_EntityList();

		/****************** Add ******************/
		/**** md5 signature: c44fbf384fa2d194a65791bc9700727c ****/
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
		/**** md5 signature: 48722434508b90c52582bcdb47c3a1c8 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FillIterator ******************/
		/**** md5 signature: e32e298c5181f5a878a91b9da55bfb78 ****/
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
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the list is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of recorded entities.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbTypedEntities ******************/
		/**** md5 signature: 4a49de8b8d8c868d4307a6b3433312af ****/
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
		/**** md5 signature: bc1ae58548c5800e7ea8050cad381881 ****/
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
		/**** md5 signature: e3847406ec281ce8f6c5ad43b1693cec ****/
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
		/**** md5 signature: b9b839d4cab4434a1fde39fb5e695825 ****/
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
		/**** md5 signature: 67e22368a55b7a38e5b3e70c37bf0cb3 ****/
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
		/**** md5 signature: a291325b4e5caa2a5ab946934090ec8b ****/
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
		/**** md5 signature: 10c28b1eddd0be7d98b4d0e9b8f5e694 ****/
		%feature("compactdefaultargs") Interface_FileParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Interface_FileParameter;
		 Interface_FileParameter();

		/****************** CValue ******************/
		/**** md5 signature: e98648cfa0854064b9564f027ea87801 ****/
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "Same as above, but as a cstring (for immediate exploitation) was c++ : return const.

Returns
-------
char *
") CValue;
		const char * CValue();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears stored data : frees memory taken for the string value.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor. does nothing because memory is managed by paramset.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** EntityNumber ******************/
		/**** md5 signature: 3b5de40d76500537f54e61dc1880dcc0 ****/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Returns value set by setentitynumber.

Returns
-------
int
") EntityNumber;
		Standard_Integer EntityNumber();

		/****************** Init ******************/
		/**** md5 signature: 605189a0f3dfab6af921265c543ce052 ****/
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
		/**** md5 signature: d9af5d9fa4a25bf77ef7ae426708d16d ****/
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
		/**** md5 signature: dc18453a4564d25585accbb5ebf0a4f7 ****/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Returns the type of the parameter.

Returns
-------
Interface_ParamType
") ParamType;
		Interface_ParamType ParamType();

		/****************** SetEntityNumber ******************/
		/**** md5 signature: 983185a3faf631b23ae4c33cb29ff8e7 ****/
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
		/**** md5 signature: 49ab830a569601354ff545df352b0db0 ****/
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
		/**** md5 signature: cbb0f2de6076dbed8f2cd91097dbd947 ****/
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
		/**** md5 signature: cd0f1b4fe80c892227e65eb7256dde7c ****/
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
		/**** md5 signature: 20492aaa4dc299bd67a1910947dfdc5e ****/
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
		/**** md5 signature: 44a67375acd0858955b64bd37ff52347 ****/
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
		/**** md5 signature: f1f2af05c4712705f3e1b45bd7a9a406 ****/
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
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor (waiting for memory management).

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Fastof ******************/
		/**** md5 signature: 2de3aa8dfb81cfc084890473f14c218d ****/
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
		/**** md5 signature: fb2560ab5021a7b300ace6b22efac7bc ****/
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
		/**** md5 signature: bfb17402e023749815f9bb51607f8362 ****/
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
		/**** md5 signature: 6ebd932c81cca5f3fefd96348c513a41 ****/
		%feature("compactdefaultargs") IsErrorLoad;
		%feature("autodoc", "Returns true if the status 'error load' has been set (to true or false).

Returns
-------
bool
") IsErrorLoad;
		Standard_Boolean IsErrorLoad();

		/****************** IsParamDefined ******************/
		/**** md5 signature: ed3dab666107da204e7759a1b035a969 ****/
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
		/**** md5 signature: ab5845a31867507585d5d3908ca3a16a ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns the count of entities. depending of each norm, records can be entities or subparts (sublist in step, subgroup in set ...). nbentities counts only entities, not subs used for memory reservation in interfacemodel default implementation uses findnextrecord can be redefined into a more performant way.

Returns
-------
int
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****************** NbParams ******************/
		/**** md5 signature: 444b962634792441aa4386da72bb86a3 ****/
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
		/**** md5 signature: 4cdd54a49baca0bb87c9a76a070d4161 ****/
		%feature("compactdefaultargs") NbRecords;
		%feature("autodoc", "Returns the count of registered records that is, value given for initialization (can be redefined).

Returns
-------
int
") NbRecords;
		virtual Standard_Integer NbRecords();

		/****************** Param ******************/
		/**** md5 signature: 01d82022cc2948d2e6b9cd579181f8e4 ****/
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
		/**** md5 signature: 56f6b32baee7265ac54bb79c5669632b ****/
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
		/**** md5 signature: 7e8a196be284eb0e3e1b2a2dbd45f003 ****/
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
		/**** md5 signature: cf6bb15954cc88ad7b3d34301ce9dd64 ****/
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
		/**** md5 signature: 93ae7fc0b31be5ae384b53b3e789927c ****/
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
		/**** md5 signature: f6838b8aab8ad4ba5ebb10d0df766162 ****/
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
		/**** md5 signature: da09bb21c50e10920acb7bee59692444 ****/
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
		/**** md5 signature: ff1f2143e5d4f24f07df049dd98c3ec3 ****/
		%feature("compactdefaultargs") ResetErrorLoad;
		%feature("autodoc", "Returns the former value of status 'error load' then resets it used to read the status then ensure it is reset.

Returns
-------
bool
") ResetErrorLoad;
		Standard_Boolean ResetErrorLoad();

		/****************** SetErrorLoad ******************/
		/**** md5 signature: 0317d8fd41572c2017db42b6762a896b ****/
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
		/**** md5 signature: 2948cd7887037c996e67b001b8ecce1c ****/
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
		/**** md5 signature: 8991919de54e808e3c29871e15369043 ****/
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
		/**** md5 signature: ea0231aaf37d47bdb27fe7301b32e5f7 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear filelds.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Data ******************/
		/**** md5 signature: 49aab703e17779aa888cdea315837d69 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the filereaderdata which is used to work.

Returns
-------
opencascade::handle<Interface_FileReaderData>
") Data;
		opencascade::handle<Interface_FileReaderData> Data();

		/****************** EndRead ******************/
		/**** md5 signature: c5425c5baff54d6d611eb77a975e4457 ****/
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
		/**** md5 signature: 8cd52cc3593d14fa4239b9d171ad1cc0 ****/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Returns errorhandle flag.

Returns
-------
bool
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****************** LoadModel ******************/
		/**** md5 signature: 995ec1cbe3fa773a68344ea7366dfca3 ****/
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
		/**** md5 signature: 6c28966f22e0448001189f7322930ddf ****/
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
		/**** md5 signature: c51845cdafadb143338935f519a3d7c7 ****/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Returns messenger used for outputting messages. the returned object is guaranteed to be non-null; default is message::messenger().

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****************** Model ******************/
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the stored model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NewModel ******************/
		/**** md5 signature: ffdc5f59840456ad78fada00ad126d58 ****/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates an empty model of the norm. uses protocol to do it.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Protocol ******************/
		/**** md5 signature: 1441632a4f2333f871a63bf366a58f3e ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol given at creation time.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****************** Recognize ******************/
		/**** md5 signature: 9f38dcf5fb1595ae7483daff0d787242 ****/
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
		/**** md5 signature: 43604696c88d235293f2a7286a049315 ****/
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
		/**** md5 signature: 4d43cc70376bf1ba45d9a38d1f369c8d ****/
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
		/**** md5 signature: 6829df1058b14254ac43288db26b08c1 ****/
		%feature("compactdefaultargs") SetEntities;
		%feature("autodoc", "Fills records with empty entities; once done, each entity can ask the filereadertool for any entity referenced through an identifier. calls recognize which is specific to each specific type of filereadertool.

Returns
-------
None
") SetEntities;
		void SetEntities();

		/****************** SetErrorHandle ******************/
		/**** md5 signature: cea15a20003832113608c312ef431fa6 ****/
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
		/**** md5 signature: a9749da4085afccb49a47ccebbb86045 ****/
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
		/**** md5 signature: 4df40e0b744cd676e093c21750a0c572 ****/
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
		/**** md5 signature: b2d3fab409a6e2832ea6fb56a22812c1 ****/
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
		/**** md5 signature: 71a5f63811c28c261ef1f9e77d8b2618 ****/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Returns trace level used for outputting messages.

Returns
-------
int
") TraceLevel;
		Standard_Integer TraceLevel();

		/****************** UnknownEntity ******************/
		/**** md5 signature: e1212622c449569754bddae17d05661d ****/
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
		/**** md5 signature: 022ac7db62033741bbe1ea50a9edbdce ****/
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
		/**** md5 signature: b67fef250ce64c3c0c648b18db37f72c ****/
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
		/**** md5 signature: 4c66511040ab21973efd4fb8a5336a70 ****/
		%feature("compactdefaultargs") FormatForRange;
		%feature("autodoc", "Returns the format for range, if set meaningful only if <range> from options is true was c++ : return const.

Returns
-------
char *
") FormatForRange;
		const char * FormatForRange();

		/****************** MainFormat ******************/
		/**** md5 signature: d5f20ec9bffc0b0df53410e928ed4e20 ****/
		%feature("compactdefaultargs") MainFormat;
		%feature("autodoc", "Returns the main format was c++ : return const.

Returns
-------
char *
") MainFormat;
		const char * MainFormat();

		/****************** Options ******************/
		/**** md5 signature: 0f9f7a2d709a585ab79f1b8ab7b7da24 ****/
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
		/**** md5 signature: fd7085146d9f759589ce4b06625f6361 ****/
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
		/**** md5 signature: e09be756d5e71f033f39c42255999e72 ****/
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
		/**** md5 signature: dae1e339fb84d300b23b00a19e3bdceb ****/
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
		/**** md5 signature: 37a02e3338eee7e275b19584090a7212 ****/
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
		/**** md5 signature: 59b8b728e9dea7c104d93078939a8f17 ****/
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
		/**** md5 signature: d447996be6706f4a0b8afd8e40dacd2a ****/
		%feature("compactdefaultargs") Interface_GTool;
		%feature("autodoc", "Creates an empty, not set, gtool.

Returns
-------
None
") Interface_GTool;
		 Interface_GTool();

		/****************** Interface_GTool ******************/
		/**** md5 signature: 7d65dec81ae8d78db722f997cc8c0b18 ****/
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
		/**** md5 signature: 90404488abdcf1cf8bf25e6c045c694c ****/
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "Clears the maps which record, for each already recorded entity its module and case number.

Returns
-------
None
") ClearEntities;
		void ClearEntities();

		/****************** Lib ******************/
		/**** md5 signature: 18692df48b34b8e9f55d362fa00f1cf8 ****/
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "Returns the generallib itself.

Returns
-------
Interface_GeneralLib
") Lib;
		Interface_GeneralLib & Lib();

		/****************** Protocol ******************/
		/**** md5 signature: 1441632a4f2333f871a63bf366a58f3e ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol. warning : it can be null.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****************** Reservate ******************/
		/**** md5 signature: a6488dc43344714c8373a9496f5dba2a ****/
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
		/**** md5 signature: 79205ee17a76fbfb6a9fbbe9fe1a3799 ****/
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
		/**** md5 signature: 7a71abccdd374448d4d493b6cc90407c ****/
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
		/**** md5 signature: a41aae67f5d11d1183e403f69f4a9291 ****/
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
		/**** md5 signature: c80dec5f02b4d9bc775dd97b309227ce ****/
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "Returns the name of the signtype, or 'class name'.

Returns
-------
char *
") SignName;
		const char * SignName();

		/****************** SignType ******************/
		/**** md5 signature: a97b35b4b087c5effacf0c1cc3ab8526 ****/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "Returns the signtype. can be null.

Returns
-------
opencascade::handle<Interface_SignType>
") SignType;
		opencascade::handle<Interface_SignType> SignType();

		/****************** SignValue ******************/
		/**** md5 signature: b369e52ecf603b4cf3d9679e9dbc0ad6 ****/
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
		/**** md5 signature: 8f7d43b287cf0d73133272e9eefa2c79 ****/
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
		/**** md5 signature: 2e5af17300a8a9ababda5ad49844e979 ****/
		%feature("compactdefaultargs") Interface_GeneralLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") Interface_GeneralLib;
		 Interface_GeneralLib();

		/****************** AddProtocol ******************/
		/**** md5 signature: 97bedbaaa5336e800a60d78a56ab8c60 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		/**** md5 signature: 786fb9d122db15779294d93c1e06036b ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<Interface_GeneralModule>
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		/**** md5 signature: c905586547d9ad373f87bcb2ce1d329f ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** Select ******************/
		/**** md5 signature: 66c3385afed283d61a6402b185664c2a ****/
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
		/**** md5 signature: 9b2529d2e257b2464fe4d8064a8a0171 ****/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
		/**** md5 signature: 2b2293c98b9172bae197316c65be22d5 ****/
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
		/**** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ****/
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
		/**** md5 signature: 0c59338e969e3e17aec56ffbfef71f8c ****/
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
		/**** md5 signature: 136d8c82c810f302ff4fd533b01e3f76 ****/
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
		/**** md5 signature: 01815a85d533821d13b510ff163b51a7 ****/
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
		/**** md5 signature: 60b767f98105cd501c4069f53a650f7d ****/
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
		/**** md5 signature: 1e8c602eed940595804d6538a183911f ****/
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
		/**** md5 signature: c18d1339d1d991cc01a62ac3534c9c23 ****/
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
		/**** md5 signature: b4e98b5dbf7df653c06918f56463af8d ****/
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
		/**** md5 signature: 020a277801f8e5db4642c90712650bbb ****/
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
		/**** md5 signature: 9bbb8c5e9444c92c9aa384b239c90a88 ****/
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
		/**** md5 signature: 250c362cd39947a2262d119d4f6e8618 ****/
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
		/**** md5 signature: bb124a1f433035df781a2ef5969f8555 ****/
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
		/**** md5 signature: cf68997b9516102da0b47eaf9e006411 ****/
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
		/**** md5 signature: 2dd5da909ccb2b579d7ef3904f8b31db ****/
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
		/**** md5 signature: b53143412198cfa30a2430c8c7452b28 ****/
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
		/**** md5 signature: 6b78c36a5656a6d73b50c68135a2b6d4 ****/
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
		/**** md5 signature: 004504aeea0aa4a254103c28e7783208 ****/
		%feature("compactdefaultargs") Interface_GlobalNodeOfGeneralLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") Interface_GlobalNodeOfGeneralLib;
		 Interface_GlobalNodeOfGeneralLib();

		/****************** Add ******************/
		/**** md5 signature: 52a71ed7b2dcafa006109d66faa88607 ****/
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
		/**** md5 signature: 786fb9d122db15779294d93c1e06036b ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<Interface_GeneralModule>
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: b0be6825d69567690d78e706e2027f21 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_GlobalNodeOfGeneralLib>
") Next;
		const opencascade::handle<Interface_GlobalNodeOfGeneralLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: c905586547d9ad373f87bcb2ce1d329f ****/
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
		/**** md5 signature: 82c1cb743d14c2075c02b445aa26388d ****/
		%feature("compactdefaultargs") Interface_GlobalNodeOfReaderLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") Interface_GlobalNodeOfReaderLib;
		 Interface_GlobalNodeOfReaderLib();

		/****************** Add ******************/
		/**** md5 signature: 9c33b501cc7aba278ca4c14a3d8c84e0 ****/
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
		/**** md5 signature: ee4e5065695c1821dd69ceb165b67caf ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<Interface_ReaderModule>
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: 0a362545d2eb46b8ee0501bb8c9630fb ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_GlobalNodeOfReaderLib>
") Next;
		const opencascade::handle<Interface_GlobalNodeOfReaderLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: c905586547d9ad373f87bcb2ce1d329f ****/
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
		/**** md5 signature: 0275f2c13add0e6ada4df7a5ab2b291a ****/
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
		/**** md5 signature: 41d9670526e656e678d6bf65c28e363a ****/
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
		/**** md5 signature: b61dbaaf54a955cd3bddd3309de9ca6c ****/
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
		/**** md5 signature: e7ee70b3414e84aa5e75fd6322da3baa ****/
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
		/**** md5 signature: 2083e68225a9e6168cd87f137b0e3844 ****/
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
		/**** md5 signature: 6afca68ff9833e671b4be2be9243cbd9 ****/
		%feature("compactdefaultargs") BitMap;
		%feature("autodoc", "Returns the bit map in order to read or edit flag values.

Returns
-------
Interface_BitMap
") BitMap;
		const Interface_BitMap & BitMap();

		/****************** CBitMap ******************/
		/**** md5 signature: 15f5051286ba99cc042d93116415aa43 ****/
		%feature("compactdefaultargs") CBitMap;
		%feature("autodoc", "Returns the bit map in order to edit it (add new flags).

Returns
-------
Interface_BitMap
") CBitMap;
		Interface_BitMap & CBitMap();

		/****************** ChangeStatus ******************/
		/**** md5 signature: 82819e9cb729a87e3c8360e4b60cc647 ****/
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
		/**** md5 signature: fe6771707abbc72dabd1d83eab337657 ****/
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
		/**** md5 signature: 4257559df5e64edec8716b8bacc8af3a ****/
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
		/**** md5 signature: 31891fd23708ae104ac2c5d6422e8937 ****/
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
		/**** md5 signature: 418999aa71dd53d9afa78651d6d0a47e ****/
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
		/**** md5 signature: ae6a9a559f58dc138ed87b411e11d722 ****/
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
		/**** md5 signature: 418d34704ccd99f0633d30895e747dbc ****/
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
		/**** md5 signature: 294061522bd198df9200ca94bd5be5a5 ****/
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
		/**** md5 signature: 3165a82e20f374e686a5cf0ea806604e ****/
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
		/**** md5 signature: 25e999deabc386be45884b4b74d134d3 ****/
		%feature("compactdefaultargs") GetFromModel;
		%feature("autodoc", "Loads graph with all entities contained in the model.

Returns
-------
None
") GetFromModel;
		void GetFromModel();

		/****************** GetShareds ******************/
		/**** md5 signature: be5529afe561d5bd1bd6933a1651fcf8 ****/
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
		/**** md5 signature: 85faeb2b2f9d4bc53d56541c9ab8dc2a ****/
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
		/**** md5 signature: b9b55c8ec1b92fcbdf33830713fe3c72 ****/
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
		/**** md5 signature: 08af4067390184e0c6e9dcc44f1f204b ****/
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
		/**** md5 signature: aa90c7192d821ba5ec6af7a1dff13c2a ****/
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
		/**** md5 signature: d0863ee0605b2f76e4ecd849fb34078d ****/
		%feature("compactdefaultargs") ModeStat;
		%feature("autodoc", "Returns mode resposible for computation of statuses;.

Returns
-------
bool
") ModeStat;
		Standard_Boolean ModeStat();

		/****************** Model ******************/
		/**** md5 signature: 7883272628747d0cc1230b6871802da7 ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model with which this graph was created.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****************** Name ******************/
		/**** md5 signature: 35b5790ba05c4a2997c3061615e9b3cb ****/
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
		/**** md5 signature: e20ed4e9671fcde690f46a12623b705b ****/
		%feature("compactdefaultargs") NbStatuses;
		%feature("autodoc", "Returns size of array of statuses.

Returns
-------
int
") NbStatuses;
		Standard_Integer NbStatuses();

		/****************** RemoveItem ******************/
		/**** md5 signature: ffd0c00631edd52da4bf51d8f077bbce ****/
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
		/**** md5 signature: eae772beea7560c66e9214dd83a30e46 ****/
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
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Erases data, making graph ready to rebegin from void (also resets shared lists redefinitions).

Returns
-------
None
") Reset;
		void Reset();

		/****************** ResetStatus ******************/
		/**** md5 signature: 88223281f0684fd4d3240d18db72f6d0 ****/
		%feature("compactdefaultargs") ResetStatus;
		%feature("autodoc", "Erases status (values and flags of presence), making graph ready to rebegin from void. does not concerns shared lists.

Returns
-------
None
") ResetStatus;
		void ResetStatus();

		/****************** RootEntities ******************/
		/**** md5 signature: 63cd32bddc79c5ff7cf79d39668774c9 ****/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Returns the entities which are not shared (their sharing list is empty) in the model.

Returns
-------
Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities();

		/****************** SetStatus ******************/
		/**** md5 signature: 029712b154eb915b22d51cf3198eeaf1 ****/
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
		/**** md5 signature: d7f3cd187cff94c69bea537ec01567d5 ****/
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
		/**** md5 signature: 2bac1d4e04fc72fe327f0913adc89070 ****/
		%feature("compactdefaultargs") SharingTable;
		%feature("autodoc", "Returns the table of sharing lists. used to create another graph from <self>.

Returns
-------
opencascade::handle<TColStd_HArray1OfListOfInteger>
") SharingTable;
		const opencascade::handle<TColStd_HArray1OfListOfInteger> & SharingTable();

		/****************** Sharings ******************/
		/**** md5 signature: 561a9bb8187bfa6649f3c1fcaacdaeed ****/
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
		/**** md5 signature: a263c9cd5bbf3a30f07620f6c5b86b83 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns size (max nb of entities, i.e. model's nb of entities).

Returns
-------
int
") Size;
		Standard_Integer Size();

		/****************** Status ******************/
		/**** md5 signature: fe83936279a1a53fbd5bae4ee4fd0684 ****/
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
		/**** md5 signature: b4490a19ff7734ca033f4de70617288c ****/
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
		/**** md5 signature: 0513d289715c599c31389ba0f193b9af ****/
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
		/**** md5 signature: 893b557ade4e8ce58a33915e14410d5d ****/
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
		/**** md5 signature: 1753e0a665aac413a87d04faed9bfdb6 ****/
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
		/**** md5 signature: 76bfa8f56a06bbb74e3664d95938323c ****/
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
		/**** md5 signature: a93d94da3e923059b4042e8143bb32ba ****/
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
		/**** md5 signature: bec710075a9272715539ab2d07af5ab2 ****/
		%feature("compactdefaultargs") CGraph;
		%feature("autodoc", "Same as above, but for read-write operations then, the graph will be modified in the hgraph itself.

Returns
-------
Interface_Graph
") CGraph;
		Interface_Graph & CGraph();

		/****************** Graph ******************/
		/**** md5 signature: 6a234e0475ae0da1c7d268d231e44a78 ****/
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
		/**** md5 signature: ec19d550108932b5224831f711a35e62 ****/
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "Creates empty intlist.

Returns
-------
None
") Interface_IntList;
		 Interface_IntList();

		/****************** Interface_IntList ******************/
		/**** md5 signature: b37c4bb58fbfdd8d36320b3b6f99833a ****/
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
		/**** md5 signature: 0480cadde3c17e0eb1407b9c7b192303 ****/
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
		/**** md5 signature: cd60596a44a700fa317ebf8f8b1e5827 ****/
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
		/**** md5 signature: f5e018890a3a2a3b5a3f546e318cb26f ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all data, hence each entity number has an empty list.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Initialize ******************/
		/**** md5 signature: c237fd6b5333f84217375f02f49572be ****/
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
		/**** md5 signature: fd1babce4b67ac99ebe23a987a453b4d ****/
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
		/**** md5 signature: 2634d7efe5f57981ef79cc93aa14462d ****/
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
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the count of refs attached to current entity number.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** List ******************/
		/**** md5 signature: 57597a0a72ee1575151f494c25e4c3eb ****/
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
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of entities to be aknowledged.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** Number ******************/
		/**** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ****/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns the current entity number.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** Remove ******************/
		/**** md5 signature: 37f5a5cdb681cc08ea6f88bf3c6c2dca ****/
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
		/**** md5 signature: 364547d2a05c1bcc458abef36a679601 ****/
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
		/**** md5 signature: c6d2ce641f4ae51c5143271bfac46e17 ****/
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
		/**** md5 signature: 85e23abe597a6ad027059592ad519319 ****/
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
		/**** md5 signature: 7cabdf15a91372eeafa0e8650fea706f ****/
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
		/**** md5 signature: ef9afc62c16e7d8be71a9016548b2389 ****/
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
		/**** md5 signature: 05fc265cb59323c6464c768349b7da1b ****/
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
		/**** md5 signature: c6d99989077b92200f0377d8b792ba0b ****/
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
		/**** md5 signature: 36660b5c5ccaf3658f088997f413ed03 ****/
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
		/**** md5 signature: cfa374c9a5be1ceb7121eedcea8196e0 ****/
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
		/**** md5 signature: 7141d3692dcc02334df27c34d6ede76b ****/
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
		/**** md5 signature: 8d0c9dd877a8f5c4dd4c3893f6965246 ****/
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
		/**** md5 signature: 733b542fd82fe1a253419fba3ab93c40 ****/
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
		/**** md5 signature: c04739821ee1601715da6f534bdedafe ****/
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
		/**** md5 signature: 09115a1570cd7299c84cb92ee414ba1b ****/
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
		/**** md5 signature: ecfbc87eedd38d86f1a42b818ec4cee7 ****/
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
		/**** md5 signature: 5c848fa4e9ca29e4e7b7a55157f5d8c4 ****/
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
		/**** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Erases contained data; used when a model is copied to others : the new copied ones begin from clear clear calls specific method clearheader (see below).

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClearEntities ******************/
		/**** md5 signature: 290376598adc8dd87baf57964ef808e5 ****/
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "Clears the entities; uses the general service whendelete, in addition to the standard memory manager; can be redefined.

Returns
-------
None
") ClearEntities;
		virtual void ClearEntities();

		/****************** ClearHeader ******************/
		/**** md5 signature: 2d2d6c6f650c81db4fbe3d0ba2eaa00b ****/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Clears model's header : specific to each norm.

Returns
-------
None
") ClearHeader;
		virtual void ClearHeader();

		/****************** ClearLabels ******************/
		/**** md5 signature: 25c392ea756509d2f11c0754fb09a6d0 ****/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Erases informations about labels, if any : specific to each norm.

Returns
-------
None
") ClearLabels;
		virtual void ClearLabels();

		/****************** ClearReportEntity ******************/
		/**** md5 signature: caece735d9030fe4491e05e5614741b1 ****/
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
		/**** md5 signature: 86d9b2cd7c6aab5b29da3a6398f95c37 ****/
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
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
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
		/**** md5 signature: 8df0907e92ad6d18b111cf1a8a1a66b3 ****/
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
		/**** md5 signature: 5b7a9453b66b65586915cfb6dcb67a37 ****/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Returns the list of all entities, as an iterator on entities (the entities themselves, not the reports).

Returns
-------
Interface_EntityIterator
") Entities;
		Interface_EntityIterator Entities();

		/****************** EntityState ******************/
		/**** md5 signature: 8832d46c1ee04c5248c965fe8ea44bdc ****/
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
		/**** md5 signature: e32e298c5181f5a878a91b9da55bfb78 ****/
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
		/**** md5 signature: 40e1fc0a50fdfc3138757138d2820d80 ****/
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
		/**** md5 signature: 442168885b1e4cac37d4ca65310561d7 ****/
		%feature("compactdefaultargs") GTool;
		%feature("autodoc", "Returns the gtool, set by setprotocol or by setgtool.

Returns
-------
opencascade::handle<Interface_GTool>
") GTool;
		opencascade::handle<Interface_GTool> GTool();

		/****************** GetFromAnother ******************/
		/**** md5 signature: 2b999b3d9af826c9b51624ead382edcb ****/
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
		/**** md5 signature: b546874e810498b992cf5d8486c6d36f ****/
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
		/**** md5 signature: 07ea4d2b31d05f75a8ce725bb91a30f1 ****/
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
		/**** md5 signature: 25996bc5ed2fb63f583d93c6a05d5b3a ****/
		%feature("compactdefaultargs") HasSemanticChecks;
		%feature("autodoc", "Returns true if semantic checks have been filled.

Returns
-------
bool
") HasSemanticChecks;
		Standard_Boolean HasSemanticChecks();

		/****************** HasTemplate ******************/
		/**** md5 signature: b06e71ec5ad78b50c72b6246c9763170 ****/
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
		/**** md5 signature: 9a0553bfba8f28a3e309e7419a8bf0b2 ****/
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
		/**** md5 signature: 2d2b05e5e8de661ff25d445ddf8f7cb9 ****/
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
		/**** md5 signature: 8a51fbfcbc8281bc9537df0d8f270f72 ****/
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
		/**** md5 signature: 33f8ad771959bb49a6c2ad1988bd484a ****/
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
		/**** md5 signature: 2c47e2ad24fb7574a13bdb719e3129de ****/
		%feature("compactdefaultargs") ListTemplates;
		%feature("autodoc", "Returns the complete list of names attached to template models.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") ListTemplates;
		static opencascade::handle<TColStd_HSequenceOfHAsciiString> ListTemplates();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of contained entities.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbTypes ******************/
		/**** md5 signature: 2114040d9f988eb8e8a24fa970513b31 ****/
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
		/**** md5 signature: b02638b80473ee01c47c59397cf9207f ****/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Returns a new empty model, same type as <self> (whatever its type); called to copy parts a model into other ones, then followed by a call to getfromanother (header) then filling with specified entities, themselves copied.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewEmptyModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****************** NextNumberForLabel ******************/
		/**** md5 signature: 8f59fe41365cb072f36e69eb064247b9 ****/
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
		/**** md5 signature: f25a1d68cbbad3b088f5d847de3ffede ****/
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
		/**** md5 signature: 25c8209887a6bed474cd6edd79e50a11 ****/
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
		/**** md5 signature: cc0f3cd689c9caf57b9c93d09b536818 ****/
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
		/**** md5 signature: e6a6964b1dc069246171a71615d9185c ****/
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
		/**** md5 signature: 2dce80af32cedc07d353d312ab7e2c73 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol which has been set by setprotocol, or addwithrefs with protocol.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		virtual opencascade::handle<Interface_Protocol> Protocol();

		/****************** Redefineds ******************/
		/**** md5 signature: 9237c4996df81ce3ec342e4fde1775ed ****/
		%feature("compactdefaultargs") Redefineds;
		%feature("autodoc", "Returns the list of reportentities which redefine data (generally, if concerned entity is 'error', a literal content is added to it : this is a 'redefined entity'.

Returns
-------
Interface_EntityIterator
") Redefineds;
		Interface_EntityIterator Redefineds();

		/****************** ReplaceEntity ******************/
		/**** md5 signature: d6293134eba6b588440f32634f39e804 ****/
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
		/**** md5 signature: ddc1c48add2352efbffabcf415ec0d82 ****/
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
		/**** md5 signature: 7dcbd1cdc4196a34ee9cc60f3720069c ****/
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
		/**** md5 signature: 6f07eeb3c9145319791e01dbbf310cf9 ****/
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
		/**** md5 signature: 4dcab9ca5675a7721a6366662a3fb695 ****/
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
		/**** md5 signature: 0de38faf7d2d0456d0b564ba5cc882c6 ****/
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
		/**** md5 signature: 426fee21a6a5a7870be99f65c2ee1aa3 ****/
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
		/**** md5 signature: b9ac7c37d00ace1f24e5ca276842e825 ****/
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
		/**** md5 signature: 2468c79c489a1445180ccb57ff37a4b0 ****/
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
		/**** md5 signature: 47b9d0b16e3a849d4ba4e5137695613e ****/
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
		/**** md5 signature: 946918dd1dfae5599e9388cb399b596a ****/
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
		/**** md5 signature: 31c0b3f4364a8064ca7024a2a736f259 ****/
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
		/**** md5 signature: 3304d8ba4bb5c09675517f94d9d091c3 ****/
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
		/**** md5 signature: da60bf49fd753ae14bcafada17bba312 ****/
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
		/**** md5 signature: 6373a0a5f8f4cdd443caf338fdcd04a8 ****/
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
		/**** md5 signature: a291325b4e5caa2a5ab946934090ec8b ****/
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
		/**** md5 signature: 2f1dfe74657145cf0073cfba1684e844 ****/
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
		/**** md5 signature: 4cdbf84bbb8d172c7bfdf161780c1eba ****/
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
		/**** md5 signature: 5c01da915f25c93071b431b3f7ef2eca ****/
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
		/**** md5 signature: 881da44d801a4bde276a120320281d38 ****/
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
		/**** md5 signature: 44e9d546aa4891e8b4d514c71dd12e4a ****/
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
		/**** md5 signature: 09c9ed86e8cab71a163a455eb49a769d ****/
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
		/**** md5 signature: c90da290ebabc1722b6f88371ad4504a ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears completely the linebuffer.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Content ******************/
		/**** md5 signature: da26760e5fb7431e97c1e9a66278100f ****/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Returns the content of the linebuffer.

Returns
-------
char *
") Content;
		const char * Content();

		/****************** FreezeInitial ******************/
		/**** md5 signature: dbf139b695534a1365987a2862b1ca6a ****/
		%feature("compactdefaultargs") FreezeInitial;
		%feature("autodoc", "Inhibits effect of setinitial until the next move (i.e. keep) then prepare will not insert initial blanks, but further ones will. this allows to cancel initial blanks on an internal split a call to setinitial has no effect on this until move.

Returns
-------
None
") FreezeInitial;
		void FreezeInitial();

		/****************** Length ******************/
		/**** md5 signature: f2d149cffca76ec002490404b3e808e1 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the linebuffer.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Move ******************/
		/**** md5 signature: 52b2fbc1473ae88a85a1baac6aa8cced ****/
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
		/**** md5 signature: 6419cf4f874e6c5de19972a46c8093f2 ****/
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
		/**** md5 signature: 1436c75d7c1b6cb7f8d6f09dadd0b398 ****/
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "Same as above, but generates the hasciistring.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Moved;
		opencascade::handle<TCollection_HAsciiString> Moved();

		/****************** SetInitial ******************/
		/**** md5 signature: 6d58812e5a742367fc4745b4777bddbc ****/
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
		/**** md5 signature: 83f5e8d529bc280c88f0ac23cf9c718b ****/
		%feature("compactdefaultargs") SetKeep;
		%feature("autodoc", "Sets a keep status at current length. it means that at next move, the new line will begin by characters between keep + 1 and current length.

Returns
-------
None
") SetKeep;
		void SetKeep();

		/****************** SetMax ******************/
		/**** md5 signature: 87c4c922204a679f3662057e4a91f350 ****/
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
		/**** md5 signature: 04a5264e61423cc57b6a1ff68915b6bf ****/
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
		/**** md5 signature: 8fef5720569bdcbf8f66102a1bcd3773 ****/
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
		/**** md5 signature: b704e9e172b160d189e3aae96cf60977 ****/
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
		/**** md5 signature: 39d5887ce5b9e3f190368eb9565041a7 ****/
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
		/**** md5 signature: a2f1c0137cdd8a92831417c5462bb4ac ****/
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
		/**** md5 signature: 8e2b0e98eefb8d62808c6366cf59b6c7 ****/
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
		/**** md5 signature: cbb8c4b37e8156925f73c160286da4ff ****/
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
		/**** md5 signature: a27333232482e7c6487dfb04b0ad78af ****/
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
		/**** md5 signature: 0e8c564f928f260c2991324aa3b7b503 ****/
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
		/**** md5 signature: 87ef2d72f27848bc913516356143b696 ****/
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
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Optimised destructor (applies for additional forms of create).

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Intervalled ******************/
		/**** md5 signature: e4c9aeb91835b2908a66a08b0440622e ****/
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
		/**** md5 signature: e0815ed8b6506b4eb3f582c4ad557426 ****/
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
		/**** md5 signature: eeb2f5af5a033fa1528f872cb3fd2fa2 ****/
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
		/**** md5 signature: 858a3ab50e2d14b2c69b3dde90ff0915 ****/
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
		/**** md5 signature: 57cce17521acc7b079a4a53ccae00972 ****/
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
		/**** md5 signature: b14fe630786054e523f862ea57aaf3ad ****/
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
		/**** md5 signature: 952f5a6e86a025207fa89158cf3a7bb0 ****/
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
		/**** md5 signature: e8cc703373ff0bd4920d29504dfa08bf ****/
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
		/**** md5 signature: c9597bb549cfddf798fd1bc9a797094c ****/
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
		/**** md5 signature: e8ad3e0eb6ba1377e7d5d00bb4ae5215 ****/
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
		/**** md5 signature: e2da36afc8f40403f8d6004d8f435bb2 ****/
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
		/**** md5 signature: 35e2d5de13dedd4a3cad858a55372251 ****/
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
		/**** md5 signature: b52c0341579621739870213e13925863 ****/
		%feature("compactdefaultargs") Interface_NodeOfGeneralLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") Interface_NodeOfGeneralLib;
		 Interface_NodeOfGeneralLib();

		/****************** AddNode ******************/
		/**** md5 signature: 2b5e7f65eeae1b8a04ccce75ba8f30e8 ****/
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
		/**** md5 signature: 786fb9d122db15779294d93c1e06036b ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<Interface_GeneralModule>
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: f4703661a70ab405f55a3a493a07aa3d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_NodeOfGeneralLib>
") Next;
		const opencascade::handle<Interface_NodeOfGeneralLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: c905586547d9ad373f87bcb2ce1d329f ****/
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
		/**** md5 signature: f83b980811fbfe5223fa65e10445ded4 ****/
		%feature("compactdefaultargs") Interface_NodeOfReaderLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") Interface_NodeOfReaderLib;
		 Interface_NodeOfReaderLib();

		/****************** AddNode ******************/
		/**** md5 signature: e682845bab9f0ad9949e35b0a7eade5a ****/
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
		/**** md5 signature: ee4e5065695c1821dd69ceb165b67caf ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<Interface_ReaderModule>
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: 190c0410bd65df10af82886b13de3970 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<Interface_NodeOfReaderLib>
") Next;
		const opencascade::handle<Interface_NodeOfReaderLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: c905586547d9ad373f87bcb2ce1d329f ****/
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
		/**** md5 signature: fa22f878906433dd2e43f0b2deb4af1c ****/
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
		/**** md5 signature: e4421944ff2304a2e0ee257a1e10e1f2 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements of <self>.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower bound. warning.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** SetValue ******************/
		/**** md5 signature: 2a498ccff6a27a887665ac3ac4d82783 ****/
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
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper bound. warning.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: d29c7009230283aad1de36c2a391ae06 ****/
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
		/**** md5 signature: 86128b8ca41fe34b4b00734276016d1a ****/
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
		/**** md5 signature: 6df473310f93a04e1bdad84f4c47b22a ****/
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
		/**** md5 signature: 9fa5e37158f08c7bcfa7adde0474e56e ****/
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
		/**** md5 signature: 87258e99ccdae918a9d150888fa01878 ****/
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
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Destructor (waiting for transparent memory management).

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** NbParams ******************/
		/**** md5 signature: 826f4756fca7f780e6d976c60183d715 ****/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Returns the total count of parameters (including nexts).

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** Param ******************/
		/**** md5 signature: 1949a53b04a655a6338a187d5fcc5a80 ****/
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
		/**** md5 signature: e567d6332f33622017ba4bad2eb07dc3 ****/
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
		/**** md5 signature: 5ed10a82094e3c00e10cf64893729af7 ****/
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
		/**** md5 signature: ac2f57ce0f32b6604eeb6b435022b39c ****/
		%feature("compactdefaultargs") Active;
		%feature("autodoc", "Returns the active protocol, if defined (else, returns a null handle, which means 'no defined active protocol').

Returns
-------
opencascade::handle<Interface_Protocol>
") Active;
		static opencascade::handle<Interface_Protocol> Active();

		/****************** CaseNumber ******************/
		/**** md5 signature: 3bd7fad3575759d2b8624f3c1aea4aed ****/
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
		/**** md5 signature: eb7803a003eb79b2bf4d87bc993aa0bf ****/
		%feature("compactdefaultargs") ClearActive;
		%feature("autodoc", "Erases the active protocol (hence it becomes undefined).

Returns
-------
None
") ClearActive;
		static void ClearActive();

		/****************** GlobalCheck ******************/
		/**** md5 signature: 47cba6309a9fd154d60abc631f398f9c ****/
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
		/**** md5 signature: f4373a95f4c0e87bff704722f30ec5af ****/
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
		/**** md5 signature: c8cdcc13aac628ff657714e3f6014d38 ****/
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
		/**** md5 signature: 47ee5a51ccc521cdb34550721716d8b8 ****/
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
		/**** md5 signature: bef01036104619c58ab5a6ff9b039599 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Returns count of protocol used as resources (level one).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** NbTypes ******************/
		/**** md5 signature: ef3faaf596b1391c100a035b9879de7d ****/
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
		/**** md5 signature: 0b1be90749007fa9c3aadc3c17bc79c8 ****/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates an empty model of the considered norm.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Resource ******************/
		/**** md5 signature: 5ab5f1cb3c235f55188fa96d5b103d57 ****/
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
		/**** md5 signature: c76a58398abc9564e948ae5e77d8863a ****/
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
		/**** md5 signature: 5efb3ed3d5f07e443d940e9ce4dea4c2 ****/
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
		/**** md5 signature: 3ad63721d780561a40202c3ceb8b3449 ****/
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
		/**** md5 signature: 5e0083a65d62cab5e9ac76cb7160632d ****/
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
		/**** md5 signature: 9397aeeba35410106f91c6d54b8d2053 ****/
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
		/**** md5 signature: 220dce1c616bb912aa974e026d63c97e ****/
		%feature("compactdefaultargs") Interface_ReaderLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") Interface_ReaderLib;
		 Interface_ReaderLib();

		/****************** AddProtocol ******************/
		/**** md5 signature: 97bedbaaa5336e800a60d78a56ab8c60 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		/**** md5 signature: ee4e5065695c1821dd69ceb165b67caf ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<Interface_ReaderModule>
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		/**** md5 signature: c905586547d9ad373f87bcb2ce1d329f ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** Select ******************/
		/**** md5 signature: 497bfc4f63c715364b3e245ec65b9cfa ****/
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
		/**** md5 signature: 9b2529d2e257b2464fe4d8064a8a0171 ****/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
		/**** md5 signature: 6031cab62dcf6d29c852188796a5f886 ****/
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
		/**** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ****/
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
		/**** md5 signature: afda30338c3cf672ec56cf415b53acb8 ****/
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
		/**** md5 signature: 9690dce15c449ffdac5e561e315975d5 ****/
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
		/**** md5 signature: aa6a782fcb84cf576b0f1c9b9f4c6f00 ****/
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
		/**** md5 signature: 298b7c97f0e27125785198872d678e07 ****/
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
		/**** md5 signature: df80b3ed874c22eaae50d96b60781c56 ****/
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
		/**** md5 signature: 6e66cd51a221a5f9b18ffa07111f133d ****/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns the stored check in order to change it.

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> & CCheck();

		/****************** Check ******************/
		/**** md5 signature: 535183f491df1166f3d80ddd8b810a47 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the stored check.

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> & Check();

		/****************** Concerned ******************/
		/**** md5 signature: 31d23dfc04cb92b0681e4429e255836d ****/
		%feature("compactdefaultargs") Concerned;
		%feature("autodoc", "Returns the stored concerned entity. it equates the content in the case of an unknown entity.

Returns
-------
opencascade::handle<Standard_Transient>
") Concerned;
		opencascade::handle<Standard_Transient> Concerned();

		/****************** Content ******************/
		/**** md5 signature: 8f06554b5df01f4cef5ca6c131d633eb ****/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Returns the stored content, or a null handle remark that it must be an 'unknown entity' suitable for the norm of the containing model.

Returns
-------
opencascade::handle<Standard_Transient>
") Content;
		opencascade::handle<Standard_Transient> Content();

		/****************** HasContent ******************/
		/**** md5 signature: 139192491a3a3f3dbae7a9873a3beb19 ****/
		%feature("compactdefaultargs") HasContent;
		%feature("autodoc", "Returns true if a content is stored (it can equate concerned).

Returns
-------
bool
") HasContent;
		Standard_Boolean HasContent();

		/****************** HasNewContent ******************/
		/**** md5 signature: ca682f56104e3e248141935f535b6237 ****/
		%feature("compactdefaultargs") HasNewContent;
		%feature("autodoc", "Returns true if a content is stored and differs from concerned (i.e. redefines content) : used when concerned could not be loaded.

Returns
-------
bool
") HasNewContent;
		Standard_Boolean HasNewContent();

		/****************** IsError ******************/
		/**** md5 signature: c52b85ee17e423925f2cd97bf6879614 ****/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Returns true for an error entity, i.e. if the check brings at least one fail message.

Returns
-------
bool
") IsError;
		Standard_Boolean IsError();

		/****************** IsUnknown ******************/
		/**** md5 signature: 3664e7b68ca3ddc8f89b66fb416769e1 ****/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Returns true for an unknown entity, i,e. if the check is empty and concerned equates content.

Returns
-------
bool
") IsUnknown;
		Standard_Boolean IsUnknown();

		/****************** SetContent ******************/
		/**** md5 signature: 9e2dd6e409838943a5bdfa7ca9ba5cd6 ****/
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
		/**** md5 signature: 45e033643caee9f7e5dc73c369792e10 ****/
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
		/**** md5 signature: cb7d83a2fbadcfc6c6fe085b46e7cda4 ****/
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
		/**** md5 signature: 901e896e9fc7f2c7d6d35a838b9ae3fa ****/
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
		/**** md5 signature: 21cde4a1cc77e723291ed3b27cf07e1e ****/
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
		/**** md5 signature: ccb302c12ac3e5367aed0e7004aed292 ****/
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
		/**** md5 signature: fb2ee652f9985fe24d44f58655360e4e ****/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "Commands to declare the process ended (hence, advancement is forced to 100 %).

Returns
-------
None
") End;
		static void End();

		/****************** Internals ******************/
		/**** md5 signature: bc8ecc59db060541490d6f3fafb13d28 ****/
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
		/**** md5 signature: ca214add52f3821b26accc6fe7f36e0c ****/
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
		/**** md5 signature: e1b17d15380adbd776c306226045c0e0 ****/
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
		/**** md5 signature: 9b523c6521e8002ac47a539ba98e971b ****/
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
		/**** md5 signature: a06b9be16a1cd4fce846a9f6baf11cf8 ****/
		%feature("compactdefaultargs") NextStep;
		%feature("autodoc", "Commands to resume the preceeding step of the cycle ignored if count of steps is already passed nextitem can be called for this step, nextstep passes to next.

Returns
-------
None
") NextStep;
		static void NextStep();

		/****************** Percent ******************/
		/**** md5 signature: af9ed9ea0ad2a0be9e5817b4231b4e34 ****/
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
		/**** md5 signature: d890039f6e809714597defcff955c102 ****/
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
		/**** md5 signature: 2ff988852c3a26f437f261f22891edb5 ****/
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
		/**** md5 signature: 5adfcc185e821aace27048b2e90b6aee ****/
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
		/**** md5 signature: ac80112bbb6b5fae525d592607a8b728 ****/
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
		/**** md5 signature: f6be15730fe53ce056667df4e2f42266 ****/
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
		/**** md5 signature: 629e93f0486a39051b131b41dcb57749 ****/
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
		/**** md5 signature: 3b54045ed65f4b7cacde9cf182c8db5a ****/
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
		/**** md5 signature: 03df5fdb6716789d3f3c2dd21c6b7008 ****/
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
		/**** md5 signature: 8f8941d307658dae63d09634c406751e ****/
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
		/**** md5 signature: 5cf82d9e7fc5e21bbbd898a70e9402bc ****/
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
		/**** md5 signature: fb87355c221a29bfef4a7716e14429e5 ****/
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
		/**** md5 signature: 3e66d0a7cc6678e53c33e376ce31731a ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model used for the evaluation.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbRoots ******************/
		/**** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ****/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Returns the count of root entities.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Root ******************/
		/**** md5 signature: 4b8f069a9ea374ab5529724497f0d6e6 ****/
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
		/**** md5 signature: 63cd32bddc79c5ff7cf79d39668774c9 ****/
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
		/**** md5 signature: ef7c138e0fb84e0457b735e8476e91ca ****/
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
		/**** md5 signature: 9f0728a3ccc131f8a0ff0d5b4e01dafe ****/
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
		/**** md5 signature: 7524962121497ca46beced7d2935b3d5 ****/
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
		/**** md5 signature: 42327af9af7b69150f615441485ea2f5 ****/
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
		/**** md5 signature: 927bab793ffdcdd0792d3d0b4652e41d ****/
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
		/**** md5 signature: 1d933c78c10fafd47f3c117993302a04 ****/
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
		/**** md5 signature: b455c53620b389f3422e27d3f05c2e46 ****/
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
		/**** md5 signature: 6a234e0475ae0da1c7d268d231e44a78 ****/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns the data used by the sharetool to work can then be used directly (read only).

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

		/****************** IsShared ******************/
		/**** md5 signature: 3e66d0a7cc6678e53c33e376ce31731a ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model used for creation (directly or for graph).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbTypedSharings ******************/
		/**** md5 signature: eef551aa63b33d7e36b531ff2d17cf0a ****/
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
		/**** md5 signature: 632787ac6e1c4d45af8c619319f31120 ****/
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
		/**** md5 signature: 63cd32bddc79c5ff7cf79d39668774c9 ****/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Returns the entities which are not shared (their sharing list is empty) in the model.

Returns
-------
Interface_EntityIterator
") RootEntities;
		Interface_EntityIterator RootEntities();

		/****************** Shareds ******************/
		/**** md5 signature: d7f3cd187cff94c69bea537ec01567d5 ****/
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
		/**** md5 signature: 561a9bb8187bfa6649f3c1fcaacdaeed ****/
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
		/**** md5 signature: 2836ffecd2f16bf9dde6f5dabfce5fdd ****/
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
		/**** md5 signature: 9b29a88e8d714b586a7134f1ee0c12bd ****/
		%feature("compactdefaultargs") Interface_SignLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Interface_SignLabel;
		 Interface_SignLabel();

		/****************** Name ******************/
		/**** md5 signature: f35e373630f40191cc40cd61094fa98a ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns 'entity label'.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Text ******************/
		/**** md5 signature: 44c44c56f0e9da4d892db26a3852e369 ****/
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
		/**** md5 signature: 5c848fa4e9ca29e4e7b7a55157f5d8c4 ****/
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
		/**** md5 signature: 44c44c56f0e9da4d892db26a3852e369 ****/
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
		/**** md5 signature: 37c924359631a9d9e92ff35b3241caa4 ****/
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
		/**** md5 signature: 7c0c3d4173d57fce3bb947c56cac91e2 ****/
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
		/**** md5 signature: aee1d139dcd9a716445f9c7c79e55597 ****/
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
		/**** md5 signature: 47dd452537804ba27c0351c740f97ef5 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type i.e. calls valuetype then makes correspondance between paramtype from interface (which remains for compatibility reasons) and valuetype from monitool.

Returns
-------
Interface_ParamType
") Type;
		Interface_ParamType Type();

		/****************** ValueTypeToParamType ******************/
		/**** md5 signature: 03fb586ad085bc437a43df1d15b1dda6 ****/
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
		/**** md5 signature: 52380470e4dae639892aaa16535bd5b5 ****/
		%feature("compactdefaultargs") Interface_UndefinedContent;
		%feature("autodoc", "Defines an empty undefinedcontent.

Returns
-------
None
") Interface_UndefinedContent;
		 Interface_UndefinedContent();

		/****************** AddEntity ******************/
		/**** md5 signature: 9c6f708c0c7add83fe57b03ecc71aeee ****/
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
		/**** md5 signature: 42c39aaae211ba3460d3b8849e56c767 ****/
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
		/**** md5 signature: 4625df90b81c2aa3ad2b1dd9cd633919 ****/
		%feature("compactdefaultargs") EntityList;
		%feature("autodoc", "Returns globally the list of param entities. note that it can be used as shared entity list for the undefinedentity.

Returns
-------
Interface_EntityList
") EntityList;
		Interface_EntityList EntityList();

		/****************** GetFromAnother ******************/
		/**** md5 signature: b50ef3b4e3d7cc607524f9a4399fe516 ****/
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
		/**** md5 signature: edcc5f4164bf630a10b2eddc151d1934 ****/
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
		/**** md5 signature: 12a4f0bd43456f607e315fdcf241cb29 ****/
		%feature("compactdefaultargs") NbLiterals;
		%feature("autodoc", "Gives count of literal parameters.

Returns
-------
int
") NbLiterals;
		Standard_Integer NbLiterals();

		/****************** NbParams ******************/
		/**** md5 signature: 826f4756fca7f780e6d976c60183d715 ****/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Gives count of recorded parameters.

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** ParamData ******************/
		/**** md5 signature: 7ca464741028b870c741574661323ef4 ****/
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
		/**** md5 signature: 761c0b32c3eb0e5da7ddfca321a3322d ****/
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
		/**** md5 signature: 06805a954cdda33c70604680f220e0c5 ****/
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
		/**** md5 signature: 27f0f605c60e921cd93c878a3119e98b ****/
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
		/**** md5 signature: 4dc35dce4aeb1dd96c7a9f880db74227 ****/
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
		/**** md5 signature: 31af5568472447f72c79220748d7c500 ****/
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
		/**** md5 signature: 4b8efff936bc3f2ead61fab318587ce2 ****/
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
		/**** md5 signature: eb5e85918c8177aa1aa31acbc491ce44 ****/
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
		/**** md5 signature: 8072f1d179fb9b4fc930b8da855eda9b ****/
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
		/**** md5 signature: fa89544b2c0fbd11b7d29238b0368002 ****/
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
		/**** md5 signature: 6b8123ff1b872cf7eccc6ee384405fb1 ****/
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
		/**** md5 signature: 04e06e275d2bf51a1788968453d01f4e ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears transfer list. gets ready to begin another transfer.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Model ******************/
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the interfacemodel used at creation time.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** Search ******************/
		/**** md5 signature: 525f5a6e060d9bc49aafdc8e913d57c5 ****/
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
		/**** md5 signature: e56f30d1da280cb2263c4816c559fcb2 ****/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "Creates an empty graphcontent, ready to be filled.

Returns
-------
None
") Interface_GraphContent;
		 Interface_GraphContent();

		/****************** Interface_GraphContent ******************/
		/**** md5 signature: a36a6f6ccda585fc6089d779b7e3fe35 ****/
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
		/**** md5 signature: c01dd0557fc9fe949a43f6239fec04ec ****/
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
		/**** md5 signature: db03489b1aaddcde63f86d6f02e71726 ****/
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
		/**** md5 signature: 6411d2d9578e36d75460c7dda67b7440 ****/
		%feature("compactdefaultargs") Begin;
		%feature("autodoc", "Does the evaluation before starting the iteration itself (in out).

Returns
-------
None
") Begin;
		void Begin();

		/****************** Evaluate ******************/
		/**** md5 signature: 6640605754ea7f26f131a8bc46247338 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Evaluates list of entities to be iterated. called by start default is set to doing nothing : intended to be redefined by each sub-class.

Returns
-------
None
") Evaluate;
		virtual void Evaluate();

		/****************** GetFromGraph ******************/
		/**** md5 signature: ae6a9a559f58dc138ed87b411e11d722 ****/
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
		/**** md5 signature: 418d34704ccd99f0633d30895e747dbc ****/
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
		/**** md5 signature: 8c4c469fb1e25be9ad684d7b09b36228 ****/
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
		/**** md5 signature: a86af5cdb38073532a5a731958c23daf ****/
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
		/**** md5 signature: 1b796482a7cd04d278a7b9014840dcaa ****/
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
		/**** md5 signature: e75a32f8e0c4371af5746fcaf995304b ****/
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
		/**** md5 signature: 78193cb29df4c8b21b9e3de1ba97a96c ****/
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
		/**** md5 signature: c69de37306b0fd5e9cf300cae0c2b57b ****/
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "Returns the family. it can be : a resource name for applis, an internal name between : $e (environment variables), $l (other, purely local).

Returns
-------
char *
") Family;
		const char * Family();

		/****************** IDef ******************/
		/**** md5 signature: 809047165ba17b6256ca717fd657b669 ****/
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
		/**** md5 signature: d117b0899e16831696a0625d434eb539 ****/
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
		/**** md5 signature: 02eb0352d106423d698462902e8b3ea1 ****/
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
		/**** md5 signature: d38b0a501f52a64fdd63d9f5c82fde52 ****/
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
		/**** md5 signature: 739ef9f35758eeccd1fc8c726c993957 ****/
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
		/**** md5 signature: 7cb64b3795f4342b7c2866fe3401f982 ****/
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
		/**** md5 signature: 01f4e7e4af28f2ca518f5373d24756bb ****/
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
		/**** md5 signature: 368d94dc7edec3aecfc9c0963e7a3712 ****/
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
		/**** md5 signature: 093031bb6b70a2bb776aaca627f4a55c ****/
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
		/**** md5 signature: 916bf9a6651fba4b6f0c699767b5c1ed ****/
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
		/**** md5 signature: 0ac37808e24c6befe2c30c23a9b6a3e1 ****/
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
		/**** md5 signature: a57a08b3c5b23d03ffc49dcd7f055b8f ****/
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
		/**** md5 signature: 8c4a79176322045249fd27d78834411f ****/
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
		/**** md5 signature: 1cd883d27f7d4764a11bb187e2202572 ****/
		%feature("compactdefaultargs") SetUptodate;
		%feature("autodoc", "Records a static has 'uptodate', i.e. its value has been taken into account by a reinitialisation procedure this flag is reset at each successful setvalue.

Returns
-------
None
") SetUptodate;
		void SetUptodate();

		/****************** SetWild ******************/
		/**** md5 signature: 9fa05e145421691306295c2b3933e593 ****/
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
		/**** md5 signature: d450cedacaedf8ce31e4acf84a376a0e ****/
		%feature("compactdefaultargs") Standards;
		%feature("autodoc", "Initializes all standard static parameters, which can be used by every function. statics specific of a norm or a function must be defined around it.

Returns
-------
None
") Standards;
		static void Standards();

		/****************** Static ******************/
		/**** md5 signature: cec670c3b6ff48920ec19dc08a97c25d ****/
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
		/**** md5 signature: 185a217a8a41cc482d0b132448e027b6 ****/
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
		/**** md5 signature: 930fc09d937027882f5df9305551114a ****/
		%feature("compactdefaultargs") UpdatedStatus;
		%feature("autodoc", "Returns the status 'uptodate'.

Returns
-------
bool
") UpdatedStatus;
		Standard_Boolean UpdatedStatus();

		/****************** Wild ******************/
		/**** md5 signature: 3052e9e89cc7cc0ab4bd29371d719900 ****/
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

class Interface_HArray1OfHAsciiString : public Interface_Array1OfHAsciiString, public Standard_Transient {
  public:
    Interface_HArray1OfHAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper);
    Interface_HArray1OfHAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper, const Interface_Array1OfHAsciiString::value_type& theValue);
    Interface_HArray1OfHAsciiString(const Interface_Array1OfHAsciiString& theOther);
    const Interface_Array1OfHAsciiString& Array1();
    Interface_Array1OfHAsciiString& ChangeArray1();
};
%make_alias(Interface_HArray1OfHAsciiString)

/* harray2 classes */
/* hsequence classes */
class Interface_HSequenceOfCheck : public Interface_SequenceOfCheck, public Standard_Transient {
  public:
    Interface_HSequenceOfCheck();
    Interface_HSequenceOfCheck(const Interface_SequenceOfCheck& theOther);
    const Interface_SequenceOfCheck& Sequence();
    void Append (const Interface_SequenceOfCheck::value_type& theItem);
    void Append (Interface_SequenceOfCheck& theSequence);
    Interface_SequenceOfCheck& ChangeSequence();
};
%make_alias(Interface_HSequenceOfCheck)


