/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define IFSELECTDOCSTRING
"IFSelect module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_ifselect.html"
%enddef
%module (package="OCC.Core", docstring=IFSELECTDOCSTRING) IFSelect


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
#include<IFSelect_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Interface.i
%import TColStd.i
%import TCollection.i
%import MoniTool.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IFSelect_EditValue {
	IFSelect_Optional = 0,
	IFSelect_Editable = 1,
	IFSelect_EditProtected = 2,
	IFSelect_EditComputed = 3,
	IFSelect_EditRead = 4,
	IFSelect_EditDynamic = 5,
};

enum IFSelect_PrintCount {
	IFSelect_ItemsByEntity = 0,
	IFSelect_CountByItem = 1,
	IFSelect_ShortByItem = 2,
	IFSelect_ListByItem = 3,
	IFSelect_EntitiesByItem = 4,
	IFSelect_CountSummary = 5,
	IFSelect_GeneralInfo = 6,
	IFSelect_Mapping = 7,
	IFSelect_ResultCount = 8,
};

enum IFSelect_PrintFail {
	IFSelect_FailOnly = 0,
	IFSelect_FailAndWarn = 1,
};

enum IFSelect_RemainMode {
	IFSelect_RemainForget = 0,
	IFSelect_RemainCompute = 1,
	IFSelect_RemainDisplay = 2,
	IFSelect_RemainUndo = 3,
};

enum IFSelect_ReturnStatus {
	IFSelect_RetVoid = 0,
	IFSelect_RetDone = 1,
	IFSelect_RetError = 2,
	IFSelect_RetFail = 3,
	IFSelect_RetStop = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IFSelect_EditValue(IntEnum):
	IFSelect_Optional = 0
	IFSelect_Editable = 1
	IFSelect_EditProtected = 2
	IFSelect_EditComputed = 3
	IFSelect_EditRead = 4
	IFSelect_EditDynamic = 5
IFSelect_Optional = IFSelect_EditValue.IFSelect_Optional
IFSelect_Editable = IFSelect_EditValue.IFSelect_Editable
IFSelect_EditProtected = IFSelect_EditValue.IFSelect_EditProtected
IFSelect_EditComputed = IFSelect_EditValue.IFSelect_EditComputed
IFSelect_EditRead = IFSelect_EditValue.IFSelect_EditRead
IFSelect_EditDynamic = IFSelect_EditValue.IFSelect_EditDynamic

class IFSelect_PrintCount(IntEnum):
	IFSelect_ItemsByEntity = 0
	IFSelect_CountByItem = 1
	IFSelect_ShortByItem = 2
	IFSelect_ListByItem = 3
	IFSelect_EntitiesByItem = 4
	IFSelect_CountSummary = 5
	IFSelect_GeneralInfo = 6
	IFSelect_Mapping = 7
	IFSelect_ResultCount = 8
IFSelect_ItemsByEntity = IFSelect_PrintCount.IFSelect_ItemsByEntity
IFSelect_CountByItem = IFSelect_PrintCount.IFSelect_CountByItem
IFSelect_ShortByItem = IFSelect_PrintCount.IFSelect_ShortByItem
IFSelect_ListByItem = IFSelect_PrintCount.IFSelect_ListByItem
IFSelect_EntitiesByItem = IFSelect_PrintCount.IFSelect_EntitiesByItem
IFSelect_CountSummary = IFSelect_PrintCount.IFSelect_CountSummary
IFSelect_GeneralInfo = IFSelect_PrintCount.IFSelect_GeneralInfo
IFSelect_Mapping = IFSelect_PrintCount.IFSelect_Mapping
IFSelect_ResultCount = IFSelect_PrintCount.IFSelect_ResultCount

class IFSelect_PrintFail(IntEnum):
	IFSelect_FailOnly = 0
	IFSelect_FailAndWarn = 1
IFSelect_FailOnly = IFSelect_PrintFail.IFSelect_FailOnly
IFSelect_FailAndWarn = IFSelect_PrintFail.IFSelect_FailAndWarn

class IFSelect_RemainMode(IntEnum):
	IFSelect_RemainForget = 0
	IFSelect_RemainCompute = 1
	IFSelect_RemainDisplay = 2
	IFSelect_RemainUndo = 3
IFSelect_RemainForget = IFSelect_RemainMode.IFSelect_RemainForget
IFSelect_RemainCompute = IFSelect_RemainMode.IFSelect_RemainCompute
IFSelect_RemainDisplay = IFSelect_RemainMode.IFSelect_RemainDisplay
IFSelect_RemainUndo = IFSelect_RemainMode.IFSelect_RemainUndo

class IFSelect_ReturnStatus(IntEnum):
	IFSelect_RetVoid = 0
	IFSelect_RetDone = 1
	IFSelect_RetError = 2
	IFSelect_RetFail = 3
	IFSelect_RetStop = 4
IFSelect_RetVoid = IFSelect_ReturnStatus.IFSelect_RetVoid
IFSelect_RetDone = IFSelect_ReturnStatus.IFSelect_RetDone
IFSelect_RetError = IFSelect_ReturnStatus.IFSelect_RetError
IFSelect_RetFail = IFSelect_ReturnStatus.IFSelect_RetFail
IFSelect_RetStop = IFSelect_ReturnStatus.IFSelect_RetStop
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IFSelect_Activator)
%wrap_handle(IFSelect_AppliedModifiers)
%wrap_handle(IFSelect_Dispatch)
%wrap_handle(IFSelect_EditForm)
%wrap_handle(IFSelect_Editor)
%wrap_handle(IFSelect_GeneralModifier)
%wrap_handle(IFSelect_IntParam)
%wrap_handle(IFSelect_ListEditor)
%wrap_handle(IFSelect_ModelCopier)
%wrap_handle(IFSelect_PacketList)
%wrap_handle(IFSelect_Selection)
%wrap_handle(IFSelect_SessionDumper)
%wrap_handle(IFSelect_ShareOut)
%wrap_handle(IFSelect_Signature)
%wrap_handle(IFSelect_SignatureList)
%wrap_handle(IFSelect_Transformer)
%wrap_handle(IFSelect_WorkLibrary)
%wrap_handle(IFSelect_WorkSession)
%wrap_handle(IFSelect_Act)
%wrap_handle(IFSelect_BasicDumper)
%wrap_handle(IFSelect_CheckCounter)
%wrap_handle(IFSelect_DispGlobal)
%wrap_handle(IFSelect_DispPerCount)
%wrap_handle(IFSelect_DispPerFiles)
%wrap_handle(IFSelect_DispPerOne)
%wrap_handle(IFSelect_DispPerSignature)
%wrap_handle(IFSelect_Modifier)
%wrap_handle(IFSelect_ParamEditor)
%wrap_handle(IFSelect_SelectBase)
%wrap_handle(IFSelect_SelectCombine)
%wrap_handle(IFSelect_SelectControl)
%wrap_handle(IFSelect_SelectDeduct)
%wrap_handle(IFSelect_SessionPilot)
%wrap_handle(IFSelect_SignCategory)
%wrap_handle(IFSelect_SignCounter)
%wrap_handle(IFSelect_SignMultiple)
%wrap_handle(IFSelect_SignType)
%wrap_handle(IFSelect_SignValidity)
%wrap_handle(IFSelect_TransformStandard)
%wrap_handle(IFSelect_GraphCounter)
%wrap_handle(IFSelect_ModifEditForm)
%wrap_handle(IFSelect_ModifReorder)
%wrap_handle(IFSelect_SelectAnyList)
%wrap_handle(IFSelect_SelectDiff)
%wrap_handle(IFSelect_SelectEntityNumber)
%wrap_handle(IFSelect_SelectExplore)
%wrap_handle(IFSelect_SelectExtract)
%wrap_handle(IFSelect_SelectIntersection)
%wrap_handle(IFSelect_SelectModelEntities)
%wrap_handle(IFSelect_SelectModelRoots)
%wrap_handle(IFSelect_SelectPointed)
%wrap_handle(IFSelect_SelectShared)
%wrap_handle(IFSelect_SelectSharing)
%wrap_handle(IFSelect_SelectSuite)
%wrap_handle(IFSelect_SelectUnion)
%wrap_handle(IFSelect_SignAncestor)
%wrap_handle(IFSelect_SelectAnyType)
%wrap_handle(IFSelect_SelectErrorEntities)
%wrap_handle(IFSelect_SelectFlag)
%wrap_handle(IFSelect_SelectInList)
%wrap_handle(IFSelect_SelectRange)
%wrap_handle(IFSelect_SelectRootComps)
%wrap_handle(IFSelect_SelectRoots)
%wrap_handle(IFSelect_SelectSent)
%wrap_handle(IFSelect_SelectSignature)
%wrap_handle(IFSelect_SelectSignedShared)
%wrap_handle(IFSelect_SelectSignedSharing)
%wrap_handle(IFSelect_SelectUnknownEntities)
%wrap_handle(IFSelect_SelectIncorrectEntities)
%wrap_handle(IFSelect_SelectType)
%wrap_handle(IFSelect_HSeqOfSelection)
/* end handles declaration */

/* templates */
%template(IFSelect_SequenceOfAppliedModifiers) NCollection_Sequence<opencascade::handle<IFSelect_AppliedModifiers>>;

%extend NCollection_Sequence<opencascade::handle<IFSelect_AppliedModifiers>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IFSelect_SequenceOfGeneralModifier) NCollection_Sequence<opencascade::handle<IFSelect_GeneralModifier>>;

%extend NCollection_Sequence<opencascade::handle<IFSelect_GeneralModifier>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IFSelect_SequenceOfInterfaceModel) NCollection_Sequence<opencascade::handle<Interface_InterfaceModel>>;

%extend NCollection_Sequence<opencascade::handle<Interface_InterfaceModel>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IFSelect_TSeqOfDispatch) NCollection_Sequence<opencascade::handle<IFSelect_Dispatch>>;

%extend NCollection_Sequence<opencascade::handle<IFSelect_Dispatch>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IFSelect_TSeqOfSelection) NCollection_Sequence<opencascade::handle<IFSelect_Selection>>;

%extend NCollection_Sequence<opencascade::handle<IFSelect_Selection>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<IFSelect_AppliedModifiers>> IFSelect_SequenceOfAppliedModifiers;
typedef NCollection_Sequence<opencascade::handle<IFSelect_GeneralModifier>> IFSelect_SequenceOfGeneralModifier;
typedef NCollection_Sequence<opencascade::handle<Interface_InterfaceModel>> IFSelect_SequenceOfInterfaceModel;
typedef NCollection_Sequence<opencascade::handle<IFSelect_Dispatch>> IFSelect_TSeqOfDispatch;
typedef NCollection_Sequence<opencascade::handle<IFSelect_Selection>> IFSelect_TSeqOfSelection;
/* end typedefs declaration */

/*****************
* class IFSelect *
*****************/
%rename(ifselect) IFSelect;
class IFSelect {
	public:
		/****** IFSelect::RestoreSession ******/
		/****** md5 signature: ba8f6fe89afc1197894d3a2b08a62d42 ******/
		%feature("compactdefaultargs") RestoreSession;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession
file: str

Return
-------
bool

Description
-----------
Restore the state of a WorkSession from IFSelect, by using a SessionFile from IFSelect. Returns True if Done, False in case of Error on Writing. <file> gives the name of the File to be used (this avoids to export the class SessionFile).
") RestoreSession;
		static Standard_Boolean RestoreSession(const opencascade::handle<IFSelect_WorkSession> & WS, Standard_CString file);

		/****** IFSelect::SaveSession ******/
		/****** md5 signature: 70b61c20336eaa5196544d5cc6374f24 ******/
		%feature("compactdefaultargs") SaveSession;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession
file: str

Return
-------
bool

Description
-----------
Saves the state of a WorkSession from IFSelect, by using a SessionFile from IFSelect. Returns True if Done, False in case of Error on Writing. <file> gives the name of the File to be produced (this avoids to export the class SessionFile).
") SaveSession;
		static Standard_Boolean SaveSession(const opencascade::handle<IFSelect_WorkSession> & WS, Standard_CString file);

};


%extend IFSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IFSelect_Activator *
***************************/
%nodefaultctor IFSelect_Activator;
class IFSelect_Activator : public Standard_Transient {
	public:
		/****** IFSelect_Activator::Add ******/
		/****** md5 signature: a37363cdbf22b729575e5e234d977317 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
number: int
command: str

Return
-------
None

Description
-----------
Allows a self-definition by an Activator of the Commands it processes, call the class method Adding (mode 0).
") Add;
		void Add(const Standard_Integer number, Standard_CString command);

		/****** IFSelect_Activator::AddSet ******/
		/****** md5 signature: 595aba69625ded0c77aa82a56fd1216b ******/
		%feature("compactdefaultargs") AddSet;
		%feature("autodoc", "
Parameters
----------
number: int
command: str

Return
-------
None

Description
-----------
Same as Add but specifies that this command is candidate for xset (creation of items, xset: named items; mode 1).
") AddSet;
		void AddSet(const Standard_Integer number, Standard_CString command);

		/****** IFSelect_Activator::Adding ******/
		/****** md5 signature: 0a5b580e999c19c508a9b0bd5aa30436 ******/
		%feature("compactdefaultargs") Adding;
		%feature("autodoc", "
Parameters
----------
actor: IFSelect_Activator
number: int
command: str
mode: int

Return
-------
None

Description
-----------
Records, in a Dictionary available for all the Activators, the command title an Activator can process, attached with its number, proper for this Activator <mode> allows to distinguish various execution modes 0: default mode; 1: for xset.
") Adding;
		static void Adding(const opencascade::handle<IFSelect_Activator> & actor, const Standard_Integer number, Standard_CString command, const Standard_Integer mode);

		/****** IFSelect_Activator::Commands ******/
		/****** md5 signature: b84e2057293dd094c9908245b9306ac7 ******/
		%feature("compactdefaultargs") Commands;
		%feature("autodoc", "
Parameters
----------
mode: int (optional, default to -1)
command: str (optional, default to "")

Return
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>

Description
-----------
Returns, for a root of command title, the list of possible commands. <mode>: -1 (D) for all commands if <commands> is empty -1 + command: about a Group , >= 0 see Adding By default, it returns the whole list of known commands.
") Commands;
		static opencascade::handle<TColStd_HSequenceOfAsciiString> Commands(const Standard_Integer mode = -1, Standard_CString command = "");

		/****** IFSelect_Activator::Do ******/
		/****** md5 signature: ae99aa557642f0954662530c8a03e1a8 ******/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "
Parameters
----------
number: int
pilot: IFSelect_SessionPilot

Return
-------
IFSelect_ReturnStatus

Description
-----------
Tries to execute a Command Line. <number> is the number of the command for this Activator. It Must forecast to record the result of the execution, for need of Undo-Redo Must Returns: 0 for a void command (not to be recorded), 1 if execution OK, -1 if command incorrect, -2 if error on execution.
") Do;
		virtual IFSelect_ReturnStatus Do(const Standard_Integer number, const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****** IFSelect_Activator::File ******/
		/****** md5 signature: 4e35c4fcb8fc2f63233a22d4edc201d8 ******/
		%feature("compactdefaultargs") File;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") File;
		Standard_CString File();

		/****** IFSelect_Activator::Group ******/
		/****** md5 signature: e32957ecce589ad0dcae427ef81835ac ******/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Group;
		Standard_CString Group();

		/****** IFSelect_Activator::Help ******/
		/****** md5 signature: 34063682d348e913be3a5562c588f29e ******/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "
Parameters
----------
number: int

Return
-------
str

Description
-----------
Sends a short help message for a given command identified by it number for this Activator (must take one line max).
") Help;
		virtual Standard_CString Help(const Standard_Integer number);

		/****** IFSelect_Activator::Mode ******/
		/****** md5 signature: 58c566204904e51650b70f3f1cb93410 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "
Parameters
----------
command: str

Return
-------
int

Description
-----------
Returns mode recorded for a command. -1 if not found.
") Mode;
		static Standard_Integer Mode(Standard_CString command);

		/****** IFSelect_Activator::Remove ******/
		/****** md5 signature: 343d3fe70309328d1e972e9673d8fc49 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
command: str

Return
-------
None

Description
-----------
Removes a Command, if it is recorded (else, does nothing).
") Remove;
		static void Remove(Standard_CString command);

		/****** IFSelect_Activator::Select ******/
		/****** md5 signature: 6c3045b0ee10861aacbb9f8f770536b8 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
command: str
actor: IFSelect_Activator

Return
-------
number: int

Description
-----------
Selects, for a Command given by its title, an actor with its command number. Returns True if found, False else.
") Select;
		static Standard_Boolean Select(Standard_CString command, Standard_Integer &OutValue, opencascade::handle<IFSelect_Activator> & actor);

		/****** IFSelect_Activator::SetForGroup ******/
		/****** md5 signature: 36a5432dee8a72a5a44ee28941e69ed0 ******/
		%feature("compactdefaultargs") SetForGroup;
		%feature("autodoc", "
Parameters
----------
group: str
file: str (optional, default to "")

Return
-------
None

Description
-----------
Group and SetGroup define a 'Group of commands' which correspond to an Activator. Default is 'XSTEP' Also a file may be attached.
") SetForGroup;
		void SetForGroup(Standard_CString group, Standard_CString file = "");

};


%make_alias(IFSelect_Activator)

%extend IFSelect_Activator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IFSelect_AppliedModifiers *
**********************************/
class IFSelect_AppliedModifiers : public Standard_Transient {
	public:
		/****** IFSelect_AppliedModifiers::IFSelect_AppliedModifiers ******/
		/****** md5 signature: 3033336284e6ada7c88014d40ddb6d58 ******/
		%feature("compactdefaultargs") IFSelect_AppliedModifiers;
		%feature("autodoc", "
Parameters
----------
nbmax: int
nbent: int

Return
-------
None

Description
-----------
Creates an AppliedModifiers, ready to record up to <nbmax> modifiers, on a model of <nbent> entities.
") IFSelect_AppliedModifiers;
		 IFSelect_AppliedModifiers(const Standard_Integer nbmax, const Standard_Integer nbent);

		/****** IFSelect_AppliedModifiers::AddModif ******/
		/****** md5 signature: 192c99c2dc886832c57adf8954b4c026 ******/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_GeneralModifier

Return
-------
bool

Description
-----------
Records a modifier. By default, it is to apply on all a produced file. Further calls to AddNum will restrict this. Returns True if done, False if too many modifiers are already recorded.
") AddModif;
		Standard_Boolean AddModif(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****** IFSelect_AppliedModifiers::AddNum ******/
		/****** md5 signature: 8393817679cc15a160c484acb729c688 ******/
		%feature("compactdefaultargs") AddNum;
		%feature("autodoc", "
Parameters
----------
nument: int

Return
-------
bool

Description
-----------
Adds a number of entity of the output file to be applied on. If a sequence of AddNum is called after AddModif, this Modifier will be applied on the list of designated entities. Else, it will be applied on all the file Returns True if done, False if no modifier has yet been added.
") AddNum;
		Standard_Boolean AddNum(const Standard_Integer nument);

		/****** IFSelect_AppliedModifiers::Count ******/
		/****** md5 signature: 991c7b8ad8fee748c77481e1ff97e534 ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded modifiers.
") Count;
		Standard_Integer Count();

		/****** IFSelect_AppliedModifiers::IsForAll ******/
		/****** md5 signature: 98f3b84618ad99b83c5b80e6998908b3 ******/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the applied modifier queried by last call to Item is to be applied to all the produced file. Else, <entcount> returned by Item gives the count of entity numbers, each one is queried by ItemNum.
") IsForAll;
		Standard_Boolean IsForAll();

		/****** IFSelect_AppliedModifiers::Item ******/
		/****** md5 signature: ac2f44b34ba767c504005a21a442dd72 ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "
Parameters
----------
num: int
modif: IFSelect_GeneralModifier

Return
-------
entcount: int

Description
-----------
Returns the description for applied modifier n0 <num>: the modifier itself, and the count of entities to be applied on. If no specific list of number has been defined, returns the total count of entities of the file If this count is zero, then the modifier applies to all the file (see below). Else, the numbers are then queried by calls to ItemNum between 1 and <entcount> Returns True if OK, False if <num> is out of range.
") Item;
		Standard_Boolean Item(const Standard_Integer num, opencascade::handle<IFSelect_GeneralModifier> & modif, Standard_Integer &OutValue);

		/****** IFSelect_AppliedModifiers::ItemList ******/
		/****** md5 signature: 2603ed57e1609437c3534a3c49eada50 ******/
		%feature("compactdefaultargs") ItemList;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfInteger>

Description
-----------
Returns the list of entities to be applied on (see Item) as a HSequence (IsForAll produces the complete list of all the entity numbers of the file.
") ItemList;
		opencascade::handle<TColStd_HSequenceOfInteger> ItemList();

		/****** IFSelect_AppliedModifiers::ItemNum ******/
		/****** md5 signature: 786fe24e5592b2db2b8f750bebdc421e ******/
		%feature("compactdefaultargs") ItemNum;
		%feature("autodoc", "
Parameters
----------
nument: int

Return
-------
int

Description
-----------
Returns a numero of entity to be applied on, given its rank in the list. If no list is defined (i.e. for all the file), returns <nument> itself, to give all the entities of the file Returns 0 if <nument> out of range.
") ItemNum;
		Standard_Integer ItemNum(const Standard_Integer nument);

};


%make_alias(IFSelect_AppliedModifiers)

%extend IFSelect_AppliedModifiers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_ContextModif *
******************************/
class IFSelect_ContextModif {
	public:
		/****** IFSelect_ContextModif::IFSelect_ContextModif ******/
		/****** md5 signature: 13049cffb770bc46a5649297d27f5014 ******/
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "
Parameters
----------
graph: Interface_Graph
TC: Interface_CopyTool
filename: str (optional, default to "")

Return
-------
None

Description
-----------
Prepares a ContextModif with these information: - the graph established from original model (target passed directly to Modifier) - the CopyTool which detains the CopyControl, which maps starting (in original) and result (in target) entities - an optional file name (for file output) //! Such a ContextModif is considered to be applied on all transferred entities (no filter active).
") IFSelect_ContextModif;
		 IFSelect_ContextModif(const Interface_Graph & graph, const Interface_CopyTool & TC, Standard_CString filename = "");

		/****** IFSelect_ContextModif::IFSelect_ContextModif ******/
		/****** md5 signature: 39ea63f3302feedaeb379f8e82d5518e ******/
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "
Parameters
----------
graph: Interface_Graph
filename: str (optional, default to "")

Return
-------
None

Description
-----------
Prepares a ContextModif with these information: - the graph established from original model (target passed directly to Modifier) - an optional file name (for file output) Here, no CopyControl, hence all entities are considered equal as starting and result //! Such a ContextModif is considered to be applied on all transferred entities (no filter active).
") IFSelect_ContextModif;
		 IFSelect_ContextModif(const Interface_Graph & graph, Standard_CString filename = "");

		/****** IFSelect_ContextModif::AddCheck ******/
		/****** md5 signature: 8ef46b71a47a9a0c81f5f1e741392794 ******/
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "
Parameters
----------
check: Interface_Check

Return
-------
None

Description
-----------
Adds a Check to the CheckList. If it is empty, nothing is done If it concerns an Entity from the Original Model (by SetEntity) to which another Check is attached, it is merged to it. Else, it is added or merged as to GlobalCheck.
") AddCheck;
		void AddCheck(const opencascade::handle<Interface_Check> & check);

		/****** IFSelect_ContextModif::AddFail ******/
		/****** md5 signature: 9795f5c11159dce99f638412f8744dee ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a Fail Message for an Entity from the original Model If <start> is not an Entity from the original model (e.g. the model itself) this message is added to Global Check.
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, Standard_CString mess, Standard_CString orig = "");

		/****** IFSelect_ContextModif::AddWarning ******/
		/****** md5 signature: 988f49b1d5bd3bf018afd5790e28b086 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a Warning Message for an Entity from the original Model If <start> is not an Entity from the original model (e.g. the model itself) this message is added to Global Check.
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, Standard_CString mess, Standard_CString orig = "");

		/****** IFSelect_ContextModif::CCheck ******/
		/****** md5 signature: 55ff9fbcf9040c69f661ca071beab1f7 ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns a Check given an Entity number (in the original Model) by default a Global Check. Creates it the first time. It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...').
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const Standard_Integer num = 0);

		/****** IFSelect_ContextModif::CCheck ******/
		/****** md5 signature: 3575197c5883daf5cfc41f7742c2838f ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns a Check attached to an Entity from the original Model It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...').
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const opencascade::handle<Standard_Transient> & start);

		/****** IFSelect_ContextModif::CheckList ******/
		/****** md5 signature: 28097225c7dc1bd34c16a03b8c119653 ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns the complete CheckList.
") CheckList;
		Interface_CheckIterator CheckList();

		/****** IFSelect_ContextModif::Control ******/
		/****** md5 signature: 2b9c8e9c0d77e4d7c78d407ba1dab327 ******/
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_CopyControl>

Description
-----------
Returns the map for a direct use, if required.
") Control;
		opencascade::handle<Interface_CopyControl> Control();

		/****** IFSelect_ContextModif::FileName ******/
		/****** md5 signature: 85b6394bcac5e528aa5809d0c9e6d178 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns File Name (can be empty).
") FileName;
		Standard_CString FileName();

		/****** IFSelect_ContextModif::HasFileName ******/
		/****** md5 signature: 327ef4fb29052a83700cf9cd01e8f2bf ******/
		%feature("compactdefaultargs") HasFileName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a non empty file name has been defined.
") HasFileName;
		Standard_Boolean HasFileName();

		/****** IFSelect_ContextModif::IsForAll ******/
		/****** md5 signature: 98f3b84618ad99b83c5b80e6998908b3 ******/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if no filter is defined: a Modifier has to work on all entities of the resulting (target) model.
") IsForAll;
		Standard_Boolean IsForAll();

		/****** IFSelect_ContextModif::IsForNone ******/
		/****** md5 signature: c3594e7baf27992aae07c72265a48cbd ******/
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Select has determined that a Modifier may not be run (filter defined and empty).
") IsForNone;
		Standard_Boolean IsForNone();

		/****** IFSelect_ContextModif::IsSelected ******/
		/****** md5 signature: f0ab1d0bf73030d8c4999e2184b43299 ******/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if a starting item has been transferred and selected.
") IsSelected;
		Standard_Boolean IsSelected(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_ContextModif::IsTransferred ******/
		/****** md5 signature: 071f213cacb6e76714c0c64331fb6938 ******/
		%feature("compactdefaultargs") IsTransferred;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if a starting item has been transferred.
") IsTransferred;
		Standard_Boolean IsTransferred(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_ContextModif::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True until the iteration has finished.
") More;
		Standard_Boolean More();

		/****** IFSelect_ContextModif::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advances the iteration.
") Next;
		void Next();

		/****** IFSelect_ContextModif::OriginalGraph ******/
		/****** md5 signature: f8f354cd345a1b8cfc915fa6323c1dbe ******/
		%feature("compactdefaultargs") OriginalGraph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
Returns the original Graph (compared to OriginalModel, it gives more query capabilitites).
") OriginalGraph;
		const Interface_Graph & OriginalGraph();

		/****** IFSelect_ContextModif::OriginalModel ******/
		/****** md5 signature: 0f5f720eb2df5ad6362820c300f52ee2 ******/
		%feature("compactdefaultargs") OriginalModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the original model.
") OriginalModel;
		opencascade::handle<Interface_InterfaceModel> OriginalModel();

		/****** IFSelect_ContextModif::Protocol ******/
		/****** md5 signature: 1441632a4f2333f871a63bf366a58f3e ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol (Null if not set).
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****** IFSelect_ContextModif::Select ******/
		/****** md5 signature: b57dea76a9bb588a9af3d32be4a715b4 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
list: Interface_EntityIterator

Return
-------
None

Description
-----------
This method requires ContextModif to be applied with a filter. If a ModelModifier is defined with a Selection criterium, the result of this Selection is used as a filter: - if none of its items has been transferred, the modification does not apply at all - else, the Modifier can query for what entities were selected and what are their results - if this method is not called before working, the Modifier has to work on the whole Model.
") Select;
		void Select(Interface_EntityIterator & list);

		/****** IFSelect_ContextModif::SelectedCount ******/
		/****** md5 signature: 8bfc8689711529915f2f3f8736c2cf0f ******/
		%feature("compactdefaultargs") SelectedCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of selected and transferred items.
") SelectedCount;
		Standard_Integer SelectedCount();

		/****** IFSelect_ContextModif::SelectedOriginal ******/
		/****** md5 signature: 3cb87a34504bedb08859ceaadb99d916 ******/
		%feature("compactdefaultargs") SelectedOriginal;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of original selected items. See also the iteration.
") SelectedOriginal;
		Interface_EntityIterator SelectedOriginal();

		/****** IFSelect_ContextModif::SelectedResult ******/
		/****** md5 signature: 692d71ce80971c16a645960c9419bd38 ******/
		%feature("compactdefaultargs") SelectedResult;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of resulting counterparts of selected items. See also the iteration.
") SelectedResult;
		Interface_EntityIterator SelectedResult();

		/****** IFSelect_ContextModif::SetProtocol ******/
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
Allows to transmit a Protocol as part of a ContextModif.
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & proto);

		/****** IFSelect_ContextModif::Start ******/
		/****** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts an iteration on selected items. It takes into account IsForAll/IsForNone, by really iterating on all selected items.
") Start;
		void Start();

		/****** IFSelect_ContextModif::Trace ******/
		/****** md5 signature: e5fb36d2d871e060e7060b444733fa32 ******/
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "
Parameters
----------
mess: str (optional, default to "")

Return
-------
None

Description
-----------
Traces the modification of the current entity (see above, ValueOriginal and ValueResult) for default trace level >= 2. To be called on each individual entity really modified <mess> is an optional additional message.
") Trace;
		void Trace(Standard_CString mess = "");

		/****** IFSelect_ContextModif::TraceModifier ******/
		/****** md5 signature: 3edd0556fe765bd51e9d9fcb6c3184ca ******/
		%feature("compactdefaultargs") TraceModifier;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_GeneralModifier

Return
-------
None

Description
-----------
Traces the application of a Modifier. Works with default trace File and Level. Fills the trace if default trace level is at least 1. Traces the Modifier (its Label) and its Selection if there is one (its Label). To be called after Select (because status IsForAll is printed) Worths to trace a global modification. See also Trace below.
") TraceModifier;
		void TraceModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****** IFSelect_ContextModif::ValueOriginal ******/
		/****** md5 signature: 47ceead6c99c8edafc5c6701eedd9370 ******/
		%feature("compactdefaultargs") ValueOriginal;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the current selected item in the original model.
") ValueOriginal;
		opencascade::handle<Standard_Transient> ValueOriginal();

		/****** IFSelect_ContextModif::ValueResult ******/
		/****** md5 signature: 4a3be540e9027b7fe3bfbfd3c82d1d1c ******/
		%feature("compactdefaultargs") ValueResult;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the result counterpart of current selected item (in the target model).
") ValueResult;
		opencascade::handle<Standard_Transient> ValueResult();

};


%extend IFSelect_ContextModif {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Search(self):
		pass
	}
};

/******************************
* class IFSelect_ContextWrite *
******************************/
class IFSelect_ContextWrite {
	public:
		/****** IFSelect_ContextWrite::IFSelect_ContextWrite ******/
		/****** md5 signature: c0439c4f98b565fd22612328b32eb20a ******/
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
proto: Interface_Protocol
applieds: IFSelect_AppliedModifiers
filename: str

Return
-------
None

Description
-----------
Prepares a ContextWrite with these information: - the model which is to be written - the protocol to be used - the filename - an object AppliedModifiers to work. It gives a list of FileModifiers to be ran, and for each one it can give a restricted list of entities (in the model), else all the model is considered.
") IFSelect_ContextWrite;
		 IFSelect_ContextWrite(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & proto, const opencascade::handle<IFSelect_AppliedModifiers> & applieds, Standard_CString filename);

		/****** IFSelect_ContextWrite::IFSelect_ContextWrite ******/
		/****** md5 signature: d671952aa9c623950812c050cfeec7a6 ******/
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "
Parameters
----------
hgraph: Interface_HGraph
proto: Interface_Protocol
applieds: IFSelect_AppliedModifiers
filename: str

Return
-------
None

Description
-----------
Same as above but with an already computed Graph.
") IFSelect_ContextWrite;
		 IFSelect_ContextWrite(const opencascade::handle<Interface_HGraph> & hgraph, const opencascade::handle<Interface_Protocol> & proto, const opencascade::handle<IFSelect_AppliedModifiers> & applieds, Standard_CString filename);

		/****** IFSelect_ContextWrite::AddCheck ******/
		/****** md5 signature: 8ef46b71a47a9a0c81f5f1e741392794 ******/
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "
Parameters
----------
check: Interface_Check

Return
-------
None

Description
-----------
Adds a Check to the CheckList. If it is empty, nothing is done If it concerns an Entity from the Model (by SetEntity) to which another Check is attached, it is merged to it. Else, it is added or merged as to GlobalCheck.
") AddCheck;
		void AddCheck(const opencascade::handle<Interface_Check> & check);

		/****** IFSelect_ContextWrite::AddFail ******/
		/****** md5 signature: 9795f5c11159dce99f638412f8744dee ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a Fail Message for an Entity from the Model If <start> is not an Entity from the model (e.g. the model itself) this message is added to Global Check.
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, Standard_CString mess, Standard_CString orig = "");

		/****** IFSelect_ContextWrite::AddWarning ******/
		/****** md5 signature: 988f49b1d5bd3bf018afd5790e28b086 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a Warning Message for an Entity from the Model If <start> is not an Entity from the model (e.g. the model itself) this message is added to Global Check.
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, Standard_CString mess, Standard_CString orig = "");

		/****** IFSelect_ContextWrite::AppliedModifiers ******/
		/****** md5 signature: c907d59264aed84761d23bf1da073632 ******/
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_AppliedModifiers>

Description
-----------
Returns the object AppliedModifiers.
") AppliedModifiers;
		opencascade::handle<IFSelect_AppliedModifiers> AppliedModifiers();

		/****** IFSelect_ContextWrite::CCheck ******/
		/****** md5 signature: 55ff9fbcf9040c69f661ca071beab1f7 ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns a Check given an Entity number (in the Model) by default a Global Check. Creates it the first time. It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...').
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const Standard_Integer num = 0);

		/****** IFSelect_ContextWrite::CCheck ******/
		/****** md5 signature: 3575197c5883daf5cfc41f7742c2838f ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns a Check attached to an Entity from the Model It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...').
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const opencascade::handle<Standard_Transient> & start);

		/****** IFSelect_ContextWrite::CheckList ******/
		/****** md5 signature: 28097225c7dc1bd34c16a03b8c119653 ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns the complete CheckList.
") CheckList;
		Interface_CheckIterator CheckList();

		/****** IFSelect_ContextWrite::FileModifier ******/
		/****** md5 signature: 6fa6e9318614bf53558102ca91c117e0 ******/
		%feature("compactdefaultargs") FileModifier;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_GeneralModifier>

Description
-----------
Returns the currently active File Modifier. Cast to be done Null if not properly set: must be test IsNull after casting.
") FileModifier;
		opencascade::handle<IFSelect_GeneralModifier> FileModifier();

		/****** IFSelect_ContextWrite::FileName ******/
		/****** md5 signature: 85b6394bcac5e528aa5809d0c9e6d178 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the File Name.
") FileName;
		Standard_CString FileName();

		/****** IFSelect_ContextWrite::Graph ******/
		/****** md5 signature: 85b94047fc558166dc241ea6e5d26215 ******/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
Returns the Graph, either given when created, else created the first time it is queried.
") Graph;
		const Interface_Graph & Graph();

		/****** IFSelect_ContextWrite::IsForAll ******/
		/****** md5 signature: 98f3b84618ad99b83c5b80e6998908b3 ******/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current modifier is to be applied to the whole model. Else, a restricted list of selected entities is defined, it can be exploited by the File Modifier.
") IsForAll;
		Standard_Boolean IsForAll();

		/****** IFSelect_ContextWrite::IsForNone ******/
		/****** md5 signature: c3594e7baf27992aae07c72265a48cbd ******/
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if no modifier is currently set.
") IsForNone;
		Standard_Boolean IsForNone();

		/****** IFSelect_ContextWrite::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** IFSelect_ContextWrite::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True until the iteration has finished.
") More;
		Standard_Boolean More();

		/****** IFSelect_ContextWrite::NbEntities ******/
		/****** md5 signature: 533943455099343f106415a0a22e8ac9 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total count of selected entities.
") NbEntities;
		Standard_Integer NbEntities();

		/****** IFSelect_ContextWrite::NbModifiers ******/
		/****** md5 signature: b094909a30cd757bd379ce37050e4ed9 ******/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded File Modifiers.
") NbModifiers;
		Standard_Integer NbModifiers();

		/****** IFSelect_ContextWrite::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advances the iteration.
") Next;
		void Next();

		/****** IFSelect_ContextWrite::Protocol ******/
		/****** md5 signature: 1441632a4f2333f871a63bf366a58f3e ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol;.
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****** IFSelect_ContextWrite::SetModifier ******/
		/****** md5 signature: 103e7f766af274ddf92a4b6c27424f02 ******/
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "
Parameters
----------
numod: int

Return
-------
bool

Description
-----------
Sets active the File Modifier n0 <numod> Then, it prepares the list of entities to consider, if any Returns False if <numod> out of range.
") SetModifier;
		Standard_Boolean SetModifier(const Standard_Integer numod);

		/****** IFSelect_ContextWrite::Start ******/
		/****** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts an iteration on selected items. It takes into account IsForAll/IsForNone, by really iterating on all selected items.
") Start;
		void Start();

		/****** IFSelect_ContextWrite::Value ******/
		/****** md5 signature: 99e927c0bdc75bf7dd2bbf6e9fa17814 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the current selected entity in the model.
") Value;
		opencascade::handle<Standard_Transient> Value();

};


%extend IFSelect_ContextWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IFSelect_Dispatch *
**************************/
%nodefaultctor IFSelect_Dispatch;
class IFSelect_Dispatch : public Standard_Transient {
	public:
		/****** IFSelect_Dispatch::CanHaveRemainder ******/
		/****** md5 signature: 3eb90f24b23996a4774fa4d1685ddfc4 ******/
		%feature("compactdefaultargs") CanHaveRemainder;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Dispatch can have a Remainder, i.e. if its criterium can let entities apart. It is a potential answer, remainder can be empty at run-time even if answer is True. (to attach a RemainderFromDispatch Selection is not allowed if answer is True). Default answer given here is False (can be redefined).
") CanHaveRemainder;
		virtual Standard_Boolean CanHaveRemainder();

		/****** IFSelect_Dispatch::FinalSelection ******/
		/****** md5 signature: 2371e8738ba01e22b0a6a1ed2de0c102 ******/
		%feature("compactdefaultargs") FinalSelection;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the Final Selection of a Dispatch we 'd like: C++: return const &.
") FinalSelection;
		opencascade::handle<IFSelect_Selection> FinalSelection();

		/****** IFSelect_Dispatch::GetEntities ******/
		/****** md5 signature: 017dddaa2fe4e99c4138152c957ade41 ******/
		%feature("compactdefaultargs") GetEntities;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Gets Unique Root Entities from the Final Selection, given an input Graph This the starting step for an Evaluation (Packets - Remainder).
") GetEntities;
		Interface_EntityIterator GetEntities(const Interface_Graph & G);

		/****** IFSelect_Dispatch::HasRootName ******/
		/****** md5 signature: c5e6d2997e3f516b861ffede5033108e ******/
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a specific Root Name has been set (else, the Default Root Name has to be used).
") HasRootName;
		Standard_Boolean HasRootName();

		/****** IFSelect_Dispatch::Label ******/
		/****** md5 signature: 458d8d95170c9aa9c0a465eba36c0e6b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text which defines the way a Dispatch produces packets (which will become files) from its Input.
") Label;
		virtual TCollection_AsciiString Label();

		/****** IFSelect_Dispatch::LimitedMax ******/
		/****** md5 signature: 51a293bbd9b584c17e274e4eb8438671 ******/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "
Parameters
----------
nbent: int

Return
-------
max: int

Description
-----------
Returns True if a Dispatch generates a count of Packets always less than or equal to a maximum value: it can be computed from the total count of Entities to be dispatched: <nbent>. If answer is False, no limited maximum is expected for account If answer is True, expected maximum is given in argument <max> Default answer given here is False (can be redefined).
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****** IFSelect_Dispatch::Packeted ******/
		/****** md5 signature: 6974e266884cf58002fa4e0032c0d1c4 ******/
		%feature("compactdefaultargs") Packeted;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of all Input Entities (see GetEntities) which are put in a Packet. That is, Entities listed in GetEntities but not in Remainder (see below). Input is given as a Graph.
") Packeted;
		Interface_EntityIterator Packeted(const Interface_Graph & G);

		/****** IFSelect_Dispatch::Packets ******/
		/****** md5 signature: 5e703005769ade6f55ca0e2ad337faaa ******/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Return
-------
None

Description
-----------
Returns the list of produced Packets into argument <pack>. Each Packet corresponds to a Part, the Entities listed are the Roots given by the Selection. Input is given as a Graph. Thus, to create a file from a packet, it suffices to take the entities listed in a Part of Packets (that is, a Packet) without worrying about Shared entities This method can raise an Exception if data are not coherent.
") Packets;
		virtual void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****** IFSelect_Dispatch::Remainder ******/
		/****** md5 signature: d72cad876ed711608b821110502ac879 ******/
		%feature("compactdefaultargs") Remainder;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns Remainder which is a set of Entities. Can be empty. Default evaluation is empty (has to be redefined if CanHaveRemainder is redefined to return True).
") Remainder;
		virtual Interface_EntityIterator Remainder(const Interface_Graph & G);

		/****** IFSelect_Dispatch::RootName ******/
		/****** md5 signature: 9c441b5bb8ba048d49ab06f7d208829e ******/
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the Root Name for files produced by this dispatch It is empty if it has not been set or if it has been reset.
") RootName;
		const opencascade::handle<TCollection_HAsciiString> & RootName();

		/****** IFSelect_Dispatch::Selections ******/
		/****** md5 signature: a2b7e94b09786352236254b7b717a1e8 ******/
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "Return
-------
IFSelect_SelectionIterator

Description
-----------
Returns the complete list of source Selections (starting from FinalSelection).
") Selections;
		IFSelect_SelectionIterator Selections();

		/****** IFSelect_Dispatch::SetFinalSelection ******/
		/****** md5 signature: fe5e5746949d6a31f10b7c2ccfd54e09 ******/
		%feature("compactdefaultargs") SetFinalSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Stores (or Changes) the Final Selection for a Dispatch.
") SetFinalSelection;
		void SetFinalSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_Dispatch::SetRootName ******/
		/****** md5 signature: ff00a6c380f1cfe884516b3af5424066 ******/
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "
Parameters
----------
name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Sets a Root Name as an HAsciiString To reset it, give a Null Handle (then, a ShareOut will have to define the Default Root Name).
") SetRootName;
		void SetRootName(const opencascade::handle<TCollection_HAsciiString> & name);

};


%make_alias(IFSelect_Dispatch)

%extend IFSelect_Dispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IFSelect_EditForm *
**************************/
class IFSelect_EditForm : public Standard_Transient {
	public:
		/****** IFSelect_EditForm::IFSelect_EditForm ******/
		/****** md5 signature: 40a621463063c8b5aa01bb6c69e98deb ******/
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "
Parameters
----------
editor: IFSelect_Editor
readonly: bool
undoable: bool
label: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a complete EditForm from an Editor A specific Label can be given.
") IFSelect_EditForm;
		 IFSelect_EditForm(const opencascade::handle<IFSelect_Editor> & editor, const Standard_Boolean readonly, const Standard_Boolean undoable, Standard_CString label = "");

		/****** IFSelect_EditForm::IFSelect_EditForm ******/
		/****** md5 signature: 420707d31c5ea31799194612884ac53f ******/
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "
Parameters
----------
editor: IFSelect_Editor
nums: TColStd_SequenceOfInteger
readonly: bool
undoable: bool
label: str (optional, default to "")

Return
-------
None

Description
-----------
Creates an extracted EditForm from an Editor, limited to the values identified in <nums> A specific Label can be given.
") IFSelect_EditForm;
		 IFSelect_EditForm(const opencascade::handle<IFSelect_Editor> & editor, const TColStd_SequenceOfInteger & nums, const Standard_Boolean readonly, const Standard_Boolean undoable, Standard_CString label = "");

		/****** IFSelect_EditForm::Apply ******/
		/****** md5 signature: d13adb09606778db019693ec430295e5 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Applies modifications to own data Calls ApplyData then Clears Status according EditKeepStatus.
") Apply;
		Standard_Boolean Apply();

		/****** IFSelect_EditForm::ApplyData ******/
		/****** md5 signature: 80776704f26f37e3ba56e3af4c598bba ******/
		%feature("compactdefaultargs") ApplyData;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Applies modifications to data Default uses Editor. Can be redefined.
") ApplyData;
		virtual Standard_Boolean ApplyData(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_EditForm::ClearData ******/
		/****** md5 signature: e3da16f5fe71c5bd24e86f916af90d46 ******/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearData;
		void ClearData();

		/****** IFSelect_EditForm::ClearEdit ******/
		/****** md5 signature: 81d6f4aeb9df95db6f535fa76d3187f1 ******/
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
None

Description
-----------
Clears modification status: by default all, or one by its numbers (in the Editor).
") ClearEdit;
		void ClearEdit(const Standard_Integer num = 0);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetEditKeepStatus() {
            return (Standard_Boolean) $self->EditKeepStatus();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetEditKeepStatus(Standard_Boolean value) {
            $self->EditKeepStatus()=value;
            }
        };
		/****** IFSelect_EditForm::EditedList ******/
		/****** md5 signature: 87c127cf2797df7cd6b791e2734134ec ******/
		%feature("compactdefaultargs") EditedList;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the Edited Value as a list If IsModified is False, returns OriginalValue Null with IsModified True: means that this value is not defined or has been removed For a single parameter, gives a Null Handle.
") EditedList;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> EditedList(const Standard_Integer num);

		/****** IFSelect_EditForm::EditedValue ******/
		/****** md5 signature: fbee68682dce5af06f2116e0bda0730a ******/
		%feature("compactdefaultargs") EditedValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the Edited (i.e. Modified) Value (string for single) <num> reports to the EditForm If IsModified is False, returns OriginalValue Null with IsModified True: means that this value is not defined or has been removed It is for a single parameter. For a list, gives a Null Handle.
") EditedValue;
		opencascade::handle<TCollection_HAsciiString> EditedValue(const Standard_Integer num);

		/****** IFSelect_EditForm::Editor ******/
		/****** md5 signature: d75f1cfd49393b96e8a68758376c3f36 ******/
		%feature("compactdefaultargs") Editor;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Editor>

Description
-----------
No available documentation.
") Editor;
		opencascade::handle<IFSelect_Editor> Editor();

		/****** IFSelect_EditForm::Entity ******/
		/****** md5 signature: 123638bf3812913ca950510f1f2a16cb ******/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") Entity;
		opencascade::handle<Standard_Transient> Entity();

		/****** IFSelect_EditForm::IsComplete ******/
		/****** md5 signature: 412d1259abf22c70264ba7b2d0bea051 ******/
		%feature("compactdefaultargs") IsComplete;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if an EditForm is complete or is an extract from Editor.
") IsComplete;
		Standard_Boolean IsComplete();

		/****** IFSelect_EditForm::IsLoaded ******/
		/****** md5 signature: 5ed802f56c3a94dc70391badb380a6ed ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the EditForm is loaded now.
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****** IFSelect_EditForm::IsModified ******/
		/****** md5 signature: 4f4d3fd6642971e1c7fc73abfba221e7 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Tells if a Value (of the EditForm) is modified (directly or through touching by Update).
") IsModified;
		Standard_Boolean IsModified(const Standard_Integer num);

		/****** IFSelect_EditForm::IsTouched ******/
		/****** md5 signature: e146d70ff5d69b2b24ed24850431695f ******/
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Tells if a Value (of the EditForm) has been touched, i.e. not modified directly but by the modification of another one (by method Update from the Editor).
") IsTouched;
		Standard_Boolean IsTouched(const Standard_Integer num);

		/****** IFSelect_EditForm::Label ******/
		/****** md5 signature: a2cdaa2c189e4a121892e76566961d64 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Label;
		Standard_CString Label();

		/****** IFSelect_EditForm::ListEditor ******/
		/****** md5 signature: ee67a0dbece1ed74b18ddc8b3c6973a5 ******/
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_ListEditor>

Description
-----------
Returns a ListEditor to edit the parameter <num> of the EditForm, if it is a List The Editor created it (by ListEditor) then loads it (by ListValue) For a single parameter, returns a Null Handle ...
") ListEditor;
		opencascade::handle<IFSelect_ListEditor> ListEditor(const Standard_Integer num);

		/****** IFSelect_EditForm::LoadData ******/
		/****** md5 signature: 185202fc309fb4f48b0a9e4c6f4358ea ******/
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Loads modifications to data Default uses Editor. Can be redefined Remark that <ent> and/or <model> may be null, according to the kind of Editor. Shortcuts are available for these cases, but they finally call LoadData (hence, just ignore non-used args).
") LoadData;
		virtual Standard_Boolean LoadData(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_EditForm::LoadData ******/
		/****** md5 signature: fef1deaa08a75521b256f24be325fc96 ******/
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Shortcut when both <ent> and <model> are not used (when the Editor works on fully static or global data).
") LoadData;
		Standard_Boolean LoadData();

		/****** IFSelect_EditForm::LoadDefault ******/
		/****** md5 signature: a6a329f0bbe3beae1286ff68177a5e6c ******/
		%feature("compactdefaultargs") LoadDefault;
		%feature("autodoc", "Return
-------
None

Description
-----------
For a read-write undoable EditForm, loads original values from defaults stored in the Editor.
") LoadDefault;
		void LoadDefault();

		/****** IFSelect_EditForm::LoadEntity ******/
		/****** md5 signature: ad014f37b2fc0a0068f5744044f7a1e9 ******/
		%feature("compactdefaultargs") LoadEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Shortcut for LoadData when <model> is not used.
") LoadEntity;
		Standard_Boolean LoadEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_EditForm::LoadList ******/
		/****** md5 signature: f1a04766d4daa0d09f3ea54af7f0c452 ******/
		%feature("compactdefaultargs") LoadList;
		%feature("autodoc", "
Parameters
----------
num: int
list: TColStd_HSequenceOfHAsciiString

Return
-------
None

Description
-----------
Loads an original value as a list. Called by the Editor only.
") LoadList;
		void LoadList(const Standard_Integer num, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list);

		/****** IFSelect_EditForm::LoadModel ******/
		/****** md5 signature: 41efc6d72a4b4db3ee9dc387778059a4 ******/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Shortcut for LoadData when only the model is concerned.
") LoadModel;
		Standard_Boolean LoadModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_EditForm::LoadValue ******/
		/****** md5 signature: a88c73e8b40681c632deb9c95fa11783 ******/
		%feature("compactdefaultargs") LoadValue;
		%feature("autodoc", "
Parameters
----------
num: int
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
Loads an original value (single). Called by the Editor only.
") LoadValue;
		void LoadValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IFSelect_EditForm::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
No available documentation.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** IFSelect_EditForm::Modify ******/
		/****** md5 signature: 8975c8428989a04ad8a67db23a032af8 ******/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "
Parameters
----------
num: int
newval: TCollection_HAsciiString
enforce: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Gives a new value for the item <num> of the EditForm, if it is a single parameter (for a list, just returns False) Null means to Remove it <enforce> True to overpass Protected or Computed Access Mode Calls the method Update from the Editor, which can touch other parameters (see NbTouched) Returns True if well recorded, False if this value is not allowed Warning: Does not apply immediately: will be applied by the method Apply.
") Modify;
		Standard_Boolean Modify(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval, const Standard_Boolean enforce = Standard_False);

		/****** IFSelect_EditForm::ModifyList ******/
		/****** md5 signature: 506057e34eca718b697fd8098bfc75b6 ******/
		%feature("compactdefaultargs") ModifyList;
		%feature("autodoc", "
Parameters
----------
num: int
edited: IFSelect_ListEditor
enforce: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Changes the value of an item of the EditForm, if it is a List (else, just returns False) The ListEditor contains the edited values of the list If no edition was recorded, just returns False Calls the method Update from the Editor, which can touch other parameters (see NbTouched) Returns True if well recorded, False if this value is not allowed Warning: Does not apply immediately: will be applied by the method Apply.
") ModifyList;
		Standard_Boolean ModifyList(const Standard_Integer num, const opencascade::handle<IFSelect_ListEditor> & edited, const Standard_Boolean enforce = Standard_False);

		/****** IFSelect_EditForm::ModifyListValue ******/
		/****** md5 signature: 9c7cc68bd3ef36061c9cb2568f7a27c2 ******/
		%feature("compactdefaultargs") ModifyListValue;
		%feature("autodoc", "
Parameters
----------
num: int
list: TColStd_HSequenceOfHAsciiString
enforce: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
As ModifyList but the new value is given as such Creates a ListEditor, Loads it, then calls ModifyList.
") ModifyListValue;
		Standard_Boolean ModifyListValue(const Standard_Integer num, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list, const Standard_Boolean enforce = Standard_False);

		/****** IFSelect_EditForm::NameNumber ******/
		/****** md5 signature: 92cf82f3d39d60a7ec7147dab4cceeac ******/
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the Value Number in the Editor for a given Name i.e. the true ValueNumber which can be used in various methods of EditForm If it is not complete, for a recorded (in the Editor) but non-loaded name, returns negative value (- number).
") NameNumber;
		Standard_Integer NameNumber(Standard_CString name);

		/****** IFSelect_EditForm::NameRank ******/
		/****** md5 signature: 828b9618f5e765e1584b5988eaf154b1 ******/
		%feature("compactdefaultargs") NameRank;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the Rank of Value in the EditForm for a given Name i.e. if it is not complete, for a recorded (in the Editor) but non-loaded name, returns 0.
") NameRank;
		Standard_Integer NameRank(Standard_CString name);

		/****** IFSelect_EditForm::NbValues ******/
		/****** md5 signature: 688139b89cb2c7cce6d7bfb88eeb5856 ******/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "
Parameters
----------
editable: bool

Return
-------
int

Description
-----------
Returns the count of values <editable> True: count of editable values, i.e. For a complete EditForm, it is given by the Editor Else, it is the length of the extraction map <editable> False: all the values from the Editor.
") NbValues;
		Standard_Integer NbValues(const Standard_Boolean editable);

		/****** IFSelect_EditForm::NumberFromRank ******/
		/****** md5 signature: 6b8de5e1d194315ac81a68658a87e861 ******/
		%feature("compactdefaultargs") NumberFromRank;
		%feature("autodoc", "
Parameters
----------
rank: int

Return
-------
int

Description
-----------
Returns the Value Number in the Editor from a given Rank in the EditForm For a complete EditForm, both are equal Else, it is given by the extraction map Returns 0 if <rank> exceeds the count of editable values,.
") NumberFromRank;
		Standard_Integer NumberFromRank(const Standard_Integer rank);

		/****** IFSelect_EditForm::OriginalList ******/
		/****** md5 signature: 26c000ad9807376ec6e10787067cb185 ******/
		%feature("compactdefaultargs") OriginalList;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns an original value, as a list <num> is for the EditForm, not the Editor For a single parameter, gives a Null Handle.
") OriginalList;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> OriginalList(const Standard_Integer num);

		/****** IFSelect_EditForm::OriginalValue ******/
		/****** md5 signature: e4da13ba4e172e8775064ba22f723987 ******/
		%feature("compactdefaultargs") OriginalValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
From an edited value, returns its ... value (original one) Null means that this value is not defined <num> is for the EditForm, not the Editor It is for a single parameter. For a list, gives a Null Handle.
") OriginalValue;
		opencascade::handle<TCollection_HAsciiString> OriginalValue(const Standard_Integer num);

		/****** IFSelect_EditForm::PrintDefs ******/
		/****** md5 signature: 46629d4f069d37bd12c0384fcc538c0d ******/
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Prints Definitions, relative to the Editor.
") PrintDefs;
		void PrintDefs(std::ostream &OutValue);

		/****** IFSelect_EditForm::PrintValues ******/
		/****** md5 signature: 9580ee383589529b4c579a30e8eb8c2b ******/
		%feature("compactdefaultargs") PrintValues;
		%feature("autodoc", "
Parameters
----------
what: int
names: bool
alsolist: bool (optional, default to Standard_False)

Return
-------
S: Standard_OStream

Description
-----------
Prints Values, according to what and alsolist <names> True: prints Long Names; False: prints Short Names <what> < 0: prints Original Values (+ flag Modified) <what> > 0: prints Final Values (+flag Modified) <what> = 0: prints Modified Values (Original + Edited) <alsolist> False (D): lists are printed only as their count <alsolist> True: lists are printed for all their items.
") PrintValues;
		void PrintValues(std::ostream &OutValue, const Standard_Integer what, const Standard_Boolean names, const Standard_Boolean alsolist = Standard_False);

		/****** IFSelect_EditForm::RankFromNumber ******/
		/****** md5 signature: fe822a7d919e60ec0cdab5e6f2363afe ******/
		%feature("compactdefaultargs") RankFromNumber;
		%feature("autodoc", "
Parameters
----------
number: int

Return
-------
int

Description
-----------
Returns the Rank in the EditForm from a given Number of Value for the Editor For a complete EditForm, both are equal Else, it is given by the extraction map Returns 0 if <number> is not forecast to be edited, or is out of range.
") RankFromNumber;
		Standard_Integer RankFromNumber(const Standard_Integer number);

		/****** IFSelect_EditForm::Recognize ******/
		/****** md5 signature: a42ccbdcfc1d681fdb3856fec7d4c07f ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if this EditForm can work with its Editor and its actual Data (Entity and Model) Default uses Editor. Can be redefined.
") Recognize;
		virtual Standard_Boolean Recognize();

		/****** IFSelect_EditForm::SetData ******/
		/****** md5 signature: 5d992a09eae7af815b80314daa02025c ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
No available documentation.
") SetData;
		void SetData(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_EditForm::SetEntity ******/
		/****** md5 signature: 63ed9fdf9a70c3ce8c368dc7e14e8e94 ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_EditForm::SetModel ******/
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
No available documentation.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_EditForm::Touch ******/
		/****** md5 signature: c53aa1f2dd3503addffb8dea38968f69 ******/
		%feature("compactdefaultargs") Touch;
		%feature("autodoc", "
Parameters
----------
num: int
newval: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Gives a new value computed by the Editor, if another parameter commands the value of <num> It is generally the case for a Computed Parameter for instance Increments the counter of touched parameters Warning: it gives no protection for ReadOnly etc... while it is the internal way of touching parameters Does not work (returns False) if <num> is for a list.
") Touch;
		Standard_Boolean Touch(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval);

		/****** IFSelect_EditForm::TouchList ******/
		/****** md5 signature: a8236f5ca1f23bc0845d8b5f657bef7d ******/
		%feature("compactdefaultargs") TouchList;
		%feature("autodoc", "
Parameters
----------
num: int
newlist: TColStd_HSequenceOfHAsciiString

Return
-------
bool

Description
-----------
Acts as Touch but for a list Does not work (returns False) if <num> is for a single param.
") TouchList;
		Standard_Boolean TouchList(const Standard_Integer num, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & newlist);

		/****** IFSelect_EditForm::Undo ******/
		/****** md5 signature: 95113786d46edb519ce9957bac4f72f7 ******/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Return
-------
bool

Description
-----------
For an undoable EditForm, Applies ... origibal values ! and clears modified ones Can be run only once.
") Undo;
		Standard_Boolean Undo();

};


%make_alias(IFSelect_EditForm)

%extend IFSelect_EditForm {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def NbTouched(self):
		pass
	}
};

/************************
* class IFSelect_Editor *
************************/
%nodefaultctor IFSelect_Editor;
class IFSelect_Editor : public Standard_Transient {
	public:
		/****** IFSelect_Editor::Apply ******/
		/****** md5 signature: 562aef7326608985bb397d577d6e8193 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Applies modified values of the EditForm with some data Remark: <ent> may be Null, this means all <model> is concerned Also <model> may be Null, if no context applies for <ent> And both <ent> and <model> may be Null, for a full static editor.
") Apply;
		virtual Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_Editor::EditMode ******/
		/****** md5 signature: 63a8dcfe1ba562a3c95c2e8c1538ac3a ******/
		%feature("compactdefaultargs") EditMode;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
IFSelect_EditValue

Description
-----------
Returns the edit mode of a Value.
") EditMode;
		IFSelect_EditValue EditMode(const Standard_Integer num);

		/****** IFSelect_Editor::Form ******/
		/****** md5 signature: f62865990fd4180a79f7aff98ee5380c ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "
Parameters
----------
readonly: bool
undoable: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<IFSelect_EditForm>

Description
-----------
Builds and Returns an EditForm, empty (no data yet) Can be redefined to return a specific type of EditForm.
") Form;
		virtual opencascade::handle<IFSelect_EditForm> Form(const Standard_Boolean readonly, const Standard_Boolean undoable = Standard_True);

		/****** IFSelect_Editor::IsList ******/
		/****** md5 signature: 4a6c17030eb86afd03fc4984d7775cb8 ******/
		%feature("compactdefaultargs") IsList;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Tells if a parameter is a list.
") IsList;
		Standard_Boolean IsList(const Standard_Integer num);

		/****** IFSelect_Editor::Label ******/
		/****** md5 signature: 458d8d95170c9aa9c0a465eba36c0e6b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the specific label.
") Label;
		virtual TCollection_AsciiString Label();

		/****** IFSelect_Editor::ListEditor ******/
		/****** md5 signature: 546f401919efe39d6a07e60583f4e768 ******/
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_ListEditor>

Description
-----------
Returns a ListEditor for a parameter which is a List Default returns a basic ListEditor for a List, a Null Handle if <num> is not for a List. Can be redefined.
") ListEditor;
		virtual opencascade::handle<IFSelect_ListEditor> ListEditor(const Standard_Integer num);

		/****** IFSelect_Editor::ListValue ******/
		/****** md5 signature: f3a3b2c2aa085d25f262d0f070cdbf0d ******/
		%feature("compactdefaultargs") ListValue;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the value of an EditForm as a List, for a given item If not a list, a Null Handle should be returned Default returns a Null Handle, because many Editors have no list to edit. To be redefined as required.
") ListValue;
		virtual opencascade::handle<TColStd_HSequenceOfHAsciiString> ListValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

		/****** IFSelect_Editor::Load ******/
		/****** md5 signature: 42363bfdd05ef14277b05ce8fec9a6bd ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Loads original values from some data, to an EditForm Remark: <ent> may be Null, this means all <model> is concerned Also <model> may be Null, if no context applies for <ent> And both <ent> and <model> may be Null, for a full static editor.
") Load;
		virtual Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_Editor::MaxList ******/
		/****** md5 signature: 2f0c825d67cd56e6a62066f7646993cf ******/
		%feature("compactdefaultargs") MaxList;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns max length allowed for a list = 0 means: list with no limit < 0 means: not a list.
") MaxList;
		Standard_Integer MaxList(const Standard_Integer num);

		/****** IFSelect_Editor::MaxNameLength ******/
		/****** md5 signature: 62496141060828b6243b22e476c8b394 ******/
		%feature("compactdefaultargs") MaxNameLength;
		%feature("autodoc", "
Parameters
----------
what: int

Return
-------
int

Description
-----------
Returns the MaxLength of, according to what: <what> = -1: length of short names <what> = 0: length of complete names <what> = 1: length of values labels.
") MaxNameLength;
		Standard_Integer MaxNameLength(const Standard_Integer what);

		/****** IFSelect_Editor::Name ******/
		/****** md5 signature: ababa801fdf82705a2e0fcee35bcb44f ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
num: int
isshort: bool (optional, default to Standard_False)

Return
-------
str

Description
-----------
Returns the name of a Value (complete or short) from its ident Short Name can be empty.
") Name;
		Standard_CString Name(const Standard_Integer num, const Standard_Boolean isshort = Standard_False);

		/****** IFSelect_Editor::NameNumber ******/
		/****** md5 signature: 92cf82f3d39d60a7ec7147dab4cceeac ******/
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the number (ident) of a Value, from its name, short or complete. If not found, returns 0.
") NameNumber;
		Standard_Integer NameNumber(Standard_CString name);

		/****** IFSelect_Editor::NbValues ******/
		/****** md5 signature: 5aaee992dfbcf21a3b840e127a638649 ******/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Typed Values.
") NbValues;
		Standard_Integer NbValues();

		/****** IFSelect_Editor::PrintDefs ******/
		/****** md5 signature: 5eb01ddb6757ab25c90b1081fcc7f846 ******/
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", "
Parameters
----------
labels: bool (optional, default to Standard_False)

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") PrintDefs;
		void PrintDefs(std::ostream &OutValue, const Standard_Boolean labels = Standard_False);

		/****** IFSelect_Editor::PrintNames ******/
		/****** md5 signature: 02f5b2a426678e69e3d51e32f074a88c ******/
		%feature("compactdefaultargs") PrintNames;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") PrintNames;
		void PrintNames(std::ostream &OutValue);

		/****** IFSelect_Editor::Recognize ******/
		/****** md5 signature: 8378a2193566cc16fc414dbb42c7fa11 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm

Return
-------
bool

Description
-----------
Tells if this Editor can work on this EditForm and its content (model, entity ?).
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****** IFSelect_Editor::SetList ******/
		/****** md5 signature: 8d933e61e83a1b53dfe3c7125eff57c6 ******/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "
Parameters
----------
num: int
max: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets a parameter to be a List max < 0: not for a list (set when starting) max = 0: list with no length limit (default for SetList) max > 0: list limited to <max> items.
") SetList;
		void SetList(const Standard_Integer num, const Standard_Integer max = 0);

		/****** IFSelect_Editor::SetValue ******/
		/****** md5 signature: 0747f57cead4fe204d3701194d487a02 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
num: int
typval: Interface_TypedValue
shortname: str (optional, default to "")
accessmode: IFSelect_EditValue (optional, default to IFSelect_Editable)

Return
-------
None

Description
-----------
Sets a Typed Value for a given ident and short name, with an Edit Mode.
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<Interface_TypedValue> & typval, Standard_CString shortname = "", const IFSelect_EditValue accessmode = IFSelect_Editable);

		/****** IFSelect_Editor::StringValue ******/
		/****** md5 signature: 4982a2b783d5aac5c9acf7793c435877 ******/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of an EditForm, for a given item (if not a list. for a list, a Null String may be returned).
") StringValue;
		virtual opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

		/****** IFSelect_Editor::TypedValue ******/
		/****** md5 signature: 6a2cd2560c12faef1965db1283a596fc ******/
		%feature("compactdefaultargs") TypedValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_TypedValue>

Description
-----------
Returns a Typed Value from its ident.
") TypedValue;
		opencascade::handle<Interface_TypedValue> TypedValue(const Standard_Integer num);

		/****** IFSelect_Editor::Update ******/
		/****** md5 signature: 5958d6c8ac88aefc9458be281760538c ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int
newval: TCollection_HAsciiString
enforce: bool

Return
-------
bool

Description
-----------
Updates the EditForm when a parameter is modified I.E. default does nothing, can be redefined, as follows: Returns True when done (even if does nothing), False in case of refuse (for instance, if the new value is not suitable) <num> is the rank of the parameter for the EDITOR itself <enforce> True means that protected parameters can be touched //! If a parameter commands the value of other ones, when it is modified, it is necessary to touch them by Touch from EditForm.
") Update;
		virtual Standard_Boolean Update(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval, const Standard_Boolean enforce);

		/****** IFSelect_Editor::UpdateList ******/
		/****** md5 signature: 35413afbd449e9c2ca06f3f9aa3da784 ******/
		%feature("compactdefaultargs") UpdateList;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int
newlist: TColStd_HSequenceOfHAsciiString
enforce: bool

Return
-------
bool

Description
-----------
Acts as Update, but when the value is a list.
") UpdateList;
		virtual Standard_Boolean UpdateList(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & newlist, const Standard_Boolean enforce);

};


%make_alias(IFSelect_Editor)

%extend IFSelect_Editor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IFSelect_Functions *
***************************/
class IFSelect_Functions {
	public:
		/****** IFSelect_Functions::GiveDispatch ******/
		/****** md5 signature: 1a06822bb2b596471e350098898675a1 ******/
		%feature("compactdefaultargs") GiveDispatch;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession
name: str
mode: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<IFSelect_Dispatch>

Description
-----------
Evaluates and returns a Dispatch, from data of a WorkSession if <mode> is False, searches for exact name of Dispatch in WS Else (D), allows a parameter between brackets: ex.: dispatch_name(parameter) The parameter can be: an integer for DispPerCount or DispPerFiles or the name of a Signature for DispPerSignature Returns Null Handle if not found not well evaluated.
") GiveDispatch;
		static opencascade::handle<IFSelect_Dispatch> GiveDispatch(const opencascade::handle<IFSelect_WorkSession> & WS, Standard_CString name, const Standard_Boolean mode = Standard_True);

		/****** IFSelect_Functions::GiveEntity ******/
		/****** md5 signature: 4e7f30f23e68802f268399dd529bc222 ******/
		%feature("compactdefaultargs") GiveEntity;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession
name: str (optional, default to "")

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Takes the name of an entity, either as argument, or (if <name> is empty) on keyboard, and returns the entity name can be a label or a number (in alphanumeric), it is searched by NumberFromLabel from WorkSession. If <name> doesn't match en entity, a Null Handle is returned.
") GiveEntity;
		static opencascade::handle<Standard_Transient> GiveEntity(const opencascade::handle<IFSelect_WorkSession> & WS, Standard_CString name = "");

		/****** IFSelect_Functions::GiveEntityNumber ******/
		/****** md5 signature: 906076325f9a2e8480976c96de8fd8e5 ******/
		%feature("compactdefaultargs") GiveEntityNumber;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession
name: str (optional, default to "")

Return
-------
int

Description
-----------
Same as GetEntity, but returns the number in the model of the entity. Returns 0 for null handle.
") GiveEntityNumber;
		static Standard_Integer GiveEntityNumber(const opencascade::handle<IFSelect_WorkSession> & WS, Standard_CString name = "");

		/****** IFSelect_Functions::GiveList ******/
		/****** md5 signature: b44baf3972464320be8eb951fb05f91f ******/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession
first: str (optional, default to "")
second: str (optional, default to "")

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Computes a List of entities from a WorkSession and two idents, first and second, as follows: if <first> is a Number or Label of an entity: this entity if <first> is the name of a Selection in <WS>, and <second> not defined, the standard result of this Selection if <first> is for a Selection and <second> is defined, the standard result of this selection from the list computed with <second> (an entity or a selection) If <second> is erroneous, it is ignored.
") GiveList;
		static opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const opencascade::handle<IFSelect_WorkSession> & WS, Standard_CString first = "", Standard_CString second = "");

		/****** IFSelect_Functions::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Defines and loads all basic functions (as ActFunc).
") Init;
		static void Init();

};


%extend IFSelect_Functions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IFSelect_GeneralModifier *
*********************************/
%nodefaultctor IFSelect_GeneralModifier;
class IFSelect_GeneralModifier : public Standard_Transient {
	public:
		/****** IFSelect_GeneralModifier::Applies ******/
		/****** md5 signature: 0a1a7bd4e171610ae038b6d0417f15e6 ******/
		%feature("compactdefaultargs") Applies;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch

Return
-------
bool

Description
-----------
Returns True if a Model obtained from the Dispatch <disp> is to be treated (apart from the Selection criterium) If Dispatch(me) is Null, returns True. Else, checks <disp>.
") Applies;
		Standard_Boolean Applies(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****** IFSelect_GeneralModifier::Dispatch ******/
		/****** md5 signature: bb780838e863dc0373f20cb1226e9297 ******/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Dispatch>

Description
-----------
Returns the Dispatch to be matched, Null if not set.
") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch();

		/****** IFSelect_GeneralModifier::HasSelection ******/
		/****** md5 signature: 7bc279c0acb8f59af3371db26a8c8085 ******/
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Selection is set as an additional criterium.
") HasSelection;
		Standard_Boolean HasSelection();

		/****** IFSelect_GeneralModifier::Label ******/
		/****** md5 signature: 458d8d95170c9aa9c0a465eba36c0e6b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a short text which defines the operation performed.
") Label;
		virtual TCollection_AsciiString Label();

		/****** IFSelect_GeneralModifier::MayChangeGraph ******/
		/****** md5 signature: e92fd2d8b8dc429a00d58aed395c1784 ******/
		%feature("compactdefaultargs") MayChangeGraph;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this modifier may change the graph of dependences (acknowledged at creation time).
") MayChangeGraph;
		Standard_Boolean MayChangeGraph();

		/****** IFSelect_GeneralModifier::ResetSelection ******/
		/****** md5 signature: 01aaf08d4303a13daf85a0aa138cd39f ******/
		%feature("compactdefaultargs") ResetSelection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets the Selection: this criterium is not longer active.
") ResetSelection;
		void ResetSelection();

		/****** IFSelect_GeneralModifier::Selection ******/
		/****** md5 signature: e05f8581b544958a8c567b8bd0f3b0c4 ******/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the Selection, or a Null Handle if not set.
") Selection;
		opencascade::handle<IFSelect_Selection> Selection();

		/****** IFSelect_GeneralModifier::SetDispatch ******/
		/****** md5 signature: 690e55ff077a33b5348b3230260a8a77 ******/
		%feature("compactdefaultargs") SetDispatch;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch

Return
-------
None

Description
-----------
Attaches to a Dispatch. If <disp> is Null, Resets it (to apply the Modifier on every Dispatch).
") SetDispatch;
		void SetDispatch(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****** IFSelect_GeneralModifier::SetSelection ******/
		/****** md5 signature: c33ace088a61e8e42ceb139b2bb56198 ******/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Sets a Selection: a Model is treated if it contains one or more Entities designated by the Selection.
") SetSelection;
		void SetSelection(const opencascade::handle<IFSelect_Selection> & sel);

};


%make_alias(IFSelect_GeneralModifier)

%extend IFSelect_GeneralModifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IFSelect_IntParam *
**************************/
class IFSelect_IntParam : public Standard_Transient {
	public:
		/****** IFSelect_IntParam::IFSelect_IntParam ******/
		/****** md5 signature: c8199f04f84cc5f4c28ccab92bb94ae7 ******/
		%feature("compactdefaultargs") IFSelect_IntParam;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an IntParam. Initial value is set to zer.
") IFSelect_IntParam;
		 IFSelect_IntParam();

		/****** IFSelect_IntParam::SetStaticName ******/
		/****** md5 signature: f5d46440dfff3c8055a4a7142e7f0c86 ******/
		%feature("compactdefaultargs") SetStaticName;
		%feature("autodoc", "
Parameters
----------
statname: str

Return
-------
None

Description
-----------
Commands this IntParam to be bound to a Static Hence, Value will return the value if this Static if it is set Else, Value works on the locally stored value SetValue also will set the value of the Static This works only for a present static of type integer or enum Else, it is ignored //! If <statname> is empty, disconnects the IntParam from Static.
") SetStaticName;
		void SetStaticName(Standard_CString statname);

		/****** IFSelect_IntParam::SetValue ******/
		/****** md5 signature: 653bb566b3bcc839d91852231e9c0a21 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
Sets a new Integer Value for the IntParam. If a StaticName is defined and the Static is set, also sets the value of the static.
") SetValue;
		void SetValue(const Standard_Integer val);

		/****** IFSelect_IntParam::Value ******/
		/****** md5 signature: c6d99989077b92200f0377d8b792ba0b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
Reads Integer Value of the IntParam. If a StaticName is defined and the Static is set, looks in priority the value of the static.
") Value;
		Standard_Integer Value();

};


%make_alias(IFSelect_IntParam)

%extend IFSelect_IntParam {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def StaticName(self):
		pass
	}
};

/****************************
* class IFSelect_ListEditor *
****************************/
class IFSelect_ListEditor : public Standard_Transient {
	public:
		/****** IFSelect_ListEditor::IFSelect_ListEditor ******/
		/****** md5 signature: 18babee4b92ff877b16ae7bc4663d86f ******/
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a ListEditor with absolutely no constraint.
") IFSelect_ListEditor;
		 IFSelect_ListEditor();

		/****** IFSelect_ListEditor::IFSelect_ListEditor ******/
		/****** md5 signature: 6e18dd9000326964d8250251eee59d6a ******/
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "
Parameters
----------
def: Interface_TypedValue
max: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a ListEditor, for which items of the list to edit are defined by <def>, and <max> describes max length: 0 (D) means no limit value > 0 means: no more the <max> items are allowed.
") IFSelect_ListEditor;
		 IFSelect_ListEditor(const opencascade::handle<Interface_TypedValue> & def, const Standard_Integer max = 0);

		/****** IFSelect_ListEditor::AddValue ******/
		/****** md5 signature: 2ded1cf7f089cf387c898b417d124caa ******/
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString
atnum: int (optional, default to 0)

Return
-------
bool

Description
-----------
Adds a new item. By default appends (at the end of the list) Can insert before a given rank <num>, if positive Returns True when done. False if MaxLength may be overpassed or if <val> does not satisfy the definition.
") AddValue;
		virtual Standard_Boolean AddValue(const opencascade::handle<TCollection_HAsciiString> & val, const Standard_Integer atnum = 0);

		/****** IFSelect_ListEditor::ClearEdit ******/
		/****** md5 signature: af5425cf331d8d25ff0b10fa99bb0ec2 ******/
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all editions already recorded.
") ClearEdit;
		void ClearEdit();

		/****** IFSelect_ListEditor::EditedValues ******/
		/****** md5 signature: 68836436f281171a2774feed2b3d8dd7 ******/
		%feature("compactdefaultargs") EditedValues;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the result of the edition.
") EditedValues;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> EditedValues();

		/****** IFSelect_ListEditor::IsAdded ******/
		/****** md5 signature: ef423d963b59700dfaf88b1a442ef762 ******/
		%feature("compactdefaultargs") IsAdded;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Tells if a value (in edited list) has been added (new one).
") IsAdded;
		Standard_Boolean IsAdded(const Standard_Integer num);

		/****** IFSelect_ListEditor::IsChanged ******/
		/****** md5 signature: 0c5ad9ff74e548a4849d8afd8b55a8f2 ******/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Tells if a value (in edited list) has been changed, i.e. either modified-value, or added.
") IsChanged;
		Standard_Boolean IsChanged(const Standard_Integer num);

		/****** IFSelect_ListEditor::IsModified ******/
		/****** md5 signature: 4f4d3fd6642971e1c7fc73abfba221e7 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Tells if a value (in edited list) has been modified-value (not added).
") IsModified;
		Standard_Boolean IsModified(const Standard_Integer num);

		/****** IFSelect_ListEditor::IsTouched ******/
		/****** md5 signature: 7e01b348a6868a635cea7174b103d4d0 ******/
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if at least one edition (SetValue-AddValue-Remove) has been recorded.
") IsTouched;
		Standard_Boolean IsTouched();

		/****** IFSelect_ListEditor::LoadEdited ******/
		/****** md5 signature: 2205a08973b5e4e5e41a8b45ad182ca5 ******/
		%feature("compactdefaultargs") LoadEdited;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfHAsciiString

Return
-------
bool

Description
-----------
Loads a new list to replace the older one, in once ! By default (can be redefined) checks the length of the list and the value of each item according to the def Items are all recorded as Modified //! If no def has been given at creation time, no check is done Returns True when done, False if checks have failed ... a specialisation may also lock it by returning always False ...
") LoadEdited;
		virtual Standard_Boolean LoadEdited(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list);

		/****** IFSelect_ListEditor::LoadModel ******/
		/****** md5 signature: df41283b47ba4b5105d39eb762c1d35d ******/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Loads a Model. It is used to check items of type Entity(Ident).
") LoadModel;
		void LoadModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_ListEditor::LoadValues ******/
		/****** md5 signature: 93fe3ab1628622df819d7bba384b59b8 ******/
		%feature("compactdefaultargs") LoadValues;
		%feature("autodoc", "
Parameters
----------
vals: TColStd_HSequenceOfHAsciiString

Return
-------
None

Description
-----------
Loads the original values for the list. Remark: If its length is more then MaxLength, editions remain allowed, except Add.
") LoadValues;
		void LoadValues(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & vals);

		/****** IFSelect_ListEditor::NbValues ******/
		/****** md5 signature: d9760f667cf04d1e93f84876bcc88e78 ******/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "
Parameters
----------
edited: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Returns count of values, edited (D) or original.
") NbValues;
		Standard_Integer NbValues(const Standard_Boolean edited = Standard_True);

		/****** IFSelect_ListEditor::OriginalValues ******/
		/****** md5 signature: 9b9f838f20672d2459b15906c7e2813d ******/
		%feature("compactdefaultargs") OriginalValues;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the value from which the edition started.
") OriginalValues;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> OriginalValues();

		/****** IFSelect_ListEditor::Remove ******/
		/****** md5 signature: 81c7bcb432090398e5ad90831a6e6baf ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)
howmany: int (optional, default to 1)

Return
-------
bool

Description
-----------
Removes items from the list By default removes one item. Else, count given by <howmany> Remove from rank <num> included. By default, from the end Returns True when done, False (and does not work) if case of out of range of if <howmany> is greater than current length.
") Remove;
		virtual Standard_Boolean Remove(const Standard_Integer num = 0, const Standard_Integer howmany = 1);

		/****** IFSelect_ListEditor::SetTouched ******/
		/****** md5 signature: 902d6b25ed0d933e1c63e47f5ce2f32c ******/
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "Return
-------
None

Description
-----------
Declares this ListEditor to have been touched (whatever action).
") SetTouched;
		void SetTouched();

		/****** IFSelect_ListEditor::SetValue ******/
		/****** md5 signature: 62e1c6f6eea5fc2300b21c40592c3dd2 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
num: int
val: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Sets a new value for the item <num> (in edited list) <val> may be a Null Handle, then the value will be cleared but not removed Returns True when done. False if <num> is out of range or if <val> does not satisfy the definition.
") SetValue;
		virtual Standard_Boolean SetValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IFSelect_ListEditor::Value ******/
		/****** md5 signature: 281c0165cd2dcc64d54b3f7431b8455b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
num: int
edited: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a value given its rank. Edited (D) or Original A Null String means the value is cleared but not removed.
") Value;
		opencascade::handle<TCollection_HAsciiString> Value(const Standard_Integer num, const Standard_Boolean edited = Standard_True);

};


%make_alias(IFSelect_ListEditor)

%extend IFSelect_ListEditor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_ModelCopier *
*****************************/
class IFSelect_ModelCopier : public Standard_Transient {
	public:
		/****** IFSelect_ModelCopier::IFSelect_ModelCopier ******/
		/****** md5 signature: 49641f2498a98820ef8e900dad84cc16 ******/
		%feature("compactdefaultargs") IFSelect_ModelCopier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty ModelCopier.
") IFSelect_ModelCopier;
		 IFSelect_ModelCopier();

		/****** IFSelect_ModelCopier::AddFile ******/
		/****** md5 signature: 0e89514067d47886eb80e7150ada5ce5 ******/
		%feature("compactdefaultargs") AddFile;
		%feature("autodoc", "
Parameters
----------
filename: str
content: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Records a new File to be sent, as a couple (Name as AsciiString, Content as InterfaceModel) Returns True if Done, False if <filename> is already attached to another File.
") AddFile;
		Standard_Boolean AddFile(TCollection_AsciiString filename, const opencascade::handle<Interface_InterfaceModel> & content);

		/****** IFSelect_ModelCopier::AddSentFile ******/
		/****** md5 signature: d78b945bd2b4881efefcf05b966a19da ******/
		%feature("compactdefaultargs") AddSentFile;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
None

Description
-----------
Adds the name of a just sent file, if BeginSentFiles has commanded recording; else does nothing It is called by methods SendCopied Sending.
") AddSentFile;
		void AddSentFile(Standard_CString filename);

		/****** IFSelect_ModelCopier::AppliedModifiers ******/
		/****** md5 signature: 94df5d02e1774373305e5d426c26c3e7 ******/
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_AppliedModifiers>

Description
-----------
Returns the list of File Modifiers to be applied on a file when it will be sent, as computed by CopiedModel: If it is a null handle, no File Modifier has to be applied.
") AppliedModifiers;
		opencascade::handle<IFSelect_AppliedModifiers> AppliedModifiers(const Standard_Integer num);

		/****** IFSelect_ModelCopier::BeginSentFiles ******/
		/****** md5 signature: f03da548e57afd68eaf9f778a8263c7f ******/
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "
Parameters
----------
sho: IFSelect_ShareOut
record: bool

Return
-------
None

Description
-----------
Begins a sequence of recording the really sent files <sho>: the default file numbering is cleared If <record> is False, clears the list and stops recording If <record> is True, clears the list and commands recording Creation time corresponds to 'stop recording'.
") BeginSentFiles;
		void BeginSentFiles(const opencascade::handle<IFSelect_ShareOut> & sho, const Standard_Boolean record);

		/****** IFSelect_ModelCopier::ClearAppliedModifiers ******/
		/****** md5 signature: 30c01bfd0d38cb92e4932e5621c2949c ******/
		%feature("compactdefaultargs") ClearAppliedModifiers;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Clears the list of File Modifiers to be applied on a file.
") ClearAppliedModifiers;
		Standard_Boolean ClearAppliedModifiers(const Standard_Integer num);

		/****** IFSelect_ModelCopier::ClearFile ******/
		/****** md5 signature: 344aab20c8cfe78057a6c83bdeb04b83 ******/
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Clears the Name attached to a File which was formerly defined by a call to AddFile. This Clearing can be undone by a call to NameFile (with same <num>) Returns True if Done, False else: if <num> is out of range.
") ClearFile;
		Standard_Boolean ClearFile(const Standard_Integer num);

		/****** IFSelect_ModelCopier::ClearResult ******/
		/****** md5 signature: 269959098ac714b5129d84a6df9fce12 ******/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of produced Models.
") ClearResult;
		void ClearResult();

		/****** IFSelect_ModelCopier::CopiedRemaining ******/
		/****** md5 signature: 8fa4fd94e5b73fe8a05ddc0b711ff3c6 ******/
		%feature("compactdefaultargs") CopiedRemaining;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
WL: IFSelect_WorkLibrary
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Return
-------
None

Description
-----------
Produces a Model copied from the Remaining List as <newmod> <newmod> is a Null Handle if this list is empty <WL> performs the copy by using <TC> <TC> is assumed to have been defined with the starting model same as defined by <G>.
") CopiedRemaining;
		void CopiedRemaining(const Interface_Graph & G, const opencascade::handle<IFSelect_WorkLibrary> & WL, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****** IFSelect_ModelCopier::Copy ******/
		/****** md5 signature: c3b3c59f1c959db152d1a7490ea49ef4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
eval: IFSelect_ShareOutResult
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Return
-------
Interface_CheckIterator

Description
-----------
Performs the Copy Operations, which include the Modifications defined by the list of Modifiers. Memorizes the result, as a list of InterfaceModels with the corresponding FileNames They can then be sent, by the method Send, or queried Copy calls internal method Copying. Returns the produced CheckList.
") Copy;
		Interface_CheckIterator Copy(IFSelect_ShareOutResult & eval, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****** IFSelect_ModelCopier::FileModel ******/
		/****** md5 signature: e7ebafed780641c5418e50b756d6cfe8 ******/
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the content of a file before sending, under the form of an InterfaceModel, given its rank.
") FileModel;
		opencascade::handle<Interface_InterfaceModel> FileModel(const Standard_Integer num);

		/****** IFSelect_ModelCopier::FileName ******/
		/****** md5 signature: b2588c3658582d921f5c74ad9b5353f2 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the File Name for a file given its rank It is empty after a call to ClearFile on same <num>.
") FileName;
		TCollection_AsciiString FileName(const Standard_Integer num);

		/****** IFSelect_ModelCopier::NameFile ******/
		/****** md5 signature: 030612ef8321b284b54fb35082a160a3 ******/
		%feature("compactdefaultargs") NameFile;
		%feature("autodoc", "
Parameters
----------
num: int
filename: str

Return
-------
bool

Description
-----------
Changes the Name attached to a File which was formerly defined by a call to AddFile Returns True if Done, False else: if <num> out of range or if the new <filename> is already attached to another File Remark: Giving an empty File Name is equivalent to ClearFile.
") NameFile;
		Standard_Boolean NameFile(const Standard_Integer num, TCollection_AsciiString filename);

		/****** IFSelect_ModelCopier::NbFiles ******/
		/****** md5 signature: f4ff740bb702aab2feb817a0f407ce9c ******/
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Files produced, i.e. the count of Models memorized (produced by the mmethod Copy) with their file names.
") NbFiles;
		Standard_Integer NbFiles();

		/****** IFSelect_ModelCopier::Send ******/
		/****** md5 signature: 1fcee6036db102c9b1be69b0e63cc1b8 ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
eval: IFSelect_ShareOutResult
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Return
-------
Interface_CheckIterator

Description
-----------
Performs the Copy Operations (which include the Modifications) and Sends the result on files, without memorizing it. (the memorized result is ignored: neither queried not filled).
") Send;
		Interface_CheckIterator Send(IFSelect_ShareOutResult & eval, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****** IFSelect_ModelCopier::SendAll ******/
		/****** md5 signature: e9f8ad0f2f1424c856c84bb40fac7a9c ******/
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "
Parameters
----------
filename: str
G: Interface_Graph
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Return
-------
Interface_CheckIterator

Description
-----------
Sends a model (defined in <G>) into one file, without managing remaining data, already sent files, etc. Applies the Model and File Modifiers. Returns True if well done, False else.
") SendAll;
		Interface_CheckIterator SendAll(Standard_CString filename, const Interface_Graph & G, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****** IFSelect_ModelCopier::SendCopied ******/
		/****** md5 signature: a3c0ccfff968b8ebbb53e51c0a714a02 ******/
		%feature("compactdefaultargs") SendCopied;
		%feature("autodoc", "
Parameters
----------
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Return
-------
Interface_CheckIterator

Description
-----------
Sends the formerly defined results (see method Copy) to files, then clears it Remark: A Null File Name cause file to be not produced.
") SendCopied;
		Interface_CheckIterator SendCopied(const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****** IFSelect_ModelCopier::SendSelected ******/
		/****** md5 signature: c860cdd41d70fb9b3f7d707c6a2fdcdb ******/
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "
Parameters
----------
filename: str
G: Interface_Graph
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol
iter: Interface_EntityIterator

Return
-------
Interface_CheckIterator

Description
-----------
Sends a part of a model into one file. Model is gotten from <G>, the part is defined in <iter>. Remaining data are managed and can be later be worked on. Returns True if well done, False else.
") SendSelected;
		Interface_CheckIterator SendSelected(Standard_CString filename, const Interface_Graph & G, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol, const Interface_EntityIterator & iter);

		/****** IFSelect_ModelCopier::SentFiles ******/
		/****** md5 signature: ccec19bbefb996c0e777d6a8d7f3c41a ******/
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of recorded names of sent files. Can be empty (if no file has been sent). Returns a Null Handle if BeginSentFiles has stopped recording.
") SentFiles;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SentFiles();

		/****** IFSelect_ModelCopier::SetAppliedModifiers ******/
		/****** md5 signature: 9e6dc16e030b22032b7db0b2e0c6a2da ******/
		%feature("compactdefaultargs") SetAppliedModifiers;
		%feature("autodoc", "
Parameters
----------
num: int
applied: IFSelect_AppliedModifiers

Return
-------
bool

Description
-----------
Sets a list of File Modifiers to be applied on a file.
") SetAppliedModifiers;
		Standard_Boolean SetAppliedModifiers(const Standard_Integer num, const opencascade::handle<IFSelect_AppliedModifiers> & applied);

		/****** IFSelect_ModelCopier::SetRemaining ******/
		/****** md5 signature: 409a7037498fd0f7f508bf8e2470dd84 ******/
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "
Parameters
----------
CG: Interface_Graph

Return
-------
bool

Description
-----------
Updates Graph status for remaining data, for each entity: - Entities just Sent to file or Copied (by CopiedRemaining) have their status set to 1 - the other keep their former status (1 for Send/Copied, 0 for Remaining) These status are computed by Copying/Sending/CopiedRemaining Then, SetRemaining updates graph status, and mustr be called just after one of these method has been called Returns True if done, False if remaining info if not in phase which the Graph (not same counts of items).
") SetRemaining;
		Standard_Boolean SetRemaining(Interface_Graph & CG);

		/****** IFSelect_ModelCopier::SetShareOut ******/
		/****** md5 signature: 0385da75fb0554c7d333bddc57c0d3ce ******/
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "
Parameters
----------
sho: IFSelect_ShareOut

Return
-------
None

Description
-----------
Sets the ShareOut, which is used to define Modifiers to apply.
") SetShareOut;
		void SetShareOut(const opencascade::handle<IFSelect_ShareOut> & sho);

};


%make_alias(IFSelect_ModelCopier)

%extend IFSelect_ModelCopier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_PacketList *
****************************/
class IFSelect_PacketList : public Standard_Transient {
	public:
		/****** IFSelect_PacketList::IFSelect_PacketList ******/
		/****** md5 signature: 7db58c801fe999659aec906931b3a868 ******/
		%feature("compactdefaultargs") IFSelect_PacketList;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Creates a PackList, empty, ready to receive entities from a given Model.
") IFSelect_PacketList;
		 IFSelect_PacketList(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_PacketList::Add ******/
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
Adds an entity from the Model into the current packet for Add.
") Add;
		void Add(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_PacketList::AddList ******/
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
Adds an list of entities into the current packet for Add.
") AddList;
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** IFSelect_PacketList::AddPacket ******/
		/****** md5 signature: 5819d675cf76b470dc3bbd88cd0bda92 ******/
		%feature("compactdefaultargs") AddPacket;
		%feature("autodoc", "Return
-------
None

Description
-----------
Declares a new Packet, ready to be filled The entities to be added will be added to this Packet.
") AddPacket;
		void AddPacket();

		/****** IFSelect_PacketList::Duplicated ******/
		/****** md5 signature: bef5c897c11467ef2984019e1ea4accb ******/
		%feature("compactdefaultargs") Duplicated;
		%feature("autodoc", "
Parameters
----------
count: int
andmore: bool

Return
-------
Interface_EntityIterator

Description
-----------
Returns a list of entities duplicated: <count> times, if <andmore> is False, or <count> or more times, if <andmore> is True Hence, count=2 & andmore=True gives all duplicated entities count=1 gives non-duplicated entities (in only one packet) count=0 gives remaining entities (in no packet at all).
") Duplicated;
		Interface_EntityIterator Duplicated(const Standard_Integer count, const Standard_Boolean andmore);

		/****** IFSelect_PacketList::Entities ******/
		/****** md5 signature: 8911917ed174e093d06b332b47825845 ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "
Parameters
----------
numpack: int

Return
-------
Interface_EntityIterator

Description
-----------
Returns the content of a Packet given its rank Null Handle if <numpack> is out of range.
") Entities;
		Interface_EntityIterator Entities(const Standard_Integer numpack);

		/****** IFSelect_PacketList::HighestDuplicationCount ******/
		/****** md5 signature: 6f9bb4034a10c7ff83a4e041398aa218 ******/
		%feature("compactdefaultargs") HighestDuplicationCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the highest number of packets which know a same entity For no duplication, should be one.
") HighestDuplicationCount;
		Standard_Integer HighestDuplicationCount();

		/****** IFSelect_PacketList::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model of reference.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** IFSelect_PacketList::Name ******/
		/****** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the recorded name for a packet list.
") Name;
		Standard_CString Name();

		/****** IFSelect_PacketList::NbDuplicated ******/
		/****** md5 signature: f504f89fdd022fab0637c58f067da950 ******/
		%feature("compactdefaultargs") NbDuplicated;
		%feature("autodoc", "
Parameters
----------
count: int
andmore: bool

Return
-------
int

Description
-----------
Returns the count of entities duplicated: <count> times, if <andmore> is False, or <count> or more times, if <andmore> is True See Duplicated for more details.
") NbDuplicated;
		Standard_Integer NbDuplicated(const Standard_Integer count, const Standard_Boolean andmore);

		/****** IFSelect_PacketList::NbEntities ******/
		/****** md5 signature: aa951bc8ded7242a13765419c0f22118 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "
Parameters
----------
numpack: int

Return
-------
int

Description
-----------
Returns the count of entities in a Packet given its rank, or 0.
") NbEntities;
		Standard_Integer NbEntities(const Standard_Integer numpack);

		/****** IFSelect_PacketList::NbPackets ******/
		/****** md5 signature: 5d4127d8d4ce4c4d71910f16e9666e8e ******/
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of non-empty packets.
") NbPackets;
		Standard_Integer NbPackets();

		/****** IFSelect_PacketList::SetName ******/
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
Sets a name to a packet list: this makes easier a general routine to print it. Default is 'Packets'.
") SetName;
		void SetName(Standard_CString name);

};


%make_alias(IFSelect_PacketList)

%extend IFSelect_PacketList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IFSelect_Selection *
***************************/
%nodefaultctor IFSelect_Selection;
class IFSelect_Selection : public Standard_Transient {
	public:
		/****** IFSelect_Selection::CompleteResult ******/
		/****** md5 signature: f78c8db639a4f4c6be252ba3221c06b4 ******/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of entities involved by a Selection, i.e. UniqueResult plus the shared entities (directly or not).
") CompleteResult;
		virtual Interface_EntityIterator CompleteResult(const Interface_Graph & G);

		/****** IFSelect_Selection::FillIterator ******/
		/****** md5 signature: 015a92e8bcf3669e5238864f19a81fbf ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: IFSelect_SelectionIterator

Return
-------
None

Description
-----------
Puts in an Iterator the Selections from which 'me' depends (there can be zero, or one, or a list). Specific to each class of Selection.
") FillIterator;
		virtual void FillIterator(IFSelect_SelectionIterator & iter);

		/****** IFSelect_Selection::Label ******/
		/****** md5 signature: 458d8d95170c9aa9c0a465eba36c0e6b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text which defines the criterium applied by a Selection (can be used to be printed, displayed ...) Specific to each class.
") Label;
		virtual TCollection_AsciiString Label();

		/****** IFSelect_Selection::RootResult ******/
		/****** md5 signature: 7c9e7ee589be6574204ff217551c1145 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities, computed from Input given as a Graph. Specific to each class of Selection Note that uniqueness of each entity is not required here This method can raise an exception as necessary.
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_Selection::UniqueResult ******/
		/****** md5 signature: 47799306ea54dbaad3327e2c3649dc1d ******/
		%feature("compactdefaultargs") UniqueResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities, each of them being unique. Default definition works from RootResult. According HasUniqueResult, UniqueResult returns directly RootResult, or build a Unique Result from it with a Graph.
") UniqueResult;
		Interface_EntityIterator UniqueResult(const Interface_Graph & G);

};


%make_alias(IFSelect_Selection)

%extend IFSelect_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IFSelect_SelectionIterator *
***********************************/
class IFSelect_SelectionIterator {
	public:
		/****** IFSelect_SelectionIterator::IFSelect_SelectionIterator ******/
		/****** md5 signature: ca760a47df093be628b95099a0c02a7b ******/
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty iterator, ready to be filled.
") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator();

		/****** IFSelect_SelectionIterator::IFSelect_SelectionIterator ******/
		/****** md5 signature: 9efbf9b09f6c9fb103ecfce0e9c0c89e ******/
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Creates an iterator from a Selection: it lists the Selections from which <sel> depends (given by its method FillIterator).
") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_SelectionIterator::AddFromIter ******/
		/****** md5 signature: 80a80d0945e6790a0a2db1346a9fdf59 ******/
		%feature("compactdefaultargs") AddFromIter;
		%feature("autodoc", "
Parameters
----------
iter: IFSelect_SelectionIterator

Return
-------
None

Description
-----------
Adds to an iterator the content of another one (each selection is present only once in the result).
") AddFromIter;
		void AddFromIter(IFSelect_SelectionIterator & iter);

		/****** IFSelect_SelectionIterator::AddItem ******/
		/****** md5 signature: 38e529377cf00c421c458fe208ac94b3 ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Adds a Selection to an iterator (if not yet noted).
") AddItem;
		void AddItem(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_SelectionIterator::AddList ******/
		/****** md5 signature: 0cefa2f41eedd72c727cd8562631b48c ******/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "
Parameters
----------
list: IFSelect_TSeqOfSelection

Return
-------
None

Description
-----------
Adds a list of Selections to an iterator (this list comes from the description of a Selection or a Dispatch, etc...).
") AddList;
		void AddList(const IFSelect_TSeqOfSelection & list);

		/****** IFSelect_SelectionIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Selections to get.
") More;
		Standard_Boolean More();

		/****** IFSelect_SelectionIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets iterator to the next item.
") Next;
		void Next();

		/****** IFSelect_SelectionIterator::Value ******/
		/****** md5 signature: 8930db425d3b9ef0a6b0dfd236407cae ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the current Selection being iterated Error if count of Selection has been passed.
") Value;
		const opencascade::handle<IFSelect_Selection> & Value();

};


%extend IFSelect_SelectionIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SessionDumper *
*******************************/
%nodefaultctor IFSelect_SessionDumper;
class IFSelect_SessionDumper : public Standard_Transient {
	public:
		/****** IFSelect_SessionDumper::First ******/
		/****** md5 signature: 905b6a68b00131e9e351548e48b295a7 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SessionDumper>

Description
-----------
Returns the First item of the Library of Dumper. The Next ones are then obtained by Next on the returned items.
") First;
		static opencascade::handle<IFSelect_SessionDumper> First();

		/****** IFSelect_SessionDumper::Next ******/
		/****** md5 signature: 807f5f8181d0bb85c0b802c8394cdae8 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SessionDumper>

Description
-----------
Returns the Next SesionDumper in the Library. Returns a Null Handle at the End.
") Next;
		opencascade::handle<IFSelect_SessionDumper> Next();

		/****** IFSelect_SessionDumper::ReadOwn ******/
		/****** md5 signature: 0ba52027df96fc43c669e9b279e81af0 ******/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "
Parameters
----------
file: IFSelect_SessionFile
type: str
item: Standard_Transient

Return
-------
bool

Description
-----------
Recognizes a Type (given as <type>) then Creates an Item of this Type with the Own Parameter, as required. Returns True if it has recognized the Type (in this case, it is assumed to have created the Item, returned as <item>), False else: in that case, SessionFile will try another SessionDumper in the Library. ReadOwn can use these methods from SessionFile to access Own Parameters: NbOwnParams, IsVoid, IsText, TextValue, ItemValue.
") ReadOwn;
		virtual Standard_Boolean ReadOwn(IFSelect_SessionFile & file, TCollection_AsciiString type, opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SessionDumper::WriteOwn ******/
		/****** md5 signature: b08a71cf7d60fc4b67e64bbbdeff2fa7 ******/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "
Parameters
----------
file: IFSelect_SessionFile
item: Standard_Transient

Return
-------
bool

Description
-----------
Writes the Own Parameters of a given Item, if it forecast to manage its Type. Returns True if it has recognized the Type of the Item (in this case, it is assumed to have written the Own Parameters if there are some), False else: in that case, SessionFile will try another SessionDumper in the Library. WriteOwn can use these methods from SessionFile: SendVoid, SendItem, SendText, and if necessary, WorkSession.
") WriteOwn;
		virtual Standard_Boolean WriteOwn(IFSelect_SessionFile & file, const opencascade::handle<Standard_Transient> & item);

};


%make_alias(IFSelect_SessionDumper)

%extend IFSelect_SessionDumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_SessionFile *
*****************************/
class IFSelect_SessionFile {
	public:
		/****** IFSelect_SessionFile::IFSelect_SessionFile ******/
		/****** md5 signature: 3b52de95203620653c0f1103cb18de65 ******/
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession

Return
-------
None

Description
-----------
Creates a SessionFile, ready to read Files in order to load them into a given WorkSession. The following Read Operations must then be called. It is also possible to perform a Write, which produces a complete File of all the content of the WorkSession.
") IFSelect_SessionFile;
		 IFSelect_SessionFile(const opencascade::handle<IFSelect_WorkSession> & WS);

		/****** IFSelect_SessionFile::IFSelect_SessionFile ******/
		/****** md5 signature: e27c90f73d83777e2fd736b94eea0e1e ******/
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession
filename: str

Return
-------
None

Description
-----------
Creates a SessionFile which Writes the content of a WorkSession to a File (directly calls Write) Then, IsDone acknowledges on the result of the Operation. But such a SessionFile may not Read a File to a WorkSession.
") IFSelect_SessionFile;
		 IFSelect_SessionFile(const opencascade::handle<IFSelect_WorkSession> & WS, Standard_CString filename);

		/****** IFSelect_SessionFile::AddItem ******/
		/****** md5 signature: f1a791c33f3860d5d3ad930160435e21 ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient
active: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Adds an Item to the WorkSession, taken as Name the first item of the read Line. If this Name is not a Name but a Number or if this Name is already recorded in the WorkSession, it adds the Item but with no Name. Then the Name is recorded in order to be used by the method ItemValue <active> commands to make <item> active or not in the session.
") AddItem;
		void AddItem(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean active = Standard_True);

		/****** IFSelect_SessionFile::AddLine ******/
		/****** md5 signature: 3b219b13dcd6c36fea60a93c3fc075f6 ******/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "
Parameters
----------
line: str

Return
-------
None

Description
-----------
Adds a line to the list of recorded lines.
") AddLine;
		void AddLine(Standard_CString line);

		/****** IFSelect_SessionFile::ClearLines ******/
		/****** md5 signature: bd42443a58c4d2b13ae8f9baf81ba414 ******/
		%feature("compactdefaultargs") ClearLines;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the lines recorded whatever for writing or for reading.
") ClearLines;
		void ClearLines();

		/****** IFSelect_SessionFile::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Specific Destructor (closes the File if not yet done).
") Destroy;
		void Destroy();

		/****** IFSelect_SessionFile::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the last Read or Write operation has been correctly performed. Else returns False.
") IsDone;
		Standard_Boolean IsDone();

		/****** IFSelect_SessionFile::IsText ******/
		/****** md5 signature: f187a6517ba9053315363c633290f27c ******/
		%feature("compactdefaultargs") IsText;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if a Parameter, in the Own List (see NbOwnParams) is a Text (between '...'). Else it is an Item (Parameter, Selection, Dispatch ...), which can be Void.
") IsText;
		Standard_Boolean IsText(const Standard_Integer num);

		/****** IFSelect_SessionFile::IsVoid ******/
		/****** md5 signature: 52176105758977eb4c2daa75c18485b6 ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if a Parameter, given its rank in the Own List (see NbOwnParams), is Void. Returns also True if <num> is out of range (undefined parameters).
") IsVoid;
		Standard_Boolean IsVoid(const Standard_Integer num);

		/****** IFSelect_SessionFile::ItemValue ******/
		/****** md5 signature: 6318c4f89a81c26b75f76b09eee9ed59 ******/
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns a Parameter as an Item. Returns a Null Handle if the Parameter is a Text, or if it is defined as Void.
") ItemValue;
		opencascade::handle<Standard_Transient> ItemValue(const Standard_Integer num);

		/****** IFSelect_SessionFile::Line ******/
		/****** md5 signature: 6f4db89800be9e476bbc5badc90f170f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns a line given its rank in the list of recorded lines.
") Line;
		const TCollection_AsciiString & Line(const Standard_Integer num);

		/****** IFSelect_SessionFile::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded lines.
") NbLines;
		Standard_Integer NbLines();

		/****** IFSelect_SessionFile::NbParams ******/
		/****** md5 signature: 826f4756fca7f780e6d976c60183d715 ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
During a Read operation, SessionFile processes sequentially the Items to read. For each one, it gives access to the list of its Parameters: they were defined by calls to SendVoid/SendParam/SendText during Writing the File. NbParams returns the count of Parameters for the line currently read.
") NbParams;
		Standard_Integer NbParams();

		/****** IFSelect_SessionFile::NewItem ******/
		/****** md5 signature: 1f79b682e2c5b8350d58ac36b6d7fc26 ******/
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "
Parameters
----------
ident: int
par: Standard_Transient

Return
-------
None

Description
-----------
At beginning of writing an Item, writes its basics: - either its name in the session if it has one - or its relative number of item in the file, else (preceded by a '_') - then, its Dynamic Type (in the sense of cdl: pk_class) This basic description can be followed by the parameters which are used in the definition of the item.
") NewItem;
		void NewItem(const Standard_Integer ident, const opencascade::handle<Standard_Transient> & par);

		/****** IFSelect_SessionFile::ParamValue ******/
		/****** md5 signature: 77959bf49598fe08abc770f5758f5137 ******/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns a Parameter (alphanumeric item of a line) as it has been read.
") ParamValue;
		const TCollection_AsciiString & ParamValue(const Standard_Integer num);

		/****** IFSelect_SessionFile::Read ******/
		/****** md5 signature: 32105add691a589dcd16d0b81c8dd7d5 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
int

Description
-----------
Performs a Read Operation from a file to a WorkSession i.e. calls ReadFile, then ReadSession and ReadEnd Returned Value is: 0 for OK, -1 File could not be opened, >0 Error during Read (see WriteSession) IsDone can be called too (will return True for OK).
") Read;
		Standard_Integer Read(Standard_CString filename);

		/****** IFSelect_SessionFile::ReadEnd ******/
		/****** md5 signature: 04b3e9077453f388e860118b0ce9c592 ******/
		%feature("compactdefaultargs") ReadEnd;
		%feature("autodoc", "Return
-------
int

Description
-----------
Reads the end of a file (its last line). Returns 0 if OK, status >0 in case of error (not a suitable end line).
") ReadEnd;
		Standard_Integer ReadEnd();

		/****** IFSelect_SessionFile::ReadFile ******/
		/****** md5 signature: af35933f568f030166c7c9d87f6a39f9 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Reads the recorded lines from a file named <name>, after having cleared the list (stops if RecognizeFile fails) Returns False (with no clearing) if the file could not be read.
") ReadFile;
		Standard_Boolean ReadFile(Standard_CString name);

		/****** IFSelect_SessionFile::ReadLine ******/
		/****** md5 signature: e284a22a44adfa94166a34668f8b3114 ******/
		%feature("compactdefaultargs") ReadLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Reads a Line and splits it into a set of alphanumeric items, which can then be queried by NbParams/ParamValue ...
") ReadLine;
		Standard_Boolean ReadLine();

		/****** IFSelect_SessionFile::ReadOwn ******/
		/****** md5 signature: d0606bc709fc73559f8685321bcac1cc ******/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Tries to Read an Item, by calling the Library of Dumpers Sets the list of parameters of the line to be read from the first own one.
") ReadOwn;
		Standard_Boolean ReadOwn(opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SessionFile::ReadSession ******/
		/****** md5 signature: 4101dcac505e26f22df2d0af36195ef1 ******/
		%feature("compactdefaultargs") ReadSession;
		%feature("autodoc", "Return
-------
int

Description
-----------
Performs a Read Operation from a File to a WorkSession, i.e. reads the list of line (which must have already been loaded, by ReadFile or by calls to AddLine) Important Remark: this excludes the reading of the last line, which is performed by ReadEnd Returns 0 for OK, >0 status for Read Error (not a suitable File, or WorkSession given as Immutable at Creation Time) IsDone can be called too (will return True for OK).
") ReadSession;
		Standard_Integer ReadSession();

		/****** IFSelect_SessionFile::RecognizeFile ******/
		/****** md5 signature: d6c94bd056bdf98bdb7d6a5944694344 ******/
		%feature("compactdefaultargs") RecognizeFile;
		%feature("autodoc", "
Parameters
----------
headerline: str

Return
-------
bool

Description
-----------
Recognizes the header line. returns True if OK, False else.
") RecognizeFile;
		Standard_Boolean RecognizeFile(Standard_CString headerline);

		/****** IFSelect_SessionFile::RemoveLastLine ******/
		/****** md5 signature: ed35097c51123c842aa92eeb14b910a4 ******/
		%feature("compactdefaultargs") RemoveLastLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the last line. Can be called recursively. Does nothing if the list is empty.
") RemoveLastLine;
		void RemoveLastLine();

		/****** IFSelect_SessionFile::SendItem ******/
		/****** md5 signature: 3286f6ab6fb08433ca37366f2824d397 ******/
		%feature("compactdefaultargs") SendItem;
		%feature("autodoc", "
Parameters
----------
par: Standard_Transient

Return
-------
None

Description
-----------
During a Write action, commands to send the identification of a Parameter: if it is Null (undefined) it is send as Void ($) if it is Named in the WorkSession, its Name is sent preceded by ':', else a relative Ident Number is sent preceded by '#' (relative to the present Write, i.e. starting at one, without skip, and counted part from Named Items).
") SendItem;
		void SendItem(const opencascade::handle<Standard_Transient> & par);

		/****** IFSelect_SessionFile::SendText ******/
		/****** md5 signature: ff6fba24544bdb20dd7d5b6b9c070585 ******/
		%feature("compactdefaultargs") SendText;
		%feature("autodoc", "
Parameters
----------
text: str

Return
-------
None

Description
-----------
During a Write action, commands to send a Text without interpretation. It will be sent as well.
") SendText;
		void SendText(Standard_CString text);

		/****** IFSelect_SessionFile::SendVoid ******/
		/****** md5 signature: 57e39e043394ecdca192085943c6d397 ******/
		%feature("compactdefaultargs") SendVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
During a Write action, commands to send a Void Parameter i.e. a Parameter which is present but undefined Its form will be the dollar sign: $.
") SendVoid;
		void SendVoid();

		/****** IFSelect_SessionFile::SetLastGeneral ******/
		/****** md5 signature: 8cd0b048cd3c79673ba82edbba05a979 ******/
		%feature("compactdefaultargs") SetLastGeneral;
		%feature("autodoc", "
Parameters
----------
lastgen: int

Return
-------
None

Description
-----------
Sets the rank of Last General Parameter to a new value. It is followed by the Fist Own Parameter of the item. Used by SessionFile after reading general parameters.
") SetLastGeneral;
		void SetLastGeneral(const Standard_Integer lastgen);

		/****** IFSelect_SessionFile::SetOwn ******/
		/****** md5 signature: aa9ead28af880aa173e8912d97e05dd2 ******/
		%feature("compactdefaultargs") SetOwn;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets Parameters to be sent as Own if <mode> is True (their Name or Number or Void Mark or Text Value is preceded by a Column sign ':') else they are sent normally Hence, the Own Parameter are clearly identified in the File.
") SetOwn;
		void SetOwn(const Standard_Boolean mode);

		/****** IFSelect_SessionFile::SplitLine ******/
		/****** md5 signature: 406d2a24f92eba1a0c6550644282c1bf ******/
		%feature("compactdefaultargs") SplitLine;
		%feature("autodoc", "
Parameters
----------
line: str

Return
-------
None

Description
-----------
Internal routine which processes a line into words and prepares its exploration.
") SplitLine;
		void SplitLine(Standard_CString line);

		/****** IFSelect_SessionFile::TextValue ******/
		/****** md5 signature: 2724c1badc7572789ff00cd170d570c6 ******/
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the content of a Text Parameter (without the quotes). Returns an empty string if the Parameter is not a Text.
") TextValue;
		TCollection_AsciiString TextValue(const Standard_Integer num);

		/****** IFSelect_SessionFile::WorkSession ******/
		/****** md5 signature: 804cdd58a69a7b9e571b7f1634f8cfa5 ******/
		%feature("compactdefaultargs") WorkSession;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_WorkSession>

Description
-----------
Returns the WorkSession on which a SessionFile works. Remark that it is returned as Immutable.
") WorkSession;
		opencascade::handle<IFSelect_WorkSession> WorkSession();

		/****** IFSelect_SessionFile::Write ******/
		/****** md5 signature: 4ad9bd7f549ded3804a9df3906579513 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
int

Description
-----------
Performs a Write Operation from a WorkSession to a File i.e. calls WriteSession then WriteEnd, and WriteFile Returned Value is: 0 for OK, -1 File could not be created, >0 Error during Write (see WriteSession) IsDone can be called too (will return True for OK).
") Write;
		Standard_Integer Write(Standard_CString filename);

		/****** IFSelect_SessionFile::WriteEnd ******/
		/****** md5 signature: ebd67493aceb3cb5ca76a180499ed0e5 ******/
		%feature("compactdefaultargs") WriteEnd;
		%feature("autodoc", "Return
-------
int

Description
-----------
Writes the trailing line. It is separate from WriteSession, in order to allow to redefine WriteSession without touching WriteEnd (WriteSession defines the body of the file) WriteEnd fills the list of lines. Returns a status of error, 0 if OK, >0 else.
") WriteEnd;
		Standard_Integer WriteEnd();

		/****** IFSelect_SessionFile::WriteFile ******/
		/****** md5 signature: 39eda0480b58ea116f5a9b2553c70a06 ******/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Writes the recorded lines to a file named <name> then clears the list of lines. Returns False (with no clearing) if the file could not be created.
") WriteFile;
		Standard_Boolean WriteFile(Standard_CString name);

		/****** IFSelect_SessionFile::WriteLine ******/
		/****** md5 signature: 614718ee56368b00f0d0d11ed8f12021 ******/
		%feature("compactdefaultargs") WriteLine;
		%feature("autodoc", "
Parameters
----------
line: str
follow: Standard_Character (optional, default to 0)

Return
-------
None

Description
-----------
Writes a line to the File. If <follow> is given, it is added at the following of the line. A newline must be added for the end.
") WriteLine;
		void WriteLine(Standard_CString line, const Standard_Character follow = 0);

		/****** IFSelect_SessionFile::WriteOwn ******/
		/****** md5 signature: 27828a81117f2e9d53a26b94b00560df ******/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Writes the Parameters own to each type of Item. Uses the Library of SessionDumpers Returns True if Done, False if <item> could not be treated (hence it remains written with no Own Parameter).
") WriteOwn;
		Standard_Boolean WriteOwn(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SessionFile::WriteSession ******/
		/****** md5 signature: 728b1b1e17d5f17868f266ae82d25936 ******/
		%feature("compactdefaultargs") WriteSession;
		%feature("autodoc", "Return
-------
int

Description
-----------
Prepares the Write operation from a WorkSession (IFSelect) to a File, i.e. fills the list of lines (the file itself remains to be written; or NbLines/Line may be called) Important Remark: this excludes the reading of the last line, which is performed by WriteEnd Returns 0 if OK, status > 0 in case of error.
") WriteSession;
		Standard_Integer WriteSession();

};


%extend IFSelect_SessionFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IFSelect_ShareOut *
**************************/
class IFSelect_ShareOut : public Standard_Transient {
	public:
		/****** IFSelect_ShareOut::IFSelect_ShareOut ******/
		/****** md5 signature: 743641f210fe36bcae9faadc10c10d64 ******/
		%feature("compactdefaultargs") IFSelect_ShareOut;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty ShareOut.
") IFSelect_ShareOut;
		 IFSelect_ShareOut();

		/****** IFSelect_ShareOut::AddDispatch ******/
		/****** md5 signature: 266c6f7fbe20ac5dfe58b5bca05a590b ******/
		%feature("compactdefaultargs") AddDispatch;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch

Return
-------
None

Description
-----------
Adds a Dispatch to the list.
") AddDispatch;
		void AddDispatch(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****** IFSelect_ShareOut::AddModif ******/
		/****** md5 signature: 834e075b7abbb07a49c7407aa8ac94e0 ******/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "
Parameters
----------
modifier: IFSelect_GeneralModifier
formodel: bool
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a Modifier to the list of Modifiers: Model Modifiers if <formodel> is True, File Modifiers else (internal).
") AddModif;
		void AddModif(const opencascade::handle<IFSelect_GeneralModifier> & modifier, const Standard_Boolean formodel, const Standard_Integer atnum = 0);

		/****** IFSelect_ShareOut::AddModifier ******/
		/****** md5 signature: 1f935b583e5e1d7195bd03e84b27cde2 ******/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "
Parameters
----------
modifier: IFSelect_GeneralModifier
atnum: int

Return
-------
None

Description
-----------
Sets a Modifier to be applied on all Dispatches to be run If <modifier> is a ModelModifier, adds it to the list of Model Modifiers; else to the list of File Modifiers By default (atnum = 0) at the end of the list, else at <atnum> Each Modifier is used, after each copy of a packet of Entities into a Model: its criteria are checked and if they are OK, the method Perform of this Modifier is run.
") AddModifier;
		void AddModifier(const opencascade::handle<IFSelect_GeneralModifier> & modifier, const Standard_Integer atnum);

		/****** IFSelect_ShareOut::AddModifier ******/
		/****** md5 signature: 21d07e73971dad0f41872796c64d3ee0 ******/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "
Parameters
----------
modifier: IFSelect_GeneralModifier
dispnum: int
atnum: int

Return
-------
None

Description
-----------
Sets a Modifier to be applied on the Dispatch <dispnum> If <modifier> is a ModelModifier, adds it to the list of Model Modifiers; else to the list of File Modifiers This is the same list as for all Dispatches, but the Modifier is qualified to be applied to one Dispatch only Then, <atnum> refers to the entire list By default (atnum = 0) at the end of the list, else at <atnum> Remark: if the Modifier was already in the list and if <atnum> = 0, the Modifier is not moved, but only qualified for a Dispatch.
") AddModifier;
		void AddModifier(const opencascade::handle<IFSelect_GeneralModifier> & modifier, const Standard_Integer dispnum, const Standard_Integer atnum);

		/****** IFSelect_ShareOut::ChangeModifierRank ******/
		/****** md5 signature: ebeacb4da2b8c655d353c2ca5f6f4282 ******/
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "
Parameters
----------
formodel: bool
befor: int
after: int

Return
-------
bool

Description
-----------
Changes the rank of a modifier in the list: Model Modifiers if <formodel> is True, File Modifiers else from <before> to <after> Returns True if done, False else (before or after out of range).
") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank(const Standard_Boolean formodel, const Standard_Integer befor, const Standard_Integer after);

		/****** IFSelect_ShareOut::Clear ******/
		/****** md5 signature: f95144dbbc6bd7b9cb03042bd63d7c5a ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
onlydisp: bool

Return
-------
None

Description
-----------
Removes in one operation all the Dispatches with their Idents Also clears all information about Names, and all Results but naming information which are: - kept if <onlydisp> is True. - cleared if <onlydisp> is False (complete clearing) If <onlydisp> is True, that's all. Else, clears also Modifiers.
") Clear;
		void Clear(const Standard_Boolean onlydisp);

		/****** IFSelect_ShareOut::ClearResult ******/
		/****** md5 signature: a5958cba0ec4c360c5bb289f047fd501 ******/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "
Parameters
----------
alsoname: bool

Return
-------
None

Description
-----------
Clears all data produced (apart from Dispatches, etc...) if <alsoname> is True, all is cleared. Else, information about produced Names are kept (to maintain unicity of naming across clearings).
") ClearResult;
		void ClearResult(const Standard_Boolean alsoname);

		/****** IFSelect_ShareOut::DefaultRootName ******/
		/****** md5 signature: 7c3493bd9f25af040ab0604c5a73e1f7 ******/
		%feature("compactdefaultargs") DefaultRootName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the Default Root Name. Can be empty.
") DefaultRootName;
		opencascade::handle<TCollection_HAsciiString> DefaultRootName();

		/****** IFSelect_ShareOut::Dispatch ******/
		/****** md5 signature: c0126f833323ca9c0b6faffd9e630bb4 ******/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_Dispatch>

Description
-----------
Returns a Dispatch, given its rank in the list.
") Dispatch;
		const opencascade::handle<IFSelect_Dispatch> & Dispatch(const Standard_Integer num);

		/****** IFSelect_ShareOut::DispatchRank ******/
		/****** md5 signature: dfbe0c683941ff8c0cafbd139068388c ******/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch

Return
-------
int

Description
-----------
Returns the Rank of a Dispatch, given its Value (Handle). Returns 0 if the Dispatch is unknown in the ShareOut.
") DispatchRank;
		Standard_Integer DispatchRank(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****** IFSelect_ShareOut::Extension ******/
		/****** md5 signature: d8451984f53a06cfa1d5728072a48bf8 ******/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the general Extension. Can be empty (not recommended).
") Extension;
		opencascade::handle<TCollection_HAsciiString> Extension();

		/****** IFSelect_ShareOut::FileName ******/
		/****** md5 signature: 8629d350d4d2147621599397ae714458 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "
Parameters
----------
dnum: int
pnum: int
nbpack: int (optional, default to 0)

Return
-------
TCollection_AsciiString

Description
-----------
Computes the complete file name for a Packet of a Dispatch, given Dispatch Number (Rank), Packet Number, and Count of Packets generated by this Dispatch (0 if unknown) //! File Name is made of following strings, concatenated: General Prefix, Root Name for Dispatch, Packet Suffix, and General Extension. If no Root Name is specified for a Dispatch, DefaultRootName is considered (and pnum is not used, but <thenbdefs> is incremented and used Error if no Root is defined for this <idnum>.
") FileName;
		TCollection_AsciiString FileName(const Standard_Integer dnum, const Standard_Integer pnum, const Standard_Integer nbpack = 0);

		/****** IFSelect_ShareOut::GeneralModifier ******/
		/****** md5 signature: 65ad361a1bfb20787109319f656494ef ******/
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "
Parameters
----------
formodel: bool
num: int

Return
-------
opencascade::handle<IFSelect_GeneralModifier>

Description
-----------
Returns a Modifier of the list, given its rank: Model Modifiers if <formodel> is True, File Modifiers else.
") GeneralModifier;
		opencascade::handle<IFSelect_GeneralModifier> GeneralModifier(const Standard_Boolean formodel, const Standard_Integer num);

		/****** IFSelect_ShareOut::HasRootName ******/
		/****** md5 signature: 5012cef6558aea1bb7ce5bd6e7f55065 ******/
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if the Dispatch of rank <num> has an attached Root Name. False else, or if num is out of range.
") HasRootName;
		Standard_Boolean HasRootName(const Standard_Integer num);

		/****** IFSelect_ShareOut::LastRun ******/
		/****** md5 signature: 7cbc1be465b904f50e5ce9c07cc73894 ******/
		%feature("compactdefaultargs") LastRun;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the rank of last run item (ClearResult resets it to 0).
") LastRun;
		Standard_Integer LastRun();

		/****** IFSelect_ShareOut::ModelModifier ******/
		/****** md5 signature: 7fcfa11e0ef0b39d7e68cd4126be10f0 ******/
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_Modifier>

Description
-----------
Returns a Modifier of the list of Model Modifiers, duely casted.
") ModelModifier;
		opencascade::handle<IFSelect_Modifier> ModelModifier(const Standard_Integer num);

		/****** IFSelect_ShareOut::ModifierRank ******/
		/****** md5 signature: fd129e92f0bd0fc99f40bf71dd5958c8 ******/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "
Parameters
----------
modifier: IFSelect_GeneralModifier

Return
-------
int

Description
-----------
Gives the rank of a Modifier in the list, 0 if not in the list Model Modifiers if <modifier> is kind of ModelModifer, File Modifiers else.
") ModifierRank;
		Standard_Integer ModifierRank(const opencascade::handle<IFSelect_GeneralModifier> & modifier);

		/****** IFSelect_ShareOut::NbDispatches ******/
		/****** md5 signature: 9ac32b66c4d436a99329f347793d6508 ******/
		%feature("compactdefaultargs") NbDispatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Dispatches.
") NbDispatches;
		Standard_Integer NbDispatches();

		/****** IFSelect_ShareOut::NbModifiers ******/
		/****** md5 signature: a0815984912b242e5ee3855cdf5a81a9 ******/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "
Parameters
----------
formodel: bool

Return
-------
int

Description
-----------
Returns count of Modifiers (which apply to complete Models): Model Modifiers if <formodel> is True, File Modifiers else.
") NbModifiers;
		Standard_Integer NbModifiers(const Standard_Boolean formodel);

		/****** IFSelect_ShareOut::Prefix ******/
		/****** md5 signature: 5bbf0f6d1a79843bd4a51453ffec8c03 ******/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the general Prefix. Can be empty.
") Prefix;
		opencascade::handle<TCollection_HAsciiString> Prefix();

		/****** IFSelect_ShareOut::RemoveDispatch ******/
		/****** md5 signature: c66127bbec44fa1d44cee5eb61049c63 ******/
		%feature("compactdefaultargs") RemoveDispatch;
		%feature("autodoc", "
Parameters
----------
rank: int

Return
-------
bool

Description
-----------
Removes a Dispatch, given its rank in the list Returns True if done, False if rank is not between (LastRun + 1) and (NbDispatches).
") RemoveDispatch;
		Standard_Boolean RemoveDispatch(const Standard_Integer rank);

		/****** IFSelect_ShareOut::RemoveItem ******/
		/****** md5 signature: 3d21325464cc0ceb3ee75dda2155f717 ******/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Removes an item, which can be, either a Dispatch (removed from the list of Dispatches), or a GeneralModifier (removed from the list of Model Modifiers or from the list of File Modifiers according to its type). Returns True if done, False if has not been found or if it is neither a Dispatch, nor a Modifier.
") RemoveItem;
		Standard_Boolean RemoveItem(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_ShareOut::RemoveModifier ******/
		/****** md5 signature: 2a21a7702f910e9805df6c6264da9366 ******/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "
Parameters
----------
formodel: bool
num: int

Return
-------
bool

Description
-----------
Removes a Modifier, given it rank in the list: Model Modifiers if <formodel> is True, File Modifiers else Returns True if done, False if <num> is out of range.
") RemoveModifier;
		Standard_Boolean RemoveModifier(const Standard_Boolean formodel, const Standard_Integer num);

		/****** IFSelect_ShareOut::RootName ******/
		/****** md5 signature: 979322dccddb38b0cf21411003fe7d73 ******/
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the Root bound to a Dispatch, given its rank Returns a Null Handle if not defined.
") RootName;
		opencascade::handle<TCollection_HAsciiString> RootName(const Standard_Integer num);

		/****** IFSelect_ShareOut::RootNumber ******/
		/****** md5 signature: 8dc08dc9c82f8e5e672ff5aa40d620ba ******/
		%feature("compactdefaultargs") RootNumber;
		%feature("autodoc", "
Parameters
----------
name: TCollection_HAsciiString

Return
-------
int

Description
-----------
Returns an integer value about a given root name: - positive: it's the rank of the Dispatch which has this name - null: this root name is unknown - negative (-1): this root name is the default root name.
") RootNumber;
		Standard_Integer RootNumber(const opencascade::handle<TCollection_HAsciiString> & name);

		/****** IFSelect_ShareOut::SetDefaultRootName ******/
		/****** md5 signature: f1e4be456fd7b4d64d802eda7ef4c255 ******/
		%feature("compactdefaultargs") SetDefaultRootName;
		%feature("autodoc", "
Parameters
----------
defrt: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Defines or Changes the Default Root Name to a new value (which is used for dispatches which have no attached root name). If this method is not called, DefaultRootName remains empty Returns True if OK, False if this Name is already attached, for a Dispatch or for Default.
") SetDefaultRootName;
		Standard_Boolean SetDefaultRootName(const opencascade::handle<TCollection_HAsciiString> & defrt);

		/****** IFSelect_ShareOut::SetExtension ******/
		/****** md5 signature: 44a62e3056a4560602ac971e2a9e3721 ******/
		%feature("compactdefaultargs") SetExtension;
		%feature("autodoc", "
Parameters
----------
ext: TCollection_HAsciiString

Return
-------
None

Description
-----------
Defines or Changes the general Extension (which is appended to complete file name generated). If this method is not call, Extension remains empty.
") SetExtension;
		void SetExtension(const opencascade::handle<TCollection_HAsciiString> & ext);

		/****** IFSelect_ShareOut::SetLastRun ******/
		/****** md5 signature: b63ec78f2b01f512d5db876ecd824b91 ******/
		%feature("compactdefaultargs") SetLastRun;
		%feature("autodoc", "
Parameters
----------
last: int

Return
-------
None

Description
-----------
Records a new value for the rank of last run item.
") SetLastRun;
		void SetLastRun(const Standard_Integer last);

		/****** IFSelect_ShareOut::SetPrefix ******/
		/****** md5 signature: 6492fb9a33aab1433baec7d10f94af00 ******/
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "
Parameters
----------
pref: TCollection_HAsciiString

Return
-------
None

Description
-----------
Defines or Changes the general Prefix (which is prepended to complete file name generated). If this method is not call, Prefix remains empty.
") SetPrefix;
		void SetPrefix(const opencascade::handle<TCollection_HAsciiString> & pref);

		/****** IFSelect_ShareOut::SetRootName ******/
		/****** md5 signature: d0c31941675b4dedaaebed34e4767ad4 ******/
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "
Parameters
----------
num: int
name: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Attaches a Root Name to a Dispatch given its rank, as an HAsciiString (standard form). A Null Handle resets this name. Returns True if OK, False if this Name is already attached, for a Dispatch or for Default, or <num> out of range.
") SetRootName;
		Standard_Boolean SetRootName(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & name);

};


%make_alias(IFSelect_ShareOut)

%extend IFSelect_ShareOut {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IFSelect_ShareOutResult *
********************************/
class IFSelect_ShareOutResult {
	public:
		/****** IFSelect_ShareOutResult::IFSelect_ShareOutResult ******/
		/****** md5 signature: 9e5c76d994a4e63ff75409ffe937d2c9 ******/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "
Parameters
----------
sho: IFSelect_ShareOut
mod: Interface_InterfaceModel

Return
-------
None

Description
-----------
Creates a ShareOutResult from a ShareOut, to work on a Model (without any more precision; uses Active Protocol).
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_ShareOut> & sho, const opencascade::handle<Interface_InterfaceModel> & mod);

		/****** IFSelect_ShareOutResult::IFSelect_ShareOutResult ******/
		/****** md5 signature: 03f797d52ee5f2fc891d24eacd063af3 ******/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "
Parameters
----------
sho: IFSelect_ShareOut
G: Interface_Graph

Return
-------
None

Description
-----------
Creates a ShareOutResult from a ShareOut, to work on a Graph already computed, which defines the Input Model and can specialize some Entities.
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_ShareOut> & sho, const Interface_Graph & G);

		/****** IFSelect_ShareOutResult::IFSelect_ShareOutResult ******/
		/****** md5 signature: 97eb965e5ca64ddd33cc9cf2b6f798ee ******/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch
mod: Interface_InterfaceModel

Return
-------
None

Description
-----------
Creates a ShareOutResult from a unique Dispatch, to work on a Model. As if it was a ShareOut with only one Dispatch (without any more precision; uses Active Protocol) Allows to compute the effect of a single Dispatch.
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_Dispatch> & disp, const opencascade::handle<Interface_InterfaceModel> & mod);

		/****** IFSelect_ShareOutResult::IFSelect_ShareOutResult ******/
		/****** md5 signature: 7a7618de8132f1b8b6876d9b5ba63a9b ******/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch
G: Interface_Graph

Return
-------
None

Description
-----------
Creates a ShareOutResult from a unique Dispatch, to work on a Graph. As if it was a ShareOut with only one Dispatch Allows to compute the effect of a single Dispatch.
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_Dispatch> & disp, const Interface_Graph & G);

		/****** IFSelect_ShareOutResult::Dispatch ******/
		/****** md5 signature: bb780838e863dc0373f20cb1226e9297 ******/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Dispatch>

Description
-----------
Returns the current Dispatch.
") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch();

		/****** IFSelect_ShareOutResult::DispatchRank ******/
		/****** md5 signature: 0e9f760c80c45cf9519cc6cd47b6b28f ******/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Rank of the current Dispatch in the ShareOut Returns Zero if there is none (iteration finished).
") DispatchRank;
		Standard_Integer DispatchRank();

		/****** IFSelect_ShareOutResult::Evaluate ******/
		/****** md5 signature: d3114edc05ed53814d8d7a8c5bd4b713 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Evaluates the result of a ShareOut: determines Entities to be forgotten by the ShareOut, Entities to be transferred several times (duplicated), prepares an iteration on the packets to be produced Called the first time anyone question is asked, or after a call to Reset. Works by calling the method Prepare.
") Evaluate;
		void Evaluate();

		/****** IFSelect_ShareOutResult::FileName ******/
		/****** md5 signature: 403f67c4638b8a808f68c91981c71440 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the File Name which corresponds to current Packet (computed by ShareOut) If current Packet has no associated name (see ShareOut), the returned value is Null.
") FileName;
		TCollection_AsciiString FileName();

		/****** IFSelect_ShareOutResult::Graph ******/
		/****** md5 signature: 6a234e0475ae0da1c7d268d231e44a78 ******/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
Returns the Graph used to create theShareOutResult.
") Graph;
		const Interface_Graph & Graph();

		/****** IFSelect_ShareOutResult::More ******/
		/****** md5 signature: f2144011648ae849666b28430a27a0ea ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is more packets in the current Dispatch, else if there is more Dispatch in the ShareOut.
") More;
		Standard_Boolean More();

		/****** IFSelect_ShareOutResult::NbPackets ******/
		/****** md5 signature: df5e91b9b515934ada05bf2552f4bf0c ******/
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total count of produced non empty packets (in out: calls Evaluate as necessary).
") NbPackets;
		Standard_Integer NbPackets();

		/****** IFSelect_ShareOutResult::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Passes to the next Packet in the current Dispatch, or if there is none, to the next Dispatch in the ShareOut.
") Next;
		void Next();

		/****** IFSelect_ShareOutResult::NextDispatch ******/
		/****** md5 signature: 8be3eaa466cfda5af3c33c7f454d38e5 ******/
		%feature("compactdefaultargs") NextDispatch;
		%feature("autodoc", "Return
-------
None

Description
-----------
Passes to the next Dispatch, regardless about remaining packets.
") NextDispatch;
		void NextDispatch();

		/****** IFSelect_ShareOutResult::PacketContent ******/
		/****** md5 signature: bc95d3fa9d167cd69d7de6d98bb41754 ******/
		%feature("compactdefaultargs") PacketContent;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the complete content of the current Packet (i.e. with shared entities, which will also be put in the file).
") PacketContent;
		Interface_EntityIterator PacketContent();

		/****** IFSelect_ShareOutResult::PacketRoot ******/
		/****** md5 signature: 7b9b48cb960a9ab32ea0baa9c9829e30 ******/
		%feature("compactdefaultargs") PacketRoot;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of Roots of the current Packet (never empty) (i.e. the Entities to be themselves asked for transfer) Error if there is none (iteration finished).
") PacketRoot;
		Interface_EntityIterator PacketRoot();

		/****** IFSelect_ShareOutResult::Packets ******/
		/****** md5 signature: b4205107e1be9e46587677293b78084b ******/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "
Parameters
----------
complete: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<IFSelect_PacketList>

Description
-----------
Returns the list of recorded Packets, under two modes: - <complete> = False, the strict definition of Packets, i.e. for each one, the Root Entities, to be explicitly sent - <complete> = True (Default), the completely evaluated list, i.e. which really gives the destination of each entity: this mode allows to evaluate duplications Remark that to send packets, iteration remains preferable (file names are managed).
") Packets;
		opencascade::handle<IFSelect_PacketList> Packets(const Standard_Boolean complete = Standard_True);

		/****** IFSelect_ShareOutResult::PacketsInDispatch ******/
		/****** md5 signature: 4f0fd360a71aecddf08631e8ceb48a61 ******/
		%feature("compactdefaultargs") PacketsInDispatch;
		%feature("autodoc", "
Parameters
----------

Return
-------
numpack: int
nbpacks: int

Description
-----------
Returns Number (rank) of current Packet in current Dispatch, and total count of Packets in current Dispatch, as arguments.
") PacketsInDispatch;
		void PacketsInDispatch(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IFSelect_ShareOutResult::Prepare ******/
		/****** md5 signature: 5ee620612e682585a58bf99ed2cacf7d ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prepares the iteration on the packets This method is called by Evaluate, but can be called anytime The iteration consists in taking each Dispatch of the ShareOut beginning by the first one, compute its packets, then iterate on these packets. Once all these packets are iterated, the iteration passes to the next Dispatch, or stops. For a creation from a unique Dispatch, same but with only this Dispatch. Each packet can be listed, or really transferred (producing a derived Model, from which a file can be generated) //! Prepare sets the iteration to the first Dispatch, first Packet.
") Prepare;
		void Prepare();

		/****** IFSelect_ShareOutResult::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases computed data, in order to command a new Evaluation.
") Reset;
		void Reset();

		/****** IFSelect_ShareOutResult::ShareOut ******/
		/****** md5 signature: a67462b99cdf1a92bbc727d8b86a57fc ******/
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_ShareOut>

Description
-----------
Returns the ShareOut used to create the ShareOutResult if creation from a Dispatch, returns a Null Handle.
") ShareOut;
		opencascade::handle<IFSelect_ShareOut> ShareOut();

};


%extend IFSelect_ShareOutResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IFSelect_Signature *
***************************/
%nodefaultctor IFSelect_Signature;
class IFSelect_Signature : public Interface_SignType {
	public:
		/****** IFSelect_Signature::AddCase ******/
		/****** md5 signature: 792fed3fa58363715dfcb0249374d419 ******/
		%feature("compactdefaultargs") AddCase;
		%feature("autodoc", "
Parameters
----------
acase: str

Return
-------
None

Description
-----------
Adds a possible case To be called when creating, IF the list of possible cases for Value is known when starting For instance, for CDL types, rather do not fill this, but for a specific enumeration (such as a status), can be used.
") AddCase;
		void AddCase(Standard_CString acase);

		/****** IFSelect_Signature::CaseList ******/
		/****** md5 signature: 5b07c3fbe5d7bd548d4ebf205f3fae5d ******/
		%feature("compactdefaultargs") CaseList;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>

Description
-----------
Returns the predefined list of possible cases, filled by AddCase Null Handle if no predefined list (hence, to be counted) Useful to filter on really possible vase, for instance, or for a help.
") CaseList;
		opencascade::handle<TColStd_HSequenceOfAsciiString> CaseList();

		/****** IFSelect_Signature::IntValue ******/
		/****** md5 signature: a3efe9cd570d2214928aaa8c630c57e4 ******/
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
str

Description
-----------
This procedure converts an Integer to a CString It is a convenient way when the value of a signature has the form of a simple integer value The value is to be used immediately (one buffer only, no copy).
") IntValue;
		static Standard_CString IntValue(const Standard_Integer val);

		/****** IFSelect_Signature::IsIntCase ******/
		/****** md5 signature: 1aa4e85c1e8a2536c5778c68f1fc5e0d ******/
		%feature("compactdefaultargs") IsIntCase;
		%feature("autodoc", "
Parameters
----------

Return
-------
hasmin: bool
valmin: int
hasmax: bool
valmax: int

Description
-----------
Tells if this Signature gives integer values and returns values from SetIntCase if True.
") IsIntCase;
		Standard_Boolean IsIntCase(Standard_Boolean &OutValue, Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Integer &OutValue);

		/****** IFSelect_Signature::Label ******/
		/****** md5 signature: d9ee8fc21d5224585b4d8e9dd30f8b00 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
The label of a Signature uses its name as follow: 'Signature: <name>'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_Signature::MatchValue ******/
		/****** md5 signature: 95cc2aabcdae6107c7210b43df05098f ******/
		%feature("compactdefaultargs") MatchValue;
		%feature("autodoc", "
Parameters
----------
val: str
text: str
exact: bool

Return
-------
bool

Description
-----------
Default procedure to tell if a value <val> matches a text with a criterium <exact>. <exact> = True requires equality, else only contained (no reg-exp).
") MatchValue;
		static Standard_Boolean MatchValue(Standard_CString val, TCollection_AsciiString text, const Standard_Boolean exact);

		/****** IFSelect_Signature::Matches ******/
		/****** md5 signature: 25b571cf97f17f16507fa37183f9efa7 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: str
exact: bool

Return
-------
bool

Description
-----------
Tells if the value for <ent> in <model> matches a text, with a criterium <exact>. The default definition calls MatchValue Can be redefined.
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, TCollection_AsciiString text, const Standard_Boolean exact);

		/****** IFSelect_Signature::Name ******/
		/****** md5 signature: f35e373630f40191cc40cd61094fa98a ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns an identification of the Signature (a word), given at initialization time Returns the Signature for a Transient object. It is specific of each sub-class of Signature. For a Null Handle, it should provide '' It can work with the model which contains the entity.
") Name;
		Standard_CString Name();

		/****** IFSelect_Signature::SetIntCase ******/
		/****** md5 signature: 388e6f31fa1650afe25c0ac6d962f2c1 ******/
		%feature("compactdefaultargs") SetIntCase;
		%feature("autodoc", "
Parameters
----------
hasmin: bool
valmin: int
hasmax: bool
valmax: int

Return
-------
None

Description
-----------
Sets the information data to tell 'integer cases' with possible min and max values To be called when creating.
") SetIntCase;
		void SetIntCase(const Standard_Boolean hasmin, const Standard_Integer valmin, const Standard_Boolean hasmax, const Standard_Integer valmax);

};


%make_alias(IFSelect_Signature)

%extend IFSelect_Signature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SignatureList *
*******************************/
class IFSelect_SignatureList : public Standard_Transient {
	public:
		/****** IFSelect_SignatureList::IFSelect_SignatureList ******/
		/****** md5 signature: 617d160cc74b87de389f479b17de80c7 ******/
		%feature("compactdefaultargs") IFSelect_SignatureList;
		%feature("autodoc", "
Parameters
----------
withlist: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a SignatureList. If <withlist> is True, entities will be not only counted per signature, but also listed.
") IFSelect_SignatureList;
		 IFSelect_SignatureList(const Standard_Boolean withlist = Standard_False);

		/****** IFSelect_SignatureList::Add ******/
		/****** md5 signature: 7ced6483bca29148b1ef0b198e2d9fd7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
sign: str

Return
-------
None

Description
-----------
Adds an entity with its signature, i.e.: - counts an item more for <sign> - if record-list status is set, records the entity Accepts a null entity (the signature is then for the global model). But if the string is empty, counts a Null item. //! If SignOnly Mode is set, this work is replaced by just setting LastValue.
") Add;
		void Add(const opencascade::handle<Standard_Transient> & ent, Standard_CString sign);

		/****** IFSelect_SignatureList::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		virtual void Clear();

		/****** IFSelect_SignatureList::Entities ******/
		/****** md5 signature: f1bca8e0ebbd131d7c9ed5e560f83cdc ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "
Parameters
----------
sign: str

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of entities attached to a signature It is empty if <sign> has not been recorded It is a Null Handle if the list of entities is not known.
") Entities;
		opencascade::handle<TColStd_HSequenceOfTransient> Entities(Standard_CString sign);

		/****** IFSelect_SignatureList::HasEntities ******/
		/****** md5 signature: 46f4f7dae74e18c284e18a5f8162ac98 ******/
		%feature("compactdefaultargs") HasEntities;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the list of Entities is acknowledged, else the method Entities will always return a Null Handle.
") HasEntities;
		Standard_Boolean HasEntities();

		/****** IFSelect_SignatureList::Init ******/
		/****** md5 signature: 2e9264f76b6b94cbbead6ecf86e6651a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
name: str
count: NCollection_IndexedDataMap<TCollection_AsciiString, int>
list: Standard_Transient
nbnuls: int

Return
-------
None

Description
-----------
Aknowledges the list in once. Name identifies the Signature.
") Init;
		void Init(Standard_CString name, const NCollection_IndexedDataMap<TCollection_AsciiString, Standard_Integer> & count, const NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & list, const Standard_Integer nbnuls);

		/****** IFSelect_SignatureList::LastValue ******/
		/****** md5 signature: 122bd08c1221c9c0bf5730c64c0a8a77 ******/
		%feature("compactdefaultargs") LastValue;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the last value recorded by Add (only if SignMode set) Cleared by Clear or Init.
") LastValue;
		Standard_CString LastValue();

		/****** IFSelect_SignatureList::List ******/
		/****** md5 signature: 8dc7679cdd22aa66cae030db33c24418 ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "
Parameters
----------
root: str (optional, default to "")

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of signatures, as a sequence of strings (but without their respective counts). It is ordered. By default, for all the signatures. If <root> is given non empty, for the signatures which begin by <root>.
") List;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> List(Standard_CString root = "");


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModeSignOnly() {
            return (Standard_Boolean) $self->ModeSignOnly();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModeSignOnly(Standard_Boolean value) {
            $self->ModeSignOnly()=value;
            }
        };
		/****** IFSelect_SignatureList::Name ******/
		/****** md5 signature: 4bbe2b58331ae651e1fa6526c574b2e9 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the recorded Name. Remark: default is '...' (no SetName called).
") Name;
		virtual Standard_CString Name();

		/****** IFSelect_SignatureList::NbNulls ******/
		/****** md5 signature: cfa593b3c6472cd03b18541b1ee8bb0e ******/
		%feature("compactdefaultargs") NbNulls;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of null entities.
") NbNulls;
		Standard_Integer NbNulls();

		/****** IFSelect_SignatureList::NbTimes ******/
		/****** md5 signature: d3928dd8d786be332f5b830bb575825d ******/
		%feature("compactdefaultargs") NbTimes;
		%feature("autodoc", "
Parameters
----------
sign: str

Return
-------
int

Description
-----------
Returns the number of times a signature was counted, 0 if it has not been recorded at all.
") NbTimes;
		Standard_Integer NbTimes(Standard_CString sign);

		/****** IFSelect_SignatureList::PrintCount ******/
		/****** md5 signature: 52dc9956b3be6f0fa8745979cb86a350 ******/
		%feature("compactdefaultargs") PrintCount;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Prints the counts of items (not the list).
") PrintCount;
		virtual void PrintCount(std::ostream &OutValue);

		/****** IFSelect_SignatureList::PrintList ******/
		/****** md5 signature: bcbb5a17846c2054455e1d0575bea15a ******/
		%feature("compactdefaultargs") PrintList;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
mod: IFSelect_PrintCount (optional, default to IFSelect_ListByItem)

Return
-------
S: Standard_OStream

Description
-----------
Prints the lists of items, if they are present (else, prints a message 'no list available') Uses <model> to determine for each entity to be listed, its number, and its specific identifier (by PrintLabel) <mod> gives a mode for printing: - CountByItem: just count (as PrintCount) - ShortByItem: minimum i.e. count plus 5 first entity numbers - ShortByItem(D) complete list of entity numbers (0: 'Global') - EntitiesByItem: list of (entity number/PrintLabel from the model) other modes are ignored.
") PrintList;
		virtual void PrintList(std::ostream &OutValue, const opencascade::handle<Interface_InterfaceModel> & model, const IFSelect_PrintCount mod = IFSelect_ListByItem);

		/****** IFSelect_SignatureList::PrintSum ******/
		/****** md5 signature: 12295d942889bf52eeb33b08fd2a6899 ******/
		%feature("compactdefaultargs") PrintSum;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Prints a summary Item which has the greatest count of entities For items which are numeric values: their count, maximum, minimum values, cumul, average.
") PrintSum;
		virtual void PrintSum(std::ostream &OutValue);

		/****** IFSelect_SignatureList::SetList ******/
		/****** md5 signature: b238846d95b165f74a942ebb6e50644f ******/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "
Parameters
----------
withlist: bool

Return
-------
None

Description
-----------
Changes the record-list status. The list is not cleared but its use changes.
") SetList;
		void SetList(const Standard_Boolean withlist);

		/****** IFSelect_SignatureList::SetName ******/
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
Defines a name for a SignatureList (used to print it).
") SetName;
		void SetName(Standard_CString name);

};


%make_alias(IFSelect_SignatureList)

%extend IFSelect_SignatureList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_Transformer *
*****************************/
%nodefaultctor IFSelect_Transformer;
class IFSelect_Transformer : public Standard_Transient {
	public:
		/****** IFSelect_Transformer::ChangeProtocol ******/
		/****** md5 signature: 2fd7ec0bc37d62ac5279aa66ec99add9 ******/
		%feature("compactdefaultargs") ChangeProtocol;
		%feature("autodoc", "
Parameters
----------
newproto: Interface_Protocol

Return
-------
bool

Description
-----------
This methods allows to declare that the Protocol applied to the new Model has changed. It applies to the last call to Perform. //! Returns True if the Protocol has changed, False else. The provided default keeps the starting Protocol. This method should be redefined as required by the effect of Perform.
") ChangeProtocol;
		virtual Standard_Boolean ChangeProtocol(opencascade::handle<Interface_Protocol> & newproto);

		/****** IFSelect_Transformer::Label ******/
		/****** md5 signature: 458d8d95170c9aa9c0a465eba36c0e6b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text which defines the way a Transformer works (to identify the transformation it performs).
") Label;
		virtual TCollection_AsciiString Label();

		/****** IFSelect_Transformer::Perform ******/
		/****** md5 signature: 3943f0bcb223a865698c1e1a57574b3f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
protocol: Interface_Protocol
checks: Interface_CheckIterator
newmod: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Performs a Transformation (defined by each sub-class): <G> gives the input data (especially the starting model) and can be used for queries (by Selections, etc...) <protocol> allows to work with General Services as necessary (it applies to input data) If the change corresponds to a conversion to a new protocol, see also the method ChangeProtocol <checks> stores produced checks messages if any <newmod> gives the result of the transformation: - if it is Null (i.e. has not been affected), the transformation has been made on the spot, it is assumed to cause no change to the graph of dependances - if it equates the starting Model, it has been transformed on the spot (possibiliy some entities were replaced inside it) - if it is new, it corresponds to a new data set which replaces the starting one //! <self> is mutable to allow results for ChangeProtocol to be memorized if needed, and to store information useful for the method Updated //! Returns True if Done, False if an Error occurred: in this case, if a new data set has been produced, the transformation is ignored, else data may be corrupted.
") Perform;
		virtual Standard_Boolean Perform(const Interface_Graph & G, const opencascade::handle<Interface_Protocol> & protocol, Interface_CheckIterator & checks, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****** IFSelect_Transformer::Updated ******/
		/****** md5 signature: f2c6a42f1c9bf077ccbacd69a8e20215 ******/
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "
Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient

Return
-------
bool

Description
-----------
This method allows to know what happened to a starting entity after the last Perform. If <entfrom> (from starting model) has one and only one known item which corresponds in the new produced model, this method must return True and fill the argument <entto>. Else, it returns False.
") Updated;
		virtual Standard_Boolean Updated(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto);

};


%make_alias(IFSelect_Transformer)

%extend IFSelect_Transformer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_WorkLibrary *
*****************************/
%nodefaultctor IFSelect_WorkLibrary;
class IFSelect_WorkLibrary : public Standard_Transient {
	public:
		/****** IFSelect_WorkLibrary::CopyModel ******/
		/****** md5 signature: db5b5d4891f31e9b4ed047a0e96d5d45 ******/
		%feature("compactdefaultargs") CopyModel;
		%feature("autodoc", "
Parameters
----------
original: Interface_InterfaceModel
newmodel: Interface_InterfaceModel
list: Interface_EntityIterator
TC: Interface_CopyTool

Return
-------
bool

Description
-----------
Performs the copy of entities from an original model to a new one. It must also copy headers if any. Returns True when done. The provided default works by copying the individual entities designated in the list, by using the general service class CopyTool. It can be redefined for a norm which, either implements Copy by another way (do not forget to Bind each copied result with its original entity in TC) and returns True, or does not know how to copy and returns False.
") CopyModel;
		virtual Standard_Boolean CopyModel(const opencascade::handle<Interface_InterfaceModel> & original, const opencascade::handle<Interface_InterfaceModel> & newmodel, const Interface_EntityIterator & list, Interface_CopyTool & TC);

		/****** IFSelect_WorkLibrary::DumpEntity ******/
		/****** md5 signature: f8408c5a3c33881cd6f64d4f853e5b90 ******/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
protocol: Interface_Protocol
entity: Standard_Transient
level: int

Return
-------
S: Standard_OStream

Description
-----------
Gives the way of dumping an entity under a form comprehensive for each norm. <model> helps to identify, number ... entities. <level> is to be interpreted for each norm (because of the formats which can be very different).
") DumpEntity;
		virtual void DumpEntity(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol, const opencascade::handle<Standard_Transient> & entity, std::ostream &OutValue, const Standard_Integer level);

		/****** IFSelect_WorkLibrary::DumpEntity ******/
		/****** md5 signature: d4ac4e0fc19594eff493ccd280b9aab2 ******/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
protocol: Interface_Protocol
entity: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Calls deferred DumpEntity with the recorded default level.
") DumpEntity;
		void DumpEntity(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol, const opencascade::handle<Standard_Transient> & entity, std::ostream &OutValue);

		/****** IFSelect_WorkLibrary::DumpHelp ******/
		/****** md5 signature: f61ff69745dfa047c7a47cefecb0fa1c ******/
		%feature("compactdefaultargs") DumpHelp;
		%feature("autodoc", "
Parameters
----------
level: int

Return
-------
str

Description
-----------
Returns the help line recorded for <level>, or an empty string.
") DumpHelp;
		Standard_CString DumpHelp(const Standard_Integer level);

		/****** IFSelect_WorkLibrary::DumpLevels ******/
		/****** md5 signature: 529ddb4236462ef77f450e8a022e3d8e ******/
		%feature("compactdefaultargs") DumpLevels;
		%feature("autodoc", "
Parameters
----------

Return
-------
def: int
max: int

Description
-----------
Returns the recorded default and maximum dump levels If none was recorded, max is returned negative, def as zero.
") DumpLevels;
		void DumpLevels(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IFSelect_WorkLibrary::ReadFile ******/
		/****** md5 signature: fe6b60049f66a434e42bea5788b5b985 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
name: str
model: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
int

Description
-----------
Gives the way to Read a File and transfer it to a Model <mod> is the resulting Model, which has to be created by this method. In case of error, <mod> must be returned Null Return value is a status with free values. Simply, 0 is for 'Execution OK' The Protocol can be used to work (e.g. create the Model, read and recognize the Entities).
") ReadFile;
		virtual Standard_Integer ReadFile(Standard_CString name, opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol);

		/****** IFSelect_WorkLibrary::ReadStream ******/
		/****** md5 signature: 7d642d9553aebd964841d2f9dbcaac5a ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theName: str
theIStream: str
model: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
int

Description
-----------
Interface to read a data from the specified stream. 
Parameter model is the resulting Model, which has to be created by this method. In case of error, model must be returned Null Return value is a status: 0 - OK, 1 - read failure, -1 - stream failure. //! Default implementation returns 1 (error).
") ReadStream;
		virtual Standard_Integer ReadStream(Standard_CString theName, std::istream & theIStream, opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol);

		/****** IFSelect_WorkLibrary::SetDumpHelp ******/
		/****** md5 signature: 52f5d8333bece08989ec0f399b1dcc5d ******/
		%feature("compactdefaultargs") SetDumpHelp;
		%feature("autodoc", "
Parameters
----------
level: int
help: str

Return
-------
None

Description
-----------
Records a short line of help for a level (0 - max).
") SetDumpHelp;
		void SetDumpHelp(const Standard_Integer level, Standard_CString help);

		/****** IFSelect_WorkLibrary::SetDumpLevels ******/
		/****** md5 signature: 21d4e6a7431b11e62e82eb90cee676f0 ******/
		%feature("compactdefaultargs") SetDumpLevels;
		%feature("autodoc", "
Parameters
----------
def: int
max: int

Return
-------
None

Description
-----------
Records a default level and a maximum value for level level for DumpEntity can go between 0 and <max> default value will be <def>.
") SetDumpLevels;
		void SetDumpLevels(const Standard_Integer def, const Standard_Integer max);

		/****** IFSelect_WorkLibrary::WriteFile ******/
		/****** md5 signature: 4a5c937c1624a07b50e0018985e1414c ******/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "
Parameters
----------
ctx: IFSelect_ContextWrite

Return
-------
bool

Description
-----------
Gives the way to Write a File from a Model. <ctx> contains all necessary information: the model, the protocol, the file name, and the list of File Modifiers to be applied, also with restricted list of selected entities for each one, if required. In return, it brings the produced check-list //! The WorkLibrary has to query <applied> to get then run the ContextWrite by looping like this (example): for (numap = 1; numap <= ctx.NbModifiers(); numap ++) { ctx.SetModifier (numap); cast ctx.FileModifier() to specific type -> variable filemod if (!filemod.IsNull()) filemod->Perform (ctx,writer); filemod then works with ctx. It can, either act on the model itself (for instance on its header), or iterate on selected entities (Start/Next/More/Value) it can call AddFail or AddWarning, as necessary }.
") WriteFile;
		virtual Standard_Boolean WriteFile(IFSelect_ContextWrite & ctx);

};


%make_alias(IFSelect_WorkLibrary)

%extend IFSelect_WorkLibrary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_WorkSession *
*****************************/
class IFSelect_WorkSession : public Standard_Transient {
	public:
		/****** IFSelect_WorkSession::IFSelect_WorkSession ******/
		/****** md5 signature: 3590bb1b7be50b9af5edf9d1a53dfbfe ******/
		%feature("compactdefaultargs") IFSelect_WorkSession;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Work Session It provides default, empty ShareOut and ModelCopier, which can be replaced (if required, should be done just after creation).
") IFSelect_WorkSession;
		 IFSelect_WorkSession();

		/****** IFSelect_WorkSession::AddItem ******/
		/****** md5 signature: 2ba4f0bb951acb9f492e80152bb1a36e ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient
active: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Adds an Item and returns its attached Ident. Does nothing if <item> is already recorded (and returns its attached Ident) <active> if True commands call to SetActive (see below) Remark: the determined Ident is used if <item> is a Dispatch, to fill the ShareOut.
") AddItem;
		Standard_Integer AddItem(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean active = Standard_True);

		/****** IFSelect_WorkSession::AddNamedItem ******/
		/****** md5 signature: 736438f1f777d23e8e1ca4df36f26ab7 ******/
		%feature("compactdefaultargs") AddNamedItem;
		%feature("autodoc", "
Parameters
----------
name: str
item: Standard_Transient
active: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Adds an Item with an attached Name. If the Name is already known in the WorkSession, the older item losts it Returns Ident if Done, 0 else, i.e. if <item> is null If <name> is empty, works as AddItem (i.e. with no name) If <item> is already known but with no attached Name, this method tries to attached a Name to it <active> if True commands call to SetActive (see below).
") AddNamedItem;
		Standard_Integer AddNamedItem(Standard_CString name, const opencascade::handle<Standard_Transient> & item, const Standard_Boolean active = Standard_True);

		/****** IFSelect_WorkSession::AppliedDispatches ******/
		/****** md5 signature: 94c59edc2da25d825dd24e1d23fcb8dc ******/
		%feature("compactdefaultargs") AppliedDispatches;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfInteger>

Description
-----------
Returns the ordered list of dispatches stored by the ShareOut.
") AppliedDispatches;
		opencascade::handle<TColStd_HSequenceOfInteger> AppliedDispatches();

		/****** IFSelect_WorkSession::BeginSentFiles ******/
		/****** md5 signature: 96b7739806debf5e39e1945990896d5b ******/
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "
Parameters
----------
record: bool

Return
-------
None

Description
-----------
Commands file sending to clear the list of already sent files, commands to record a new one if <record> is True This list is managed by the ModelCopier when SendSplit is called It allows a global exploitation of the set of sent files.
") BeginSentFiles;
		void BeginSentFiles(const Standard_Boolean record);

		/****** IFSelect_WorkSession::CategoryName ******/
		/****** md5 signature: fe5468462213d0f14e83c9c9416f1c98 ******/
		%feature("compactdefaultargs") CategoryName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
str

Description
-----------
Returns the Category Name determined for an entity it is computed by the class Category Remark: an unknown entity gives an empty string.
") CategoryName;
		Standard_CString CategoryName(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::CategoryNumber ******/
		/****** md5 signature: 4d7b0b22e0a14e3ca4b5666d61fea57d ******/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Returns the Category Number determined for an entity it is computed by the class Category An unknown entity (number 0) gives a value -1.
") CategoryNumber;
		Standard_Integer CategoryNumber(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::ChangeModifierRank ******/
		/****** md5 signature: 1a9b4aae2b699bf7fd4c390abc8ab4c3 ******/
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "
Parameters
----------
formodel: bool
before: int
after: int

Return
-------
bool

Description
-----------
Changes the Rank of a Modifier in the Session: Model Modifiers if <formodel> is True, File Modifiers else the Modifier n0 <before> is put to n0 <after> Return True if Done, False if <before> or <after> out of range.
") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank(const Standard_Boolean formodel, const Standard_Integer before, const Standard_Integer after);

		/****** IFSelect_WorkSession::CheckOne ******/
		/****** md5 signature: b298e5a2d898c55d98dae3821ba73a18 ******/
		%feature("compactdefaultargs") CheckOne;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
complete: bool (optional, default to Standard_True)

Return
-------
Interface_CheckIterator

Description
-----------
Returns a Check for a single entity, under the form of a CheckIterator (this gives only one form for the user) if <ent> is Null or equates the current Model, it gives the Global Check, else the Check for the given entity <complete> as for ModelCheckList.
") CheckOne;
		Interface_CheckIterator CheckOne(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean complete = Standard_True);

		/****** IFSelect_WorkSession::ClearData ******/
		/****** md5 signature: 44bfb3d19c6421e702d0e3ed8b6c5ea2 ******/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
None

Description
-----------
Clears recorded data (not the items) according mode: 1: all Data: Model, Graph, CheckList, + ClearData 4 2: Graph and CheckList (they will then be recomputed later) 3: CheckList (it will be recomputed by ComputeCheck) 4: just content of SelectPointed and Counters Plus 0: does nothing but called by SetModel ClearData is virtual, hence it can be redefined to clear other data of a specialised Work Session.
") ClearData;
		virtual void ClearData(const Standard_Integer mode);

		/****** IFSelect_WorkSession::ClearFile ******/
		/****** md5 signature: 00d692695064cbec934992520500d75e ******/
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases all stored data from the File Evaluation (i.e. ALL former naming information are lost).
") ClearFile;
		void ClearFile();

		/****** IFSelect_WorkSession::ClearFinalModifiers ******/
		/****** md5 signature: ffb34a4c6a327f5a6438115b4c0d4c79 ******/
		%feature("compactdefaultargs") ClearFinalModifiers;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the Modifiers active in the ModelCopier: they become inactive and they are removed from the Session.
") ClearFinalModifiers;
		void ClearFinalModifiers();

		/****** IFSelect_WorkSession::ClearItems ******/
		/****** md5 signature: 8fc4e4364726518659b9e1557e92dcbd ******/
		%feature("compactdefaultargs") ClearItems;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all the recorded Items: Selections, Dispatches, Modifiers, and Strings & IntParams, with their Idents & Names. Remark that if a Model has been loaded, it is not cleared.
") ClearItems;
		void ClearItems();

		/****** IFSelect_WorkSession::ClearShareOut ******/
		/****** md5 signature: 4e98b98b20923a4f8e374c2821b7c655 ******/
		%feature("compactdefaultargs") ClearShareOut;
		%feature("autodoc", "
Parameters
----------
onlydisp: bool

Return
-------
None

Description
-----------
Clears the list of Dispatches recorded by the ShareOut if <only> disp is True, tha's all. Else, clears also the lists of Modifiers recorded by the ShareOut.
") ClearShareOut;
		void ClearShareOut(const Standard_Boolean onlydisp);

		/****** IFSelect_WorkSession::CombineAdd ******/
		/****** md5 signature: 7a13fbb39ab9c92b766fed37dde1f3bb ******/
		%feature("compactdefaultargs") CombineAdd;
		%feature("autodoc", "
Parameters
----------
selcomb: IFSelect_Selection
seladd: IFSelect_Selection
atnum: int (optional, default to 0)

Return
-------
int

Description
-----------
Adds an input selection to a SelectCombine (Union or Inters.). Returns new count of inputs for this SelectCombine if Done or 0 if <sel> is not kind of SelectCombine, or if <seladd> or <sel> is not in the WorkSession By default, adding is done at the end of the list Else, it is an insertion to rank <atnum> (useful for Un-ReDo).
") CombineAdd;
		Standard_Integer CombineAdd(const opencascade::handle<IFSelect_Selection> & selcomb, const opencascade::handle<IFSelect_Selection> & seladd, const Standard_Integer atnum = 0);

		/****** IFSelect_WorkSession::CombineRemove ******/
		/****** md5 signature: 194e4e1184bb423b35d0317bcc6b90a9 ******/
		%feature("compactdefaultargs") CombineRemove;
		%feature("autodoc", "
Parameters
----------
selcomb: IFSelect_Selection
selrem: IFSelect_Selection

Return
-------
bool

Description
-----------
Removes an input selection from a SelectCombine (Union or Intersection). Returns True if done, False if <selcomb> is not kind of SelectCombine or <selrem> is not source of <selcomb>.
") CombineRemove;
		Standard_Boolean CombineRemove(const opencascade::handle<IFSelect_Selection> & selcomb, const opencascade::handle<IFSelect_Selection> & selrem);

		/****** IFSelect_WorkSession::ComputeCheck ******/
		/****** md5 signature: fc8877ffd690e8f5f4c80d1a6500349b ******/
		%feature("compactdefaultargs") ComputeCheck;
		%feature("autodoc", "
Parameters
----------
enforce: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Computes the CheckList for the Model currently loaded It can then be used for displays, queries ... Returns True if OK, False else (i.e. no Protocol set, or Model absent). If <enforce> is False, works only if not already done or if a new Model has been loaded from last call. Remark: computation is enforced by every call to SetModel or RunTransformer.
") ComputeCheck;
		Standard_Boolean ComputeCheck(const Standard_Boolean enforce = Standard_False);

		/****** IFSelect_WorkSession::ComputeCounter ******/
		/****** md5 signature: d93b204bb7627307599b333023d40680 ******/
		%feature("compactdefaultargs") ComputeCounter;
		%feature("autodoc", "
Parameters
----------
counter: IFSelect_SignCounter
forced: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Computes the content of a SignCounter when it is defined with a Selection, then returns True Returns False if the SignCounter is not defined with a Selection, or if its Selection Mode is inhibited <forced> to work around optimisations.
") ComputeCounter;
		Standard_Boolean ComputeCounter(const opencascade::handle<IFSelect_SignCounter> & counter, const Standard_Boolean forced = Standard_False);

		/****** IFSelect_WorkSession::ComputeCounterFromList ******/
		/****** md5 signature: 8359b7ef991de2aef90ada25f3d49680 ******/
		%feature("compactdefaultargs") ComputeCounterFromList;
		%feature("autodoc", "
Parameters
----------
counter: IFSelect_SignCounter
list: TColStd_HSequenceOfTransient
clear: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Computes the content of a SignCounter from an input list If <list> is Null, uses internal definition of the Counter: a Selection, else the whole Model (recomputation forced) If <clear> is True (D), starts from scratch Else, cumulates computations.
") ComputeCounterFromList;
		Standard_Boolean ComputeCounterFromList(const opencascade::handle<IFSelect_SignCounter> & counter, const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Standard_Boolean clear = Standard_True);

		/****** IFSelect_WorkSession::ComputeGraph ******/
		/****** md5 signature: 93f0ae027020183b405c7abf39b5b54c ******/
		%feature("compactdefaultargs") ComputeGraph;
		%feature("autodoc", "
Parameters
----------
enforce: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Computes the Graph used for Selections, Displays ... If a HGraph is already set, with same model as given by method Model, does nothing. Else, computes a new Graph. If <enforce> is given True, computes a new Graph anyway. Remark that a call to ClearGraph will cause ComputeGraph to really compute a new Graph Returns True if Graph is OK, False else (i.e. if no Protocol is set, or if Model is absent or empty).
") ComputeGraph;
		Standard_Boolean ComputeGraph(const Standard_Boolean enforce = Standard_False);

		/****** IFSelect_WorkSession::DefaultFileRoot ******/
		/****** md5 signature: 76f361e0849c95f490d6a4485ae45c8c ******/
		%feature("compactdefaultargs") DefaultFileRoot;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the defined Default File Root. It is used for Dispatches which have no specific root attached. Null Handle if not defined.
") DefaultFileRoot;
		opencascade::handle<TCollection_HAsciiString> DefaultFileRoot();

		/****** IFSelect_WorkSession::Dispatch ******/
		/****** md5 signature: 6e9dba48c8f48c694220969de236530d ******/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_Dispatch>

Description
-----------
Returns a Dispatch, given its Ident in the Session Null result if <id> is not suitable for a Dispatch (undefined, or defined for another kind of variable).
") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch(const Standard_Integer id);

		/****** IFSelect_WorkSession::DispatchRank ******/
		/****** md5 signature: dfbe0c683941ff8c0cafbd139068388c ******/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch

Return
-------
int

Description
-----------
Returns the rank of a Dispatch in the ShareOut, or 0 if <disp> is not in the ShareOut or not in the WorkSession.
") DispatchRank;
		Standard_Integer DispatchRank(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****** IFSelect_WorkSession::DumpEntity ******/
		/****** md5 signature: f990cff2a6a7f265e11d7bac988dbbd6 ******/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
level: int

Return
-------
S: Standard_OStream

Description
-----------
Dumps a starting entity according to the current norm. To do this, it calls DumpEntity from WorkLibrary. <level> is to be interpreted for each norm: see specific classes of WorkLibrary for it. Generally, 0 if for very basic (only type ...), greater values give more and more details.
") DumpEntity;
		void DumpEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer level, std::ostream &OutValue);

		/****** IFSelect_WorkSession::DumpModel ******/
		/****** md5 signature: d1b07e5d32687faa97f239407098b2d6 ******/
		%feature("compactdefaultargs") DumpModel;
		%feature("autodoc", "
Parameters
----------
level: int

Return
-------
S: Standard_OStream

Description
-----------
Lists the content of the Input Model (if there is one) According level: 0 -> gives only count of Entities and Roots 1 -> Lists also Roots; 2 -> Lists all Entities (by TraceType) 3 -> Performs a call to CheckList (Fails) and lists the result 4 -> as 3 but all CheckList (Fails + Warnings) 5,6,7: as 3 but resp. Count,List,Labels by Fail 8,9,10: as 4 but resp. Count,List,Labels by message.
") DumpModel;
		void DumpModel(const Standard_Integer level, std::ostream &OutValue);

		/****** IFSelect_WorkSession::DumpSelection ******/
		/****** md5 signature: 678949be99cdcf061da9cb44548ea4f4 ******/
		%feature("compactdefaultargs") DumpSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Lists a Selection and its Sources (see SelectionIterator), given its rank in the list.
") DumpSelection;
		void DumpSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::DumpShare ******/
		/****** md5 signature: d669419ad9297aa66dd0ae334d014cbc ******/
		%feature("compactdefaultargs") DumpShare;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dumps contents of the ShareOut (on 'cout').
") DumpShare;
		void DumpShare();

		/****** IFSelect_WorkSession::EntityLabel ******/
		/****** md5 signature: 41d07cec95b5ada84e3724f6d6e63363 ******/
		%feature("compactdefaultargs") EntityLabel;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the label for <ent>, as the Model does If <ent> is not in the Model or if no Model is loaded, a Null Handle is returned.
") EntityLabel;
		opencascade::handle<TCollection_HAsciiString> EntityLabel(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::EntityName ******/
		/****** md5 signature: 61570c939b30f6e04b128659199fa825 ******/
		%feature("compactdefaultargs") EntityName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the Name of an Entity This Name is computed by the general service Name Returns a Null Handle if fails.
") EntityName;
		opencascade::handle<TCollection_HAsciiString> EntityName(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::ErrorHandle ******/
		/****** md5 signature: 1f8036506b5b043342f3ab6af1622d94 ******/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Error Handler status.
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****** IFSelect_WorkSession::EvalSelection ******/
		/****** md5 signature: bfb79f278033738ecf36a81b7a08e910 ******/
		%feature("compactdefaultargs") EvalSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
Interface_EntityIterator

Description
-----------
Evaluates the effect of a Selection applied on the input Model Returned Result remains empty if no input Model has been set.
") EvalSelection;
		Interface_EntityIterator EvalSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::EvalSplit ******/
		/****** md5 signature: 686553e314c9c915aa92f509d01a0fd8 ******/
		%feature("compactdefaultargs") EvalSplit;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_PacketList>

Description
-----------
Returns an Evaluation of the whole ShareOut definition: i.e. how the entities of the starting model are forecast to be sent to various files: list of packets according the dispatches, effective lists of roots for each packet (which determine the content of the corresponding file); plus evaluation of which entities are: forgotten (sent into no file), duplicated (sent into more than one file), sent into a given file. See the class PacketList for more details.
") EvalSplit;
		opencascade::handle<IFSelect_PacketList> EvalSplit();

		/****** IFSelect_WorkSession::EvaluateComplete ******/
		/****** md5 signature: 93a154e5e4d7ae01aa5611ae7f32813f ******/
		%feature("compactdefaultargs") EvaluateComplete;
		%feature("autodoc", "
Parameters
----------
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Displays the effect of applying the ShareOut on the input Model. <mode> = 0 (default): displays only roots for each packet, <mode> = 1: displays all entities for each packet, plus duplicated entities <mode> = 2: same as <mode> = 1, plus displays forgotten entities (which are in no packet at all).
") EvaluateComplete;
		void EvaluateComplete(const Standard_Integer mode = 0);

		/****** IFSelect_WorkSession::EvaluateDispatch ******/
		/****** md5 signature: d02dfc9af679b44ff744911d94efa670 ******/
		%feature("compactdefaultargs") EvaluateDispatch;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Displays the result of applying a Dispatch on the input Model (also shows Remainder if there is) <mode> = 0 (default), displays nothing else <mode> = 1: displays also duplicated entities (because of this dispatch) <mode> = 2: displays the entities of the starting Model which are not taken by this dispatch (forgotten entities) <mode> = 3: displays both duplicated and forgotten entities Remark: EvaluateComplete displays these data evaluated for for all the dispatches, if there are several.
") EvaluateDispatch;
		void EvaluateDispatch(const opencascade::handle<IFSelect_Dispatch> & disp, const Standard_Integer mode = 0);

		/****** IFSelect_WorkSession::EvaluateFile ******/
		/****** md5 signature: fd154556856381374f925701b3204990 ******/
		%feature("compactdefaultargs") EvaluateFile;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs and stores a File Evaluation. The Results are a List of produced Models and a List of names (Strings), in parallel Fills LastRunCheckList.
") EvaluateFile;
		void EvaluateFile();

		/****** IFSelect_WorkSession::EvaluateSelection ******/
		/****** md5 signature: f9778073dd0b93ad4ea12f0cdcae00de ******/
		%feature("compactdefaultargs") EvaluateSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Displays the list of Entities selected by a Selection (i.e. the result of EvalSelection).
") EvaluateSelection;
		void EvaluateSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::FileExtension ******/
		/****** md5 signature: d97afbfc71aad716c4080d3125028038 ******/
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the defined File Extension. Null Handle if not defined.
") FileExtension;
		opencascade::handle<TCollection_HAsciiString> FileExtension();

		/****** IFSelect_WorkSession::FileModel ******/
		/****** md5 signature: e7ebafed780641c5418e50b756d6cfe8 ******/
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns a Model, given its rank in the Evaluation List.
") FileModel;
		opencascade::handle<Interface_InterfaceModel> FileModel(const Standard_Integer num);

		/****** IFSelect_WorkSession::FileName ******/
		/****** md5 signature: b2588c3658582d921f5c74ad9b5353f2 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of a file corresponding to a produced Model, given its rank in the Evaluation List.
") FileName;
		TCollection_AsciiString FileName(const Standard_Integer num);

		/****** IFSelect_WorkSession::FilePrefix ******/
		/****** md5 signature: 2a089741355b029c51a1e7e430302c16 ******/
		%feature("compactdefaultargs") FilePrefix;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the defined File Prefix. Null Handle if not defined.
") FilePrefix;
		opencascade::handle<TCollection_HAsciiString> FilePrefix();

		/****** IFSelect_WorkSession::FileRoot ******/
		/****** md5 signature: 6128fa26d865e6e4554b98d0fe63533e ******/
		%feature("compactdefaultargs") FileRoot;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the File Root defined for a Dispatch. Null if no Root Name is defined for it (hence, no File will be produced).
") FileRoot;
		opencascade::handle<TCollection_HAsciiString> FileRoot(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****** IFSelect_WorkSession::FinalModifierIdents ******/
		/****** md5 signature: 313c53766a6ff4aa1d9d1532f7666caa ******/
		%feature("compactdefaultargs") FinalModifierIdents;
		%feature("autodoc", "
Parameters
----------
formodel: bool

Return
-------
opencascade::handle<TColStd_HSequenceOfInteger>

Description
-----------
Fills a Sequence with a list of Idents, those attached to the Modifiers applied to final sending. Model Modifiers if <formodel> is True, File Modifiers else This list is given in the order in which they will be applied (which takes into account the Changes to Modifier Ranks).
") FinalModifierIdents;
		opencascade::handle<TColStd_HSequenceOfInteger> FinalModifierIdents(const Standard_Boolean formodel);

		/****** IFSelect_WorkSession::GeneralModifier ******/
		/****** md5 signature: 4310729e060bd6ea83940ba4efe70eed ******/
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_GeneralModifier>

Description
-----------
Returns a Modifier, given its Ident in the Session Null result if <id> is not suitable for a Modifier (undefined, or defined for another kind of variable).
") GeneralModifier;
		opencascade::handle<IFSelect_GeneralModifier> GeneralModifier(const Standard_Integer id);

		/****** IFSelect_WorkSession::GetModeStat ******/
		/****** md5 signature: 03ccade5c68d171caace83f6c5f02345 ******/
		%feature("compactdefaultargs") GetModeStat;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return value of mode defining of filling selection during loading.
") GetModeStat;
		Standard_Boolean GetModeStat();

		/****** IFSelect_WorkSession::GiveFileComplete ******/
		/****** md5 signature: 1247eff38c1782c84de458497d335c69 ******/
		%feature("compactdefaultargs") GiveFileComplete;
		%feature("autodoc", "
Parameters
----------
file: str

Return
-------
str

Description
-----------
Completes a file name as required, with Prefix and Extension (if defined; for a non-defined item, completes nothing).
") GiveFileComplete;
		Standard_CString GiveFileComplete(Standard_CString file);

		/****** IFSelect_WorkSession::GiveFileRoot ******/
		/****** md5 signature: c99880fd6445cdb93e8e5b259e121dbb ******/
		%feature("compactdefaultargs") GiveFileRoot;
		%feature("autodoc", "
Parameters
----------
file: str

Return
-------
str

Description
-----------
Extracts File Root Name from a given complete file name (uses OSD_Path).
") GiveFileRoot;
		Standard_CString GiveFileRoot(Standard_CString file);

		/****** IFSelect_WorkSession::GiveList ******/
		/****** md5 signature: 4bca4d5724ad519a68e85d9dda679748 ******/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Determines a list of entities from an object: <obj> already HSequenceOfTransient: returned itself <obj> Selection: its Result of Evaluation is returned <obj> an entity of the Model: a HSequence which contains it else, an empty HSequence <obj> the Model it self: ALL its content (not only the roots).
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const opencascade::handle<Standard_Transient> & obj);

		/****** IFSelect_WorkSession::GiveList ******/
		/****** md5 signature: 97668f9eec00d5b9865925cdfdd4bca2 ******/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "
Parameters
----------
first: str
second: str (optional, default to "")

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Computes a List of entities from two alphanums, first and second, as follows: if <first> is a Number or Label of an entity: this entity if <first> is a list of Numbers/Labels: the list of entities if <first> is the name of a Selection in <WS>, and <second> not defined, the standard result of this Selection else, let's consider 'first second': this whole phrase is split by blanks, as follows (RECURSIVE CALL): - the leftest term is the final selection - the other terms define the result of the selection - and so on (the 'leftest minus one' is a selection, of which the input is given by the remaining ...).
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(Standard_CString first, Standard_CString second = "");

		/****** IFSelect_WorkSession::GiveListCombined ******/
		/****** md5 signature: 50ed957a633c524c90881f765cc28f20 ******/
		%feature("compactdefaultargs") GiveListCombined;
		%feature("autodoc", "
Parameters
----------
l1: TColStd_HSequenceOfTransient
l2: TColStd_HSequenceOfTransient
mode: int

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Combines two lists and returns the result, according to mode: <mode> < 0: entities in <l1> AND NOT in <l2> <mode> = 0: entities in <l1> AND in <l2> <mode> > 0: entities in <l1> OR in <l2>.
") GiveListCombined;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveListCombined(const opencascade::handle<TColStd_HSequenceOfTransient> & l1, const opencascade::handle<TColStd_HSequenceOfTransient> & l2, const Standard_Integer mode);

		/****** IFSelect_WorkSession::GiveListFromList ******/
		/****** md5 signature: 45cdbed754a81f3930fc7962c5907e61 ******/
		%feature("compactdefaultargs") GiveListFromList;
		%feature("autodoc", "
Parameters
----------
selname: str
ent: Standard_Transient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Computes a List of entities from the model as follows <first> being a Selection or a combination of Selections, <ent> being an entity or a list of entities (as a HSequenceOfTransient): the standard result of this selection applied to this list if <ent> is Null, the standard definition of the selection is used (which contains a default input selection) if <selname> is erroneous, a null handle is returned //! REMARK: selname is processed as <first second> of preceding GiveList.
") GiveListFromList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveListFromList(Standard_CString selname, const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::GiveSelection ******/
		/****** md5 signature: e7bdb5970e9ecb00b538d69fec32ab68 ******/
		%feature("compactdefaultargs") GiveSelection;
		%feature("autodoc", "
Parameters
----------
selname: str

Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns a Selection from a Name: - the name of a Selection: this Selection - the name of a Signature + criteria between (..): a new Selection from this Signature - an entity or a list of entities: a new SelectPointed Else, returns a Null Handle.
") GiveSelection;
		opencascade::handle<IFSelect_Selection> GiveSelection(Standard_CString selname);

		/****** IFSelect_WorkSession::Graph ******/
		/****** md5 signature: 85b94047fc558166dc241ea6e5d26215 ******/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
Returns the Computed Graph, for Read only.
") Graph;
		const Interface_Graph & Graph();

		/****** IFSelect_WorkSession::HGraph ******/
		/****** md5 signature: 268ad43c33e7822038e1fe175225a444 ******/
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HGraph>

Description
-----------
Returns the Computed Graph as HGraph (Null Handle if not set).
") HGraph;
		opencascade::handle<Interface_HGraph> HGraph();

		/****** IFSelect_WorkSession::HasModel ******/
		/****** md5 signature: db25e718411e452d99df991da304cdf3 ******/
		%feature("compactdefaultargs") HasModel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True is a Model has been set.
") HasModel;
		Standard_Boolean HasModel();

		/****** IFSelect_WorkSession::HasName ******/
		/****** md5 signature: f489bd18e6696d866a74d06f0e87d676 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if an Item of the WorkSession has an attached Name.
") HasName;
		Standard_Boolean HasName(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_WorkSession::IntParam ******/
		/****** md5 signature: 4580da0fc1da7c6ebea81b8b134d0342 ******/
		%feature("compactdefaultargs") IntParam;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns an IntParam, given its Ident in the Session Null result if <id> is not suitable for an IntParam (undefined, or defined for another kind of variable).
") IntParam;
		opencascade::handle<IFSelect_IntParam> IntParam(const Standard_Integer id);

		/****** IFSelect_WorkSession::IntValue ******/
		/****** md5 signature: 6df8db46d8ca39c6b0c598f88056d95e ******/
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "
Parameters
----------
it: IFSelect_IntParam

Return
-------
int

Description
-----------
Returns Integer Value of an IntParam.
") IntValue;
		Standard_Integer IntValue(const opencascade::handle<IFSelect_IntParam> & it);

		/****** IFSelect_WorkSession::IsLoaded ******/
		/****** md5 signature: 5ed802f56c3a94dc70391badb380a6ed ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Model is defined and really loaded (not empty), a Protocol is set and a Graph has been computed. In this case, the WorkSession can start to work.
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****** IFSelect_WorkSession::IsReversedSelectExtract ******/
		/****** md5 signature: 9d0d40555ac05518aa0261cd00f86b14 ******/
		%feature("compactdefaultargs") IsReversedSelectExtract;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
bool

Description
-----------
Returns True if <sel> a Reversed SelectExtract, False else.
") IsReversedSelectExtract;
		Standard_Boolean IsReversedSelectExtract(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::Item ******/
		/****** md5 signature: 132f1a8cbf2d87a24c33c9654317b9aa ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an Item, given its Ident. Returns a Null Handle if no Item corresponds to this Ident.
") Item;
		opencascade::handle<Standard_Transient> Item(const Standard_Integer id);

		/****** IFSelect_WorkSession::ItemIdent ******/
		/****** md5 signature: c0bb85f5bfbf2ff656a0c075d8e848df ******/
		%feature("compactdefaultargs") ItemIdent;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
int

Description
-----------
Returns the Ident attached to an Item in the WorkSession, or Zero if it is unknown.
") ItemIdent;
		Standard_Integer ItemIdent(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_WorkSession::ItemIdents ******/
		/****** md5 signature: f52b498d34523b439bb963eac07a86dc ******/
		%feature("compactdefaultargs") ItemIdents;
		%feature("autodoc", "
Parameters
----------
type: Standard_Type

Return
-------
opencascade::handle<TColStd_HSequenceOfInteger>

Description
-----------
Fills a Sequence with the List of Idents attached to the Items of which Type complies with (IsKind) <type> (alphabetic order) Remark: <type> = TYPE(Standard_Transient) gives all the Idents which are suitable in the WorkSession.
") ItemIdents;
		opencascade::handle<TColStd_HSequenceOfInteger> ItemIdents(const opencascade::handle<Standard_Type> & type);

		/****** IFSelect_WorkSession::ItemLabel ******/
		/****** md5 signature: 5c395d828e11322209d78f62dcdd99cf ******/
		%feature("compactdefaultargs") ItemLabel;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a Label which illustrates the content of an Item, given its Ident. This Label is: - for a Text Parameter, 'Text:<text value>' - for an Integer Parameter, 'Integer:<integer value>' - for a Selection, a Dispatch or a Modifier, its Label (see these classes) - for any other kind of Variable, its cdl type.
") ItemLabel;
		opencascade::handle<TCollection_HAsciiString> ItemLabel(const Standard_Integer id);

		/****** IFSelect_WorkSession::ItemNames ******/
		/****** md5 signature: f2cbd78e305cc2e7a1f0ee7eb7911051 ******/
		%feature("compactdefaultargs") ItemNames;
		%feature("autodoc", "
Parameters
----------
type: Standard_Type

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Fills a Sequence with the list of the Names attached to Items of which Type complies with (IsKind) <type> (alphabetic order) Remark: <type> = TYPE(Standard_Transient) gives all the Names.
") ItemNames;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> ItemNames(const opencascade::handle<Standard_Type> & type);

		/****** IFSelect_WorkSession::ItemNamesForLabel ******/
		/****** md5 signature: 41ac431e11ca2cf7caff9d3a999774b9 ******/
		%feature("compactdefaultargs") ItemNamesForLabel;
		%feature("autodoc", "
Parameters
----------
label: str

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Fills a Sequence with the NAMES of the control items, of which the label matches <label> (contain it): see NextIdentForLabel Search mode is fixed to 'contained' If <label> is empty, returns all Names.
") ItemNamesForLabel;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> ItemNamesForLabel(Standard_CString label);

		/****** IFSelect_WorkSession::ItemSelection ******/
		/****** md5 signature: 956eda2c30cfefc248c7413783399d39 ******/
		%feature("compactdefaultargs") ItemSelection;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the Selection of a Dispatch or a GeneralModifier. Returns a Null Handle if none is defined or <item> not good type.
") ItemSelection;
		opencascade::handle<IFSelect_Selection> ItemSelection(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_WorkSession::LastRunCheckList ******/
		/****** md5 signature: 385ecc28f78a04ef0156063988eb0c6f ******/
		%feature("compactdefaultargs") LastRunCheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns the Check List produced by the last execution of either: EvaluateFile(for Split), SendSplit, SendAll, SendSelected, RunTransformer-RunModifier Cleared by SetModel or ClearData(1) The field is protected, hence a specialized WorkSession may fill it.
") LastRunCheckList;
		Interface_CheckIterator LastRunCheckList();

		/****** IFSelect_WorkSession::ListEntities ******/
		/****** md5 signature: 7dcb72658ee62c200859aa51b254701d ******/
		%feature("compactdefaultargs") ListEntities;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator
mode: int

Return
-------
S: Standard_OStream

Description
-----------
Internal method which displays an EntityIterator <mode> 0 gives short display (only entity numbers) 1 gives a more complete trace (1 line per Entity) (can be used each time a trace has to be output from a list) 2 gives a form suitable for givelist: (n1,n2,n3...).
") ListEntities;
		void ListEntities(const Interface_EntityIterator & iter, const Standard_Integer mode, std::ostream &OutValue);

		/****** IFSelect_WorkSession::ListFinalModifiers ******/
		/****** md5 signature: b6f48db447f14a56611601af586a67c5 ******/
		%feature("compactdefaultargs") ListFinalModifiers;
		%feature("autodoc", "
Parameters
----------
formodel: bool

Return
-------
None

Description
-----------
Lists the Modifiers of the session (for each one, displays its Label). Listing is done following Ranks (Modifiers are invoked following their ranks) Model Modifiers if <formodel> is True, File Modifiers else.
") ListFinalModifiers;
		void ListFinalModifiers(const Standard_Boolean formodel);

		/****** IFSelect_WorkSession::ListItems ******/
		/****** md5 signature: 683ddff48d5f3d3d6d4ec6e71a193c84 ******/
		%feature("compactdefaultargs") ListItems;
		%feature("autodoc", "
Parameters
----------
label: str (optional, default to "")

Return
-------
None

Description
-----------
Lists the Labels of all Items of the WorkSession If <label> is defined, lists labels which contain it.
") ListItems;
		void ListItems(Standard_CString label = "");

		/****** IFSelect_WorkSession::LoadedFile ******/
		/****** md5 signature: cd8186f0319b05e7f10c031208799d3c ******/
		%feature("compactdefaultargs") LoadedFile;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the filename used to load current model empty if unknown.
") LoadedFile;
		Standard_CString LoadedFile();

		/****** IFSelect_WorkSession::MaxIdent ******/
		/****** md5 signature: 77c22d5a5b7fd8e9eb6d83243211ef9c ******/
		%feature("compactdefaultargs") MaxIdent;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Maximum Value for an Item Identifier. It can be greater to the count of known Items, because some can have been removed.
") MaxIdent;
		Standard_Integer MaxIdent();

		/****** IFSelect_WorkSession::MaxSendingCount ******/
		/****** md5 signature: 45e0fad1b2c16e3e07b24501a553972f ******/
		%feature("compactdefaultargs") MaxSendingCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the greater count of different files in which any of the starting entities could be sent. Before any file output, this count is 0. Ideal count is 1. More than 1 means that duplications occur.
") MaxSendingCount;
		Standard_Integer MaxSendingCount();

		/****** IFSelect_WorkSession::Model ******/
		/****** md5 signature: e485d2c2a2cfa9af3cc655f00e076be4 ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model of the Work Session (Null Handle if none) should be C++: return const &.
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****** IFSelect_WorkSession::ModelCheckList ******/
		/****** md5 signature: 58a6f423123e100fdaf4cf8cf70713dc ******/
		%feature("compactdefaultargs") ModelCheckList;
		%feature("autodoc", "
Parameters
----------
complete: bool (optional, default to Standard_True)

Return
-------
Interface_CheckIterator

Description
-----------
Returns the Check List for the Model currently loaded: <complete> = True: complete (syntactic & semantic messages), computed if not yet done <complete> = False: only syntactic (check file form).
") ModelCheckList;
		Interface_CheckIterator ModelCheckList(const Standard_Boolean complete = Standard_True);

		/****** IFSelect_WorkSession::ModelCopier ******/
		/****** md5 signature: ad7ee3ce8061cc1adc1d6ccdcfb01632 ******/
		%feature("compactdefaultargs") ModelCopier;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_ModelCopier>

Description
-----------
Gives access to the complete ModelCopier.
") ModelCopier;
		const opencascade::handle<IFSelect_ModelCopier> & ModelCopier();

		/****** IFSelect_WorkSession::ModelModifier ******/
		/****** md5 signature: cf8080f3bc00a23c230710114ac1ca85 ******/
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_Modifier>

Description
-----------
Returns a Model Modifier, given its Ident in the Session, i.e. typed as a Modifier (not simply a GeneralModifier) Null result if <id> is not suitable for a Modifier (undefined, or defined for another kind of variable).
") ModelModifier;
		opencascade::handle<IFSelect_Modifier> ModelModifier(const Standard_Integer id);

		/****** IFSelect_WorkSession::ModifierRank ******/
		/****** md5 signature: 1e05c613e9e851b9336b134d58bfe203 ******/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "
Parameters
----------
item: IFSelect_GeneralModifier

Return
-------
int

Description
-----------
Returns the Rank of a Modifier given its Ident. Model or File Modifier according its type (ModelModifier or not) Remember that Modifiers are applied sequentially following their Rank: first Model Modifiers then File Modifiers Rank is given by rank of call to AddItem and can be changed by ChangeModifierRank.
") ModifierRank;
		Standard_Integer ModifierRank(const opencascade::handle<IFSelect_GeneralModifier> & item);

		/****** IFSelect_WorkSession::Name ******/
		/****** md5 signature: 4eb988c37c62d2064ec5a737a0caf819 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the Name attached to an Item as a Variable of this WorkSession. If <item> is Null or not recorded, returns an empty string.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_WorkSession::NameIdent ******/
		/****** md5 signature: b544ec8c9aae179a44211339c01e944d ******/
		%feature("compactdefaultargs") NameIdent;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the Ident attached to a Name, 0 if name not recorded.
") NameIdent;
		Standard_Integer NameIdent(Standard_CString name);

		/****** IFSelect_WorkSession::NamedItem ******/
		/****** md5 signature: 302deb3c11d9f50a82fa45a13797af54 ******/
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Item which corresponds to a Variable, given its Name (whatever the type of this Item). Returns a Null Handle if this Name is not recorded.
") NamedItem;
		opencascade::handle<Standard_Transient> NamedItem(Standard_CString name);

		/****** IFSelect_WorkSession::NamedItem ******/
		/****** md5 signature: bfe651ccce454616f8543444833ecfc7 ******/
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "
Parameters
----------
name: TCollection_HAsciiString

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Same as above, but <name> is given through a Handle Especially useful with methods SelectionNames, etc...
") NamedItem;
		opencascade::handle<Standard_Transient> NamedItem(const opencascade::handle<TCollection_HAsciiString> & name);

		/****** IFSelect_WorkSession::NbFiles ******/
		/****** md5 signature: f4ff740bb702aab2feb817a0f407ce9c ******/
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of produced Models.
") NbFiles;
		Standard_Integer NbFiles();

		/****** IFSelect_WorkSession::NbFinalModifiers ******/
		/****** md5 signature: 71b68f79e3e588c28221dab42073c56e ******/
		%feature("compactdefaultargs") NbFinalModifiers;
		%feature("autodoc", "
Parameters
----------
formodel: bool

Return
-------
int

Description
-----------
Returns the count of Modifiers applied to final sending Model Modifiers if <formodel> is True, File Modifiers else (i.e. Modifiers which apply once the Models have been filled).
") NbFinalModifiers;
		Standard_Integer NbFinalModifiers(const Standard_Boolean formodel);

		/****** IFSelect_WorkSession::NbSources ******/
		/****** md5 signature: 6684d46b361e61e86c6cd30a2d338206 ******/
		%feature("compactdefaultargs") NbSources;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
int

Description
-----------
Returns the count of Input Selections known for a Selection, or 0 if <sel> not in the WorkSession. This count is one for a SelectDeduct / SelectExtract kind, two for SelectControl kind, variable for a SelectCombine (Union/Intersection), zero else.
") NbSources;
		Standard_Integer NbSources(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::NbStartingEntities ******/
		/****** md5 signature: 1c3d9ea9a72aae2d0993be716f6c341d ******/
		%feature("compactdefaultargs") NbStartingEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Entities stored in the Model, or 0.
") NbStartingEntities;
		Standard_Integer NbStartingEntities();

		/****** IFSelect_WorkSession::NewIntParam ******/
		/****** md5 signature: 19feaedf11ea76301401b0c4ed4eed4d ******/
		%feature("compactdefaultargs") NewIntParam;
		%feature("autodoc", "
Parameters
----------
name: str (optional, default to "")

Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Creates a new IntParam. A Name can be set (Optional) Returns the created IntParam, or a Null Handle in case of Failure (see AddItem/AddNamedItem).
") NewIntParam;
		opencascade::handle<IFSelect_IntParam> NewIntParam(Standard_CString name = "");

		/****** IFSelect_WorkSession::NewParamFromStatic ******/
		/****** md5 signature: 465eeca8f66472ff58410161834efa3c ******/
		%feature("compactdefaultargs") NewParamFromStatic;
		%feature("autodoc", "
Parameters
----------
statname: str
name: str (optional, default to "")

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Creates a parameter as being bound to a Static If the Static is Integer, this creates an IntParam bound to it by its name. Else this creates a String which is the value of the Static. Returns a null handle if <statname> is unknown as a Static.
") NewParamFromStatic;
		opencascade::handle<Standard_Transient> NewParamFromStatic(Standard_CString statname, Standard_CString name = "");

		/****** IFSelect_WorkSession::NewSelectPointed ******/
		/****** md5 signature: 365a636cfc8cac99bd91aeb7635d138f ******/
		%feature("compactdefaultargs") NewSelectPointed;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient
name: str

Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Creates a new Selection, of type SelectPointed, its content starts with <list>. A name must be given (can be empty).
") NewSelectPointed;
		opencascade::handle<IFSelect_Selection> NewSelectPointed(const opencascade::handle<TColStd_HSequenceOfTransient> & list, Standard_CString name);

		/****** IFSelect_WorkSession::NewTextParam ******/
		/****** md5 signature: 94aa5b9597995b0dacc18fe76ea6bc7a ******/
		%feature("compactdefaultargs") NewTextParam;
		%feature("autodoc", "
Parameters
----------
name: str (optional, default to "")

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Creates a new (empty) TextParam. A Name can be set (Optional) Returns the created TextParam (as an HAsciiString), or a Null Handle in case of Failure (see AddItem/AddNamedItem).
") NewTextParam;
		opencascade::handle<TCollection_HAsciiString> NewTextParam(Standard_CString name = "");

		/****** IFSelect_WorkSession::NewTransformStandard ******/
		/****** md5 signature: ab82691f7eeaf6b2bcfe7c083f1b0b93 ******/
		%feature("compactdefaultargs") NewTransformStandard;
		%feature("autodoc", "
Parameters
----------
copy: bool
name: str (optional, default to "")

Return
-------
opencascade::handle<IFSelect_Transformer>

Description
-----------
Creates and returns a TransformStandard, empty, with its Copy Option (True = Copy, False = On the Spot) and an optional name. To a TransformStandard, the method SetAppliedModifier applies.
") NewTransformStandard;
		opencascade::handle<IFSelect_Transformer> NewTransformStandard(const Standard_Boolean copy, Standard_CString name = "");

		/****** IFSelect_WorkSession::NextIdentForLabel ******/
		/****** md5 signature: 9dc1fa9cf365c59a75ed057df7775147 ******/
		%feature("compactdefaultargs") NextIdentForLabel;
		%feature("autodoc", "
Parameters
----------
label: str
id: int
mode: int (optional, default to 0)

Return
-------
int

Description
-----------
For query by Label with possible iterations Searches the Ident of which Item has a Label which matches a given one, the search starts from an initial Ident. Returns the first found Ident which follows <id>, or ZERO //! The search must start with <id> = 0, it returns the next Ident which matches. To iterate, call again this method which this returned value as <id>. Once an Ident has been returned, the Item can be obtained by the method Item //! <mode> precises the required matching mode: - 0 (Default): <label> must match exactly with the Item Label - 1: <label> must match the exact beginning (the end is free) - 2: <label> must be at least once wherever in the Item Label - other values are ignored.
") NextIdentForLabel;
		Standard_Integer NextIdentForLabel(Standard_CString label, const Standard_Integer id, const Standard_Integer mode = 0);

		/****** IFSelect_WorkSession::NumberFromLabel ******/
		/****** md5 signature: bd5e300d553ef788ce1731e581bced03 ******/
		%feature("compactdefaultargs") NumberFromLabel;
		%feature("autodoc", "
Parameters
----------
val: str
afternum: int (optional, default to 0)

Return
-------
int

Description
-----------
From a given label in Model, returns the corresponding number Starts from first entity by Default, may start after a given number: this number may be given negative, its absolute value is then considered. Hence a loop on NumberFromLabel may be programmed (stop test is: returned value positive or null) //! Returns 0 if not found, < 0 if more than one found (first found in negative). If <val> just gives an integer value, returns it.
") NumberFromLabel;
		Standard_Integer NumberFromLabel(Standard_CString val, const Standard_Integer afternum = 0);

		/****** IFSelect_WorkSession::PrintCheckList ******/
		/****** md5 signature: abe5e5f6e65ec20b5fa1bdc0150abd4b ******/
		%feature("compactdefaultargs") PrintCheckList;
		%feature("autodoc", "
Parameters
----------
checklist: Interface_CheckIterator
failsonly: bool
mode: IFSelect_PrintCount

Return
-------
S: Standard_OStream

Description
-----------
Prints a CheckIterator to the current Trace File, controlled with the current Model complete or fails only, according to <failsonly> <mode> defines the mode of printing 0: sequential, according entities; else with a CheckCounter 1: according messages, count of entities 2: id but with list of entities, designated by their numbers 3: as 2 but with labels of entities.
") PrintCheckList;
		void PrintCheckList(std::ostream &OutValue, const Interface_CheckIterator & checklist, const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****** IFSelect_WorkSession::PrintEntityStatus ******/
		/****** md5 signature: 23f12785981bcfcd0d9cd330e2c76792 ******/
		%feature("compactdefaultargs") PrintEntityStatus;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Prints main information about an entity: its number, type, validity (and checks if any), category, shareds and sharings.. mutable because it can recompute checks as necessary.
") PrintEntityStatus;
		void PrintEntityStatus(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** IFSelect_WorkSession::PrintSignatureList ******/
		/****** md5 signature: eea2888114f184bae9fc2d6912607a7f ******/
		%feature("compactdefaultargs") PrintSignatureList;
		%feature("autodoc", "
Parameters
----------
signlist: IFSelect_SignatureList
mode: IFSelect_PrintCount

Return
-------
S: Standard_OStream

Description
-----------
Prints a SignatureList to the current Trace File, controlled with the current Model <mode> defines the mode of printing (see SignatureList).
") PrintSignatureList;
		void PrintSignatureList(std::ostream &OutValue, const opencascade::handle<IFSelect_SignatureList> & signlist, const IFSelect_PrintCount mode);

		/****** IFSelect_WorkSession::Protocol ******/
		/****** md5 signature: 1c9ddeeacf191f917e4377fcdad955ea ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the Protocol. Null Handle if not yet set should be C++: return const &.
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****** IFSelect_WorkSession::QueryCheckList ******/
		/****** md5 signature: b8199237a5be07c0ae8ef938ca6aef92 ******/
		%feature("compactdefaultargs") QueryCheckList;
		%feature("autodoc", "
Parameters
----------
chl: Interface_CheckIterator

Return
-------
None

Description
-----------
Loads data from a check iterator to query status on it.
") QueryCheckList;
		void QueryCheckList(const Interface_CheckIterator & chl);

		/****** IFSelect_WorkSession::QueryCheckStatus ******/
		/****** md5 signature: 3a36d1e360cb92701c41f9868c3fb038 ******/
		%feature("compactdefaultargs") QueryCheckStatus;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Determines check status for an entity regarding last call to QueryCheckList: -1: <ent> unknown in the model, ignored 0: no check at all, immediate or inherited thru Graph 1: immediate warning (no fail), no inherited check 2: immediate fail, no inherited check +10: idem but some inherited warning (no fail) +20: idem but some inherited fail.
") QueryCheckStatus;
		Standard_Integer QueryCheckStatus(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::QueryParent ******/
		/****** md5 signature: 011d8e959ffad77fc7c24656d191763d ******/
		%feature("compactdefaultargs") QueryParent;
		%feature("autodoc", "
Parameters
----------
entdad: Standard_Transient
entson: Standard_Transient

Return
-------
int

Description
-----------
Determines if <entdad> is parent of <entson> (in the graph), returns: -1 if no; 0 if <entdad> = <entson> 1 if immediate parent, > 1 if parent, gives count of steps.
") QueryParent;
		Standard_Integer QueryParent(const opencascade::handle<Standard_Transient> & entdad, const opencascade::handle<Standard_Transient> & entson);

		/****** IFSelect_WorkSession::ReadFile ******/
		/****** md5 signature: 0c5675761cd6df0c5f286882695ad872 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Reads a file with the WorkLibrary (sets Model and LoadedFile) Returns a integer status which can be: RetDone if OK, RetVoid if no Protocol not defined, RetError for file not found, RetFail if fail during read.
") ReadFile;
		IFSelect_ReturnStatus ReadFile(Standard_CString filename);

		/****** IFSelect_WorkSession::ReadStream ******/
		/****** md5 signature: ee73b79142d0bdf122db2d304fa9d6f3 ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theName: str
theIStream: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Reads a file from stream with the WorkLibrary (sets Model and LoadedFile) Returns a integer status which can be: RetDone if OK, RetVoid if no Protocol not defined, RetError for file not found, RetFail if fail during read.
") ReadStream;
		IFSelect_ReturnStatus ReadStream(Standard_CString theName, std::istream & theIStream);

		/****** IFSelect_WorkSession::RemoveItem ******/
		/****** md5 signature: 3d21325464cc0ceb3ee75dda2155f717 ******/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Removes an Item given its Ident. Returns False if <id> is attached to no Item in the WorkSession. For a Named Item, also removes its Name.
") RemoveItem;
		Standard_Boolean RemoveItem(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_WorkSession::RemoveName ******/
		/****** md5 signature: 50d6961cfe2364d3cb736f125ad7050f ******/
		%feature("compactdefaultargs") RemoveName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Removes a Name without removing the Item Returns True if Done, False else (Name not recorded).
") RemoveName;
		Standard_Boolean RemoveName(Standard_CString name);

		/****** IFSelect_WorkSession::RemoveNamedItem ******/
		/****** md5 signature: 53ad2f8ee41fcd5d3ce5a228f1d78364 ******/
		%feature("compactdefaultargs") RemoveNamedItem;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Removes an Item from the Session, given its Name Returns True if Done, False else (Name not recorded) (Applies only on Item which are Named).
") RemoveNamedItem;
		Standard_Boolean RemoveNamedItem(Standard_CString name);

		/****** IFSelect_WorkSession::ResetAppliedModifier ******/
		/****** md5 signature: dc48b8468d19fd478fa2baf43d97549c ******/
		%feature("compactdefaultargs") ResetAppliedModifier;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_GeneralModifier

Return
-------
bool

Description
-----------
Resets a GeneralModifier to be applied Returns True if done, False if <modif> was not applied.
") ResetAppliedModifier;
		Standard_Boolean ResetAppliedModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****** IFSelect_WorkSession::ResetItemSelection ******/
		/****** md5 signature: 9d4eb47f139cc634b466d5c574e30162 ******/
		%feature("compactdefaultargs") ResetItemSelection;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Resets input Selection which was set by SetItemSelection Same conditions as for SetItemSelection Returns True if done, False if <item> is not in the WorkSession.
") ResetItemSelection;
		Standard_Boolean ResetItemSelection(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_WorkSession::RunModifier ******/
		/****** md5 signature: 2ddd5c6852a8686700ea5eb832827e02 ******/
		%feature("compactdefaultargs") RunModifier;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_Modifier
copy: bool

Return
-------
int

Description
-----------
Runs a Modifier on Starting Model. It can modify entities, or add new ones. But the Model or the Protocol is unchanged. The Modifier is applied on each entity of the Model. See also RunModifierSelected Fills LastRunCheckList //! <copy>: if True, a new data set is produced which brings the modifications (Model + its Entities) if False, data are modified on the spot //! It works through a TransformStandard defined with <modif> Returned status as RunTransformer: 0 nothing done, >0 OK, <0 problem, but only between -3 and 3 (protocol unchanged) Remark: <copy> True will give <effect> = 3 or -3.
") RunModifier;
		Standard_Integer RunModifier(const opencascade::handle<IFSelect_Modifier> & modif, const Standard_Boolean copy);

		/****** IFSelect_WorkSession::RunModifierSelected ******/
		/****** md5 signature: 97f312de7eea46359ddc27a95815b8a3 ******/
		%feature("compactdefaultargs") RunModifierSelected;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_Modifier
sel: IFSelect_Selection
copy: bool

Return
-------
int

Description
-----------
Acts as RunModifier, but the Modifier is applied on the list determined by a Selection, rather than on the whole Model If the selection is a null handle, the whole model is taken.
") RunModifierSelected;
		Standard_Integer RunModifierSelected(const opencascade::handle<IFSelect_Modifier> & modif, const opencascade::handle<IFSelect_Selection> & sel, const Standard_Boolean copy);

		/****** IFSelect_WorkSession::RunTransformer ******/
		/****** md5 signature: ce58899d242786dd3edb621a934671f1 ******/
		%feature("compactdefaultargs") RunTransformer;
		%feature("autodoc", "
Parameters
----------
transf: IFSelect_Transformer

Return
-------
int

Description
-----------
Runs a Transformer on starting Model, which can then be edited or replaced by a new one. The Protocol can also be changed. Fills LastRunCheckList //! Returned status is 0 if nothing done (<transf> or model undefined), positive if OK, negative else: 0: Nothing done 1: OK, edition on the spot with no change to the graph of dependencies (purely local) 2: OK, model edited on the spot (graph recomputed, may have changed), protocol unchanged 3: OK, new model produced, same protocol 4: OK, model edited on the spot (graph recomputed), but protocol has changed 5: OK, new model produced, protocol has changed -1: Error on the spot (slight changes), data may be corrupted (remark: corruption should not be profound) -2: Error on edition the spot, data may be corrupted (checking them is recommended) -3: Error with a new data set, transformation ignored -4: OK as 4, but graph of dependences count not be recomputed (the former one is kept): check the protocol.
") RunTransformer;
		Standard_Integer RunTransformer(const opencascade::handle<IFSelect_Transformer> & transf);

		/****** IFSelect_WorkSession::Selection ******/
		/****** md5 signature: 7b0ed3ef69750ee2f01ea61b1ac64790 ******/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns a Selection, given its Ident in the Session Null result if <id> is not suitable for a Selection (undefined, or defined for another kind of variable).
") Selection;
		opencascade::handle<IFSelect_Selection> Selection(const Standard_Integer id);

		/****** IFSelect_WorkSession::SelectionResult ******/
		/****** md5 signature: 22d7475d8646fd72b6ad7e374a8c38b9 ******/
		%feature("compactdefaultargs") SelectionResult;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the result of a Selection, computed by EvalSelection (see above) under the form of a HSequence (hence, it can be used by a frontal-engine logic). It can be empty Returns a Null Handle if <sel> is not in the WorkSession.
") SelectionResult;
		opencascade::handle<TColStd_HSequenceOfTransient> SelectionResult(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::SelectionResultFromList ******/
		/****** md5 signature: 59219e4c15c0472c4683f58ca2a2951f ******/
		%feature("compactdefaultargs") SelectionResultFromList;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
list: TColStd_HSequenceOfTransient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the result of a Selection, by forcing its input with a given list <list> (unless <list> is Null). RULES: <list> applies only for a SelectDeduct kind Selection: its Input is considered: if it is a SelectDeduct kind Selection, its Input is considered, etc... until an Input is not a Deduct/Extract: its result is replaced by <list> and all the chain of deductions is applied.
") SelectionResultFromList;
		opencascade::handle<TColStd_HSequenceOfTransient> SelectionResultFromList(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** IFSelect_WorkSession::SendAll ******/
		/****** md5 signature: c2b1e4ce07d1cfced6ef3f58127820b9 ******/
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "
Parameters
----------
filename: str
computegraph: bool (optional, default to Standard_False)

Return
-------
IFSelect_ReturnStatus

Description
-----------
Sends the starting Model into one file, without splitting, managing remaining data or anything else. <computegraph> true commands the Graph to be recomputed before sending: required when a Model is filled in several steps //! The Model and File Modifiers recorded to be applied on sending files are. Returns a status of execution: Done if OK, Void if no data available, Error if errors occurred (work library is not defined), errors during translation Fail if exception during translation is raised Stop if no disk space or disk, file is write protected Fills LastRunCheckList.
") SendAll;
		IFSelect_ReturnStatus SendAll(Standard_CString filename, const Standard_Boolean computegraph = Standard_False);

		/****** IFSelect_WorkSession::SendSelected ******/
		/****** md5 signature: 39c03cff7e1c0be3f448192e8c12d306 ******/
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "
Parameters
----------
filename: str
sel: IFSelect_Selection
computegraph: bool (optional, default to Standard_False)

Return
-------
IFSelect_ReturnStatus

Description
-----------
Sends a part of the starting Model into one file, without splitting. But remaining data are managed. <computegraph> true commands the Graph to be recomputed before sending: required when a Model is filled in several steps //! The Model and File Modifiers recorded to be applied on sending files are. Returns a status: Done if OK, Fail if error during send, Error: WorkLibrary not defined, Void: selection list empty Fills LastRunCheckList.
") SendSelected;
		IFSelect_ReturnStatus SendSelected(Standard_CString filename, const opencascade::handle<IFSelect_Selection> & sel, const Standard_Boolean computegraph = Standard_False);

		/****** IFSelect_WorkSession::SendSplit ******/
		/****** md5 signature: 6321d8c6881589ddbe6233be55e93e86 ******/
		%feature("compactdefaultargs") SendSplit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs creation of derived files from the input Model Takes its data (sub-models and names), from result EvaluateFile if active, else by dynamic Evaluation (not stored) After SendSplit, result of EvaluateFile is Cleared Fills LastRunCheckList //! Works with the WorkLibrary which acts on specific type of Model and can work with File Modifiers (managed by the Model Copier) and a ModelCopier, which can work with Model Modifiers Returns False if, either WorkLibrary has failed on at least one sub-file, or the Work Session is badly conditioned (no Model defined, or FileNaming not in phase with ShareOut).
") SendSplit;
		Standard_Boolean SendSplit();

		/****** IFSelect_WorkSession::SentFiles ******/
		/****** md5 signature: ccec19bbefb996c0e777d6a8d7f3c41a ******/
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of recorded sent files, or a Null Handle is recording has not been enabled.
") SentFiles;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SentFiles();

		/****** IFSelect_WorkSession::SentList ******/
		/****** md5 signature: 4d2680f98f4c5a8aaaa30100248e90b0 ******/
		%feature("compactdefaultargs") SentList;
		%feature("autodoc", "
Parameters
----------
count: int (optional, default to -1)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of Entities sent in files, according to the count of files each one has been sent (these counts are reset by SetModel or SetRemaining(Forget) ) stored in Graph Status <count> = -1 (default) is for ENtities sent at least once <count> = 0 is for the Remaining List (entities not yet sent) <count> = 1 is for entities sent in one and only one file (the ideal case) Remaining Data are computed on each Sending/Copying output files (see methods EvaluateFile and SendSplit) Graph Status is 0 for Remaining Entity, <count> for Sent into <count> files This status is set to 0 (not yet sent) for all by SetModel and by SetRemaining(mode=Forget,Display).
") SentList;
		Interface_EntityIterator SentList(const Standard_Integer count = -1);

		/****** IFSelect_WorkSession::SetActive ******/
		/****** md5 signature: 940b9bc390662ec729381d139a68dcd6 ******/
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient
mode: bool

Return
-------
bool

Description
-----------
Following the type of <item>: - Dispatch: Adds or Removes it in the ShareOut & FileNaming - GeneralModifier: Adds or Removes it for final sending (i.e. in the ModelCopier) Returns True if it did something, False else (state unchanged).
") SetActive;
		Standard_Boolean SetActive(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean mode);

		/****** IFSelect_WorkSession::SetAppliedModifier ******/
		/****** md5 signature: e9ed571d8b9bebd0a1fb74a2c90e86d3 ******/
		%feature("compactdefaultargs") SetAppliedModifier;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_GeneralModifier
item: Standard_Transient

Return
-------
bool

Description
-----------
Sets a GeneralModifier to be applied to an item: - item = ShareOut: applies for final sending (all dispatches) - item is a Dispatch: applies for this dispatch only Returns True if done, False if <modif> or <item> not in <self>.
") SetAppliedModifier;
		Standard_Boolean SetAppliedModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif, const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_WorkSession::SetControl ******/
		/****** md5 signature: 05af01ea1f67168a8030ea59ecde2174 ******/
		%feature("compactdefaultargs") SetControl;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
sc: IFSelect_Selection
formain: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Sets an Input Selection, Main if <formain> is True, Second else (as <sc>) to a SelectControl (as <sel>). Returns True if Done, False if <sel> is not a SelectControl, or <sc> or <sel> is not in the WorkSession.
") SetControl;
		Standard_Boolean SetControl(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<IFSelect_Selection> & sc, const Standard_Boolean formain = Standard_True);

		/****** IFSelect_WorkSession::SetDefaultFileRoot ******/
		/****** md5 signature: 34373a07c269c9a147574911502379fa ******/
		%feature("compactdefaultargs") SetDefaultFileRoot;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Defines a Default File Root Name. Clears it is <name> = '' Returns True if OK, False if <name> already set for a Dispatch.
") SetDefaultFileRoot;
		Standard_Boolean SetDefaultFileRoot(Standard_CString name);

		/****** IFSelect_WorkSession::SetErrorHandle ******/
		/****** md5 signature: e34e0e7413eb0cf0d82c36bfcce58564 ******/
		%feature("compactdefaultargs") SetErrorHandle;
		%feature("autodoc", "
Parameters
----------
toHandle: bool

Return
-------
None

Description
-----------
Changes the Error Handler status (by default, it is not set).
") SetErrorHandle;
		void SetErrorHandle(const Standard_Boolean toHandle);

		/****** IFSelect_WorkSession::SetFileExtension ******/
		/****** md5 signature: 6c043b5c4437fe749ed293af164511dc ******/
		%feature("compactdefaultargs") SetFileExtension;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Defines a File Extension.
") SetFileExtension;
		void SetFileExtension(Standard_CString name);

		/****** IFSelect_WorkSession::SetFilePrefix ******/
		/****** md5 signature: 935ba3ec4b009a6c90d1d4c415de055c ******/
		%feature("compactdefaultargs") SetFilePrefix;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Defines a File Prefix.
") SetFilePrefix;
		void SetFilePrefix(Standard_CString name);

		/****** IFSelect_WorkSession::SetFileRoot ******/
		/****** md5 signature: 1fd824ca1468435546e56024ca700721 ******/
		%feature("compactdefaultargs") SetFileRoot;
		%feature("autodoc", "
Parameters
----------
disp: IFSelect_Dispatch
name: str

Return
-------
bool

Description
-----------
Defines a Root for a Dispatch If <name> is empty, clears Root Name This has as effect to inhibit the production of File by <disp> Returns False if <disp> is not in the WorkSession or if a root name is already defined for it.
") SetFileRoot;
		Standard_Boolean SetFileRoot(const opencascade::handle<IFSelect_Dispatch> & disp, Standard_CString name);

		/****** IFSelect_WorkSession::SetInputSelection ******/
		/****** md5 signature: efc80d2cba7e4bfb82d3449ae9456f04 ******/
		%feature("compactdefaultargs") SetInputSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
input: IFSelect_Selection

Return
-------
bool

Description
-----------
Sets an Input Selection (as <input>) to a SelectExtract or a SelectDeduct (as <sel>). Returns True if Done, False if <sel> is neither a SelectExtract nor a SelectDeduct, or not in the WorkSession.
") SetInputSelection;
		Standard_Boolean SetInputSelection(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<IFSelect_Selection> & input);

		/****** IFSelect_WorkSession::SetIntValue ******/
		/****** md5 signature: 77ebf48a1387ab3ac676568328be9ee3 ******/
		%feature("compactdefaultargs") SetIntValue;
		%feature("autodoc", "
Parameters
----------
it: IFSelect_IntParam
val: int

Return
-------
bool

Description
-----------
Changes the Integer Value of an IntParam Returns True if Done, False if <it> is not in the WorkSession.
") SetIntValue;
		Standard_Boolean SetIntValue(const opencascade::handle<IFSelect_IntParam> & it, const Standard_Integer val);

		/****** IFSelect_WorkSession::SetItemSelection ******/
		/****** md5 signature: 22a8aadbf5b8012b0bf203b12452ecb4 ******/
		%feature("compactdefaultargs") SetItemSelection;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient
sel: IFSelect_Selection

Return
-------
bool

Description
-----------
Sets a Selection as input for an item, according its type: if <item> is a Dispatch: as Final Selection if <item> is a GeneralModifier (i.e. any kind of Modifier): as Selection used to filter entities to modify <sel> Null causes this Selection to be nullified Returns False if <item> is not of a suitable type, or <item> or <sel> is not in the WorkSession.
") SetItemSelection;
		Standard_Boolean SetItemSelection(const opencascade::handle<Standard_Transient> & item, const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::SetLibrary ******/
		/****** md5 signature: bf9fd355c4832219eadf210a8a57f2f1 ******/
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "
Parameters
----------
theLib: IFSelect_WorkLibrary

Return
-------
None

Description
-----------
Sets a WorkLibrary, which will be used to Read and Write Files.
") SetLibrary;
		void SetLibrary(const opencascade::handle<IFSelect_WorkLibrary> & theLib);

		/****** IFSelect_WorkSession::SetLoadedFile ******/
		/****** md5 signature: 7e273eaababe38518db41d3ac90cb161 ******/
		%feature("compactdefaultargs") SetLoadedFile;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Stores the filename used for read for setting the model It is cleared by SetModel and ClearData(1).
") SetLoadedFile;
		void SetLoadedFile(Standard_CString theFileName);

		/****** IFSelect_WorkSession::SetModeStat ******/
		/****** md5 signature: c142785e8c8c940a8a328422512002b1 ******/
		%feature("compactdefaultargs") SetModeStat;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Set value of mode responsible for presence of selections after loading If mode set to true that different selections will be accessible after loading else selections will be not accessible after loading( for economy memory in applications).
") SetModeStat;
		void SetModeStat(const Standard_Boolean theMode);

		/****** IFSelect_WorkSession::SetModel ******/
		/****** md5 signature: 7e372f4e826bf0a9ecad785814b86e54 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
clearpointed: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets a Model as input: this will be the Model from which the ShareOut will work if <clearpointed> is True (default) all SelectPointed items are cleared, else they must be managed by the caller Remark: SetModel clears the Graph, recomputes it if a Protocol is set and if the Model is not empty, of course.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Boolean clearpointed = Standard_True);

		/****** IFSelect_WorkSession::SetModelContent ******/
		/****** md5 signature: 4dd44a6105e913c7252b2ae562ef04f7 ******/
		%feature("compactdefaultargs") SetModelContent;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
keep: bool

Return
-------
bool

Description
-----------
Defines a new content from the former one If <keep> is True, it is given by entities selected by Selection <sel> (and all shared entities) Else, it is given by all the former content but entities selected by the Selection <sel> (and properly shared ones) Returns True if done. Returns False if the selected list (from <sel>) is empty, hence nothing is done.
") SetModelContent;
		Standard_Boolean SetModelContent(const opencascade::handle<IFSelect_Selection> & sel, const Standard_Boolean keep);

		/****** IFSelect_WorkSession::SetModelCopier ******/
		/****** md5 signature: 3c24bae00078104168cc28f40f3cbd0b ******/
		%feature("compactdefaultargs") SetModelCopier;
		%feature("autodoc", "
Parameters
----------
copier: IFSelect_ModelCopier

Return
-------
None

Description
-----------
Sets a new ModelCopier. Fills Items which its content.
") SetModelCopier;
		void SetModelCopier(const opencascade::handle<IFSelect_ModelCopier> & copier);

		/****** IFSelect_WorkSession::SetParams ******/
		/****** md5 signature: 7615df0c6511c294a819db27267b7ef4 ******/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "
Parameters
----------
params: Standard_Transient
uselist: NCollection_Vector<int>

Return
-------
None

Description
-----------
Sets a list of Parameters, i.e. TypedValue, to be handled through an Editor The two lists are parallel, if <params> is longer than <uses>, surnumeral parameters are for general use //! EditForms are created to handle these parameters (list, edit) on the basis of a ParamEditor xst-params-edit //! A use number dispatches the parameter to a given EditForm EditForms are defined as follows Name Use Means xst-params all All Parameters (complete list) xst-params-general 1 Generals xst-params-load 2 LoadFile (no Transfer) xst-params-send 3 SendFile (Write, no Transfer) xst-params-split 4 Split xst-param-read 5 Transfer on Reading xst-param-write 6 Transfer on Writing.
") SetParams;
		void SetParams(const NCollection_Vector<opencascade::handle<Standard_Transient> > & params, const NCollection_Vector<Standard_Integer> & uselist);

		/****** IFSelect_WorkSession::SetProtocol ******/
		/****** md5 signature: 032ba93c3a9bfe80213c23be9d305675 ******/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "
Parameters
----------
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Sets a Protocol, which will be used to determine Graphs, to Read and to Write Files.
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & protocol);

		/****** IFSelect_WorkSession::SetRemaining ******/
		/****** md5 signature: c1d3998fe70637a6e64246ec2203ecb8 ******/
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "
Parameters
----------
mode: IFSelect_RemainMode

Return
-------
bool

Description
-----------
Processes Remaining data (after having sent files), mode: Forget: forget remaining info (i.e. clear all 'Sent' status) Compute: compute and keep remaining (does nothing if: remaining is empty or if no files has been sent) Display: display entities recorded as remaining Undo: restore former state of data (after Remaining(1) ) Returns True if OK, False else (i.e. mode = 2 and Remaining List is either empty or takes all the entities, or mode = 3 and no former computation of remaining data was done).
") SetRemaining;
		Standard_Boolean SetRemaining(const IFSelect_RemainMode mode);

		/****** IFSelect_WorkSession::SetSelectPointed ******/
		/****** md5 signature: d86e748512fef7d08c3d1450a5c12398 ******/
		%feature("compactdefaultargs") SetSelectPointed;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
list: TColStd_HSequenceOfTransient
mode: int

Return
-------
bool

Description
-----------
Changes the content of a Selection of type SelectPointed According <mode>: 0 set <list> as new content (clear former) 1: adds <list> to actual content -1: removes <list> from actual content Returns True if done, False if <sel> is not a SelectPointed.
") SetSelectPointed;
		Standard_Boolean SetSelectPointed(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Standard_Integer mode);

		/****** IFSelect_WorkSession::SetShareOut ******/
		/****** md5 signature: c50a730405495501dc6609ec99f5cfc0 ******/
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "
Parameters
----------
shareout: IFSelect_ShareOut

Return
-------
None

Description
-----------
Sets a new ShareOut. Fills Items which its content Warning: data from the former ShareOut are lost.
") SetShareOut;
		void SetShareOut(const opencascade::handle<IFSelect_ShareOut> & shareout);

		/****** IFSelect_WorkSession::SetSignType ******/
		/****** md5 signature: 053bbc48610d062b21c1fb8ad4e55232 ******/
		%feature("compactdefaultargs") SetSignType;
		%feature("autodoc", "
Parameters
----------
signtype: IFSelect_Signature

Return
-------
None

Description
-----------
Sets a specific Signature to be the SignType, i.e. the Signature which will determine TypeName from the Model (basic function). It is recorded in the GTool This Signature is also set as 'xst-sign-type' (reserved name).
") SetSignType;
		void SetSignType(const opencascade::handle<IFSelect_Signature> & signtype);

		/****** IFSelect_WorkSession::SetTextValue ******/
		/****** md5 signature: de40a4f9005b8c259d1e43897aee6827 ******/
		%feature("compactdefaultargs") SetTextValue;
		%feature("autodoc", "
Parameters
----------
par: TCollection_HAsciiString
val: str

Return
-------
bool

Description
-----------
Changes the Text Value of a TextParam (an HAsciiString) Returns True if Done, False if <it> is not in the WorkSession.
") SetTextValue;
		Standard_Boolean SetTextValue(const opencascade::handle<TCollection_HAsciiString> & par, Standard_CString val);

		/****** IFSelect_WorkSession::ShareOut ******/
		/****** md5 signature: 7d7ba6d89ad65a951a2f527007d5837f ******/
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_ShareOut>

Description
-----------
Returns the ShareOut defined at creation time.
") ShareOut;
		const opencascade::handle<IFSelect_ShareOut> & ShareOut();

		/****** IFSelect_WorkSession::Shareds ******/
		/****** md5 signature: 0d7eefad00726da1b50dc525c1f1499f ******/
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of entities shared by <ent> (can be empty) Returns a null Handle if <ent> is unknown.
") Shareds;
		opencascade::handle<TColStd_HSequenceOfTransient> Shareds(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::Sharings ******/
		/****** md5 signature: 76739a45c106cce619c3ad5dcf556c6b ******/
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of entities sharing <ent> (can be empty) Returns a null Handle if <ent> is unknown.
") Sharings;
		opencascade::handle<TColStd_HSequenceOfTransient> Sharings(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::SignCounter ******/
		/****** md5 signature: f5139898078feaeb4f35ca5845f69009 ******/
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_SignCounter>

Description
-----------
Returns a SignCounter from its ident in the Session Null result if <id> is not suitable for a SignCounter (undefined, or defined for another kind of variable).
") SignCounter;
		opencascade::handle<IFSelect_SignCounter> SignCounter(const Standard_Integer id);

		/****** IFSelect_WorkSession::SignType ******/
		/****** md5 signature: 3bb57051bc559fc5c36b0ab9d9ac28c0 ******/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Signature>

Description
-----------
Returns the current SignType.
") SignType;
		opencascade::handle<IFSelect_Signature> SignType();

		/****** IFSelect_WorkSession::SignValue ******/
		/****** md5 signature: 402c9760e2a4dd6c2333c0ef4e0fecbe ******/
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "
Parameters
----------
sign: IFSelect_Signature
ent: Standard_Transient

Return
-------
str

Description
-----------
Returns the Value computed by a Signature for an Entity Returns an empty string if the entity does not belong to the loaded model.
") SignValue;
		Standard_CString SignValue(const opencascade::handle<IFSelect_Signature> & sign, const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::Signature ******/
		/****** md5 signature: 07c27665dfc4d330174c985be304efbf ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_Signature>

Description
-----------
Returns a Signature, given its Ident in the Session Null result if <id> is not suitable for a Signature (undefined, or defined for another kind of variable).
") Signature;
		opencascade::handle<IFSelect_Signature> Signature(const Standard_Integer id);

		/****** IFSelect_WorkSession::Source ******/
		/****** md5 signature: 93a5194d2243dce02e1e6f73b1fde29e ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
num: int (optional, default to 1)

Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the <num>th Input Selection of a Selection (see NbSources). Returns a Null Handle if <sel> is not in the WorkSession or if <num> is out of the range <1-NbSources> To obtain more details, see the method Sources.
") Source;
		opencascade::handle<IFSelect_Selection> Source(const opencascade::handle<IFSelect_Selection> & sel, const Standard_Integer num = 1);

		/****** IFSelect_WorkSession::Sources ******/
		/****** md5 signature: 6c65dd919745a931c9ffa71b4e599512 ******/
		%feature("compactdefaultargs") Sources;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
IFSelect_SelectionIterator

Description
-----------
Returns the Selections which are source of Selection, given its rank in the List of Selections (see SelectionIterator) Returned value is empty if <num> is out of range or if <sel> is not in the WorkSession.
") Sources;
		IFSelect_SelectionIterator Sources(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::StartingEntity ******/
		/****** md5 signature: 396b57d8908e4be7e46af7128922d973 ******/
		%feature("compactdefaultargs") StartingEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an Entity stored in the Model of the WorkSession (Null Handle is no Model or num out of range).
") StartingEntity;
		opencascade::handle<Standard_Transient> StartingEntity(const Standard_Integer num);

		/****** IFSelect_WorkSession::StartingNumber ******/
		/****** md5 signature: f0b745d78fe6cfa953c093565f62a144 ******/
		%feature("compactdefaultargs") StartingNumber;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Returns the Number of an Entity in the Model (0 if no Model set or <ent> not in the Model).
") StartingNumber;
		Standard_Integer StartingNumber(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::TextParam ******/
		/****** md5 signature: 411f98985b17a8da10b137efd64ae96d ******/
		%feature("compactdefaultargs") TextParam;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a TextParam, given its Ident in the Session Null result if <id> is not suitable for a TextParam (undefined, or defined for another kind of variable).
") TextParam;
		opencascade::handle<TCollection_HAsciiString> TextParam(const Standard_Integer id);

		/****** IFSelect_WorkSession::TextValue ******/
		/****** md5 signature: 80fcbc8dd437ccf904e32873fd3864d8 ******/
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "
Parameters
----------
par: TCollection_HAsciiString

Return
-------
TCollection_AsciiString

Description
-----------
Returns Text Value of a TextParam (a String) or an empty string if <it> is not in the WorkSession.
") TextValue;
		TCollection_AsciiString TextValue(const opencascade::handle<TCollection_HAsciiString> & par);

		/****** IFSelect_WorkSession::ToggleSelectExtract ******/
		/****** md5 signature: 317c5f6c662e793d22443d6fd7fd5899 ******/
		%feature("compactdefaultargs") ToggleSelectExtract;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
bool

Description
-----------
Toggles the Sense (Direct <-> Reversed) of a SelectExtract Returns True if Done, False if <sel> is not a SelectExtract or is not in the WorkSession.
") ToggleSelectExtract;
		Standard_Boolean ToggleSelectExtract(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_WorkSession::TraceDumpEntity ******/
		/****** md5 signature: 6759d779439cb5c24ed789703fec9be6 ******/
		%feature("compactdefaultargs") TraceDumpEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
level: int

Return
-------
None

Description
-----------
Dumps an entity from the current Model as inherited DumpEntity on currently defined Default Trace File (<level> interpreted according to the Norm, see WorkLibrary).
") TraceDumpEntity;
		void TraceDumpEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer level);

		/****** IFSelect_WorkSession::TraceDumpModel ******/
		/****** md5 signature: bad4b90f30d2c71ea1a874b1c47ac874 ******/
		%feature("compactdefaultargs") TraceDumpModel;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
None

Description
-----------
Dumps the current Model (as inherited DumpModel), on currently defined Default Trace File (default is standard output).
") TraceDumpModel;
		void TraceDumpModel(const Standard_Integer mode);

		/****** IFSelect_WorkSession::TraceStatics ******/
		/****** md5 signature: a53f7a793b51d3575891ba4c23a57acc ******/
		%feature("compactdefaultargs") TraceStatics;
		%feature("autodoc", "
Parameters
----------
use: int
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Traces the Statics attached to a given use number If <use> is given positive (normal), the trace is embedded with a header and a trailer If <use> is negative, just values are printed (this allows to make compositions) Remark: use number 5 commands use -2 to be traced Remark: use numbers 4 and 6 command use -3 to be traced.
") TraceStatics;
		void TraceStatics(const Standard_Integer use, const Standard_Integer mode = 0);

		/****** IFSelect_WorkSession::Transformer ******/
		/****** md5 signature: 6c8756b547be8db586993ea779da51ee ******/
		%feature("compactdefaultargs") Transformer;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
opencascade::handle<IFSelect_Transformer>

Description
-----------
Returns a Transformer, given its Ident in the Session Null result if <id> is not suitable for a Transformer (undefined, or defined for another kind of variable).
") Transformer;
		opencascade::handle<IFSelect_Transformer> Transformer(const Standard_Integer id);

		/****** IFSelect_WorkSession::UsesAppliedModifier ******/
		/****** md5 signature: b7759325d298eacddb0ad38f7cc7ea7e ******/
		%feature("compactdefaultargs") UsesAppliedModifier;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_GeneralModifier

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the item on which a GeneralModifier is applied: the ShareOut, or a given Dispatch Returns a Null Handle if <modif> is not applied.
") UsesAppliedModifier;
		opencascade::handle<Standard_Transient> UsesAppliedModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****** IFSelect_WorkSession::ValidityName ******/
		/****** md5 signature: b01c5408d7a1bdcdd278561f74c782e9 ******/
		%feature("compactdefaultargs") ValidityName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
str

Description
-----------
Returns the Validity Name determined for an entity it is computed by the class SignValidity Remark: an unknown entity gives an empty string.
") ValidityName;
		Standard_CString ValidityName(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_WorkSession::WorkLibrary ******/
		/****** md5 signature: 7c195930f9d0e8c986e2cba27b8d6ee4 ******/
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_WorkLibrary>

Description
-----------
Returns the WorkLibrary. Null Handle if not yet set should be C++: return const &.
") WorkLibrary;
		const opencascade::handle<IFSelect_WorkLibrary> & WorkLibrary();

		/****** IFSelect_WorkSession::WriteFile ******/
		/****** md5 signature: c443eb482eff3288f82d0142e04359c7 ******/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Writes the current Interface Model globally to a File, and returns a write status which can be: Done OK, Fail file could not be written, Error no norm is selected Remark: It is a simple, one-file writing, other operations are available (such as splitting ...) which calls SendAll.
") WriteFile;
		IFSelect_ReturnStatus WriteFile(Standard_CString filename);

		/****** IFSelect_WorkSession::WriteFile ******/
		/****** md5 signature: 790e8d08c70c44f34f75df82bc09ca6e ******/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "
Parameters
----------
filename: str
sel: IFSelect_Selection

Return
-------
IFSelect_ReturnStatus

Description
-----------
Writes a sub-part of the current Interface Model to a File, as defined by a Selection <sel>, recomputes the Graph, and returns a write status which can be: Done OK, Fail file could not be written, Error no norm is selected Remark: It is a simple, one-file writing, other operations are available (such as splitting ...) which calls SendSelected.
") WriteFile;
		IFSelect_ReturnStatus WriteFile(Standard_CString filename, const opencascade::handle<IFSelect_Selection> & sel);

};


%make_alias(IFSelect_WorkSession)

%extend IFSelect_WorkSession {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def theerrhand(self):
		pass
	}
};

/*********************
* class IFSelect_Act *
*********************/
class IFSelect_Act : public IFSelect_Activator {
	public:
		/****** IFSelect_Act::IFSelect_Act ******/
		/****** md5 signature: 76e29d8059e49b0f38dbbfab62fb71e0 ******/
		%feature("compactdefaultargs") IFSelect_Act;
		%feature("autodoc", "
Parameters
----------
name: str
help: str
func: IFSelect_ActFunc

Return
-------
None

Description
-----------
Creates an Act with a name, help and a function mode (Add or AddSet) is given when recording.
") IFSelect_Act;
		 IFSelect_Act(Standard_CString name, Standard_CString help, const IFSelect_ActFunc func);

		/****** IFSelect_Act::AddFSet ******/
		/****** md5 signature: e2ffb6b816fea57f96597521d91d13d1 ******/
		%feature("compactdefaultargs") AddFSet;
		%feature("autodoc", "
Parameters
----------
name: str
help: str
func: IFSelect_ActFunc

Return
-------
None

Description
-----------
Adds a function with its name and help: creates an Act then records it as function for XSET (i.e. to create control item).
") AddFSet;
		static void AddFSet(Standard_CString name, Standard_CString help, const IFSelect_ActFunc func);

		/****** IFSelect_Act::AddFunc ******/
		/****** md5 signature: fbe777bcbfe4244fa2ba5ff24fe49d8f ******/
		%feature("compactdefaultargs") AddFunc;
		%feature("autodoc", "
Parameters
----------
name: str
help: str
func: IFSelect_ActFunc

Return
-------
None

Description
-----------
Adds a function with its name and help: creates an Act then records it as normal function.
") AddFunc;
		static void AddFunc(Standard_CString name, Standard_CString help, const IFSelect_ActFunc func);

		/****** IFSelect_Act::Do ******/
		/****** md5 signature: 84f46bc11d2d5e9591ed76f3c0abda9a ******/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "
Parameters
----------
number: int
pilot: IFSelect_SessionPilot

Return
-------
IFSelect_ReturnStatus

Description
-----------
Execution of Command Line. remark that <number> is senseless because each Act brings one and only one function.
") Do;
		IFSelect_ReturnStatus Do(const Standard_Integer number, const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****** IFSelect_Act::Help ******/
		/****** md5 signature: f58ae97ad0af39f2393512a71352549e ******/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "
Parameters
----------
number: int

Return
-------
str

Description
-----------
Short Help for commands: returns the help given to create.
") Help;
		Standard_CString Help(const Standard_Integer number);

		/****** IFSelect_Act::SetGroup ******/
		/****** md5 signature: d0c9e1b75a0955e5e67ca3830fd2cdcf ******/
		%feature("compactdefaultargs") SetGroup;
		%feature("autodoc", "
Parameters
----------
group: str
file: str (optional, default to "")

Return
-------
None

Description
-----------
Changes the default group name for the following Acts group empty means to come back to default from Activator Also a file name can be precised (to query by getsource).
") SetGroup;
		static void SetGroup(Standard_CString group, Standard_CString file = "");

};


%make_alias(IFSelect_Act)

%extend IFSelect_Act {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_BasicDumper *
*****************************/
class IFSelect_BasicDumper : public IFSelect_SessionDumper {
	public:
		/****** IFSelect_BasicDumper::IFSelect_BasicDumper ******/
		/****** md5 signature: d5ec0c0a0ada005c22513ff8152b65ef ******/
		%feature("compactdefaultargs") IFSelect_BasicDumper;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a BasicDumper and puts it into the Library of Dumper.
") IFSelect_BasicDumper;
		 IFSelect_BasicDumper();

		/****** IFSelect_BasicDumper::ReadOwn ******/
		/****** md5 signature: 537cf3342fb63eef348b1c1130ae0574 ******/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "
Parameters
----------
file: IFSelect_SessionFile
type: str
item: Standard_Transient

Return
-------
bool

Description
-----------
Recognizes and Read Own Parameters for Types of package IFSelect. Returns True if done and <item> created, False else.
") ReadOwn;
		Standard_Boolean ReadOwn(IFSelect_SessionFile & file, TCollection_AsciiString type, opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_BasicDumper::WriteOwn ******/
		/****** md5 signature: d3ac6824a29798b0b3016080139d7006 ******/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "
Parameters
----------
file: IFSelect_SessionFile
item: Standard_Transient

Return
-------
bool

Description
-----------
Write the Own Parameters of Types defined in package IFSelect Returns True if <item> has been processed, False else.
") WriteOwn;
		Standard_Boolean WriteOwn(IFSelect_SessionFile & file, const opencascade::handle<Standard_Transient> & item);

};


%make_alias(IFSelect_BasicDumper)

%extend IFSelect_BasicDumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_CheckCounter *
******************************/
class IFSelect_CheckCounter : public IFSelect_SignatureList {
	public:
		/****** IFSelect_CheckCounter::IFSelect_CheckCounter ******/
		/****** md5 signature: 027a1d19c7792e2533f7fa6a254f2332 ******/
		%feature("compactdefaultargs") IFSelect_CheckCounter;
		%feature("autodoc", "
Parameters
----------
withlist: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a CheckCounter, empty ready to work.
") IFSelect_CheckCounter;
		 IFSelect_CheckCounter(const Standard_Boolean withlist = Standard_False);

		/****** IFSelect_CheckCounter::Analyse ******/
		/****** md5 signature: 7cd832463e3ab9638e83ab58216e13e0 ******/
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "
Parameters
----------
list: Interface_CheckIterator
model: Interface_InterfaceModel
original: bool (optional, default to Standard_False)
failsonly: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Analyses a CheckIterator according a Model (which detains the entities for which the CheckIterator has messages), i.e. counts messages for entities If <original> is True, does not consider final messages but those before interpretation (such as inserting variables: integers, reals, strings) If <failsonly> is True, only Fails are considered Remark: global messages are recorded with a Null entity.
") Analyse;
		void Analyse(const Interface_CheckIterator & list, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Boolean original = Standard_False, const Standard_Boolean failsonly = Standard_False);

		/****** IFSelect_CheckCounter::SetSignature ******/
		/****** md5 signature: 1a48019d9a598f298ba9f537ddd35bcf ******/
		%feature("compactdefaultargs") SetSignature;
		%feature("autodoc", "
Parameters
----------
sign: MoniTool_SignText

Return
-------
None

Description
-----------
Sets a specific signature Else, the current SignType (in the model) is used.
") SetSignature;
		void SetSignature(const opencascade::handle<MoniTool_SignText> & sign);

		/****** IFSelect_CheckCounter::Signature ******/
		/****** md5 signature: 1183b252d20acf6d41e3c116bb42f041 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
opencascade::handle<MoniTool_SignText>

Description
-----------
Returns the Signature;.
") Signature;
		opencascade::handle<MoniTool_SignText> Signature();

};


%make_alias(IFSelect_CheckCounter)

%extend IFSelect_CheckCounter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_DispGlobal *
****************************/
class IFSelect_DispGlobal : public IFSelect_Dispatch {
	public:
		/****** IFSelect_DispGlobal::IFSelect_DispGlobal ******/
		/****** md5 signature: d38ff10c3e3355af2c09bc8e603b9f02 ******/
		%feature("compactdefaultargs") IFSelect_DispGlobal;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a DispGlobal.
") IFSelect_DispGlobal;
		 IFSelect_DispGlobal();

		/****** IFSelect_DispGlobal::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns as Label, 'One File for all Input'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_DispGlobal::LimitedMax ******/
		/****** md5 signature: bebedf32506bd4e0fabf1509db75df8f ******/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "
Parameters
----------
nbent: int

Return
-------
max: int

Description
-----------
Returns True: maximum equates 1.
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****** IFSelect_DispGlobal::Packets ******/
		/****** md5 signature: 926a75218f16786de747dd6ee34bde90 ******/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Return
-------
None

Description
-----------
Computes the list of produced Packets. It is made of only ONE Packet, which gets the RootResult from the Final Selection. Remark: the inherited exception raising is never activated.
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

};


%make_alias(IFSelect_DispGlobal)

%extend IFSelect_DispGlobal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_DispPerCount *
******************************/
class IFSelect_DispPerCount : public IFSelect_Dispatch {
	public:
		/****** IFSelect_DispPerCount::IFSelect_DispPerCount ******/
		/****** md5 signature: 13f8a526a291141411f3b9834d620986 ******/
		%feature("compactdefaultargs") IFSelect_DispPerCount;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a DispPerCount with no Count (default value 1).
") IFSelect_DispPerCount;
		 IFSelect_DispPerCount();

		/****** IFSelect_DispPerCount::Count ******/
		/****** md5 signature: 4b1d88b7bbb24b2363ee95caa1332467 ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns the Count Parameter used for splitting.
") Count;
		opencascade::handle<IFSelect_IntParam> Count();

		/****** IFSelect_DispPerCount::CountValue ******/
		/****** md5 signature: 34aef256795b3aff969f27bc6b2b1d5b ******/
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the effective value of the count parameter (if Count Parameter not Set or value not positive, returns 1).
") CountValue;
		Standard_Integer CountValue();

		/****** IFSelect_DispPerCount::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns as Label, 'One File per <count> Input Entities'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_DispPerCount::LimitedMax ******/
		/****** md5 signature: bebedf32506bd4e0fabf1509db75df8f ******/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "
Parameters
----------
nbent: int

Return
-------
max: int

Description
-----------
Returns True, maximum count is given as <nbent>.
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****** IFSelect_DispPerCount::Packets ******/
		/****** md5 signature: 926a75218f16786de747dd6ee34bde90 ******/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Return
-------
None

Description
-----------
Computes the list of produced Packets. It defines Packets in order to have at most <Count> Entities per Packet, Entities are given by RootResult from the Final Selection.
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****** IFSelect_DispPerCount::SetCount ******/
		/****** md5 signature: 73b6b2ec4a8fe684699226dd361716a8 ******/
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "
Parameters
----------
count: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a new Parameter for Count.
") SetCount;
		void SetCount(const opencascade::handle<IFSelect_IntParam> & count);

};


%make_alias(IFSelect_DispPerCount)

%extend IFSelect_DispPerCount {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_DispPerFiles *
******************************/
class IFSelect_DispPerFiles : public IFSelect_Dispatch {
	public:
		/****** IFSelect_DispPerFiles::IFSelect_DispPerFiles ******/
		/****** md5 signature: 79578452b0da0825a4bf32759a6742fd ******/
		%feature("compactdefaultargs") IFSelect_DispPerFiles;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a DispPerFiles with no Count (default value 1 file).
") IFSelect_DispPerFiles;
		 IFSelect_DispPerFiles();

		/****** IFSelect_DispPerFiles::Count ******/
		/****** md5 signature: 4b1d88b7bbb24b2363ee95caa1332467 ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns the Count Parameter used for splitting.
") Count;
		opencascade::handle<IFSelect_IntParam> Count();

		/****** IFSelect_DispPerFiles::CountValue ******/
		/****** md5 signature: 34aef256795b3aff969f27bc6b2b1d5b ******/
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the effective value of the count parameter (if Count Parameter not Set or value not positive, returns 1).
") CountValue;
		Standard_Integer CountValue();

		/****** IFSelect_DispPerFiles::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns as Label, 'Maximum <count> Files'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_DispPerFiles::LimitedMax ******/
		/****** md5 signature: bebedf32506bd4e0fabf1509db75df8f ******/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "
Parameters
----------
nbent: int

Return
-------
max: int

Description
-----------
Returns True, maximum count is given as CountValue.
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****** IFSelect_DispPerFiles::Packets ******/
		/****** md5 signature: 926a75218f16786de747dd6ee34bde90 ******/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Return
-------
None

Description
-----------
Computes the list of produced Packets. It defines Packets in order to have <Count> Packets, except if the input count of Entities is lower. Entities are given by RootResult from the Final Selection.
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****** IFSelect_DispPerFiles::SetCount ******/
		/****** md5 signature: 73b6b2ec4a8fe684699226dd361716a8 ******/
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "
Parameters
----------
count: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a new Parameter for Count.
") SetCount;
		void SetCount(const opencascade::handle<IFSelect_IntParam> & count);

};


%make_alias(IFSelect_DispPerFiles)

%extend IFSelect_DispPerFiles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_DispPerOne *
****************************/
class IFSelect_DispPerOne : public IFSelect_Dispatch {
	public:
		/****** IFSelect_DispPerOne::IFSelect_DispPerOne ******/
		/****** md5 signature: 959660e7a6262dca5f330aa9b7fcaa57 ******/
		%feature("compactdefaultargs") IFSelect_DispPerOne;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a DispPerOne.
") IFSelect_DispPerOne;
		 IFSelect_DispPerOne();

		/****** IFSelect_DispPerOne::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns as Label, 'One File per Input Entity'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_DispPerOne::LimitedMax ******/
		/****** md5 signature: bebedf32506bd4e0fabf1509db75df8f ******/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "
Parameters
----------
nbent: int

Return
-------
max: int

Description
-----------
Returns True, maximum limit is given as <nbent>.
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****** IFSelect_DispPerOne::Packets ******/
		/****** md5 signature: 926a75218f16786de747dd6ee34bde90 ******/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Return
-------
None

Description
-----------
Returns the list of produced Packets. It defines one Packet per Entity given by RootResult from the Final Selection.
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

};


%make_alias(IFSelect_DispPerOne)

%extend IFSelect_DispPerOne {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IFSelect_DispPerSignature *
**********************************/
class IFSelect_DispPerSignature : public IFSelect_Dispatch {
	public:
		/****** IFSelect_DispPerSignature::IFSelect_DispPerSignature ******/
		/****** md5 signature: 1d371ce8f335d23d47c96a75358d5b5b ******/
		%feature("compactdefaultargs") IFSelect_DispPerSignature;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a DispPerSignature with no SignCounter (by default, produces only one packet).
") IFSelect_DispPerSignature;
		 IFSelect_DispPerSignature();

		/****** IFSelect_DispPerSignature::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns as Label, 'One File per Signature <name>'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_DispPerSignature::LimitedMax ******/
		/****** md5 signature: bebedf32506bd4e0fabf1509db75df8f ******/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "
Parameters
----------
nbent: int

Return
-------
max: int

Description
-----------
Returns True, maximum count is given as <nbent>.
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****** IFSelect_DispPerSignature::Packets ******/
		/****** md5 signature: 926a75218f16786de747dd6ee34bde90 ******/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Return
-------
None

Description
-----------
Computes the list of produced Packets. It defines Packets from the SignCounter, which sirts the input Entities per Signature (specific of the SignCounter).
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****** IFSelect_DispPerSignature::SetSignCounter ******/
		/****** md5 signature: 03abf85c0d8e831104df106579bd4fa1 ******/
		%feature("compactdefaultargs") SetSignCounter;
		%feature("autodoc", "
Parameters
----------
sign: IFSelect_SignCounter

Return
-------
None

Description
-----------
Sets a SignCounter for sort Remark: it is set to record lists of entities, not only counts.
") SetSignCounter;
		void SetSignCounter(const opencascade::handle<IFSelect_SignCounter> & sign);

		/****** IFSelect_DispPerSignature::SignCounter ******/
		/****** md5 signature: 68b03213814a0f9ffbfade14dac9c7c5 ******/
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SignCounter>

Description
-----------
Returns the SignCounter used for splitting.
") SignCounter;
		opencascade::handle<IFSelect_SignCounter> SignCounter();

		/****** IFSelect_DispPerSignature::SignName ******/
		/****** md5 signature: c80dec5f02b4d9bc775dd97b309227ce ******/
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the SignCounter, which caracterises the sorting criterium for this Dispatch.
") SignName;
		Standard_CString SignName();

};


%make_alias(IFSelect_DispPerSignature)

%extend IFSelect_DispPerSignature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IFSelect_Modifier *
**************************/
%nodefaultctor IFSelect_Modifier;
class IFSelect_Modifier : public IFSelect_GeneralModifier {
	public:
		/****** IFSelect_Modifier::Perform ******/
		/****** md5 signature: af66e2b5fd47b40d3287588f1c2eaabd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ctx: IFSelect_ContextModif
target: Interface_InterfaceModel
protocol: Interface_Protocol
TC: Interface_CopyTool

Return
-------
None

Description
-----------
This deferred method defines the action specific to each class of Modifier. It is called by a ModelCopier, once the Model generated and filled. ModelCopier has already checked the criteria (Dispatch, Model Rank, Selection) before calling it. //! <ctx> detains information about original data and selection. The result of copying, on which modifications are to be done, is <target>. <TC> allows to run additional copies as required //! In case of Error, use methods CCheck from the ContextModif to acknowledge an entity Check or a Global Check with messages.
") Perform;
		virtual void Perform(IFSelect_ContextModif & ctx, const opencascade::handle<Interface_InterfaceModel> & target, const opencascade::handle<Interface_Protocol> & protocol, Interface_CopyTool & TC);

};


%make_alias(IFSelect_Modifier)

%extend IFSelect_Modifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_ParamEditor *
*****************************/
class IFSelect_ParamEditor : public IFSelect_Editor {
	public:
		/****** IFSelect_ParamEditor::IFSelect_ParamEditor ******/
		/****** md5 signature: 29dc66cedcbb1c95578667fc7c2afcfb ******/
		%feature("compactdefaultargs") IFSelect_ParamEditor;
		%feature("autodoc", "
Parameters
----------
nbmax: int (optional, default to 100)
label: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a ParamEditor, empty, with a maximum count of params (default is 100) And a label, by default it will be 'Param Editor'.
") IFSelect_ParamEditor;
		 IFSelect_ParamEditor(const Standard_Integer nbmax = 100, Standard_CString label = "");

		/****** IFSelect_ParamEditor::AddConstantText ******/
		/****** md5 signature: c706f09bb0add6352d9a4e15a803ba72 ******/
		%feature("compactdefaultargs") AddConstantText;
		%feature("autodoc", "
Parameters
----------
val: str
shortname: str
completename: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a Constant Text, it will be Read Only By default, its long name equates its shortname.
") AddConstantText;
		void AddConstantText(Standard_CString val, Standard_CString shortname, Standard_CString completename = "");

		/****** IFSelect_ParamEditor::AddValue ******/
		/****** md5 signature: ac3627cf81d5bc516ddff45ba712da52 ******/
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "
Parameters
----------
val: Interface_TypedValue
shortname: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a TypedValue By default, its short name equates its complete name, it can be made explicit.
") AddValue;
		void AddValue(const opencascade::handle<Interface_TypedValue> & val, Standard_CString shortname = "");

		/****** IFSelect_ParamEditor::Apply ******/
		/****** md5 signature: 7128480b7f4b1ff6fd959731640e27fc ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_ParamEditor::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_ParamEditor::Load ******/
		/****** md5 signature: fbb84192d1ec7737c4c84905239a2df8 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_ParamEditor::Recognize ******/
		/****** md5 signature: 745b42e0c753cb6baed4d66bbf94e5b8 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****** IFSelect_ParamEditor::StaticEditor ******/
		/****** md5 signature: 54fea9b5c2756d061b4380cb6bde0089 ******/
		%feature("compactdefaultargs") StaticEditor;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfHAsciiString
label: str (optional, default to "")

Return
-------
opencascade::handle<IFSelect_ParamEditor>

Description
-----------
Returns a ParamEditor to work on the Static Parameters of which names are listed in <list> Null Handle if <list> is null or empty.
") StaticEditor;
		static opencascade::handle<IFSelect_ParamEditor> StaticEditor(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list, Standard_CString label = "");

		/****** IFSelect_ParamEditor::StringValue ******/
		/****** md5 signature: 4371620dd4c31b906a08f6f8ee98f04a ******/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") StringValue;
		opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

};


%make_alias(IFSelect_ParamEditor)

%extend IFSelect_ParamEditor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_SelectBase *
****************************/
%nodefaultctor IFSelect_SelectBase;
class IFSelect_SelectBase : public IFSelect_Selection {
	public:
		/****** IFSelect_SelectBase::FillIterator ******/
		/****** md5 signature: 86f07b80fdbd697d2596463dcdc47dac ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: IFSelect_SelectionIterator

Return
-------
None

Description
-----------
Puts in an Iterator the Selections from which 'me' depends This list is empty for all SelectBase type Selections.
") FillIterator;
		void FillIterator(IFSelect_SelectionIterator & iter);

};


%make_alias(IFSelect_SelectBase)

%extend IFSelect_SelectBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectCombine *
*******************************/
%nodefaultctor IFSelect_SelectCombine;
class IFSelect_SelectCombine : public IFSelect_Selection {
	public:
		/****** IFSelect_SelectCombine::Add ******/
		/****** md5 signature: d2dfaf0466b66672814f414f1e5e27c6 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a Selection to the filling list By default, adds it to the end of the list A Positive rank less then NbInputs gives an insertion rank (InsertBefore: the new <atnum>th item of the list is <sel>).
") Add;
		void Add(const opencascade::handle<IFSelect_Selection> & sel, const Standard_Integer atnum = 0);

		/****** IFSelect_SelectCombine::FillIterator ******/
		/****** md5 signature: 86f07b80fdbd697d2596463dcdc47dac ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: IFSelect_SelectionIterator

Return
-------
None

Description
-----------
Puts in an Iterator the Selections from which 'me' depends That is to say, the list of Input Selections.
") FillIterator;
		void FillIterator(IFSelect_SelectionIterator & iter);

		/****** IFSelect_SelectCombine::Input ******/
		/****** md5 signature: 91e0e176fea36b9ac27267b16927382c ******/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns an Input Selection, given its rank in the list.
") Input;
		opencascade::handle<IFSelect_Selection> Input(const Standard_Integer num);

		/****** IFSelect_SelectCombine::InputRank ******/
		/****** md5 signature: 51944a1092194b5263cf30f94e575dda ******/
		%feature("compactdefaultargs") InputRank;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
int

Description
-----------
Returns the rank of an input Selection, 0 if not in the list. Most generally, its value is meaningless, except for testing the presence of an input Selection: - == 0 if <sel> is not an input for <self> - > 0 if <sel> is an input for <self>.
") InputRank;
		Standard_Integer InputRank(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_SelectCombine::NbInputs ******/
		/****** md5 signature: 509964fdaeeadc87abe4a39a3d5c6ec4 ******/
		%feature("compactdefaultargs") NbInputs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Input Selections.
") NbInputs;
		Standard_Integer NbInputs();

		/****** IFSelect_SelectCombine::Remove ******/
		/****** md5 signature: fde13a626af095b2cec77be85622263c ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
bool

Description
-----------
Removes an input Selection. Returns True if Done, False, if <sel> is not an input for <self>.
") Remove;
		Standard_Boolean Remove(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_SelectCombine::Remove ******/
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
Removes an input Selection, given its rank in the list Returns True if Done, False if <num> is out of range.
") Remove;
		Standard_Boolean Remove(const Standard_Integer num);

};


%make_alias(IFSelect_SelectCombine)

%extend IFSelect_SelectCombine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectControl *
*******************************/
%nodefaultctor IFSelect_SelectControl;
class IFSelect_SelectControl : public IFSelect_Selection {
	public:
		/****** IFSelect_SelectControl::FillIterator ******/
		/****** md5 signature: 86f07b80fdbd697d2596463dcdc47dac ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: IFSelect_SelectionIterator

Return
-------
None

Description
-----------
Puts in an Iterator the Selections from which 'me' depends That is to say, the list of Input Selections.
") FillIterator;
		void FillIterator(IFSelect_SelectionIterator & iter);

		/****** IFSelect_SelectControl::HasSecondInput ******/
		/****** md5 signature: 5603b991dc92e59288a565bd8eef4051 ******/
		%feature("compactdefaultargs") HasSecondInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Control Input is defined Thus, Result can be computed differently if there is a Control Input or if there is none.
") HasSecondInput;
		Standard_Boolean HasSecondInput();

		/****** IFSelect_SelectControl::MainInput ******/
		/****** md5 signature: 8eaee9be6fec1b7b6a5de5cd683cdaaa ******/
		%feature("compactdefaultargs") MainInput;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the Main Input Selection.
") MainInput;
		opencascade::handle<IFSelect_Selection> MainInput();

		/****** IFSelect_SelectControl::SecondInput ******/
		/****** md5 signature: 9d3a266423cc306f80c213cc49865484 ******/
		%feature("compactdefaultargs") SecondInput;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the Control Input Selection, or a Null Handle.
") SecondInput;
		opencascade::handle<IFSelect_Selection> SecondInput();

		/****** IFSelect_SelectControl::SetMainInput ******/
		/****** md5 signature: 25053a281ae6bb3b296cb17174531718 ******/
		%feature("compactdefaultargs") SetMainInput;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Sets a Selection to be the Main Input.
") SetMainInput;
		void SetMainInput(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_SelectControl::SetSecondInput ******/
		/****** md5 signature: e7802debfa1992314d7158d3f6d00703 ******/
		%feature("compactdefaultargs") SetSecondInput;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Sets a Selection to be the Control Input.
") SetSecondInput;
		void SetSecondInput(const opencascade::handle<IFSelect_Selection> & sel);

};


%make_alias(IFSelect_SelectControl)

%extend IFSelect_SelectControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SelectDeduct *
******************************/
%nodefaultctor IFSelect_SelectDeduct;
class IFSelect_SelectDeduct : public IFSelect_Selection {
	public:
		/****** IFSelect_SelectDeduct::Alternate ******/
		/****** md5 signature: 1bb03c435fc621c84e5164f84dd6ee03 ******/
		%feature("compactdefaultargs") Alternate;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SelectPointed>

Description
-----------
Returns the Alternate Definition It is returned modifiable, hence an already defined SelectPointed can be used But if it was not yet defined, it is created the first time //! It is exploited by InputResult.
") Alternate;
		opencascade::handle<IFSelect_SelectPointed> & Alternate();

		/****** IFSelect_SelectDeduct::FillIterator ******/
		/****** md5 signature: 86f07b80fdbd697d2596463dcdc47dac ******/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "
Parameters
----------
iter: IFSelect_SelectionIterator

Return
-------
None

Description
-----------
Puts in an Iterator the Selections from which 'me' depends This list contains one Selection: the InputSelection.
") FillIterator;
		void FillIterator(IFSelect_SelectionIterator & iter);

		/****** IFSelect_SelectDeduct::HasAlternate ******/
		/****** md5 signature: 0ba0213c4364b48f7f228e6340101505 ******/
		%feature("compactdefaultargs") HasAlternate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if an Alternate List has been set, i.e.: the Alternate Definition is present and set.
") HasAlternate;
		Standard_Boolean HasAlternate();

		/****** IFSelect_SelectDeduct::HasInput ******/
		/****** md5 signature: 2b7ad360bfc35ddacf02c758861e0a37 ******/
		%feature("compactdefaultargs") HasInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Input Selection is defined, False else.
") HasInput;
		Standard_Boolean HasInput();

		/****** IFSelect_SelectDeduct::Input ******/
		/****** md5 signature: a6ac3acd9f0ef17e1d1b87ef2e7da981 ******/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the Input Selection.
") Input;
		opencascade::handle<IFSelect_Selection> Input();

		/****** IFSelect_SelectDeduct::InputResult ******/
		/****** md5 signature: c87da2f2082eb83285b7464c15a8749a ******/
		%feature("compactdefaultargs") InputResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the Result determined by Input Selection, as Unique if Input Selection is not defined, returns an empty list. //! If Alternate is set, InputResult takes its definition instead of calling the Input Selection, then clears it.
") InputResult;
		Interface_EntityIterator InputResult(const Interface_Graph & G);

		/****** IFSelect_SelectDeduct::SetInput ******/
		/****** md5 signature: a5a31b9c8d751cb3c5654d16185fbc21 ******/
		%feature("compactdefaultargs") SetInput;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Defines or Changes the Input Selection.
") SetInput;
		void SetInput(const opencascade::handle<IFSelect_Selection> & sel);

};


%make_alias(IFSelect_SelectDeduct)

%extend IFSelect_SelectDeduct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SessionPilot *
******************************/
class IFSelect_SessionPilot : public IFSelect_Activator {
	public:
		/****** IFSelect_SessionPilot::IFSelect_SessionPilot ******/
		/****** md5 signature: 857975c9d2e3289c6f312355cf6b83e4 ******/
		%feature("compactdefaultargs") IFSelect_SessionPilot;
		%feature("autodoc", "
Parameters
----------
prompt: str (optional, default to "")

Return
-------
None

Description
-----------
Creates an empty SessionPilot, with a prompt which will be displayed on querying commands. If not precised (''), this prompt is set to 'Test-XSTEP>'.
") IFSelect_SessionPilot;
		 IFSelect_SessionPilot(Standard_CString prompt = "");

		/****** IFSelect_SessionPilot::Arg ******/
		/****** md5 signature: 2da64ea2a48487fcd46dcb82c6e58e6b ******/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
Returns a word given its rank, as a CString. As for Word, begins at 0 (the command name), etc...
") Arg;
		Standard_CString Arg(const Standard_Integer num);

		/****** IFSelect_SessionPilot::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the recorded information (commands, objects).
") Clear;
		void Clear();

		/****** IFSelect_SessionPilot::Command ******/
		/****** md5 signature: ee33c81c64d90099e926ad4996fd30c7 ******/
		%feature("compactdefaultargs") Command;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns a recorded Command, given its rank (from 1).
") Command;
		const TCollection_AsciiString & Command(const Standard_Integer num);

		/****** IFSelect_SessionPilot::CommandLine ******/
		/****** md5 signature: 6bddf17df28ae73fcb4b88ac7337c0af ******/
		%feature("compactdefaultargs") CommandLine;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the Command Line to be interpreted.
") CommandLine;
		const TCollection_AsciiString & CommandLine();

		/****** IFSelect_SessionPilot::CommandPart ******/
		/****** md5 signature: 83e1d4e8dabebb7f34cc34cc3d07ab01 ******/
		%feature("compactdefaultargs") CommandPart;
		%feature("autodoc", "
Parameters
----------
numarg: int (optional, default to 0)

Return
-------
str

Description
-----------
Returns the part of the command line which begins at argument <numarg> between 0 and NbWords-1 (by default, all the line) Empty string if out of range.
") CommandPart;
		Standard_CString CommandPart(const Standard_Integer numarg = 0);

		/****** IFSelect_SessionPilot::Do ******/
		/****** md5 signature: 5ceca079a69923771351b0545691221e ******/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "
Parameters
----------
number: int
session: IFSelect_SessionPilot

Return
-------
IFSelect_ReturnStatus

Description
-----------
Processes specific commands, which are: x or exit for end of session ? or help for help messages xcommand to control command lines (Record Mode, List, Clear, File Output ...) xsource to execute a command file (no nesting allowed), in case of error, source is stopped and keyword recovers xstep is a simple prefix (useful in a wider environment, to avoid conflicts on command names) xset control commands which create items with names.
") Do;
		IFSelect_ReturnStatus Do(const Standard_Integer number, const opencascade::handle<IFSelect_SessionPilot> & session);

		/****** IFSelect_SessionPilot::Execute ******/
		/****** md5 signature: 8c56d2ed0161657a57d3d5a1e4920b73 ******/
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "
Parameters
----------
command: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Sets the Command then tries to execute it. Return value: same as for Perform.
") Execute;
		IFSelect_ReturnStatus Execute(TCollection_AsciiString command);

		/****** IFSelect_SessionPilot::ExecuteAlias ******/
		/****** md5 signature: e07be4160db4a13348666d3fb5cb3af5 ******/
		%feature("compactdefaultargs") ExecuteAlias;
		%feature("autodoc", "
Parameters
----------
aliasname: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Executes the Commands, except that the command name (word 0) is aliased. The rest of the command line is unchanged If <alias> is empty, Executes with no change //! Error status is returned if the alias is unknown as command.
") ExecuteAlias;
		IFSelect_ReturnStatus ExecuteAlias(TCollection_AsciiString aliasname);

		/****** IFSelect_SessionPilot::ExecuteCounter ******/
		/****** md5 signature: 4eaa898031294b8c05e43daa1cc2d67f ******/
		%feature("compactdefaultargs") ExecuteCounter;
		%feature("autodoc", "
Parameters
----------
counter: IFSelect_SignCounter
numword: int
mode: IFSelect_PrintCount (optional, default to IFSelect_CountByItem)

Return
-------
IFSelect_ReturnStatus

Description
-----------
Executes a Counter in a general way If <numword> is greater than count of command words, it counts all the model. Else it considers the word <numword> as the identifier of a Selection <mode> gives the mode of printing results, default is CountByItem.
") ExecuteCounter;
		IFSelect_ReturnStatus ExecuteCounter(const opencascade::handle<IFSelect_SignCounter> & counter, const Standard_Integer numword, const IFSelect_PrintCount mode = IFSelect_CountByItem);

		/****** IFSelect_SessionPilot::Help ******/
		/****** md5 signature: f58ae97ad0af39f2393512a71352549e ******/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "
Parameters
----------
number: int

Return
-------
str

Description
-----------
Help for specific commands (apart from general command help).
") Help;
		Standard_CString Help(const Standard_Integer number);

		/****** IFSelect_SessionPilot::Library ******/
		/****** md5 signature: 6f8e211d941f22828ff8762b8fc91e49 ******/
		%feature("compactdefaultargs") Library;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_WorkLibrary>

Description
-----------
Returns the WorKlibrary (Null if not set). WorkLibrary is used to Read and Write Files, according to the Norm.
") Library;
		opencascade::handle<IFSelect_WorkLibrary> Library();

		/****** IFSelect_SessionPilot::NbCommands ******/
		/****** md5 signature: 6078e4a9471b1f847391aaa4bebb1c99 ******/
		%feature("compactdefaultargs") NbCommands;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded Commands.
") NbCommands;
		Standard_Integer NbCommands();

		/****** IFSelect_SessionPilot::NbWords ******/
		/****** md5 signature: fb558e9d827d2ed283207e25bf36b070 ******/
		%feature("compactdefaultargs") NbWords;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of words of the Command Line, separated by blanks: 0 if empty, one if a command without args, else it gives the count of args minus one. Warning: limited to 10 (command title + 9 args).
") NbWords;
		Standard_Integer NbWords();

		/****** IFSelect_SessionPilot::Number ******/
		/****** md5 signature: 8d09d879f9815dde65029de8e1331381 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
int

Description
-----------
Interprets a string value as an entity number: if it gives an integer, returns its value else, considers it as ENtityLabel (preferably case sensitive) in case of failure, returns 0.
") Number;
		Standard_Integer Number(Standard_CString val);

		/****** IFSelect_SessionPilot::Perform ******/
		/****** md5 signature: 8c78d156fdf5368ae88c10d60efd4428 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
IFSelect_ReturnStatus

Description
-----------
Executes the Command, itself (for built-in commands, which have priority) or by using the list of Activators. The value returned is: RetVoid if nothing done (void command) RetDone if execution OK, RetEnd if END OF SESSION, RetError if command unknown or incorrect, RetFail if error on execution If execution is OK and RecordMode is set, this Command Line is recorded to the list (see below).
") Perform;
		IFSelect_ReturnStatus Perform();

		/****** IFSelect_SessionPilot::ReadScript ******/
		/****** md5 signature: 51ef359f92322c3b2d8c2e9c1c36dae1 ******/
		%feature("compactdefaultargs") ReadScript;
		%feature("autodoc", "
Parameters
----------
file: str (optional, default to "")

Return
-------
IFSelect_ReturnStatus

Description
-----------
Reads commands from a Script File, named <file>. By default (file = ''), reads from standard input with a prompt Else (reading from a file), the read commands are displayed onto standard output. Allows nested reads. Reading is stopped either by command x or exit, or by reaching end of file Return Value follows the rules of Do: RetEnd for normal end, RetFail if script could not be opened.
") ReadScript;
		IFSelect_ReturnStatus ReadScript(Standard_CString file = "");

		/****** IFSelect_SessionPilot::RecordItem ******/
		/****** md5 signature: f1527347754a5e5054d80ddc568a5131 ******/
		%feature("compactdefaultargs") RecordItem;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
IFSelect_ReturnStatus

Description
-----------
Allows to associate a Transient Value with the last execution as a partial result Returns RetDone if item is not Null, RetFail if item is Null Remark: it is nullified for each Perform.
") RecordItem;
		IFSelect_ReturnStatus RecordItem(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SessionPilot::RecordMode ******/
		/****** md5 signature: 0d08a70331d1db8b3781ed5b3555caae ******/
		%feature("compactdefaultargs") RecordMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Record Mode for Commands. Default is False.
") RecordMode;
		Standard_Boolean RecordMode();

		/****** IFSelect_SessionPilot::RecordedItem ******/
		/****** md5 signature: c8f555fbdde1b5878c3c322131bc0972 ******/
		%feature("compactdefaultargs") RecordedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Transient Object which was recorded with the current Line Command. If none was, returns a Null Handle.
") RecordedItem;
		opencascade::handle<Standard_Transient> RecordedItem();

		/****** IFSelect_SessionPilot::RemoveWord ******/
		/****** md5 signature: 4ce2a0f95cb1359a38bc88957771c5c2 ******/
		%feature("compactdefaultargs") RemoveWord;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Removes a word given its rank. Returns True if Done, False if <num> is out of range.
") RemoveWord;
		Standard_Boolean RemoveWord(const Standard_Integer num);

		/****** IFSelect_SessionPilot::Session ******/
		/****** md5 signature: 60e69ff7e32725297667bb2b3b3fb532 ******/
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_WorkSession>

Description
-----------
Returns the WorkSession which is worked on.
") Session;
		opencascade::handle<IFSelect_WorkSession> Session();

		/****** IFSelect_SessionPilot::SetCommandLine ******/
		/****** md5 signature: fd7b3f095bf990e78e41c238391a917a ******/
		%feature("compactdefaultargs") SetCommandLine;
		%feature("autodoc", "
Parameters
----------
command: str

Return
-------
None

Description
-----------
Sets the value of the Command Line to be interpreted Also prepares the interpretation (splitting by blanks).
") SetCommandLine;
		void SetCommandLine(TCollection_AsciiString command);

		/****** IFSelect_SessionPilot::SetLibrary ******/
		/****** md5 signature: db5a590ba65f594bbef5e2ca606bd5a6 ******/
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "
Parameters
----------
WL: IFSelect_WorkLibrary

Return
-------
None

Description
-----------
Sets a WorkLibrary.
") SetLibrary;
		void SetLibrary(const opencascade::handle<IFSelect_WorkLibrary> & WL);

		/****** IFSelect_SessionPilot::SetRecordMode ******/
		/****** md5 signature: df94b23ba2a4f5cb349f3b71b9af48cb ******/
		%feature("compactdefaultargs") SetRecordMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Changes the RecordMode.
") SetRecordMode;
		void SetRecordMode(const Standard_Boolean mode);

		/****** IFSelect_SessionPilot::SetSession ******/
		/****** md5 signature: e037c882fa5543b1a8cc4af9b785204c ******/
		%feature("compactdefaultargs") SetSession;
		%feature("autodoc", "
Parameters
----------
WS: IFSelect_WorkSession

Return
-------
None

Description
-----------
Sets a WorkSession to be worked on.
") SetSession;
		void SetSession(const opencascade::handle<IFSelect_WorkSession> & WS);

		/****** IFSelect_SessionPilot::Word ******/
		/****** md5 signature: e9741d12192b37b17d42c267e6ce2a03 ******/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns a word given its rank in the Command Line. Begins at 0 which is the Command Title, 1 is the 1st arg., etc...
") Word;
		const TCollection_AsciiString & Word(const Standard_Integer num);

};


%make_alias(IFSelect_SessionPilot)

%extend IFSelect_SessionPilot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SignCategory *
******************************/
class IFSelect_SignCategory : public IFSelect_Signature {
	public:
		/****** IFSelect_SignCategory::IFSelect_SignCategory ******/
		/****** md5 signature: b22730cd7bf9a02fc3ed34daf68c6bc0 ******/
		%feature("compactdefaultargs") IFSelect_SignCategory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SignCategory.
") IFSelect_SignCategory;
		 IFSelect_SignCategory();

		/****** IFSelect_SignCategory::Value ******/
		/****** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ******/
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
Returns the Signature for a Transient object, as its Category recorded in the model.
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SignCategory)

%extend IFSelect_SignCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_SignCounter *
*****************************/
class IFSelect_SignCounter : public IFSelect_SignatureList {
	public:
		/****** IFSelect_SignCounter::IFSelect_SignCounter ******/
		/****** md5 signature: ef8188163ad05dffc670c2aa920e76f5 ******/
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "
Parameters
----------
withmap: bool (optional, default to Standard_True)
withlist: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a SignCounter, without proper Signature If <withmap> is True (default), added entities are counted only if they are not yet recorded in the map Map control can be set off if the input guarantees uniqueness of data <withlist> is transmitted to SignatureList (option to list entities, not only to count them).
") IFSelect_SignCounter;
		 IFSelect_SignCounter(const Standard_Boolean withmap = Standard_True, const Standard_Boolean withlist = Standard_False);

		/****** IFSelect_SignCounter::IFSelect_SignCounter ******/
		/****** md5 signature: 50e58c41f76c3f49231c01c0e98259e0 ******/
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "
Parameters
----------
matcher: IFSelect_Signature
withmap: bool (optional, default to Standard_True)
withlist: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a SignCounter, with a predefined Signature Other arguments as for Create without Signature.
") IFSelect_SignCounter;
		 IFSelect_SignCounter(const opencascade::handle<IFSelect_Signature> & matcher, const Standard_Boolean withmap = Standard_True, const Standard_Boolean withlist = Standard_False);

		/****** IFSelect_SignCounter::AddEntity ******/
		/****** md5 signature: e8508b798076af5bbd931d49d2fd0e9a ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Adds an entity by considering its signature, which is given by call to method AddSign Returns True if added, False if already in the map (and map control status set).
") AddEntity;
		virtual Standard_Boolean AddEntity(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SignCounter::AddFromSelection ******/
		/****** md5 signature: 8d9bf9a5a23356fc53d132b07a1560d5 ******/
		%feature("compactdefaultargs") AddFromSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection
G: Interface_Graph

Return
-------
None

Description
-----------
Adds the result determined by a Selection from a Graph Remark: does not impact at all data from SetSelection & Co.
") AddFromSelection;
		void AddFromSelection(const opencascade::handle<IFSelect_Selection> & sel, const Interface_Graph & G);

		/****** IFSelect_SignCounter::AddList ******/
		/****** md5 signature: 9d3d777c0f0784aa96982a76ddad27d6 ******/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Adds a list of entities by adding each of the items.
") AddList;
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SignCounter::AddModel ******/
		/****** md5 signature: 382e0e340780b5b95ec820d1c6e5d0e3 ******/
		%feature("compactdefaultargs") AddModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Adds all the entities contained in a Model.
") AddModel;
		void AddModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SignCounter::AddSign ******/
		/****** md5 signature: dc98872007dc5ead138d9bcb1db9cafb ******/
		%feature("compactdefaultargs") AddSign;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Adds an entity (already filtered by Map) with its signature. This signature can be computed with the containing model. Its value is provided by the object Signature given at start, if no Signature is defined, it does nothing. //! Can be redefined (in this case, see also Sign).
") AddSign;
		virtual void AddSign(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SignCounter::AddWithGraph ******/
		/****** md5 signature: 0ad72fe2a9811130a2f0ead77172eebb ******/
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient
graph: Interface_Graph

Return
-------
None

Description
-----------
Adds a list of entities in the context given by the graph Default just call basic AddList Can be redefined to get a signature computed with the graph.
") AddWithGraph;
		virtual void AddWithGraph(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Interface_Graph & graph);

		/****** IFSelect_SignCounter::ComputeSelected ******/
		/****** md5 signature: ac021174fd1e107095060f7bad43f6bc ******/
		%feature("compactdefaultargs") ComputeSelected;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
forced: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Computes from the selection result, if selection is active (mode 2). If selection is not defined (mode 0) or is inhibited (mode 1) does nothing. Returns True if computation is done (or optimised), False else This method is called by ComputeCounter from WorkSession //! If <forced> is True, recomputes systematically Else (D), if the counter was not cleared and if the former computed result started from the same total size of Graph and same count of selected entities: computation is not redone unless <forced> is given as True.
") ComputeSelected;
		Standard_Boolean ComputeSelected(const Interface_Graph & G, const Standard_Boolean forced = Standard_False);

		/****** IFSelect_SignCounter::ComputedSign ******/
		/****** md5 signature: 2fa69519baea2b68372eea8bfd58a08e ******/
		%feature("compactdefaultargs") ComputedSign;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
G: Interface_Graph

Return
-------
str

Description
-----------
Applies AddWithGraph on one entity, and returns the Signature Value which has been recorded To do this, Add is called with SignOnly Mode True during the call, the returned value is LastValue.
") ComputedSign;
		Standard_CString ComputedSign(const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G);

		/****** IFSelect_SignCounter::SelMode ******/
		/****** md5 signature: ddfdcb2d213abcd775c5035b238d1167 ******/
		%feature("compactdefaultargs") SelMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the mode of working with the selection.
") SelMode;
		Standard_Integer SelMode();

		/****** IFSelect_SignCounter::Selection ******/
		/****** md5 signature: e05f8581b544958a8c567b8bd0f3b0c4 ******/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the selection, or a null Handle.
") Selection;
		opencascade::handle<IFSelect_Selection> Selection();

		/****** IFSelect_SignCounter::SetMap ******/
		/****** md5 signature: 69fbfc1a3017c51bdf30d41f8cfc792c ******/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "
Parameters
----------
withmap: bool

Return
-------
None

Description
-----------
Changes the control status. The map is not cleared, simply its use changes.
") SetMap;
		void SetMap(const Standard_Boolean withmap);

		/****** IFSelect_SignCounter::SetSelMode ******/
		/****** md5 signature: 9e722ba859e1ebd68aed9c9ddbecff64 ******/
		%feature("compactdefaultargs") SetSelMode;
		%feature("autodoc", "
Parameters
----------
selmode: int

Return
-------
None

Description
-----------
Changes the mode of working with the selection: -1 just clears optimisation data and nothing else 0 clears it 1 inhibits it for computing (but no clearing) 2 sets it active for computing Default at creation is 0, after SetSelection (not null) is 2.
") SetSelMode;
		void SetSelMode(const Standard_Integer selmode);

		/****** IFSelect_SignCounter::SetSelection ******/
		/****** md5 signature: c33ace088a61e8e42ceb139b2bb56198 ******/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Sets a Selection as input: this causes content to be cleared then the Selection to be ready to compute (but not immediately).
") SetSelection;
		void SetSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_SignCounter::Sign ******/
		/****** md5 signature: 2ac856150cb7f137ff9692e604ed0787 ******/
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Determines and returns the value of the signature for an entity as an HAsciiString. This method works exactly as AddSign, which is optimized //! Can be redefined, accorded with AddSign.
") Sign;
		virtual opencascade::handle<TCollection_HAsciiString> Sign(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SignCounter::Signature ******/
		/****** md5 signature: 6971baf30f0d8a413d639c156d76dfc1 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Signature>

Description
-----------
Returns the Signature used to count entities. It can be null.
") Signature;
		opencascade::handle<IFSelect_Signature> Signature();

};


%make_alias(IFSelect_SignCounter)

%extend IFSelect_SignCounter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SignMultiple *
******************************/
class IFSelect_SignMultiple : public IFSelect_Signature {
	public:
		/****** IFSelect_SignMultiple::IFSelect_SignMultiple ******/
		/****** md5 signature: fa2ffecc7cbb7183778497de04da427e ******/
		%feature("compactdefaultargs") IFSelect_SignMultiple;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Creates an empty SignMultiple with a Name This name should take expected tabulations into account.
") IFSelect_SignMultiple;
		 IFSelect_SignMultiple(Standard_CString name);

		/****** IFSelect_SignMultiple::Add ******/
		/****** md5 signature: 3228a1194cec7f5e691e5dcd687ac67c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
subsign: IFSelect_Signature
width: int (optional, default to 0)
maxi: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds a Signature. Width, if given, gives the tabulation If <maxi> is True, it is a forced tabulation (overlength is replaced by a final dot) If <maxi> is False, just 3 blanks follow an overlength.
") Add;
		void Add(const opencascade::handle<IFSelect_Signature> & subsign, const Standard_Integer width = 0, const Standard_Boolean maxi = Standard_False);

		/****** IFSelect_SignMultiple::Matches ******/
		/****** md5 signature: 6cdb41c3b6f4c6d9bbd3a66d390d7419 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: str
exact: bool

Return
-------
bool

Description
-----------
Specialized Match Rule If <exact> is False, simply checks if at least one sub-item matches If <exact> is True, standard match with Value (i.e. tabulations must be respected).
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, TCollection_AsciiString text, const Standard_Boolean exact);

		/****** IFSelect_SignMultiple::Value ******/
		/****** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ******/
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
Concatenates the values of sub-signatures, with their tabulations.
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SignMultiple)

%extend IFSelect_SignMultiple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IFSelect_SignType *
**************************/
class IFSelect_SignType : public IFSelect_Signature {
	public:
		/****** IFSelect_SignType::IFSelect_SignType ******/
		/****** md5 signature: 41686c79bd379b0908e693de64f7d4cc ******/
		%feature("compactdefaultargs") IFSelect_SignType;
		%feature("autodoc", "
Parameters
----------
nopk: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns a SignType <nopk> false (D): complete dynamic type (name = Dynamic Type) <nopk> true: class type without pk (name = Class Type).
") IFSelect_SignType;
		 IFSelect_SignType(const Standard_Boolean nopk = Standard_False);

		/****** IFSelect_SignType::Value ******/
		/****** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ******/
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
Returns the Signature for a Transient object, as its Dynamic Type, with or without package name, according starting option.
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SignType)

%extend IFSelect_SignType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SignValidity *
******************************/
class IFSelect_SignValidity : public IFSelect_Signature {
	public:
		/****** IFSelect_SignValidity::IFSelect_SignValidity ******/
		/****** md5 signature: fafa0b9d7e52279eee32f09eefcf0d16 ******/
		%feature("compactdefaultargs") IFSelect_SignValidity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SignValidity.
") IFSelect_SignValidity;
		 IFSelect_SignValidity();

		/****** IFSelect_SignValidity::CVal ******/
		/****** md5 signature: ff90db2a43fce7d2caa3714fa159f9db ******/
		%feature("compactdefaultargs") CVal;
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
Returns the Signature for a Transient object, as a validity deducted from data (reports) stored in the model. Class method, can be called by any one.
") CVal;
		static Standard_CString CVal(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SignValidity::Value ******/
		/****** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ******/
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
Returns the Signature for a Transient object, as a validity deducted from data (reports) stored in the model Calls the class method CVal.
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SignValidity)

%extend IFSelect_SignValidity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IFSelect_TransformStandard *
***********************************/
class IFSelect_TransformStandard : public IFSelect_Transformer {
	public:
		/****** IFSelect_TransformStandard::IFSelect_TransformStandard ******/
		/****** md5 signature: 6af20d833e31e36442eb98be5d8c387e ******/
		%feature("compactdefaultargs") IFSelect_TransformStandard;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a TransformStandard, option StandardCopy, no Modifier.
") IFSelect_TransformStandard;
		 IFSelect_TransformStandard();

		/****** IFSelect_TransformStandard::AddModifier ******/
		/****** md5 signature: 5eec899d81cf52da7352880ed3c3555d ******/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_Modifier
atnum: int (optional, default to 0)

Return
-------
bool

Description
-----------
Adds a Modifier to the list: - <atnum> = 0 (default): at the end of the list - <atnum> > 0: at rank <atnum> Returns True if done, False if <atnum> is out of range.
") AddModifier;
		Standard_Boolean AddModifier(const opencascade::handle<IFSelect_Modifier> & modif, const Standard_Integer atnum = 0);

		/****** IFSelect_TransformStandard::ApplyModifiers ******/
		/****** md5 signature: a5207e41a6732f7b81a83eaf77bf9108 ******/
		%feature("compactdefaultargs") ApplyModifiers;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
protocol: Interface_Protocol
TC: Interface_CopyTool
checks: Interface_CheckIterator
newmod: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Applies the modifiers sequentially. For each one, prepares required data (if a Selection is associated as a filter). For the option OnTheSpot, it determines if the graph may be changed and updates <newmod> if required If a Modifier causes an error (check 'HasFailed'), ApplyModifier stops: the following Modifiers are ignored.
") ApplyModifiers;
		Standard_Boolean ApplyModifiers(const Interface_Graph & G, const opencascade::handle<Interface_Protocol> & protocol, Interface_CopyTool & TC, Interface_CheckIterator & checks, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****** IFSelect_TransformStandard::Copy ******/
		/****** md5 signature: e964fcafc4f6e0ee301a833097202210 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Return
-------
None

Description
-----------
This the first operation. It calls StandardCopy or OnTheSpot according the option.
") Copy;
		void Copy(const Interface_Graph & G, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****** IFSelect_TransformStandard::CopyOption ******/
		/****** md5 signature: 44719f7f46cc5e4d45169f38dd8d18fd ******/
		%feature("compactdefaultargs") CopyOption;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Copy option.
") CopyOption;
		Standard_Boolean CopyOption();

		/****** IFSelect_TransformStandard::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text which defines the way a Transformer works: 'On the spot edition' or 'Standard Copy' followed by '<nn> Modifiers'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_TransformStandard::Modifier ******/
		/****** md5 signature: 7b8472ad81054bc38a2db613da8911e2 ******/
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_Modifier>

Description
-----------
Returns a Modifier given its rank in the list.
") Modifier;
		opencascade::handle<IFSelect_Modifier> Modifier(const Standard_Integer num);

		/****** IFSelect_TransformStandard::ModifierRank ******/
		/****** md5 signature: 6d9507d045d5370e99d88b4a8b5e48b8 ******/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_Modifier

Return
-------
int

Description
-----------
Returns the rank of a Modifier in the list, 0 if unknown.
") ModifierRank;
		Standard_Integer ModifierRank(const opencascade::handle<IFSelect_Modifier> & modif);

		/****** IFSelect_TransformStandard::NbModifiers ******/
		/****** md5 signature: b094909a30cd757bd379ce37050e4ed9 ******/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded Modifiers.
") NbModifiers;
		Standard_Integer NbModifiers();

		/****** IFSelect_TransformStandard::OnTheSpot ******/
		/****** md5 signature: 22f7ea0c28b2e3adfaacf03c3a0abe89 ******/
		%feature("compactdefaultargs") OnTheSpot;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Return
-------
None

Description
-----------
This is the OnTheSpot action: each entity is bound with ... itself. The produced model is the same as the starting one.
") OnTheSpot;
		void OnTheSpot(const Interface_Graph & G, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****** IFSelect_TransformStandard::Perform ******/
		/****** md5 signature: b1205e0b994dfb92700072b5562fb3aa ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
protocol: Interface_Protocol
checks: Interface_CheckIterator
newmod: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Performs the Standard Transformation, by calling Copy then ApplyModifiers (which can return an error status).
") Perform;
		Standard_Boolean Perform(const Interface_Graph & G, const opencascade::handle<Interface_Protocol> & protocol, Interface_CheckIterator & checks, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****** IFSelect_TransformStandard::RemoveModifier ******/
		/****** md5 signature: 335a49604c6b5b3141175f0223c4c508 ******/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "
Parameters
----------
modif: IFSelect_Modifier

Return
-------
bool

Description
-----------
Removes a Modifier from the list Returns True if done, False if <modif> not in the list.
") RemoveModifier;
		Standard_Boolean RemoveModifier(const opencascade::handle<IFSelect_Modifier> & modif);

		/****** IFSelect_TransformStandard::RemoveModifier ******/
		/****** md5 signature: 0651bb2b627676a79ab95725de23dd75 ******/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Removes a Modifier from the list, given its rank Returns True if done, False if <num> is out of range.
") RemoveModifier;
		Standard_Boolean RemoveModifier(const Standard_Integer num);

		/****** IFSelect_TransformStandard::Selection ******/
		/****** md5 signature: e05f8581b544958a8c567b8bd0f3b0c4 ******/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Selection>

Description
-----------
Returns the Selection, Null by default.
") Selection;
		opencascade::handle<IFSelect_Selection> Selection();

		/****** IFSelect_TransformStandard::SetCopyOption ******/
		/****** md5 signature: 9111ed0e23e1d11950ff2050e79e4d4a ******/
		%feature("compactdefaultargs") SetCopyOption;
		%feature("autodoc", "
Parameters
----------
option: bool

Return
-------
None

Description
-----------
Sets the Copy option to a new value: - True for StandardCopy - False for OnTheSpot.
") SetCopyOption;
		void SetCopyOption(const Standard_Boolean option);

		/****** IFSelect_TransformStandard::SetSelection ******/
		/****** md5 signature: c33ace088a61e8e42ceb139b2bb56198 ******/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_Selection

Return
-------
None

Description
-----------
Sets a Selection (or unsets if Null) This Selection then defines the list of entities on which the Modifiers will be applied If it is set, it has priority on Selections of Modifiers Else, for each Modifier its Selection is evaluated By default, all the Model is taken.
") SetSelection;
		void SetSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****** IFSelect_TransformStandard::StandardCopy ******/
		/****** md5 signature: 2ab4626116ebade474c45656f0976a5b ******/
		%feature("compactdefaultargs") StandardCopy;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Return
-------
None

Description
-----------
This is the standard action of Copy: its takes into account only the remaining entities (noted by Graph Status positive) and their proper dependances of course. Produces a new model.
") StandardCopy;
		void StandardCopy(const Interface_Graph & G, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****** IFSelect_TransformStandard::Updated ******/
		/****** md5 signature: ef53f73b484d5d7527130e47523fc8ca ******/
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "
Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient

Return
-------
bool

Description
-----------
This methods allows to know what happened to a starting entity after the last Perform. It reads result from the map which was filled by Perform.
") Updated;
		Standard_Boolean Updated(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto);

};


%make_alias(IFSelect_TransformStandard)

%extend IFSelect_TransformStandard {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_GraphCounter *
******************************/
class IFSelect_GraphCounter : public IFSelect_SignCounter {
	public:
		/****** IFSelect_GraphCounter::IFSelect_GraphCounter ******/
		/****** md5 signature: 338db17640fb19a55cf72489b5ab1f58 ******/
		%feature("compactdefaultargs") IFSelect_GraphCounter;
		%feature("autodoc", "
Parameters
----------
withmap: bool (optional, default to Standard_True)
withlist: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a GraphCounter, without applied selection.
") IFSelect_GraphCounter;
		 IFSelect_GraphCounter(const Standard_Boolean withmap = Standard_True, const Standard_Boolean withlist = Standard_False);

		/****** IFSelect_GraphCounter::AddWithGraph ******/
		/****** md5 signature: e51239465fde5d0a8e796c49f1a32936 ******/
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient
graph: Interface_Graph

Return
-------
None

Description
-----------
Adds a list of entities in the context given by the graph Default takes the count of entities selected by the applied selection, when it is given each entity of the list Can be redefined.
") AddWithGraph;
		virtual void AddWithGraph(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Interface_Graph & graph);

		/****** IFSelect_GraphCounter::Applied ******/
		/****** md5 signature: ec455be5b56bf4b787932b51f6c2ad00 ******/
		%feature("compactdefaultargs") Applied;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SelectDeduct>

Description
-----------
Returns the applied selection.
") Applied;
		opencascade::handle<IFSelect_SelectDeduct> Applied();

		/****** IFSelect_GraphCounter::SetApplied ******/
		/****** md5 signature: dcdd5f570d4abbad3176ed775a4d0f80 ******/
		%feature("compactdefaultargs") SetApplied;
		%feature("autodoc", "
Parameters
----------
sel: IFSelect_SelectDeduct

Return
-------
None

Description
-----------
Sets a new applied selection.
") SetApplied;
		void SetApplied(const opencascade::handle<IFSelect_SelectDeduct> & sel);

};


%make_alias(IFSelect_GraphCounter)

%extend IFSelect_GraphCounter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_ModifEditForm *
*******************************/
class IFSelect_ModifEditForm : public IFSelect_Modifier {
	public:
		/****** IFSelect_ModifEditForm::IFSelect_ModifEditForm ******/
		/****** md5 signature: d036df29b7c12830c621314c2b449a11 ******/
		%feature("compactdefaultargs") IFSelect_ModifEditForm;
		%feature("autodoc", "
Parameters
----------
editform: IFSelect_EditForm

Return
-------
None

Description
-----------
Creates a ModifEditForm. It may not change the graph.
") IFSelect_ModifEditForm;
		 IFSelect_ModifEditForm(const opencascade::handle<IFSelect_EditForm> & editform);

		/****** IFSelect_ModifEditForm::EditForm ******/
		/****** md5 signature: 6e029884e29cf92ef03ad5377b287b0b ******/
		%feature("compactdefaultargs") EditForm;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_EditForm>

Description
-----------
Returns the EditForm.
") EditForm;
		opencascade::handle<IFSelect_EditForm> EditForm();

		/****** IFSelect_ModifEditForm::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns Label as 'Apply EditForm <+ label of EditForm>'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_ModifEditForm::Perform ******/
		/****** md5 signature: 4c70286fda376ec2d1b40913ebcbb75a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ctx: IFSelect_ContextModif
target: Interface_InterfaceModel
protocol: Interface_Protocol
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Acts by applying an EditForm to entities, selected or all model.
") Perform;
		void Perform(IFSelect_ContextModif & ctx, const opencascade::handle<Interface_InterfaceModel> & target, const opencascade::handle<Interface_Protocol> & protocol, Interface_CopyTool & TC);

};


%make_alias(IFSelect_ModifEditForm)

%extend IFSelect_ModifEditForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_ModifReorder *
******************************/
class IFSelect_ModifReorder : public IFSelect_Modifier {
	public:
		/****** IFSelect_ModifReorder::IFSelect_ModifReorder ******/
		/****** md5 signature: eb7e0fdb0bfa34f9bf9960b432367fde ******/
		%feature("compactdefaultargs") IFSelect_ModifReorder;
		%feature("autodoc", "
Parameters
----------
rootlast: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a ModifReorder. It may change the graph (it does !) If <rootlast> is True (D), roots are set at the end of packets Else, they are set at beginning (as done by AddWithRefs).
") IFSelect_ModifReorder;
		 IFSelect_ModifReorder(const Standard_Boolean rootlast = Standard_True);

		/****** IFSelect_ModifReorder::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns Label as 'Reorder, Roots (last or first)'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_ModifReorder::Perform ******/
		/****** md5 signature: 4c70286fda376ec2d1b40913ebcbb75a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ctx: IFSelect_ContextModif
target: Interface_InterfaceModel
protocol: Interface_Protocol
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Acts by computing orders (by method All from ShareTool) then forcing them in the model. Remark that selection is ignored: ALL the model is processed in once.
") Perform;
		void Perform(IFSelect_ContextModif & ctx, const opencascade::handle<Interface_InterfaceModel> & target, const opencascade::handle<Interface_Protocol> & protocol, Interface_CopyTool & TC);

};


%make_alias(IFSelect_ModifReorder)

%extend IFSelect_ModifReorder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectAnyList *
*******************************/
%nodefaultctor IFSelect_SelectAnyList;
class IFSelect_SelectAnyList : public IFSelect_SelectDeduct {
	public:
		/****** IFSelect_SelectAnyList::FillResult ******/
		/****** md5 signature: 792aeac22016ad9131e6d4c40d505207 ******/
		%feature("compactdefaultargs") FillResult;
		%feature("autodoc", "
Parameters
----------
n1: int
n2: int
ent: Standard_Transient
res: Interface_EntityIterator

Return
-------
None

Description
-----------
Puts into <res>, the sub-entities of the list, from n1 to n2 included. Remark that adequation with Entity's type and length of list has already been made at this stage Called by RootResult.
") FillResult;
		virtual void FillResult(const Standard_Integer n1, const Standard_Integer n2, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & res);

		/****** IFSelect_SelectAnyList::HasLower ******/
		/****** md5 signature: fed85e72f70b42adca46c7b901badc46 ******/
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Lower limit is defined.
") HasLower;
		Standard_Boolean HasLower();

		/****** IFSelect_SelectAnyList::HasUpper ******/
		/****** md5 signature: d70f1e270858eac8843f77542c8137ff ******/
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Lower limit is defined.
") HasUpper;
		Standard_Boolean HasUpper();

		/****** IFSelect_SelectAnyList::KeepInputEntity ******/
		/****** md5 signature: 07a33c3b4b75593ca76702a01e11475c ******/
		%feature("compactdefaultargs") KeepInputEntity;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Keeps Input Entity, as having required type. It works by keeping in <iter>, only suitable Entities (SelectType can be used). Called by RootResult (which waits for ONE ENTITY MAX).
") KeepInputEntity;
		virtual void KeepInputEntity(Interface_EntityIterator & iter);

		/****** IFSelect_SelectAnyList::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Components of List ' then Specific List Label, then, following cases: ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..' Specific type is given by deferred method ListLabel.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectAnyList::ListLabel ******/
		/****** md5 signature: e1f20891cd796ded8c420e6ea05180ad ******/
		%feature("compactdefaultargs") ListLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the specific label for the list, which is included as a part of Label.
") ListLabel;
		virtual TCollection_AsciiString ListLabel();

		/****** IFSelect_SelectAnyList::Lower ******/
		/****** md5 signature: b8e70b42a5787ced8e76ff8aea48c3a4 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns Lower limit (if there is; else, value is senseless).
") Lower;
		opencascade::handle<IFSelect_IntParam> Lower();

		/****** IFSelect_SelectAnyList::LowerValue ******/
		/****** md5 signature: 02a3a48796ebc55a19b891812ce46acd ******/
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Integer Value of Lower Limit (0 if none).
") LowerValue;
		Standard_Integer LowerValue();

		/****** IFSelect_SelectAnyList::NbItems ******/
		/****** md5 signature: f5503bb7738b7054f156f3d2ade7bc7c ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Returns count of Items in the list in the Entity <ent> If <ent> has not required type, returned value must be Zero.
") NbItems;
		virtual Standard_Integer NbItems(const opencascade::handle<Standard_Transient> & ent);

		/****** IFSelect_SelectAnyList::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities (list of entities complying with rank criterium) Error if the input list has more than one Item.
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectAnyList::SetFrom ******/
		/****** md5 signature: 05cb4dd02524b771922c7da233564821 ******/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "
Parameters
----------
rankfrom: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a Lower limit but no upper limit.
") SetFrom;
		void SetFrom(const opencascade::handle<IFSelect_IntParam> & rankfrom);

		/****** IFSelect_SelectAnyList::SetOne ******/
		/****** md5 signature: 580d64eef8842101e558afd4d9668eec ******/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "
Parameters
----------
rank: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a unique number (only one Entity will be sorted as True).
") SetOne;
		void SetOne(const opencascade::handle<IFSelect_IntParam> & rank);

		/****** IFSelect_SelectAnyList::SetRange ******/
		/****** md5 signature: 2a1fca72607ec3d047d6765968c197ab ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
rankfrom: IFSelect_IntParam
rankto: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a Range for numbers, with a lower and a upper limits.
") SetRange;
		void SetRange(const opencascade::handle<IFSelect_IntParam> & rankfrom, const opencascade::handle<IFSelect_IntParam> & rankto);

		/****** IFSelect_SelectAnyList::SetUntil ******/
		/****** md5 signature: c2b636ba99c7210e7256d0dc69a8d6ee ******/
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "
Parameters
----------
rankto: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets an Upper limit but no lower limit (equivalent to lower 1).
") SetUntil;
		void SetUntil(const opencascade::handle<IFSelect_IntParam> & rankto);

		/****** IFSelect_SelectAnyList::Upper ******/
		/****** md5 signature: 95ed998f50d75ea326bf46efbee3cc71 ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns Upper limit (if there is; else, value is senseless).
") Upper;
		opencascade::handle<IFSelect_IntParam> Upper();

		/****** IFSelect_SelectAnyList::UpperValue ******/
		/****** md5 signature: bfeb4eb1504ceefb62ee59ee5fd7e8b8 ******/
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Integer Value of Upper Limit (0 if none).
") UpperValue;
		Standard_Integer UpperValue();

};


%make_alias(IFSelect_SelectAnyList)

%extend IFSelect_SelectAnyList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_SelectDiff *
****************************/
class IFSelect_SelectDiff : public IFSelect_SelectControl {
	public:
		/****** IFSelect_SelectDiff::IFSelect_SelectDiff ******/
		/****** md5 signature: 9ce2fe85e6bf6bc78a602fa758bb45af ******/
		%feature("compactdefaultargs") IFSelect_SelectDiff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty SelectDiff.
") IFSelect_SelectDiff;
		 IFSelect_SelectDiff();

		/****** IFSelect_SelectDiff::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Difference'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectDiff::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities: they are the Entities gotten from the Main Input but not from the Diff Input.
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectDiff)

%extend IFSelect_SelectDiff {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IFSelect_SelectEntityNumber *
************************************/
class IFSelect_SelectEntityNumber : public IFSelect_SelectBase {
	public:
		/****** IFSelect_SelectEntityNumber::IFSelect_SelectEntityNumber ******/
		/****** md5 signature: 4164328f7d83f309238a1cca8ed88bdd ******/
		%feature("compactdefaultargs") IFSelect_SelectEntityNumber;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectEntityNumber, initially with no specified Number.
") IFSelect_SelectEntityNumber;
		 IFSelect_SelectEntityNumber();

		/****** IFSelect_SelectEntityNumber::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Entity Number ...'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectEntityNumber::Number ******/
		/****** md5 signature: 117e1cb1a0df4fe4190bc789ad052f54 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns specified Number (as a Parameter).
") Number;
		opencascade::handle<IFSelect_IntParam> Number();

		/****** IFSelect_SelectEntityNumber::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities: the Entity having the specified Number (this result assures naturally uniqueness).
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectEntityNumber::SetNumber ******/
		/****** md5 signature: 0c07257246666fbc9141a7d06d07e3f3 ******/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "
Parameters
----------
num: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets Entity Number to be taken (initially, none is set: 0).
") SetNumber;
		void SetNumber(const opencascade::handle<IFSelect_IntParam> & num);

};


%make_alias(IFSelect_SelectEntityNumber)

%extend IFSelect_SelectEntityNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectExplore *
*******************************/
%nodefaultctor IFSelect_SelectExplore;
class IFSelect_SelectExplore : public IFSelect_SelectDeduct {
	public:
		/****** IFSelect_SelectExplore::Explore ******/
		/****** md5 signature: 73de1e3d33f392b762de263931616f8a ******/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "
Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Return
-------
bool

Description
-----------
Analyses and, if required, Explores an entity, as follows: The explored list starts as empty, it has to be filled by this method. If it returns False, <ent> is rejected for result (this is to be used only as safety) If it returns True and <explored> remains empty, <ent> is taken itself for result, not explored If it returns True and <explored> is not empty, the content of this list is considered: If maximum level is attained, it is taken for result Else (or no max), each of its entity will be itself explored.
") Explore;
		virtual Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** IFSelect_SelectExplore::ExploreLabel ******/
		/****** md5 signature: 71c1c113516263d6e90cc832e42af5dd ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the way of exploration.
") ExploreLabel;
		virtual TCollection_AsciiString ExploreLabel();

		/****** IFSelect_SelectExplore::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text saying '(Recursive)' or '(Level nn)' plus specific criterium returned by ExploreLabel (see below).
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectExplore::Level ******/
		/****** md5 signature: 06f7279e938b54c0bc4a49915192a536 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the required exploring level.
") Level;
		Standard_Integer Level();

		/****** IFSelect_SelectExplore::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities. Works by calling the method Explore on each input entity: it can be rejected, taken for output, or to explore. If the maximum level has not yet been attained, or if no max level is specified, entities to be explored are themselves used as if they were input.
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectExplore)

%extend IFSelect_SelectExplore {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectExtract *
*******************************/
%nodefaultctor IFSelect_SelectExtract;
class IFSelect_SelectExtract : public IFSelect_SelectDeduct {
	public:
		/****** IFSelect_SelectExtract::ExtractLabel ******/
		/****** md5 signature: bc185530f10f80baf87934442a9742ab ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium for extraction.
") ExtractLabel;
		virtual TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectExtract::IsDirect ******/
		/****** md5 signature: e230b64eefbb898397296c5ca615d396 ******/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Sort criterium is Direct, False if Reverse.
") IsDirect;
		Standard_Boolean IsDirect();

		/****** IFSelect_SelectExtract::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text saying 'Picked' or 'Removed', plus the specific criterium returned by ExtractLabel (see below).
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectExtract::RootResult ******/
		/****** md5 signature: 06f84f6b90b9fc5b3d5fc4b15404fb86 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities. Works by calling the method Sort on each input Entity: the Entity is kept as output if Sort returns the same value as Direct status.
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectExtract::SetDirect ******/
		/****** md5 signature: 9a3925830632dd6e10f403370415281a ******/
		%feature("compactdefaultargs") SetDirect;
		%feature("autodoc", "
Parameters
----------
direct: bool

Return
-------
None

Description
-----------
Sets Sort criterium sense to a new value (True: Direct , False: Reverse).
") SetDirect;
		void SetDirect(const Standard_Boolean direct);

		/****** IFSelect_SelectExtract::Sort ******/
		/****** md5 signature: 60e9196aa7be68c76123c021ea73ecdf ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns True for an Entity if it satisfies the Sort criterium It receives: - <rank>, the rank of the Entity in the Iteration, - <ent> , the Entity itself, and - <model>, the Starting Model Hence, the Entity to check is 'model->Value(num)' (but an InterfaceModel allows other checks) This method is specific to each class of SelectExtract.
") Sort;
		virtual Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SelectExtract::SortInGraph ******/
		/****** md5 signature: b2e994402c58f8cc2d7dc07b0e1595d6 ******/
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
G: Interface_Graph

Return
-------
bool

Description
-----------
Works as Sort but works on the Graph Default directly calls Sort, but it can be redefined If SortInGraph is redefined, Sort should be defined even if not called (to avoid deferred methods in a final class).
") SortInGraph;
		virtual Standard_Boolean SortInGraph(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G);

};


%make_alias(IFSelect_SelectExtract)

%extend IFSelect_SelectExtract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IFSelect_SelectIntersection *
************************************/
class IFSelect_SelectIntersection : public IFSelect_SelectCombine {
	public:
		/****** IFSelect_SelectIntersection::IFSelect_SelectIntersection ******/
		/****** md5 signature: cc839fd81d6ee7a4d18f01b4fe412592 ******/
		%feature("compactdefaultargs") IFSelect_SelectIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty SelectIntersection.
") IFSelect_SelectIntersection;
		 IFSelect_SelectIntersection();

		/****** IFSelect_SelectIntersection::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Intersection (AND)'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectIntersection::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected Entities, which is the common part of results from all input selections. Uniqueness is guaranteed.
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectIntersection)

%extend IFSelect_SelectIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IFSelect_SelectModelEntities *
*************************************/
class IFSelect_SelectModelEntities : public IFSelect_SelectBase {
	public:
		/****** IFSelect_SelectModelEntities::IFSelect_SelectModelEntities ******/
		/****** md5 signature: 465e9ea2ea9f56088044a9253718baf9 ******/
		%feature("compactdefaultargs") IFSelect_SelectModelEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectModelRoot.
") IFSelect_SelectModelEntities;
		 IFSelect_SelectModelEntities();

		/****** IFSelect_SelectModelEntities::CompleteResult ******/
		/****** md5 signature: 8b8d1b7dae97537052d6d27e34e8ef9f ******/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
The complete list of Entities (including shared ones) ... is exactly identical to RootResults in this case.
") CompleteResult;
		virtual Interface_EntityIterator CompleteResult(const Interface_Graph & G);

		/****** IFSelect_SelectModelEntities::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Model Entities'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectModelEntities::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities: the Entities of the Model (note that this result assures naturally uniqueness).
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectModelEntities)

%extend IFSelect_SelectModelEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IFSelect_SelectModelRoots *
**********************************/
class IFSelect_SelectModelRoots : public IFSelect_SelectBase {
	public:
		/****** IFSelect_SelectModelRoots::IFSelect_SelectModelRoots ******/
		/****** md5 signature: 25c6b35a7ba3e1947fc2effe07ca101f ******/
		%feature("compactdefaultargs") IFSelect_SelectModelRoots;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectModelRoot.
") IFSelect_SelectModelRoots;
		 IFSelect_SelectModelRoots();

		/****** IFSelect_SelectModelRoots::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Model Roots'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectModelRoots::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities: the Roots of the Model (note that this result assures naturally uniqueness).
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectModelRoots)

%extend IFSelect_SelectModelRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectPointed *
*******************************/
class IFSelect_SelectPointed : public IFSelect_SelectBase {
	public:
		/****** IFSelect_SelectPointed::IFSelect_SelectPointed ******/
		/****** md5 signature: 64d7c119fc9dcc39806feeee8eb3d7c3 ******/
		%feature("compactdefaultargs") IFSelect_SelectPointed;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectPointed.
") IFSelect_SelectPointed;
		 IFSelect_SelectPointed();

		/****** IFSelect_SelectPointed::Add ******/
		/****** md5 signature: ff0fc108940d9f0bec7b4421016b378d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Adds an item. Returns True if Done, False if <item> is already in the selected list.
") Add;
		Standard_Boolean Add(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SelectPointed::AddList ******/
		/****** md5 signature: a748d60a9253f9c0592c623b56cf1cdb ******/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
bool

Description
-----------
Adds all the items defined in a list. Returns True if at least one item has been added, False else.
") AddList;
		Standard_Boolean AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** IFSelect_SelectPointed::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of selected items Also says the list is unset All Add* methods and SetList say the list is set.
") Clear;
		void Clear();

		/****** IFSelect_SelectPointed::IsSet ******/
		/****** md5 signature: d771f80e63fcb5d314de94e557642c75 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the list has been set. Even if empty.
") IsSet;
		Standard_Boolean IsSet();

		/****** IFSelect_SelectPointed::Item ******/
		/****** md5 signature: 66f7741a43d54c42c064895d26ab5375 ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an item given its rank, or a Null Handle.
") Item;
		opencascade::handle<Standard_Transient> Item(const Standard_Integer num);

		/****** IFSelect_SelectPointed::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text which identifies the type of selection made. It is 'Pointed Entities'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectPointed::NbItems ******/
		/****** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of selected items.
") NbItems;
		Standard_Integer NbItems();

		/****** IFSelect_SelectPointed::Rank ******/
		/****** md5 signature: 74f5dad68e50ae1b6d5b2dedb8c1fa73 ******/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
int

Description
-----------
Returns the rank of an item in the selected list, or 0.
") Rank;
		Standard_Integer Rank(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SelectPointed::Remove ******/
		/****** md5 signature: 68a9816f2be665c51c676934dfa31934 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Removes an item. Returns True if Done, False if <item> was not in the selected list.
") Remove;
		Standard_Boolean Remove(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SelectPointed::RemoveList ******/
		/****** md5 signature: abec2ee71575b393465491aafcc29a21 ******/
		%feature("compactdefaultargs") RemoveList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
bool

Description
-----------
Removes all the items defined in a list. Returns True if at least one item has been removed, False else.
") RemoveList;
		Standard_Boolean RemoveList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** IFSelect_SelectPointed::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected items. Only the selected entities which are present in the graph are given (this result assures uniqueness).
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectPointed::SetEntity ******/
		/****** md5 signature: 8ccec57b402faca060781c71352dc64f ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
None

Description
-----------
As SetList but with only one entity If <ent> is Null, the list is said as being set but is empty.
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SelectPointed::SetList ******/
		/****** md5 signature: 556e1691778026004005c6ae7ac6d2c1 ******/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
None

Description
-----------
Sets a given list to define the list of selected items <list> can be empty or null: in this case, the list is said as being set, but it is empty //! To use it as an alternate input, one shot: - SetList or SetEntity to define the input list - RootResult to get it - then Clear to drop it.
") SetList;
		void SetList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** IFSelect_SelectPointed::Toggle ******/
		/****** md5 signature: 8721ea0a3c73db2983ada68f80f4a3a3 ******/
		%feature("compactdefaultargs") Toggle;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
bool

Description
-----------
Toggles status of an item: adds it if not pointed or removes it if already pointed. Returns the new status (Pointed or not).
") Toggle;
		Standard_Boolean Toggle(const opencascade::handle<Standard_Transient> & item);

		/****** IFSelect_SelectPointed::ToggleList ******/
		/****** md5 signature: 94ba531837906ffc70b865c011fb7e04 ******/
		%feature("compactdefaultargs") ToggleList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
bool

Description
-----------
Toggles status of all the items defined in a list: adds it if not pointed or removes it if already pointed.
") ToggleList;
		Standard_Boolean ToggleList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** IFSelect_SelectPointed::Update ******/
		/****** md5 signature: e0a85344e057ec35d54f5c9d3a503443 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
control: Interface_CopyControl

Return
-------
None

Description
-----------
Rebuilds the selected list. Any selected entity which has a bound result is replaced by this result, else it is removed.
") Update;
		void Update(const opencascade::handle<Interface_CopyControl> & control);

		/****** IFSelect_SelectPointed::Update ******/
		/****** md5 signature: b9b20fdb72cf1e47e9b5e056aa0b7381 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
trf: IFSelect_Transformer

Return
-------
None

Description
-----------
Rebuilds the selected list, by querying a Transformer (same principle as from a CopyControl).
") Update;
		void Update(const opencascade::handle<IFSelect_Transformer> & trf);

};


%make_alias(IFSelect_SelectPointed)

%extend IFSelect_SelectPointed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SelectShared *
******************************/
class IFSelect_SelectShared : public IFSelect_SelectDeduct {
	public:
		/****** IFSelect_SelectShared::IFSelect_SelectShared ******/
		/****** md5 signature: 0686682a91c05726f8fcf07e1db59f5c ******/
		%feature("compactdefaultargs") IFSelect_SelectShared;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectShared;.
") IFSelect_SelectShared;
		 IFSelect_SelectShared();

		/****** IFSelect_SelectShared::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Shared (one level)'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectShared::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities (list of entities shared by those of input list).
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectShared)

%extend IFSelect_SelectShared {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectSharing *
*******************************/
class IFSelect_SelectSharing : public IFSelect_SelectDeduct {
	public:
		/****** IFSelect_SelectSharing::IFSelect_SelectSharing ******/
		/****** md5 signature: 7801f7b59588813aa6109f4a2a526cb9 ******/
		%feature("compactdefaultargs") IFSelect_SelectSharing;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectSharing;.
") IFSelect_SelectSharing;
		 IFSelect_SelectSharing();

		/****** IFSelect_SelectSharing::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Sharing (one level)'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectSharing::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities (list of entities which share (level one) those of input list).
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectSharing)

%extend IFSelect_SelectSharing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_SelectSuite *
*****************************/
class IFSelect_SelectSuite : public IFSelect_SelectDeduct {
	public:
		/****** IFSelect_SelectSuite::IFSelect_SelectSuite ******/
		/****** md5 signature: 1294e9b8120db977a461da13ac47b708 ******/
		%feature("compactdefaultargs") IFSelect_SelectSuite;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty SelectSuite.
") IFSelect_SelectSuite;
		 IFSelect_SelectSuite();

		/****** IFSelect_SelectSuite::AddInput ******/
		/****** md5 signature: 14a27eed39d530b3cad0a04d57057980 ******/
		%feature("compactdefaultargs") AddInput;
		%feature("autodoc", "
Parameters
----------
item: IFSelect_Selection

Return
-------
bool

Description
-----------
Adds an input selection. I.E.: If <item> is a SelectDeduct, adds it as Previous, not as Input Else, sets it as Input Returns True when done Returns False and refuses to work if Input is already defined.
") AddInput;
		Standard_Boolean AddInput(const opencascade::handle<IFSelect_Selection> & item);

		/****** IFSelect_SelectSuite::AddNext ******/
		/****** md5 signature: b4b7b6d9af18a529b9ee68aa5cc3ed3c ******/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "
Parameters
----------
item: IFSelect_SelectDeduct

Return
-------
None

Description
-----------
Adds a new last item (prepends to the list) If <item> is null, does nothing.
") AddNext;
		void AddNext(const opencascade::handle<IFSelect_SelectDeduct> & item);

		/****** IFSelect_SelectSuite::AddPrevious ******/
		/****** md5 signature: 5ae4f29907455e263b8aa521ebc298af ******/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "
Parameters
----------
item: IFSelect_SelectDeduct

Return
-------
None

Description
-----------
Adds a new first item (prepends to the list). The Input is not touched If <item> is null, does nothing.
") AddPrevious;
		void AddPrevious(const opencascade::handle<IFSelect_SelectDeduct> & item);

		/****** IFSelect_SelectSuite::Item ******/
		/****** md5 signature: 0bccbbc944456fe799d469f43de65b45 ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IFSelect_SelectDeduct>

Description
-----------
Returns an item from its rank in the list (the Input is always apart).
") Item;
		opencascade::handle<IFSelect_SelectDeduct> Item(const Standard_Integer num);

		/****** IFSelect_SelectSuite::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the Label Either it has been defined by SetLabel, or it will give 'Suite of nn Selections'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectSuite::NbItems ******/
		/****** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Items.
") NbItems;
		Standard_Integer NbItems();

		/****** IFSelect_SelectSuite::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities To do this, once InputResult has been taken (if Input or Alternate has been defined, else the first Item gives it): this result is set as alternate input for the first item, which computes its result: this result is set as alternate input for the second item, etc...
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectSuite::SetLabel ******/
		/****** md5 signature: 16900850d3343b8f43e74a725689b453 ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
lab: str

Return
-------
None

Description
-----------
Sets a value for the Label.
") SetLabel;
		void SetLabel(Standard_CString lab);

};


%make_alias(IFSelect_SelectSuite)

%extend IFSelect_SelectSuite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_SelectUnion *
*****************************/
class IFSelect_SelectUnion : public IFSelect_SelectCombine {
	public:
		/****** IFSelect_SelectUnion::IFSelect_SelectUnion ******/
		/****** md5 signature: e506b66afeb6623fe87f173d9b07f68b ******/
		%feature("compactdefaultargs") IFSelect_SelectUnion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty SelectUnion.
") IFSelect_SelectUnion;
		 IFSelect_SelectUnion();

		/****** IFSelect_SelectUnion::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Union (OR)'.
") Label;
		TCollection_AsciiString Label();

		/****** IFSelect_SelectUnion::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected Entities, which is the addition result from all input selections. Uniqueness is guaranteed.
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IFSelect_SelectUnion)

%extend IFSelect_SelectUnion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SignAncestor *
******************************/
class IFSelect_SignAncestor : public IFSelect_SignType {
	public:
		/****** IFSelect_SignAncestor::IFSelect_SignAncestor ******/
		/****** md5 signature: b9a0046fdc97a5b66ba4d6c37999aa3f ******/
		%feature("compactdefaultargs") IFSelect_SignAncestor;
		%feature("autodoc", "
Parameters
----------
nopk: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") IFSelect_SignAncestor;
		 IFSelect_SignAncestor(const Standard_Boolean nopk = Standard_False);

		/****** IFSelect_SignAncestor::Matches ******/
		/****** md5 signature: 6cdb41c3b6f4c6d9bbd3a66d390d7419 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: str
exact: bool

Return
-------
bool

Description
-----------
No available documentation.
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, TCollection_AsciiString text, const Standard_Boolean exact);

};


%make_alias(IFSelect_SignAncestor)

%extend IFSelect_SignAncestor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IFSelect_SelectAnyType *
*******************************/
%nodefaultctor IFSelect_SelectAnyType;
class IFSelect_SelectAnyType : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectAnyType::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns True for an Entity (model->Value(num)) which is kind of the chosen type, given by the method TypeForMatch. Criterium is IsKind.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SelectAnyType::TypeForMatch ******/
		/****** md5 signature: c1321bc33df9f17a74f78d6be1bfbc44 ******/
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type which has to be matched for select.
") TypeForMatch;
		virtual opencascade::handle<Standard_Type> TypeForMatch();

};


%make_alias(IFSelect_SelectAnyType)

%extend IFSelect_SelectAnyType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IFSelect_SelectErrorEntities *
*************************************/
class IFSelect_SelectErrorEntities : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectErrorEntities::IFSelect_SelectErrorEntities ******/
		/****** md5 signature: 50ef343f5cf4c2269fe59db9fdc1f150 ******/
		%feature("compactdefaultargs") IFSelect_SelectErrorEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectErrorEntities.
") IFSelect_SelectErrorEntities;
		 IFSelect_SelectErrorEntities();

		/****** IFSelect_SelectErrorEntities::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Error Entities'.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectErrorEntities::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns True for an Entity which is qualified as 'Error', i.e. if <model> explicitly knows <ent> (through its Number) as Erroneous.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SelectErrorEntities)

%extend IFSelect_SelectErrorEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_SelectFlag *
****************************/
class IFSelect_SelectFlag : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectFlag::IFSelect_SelectFlag ******/
		/****** md5 signature: b126e5f9a0c528bcc2370837bc7e0a4c ******/
		%feature("compactdefaultargs") IFSelect_SelectFlag;
		%feature("autodoc", "
Parameters
----------
flagname: str

Return
-------
None

Description
-----------
Creates a Select Flag, to query a flag designated by its name.
") IFSelect_SelectFlag;
		 IFSelect_SelectFlag(Standard_CString flagname);

		/****** IFSelect_SelectFlag::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium, includes the flag name.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectFlag::FlagName ******/
		/****** md5 signature: e9b9cfad020f8be9b237b32c5c534195 ******/
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the flag.
") FlagName;
		Standard_CString FlagName();

		/****** IFSelect_SelectFlag::RootResult ******/
		/****** md5 signature: 06f84f6b90b9fc5b3d5fc4b15404fb86 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities. It is redefined to work on the graph itself (not queried by sort) //! An entity is selected if its flag is True on Direct mode, False on Reversed mode //! If flag does not exist for the given name, returns an empty result, whatever the Direct/Reversed sense.
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectFlag::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns always False because RootResult has done the work.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SelectFlag)

%extend IFSelect_SelectFlag {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_SelectInList *
******************************/
%nodefaultctor IFSelect_SelectInList;
class IFSelect_SelectInList : public IFSelect_SelectAnyList {
	public:
		/****** IFSelect_SelectInList::FillResult ******/
		/****** md5 signature: e5527da2a86d9cf2e2966fd3b79d23e5 ******/
		%feature("compactdefaultargs") FillResult;
		%feature("autodoc", "
Parameters
----------
n1: int
n2: int
ent: Standard_Transient
result: Interface_EntityIterator

Return
-------
None

Description
-----------
Puts into the result, the sub-entities of the list, from n1 to n2 included. Remark that adequation with Entity's type and length of list has already been made at this stage Called by RootResult; calls ListedEntity (see below).
") FillResult;
		void FillResult(const Standard_Integer n1, const Standard_Integer n2, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & result);

		/****** IFSelect_SelectInList::ListedEntity ******/
		/****** md5 signature: 865dc656560a2a4809fb73bc8f1c9e0c ******/
		%feature("compactdefaultargs") ListedEntity;
		%feature("autodoc", "
Parameters
----------
num: int
ent: Standard_Transient

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an Entity, given its rank in the list.
") ListedEntity;
		virtual opencascade::handle<Standard_Transient> ListedEntity(const Standard_Integer num, const opencascade::handle<Standard_Transient> & ent);

};


%make_alias(IFSelect_SelectInList)

%extend IFSelect_SelectInList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_SelectRange *
*****************************/
class IFSelect_SelectRange : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectRange::IFSelect_SelectRange ******/
		/****** md5 signature: 46d0ee53a7c66942e8637ddb7b31c349 ******/
		%feature("compactdefaultargs") IFSelect_SelectRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectRange. Default is Take all the input list.
") IFSelect_SelectRange;
		 IFSelect_SelectRange();

		/****** IFSelect_SelectRange::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: following cases, ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..'.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectRange::HasLower ******/
		/****** md5 signature: fed85e72f70b42adca46c7b901badc46 ******/
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Lower limit is defined.
") HasLower;
		Standard_Boolean HasLower();

		/****** IFSelect_SelectRange::HasUpper ******/
		/****** md5 signature: d70f1e270858eac8843f77542c8137ff ******/
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Lower limit is defined.
") HasUpper;
		Standard_Boolean HasUpper();

		/****** IFSelect_SelectRange::Lower ******/
		/****** md5 signature: b8e70b42a5787ced8e76ff8aea48c3a4 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns Lower limit (if there is; else, value is senseless).
") Lower;
		opencascade::handle<IFSelect_IntParam> Lower();

		/****** IFSelect_SelectRange::LowerValue ******/
		/****** md5 signature: 02a3a48796ebc55a19b891812ce46acd ******/
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value of Lower Limit (0 if none is defined).
") LowerValue;
		Standard_Integer LowerValue();

		/****** IFSelect_SelectRange::SetFrom ******/
		/****** md5 signature: 05cb4dd02524b771922c7da233564821 ******/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "
Parameters
----------
rankfrom: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a Lower limit but no upper limit.
") SetFrom;
		void SetFrom(const opencascade::handle<IFSelect_IntParam> & rankfrom);

		/****** IFSelect_SelectRange::SetOne ******/
		/****** md5 signature: 580d64eef8842101e558afd4d9668eec ******/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "
Parameters
----------
rank: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a unique number (only one Entity will be sorted as True).
") SetOne;
		void SetOne(const opencascade::handle<IFSelect_IntParam> & rank);

		/****** IFSelect_SelectRange::SetRange ******/
		/****** md5 signature: 2a1fca72607ec3d047d6765968c197ab ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
rankfrom: IFSelect_IntParam
rankto: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets a Range for numbers, with a lower and a upper limits Error if rankto is lower then rankfrom.
") SetRange;
		void SetRange(const opencascade::handle<IFSelect_IntParam> & rankfrom, const opencascade::handle<IFSelect_IntParam> & rankto);

		/****** IFSelect_SelectRange::SetUntil ******/
		/****** md5 signature: c2b636ba99c7210e7256d0dc69a8d6ee ******/
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "
Parameters
----------
rankto: IFSelect_IntParam

Return
-------
None

Description
-----------
Sets an Upper limit but no lower limit (equivalent to lower 1).
") SetUntil;
		void SetUntil(const opencascade::handle<IFSelect_IntParam> & rankto);

		/****** IFSelect_SelectRange::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns True for an Entity of which occurrence number in the iteration is inside the selected Range (considers <rank>).
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SelectRange::Upper ******/
		/****** md5 signature: 95ed998f50d75ea326bf46efbee3cc71 ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_IntParam>

Description
-----------
Returns Upper limit (if there is; else, value is senseless).
") Upper;
		opencascade::handle<IFSelect_IntParam> Upper();

		/****** IFSelect_SelectRange::UpperValue ******/
		/****** md5 signature: bfeb4eb1504ceefb62ee59ee5fd7e8b8 ******/
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value of Upper Limit (0 if none is defined).
") UpperValue;
		Standard_Integer UpperValue();

};


%make_alias(IFSelect_SelectRange)

%extend IFSelect_SelectRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IFSelect_SelectRootComps *
*********************************/
class IFSelect_SelectRootComps : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectRootComps::IFSelect_SelectRootComps ******/
		/****** md5 signature: cd307aa6dd15190f479e44013ea8a856 ******/
		%feature("compactdefaultargs") IFSelect_SelectRootComps;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectRootComps.
") IFSelect_SelectRootComps;
		 IFSelect_SelectRootComps();

		/****** IFSelect_SelectRootComps::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Local Root Components'.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectRootComps::RootResult ******/
		/****** md5 signature: 06f84f6b90b9fc5b3d5fc4b15404fb86 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of local root strong components, by one Entity per component. It is redefined for a purpose of efficiency: calling a Sort routine for each Entity would cost more resources than to work in once using a Map RootResult takes in account the Direct status.
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectRootComps::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns always True, because RootResult has done work.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SelectRootComps)

%extend IFSelect_SelectRootComps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IFSelect_SelectRoots *
*****************************/
class IFSelect_SelectRoots : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectRoots::IFSelect_SelectRoots ******/
		/****** md5 signature: fb9fff706a0289787ad21ec3be93c216 ******/
		%feature("compactdefaultargs") IFSelect_SelectRoots;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectRoots.
") IFSelect_SelectRoots;
		 IFSelect_SelectRoots();

		/****** IFSelect_SelectRoots::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Local Root Entities'.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectRoots::RootResult ******/
		/****** md5 signature: 06f84f6b90b9fc5b3d5fc4b15404fb86 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of local roots. It is redefined for a purpose of efficiency: calling a Sort routine for each Entity would cost more resources than to work in once using a Map RootResult takes in account the Direct status.
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectRoots::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns always True, because RootResult has done work.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SelectRoots)

%extend IFSelect_SelectRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_SelectSent *
****************************/
class IFSelect_SelectSent : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectSent::IFSelect_SelectSent ******/
		/****** md5 signature: b86d5743b0517a3f6670d90b3e38dcce ******/
		%feature("compactdefaultargs") IFSelect_SelectSent;
		%feature("autodoc", "
Parameters
----------
sentcount: int (optional, default to 1)
atleast: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a SelectSent: sentcount = 0 -> remaining (non-sent) entities sentcount = 1, atleast = True (D) -> sent (at least once) sentcount = 2, atleast = True -> duplicated (sent least twice) etc... sentcount = 1, atleast = False -> sent just once (non-dupl.d) sentcount = 2, atleast = False -> sent just twice etc...
") IFSelect_SelectSent;
		 IFSelect_SelectSent(const Standard_Integer sentcount = 1, const Standard_Boolean atleast = Standard_True);

		/****** IFSelect_SelectSent::AtLeast ******/
		/****** md5 signature: 8b0d752710d18485146955b90dc3a75d ******/
		%feature("compactdefaultargs") AtLeast;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the <atleast> status, True for sending at least the sending count, False for sending exactly the sending count Remark: if SentCount is 0, AtLeast is ignored.
") AtLeast;
		Standard_Boolean AtLeast();

		/****** IFSelect_SelectSent::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: query: SentCount = 0 -> 'Remaining (non-sent) entities' SentCount = 1, AtLeast = True -> 'Sent entities' SentCount = 1, AtLeast = False -> 'Sent once (no duplicated)' SentCount = 2, AtLeast = True -> 'Sent several times entities' SentCount = 2, AtLeast = False -> 'Sent twice entities' SentCount > 2, AtLeast = True -> 'Sent at least <count> times entities' SentCount > 2, AtLeast = False -> 'Sent <count> times entities'.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectSent::RootResult ******/
		/****** md5 signature: 06f84f6b90b9fc5b3d5fc4b15404fb86 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of selected entities. It is redefined to work on the graph itself (not queried by sort) //! An entity is selected if its count complies to the query in Direct Mode, rejected in Reversed Mode //! Query works on the sending count recorded as status in Graph.
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****** IFSelect_SelectSent::SentCount ******/
		/****** md5 signature: 142890545509570f962393f4193bd3b3 ******/
		%feature("compactdefaultargs") SentCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the queried count of sending.
") SentCount;
		Standard_Integer SentCount();

		/****** IFSelect_SelectSent::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns always False because RootResult has done the work.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SelectSent)

%extend IFSelect_SelectSent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IFSelect_SelectSignature *
*********************************/
class IFSelect_SelectSignature : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectSignature::IFSelect_SelectSignature ******/
		/****** md5 signature: 06c8d4879441f5001948c8adbf7ae06f ******/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "
Parameters
----------
matcher: IFSelect_Signature
signtext: str
exact: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a SelectSignature with its Signature and its Text to Match. <exact> if True requires exact match, if False requires <signtext> to be contained in the Signature of the entity (default is 'exact').
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature(const opencascade::handle<IFSelect_Signature> & matcher, Standard_CString signtext, const Standard_Boolean exact = Standard_True);

		/****** IFSelect_SelectSignature::IFSelect_SelectSignature ******/
		/****** md5 signature: f0f816e1d36acf4abc69d940efcff930 ******/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "
Parameters
----------
matcher: IFSelect_Signature
signtext: str
exact: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
As above with an AsciiString.
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature(const opencascade::handle<IFSelect_Signature> & matcher, TCollection_AsciiString signtext, const Standard_Boolean exact = Standard_True);

		/****** IFSelect_SelectSignature::IFSelect_SelectSignature ******/
		/****** md5 signature: 2d5482446f425374777509a08ad2da25 ******/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "
Parameters
----------
matcher: IFSelect_SignCounter
signtext: str
exact: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a SelectSignature with a Counter, more precisely a SelectSignature. Which is used here to just give a Signature Value (by SignOnly Mode) Matching is the default provided by the class Signature.
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature(const opencascade::handle<IFSelect_SignCounter> & matcher, Standard_CString signtext, const Standard_Boolean exact = Standard_True);

		/****** IFSelect_SelectSignature::Counter ******/
		/****** md5 signature: 863d5febc23db3b01c693ba5cbe7a5ab ******/
		%feature("compactdefaultargs") Counter;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SignCounter>

Description
-----------
Returns the used SignCounter. Can be used as alternative for Signature.
") Counter;
		opencascade::handle<IFSelect_SignCounter> Counter();

		/****** IFSelect_SelectSignature::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature).
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectSignature::IsExact ******/
		/****** md5 signature: e3074f243878c1aad335a0483fed22b5 ******/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if match must be exact.
") IsExact;
		Standard_Boolean IsExact();

		/****** IFSelect_SelectSignature::Signature ******/
		/****** md5 signature: 6971baf30f0d8a413d639c156d76dfc1 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Signature>

Description
-----------
Returns the used Signature, then it is possible to access it, modify it as required. Can be null, hence see Counter.
") Signature;
		opencascade::handle<IFSelect_Signature> Signature();

		/****** IFSelect_SelectSignature::SignatureText ******/
		/****** md5 signature: 735b1192a9e9f73fe8fca4fcf887bd17 ******/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns Text used to Sort Entity on its Signature or SignCounter.
") SignatureText;
		const TCollection_AsciiString & SignatureText();

		/****** IFSelect_SelectSignature::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Not called, defined only to remove a deferred method here.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IFSelect_SelectSignature::SortInGraph ******/
		/****** md5 signature: 22baa547cd2c588d8d10eb6c3e1cd4dd ******/
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
G: Interface_Graph

Return
-------
bool

Description
-----------
Returns True for an Entity (model->Value(num)) of which the signature matches the text given as creation time May also work with a Counter from the Graph.
") SortInGraph;
		virtual Standard_Boolean SortInGraph(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G);

};


%make_alias(IFSelect_SelectSignature)

%extend IFSelect_SelectSignature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IFSelect_SelectSignedShared *
************************************/
class IFSelect_SelectSignedShared : public IFSelect_SelectExplore {
	public:
		/****** IFSelect_SelectSignedShared::IFSelect_SelectSignedShared ******/
		/****** md5 signature: 6894f56fa16bd7b933451fd3318aa5b4 ******/
		%feature("compactdefaultargs") IFSelect_SelectSignedShared;
		%feature("autodoc", "
Parameters
----------
matcher: IFSelect_Signature
signtext: str
exact: bool (optional, default to Standard_True)
level: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a SelectSignedShared, defaulted for any level with a given Signature and text to match.
") IFSelect_SelectSignedShared;
		 IFSelect_SelectSignedShared(const opencascade::handle<IFSelect_Signature> & matcher, Standard_CString signtext, const Standard_Boolean exact = Standard_True, const Standard_Integer level = 0);

		/****** IFSelect_SelectSignedShared::Explore ******/
		/****** md5 signature: 50c4444632fd853033919d1a382f1178 ******/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "
Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Return
-------
bool

Description
-----------
Explores an entity: its Shared entities <ent> to take if it matches the Signature At level max, filters the result. Else gives all Shareds.
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** IFSelect_SelectSignedShared::ExploreLabel ******/
		/****** md5 signature: 6716492c1a431b7aec766a1b00353622 ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature).
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****** IFSelect_SelectSignedShared::IsExact ******/
		/****** md5 signature: e3074f243878c1aad335a0483fed22b5 ******/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if match must be exact.
") IsExact;
		Standard_Boolean IsExact();

		/****** IFSelect_SelectSignedShared::Signature ******/
		/****** md5 signature: 6971baf30f0d8a413d639c156d76dfc1 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Signature>

Description
-----------
Returns the used Signature, then it is possible to access it, modify it as required.
") Signature;
		opencascade::handle<IFSelect_Signature> Signature();

		/****** IFSelect_SelectSignedShared::SignatureText ******/
		/****** md5 signature: 735b1192a9e9f73fe8fca4fcf887bd17 ******/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns Text used to Sort Entity on its Signature.
") SignatureText;
		const TCollection_AsciiString & SignatureText();

};


%make_alias(IFSelect_SelectSignedShared)

%extend IFSelect_SelectSignedShared {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IFSelect_SelectSignedSharing *
*************************************/
class IFSelect_SelectSignedSharing : public IFSelect_SelectExplore {
	public:
		/****** IFSelect_SelectSignedSharing::IFSelect_SelectSignedSharing ******/
		/****** md5 signature: e1086f5665e398bffb4a1b904e16051d ******/
		%feature("compactdefaultargs") IFSelect_SelectSignedSharing;
		%feature("autodoc", "
Parameters
----------
matcher: IFSelect_Signature
signtext: str
exact: bool (optional, default to Standard_True)
level: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a SelectSignedSharing, defaulted for any level with a given Signature and text to match.
") IFSelect_SelectSignedSharing;
		 IFSelect_SelectSignedSharing(const opencascade::handle<IFSelect_Signature> & matcher, Standard_CString signtext, const Standard_Boolean exact = Standard_True, const Standard_Integer level = 0);

		/****** IFSelect_SelectSignedSharing::Explore ******/
		/****** md5 signature: 50c4444632fd853033919d1a382f1178 ******/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "
Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Return
-------
bool

Description
-----------
Explores an entity: its sharing entities <ent> to take if it matches the Signature At level max, filters the result. Else gives all sharings.
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** IFSelect_SelectSignedSharing::ExploreLabel ******/
		/****** md5 signature: 6716492c1a431b7aec766a1b00353622 ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature).
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****** IFSelect_SelectSignedSharing::IsExact ******/
		/****** md5 signature: e3074f243878c1aad335a0483fed22b5 ******/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if match must be exact.
") IsExact;
		Standard_Boolean IsExact();

		/****** IFSelect_SelectSignedSharing::Signature ******/
		/****** md5 signature: 6971baf30f0d8a413d639c156d76dfc1 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Signature>

Description
-----------
Returns the used Signature, then it is possible to access it, modify it as required.
") Signature;
		opencascade::handle<IFSelect_Signature> Signature();

		/****** IFSelect_SelectSignedSharing::SignatureText ******/
		/****** md5 signature: 735b1192a9e9f73fe8fca4fcf887bd17 ******/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns Text used to Sort Entity on its Signature.
") SignatureText;
		const TCollection_AsciiString & SignatureText();

};


%make_alias(IFSelect_SelectSignedSharing)

%extend IFSelect_SelectSignedSharing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IFSelect_SelectUnknownEntities *
***************************************/
class IFSelect_SelectUnknownEntities : public IFSelect_SelectExtract {
	public:
		/****** IFSelect_SelectUnknownEntities::IFSelect_SelectUnknownEntities ******/
		/****** md5 signature: b2fb08714ad59d77733799409211692f ******/
		%feature("compactdefaultargs") IFSelect_SelectUnknownEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectUnknownEntities.
") IFSelect_SelectUnknownEntities;
		 IFSelect_SelectUnknownEntities();

		/****** IFSelect_SelectUnknownEntities::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Recognized Entities'.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectUnknownEntities::Sort ******/
		/****** md5 signature: 88b4690c932193f08237f487d1cf387b ******/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "
Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns True for an Entity which is qualified as 'Unknown', i.e. if <model> known <ent> (through its Number) as Unknown.
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IFSelect_SelectUnknownEntities)

%extend IFSelect_SelectUnknownEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IFSelect_SelectIncorrectEntities *
*****************************************/
class IFSelect_SelectIncorrectEntities : public IFSelect_SelectFlag {
	public:
		/****** IFSelect_SelectIncorrectEntities::IFSelect_SelectIncorrectEntities ******/
		/****** md5 signature: 37c356e126a460f204f8b06ab8505076 ******/
		%feature("compactdefaultargs") IFSelect_SelectIncorrectEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectIncorrectEntities i.e. a SelectFlag('Incorrect').
") IFSelect_SelectIncorrectEntities;
		 IFSelect_SelectIncorrectEntities();

};


%make_alias(IFSelect_SelectIncorrectEntities)

%extend IFSelect_SelectIncorrectEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_SelectType *
****************************/
class IFSelect_SelectType : public IFSelect_SelectAnyType {
	public:
		/****** IFSelect_SelectType::IFSelect_SelectType ******/
		/****** md5 signature: aa7cb7fac6d7cb5af10676f3605dcea1 ******/
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a SelectType. Default is no filter.
") IFSelect_SelectType;
		 IFSelect_SelectType();

		/****** IFSelect_SelectType::IFSelect_SelectType ******/
		/****** md5 signature: 71ac50c71db5492fdb001eb384c51a9a ******/
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
None

Description
-----------
Creates a SelectType for a given Type.
") IFSelect_SelectType;
		 IFSelect_SelectType(const opencascade::handle<Standard_Type> & atype);

		/****** IFSelect_SelectType::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium. (should by gotten from Type of Entity used for instantiation).
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** IFSelect_SelectType::SetType ******/
		/****** md5 signature: a055014cd5b5c6a10713677ab0eb36a8 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
None

Description
-----------
Sets a TYpe for filter.
") SetType;
		void SetType(const opencascade::handle<Standard_Type> & atype);

		/****** IFSelect_SelectType::TypeForMatch ******/
		/****** md5 signature: 2eae14e421973a399b61842a002e7d81 ******/
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type to be matched for select: this is the type given at instantiation time.
") TypeForMatch;
		opencascade::handle<Standard_Type> TypeForMatch();

};


%make_alias(IFSelect_SelectType)

%extend IFSelect_SelectType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class IFSelect_HSeqOfSelection : public IFSelect_TSeqOfSelection, public Standard_Transient {
  public:
    IFSelect_HSeqOfSelection();
    IFSelect_HSeqOfSelection(const IFSelect_TSeqOfSelection& theOther);
    const IFSelect_TSeqOfSelection& Sequence();
    void Append (const IFSelect_TSeqOfSelection::value_type& theItem);
    void Append (IFSelect_TSeqOfSelection& theSequence);
    IFSelect_TSeqOfSelection& ChangeSequence();
};
%make_alias(IFSelect_HSeqOfSelection)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def ifselect_RestoreSession(*args):
	return ifselect.RestoreSession(*args)

@deprecated
def ifselect_SaveSession(*args):
	return ifselect.SaveSession(*args)

@deprecated
def IFSelect_Activator_Adding(*args):
	return IFSelect_Activator.Adding(*args)

@deprecated
def IFSelect_Activator_Commands(*args):
	return IFSelect_Activator.Commands(*args)

@deprecated
def IFSelect_Activator_Mode(*args):
	return IFSelect_Activator.Mode(*args)

@deprecated
def IFSelect_Activator_Remove(*args):
	return IFSelect_Activator.Remove(*args)

@deprecated
def IFSelect_Activator_Select(*args):
	return IFSelect_Activator.Select(*args)

@deprecated
def IFSelect_Functions_GiveDispatch(*args):
	return IFSelect_Functions.GiveDispatch(*args)

@deprecated
def IFSelect_Functions_GiveEntity(*args):
	return IFSelect_Functions.GiveEntity(*args)

@deprecated
def IFSelect_Functions_GiveEntityNumber(*args):
	return IFSelect_Functions.GiveEntityNumber(*args)

@deprecated
def IFSelect_Functions_GiveList(*args):
	return IFSelect_Functions.GiveList(*args)

@deprecated
def IFSelect_Functions_Init(*args):
	return IFSelect_Functions.Init(*args)

@deprecated
def IFSelect_SessionDumper_First(*args):
	return IFSelect_SessionDumper.First(*args)

@deprecated
def IFSelect_Signature_IntValue(*args):
	return IFSelect_Signature.IntValue(*args)

@deprecated
def IFSelect_Signature_MatchValue(*args):
	return IFSelect_Signature.MatchValue(*args)

@deprecated
def IFSelect_Act_AddFSet(*args):
	return IFSelect_Act.AddFSet(*args)

@deprecated
def IFSelect_Act_AddFunc(*args):
	return IFSelect_Act.AddFunc(*args)

@deprecated
def IFSelect_Act_SetGroup(*args):
	return IFSelect_Act.SetGroup(*args)

@deprecated
def IFSelect_ParamEditor_StaticEditor(*args):
	return IFSelect_ParamEditor.StaticEditor(*args)

@deprecated
def IFSelect_SignValidity_CVal(*args):
	return IFSelect_SignValidity.CVal(*args)

}
