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

%ignore NCollection_DataMap<opencascade::handle<Standard_Transient>,int>::Items;
%ignore NCollection_DataMap<opencascade::handle<Standard_Transient>,int>::KeyValues;
%template(Interface_DataMapOfTransientInteger) NCollection_DataMap<opencascade::handle<Standard_Transient>,int>;
%ignore NCollection_IndexedMap<TCollection_AsciiString>::Items;
%ignore NCollection_IndexedMap<TCollection_AsciiString>::KeyValues;
%ignore NCollection_IndexedMap<TCollection_AsciiString>::IndexedItems;
%ignore NCollection_IndexedMap<TCollection_AsciiString>::Contained;
%template(Interface_IndexedMapOfAsciiString) NCollection_IndexedMap<TCollection_AsciiString>;
%template(Interface_SequenceOfCheck) NCollection_Sequence<opencascade::handle<Interface_Check>>;

%extend NCollection_Sequence<opencascade::handle<Interface_Check>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Interface_VectorOfFileParameter) NCollection_DynamicArray<Interface_FileParameter>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Interface_FileParameter> Interface_Array1OfFileParameter;
typedef NCollection_Array1<opencascade::handle<TCollection_HAsciiString>> Interface_Array1OfHAsciiString;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, int>::Iterator Interface_DataMapIteratorOfDataMapOfTransientInteger;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, int> Interface_DataMapOfTransientInteger;
typedef NCollection_HArray1<opencascade::handle<TCollection_HAsciiString>> Interface_HArray1OfHAsciiString;
typedef NCollection_HSequence<opencascade::handle<Interface_Check>> Interface_HSequenceOfCheck;
typedef NCollection_IndexedMap<TCollection_AsciiString> Interface_IndexedMapOfAsciiString;
typedef NCollection_Sequence<opencascade::handle<Interface_Check>> Interface_SequenceOfCheck;
typedef NCollection_DynamicArray<Interface_FileParameter> Interface_VectorOfFileParameter;
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
		/****** md5 signature: 807627194e7c58a1c1659e7d810112aa ******/
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
		 Interface_BitMap(const int nbitems, const int resflags = 0);

		/****** Interface_BitMap::Interface_BitMap ******/
		/****** md5 signature: b6e222235707af6db0a0fa083e96d844 ******/
		%feature("compactdefaultargs") Interface_BitMap;
		%feature("autodoc", "
Parameters
----------
other: Interface_BitMap
copied: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a BitMap from another one if <copied> is True, copies data else, data are not copied, only the header object is.
") Interface_BitMap;
		 Interface_BitMap(const Interface_BitMap & other, const bool copied = false);

		/****** Interface_BitMap::AddFlag ******/
		/****** md5 signature: ec21fd691b80e8aa150b33423c3ac576 ******/
		%feature("compactdefaultargs") AddFlag;
		%feature("autodoc", "
Parameters
----------
name: char * (optional, default to "")

Return
-------
int

Description
-----------
Adds a flag, a name can be attached to it Returns its flag number Makes required reservation.
") AddFlag;
		int AddFlag(const char * const name = "");

		/****** Interface_BitMap::AddSomeFlags ******/
		/****** md5 signature: 508d1485be1ae2cfb68bd0d175ae8632 ******/
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
		int AddSomeFlags(const int more);

		/****** Interface_BitMap::CFalse ******/
		/****** md5 signature: dfbd64ae335380ef89b2f859ac6d031b ******/
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
		bool CFalse(const int item, const int flag = 0);

		/****** Interface_BitMap::CTrue ******/
		/****** md5 signature: 04e3da227a9934ba9fa4c63b9506cb44 ******/
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
		bool CTrue(const int item, const int flag = 0);

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
		/****** md5 signature: 2424f7f71ee8b8c5250c7f9423591040 ******/
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
char *

Description
-----------
Returns the name recorded for a flag, or an empty string.
") FlagName;
		const char * FlagName(const int num);

		/****** Interface_BitMap::FlagNumber ******/
		/****** md5 signature: 83b41054d493da09654e192b9e3aaf94 ******/
		%feature("compactdefaultargs") FlagNumber;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
int

Description
-----------
Returns the number or a flag given its name, or zero.
") FlagNumber;
		int FlagNumber(const char * const name);

		/****** Interface_BitMap::Init ******/
		/****** md5 signature: d507573c24ac61f5949f273d4573d77d ******/
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
		void Init(const bool val, const int flag = 0);

		/****** Interface_BitMap::Initialize ******/
		/****** md5 signature: 7ab25a02977b59e63c82cae1ca35d512 ******/
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
		void Initialize(const int nbitems, const int resflags = 0);

		/****** Interface_BitMap::Initialize ******/
		/****** md5 signature: df0d3d0bf22142220f627993227a0b2b ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
other: Interface_BitMap
copied: bool (optional, default to false)

Return
-------
None

Description
-----------
Initialize a BitMap from another one.
") Initialize;
		void Initialize(const Interface_BitMap & other, const bool copied = false);

		/****** Interface_BitMap::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of items (i.e. the length of the bitmap).
") Length;
		int Length();

		/****** Interface_BitMap::NbFlags ******/
		/****** md5 signature: f2091e8a835e7cd23b991bc8e2fc4eed ******/
		%feature("compactdefaultargs") NbFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of flags (flag 0 not included).
") NbFlags;
		int NbFlags();

		/****** Interface_BitMap::RemoveFlag ******/
		/****** md5 signature: 980ee77ec5cf900094055667272ec91f ******/
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
		bool RemoveFlag(const int num);

		/****** Interface_BitMap::Reservate ******/
		/****** md5 signature: 1fbe69600119fb7c5fadd43b66d9ff0d ******/
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
		void Reservate(const int moreflags);

		/****** Interface_BitMap::SetFalse ******/
		/****** md5 signature: d3b9324369f42c91de71c3b79045e4e0 ******/
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
		void SetFalse(const int item, const int flag = 0);

		/****** Interface_BitMap::SetFlagName ******/
		/****** md5 signature: 909b8bf8945c01012ec9040fcd47f893 ******/
		%feature("compactdefaultargs") SetFlagName;
		%feature("autodoc", "
Parameters
----------
num: int
name: char *

Return
-------
bool

Description
-----------
Sets a name for a flag, given its number name can be empty (to erase the name of a flag) Returns True if done, false if: num is out of range, or name non-empty already set to another flag.
") SetFlagName;
		bool SetFlagName(const int num, const char * const name);

		/****** Interface_BitMap::SetLength ******/
		/****** md5 signature: 114a5b8f126e8514d1bd9a8acffac242 ******/
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
		void SetLength(const int nbitems);

		/****** Interface_BitMap::SetTrue ******/
		/****** md5 signature: fa2661ff9bb87d1d62c30082e2ab79c8 ******/
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
		void SetTrue(const int item, const int flag = 0);

		/****** Interface_BitMap::SetValue ******/
		/****** md5 signature: 1dbf2e008ab505dbcdb863e2e434a565 ******/
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
		void SetValue(const int item, const bool val, const int flag = 0);

		/****** Interface_BitMap::Value ******/
		/****** md5 signature: 707e4fffb9f7452955fdf1c4a0ad8383 ******/
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
		bool Value(const int item, const int flag = 0);

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
		/****** md5 signature: 169532b49087b9ee29c487815f044ef1 ******/
		%feature("compactdefaultargs") AddCategory;
		%feature("autodoc", "
Parameters
----------
theName: char *

Return
-------
int

Description
-----------
Records a new Category defined by its names, produces a number New if not yet recorded.
") AddCategory;
		static int AddCategory(const char * const theName);

		/****** Interface_Category::CatNum ******/
		/****** md5 signature: cb48404e5146f69f9f7a955d23bf7017 ******/
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
		int CatNum(const opencascade::handle<Standard_Transient> & theEnt, const Interface_ShareTool & theShares);

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
		/****** md5 signature: 8462a593a4174ef52a077e4a8f9e8187 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
char *

Description
-----------
Returns the name of a category, according to its number.
") Name;
		static const char * Name(const int theNum);

		/****** Interface_Category::NbCategories ******/
		/****** md5 signature: c36e5e724517ccb898c54a31f0b9019f ******/
		%feature("compactdefaultargs") NbCategories;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded categories.
") NbCategories;
		static int NbCategories();

		/****** Interface_Category::Num ******/
		/****** md5 signature: 018250ab395093513b922f9bbdce2ac5 ******/
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
		int Num(const int theNumEnt);

		/****** Interface_Category::Number ******/
		/****** md5 signature: 62d5af60b03c893ff47cff25154aea80 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "
Parameters
----------
theName: char *

Return
-------
int

Description
-----------
Returns the number of a category, according to its name.
") Number;
		static int Number(const char * const theName);

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
		/****** md5 signature: 2689acea1ae3f5c51cb37fbc478c485f ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
amess: char *
orig: char * (optional, default to "")

Return
-------
None

Description
-----------
Records a new Fail message given as 'error text' directly If <orig> is given, a distinct original form is recorded else (D), the original form equates <amess>.
") AddFail;
		void AddFail(const char * const amess, const char * const orig = "");

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
		/****** md5 signature: 0e71cb4468bfced87d47d5b7ed687622 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
amess: char *
orig: char * (optional, default to "")

Return
-------
None

Description
-----------
Records a Warning message given as 'warning message' directly If <orig> is given, a distinct original form is recorded else (D), the original form equates <amess>.
") AddWarning;
		void AddWarning(const char * const amess, const char * const orig = "");

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
		/****** md5 signature: 963b4f2bb46e90191f08e31cf535496f ******/
		%feature("compactdefaultargs") CFail;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to true)

Return
-------
char *

Description
-----------
Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False.
") CFail;
		const char * CFail(const int num, const bool final = true);

		/****** Interface_Check::CInfoMsg ******/
		/****** md5 signature: de1aee115010b260605aa2b072bce8f2 ******/
		%feature("compactdefaultargs") CInfoMsg;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to true)

Return
-------
char *

Description
-----------
Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False.
") CInfoMsg;
		const char * CInfoMsg(const int num, const bool final = true);

		/****** Interface_Check::CWarning ******/
		/****** md5 signature: 0a04b34df74727d32a41be0c0f3e9103 ******/
		%feature("compactdefaultargs") CWarning;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to true)

Return
-------
char *

Description
-----------
Same as above, but returns a CString (to be printed ...) Final form by default, Original form if <final> is False.
") CWarning;
		const char * CWarning(const int num, const bool final = true);

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
		/****** md5 signature: 57aa26e6f9383e3d40c3d80991b2549c ******/
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
		bool Complies(const Interface_CheckStatus status);

		/****** Interface_Check::Complies ******/
		/****** md5 signature: 52a50bd4ae4a807e74110baad5579c51 ******/
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
		bool Complies(const opencascade::handle<TCollection_HAsciiString> & mess, const int incl, const Interface_CheckStatus status);

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
		/****** md5 signature: 0cf683dfd03a61479913cc2592717948 ******/
		%feature("compactdefaultargs") Fail;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to true)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Fail Message as a String Final form by default, Original form if <final> is False.
