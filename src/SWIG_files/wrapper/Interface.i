/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_interface.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Interface_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
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
%import Message.i
%import TColStd.i
%import MoniTool.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proxy classes for enums */
%pythoncode {

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
Array1ExtendIter(Interface_FileParameter)

%template(Interface_Array1OfHAsciiString) NCollection_Array1<opencascade::handle<TCollection_HAsciiString>>;
Array1ExtendIter(opencascade::handle<TCollection_HAsciiString>)

%template(Interface_DataMapOfTransientInteger) NCollection_DataMap<opencascade::handle<Standard_Transient>,Standard_Integer>;
%template(Interface_IndexedMapOfAsciiString) NCollection_IndexedMap<TCollection_AsciiString>;
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
typedef NCollection_Array1<Interface_FileParameter> Interface_Array1OfFileParameter;
typedef NCollection_Array1<opencascade::handle<TCollection_HAsciiString>> Interface_Array1OfHAsciiString;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Standard_Integer>::Iterator Interface_DataMapIteratorOfDataMapOfTransientInteger;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Standard_Integer> Interface_DataMapOfTransientInteger;
typedef NCollection_IndexedMap<TCollection_AsciiString> Interface_IndexedMapOfAsciiString;
typedef NCollection_Sequence<opencascade::handle<Interface_Check>> Interface_SequenceOfCheck;
typedef NCollection_Vector<Interface_FileParameter> Interface_VectorOfFileParameter;
/* end typedefs declaration */

/*************************
* class Interface_BitMap *
*************************/
class Interface_BitMap {
	public:
		/****** Interface_BitMap::Interface_BitMap ******/
		/****** md5 signature: db569c1187338b8b4d403ec388a0f626 ******/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a empty BitMap.
") Interface_BitMap;
		 Interface_BitMap();

		/****** Interface_BitMap::Interface_BitMap ******/
		/****** md5 signature: 962bea8ef2bbf44e9f6d708deb599079 ******/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "
Parameters
----------
nbitems: int
resflags: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a BitMap for <nbitems> items One flag is defined, n0 0 <resflags> prepares allocation for <resflags> more flags Flags values start at false.
") Interface_BitMap;
		 Interface_BitMap(const Standard_Integer nbitems, const Standard_Integer resflags = 0);

		/****** Interface_BitMap::Interface_BitMap ******/
		/****** md5 signature: 969939d4e3440c110cf2bc7d3c420793 ******/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "
Parameters
----------
other: Interface_BitMap
copied: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a BitMap from another one if <copied> is True, copies data else, data are not copied, only the header object is.
") Interface_BitMap;
		 Interface_BitMap(const Interface_BitMap & other, const Standard_Boolean copied = Standard_False);

		/****** Interface_BitMap::AddFlag ******/
		/****** md5 signature: 19d04033b263e56b9a42c22690f3c1e2 ******/
		%feature("compactdefaultargs") AddFlag;
		%feature("autodoc", "
Parameters
----------
name: str (optional, default to "")

Return
-------
int

Description
-----------
Adds a flag, a name can be attached to it Returns its flag number Makes required reservation.
") AddFlag;
		Standard_Integer AddFlag(Standard_CString name = "");

		/****** Interface_BitMap::AddSomeFlags ******/
		/****** md5 signature: 847e94177a4401a5471f0ce8809a2518 ******/
		%feature("compactdefaultargs") AddSomeFlags;
		%feature("autodoc", "
Parameters
----------
more: int

Return
-------
int

Description
-----------
Adds several flags (<more>) with no name Returns the number of last added flag.
") AddSomeFlags;
		Standard_Integer AddSomeFlags(const Standard_Integer more);

		/****** Interface_BitMap::CFalse ******/
		/****** md5 signature: f737c3c281669deb5997674e8b92e10c ******/
		%feature("compactdefaultargs") CFalse;
		%feature("autodoc", "
Parameters
----------
item: int
flag: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns the former value for a flag and sets it to False (before: value returned; after: False).
") CFalse;
		Standard_Boolean CFalse(const Standard_Integer item, const Standard_Integer flag = 0);

		/****** Interface_BitMap::CTrue ******/
		/****** md5 signature: 71ec9b397601f115038302f533af5415 ******/
		%feature("compactdefaultargs") CTrue;
		%feature("autodoc", "
Parameters
----------
item: int
flag: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns the former value for a flag and sets it to True (before: value returned; after: True).
") CTrue;
		Standard_Boolean CTrue(const Standard_Integer item, const Standard_Integer flag = 0);

		/****** Interface_BitMap::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear all field of bit map.
") Clear;
		void Clear();

		/****** Interface_BitMap::FlagName ******/
		/****** md5 signature: 37218c965ffaaa4420e6c83f3497e2e4 ******/
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
Returns the name recorded for a flag, or an empty string.
") FlagName;
		Standard_CString FlagName(const Standard_Integer num);

		/****** Interface_BitMap::FlagNumber ******/
		/****** md5 signature: dfbf758026c5cedb65e5965d13b268be ******/
		%feature("compactdefaultargs") FlagNumber;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the number or a flag given its name, or zero.
") FlagNumber;
		Standard_Integer FlagNumber(Standard_CString name);

		/****** Interface_BitMap::Init ******/
		/****** md5 signature: 4873c90a7d9b0873090a22d6fde2925e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
val: bool
flag: int (optional, default to 0)

Return
-------
None

Description
-----------
Initialises all the values of Flag Number <flag> to a given value <val>.
") Init;
		void Init(const Standard_Boolean val, const Standard_Integer flag = 0);

		/****** Interface_BitMap::Initialize ******/
		/****** md5 signature: 2726d6fdc01da6c8dd49a7b16ec44631 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
nbitems: int
resflags: int (optional, default to 0)

Return
-------
None

Description
-----------
Initialize empty bit by <nbitems> items One flag is defined, n0 0 <resflags> prepares allocation for <resflags> more flags Flags values start at false.
") Initialize;
		void Initialize(const Standard_Integer nbitems, const Standard_Integer resflags = 0);

		/****** Interface_BitMap::Initialize ******/
		/****** md5 signature: 076577a8f47a7fa021348180ef2d87cc ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
other: Interface_BitMap
copied: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initialize a BitMap from another one.
") Initialize;
		void Initialize(const Interface_BitMap & other, const Standard_Boolean copied = Standard_False);

		/****** Interface_BitMap::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of items (i.e. the length of the bitmap).
") Length;
		Standard_Integer Length();

		/****** Interface_BitMap::NbFlags ******/
		/****** md5 signature: 57c8ed141584427f546add7793d296d7 ******/
		%feature("compactdefaultargs") NbFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of flags (flag 0 not included).
") NbFlags;
		Standard_Integer NbFlags();

		/****** Interface_BitMap::RemoveFlag ******/
		/****** md5 signature: 39c5f622dd041834d59347d40f6b1005 ******/
		%feature("compactdefaultargs") RemoveFlag;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Removes a flag given its number. Returns True if done, false if num is out of range.
") RemoveFlag;
		Standard_Boolean RemoveFlag(const Standard_Integer num);

		/****** Interface_BitMap::Reservate ******/
		/****** md5 signature: 959e159d3bb93437bea1686165cf9478 ******/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "
Parameters
----------
moreflags: int

Return
-------
None

Description
-----------
Reservates for a count of more flags.
") Reservate;
		void Reservate(const Standard_Integer moreflags);

		/****** Interface_BitMap::SetFalse ******/
		/****** md5 signature: 5f1673cee0277c1086c4194336d9a66e ******/
		%feature("compactdefaultargs") SetFalse;
		%feature("autodoc", "
Parameters
----------
item: int
flag: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets a flag to False.
") SetFalse;
		void SetFalse(const Standard_Integer item, const Standard_Integer flag = 0);

		/****** Interface_BitMap::SetFlagName ******/
		/****** md5 signature: 19b1ab796cecaa9a8005cbbfa7d56f0b ******/
		%feature("compactdefaultargs") SetFlagName;
		%feature("autodoc", "
Parameters
----------
num: int
name: str

Return
-------
bool

Description
-----------
Sets a name for a flag, given its number name can be empty (to erase the name of a flag) Returns True if done, false if: num is out of range, or name non-empty already set to another flag.
") SetFlagName;
		Standard_Boolean SetFlagName(const Standard_Integer num, Standard_CString name);

		/****** Interface_BitMap::SetLength ******/
		/****** md5 signature: 7fa593eecff52e65f7a52831a8cc6baf ******/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "
Parameters
----------
nbitems: int

Return
-------
None

Description
-----------
Sets for a new count of items, which can be either less or greater than the former one For new items, their flags start at false.
") SetLength;
		void SetLength(const Standard_Integer nbitems);

		/****** Interface_BitMap::SetTrue ******/
		/****** md5 signature: f8c0dc76542f6761e10acb7317a315be ******/
		%feature("compactdefaultargs") SetTrue;
		%feature("autodoc", "
Parameters
----------
item: int
flag: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets a flag to True.
") SetTrue;
		void SetTrue(const Standard_Integer item, const Standard_Integer flag = 0);

		/****** Interface_BitMap::SetValue ******/
		/****** md5 signature: 1c326ec9bbb4d3af44ace82642a4e699 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
item: int
val: bool
flag: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets a new value for a flag.
") SetValue;
		void SetValue(const Standard_Integer item, const Standard_Boolean val, const Standard_Integer flag = 0);

		/****** Interface_BitMap::Value ******/
		/****** md5 signature: b99e23510d657e7d6539e0a7d8252a01 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
item: int
flag: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns the value (true/false) of a flag, from: - the number of the item - the flag number, by default 0.
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
		/****** Interface_Category::Interface_Category ******/
		/****** md5 signature: efb3fe3148b618457c9b09c50b924bec ******/
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Category, with no protocol yet.
") Interface_Category;
		 Interface_Category();

		/****** Interface_Category::Interface_Category ******/
		/****** md5 signature: 78e71b948bfa660059997bf6cc10c1c7 ******/
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "
Parameters
----------
theProtocol: Interface_Protocol

Return
-------
None

Description
-----------
Creates a Category with a given protocol.
") Interface_Category;
		 Interface_Category(const opencascade::handle<Interface_Protocol> & theProtocol);

		/****** Interface_Category::Interface_Category ******/
		/****** md5 signature: ba7276b213b743915ca4fe4fc5707d99 ******/
		%feature("compactdefaultargs") Interface_Category;
		%feature("autodoc", "
Parameters
----------
theGTool: Interface_GTool

Return
-------
None

Description
-----------
Creates a Category with a given GTool.
") Interface_Category;
		 Interface_Category(const opencascade::handle<Interface_GTool> & theGTool);

		/****** Interface_Category::AddCategory ******/
		/****** md5 signature: a27890a05fa847cd11e98959beb93723 ******/
		%feature("compactdefaultargs") AddCategory;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
int

Description
-----------
Records a new Category defined by its names, produces a number New if not yet recorded.
") AddCategory;
		static Standard_Integer AddCategory(Standard_CString theName);

		/****** Interface_Category::CatNum ******/
		/****** md5 signature: 3e07cbf7623ae6de435ab6d784f7ef87 ******/
		%feature("compactdefaultargs") CatNum;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
theShares: Interface_ShareTool

Return
-------
int

Description
-----------
Determines the Category Number for an entity in its context, by using general service CategoryNumber.
") CatNum;
		Standard_Integer CatNum(const opencascade::handle<Standard_Transient> & theEnt, const Interface_ShareTool & theShares);

		/****** Interface_Category::ClearNums ******/
		/****** md5 signature: 00bfeb1c200ec3206c2a9b63ac3cb30b ******/
		%feature("compactdefaultargs") ClearNums;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the recorded list of category numbers for a Model.
") ClearNums;
		void ClearNums();

		/****** Interface_Category::Compute ******/
		/****** md5 signature: 2330764963d309efcab791418279b57a ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel
theShares: Interface_ShareTool

Return
-------
None

Description
-----------
Computes the Category Number for each entity and records it, in an array (ent.number -> category number) Hence, it can be queried by the method Num. The Model itself is not recorded, this method is intended to be used in a wider context (which detains also a Graph, etc).
") Compute;
		void Compute(const opencascade::handle<Interface_InterfaceModel> & theModel, const Interface_ShareTool & theShares);

		/****** Interface_Category::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default initialisation (protected against several calls: passes only once).
") Init;
		static void Init();

		/****** Interface_Category::Name ******/
		/****** md5 signature: 90b2dbf508375c5337d5df4595e90cec ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
str

Description
-----------
Returns the name of a category, according to its number.
") Name;
		static Standard_CString Name(const Standard_Integer theNum);

		/****** Interface_Category::NbCategories ******/
		/****** md5 signature: 15ca00fe4737c8bde1c54290a257c1ec ******/
		%feature("compactdefaultargs") NbCategories;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded categories.
") NbCategories;
		static Standard_Integer NbCategories();

		/****** Interface_Category::Num ******/
		/****** md5 signature: d2a0fda3a2229bf8d99e97222156a256 ******/
		%feature("compactdefaultargs") Num;
		%feature("autodoc", "
Parameters
----------
theNumEnt: int

Return
-------
int

Description
-----------
Returns the category number recorded for an entity number Returns 0 if out of range.
") Num;
		Standard_Integer Num(const Standard_Integer theNumEnt);

		/****** Interface_Category::Number ******/
		/****** md5 signature: fbe1daf3ab8187f5e5ecd5017d9938f3 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
int

Description
-----------
Returns the number of a category, according to its name.
") Number;
		static Standard_Integer Number(Standard_CString theName);

		/****** Interface_Category::SetProtocol ******/
		/****** md5 signature: 037fff6bcbc07de18c1688974b3bee5c ******/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "
Parameters
----------
theProtocol: Interface_Protocol

Return
-------
None

Description
-----------
Sets/Changes Protocol.
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
		/****** Interface_Check::Interface_Check ******/
		/****** md5 signature: 7f90a0235cc0c2fbe51830893d2b11de ******/
		%feature("compactdefaultargs") Interface_Check;
		%feature("autodoc", "Return
-------
None

Description
-----------
Allows definition of a Sequence. Used also for Global Check of an InterfaceModel (which stores global messages for file).
") Interface_Check;
		 Interface_Check();

		/****** Interface_Check::Interface_Check ******/
		/****** md5 signature: 430409a4cca19f08ea37d04913f5ac29 ******/
		%feature("compactdefaultargs") Interface_Check;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
None

Description
-----------
Defines a Check on an Entity.
") Interface_Check;
		 Interface_Check(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_Check::AddFail ******/
		/****** md5 signature: f9be97b778e94cadf07344b48c88b2ec ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
amess: TCollection_HAsciiString

Return
-------
None

Description
-----------
Records a new Fail message.
") AddFail;
		void AddFail(const opencascade::handle<TCollection_HAsciiString> & amess);

		/****** Interface_Check::AddFail ******/
		/****** md5 signature: 8be0c4574a6a147568ae3462cbf85ae3 ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
amess: TCollection_HAsciiString
orig: TCollection_HAsciiString

Return
-------
None

Description
-----------
Records a new Fail message under two forms: final,original.
") AddFail;
		void AddFail(const opencascade::handle<TCollection_HAsciiString> & amess, const opencascade::handle<TCollection_HAsciiString> & orig);

		/****** Interface_Check::AddFail ******/
		/****** md5 signature: f605f13d55ac347cc1a224f7bb297f1f ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
amess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Records a new Fail message given as 'error text' directly If <orig> is given, a distinct original form is recorded else (D), the original form equates <amess>.
") AddFail;
		void AddFail(Standard_CString amess, Standard_CString orig = "");

		/****** Interface_Check::AddFail ******/
		/****** md5 signature: 475a01b010b4e2f284e66a83730c9014 ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
amsg: Message_Msg

Return
-------
None

Description
-----------
Records a new Fail from the definition of a Msg (Original+Value).
") AddFail;
		void AddFail(const Message_Msg & amsg);

		/****** Interface_Check::AddWarning ******/
		/****** md5 signature: 9ec76aca562eb8e28b5411eba37ffcb8 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
amess: TCollection_HAsciiString

Return
-------
None

Description
-----------
Records a new Warning message.
") AddWarning;
		void AddWarning(const opencascade::handle<TCollection_HAsciiString> & amess);

		/****** Interface_Check::AddWarning ******/
		/****** md5 signature: 77fe09ed073b8c6e96e8621c7d0459c8 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
amess: TCollection_HAsciiString
orig: TCollection_HAsciiString

Return
-------
None

Description
-----------
Records a new Warning message under two forms: final,original.
") AddWarning;
		void AddWarning(const opencascade::handle<TCollection_HAsciiString> & amess, const opencascade::handle<TCollection_HAsciiString> & orig);

		/****** Interface_Check::AddWarning ******/
		/****** md5 signature: d0551ee8497c3fe957e762088a968913 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
amess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Records a Warning message given as 'warning message' directly If <orig> is given, a distinct original form is recorded else (D), the original form equates <amess>.
") AddWarning;
		void AddWarning(Standard_CString amess, Standard_CString orig = "");

		/****** Interface_Check::AddWarning ******/
		/****** md5 signature: 00bb7fdd767eee55c100662f590ee316 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
amsg: Message_Msg

Return
-------
None

Description
-----------
Records a new Warning from the definition of a Msg (Original+Value).
") AddWarning;
		void AddWarning(const Message_Msg & amsg);

		/****** Interface_Check::CFail ******/
		/****** md5 signature: 76917aed443f5ffeff440c8f1fa8f5dc ******/
		%feature("compactdefaultargs") CFail;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to Standard_True)

Return
-------
str

Description
-----------
Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False.
") CFail;
		Standard_CString CFail(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****** Interface_Check::CInfoMsg ******/
		/****** md5 signature: cf6d3b7d4e368c59afdf8bee8c06f62f ******/
		%feature("compactdefaultargs") CInfoMsg;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to Standard_True)

Return
-------
str

Description
-----------
Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False.
") CInfoMsg;
		Standard_CString CInfoMsg(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****** Interface_Check::CWarning ******/
		/****** md5 signature: 808de3f2d1afa1bd13afa58f447ddf7e ******/
		%feature("compactdefaultargs") CWarning;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to Standard_True)

Return
-------
str

Description
-----------
Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False.
") CWarning;
		Standard_CString CWarning(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****** Interface_Check::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears a check, in order to receive information from transfer (Messages and Entity).
") Clear;
		void Clear();

		/****** Interface_Check::ClearFails ******/
		/****** md5 signature: 2ad879b4d2e37bf4698c253c8b35971a ******/
		%feature("compactdefaultargs") ClearFails;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the Fail Messages (for instance to keep only Warnings).
") ClearFails;
		void ClearFails();

		/****** Interface_Check::ClearInfoMsgs ******/
		/****** md5 signature: 34c3c2a0c22ab10df12a5dd59859cab0 ******/
		%feature("compactdefaultargs") ClearInfoMsgs;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the Info Messages.
") ClearInfoMsgs;
		void ClearInfoMsgs();

		/****** Interface_Check::ClearWarnings ******/
		/****** md5 signature: 21ba9936fe5384f574f7b3e976f914eb ******/
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the Warning Messages (for instance to keep only Fails).
") ClearWarnings;
		void ClearWarnings();

		/****** Interface_Check::Complies ******/
		/****** md5 signature: bd47c5c42d431ecc7dae0adf51b14f93 ******/
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "
Parameters
----------
status: Interface_CheckStatus

Return
-------
bool

Description
-----------
Tells if Check Status complies with a given one (i.e. also status for query).
") Complies;
		Standard_Boolean Complies(const Interface_CheckStatus status);

		/****** Interface_Check::Complies ******/
		/****** md5 signature: a0c202208e05c6908f6f28441a6077da ******/
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "
Parameters
----------
mess: TCollection_HAsciiString
incl: int
status: Interface_CheckStatus

Return
-------
bool

Description
-----------
Tells if a message is brought by a Check, as follows: <incl> = 0: <mess> exactly matches one of the messages <incl> < 0: <mess> is contained by one of the messages <incl> > 0: <mess> contains one of the messages For <status>: for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (answer will be false).
") Complies;
		Standard_Boolean Complies(const opencascade::handle<TCollection_HAsciiString> & mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****** Interface_Check::Entity ******/
		/****** md5 signature: fef0e331cb625aad1f4e0bc4e9d437d6 ******/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the entity on which the Check has been defined.
") Entity;
		const opencascade::handle<Standard_Transient> & Entity();

		/****** Interface_Check::Fail ******/
		/****** md5 signature: 33f2fd9aaa3595fbdec444a4f9c1d29c ******/
		%feature("compactdefaultargs") Fail;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Fail Message as a String Final form by default, Original form if <final> is False.
") Fail;
		const opencascade::handle<TCollection_HAsciiString> & Fail(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****** Interface_Check::Fails ******/
		/****** md5 signature: 21c724cd0264efcfa01b1a66ff968891 ******/
		%feature("compactdefaultargs") Fails;
		%feature("autodoc", "
Parameters
----------
final: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of Fails, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty.
") Fails;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> Fails(const Standard_Boolean final = Standard_True);

		/****** Interface_Check::GetAsWarning ******/
		/****** md5 signature: 45e1d9a7e61c5beb11f12bc052896e68 ******/
		%feature("compactdefaultargs") GetAsWarning;
		%feature("autodoc", "
Parameters
----------
other: Interface_Check
failsonly: bool

Return
-------
None

Description
-----------
Copies messages converted into Warning messages If failsonly is true, only Fails are taken, and converted else, Warnings are taken too. Does not regard Entity Used to keep Fail messages as Warning, after a recovery.
") GetAsWarning;
		void GetAsWarning(const opencascade::handle<Interface_Check> & other, const Standard_Boolean failsonly);

		/****** Interface_Check::GetEntity ******/
		/****** md5 signature: 6c9b69baffd432a259c6cbae6828d8d2 ******/
		%feature("compactdefaultargs") GetEntity;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
None

Description
-----------
same as SetEntity (old form kept for compatibility) Warning: Does nothing if Entity field is not yet clear.
") GetEntity;
		void GetEntity(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_Check::GetMessages ******/
		/****** md5 signature: ade88a62763cbaa286e34927e67ec97d ******/
		%feature("compactdefaultargs") GetMessages;
		%feature("autodoc", "
Parameters
----------
other: Interface_Check

Return
-------
None

Description
-----------
Copies messages stored in another Check, cumulating Does not regard other's Entity. Used to cumulate messages.
") GetMessages;
		void GetMessages(const opencascade::handle<Interface_Check> & other);

		/****** Interface_Check::HasEntity ******/
		/****** md5 signature: da207550990fa73aecc203a0676ca926 ******/
		%feature("compactdefaultargs") HasEntity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Check is devoted to an entity; else, it is global (for InterfaceModel's storing of global error messages).
") HasEntity;
		Standard_Boolean HasEntity();

		/****** Interface_Check::HasFailed ******/
		/****** md5 signature: 231f6cf476d6eb671060105fc565fef7 ******/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Check brings at least one Fail Message.
") HasFailed;
		Standard_Boolean HasFailed();

		/****** Interface_Check::HasWarnings ******/
		/****** md5 signature: 62eec0bc4f8c89e1937e6ebe5c890272 ******/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Check brings at least one Warning Message.
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****** Interface_Check::InfoMsg ******/
		/****** md5 signature: b59326ec723b9d632798269a90b5c27c ******/
		%feature("compactdefaultargs") InfoMsg;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns information message as a String.
") InfoMsg;
		const opencascade::handle<TCollection_HAsciiString> & InfoMsg(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****** Interface_Check::InfoMsgs ******/
		/****** md5 signature: e2eed28c1b84021b5a9b4883813984d8 ******/
		%feature("compactdefaultargs") InfoMsgs;
		%feature("autodoc", "
Parameters
----------
final: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of Info Msg, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty.
") InfoMsgs;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> InfoMsgs(const Standard_Boolean final = Standard_True);

		/****** Interface_Check::Mend ******/
		/****** md5 signature: 5b7eeed5c29bcfb2d1e36c54d12a46af ******/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "
Parameters
----------
pref: str
num: int (optional, default to 0)

Return
-------
bool

Description
-----------
Mends messages, according <pref> and <num> According to <num>, works on the whole list of Fails if = 0(D) or only one Fail message, given its rank If <pref> is empty, converts Fail(s) to Warning(s) Else, does the conversion but prefixes the new Warning(s) but <pref> followed by a semi-column Some reserved values of <pref> are: 'FM': standard prefix 'Mended' (can be translated) 'CF': clears Fail(s) 'CW': clears Warning(s): here, <num> refers to Warning list 'CA': clears all messages: here, <num> is ignored.
") Mend;
		Standard_Boolean Mend(Standard_CString pref, const Standard_Integer num = 0);

		/****** Interface_Check::NbFails ******/
		/****** md5 signature: 950d340013c289e6e9c9d027f2051ade ******/
		%feature("compactdefaultargs") NbFails;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Fails.
") NbFails;
		Standard_Integer NbFails();

		/****** Interface_Check::NbInfoMsgs ******/
		/****** md5 signature: cb3779319716b130c2d191208e46fc78 ******/
		%feature("compactdefaultargs") NbInfoMsgs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded information messages.
") NbInfoMsgs;
		Standard_Integer NbInfoMsgs();

		/****** Interface_Check::NbWarnings ******/
		/****** md5 signature: 8e87d048d54d06f512ddb6e0bbb2f55a ******/
		%feature("compactdefaultargs") NbWarnings;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Warning messages.
") NbWarnings;
		Standard_Integer NbWarnings();

		/****** Interface_Check::Print ******/
		/****** md5 signature: cd6f31420152be00482d8b2c47fd50c1 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
level: int
final: int (optional, default to 1)

Return
-------
S: Standard_OStream

Description
-----------
Prints the messages of the check to an Messenger <level> = 1: only fails <level> = 2: fails and warnings <level> = 3: all (fails, warnings, info msg) <final>: if positive (D) prints final values of messages if negative, prints originals if null, prints both forms.
") Print;
		void Print(std::ostream &OutValue, const Standard_Integer level, const Standard_Integer final = 1);

		/****** Interface_Check::Remove ******/
		/****** md5 signature: fbc96bff34dc8f4089235a7befff9769 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
mess: TCollection_HAsciiString
incl: int
status: Interface_CheckStatus

Return
-------
bool

Description
-----------
Removes the messages which comply with <mess>, as follows: <incl> = 0: <mess> exactly matches one of the messages <incl> < 0: <mess> is contained by one of the messages <incl> > 0: <mess> contains one of the messages For <status>: for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (nothing is done) Returns True if at least one message has been removed, False else.
") Remove;
		Standard_Boolean Remove(const opencascade::handle<TCollection_HAsciiString> & mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****** Interface_Check::SendFail ******/
		/****** md5 signature: 1eab4e53649e1a16e12a6f58bd826f30 ******/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "
Parameters
----------
amsg: Message_Msg

Return
-------
None

Description
-----------
New name for AddFail (Msg).
") SendFail;
		void SendFail(const Message_Msg & amsg);

		/****** Interface_Check::SendMsg ******/
		/****** md5 signature: f751f85c3590977261d17744924ccb9f ******/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "
Parameters
----------
amsg: Message_Msg

Return
-------
None

Description
-----------
Records an information message This does not change the status of the Check.
") SendMsg;
		void SendMsg(const Message_Msg & amsg);

		/****** Interface_Check::SendWarning ******/
		/****** md5 signature: 7a784110763f5a191de87e4b30b0324e ******/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "
Parameters
----------
amsg: Message_Msg

Return
-------
None

Description
-----------
New name for AddWarning.
") SendWarning;
		void SendWarning(const Message_Msg & amsg);

		/****** Interface_Check::SetEntity ******/
		/****** md5 signature: 4831d2207818bfa2888384573ff378ca ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
None

Description
-----------
Receives an entity result of a Transfer.
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_Check::Status ******/
		/****** md5 signature: a1aa35ee9c0826471c319adbfef1a3ec ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
Interface_CheckStatus

Description
-----------
Returns the Check Status: OK, Warning or Fail.
") Status;
		Interface_CheckStatus Status();

		/****** Interface_Check::Trace ******/
		/****** md5 signature: cf02ca3158b0207f14d520f0a8d5c02b ******/
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "
Parameters
----------
level: int (optional, default to -1)
final: int (optional, default to 1)

Return
-------
None

Description
-----------
Prints the messages of the check to the default trace file By default, according to the default standard level Else, according level (see method Print).
") Trace;
		void Trace(const Standard_Integer level = -1, const Standard_Integer final = 1);

		/****** Interface_Check::Warning ******/
		/****** md5 signature: 8a10938d450687ebc48c00aa49f83e4b ******/
		%feature("compactdefaultargs") Warning;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Warning message as a String Final form by default, Original form if <final> is False.
") Warning;
		const opencascade::handle<TCollection_HAsciiString> & Warning(const Standard_Integer num, const Standard_Boolean final = Standard_True);

		/****** Interface_Check::Warnings ******/
		/****** md5 signature: d581bddbb927ec43e862233c97e84719 ******/
		%feature("compactdefaultargs") Warnings;
		%feature("autodoc", "
Parameters
----------
final: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of Warnings, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty.
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
		/****** Interface_CheckIterator::Interface_CheckIterator ******/
		/****** md5 signature: b5e866bc02592812e8fd52bfe221f952 ******/
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty CheckIterator.
") Interface_CheckIterator;
		 Interface_CheckIterator();

		/****** Interface_CheckIterator::Interface_CheckIterator ******/
		/****** md5 signature: 9a5a658844504095beb82bc8fd617c2c ******/
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Creates a CheckIterator with a name (displayed by Print as a title).
") Interface_CheckIterator;
		 Interface_CheckIterator(Standard_CString name);

		/****** Interface_CheckIterator::Add ******/
		/****** md5 signature: 4a6b3c1f769b0854805edff2f650eff6 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check
num: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a Check to the list to be iterated This Check is Accompanied by Entity Number in the Model (0 for Global Check or Entity unknown in the Model), if 0 and Model is recorded in <self>, it is computed.
") Add;
		void Add(const opencascade::handle<Interface_Check> & ach, const Standard_Integer num = 0);

		/****** Interface_CheckIterator::CCheck ******/
		/****** md5 signature: c28c01886a4208269253e2208277edbf ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the Check bound to an Entity Number (0: Global) in order to be consulted or completed on the spot I.e. returns the Check if is already exists, or adds it then returns the new empty Check.
") CCheck;
		opencascade::handle<Interface_Check> & CCheck(const Standard_Integer num);

		/****** Interface_CheckIterator::CCheck ******/
		/****** md5 signature: afbcceb69ef295e5e0a74341809ed4a8 ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the Check bound to an Entity, in order to be consulted or completed on the spot I.e. returns the Check if is already exists, or adds it then returns the new empty Check.
") CCheck;
		opencascade::handle<Interface_Check> & CCheck(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_CheckIterator::Check ******/
		/****** md5 signature: 96c2f23202b10afafa9169d8cdd86ad2 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the Check which was attached to an Entity given its Number in the Model. <num>=0 is for the Global Check. If no Check was recorded for this Number, returns an empty Check. Remark: Works apart from the iteration methods (no interference).
") Check;
		const opencascade::handle<Interface_Check> & Check(const Standard_Integer num);

		/****** Interface_CheckIterator::Check ******/
		/****** md5 signature: 51be1e644fb07f435d639ea2c6b1e086 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the Check attached to an Entity If no Check was recorded for this Entity, returns an empty Check. Remark: Works apart from the iteration methods (no interference).
") Check;
		const opencascade::handle<Interface_Check> & Check(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_CheckIterator::Checkeds ******/
		/****** md5 signature: 6af14138eebf6a903d15085a084f054e ******/
		%feature("compactdefaultargs") Checkeds;
		%feature("autodoc", "
Parameters
----------
failsonly: bool
global: bool

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of entities concerned by a Check Only fails if <failsonly> is True, else all non-empty checks If <global> is true, adds the model for a global check Else, global check is ignored.
") Checkeds;
		opencascade::handle<TColStd_HSequenceOfTransient> Checkeds(const Standard_Boolean failsonly, const Standard_Boolean global);

		/****** Interface_CheckIterator::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of checks.
") Clear;
		void Clear();

		/****** Interface_CheckIterator::Complies ******/
		/****** md5 signature: bd47c5c42d431ecc7dae0adf51b14f93 ******/
		%feature("compactdefaultargs") Complies;
		%feature("autodoc", "
Parameters
----------
status: Interface_CheckStatus

Return
-------
bool

Description
-----------
Tells if this check list complies with a given status: OK (i.e. empty), Warning (at least one Warning, but no Fail), Fail (at least one), Message (not OK), NoFail, Any.
") Complies;
		Standard_Boolean Complies(const Interface_CheckStatus status);

		/****** Interface_CheckIterator::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears data of iteration.
") Destroy;
		void Destroy();

		/****** Interface_CheckIterator::Extract ******/
		/****** md5 signature: 4e27e823b8768c522445cdc0e4043cfa ******/
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "
Parameters
----------
status: Interface_CheckStatus

Return
-------
Interface_CheckIterator

Description
-----------
Returns a CheckIterator which contains the checks which comply with a given status Each check is added completely (no split Warning/Fail).
") Extract;
		Interface_CheckIterator Extract(const Interface_CheckStatus status);

		/****** Interface_CheckIterator::Extract ******/
		/****** md5 signature: 2db622a09a39a7b3c216db6d134bd273 ******/
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "
Parameters
----------
mess: str
incl: int
status: Interface_CheckStatus

Return
-------
Interface_CheckIterator

Description
-----------
Returns a CheckIterator which contains the check which comply with a message, plus some conditions as follows: <incl> = 0: <mess> exactly matches one of the messages <incl> < 0: <mess> is contained by one of the messages <incl> > 0: <mess> contains one of the messages For <status>: for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (answer will be false) Each Check which complies is entirely taken.
") Extract;
		Interface_CheckIterator Extract(Standard_CString mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****** Interface_CheckIterator::IsEmpty ******/
		/****** md5 signature: 803613576dcec3f9a8d605a071deb357 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "
Parameters
----------
failsonly: bool

Return
-------
bool

Description
-----------
Returns True if: no Fail has been recorded if <failsonly> is True, no Check at all if <failsonly> is False.
") IsEmpty;
		Standard_Boolean IsEmpty(const Standard_Boolean failsonly);

		/****** Interface_CheckIterator::Merge ******/
		/****** md5 signature: baac633c3fc83575a5e2da46ece8b525 ******/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "
Parameters
----------
other: Interface_CheckIterator

Return
-------
None

Description
-----------
Merges another CheckIterator into <self>, i.e. adds each of its Checks. Content of <other> remains unchanged. Takes also the Model but not the Name.
") Merge;
		void Merge(Interface_CheckIterator & other);

		/****** Interface_CheckIterator::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the stored model (can be a null handle).
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Interface_CheckIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Checks to get.
") More;
		Standard_Boolean More();

		/****** Interface_CheckIterator::Name ******/
		/****** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the recorded name (can be empty).
") Name;
		Standard_CString Name();

		/****** Interface_CheckIterator::Next ******/
		/****** md5 signature: db8382462e33c960ba2eedf02613f499 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets Iteration to next Item.
") Next;
		void Next();

		/****** Interface_CheckIterator::Number ******/
		/****** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Number of Entity for the Check currently iterated or 0 for GlobalCheck.
") Number;
		Standard_Integer Number();

		/****** Interface_CheckIterator::Print ******/
		/****** md5 signature: fbbffa04ee2028cd35a21f2ac0226d1e ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
failsonly: bool
final: int (optional, default to 0)

Return
-------
S: Standard_OStream

Description
-----------
Prints the list of Checks with their attached Numbers If <failsonly> is True, prints only Fail messages If <failsonly> is False, prints all messages If <final> = 0 (D), prints also original messages if different If <final> < 0, prints only original messages If <final> > 0, prints only final messages It uses the recorded Model if it is defined Remark: Works apart from the iteration methods (no interference).
") Print;
		void Print(std::ostream &OutValue, const Standard_Boolean failsonly, const Standard_Integer final = 0);

		/****** Interface_CheckIterator::Print ******/
		/****** md5 signature: 287a76ed6178a67e94c843a507962cc1 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
failsonly: bool
final: int (optional, default to 0)

Return
-------
S: Standard_OStream

Description
-----------
Works as Print without a model, but for entities which have no attached number (Number not positive), tries to compute this Number from <model> and displays 'original' or 'computed'.
") Print;
		void Print(std::ostream &OutValue, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Boolean failsonly, const Standard_Integer final = 0);

		/****** Interface_CheckIterator::Remove ******/
		/****** md5 signature: 81170abf4e017303192fc5e4bf72fea9 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
mess: str
incl: int
status: Interface_CheckStatus

Return
-------
bool

Description
-----------
Removes the messages of all Checks, under these conditions: <incl> = 0: <mess> exactly matches one of the messages <incl> < 0: <mess> is contained by one of the messages <incl> > 0: <mess> contains one of the messages For <status>: for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (nothing is done) Returns True if at least one message has been removed, False else.
") Remove;
		Standard_Boolean Remove(Standard_CString mess, const Standard_Integer incl, const Interface_CheckStatus status);

		/****** Interface_CheckIterator::SetModel ******/
		/****** md5 signature: 70328a97cec44e457500ce3b002efc49 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Defines a Model, used to locate entities (not required, if it is absent, entities are simply less documented).
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Interface_CheckIterator::SetName ******/
		/****** md5 signature: 208d3e507b11ad1eb22d3afd35f96209 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Sets / Changes the name.
") SetName;
		void SetName(Standard_CString name);

		/****** Interface_CheckIterator::Start ******/
		/****** md5 signature: c626be121588f79e9e18cc24cc705050 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts Iteration. Thus, it is possible to restart it Remark: an iteration may be done with a const Iterator While its content is modified (through a pointer), this allows to give it as a const argument to a function.
") Start;
		void Start();

		/****** Interface_CheckIterator::Status ******/
		/****** md5 signature: a1aa35ee9c0826471c319adbfef1a3ec ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
Interface_CheckStatus

Description
-----------
Returns worst status among: OK, Warning, Fail.
") Status;
		Interface_CheckStatus Status();

		/****** Interface_CheckIterator::Value ******/
		/****** md5 signature: f4d2f44a410b3e3cf64e685769098635 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns Check currently Iterated It brings all other information (status, messages, ...) The Number of the Entity in the Model is given by Number below.
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
		/****** Interface_CheckTool::Interface_CheckTool ******/
		/****** md5 signature: 5ab8272955d617e24b07e8494b0c2533 ******/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Creates a CheckTool, by calling the General Service Library and Modules, selected through a Protocol, to work on a Model Moreover, Protocol recognizes Unknown Entities.
") Interface_CheckTool;
		 Interface_CheckTool(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol);

		/****** Interface_CheckTool::Interface_CheckTool ******/
		/****** md5 signature: b514ba2dd5b625afdc2b750255b2df75 ******/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Creates a CheckTool, by calling the General Service Library and Modules, selected through a Protocol, to work on a Model Protocol and so on are taken from the Model (its GTool).
") Interface_CheckTool;
		 Interface_CheckTool(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Interface_CheckTool::Interface_CheckTool ******/
		/****** md5 signature: 753f9154813699d83f4038bf6b8c04d0 ******/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "
Parameters
----------
graph: Interface_Graph

Return
-------
None

Description
-----------
Creates a CheckTool from a Graph. The Graph contains a Model which designates a Protocol: they are used to create ShareTool.
") Interface_CheckTool;
		 Interface_CheckTool(const Interface_Graph & graph);

		/****** Interface_CheckTool::Interface_CheckTool ******/
		/****** md5 signature: 59802d0acbc68e3993d49b35e5ec0eeb ******/
		%feature("compactdefaultargs") Interface_CheckTool;
		%feature("autodoc", "
Parameters
----------
hgraph: Interface_HGraph

Return
-------
None

Description
-----------
No available documentation.
") Interface_CheckTool;
		 Interface_CheckTool(const opencascade::handle<Interface_HGraph> & hgraph);

		/****** Interface_CheckTool::AnalyseCheckList ******/
		/****** md5 signature: b1a8bd4983e0bb079b0cb8d99027dfab ******/
		%feature("compactdefaultargs") AnalyseCheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns list of errors detected at Analyse time (syntactic) (note that GlobalCheck is not in this list).
") AnalyseCheckList;
		Interface_CheckIterator AnalyseCheckList();

		/****** Interface_CheckTool::Check ******/
		/****** md5 signature: af76360fee7801f23a6d8aa9bab38117 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the Check associated to an Entity identified by its Number in a Model.
") Check;
		opencascade::handle<Interface_Check> Check(const Standard_Integer num);

		/****** Interface_CheckTool::CheckList ******/
		/****** md5 signature: a0f363eff6cccdc4c389615b84796fd3 ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns list of all Errors detected Note that presence of Unknown Entities is not an error Cumulates: GlobalCheck if error + AnalyseCheckList + VerifyCheckList.
") CheckList;
		Interface_CheckIterator CheckList();

		/****** Interface_CheckTool::CheckSuccess ******/
		/****** md5 signature: 831d2a1e101dcafb9604bb86498b17d9 ******/
		%feature("compactdefaultargs") CheckSuccess;
		%feature("autodoc", "
Parameters
----------
reset: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Checks if any Error has been detected (CheckList not empty) Returns normally if none, raises exception if some exists. It reuses the last computations from other checking methods, unless the argument <reset> is given True.
") CheckSuccess;
		void CheckSuccess(const Standard_Boolean reset = Standard_False);

		/****** Interface_CheckTool::CompleteCheckList ******/
		/****** md5 signature: dd892cfac1922aa0f3c0767a3cb97241 ******/
		%feature("compactdefaultargs") CompleteCheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns list of all 'remarkable' information, which include: - GlobalCheck, if not empty - Error Checks, for all Errors (Verify + Analyse) - also Corrected Entities - and Unknown Entities: for those, each Unknown Entity is associated to an empty Check (it is neither an Error nor a Correction, but a remarkable information).
") CompleteCheckList;
		Interface_CheckIterator CompleteCheckList();

		/****** Interface_CheckTool::FillCheck ******/
		/****** md5 signature: 96faa5770c5b0e45661900a72f015d22 ******/
		%feature("compactdefaultargs") FillCheck;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
sh: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Fills as required a Check with the Error and Warning messages produced by Checking a given Entity. For an Erroneous or Corrected Entity: Check build at Analyse time; else, Check computed for Entity (Verify integrity), can use a Graph as required to control context.
") FillCheck;
		void FillCheck(const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & sh, opencascade::handle<Interface_Check> & ach);

		/****** Interface_CheckTool::Print ******/
		/****** md5 signature: 77b918ff1d1ec5c1b0230477d5a40611 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check

Return
-------
S: Standard_OStream

Description
-----------
Utility method which Prints the content of a Check.
") Print;
		void Print(const opencascade::handle<Interface_Check> & ach, std::ostream &OutValue);

		/****** Interface_CheckTool::Print ******/
		/****** md5 signature: 14d98babb92b15fa230bc4228bcc71be ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
list: Interface_CheckIterator

Return
-------
S: Standard_OStream

Description
-----------
Simply Lists all the Checks and the Content (messages) and the Entity, if there is, of each Check (if all Checks are OK, nothing is Printed).
") Print;
		void Print(const Interface_CheckIterator & list, std::ostream &OutValue);

		/****** Interface_CheckTool::UnknownEntities ******/
		/****** md5 signature: bd331908c549b04b25469271a771e03d ******/
		%feature("compactdefaultargs") UnknownEntities;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns list of Unknown Entities Note that Error and Erroneous Entities are not considered as Unknown.
") UnknownEntities;
		Interface_EntityIterator UnknownEntities();

		/****** Interface_CheckTool::VerifyCheckList ******/
		/****** md5 signature: 4dcbd6c0a58f6c164d0fa0dc3b33638d ******/
		%feature("compactdefaultargs") VerifyCheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns list of integrity constraints errors (semantic) (note that GlobalCheck is not in this list).
") VerifyCheckList;
		Interface_CheckIterator VerifyCheckList();

		/****** Interface_CheckTool::WarningCheckList ******/
		/****** md5 signature: 2443d0ebe4f00c6ed5a384c81a4f663b ******/
		%feature("compactdefaultargs") WarningCheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns list of Corrections (includes GlobalCheck if corrected).
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
		/****** Interface_CopyControl::Bind ******/
		/****** md5 signature: 198684707fd621b3a8201773431c09ef ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
None

Description
-----------
Bind a Result to a Starting Entity identified by its Number.
") Bind;
		virtual void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****** Interface_CopyControl::Clear ******/
		/****** md5 signature: d67699716a1d70f3f12e5a2b1d81e2d9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears List of Copy Results. Gets Ready to begin another Copy Process.
") Clear;
		virtual void Clear();

		/****** Interface_CopyControl::Search ******/
		/****** md5 signature: be4105f70addedede9c47b4c043c8dfb ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
bool

Description
-----------
Searches for the Result bound to a Startingf Entity identified by its Number. If Found, returns True and fills <res> Else, returns False and nullifies <res>.
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
		/****** Interface_CopyTool::Interface_CopyTool ******/
		/****** md5 signature: 2ffe2dfad4989a2f525d6a72fa611c8c ******/
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Return
-------
None

Description
-----------
Creates a CopyTool adapted to work from a Model. Works with a General Service Library, given as an argument.
") Interface_CopyTool;
		 Interface_CopyTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****** Interface_CopyTool::Interface_CopyTool ******/
		/****** md5 signature: 476f3608a5b01ab0028273c541d9d50b ******/
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Same as above, but Library is defined through a Protocol.
") Interface_CopyTool;
		 Interface_CopyTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****** Interface_CopyTool::Interface_CopyTool ******/
		/****** md5 signature: 6e5408215b76b084ba5f396e61b79c78 ******/
		%feature("compactdefaultargs") Interface_CopyTool;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Same as above, but works with the Active Protocol.
") Interface_CopyTool;
		 Interface_CopyTool(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_CopyTool::Bind ******/
		/****** md5 signature: f07152d868147881642168cd837b3600 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
None

Description
-----------
Defines a Result for the Transfer of a Starting object. Used by method Transferred (which performs a normal Copy), but can also be called to enforce a result: in the latter case, the enforced result must be compatible with the other Transfers which are performed.
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****** Interface_CopyTool::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears Transfer List. Gets Ready to begin another Transfer.
") Clear;
		virtual void Clear();

		/****** Interface_CopyTool::ClearLastFlags ******/
		/****** md5 signature: 468b0c960533d5923d24b4dd930d9acf ******/
		%feature("compactdefaultargs") ClearLastFlags;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears LastFlags only. This allows to know what Entities are copied after its call (see method LastCopiedAfter). It can be used when copies are done by increments, which must be distinguished. ClearLastFlags is also called by Clear.
") ClearLastFlags;
		void ClearLastFlags();

		/****** Interface_CopyTool::CompleteResult ******/
		/****** md5 signature: ea9b74b309317519b06757d93262c0cc ******/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "
Parameters
----------
withreports: bool (optional, default to Standard_False)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the complete list of copied Entities If <withreports> is given True, the entities which were reported in the Starting Model are replaced in the list by the copied ReportEntities.
") CompleteResult;
		Interface_EntityIterator CompleteResult(const Standard_Boolean withreports = Standard_False);

		/****** Interface_CopyTool::Control ******/
		/****** md5 signature: 2b9c8e9c0d77e4d7c78d407ba1dab327 ******/
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_CopyControl>

Description
-----------
Returns the object used for Control.
") Control;
		opencascade::handle<Interface_CopyControl> Control();

		/****** Interface_CopyTool::Copy ******/
		/****** md5 signature: 32447fdc65ef06ca5213043fab887ec0 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient
mapped: bool
errstat: bool

Return
-------
bool

Description
-----------
Creates the CounterPart of an Entity (by ShallowCopy), Binds it, then Copies the content of the former Entity to the other one (same Type), by call to the General Service Library It may command the Copy of Referenced Entities Then, its returns True. //! If <mapped> is True, the Map is used to store the Result Else, the Result is simply produced: it can be used to Copy internal sub-parts of Entities, which are not intended to be shared (Strings, Arrays, etc...) If <errstat> is True, this means that the Entity is recorded in the Model as Erroneous: in this case, the General Service for Deep Copy is not called (this could be dangerous): hence the Counter-Part is produced but empty, it can be referenced. //! This method does nothing and returns False if the Protocol does not recognize <ent>. It basically makes a Deep Copy without changing the Types. It can be redefined for special uses.
") Copy;
		virtual Standard_Boolean Copy(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, const Standard_Boolean mapped, const Standard_Boolean errstat);

		/****** Interface_CopyTool::FillModel ******/
		/****** md5 signature: ce66908e7c19c6a4a9db70933c852f31 ******/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "
Parameters
----------
bmodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Fills a Model with the result of the transfer (TransferList) Commands copy of Header too, and calls RenewImpliedRefs.
") FillModel;
		void FillModel(const opencascade::handle<Interface_InterfaceModel> & bmodel);

		/****** Interface_CopyTool::LastCopiedAfter ******/
		/****** md5 signature: aad84202daf9f6c736716707bc1e4a41 ******/
		%feature("compactdefaultargs") LastCopiedAfter;
		%feature("autodoc", "
Parameters
----------
numfrom: int
ent: Standard_Transient
res: Standard_Transient

Return
-------
int

Description
-----------
Returns an copied Entity and its Result which were operated after last call to ClearLastFlags. It returns the first 'Last Copied Entity' which Number follows <numfrom>, Zero if none. It is used in a loop as follow: Integer num = 0; while ( (num = CopyTool.LastCopiedAfter(num,ent,res)) ) { .. Process Starting <ent> and its Result <res> }.
") LastCopiedAfter;
		Standard_Integer LastCopiedAfter(const Standard_Integer numfrom, opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

		/****** Interface_CopyTool::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model on which the CopyTool works.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Interface_CopyTool::RenewImpliedRefs ******/
		/****** md5 signature: 40b882fa61fc4daed48f8bb89f5d7134 ******/
		%feature("compactdefaultargs") RenewImpliedRefs;
		%feature("autodoc", "Return
-------
None

Description
-----------
Renews the Implied References. These References do not involve Copying of referenced Entities. For such a Reference, if the Entity which defines it AND the referenced Entity are both copied, then this Reference is renewed. Else it is deleted in the copied Entities. Remark: this concerns only some specific references, such as 'back pointers'.
") RenewImpliedRefs;
		void RenewImpliedRefs();

		/****** Interface_CopyTool::RootResult ******/
		/****** md5 signature: 6ce16052973bb08c300e2dc2ed1bab8e ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
withreports: bool (optional, default to Standard_False)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of Root copied Entities (those which were asked for copy by the user of CopyTool, not by copying another Entity).
") RootResult;
		Interface_EntityIterator RootResult(const Standard_Boolean withreports = Standard_False);

		/****** Interface_CopyTool::Search ******/
		/****** md5 signature: 96f59d0b51cfcc113410b586ef3795ea ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
bool

Description
-----------
Search for the result of a Starting Object (i.e. an Entity) Returns True if a Result is Bound (and fills 'result') Returns False if no result is Bound.
") Search;
		Standard_Boolean Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

		/****** Interface_CopyTool::SetControl ******/
		/****** md5 signature: 64e426bc76ca2f83a12255dffec8e1b1 ******/
		%feature("compactdefaultargs") SetControl;
		%feature("autodoc", "
Parameters
----------
othermap: Interface_CopyControl

Return
-------
None

Description
-----------
Changes the Map of Result for another one. This allows to work with a more sophisticated Mapping Control than the Standard one which is CopyMap (e.g. TransferProcess from Transfer).
") SetControl;
		void SetControl(const opencascade::handle<Interface_CopyControl> & othermap);

		/****** Interface_CopyTool::TransferEntity ******/
		/****** md5 signature: aca492321a7b9c62fac89c749bbea9fb ******/
		%feature("compactdefaultargs") TransferEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Transfers one Entity and records result into the Transfer List Calls method Transferred.
") TransferEntity;
		void TransferEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_CopyTool::Transferred ******/
		/****** md5 signature: 0fd56aa6288b9056a0f09f28c8c6abe6 ******/
		%feature("compactdefaultargs") Transferred;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Transfers one Entity, if not yet bound to a result Remark: For an Entity which is reported in the Starting Model, the ReportEntity will also be copied with its Content if it has one (at least ShallowCopy; Complete Copy if the Protocol recognizes the Content: see method Copy).
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
		/****** Interface_EntityCluster::Interface_EntityCluster ******/
		/****** md5 signature: 6a48e9387c8e9f341264b3e1eab6c7e9 ******/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty, non-chained, EntityCluster.
") Interface_EntityCluster;
		 Interface_EntityCluster();

		/****** Interface_EntityCluster::Interface_EntityCluster ******/
		/****** md5 signature: 334cdf9a9e23d80260833d407825d25f ******/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Creates a non-chained EntityCluster, filled with one Entity.
") Interface_EntityCluster;
		 Interface_EntityCluster(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityCluster::Interface_EntityCluster ******/
		/****** md5 signature: a40c745c34f2ee9441c8cc983c64cb3e ******/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "
Parameters
----------
ec: Interface_EntityCluster

Return
-------
None

Description
-----------
Creates an empty EntityCluster, chained with another one (that is, put BEFORE this other one in the list).
") Interface_EntityCluster;
		 Interface_EntityCluster(const opencascade::handle<Interface_EntityCluster> & ec);

		/****** Interface_EntityCluster::Interface_EntityCluster ******/
		/****** md5 signature: 7c75335c8a0977377938d37cc9bddfc9 ******/
		%feature("compactdefaultargs") Interface_EntityCluster;
		%feature("autodoc", "
Parameters
----------
ant: Standard_Transient
ec: Interface_EntityCluster

Return
-------
None

Description
-----------
Creates an EntityCluster, filled with a first Entity, and chained to another EntityCluster (BEFORE it, as above).
") Interface_EntityCluster;
		 Interface_EntityCluster(const opencascade::handle<Standard_Transient> & ant, const opencascade::handle<Interface_EntityCluster> & ec);

		/****** Interface_EntityCluster::Append ******/
		/****** md5 signature: 48722434508b90c52582bcdb47c3a1c8 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Appends an Entity to the Cluster. If it is not full, adds the entity directly inside itself. Else, transmits to its Next and Creates it if it does not yet exist.
") Append;
		void Append(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityCluster::FillIterator ******/
		/****** md5 signature: e32e298c5181f5a878a91b9da55bfb78 ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Fills an Iterator with designated Entities (includes Next).
") FillIterator;
		void FillIterator(Interface_EntityIterator & iter);

		/****** Interface_EntityCluster::NbEntities ******/
		/****** md5 signature: 533943455099343f106415a0a22e8ac9 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total count of Entities (including Next).
") NbEntities;
		Standard_Integer NbEntities();

		/****** Interface_EntityCluster::Remove ******/
		/****** md5 signature: 15abc7881be881e58d0907223e239cc2 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Removes an Entity from the Cluster. If it is not found, calls its Next one to do so. Returns True if it becomes itself empty, False else (thus, a Cluster which becomes empty is deleted from the list).
") Remove;
		Standard_Boolean Remove(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityCluster::Remove ******/
		/****** md5 signature: 37f5a5cdb681cc08ea6f88bf3c6c2dca ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Removes an Entity from the Cluster, given its rank. If <num> is greater than NbLocal, calls its Next with (num - NbLocal), Returns True if it becomes itself empty, False else.
") Remove;
		Standard_Boolean Remove(const Standard_Integer num);

		/****** Interface_EntityCluster::SetValue ******/
		/****** md5 signature: b9b839d4cab4434a1fde39fb5e695825 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
num: int
ent: Standard_Transient

Return
-------
None

Description
-----------
Changes an Entity given its rank.
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityCluster::Value ******/
		/****** md5 signature: a291325b4e5caa2a5ab946934090ec8b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Entity identified by its rank in the list (including Next).
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
		/****** Interface_EntityIterator::Interface_EntityIterator ******/
		/****** md5 signature: 685665124dd234df3a83f75507ec3d1b ******/
		%feature("compactdefaultargs") Interface_EntityIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Defines an empty iterator (see AddList & AddItem).
") Interface_EntityIterator;
		 Interface_EntityIterator();

		/****** Interface_EntityIterator::Interface_EntityIterator ******/
		/****** md5 signature: d1f133a9b3912cf24f8d9444ce7616b8 ******/
		%feature("compactdefaultargs") Interface_EntityIterator;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
None

Description
-----------
Defines an iterator on a list, directly i.e. without copying it.
") Interface_EntityIterator;
		 Interface_EntityIterator(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** Interface_EntityIterator::AddItem ******/
		/****** md5 signature: 3f10cb57683e1144e46e0f94e8de6fea ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
None

Description
-----------
Adds to the iteration list a defined entity.
") AddItem;
		void AddItem(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_EntityIterator::AddList ******/
		/****** md5 signature: aa5a44f7eb178e7bc497b41c38a65aad ******/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
None

Description
-----------
Gets a list of entities and adds its to the iteration list.
") AddList;
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** Interface_EntityIterator::Content ******/
		/****** md5 signature: 7b256486d5a1be7418a47021add2e3df ******/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the content of the Iterator, accessed through a Handle to be used by a frontal-engine logic Returns an empty Sequence if the Iterator is empty Calls Start if not yet done.
") Content;
		opencascade::handle<TColStd_HSequenceOfTransient> Content();

		/****** Interface_EntityIterator::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears data of iteration.
") Destroy;
		void Destroy();

		/****** Interface_EntityIterator::GetOneItem ******/
		/****** md5 signature: 1b4381c0765863bea2533a714d734ccd ******/
		%feature("compactdefaultargs") GetOneItem;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
None

Description
-----------
same as AddItem (kept for compatibility).
") GetOneItem;
		void GetOneItem(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_EntityIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Says if there are other entities (vertices) to iterate the first time, calls Start.
") More;
		Standard_Boolean More();

		/****** Interface_EntityIterator::NbEntities ******/
		/****** md5 signature: 533943455099343f106415a0a22e8ac9 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of entities which will be iterated on Calls Start if not yet done.
") NbEntities;
		Standard_Integer NbEntities();

		/****** Interface_EntityIterator::NbTyped ******/
		/****** md5 signature: 999a48c8c6ac9f22884970d7325b38c7 ******/
		%feature("compactdefaultargs") NbTyped;
		%feature("autodoc", "
Parameters
----------
type: Standard_Type

Return
-------
int

Description
-----------
Returns count of entities of a given type (kind of).
") NbTyped;
		Standard_Integer NbTyped(const opencascade::handle<Standard_Type> & type);

		/****** Interface_EntityIterator::Next ******/
		/****** md5 signature: db8382462e33c960ba2eedf02613f499 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets iteration to the next entity (vertex) to give.
") Next;
		void Next();

		/****** Interface_EntityIterator::SelectType ******/
		/****** md5 signature: 1c0dfe46bcf42d7b3d927e5df31e1e68 ******/
		%feature("compactdefaultargs") SelectType;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type
keep: bool

Return
-------
None

Description
-----------
Selects entities with are Kind of a given type, keep only them (is keep is True) or reject only them (if keep is False).
") SelectType;
		void SelectType(const opencascade::handle<Standard_Type> & atype, const Standard_Boolean keep);

		/****** Interface_EntityIterator::Start ******/
		/****** md5 signature: dde3966b7a16919fa06cc08ef880a579 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Allows re-iteration (useless for the first iteration).
") Start;
		virtual void Start();

		/****** Interface_EntityIterator::Typed ******/
		/****** md5 signature: 89394515bc1f2d9fa11805dfbe59ac72 ******/
		%feature("compactdefaultargs") Typed;
		%feature("autodoc", "
Parameters
----------
type: Standard_Type

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of entities of a given type (kind of).
") Typed;
		Interface_EntityIterator Typed(const opencascade::handle<Standard_Type> & type);

		/****** Interface_EntityIterator::Value ******/
		/****** md5 signature: b1443f8da90189a74241bf586c57fc63 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the current Entity iterated, to be used by Interface tools.
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
		/****** Interface_EntityList::Interface_EntityList ******/
		/****** md5 signature: 627b17e512379a9e8b95fe4155041e80 ******/
		%feature("compactdefaultargs") Interface_EntityList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a List as being empty.
") Interface_EntityList;
		 Interface_EntityList();

		/****** Interface_EntityList::Add ******/
		/****** md5 signature: c44fbf384fa2d194a65791bc9700727c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Adds an Entity to the list, that is, with NO REGARD about the order (faster than Append if count becomes greater than 10).
") Add;
		void Add(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityList::Append ******/
		/****** md5 signature: 48722434508b90c52582bcdb47c3a1c8 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Appends an Entity, that is to the END of the list (keeps order, but works slowerly than Add, see below).
") Append;
		void Append(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the List.
") Clear;
		void Clear();

		/****** Interface_EntityList::FillIterator ******/
		/****** md5 signature: e32e298c5181f5a878a91b9da55bfb78 ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
fills an Iterator with the content of the list (normal way to consult a list which has been filled with Add).
") FillIterator;
		void FillIterator(Interface_EntityIterator & iter);

		/****** Interface_EntityList::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the list is empty.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** Interface_EntityList::NbEntities ******/
		/****** md5 signature: 533943455099343f106415a0a22e8ac9 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Entities.
") NbEntities;
		Standard_Integer NbEntities();

		/****** Interface_EntityList::NbTypedEntities ******/
		/****** md5 signature: 4a49de8b8d8c868d4307a6b3433312af ******/
		%feature("compactdefaultargs") NbTypedEntities;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
Returns count of Entities of a given Type (0: none).
") NbTypedEntities;
		Standard_Integer NbTypedEntities(const opencascade::handle<Standard_Type> & atype);

		/****** Interface_EntityList::Remove ******/
		/****** md5 signature: bc1ae58548c5800e7ea8050cad381881 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Removes an Entity from the list, if it is there.
") Remove;
		void Remove(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityList::Remove ******/
		/****** md5 signature: e3847406ec281ce8f6c5ad43b1693cec ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Removes an Entity from the list, given its rank.
") Remove;
		void Remove(const Standard_Integer num);

		/****** Interface_EntityList::SetValue ******/
		/****** md5 signature: b9b839d4cab4434a1fde39fb5e695825 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
num: int
ent: Standard_Transient

Return
-------
None

Description
-----------
Returns an Item given its number. Beware about the way the list was filled (see above, Add and Append).
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityList::TypedEntity ******/
		/****** md5 signature: 67e22368a55b7a38e5b3e70c37bf0cb3 ******/
		%feature("compactdefaultargs") TypedEntity;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type
num: int (optional, default to 0)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Entity which is of a given type. If num = 0 (D), there must be ONE AND ONLY ONE If num > 0, returns the num-th entity of this type.
") TypedEntity;
		opencascade::handle<Standard_Transient> TypedEntity(const opencascade::handle<Standard_Type> & atype, const Standard_Integer num = 0);

		/****** Interface_EntityList::Value ******/
		/****** md5 signature: a291325b4e5caa2a5ab946934090ec8b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an Item given its number. Beware about the way the list was filled (see above, Add and Append).
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
		/****** Interface_FileParameter::Interface_FileParameter ******/
		/****** md5 signature: 10c28b1eddd0be7d98b4d0e9b8f5e694 ******/
		%feature("compactdefaultargs") Interface_FileParameter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Interface_FileParameter;
		 Interface_FileParameter();

		/****** Interface_FileParameter::CValue ******/
		/****** md5 signature: e98648cfa0854064b9564f027ea87801 ******/
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "Return
-------
str

Description
-----------
Same as above, but as a CString (for immediate exploitation) was C++: return const.
") CValue;
		Standard_CString CValue();

		/****** Interface_FileParameter::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears stored data: frees memory taken for the String Value.
") Clear;
		void Clear();

		/****** Interface_FileParameter::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Destructor. Does nothing because Memory is managed by ParamSet.
") Destroy;
		void Destroy();

		/****** Interface_FileParameter::EntityNumber ******/
		/****** md5 signature: 3b5de40d76500537f54e61dc1880dcc0 ******/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns value set by SetEntityNumber.
") EntityNumber;
		Standard_Integer EntityNumber();

		/****** Interface_FileParameter::Init ******/
		/****** md5 signature: 605189a0f3dfab6af921265c543ce052 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
val: str
typ: Interface_ParamType

Return
-------
None

Description
-----------
Fills fields (with Entity Number set to zero).
") Init;
		void Init(TCollection_AsciiString val, const Interface_ParamType typ);

		/****** Interface_FileParameter::Init ******/
		/****** md5 signature: d9af5d9fa4a25bf77ef7ae426708d16d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
val: str
typ: Interface_ParamType

Return
-------
None

Description
-----------
Same as above, but builds the Value from a CString.
") Init;
		void Init(Standard_CString val, const Interface_ParamType typ);

		/****** Interface_FileParameter::ParamType ******/
		/****** md5 signature: dc18453a4564d25585accbb5ebf0a4f7 ******/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Return
-------
Interface_ParamType

Description
-----------
Returns the type of the parameter.
") ParamType;
		Interface_ParamType ParamType();

		/****** Interface_FileParameter::SetEntityNumber ******/
		/****** md5 signature: 983185a3faf631b23ae4c33cb29ff8e7 ******/
		%feature("compactdefaultargs") SetEntityNumber;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Allows to set a reference to an Entity in a numbered list.
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
		/****** Interface_FileReaderData::AddParam ******/
		/****** md5 signature: 49ab830a569601354ff545df352b0db0 ******/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "
Parameters
----------
num: int
aval: str
atype: Interface_ParamType
nument: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a parameter to record no 'num' and fills its fields (EntityNumber is optional) Warning: <aval> is assumed to be memory-managed elsewhere: it is NOT copied. This gives a best speed: strings remain stored in pages of characters.
") AddParam;
		void AddParam(const Standard_Integer num, Standard_CString aval, const Interface_ParamType atype, const Standard_Integer nument = 0);

		/****** Interface_FileReaderData::AddParam ******/
		/****** md5 signature: cbb0f2de6076dbed8f2cd91097dbd947 ******/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "
Parameters
----------
num: int
aval: str
atype: Interface_ParamType
nument: int (optional, default to 0)

Return
-------
None

Description
-----------
Same as above, but gets a AsciiString from TCollection Remark that the content of the AsciiString is locally copied (because its content is most often lost after using).
") AddParam;
		void AddParam(const Standard_Integer num, TCollection_AsciiString aval, const Interface_ParamType atype, const Standard_Integer nument = 0);

		/****** Interface_FileReaderData::AddParam ******/
		/****** md5 signature: cd0f1b4fe80c892227e65eb7256dde7c ******/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "
Parameters
----------
num: int
FP: Interface_FileParameter

Return
-------
None

Description
-----------
Same as above, but gets a complete FileParameter Warning: Content of <FP> is NOT copied: its original address and space in memory are assumed to be managed elsewhere (see ParamSet).
") AddParam;
		void AddParam(const Standard_Integer num, const Interface_FileParameter & FP);

		/****** Interface_FileReaderData::BindEntity ******/
		/****** md5 signature: 20492aaa4dc299bd67a1910947dfdc5e ******/
		%feature("compactdefaultargs") BindEntity;
		%feature("autodoc", "
Parameters
----------
num: int
ent: Standard_Transient

Return
-------
None

Description
-----------
Binds an entity to a record.
") BindEntity;
		void BindEntity(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_FileReaderData::BoundEntity ******/
		/****** md5 signature: 44a67375acd0858955b64bd37ff52347 ******/
		%feature("compactdefaultargs") BoundEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the entity bound to a record, set by SetEntities.
") BoundEntity;
		const opencascade::handle<Standard_Transient> & BoundEntity(const Standard_Integer num);

		/****** Interface_FileReaderData::ChangeParam ******/
		/****** md5 signature: f1f2af05c4712705f3e1b45bd7a9a406 ******/
		%feature("compactdefaultargs") ChangeParam;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
Interface_FileParameter

Description
-----------
Same as above, but in order to be modified on place.
") ChangeParam;
		Interface_FileParameter & ChangeParam(const Standard_Integer num, const Standard_Integer nump);

		/****** Interface_FileReaderData::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Destructor (waiting for memory management).
") Destroy;
		void Destroy();

		/****** Interface_FileReaderData::Fastof ******/
		/****** md5 signature: 2de3aa8dfb81cfc084890473f14c218d ******/
		%feature("compactdefaultargs") Fastof;
		%feature("autodoc", "
Parameters
----------
str: str

Return
-------
float

Description
-----------
Same spec.s as standard <atof> but 5 times faster.
") Fastof;
		static Standard_Real Fastof(Standard_CString str);

		/****** Interface_FileReaderData::FindNextRecord ******/
		/****** md5 signature: fb2560ab5021a7b300ace6b22efac7bc ******/
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Determines the record number defining an Entity following a given record number. Specific to each sub-class of FileReaderData. Returning zero means no record found.
") FindNextRecord;
		virtual Standard_Integer FindNextRecord(const Standard_Integer num);

		/****** Interface_FileReaderData::InitParams ******/
		/****** md5 signature: bfb17402e023749815f9bb51607f8362 ******/
		%feature("compactdefaultargs") InitParams;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
attaches an empty ParamList to a Record.
") InitParams;
		void InitParams(const Standard_Integer num);

		/****** Interface_FileReaderData::IsErrorLoad ******/
		/****** md5 signature: 6ebd932c81cca5f3fefd96348c513a41 ******/
		%feature("compactdefaultargs") IsErrorLoad;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the status 'Error Load' has been set (to True or False).
") IsErrorLoad;
		Standard_Boolean IsErrorLoad();

		/****** Interface_FileReaderData::IsParamDefined ******/
		/****** md5 signature: ed3dab666107da204e7759a1b035a969 ******/
		%feature("compactdefaultargs") IsParamDefined;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
bool

Description
-----------
Returns True if parameter 'nump' of record 'num' is defined (it is not if its type is ParamVoid).
") IsParamDefined;
		Standard_Boolean IsParamDefined(const Standard_Integer num, const Standard_Integer nump);

		/****** Interface_FileReaderData::NbEntities ******/
		/****** md5 signature: ab5845a31867507585d5d3908ca3a16a ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of entities. Depending of each norm, records can be Entities or SubParts (SubList in STEP, SubGroup in SET ...). NbEntities counts only Entities, not Subs Used for memory reservation in InterfaceModel Default implementation uses FindNextRecord Can be redefined into a more performant way.
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****** Interface_FileReaderData::NbParams ******/
		/****** md5 signature: 444b962634792441aa4386da72bb86a3 ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns count of parameters attached to record 'num' If <num> = 0, returns the total recorded count of parameters.
") NbParams;
		Standard_Integer NbParams(const Standard_Integer num);

		/****** Interface_FileReaderData::NbRecords ******/
		/****** md5 signature: 4cdd54a49baca0bb87c9a76a070d4161 ******/
		%feature("compactdefaultargs") NbRecords;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of registered records That is, value given for Initialization (can be redefined).
") NbRecords;
		virtual Standard_Integer NbRecords();

		/****** Interface_FileReaderData::Param ******/
		/****** md5 signature: 01d82022cc2948d2e6b9cd579181f8e4 ******/
		%feature("compactdefaultargs") Param;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
Interface_FileParameter

Description
-----------
Returns parameter 'nump' of record 'num', as a complete FileParameter.
") Param;
		const Interface_FileParameter & Param(const Standard_Integer num, const Standard_Integer nump);

		/****** Interface_FileReaderData::ParamCValue ******/
		/****** md5 signature: 56f6b32baee7265ac54bb79c5669632b ******/
		%feature("compactdefaultargs") ParamCValue;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
str

Description
-----------
Same as above, but as a CString was C++: return const.
") ParamCValue;
		Standard_CString ParamCValue(const Standard_Integer num, const Standard_Integer nump);

		/****** Interface_FileReaderData::ParamEntity ******/
		/****** md5 signature: 7e8a196be284eb0e3e1b2a2dbd45f003 ******/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the StepEntity referenced by a parameter Error if none.
") ParamEntity;
		const opencascade::handle<Standard_Transient> & ParamEntity(const Standard_Integer num, const Standard_Integer nump);

		/****** Interface_FileReaderData::ParamFirstRank ******/
		/****** md5 signature: cf6bb15954cc88ad7b3d34301ce9dd64 ******/
		%feature("compactdefaultargs") ParamFirstRank;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns the absolute rank of the beginning of a record (its list is from ParamFirstRank+1 to ParamFirstRank+NbParams).
") ParamFirstRank;
		Standard_Integer ParamFirstRank(const Standard_Integer num);

		/****** Interface_FileReaderData::ParamNumber ******/
		/****** md5 signature: 93ae7fc0b31be5ae384b53b3e789927c ******/
		%feature("compactdefaultargs") ParamNumber;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
int

Description
-----------
Returns record number of an entity referenced by a parameter of type Ident; 0 if no EntityNumber has been determined Note that it is used to reference Entities but also Sublists (sublists are not objects, but internal descriptions).
") ParamNumber;
		Standard_Integer ParamNumber(const Standard_Integer num, const Standard_Integer nump);

		/****** Interface_FileReaderData::ParamType ******/
		/****** md5 signature: f6838b8aab8ad4ba5ebb10d0df766162 ******/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
Interface_ParamType

Description
-----------
Returns type of parameter 'nump' of record 'num' Returns literal value of parameter 'nump' of record 'num' was C++: return const &.
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num, const Standard_Integer nump);

		/****** Interface_FileReaderData::Params ******/
		/****** md5 signature: da09bb21c50e10920acb7bee59692444 ******/
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_ParamList>

Description
-----------
Returns the complete ParamList of a record (read only) num = 0 to return the whole param list for the file.
") Params;
		opencascade::handle<Interface_ParamList> Params(const Standard_Integer num);

		/****** Interface_FileReaderData::ResetErrorLoad ******/
		/****** md5 signature: ff1f2143e5d4f24f07df049dd98c3ec3 ******/
		%feature("compactdefaultargs") ResetErrorLoad;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the former value of status 'Error Load' then resets it Used to read the status then ensure it is reset.
") ResetErrorLoad;
		Standard_Boolean ResetErrorLoad();

		/****** Interface_FileReaderData::SetErrorLoad ******/
		/****** md5 signature: 0317d8fd41572c2017db42b6762a896b ******/
		%feature("compactdefaultargs") SetErrorLoad;
		%feature("autodoc", "
Parameters
----------
val: bool

Return
-------
None

Description
-----------
Sets the status 'Error Load' on, to overside check fails <val> True: declares unloaded <val> False: declares loaded If not called before loading (see FileReaderTool), check fails give the status IsErrorLoad says if SetErrorLoad has been called by user ResetErrorLoad resets it (called by FileReaderTool) This allows to specify that the currently loaded entity remains unloaded (because of syntactic fail).
") SetErrorLoad;
		void SetErrorLoad(const Standard_Boolean val);

		/****** Interface_FileReaderData::SetParam ******/
		/****** md5 signature: 2948cd7887037c996e67b001b8ecce1c ******/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
FP: Interface_FileParameter

Return
-------
None

Description
-----------
Sets a new value for a parameter of a record, given by: num: record number; nump: parameter number in the record.
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
		/****** Interface_FileReaderTool::AnalyseRecord ******/
		/****** md5 signature: 8991919de54e808e3c29871e15369043 ******/
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "
Parameters
----------
num: int
anent: Standard_Transient
acheck: Interface_Check

Return
-------
bool

Description
-----------
Fills an Entity, given record no; specific to each Interface, called by AnalyseFile from InterfaceModel (which manages its calling arguments) To work, each Interface can define a method in its proper Transient class, like this (given as an example): AnalyseRecord (me: mutable; FR: in out FileReaderTool; num: Integer; acheck: in out Check) returns Boolean; and call it from AnalyseRecord //! Returned Value: True if the entity could be loaded, False else (in case of syntactic fail).
") AnalyseRecord;
		virtual Standard_Boolean AnalyseRecord(const Standard_Integer num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

		/****** Interface_FileReaderTool::BeginRead ******/
		/****** md5 signature: ea0231aaf37d47bdb27fe7301b32e5f7 ******/
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Fills model's header; each Interface defines for its Model its own file header; this method fills it from FileReaderTool.+ It is called by AnalyseFile from InterfaceModel.
") BeginRead;
		virtual void BeginRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_FileReaderTool::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear fields.
") Clear;
		void Clear();

		/****** Interface_FileReaderTool::Data ******/
		/****** md5 signature: 49aab703e17779aa888cdea315837d69 ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_FileReaderData>

Description
-----------
Returns the FileReaderData which is used to work.
") Data;
		opencascade::handle<Interface_FileReaderData> Data();

		/****** Interface_FileReaderTool::EndRead ******/
		/****** md5 signature: c5425c5baff54d6d611eb77a975e4457 ******/
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Ends file reading after reading all the entities default is doing nothing; redefinable as necessary.
") EndRead;
		virtual void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_FileReaderTool::ErrorHandle ******/
		/****** md5 signature: 8cd52cc3593d14fa4239b9d171ad1cc0 ******/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns ErrorHandle flag.
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****** Interface_FileReaderTool::LoadModel ******/
		/****** md5 signature: 995ec1cbe3fa773a68344ea7366dfca3 ******/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Reads and fills Entities from the FileReaderData set by SetData to an InterfaceModel. It enchains required operations, the specific ones correspond to deferred methods (below) to be defined for each Norm. It manages also error recovery and trace. Remark: it calls SetModel. It Can raise any error which can occur during a load operation, unless Error Handling is set. This method can also be redefined if judged necessary.
") LoadModel;
		void LoadModel(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_FileReaderTool::LoadedEntity ******/
		/****** md5 signature: 6c28966f22e0448001189f7322930ddf ******/
		%feature("compactdefaultargs") LoadedEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Reads, Fills and Returns one Entity read from a Record of the FileReaderData. This Method manages also case of Fail or Warning, by producing a ReportEntyty plus , for a Fail, a literal Content (as an UnknownEntity). Performs also Trace.
") LoadedEntity;
		opencascade::handle<Standard_Transient> LoadedEntity(const Standard_Integer num);

		/****** Interface_FileReaderTool::Messenger ******/
		/****** md5 signature: c51845cdafadb143338935f519a3d7c7 ******/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Returns Messenger used for outputting messages. The returned object is guaranteed to be non-null; default is Message::Messenger().
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****** Interface_FileReaderTool::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the stored Model.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Interface_FileReaderTool::NewModel ******/
		/****** md5 signature: ffdc5f59840456ad78fada00ad126d58 ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates an empty Model of the norm. Uses Protocol to do it.
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** Interface_FileReaderTool::Protocol ******/
		/****** md5 signature: 1441632a4f2333f871a63bf366a58f3e ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol given at creation time.
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****** Interface_FileReaderTool::Recognize ******/
		/****** md5 signature: 9f38dcf5fb1595ae7483daff0d787242 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
num: int
ach: Interface_Check
ent: Standard_Transient

Return
-------
bool

Description
-----------
Recognizes a record, given its number. Specific to each Interface; called by SetEntities. It can call the basic method RecognizeByLib. Returns False if recognition has failed, True else. <ach> has not to be filled if simply Recognition has failed: it must record true error messages: RecognizeByLib can generate error messages if NewRead is called //! Note that it works thru a Recognizer (method Evaluate) which has to be memorized before starting.
") Recognize;
		virtual Standard_Boolean Recognize(const Standard_Integer num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****** Interface_FileReaderTool::RecognizeByLib ******/
		/****** md5 signature: 43604696c88d235293f2a7286a049315 ******/
		%feature("compactdefaultargs") RecognizeByLib;
		%feature("autodoc", "
Parameters
----------
num: int
glib: Interface_GeneralLib
rlib: Interface_ReaderLib
ach: Interface_Check
ent: Standard_Transient

Return
-------
bool

Description
-----------
Recognizes a record with the help of Libraries. Can be used to implement the method Recognize. <rlib> is used to find Protocol and CaseNumber to apply <glib> performs the creation (by service NewVoid, or NewRead if NewVoid gave no result) <ach> is a check, which is transmitted to NewRead if it is called, gives a result but which is false <ent> is the result Returns False if recognition has failed, True else.
") RecognizeByLib;
		Standard_Boolean RecognizeByLib(const Standard_Integer num, Interface_GeneralLib & glib, Interface_ReaderLib & rlib, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****** Interface_FileReaderTool::SetData ******/
		/****** md5 signature: 4d43cc70376bf1ba45d9a38d1f369c8d ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
reader: Interface_FileReaderData
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Sets Data to a FileReaderData. Works with a Protocol.
") SetData;
		void SetData(const opencascade::handle<Interface_FileReaderData> & reader, const opencascade::handle<Interface_Protocol> & protocol);

		/****** Interface_FileReaderTool::SetEntities ******/
		/****** md5 signature: 6829df1058b14254ac43288db26b08c1 ******/
		%feature("compactdefaultargs") SetEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Fills records with empty entities; once done, each entity can ask the FileReaderTool for any entity referenced through an identifier. Calls Recognize which is specific to each specific type of FileReaderTool.
") SetEntities;
		void SetEntities();

		/****** Interface_FileReaderTool::SetErrorHandle ******/
		/****** md5 signature: cea15a20003832113608c312ef431fa6 ******/
		%feature("compactdefaultargs") SetErrorHandle;
		%feature("autodoc", "
Parameters
----------
err: bool

Return
-------
None

Description
-----------
Allows controlling whether exception raisings are handled If err is False, they are not (hence, dbx can take control) If err is True, they are, and they are traced (by putting on messenger Entity's Number and file record num) Default given at Model's creation time is True.
") SetErrorHandle;
		void SetErrorHandle(const Standard_Boolean err);

		/****** Interface_FileReaderTool::SetMessenger ******/
		/****** md5 signature: a9749da4085afccb49a47ccebbb86045 ******/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "
Parameters
----------
messenger: Message_Messenger

Return
-------
None

Description
-----------
Sets Messenger used for outputting messages.
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & messenger);

		/****** Interface_FileReaderTool::SetModel ******/
		/****** md5 signature: 4df40e0b744cd676e093c21750a0c572 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Stores a Model. Used when the Model has been loaded.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_FileReaderTool::SetTraceLevel ******/
		/****** md5 signature: b2d3fab409a6e2832ea6fb56a22812c1 ******/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "
Parameters
----------
tracelev: int

Return
-------
None

Description
-----------
Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages Default is 1: Errors traced.
") SetTraceLevel;
		void SetTraceLevel(const Standard_Integer tracelev);

		/****** Interface_FileReaderTool::TraceLevel ******/
		/****** md5 signature: 71a5f63811c28c261ef1f9e77d8b2618 ******/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns trace level used for outputting messages.
") TraceLevel;
		Standard_Integer TraceLevel();

		/****** Interface_FileReaderTool::UnknownEntity ******/
		/****** md5 signature: e1212622c449569754bddae17d05661d ******/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Provides an unknown entity, specific to the Interface called by SetEntities when Recognize has failed (Unknown alone) or by LoadModel when an Entity has caused a Fail on reading (to keep at least its literal description) Uses Protocol to do it.
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
		/****** Interface_FloatWriter::Interface_FloatWriter ******/
		/****** md5 signature: 022ac7db62033741bbe1ea50a9edbdce ******/
		%feature("compactdefaultargs") Interface_FloatWriter;
		%feature("autodoc", "
Parameters
----------
chars: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a FloatWriter ready to work, with default options - - zero suppress option is set - main format is set to '%E' - secondary format is set to '%f' for values between 0.1 and 1000. in absolute values If <chars> is given (and positive), it will produce options to produce this count of characters: '%<chars>f','%<chars>%E'.
") Interface_FloatWriter;
		 Interface_FloatWriter(const Standard_Integer chars = 0);

		/****** Interface_FloatWriter::Convert ******/
		/****** md5 signature: b67fef250ce64c3c0c648b18db37f72c ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
val: float
text: str
zerosup: bool
Range1: float
Range2: float
mainform: str
rangeform: str

Return
-------
int

Description
-----------
This class method converts a Real Value to a string, given options given as arguments. It can be called independently. Warning: even if declared in, content of <text> will be modified.
") Convert;
		static Standard_Integer Convert(const Standard_Real val, Standard_CString text, const Standard_Boolean zerosup, const Standard_Real Range1, const Standard_Real Range2, Standard_CString mainform, Standard_CString rangeform);

		/****** Interface_FloatWriter::FormatForRange ******/
		/****** md5 signature: 4c66511040ab21973efd4fb8a5336a70 ******/
		%feature("compactdefaultargs") FormatForRange;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the format for range, if set Meaningful only if <range> from Options is True was C++: return const.
") FormatForRange;
		Standard_CString FormatForRange();

		/****** Interface_FloatWriter::MainFormat ******/
		/****** md5 signature: d5f20ec9bffc0b0df53410e928ed4e20 ******/
		%feature("compactdefaultargs") MainFormat;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the main format was C++: return const.
") MainFormat;
		Standard_CString MainFormat();

		/****** Interface_FloatWriter::Options ******/
		/****** md5 signature: 0f9f7a2d709a585ab79f1b8ab7b7da24 ******/
		%feature("compactdefaultargs") Options;
		%feature("autodoc", "
Parameters
----------

Return
-------
zerosup: bool
range: bool
R1: float
R2: float

Description
-----------
Returns active options: <zerosup> is the option ZeroSuppress, <range> is True if a range is set, False else R1,R2 give the range (if it is set).
") Options;
		void Options(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Interface_FloatWriter::SetDefaults ******/
		/****** md5 signature: fd7085146d9f759589ce4b06625f6361 ******/
		%feature("compactdefaultargs") SetDefaults;
		%feature("autodoc", "
Parameters
----------
chars: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets again options to the defaults given by Create.
") SetDefaults;
		void SetDefaults(const Standard_Integer chars = 0);

		/****** Interface_FloatWriter::SetFormat ******/
		/****** md5 signature: e09be756d5e71f033f39c42255999e72 ******/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "
Parameters
----------
form: str
reset: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets a specific Format for Sending Reals (main format) (Default from Creation is '%E') If <reset> is given True (default), this call clears effects of former calls to SetFormatForRange and SetZeroSuppress.
") SetFormat;
		void SetFormat(Standard_CString form, const Standard_Boolean reset = Standard_True);

		/****** Interface_FloatWriter::SetFormatForRange ******/
		/****** md5 signature: dae1e339fb84d300b23b00a19e3bdceb ******/
		%feature("compactdefaultargs") SetFormatForRange;
		%feature("autodoc", "
Parameters
----------
form: str
R1: float
R2: float

Return
-------
None

Description
-----------
Sets a secondary Format for Real, to be applied between R1 and R2 (in absolute values). A Call to SetRealForm cancels this secondary form if <reset> is True. (Default from Creation is '%f' between 0.1 and 1000.) Warning: if the condition (0. <= R1 < R2) is not fulfilled, this secondary form is canceled.
") SetFormatForRange;
		void SetFormatForRange(Standard_CString form, const Standard_Real R1, const Standard_Real R2);

		/****** Interface_FloatWriter::SetZeroSuppress ******/
		/****** md5 signature: 37a02e3338eee7e275b19584090a7212 ******/
		%feature("compactdefaultargs") SetZeroSuppress;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets Sending Real Parameters to suppress trailing Zeros and Null Exponent ('E+00'), if <mode> is given True, Resets this mode if <mode> is False (in addition to Real Forms) A call to SetRealFrom resets this mode to False ig <reset> is given True (Default from Creation is True).
") SetZeroSuppress;
		void SetZeroSuppress(const Standard_Boolean mode);

		/****** Interface_FloatWriter::Write ******/
		/****** md5 signature: 59b8b728e9dea7c104d93078939a8f17 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
val: float
text: str

Return
-------
int

Description
-----------
Writes a Real value <val> to a string <text> by using the options. Returns the useful Length of produced string. It calls the class method Convert. Warning: <text> is assumed to be wide enough (20-30 is correct) And, even if declared in, its content will be modified.
") Write;
		Standard_Integer Write(const Standard_Real val, Standard_CString text);

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
		/****** Interface_GTool::Interface_GTool ******/
		/****** md5 signature: d447996be6706f4a0b8afd8e40dacd2a ******/
		%feature("compactdefaultargs") Interface_GTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty, not set, GTool.
") Interface_GTool;
		 Interface_GTool();

		/****** Interface_GTool::Interface_GTool ******/
		/****** md5 signature: 7d65dec81ae8d78db722f997cc8c0b18 ******/
		%feature("compactdefaultargs") Interface_GTool;
		%feature("autodoc", "
Parameters
----------
proto: Interface_Protocol
nbent: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a GTool from a Protocol Optional starting count of entities.
") Interface_GTool;
		 Interface_GTool(const opencascade::handle<Interface_Protocol> & proto, const Standard_Integer nbent = 0);

		/****** Interface_GTool::ClearEntities ******/
		/****** md5 signature: 90404488abdcf1cf8bf25e6c045c694c ******/
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the maps which record, for each already recorded entity its Module and Case Number.
") ClearEntities;
		void ClearEntities();

		/****** Interface_GTool::Lib ******/
		/****** md5 signature: 18692df48b34b8e9f55d362fa00f1cf8 ******/
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "Return
-------
Interface_GeneralLib

Description
-----------
Returns the GeneralLib itself.
") Lib;
		Interface_GeneralLib & Lib();

		/****** Interface_GTool::Protocol ******/
		/****** md5 signature: 1441632a4f2333f871a63bf366a58f3e ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol. Warning: it can be Null.
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****** Interface_GTool::Reservate ******/
		/****** md5 signature: a6488dc43344714c8373a9496f5dba2a ******/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "
Parameters
----------
nb: int
enforce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Reservates maps for a count of entities <enforce> False: minimum count <enforce> True: clears former reservations Does not clear the maps.
") Reservate;
		void Reservate(const Standard_Integer nb, const Standard_Boolean enforce = Standard_False);

		/****** Interface_GTool::Select ******/
		/****** md5 signature: 79205ee17a76fbfb6a9fbbe9fe1a3799 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
gmod: Interface_GeneralModule
enforce: bool (optional, default to Standard_False)

Return
-------
CN: int

Description
-----------
Selects for an entity, its Module and Case Number It is optimised: once done for each entity, the result is mapped and the GeneralLib is not longer queried <enforce> True overpasses this optimisation.
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Interface_GeneralModule> & gmod, Standard_Integer &OutValue, const Standard_Boolean enforce = Standard_False);

		/****** Interface_GTool::SetProtocol ******/
		/****** md5 signature: 7a71abccdd374448d4d493b6cc90407c ******/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "
Parameters
----------
proto: Interface_Protocol
enforce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets a new Protocol if <enforce> is False and the new Protocol equates the old one then nothing is done.
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & proto, const Standard_Boolean enforce = Standard_False);

		/****** Interface_GTool::SetSignType ******/
		/****** md5 signature: a41aae67f5d11d1183e403f69f4a9291 ******/
		%feature("compactdefaultargs") SetSignType;
		%feature("autodoc", "
Parameters
----------
sign: Interface_SignType

Return
-------
None

Description
-----------
Sets a new SignType.
") SetSignType;
		void SetSignType(const opencascade::handle<Interface_SignType> & sign);

		/****** Interface_GTool::SignName ******/
		/****** md5 signature: c80dec5f02b4d9bc775dd97b309227ce ******/
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the Name of the SignType, or 'Class Name'.
") SignName;
		Standard_CString SignName();

		/****** Interface_GTool::SignType ******/
		/****** md5 signature: a97b35b4b087c5effacf0c1cc3ab8526 ******/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_SignType>

Description
-----------
Returns the SignType. Can be null.
") SignType;
		opencascade::handle<Interface_SignType> SignType();

		/****** Interface_GTool::SignValue ******/
		/****** md5 signature: b369e52ecf603b4cf3d9679e9dbc0ad6 ******/
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
str

Description
-----------
Returns the Signature for a Transient Object in a Model It calls SignType to do that If SignType is not defined, return ClassName of <ent>.
") SignValue;
		Standard_CString SignValue(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****** Interface_GeneralLib::Interface_GeneralLib ******/
		/****** md5 signature: 8f7d43b287cf0d73133272e9eefa2c79 ******/
		%feature("compactdefaultargs") Interface_GeneralLib;
		%feature("autodoc", "
Parameters
----------
aprotocol: Interface_Protocol

Return
-------
None

Description
-----------
Creates a Library which complies with a Protocol, that is: Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources.
") Interface_GeneralLib;
		 Interface_GeneralLib(const opencascade::handle<Interface_Protocol> & aprotocol);

		/****** Interface_GeneralLib::Interface_GeneralLib ******/
		/****** md5 signature: 2e5af17300a8a9ababda5ad49844e979 ******/
		%feature("compactdefaultargs") Interface_GeneralLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Library: it will later by filled by method AddProtocol.
") Interface_GeneralLib;
		 Interface_GeneralLib();

		/****** Interface_GeneralLib::AddProtocol ******/
		/****** md5 signature: 97bedbaaa5336e800a60d78a56ab8c60 ******/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "
Parameters
----------
aprotocol: Standard_Transient

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) to the Library, given the class of a Protocol. Takes Resources into account. (if <aprotocol> is not of type TheProtocol, it is not added).
") AddProtocol;
		void AddProtocol(const opencascade::handle<Standard_Transient> & aprotocol);

		/****** Interface_GeneralLib::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of Modules of a library (can be used to redefine the order of Modules before action: Clear then refill the Library by calls to AddProtocol).
") Clear;
		void Clear();

		/****** Interface_GeneralLib::Module ******/
		/****** md5 signature: 786fb9d122db15779294d93c1e06036b ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_GeneralModule>

Description
-----------
Returns the current Module in the Iteration.
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****** Interface_GeneralLib::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Modules to iterate on.
") More;
		Standard_Boolean More();

		/****** Interface_GeneralLib::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterates by getting the next Module in the list If there is none, the exception will be raised by Value.
") Next;
		void Next();

		/****** Interface_GeneralLib::Protocol ******/
		/****** md5 signature: c905586547d9ad373f87bcb2ce1d329f ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the current Protocol in the Iteration.
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****** Interface_GeneralLib::Select ******/
		/****** md5 signature: 66c3385afed283d61a6402b185664c2a ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient
module: Interface_GeneralModule

Return
-------
CN: int

Description
-----------
Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType).
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<Interface_GeneralModule> & module, Standard_Integer &OutValue);

		/****** Interface_GeneralLib::SetComplete ******/
		/****** md5 signature: 9b2529d2e257b2464fe4d8064a8a0171 ******/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets a library to be defined with the complete Global list (all the couples Protocol/Modules recorded in it).
") SetComplete;
		void SetComplete();

		/****** Interface_GeneralLib::SetGlobal ******/
		/****** md5 signature: 2b2293c98b9172bae197316c65be22d5 ******/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "
Parameters
----------
amodule: Interface_GeneralModule
aprotocol: Interface_Protocol

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) into the global definition set for this class of Library.
") SetGlobal;
		static void SetGlobal(const opencascade::handle<Interface_GeneralModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****** Interface_GeneralLib::Start ******/
		/****** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts Iteration on the Modules (sets it on the first one).
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
		/****** Interface_GeneralModule::CanCopy ******/
		/****** md5 signature: 0c59338e969e3e17aec56ffbfef71f8c ******/
		%feature("compactdefaultargs") CanCopy;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient

Return
-------
bool

Description
-----------
Specific answer to the question 'is Copy properly implemented' Remark that it should be in phase with the implementation of NewVoid+CopyCase/NewCopyCase Default returns always False, can be redefined.
") CanCopy;
		virtual Standard_Boolean CanCopy(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_GeneralModule::CategoryNumber ******/
		/****** md5 signature: 136d8c82c810f302ff4fd533b01e3f76 ******/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Return
-------
int

Description
-----------
Returns a category number which characterizes an entity Category Numbers are managed by the class Category <shares> can be used to evaluate this number in the context Default returns 0 which means 'unspecified'.
") CategoryNumber;
		virtual Standard_Integer CategoryNumber(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****** Interface_GeneralModule::CheckCase ******/
		/****** md5 signature: 01815a85d533821d13b510ff163b51a7 ******/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Specific Checking of an Entity <ent> Can check context queried through a ShareTool, as required.
") CheckCase;
		virtual void CheckCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** Interface_GeneralModule::CopyCase ******/
		/****** md5 signature: 60b767f98105cd501c4069f53a650f7d ******/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. Use method Transferred from CopyTool to work.
") CopyCase;
		virtual void CopyCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** Interface_GeneralModule::Dispatch ******/
		/****** md5 signature: 1e8c602eed940595804d6538a183911f ******/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
bool

Description
-----------
Dispatches an entity Returns True if it works by copy, False if it just duplicates the starting Handle //! Dispatching means producing a new entity, image of the starting one, in order to be put into a new Model, this Model being itself the result of a dispatch from an original Model //! According to the cases, dispatch can either * just return <entto> as equating <entfrom> -> the new model designates the starting entity: it is lighter, but the dispatched entity being shared might not be modified for dispatch * copy <entfrom> to <entto> by calling NewVoid+CopyCase (two steps) or NewCopiedCase (1) -> the dispatched entity is a COPY, hence it can be modified //! The provided default just duplicates the handle without copying, then returns False. Can be redefined.
") Dispatch;
		virtual Standard_Boolean Dispatch(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** Interface_GeneralModule::FillShared ******/
		/****** md5 signature: c18d1339d1d991cc01a62ac3534c9c23 ******/
		%feature("compactdefaultargs") FillShared;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Specific filling of the list of Entities shared by an Entity <ent>, according a Case Number <CN> (formerly computed by CaseNum), considered in the context of a Model <model> Default calls FillSharedCase (i.e., ignores the model) Can be redefined to use the model for working.
") FillShared;
		virtual void FillShared(const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::FillSharedCase ******/
		/****** md5 signature: b4e98b5dbf7df653c06918f56463af8d ******/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Specific filling of the list of Entities shared by an Entity <ent>, according a Case Number <CN> (formerly computed by CaseNum). Can use the internal utility method Share, below.
") FillSharedCase;
		virtual void FillSharedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::ListImplied ******/
		/****** md5 signature: 020a277801f8e5db4642c90712650bbb ******/
		%feature("compactdefaultargs") ListImplied;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
List the Implied References of <ent> considered in the context of a Model <model>: i.e. the Entities which are Referenced while not considered as Shared (not copied if <ent> is, references not renewed by CopyCase but by ImpliedCase, only if referenced Entities have been Copied too) FillShared + ListImplied give the complete list of References Default calls ListImpliedCase (i.e. ignores the model) Can be redefined to use the model for working.
") ListImplied;
		virtual void ListImplied(const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::ListImpliedCase ******/
		/****** md5 signature: 9bbb8c5e9444c92c9aa384b239c90a88 ******/
		%feature("compactdefaultargs") ListImpliedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
List the Implied References of <ent> (see above) are Referenced while not considered as Shared (not copied if <ent> is, references not renewed by CopyCase but by ImpliedCase, only if referenced Entities have been Copied too) FillSharedCase + ListImpliedCase give the complete list of Referenced Entities The provided default method does nothing (Implied References are specific of a little amount of Entity Classes).
") ListImpliedCase;
		virtual void ListImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::Name ******/
		/****** md5 signature: 250c362cd39947a2262d119d4f6e8618 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Determines if an entity brings a Name (or widerly, if a Name can be attached to it, through the ShareTool By default, returns a Null Handle (no name can be produced) Can be redefined //! Warning: While this string may be edited on the spot, if it is a read field, the returned value must be copied before.
") Name;
		virtual opencascade::handle<TCollection_HAsciiString> Name(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****** Interface_GeneralModule::NewCopiedCase ******/
		/****** md5 signature: bb124a1f433035df781a2ef5969f8555 ******/
		%feature("compactdefaultargs") NewCopiedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
bool

Description
-----------
Specific operator (create+copy) defaulted to do nothing. It can be redefined: When it is not possible to work in two steps (NewVoid then CopyCase). This can occur when there is no default constructor: hence the result <entto> must be created with an effective definition. Remark: if NewCopiedCase is defined, CopyCase has nothing to do Returns True if it has produced something, false else.
") NewCopiedCase;
		virtual Standard_Boolean NewCopiedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** Interface_GeneralModule::NewVoid ******/
		/****** md5 signature: cf68997b9516102da0b47eaf9e006411 ******/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "
Parameters
----------
CN: int
entto: Standard_Transient

Return
-------
bool

Description
-----------
Creates a new void entity <entto> according to a Case Number This entity remains to be filled, by reading from a file or by copying from another entity of same type (see CopyCase).
") NewVoid;
		virtual Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****** Interface_GeneralModule::RenewImpliedCase ******/
		/****** md5 signature: 2dd5da909ccb2b579d7ef3904f8b31db ******/
		%feature("compactdefaultargs") RenewImpliedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Specific Copying of Implied References A Default is provided which does nothing (must current case !) Already copied references (by CopyFrom) must remain unchanged Use method Search from CopyTool to work.
") RenewImpliedCase;
		virtual void RenewImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, const Interface_CopyTool & TC);

		/****** Interface_GeneralModule::Share ******/
		/****** md5 signature: b53143412198cfa30a2430c8c7452b28 ******/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator
shared: Standard_Transient

Return
-------
None

Description
-----------
Adds an Entity to a Shared List (uses GetOneItem on <iter>).
") Share;
		void Share(Interface_EntityIterator & iter, const opencascade::handle<Standard_Transient> & shared);

		/****** Interface_GeneralModule::WhenDeleteCase ******/
		/****** md5 signature: 6b78c36a5656a6d73b50c68135a2b6d4 ******/
		%feature("compactdefaultargs") WhenDeleteCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
dispatched: bool

Return
-------
None

Description
-----------
Prepares an entity to be deleted. What does it mean: Basically, any class of entity may define its own destructor By default, it does nothing but calling destructors on fields With the Memory Manager, it is useless to call destructor, it is done automatically when the Handle is nullified(cleared) BUT this is ineffective in looping structures (whatever these are 'Implied' references or not). //! THUS: if no loop may appear in definitions, a class which inherits from TShared is correctly managed by automatic way BUT if there can be loops (or simply back pointers), they must be broken, for instance by clearing fields of one of the nodes The default does nothing, to be redefined if a loop can occur (Implied generally requires WhenDelete, but other cases can occur) //! Warning: <dispatched> tells if the entity to be deleted has been produced by Dispatch or not. Hence WhenDelete must be in coherence with Dispatch Dispatch can either copy or not. If it copies the entity, this one should be deleted If it doesn't (i.e. duplicates the handle) nothing to do //! If <dispatch> is False, normal deletion is to be performed.
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
		/****** Interface_GlobalNodeOfGeneralLib::Interface_GlobalNodeOfGeneralLib ******/
		/****** md5 signature: 004504aeea0aa4a254103c28e7783208 ******/
		%feature("compactdefaultargs") Interface_GlobalNodeOfGeneralLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty GlobalNode, with no Next.
") Interface_GlobalNodeOfGeneralLib;
		 Interface_GlobalNodeOfGeneralLib();

		/****** Interface_GlobalNodeOfGeneralLib::Add ******/
		/****** md5 signature: 52a71ed7b2dcafa006109d66faa88607 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
amodule: Interface_GeneralModule
aprotocol: Interface_Protocol

Return
-------
None

Description
-----------
Adds a Module bound with a Protocol to the list: does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required) Once added, stores its attached Protocol in correspondence.
") Add;
		void Add(const opencascade::handle<Interface_GeneralModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****** Interface_GlobalNodeOfGeneralLib::Module ******/
		/****** md5 signature: 786fb9d122db15779294d93c1e06036b ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_GeneralModule>

Description
-----------
Returns the Module stored in a given GlobalNode.
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****** Interface_GlobalNodeOfGeneralLib::Next ******/
		/****** md5 signature: b0be6825d69567690d78e706e2027f21 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_GlobalNodeOfGeneralLib>

Description
-----------
Returns the Next GlobalNode. If none is defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<Interface_GlobalNodeOfGeneralLib> & Next();

		/****** Interface_GlobalNodeOfGeneralLib::Protocol ******/
		/****** md5 signature: c905586547d9ad373f87bcb2ce1d329f ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the attached Protocol stored in a given GlobalNode.
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
		/****** Interface_GlobalNodeOfReaderLib::Interface_GlobalNodeOfReaderLib ******/
		/****** md5 signature: 82c1cb743d14c2075c02b445aa26388d ******/
		%feature("compactdefaultargs") Interface_GlobalNodeOfReaderLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty GlobalNode, with no Next.
") Interface_GlobalNodeOfReaderLib;
		 Interface_GlobalNodeOfReaderLib();

		/****** Interface_GlobalNodeOfReaderLib::Add ******/
		/****** md5 signature: 9c33b501cc7aba278ca4c14a3d8c84e0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
amodule: Interface_ReaderModule
aprotocol: Interface_Protocol

Return
-------
None

Description
-----------
Adds a Module bound with a Protocol to the list: does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required) Once added, stores its attached Protocol in correspondence.
") Add;
		void Add(const opencascade::handle<Interface_ReaderModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****** Interface_GlobalNodeOfReaderLib::Module ******/
		/****** md5 signature: ee4e5065695c1821dd69ceb165b67caf ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_ReaderModule>

Description
-----------
Returns the Module stored in a given GlobalNode.
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****** Interface_GlobalNodeOfReaderLib::Next ******/
		/****** md5 signature: 0a362545d2eb46b8ee0501bb8c9630fb ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_GlobalNodeOfReaderLib>

Description
-----------
Returns the Next GlobalNode. If none is defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<Interface_GlobalNodeOfReaderLib> & Next();

		/****** Interface_GlobalNodeOfReaderLib::Protocol ******/
		/****** md5 signature: c905586547d9ad373f87bcb2ce1d329f ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the attached Protocol stored in a given GlobalNode.
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
		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: 0275f2c13add0e6ada4df7a5ab2b291a ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an empty graph, ready to receive Entities from amodel Note that this way of Creation allows <self> to verify that Entities to work with are contained in <amodel> Basic Shared and Sharing lists are obtained from a General Services Library, given directly as an argument.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: 41d9670526e656e678d6bf65c28e363a ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Same as above, but the Library is defined through a Protocol.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: b61dbaaf54a955cd3bddd3309de9ca6c ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Same as above, but the Library is defined through a Protocol.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: e7ee70b3414e84aa5e75fd6322da3baa ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Same a above but works with the Protocol recorded in the Model.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: 2083e68225a9e6168cd87f137b0e3844 ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph
copied: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a Graph from another one, getting all its data Remark that status are copied from <agraph>, but the other lists (sharing/shared) are copied only if <copied> = True.
") Interface_Graph;
		 Interface_Graph(const Interface_Graph & agraph, const Standard_Boolean copied = Standard_False);

		/****** Interface_Graph::BitMap ******/
		/****** md5 signature: 6afca68ff9833e671b4be2be9243cbd9 ******/
		%feature("compactdefaultargs") BitMap;
		%feature("autodoc", "Return
-------
Interface_BitMap

Description
-----------
Returns the Bit Map in order to read or edit flag values.
") BitMap;
		const Interface_BitMap & BitMap();

		/****** Interface_Graph::CBitMap ******/
		/****** md5 signature: 15f5051286ba99cc042d93116415aa43 ******/
		%feature("compactdefaultargs") CBitMap;
		%feature("autodoc", "Return
-------
Interface_BitMap

Description
-----------
Returns the Bit Map in order to edit it (add new flags).
") CBitMap;
		Interface_BitMap & CBitMap();

		/****** Interface_Graph::ChangeStatus ******/
		/****** md5 signature: 82819e9cb729a87e3c8360e4b60cc647 ******/
		%feature("compactdefaultargs") ChangeStatus;
		%feature("autodoc", "
Parameters
----------
oldstat: int
newstat: int

Return
-------
None

Description
-----------
Changes all status which value is oldstat to new value newstat.
") ChangeStatus;
		void ChangeStatus(const Standard_Integer oldstat, const Standard_Integer newstat);

		/****** Interface_Graph::Entity ******/
		/****** md5 signature: fe6771707abbc72dabd1d83eab337657 ******/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns mapped Entity given its no (if it is present).
") Entity;
		const opencascade::handle<Standard_Transient> & Entity(const Standard_Integer num);

		/****** Interface_Graph::EntityNumber ******/
		/****** md5 signature: 4257559df5e64edec8716b8bacc8af3a ******/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Returns the Number of the entity in the Map, computed at creation time (Entities loaded from the Model) Returns 0 if <ent> not contained by Model used to create <self> (that is, <ent> is unknown from <self>).
") EntityNumber;
		Standard_Integer EntityNumber(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::GetFromEntity ******/
		/****** md5 signature: 31891fd23708ae104ac2c5d6422e8937 ******/
		%feature("compactdefaultargs") GetFromEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
shared: bool
newstat: int (optional, default to 0)

Return
-------
None

Description
-----------
Gets an Entity, plus its shared ones (at every level) if 'shared' is True. New items are set to status 'newstat' Items already present in graph remain unchanged Of course, redefinitions of Shared lists are taken into account if there are some.
") GetFromEntity;
		void GetFromEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean shared, const Standard_Integer newstat = 0);

		/****** Interface_Graph::GetFromEntity ******/
		/****** md5 signature: 418999aa71dd53d9afa78651d6d0a47e ******/
		%feature("compactdefaultargs") GetFromEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
shared: bool
newstat: int
overlapstat: int
cumul: bool

Return
-------
None

Description
-----------
Gets an Entity, plus its shared ones (at every level) if 'shared' is True. New items are set to status 'newstat'. Items already present in graph are processed as follows: - if they already have status 'newstat', they remain unchanged - if they have another status, this one is modified: if cumul is True, to former status + overlapstat (cumul) if cumul is False, to overlapstat (enforce).
") GetFromEntity;
		void GetFromEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean shared, const Standard_Integer newstat, const Standard_Integer overlapstat, const Standard_Boolean cumul);

		/****** Interface_Graph::GetFromGraph ******/
		/****** md5 signature: ae6a9a559f58dc138ed87b411e11d722 ******/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph

Return
-------
None

Description
-----------
Gets all present items from another graph.
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph);

		/****** Interface_Graph::GetFromGraph ******/
		/****** md5 signature: 418d34704ccd99f0633d30895e747dbc ******/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph
stat: int

Return
-------
None

Description
-----------
Gets items from another graph which have a specific Status.
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph, const Standard_Integer stat);

		/****** Interface_Graph::GetFromIter ******/
		/****** md5 signature: 294061522bd198df9200ca94bd5be5a5 ******/
		%feature("compactdefaultargs") GetFromIter;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator
newstat: int

Return
-------
None

Description
-----------
Gets Entities given by an EntityIterator. Entities which were not yet present in the graph are mapped with status 'newstat' Entities already present remain unchanged.
") GetFromIter;
		void GetFromIter(const Interface_EntityIterator & iter, const Standard_Integer newstat);

		/****** Interface_Graph::GetFromIter ******/
		/****** md5 signature: 3165a82e20f374e686a5cf0ea806604e ******/
		%feature("compactdefaultargs") GetFromIter;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator
newstat: int
overlapstat: int
cumul: bool

Return
-------
None

Description
-----------
Gets Entities given by an EntityIterator and distinguishes those already present in the Graph: - new entities added to the Graph with status 'newstst' - entities already present with status = 'newstat' remain unchanged - entities already present with status different form 'newstat' have their status modified: if cumul is True, to former status + overlapstat (cumul) if cumul is False, to overlapstat (enforce) (Note: works as GetEntity, shared = False, for each entity).
") GetFromIter;
		void GetFromIter(const Interface_EntityIterator & iter, const Standard_Integer newstat, const Standard_Integer overlapstat, const Standard_Boolean cumul);

		/****** Interface_Graph::GetFromModel ******/
		/****** md5 signature: 25e999deabc386be45884b4b74d134d3 ******/
		%feature("compactdefaultargs") GetFromModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Loads Graph with all Entities contained in the Model.
") GetFromModel;
		void GetFromModel();

		/****** Interface_Graph::GetShareds ******/
		/****** md5 signature: be5529afe561d5bd1bd6933a1651fcf8 ******/
		%feature("compactdefaultargs") GetShareds;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the sequence of Entities Shared by an Entity.
") GetShareds;
		opencascade::handle<TColStd_HSequenceOfTransient> GetShareds(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::GetSharings ******/
		/****** md5 signature: 85faeb2b2f9d4bc53d56541c9ab8dc2a ******/
		%feature("compactdefaultargs") GetSharings;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the sequence of Entities Sharings by an Entity.
") GetSharings;
		opencascade::handle<TColStd_HSequenceOfTransient> GetSharings(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::HasShareErrors ******/
		/****** md5 signature: b9b55c8ec1b92fcbdf33830713fe3c72 ******/
		%feature("compactdefaultargs") HasShareErrors;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if <ent> or the list of entities shared by <ent> (not redefined) contains items unknown from this Graph Remark: apart from the status HasShareError, these items are ignored.
") HasShareErrors;
		Standard_Boolean HasShareErrors(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::IsPresent ******/
		/****** md5 signature: 08af4067390184e0c6e9dcc44f1f204b ******/
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if an Entity is noted as present in the graph (See methods Get... which determine this status) Returns False if <num> is out of range too.
") IsPresent;
		Standard_Boolean IsPresent(const Standard_Integer num);

		/****** Interface_Graph::IsPresent ******/
		/****** md5 signature: aa90c7192d821ba5ec6af7a1dff13c2a ******/
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Same as above but directly on an Entity <ent>: if it is not contained in the Model, returns False. Else calls IsPresent(num) with <num> given by EntityNumber.
") IsPresent;
		Standard_Boolean IsPresent(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::ModeStat ******/
		/****** md5 signature: d0863ee0605b2f76e4ecd849fb34078d ******/
		%feature("compactdefaultargs") ModeStat;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns mode responsible for computation of statuses;.
") ModeStat;
		Standard_Boolean ModeStat();

		/****** Interface_Graph::Model ******/
		/****** md5 signature: 7883272628747d0cc1230b6871802da7 ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model with which this Graph was created.
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****** Interface_Graph::Name ******/
		/****** md5 signature: 35b5790ba05c4a2997c3061615e9b3cb ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Determines the name attached to an entity, by using the general service Name in GeneralModule Returns a null handle if no name could be computed or if the entity is not in the model.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::NbStatuses ******/
		/****** md5 signature: e20ed4e9671fcde690f46a12623b705b ******/
		%feature("compactdefaultargs") NbStatuses;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns size of array of statuses.
") NbStatuses;
		Standard_Integer NbStatuses();

		/****** Interface_Graph::RemoveItem ******/
		/****** md5 signature: ffd0c00631edd52da4bf51d8f077bbce ******/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Clears Entity and sets Status to 0, for a numero.
") RemoveItem;
		void RemoveItem(const Standard_Integer num);

		/****** Interface_Graph::RemoveStatus ******/
		/****** md5 signature: eae772beea7560c66e9214dd83a30e46 ******/
		%feature("compactdefaultargs") RemoveStatus;
		%feature("autodoc", "
Parameters
----------
stat: int

Return
-------
None

Description
-----------
Removes all items of which status has a given value stat.
") RemoveStatus;
		void RemoveStatus(const Standard_Integer stat);

		/****** Interface_Graph::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases data, making graph ready to rebegin from void (also resets Shared lists redefinitions).
") Reset;
		void Reset();

		/****** Interface_Graph::ResetStatus ******/
		/****** md5 signature: 88223281f0684fd4d3240d18db72f6d0 ******/
		%feature("compactdefaultargs") ResetStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases Status (Values and Flags of Presence), making graph ready to rebegin from void. Does not concerns Shared lists.
") ResetStatus;
		void ResetStatus();

		/****** Interface_Graph::RootEntities ******/
		/****** md5 signature: 63cd32bddc79c5ff7cf79d39668774c9 ******/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the Entities which are not Shared (their Sharing List is empty) in the Model.
") RootEntities;
		Interface_EntityIterator RootEntities();

		/****** Interface_Graph::SetStatus ******/
		/****** md5 signature: 029712b154eb915b22d51cf3198eeaf1 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
num: int
stat: int

Return
-------
None

Description
-----------
Modifies Status associated to a numero.
") SetStatus;
		void SetStatus(const Standard_Integer num, const Standard_Integer stat);

		/****** Interface_Graph::Shareds ******/
		/****** md5 signature: d7f3cd187cff94c69bea537ec01567d5 ******/
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of Entities Shared by an Entity, as recorded by the Graph. That is, by default Basic Shared List, else it can be redefined by methods SetShare, SetNoShare ... see below.
") Shareds;
		Interface_EntityIterator Shareds(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::SharingTable ******/
		/****** md5 signature: 2bac1d4e04fc72fe327f0913adc89070 ******/
		%feature("compactdefaultargs") SharingTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfListOfInteger>

Description
-----------
Returns the Table of Sharing lists. Used to Create another Graph from <self>.
") SharingTable;
		const opencascade::handle<TColStd_HArray1OfListOfInteger> & SharingTable();

		/****** Interface_Graph::Sharings ******/
		/****** md5 signature: 561a9bb8187bfa6649f3c1fcaacdaeed ******/
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of Entities which Share an Entity, computed from the Basic or Redefined Shared Lists.
") Sharings;
		Interface_EntityIterator Sharings(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::Size ******/
		/****** md5 signature: a263c9cd5bbf3a30f07620f6c5b86b83 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns size (max nb of entities, i.e. Model's nb of entities).
") Size;
		Standard_Integer Size();

		/****** Interface_Graph::Status ******/
		/****** md5 signature: fe83936279a1a53fbd5bae4ee4fd0684 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns Status associated to a numero (only to read it).
") Status;
		Standard_Integer Status(const Standard_Integer num);

		/****** Interface_Graph::TypedSharings ******/
		/****** md5 signature: b4490a19ff7734ca033f4de70617288c ******/
		%feature("compactdefaultargs") TypedSharings;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
type: Standard_Type

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of sharings entities, AT ANY LEVEL, which are kind of a given type. A sharing entity kind of this type ends the exploration of its branch.
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
		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: 0513d289715c599c31389ba0f193b9af ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph

Return
-------
None

Description
-----------
Creates an HGraph directly from a Graph. Remark that the starting Graph is duplicated.
") Interface_HGraph;
		 Interface_HGraph(const Interface_Graph & agraph);

		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: 893b557ade4e8ce58a33915e14410d5d ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an HGraph with a Graph created from <amodel> and <lib>.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: 1753e0a665aac413a87d04faed9bfdb6 ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an HGraph with a graph itself created from <amodel> and <protocol>.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: 76bfa8f56a06bbb74e3664d95938323c ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an HGraph with a graph itself created from <amodel> and <protocol>.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: a93d94da3e923059b4042e8143bb32ba ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
theModeStats: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Same a above, but works with the GTool in the model.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Standard_Boolean theModeStats = Standard_True);

		/****** Interface_HGraph::CGraph ******/
		/****** md5 signature: bec710075a9272715539ab2d07af5ab2 ******/
		%feature("compactdefaultargs") CGraph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
Same as above, but for Read-Write Operations Then, The Graph will be modified in the HGraph itself.
") CGraph;
		Interface_Graph & CGraph();

		/****** Interface_HGraph::Graph ******/
		/****** md5 signature: 6a234e0475ae0da1c7d268d231e44a78 ******/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
Returns the Graph contained in <self>, for Read Only Operations Remark that it is returns as 'const &' Getting it in a new variable instead of a reference would be a pity, because all the graph's content would be duplicated.
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
		/****** Interface_IntList::Interface_IntList ******/
		/****** md5 signature: ec19d550108932b5224831f711a35e62 ******/
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty IntList.
") Interface_IntList;
		 Interface_IntList();

		/****** Interface_IntList::Interface_IntList ******/
		/****** md5 signature: b37c4bb58fbfdd8d36320b3b6f99833a ******/
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "
Parameters
----------
nbe: int

Return
-------
None

Description
-----------
Creates an IntList for <nbe> entities.
") Interface_IntList;
		 Interface_IntList(const Standard_Integer nbe);

		/****** Interface_IntList::Interface_IntList ******/
		/****** md5 signature: 0480cadde3c17e0eb1407b9c7b192303 ******/
		%feature("compactdefaultargs") Interface_IntList;
		%feature("autodoc", "
Parameters
----------
other: Interface_IntList
copied: bool

Return
-------
None

Description
-----------
Creates an IntList from another one. if <copied> is True, copies data else, data are not copied, only the header object is.
") Interface_IntList;
		 Interface_IntList(const Interface_IntList & other, const Standard_Boolean copied);

		/****** Interface_IntList::Add ******/
		/****** md5 signature: cd60596a44a700fa317ebf8f8b1e5827 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
ref: int

Return
-------
None

Description
-----------
Adds a reference (as an integer value, an entity number) to the current entity number. Zero is ignored.
") Add;
		void Add(const Standard_Integer ref);

		/****** Interface_IntList::AdjustSize ******/
		/****** md5 signature: f5e018890a3a2a3b5a3f546e318cb26f ******/
		%feature("compactdefaultargs") AdjustSize;
		%feature("autodoc", "
Parameters
----------
margin: int (optional, default to 0)

Return
-------
None

Description
-----------
Resizes lists to exact sizes. For list of refs, a positive margin can be added.
") AdjustSize;
		void AdjustSize(const Standard_Integer margin = 0);

		/****** Interface_IntList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all data, hence each entity number has an empty list.
") Clear;
		void Clear();

		/****** Interface_IntList::Initialize ******/
		/****** md5 signature: c237fd6b5333f84217375f02f49572be ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
nbe: int

Return
-------
None

Description
-----------
Initialize IntList by number of entities.
") Initialize;
		void Initialize(const Standard_Integer nbe);

		/****** Interface_IntList::Internals ******/
		/****** md5 signature: fd1babce4b67ac99ebe23a987a453b4d ******/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "
Parameters
----------
ents: TColStd_HArray1OfInteger
refs: TColStd_HArray1OfInteger

Return
-------
nbrefs: int

Description
-----------
Returns internal values, used for copying.
") Internals;
		void Internals(Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfInteger> & ents, opencascade::handle<TColStd_HArray1OfInteger> & refs);

		/****** Interface_IntList::IsRedefined ******/
		/****** md5 signature: 2634d7efe5f57981ef79cc93aa14462d ******/
		%feature("compactdefaultargs") IsRedefined;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns True if the list for a number (default is taken as current) is 'redefined' (useful for empty list).
") IsRedefined;
		Standard_Boolean IsRedefined(const Standard_Integer num = 0);

		/****** Interface_IntList::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of refs attached to current entity number.
") Length;
		Standard_Integer Length();

		/****** Interface_IntList::List ******/
		/****** md5 signature: 57597a0a72ee1575151f494c25e4c3eb ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "
Parameters
----------
number: int
copied: bool (optional, default to Standard_False)

Return
-------
Interface_IntList

Description
-----------
Returns an IntList, identical to <self> but set to a specified entity Number By default, not copied (in order to be read) Specified <copied> to produce another list and edit it.
") List;
		Interface_IntList List(const Standard_Integer number, const Standard_Boolean copied = Standard_False);

		/****** Interface_IntList::NbEntities ******/
		/****** md5 signature: 533943455099343f106415a0a22e8ac9 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of entities to be acknowledged.
") NbEntities;
		Standard_Integer NbEntities();

		/****** Interface_IntList::Number ******/
		/****** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current entity number.
") Number;
		Standard_Integer Number();

		/****** Interface_IntList::Remove ******/
		/****** md5 signature: 37f5a5cdb681cc08ea6f88bf3c6c2dca ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Removes an item in the list for current number, given its rank Returns True if done, False else.
") Remove;
		Standard_Boolean Remove(const Standard_Integer num);

		/****** Interface_IntList::Reservate ******/
		/****** md5 signature: 364547d2a05c1bcc458abef36a679601 ******/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "
Parameters
----------
count: int

Return
-------
None

Description
-----------
Makes a reservation for <count> references to be later attached to the current entity. If required, it increases the size of array used to store refs. Remark that if count is less than two, it does nothing (because immediate storing).
") Reservate;
		void Reservate(const Standard_Integer count);

		/****** Interface_IntList::SetNbEntities ******/
		/****** md5 signature: c6d2ce641f4ae51c5143271bfac46e17 ******/
		%feature("compactdefaultargs") SetNbEntities;
		%feature("autodoc", "
Parameters
----------
nbe: int

Return
-------
None

Description
-----------
Changes the count of entities (ignored if decreased).
") SetNbEntities;
		void SetNbEntities(const Standard_Integer nbe);

		/****** Interface_IntList::SetNumber ******/
		/****** md5 signature: 85e23abe597a6ad027059592ad519319 ******/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "
Parameters
----------
number: int

Return
-------
None

Description
-----------
Sets an entity number as current (for read and fill).
") SetNumber;
		void SetNumber(const Standard_Integer number);

		/****** Interface_IntList::SetRedefined ******/
		/****** md5 signature: 7cabdf15a91372eeafa0e8650fea706f ******/
		%feature("compactdefaultargs") SetRedefined;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets current entity list to be redefined or not This is used in a Graph for redefinition list: it can be disable (no redefinition, i.e. list is cleared), or enabled (starts as empty). The original list has not to be 'redefined'.
") SetRedefined;
		void SetRedefined(const Standard_Boolean mode);

		/****** Interface_IntList::Value ******/
		/****** md5 signature: ef9afc62c16e7d8be71a9016548b2389 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns a reference number in the list for current number, according to its rank.
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
		/****** Interface_IntVal::Interface_IntVal ******/
		/****** md5 signature: 05fc265cb59323c6464c768349b7da1b ******/
		%feature("compactdefaultargs") Interface_IntVal;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** Interface_IntVal::Value ******/
		/****** md5 signature: c6d99989077b92200f0377d8b792ba0b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
		/****** Interface_InterfaceModel::AddEntity ******/
		/****** md5 signature: 36660b5c5ccaf3658f088997f413ed03 ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
None

Description
-----------
Internal method for adding an Entity. Used by file reading (defined by each Interface) and Transfer tools. It adds the entity required to be added, not its refs: see AddWithRefs. If <anentity> is a ReportEntity, it is added to the list of Reports, its Concerned Entity (Erroneous or Corrected, else Unknown) is added to the list of Entities. That is, the ReportEntity must be created before Adding.
") AddEntity;
		virtual void AddEntity(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_InterfaceModel::AddReportEntity ******/
		/****** md5 signature: cfa374c9a5be1ceb7121eedcea8196e0 ******/
		%feature("compactdefaultargs") AddReportEntity;
		%feature("autodoc", "
Parameters
----------
rep: Interface_ReportEntity
semantic: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Adds a ReportEntity as such. Returns False if the concerned entity is not recorded in the Model Else, adds it into, either the main report list or the list for semantic checks, then returns True.
") AddReportEntity;
		Standard_Boolean AddReportEntity(const opencascade::handle<Interface_ReportEntity> & rep, const Standard_Boolean semantic = Standard_False);

		/****** Interface_InterfaceModel::AddWithRefs ******/
		/****** md5 signature: 7141d3692dcc02334df27c34d6ede76b ******/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "
Parameters
----------
anent: Standard_Transient
proto: Interface_Protocol
level: int (optional, default to 0)
listall: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds to the Model, an Entity with all its References, as they are defined by General Services FillShared and ListImplied. Process is recursive (any sub-levels) if <level> = 0 (Default) Else, adds sub-entities until the required sub-level. Especially, if <level> = 1, adds immediate subs and that's all //! If <listall> is False (Default), an entity (<anentity> itself or one of its subs at any level) which is already recorded in the Model is not analysed, only the newly added ones are. If <listall> is True, all items are analysed (this allows to ensure the consistency of an adding made by steps).
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const opencascade::handle<Interface_Protocol> & proto, const Standard_Integer level = 0, const Standard_Boolean listall = Standard_False);

		/****** Interface_InterfaceModel::AddWithRefs ******/
		/****** md5 signature: 8d0c9dd877a8f5c4dd4c3893f6965246 ******/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "
Parameters
----------
anent: Standard_Transient
level: int (optional, default to 0)
listall: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Same as above, but works with the Protocol of the Model.
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const Standard_Integer level = 0, const Standard_Boolean listall = Standard_False);

		/****** Interface_InterfaceModel::AddWithRefs ******/
		/****** md5 signature: 733b542fd82fe1a253419fba3ab93c40 ******/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "
Parameters
----------
anent: Standard_Transient
lib: Interface_GeneralLib
level: int (optional, default to 0)
listall: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Same as above, but works with an already created GeneralLib.
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const Interface_GeneralLib & lib, const Standard_Integer level = 0, const Standard_Boolean listall = Standard_False);

		/****** Interface_InterfaceModel::CategoryNumber ******/
		/****** md5 signature: c04739821ee1601715da6f534bdedafe ******/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns the recorded category number for a given entity number 0 if none was defined for this entity.
") CategoryNumber;
		Standard_Integer CategoryNumber(const Standard_Integer num);

		/****** Interface_InterfaceModel::ChangeOrder ******/
		/****** md5 signature: 09115a1570cd7299c84cb92ee414ba1b ******/
		%feature("compactdefaultargs") ChangeOrder;
		%feature("autodoc", "
Parameters
----------
oldnum: int
newnum: int
count: int (optional, default to 1)

Return
-------
None

Description
-----------
Changes the Numbers of some Entities: <oldnum> is moved to <newnum>, same for <count> entities. Thus: 1,2 ... newnum-1 newnum ... oldnum .. oldnum+count oldnum+count+1 .. gives 1,2 ... newnum-1 oldnum .. oldnum+count newnum ... oldnum+count+1 (can be seen as a circular permutation).
") ChangeOrder;
		void ChangeOrder(const Standard_Integer oldnum, const Standard_Integer newnum, const Standard_Integer count = 1);

		/****** Interface_InterfaceModel::Check ******/
		/****** md5 signature: ecfbc87eedd38d86f1a42b818ec4cee7 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
num: int
syntactic: bool

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the check attached to an entity, designated by its Number. 0 for global check <semantic> True: recorded semantic check <semantic> False: recorded syntactic check (see ReportEntity) If no check is recorded for <num>, returns an empty Check.
") Check;
		const opencascade::handle<Interface_Check> & Check(const Standard_Integer num, const Standard_Boolean syntactic);

		/****** Interface_InterfaceModel::ClassName ******/
		/****** md5 signature: 5c848fa4e9ca29e4e7b7a55157f5d8c4 ******/
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "
Parameters
----------
typnam: str

Return
-------
str

Description
-----------
From a CDL Type Name, returns the Class part (package dropped) WARNING: buffered, to be immediately copied or printed.
") ClassName;
		static Standard_CString ClassName(Standard_CString typnam);

		/****** Interface_InterfaceModel::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases contained data; used when a Model is copied to others: the new copied ones begin from clear Clear calls specific method ClearHeader (see below).
") Clear;
		virtual void Clear();

		/****** Interface_InterfaceModel::ClearEntities ******/
		/****** md5 signature: 290376598adc8dd87baf57964ef808e5 ******/
		%feature("compactdefaultargs") ClearEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the entities; uses the general service WhenDelete, in addition to the standard Memory Manager; can be redefined.
") ClearEntities;
		virtual void ClearEntities();

		/****** Interface_InterfaceModel::ClearHeader ******/
		/****** md5 signature: 2d2d6c6f650c81db4fbe3d0ba2eaa00b ******/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears Model's header: specific to each norm.
") ClearHeader;
		virtual void ClearHeader();

		/****** Interface_InterfaceModel::ClearLabels ******/
		/****** md5 signature: 25c392ea756509d2f11c0754fb09a6d0 ******/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases information about labels, if any: specific to each norm.
") ClearLabels;
		virtual void ClearLabels();

		/****** Interface_InterfaceModel::ClearReportEntity ******/
		/****** md5 signature: caece735d9030fe4491e05e5614741b1 ******/
		%feature("compactdefaultargs") ClearReportEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Removes the ReportEntity attached to Entity <num>. Returns True if done, False if no ReportEntity was attached to <num>. Warning: the caller must assume that this clearing is meaningful.
") ClearReportEntity;
		Standard_Boolean ClearReportEntity(const Standard_Integer num);

		/****** Interface_InterfaceModel::Contains ******/
		/****** md5 signature: 86d9b2cd7c6aab5b29da3a6398f95c37 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if a Model contains an Entity (for a ReportEntity, looks for the ReportEntity itself AND its Concerned Entity).
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_InterfaceModel::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of entities (service WhenDelete).
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
		/****** Interface_InterfaceModel::DumpHeader ******/
		/****** md5 signature: aa1f14cdc284ebad5c520a0f2f1e0070 ******/
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "
Parameters
----------
level: int (optional, default to 0)

Return
-------
S: Standard_OStream

Description
-----------
Dumps Header in a short, easy to read, form, onto a Stream <level> allows to print more or less parts of the header, if necessary. 0 for basic print.
") DumpHeader;
		virtual void DumpHeader(std::ostream &OutValue, const Standard_Integer level = 0);

		/****** Interface_InterfaceModel::Entities ******/
		/****** md5 signature: 5b7a9453b66b65586915cfb6dcb67a37 ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of all Entities, as an Iterator on Entities (the Entities themselves, not the Reports).
") Entities;
		Interface_EntityIterator Entities();

		/****** Interface_InterfaceModel::EntityState ******/
		/****** md5 signature: 8832d46c1ee04c5248c965fe8ea44bdc ******/
		%feature("compactdefaultargs") EntityState;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
Interface_DataState

Description
-----------
Returns the State of an entity, given its number.
") EntityState;
		Interface_DataState EntityState(const Standard_Integer num);

		/****** Interface_InterfaceModel::FillIterator ******/
		/****** md5 signature: e32e298c5181f5a878a91b9da55bfb78 ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Allows an EntityIterator to get a list of Entities.
") FillIterator;
		void FillIterator(Interface_EntityIterator & iter);

		/****** Interface_InterfaceModel::FillSemanticChecks ******/
		/****** md5 signature: 40e1fc0a50fdfc3138757138d2820d80 ******/
		%feature("compactdefaultargs") FillSemanticChecks;
		%feature("autodoc", "
Parameters
----------
checks: Interface_CheckIterator
clear: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Fills the list of semantic checks. This list is computed (by CheckTool). Hence, it can be stored in the model for later queries <clear> True (D): new list replaces <clear> False: new list is cumulated.
") FillSemanticChecks;
		void FillSemanticChecks(const Interface_CheckIterator & checks, const Standard_Boolean clear = Standard_True);

		/****** Interface_InterfaceModel::GTool ******/
		/****** md5 signature: 442168885b1e4cac37d4ca65310561d7 ******/
		%feature("compactdefaultargs") GTool;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_GTool>

Description
-----------
Returns the GTool, set by SetProtocol or by SetGTool.
") GTool;
		opencascade::handle<Interface_GTool> GTool();

		/****** Interface_InterfaceModel::GetFromAnother ******/
		/****** md5 signature: 2b999b3d9af826c9b51624ead382edcb ******/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "
Parameters
----------
other: Interface_InterfaceModel

Return
-------
None

Description
-----------
Gets header (data specific of a defined Interface) from another InterfaceModel; called from TransferCopy.
") GetFromAnother;
		virtual void GetFromAnother(const opencascade::handle<Interface_InterfaceModel> & other);

		/****** Interface_InterfaceModel::GetFromTransfer ******/
		/****** md5 signature: b546874e810498b992cf5d8486c6d36f ******/
		%feature("compactdefaultargs") GetFromTransfer;
		%feature("autodoc", "
Parameters
----------
aniter: Interface_EntityIterator

Return
-------
None

Description
-----------
Gets contents from an EntityIterator, prepared by a Transfer tool (e.g TransferCopy). Starts from clear.
") GetFromTransfer;
		void GetFromTransfer(const Interface_EntityIterator & aniter);

		/****** Interface_InterfaceModel::GlobalCheck ******/
		/****** md5 signature: 07ea4d2b31d05f75a8ce725bb91a30f1 ******/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "
Parameters
----------
syntactic: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the GlobalCheck, which memorizes messages global to the file (not specific to an Entity), especially Header.
") GlobalCheck;
		const opencascade::handle<Interface_Check> & GlobalCheck(const Standard_Boolean syntactic = Standard_True);

		/****** Interface_InterfaceModel::HasSemanticChecks ******/
		/****** md5 signature: 25996bc5ed2fb63f583d93c6a05d5b3a ******/
		%feature("compactdefaultargs") HasSemanticChecks;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if semantic checks have been filled.
") HasSemanticChecks;
		Standard_Boolean HasSemanticChecks();

		/****** Interface_InterfaceModel::HasTemplate ******/
		/****** md5 signature: b06e71ec5ad78b50c72b6246c9763170 ******/
		%feature("compactdefaultargs") HasTemplate;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Returns true if a template is attached to a given name.
") HasTemplate;
		static Standard_Boolean HasTemplate(Standard_CString name);

		/****** Interface_InterfaceModel::IsErrorEntity ******/
		/****** md5 signature: 9a0553bfba8f28a3e309e7419a8bf0b2 ******/
		%feature("compactdefaultargs") IsErrorEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if <num> identifies an Error Entity: in this case, a ReportEntity brings Fail Messages and possibly an 'undefined' Content, see IsRedefinedEntity.
") IsErrorEntity;
		Standard_Boolean IsErrorEntity(const Standard_Integer num);

		/****** Interface_InterfaceModel::IsRedefinedContent ******/
		/****** md5 signature: 2d2b05e5e8de661ff25d445ddf8f7cb9 ******/
		%feature("compactdefaultargs") IsRedefinedContent;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if <num> identifies an Entity which content is redefined through a ReportEntity (i.e. with literal data only) This happens when an entity is syntactically erroneous in the way that its basic content remains empty. For more details (such as content itself), see ReportEntity.
") IsRedefinedContent;
		Standard_Boolean IsRedefinedContent(const Standard_Integer num);

		/****** Interface_InterfaceModel::IsReportEntity ******/
		/****** md5 signature: 8a51fbfcbc8281bc9537df0d8f270f72 ******/
		%feature("compactdefaultargs") IsReportEntity;
		%feature("autodoc", "
Parameters
----------
num: int
semantic: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Returns True if <num> identifies a ReportEntity in the Model Hence, ReportEntity can be called. //! By default, queries main report, if <semantic> is True, it queries report for semantic check //! Remember that a Report Entity can be defined for an Unknown Entity, or a Corrected or Erroneous (at read time) Entity. The ReportEntity is defined before call to method AddEntity.
") IsReportEntity;
		Standard_Boolean IsReportEntity(const Standard_Integer num, const Standard_Boolean semantic = Standard_False);

		/****** Interface_InterfaceModel::IsUnknownEntity ******/
		/****** md5 signature: 33f8ad771959bb49a6c2ad1988bd484a ******/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if <num> identifies an Unknown Entity: in this case, a ReportEntity with no Check Messages designates it.
") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity(const Standard_Integer num);

		/****** Interface_InterfaceModel::ListTemplates ******/
		/****** md5 signature: 2c47e2ad24fb7574a13bdb719e3129de ******/
		%feature("compactdefaultargs") ListTemplates;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the complete list of names attached to template models.
") ListTemplates;
		static opencascade::handle<TColStd_HSequenceOfHAsciiString> ListTemplates();

		/****** Interface_InterfaceModel::NbEntities ******/
		/****** md5 signature: 533943455099343f106415a0a22e8ac9 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of contained Entities.
") NbEntities;
		Standard_Integer NbEntities();

		/****** Interface_InterfaceModel::NbTypes ******/
		/****** md5 signature: 2114040d9f988eb8e8a24fa970513b31 ******/
		%feature("compactdefaultargs") NbTypes;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Returns the count of DISTINCT types under which an entity may be processed. Defined by the Protocol, which gives default as 1 (dynamic Type).
") NbTypes;
		Standard_Integer NbTypes(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_InterfaceModel::NewEmptyModel ******/
		/****** md5 signature: b02638b80473ee01c47c59397cf9207f ******/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns a New Empty Model, same type as <self> (whatever its Type); called to Copy parts a Model into other ones, then followed by a call to GetFromAnother (Header) then filling with specified Entities, themselves copied.
") NewEmptyModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****** Interface_InterfaceModel::NextNumberForLabel ******/
		/****** md5 signature: 8f59fe41365cb072f36e69eb064247b9 ******/
		%feature("compactdefaultargs") NextNumberForLabel;
		%feature("autodoc", "
Parameters
----------
label: str
lastnum: int (optional, default to 0)
exact: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Searches a label which matches with one entity. Begins from <lastnum>+1 (default:1) and scans the entities until <NbEntities>. For the first which matches <label>, this method returns its Number. Returns 0 if nothing found Can be called recursively (labels are not specified as unique) <exact>: if True (default), exact match is required else, checks the END of entity label //! This method is virtual, hence it can be redefined for a more efficient search (if exact is true).
") NextNumberForLabel;
		virtual Standard_Integer NextNumberForLabel(Standard_CString label, const Standard_Integer lastnum = 0, const Standard_Boolean exact = Standard_True);

		/****** Interface_InterfaceModel::Number ******/
		/****** md5 signature: f25a1d68cbbad3b088f5d847de3ffede ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "
Parameters
----------
anentity: Standard_Transient

Return
-------
int

Description
-----------
Returns the Number of an Entity in the Model if it contains it. Else returns 0. For a ReportEntity, looks at Concerned Entity. Returns the Directory entry Number of an Entity in the Model if it contains it. Else returns 0. For a ReportEntity, looks at Concerned Entity.
") Number;
		Standard_Integer Number(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_InterfaceModel::Print ******/
		/****** md5 signature: f32d9b13a42d350bd451be6e924bdd04 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
mode: int (optional, default to 0)

Return
-------
s: Standard_OStream

Description
-----------
Prints identification of a given entity in <self>, in order to be printed in a list or phrase <mode> < 0: prints only its number <mode> = 1: just calls PrintLabel <mode> = 0 (D): prints its number plus '/' plus PrintLabel If <ent> == <self>, simply prints 'Global' If <ent> is unknown, prints '/its type'.
") Print;
		void Print(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue, const Standard_Integer mode = 0);

		/****** Interface_InterfaceModel::PrintLabel ******/
		/****** md5 signature: 52220811631aa24ac981dc628dc618c9 ******/
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Prints label specific to each norm, for a given entity. Must only print label itself, in order to be included in a phrase. Can call the result of StringLabel, but not obliged.
") PrintLabel;
		virtual void PrintLabel(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** Interface_InterfaceModel::PrintToLog ******/
		/****** md5 signature: b7aa819e37079792a003e300dd25e367 ******/
		%feature("compactdefaultargs") PrintToLog;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Prints label specific to each norm in log format, for a given entity. By default, just calls PrintLabel, can be redefined.
") PrintToLog;
		virtual void PrintToLog(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** Interface_InterfaceModel::Protocol ******/
		/****** md5 signature: 2dce80af32cedc07d353d312ab7e2c73 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol which has been set by SetProtocol, or AddWithRefs with Protocol.
") Protocol;
		virtual opencascade::handle<Interface_Protocol> Protocol();

		/****** Interface_InterfaceModel::Redefineds ******/
		/****** md5 signature: 9237c4996df81ce3ec342e4fde1775ed ******/
		%feature("compactdefaultargs") Redefineds;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of ReportEntities which redefine data (generally, if concerned entity is 'Error', a literal content is added to it: this is a 'redefined entity'.
") Redefineds;
		Interface_EntityIterator Redefineds();

		/****** Interface_InterfaceModel::ReplaceEntity ******/
		/****** md5 signature: d6293134eba6b588440f32634f39e804 ******/
		%feature("compactdefaultargs") ReplaceEntity;
		%feature("autodoc", "
Parameters
----------
nument: int
anent: Standard_Transient

Return
-------
None

Description
-----------
Replace Entity with Number=nument on other entity - 'anent'.
") ReplaceEntity;
		void ReplaceEntity(const Standard_Integer nument, const opencascade::handle<Standard_Transient> & anent);

		/****** Interface_InterfaceModel::ReportEntity ******/
		/****** md5 signature: ddc1c48add2352efbffabcf415ec0d82 ******/
		%feature("compactdefaultargs") ReportEntity;
		%feature("autodoc", "
Parameters
----------
num: int
semantic: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<Interface_ReportEntity>

Description
-----------
Returns a ReportEntity identified by its number in the Model, or a Null Handle If <num> does not identify a ReportEntity. //! By default, queries main report, if <semantic> is True, it queries report for semantic check.
") ReportEntity;
		opencascade::handle<Interface_ReportEntity> ReportEntity(const Standard_Integer num, const Standard_Boolean semantic = Standard_False);

		/****** Interface_InterfaceModel::Reports ******/
		/****** md5 signature: 7dcbd1cdc4196a34ee9cc60f3720069c ******/
		%feature("compactdefaultargs") Reports;
		%feature("autodoc", "
Parameters
----------
semantic: bool (optional, default to Standard_False)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of all ReportEntities, i.e. data about Entities read with Error or Warning information (each item has to be casted to Report Entity then it can be queried for Concerned Entity, Content, Check ...) By default, returns the main reports, is <semantic> is True it returns the list for semantic checks.
") Reports;
		Interface_EntityIterator Reports(const Standard_Boolean semantic = Standard_False);

		/****** Interface_InterfaceModel::Reservate ******/
		/****** md5 signature: 6f07eeb3c9145319791e01dbbf310cf9 ******/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "
Parameters
----------
nbent: int

Return
-------
None

Description
-----------
Does a reservation for the List of Entities (for optimized storage management). If it is not called, storage management can be less efficient. <nbent> is the expected count of Entities to store.
") Reservate;
		virtual void Reservate(const Standard_Integer nbent);

		/****** Interface_InterfaceModel::ReverseOrders ******/
		/****** md5 signature: 4dcab9ca5675a7721a6366662a3fb695 ******/
		%feature("compactdefaultargs") ReverseOrders;
		%feature("autodoc", "
Parameters
----------
after: int (optional, default to 0)

Return
-------
None

Description
-----------
Reverses the Numbers of the Entities, between <after> and the total count of Entities. Thus, the entities: 1,2 ... after, after+1 ... nb-1, nb become numbered as: 1,2 ... after, nb, nb-1 ... after+1 By default (after = 0) the whole list of Entities is reversed.
") ReverseOrders;
		void ReverseOrders(const Standard_Integer after = 0);

		/****** Interface_InterfaceModel::SetCategoryNumber ******/
		/****** md5 signature: 0de38faf7d2d0456d0b564ba5cc882c6 ******/
		%feature("compactdefaultargs") SetCategoryNumber;
		%feature("autodoc", "
Parameters
----------
num: int
val: int

Return
-------
bool

Description
-----------
Records a category number for an entity number Returns True when done, False if <num> is out of range.
") SetCategoryNumber;
		Standard_Boolean SetCategoryNumber(const Standard_Integer num, const Standard_Integer val);

		/****** Interface_InterfaceModel::SetGTool ******/
		/****** md5 signature: 426fee21a6a5a7870be99f65c2ee1aa3 ******/
		%feature("compactdefaultargs") SetGTool;
		%feature("autodoc", "
Parameters
----------
gtool: Interface_GTool

Return
-------
None

Description
-----------
Sets a GTool for this model, which already defines a Protocol.
") SetGTool;
		void SetGTool(const opencascade::handle<Interface_GTool> & gtool);

		/****** Interface_InterfaceModel::SetGlobalCheck ******/
		/****** md5 signature: b9ac7c37d00ace1f24e5ca276842e825 ******/
		%feature("compactdefaultargs") SetGlobalCheck;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check

Return
-------
None

Description
-----------
Allows to modify GlobalCheck, after getting then completing it Remark: it is SYNTACTIC check. Semantics, see FillChecks.
") SetGlobalCheck;
		void SetGlobalCheck(const opencascade::handle<Interface_Check> & ach);

		/****** Interface_InterfaceModel::SetProtocol ******/
		/****** md5 signature: 2468c79c489a1445180ccb57ff37a4b0 ******/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "
Parameters
----------
proto: Interface_Protocol

Return
-------
None

Description
-----------
Sets a Protocol for this Model It is also set by a call to AddWithRefs with Protocol It is used for: DumpHeader (as required), ClearEntities ...
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & proto);

		/****** Interface_InterfaceModel::SetReportEntity ******/
		/****** md5 signature: 47b9d0b16e3a849d4ba4e5137695613e ******/
		%feature("compactdefaultargs") SetReportEntity;
		%feature("autodoc", "
Parameters
----------
num: int
rep: Interface_ReportEntity

Return
-------
bool

Description
-----------
Sets or Replaces a ReportEntity for the Entity <num>. Returns True if Report is replaced, False if it has been replaced Warning: the caller must assume that this setting is meaningful.
") SetReportEntity;
		Standard_Boolean SetReportEntity(const Standard_Integer num, const opencascade::handle<Interface_ReportEntity> & rep);

		/****** Interface_InterfaceModel::SetTemplate ******/
		/****** md5 signature: 946918dd1dfae5599e9388cb399b596a ******/
		%feature("compactdefaultargs") SetTemplate;
		%feature("autodoc", "
Parameters
----------
name: str
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Records a new template model with a name. If the name was already recorded, the corresponding template is replaced by the new one. Then, WARNING: test HasTemplate to avoid surprises.
") SetTemplate;
		static Standard_Boolean SetTemplate(Standard_CString name, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Interface_InterfaceModel::StringLabel ******/
		/****** md5 signature: 31c0b3f4364a8064ca7024a2a736f259 ******/
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a string with the label attached to a given entity. Warning: While this string may be edited on the spot, if it is a read field, the returned value must be copied before.
") StringLabel;
		virtual opencascade::handle<TCollection_HAsciiString> StringLabel(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_InterfaceModel::Template ******/
		/****** md5 signature: 3304d8ba4bb5c09675517f94d9d091c3 ******/
		%feature("compactdefaultargs") Template;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the template model attached to a name, or a Null Handle.
") Template;
		static opencascade::handle<Interface_InterfaceModel> Template(Standard_CString name);

		/****** Interface_InterfaceModel::Type ******/
		/****** md5 signature: da60bf49fd753ae14bcafada17bba312 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
num: int (optional, default to 1)

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns a type, given its rank: defined by the Protocol (by default, the first one).
") Type;
		opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer num = 1);

		/****** Interface_InterfaceModel::TypeName ******/
		/****** md5 signature: 6373a0a5f8f4cdd443caf338fdcd04a8 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
complete: bool (optional, default to Standard_True)

Return
-------
str

Description
-----------
Returns the type name of an entity, from the list of types (one or more ...) <complete> True (D) gives the complete type, else packages are removed WARNING: buffered, to be immediately copied or printed.
") TypeName;
		Standard_CString TypeName(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean complete = Standard_True);

		/****** Interface_InterfaceModel::Value ******/
		/****** md5 signature: a291325b4e5caa2a5ab946934090ec8b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an Entity identified by its number in the Model Each sub-class of InterfaceModel can define its own method Entity to return its specific class of Entity (e.g. for VDA, VDAModel returns a VDAEntity), working by calling Value Remark: For a Reported Entity, (Erroneous, Corrected, Unknown), this method returns this Reported Entity. See ReportEntity for other questions.
") Value;
		const opencascade::handle<Standard_Transient> & Value(const Standard_Integer num);

		/****** Interface_InterfaceModel::VerifyCheck ******/
		/****** md5 signature: 2f1dfe74657145cf0073cfba1684e844 ******/
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check

Return
-------
None

Description
-----------
Minimum Semantic Global Check on data in model (header) Can only check basic Data. See also GlobalCheck from Protocol for a check which takes the Graph into account Default does nothing, can be redefined.
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
		/****** Interface_LineBuffer::Interface_LineBuffer ******/
		/****** md5 signature: 4cdbf84bbb8d172c7bfdf161780c1eba ******/
		%feature("compactdefaultargs") Interface_LineBuffer;
		%feature("autodoc", "
Parameters
----------
size: int (optional, default to 10)

Return
-------
None

Description
-----------
Creates a LineBuffer with an absolute maximum size (Default value is only to satisfy compiler requirement).
") Interface_LineBuffer;
		 Interface_LineBuffer(const Standard_Integer size = 10);

		/****** Interface_LineBuffer::Add ******/
		/****** md5 signature: 5c01da915f25c93071b431b3f7ef2eca ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
text: str

Return
-------
None

Description
-----------
Adds a text as a CString. Its Length is evaluated from the text (by C function strlen).
") Add;
		void Add(Standard_CString text);

		/****** Interface_LineBuffer::Add ******/
		/****** md5 signature: 881da44d801a4bde276a120320281d38 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
text: str
lntext: int

Return
-------
None

Description
-----------
Adds a text as a CString. Its length is given as <lntext>.
") Add;
		void Add(Standard_CString text, const Standard_Integer lntext);

		/****** Interface_LineBuffer::Add ******/
		/****** md5 signature: 44e9d546aa4891e8b4d514c71dd12e4a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
text: str

Return
-------
None

Description
-----------
Adds a text as a AsciiString from TCollection.
") Add;
		void Add(TCollection_AsciiString text);

		/****** Interface_LineBuffer::Add ******/
		/****** md5 signature: 09c9ed86e8cab71a163a455eb49a769d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
text: Standard_Character

Return
-------
None

Description
-----------
Adds a text made of only ONE Character.
") Add;
		void Add(const Standard_Character text);

		/****** Interface_LineBuffer::CanGet ******/
		/****** md5 signature: c90da290ebabc1722b6f88371ad4504a ******/
		%feature("compactdefaultargs") CanGet;
		%feature("autodoc", "
Parameters
----------
more: int

Return
-------
bool

Description
-----------
Returns True if there is room enough to add <more> characters Else, it is required to Dump the Buffer before refilling it <more> is recorded to manage SetKeep status.
") CanGet;
		Standard_Boolean CanGet(const Standard_Integer more);

		/****** Interface_LineBuffer::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears completely the LineBuffer.
") Clear;
		void Clear();

		/****** Interface_LineBuffer::Content ******/
		/****** md5 signature: da26760e5fb7431e97c1e9a66278100f ******/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the Content of the LineBuffer.
") Content;
		Standard_CString Content();

		/****** Interface_LineBuffer::FreezeInitial ******/
		/****** md5 signature: dbf139b695534a1365987a2862b1ca6a ******/
		%feature("compactdefaultargs") FreezeInitial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Inhibits effect of SetInitial until the next Move (i.e. Keep) Then Prepare will not insert initial blanks, but further ones will. This allows to cancel initial blanks on an internal Split A call to SetInitial has no effect on this until Move.
") FreezeInitial;
		void FreezeInitial();

		/****** Interface_LineBuffer::Length ******/
		/****** md5 signature: f2d149cffca76ec002490404b3e808e1 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Length of the LineBuffer.
") Length;
		Standard_Integer Length();

		/****** Interface_LineBuffer::Move ******/
		/****** md5 signature: 52b2fbc1473ae88a85a1baac6aa8cced ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
str: str

Return
-------
None

Description
-----------
Fills a AsciiString <str> with the Content of the Line Buffer, then Clears the LineBuffer.
") Move;
		void Move(TCollection_AsciiString & str);

		/****** Interface_LineBuffer::Move ******/
		/****** md5 signature: 6419cf4f874e6c5de19972a46c8093f2 ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
str: TCollection_HAsciiString

Return
-------
None

Description
-----------
Same as above, but <str> is known through a Handle.
") Move;
		void Move(const opencascade::handle<TCollection_HAsciiString> & str);

		/****** Interface_LineBuffer::Moved ******/
		/****** md5 signature: 1436c75d7c1b6cb7f8d6f09dadd0b398 ******/
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Same as above, but generates the HAsciiString.
") Moved;
		opencascade::handle<TCollection_HAsciiString> Moved();

		/****** Interface_LineBuffer::SetInitial ******/
		/****** md5 signature: 6d58812e5a742367fc4745b4777bddbc ******/
		%feature("compactdefaultargs") SetInitial;
		%feature("autodoc", "
Parameters
----------
initial: int

Return
-------
None

Description
-----------
Sets an Initial reservation for Blank characters (this reservation is counted in the size of the current Line).
") SetInitial;
		void SetInitial(const Standard_Integer initial);

		/****** Interface_LineBuffer::SetKeep ******/
		/****** md5 signature: 83f5e8d529bc280c88f0ac23cf9c718b ******/
		%feature("compactdefaultargs") SetKeep;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets a Keep Status at current Length. It means that at next Move, the new line will begin by characters between Keep + 1 and current Length.
") SetKeep;
		void SetKeep();

		/****** Interface_LineBuffer::SetMax ******/
		/****** md5 signature: 87c4c922204a679f3662057e4a91f350 ******/
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "
Parameters
----------
max: int

Return
-------
None

Description
-----------
Changes Maximum allowed size of Buffer. If <max> is Zero, Maximum size is set to the initial size.
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
		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: 04a5264e61423cc57b6a1ff68915b6bf ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: str

Return
-------
None

Description
-----------
A MSG is created to write a 'functional code' in conjunction with operator () attached to Value Then, to have a translated message, write in C++: //! Interface_MSG('...mykey...') which returns a CString See also some help which follow.
") Interface_MSG;
		 Interface_MSG(Standard_CString key);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: 8fef5720569bdcbf8f66102a1bcd3773 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: str
i1: int

Return
-------
None

Description
-----------
Translates a message which contains one integer variable It is just a help which avoid the following: char mess[100]; sprintf(mess,Interface_MSG('code'),ival); then AddFail(mess); replaced by AddFail (Interface_MSG('code',ival)); //! The basic message is intended to be in C-sprintf format, with one %d form in it.
") Interface_MSG;
		 Interface_MSG(Standard_CString key, const Standard_Integer i1);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: b704e9e172b160d189e3aae96cf60977 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: str
i1: int
i2: int

Return
-------
None

Description
-----------
Translates a message which contains two integer variables As for one integer, it is just a writing help //! The basic message is intended to be in C-sprintf format with two %d forms in it.
") Interface_MSG;
		 Interface_MSG(Standard_CString key, const Standard_Integer i1, const Standard_Integer i2);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: 39d5887ce5b9e3f190368eb9565041a7 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: str
r1: float
intervals: int (optional, default to -1)

Return
-------
None

Description
-----------
Translates a message which contains one real variable <intervals> if set, commands the variable to be rounded to an interval (see below, method Intervals) As for one integer, it is just a writing help //! The basic message is intended to be in C-sprintf format with one %f form (or equivalent: %e etc) in it.
") Interface_MSG;
		 Interface_MSG(Standard_CString key, const Standard_Real r1, const Standard_Integer intervals = -1);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: a2f1c0137cdd8a92831417c5462bb4ac ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: str
str: str

Return
-------
None

Description
-----------
Translates a message which contains one string variable As for one integer, it is just a writing help //! The basic message is intended to be in C-sprintf format with one %s form in it.
") Interface_MSG;
		 Interface_MSG(Standard_CString key, Standard_CString str);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: 8e2b0e98eefb8d62808c6366cf59b6c7 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: str
ival: int
str: str

Return
-------
None

Description
-----------
Translates a message which contains one integer and one string variables As for one integer, it is just a writing help Used for instance to say 'Param n0.<ival> i.e. <str> is not..' //! The basic message is intended to be in C-sprintf format with one %d then one %s forms in it.
") Interface_MSG;
		 Interface_MSG(Standard_CString key, const Standard_Integer ival, Standard_CString str);

		/****** Interface_MSG::Blanks ******/
		/****** md5 signature: cbb8c4b37e8156925f73c160286da4ff ******/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "
Parameters
----------
val: int
max: int

Return
-------
str

Description
-----------
Returns a blank string, of length between 0 and <max>, to fill the printing of a numeric value <val>, i.e.: If val < 10 , max-1 blanks If val between 10 and 99, max-2 blanks ... etc...
") Blanks;
		static Standard_CString Blanks(const Standard_Integer val, const Standard_Integer max);

		/****** Interface_MSG::Blanks ******/
		/****** md5 signature: a27333232482e7c6487dfb04b0ad78af ******/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "
Parameters
----------
val: str
max: int

Return
-------
str

Description
-----------
Returns a blank string, to complete a given string <val> up to <max> characters: If strlen(val) is 0, max blanks If strlen(val) is 5, max-5 blanks etc...
") Blanks;
		static Standard_CString Blanks(Standard_CString val, const Standard_Integer max);

		/****** Interface_MSG::Blanks ******/
		/****** md5 signature: 0e8c564f928f260c2991324aa3b7b503 ******/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "
Parameters
----------
count: int

Return
-------
str

Description
-----------
Returns a blank string of <count> blanks (mini 0, maxi 76).
") Blanks;
		static Standard_CString Blanks(const Standard_Integer count);

		/****** Interface_MSG::CDate ******/
		/****** md5 signature: 87ef2d72f27848bc913516356143b696 ******/
		%feature("compactdefaultargs") CDate;
		%feature("autodoc", "
Parameters
----------
text1: str
text2: str

Return
-------
int

Description
-----------
Returns a value about comparison of two dates 0: equal. <0 text1 anterior. >0 text1 posterior.
") CDate;
		static Standard_Integer CDate(Standard_CString text1, Standard_CString text2);

		/****** Interface_MSG::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Optimised destructor (applies for additional forms of Create).
") Destroy;
		void Destroy();

		/****** Interface_MSG::Intervalled ******/
		/****** md5 signature: e4c9aeb91835b2908a66a08b0440622e ******/
		%feature("compactdefaultargs") Intervalled;
		%feature("autodoc", "
Parameters
----------
val: float
order: int (optional, default to 3)
upper: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Returns an 'intervalled' value from a starting real <val>: i.e. a value which is rounded on an interval limit Interval limits are defined to be in a coarsely 'geometric' progression (two successive intervals are inside a limit ratio) //! <order> gives the count of desired intervals in a range <1-10> <upper> False, returns the first lower interval (D) <upper> True, returns the first upper interval Values of Intervals according <order>: 0,1: 1 10 100 ... 2: 1 3 10 30 100 ... 3(D): 1 2 5 10 20 50 100 ... 4: 1 2 3 6 10 20 30 60 100 ... 6: 1 1.5 2 3 5 7 10 15 20 ... 10: 1 1.2 1.5 2 2.5 3 4 5 6 8 10 12 15 20 25 ...
") Intervalled;
		static Standard_Real Intervalled(const Standard_Real val, const Standard_Integer order = 3, const Standard_Boolean upper = Standard_False);

		/****** Interface_MSG::IsKey ******/
		/****** md5 signature: e0815ed8b6506b4eb3f582c4ad557426 ******/
		%feature("compactdefaultargs") IsKey;
		%feature("autodoc", "
Parameters
----------
mess: str

Return
-------
bool

Description
-----------
Returns True if a given message is surely a key (according to the form adopted for keys) (before activating messages, answer is false).
") IsKey;
		static Standard_Boolean IsKey(Standard_CString mess);

		/****** Interface_MSG::NDate ******/
		/****** md5 signature: eeb2f5af5a033fa1528f872cb3fd2fa2 ******/
		%feature("compactdefaultargs") NDate;
		%feature("autodoc", "
Parameters
----------
text: str

Return
-------
yy: int
mm: int
dd: int
hh: int
mn: int
ss: int

Description
-----------
Decodes a date to numeric integer values Returns True if OK, False if text does not fit with required format. Incomplete forms are allowed (for instance, for only YYYY-MM-DD, hour is zero).
") NDate;
		static Standard_Boolean NDate(Standard_CString text, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Interface_MSG::Print ******/
		/****** md5 signature: 8ceabb583669672b2199c7b698914502 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
val: str
max: int
just: int (optional, default to -1)

Return
-------
S: Standard_OStream

Description
-----------
Prints a String on an Output Stream, as follows: Accompanied with blanks, to give up to <max> charis at all, justified according just: -1 (D): left 0: center 1: right Maximum 76 characters.
") Print;
		static void Print(std::ostream &OutValue, Standard_CString val, const Standard_Integer max, const Standard_Integer just = -1);

		/****** Interface_MSG::PrintTrace ******/
		/****** md5 signature: 1e6fc924febc04632e11bb3880253bee ******/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Prints the recorded errors (without title; can be empty, this is the normally expected case).
") PrintTrace;
		static void PrintTrace(std::ostream &OutValue);

		/****** Interface_MSG::Read ******/
		/****** md5 signature: f8598b09b5e3b635ed31058415611435 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
S: str

Return
-------
int

Description
-----------
Reads a list of messages from a stream, returns read count 0 means empty file, -1 means error.
") Read;
		static Standard_Integer Read(std::istream & S);

		/****** Interface_MSG::Read ******/
		/****** md5 signature: 858a3ab50e2d14b2c69b3dde90ff0915 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
file: str

Return
-------
int

Description
-----------
Reads a list of messages from a file defined by its name.
") Read;
		static Standard_Integer Read(Standard_CString file);

		/****** Interface_MSG::Record ******/
		/****** md5 signature: 57cce17521acc7b079a4a53ccae00972 ******/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "
Parameters
----------
key: str
item: str

Return
-------
None

Description
-----------
Fills the dictionary with a couple (key-item) If a key is already recorded, it is possible to: - keep the last definition, and activate the trace system.
") Record;
		static void Record(Standard_CString key, Standard_CString item);

		/****** Interface_MSG::SetMode ******/
		/****** md5 signature: b14fe630786054e523f862ea57aaf3ad ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
running: bool
raising: bool

Return
-------
None

Description
-----------
Sets the main modes for MSG: - if <running> is True, translation works normally - if <running> is False, translated item equate keys - if <raising> is True, errors (from Record or Translate) cause MSG to raise an exception - if <raising> is False, MSG runs without exception, then see also Trace Modes above.
") SetMode;
		static void SetMode(const Standard_Boolean running, const Standard_Boolean raising);

		/****** Interface_MSG::SetTrace ******/
		/****** md5 signature: 952f5a6e86a025207fa89158cf3a7bb0 ******/
		%feature("compactdefaultargs") SetTrace;
		%feature("autodoc", "
Parameters
----------
toprint: bool
torecord: bool

Return
-------
None

Description
-----------
Sets the trace system to work when activated, as follow: - if <toprint> is True, print immediately on standard output - if <torecord> is True, record it for further print.
") SetTrace;
		static void SetTrace(const Standard_Boolean toprint, const Standard_Boolean torecord);

		/****** Interface_MSG::TDate ******/
		/****** md5 signature: e8cc703373ff0bd4920d29504dfa08bf ******/
		%feature("compactdefaultargs") TDate;
		%feature("autodoc", "
Parameters
----------
text: str
yy: int
mm: int
dd: int
hh: int
mn: int
ss: int
format: str (optional, default to "")

Return
-------
None

Description
-----------
Codes a date as a text, from its numeric value (-> seconds): YYYY-MM-DD:HH-MN-SS fixed format, completed by leading zeros Another format can be provided, as follows: C:%d ... C like format, preceded by C: S:... format to call system (not yet implemented).
") TDate;
		static void TDate(Standard_CString text, const Standard_Integer yy, const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, Standard_CString format = "");

		/****** Interface_MSG::Translated ******/
		/****** md5 signature: c9597bb549cfddf798fd1bc9a797094c ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
key: str

Return
-------
str

Description
-----------
Returns the item recorded for a key. Returns the key itself if: - it is not recorded (then, the trace system is activated) - MSG has been required to be hung on.
") Translated;
		static Standard_CString Translated(Standard_CString key);

		/****** Interface_MSG::Value ******/
		/****** md5 signature: e8ad3e0eb6ba1377e7d5d00bb4ae5215 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the translated message, in a functional form with operator () was C++: return const.
") Value;
		Standard_CString Value();

		/****** Interface_MSG::Write ******/
		/****** md5 signature: 5d0fb0710cbfaa527a5eba31f6de7c16 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
rootkey: str (optional, default to "")

Return
-------
S: Standard_OStream

Description
-----------
Writes the list of messages recorded to be translated, to a stream. Writes all the list (Default) or only keys which begin by <rootkey>. Returns the count of written messages.
") Write;
		static Standard_Integer Write(std::ostream &OutValue, Standard_CString rootkey = "");

};


%extend Interface_MSG {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Interface_NodeOfGeneralLib *
***********************************/
class Interface_NodeOfGeneralLib : public Standard_Transient {
	public:
		/****** Interface_NodeOfGeneralLib::Interface_NodeOfGeneralLib ******/
		/****** md5 signature: b52c0341579621739870213e13925863 ******/
		%feature("compactdefaultargs") Interface_NodeOfGeneralLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Node, with no Next.
") Interface_NodeOfGeneralLib;
		 Interface_NodeOfGeneralLib();

		/****** Interface_NodeOfGeneralLib::AddNode ******/
		/****** md5 signature: 2b5e7f65eeae1b8a04ccce75ba8f30e8 ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
anode: Interface_GlobalNodeOfGeneralLib

Return
-------
None

Description
-----------
Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it.
") AddNode;
		void AddNode(const opencascade::handle<Interface_GlobalNodeOfGeneralLib> & anode);

		/****** Interface_NodeOfGeneralLib::Module ******/
		/****** md5 signature: 786fb9d122db15779294d93c1e06036b ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_GeneralModule>

Description
-----------
Returns the Module designated by a precise Node.
") Module;
		const opencascade::handle<Interface_GeneralModule> & Module();

		/****** Interface_NodeOfGeneralLib::Next ******/
		/****** md5 signature: f4703661a70ab405f55a3a493a07aa3d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_NodeOfGeneralLib>

Description
-----------
Returns the Next Node. If none was defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<Interface_NodeOfGeneralLib> & Next();

		/****** Interface_NodeOfGeneralLib::Protocol ******/
		/****** md5 signature: c905586547d9ad373f87bcb2ce1d329f ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol designated by a precise Node.
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
		/****** Interface_NodeOfReaderLib::Interface_NodeOfReaderLib ******/
		/****** md5 signature: f83b980811fbfe5223fa65e10445ded4 ******/
		%feature("compactdefaultargs") Interface_NodeOfReaderLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Node, with no Next.
") Interface_NodeOfReaderLib;
		 Interface_NodeOfReaderLib();

		/****** Interface_NodeOfReaderLib::AddNode ******/
		/****** md5 signature: e682845bab9f0ad9949e35b0a7eade5a ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
anode: Interface_GlobalNodeOfReaderLib

Return
-------
None

Description
-----------
Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it.
") AddNode;
		void AddNode(const opencascade::handle<Interface_GlobalNodeOfReaderLib> & anode);

		/****** Interface_NodeOfReaderLib::Module ******/
		/****** md5 signature: ee4e5065695c1821dd69ceb165b67caf ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_ReaderModule>

Description
-----------
Returns the Module designated by a precise Node.
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****** Interface_NodeOfReaderLib::Next ******/
		/****** md5 signature: 190c0410bd65df10af82886b13de3970 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_NodeOfReaderLib>

Description
-----------
Returns the Next Node. If none was defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<Interface_NodeOfReaderLib> & Next();

		/****** Interface_NodeOfReaderLib::Protocol ******/
		/****** md5 signature: c905586547d9ad373f87bcb2ce1d329f ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol designated by a precise Node.
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
		/****** Interface_ParamList::Interface_ParamList ******/
		/****** md5 signature: fa22f878906433dd2e43f0b2deb4af1c ******/
		%feature("compactdefaultargs") Interface_ParamList;
		%feature("autodoc", "
Parameters
----------
theIncrement: int (optional, default to 256)

Return
-------
None

Description
-----------
Creates an vector with size of memory block equal to theIncrement.
") Interface_ParamList;
		 Interface_ParamList(const Standard_Integer theIncrement = 256);

		/****** Interface_ParamList::ChangeValue ******/
		/****** md5 signature: e4421944ff2304a2e0ee257a1e10e1f2 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Interface_FileParameter

Description
-----------
return the value of the <Index>th element of the array.
") ChangeValue;
		Interface_FileParameter & ChangeValue(const Standard_Integer Index);

		/****** Interface_ParamList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** Interface_ParamList::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements of <self>.
") Length;
		Standard_Integer Length();

		/****** Interface_ParamList::Lower ******/
		/****** md5 signature: fe1655437e349162aeffc9b3814347af ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower bound. Warning.
") Lower;
		Standard_Integer Lower();

		/****** Interface_ParamList::SetValue ******/
		/****** md5 signature: 2a498ccff6a27a887665ac3ac4d82783 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Index: int
Value: Interface_FileParameter

Return
-------
None

Description
-----------
Assigns the value <Value> to the <Index>-th item of this array.
") SetValue;
		void SetValue(const Standard_Integer Index, const Interface_FileParameter & Value);

		/****** Interface_ParamList::Upper ******/
		/****** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper bound. Warning.
") Upper;
		Standard_Integer Upper();

		/****** Interface_ParamList::Value ******/
		/****** md5 signature: d29c7009230283aad1de36c2a391ae06 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Interface_FileParameter

Description
-----------
Return the value of the <Index>th element of the array.
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
		/****** Interface_ParamSet::Interface_ParamSet ******/
		/****** md5 signature: 86128b8ca41fe34b4b00734276016d1a ******/
		%feature("compactdefaultargs") Interface_ParamSet;
		%feature("autodoc", "
Parameters
----------
nres: int
nst: int (optional, default to 1)

Return
-------
None

Description
-----------
Creates an empty ParamSet, beginning at number 'nst' and of initial reservation 'nres': the 'nres' first parameters which follow 'ndeb' (included) will be put in an Array (a ParamList). The remainders are set in Next(s) ParamSet(s).
") Interface_ParamSet;
		 Interface_ParamSet(const Standard_Integer nres, const Standard_Integer nst = 1);

		/****** Interface_ParamSet::Append ******/
		/****** md5 signature: 6df473310f93a04e1bdad84f4c47b22a ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
val: str
lnval: int
typ: Interface_ParamType
nument: int

Return
-------
int

Description
-----------
Adds a parameter defined as its Value (CString and length) and Type. Optional EntityNumber (for FileReaderData) can be given Allows a better memory management than Appending a complete FileParameter If <lnval> < 0, <val> is assumed to be managed elsewhere: its address is stored as such. Else, <val> is copied in a locally (quickly) managed Page of Characters Returns new count of recorded Parameters.
") Append;
		Standard_Integer Append(Standard_CString val, const Standard_Integer lnval, const Interface_ParamType typ, const Standard_Integer nument);

		/****** Interface_ParamSet::Append ******/
		/****** md5 signature: 9fa5e37158f08c7bcfa7adde0474e56e ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
FP: Interface_FileParameter

Return
-------
int

Description
-----------
Adds a parameter at the end of the ParamSet (transparent about reservation and 'Next') Returns new count of recorded Parameters.
") Append;
		Standard_Integer Append(const Interface_FileParameter & FP);

		/****** Interface_ParamSet::ChangeParam ******/
		/****** md5 signature: 87258e99ccdae918a9d150888fa01878 ******/
		%feature("compactdefaultargs") ChangeParam;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
Interface_FileParameter

Description
-----------
Same as above, but in order to be modified on place.
") ChangeParam;
		Interface_FileParameter & ChangeParam(const Standard_Integer num);

		/****** Interface_ParamSet::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Destructor (waiting for transparent memory management).
") Destroy;
		void Destroy();

		/****** Interface_ParamSet::NbParams ******/
		/****** md5 signature: 826f4756fca7f780e6d976c60183d715 ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total count of parameters (including nexts).
") NbParams;
		Standard_Integer NbParams();

		/****** Interface_ParamSet::Param ******/
		/****** md5 signature: 1949a53b04a655a6338a187d5fcc5a80 ******/
		%feature("compactdefaultargs") Param;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
Interface_FileParameter

Description
-----------
Returns a parameter identified by its number.
") Param;
		const Interface_FileParameter & Param(const Standard_Integer num);

		/****** Interface_ParamSet::Params ******/
		/****** md5 signature: e567d6332f33622017ba4bad2eb07dc3 ******/
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "
Parameters
----------
num: int
nb: int

Return
-------
opencascade::handle<Interface_ParamList>

Description
-----------
Builds and returns the sub-list corresponding to parameters, from 'num' included, with count 'nb' If <num> and <nb> are zero, returns the whole list.
") Params;
		opencascade::handle<Interface_ParamList> Params(const Standard_Integer num, const Standard_Integer nb);

		/****** Interface_ParamSet::SetParam ******/
		/****** md5 signature: 5ed10a82094e3c00e10cf64893729af7 ******/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "
Parameters
----------
num: int
FP: Interface_FileParameter

Return
-------
None

Description
-----------
Changes a parameter identified by its number.
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
		/****** Interface_Protocol::Active ******/
		/****** md5 signature: ac2f57ce0f32b6604eeb6b435022b39c ******/
		%feature("compactdefaultargs") Active;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Active Protocol, if defined (else, returns a Null Handle, which means 'no defined active protocol').
") Active;
		static opencascade::handle<Interface_Protocol> Active();

		/****** Interface_Protocol::CaseNumber ******/
		/****** md5 signature: 3bd7fad3575759d2b8624f3c1aea4aed ******/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient

Return
-------
int

Description
-----------
Returns a unique positive CaseNumber for each Recognized Object. By default, recognition is based on Type(1) By default, calls the following one which is deferred.
") CaseNumber;
		virtual Standard_Integer CaseNumber(const opencascade::handle<Standard_Transient> & obj);

		/****** Interface_Protocol::ClearActive ******/
		/****** md5 signature: eb7803a003eb79b2bf4d87bc993aa0bf ******/
		%feature("compactdefaultargs") ClearActive;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases the Active Protocol (hence it becomes undefined).
") ClearActive;
		static void ClearActive();

		/****** Interface_Protocol::GlobalCheck ******/
		/****** md5 signature: 47cba6309a9fd154d60abc631f398f9c ******/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
ach: Interface_Check

Return
-------
bool

Description
-----------
Evaluates a Global Check for a model (with its Graph) Returns True when done, False if data in model do not apply //! Very specific of each norm, i.e. of each protocol: the uppest level Protocol assumes it, it can call GlobalCheck of its resources only if it is necessary //! Default does nothing, can be redefined.
") GlobalCheck;
		virtual Standard_Boolean GlobalCheck(const Interface_Graph & G, opencascade::handle<Interface_Check> & ach);

		/****** Interface_Protocol::IsDynamicType ******/
		/****** md5 signature: f4373a95f4c0e87bff704722f30ec5af ******/
		%feature("compactdefaultargs") IsDynamicType;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if type of <obj> is that defined from CDL This is the default but it may change according implementation.
") IsDynamicType;
		virtual Standard_Boolean IsDynamicType(const opencascade::handle<Standard_Transient> & obj);

		/****** Interface_Protocol::IsSuitableModel ******/
		/****** md5 signature: c8cdcc13aac628ff657714e3f6014d38 ******/
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns True if <model> is a Model of the considered Norm.
") IsSuitableModel;
		virtual Standard_Boolean IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Interface_Protocol::IsUnknownEntity ******/
		/****** md5 signature: 47ee5a51ccc521cdb34550721716d8b8 ******/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if <ent> is an Unknown Entity for the Norm, i.e. same Type as them created by method UnknownEntity (for an Entity out of the Norm, answer can be unpredicable).
") IsUnknownEntity;
		virtual Standard_Boolean IsUnknownEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Protocol::NbResources ******/
		/****** md5 signature: bef01036104619c58ab5a6ff9b039599 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of Protocol used as Resources (level one).
") NbResources;
		virtual Standard_Integer NbResources();

		/****** Interface_Protocol::NbTypes ******/
		/****** md5 signature: ef3faaf596b1391c100a035b9879de7d ******/
		%feature("compactdefaultargs") NbTypes;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient

Return
-------
int

Description
-----------
Returns the count of DISTINCT types under which an entity may be processed. Each one is candidate to be recognized by TypeNumber, <obj> is then processed according it By default, returns 1 (the DynamicType).
") NbTypes;
		virtual Standard_Integer NbTypes(const opencascade::handle<Standard_Transient> & obj);

		/****** Interface_Protocol::NewModel ******/
		/****** md5 signature: 0b1be90749007fa9c3aadc3c17bc79c8 ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates an empty Model of the considered Norm.
") NewModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** Interface_Protocol::Resource ******/
		/****** md5 signature: 5ab5f1cb3c235f55188fa96d5b103d57 ******/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns a Resource, given its rank (between 1 and NbResources).
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****** Interface_Protocol::SetActive ******/
		/****** md5 signature: c76a58398abc9564e948ae5e77d8863a ******/
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "
Parameters
----------
aprotocol: Interface_Protocol

Return
-------
None

Description
-----------
Sets a given Protocol to be the Active one (for the users of Active, see just above). Applies to every sub-type of Protocol.
") SetActive;
		static void SetActive(const opencascade::handle<Interface_Protocol> & aprotocol);

		/****** Interface_Protocol::Type ******/
		/****** md5 signature: 5efb3ed3d5f07e443d940e9ce4dea4c2 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient
nt: int (optional, default to 1)

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns a type under which <obj> can be recognized and processed, according its rank in its definition list (see NbTypes). By default, returns DynamicType.
") Type;
		opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & obj, const Standard_Integer nt = 1);

		/****** Interface_Protocol::TypeNumber ******/
		/****** md5 signature: 3ad63721d780561a40202c3ceb8b3449 ******/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
Returns a unique positive CaseNumber for each Recognized Type, Returns Zero for '<type> not recognized'.
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****** Interface_Protocol::UnknownEntity ******/
		/****** md5 signature: 5e0083a65d62cab5e9ac76cb7160632d ******/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Creates a new Unknown Entity for the considered Norm.
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
		/****** Interface_ReaderLib::Interface_ReaderLib ******/
		/****** md5 signature: 9397aeeba35410106f91c6d54b8d2053 ******/
		%feature("compactdefaultargs") Interface_ReaderLib;
		%feature("autodoc", "
Parameters
----------
aprotocol: Interface_Protocol

Return
-------
None

Description
-----------
Creates a Library which complies with a Protocol, that is: Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources.
") Interface_ReaderLib;
		 Interface_ReaderLib(const opencascade::handle<Interface_Protocol> & aprotocol);

		/****** Interface_ReaderLib::Interface_ReaderLib ******/
		/****** md5 signature: 220dce1c616bb912aa974e026d63c97e ******/
		%feature("compactdefaultargs") Interface_ReaderLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Library: it will later by filled by method AddProtocol.
") Interface_ReaderLib;
		 Interface_ReaderLib();

		/****** Interface_ReaderLib::AddProtocol ******/
		/****** md5 signature: 97bedbaaa5336e800a60d78a56ab8c60 ******/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "
Parameters
----------
aprotocol: Standard_Transient

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) to the Library, given the class of a Protocol. Takes Resources into account. (if <aprotocol> is not of type TheProtocol, it is not added).
") AddProtocol;
		void AddProtocol(const opencascade::handle<Standard_Transient> & aprotocol);

		/****** Interface_ReaderLib::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of Modules of a library (can be used to redefine the order of Modules before action: Clear then refill the Library by calls to AddProtocol).
") Clear;
		void Clear();

		/****** Interface_ReaderLib::Module ******/
		/****** md5 signature: ee4e5065695c1821dd69ceb165b67caf ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_ReaderModule>

Description
-----------
Returns the current Module in the Iteration.
") Module;
		const opencascade::handle<Interface_ReaderModule> & Module();

		/****** Interface_ReaderLib::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Modules to iterate on.
") More;
		Standard_Boolean More();

		/****** Interface_ReaderLib::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterates by getting the next Module in the list If there is none, the exception will be raised by Value.
") Next;
		void Next();

		/****** Interface_ReaderLib::Protocol ******/
		/****** md5 signature: c905586547d9ad373f87bcb2ce1d329f ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the current Protocol in the Iteration.
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****** Interface_ReaderLib::Select ******/
		/****** md5 signature: 497bfc4f63c715364b3e245ec65b9cfa ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient
module: Interface_ReaderModule

Return
-------
CN: int

Description
-----------
Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType).
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<Interface_ReaderModule> & module, Standard_Integer &OutValue);

		/****** Interface_ReaderLib::SetComplete ******/
		/****** md5 signature: 9b2529d2e257b2464fe4d8064a8a0171 ******/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets a library to be defined with the complete Global list (all the couples Protocol/Modules recorded in it).
") SetComplete;
		void SetComplete();

		/****** Interface_ReaderLib::SetGlobal ******/
		/****** md5 signature: 6031cab62dcf6d29c852188796a5f886 ******/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "
Parameters
----------
amodule: Interface_ReaderModule
aprotocol: Interface_Protocol

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) into the global definition set for this class of Library.
") SetGlobal;
		static void SetGlobal(const opencascade::handle<Interface_ReaderModule> & amodule, const opencascade::handle<Interface_Protocol> & aprotocol);

		/****** Interface_ReaderLib::Start ******/
		/****** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts Iteration on the Modules (sets it on the first one).
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
		/****** Interface_ReaderModule::CaseNum ******/
		/****** md5 signature: afda30338c3cf672ec56cf415b53acb8 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
data: Interface_FileReaderData
num: int

Return
-------
int

Description
-----------
Translates the type of record <num> in <data> to a positive Case Number. If Recognition fails, must return 0.
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num);

		/****** Interface_ReaderModule::NewRead ******/
		/****** md5 signature: 9690dce15c449ffdac5e561e315975d5 ******/
		%feature("compactdefaultargs") NewRead;
		%feature("autodoc", "
Parameters
----------
casenum: int
data: Interface_FileReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Return
-------
bool

Description
-----------
Specific operator (create+read) defaulted to do nothing. It can be redefined when it is not possible to work in two steps (NewVoid then Read). This occurs when no default constructor is defined: hence the result <ent> must be created with an effective definition from the reader. Remark: if NewRead is defined, Copy has nothing to do. //! Returns True if it has produced something, false else. If nothing was produced, <ach> should be filled: it will be treated as 'Unrecognized case' by reader tool.
") NewRead;
		virtual Standard_Boolean NewRead(const Standard_Integer casenum, const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****** Interface_ReaderModule::Read ******/
		/****** md5 signature: aa6a782fcb84cf576b0f1c9b9f4c6f00 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
casenum: int
data: Interface_FileReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Return
-------
None

Description
-----------
Performs the effective loading from <data>, record <num>, to the Entity <ent> formerly created In case of Error or Warning, fills <ach> with messages Remark that the Case Number comes from translating a record.
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
		/****** Interface_ReportEntity::Interface_ReportEntity ******/
		/****** md5 signature: 298b7c97f0e27125785198872d678e07 ******/
		%feature("compactdefaultargs") Interface_ReportEntity;
		%feature("autodoc", "
Parameters
----------
unknown: Standard_Transient

Return
-------
None

Description
-----------
Creates a ReportEntity for an Unknown Entity: Check is empty, and Concerned equates Content (i.e. the Unknown Entity).
") Interface_ReportEntity;
		 Interface_ReportEntity(const opencascade::handle<Standard_Transient> & unknown);

		/****** Interface_ReportEntity::Interface_ReportEntity ******/
		/****** md5 signature: df80b3ed874c22eaae50d96b60781c56 ******/
		%feature("compactdefaultargs") Interface_ReportEntity;
		%feature("autodoc", "
Parameters
----------
acheck: Interface_Check
concerned: Standard_Transient

Return
-------
None

Description
-----------
Creates a ReportEntity with its features: - <acheck> is the Check to be memorised - <concerned> is the Entity to which the Check is bound Later, a Content can be set: it is required for an Error.
") Interface_ReportEntity;
		 Interface_ReportEntity(const opencascade::handle<Interface_Check> & acheck, const opencascade::handle<Standard_Transient> & concerned);

		/****** Interface_ReportEntity::CCheck ******/
		/****** md5 signature: 6e66cd51a221a5f9b18ffa07111f133d ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the stored Check in order to change it.
") CCheck;
		opencascade::handle<Interface_Check> & CCheck();

		/****** Interface_ReportEntity::Check ******/
		/****** md5 signature: 535183f491df1166f3d80ddd8b810a47 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the stored Check.
") Check;
		const opencascade::handle<Interface_Check> & Check();

		/****** Interface_ReportEntity::Concerned ******/
		/****** md5 signature: 31d23dfc04cb92b0681e4429e255836d ******/
		%feature("compactdefaultargs") Concerned;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the stored Concerned Entity. It equates the Content in the case of an Unknown Entity.
") Concerned;
		opencascade::handle<Standard_Transient> Concerned();

		/****** Interface_ReportEntity::Content ******/
		/****** md5 signature: 8f06554b5df01f4cef5ca6c131d633eb ******/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the stored Content, or a Null Handle Remark that it must be an 'Unknown Entity' suitable for the norm of the containing Model.
") Content;
		opencascade::handle<Standard_Transient> Content();

		/****** Interface_ReportEntity::HasContent ******/
		/****** md5 signature: 139192491a3a3f3dbae7a9873a3beb19 ******/
		%feature("compactdefaultargs") HasContent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Content is stored (it can equate Concerned).
") HasContent;
		Standard_Boolean HasContent();

		/****** Interface_ReportEntity::HasNewContent ******/
		/****** md5 signature: ca682f56104e3e248141935f535b6237 ******/
		%feature("compactdefaultargs") HasNewContent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Content is stored AND differs from Concerned (i.e. redefines content): used when Concerned could not be loaded.
") HasNewContent;
		Standard_Boolean HasNewContent();

		/****** Interface_ReportEntity::IsError ******/
		/****** md5 signature: c52b85ee17e423925f2cd97bf6879614 ******/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True for an Error Entity, i.e. if the Check brings at least one Fail message.
") IsError;
		Standard_Boolean IsError();

		/****** Interface_ReportEntity::IsUnknown ******/
		/****** md5 signature: 3664e7b68ca3ddc8f89b66fb416769e1 ******/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True for an Unknown Entity, i,e. if the Check is empty and Concerned equates Content.
") IsUnknown;
		Standard_Boolean IsUnknown();

		/****** Interface_ReportEntity::SetContent ******/
		/****** md5 signature: 9e2dd6e409838943a5bdfa7ca9ba5cd6 ******/
		%feature("compactdefaultargs") SetContent;
		%feature("autodoc", "
Parameters
----------
content: Standard_Transient

Return
-------
None

Description
-----------
Sets a Content: it brings non interpreted data which belong to the Concerned Entity. It can be empty then loaded later. Remark that for an Unknown Entity, Content is set by Create.
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
		/****** Interface_STAT::Interface_STAT ******/
		/****** md5 signature: 45e033643caee9f7e5dc73c369792e10 ******/
		%feature("compactdefaultargs") Interface_STAT;
		%feature("autodoc", "
Parameters
----------
title: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a STAT form. At start, one default phase is defined, with one default step. Then, it suffises to start with a count of items (and cycles if several) then record items, to have a queryable report.
") Interface_STAT;
		 Interface_STAT(Standard_CString title = "");

		/****** Interface_STAT::Interface_STAT ******/
		/****** md5 signature: cb7d83a2fbadcfc6c6fe085b46e7cda4 ******/
		%feature("compactdefaultargs") Interface_STAT;
		%feature("autodoc", "
Parameters
----------
other: Interface_STAT

Return
-------
None

Description
-----------
used when starting.
") Interface_STAT;
		 Interface_STAT(const Interface_STAT & other);

		/****** Interface_STAT::AddPhase ******/
		/****** md5 signature: 901e896e9fc7f2c7d6d35a838b9ae3fa ******/
		%feature("compactdefaultargs") AddPhase;
		%feature("autodoc", "
Parameters
----------
weight: float
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a new phase to the description. The first one after Create replaces the default unique one.
") AddPhase;
		void AddPhase(const Standard_Real weight, Standard_CString name = "");

		/****** Interface_STAT::AddStep ******/
		/****** md5 signature: 21cde4a1cc77e723291ed3b27cf07e1e ******/
		%feature("compactdefaultargs") AddStep;
		%feature("autodoc", "
Parameters
----------
weight: float (optional, default to 1)

Return
-------
None

Description
-----------
Adds a new step for the last added phase, the default unique one if no AddPhase has already been added Warning: AddStep before the first AddPhase are cancelled.
") AddStep;
		void AddStep(const Standard_Real weight = 1);

		/****** Interface_STAT::Description ******/
		/****** md5 signature: ccb302c12ac3e5367aed0e7004aed292 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "
Parameters
----------
title: str

Return
-------
nbphases: int
total: float

Description
-----------
Returns global description (cumulated weights of all phases, count of phases,1 for default, and title).
") Description;
		void Description(Standard_Integer &OutValue, Standard_Real &OutValue, Standard_CString title);

		/****** Interface_STAT::End ******/
		/****** md5 signature: fb2ee652f9985fe24d44f58655360e4e ******/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "Return
-------
None

Description
-----------
Commands to declare the process ended (hence, advancement is forced to 100 %).
") End;
		static void End();

		/****** Interface_STAT::Internals ******/
		/****** md5 signature: bc8ecc59db060541490d6f3fafb13d28 ******/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "
Parameters
----------
phn: TColStd_HSequenceOfAsciiString
phw: TColStd_HSequenceOfReal
phdeb: TColStd_HSequenceOfInteger
phfin: TColStd_HSequenceOfInteger
stw: TColStd_HSequenceOfReal

Return
-------
tit: TCollection_HAsciiString
total: float

Description
-----------
Returns fields in once, without copying them, used for copy when starting.
") Internals;
		void Internals(opencascade::handle<TCollection_HAsciiString> &OutValue, Standard_Real &OutValue, opencascade::handle<TColStd_HSequenceOfAsciiString> & phn, opencascade::handle<TColStd_HSequenceOfReal> & phw, opencascade::handle<TColStd_HSequenceOfInteger> & phdeb, opencascade::handle<TColStd_HSequenceOfInteger> & phfin, opencascade::handle<TColStd_HSequenceOfReal> & stw);

		/****** Interface_STAT::NextCycle ******/
		/****** md5 signature: ca214add52f3821b26accc6fe7f36e0c ******/
		%feature("compactdefaultargs") NextCycle;
		%feature("autodoc", "
Parameters
----------
items: int

Return
-------
None

Description
-----------
Commands to resume the preceding cycle and start a new one, with a count of items Ignored if count of cycles is already passed Then, first step is started (or default one) NextItem can be called for the first step, or NextStep to pass to the next one.
") NextCycle;
		static void NextCycle(const Standard_Integer items);

		/****** Interface_STAT::NextItem ******/
		/****** md5 signature: e1b17d15380adbd776c306226045c0e0 ******/
		%feature("compactdefaultargs") NextItem;
		%feature("autodoc", "
Parameters
----------
nbitems: int (optional, default to 1)

Return
-------
None

Description
-----------
Commands to add an item in the current step of the current cycle of the current phase By default, one item per call, can be overpassed Ignored if count of items of this cycle is already passed.
") NextItem;
		static void NextItem(const Standard_Integer nbitems = 1);

		/****** Interface_STAT::NextPhase ******/
		/****** md5 signature: 9b523c6521e8002ac47a539ba98e971b ******/
		%feature("compactdefaultargs") NextPhase;
		%feature("autodoc", "
Parameters
----------
items: int
cycles: int (optional, default to 1)

Return
-------
None

Description
-----------
Commands to resume the preceding phase and start a new one <items> and <cycles> as for Start, but for this new phase Ignored if count of phases is already passed If <cycles> is more than one, the first Cycle must then be started by NextCycle (NextStep/NextItem are ignored). If it is one, NextItem/NextStep can then be called.
") NextPhase;
		static void NextPhase(const Standard_Integer items, const Standard_Integer cycles = 1);

		/****** Interface_STAT::NextStep ******/
		/****** md5 signature: a06b9be16a1cd4fce846a9f6baf11cf8 ******/
		%feature("compactdefaultargs") NextStep;
		%feature("autodoc", "Return
-------
None

Description
-----------
Commands to resume the preceding step of the cycle Ignored if count of steps is already passed NextItem can be called for this step, NextStep passes to next.
") NextStep;
		static void NextStep();

		/****** Interface_STAT::Percent ******/
		/****** md5 signature: af9ed9ea0ad2a0be9e5817b4231b4e34 ******/
		%feature("compactdefaultargs") Percent;
		%feature("autodoc", "
Parameters
----------
phase: bool (optional, default to Standard_False)

Return
-------
int

Description
-----------
Returns the advancement as a percentage: <phase> True: inside the current phase <phase> False (D): relative to the whole process.
") Percent;
		static Standard_Integer Percent(const Standard_Boolean phase = Standard_False);

		/****** Interface_STAT::Phase ******/
		/****** md5 signature: d890039f6e809714597defcff955c102 ******/
		%feature("compactdefaultargs") Phase;
		%feature("autodoc", "
Parameters
----------
num: int
name: str

Return
-------
n0step: int
nbstep: int
weight: float

Description
-----------
Returns description of a phase, given its rank (n0 for first step, count of steps, default gives one; weight, name).
") Phase;
		void Phase(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_CString name);

		/****** Interface_STAT::SetPhase ******/
		/****** md5 signature: 2ff988852c3a26f437f261f22891edb5 ******/
		%feature("compactdefaultargs") SetPhase;
		%feature("autodoc", "
Parameters
----------
items: int
cycles: int (optional, default to 1)

Return
-------
None

Description
-----------
Changes the parameters of the phase to start To be used before first counting (i.e. just after NextPhase) Can be used by an operator which has to reajust counts on run.
") SetPhase;
		static void SetPhase(const Standard_Integer items, const Standard_Integer cycles = 1);

		/****** Interface_STAT::Start ******/
		/****** md5 signature: 5adfcc185e821aace27048b2e90b6aee ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "
Parameters
----------
items: int
cycles: int (optional, default to 1)

Return
-------
None

Description
-----------
Starts a STAT on its first phase (or its default one) <items> gives the total count of items, <cycles> the count of cycles If <cycles> is more than one, the first Cycle must then be started by NextCycle (NextStep/NextItem are ignored). If it is one, NextItem/NextStep can then be called.
") Start;
		void Start(const Standard_Integer items, const Standard_Integer cycles = 1);

		/****** Interface_STAT::StartCount ******/
		/****** md5 signature: ac80112bbb6b5fae525d592607a8b728 ******/
		%feature("compactdefaultargs") StartCount;
		%feature("autodoc", "
Parameters
----------
items: int
title: str (optional, default to "")

Return
-------
None

Description
-----------
Starts a default STAT, with no phase, no step, ready to just count items. <items> gives the total count of items Hence, NextItem is available to directly count.
") StartCount;
		static void StartCount(const Standard_Integer items, Standard_CString title = "");

		/****** Interface_STAT::Step ******/
		/****** md5 signature: f6be15730fe53ce056667df4e2f42266 ******/
		%feature("compactdefaultargs") Step;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
float

Description
-----------
Returns weight of a Step, related to the cumul given for the phase. <num> is given by <n0step> + i, i between 1 and <nbsteps> (default gives n0step < 0 then weight is one).
") Step;
		Standard_Real Step(const Standard_Integer num);

		/****** Interface_STAT::Where ******/
		/****** md5 signature: 629e93f0486a39051b131b41dcb57749 ******/
		%feature("compactdefaultargs") Where;
		%feature("autodoc", "
Parameters
----------
phase: bool (optional, default to Standard_True)

Return
-------
str

Description
-----------
Returns an identification of the STAT: <phase> True (D): the name of the current phase <phase> False: the title of the current STAT.
") Where;
		static Standard_CString Where(const Standard_Boolean phase = Standard_True);

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
		/****** Interface_ShareFlags::Interface_ShareFlags ******/
		/****** md5 signature: 3b54045ed65f4b7cacde9cf182c8db5a ******/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Return
-------
None

Description
-----------
Creates a ShareFlags from a Model and builds required data (flags) by calling the General Service Library given as argument <lib>.
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****** Interface_ShareFlags::Interface_ShareFlags ******/
		/****** md5 signature: 03df5fdb6716789d3f3c2dd21c6b7008 ******/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool

Return
-------
None

Description
-----------
Same as above, but GeneralLib is detained by a GTool.
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool);

		/****** Interface_ShareFlags::Interface_ShareFlags ******/
		/****** md5 signature: 8f8941d307658dae63d09634c406751e ******/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Same as above, but GeneralLib is defined through a Protocol.
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****** Interface_ShareFlags::Interface_ShareFlags ******/
		/****** md5 signature: 5cf82d9e7fc5e21bbbd898a70e9402bc ******/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Same as above, but works with the GTool of the Model.
") Interface_ShareFlags;
		 Interface_ShareFlags(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_ShareFlags::Interface_ShareFlags ******/
		/****** md5 signature: fb87355c221a29bfef4a7716e14429e5 ******/
		%feature("compactdefaultargs") Interface_ShareFlags;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph

Return
-------
None

Description
-----------
Creates a ShareFlags by querying information from a Graph (remark that Graph also has a method IsShared).
") Interface_ShareFlags;
		 Interface_ShareFlags(const Interface_Graph & agraph);

		/****** Interface_ShareFlags::IsShared ******/
		/****** md5 signature: 3e66d0a7cc6678e53c33e376ce31731a ******/
		%feature("compactdefaultargs") IsShared;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if <ent> is Shared by one or more other Entity(ies) of the Model.
") IsShared;
		Standard_Boolean IsShared(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_ShareFlags::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model used for the evaluation.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Interface_ShareFlags::NbRoots ******/
		/****** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of root entities.
") NbRoots;
		Standard_Integer NbRoots();

		/****** Interface_ShareFlags::Root ******/
		/****** md5 signature: 4b8f069a9ea374ab5529724497f0d6e6 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns a root entity according its rank in the list of roots By default, it returns the first one.
") Root;
		opencascade::handle<Standard_Transient> Root(const Standard_Integer num = 1);

		/****** Interface_ShareFlags::RootEntities ******/
		/****** md5 signature: 63cd32bddc79c5ff7cf79d39668774c9 ******/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the Entities which are not Shared (see their flags).
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
		/****** Interface_ShareTool::Interface_ShareTool ******/
		/****** md5 signature: ef7c138e0fb84e0457b735e8476e91ca ******/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Return
-------
None

Description
-----------
Creates a ShareTool from a Model and builds all required data, by calling the General Service Library and Modules (GeneralLib given as an argument).
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****** Interface_ShareTool::Interface_ShareTool ******/
		/****** md5 signature: 9f0728a3ccc131f8a0ff0d5b4e01dafe ******/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool

Return
-------
None

Description
-----------
Same a above, but GeneralLib is detained by a GTool.
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool);

		/****** Interface_ShareTool::Interface_ShareTool ******/
		/****** md5 signature: 7524962121497ca46beced7d2935b3d5 ******/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Same a above, but GeneralLib is defined through a Protocol Protocol is used to build the working library.
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****** Interface_ShareTool::Interface_ShareTool ******/
		/****** md5 signature: 42327af9af7b69150f615441485ea2f5 ******/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Same as above, but works with the GTool of the Model.
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_ShareTool::Interface_ShareTool ******/
		/****** md5 signature: 927bab793ffdcdd0792d3d0b4652e41d ******/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph

Return
-------
None

Description
-----------
Creates a ShareTool from an already defined Graph Remark that the data of the Graph are copied.
") Interface_ShareTool;
		 Interface_ShareTool(const Interface_Graph & agraph);

		/****** Interface_ShareTool::Interface_ShareTool ******/
		/****** md5 signature: 1d933c78c10fafd47f3c117993302a04 ******/
		%feature("compactdefaultargs") Interface_ShareTool;
		%feature("autodoc", "
Parameters
----------
ahgraph: Interface_HGraph

Return
-------
None

Description
-----------
Completes the Graph by Adding Implied References. Hence, they are considered as Sharing References in all the other queries.
") Interface_ShareTool;
		 Interface_ShareTool(const opencascade::handle<Interface_HGraph> & ahgraph);

		/****** Interface_ShareTool::All ******/
		/****** md5 signature: b455c53620b389f3422e27d3f05c2e46 ******/
		%feature("compactdefaultargs") All;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
rootlast: bool (optional, default to Standard_True)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the complete list of entities shared by <ent> at any level, including <ent> itself If <ent> is the Model, considers the concatenation of AllShared for each root If <rootlast> is True (D), the list starts with lower level entities and ends by the root. Else, the root is first and the lower level entities are at end.
") All;
		Interface_EntityIterator All(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean rootlast = Standard_True);

		/****** Interface_ShareTool::Graph ******/
		/****** md5 signature: 6a234e0475ae0da1c7d268d231e44a78 ******/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
Returns the data used by the ShareTool to work Can then be used directly (read only).
") Graph;
		const Interface_Graph & Graph();

		/****** Interface_ShareTool::IsShared ******/
		/****** md5 signature: 3e66d0a7cc6678e53c33e376ce31731a ******/
		%feature("compactdefaultargs") IsShared;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if <ent> is Shared by other Entities in the Model.
") IsShared;
		Standard_Boolean IsShared(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_ShareTool::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model used for Creation (directly or for Graph).
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Interface_ShareTool::NbTypedSharings ******/
		/****** md5 signature: eef551aa63b33d7e36b531ff2d17cf0a ******/
		%feature("compactdefaultargs") NbTypedSharings;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
atype: Standard_Type

Return
-------
int

Description
-----------
Returns the count of Sharing Entities of an Entity, which are Kind of a given Type.
") NbTypedSharings;
		Standard_Integer NbTypedSharings(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Type> & atype);

		/****** Interface_ShareTool::Print ******/
		/****** md5 signature: 2f38257dbca8db3ebc49f083711c4d06 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator

Return
-------
S: Standard_OStream

Description
-----------
Utility method which Prints the content of an iterator (by their Numbers).
") Print;
		void Print(const Interface_EntityIterator & iter, std::ostream &OutValue);

		/****** Interface_ShareTool::RootEntities ******/
		/****** md5 signature: 63cd32bddc79c5ff7cf79d39668774c9 ******/
		%feature("compactdefaultargs") RootEntities;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the Entities which are not Shared (their Sharing List is empty) in the Model.
") RootEntities;
		Interface_EntityIterator RootEntities();

		/****** Interface_ShareTool::Shareds ******/
		/****** md5 signature: d7f3cd187cff94c69bea537ec01567d5 ******/
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
Interface_EntityIterator

Description
-----------
Returns the List of Entities Shared by a given Entity <ent>.
") Shareds;
		Interface_EntityIterator Shareds(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_ShareTool::Sharings ******/
		/****** md5 signature: 561a9bb8187bfa6649f3c1fcaacdaeed ******/
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
Interface_EntityIterator

Description
-----------
Returns the List of Entities Sharing a given Entity <ent>.
") Sharings;
		Interface_EntityIterator Sharings(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_ShareTool::TypedSharing ******/
		/****** md5 signature: 2836ffecd2f16bf9dde6f5dabfce5fdd ******/
		%feature("compactdefaultargs") TypedSharing;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
atype: Standard_Type

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Sharing Entity of an Entity, which is Kind of a given Type. Allows to access a Sharing Entity of a given type when there is one and only one (current case).
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
		/****** Interface_SignLabel::Interface_SignLabel ******/
		/****** md5 signature: 9b29a88e8d714b586a7134f1ee0c12bd ******/
		%feature("compactdefaultargs") Interface_SignLabel;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Interface_SignLabel;
		 Interface_SignLabel();

		/****** Interface_SignLabel::Name ******/
		/****** md5 signature: f35e373630f40191cc40cd61094fa98a ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns 'Entity Label'.
") Name;
		Standard_CString Name();

		/****** Interface_SignLabel::Text ******/
		/****** md5 signature: 44c44c56f0e9da4d892db26a3852e369 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Return
-------
TCollection_AsciiString

Description
-----------
Considers context as an InterfaceModel and returns the Label computed by it.
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
		/****** Interface_SignType::ClassName ******/
		/****** md5 signature: 5c848fa4e9ca29e4e7b7a55157f5d8c4 ******/
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "
Parameters
----------
typnam: str

Return
-------
str

Description
-----------
From a CDL Type Name, returns the Class part (package dropped) WARNING: buffered, to be immediately copied or printed.
") ClassName;
		static Standard_CString ClassName(Standard_CString typnam);

		/****** Interface_SignType::Text ******/
		/****** md5 signature: 44c44c56f0e9da4d892db26a3852e369 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Return
-------
TCollection_AsciiString

Description
-----------
Returns an identification of the Signature (a word), given at initialization time Specialised to consider context as an InterfaceModel.
") Text;
		TCollection_AsciiString Text(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & context);

		/****** Interface_SignType::Value ******/
		/****** md5 signature: 37c924359631a9d9e92ff35b3241caa4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
str

Description
-----------
Returns the Signature for a Transient object. It is specific of each sub-class of Signature. For a Null Handle, it should provide '' It can work with the model which contains the entity.
") Value;
		virtual Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****** Interface_TypedValue::Interface_TypedValue ******/
		/****** md5 signature: 7c0c3d4173d57fce3bb947c56cac91e2 ******/
		%feature("compactdefaultargs") Interface_TypedValue;
		%feature("autodoc", "
Parameters
----------
name: str
type: Interface_ParamType (optional, default to Interface_ParamText)
init: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a TypedValue, with a name //! type gives the type of the parameter, default is free text Also available: Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the TypedValue once created //! init gives an initial value. If it is not given, the TypedValue begins as 'not set', its value is empty.
") Interface_TypedValue;
		 Interface_TypedValue(Standard_CString name, const Interface_ParamType type = Interface_ParamText, Standard_CString init = "");

		/****** Interface_TypedValue::ParamTypeToValueType ******/
		/****** md5 signature: aee1d139dcd9a716445f9c7c79e55597 ******/
		%feature("compactdefaultargs") ParamTypeToValueType;
		%feature("autodoc", "
Parameters
----------
typ: Interface_ParamType

Return
-------
MoniTool_ValueType

Description
-----------
Correspondence ParamType from Interface to ValueType from MoniTool.
") ParamTypeToValueType;
		static MoniTool_ValueType ParamTypeToValueType(const Interface_ParamType typ);

		/****** Interface_TypedValue::Type ******/
		/****** md5 signature: 47dd452537804ba27c0351c740f97ef5 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Interface_ParamType

Description
-----------
Returns the type I.E. calls ValueType then makes correspondence between ParamType from Interface (which remains for compatibility reasons) and ValueType from MoniTool.
") Type;
		Interface_ParamType Type();

		/****** Interface_TypedValue::ValueTypeToParamType ******/
		/****** md5 signature: 03fb586ad085bc437a43df1d15b1dda6 ******/
		%feature("compactdefaultargs") ValueTypeToParamType;
		%feature("autodoc", "
Parameters
----------
typ: MoniTool_ValueType

Return
-------
Interface_ParamType

Description
-----------
Correspondence ParamType from Interface to ValueType from MoniTool.
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
		/****** Interface_UndefinedContent::Interface_UndefinedContent ******/
		/****** md5 signature: 52380470e4dae639892aaa16535bd5b5 ******/
		%feature("compactdefaultargs") Interface_UndefinedContent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Defines an empty UndefinedContent.
") Interface_UndefinedContent;
		 Interface_UndefinedContent();

		/****** Interface_UndefinedContent::AddEntity ******/
		/****** md5 signature: 9c6f708c0c7add83fe57b03ecc71aeee ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
ptype: Interface_ParamType
ent: Standard_Transient

Return
-------
None

Description
-----------
Adds a Parameter which references an Entity.
") AddEntity;
		void AddEntity(const Interface_ParamType ptype, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_UndefinedContent::AddLiteral ******/
		/****** md5 signature: 42c39aaae211ba3460d3b8849e56c767 ******/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "
Parameters
----------
ptype: Interface_ParamType
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
Adds a literal Parameter to the list.
") AddLiteral;
		void AddLiteral(const Interface_ParamType ptype, const opencascade::handle<TCollection_HAsciiString> & val);

		/****** Interface_UndefinedContent::EntityList ******/
		/****** md5 signature: 4625df90b81c2aa3ad2b1dd9cd633919 ******/
		%feature("compactdefaultargs") EntityList;
		%feature("autodoc", "Return
-------
Interface_EntityList

Description
-----------
Returns globally the list of param entities. Note that it can be used as shared entity list for the UndefinedEntity.
") EntityList;
		Interface_EntityList EntityList();

		/****** Interface_UndefinedContent::GetFromAnother ******/
		/****** md5 signature: b50ef3b4e3d7cc607524f9a4399fe516 ******/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "
Parameters
----------
other: Interface_UndefinedContent
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Copies contents of undefined entities; deigned to be called by GetFromAnother method from Undefined entity of each Interface (the basic operation is the same regardless the norm).
") GetFromAnother;
		void GetFromAnother(const opencascade::handle<Interface_UndefinedContent> & other, Interface_CopyTool & TC);

		/****** Interface_UndefinedContent::IsParamEntity ******/
		/****** md5 signature: edcc5f4164bf630a10b2eddc151d1934 ******/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if a Parameter is recorded as an entity Error if num is not between 1 and NbParams.
") IsParamEntity;
		Standard_Boolean IsParamEntity(const Standard_Integer num);

		/****** Interface_UndefinedContent::NbLiterals ******/
		/****** md5 signature: 12a4f0bd43456f607e315fdcf241cb29 ******/
		%feature("compactdefaultargs") NbLiterals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives count of Literal Parameters.
") NbLiterals;
		Standard_Integer NbLiterals();

		/****** Interface_UndefinedContent::NbParams ******/
		/****** md5 signature: 826f4756fca7f780e6d976c60183d715 ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives count of recorded parameters.
") NbParams;
		Standard_Integer NbParams();

		/****** Interface_UndefinedContent::ParamData ******/
		/****** md5 signature: 7ca464741028b870c741574661323ef4 ******/
		%feature("compactdefaultargs") ParamData;
		%feature("autodoc", "
Parameters
----------
num: int
ent: Standard_Transient

Return
-------
ptype: Interface_ParamType
val: TCollection_HAsciiString

Description
-----------
Returns data of a Parameter: its type, and the entity if it designates en entity ('ent') or its literal value else ('str') Returned value (Boolean): True if it is an Entity, False else.
") ParamData;
		Standard_Boolean ParamData(const Standard_Integer num, Interface_ParamType &OutValue, opencascade::handle<Standard_Transient> & ent, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** Interface_UndefinedContent::ParamEntity ******/
		/****** md5 signature: 761c0b32c3eb0e5da7ddfca321a3322d ******/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns Entity corresponding to a Param, given its rank.
") ParamEntity;
		opencascade::handle<Standard_Transient> ParamEntity(const Standard_Integer num);

		/****** Interface_UndefinedContent::ParamType ******/
		/****** md5 signature: 06805a954cdda33c70604680f220e0c5 ******/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
Interface_ParamType

Description
-----------
Returns the ParamType of a Param, given its rank Error if num is not between 1 and NbParams.
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num);

		/****** Interface_UndefinedContent::ParamValue ******/
		/****** md5 signature: 27f0f605c60e921cd93c878a3119e98b ******/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns literal value of a Parameter, given its rank.
") ParamValue;
		opencascade::handle<TCollection_HAsciiString> ParamValue(const Standard_Integer num);

		/****** Interface_UndefinedContent::RemoveParam ******/
		/****** md5 signature: 4dc35dce4aeb1dd96c7a9f880db74227 ******/
		%feature("compactdefaultargs") RemoveParam;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Removes a Parameter given its rank.
") RemoveParam;
		void RemoveParam(const Standard_Integer num);

		/****** Interface_UndefinedContent::Reservate ******/
		/****** md5 signature: 31af5568472447f72c79220748d7c500 ******/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "
Parameters
----------
nb: int
nblit: int

Return
-------
None

Description
-----------
Manages reservation for parameters (internal use) (nb: total count of parameters, nblit: count of literals).
") Reservate;
		void Reservate(const Standard_Integer nb, const Standard_Integer nblit);

		/****** Interface_UndefinedContent::SetEntity ******/
		/****** md5 signature: 4b8efff936bc3f2ead61fab318587ce2 ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "
Parameters
----------
num: int
ptype: Interface_ParamType
ent: Standard_Transient

Return
-------
None

Description
-----------
Sets a new value for the Parameter <num>, to reference an Entity. To simply change the Entity, see the variant below.
") SetEntity;
		void SetEntity(const Standard_Integer num, const Interface_ParamType ptype, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_UndefinedContent::SetEntity ******/
		/****** md5 signature: eb5e85918c8177aa1aa31acbc491ce44 ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "
Parameters
----------
num: int
ent: Standard_Transient

Return
-------
None

Description
-----------
Changes the Entity referenced by the Parameter <num> (with same ParamType).
") SetEntity;
		void SetEntity(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_UndefinedContent::SetLiteral ******/
		/****** md5 signature: 8072f1d179fb9b4fc930b8da855eda9b ******/
		%feature("compactdefaultargs") SetLiteral;
		%feature("autodoc", "
Parameters
----------
num: int
ptype: Interface_ParamType
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
Sets a new value for the Parameter <num>, to a literal value (if it referenced formerly an Entity, this Entity is removed).
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
		/****** Interface_CopyMap::Interface_CopyMap ******/
		/****** md5 signature: fa89544b2c0fbd11b7d29238b0368002 ******/
		%feature("compactdefaultargs") Interface_CopyMap;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Creates a CopyMap adapted to work from a Model.
") Interface_CopyMap;
		 Interface_CopyMap(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Interface_CopyMap::Bind ******/
		/****** md5 signature: 6b8123ff1b872cf7eccc6ee384405fb1 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
None

Description
-----------
Binds a Starting Entity identified by its Number <num> in the Starting Model, to a Result of Transfer <res>.
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****** Interface_CopyMap::Clear ******/
		/****** md5 signature: 04e06e275d2bf51a1788968453d01f4e ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears Transfer List. Gets Ready to begin another Transfer.
") Clear;
		void Clear();

		/****** Interface_CopyMap::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the InterfaceModel used at Creation time.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Interface_CopyMap::Search ******/
		/****** md5 signature: 525f5a6e060d9bc49aafdc8e913d57c5 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
bool

Description
-----------
Search for the result of a Starting Object (i.e. an Entity, identified by its Number <num> in the Starting Model) Returns True if a Result is Bound (and fills <res>) Returns False if no result is Bound (and nullifies <res>).
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
		/****** Interface_GraphContent::Interface_GraphContent ******/
		/****** md5 signature: e56f30d1da280cb2263c4816c559fcb2 ******/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty GraphContent, ready to be filled.
") Interface_GraphContent;
		 Interface_GraphContent();

		/****** Interface_GraphContent::Interface_GraphContent ******/
		/****** md5 signature: a36a6f6ccda585fc6089d779b7e3fe35 ******/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph

Return
-------
None

Description
-----------
Creates with all entities designated by a Graph.
") Interface_GraphContent;
		 Interface_GraphContent(const Interface_Graph & agraph);

		/****** Interface_GraphContent::Interface_GraphContent ******/
		/****** md5 signature: c01dd0557fc9fe949a43f6239fec04ec ******/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph
stat: int

Return
-------
None

Description
-----------
Creates with entities having specific Status value in a Graph.
") Interface_GraphContent;
		 Interface_GraphContent(const Interface_Graph & agraph, const Standard_Integer stat);

		/****** Interface_GraphContent::Interface_GraphContent ******/
		/****** md5 signature: db03489b1aaddcde63f86d6f02e71726 ******/
		%feature("compactdefaultargs") Interface_GraphContent;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph
ent: Standard_Transient

Return
-------
None

Description
-----------
Creates an Iterator with Shared entities of an entity (equivalente to EntityIterator but with a Graph).
") Interface_GraphContent;
		 Interface_GraphContent(const Interface_Graph & agraph, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_GraphContent::Begin ******/
		/****** md5 signature: 6411d2d9578e36d75460c7dda67b7440 ******/
		%feature("compactdefaultargs") Begin;
		%feature("autodoc", "Return
-------
None

Description
-----------
Does the Evaluation before starting the iteration itself (in out).
") Begin;
		void Begin();

		/****** Interface_GraphContent::Evaluate ******/
		/****** md5 signature: 6640605754ea7f26f131a8bc46247338 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Evaluates list of Entities to be iterated. Called by Start Default is set to doing nothing: intended to be redefined by each sub-class.
") Evaluate;
		virtual void Evaluate();

		/****** Interface_GraphContent::GetFromGraph ******/
		/****** md5 signature: ae6a9a559f58dc138ed87b411e11d722 ******/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph

Return
-------
None

Description
-----------
Gets all Entities designated by a Graph (once created), adds them to those already recorded.
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph);

		/****** Interface_GraphContent::GetFromGraph ******/
		/****** md5 signature: 418d34704ccd99f0633d30895e747dbc ******/
		%feature("compactdefaultargs") GetFromGraph;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph
stat: int

Return
-------
None

Description
-----------
Gets entities from a graph which have a specific Status value (one created), adds them to those already recorded.
") GetFromGraph;
		void GetFromGraph(const Interface_Graph & agraph, const Standard_Integer stat);

		/****** Interface_GraphContent::Result ******/
		/****** md5 signature: 8c4c469fb1e25be9ad684d7b09b36228 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns Result under the exact form of an EntityIterator: Can be used when EntityIterator itself is required (as a returned value for instance), without way for a sub-class.
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
		/****** Interface_Static::Interface_Static ******/
		/****** md5 signature: a86af5cdb38073532a5a731958c23daf ******/
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "
Parameters
----------
family: str
name: str
type: Interface_ParamType (optional, default to Interface_ParamText)
init: str (optional, default to "")

Return
-------
None

Description
-----------
Creates and records a Static, with a family and a name family can report to a name of resource or to a system or internal definition. The name must be unique. //! type gives the type of the parameter, default is free text Also available: Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the Static once created //! init gives an initial value. If it is not given, the Static begin as 'not set', its value is empty.
") Interface_Static;
		 Interface_Static(Standard_CString family, Standard_CString name, const Interface_ParamType type = Interface_ParamText, Standard_CString init = "");

		/****** Interface_Static::Interface_Static ******/
		/****** md5 signature: 1b796482a7cd04d278a7b9014840dcaa ******/
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "
Parameters
----------
family: str
name: str
other: Interface_Static

Return
-------
None

Description
-----------
Creates a new Static with same definition as another one (value is copied, except for Entity: it remains null).
") Interface_Static;
		 Interface_Static(Standard_CString family, Standard_CString name, const opencascade::handle<Interface_Static> & other);

		/****** Interface_Static::CDef ******/
		/****** md5 signature: e75a32f8e0c4371af5746fcaf995304b ******/
		%feature("compactdefaultargs") CDef;
		%feature("autodoc", "
Parameters
----------
name: str
part: str

Return
-------
str

Description
-----------
Returns a part of the definition of a Static, as a CString The part is designated by its name, as a CString If the required value is not a string, it is converted to a CString then returned If <name> is not present, or <part> not defined for <name>, this function returns an empty string //! Allowed parts for CDef: family: the family type: the type ('integer','real','text','enum') label: the label satis: satisfy function name if any rmin: minimum real value rmax: maximum real value imin: minimum integer value imax: maximum integer value enum nn (nn: value of an integer): enum value for nn unit: unit definition for a real.
") CDef;
		static Standard_CString CDef(Standard_CString name, Standard_CString part);

		/****** Interface_Static::CVal ******/
		/****** md5 signature: 78193cb29df4c8b21b9e3de1ba97a96c ******/
		%feature("compactdefaultargs") CVal;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
str

Description
-----------
Returns the value of the parameter identified by the string name. If the specified parameter does not exist, an empty string is returned. Example Interface_Static::CVal('write.step.schema'); which could return: 'AP214'.
") CVal;
		static Standard_CString CVal(Standard_CString name);

		/****** Interface_Static::Family ******/
		/****** md5 signature: c69de37306b0fd5e9cf300cae0c2b57b ******/
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the family. It can be: a resource name for applis, an internal name between: $e (environment variables), $l (other, purely local).
") Family;
		Standard_CString Family();

		/****** Interface_Static::FillMap ******/
		/****** md5 signature: 72aec84e532a60d574204def21e2557c ******/
		%feature("compactdefaultargs") FillMap;
		%feature("autodoc", "
Parameters
----------
theMap: NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString>

Return
-------
None

Description
-----------
Fills given string-to-string map with all static data.
") FillMap;
		static void FillMap(NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString> & theMap);

		/****** Interface_Static::IDef ******/
		/****** md5 signature: 809047165ba17b6256ca717fd657b669 ******/
		%feature("compactdefaultargs") IDef;
		%feature("autodoc", "
Parameters
----------
name: str
part: str

Return
-------
int

Description
-----------
Returns a part of the definition of a Static, as an Integer The part is designated by its name, as a CString If the required value is not a string, returns zero For a Boolean, 0 for false, 1 for true If <name> is not present, or <part> not defined for <name>, this function returns zero //! Allowed parts for IDef: imin, imax: minimum or maximum integer value estart: starting number for enum ecount: count of enum values (starting from estart) ematch: exact match status eval val: case determined from a string.
") IDef;
		static Standard_Integer IDef(Standard_CString name, Standard_CString part);

		/****** Interface_Static::IVal ******/
		/****** md5 signature: d117b0899e16831696a0625d434eb539 ******/
		%feature("compactdefaultargs") IVal;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the integer value of the translation parameter identified by the string name. Returns the value 0 if the parameter does not exist. Example Interface_Static::IVal('write.step.schema'); which could return: 3.
") IVal;
		static Standard_Integer IVal(Standard_CString name);

		/****** Interface_Static::Init ******/
		/****** md5 signature: 02eb0352d106423d698462902e8b3ea1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
family: str
name: str
type: Interface_ParamType
init: str (optional, default to "")

Return
-------
bool

Description
-----------
Declares a new Static (by calling its constructor) If this name is already taken, does nothing and returns False Else, creates it and returns True For additional definitions, get the Static then edit it.
") Init;
		static Standard_Boolean Init(Standard_CString family, Standard_CString name, const Interface_ParamType type, Standard_CString init = "");

		/****** Interface_Static::Init ******/
		/****** md5 signature: d38b0a501f52a64fdd63d9f5c82fde52 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
family: str
name: str
type: Standard_Character
init: str (optional, default to "")

Return
-------
bool

Description
-----------
As Init with ParamType, but type is given as a character This allows a simpler call Types: 'i' Integer, 'r' Real, 't' Text, 'e' Enum, 'o' Object '=' for same definition as, <init> gives the initial Static Returns False if <type> does not match this list.
") Init;
		static Standard_Boolean Init(Standard_CString family, Standard_CString name, const Standard_Character type, Standard_CString init = "");

		/****** Interface_Static::IsPresent ******/
		/****** md5 signature: 739ef9f35758eeccd1fc8c726c993957 ******/
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Returns True if a Static named <name> is present, False else.
") IsPresent;
		static Standard_Boolean IsPresent(Standard_CString name);

		/****** Interface_Static::IsSet ******/
		/****** md5 signature: 7cb64b3795f4342b7c2866fe3401f982 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
name: str
proper: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Returns True if <name> is present AND set <proper> True (D): considers this item only <proper> False: if not set and attached to a wild-card, considers this wild-card.
") IsSet;
		static Standard_Boolean IsSet(Standard_CString name, const Standard_Boolean proper = Standard_True);

		/****** Interface_Static::IsUpdated ******/
		/****** md5 signature: 01f4e7e4af28f2ca518f5373d24756bb ******/
		%feature("compactdefaultargs") IsUpdated;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Returns the status 'uptodate' from a Static Returns False if <name> is not present.
") IsUpdated;
		static Standard_Boolean IsUpdated(Standard_CString name);

		/****** Interface_Static::Items ******/
		/****** md5 signature: 368d94dc7edec3aecfc9c0963e7a3712 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "
Parameters
----------
mode: int (optional, default to 0)
criter: str (optional, default to "")

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns a list of names of statics: <mode> = 0 (D): criter is for family <mode> = 1: criter is regexp on names, takes final items (ignore wild cards) <mode> = 2: idem but take only wilded, not final items <mode> = 3: idem, take all items matching criter idem + 100: takes only non-updated items idem + 200: takes only updated items criter empty (D): returns all names else returns names which match the given criter Remark: families beginning by '$' are not listed by criter '' they are listed only by criter '$' //! This allows for instance to set new values after having loaded or reloaded a resource, then to update them as required.
") Items;
		static opencascade::handle<TColStd_HSequenceOfHAsciiString> Items(const Standard_Integer mode = 0, Standard_CString criter = "");

		/****** Interface_Static::PrintStatic ******/
		/****** md5 signature: 7f17a7202d6963fb7283a5d0144d0ad0 ******/
		%feature("compactdefaultargs") PrintStatic;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Writes the properties of a parameter in the diagnostic file. These include: - Name - Family, - Wildcard (if it has one) - Current status (empty string if it was updated or if it is the original one) - Value.
") PrintStatic;
		void PrintStatic(std::ostream &OutValue);

		/****** Interface_Static::RVal ******/
		/****** md5 signature: 916bf9a6651fba4b6f0c699767b5c1ed ******/
		%feature("compactdefaultargs") RVal;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
float

Description
-----------
Returns the value of a static translation parameter identified by the string name. Returns the value 0.0 if the parameter does not exist.
") RVal;
		static Standard_Real RVal(Standard_CString name);

		/****** Interface_Static::SetCVal ******/
		/****** md5 signature: 0ac37808e24c6befe2c30c23a9b6a3e1 ******/
		%feature("compactdefaultargs") SetCVal;
		%feature("autodoc", "
Parameters
----------
name: str
val: str

Return
-------
bool

Description
-----------
Modifies the value of the parameter identified by name. The modification is specified by the string val. false is returned if the parameter does not exist. Example Interface_Static::SetCVal ('write.step.schema','AP203') This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.
") SetCVal;
		static Standard_Boolean SetCVal(Standard_CString name, Standard_CString val);

		/****** Interface_Static::SetIVal ******/
		/****** md5 signature: a57a08b3c5b23d03ffc49dcd7f055b8f ******/
		%feature("compactdefaultargs") SetIVal;
		%feature("autodoc", "
Parameters
----------
name: str
val: int

Return
-------
bool

Description
-----------
Modifies the value of the parameter identified by name. The modification is specified by the integer value val. false is returned if the parameter does not exist. Example Interface_Static::SetIVal ('write.step.schema', 3) This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.S.
") SetIVal;
		static Standard_Boolean SetIVal(Standard_CString name, const Standard_Integer val);

		/****** Interface_Static::SetRVal ******/
		/****** md5 signature: 8c4a79176322045249fd27d78834411f ******/
		%feature("compactdefaultargs") SetRVal;
		%feature("autodoc", "
Parameters
----------
name: str
val: float

Return
-------
bool

Description
-----------
Modifies the value of a translation parameter. false is returned if the parameter does not exist. The modification is specified by the real number value val.
") SetRVal;
		static Standard_Boolean SetRVal(Standard_CString name, const Standard_Real val);

		/****** Interface_Static::SetUptodate ******/
		/****** md5 signature: 1cd883d27f7d4764a11bb187e2202572 ******/
		%feature("compactdefaultargs") SetUptodate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Records a Static has 'uptodate', i.e. its value has been taken into account by a reinitialisation procedure This flag is reset at each successful SetValue.
") SetUptodate;
		void SetUptodate();

		/****** Interface_Static::SetWild ******/
		/****** md5 signature: 9fa05e145421691306295c2b3933e593 ******/
		%feature("compactdefaultargs") SetWild;
		%feature("autodoc", "
Parameters
----------
wildcard: Interface_Static

Return
-------
None

Description
-----------
Sets a 'wild-card' static: its value will be considered if <self> is not properly set. (reset by set a null one).
") SetWild;
		void SetWild(const opencascade::handle<Interface_Static> & wildcard);

		/****** Interface_Static::Standards ******/
		/****** md5 signature: d450cedacaedf8ce31e4acf84a376a0e ******/
		%feature("compactdefaultargs") Standards;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all standard static parameters, which can be used by every function. statics specific of a norm or a function must be defined around it.
") Standards;
		static void Standards();

		/****** Interface_Static::Static ******/
		/****** md5 signature: cec670c3b6ff48920ec19dc08a97c25d ******/
		%feature("compactdefaultargs") Static;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Interface_Static>

Description
-----------
Returns a Static from its name. Null Handle if not present.
") Static;
		static opencascade::handle<Interface_Static> Static(Standard_CString name);

		/****** Interface_Static::Update ******/
		/****** md5 signature: 185a217a8a41cc482d0b132448e027b6 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Sets a Static to be 'uptodate' Returns False if <name> is not present This status can be used by a reinitialisation procedure to rerun if a value has been changed.
") Update;
		static Standard_Boolean Update(Standard_CString name);

		/****** Interface_Static::UpdatedStatus ******/
		/****** md5 signature: 930fc09d937027882f5df9305551114a ******/
		%feature("compactdefaultargs") UpdatedStatus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the status 'uptodate'.
") UpdatedStatus;
		Standard_Boolean UpdatedStatus();

		/****** Interface_Static::Wild ******/
		/****** md5 signature: 3052e9e89cc7cc0ab4bd29371d719900 ******/
		%feature("compactdefaultargs") Wild;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Static>

Description
-----------
Returns the wildcard static, which can be (is most often) null.
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


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Interface_Category_AddCategory(*args):
	return Interface_Category.AddCategory(*args)

@deprecated
def Interface_Category_Init(*args):
	return Interface_Category.Init(*args)

@deprecated
def Interface_Category_Name(*args):
	return Interface_Category.Name(*args)

@deprecated
def Interface_Category_NbCategories(*args):
	return Interface_Category.NbCategories(*args)

@deprecated
def Interface_Category_Number(*args):
	return Interface_Category.Number(*args)

@deprecated
def Interface_FileReaderData_Fastof(*args):
	return Interface_FileReaderData.Fastof(*args)

@deprecated
def Interface_FloatWriter_Convert(*args):
	return Interface_FloatWriter.Convert(*args)

@deprecated
def Interface_GeneralLib_SetGlobal(*args):
	return Interface_GeneralLib.SetGlobal(*args)

@deprecated
def Interface_InterfaceModel_ClassName(*args):
	return Interface_InterfaceModel.ClassName(*args)

@deprecated
def Interface_InterfaceModel_HasTemplate(*args):
	return Interface_InterfaceModel.HasTemplate(*args)

@deprecated
def Interface_InterfaceModel_ListTemplates(*args):
	return Interface_InterfaceModel.ListTemplates(*args)

@deprecated
def Interface_InterfaceModel_SetTemplate(*args):
	return Interface_InterfaceModel.SetTemplate(*args)

@deprecated
def Interface_InterfaceModel_Template(*args):
	return Interface_InterfaceModel.Template(*args)

@deprecated
def Interface_MSG_Blanks(*args):
	return Interface_MSG.Blanks(*args)

@deprecated
def Interface_MSG_Blanks(*args):
	return Interface_MSG.Blanks(*args)

@deprecated
def Interface_MSG_Blanks(*args):
	return Interface_MSG.Blanks(*args)

@deprecated
def Interface_MSG_CDate(*args):
	return Interface_MSG.CDate(*args)

@deprecated
def Interface_MSG_Intervalled(*args):
	return Interface_MSG.Intervalled(*args)

@deprecated
def Interface_MSG_IsKey(*args):
	return Interface_MSG.IsKey(*args)

@deprecated
def Interface_MSG_NDate(*args):
	return Interface_MSG.NDate(*args)

@deprecated
def Interface_MSG_Print(*args):
	return Interface_MSG.Print(*args)

@deprecated
def Interface_MSG_PrintTrace(*args):
	return Interface_MSG.PrintTrace(*args)

@deprecated
def Interface_MSG_Read(*args):
	return Interface_MSG.Read(*args)

@deprecated
def Interface_MSG_Read(*args):
	return Interface_MSG.Read(*args)

@deprecated
def Interface_MSG_Record(*args):
	return Interface_MSG.Record(*args)

@deprecated
def Interface_MSG_SetMode(*args):
	return Interface_MSG.SetMode(*args)

@deprecated
def Interface_MSG_SetTrace(*args):
	return Interface_MSG.SetTrace(*args)

@deprecated
def Interface_MSG_TDate(*args):
	return Interface_MSG.TDate(*args)

@deprecated
def Interface_MSG_Translated(*args):
	return Interface_MSG.Translated(*args)

@deprecated
def Interface_MSG_Write(*args):
	return Interface_MSG.Write(*args)

@deprecated
def Interface_Protocol_Active(*args):
	return Interface_Protocol.Active(*args)

@deprecated
def Interface_Protocol_ClearActive(*args):
	return Interface_Protocol.ClearActive(*args)

@deprecated
def Interface_Protocol_SetActive(*args):
	return Interface_Protocol.SetActive(*args)

@deprecated
def Interface_ReaderLib_SetGlobal(*args):
	return Interface_ReaderLib.SetGlobal(*args)

@deprecated
def Interface_STAT_End(*args):
	return Interface_STAT.End(*args)

@deprecated
def Interface_STAT_NextCycle(*args):
	return Interface_STAT.NextCycle(*args)

@deprecated
def Interface_STAT_NextItem(*args):
	return Interface_STAT.NextItem(*args)

@deprecated
def Interface_STAT_NextPhase(*args):
	return Interface_STAT.NextPhase(*args)

@deprecated
def Interface_STAT_NextStep(*args):
	return Interface_STAT.NextStep(*args)

@deprecated
def Interface_STAT_Percent(*args):
	return Interface_STAT.Percent(*args)

@deprecated
def Interface_STAT_SetPhase(*args):
	return Interface_STAT.SetPhase(*args)

@deprecated
def Interface_STAT_StartCount(*args):
	return Interface_STAT.StartCount(*args)

@deprecated
def Interface_STAT_Where(*args):
	return Interface_STAT.Where(*args)

@deprecated
def Interface_SignType_ClassName(*args):
	return Interface_SignType.ClassName(*args)

@deprecated
def Interface_TypedValue_ParamTypeToValueType(*args):
	return Interface_TypedValue.ParamTypeToValueType(*args)

@deprecated
def Interface_TypedValue_ValueTypeToParamType(*args):
	return Interface_TypedValue.ValueTypeToParamType(*args)

@deprecated
def Interface_Static_CDef(*args):
	return Interface_Static.CDef(*args)

@deprecated
def Interface_Static_CVal(*args):
	return Interface_Static.CVal(*args)

@deprecated
def Interface_Static_FillMap(*args):
	return Interface_Static.FillMap(*args)

@deprecated
def Interface_Static_IDef(*args):
	return Interface_Static.IDef(*args)

@deprecated
def Interface_Static_IVal(*args):
	return Interface_Static.IVal(*args)

@deprecated
def Interface_Static_Init(*args):
	return Interface_Static.Init(*args)

@deprecated
def Interface_Static_Init(*args):
	return Interface_Static.Init(*args)

@deprecated
def Interface_Static_IsPresent(*args):
	return Interface_Static.IsPresent(*args)

@deprecated
def Interface_Static_IsSet(*args):
	return Interface_Static.IsSet(*args)

@deprecated
def Interface_Static_IsUpdated(*args):
	return Interface_Static.IsUpdated(*args)

@deprecated
def Interface_Static_Items(*args):
	return Interface_Static.Items(*args)

@deprecated
def Interface_Static_RVal(*args):
	return Interface_Static.RVal(*args)

@deprecated
def Interface_Static_SetCVal(*args):
	return Interface_Static.SetCVal(*args)

@deprecated
def Interface_Static_SetIVal(*args):
	return Interface_Static.SetIVal(*args)

@deprecated
def Interface_Static_SetRVal(*args):
	return Interface_Static.SetRVal(*args)

@deprecated
def Interface_Static_Standards(*args):
	return Interface_Static.Standards(*args)

@deprecated
def Interface_Static_Static(*args):
	return Interface_Static.Static(*args)

@deprecated
def Interface_Static_Update(*args):
	return Interface_Static.Update(*args)

}