") Fail;
		const opencascade::handle<TCollection_HAsciiString> & Fail(const int num, const bool final = true);

		/****** Interface_Check::Fails ******/
		/****** md5 signature: 0a434cc84fc8496b9f38d871f2aeba65 ******/
		%feature("compactdefaultargs") Fails;
		%feature("autodoc", "
Parameters
----------
final: bool (optional, default to true)

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of Fails, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty.
") Fails;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> Fails(const bool final = true);

		/****** Interface_Check::GetAsWarning ******/
		/****** md5 signature: 5f7df20896d063afedf0382f1097baef ******/
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
		void GetAsWarning(const opencascade::handle<Interface_Check> & other, const bool failsonly);

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
		/****** md5 signature: 1e7d163e4f89de79918ec6066bc50aa4 ******/
		%feature("compactdefaultargs") HasEntity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Check is devoted to an entity; else, it is global (for InterfaceModel's storing of global error messages).
") HasEntity;
		bool HasEntity();

		/****** Interface_Check::HasFailed ******/
		/****** md5 signature: ce7804154429fff28a900a0531c41bbe ******/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Check brings at least one Fail Message.
") HasFailed;
		bool HasFailed();

		/****** Interface_Check::HasWarnings ******/
		/****** md5 signature: 6953223f6c9b0d4a1e734bf60c38af6a ******/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Check brings at least one Warning Message.
") HasWarnings;
		bool HasWarnings();

		/****** Interface_Check::InfoMsg ******/
		/****** md5 signature: 0de746e818f10183a0552a0dcdb404b0 ******/
		%feature("compactdefaultargs") InfoMsg;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to true)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns information message as a String.
") InfoMsg;
		const opencascade::handle<TCollection_HAsciiString> & InfoMsg(const int num, const bool final = true);

		/****** Interface_Check::InfoMsgs ******/
		/****** md5 signature: 420436b6e47206fd7a875f6840c919c9 ******/
		%feature("compactdefaultargs") InfoMsgs;
		%feature("autodoc", "
Parameters
----------
final: bool (optional, default to true)

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of Info Msg, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty.
") InfoMsgs;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> InfoMsgs(const bool final = true);

		/****** Interface_Check::Mend ******/
		/****** md5 signature: 0d8951d8d665740509c551a4b16b7def ******/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "
Parameters
----------
pref: char *
num: int (optional, default to 0)

Return
-------
bool

Description
-----------
Mends messages, according <pref> and <num> According to <num>, works on the whole list of Fails if = 0(D) or only one Fail message, given its rank If <pref> is empty, converts Fail(s) to Warning(s) Else, does the conversion but prefixes the new Warning(s) but <pref> followed by a semi-column Some reserved values of <pref> are: 'FM': standard prefix 'Mended' (can be translated) 'CF': clears Fail(s) 'CW': clears Warning(s): here, <num> refers to Warning list 'CA': clears all messages: here, <num> is ignored.
") Mend;
		bool Mend(const char * const pref, const int num = 0);

		/****** Interface_Check::NbFails ******/
		/****** md5 signature: b907177d7100ca5f55790f4f7e0e2c0e ******/
		%feature("compactdefaultargs") NbFails;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Fails.
") NbFails;
		int NbFails();

		/****** Interface_Check::NbInfoMsgs ******/
		/****** md5 signature: ba90c1fd778ed2fd9385d4dea223c90d ******/
		%feature("compactdefaultargs") NbInfoMsgs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded information messages.
") NbInfoMsgs;
		int NbInfoMsgs();

		/****** Interface_Check::NbWarnings ******/
		/****** md5 signature: 83abd26beb526a4ee31784f7035f60bf ******/
		%feature("compactdefaultargs") NbWarnings;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Warning messages.
") NbWarnings;
		int NbWarnings();

		/****** Interface_Check::Print ******/
		/****** md5 signature: 865d4f10400da95d2945be3bcc7b1080 ******/
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
		void Print(std::ostream &OutValue, const int level, const int final = 1);

		/****** Interface_Check::Remove ******/
		/****** md5 signature: 05c946e56aa1a5b6a0da1a94884f78e9 ******/
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
		bool Remove(const opencascade::handle<TCollection_HAsciiString> & mess, const int incl, const Interface_CheckStatus status);

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
		/****** md5 signature: d9531bfc10ed0afcc131257751786db8 ******/
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
		void Trace(const int level = -1, const int final = 1);

		/****** Interface_Check::Warning ******/
		/****** md5 signature: 2af1830cb7df1d5021b50e0aee7ad8b0 ******/
		%feature("compactdefaultargs") Warning;
		%feature("autodoc", "
Parameters
----------
num: int
final: bool (optional, default to true)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Warning message as a String Final form by default, Original form if <final> is False.
") Warning;
		const opencascade::handle<TCollection_HAsciiString> & Warning(const int num, const bool final = true);

		/****** Interface_Check::Warnings ******/
		/****** md5 signature: 88fb91f2da4b5f12121dff11db7b0156 ******/
		%feature("compactdefaultargs") Warnings;
		%feature("autodoc", "
Parameters
----------
final: bool (optional, default to true)

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of Warnings, for a frontal-engine logic Final forms by default, Original forms if <final> is False Can be empty.
") Warnings;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> Warnings(const bool final = true);

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
		/****** md5 signature: f5230672cfef32435939fc92a3079c6e ******/
		%feature("compactdefaultargs") Interface_CheckIterator;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
None

Description
-----------
Creates a CheckIterator with a name (displayed by Print as a title).
") Interface_CheckIterator;
		 Interface_CheckIterator(const char * const name);

		/****** Interface_CheckIterator::Add ******/
		/****** md5 signature: cfba05b6f7cfece763a7190be67e6359 ******/
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
		void Add(const opencascade::handle<Interface_Check> & ach, const int num = 0);

		/****** Interface_CheckIterator::CCheck ******/
		/****** md5 signature: 263def6fc43bc5f1f76296f1a6555437 ******/
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
		opencascade::handle<Interface_Check> & CCheck(const int num);

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
		/****** md5 signature: ec8aa9ec7928991daa7c4c04a711af67 ******/
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
		const opencascade::handle<Interface_Check> & Check(const int num);

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
		/****** md5 signature: eb1ef70e152dcfa488f8b939fef10533 ******/
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
		opencascade::handle<TColStd_HSequenceOfTransient> Checkeds(const bool failsonly, const bool global);

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
		/****** md5 signature: 57aa26e6f9383e3d40c3d80991b2549c ******/
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
		bool Complies(const Interface_CheckStatus status);

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
		/****** md5 signature: 06550bddd121dc11ea47f1dc841071fe ******/
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "
Parameters
----------
mess: char *
incl: int
status: Interface_CheckStatus

Return
-------
Interface_CheckIterator

Description
-----------
Returns a CheckIterator which contains the check which comply with a message, plus some conditions as follows: <incl> = 0: <mess> exactly matches one of the messages <incl> < 0: <mess> is contained by one of the messages <incl> > 0: <mess> contains one of the messages For <status>: for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (answer will be false) Each Check which complies is entirely taken.
") Extract;
		Interface_CheckIterator Extract(const char * const mess, const int incl, const Interface_CheckStatus status);

		/****** Interface_CheckIterator::IsEmpty ******/
		/****** md5 signature: 5ee6daf32850ea01d70b464c10febe84 ******/
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
		bool IsEmpty(const bool failsonly);

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
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Checks to get.
") More;
		bool More();

		/****** Interface_CheckIterator::Name ******/
		/****** md5 signature: c01515d64eb8c383d620d861376d0837 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the recorded name (can be empty).
") Name;
		const char * Name();

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
		/****** md5 signature: 630c2fedd5680e328bd447673c7f6ee1 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Number of Entity for the Check currently iterated or 0 for GlobalCheck.
") Number;
		int Number();

		/****** Interface_CheckIterator::Print ******/
		/****** md5 signature: f6aee6be83bdabfe962c9083c6280249 ******/
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
		void Print(std::ostream &OutValue, const bool failsonly, const int final = 0);

		/****** Interface_CheckIterator::Print ******/
		/****** md5 signature: a22fa1762f4a35b29c9a38e98d3a209a ******/
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
		void Print(std::ostream &OutValue, const opencascade::handle<Interface_InterfaceModel> & model, const bool failsonly, const int final = 0);

		/****** Interface_CheckIterator::Remove ******/
		/****** md5 signature: a2272d41e059693ce6923a4895756293 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
mess: char *
incl: int
status: Interface_CheckStatus

Return
-------
bool

Description
-----------
Removes the messages of all Checks, under these conditions: <incl> = 0: <mess> exactly matches one of the messages <incl> < 0: <mess> is contained by one of the messages <incl> > 0: <mess> contains one of the messages For <status>: for CheckWarning and CheckFail, considers only resp. Warning or Check messages. for CheckAny, considers all other values are ignored (nothing is done) Returns True if at least one message has been removed, False else.
") Remove;
		bool Remove(const char * const mess, const int incl, const Interface_CheckStatus status);

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
		/****** md5 signature: 9334b2c77e8aae2ba868615f5b4f7498 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
None

Description
-----------
Sets / Changes the name.
") SetName;
		void SetName(const char * const name);

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
		/****** md5 signature: ea9894c88e1aab4719d364a38635bf86 ******/
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
		opencascade::handle<Interface_Check> Check(const int num);

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
		/****** md5 signature: 5661894ac716967bd6dfc9801db6e8ba ******/
		%feature("compactdefaultargs") CheckSuccess;
		%feature("autodoc", "
Parameters
----------
reset: bool (optional, default to false)

Return
-------
None

Description
-----------
Checks if any Error has been detected (CheckList not empty) Returns normally if none, raises exception if some exists. It reuses the last computations from other checking methods, unless the argument <reset> is given True.
") CheckSuccess;
		void CheckSuccess(const bool reset = false);

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
		/****** md5 signature: 829d8f272164176942dfc59796638dba ******/
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
		virtual bool Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

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
		/****** md5 signature: bfe4d1e3ac5053e9916a65bb389e3883 ******/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "
Parameters
----------
withreports: bool (optional, default to false)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the complete list of copied Entities If <withreports> is given True, the entities which were reported in the Starting Model are replaced in the list by the copied ReportEntities.
") CompleteResult;
		Interface_EntityIterator CompleteResult(const bool withreports = false);

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
		/****** md5 signature: 8df520ab461f32acf2ae4850b8bc2c45 ******/
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
		virtual bool Copy(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, const bool mapped, const bool errstat);

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
		/****** md5 signature: 756bd5bc34182229f16d751d509c481c ******/
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
		int LastCopiedAfter(const int numfrom, opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

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
		/****** md5 signature: 9973e992c6db7cacdc824010dbc0f450 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
withreports: bool (optional, default to false)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of Root copied Entities (those which were asked for copy by the user of CopyTool, not by copying another Entity).
") RootResult;
		Interface_EntityIterator RootResult(const bool withreports = false);

		/****** Interface_CopyTool::Search ******/
		/****** md5 signature: 9054e25aca61fc7f2d18aeecf4ba3ccf ******/
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
		bool Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

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
		/****** md5 signature: 684cc77731940fa1427c4073b379ced5 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total count of Entities (including Next).
") NbEntities;
		int NbEntities();

		/****** Interface_EntityCluster::Remove ******/
		/****** md5 signature: 97a75a183e49234a5bb1adc9495fe366 ******/
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
		bool Remove(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityCluster::Remove ******/
		/****** md5 signature: e431019970c473f965e0ff4e65d0a65b ******/
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
		bool Remove(const int num);

		/****** Interface_EntityCluster::SetValue ******/
		/****** md5 signature: 98a0087d4df51d059d6d587cf65e963d ******/
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
		void SetValue(const int num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityCluster::Value ******/
		/****** md5 signature: 0c55c129bed620a3225b97c6dd31b0d3 ******/
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
		const opencascade::handle<Standard_Transient> & Value(const int num);

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
		/****** md5 signature: 9a466f973b395f9d16c7310387bbe0ad ******/
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
		 Interface_EntityIterator(const opencascade::handle<TColStd_HSequenceOfTransient > & list);

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
		/****** md5 signature: 52552faf2ef1d366da84fc7806b6538a ******/
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
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient > & list);

		/****** Interface_EntityIterator::Content ******/
		/****** md5 signature: b7090464690bf22740d697309aae3742 ******/
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
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Says if there are other entities (vertices) to iterate the first time, calls Start.
") More;
		bool More();

		/****** Interface_EntityIterator::NbEntities ******/
		/****** md5 signature: 684cc77731940fa1427c4073b379ced5 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of entities which will be iterated on Calls Start if not yet done.
") NbEntities;
		int NbEntities();

		/****** Interface_EntityIterator::NbTyped ******/
		/****** md5 signature: 84b460a22e1e68d80db943a9ec0ca53f ******/
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
		int NbTyped(const opencascade::handle<Standard_Type> & type);

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
		/****** md5 signature: 7933d74dd20264a82d0f775317b5af87 ******/
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
		void SelectType(const opencascade::handle<Standard_Type> & atype, const bool keep);

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
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the list is empty.
") IsEmpty;
		bool IsEmpty();

		/****** Interface_EntityList::NbEntities ******/
		/****** md5 signature: 684cc77731940fa1427c4073b379ced5 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Entities.
") NbEntities;
		int NbEntities();

		/****** Interface_EntityList::NbTypedEntities ******/
		/****** md5 signature: f573d330fbcad92604e246d60423a4ff ******/
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
		int NbTypedEntities(const opencascade::handle<Standard_Type> & atype);

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
		/****** md5 signature: d1b237ede0967f779391e4694e5bb8de ******/
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
		void Remove(const int num);

		/****** Interface_EntityList::SetValue ******/
		/****** md5 signature: 98a0087d4df51d059d6d587cf65e963d ******/
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
		void SetValue(const int num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_EntityList::TypedEntity ******/
		/****** md5 signature: ae3a3e1d8487bad085152b393f68c63a ******/
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
		opencascade::handle<Standard_Transient> TypedEntity(const opencascade::handle<Standard_Type> & atype, const int num = 0);

		/****** Interface_EntityList::Value ******/
		/****** md5 signature: 0c55c129bed620a3225b97c6dd31b0d3 ******/
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
		const opencascade::handle<Standard_Transient> & Value(const int num);

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
		/****** md5 signature: 072c55a087342585743a07d3012ed304 ******/
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Same as above, but as a CString (for immediate exploitation) was C++: return const.
") CValue;
		const char * CValue();

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
		/****** md5 signature: 2fcec837afe21e656571ee20a085168d ******/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns value set by SetEntityNumber.
") EntityNumber;
		int EntityNumber();

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
		/****** md5 signature: 5332c719b56f899a226b2c01a69d95f1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
val: char *
typ: Interface_ParamType

Return
-------
None

Description
-----------
Same as above, but builds the Value from a CString.
") Init;
		void Init(const char * const val, const Interface_ParamType typ);

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
		/****** md5 signature: f9a07ddd743a51544a72877f0efb3f71 ******/
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
		void SetEntityNumber(const int num);

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
		/****** md5 signature: 166942e958353fa32e18edf989c7c756 ******/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "
Parameters
----------
num: int
aval: char *
atype: Interface_ParamType
nument: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a parameter to record no 'num' and fills its fields (EntityNumber is optional) Warning: <aval> is assumed to be memory-managed elsewhere: it is NOT copied. This gives a best speed: strings remain stored in pages of characters.
") AddParam;
		void AddParam(const int num, const char * const aval, const Interface_ParamType atype, const int nument = 0);

		/****** Interface_FileReaderData::AddParam ******/
		/****** md5 signature: 77b01db1a02224d7597982cd48a8330f ******/
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
		void AddParam(const int num, TCollection_AsciiString aval, const Interface_ParamType atype, const int nument = 0);

		/****** Interface_FileReaderData::AddParam ******/
		/****** md5 signature: a09952f33c4ab98134c3068838ff4f4a ******/
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
		void AddParam(const int num, const Interface_FileParameter & FP);

		/****** Interface_FileReaderData::BindEntity ******/
		/****** md5 signature: 80d8194c17afbf962aa1206895da2cd3 ******/
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
		void BindEntity(const int num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_FileReaderData::BoundEntity ******/
		/****** md5 signature: 9bfae642989607b97df75467d2015814 ******/
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
		const opencascade::handle<Standard_Transient> & BoundEntity(const int num);

		/****** Interface_FileReaderData::ChangeParam ******/
		/****** md5 signature: f2c6964fa415665c8e4c96de64f2132f ******/
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
		Interface_FileParameter & ChangeParam(const int num, const int nump);

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
		/****** md5 signature: fd312e509e77a903a49ab2e621355fdd ******/
		%feature("compactdefaultargs") Fastof;
		%feature("autodoc", "
Parameters
----------
str: char *

Return
-------
double

Description
-----------
Same spec.s as standard <atof> but 5 times faster.
") Fastof;
		static double Fastof(const char * const str);

		/****** Interface_FileReaderData::FindNextRecord ******/
		/****** md5 signature: 2f8c884bedea459e07e6e9acb454ca31 ******/
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
		virtual int FindNextRecord(const int num);

		/****** Interface_FileReaderData::InitParams ******/
		/****** md5 signature: 9a9f6c83b31f102f8fff14821a4596c5 ******/
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
		void InitParams(const int num);

		/****** Interface_FileReaderData::IsErrorLoad ******/
		/****** md5 signature: 5531eddde27518d44bcfe4b3df17639d ******/
		%feature("compactdefaultargs") IsErrorLoad;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the status 'Error Load' has been set (to True or False).
") IsErrorLoad;
		bool IsErrorLoad();

		/****** Interface_FileReaderData::IsParamDefined ******/
		/****** md5 signature: 13935dc3d48067f7587bbe0fe9ccf871 ******/
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
		bool IsParamDefined(const int num, const int nump);

		/****** Interface_FileReaderData::NbEntities ******/
		/****** md5 signature: d39dc6dad2652e59b6a3d4eb10c69b89 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of entities. Depending of each norm, records can be Entities or SubParts (SubList in STEP, SubGroup in SET ...). NbEntities counts only Entities, not Subs Used for memory reservation in InterfaceModel Default implementation uses FindNextRecord Can be redefined into a more performant way.
") NbEntities;
		virtual int NbEntities();

		/****** Interface_FileReaderData::NbParams ******/
		/****** md5 signature: 8124fff650aad37819c2053365a8e644 ******/
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
		int NbParams(const int num);

		/****** Interface_FileReaderData::NbRecords ******/
		/****** md5 signature: 0337cae9528c82614ff4c9ae9e9308bc ******/
		%feature("compactdefaultargs") NbRecords;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of registered records That is, value given for Initialization (can be redefined).
") NbRecords;
		virtual int NbRecords();

		/****** Interface_FileReaderData::Param ******/
		/****** md5 signature: bd5cf474707fd49c7517603bbb7ad56c ******/
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
		const Interface_FileParameter & Param(const int num, const int nump);

		/****** Interface_FileReaderData::ParamCValue ******/
		/****** md5 signature: 6a036bacb89e496048fa4b7300481561 ******/
		%feature("compactdefaultargs") ParamCValue;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int

Return
-------
char *

Description
-----------
Same as above, but as a CString was C++: return const.
") ParamCValue;
		const char * ParamCValue(const int num, const int nump);

		/****** Interface_FileReaderData::ParamEntity ******/
		/****** md5 signature: 8be0451d18c93b8363f5a739a2aa8206 ******/
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
		const opencascade::handle<Standard_Transient> & ParamEntity(const int num, const int nump);

		/****** Interface_FileReaderData::ParamFirstRank ******/
		/****** md5 signature: 664e74627dad23a669d3552b7bdf5cfe ******/
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
		int ParamFirstRank(const int num);

		/****** Interface_FileReaderData::ParamNumber ******/
		/****** md5 signature: a74780d6bd81a8fec1821ed653a63c2d ******/
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
		int ParamNumber(const int num, const int nump);

		/****** Interface_FileReaderData::ParamType ******/
		/****** md5 signature: 53d3ed5bced10805c02b63a5214b5bbb ******/
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
		Interface_ParamType ParamType(const int num, const int nump);

		/****** Interface_FileReaderData::Params ******/
		/****** md5 signature: 8c235eaf7dbf1b81c5e808c21f8f1a24 ******/
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
		opencascade::handle<Interface_ParamList> Params(const int num);

		/****** Interface_FileReaderData::ResetErrorLoad ******/
		/****** md5 signature: fa4271a6a0300a18fa3cd009a4bf5dcc ******/
		%feature("compactdefaultargs") ResetErrorLoad;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the former value of status 'Error Load' then resets it Used to read the status then ensure it is reset.
") ResetErrorLoad;
		bool ResetErrorLoad();

		/****** Interface_FileReaderData::SetErrorLoad ******/
		/****** md5 signature: 7f54d00f9be980de487132407e1d7af9 ******/
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
		void SetErrorLoad(const bool val);

		/****** Interface_FileReaderData::SetParam ******/
		/****** md5 signature: addb80be663e8252ca543dedf2059f9f ******/
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
		void SetParam(const int num, const int nump, const Interface_FileParameter & FP);

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
		/****** md5 signature: 4cd8d0d365bc9871a0d5300cfae8bbed ******/
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
		virtual bool AnalyseRecord(const int num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

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
		/****** md5 signature: c79fea2ab576cdec154ba462272f08db ******/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns ErrorHandle flag.
") ErrorHandle;
		bool ErrorHandle();

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
		/****** md5 signature: 4731469b6067d7f2a48f50849f5e6423 ******/
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
		opencascade::handle<Standard_Transient> LoadedEntity(const int num);

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
		/****** md5 signature: 7b5d49878351592c97e4ae950d1219bf ******/
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
		virtual bool Recognize(const int num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****** Interface_FileReaderTool::RecognizeByLib ******/
		/****** md5 signature: 3c0eac3aca33dc400c47f776445dad0e ******/
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
		bool RecognizeByLib(const int num, Interface_GeneralLib & glib, Interface_ReaderLib & rlib, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: d76a799139c5b10487dc4f1dd9a3cfe4 ******/
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
		void SetErrorHandle(const bool err);

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
		/****** md5 signature: e0ab11a718ad5e49cf71db2e29fdf588 ******/
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
		void SetTraceLevel(const int tracelev);

		/****** Interface_FileReaderTool::TraceLevel ******/
		/****** md5 signature: e1d3ff50d5bef880ca750eed35db1e8e ******/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns trace level used for outputting messages.
") TraceLevel;
		int TraceLevel();

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
		/****** md5 signature: 0a055b666ef90c09e165106be3cdfabc ******/
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
Creates a FloatWriter ready to work, with default options - zero suppress option is set - main format is set to '%E' - secondary format is set to '%f' for values between 0.1 and 1000. in absolute values If <chars> is given (and positive), it will produce options to produce this count of characters: '%<chars>f','%<chars>%E'.
") Interface_FloatWriter;
		 Interface_FloatWriter(const int chars = 0);

		/****** Interface_FloatWriter::Convert ******/
		/****** md5 signature: 95cd9c1b7bb9fee2b5c2b6362fb0a11e ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
val: double
text: char *
zerosup: bool
Range1: double
Range2: double
mainform: char *
rangeform: char *

Return
-------
int

Description
-----------
This class method converts a Real Value to a string, given options given as arguments. It can be called independently. Warning: even if declared in, content of <text> will be modified.
") Convert;
		static int Convert(const double val, const char * const text, const bool zerosup, const double Range1, const double Range2, const char * const mainform, const char * const rangeform);

		/****** Interface_FloatWriter::FormatForRange ******/
		/****** md5 signature: 17a77c7054fdb26dd361fb8e063cd95f ******/
		%feature("compactdefaultargs") FormatForRange;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the format for range, if set Meaningful only if <range> from Options is True was C++: return const.
") FormatForRange;
		const char * FormatForRange();

		/****** Interface_FloatWriter::MainFormat ******/
		/****** md5 signature: 03c2b28d9632d714b8adcb8ffd74a612 ******/
		%feature("compactdefaultargs") MainFormat;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the main format was C++: return const.
") MainFormat;
		const char * MainFormat();

		/****** Interface_FloatWriter::Options ******/
		/****** md5 signature: 3d61dc017b9c8bfee2683ae198bbd550 ******/
		%feature("compactdefaultargs") Options;
		%feature("autodoc", "
Parameters
----------

Return
-------
zerosup: bool
range: bool
R1: double
R2: double

Description
-----------
Returns active options: <zerosup> is the option ZeroSuppress, <range> is True if a range is set, False else R1,R2 give the range (if it is set).
") Options;
		void Options(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Interface_FloatWriter::SetDefaults ******/
		/****** md5 signature: 99349edc510eeefd52f09b465da02e27 ******/
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
		void SetDefaults(const int chars = 0);

		/****** Interface_FloatWriter::SetFormat ******/
		/****** md5 signature: f84a56aa0b29c2221a39efb1aa2bf286 ******/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "
Parameters
----------
form: char *
reset: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets a specific Format for Sending Reals (main format) (Default from Creation is '%E') If <reset> is given True (default), this call clears effects of former calls to SetFormatForRange and SetZeroSuppress.
") SetFormat;
		void SetFormat(const char * const form, const bool reset = true);

		/****** Interface_FloatWriter::SetFormatForRange ******/
		/****** md5 signature: 8e17e6fcf724ae2e64e9eabae626a8a8 ******/
		%feature("compactdefaultargs") SetFormatForRange;
		%feature("autodoc", "
Parameters
----------
form: char *
R1: double
R2: double

Return
-------
None

Description
-----------
Sets a secondary Format for Real, to be applied between R1 and R2 (in absolute values). A Call to SetRealForm cancels this secondary form if <reset> is True. (Default from Creation is '%f' between 0.1 and 1000.) Warning: if the condition (0. <= R1 < R2) is not fulfilled, this secondary form is canceled.
") SetFormatForRange;
		void SetFormatForRange(const char * const form, const double R1, const double R2);

		/****** Interface_FloatWriter::SetZeroSuppress ******/
		/****** md5 signature: 2990cb2088db4a8eec0f0006a1775296 ******/
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
		void SetZeroSuppress(const bool mode);

		/****** Interface_FloatWriter::Write ******/
		/****** md5 signature: 4307433a7c1d853e5654615798be359c ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
val: double
text: char *

Return
-------
int

Description
-----------
Writes a Real value <val> to a string <text> by using the options. Returns the useful Length of produced string. It calls the class method Convert. Warning: <text> is assumed to be wide enough (20-30 is correct) And, even if declared in, its content will be modified.
") Write;
		int Write(const double val, const char * const text);

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
		/****** md5 signature: c0677a85e6d5c438ab01132f650f5870 ******/
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
		 Interface_GTool(const opencascade::handle<Interface_Protocol> & proto, const int nbent = 0);

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
		/****** md5 signature: 82be2c0f2a318d75cbfcf979f0496ac2 ******/
		%feature("compactdefaultargs") Reservate;
		%feature("autodoc", "
Parameters
----------
nb: int
enforce: bool (optional, default to false)

Return
-------
None

Description
-----------
Reservates maps for a count of entities <enforce> False: minimum count <enforce> True: clears former reservations Does not clear the maps.
") Reservate;
		void Reservate(const int nb, const bool enforce = false);

		/****** Interface_GTool::Select ******/
		/****** md5 signature: 572b20cd22ee05a271cea8b6053dfda3 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
gmod: Interface_GeneralModule
enforce: bool (optional, default to false)

Return
-------
CN: int

Description
-----------
Selects for an entity, its Module and Case Number It is optimised: once done for each entity, the result is mapped and the GeneralLib is not longer queried <enforce> True overpasses this optimisation.
") Select;
		bool Select(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Interface_GeneralModule> & gmod, Standard_Integer &OutValue, const bool enforce = false);

		/****** Interface_GTool::SetProtocol ******/
		/****** md5 signature: 82333e1768f5dd562f9455e7f9572c3d ******/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "
Parameters
----------
proto: Interface_Protocol
enforce: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a new Protocol if <enforce> is False and the new Protocol equates the old one then nothing is done.
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & proto, const bool enforce = false);

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
		/****** md5 signature: 0114b7e49b2c1b7a9d31df1ae036bb97 ******/
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the Name of the SignType, or 'Class Name'.
") SignName;
		const char * SignName();

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
		/****** md5 signature: 3c2f3c5187792140c21d8e64b83d841b ******/
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
char *

Description
-----------
Returns the Signature for a Transient Object in a Model It calls SignType to do that If SignType is not defined, return ClassName of <ent>.
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
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Modules to iterate on.
") More;
		bool More();

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
		/****** md5 signature: aa06e5b16af7bcddf79eb28012143102 ******/
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
		bool Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<Interface_GeneralModule> & module, Standard_Integer &OutValue);

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
		/****** md5 signature: 4104b35d753d2858100f79fa36c6484f ******/
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
		virtual bool CanCopy(const int CN, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_GeneralModule::CategoryNumber ******/
		/****** md5 signature: 51f794cc500ed8769b7e2b4072c08679 ******/
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
		virtual int CategoryNumber(const int CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****** Interface_GeneralModule::CheckCase ******/
		/****** md5 signature: 29b6b32e5ea9347ed0b93bc01531be13 ******/
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
		virtual void CheckCase(const int CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** Interface_GeneralModule::CopyCase ******/
		/****** md5 signature: babce297339eb25f219865de2d0d61a5 ******/
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
		virtual void CopyCase(const int CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** Interface_GeneralModule::Dispatch ******/
		/****** md5 signature: 81f5c889f81b4df15003b2f11af0d12b ******/
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
		virtual bool Dispatch(const int CN, const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** Interface_GeneralModule::FillShared ******/
		/****** md5 signature: 6fa75ef23610488c0adfd7ee37112a06 ******/
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
		virtual void FillShared(const opencascade::handle<Interface_InterfaceModel> & model, const int CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::FillSharedCase ******/
		/****** md5 signature: 419129d1cee9d95940c612bb69aa7126 ******/
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
		virtual void FillSharedCase(const int CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::ListImplied ******/
		/****** md5 signature: 0c4aeec6ce292c0e6b75de622b338e22 ******/
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
		virtual void ListImplied(const opencascade::handle<Interface_InterfaceModel> & model, const int CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::ListImpliedCase ******/
		/****** md5 signature: 09e26ae05f2000b97e4ee5877c5c7c86 ******/
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
		virtual void ListImpliedCase(const int CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** Interface_GeneralModule::Name ******/
		/****** md5 signature: 58909caae45420c910c833bdae01e53b ******/
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
		virtual opencascade::handle<TCollection_HAsciiString> Name(const int CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****** Interface_GeneralModule::NewCopiedCase ******/
		/****** md5 signature: d22ff90a05db564eddbf4b317aca4ac3 ******/
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
		virtual bool NewCopiedCase(const int CN, const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** Interface_GeneralModule::NewVoid ******/
		/****** md5 signature: 83236b3139c981102605ade3269146d8 ******/
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
		virtual bool NewVoid(const int CN, opencascade::handle<Standard_Transient> & entto);

		/****** Interface_GeneralModule::RenewImpliedCase ******/
		/****** md5 signature: 850ba31b27840654b5f420fc51b1ddba ******/
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
		virtual void RenewImpliedCase(const int CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, const Interface_CopyTool & TC);

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
		/****** md5 signature: 92fa48e596a0455dcabd14e3f346a75d ******/
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
		virtual void WhenDeleteCase(const int CN, const opencascade::handle<Standard_Transient> & ent, const bool dispatched);

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
		/****** md5 signature: 48112a3f5dd23eaba76bf85561b697aa ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an empty graph, ready to receive Entities from amodel Note that this way of Creation allows <self> to verify that Entities to work with are contained in <amodel> Basic Shared and Sharing lists are obtained from a General Services Library, given directly as an argument.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib, const bool theModeStats = true);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: 1e30fe3d126d5b35bf3ab171bda08dea ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Same as above, but the Library is defined through a Protocol.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol, const bool theModeStats = true);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: a55f0c77cb59e32b8bd650497faa0c40 ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Same as above, but the Library is defined through a Protocol.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool, const bool theModeStats = true);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: 1d2ec3378aa56f6bc17f159aba7df44c ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Same a above but works with the Protocol recorded in the Model.
") Interface_Graph;
		 Interface_Graph(const opencascade::handle<Interface_InterfaceModel> & amodel, const bool theModeStats = true);

		/****** Interface_Graph::Interface_Graph ******/
		/****** md5 signature: 3d2f314d1aae7069b19a5aff6df86f03 ******/
		%feature("compactdefaultargs") Interface_Graph;
		%feature("autodoc", "
Parameters
----------
agraph: Interface_Graph
copied: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a Graph from another one, getting all its data Remark that status are copied from <agraph>, but the other lists (sharing/shared) are copied only if <copied> = True.
") Interface_Graph;
		 Interface_Graph(const Interface_Graph & agraph, const bool copied = false);

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
		/****** md5 signature: 93b7b3a8515be3bada30350fe101ff95 ******/
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
		void ChangeStatus(const int oldstat, const int newstat);

		/****** Interface_Graph::Entity ******/
		/****** md5 signature: 73f0668370ee3e85ef885f3b34a527af ******/
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
		const opencascade::handle<Standard_Transient> & Entity(const int num);

		/****** Interface_Graph::EntityNumber ******/
		/****** md5 signature: fdd39c45ed43dd2b7a576970132215c7 ******/
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
		int EntityNumber(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::GetFromEntity ******/
		/****** md5 signature: a3ee812396525321b55a0742e5a48eed ******/
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
		void GetFromEntity(const opencascade::handle<Standard_Transient> & ent, const bool shared, const int newstat = 0);

		/****** Interface_Graph::GetFromEntity ******/
		/****** md5 signature: 675ce3e154c54c0c905c8766c85c9f66 ******/
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
		void GetFromEntity(const opencascade::handle<Standard_Transient> & ent, const bool shared, const int newstat, const int overlapstat, const bool cumul);

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
		/****** md5 signature: b6d85ca13163a90f1e450c47f810f25b ******/
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
		void GetFromGraph(const Interface_Graph & agraph, const int stat);

		/****** Interface_Graph::GetFromIter ******/
		/****** md5 signature: a962a51cef9817b962ada56f574a4b45 ******/
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
		void GetFromIter(const Interface_EntityIterator & iter, const int newstat);

		/****** Interface_Graph::GetFromIter ******/
		/****** md5 signature: 6e38f5bf428068724060e53b2cd724c1 ******/
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
		void GetFromIter(const Interface_EntityIterator & iter, const int newstat, const int overlapstat, const bool cumul);

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
		/****** md5 signature: 52868a7fc29f00ec177c93aa013155cc ******/
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
		/****** md5 signature: a09b78c596601bccddf898bad8143724 ******/
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
		/****** md5 signature: 55ac010f5cf5b6a02dbb0ebe45970708 ******/
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
		bool HasShareErrors(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::IsPresent ******/
		/****** md5 signature: d06457d63ec5d47ec666d79cdd602a43 ******/
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
		bool IsPresent(const int num);

		/****** Interface_Graph::IsPresent ******/
		/****** md5 signature: ed6c0126f28a66fb49e0e2d9c24e1ddb ******/
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
		bool IsPresent(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Graph::ModeStat ******/
		/****** md5 signature: 6520e9a3545f0091b60f538de329a051 ******/
		%feature("compactdefaultargs") ModeStat;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns mode responsible for computation of statuses;.
") ModeStat;
		bool ModeStat();

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
		/****** md5 signature: b394b23c917b8f069539c7eff2c49752 ******/
		%feature("compactdefaultargs") NbStatuses;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns size of array of statuses.
") NbStatuses;
		int NbStatuses();

		/****** Interface_Graph::RemoveItem ******/
		/****** md5 signature: 22898ab22907072b03700283bc6a55b3 ******/
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
		void RemoveItem(const int num);

		/****** Interface_Graph::RemoveStatus ******/
		/****** md5 signature: 65cc3b860477867596ed5d0a07f61d41 ******/
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
		void RemoveStatus(const int stat);

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
		/****** md5 signature: 890e22ce77f7fe292c2b9a73fde0b5a7 ******/
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
		void SetStatus(const int num, const int stat);

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
		/****** md5 signature: da2fd084f9654588397e507d1d4b9b80 ******/
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
		/****** md5 signature: 17331f3e25412668feb601e972bde1f4 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns size (max nb of entities, i.e. Model's nb of entities).
") Size;
		int Size();

		/****** Interface_Graph::Status ******/
		/****** md5 signature: f4e83bb2b0fb664b8efe54a023fff8d0 ******/
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
		int Status(const int num);

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
		/****** md5 signature: 60b20ff7037b17c4fb2fde96cf4b61cd ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an HGraph with a Graph created from <amodel> and <lib>.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib, const bool theModeStats = true);

		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: 83f390f4301eae8a7e9c2218c5b1ade3 ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an HGraph with a graph itself created from <amodel> and <protocol>.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol, const bool theModeStats = true);

		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: c06e4cb449dcc46ccd667ad35c19b458 ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
gtool: Interface_GTool
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an HGraph with a graph itself created from <amodel> and <protocol>.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_GTool> & gtool, const bool theModeStats = true);

		/****** Interface_HGraph::Interface_HGraph ******/
		/****** md5 signature: a13b83fd978edce1562ee746be7bdfcf ******/
		%feature("compactdefaultargs") Interface_HGraph;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
theModeStats: bool (optional, default to true)

Return
-------
None

Description
-----------
Same a above, but works with the GTool in the model.
") Interface_HGraph;
		 Interface_HGraph(const opencascade::handle<Interface_InterfaceModel> & amodel, const bool theModeStats = true);

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
		/****** md5 signature: ba45613efd5e34cea429a56999b5e031 ******/
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
		 Interface_IntList(const int nbe);

		/****** Interface_IntList::Interface_IntList ******/
		/****** md5 signature: 9d28181662639cc83214b7fc6d0fc11b ******/
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
		 Interface_IntList(const Interface_IntList & other, const bool copied);

		/****** Interface_IntList::Add ******/
		/****** md5 signature: 09253480f292603d957fe746e7edb101 ******/
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
		void Add(const int ref);

		/****** Interface_IntList::AdjustSize ******/
		/****** md5 signature: 71b02bed4abb77e3871d95a7c9811f9a ******/
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
		void AdjustSize(const int margin = 0);

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

		/****** Interface_IntList::Entities ******/
		/****** md5 signature: cd5e508e187c87018b4d76a5a1d691b3 ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns entity headers used to describe the lists. 
Return: handle to the array of entity headers.
") Entities;
		const opencascade::handle<TColStd_HArray1OfInteger> & Entities();

		/****** Interface_IntList::Initialize ******/
		/****** md5 signature: 36c9ba6792286ef33bddd0cc3c0f4718 ******/
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
		void Initialize(const int nbe);

		/****** Interface_IntList::Internals ******/
		/****** md5 signature: d1bc079fbb07200d6e975421957094ee ******/
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
No available documentation.
") Internals;
		void Internals(Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfInteger> & ents, opencascade::handle<TColStd_HArray1OfInteger> & refs);

		/****** Interface_IntList::IsRedefined ******/
		/****** md5 signature: 5cb64df1312402b796b8657b02b3e02d ******/
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
		bool IsRedefined(const int num = 0);

		/****** Interface_IntList::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of refs attached to current entity number.
") Length;
		int Length();

		/****** Interface_IntList::List ******/
		/****** md5 signature: 226956dfe3676fac534633f4c09dd3b2 ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "
Parameters
----------
number: int
copied: bool (optional, default to false)

Return
-------
Interface_IntList

Description
-----------
Returns an IntList, identical to <self> but set to a specified entity Number By default, not copied (in order to be read) Specified <copied> to produce another list and edit it.
") List;
		Interface_IntList List(const int number, const bool copied = false);

		/****** Interface_IntList::NbEntities ******/
		/****** md5 signature: 684cc77731940fa1427c4073b379ced5 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of entities to be acknowledged.
") NbEntities;
		int NbEntities();

		/****** Interface_IntList::NbReferences ******/
		/****** md5 signature: 642b3100698194aaed99b9e6f62b3d2d ******/
		%feature("compactdefaultargs") NbReferences;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of stored references. 
Return: number of references.
") NbReferences;
		int NbReferences();

		/****** Interface_IntList::Number ******/
		/****** md5 signature: 630c2fedd5680e328bd447673c7f6ee1 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current entity number.
") Number;
		int Number();

		/****** Interface_IntList::References ******/
		/****** md5 signature: 60cca90254a49dfe51dcf9b42b144235 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns the packed references storage. 
Return: handle to the array of packed references.
") References;
		const opencascade::handle<TColStd_HArray1OfInteger> & References();

		/****** Interface_IntList::Remove ******/
		/****** md5 signature: e431019970c473f965e0ff4e65d0a65b ******/
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
		bool Remove(const int num);

		/****** Interface_IntList::Reservate ******/
		/****** md5 signature: 65f1addf1194c29ab13d4f6b848c1ab1 ******/
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
		void Reservate(const int count);

		/****** Interface_IntList::SetNbEntities ******/
		/****** md5 signature: e46075fd03567db61d17bcae44276432 ******/
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
		void SetNbEntities(const int nbe);

		/****** Interface_IntList::SetNumber ******/
		/****** md5 signature: db7933b864082c30fd860cf06e44c2e3 ******/
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
		void SetNumber(const int number);

		/****** Interface_IntList::SetRedefined ******/
		/****** md5 signature: cdfa288d33c62eddeffec578a1ab161f ******/
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
		void SetRedefined(const bool mode);

		/****** Interface_IntList::Value ******/
		/****** md5 signature: a84c329ad1a9cb92bef8327a2a1252ed ******/
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
		int Value(const int num);

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

		/****** Interface_IntVal::CValue ******/
		/****** md5 signature: 951890a4297fbccd079907a620b4e41b ******/
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CValue;
		int & CValue();

		/****** Interface_IntVal::Value ******/
		/****** md5 signature: c627cada3dfed5ccab6c1f1ff49fb87f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Value;
		int Value();

		%extend{
			int GetCValue() { return self->CValue(); }
			void SetCValue(int value) { self->CValue() = value; }
		};
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
		/****** md5 signature: 8c81fd48bf2e3bcd18bb8d36af824946 ******/
		%feature("compactdefaultargs") AddReportEntity;
		%feature("autodoc", "
Parameters
----------
rep: Interface_ReportEntity
semantic: bool (optional, default to false)

Return
-------
bool

Description
-----------
Adds a ReportEntity as such. Returns False if the concerned entity is not recorded in the Model Else, adds it into, either the main report list or the list for semantic checks, then returns True.
") AddReportEntity;
		bool AddReportEntity(const opencascade::handle<Interface_ReportEntity> & rep, const bool semantic = false);

		/****** Interface_InterfaceModel::AddWithRefs ******/
		/****** md5 signature: b7811b49a52283e1ff7651401c3f3b6a ******/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "
Parameters
----------
anent: Standard_Transient
proto: Interface_Protocol
level: int (optional, default to 0)
listall: bool (optional, default to false)

Return
-------
None

Description
-----------
Adds to the Model, an Entity with all its References, as they are defined by General Services FillShared and ListImplied. Process is recursive (any sub-levels) if <level> = 0 (Default) Else, adds sub-entities until the required sub-level. Especially, if <level> = 1, adds immediate subs and that's all //! If <listall> is False (Default), an entity (<anentity> itself or one of its subs at any level) which is already recorded in the Model is not analysed, only the newly added ones are. If <listall> is True, all items are analysed (this allows to ensure the consistency of an adding made by steps).
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const opencascade::handle<Interface_Protocol> & proto, const int level = 0, const bool listall = false);

		/****** Interface_InterfaceModel::AddWithRefs ******/
		/****** md5 signature: af591c85bb5bfe7fc2fd0cadd7a6b15e ******/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "
Parameters
----------
anent: Standard_Transient
level: int (optional, default to 0)
listall: bool (optional, default to false)

Return
-------
None

Description
-----------
Same as above, but works with the Protocol of the Model.
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const int level = 0, const bool listall = false);

		/****** Interface_InterfaceModel::AddWithRefs ******/
		/****** md5 signature: 2abf7b76d884c6943f3a6416e0610e6b ******/
		%feature("compactdefaultargs") AddWithRefs;
		%feature("autodoc", "
Parameters
----------
anent: Standard_Transient
lib: Interface_GeneralLib
level: int (optional, default to 0)
listall: bool (optional, default to false)

Return
-------
None

Description
-----------
Same as above, but works with an already created GeneralLib.
") AddWithRefs;
		void AddWithRefs(const opencascade::handle<Standard_Transient> & anent, const Interface_GeneralLib & lib, const int level = 0, const bool listall = false);

		/****** Interface_InterfaceModel::CategoryNumber ******/
		/****** md5 signature: 26b78394bf37129a5b078388ce9fd836 ******/
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
		int CategoryNumber(const int num);

		/****** Interface_InterfaceModel::ChangeOrder ******/
		/****** md5 signature: 443518ba4bdabf0c0cf321c7534f4321 ******/
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
		void ChangeOrder(const int oldnum, const int newnum, const int count = 1);

		/****** Interface_InterfaceModel::Check ******/
		/****** md5 signature: c272305e8652ed9d245d85e809828dff ******/
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
		const opencascade::handle<Interface_Check> & Check(const int num, const bool syntactic);

		/****** Interface_InterfaceModel::ClassName ******/
		/****** md5 signature: 607915d61536b7465f26c4dfcb5ff64b ******/
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "
Parameters
----------
typnam: char *

Return
-------
char *

Description
-----------
From a CDL Type Name, returns the Class part (package dropped) WARNING: buffered, to be immediately copied or printed.
") ClassName;
		static const char * ClassName(const char * const typnam);

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
		/****** md5 signature: 1a72013d2001bbf5d8fb317fcd014818 ******/
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
		bool ClearReportEntity(const int num);

		/****** Interface_InterfaceModel::Contains ******/
		/****** md5 signature: d6c45387a132bc9aa0be7d2466cb36fd ******/
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
		bool Contains(const opencascade::handle<Standard_Transient> & anentity);

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

		/****** Interface_InterfaceModel::DispatchStatus ******/
		/****** md5 signature: 036d0951e9e4e4208facb8c577652e18 ******/
		%feature("compactdefaultargs") DispatchStatus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Dispatch Status, either for get or set A Model which is produced from Dispatch may share entities with the original (according to the Protocol), hence these non-copied entities should not be deleted.
") DispatchStatus;
		bool & DispatchStatus();

		/****** Interface_InterfaceModel::DumpHeader ******/
		/****** md5 signature: 0bb15a9a1091d69fb4bcfe3581e5307a ******/
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
		virtual void DumpHeader(std::ostream &OutValue, const int level = 0);

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
		/****** md5 signature: 312a6cfb0fa054b9d76325208c1aaf6c ******/
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
		Interface_DataState EntityState(const int num);

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
		/****** md5 signature: 64ee80ff1fc9c51ad46721521ed22e1e ******/
		%feature("compactdefaultargs") FillSemanticChecks;
		%feature("autodoc", "
Parameters
----------
checks: Interface_CheckIterator
clear: bool (optional, default to true)

Return
-------
None

Description
-----------
Fills the list of semantic checks. This list is computed (by CheckTool). Hence, it can be stored in the model for later queries <clear> True (D): new list replaces <clear> False: new list is cumulated.
") FillSemanticChecks;
		void FillSemanticChecks(const Interface_CheckIterator & checks, const bool clear = true);

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
		/****** md5 signature: d0b2465f222c30a748538fd5c8067c54 ******/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "
Parameters
----------
syntactic: bool (optional, default to true)

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the GlobalCheck, which memorizes messages global to the file (not specific to an Entity), especially Header.
") GlobalCheck;
		const opencascade::handle<Interface_Check> & GlobalCheck(const bool syntactic = true);

		/****** Interface_InterfaceModel::HasSemanticChecks ******/
		/****** md5 signature: 8ec98c64b0782b763db2eef556d2bd9f ******/
		%feature("compactdefaultargs") HasSemanticChecks;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if semantic checks have been filled.
") HasSemanticChecks;
		bool HasSemanticChecks();

		/****** Interface_InterfaceModel::HasTemplate ******/
		/****** md5 signature: f91ad4914b2fb3073820d93249c4b02b ******/
		%feature("compactdefaultargs") HasTemplate;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Returns true if a template is attached to a given name.
") HasTemplate;
		static bool HasTemplate(const char * const name);

		/****** Interface_InterfaceModel::IsErrorEntity ******/
		/****** md5 signature: f45168bcbc1e4ca492b26c454428bf4e ******/
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
		bool IsErrorEntity(const int num);

		/****** Interface_InterfaceModel::IsRedefinedContent ******/
		/****** md5 signature: 55cab72adca413d771f5e2f37f872e57 ******/
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
		bool IsRedefinedContent(const int num);

		/****** Interface_InterfaceModel::IsReportEntity ******/
		/****** md5 signature: 78256266f078383359926c480aaff21a ******/
		%feature("compactdefaultargs") IsReportEntity;
		%feature("autodoc", "
Parameters
----------
num: int
semantic: bool (optional, default to false)

Return
-------
bool

Description
-----------
Returns True if <num> identifies a ReportEntity in the Model Hence, ReportEntity can be called. //! By default, queries main report, if <semantic> is True, it queries report for semantic check //! Remember that a Report Entity can be defined for an Unknown Entity, or a Corrected or Erroneous (at read time) Entity. The ReportEntity is defined before call to method AddEntity.
") IsReportEntity;
		bool IsReportEntity(const int num, const bool semantic = false);

		/****** Interface_InterfaceModel::IsUnknownEntity ******/
		/****** md5 signature: 52009fb42a97d7f6ab1d0f6f6b4085ec ******/
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
		bool IsUnknownEntity(const int num);

		/****** Interface_InterfaceModel::ListTemplates ******/
		/****** md5 signature: f890866113193b72f94f704dd8a9d2fd ******/
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
		/****** md5 signature: 684cc77731940fa1427c4073b379ced5 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of contained Entities.
") NbEntities;
		int NbEntities();

		/****** Interface_InterfaceModel::NbTypes ******/
		/****** md5 signature: fa7fc2252e2ef8d964b5c6d58724e282 ******/
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
		int NbTypes(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: afaeffd0cd79b524d7dbba1321a225e7 ******/
		%feature("compactdefaultargs") NextNumberForLabel;
		%feature("autodoc", "
Parameters
----------
label: char *
lastnum: int (optional, default to 0)
exact: bool (optional, default to true)

Return
-------
int

Description
-----------
Searches a label which matches with one entity. Begins from <lastnum>+1 (default:1) and scans the entities until <NbEntities>. For the first which matches <label>, this method returns its Number. Returns 0 if nothing found Can be called recursively (labels are not specified as unique) <exact>: if True (default), exact match is required else, checks the END of entity label //! This method is virtual, hence it can be redefined for a more efficient search (if exact is true).
") NextNumberForLabel;
		virtual int NextNumberForLabel(const char * const label, const int lastnum = 0, const bool exact = true);

		/****** Interface_InterfaceModel::Number ******/
		/****** md5 signature: 286c4f1506c6cc895b563d0e8a4024e7 ******/
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
		int Number(const opencascade::handle<Standard_Transient> & anentity);

		/****** Interface_InterfaceModel::Print ******/
		/****** md5 signature: ca0299aba5fefc454add663d323b08f6 ******/
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
		void Print(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue, const int mode = 0);

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
		/****** md5 signature: 284d7c4728491d1d0f902f496debf43a ******/
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
		void ReplaceEntity(const int nument, const opencascade::handle<Standard_Transient> & anent);

		/****** Interface_InterfaceModel::ReportEntity ******/
		/****** md5 signature: 2bad0f23c9d041d89c6af0fb071e1b51 ******/
		%feature("compactdefaultargs") ReportEntity;
		%feature("autodoc", "
Parameters
----------
num: int
semantic: bool (optional, default to false)

Return
-------
opencascade::handle<Interface_ReportEntity>

Description
-----------
Returns a ReportEntity identified by its number in the Model, or a Null Handle If <num> does not identify a ReportEntity. //! By default, queries main report, if <semantic> is True, it queries report for semantic check.
") ReportEntity;
		opencascade::handle<Interface_ReportEntity> ReportEntity(const int num, const bool semantic = false);

		/****** Interface_InterfaceModel::Reports ******/
		/****** md5 signature: 943b913a81c4b149b780e78bc09d45de ******/
		%feature("compactdefaultargs") Reports;
		%feature("autodoc", "
Parameters
----------
semantic: bool (optional, default to false)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of all ReportEntities, i.e. data about Entities read with Error or Warning information (each item has to be casted to Report Entity then it can be queried for Concerned Entity, Content, Check ...) By default, returns the main reports, is <semantic> is True it returns the list for semantic checks.
") Reports;
		Interface_EntityIterator Reports(const bool semantic = false);

		/****** Interface_InterfaceModel::Reservate ******/
		/****** md5 signature: 2a927801f4fddb38276bc4e40f5cd4d3 ******/
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
		virtual void Reservate(const int nbent);

		/****** Interface_InterfaceModel::ReverseOrders ******/
		/****** md5 signature: 7a30663103e944ef74b7f7f214f6a0f8 ******/
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
		void ReverseOrders(const int after = 0);

		/****** Interface_InterfaceModel::SetCategoryNumber ******/
		/****** md5 signature: 7b26287fe5396af8867e4155d412d8e4 ******/
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
		bool SetCategoryNumber(const int num, const int val);

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
		/****** md5 signature: 7647b2d6077a2eea32d72e0cd3870c4f ******/
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
		bool SetReportEntity(const int num, const opencascade::handle<Interface_ReportEntity> & rep);

		/****** Interface_InterfaceModel::SetTemplate ******/
		/****** md5 signature: a8a922ca6f17d07b9ad4c64cc0f5045b ******/
		%feature("compactdefaultargs") SetTemplate;
		%feature("autodoc", "
Parameters
----------
name: char *
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Records a new template model with a name. If the name was already recorded, the corresponding template is replaced by the new one. Then, WARNING: test HasTemplate to avoid surprises.
") SetTemplate;
		static bool SetTemplate(const char * const name, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****** md5 signature: 811bcf58cad0581d7c5eeb0d1f82de63 ******/
		%feature("compactdefaultargs") Template;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the template model attached to a name, or a Null Handle.
") Template;
		static opencascade::handle<Interface_InterfaceModel> Template(const char * const name);

		/****** Interface_InterfaceModel::Type ******/
		/****** md5 signature: 180b8bd2d007b6e31f8571958b074a4a ******/
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
		opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & ent, const int num = 1);

		/****** Interface_InterfaceModel::TypeName ******/
		/****** md5 signature: cf5a0435961424ebcead414c24f0be30 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
complete: bool (optional, default to true)

Return
-------
char *

Description
-----------
Returns the type name of an entity, from the list of types (one or more ...) <complete> True (D) gives the complete type, else packages are removed WARNING: buffered, to be immediately copied or printed.
") TypeName;
		const char * TypeName(const opencascade::handle<Standard_Transient> & ent, const bool complete = true);

		/****** Interface_InterfaceModel::Value ******/
		/****** md5 signature: 0c55c129bed620a3225b97c6dd31b0d3 ******/
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
		const opencascade::handle<Standard_Transient> & Value(const int num);

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

		%extend{
			bool GetDispatchStatus() { return self->DispatchStatus(); }
			void SetDispatchStatus(bool value) { self->DispatchStatus() = value; }
		};
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
		/****** md5 signature: d5bc91ec165635a18afbc0836ae332bd ******/
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
		 Interface_LineBuffer(const int size = 10);

		/****** Interface_LineBuffer::Add ******/
		/****** md5 signature: e8bac25a71b63ee748f38f9086d3d37d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
text: char *

Return
-------
None

Description
-----------
Adds a text as a CString. Its Length is evaluated from the text (by C function strlen).
") Add;
		void Add(const char * const text);

		/****** Interface_LineBuffer::Add ******/
		/****** md5 signature: bd439da57dd18affc5118d95032f11ce ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
text: char *
lntext: int

Return
-------
None

Description
-----------
Adds a text as a CString. Its length is given as <lntext>.
") Add;
		void Add(const char * const text, const int lntext);

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
		/****** md5 signature: 29bd499345bf25fe78c5f8f46d7bb0df ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
text: char

Return
-------
None

Description
-----------
Adds a text made of only ONE Character.
") Add;
		void Add(const char text);

		/****** Interface_LineBuffer::CanGet ******/
		/****** md5 signature: 7bc65b79bdf599a806703ca714455db0 ******/
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
		bool CanGet(const int more);

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
		/****** md5 signature: 9206c5037838c92c9895e03ae06cc8e1 ******/
		%feature("compactdefaultargs") Content;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the Content of the LineBuffer.
") Content;
		const char * Content();

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
		/****** md5 signature: 2c79344820631bbc981db4659a632b7a ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Length of the LineBuffer.
") Length;
		int Length();

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
		/****** md5 signature: afd69c80c727485a5e318663e47c25b9 ******/
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
		void SetInitial(const int initial);

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
		/****** md5 signature: f812ba9544e5fb0218b5b11a76e3b583 ******/
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
		void SetMax(const int max);

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
		/****** md5 signature: 0bbcbeffb499e7a73b216efaa5bec88c ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: char *

Return
-------
None

Description
-----------
A MSG is created to write a 'functional code' in conjunction with operator () attached to Value Then, to have a translated message, write in C++: //! Interface_MSG('...mykey...') which returns a CString See also some help which follow.
") Interface_MSG;
		 Interface_MSG(const char * const key);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: f35571226b30ccefd09e6b3fc50bdbb7 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: char *
i1: int

Return
-------
None

Description
-----------
Translates a message which contains one integer variable It is just a help which avoid the following: char mess[100]; Sprintf(mess,Interface_MSG('code'),ival); then AddFail(mess); replaced by AddFail (Interface_MSG('code',ival)); //! The basic message is intended to be in C-Sprintf format, with one %d form in it.
") Interface_MSG;
		 Interface_MSG(const char * const key, const int i1);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: 76d2a075e4ca1c4eb1bbb4f0a5ef50b4 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: char *
i1: int
i2: int

Return
-------
None

Description
-----------
Translates a message which contains two integer variables As for one integer, it is just a writing help //! The basic message is intended to be in C-Sprintf format with two %d forms in it.
") Interface_MSG;
		 Interface_MSG(const char * const key, const int i1, const int i2);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: 5b5c52b42e069c03c78345fc3006cd0c ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: char *
r1: double
intervals: int (optional, default to -1)

Return
-------
None

Description
-----------
Translates a message which contains one real variable <intervals> if set, commands the variable to be rounded to an interval (see below, method Intervals) As for one integer, it is just a writing help //! The basic message is intended to be in C-Sprintf format with one %f form (or equivalent: %e etc) in it.
") Interface_MSG;
		 Interface_MSG(const char * const key, const double r1, const int intervals = -1);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: f49d4451ecd9a338f88acad1da83ae79 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: char *
str: char *

Return
-------
None

Description
-----------
Translates a message which contains one string variable As for one integer, it is just a writing help //! The basic message is intended to be in C-Sprintf format with one %s form in it.
") Interface_MSG;
		 Interface_MSG(const char * const key, const char * const str);

		/****** Interface_MSG::Interface_MSG ******/
		/****** md5 signature: 6d2d7af6d0346096740ab13450579fe8 ******/
		%feature("compactdefaultargs") Interface_MSG;
		%feature("autodoc", "
Parameters
----------
key: char *
ival: int
str: char *

Return
-------
None

Description
-----------
Translates a message which contains one integer and one string variables As for one integer, it is just a writing help Used for instance to say 'Param n0.<ival> i.e. <str> is not..' //! The basic message is intended to be in C-Sprintf format with one %d then one %s forms in it.
") Interface_MSG;
		 Interface_MSG(const char * const key, const int ival, const char * const str);

		/****** Interface_MSG::Blanks ******/
		/****** md5 signature: 3cb651a20e8756bba9d1846870ca1339 ******/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "
Parameters
----------
val: int
max: int

Return
-------
char *

Description
-----------
Returns a blank string, of length between 0 and <max>, to fill the printing of a numeric value <val>, i.e. If val < 10 , max-1 blanks If val between 10 and 99, max-2 blanks ... etc...
") Blanks;
		static const char * Blanks(const int val, const int max);

		/****** Interface_MSG::Blanks ******/
		/****** md5 signature: d3f8b61ba63f6407d7b1397e2c6bb51a ******/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "
Parameters
----------
val: char *
max: int

Return
-------
char *

Description
-----------
Returns a blank string, to complete a given string <val> up to <max> characters: If strlen(val) is 0, max blanks If strlen(val) is 5, max-5 blanks etc...
") Blanks;
		static const char * Blanks(const char * const val, const int max);

		/****** Interface_MSG::Blanks ******/
		/****** md5 signature: 5f46553cc6c90b58421133a70a6a33bc ******/
		%feature("compactdefaultargs") Blanks;
		%feature("autodoc", "
Parameters
----------
count: int

Return
-------
char *

Description
-----------
Returns a blank string of <count> blanks (mini 0, maxi 76).
") Blanks;
		static const char * Blanks(const int count);

		/****** Interface_MSG::CDate ******/
		/****** md5 signature: 875a7c79ea880f9cfcc43a9798a81be7 ******/
		%feature("compactdefaultargs") CDate;
		%feature("autodoc", "
Parameters
----------
text1: char *
text2: char *

Return
-------
int

Description
-----------
Returns a value about comparison of two dates 0: equal. <0 text1 anterior. >0 text1 posterior.
") CDate;
		static int CDate(const char * const text1, const char * const text2);

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
		/****** md5 signature: ed154c9eb8ef74c669addf207085f351 ******/
		%feature("compactdefaultargs") Intervalled;
		%feature("autodoc", "
Parameters
----------
val: double
order: int (optional, default to 3)
upper: bool (optional, default to false)

Return
-------
double

Description
-----------
Returns an 'intervalled' value from a starting real <val>: i.e. a value which is rounded on an interval limit Interval limits are defined to be in a coarsely 'geometric' progression (two successive intervals are inside a limit ratio) //! <order> gives the count of desired intervals in a range <1-10> <upper> False, returns the first lower interval (D) <upper> True, returns the first upper interval Values of Intervals according <order>: 0,1: 1 10 100 ... 2: 1 3 10 30 100 ... 3(D): 1 2 5 10 20 50 100 ... 4: 1 2 3 6 10 20 30 60 100 ... 6: 1 1.5 2 3 5 7 10 15 20 ... 10: 1 1.2 1.5 2 2.5 3 4 5 6 8 10 12 15 20 25 ...
") Intervalled;
		static double Intervalled(const double val, const int order = 3, const bool upper = false);

		/****** Interface_MSG::IsKey ******/
		/****** md5 signature: efb3a641f4cc4a9fbad47ccf2335383e ******/
		%feature("compactdefaultargs") IsKey;
		%feature("autodoc", "
Parameters
----------
mess: char *

Return
-------
bool

Description
-----------
Returns True if a given message is surely a key (according to the form adopted for keys) (before activating messages, answer is false).
") IsKey;
		static bool IsKey(const char * const mess);

		/****** Interface_MSG::NDate ******/
		/****** md5 signature: 1510535c539bedd01d28aeff1133b33f ******/
		%feature("compactdefaultargs") NDate;
		%feature("autodoc", "
Parameters
----------
text: char *

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
		static bool NDate(const char * const text, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Interface_MSG::Print ******/
		/****** md5 signature: 19cddbfb48acdd7fe907fe7195bd30ed ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
val: char *
max: int
just: int (optional, default to -1)

Return
-------
S: Standard_OStream

Description
-----------
Prints a String on an Output Stream, as follows: Accompanied with blanks, to give up to <max> chars at all, justified accordingly: -1 (D): left 0: center 1: right Maximum 76 characters.
") Print;
		static void Print(std::ostream &OutValue, const char * const val, const int max, const int just = -1);

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
		/****** md5 signature: 013d05e7044e24729a08f9bc0cf2e214 ******/
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
		static int Read(std::istream & S);

		/****** Interface_MSG::Read ******/
		/****** md5 signature: ce61826873fbb4b93e25c1d09ea8cd00 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
file: char *

Return
-------
int

Description
-----------
Reads a list of messages from a file defined by its name.
") Read;
		static int Read(const char * const file);

		/****** Interface_MSG::Record ******/
		/****** md5 signature: 91cfd2dc273f7d1c0a424c0a039d9ab3 ******/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "
Parameters
----------
key: char *
item: char *

Return
-------
None

Description
-----------
Fills the dictionary with a couple (key-item) If a key is already recorded, it is possible to: - keep the last definition, and activate the trace system.
") Record;
		static void Record(const char * const key, const char * const item);

		/****** Interface_MSG::SetMode ******/
		/****** md5 signature: e45e9cd8066fd304bb00a10eb27d5665 ******/
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
		static void SetMode(const bool running, const bool raising);

		/****** Interface_MSG::SetTrace ******/
		/****** md5 signature: 41742de4377c65786abc283b94e3c3b7 ******/
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
		static void SetTrace(const bool toprint, const bool torecord);

		/****** Interface_MSG::TDate ******/
		/****** md5 signature: 29cd3070f365cb29babc24fcde582462 ******/
		%feature("compactdefaultargs") TDate;
		%feature("autodoc", "
Parameters
----------
text: char *
yy: int
mm: int
dd: int
hh: int
mn: int
ss: int
format: char * (optional, default to "")

Return
-------
None

Description
-----------
Codes a date as a text, from its numeric value (-> seconds): YYYY-MM-DD:HH-MN-SS fixed format, completed by leading zeros Another format can be provided, as follows: C:%d ... C like format, preceded by C: S:... format to call system (not yet implemented).
") TDate;
		static void TDate(const char * const text, const int yy, const int mm, const int dd, const int hh, const int mn, const int ss, const char * const format = "");

		/****** Interface_MSG::Translated ******/
		/****** md5 signature: 941f4806605edca201e40500084cd788 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
key: char *

Return
-------
char *

Description
-----------
Returns the item recorded for a key. Returns the key itself if: - it is not recorded (then, the trace system is activated) - MSG has been required to be hung on.
") Translated;
		static const char * Translated(const char * const key);

		/****** Interface_MSG::Value ******/
		/****** md5 signature: 4948c51f7dbe7e1a2a3a8c515d136713 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the translated message, in a functional form with operator () was C++: return const.
") Value;
		const char * Value();

		/****** Interface_MSG::Write ******/
		/****** md5 signature: d92797a4109dca8b6c9640aa755337a1 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
rootkey: char * (optional, default to "")

Return
-------
S: Standard_OStream

Description
-----------
Writes the list of messages recorded to be translated, to a stream. Writes all the list (Default) or only keys which begin by <rootkey>. Returns the count of written messages.
") Write;
		static int Write(std::ostream &OutValue, const char * const rootkey = "");

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
		/****** md5 signature: 71f7b4ff4bcd496d72132788c0995556 ******/
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
		 Interface_ParamList(const int theIncrement = 256);

		/****** Interface_ParamList::ChangeValue ******/
		/****** md5 signature: a1c2966ea06f6ca8b744cc8f9b3a13cd ******/
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
		Interface_FileParameter & ChangeValue(const int Index);

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
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements of <self>.
") Length;
		int Length();

		/****** Interface_ParamList::Lower ******/
		/****** md5 signature: ed303acc20e6a8f86d94712204278487 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower bound. Warning.
") Lower;
		int Lower();

		/****** Interface_ParamList::SetValue ******/
		/****** md5 signature: 29042869915f6a693836a7923ecbbe40 ******/
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
		void SetValue(const int Index, const Interface_FileParameter & Value);

		/****** Interface_ParamList::Upper ******/
		/****** md5 signature: a53a7ba7d20e7ec35b8de8d721ea431d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper bound. Warning.
") Upper;
		int Upper();

		/****** Interface_ParamList::Value ******/
		/****** md5 signature: bb231808bea0e6a7e339d10f530d809f ******/
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
		const Interface_FileParameter & Value(const int Index);

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
		/****** md5 signature: 84d7569eeb54143bf87447fc70016b47 ******/
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
		 Interface_ParamSet(const int nres, const int nst = 1);

		/****** Interface_ParamSet::Append ******/
		/****** md5 signature: e349610641d20f9f5ca5d30243744106 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
val: char *
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
		int Append(const char * const val, const int lnval, const Interface_ParamType typ, const int nument);

		/****** Interface_ParamSet::Append ******/
		/****** md5 signature: 8be274920495167c2afb0f6fc3f48db2 ******/
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
		int Append(const Interface_FileParameter & FP);

		/****** Interface_ParamSet::ChangeParam ******/
		/****** md5 signature: dd08d256a3986f7376c7a7e426fc1080 ******/
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
		Interface_FileParameter & ChangeParam(const int num);

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
		/****** md5 signature: 3d5942837081abb877dd0a91d1f0a57f ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total count of parameters (including nexts).
") NbParams;
		int NbParams();

		/****** Interface_ParamSet::Param ******/
		/****** md5 signature: 40013c4e370177c4a0affd4efb12a816 ******/
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
		const Interface_FileParameter & Param(const int num);

		/****** Interface_ParamSet::Params ******/
		/****** md5 signature: db5ce1f2efe805c2e0b4b97e49d46d22 ******/
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
		opencascade::handle<Interface_ParamList> Params(const int num, const int nb);

		/****** Interface_ParamSet::SetParam ******/
		/****** md5 signature: be9172eb5ee8e3fb43414370b6bd2fd1 ******/
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
		void SetParam(const int num, const Interface_FileParameter & FP);

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
		/****** md5 signature: c4cd6dc0f2b35d0fdffc3719a10aff52 ******/
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
		virtual int CaseNumber(const opencascade::handle<Standard_Transient> & obj);

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
		/****** md5 signature: 80736517e355410f3807d21393c524f8 ******/
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
		virtual bool GlobalCheck(const Interface_Graph & G, opencascade::handle<Interface_Check> & ach);

		/****** Interface_Protocol::IsDynamicType ******/
		/****** md5 signature: 7dbeb94a8f3a0e3c8f9c7e39b139de3f ******/
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
		virtual bool IsDynamicType(const opencascade::handle<Standard_Transient> & obj);

		/****** Interface_Protocol::IsSuitableModel ******/
		/****** md5 signature: 47eae21c8a11a570201d27d455f8b013 ******/
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
		virtual bool IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Interface_Protocol::IsUnknownEntity ******/
		/****** md5 signature: 24b30a8945460e35da122d7038f61169 ******/
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
Returns True if <ent> is an Unknown Entity for the Norm, i.e. same Type as them created by method UnknownEntity (for an Entity out of the Norm, answer can be unpredictable).
") IsUnknownEntity;
		virtual bool IsUnknownEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_Protocol::NbResources ******/
		/****** md5 signature: 600adc1e1adfce55d81f5f3257eba171 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of Protocol used as Resources (level one).
") NbResources;
		virtual int NbResources();

		/****** Interface_Protocol::NbTypes ******/
		/****** md5 signature: 8be39275b717d3c54610cde94e22d5b8 ******/
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
		virtual int NbTypes(const opencascade::handle<Standard_Transient> & obj);

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
		/****** md5 signature: 73880a3d465984ca1f2d7d12f9fe6488 ******/
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
		virtual opencascade::handle<Interface_Protocol> Resource(const int num);

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
		/****** md5 signature: 9c1cb2ce93cab29420a6900cbb61d79c ******/
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
		opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & obj, const int nt = 1);

		/****** Interface_Protocol::TypeNumber ******/
		/****** md5 signature: a845f1afb514cd6911bb5eeb7d17e8de ******/
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
		virtual int TypeNumber(const opencascade::handle<Standard_Type> & atype);

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
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Modules to iterate on.
") More;
		bool More();

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
		/****** md5 signature: 8fdf80a66eccc08647e6b3395bcd9ccf ******/
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
		bool Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<Interface_ReaderModule> & module, Standard_Integer &OutValue);

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
		/****** md5 signature: 0a3d537c35ae1a9af4c4ef9e218766c5 ******/
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
		virtual int CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const int num);

		/****** Interface_ReaderModule::NewRead ******/
		/****** md5 signature: 09fb62e1145b22bf00120d76e88d1581 ******/
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
		virtual bool NewRead(const int casenum, const opencascade::handle<Interface_FileReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

		/****** Interface_ReaderModule::Read ******/
		/****** md5 signature: b2e6d55f94f432d220b82c125b18986d ******/
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
		virtual void Read(const int casenum, const opencascade::handle<Interface_FileReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: fa2b56938ece0d582a26024749c97347 ******/
		%feature("compactdefaultargs") HasContent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Content is stored (it can equate Concerned).
") HasContent;
		bool HasContent();

		/****** Interface_ReportEntity::HasNewContent ******/
		/****** md5 signature: 1be0416768b374e03824eb7d7acfd2d7 ******/
		%feature("compactdefaultargs") HasNewContent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Content is stored AND differs from Concerned (i.e. redefines content): used when Concerned could not be loaded.
") HasNewContent;
		bool HasNewContent();

		/****** Interface_ReportEntity::IsError ******/
		/****** md5 signature: 4d6d2e047c45a9842373d0208432adf4 ******/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True for an Error Entity, i.e. if the Check brings at least one Fail message.
") IsError;
		bool IsError();

		/****** Interface_ReportEntity::IsUnknown ******/
		/****** md5 signature: 8481ab064ec255119fd91471b1a62117 ******/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True for an Unknown Entity, i,e. if the Check is empty and Concerned equates Content.
") IsUnknown;
		bool IsUnknown();

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
		/****** md5 signature: 28e5b1bf51be3b32d028393d8f8f3604 ******/
		%feature("compactdefaultargs") Interface_STAT;
		%feature("autodoc", "
Parameters
----------
title: char * (optional, default to "")

Return
-------
None

Description
-----------
Creates a STAT form. At start, one default phase is defined, with one default step. Then, it suffises to start with a count of items (and cycles if several) then record items, to have a queryable report.
") Interface_STAT;
		 Interface_STAT(const char * const title = "");

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
		/****** md5 signature: 5bf5b1cb51352fd953c6038de04cef6f ******/
		%feature("compactdefaultargs") AddPhase;
		%feature("autodoc", "
Parameters
----------
weight: double
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a new phase to the description. The first one after Create replaces the default unique one.
") AddPhase;
		void AddPhase(const double weight, const char * const name = "");

		/****** Interface_STAT::AddStep ******/
		/****** md5 signature: f7d23e25e88c7bb3ed64b323c2c9959d ******/
		%feature("compactdefaultargs") AddStep;
		%feature("autodoc", "
Parameters
----------
weight: double (optional, default to 1)

Return
-------
None

Description
-----------
Adds a new step for the last added phase, the default unique one if no AddPhase has already been added Warning: AddStep before the first AddPhase are cancelled.
") AddStep;
		void AddStep(const double weight = 1);

		/****** Interface_STAT::Description ******/
		/****** md5 signature: 870c8d9bb79df4b696f43c2fb42210ef ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "
Parameters
----------
title: char *

Return
-------
nbphases: int
total: double

Description
-----------
Returns global description (cumulated weights of all phases, count of phases,1 for default, and title).
") Description;
		void Description(Standard_Integer &OutValue, Standard_Real &OutValue, const char * & title);

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
		/****** md5 signature: 71b359ead3a0cf29c42bad3d5003561d ******/
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
total: double

Description
-----------
Returns fields in once, without copying them, used for copy when starting.
") Internals;
		void Internals(opencascade::handle<TCollection_HAsciiString> &OutValue, Standard_Real &OutValue, opencascade::handle<TColStd_HSequenceOfAsciiString> & phn, opencascade::handle<TColStd_HSequenceOfReal> & phw, opencascade::handle<TColStd_HSequenceOfInteger> & phdeb, opencascade::handle<TColStd_HSequenceOfInteger> & phfin, opencascade::handle<TColStd_HSequenceOfReal> & stw);

		/****** Interface_STAT::NextCycle ******/
		/****** md5 signature: 7ecd409073e0796407e5cad262aa860d ******/
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
		static void NextCycle(const int items);

		/****** Interface_STAT::NextItem ******/
		/****** md5 signature: 6ddab954a151a147c319d80043d9ef4b ******/
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
		static void NextItem(const int nbitems = 1);

		/****** Interface_STAT::NextPhase ******/
		/****** md5 signature: e3ba0875893506315c489f39ca12bc17 ******/
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
		static void NextPhase(const int items, const int cycles = 1);

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
		/****** md5 signature: 79cc21df3910d79c50026a388d4ba373 ******/
		%feature("compactdefaultargs") Percent;
		%feature("autodoc", "
Parameters
----------
phase: bool (optional, default to false)

Return
-------
int

Description
-----------
Returns the advancement as a percentage: <phase> True: inside the current phase <phase> False (D): relative to the whole process.
") Percent;
		static int Percent(const bool phase = false);

		/****** Interface_STAT::Phase ******/
		/****** md5 signature: ac64b87b07c52e863824868fef899fd1 ******/
		%feature("compactdefaultargs") Phase;
		%feature("autodoc", "
Parameters
----------
num: int
name: char *

Return
-------
n0step: int
nbstep: int
weight: double

Description
-----------
Returns description of a phase, given its rank (n0 for first step, count of steps, default gives one; weight, name).
") Phase;
		void Phase(const int num, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, const char * & name);

		/****** Interface_STAT::SetPhase ******/
		/****** md5 signature: d82728272448b5f1320651d040b432ad ******/
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
		static void SetPhase(const int items, const int cycles = 1);

		/****** Interface_STAT::Start ******/
		/****** md5 signature: d93e077f3e47f097eae027b691b6ce60 ******/
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
		void Start(const int items, const int cycles = 1);

		/****** Interface_STAT::StartCount ******/
		/****** md5 signature: af44b54a1e729f4f1cc8e07ad77cdb34 ******/
		%feature("compactdefaultargs") StartCount;
		%feature("autodoc", "
Parameters
----------
items: int
title: char * (optional, default to "")

Return
-------
None

Description
-----------
Starts a default STAT, with no phase, no step, ready to just count items. <items> gives the total count of items Hence, NextItem is available to directly count.
") StartCount;
		static void StartCount(const int items, const char * const title = "");

		/****** Interface_STAT::Step ******/
		/****** md5 signature: 18d281f174acb3eb48ddcefabd75475f ******/
		%feature("compactdefaultargs") Step;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
Returns weight of a Step, related to the cumul given for the phase. <num> is given by <n0step> + i, i between 1 and <nbsteps> (default gives n0step < 0 then weight is one).
") Step;
		double Step(const int num);

		/****** Interface_STAT::Where ******/
		/****** md5 signature: 70b8d94c45fae1df7f15a853e5297353 ******/
		%feature("compactdefaultargs") Where;
		%feature("autodoc", "
Parameters
----------
phase: bool (optional, default to true)

Return
-------
char *

Description
-----------
Returns an identification of the STAT: <phase> True (D): the name of the current phase <phase> False: the title of the current STAT.
") Where;
		static const char * Where(const bool phase = true);

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
		/****** md5 signature: 8567a553686c634827548c7f6818b6b2 ******/
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
		bool IsShared(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: fe443a1190b192943b5fddf45586a22a ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of root entities.
") NbRoots;
		int NbRoots();

		/****** Interface_ShareFlags::Root ******/
		/****** md5 signature: 55453aa4b675290999bc70dc8adb29ce ******/
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
		opencascade::handle<Standard_Transient> Root(const int num = 1);

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
		/****** md5 signature: f3e02602c407729a2491244e3faf6ada ******/
		%feature("compactdefaultargs") All;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
rootlast: bool (optional, default to true)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the complete list of entities shared by <ent> at any level, including <ent> itself If <ent> is the Model, considers the concatenation of AllShared for each root If <rootlast> is True (D), the list starts with lower level entities and ends by the root. Else, the root is first and the lower level entities are at end.
") All;
		Interface_EntityIterator All(const opencascade::handle<Standard_Transient> & ent, const bool rootlast = true);

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
		/****** md5 signature: 8567a553686c634827548c7f6818b6b2 ******/
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
		bool IsShared(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 965819ab889492a89a91289d33c7371f ******/
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
		int NbTypedSharings(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Type> & atype);

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
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns 'Entity Label'.
") Name;
		const char * Name();

		/****** Interface_SignLabel::Text ******/
		/****** md5 signature: 21e12f81b51627ac85fd4ba2c3857126 ******/
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
		/****** md5 signature: 607915d61536b7465f26c4dfcb5ff64b ******/
		%feature("compactdefaultargs") ClassName;
		%feature("autodoc", "
Parameters
----------
typnam: char *

Return
-------
char *

Description
-----------
From a CDL Type Name, returns the Class part (package dropped) WARNING: buffered, to be immediately copied or printed.
") ClassName;
		static const char * ClassName(const char * const typnam);

		/****** Interface_SignType::Text ******/
		/****** md5 signature: 21e12f81b51627ac85fd4ba2c3857126 ******/
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
		/****** md5 signature: 97c49646cdf512826370482240e4d255 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
char *

Description
-----------
Returns the Signature for a Transient object. It is specific of each sub-class of Signature. For a Null Handle, it should provide '' It can work with the model which contains the entity.
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
		/****** Interface_TypedValue::Interface_TypedValue ******/
		/****** md5 signature: 3b847289144e93d7ec686bbe4d5d4fbe ******/
		%feature("compactdefaultargs") Interface_TypedValue;
		%feature("autodoc", "
Parameters
----------
name: char *
type: Interface_ParamType (optional, default to Interface_ParamText)
init: char * (optional, default to "")

Return
-------
None

Description
-----------
Creates a TypedValue, with a name //! type gives the type of the parameter, default is free text Also available: Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the TypedValue once created //! init gives an initial value. If it is not given, the TypedValue begins as 'not set', its value is empty.
") Interface_TypedValue;
		 Interface_TypedValue(const char * const name, const Interface_ParamType type = Interface_ParamText, const char * const init = "");

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
		/****** md5 signature: 54d50dbb8acda69f9f7f32ee35bba080 ******/
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
		bool IsParamEntity(const int num);

		/****** Interface_UndefinedContent::NbLiterals ******/
		/****** md5 signature: 512782e707ff3861e1f8e5f594209c83 ******/
		%feature("compactdefaultargs") NbLiterals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives count of Literal Parameters.
") NbLiterals;
		int NbLiterals();

		/****** Interface_UndefinedContent::NbParams ******/
		/****** md5 signature: 3d5942837081abb877dd0a91d1f0a57f ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives count of recorded parameters.
") NbParams;
		int NbParams();

		/****** Interface_UndefinedContent::ParamData ******/
		/****** md5 signature: 35dad88207bc5fbe39418b274b5eeef3 ******/
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
		bool ParamData(const int num, Interface_ParamType &OutValue, opencascade::handle<Standard_Transient> & ent, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** Interface_UndefinedContent::ParamEntity ******/
		/****** md5 signature: b5578d34e328c1ba10e8d5c6b2970899 ******/
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
		opencascade::handle<Standard_Transient> ParamEntity(const int num);

		/****** Interface_UndefinedContent::ParamType ******/
		/****** md5 signature: 561418a28e8f194c5a0ff3ab3fec26a2 ******/
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
		Interface_ParamType ParamType(const int num);

		/****** Interface_UndefinedContent::ParamValue ******/
		/****** md5 signature: a2d933f421389542d0a4e1715ec08e45 ******/
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
		opencascade::handle<TCollection_HAsciiString> ParamValue(const int num);

		/****** Interface_UndefinedContent::RemoveParam ******/
		/****** md5 signature: 3101b10df97460463eb25e84af1ae046 ******/
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
		void RemoveParam(const int num);

		/****** Interface_UndefinedContent::Reservate ******/
		/****** md5 signature: 5b840d7e0aefb8a4065a2587a19f77ea ******/
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
		void Reservate(const int nb, const int nblit);

		/****** Interface_UndefinedContent::SetEntity ******/
		/****** md5 signature: 3653fce521796b99bf251c0f66eff2e0 ******/
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
		void SetEntity(const int num, const Interface_ParamType ptype, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_UndefinedContent::SetEntity ******/
		/****** md5 signature: 43300e6de20d45f5ba9e3331374d5fcb ******/
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
		void SetEntity(const int num, const opencascade::handle<Standard_Transient> & ent);

		/****** Interface_UndefinedContent::SetLiteral ******/
		/****** md5 signature: 44a9917fb6414113a49af7c9a5bfdf70 ******/
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
		void SetLiteral(const int num, const Interface_ParamType ptype, const opencascade::handle<TCollection_HAsciiString> & val);

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
		/****** md5 signature: a1b4cf84f5e5451ae7dcd1223435e008 ******/
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
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
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
		/****** md5 signature: ca0aec9ac4ea57648c87c8205d74816f ******/
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
		bool Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

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
		/****** md5 signature: 839ee37dde6e50822493151c4d334f56 ******/
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
		 Interface_GraphContent(const Interface_Graph & agraph, const int stat);

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
		/****** md5 signature: b6d85ca13163a90f1e450c47f810f25b ******/
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
		void GetFromGraph(const Interface_Graph & agraph, const int stat);

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
		/****** md5 signature: 3d9c4400aba452895fae1cae90b74db6 ******/
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "
Parameters
----------
family: char *
name: char *
type: Interface_ParamType (optional, default to Interface_ParamText)
init: char * (optional, default to "")

Return
-------
None

Description
-----------
Creates and records a Static, with a family and a name family can report to a name of resource or to a system or internal definition. The name must be unique. //! type gives the type of the parameter, default is free text Also available: Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the Static once created //! init gives an initial value. If it is not given, the Static begin as 'not set', its value is empty.
") Interface_Static;
		 Interface_Static(const char * const family, const char * const name, const Interface_ParamType type = Interface_ParamText, const char * const init = "");

		/****** Interface_Static::Interface_Static ******/
		/****** md5 signature: 3c350843e8bf8f55bf822518269d480e ******/
		%feature("compactdefaultargs") Interface_Static;
		%feature("autodoc", "
Parameters
----------
family: char *
name: char *
other: Interface_Static

Return
-------
None

Description
-----------
Creates a new Static with same definition as another one (value is copied, except for Entity: it remains null).
") Interface_Static;
		 Interface_Static(const char * const family, const char * const name, const opencascade::handle<Interface_Static> & other);

		/****** Interface_Static::CDef ******/
		/****** md5 signature: 44f208a004da08b36ef16ce2767fa4bd ******/
		%feature("compactdefaultargs") CDef;
		%feature("autodoc", "
Parameters
----------
name: char *
part: char *

Return
-------
char *

Description
-----------
Returns a part of the definition of a Static, as a CString The part is designated by its name, as a CString If the required value is not a string, it is converted to a CString then returned If <name> is not present, or <part> not defined for <name>, this function returns an empty string //! Allowed parts for CDef: family: the family type: the type ('integer','real','text','enum') label: the label satis: satisfy function name if any rmin: minimum real value rmax: maximum real value imin: minimum integer value imax: maximum integer value enum nn (nn: value of an integer): enum value for nn unit: unit definition for a real.
") CDef;
		static const char * CDef(const char * const name, const char * const part);

		/****** Interface_Static::CVal ******/
		/****** md5 signature: 9b699426f9ba0269c5e06fc3976bda7f ******/
		%feature("compactdefaultargs") CVal;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
char *

Description
-----------
Returns the value of the parameter identified by the string name. If the specified parameter does not exist, an empty string is returned. Example Interface_Static::CVal('write.step.schema'); which could return: 'AP214'.
") CVal;
		static const char * CVal(const char * const name);

		/****** Interface_Static::Family ******/
		/****** md5 signature: 6f4582531507329f99b69d30b2ea6454 ******/
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the family. It can be: a resource name for applis, an internal name between: $e (environment variables), $l (other, purely local).
") Family;
		const char * Family();

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
		/****** md5 signature: e5095730d16cf324081eb8f7271b2889 ******/
		%feature("compactdefaultargs") IDef;
		%feature("autodoc", "
Parameters
----------
name: char *
part: char *

Return
-------
int

Description
-----------
Returns a part of the definition of a Static, as an Integer The part is designated by its name, as a CString If the required value is not a string, returns zero For a Boolean, 0 for false, 1 for true If <name> is not present, or <part> not defined for <name>, this function returns zero //! Allowed parts for IDef: imin, imax: minimum or maximum integer value estart: starting number for enum ecount: count of enum values (starting from estart) ematch: exact match status eval val: case determined from a string.
") IDef;
		static int IDef(const char * const name, const char * const part);

		/****** Interface_Static::IVal ******/
		/****** md5 signature: efaca6c70798490f5dc13e9449561c7b ******/
		%feature("compactdefaultargs") IVal;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
int

Description
-----------
Returns the integer value of the translation parameter identified by the string name. Returns the value 0 if the parameter does not exist. Example Interface_Static::IVal('write.step.schema'); which could return: 3.
") IVal;
		static int IVal(const char * const name);

		/****** Interface_Static::Init ******/
		/****** md5 signature: 3a96a25a2b9380f65db98204c43aa7a5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
family: char *
name: char *
type: Interface_ParamType
init: char * (optional, default to "")

Return
-------
bool

Description
-----------
Declares a new Static (by calling its constructor) If this name is already taken, does nothing and returns False Else, creates it and returns True For additional definitions, get the Static then edit it.
") Init;
		static bool Init(const char * const family, const char * const name, const Interface_ParamType type, const char * const init = "");

		/****** Interface_Static::Init ******/
		/****** md5 signature: c1f5308ab46c9ac2a1615f6b314b6080 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
family: char *
name: char *
type: char
init: char * (optional, default to "")

Return
-------
bool

Description
-----------
As Init with ParamType, but type is given as a character This allows a simpler call Types: 'i' Integer, 'r' Real, 't' Text, 'e' Enum, 'o' Object '=' for same definition as, <init> gives the initial Static Returns False if <type> does not match this list.
") Init;
		static bool Init(const char * const family, const char * const name, const char type, const char * const init = "");

		/****** Interface_Static::IsPresent ******/
		/****** md5 signature: 8898261860cc5741b1a68875f21ad362 ******/
		%feature("compactdefaultargs") IsPresent;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Returns True if a Static named <name> is present, False else.
") IsPresent;
		static bool IsPresent(const char * const name);

		/****** Interface_Static::IsSet ******/
		/****** md5 signature: 522e0d6cdad88e8d22e2d2f8addd1d2d ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
name: char *
proper: bool (optional, default to true)

Return
-------
bool

Description
-----------
Returns True if <name> is present AND set <proper> True (D): considers this item only <proper> False: if not set and attached to a wild-card, considers this wild-card.
") IsSet;
		static bool IsSet(const char * const name, const bool proper = true);

		/****** Interface_Static::IsUpdated ******/
		/****** md5 signature: 32489df659a03207b74239684e3b71f8 ******/
		%feature("compactdefaultargs") IsUpdated;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Returns the status 'uptodate' from a Static Returns False if <name> is not present.
") IsUpdated;
		static bool IsUpdated(const char * const name);

		/****** Interface_Static::Items ******/
		/****** md5 signature: ee9b5eb0f2027af59e59e8f9047e9266 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "
Parameters
----------
mode: int (optional, default to 0)
criter: char * (optional, default to "")

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns a list of names of statics: <mode> = 0 (D): criter is for family <mode> = 1: criter is regexp on names, takes final items (ignore wild cards) <mode> = 2: idem but take only wilded, not final items <mode> = 3: idem, take all items matching criter idem + 100: takes only non-updated items idem + 200: takes only updated items criter empty (D): returns all names else returns names which match the given criter Remark: families beginning by '$' are not listed by criter '' they are listed only by criter '$' //! This allows for instance to set new values after having loaded or reloaded a resource, then to update them as required.
") Items;
		static opencascade::handle<TColStd_HSequenceOfHAsciiString> Items(const int mode = 0, const char * const criter = "");

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
		/****** md5 signature: 4ace5c326e5b9d739f8fef2b9f0a0917 ******/
		%feature("compactdefaultargs") RVal;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
double

Description
-----------
Returns the value of a static translation parameter identified by the string name. Returns the value 0.0 if the parameter does not exist.
") RVal;
		static double RVal(const char * const name);

		/****** Interface_Static::SetCVal ******/
		/****** md5 signature: a84fbe2fda7c35e196cec443f2037704 ******/
		%feature("compactdefaultargs") SetCVal;
		%feature("autodoc", "
Parameters
----------
name: char *
val: char *

Return
-------
bool

Description
-----------
Modifies the value of the parameter identified by name. The modification is specified by the string val. false is returned if the parameter does not exist. Example Interface_Static::SetCVal ('write.step.schema','AP203') This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.
") SetCVal;
		static bool SetCVal(const char * const name, const char * const val);

		/****** Interface_Static::SetIVal ******/
		/****** md5 signature: 66a761b20fbe5e86300100924c9cd318 ******/
		%feature("compactdefaultargs") SetIVal;
		%feature("autodoc", "
Parameters
----------
name: char *
val: int

Return
-------
bool

Description
-----------
Modifies the value of the parameter identified by name. The modification is specified by the integer value val. false is returned if the parameter does not exist. Example Interface_Static::SetIVal ('write.step.schema', 3) This syntax specifies a switch from the default STEP 214 mode to STEP 203 mode.S.
") SetIVal;
		static bool SetIVal(const char * const name, const int val);

		/****** Interface_Static::SetRVal ******/
		/****** md5 signature: 9c867bf0df0b190a0f5073f47b079aa1 ******/
		%feature("compactdefaultargs") SetRVal;
		%feature("autodoc", "
Parameters
----------
name: char *
val: double

Return
-------
bool

Description
-----------
Modifies the value of a translation parameter. false is returned if the parameter does not exist. The modification is specified by the real number value val.
") SetRVal;
		static bool SetRVal(const char * const name, const double val);

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
		/****** md5 signature: 554b7846d351f6725f8265d94a45ba07 ******/
		%feature("compactdefaultargs") Static;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
opencascade::handle<Interface_Static>

Description
-----------
Returns a Static from its name. Null Handle if not present.
") Static;
		static opencascade::handle<Interface_Static> Static(const char * const name);

		/****** Interface_Static::Update ******/
		/****** md5 signature: f82d6f4931df0cd0c55285be03f8095d ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Sets a Static to be 'uptodate' Returns False if <name> is not present This status can be used by a reinitialisation procedure to rerun if a value has been changed.
") Update;
		static bool Update(const char * const name);

		/****** Interface_Static::UpdatedStatus ******/
		/****** md5 signature: da3357fcc808f70a909c237b1c6139f6 ******/
		%feature("compactdefaultargs") UpdatedStatus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the status 'uptodate'.
") UpdatedStatus;
		bool UpdatedStatus();

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

class Interface_HArray1OfHAsciiString : public NCollection_Array1<opencascade::handle<TCollection_HAsciiString>>, public Standard_Transient {
  public:
    Interface_HArray1OfHAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper);
    Interface_HArray1OfHAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<TCollection_HAsciiString>>::value_type& theValue);
    Interface_HArray1OfHAsciiString(const NCollection_Array1<opencascade::handle<TCollection_HAsciiString>>& theOther);
    const NCollection_Array1<opencascade::handle<TCollection_HAsciiString>>& Array1();
    NCollection_Array1<opencascade::handle<TCollection_HAsciiString>>& ChangeArray1();
};
%make_alias(Interface_HArray1OfHAsciiString)

/* harray2 classes */
/* hsequence classes */
class Interface_HSequenceOfCheck : public NCollection_Sequence<opencascade::handle<Interface_Check>>, public Standard_Transient {
  public:
    Interface_HSequenceOfCheck();
    Interface_HSequenceOfCheck(const NCollection_Sequence<opencascade::handle<Interface_Check>>& theOther);
    const NCollection_Sequence<opencascade::handle<Interface_Check>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<Interface_Check>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<Interface_Check>>& theSequence);
    NCollection_Sequence<opencascade::handle<Interface_Check>>& ChangeSequence();
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
